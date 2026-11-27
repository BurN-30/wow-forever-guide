"""Bench scenarios of this pack on Polestar's own route (0.13.0): its chapters offered at the right
moment, one offer per dungeon, Polestar's French completed, characters moving over from this pack's
own route of 0.12.x, this pack's notes in "What's new".

  python tools/check-greffe.py --ui <wow-ui-source> --strings <GlobalStrings folder>
                               [--report <file.md>] [--only <keys>] [--bascule <dist folder>]

Built on tools/check-pack.py (the whole addons/ folder loaded in one Lua 5.1 state, a fake game),
with a fake quest log: quests handed in (C_QuestLog.IsQuestFlaggedCompleted), quests in the log with
their objectives done, the player's level, a clock the scenario moves. Each scenario is its own run
(saved variables set before the addons load, as the game reads them from WTF). French client unless
said otherwise. The pack is the one built in addons/ (run tools/build.py first); --bascule loads the
pack of another dist folder instead (a copy of pack/ compiled by forge), to try a change.

Scenarios: the first ones (1 to 9) walk the Deadmines chapter through every answer; then one per
chapter (C: its hook on Polestar's route, the card, the chapter in its own tab, its hand-ins, back to
the route), the cases the chapters' authors asked for (meeting point ended by its ticked line, the
Ruins' tab left open, Stockade and Gnomeregan due together, Dalaran's two hooks, optional hand-ins,
Monastery before Razorfen Downs, Razorfen Downs before Uldaman, the end-of-route dungeons), "never
worse than Polestar alone" (P: the level each dungeon's own card would come at on the route, ours no
later; a hook gone past; a chapter outlevelled), the migration of characters of 0.12.x (D, histories
in tools/check-greffe-historique.json), the notes (E) and, since 0.14.1, this module's lines in the
tooltip of a guide line hovered through Polestar's own code, an item line and another (T).

What it proves: what Polestar's engine and this pack's module do with these quest states, saved
tabs and answers, in Polestar's own Lua. What it cannot: the game's quest log and events in their
real order and timing, the server (a quest a giver refuses, a level), the window drawn on screen,
a party (two clients), a real WTF folder. The report says, scenario by scenario, what was checked.
"""
import argparse, importlib.util, json, pathlib, re, sys

REPO = pathlib.Path(__file__).resolve().parent.parent
spec = importlib.util.spec_from_file_location("checkpack", REPO / "tools" / "check-pack.py")
cp = importlib.util.module_from_spec(spec)
spec.loader.exec_module(cp)

# ---------------------------------------------------------------------------------------------
# The fake quest log, set before the addons load. GREFFE.done mirrors BENCH.completed.
# ---------------------------------------------------------------------------------------------
PRELUDE = r'''
GREFFE = { level = 20, log = {}, now = 1000, notReady = {} }
GetTime = function() return GREFFE.now end
GetTimePreciseSec = GetTime
UnitLevel = function(u) if u == nil or u == "player" then return GREFFE.level end return 1 end
local QL = C_QuestLog
local function idx(q) for i, x in ipairs(GREFFE.log) do if x == q then return i end end return nil end
QL.IsOnQuest = function(q) return idx(q) ~= nil end
QL.GetNumQuestLogEntries = function() return #GREFFE.log, #GREFFE.log end
QL.GetInfo = function(i) local q = GREFFE.log[i] if not q then return nil end
	return { questID = q, title = "Quest " .. q, isHeader = false, isHidden = false, level = GREFFE.level, frequency = 0 } end
QL.GetLogIndexForQuestID = function(q) return idx(q) end
QL.GetQuestObjectives = function(q)
	if not idx(q) then return {} end
	local out = {}
	local done = not GREFFE.notReady[q]
	for i = 1, 4 do out[i] = { text = "Objective " .. i .. (done and ": 1/1" or ": 0/1"), type = "monster", finished = done, numFulfilled = done and 1 or 0, numRequired = 1 } end
	return out
end
-- A quest in the log is ready to hand in, unless the scenario says it is not (GREFFE.notReady: the
-- group could not finish it).
QL.ReadyForTurnIn = function(q) return idx(q) ~= nil and not GREFFE.notReady[q] end
QL.IsComplete = function(q) return idx(q) ~= nil and not GREFFE.notReady[q] end
QL.IsFailed = function() return false end
QL.GetTitleForQuestID = function(q) return nil end
QL.GetAllCompletedQuestIDs = function() local t = {} for q in pairs(BENCH.completed) do t[#t + 1] = q end return t end
QL.IsQuestFlaggedCompleted = function(q) return BENCH.completed[q] == true end
GetQuestsCompleted = function() local t = {} for q in pairs(BENCH.completed) do t[q] = true end return t end
-- The fake game's scroll frames have no scroll offset (Polestar's W.Scroll reads it on every layout).
do
	local mt = getmetatable(CreateFrame("ScrollFrame"))
	local index = mt.__index
	local STUB = { GetVerticalScroll = function() return 0 end, GetHorizontalScroll = function() return 0 end,
		GetVerticalScrollRange = function() return 0 end, SetVerticalScroll = function() end }
	mt.__index = function(t, k) return STUB[k] or index(t, k) end
end
'''

# Helpers run in the Lua state once the addons are loaded (G.*).
LIB = r'''
G = G or {}
function G.init(ns) G.ns = ns end
function G.tick(rounds)
	for _ = 1, rounds or 4 do
		GREFFE.now = GREFFE.now + 3
		BENCH.RunTimers(1)
	end
end
function G.addLog(q) for _, x in ipairs(GREFFE.log) do if x == q then return end end GREFFE.log[#GREFFE.log + 1] = q end
function G.dropLog(q) for i, x in ipairs(GREFFE.log) do if x == q then table.remove(GREFFE.log, i) return end end end
-- Quests handed in and taken by a guide's steps before `upto` (its first step that hands in `q`, or
-- takes it when kind is "accept"); the quest goes into the log (a hand-in) or stays out (a take).
function G.walk(guideId, turnin, kind)
	kind = kind or "turnin"
	local g = G.ns.Guides.Get(guideId)
	if not g then return nil, "no guide " .. guideId end
	local upto
	for s, step in ipairs(g.steps) do
		for _, goal in ipairs(step.goals) do
			if goal.t == kind and goal.quest == turnin and not upto then
				local dungeon = false
				for _, p in ipairs(step.when or {}) do if p.k == "dungeon" and not p.neg then dungeon = true end end
				if not dungeon then upto = s end
			end
		end
	end
	if not upto then return nil, "no " .. kind .. " " .. turnin end
	for s = 1, upto - 1 do
		local skip = false
		for _, p in ipairs(g.steps[s].when or {}) do if p.k == "dungeon" and not p.neg then skip = true end end
		if not skip then
			for _, goal in ipairs(g.steps[s].goals) do
				local q = goal.quest
				if goal.t == "accept" and q and not BENCH.completed[q] then G.addLog(q) end
				if goal.t == "turnin" and q then G.dropLog(q) BENCH.completed[q] = true end
			end
		end
	end
	if kind == "turnin" then G.addLog(turnin) end
	return upto
end
-- A chapter's end (GA.ChapterFin: its hand-ins without a condition, GreffeData.lua's `fin`), each
-- taken if needed and handed in, as the player would. -> how many
function G.finish(id)
	local n = 0
	for _, q in ipairs(G.ns.GA.ChapterFin(id)) do
		if not BENCH.completed[q] then
			local inlog = false
			for _, x in ipairs(GREFFE.log) do if x == q then inlog = true end end
			if not inlog then G.accept(q) end
			G.turnin(q)
			n = n + 1
		end
	end
	G.tick(6)
	return n
end
-- The rest of the route's live step, as the player does it at the stop: its quests taken, those
-- in the log handed in, its other errands (a flight path, the hearthstone, a purchase) ticked as the
-- player's own tick; its travel (the flight out, a walk) left. -> how many quests
local TRAVEL = { fly = true, ["goto"] = true, enter = true, hearth = true, vendor = true, note = true }
function G.finishStop()
	local E = G.ns.Engine
	local g, i = E.GetGuide(), E.GetLiveStep()
	if not (g and i and g.steps[i]) then return 0 end
	local n = 0
	for _, goal in ipairs(g.steps[i].goals) do
		local q = goal.quest
		if goal.t == "accept" and q and not goal.optional and not BENCH.completed[q] then
			local inlog = false
			for _, x in ipairs(GREFFE.log) do if x == q then inlog = true end end
			if not inlog then G.accept(q) n = n + 1 end
		elseif goal.t == "turnin" and q and not BENCH.completed[q] then
			for _, x in ipairs(GREFFE.log) do if x == q then G.turnin(q) n = n + 1 break end end
		end
	end
	if E.GetGuide() == g and E.GetLiveStep() == i then
		for j, goal in ipairs(g.steps[i].goals) do
			if not TRAVEL[goal.t] and not goal.optional and E.Applies(i, j) and not E.GoalDone(i, j) then E.ToggleGoal(i, j) end
		end
	end
	G.tick(2)
	return n
end
-- The live step's title and index in the active tab.
function G.live()
	local E = G.ns.Engine
	local g, i = E.GetGuide(), E.GetLiveStep()
	return i, G.title(g, i)
end
-- Whether Polestar's own heads-up (its candidates as DT.Check sees them, at `level`) still names
-- dungeon `key`, and whether its rule opens it at all ("any", the released function).
function G.polestarCard(key, level)
	local DT = G.ns.UI.DungeonToast
	local held, opened = false, false
	for _, c in ipairs(DT.Candidates(level, "levelup")) do if c.key == key then held = true end end
	local released = G.ns.GA.PolestarCandidates or DT.Candidates
	for _, c in ipairs(released(level, "any")) do if c.key == key then opened = true end end
	return held, opened
end
function G.entry(key)
	for _, h in ipairs(G.ns.GA.GREFFE) do if h.key == key then return h end end
	return nil
end
function G.turnin(q)
	G.dropLog(q)
	BENCH.completed[q] = true
	BENCH.Fire("QUEST_TURNED_IN", q, 1000, 0)
	BENCH.Fire("QUEST_REMOVED", q)
	BENCH.Fire("QUEST_LOG_UPDATE")
	G.tick()
end
function G.accept(q)
	G.addLog(q)
	BENCH.Fire("QUEST_ACCEPTED", q)
	BENCH.Fire("QUEST_LOG_UPDATE")
	G.tick()
end
function G.levelUp(l)
	GREFFE.level = l
	BENCH.Fire("PLAYER_LEVEL_UP", l)
	G.tick()
end
function G.title(g, i)
	local s = g and i and g.steps[i]
	return s and tostring(s.title) or "-"
end
-- The tabs as text: "1 guide (step 12/130) *" (* the active one), and the live step's title.
function G.tabs()
	local E = G.ns.Engine
	local list, active = E.GetTabs()
	local out = {}
	for i, t in ipairs(list) do
		out[#out + 1] = ("%d %s (étape %s/%s)%s"):format(i, t.guideId, tostring(t.stepIndex), tostring(t.stepCount), i == active and " *" or "")
	end
	return table.concat(out, " ; ")
end
function G.tabStep(id)
	for _, t in ipairs(G.ns.Engine.GetTabs()) do if t.guideId == id then return t.stepIndex end end
	return nil
end
function G.active()
	local g = G.ns.Engine.GetGuide()
	return g and g.id or "-", G.ns.Engine.GetStepIndex(), G.title(g, G.ns.Engine.GetStepIndex())
end
-- The heads-up card: whose model is on it ("greffe:<key>", "dungeon:<key>", "other", "none").
function G.card()
	local CT = G.ns.UI and G.ns.UI.ClassToast
	local m = CT and CT.current
	if not m then return "none" end
	if m.greffe then return "greffe:" .. m.greffe .. " | " .. tostring(m.title) .. " | " .. tostring(m.act and m.act.label) .. " / " .. tostring(m.later and m.later.label) .. " / " .. tostring(m.off and m.off.label) end
	if m.dungeon then return "dungeon:" .. tostring(m.dungeon) end
	return "other:" .. tostring(m.title)
end
-- Another heads-up on the card (a class quest, Polestar's dungeon card): dismissed, as a player would.
function G.clearOther()
	local CT = G.ns.UI.ClassToast
	local n = 0
	while CT.current and not CT.current.greffe and n < 5 do
		n = n + 1
		G.dismissed = (G.dismissed or "") .. " " .. (CT.current.dungeon and ("dungeon:" .. CT.current.dungeon) or ("other:" .. tostring(CT.current.title)))
		CT.Later()
		G.tick(2)
	end
end
function G.answers()
	local s = G.ns.GA.GreffeState()
	local out = {}
	for k, a in pairs(s.answers) do out[#out + 1] = k .. "=" .. tostring(a.a) .. (a.level and ("@" .. a.level) or "") end
	for k, v in pairs(s.from) do out[#out + 1] = "from[" .. k .. "]=" .. tostring(v) end
	table.sort(out)
	return table.concat(out, ", ")
end
function G.printed(from)
	local out = {}
	for i = (from or 1), #BENCH.printed do out[#out + 1] = tostring(BENCH.printed[i][2]) end
	return out
end
'''


class Report:
    def __init__(self):
        self.lines, self.bad = [], 0

    def h(self, text):
        self.lines += ["", text, ""]

    def say(self, text):
        self.lines.append(text)

    def check(self, ok, text):
        self.lines.append(f"- {'OK' if ok else '**ÉCHEC**'} : {text}")
        if not ok:
            self.bad += 1


def lua_table(L, value):
    """A Python dict / list as a Lua table (nested)."""
    if isinstance(value, dict):
        t = L.table()
        for k, v in value.items():
            t[k] = lua_table(L, v)
        return t
    if isinstance(value, (list, tuple)):
        return L.table(*[lua_table(L, v) for v in value])
    return value


def to_py(v):
    """A Lua table as nested Python dict (keys kept), other values as they are."""
    if hasattr(v, "items") and not isinstance(v, (str, bytes)):
        return {k: to_py(x) for k, x in v.items()}
    return v


def lua_literal(v, indent=""):
    if isinstance(v, dict):
        parts = []
        for k, x in v.items():
            key = f"[{k}]" if isinstance(k, (int, float)) and not isinstance(k, bool) else f'["{k}"]'
            parts.append(f"{key} = {lua_literal(x)}")
        return "{ " + ", ".join(parts) + " }"
    if isinstance(v, (list, tuple)):
        return "{ " + ", ".join(lua_literal(x) for x in v) + " }"
    if isinstance(v, bool):
        return "true" if v else "false"
    if isinstance(v, (int, float)):
        return repr(v)
    if v is None:
        return "nil"
    return '"' + str(v).replace("\\", "\\\\").replace('"', '\\"').replace("\n", "\\n") + '"'


def run(args, name, locale="frFR", prelude="", before=None, after=None, exclude=(), extra=()):
    """One login of the whole pack: `before` and `after` get (L, G, ns) and return report lines."""
    cp.PRELUDES[:] = [PRELUDE, prelude]
    cp.EXCLUDE.clear()
    cp.EXCLUDE.update(exclude)
    if getattr(args, "bascule", None):
        # Another build of the pack (a dist folder) in place of addons/PolestarPack_GroupeAlliance*.
        cp.EXCLUDE.update(("PolestarPack_GroupeAlliance", "PolestarPack_GroupeAlliance_frFR"))
        extra = (*extra, args.bascule)
    out = {"lines": [], "bad": 0}

    def setup(L, B, nss):
        L.execute(LIB)
        L.globals().G.init(nss["Polestar"])
        if before:
            before(L, L.globals().G, nss["Polestar"])

    def finish(L, B, nss):
        rep = Report()
        after(L, L.globals().G, nss["Polestar"], rep)
        errs = [f"{e[1]} [{e[2]}] {str(e[3]).splitlines()[0][:200]}" for e in cp.lua_list(B.errors) if not str(e[1]).startswith("Auctionator")]
        # Errors Polestar caught itself (ns.Safe: timers, its messages' handlers), which go to the
        # game's error handler (BugGrabber here) and not to the bench's list.
        errs += [f"Polestar (ns.Errors) x{e.count} {str(e.msg)[:200]}" for e in cp.lua_list(nss["Polestar"].Errors())]
        rep.check(not errs, "aucune erreur Lua hors Auctionator (erreur connue), ni dans les erreurs que Polestar attrape lui-même" + ("" if not errs else " : " + " | ".join(errs)))
        out["lines"], out["bad"] = rep.lines, rep.bad
        return [], 0

    cp.BEFORE_LOGIN[:] = [setup]
    cp.AFTER_LOGIN[:] = [finish]
    a = argparse.Namespace(ui=args.ui, strings=args.strings, extra=list(extra), report=None, locale=None)
    cp.run(a, locale)
    return [f"### {name}"] + out["lines"], out["bad"]


# ---------------------------------------------------------------------------------------------
# Histories on this pack's own route of 0.12.2 (its leveling guides left the pack in 0.13.0): a Human
# Warrior playing alone, up to a step of a guide, written once from those guides
# (tools/check-greffe-historique.json). -> quests handed in, quests in the log
# ---------------------------------------------------------------------------------------------
HISTORIES = json.loads((REPO / "tools" / "check-greffe-historique.json").read_text(encoding="utf-8"))


def history(key):
    h = HISTORIES[key]
    return h["done"], h["log"]


# ---------------------------------------------------------------------------------------------
# Scenarios
# ---------------------------------------------------------------------------------------------
ROUTE_DM = "forever/alliance/03-loch-modan"
CHAPTER_DM = "groupe-alliance/07b-mortemines"
ROUTE_SM = "forever/alliance/40-50/02-badlands"
CHAPTER_SM = "groupe-alliance/monastere-ecarlate"


# Two more chapters of the full table, played by the Deadmines chapter's guide (the switch has not
# made theirs yet), hooked on a quest every history here has handed in (The Defias Brotherhood, 65):
# both are due at 29; which one comes first, and that the other waits. Their real hooks and levels
# are in the design notes, not here.
MIG_HOOKS = [
    {"id": CHAPTER_DM, "key": "essai-prison", "turnin": 65, "min": 24, "max": 29, "done": [],
     "name": {"frFR": "La Prison (essai)", "enUS": "The Stockade (test)"}, "where": {"frFR": "Hurlevent", "enUS": "Stormwind"}},
    {"id": CHAPTER_DM, "key": "essai-fouilles", "turnin": 65, "min": 26, "max": 31, "done": [],
     "name": {"frFR": "Le site de fouilles (essai)", "enUS": "The Excavation Site (test)"}, "where": {"frFR": "Les Paluns", "enUS": "Wetlands"}},
]


def char_db(tabs, active=1, extra=""):
    ids = ", ".join(f'"{t}"' for t in tabs)
    return f"PolestarCharDB = {{ tabs = {{ {ids} }}, activeTab = {active}{extra} }}\n"


ACCOUNT = 'PolestarDB = { welcomeSeen = 1, groupeAlliance = { autoTold = true, notesSeen = "seen" } }\n'


def at_hook(route, turnin, level):
    """Before login: the log as Polestar's guide `route` leaves it just before handing in `turnin`."""
    def before(L, G, ns):
        L.globals().GREFFE.level = level
        res = G.walk(route, turnin)
        upto = res[0] if isinstance(res, tuple) else res
        assert upto, f"walk {route} {turnin}: {res}"
        L.globals().GREFFE.walkedTo = upto
    return before


def proposal(args):
    """Points 1 to 3: the hook reached, the card, the chapter opened, finished, back."""
    def after(L, G, ns, r):
        g = L.globals()
        upto = g.GREFFE.walkedTo
        r.say(f"Joueur humain guerrier niveau 20, onglet sauvegardé `{ROUTE_DM}`, journal et quêtes rendues tels que ce guide de Polestar les laisse "
              f"juste avant son étape {upto} (« Sentinel Hill », rendu de The Defias Traitor, 155).")
        G.tick(6)
        gid, step, title = G.active()
        r.say(f"Après la connexion : onglets {G.tabs()} ; étape affichée {step} « {title} ».")
        r.check(gid == ROUTE_DM, "le guide de Polestar est l'onglet actif")
        G.clearOther()
        r.check(G.card() == "none", f"avant le point d'accroche, aucune proposition (carte : {G.card()}) ; écartées par le banc comme le ferait le joueur :{G.dismissed or ' aucune'}")
        G.turnin(155)
        G.tick(4)
        G.clearOther()
        G.tick(2)
        before_step = G.tabStep(ROUTE_DM)
        card = G.card()
        r.say(f"155 rendue : carte « {card} » ; étape du guide de Polestar : {before_step} « {G.title(ns.Guides.Get(ROUTE_DM), before_step)} ».")
        r.check(card.startswith("greffe:mortemines"), "1. la proposition du chapitre des Mortemines apparaît sur la carte de Polestar")
        f_ = ns.UI.ClassToast.frame
        shown = f_ and f_.IsShown(f_)
        r.check(bool(shown), "la carte est affichée (cadre visible dans le faux jeu)")
        ns.UI.ClassToast.Act()
        G.tick(4)
        gid, step, title = G.active()
        r.say(f"« Ouvrir le chapitre » : onglets {G.tabs()} ; actif {gid}, étape {step} « {title} » ; réponses {G.answers()}.")
        r.check(gid == CHAPTER_DM, "2. le chapitre s'ouvre dans son propre onglet, actif")
        r.check(G.tabStep(ROUTE_DM) == before_step, f"2. le guide de Polestar garde sa place (étape {G.tabStep(ROUTE_DM)}, avant : {before_step})")
        r.check(G.card() == "none", "la carte est fermée")
        # The run: the chapter's quests taken, done, handed in.
        for q in (166, 214, 168, 167):
            G.accept(q)
        mid = G.active()
        r.say(f"Quêtes du chapitre prises (166, 214, 168, 167) : actif {mid[0]}, étape {mid[1]} « {mid[2]} ».")
        n0 = len(cp.lua_list(L.globals().BENCH.printed))
        for q in (166, 214):
            G.turnin(q)
        G.accept(373)
        for q in (168, 167, 373):
            G.turnin(q)
        G.tick(6)
        gid, step, title = G.active()
        said = cp.lua_list(G.printed(n0 + 1))
        r.say(f"Toutes rendues : onglets {G.tabs()} ; actif {gid}, étape {step} « {title} » ; réponses {G.answers()}.")
        r.say(f"Chat : {' / '.join(str(x) for x in said) or '(rien)'}")
        r.check(gid == ROUTE_DM, "3. chapitre fini : son onglet se ferme et le guide de Polestar revient")
        r.check(CHAPTER_DM not in [t for t in G.tabs().split()], "l'onglet du chapitre n'est plus ouvert")
        r.check(step is not None and step >= before_step, f"3. le guide de Polestar reprend à la bonne étape ({step}, pas avant {before_step})")
        G.tick(4)
        r.check(G.card() == "none", "le chapitre fait n'est plus proposé")
    return run(args, "Scénario 1 : point d'accroche, proposition, ouverture, fin du chapitre, retour (Mortemines)",
               prelude=ACCOUNT + char_db([ROUTE_DM]), before=at_hook(ROUTE_DM, 155, 20), after=after)


def close_tab(args):
    """Point 3, second way: the chapter's tab closed by the player."""
    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        G.turnin(155)
        G.clearOther()
        G.tick(2)
        before_step = G.tabStep(ROUTE_DM)
        ns.UI.ClassToast.Act()
        G.tick(4)
        G.accept(166)
        r.say(f"Chapitre ouvert, 166 prise : onglets {G.tabs()}.")
        E = ns.Engine
        idx = next(i for i, t in enumerate(cp.lua_list(E.GetTabs()[0]), 1) if t.guideId == CHAPTER_DM)
        E.CloseTab(idx)
        G.tick(4)
        gid, step, title = G.active()
        r.say(f"Onglet du chapitre fermé à la croix : onglets {G.tabs()} ; actif {gid}, étape {step} « {title} » ; réponses {G.answers()}.")
        r.check(gid == ROUTE_DM and step == before_step, f"3. le guide de Polestar revient, à son étape ({step}, avant : {before_step})")
        G.turnin(166)
        G.tick(6)
        r.check(G.card() == "none", "le chapitre ouvert puis fermé n'est plus proposé (la liste des guides l'a toujours)")
    return run(args, "Scénario 2 : chapitre fermé par le joueur avant la fin", prelude=ACCOUNT + char_db([ROUTE_DM]),
               before=at_hook(ROUTE_DM, 155, 20), after=after)


def refuse(args):
    """Point 4: Later, then Not for me."""
    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        G.turnin(155)
        G.clearOther()
        G.tick(2)
        r.check(G.card().startswith("greffe:mortemines"), "proposition au point d'accroche")
        ns.UI.ClassToast.Later()
        G.tick(2)
        shown = []
        for _ in range(3):
            L.globals().BENCH.Fire("QUEST_LOG_UPDATE")
            G.tick(2)
            shown.append(G.card())
        G.accept(119)
        G.turnin(119)
        shown.append(G.card())
        r.say(f"« Plus tard », puis trois changements d'étape, une quête prise et rendue : cartes {shown} ; réponses {G.answers()}.")
        r.check(all(c == "none" for c in shown), "4. « Plus tard » : la proposition ne revient pas à chaque étape ni à chaque rendu")
        G.levelUp(21)
        G.clearOther()
        G.tick(2)
        again = G.card()
        r.say(f"Niveau 21 : carte « {again} ».")
        r.check(again.startswith("greffe:mortemines"), "« Plus tard » : reposée une fois au niveau suivant, tant que le niveau le permet")
        ns.UI.ClassToast.Off()
        G.tick(2)
        after_off = []
        for lv in (22, 23):
            G.levelUp(lv)
            G.clearOther()
            after_off.append(G.card())
        r.say(f"« Pas pour moi », puis niveaux 22 et 23 : cartes {after_off} ; réponses {G.answers()}.")
        r.check(all(c == "none" for c in after_off), "4. « Pas pour moi » : plus jamais proposée pour ce personnage")
    return run(args, "Scénario 3 : le joueur refuse", prelude=ACCOUNT + char_db([ROUTE_DM]), before=at_hook(ROUTE_DM, 155, 20), after=after)


def edge_cases(args):
    """Already done, too low, too high: each its own login."""
    rows, bad = [], 0
    cases = [
        ("déjà fait (The Defias Brotherhood, 166, rendue)", 20, [166], "done"),
        ("trop bas (niveau 17)", 17, [], "below"),
        ("trop haut (niveau 26)", 26, [], "above"),
    ]
    for label, level, extra_done, want in cases:
        def before(L, G, ns, level=level, extra_done=extra_done):
            at_hook(ROUTE_DM, 155, level)(L, G, ns)
            for q in extra_done:
                L.globals().BENCH.completed[q] = True

        def after(L, G, ns, r, label=label, want=want):
            G.tick(6)
            G.clearOther()
            G.turnin(155)
            G.clearOther()
            G.tick(2)
            why = ns.GA.GreffeWhy(next(h for h in cp.lua_list(ns.GA.GREFFE) if h.key == "mortemines"))
            r.check("greffe:mortemines" not in G.card() and why == want, f"{label} : pas de proposition des Mortemines (raison du module : {why}, attendue : {want} ; carte : {G.card()})")
        lines, b = run(args, f"Scénario 4 : {label}", prelude=ACCOUNT + char_db([ROUTE_DM]), before=before, after=after)
        rows += lines
        bad += b
    return rows, bad


def reload_mid(args):
    """A /reload in the middle of the chapter: the saved tabs and answers."""
    extra = (', gaGreffe = { answers = { mortemines = { a = "open", level = 20 } }, from = { ["' + CHAPTER_DM + '"] = "' + ROUTE_DM + '" } }')

    def before(L, G, ns):
        at_hook(ROUTE_DM, 155, 20)(L, G, ns)
        g = L.globals()
        G.dropLog(155)
        g.BENCH.completed[155] = True
        for q in (166, 214, 168, 167):
            G.addLog(q)

    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        gid, step, title = G.active()
        r.say(f"Connexion avec deux onglets sauvegardés (le guide de Polestar, le chapitre actif) et 166, 214, 168, 167 dans le journal : "
              f"onglets {G.tabs()} ; actif {gid}, étape {step} « {title} » ; réponses {G.answers()}.")
        r.check(gid == CHAPTER_DM, "le chapitre revient, actif, avec le guide de Polestar dans son onglet")
        r.check(G.card() == "none", "rien n'est reproposé")
        for q in (166, 214):
            G.turnin(q)
        G.accept(373)
        for q in (168, 167, 373):
            G.turnin(q)
        G.tick(6)
        gid, step, title = G.active()
        r.check(gid == ROUTE_DM, f"fin du chapitre après le rechargement : retour au guide de Polestar (étape {step} « {title} »)")
    return run(args, "Scénario 5 : rechargement de l'interface au milieu du chapitre",
               prelude=ACCOUNT + char_db([ROUTE_DM, CHAPTER_DM], 2, extra), before=before, after=after)


def late_chapter(args):
    """The late chapter: the Scarlet Monastery answered "Later" at 43 (offered at Nijel's Point at
    about 39), the player at 44 on the route's Southshore stop, before Raleigh's hand-in of 1052."""
    answers = others_answered(later={"monastere": 43})

    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        gid, step, title = G.active()
        login = G.card()
        r.say(f"« Plus tard » répondu à 43 ; niveau 44 sur `{ROUTE_SM}` juste avant le rendu de Down the Scarlet Path (1052) : actif {gid}, étape {step} « {title} » ; carte « {login} ».")
        if not login.startswith("greffe:monastere"):
            G.turnin(1052)
            G.clearOther()
            G.tick(2)
        card = G.card()
        r.check(card.startswith("greffe:monastere"), f"le Monastère écarlate est reproposé au niveau suivant (carte « {card} »)")
        before_step = G.tabStep(ROUTE_SM)
        ns.UI.ClassToast.Act()
        G.tick(4)
        r.check(G.active()[0] == CHAPTER_SM and G.tabStep(ROUTE_SM) == before_step, f"chapitre ouvert, Polestar garde son étape ({before_step}) : {G.tabs()}")
        G.finish(CHAPTER_SM)
        gid, step, title = G.active()
        r.check(gid == ROUTE_SM and step is not None and step >= before_step, f"fin du chapitre : retour à `{ROUTE_SM}`, étape {step} « {title} »")
    return run(args, "Scénario 6 : un chapitre tardif (Monastère écarlate reporté, niveau 44)", prelude=ACCOUNT + char_db([ROUTE_SM], 1, answers),
               before=at_hook(ROUTE_SM, 1052, 44), after=after)


def synced(args):
    """Two friends: the one ahead runs the chapter and asks "Sync to my guide"; the other accepts.
    Party.AcceptSync opens the friend's guide in another tab (Engine.OpenTab) and skips up to their
    step: done here by the same calls, without a second client or the party messages."""
    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        before_step = G.tabStep(ROUTE_DM)
        E = ns.Engine
        E.OpenTab(CHAPTER_DM)
        G.tick(4)
        r.say(f"Sans avoir rendu 155 (pas de proposition), l'ami accepte la synchronisation sur le chapitre : onglets {G.tabs()} ; carte « {G.card()} ».")
        r.check(G.active()[0] == CHAPTER_DM and G.tabStep(ROUTE_DM) == before_step, "le chapitre s'ouvre dans un autre onglet, le guide de Polestar garde son étape")
        G.turnin(155)
        G.clearOther()
        G.tick(2)
        r.check("greffe:" not in G.card(), f"le chapitre déjà ouvert n'est pas proposé en plus (raison : {ns.GA.GreffeWhy(next(h for h in cp.lua_list(ns.GA.GREFFE) if h.key == "mortemines"))})")
        for q in (166, 214, 168, 167):
            G.accept(q)
        for q in (166, 214):
            G.turnin(q)
        G.accept(373)
        for q in (168, 167, 373):
            G.turnin(q)
        G.tick(6)
        gid, step, title = G.active()
        r.check(gid == ROUTE_DM, f"chapitre fini : retour au premier onglet de parcours, faute d'onglet d'origine ({G.tabs()})")
    return run(args, "Scénario 9 : chapitre ouvert par « Sync to my guide » d'un ami (simulé)", prelude=ACCOUNT + char_db([ROUTE_DM]),
               before=at_hook(ROUTE_DM, 155, 20), after=after)


def french(args):
    """Point 5: a text Polestar left in English shows ours; one Polestar translated keeps its words,
    and a text Polestar translates in a later version takes Polestar's words over ours."""
    pkg = json.loads((REPO / "tools" / "fr-texts-polestar-manquants.json").read_text(encoding="utf-8"))
    built = (REPO / "addons" / "Polestar_frFR" / "Texts.lua").read_text(encoding="utf-8")

    def after(L, G, ns, r):
        G.tick(4)
        steps = L.eval(r'''function(ns, id)
            local g = ns.Guides.Get(id)
            local steps = g.steps
            ns.GuideTexts.Refresh(g)
            local out = {}
            for i, step in ipairs(steps) do
                local notes = {}
                for _, goal in ipairs(step.goals) do notes[#notes + 1] = tostring(goal.note or goal.text or "") end
                out[#out + 1] = { i, tostring(step.title), tostring(step.note), table.concat(notes, " | ") }
            end
            return out
        end''')
        rows = cp.lua_list(steps(ns, "forever/alliance/05-duskwood"))
        titles = {x[1]: x[2] for x in rows}
        ours = [i for i, t in titles.items() if t == "Écumeurs squelettes"]
        theirs = [i for i, t in titles.items() if t == "Côtes de goule"]
        r.check(bool(ours), f"5. « Skeletal Raiders » (05-duskwood, sans français chez Polestar) s'affiche « Écumeurs squelettes » (étape {ours[0] if ours else '?'})")
        r.check(bool(theirs), f"5. « Ghoul Ribs » (traduit par Polestar) garde la traduction de Polestar « Côtes de goule » (étape {theirs[0] if theirs else '?'})")
        loch = cp.lua_list(steps(ns, "forever/alliance/03-loch-modan"))
        hits = []
        for x in loch:
            for part in (str(x[3]), *str(x[4]).split(" | ")):
                if "la planter" in part or "En allant au port" in part:
                    hits.append((x[1], part))
        r.say("Rendu dans le jeu, noms du jeu remplis par Polestar : " + " | ".join(f"03-loch-modan étape {i} : « {t[:170]} »" for i, t in hits[:2]))
        hy = cp.lua_list(steps(ns, "forever/50-60/mount-hyjal"))
        r.say("Mont Hyjal, premiers titres d'étapes : " + " ; ".join(str(x[2]) for x in hy[:6]))
        # A later Polestar version that translates "Skeletal Raiders" itself: replayed by adding that
        # line to Polestar's own table before our block, as the regenerated file would have it.
        sim = built.replace("-- Polestar version: ", 't.guides["forever/alliance/05-duskwood"]["Skeletal Raiders"] = "Pillards (mot de Polestar)"\n-- Polestar version: ', 1)
        err = L.eval("function(src) local f, e = loadstring(src, '@Polestar_frFR/Texts.lua') if not f then return e end f('Polestar_frFR', {}) return nil end")(sim)
        r.check(err is None, f"Texts.lua construit, rejoué avec une traduction de Polestar en plus ({err or 'sans erreur'})")
        titles2 = {x[1]: x[2] for x in cp.lua_list(steps(ns, "forever/alliance/05-duskwood"))}
        got = titles2.get(ours[0] if ours else -1)
        r.check(got == "Pillards (mot de Polestar)", f"5. un texte que Polestar traduit lui-même garde SA traduction, la nôtre ne passe pas dessus (« {got} »)")
        r.check(titles2.get(theirs[0] if theirs else -1) == "Côtes de goule", "les autres traductions de Polestar ne bougent pas")
        r.say(f"Textes de Polestar sans français listés : {len(pkg)} distincts, dont {sum(1 for v in pkg.values() if v)} traduits pour l'essai (tools/fr-texts-polestar-manquants.json).")
    return run(args, "Scénario 7 : français complété, traduction de Polestar gardée", prelude=ACCOUNT + char_db([ROUTE_DM]), after=after)


def english(args):
    def after(L, G, ns, r):
        G.tick(4)
        g = ns.Guides.Get("forever/alliance/05-duskwood")
        titles = [str(s.title) for s in cp.lua_list(g.steps)]
        r.check("Skeletal Raiders" in titles and "Écumeurs squelettes" not in titles, "client anglais : le guide de Polestar reste en anglais, le complément ne s'applique pas")
    return run(args, "Scénario 8 : client anglais", locale="enUS", prelude=ACCOUNT + char_db([ROUTE_DM]), after=after)


def migration(args, key, hooks=()):
    """D: a character of this pack's route (0.12.2) after the switch, its saved tab on a retired guide.
    hooks: extra entries for GA.GREFFE (test chapters played here by the Deadmines chapter's guide)
    to show which one is offered first and that the next one waits."""
    h_ = HISTORIES[key]
    level, stop_guide, label = h_["level"], h_["guide"], h_["label"]
    done, log = history(key)
    done_lua = "{" + ",".join(f"[{q}]=true" for q in done) + "}"
    log_lua = "{" + ",".join(str(q) for q in log[-25:]) + "}"
    prelude = (ACCOUNT + char_db([stop_guide]) +
               f"for q in pairs({done_lua}) do BENCH.completed[q] = true end\nGREFFE.log = {log_lua}\nGREFFE.level = {level}\n")

    def before(L, G, ns):
        for h in hooks:
            L.execute("table.insert(G.ns.GA.GREFFE, " + lua_literal(h) + ")")

    def after(L, G, ns, r):
        r.say(f"Historique : {label} sur notre parcours 0.12.2 (humain guerrier, seul : questions de groupe passées, chapitres laissés), "
              f"{len(done)} quêtes rendues, {min(len(log), 25)} dans le journal ; onglet sauvegardé `{stop_guide}` (retiré du paquet après la bascule).")
        G.tick(8)
        gid, step, title = G.active()
        E = ns.Engine
        g = E.GetGuide()
        r.say(f"Après la connexion : onglets {G.tabs()} ; actif `{gid}`, étape {step} « {title} » ; carte : {G.card()}.")
        r.check(gid.startswith("forever/alliance/"), "le personnage est placé dans un guide de parcours de Polestar (le successeur de l'onglet retiré)")
        r.check(step is not None, "une étape est affichée (pas d'onglet vide ni de guide bloqué)")
        info = L.eval(r'''function(ns, live)
            local E, G = ns.Engine, ns.Guides
            local g = E.GetGuide()
            local out = { open = {}, chain = {}, log = {} }
            for s = 1, (live or 1) - 1 do
                local v = E.GetStepView(s)
                local st = v and v.status or "?"
                if st ~= "done" and st ~= "skipped" and st ~= "na" then out.open[#out.open + 1] = s .. ":" .. st end
            end
            -- The route from the placed guide on, by `next`.
            local order, seen, id = {}, {}, g.id
            while id and not seen[id] and #order < 40 do
                seen[id] = true
                order[#order + 1] = id
                local n = G.Get(id) and G.Get(id).next
                if type(n) == "table" then n = n[1] and (n[1].id or n[1]) end
                id = type(n) == "string" and n or nil
            end
            for i, x in ipairs(order) do out.chain[i] = x end
            -- Each quest of the log: the first guide of that route that hands it in, else an
            -- Alliance guide before it that does, else none.
            local pos = {}
            for i, x in ipairs(order) do pos[x] = i end
            for _, q in ipairs(GREFFE.log) do
                local best, where
                for _, h in ipairs(G.List()) do
                    local gg = G.Get(h.id)
                    if gg and gg.pack == "guides" and (gg.faction == nil or gg.faction == "Alliance") then
                        for _, st in ipairs(gg.steps or {}) do
                            for _, goal in ipairs(st.goals or {}) do
                                if goal.t == "turnin" and goal.quest == q then
                                    local p = pos[gg.id]
                                    if p and (not best or p < best) then best, where = p, gg.id end
                                    if not p and not where then where = "avant : " .. gg.id end
                                end
                            end
                        end
                    end
                end
                out.log[#out.log + 1] = q .. " -> " .. (where or "aucun guide de Polestar")
            end
            return out
        end''')(ns, step)
        opened = cp.lua_list(info.open)
        r.say(f"Étapes avant l'étape affichée encore ouvertes (ni faites, ni passées, ni hors personnage) : {len(opened)} {opened[:8]}")
        r.check(len(opened) == 0, "le guide ne renvoie pas le joueur en arrière dans ce guide")
        chain = cp.lua_list(info.chain)
        r.say(f"Suite du parcours de Polestar depuis là : {' > '.join(c.split('/')[-1] for c in chain[:8])}{' ...' if len(chain) > 8 else ''}")
        rows = cp.lua_list(info.log)
        later = [x for x in rows if "avant :" not in x and "aucun" not in x]
        back = [x for x in rows if "avant :" in x]
        none = [x for x in rows if "aucun" in x]
        r.say(f"Quêtes du journal : {len(later)} rendues plus loin sur ce parcours, {len(back)} seulement dans un guide d'avant, {len(none)} dans aucun guide de Polestar.")
        if back:
            r.say("  seulement avant : " + " ; ".join(back[:8]))
        if none:
            r.say("  aucun guide : " + " ; ".join(none[:8]))
        quests = set()
        for s_ in cp.lua_list(g.steps):
            for goal in cp.lua_list(s_.goals):
                if goal.quest and goal.t == "turnin":
                    quests.add(goal.quest)
        already = sorted(q for q in quests if q in set(done))
        r.say(f"Dans le guide placé, {len(quests)} quêtes rendues, dont {len(already)} déjà faites sur notre parcours : comptées faites, jamais redemandées.")
        dismissed_before = G.dismissed
        G.clearOther()
        G.tick(4)
        first = G.card()
        due = [h.key for h in cp.lua_list(ns.GA.GreffeDue())]
        whys = {h.key: ns.GA.GreffeWhy(h) for h in cp.lua_list(ns.GA.GREFFE)}
        r.say(f"Cartes de Polestar écartées comme le ferait le joueur :{G.dismissed or ' aucune'}. Chapitres dus {due or 'aucun'} ; raisons {whys} ; carte « {first} ».")
        r.check(first.count("greffe:") <= 1, "une seule proposition à la fois")
        covered = {d for h in cp.lua_list(ns.GA.GREFFE) for d in cp.lua_list(ns.GA.GreffeDungeons(h))}
        shown = [x for x in (G.dismissed or "").split() if x.startswith("dungeon:") and x[8:] in covered]
        r.check(not shown, f"aucune carte de Polestar pour un donjon que couvre un de nos chapitres ({shown or 'aucune'})")
        if due and not hooks:
            r.check(first.startswith("greffe:" + due[0]), f"le chapitre dû qui sort le plus tôt de sa fourchette est proposé ({due[0]})")
        if hooks:
            r.check(first.startswith("greffe:" + due[0]) if due else first == "none",
                    f"la première proposée est celle qui sort le plus tôt de la fourchette de niveaux ({due[0] if due else '-'})")
            ns.UI.ClassToast.Later()
            G.tick(4)
            mid = G.card()
            r.check("greffe:" not in mid, f"après « Plus tard », la suivante attend (carte : {mid})")
            G.accept(99999)
            G.turnin(99999)
            G.clearOther()
            G.tick(2)
            second = G.card()
            r.say(f"Une quête rendue plus tard : carte « {second} » ; réponses {G.answers()}.")
            r.check(len(due) < 2 or second.startswith("greffe:" + due[1]), "la suivante vient au rendu suivant, une seule à la fois")
    return run(args, f"Scénario D : migration, {label}", prelude=prelude, before=before, after=after)


# ---------------------------------------------------------------------------------------------
# C: one scenario per chapter, on Polestar's route (0.13.0)
# ---------------------------------------------------------------------------------------------
# key: (Polestar guide to walk, hook quest, "turnin" | "accept", level, quests already handed in)
CHAPTERS = {
    "rendez-vous": ("forever/alliance/02-westfall", 109, "turnin", 11, ()),
    "thanes": ("forever/alliance/02-westfall", 13, "turnin", 16, ()),
    "ruines": ("forever/alliance/03-darkshore", 947, "turnin", 19, ()),
    "mortemines": ("forever/alliance/03-loch-modan", 155, "turnin", 21, ()),
    "brassenoire": ("forever/alliance/06-ashenvale", 1054, "turnin", 25, ()),
    "prison": ("forever/alliance/05-duskwood", 72, "turnin", 29, ()),
    "fouilles": ("forever/alliance/06-wetlands", 95737, "turnin", 30, ()),
    "gnomeregan": ("forever/alliance/06-wetlands", 293, "turnin", 31, (387,)),
    "dalaran": ("forever/alliance/30-40/01-hillsbrad-foothills", 92432, "accept", 31, ()),
    "kraal": ("forever/alliance/30-40/03-ashenvale", 1100, "turnin", 33, ()),
    "monastere": ("forever/alliance/30-40/06b-desolace", 1052, "accept", 39, ()),
    "souilles": ("forever/alliance/40-50/01-stranglethorn-vale", 1448, "turnin", 41, ()),
    "uldaman": ("forever/alliance/40-50/01b-riverglades", 94893, "turnin", 44, (3636,)),
    "maraudon": ("forever/40-50/shendralas", 99257, "turnin", 46, ()),
    "zulfarrak": ("forever/alliance/40-50/04-tanaris", 2864, "turnin", 46, ()),
    "zulfarrak2": ("forever/alliance/40-50/07-un-goro-crater", 2941, "turnin", 49, ()),
    "temple": ("forever/alliance/50-60/01-burning-steppes", 2585, "turnin", 51, ()),
    "donjons-fin": ("forever/alliance/50-60/01-burning-steppes", 3823, "turnin", 55, ()),
}


sys.path.insert(0, str(REPO / "tools"))
import polestar_guides as _pg  # noqa: E402

# Each chapter's level range (GreffeData.lua), for the answers a scenario saves (others_answered).
CHAPTER_RANGES = [(e["key"], (e["min"], e["max"])) for e in _pg.greffe()[0]]


def at_route(route, q, kind, level, done=()):
    """Before login: the log as Polestar's guide `route` leaves it just before the step that hands in
    (or takes) q; `done`: more quests handed in (chapters already run)."""
    def before(L, G, ns):
        L.globals().GREFFE.level = level
        res = G.walk(route, q, kind)
        upto = res[0] if isinstance(res, tuple) else res
        assert upto, f"walk {route} {q}: {res}"
        L.globals().GREFFE.walkedTo = upto
        for x in done:
            L.globals().BENCH.completed[x] = True
    return before


def set_level(level):
    def before(L, G, ns):
        L.globals().GREFFE.level = level
    return before


def hook(G, q, kind):
    """The hook quest handed in (or taken), then the rest of that stop of the route (its other
    hand-ins and errands): the card waits for the end of the stop (GA.GreffeAtHookStop)."""
    if kind == "accept":
        G.accept(q)
    else:
        G.turnin(q)
    G.tick(4)
    G.clearOther()
    G.finishStop()
    G.tick(2)
    G.clearOther()
    G.tick(2)


def polestar_shown(G, dungeons):
    """Polestar's own cards for these dungeons the bench saw (and dismissed) since the login."""
    return [x for x in (G.dismissed or "").split() if x.startswith("dungeon:") and x[8:] in dungeons]


def chapter_scenario(args, key):
    """C: Polestar's guide walked up to the chapter's hook, the card, the chapter opened in its own
    tab, its hand-ins (optional ones left), the tab closed and Polestar's guide back at its step."""
    route, q, kind, level, done = CHAPTERS[key]

    def after(L, G, ns, r):
        h = G.entry(key)
        cid = h.id
        dungeons = cp.lua_list(ns.GA.GreffeDungeons(h))
        ns.Codex.Load()
        G.tick(6)
        G.clearOther()
        before_card = G.card()
        r.say(f"Niveau {level}, `{route}` marché jusqu'à l'étape {L.globals().GREFFE.walkedTo} ({'rendu' if kind == 'turnin' else 'prise'} de {q}) ; "
              f"carte avant l'accroche : « {before_card} » ; cartes de Polestar écartées :{G.dismissed or ' aucune'}.")
        r.check(f"greffe:{key}" not in before_card, "rien avant l'accroche")
        hook(G, q, kind)
        card = G.card()
        # The stop finished may end the route's guide: its tab then holds the next one.
        route_now = G.active()[0]
        before_step = G.tabStep(route_now)
        r.check(card.startswith(f"greffe:{key}"), f"accroche : la carte propose le chapitre (« {card} »)")
        held = [d for d in dungeons if G.polestarCard(d, level)[0]]
        opens = [d for d in dungeons if G.polestarCard(d, level)[1]]
        shown = polestar_shown(G, dungeons)
        r.check(not shown and not held, f"la carte de Polestar pour {', '.join(dungeons) or '(aucun donjon)'} ne sort pas (montrée : {shown or 'non'} ; dans ses candidates : {held or 'non'} ; "
                f"sa règle l'ouvrirait à ce niveau : {', '.join(opens) if opens else 'non, contrôle sans objet ici (voir P1 et P2)'})")
        ns.UI.ClassToast.Act()
        G.tick(4)
        gid, step, title = G.active()
        r.check(gid == cid and G.tabStep(route_now) == before_step, f"ouverture : le chapitre dans son onglet, actif, étape {step} « {title} » ; le guide de Polestar (`{route_now}`) garde son étape ({before_step})")
        by_end = len(cp.lua_list(ns.GA.ChapterFin(cid))) == 0
        if by_end:
            # No hand-in without a condition (the meeting point, the second Zul'Farrak run, the 55-60
            # dungeons): the chapter ends with its guide, as its last line ticked (GUIDE_COMPLETED).
            n = 0
            ns.Fire("GUIDE_COMPLETED", cid)
            G.tick(4)
        else:
            n = G.finish(cid)
        gid, step, title = G.active()
        r.say(f"Fin ({n} rendus{' ; fin du guide : GUIDE_COMPLETED' if by_end else ''}) : onglets {G.tabs()} ; actif {gid}, étape {step} « {title} » ; réponses {G.answers()}.")
        r.check(gid == route_now and cid not in G.tabs() and step is not None and step >= before_step,
                f"retour : l'onglet du chapitre se ferme, le guide de Polestar revient à son étape ou plus loin ({step}, avant : {before_step})")
        G.tick(4)
        r.check(f"greffe:{key}" not in G.card(), "le chapitre fini n'est plus proposé")
    return run(args, f"Scénario C ({key}) : {route.split('/')[-1]}, niveau {level}",
               prelude=ACCOUNT + char_db([route], 1, others_answered(key, level=level)), before=at_route(route, q, kind, level, done), after=after)


def others_answered(*keys, later=None, level=None):
    """Saved answers: the other chapters already run ("done"), so a scenario sees its own cards; with
    `level`, only those whose range holds that level (the others cannot be due there anyway);
    later: {key: level} answered "Later" at that level."""
    later = later or {}
    rng = {e[0]: e[1] for e in CHAPTER_RANGES}
    rows = [f'["{k}"] = {{ a = "done", level = 1 }}' for k in CHAPTERS if k not in keys and k not in later
            and (level is None or rng[k][0] <= level <= rng[k][1])]
    rows += [f'["{k}"] = {{ a = "later", level = {lv} }}' for k, lv in later.items()]
    return f", gaGreffe = {{ answers = {{ {', '.join(rows)} }} }}"


def meeting_card(args):
    """The meeting point's card says so, not "group dungeon"."""
    route, q, kind, level, done = CHAPTERS["rendez-vous"]

    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        hook(G, q, kind)
        m = ns.UI.ClassToast.current
        head = str(m.head) if m else ""
        r.check(m is not None and m.greffe == "rendez-vous" and "RENDEZ-VOUS" in head and "DONJON" not in head,
                f"carte du rendez-vous : « {head} », « {m and m.facts} », « {m and m.title} »")
    return run(args, "Scénario C (rendez-vous) : la carte dit « rendez-vous », pas « donjon »", prelude=ACCOUNT + char_db([route], 1, others_answered("rendez-vous")),
               before=at_route(route, q, kind, level, done), after=after)


def ruins_left_open(args):
    """The Ruins' tab left open: the player goes back to the route's tab by hand (its Stormwind
    hand-ins wait for the route's next visit there); the Deadmines card comes at 155 meanwhile; the
    Ruins' hand-ins later close its tab."""
    route, q, kind, level, done = CHAPTERS["ruines"]
    ruins = ("groupe-alliance/06-ruines-de-lordaeron", (95250, 95195, 92415, 95189))

    def after(L, G, ns, r):
        E = ns.Engine
        G.tick(6)
        G.clearOther()
        hook(G, q, kind)
        ns.UI.ClassToast.Act()
        G.tick(4)
        for x in ruins[1]:
            G.accept(x)
        idx = next(i for i, t in enumerate(cp.lua_list(E.GetTabs()[0]), 1) if t.guideId != ruins[0])
        E.SelectTab(idx)
        G.tick(4)
        r.say(f"Ruines ouvertes, leurs quêtes prises, retour à la main sur l'onglet du parcours : {G.tabs()}.")
        r.check(G.active()[0].startswith("forever/") and ruins[0] in G.tabs(), "l'onglet des Ruines reste ouvert pendant que le parcours reprend")
        if G.active()[0] != ROUTE_DM:
            # The Auberdine stop done ends Darkshore: its tab may hold Loch Modan already.
            E.OpenTab(ROUTE_DM, True)
            E.CloseTab(idx)
        G.levelUp(21)
        L.eval("function(G, id) G.walk(id, 155) end")(G, ROUTE_DM)
        G.tick(4)
        G.clearOther()
        G.turnin(155)
        G.clearOther()
        G.tick(2)
        r.say(f"Plus loin sur le parcours (`{ROUTE_DM}`), niveau 21, 155 rendue : onglets {G.tabs()} ; carte « {G.card()} ».")
        r.check(G.card().startswith("greffe:mortemines") and ruins[0] in G.tabs(), "la carte des Mortemines vient, l'onglet des Ruines toujours ouvert")
        ns.UI.ClassToast.Later()
        G.tick(2)
        for x in ruins[1]:
            G.turnin(x)
        G.tick(6)
        r.say(f"Rendus des Ruines faits (Hurlevent, au passage du parcours) : onglets {G.tabs()} ; actif {G.active()[0]}.")
        r.check(ruins[0] not in G.tabs() and G.active()[0].startswith("forever/alliance/"), "l'onglet des Ruines se ferme à ses rendus, un guide du parcours est actif")
    return run(args, "Scénario C (ruines) : l'onglet des Ruines reste ouvert", prelude=ACCOUNT + char_db([route], 1, others_answered("ruines", "mortemines")),
               before=at_route(route, q, kind, level, done), after=after)


def two_due(args, label, route, q, level, first, second, done=(), later=None):
    """Two chapters due at one place: the one that leaves its range first (then the table's order),
    the other at the next hand-in."""
    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        G.turnin(q)
        G.clearOther()
        G.finishStop()
        G.clearOther()
        G.tick(2)
        c1 = G.card()
        due = [h.key for h in cp.lua_list(ns.GA.GreffeDue())]
        r.say(f"Niveau {level}, `{route}`, rendu de {q} ; « Plus tard » enregistré : {later or 'aucun'} ; chapitres dus {due} ; carte « {c1} ».")
        r.check(c1.startswith(f"greffe:{first}"), f"{first} d'abord")
        ns.UI.ClassToast.Later()
        G.tick(2)
        r.check("greffe:" not in G.card(), "après « Plus tard », rien de plus tout de suite")
        G.accept(99998)
        G.turnin(99998)
        G.clearOther()
        G.tick(2)
        c2 = G.card()
        r.check(c2.startswith(f"greffe:{second}"), f"puis {second} au rendu suivant (« {c2} » ; raison : {ns.GA.GreffeWhy(G.entry(second))} ; actif {G.active()[0]})")
    return run(args, f"Scénario C ({label})", prelude=ACCOUNT + char_db([route], 1, others_answered(first, second, later=later)),
               before=at_route(route, q, "turnin", level, done), after=after)


def dalaran_second(args):
    """Dalaran's second hook: "Later" answered at Southshore (92432 taken, 31), offered again when
    the route hands 92432 in at Modera's camp (37)."""
    route = "forever/alliance/30-40/05-arathi-highlands"
    answers = others_answered(later={"dalaran": 36})

    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        login = G.card()
        if not login.startswith("greffe:dalaran"):
            G.turnin(92432)
            G.clearOther()
            G.finishStop()
            G.clearOther()
            G.tick(2)
        r.say(f"« Plus tard » répondu à 36 ; niveau 37 sur `{route}` : carte à la connexion « {login} », puis « {G.card()} ».")
        r.check(G.card().startswith("greffe:dalaran"), "Dalaran reproposé au niveau suivant, au plus tard au camp de Modera")
    return run(args, "Scénario C (dalaran) : seconde accroche après « Plus tard »", prelude=ACCOUNT + char_db([route], 1, answers),
               before=at_route(route, 92432, "turnin", 37), after=after)


def optional_handins(args):
    """Conditional hand-ins never count for a chapter's end: Maraudon ends with Corruption of Earth
    and Seed (7065, Theradras not beaten) and Rot and Regret (93404, no vial) left in the log, not
    finished; Gnomeregan's end has none of its uncertain hand-ins."""
    route, q, kind, level, done = CHAPTERS["maraudon"]

    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        hook(G, q, kind)
        ns.UI.ClassToast.Act()
        G.tick(4)
        handins = cp.lua_list(ns.GA.ChapterFin("groupe-alliance/maraudon"))
        gnome = cp.lua_list(ns.GA.ChapterFin("groupe-alliance/10b-gnomeregan"))
        r.say(f"Rendus qui ferment Maraudon : {handins} ; Gnomeregan : {gnome}.")
        r.check(7065 not in handins and 93404 not in handins, "Maraudon : Theradras (7065) et Rot and Regret (93404) ne sont pas dans la fin")
        r.check(not ({2930, 2924, 2904, 2926, 2962} & set(gnome)), "Gnomeregan : Data Rescue, Essential Artificials, A Fine Mess, Gnogaine, Green Glow ne sont pas dans la fin")
        for x in (7065, 93404):
            G.accept(x)
            L.globals().GREFFE.notReady[x] = True
        G.finish("groupe-alliance/maraudon")
        r.check(G.active()[0].startswith("forever/") and "groupe-alliance/maraudon" not in G.tabs(), f"fin de Maraudon avec 7065 et 93404 dans le journal, pas finies : retour au parcours ({G.tabs()})")
    return run(args, "Scénario C (rendus conditionnels) : Maraudon sans Theradras", prelude=ACCOUNT + char_db([route], 1, others_answered("maraudon")),
               before=at_route(route, q, kind, level, done), after=after)


def temple_with_quest(args):
    """The Sunken Temple with Into the Temple of Atal'Hakkar (1475) already in the log (taken from
    Brohann on the route, as the pack's tip on 1469 says): its first step passes."""
    route, q, kind, level, done = CHAPTERS["temple"]

    def before(L, G, ns):
        at_route(route, q, kind, level, done)(L, G, ns)
        G.addLog(1475)

    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        hook(G, q, kind)
        r.check(G.card().startswith("greffe:temple"), "proposé aussi avec 1475 dans le journal")
        ns.UI.ClassToast.Act()
        G.tick(4)
        gid, step, title = G.active()
        r.check(gid == "groupe-alliance/temple-englouti" and step is not None and step > 1, f"la première étape (Brohann) est passée : étape {step} « {title} »")
        G.finish("groupe-alliance/temple-englouti")
        r.check(G.active()[0] == route, "fin au rendu de 1475 : retour au parcours")
    return run(args, "Scénario C (temple) : 1475 déjà dans le journal", prelude=ACCOUNT + char_db([route], 1, others_answered("temple")), before=before, after=after)


def end_dungeons_55(args):
    """The level 55-60 dungeons: Extinguish the Firegut (3823) handed in at Morgan's Vigil at 50, the
    chapter offered at the level-up to 55 (where Polestar's Blackrock Depths card would come), never
    before; none of Polestar's cards for its five dungeons."""
    route = "forever/alliance/50-60/01-burning-steppes"

    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        G.turnin(3823)
        G.clearOther()
        G.tick(2)
        seen = [G.card()]
        for lv in (52, 53, 54):
            G.levelUp(lv)
            G.clearOther()
            seen.append(G.card())
        r.check(all("greffe:donjons-fin" not in c for c in seen), f"3823 rendue à 50, rien de 50 à 54 (cartes {seen})")
        G.levelUp(55)
        G.tick(2)
        G.clearOther()
        G.tick(2)
        c55 = G.card()
        dungeons = cp.lua_list(ns.GA.GreffeDungeons(G.entry("donjons-fin")))
        shown = polestar_shown(G, dungeons)
        opened = [d for d in dungeons if G.polestarCard(d, 55)[1]]
        r.say(f"Niveau 55 : carte « {c55} » ; donjons que la règle de Polestar ouvre à 55 : {opened or 'aucun'} ; cartes de Polestar écartées :{G.dismissed or ' aucune'}.")
        r.check(c55.startswith("greffe:donjons-fin"), "niveau 55 : les donjons 55-60 sont proposés")
        r.check(not shown, f"aucune carte de Polestar pour Rochenoire, Hache-Tripes, Stratholme, Scholomance ({shown or 'aucune'})")
        ns.UI.ClassToast.Act()
        G.tick(4)
        gid, step, title = G.active()
        r.check(gid == "groupe-alliance/33-donjons-fin", f"ouvert : étape {step} « {title} »")
        E = ns.Engine
        idx = next((i for i, t in enumerate(cp.lua_list(E.GetTabs()[0]), 1) if t.guideId == "groupe-alliance/33-donjons-fin"), None)
        if idx:
            E.CloseTab(idx)
        G.tick(4)
        r.check(G.active()[0] == route, f"un groupe qui s'arrête ferme l'onglet : retour au parcours ({G.tabs()})")
    return run(args, "Scénario C (donjons 55-60) : proposés au niveau 55", prelude=ACCOUNT + char_db([route], 1, others_answered("donjons-fin")),
               before=at_route(route, 3823, "turnin", 50), after=after)


# ---------------------------------------------------------------------------------------------
# P: never worse than Polestar alone
# ---------------------------------------------------------------------------------------------
POLESTAR_LEVELS = {}


def polestar_levels(args):
    """The level at which Polestar's own dungeon card would come on its route (its rule, with every
    quest the route hands in up to that level done), against the level our chapter is first offered
    at (its first hook on the route, or its min when the hook comes earlier)."""
    import polestar_guides as pg
    guides = pg.load()
    route = pg.alliance_route(guides, "Human")
    table, _ = pg.greffe()
    events = []
    for gid, i, lv, step in route:
        if pg.is_dungeon_step(step):
            continue
        for goal in step["goals"]:
            if goal.get("t") == "turnin" and isinstance(goal.get("quest"), (int, float)):
                events.append((lv, int(goal["quest"])))
    ours, where = {}, {}
    for e in table:
        at = None
        for gid, i, lv, step in route:
            if pg.is_dungeon_step(step):
                continue
            if any((g.get("t") == "turnin" and g.get("quest") in e["turnin"]) or (g.get("t") in ("accept", "turnin") and g.get("quest") in e["accept"]) for g in step["goals"]):
                at = max(int(lv), e["min"])
                break
        if at is not None:
            for d in e["dungeon"]:
                if at < ours.get(d, 99):
                    ours[d], where[d] = at, e["key"]

    def after(L, G, ns, r):
        ns.Codex.Load()
        DT = ns.UI.DungeonToast
        r.check(L.eval("function(ns) return ns.GA.PolestarCandidates ~= nil and ns.UI.DungeonToast.Candidates == ns.GA.HeldCandidates end")(ns),
                "la règle des cartes de Polestar (UI.DungeonToast.Candidates) passe par le module")
        released = ns.GA.PolestarCandidates
        first = {}
        for lvl in range(10, 61):
            done = L.table()
            for lv, q in events:
                if lv <= lvl + 0.5:
                    done[q] = True
            L.globals().BENCH.completed = done
            L.globals().GREFFE.level = lvl
            ns.CharState().dungeonToastSeen = L.table()
            for c in cp.lua_list(released(lvl, "levelup")):
                first.setdefault(c.key, lvl)
        rows, late = [], []
        for d in sorted(ours, key=lambda k: ours[k]):
            p_, o_ = first.get(d), ours[d]
            rows.append(f"{d} ({where[d]}) : Polestar {p_ if p_ else 'aucune carte sur son parcours'}, nous {o_}")
            if p_ and o_ > p_:
                late.append(d)
        POLESTAR_LEVELS.update(first=first, ours=ours, where=where)
        r.say("Niveau de la première carte de Polestar sur son parcours, et de notre première proposition :")
        for x in rows:
            r.say(f"  - {x}")
        r.check(not late, f"jamais plus tard que la carte de Polestar ({late or 'aucun donjon en retard'})")
    return run(args, "Scénario P1 : niveaux des propositions, Polestar seul et avec nos chapitres",
               prelude=ACCOUNT + char_db(["forever/alliance/02-westfall"]), after=after)


def hook_passed(args):
    """A hook gone past without being done: Lonebrow's journal (1100) left on the way, the player
    further on the route; at the level-up where Polestar's own rule opens Razorfen Kraul (33), our
    chapter comes in its place."""
    route = "forever/alliance/30-40/04-stranglethorn-vale"

    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        G.levelUp(33)
        G.tick(2)
        G.clearOther()
        G.tick(2)
        c = G.card()
        shown = polestar_shown(G, ["razorfen-kraul"])
        r.say(f"Niveau 33 sur `{route}`, 1100 jamais rendue : carte « {c} » ; raison du Kraal : {ns.GA.GreffeWhy(G.entry('kraal'))} ; cartes de Polestar écartées :{G.dismissed or ' aucune'}.")
        r.check(c.startswith("greffe:kraal") and not shown, "notre chapitre du Kraal est proposé à la place de la carte de Polestar")
    return run(args, "Scénario P2 : accroche dépassée sans être faite", prelude=ACCOUNT + char_db([route], 1, others_answered("kraal")),
               before=set_level(32), after=after)


def hook_passed_open_later(args):
    """0.14.0 (review M1): the Kraal's hook passed without being done, and Polestar's own rule does not
    open Razorfen Kraul yet at this level; a hand-in in the same level opens it (a prerequisite of its
    page, played here by the rule's answer changing at the hand-in). The module must see it at once:
    the chapter comes back from "hook" without waiting for the next level. An answer that raised an
    error is not kept either. Polestar's rule is stood in for (GA.PolestarCandidates) to drive it."""
    route = "forever/alliance/30-40/04-stranglethorn-vale"

    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        ns.Codex.Load()
        L.globals().POLESTAR_NS = ns
        L.execute('''
            BENCH_OPEN, BENCH_FAIL, BENCH_CALLS = false, false, 0
            BENCH_REAL_CANDIDATES = POLESTAR_NS.GA.PolestarCandidates
            POLESTAR_NS.GA.PolestarCandidates = function(level, mode)
                BENCH_CALLS = BENCH_CALLS + 1
                if BENCH_FAIL then error("bench: a passing error") end
                if BENCH_OPEN then return { { key = "razorfen-kraul" } } end
                return {}
            end
        ''')
        h = G.entry("kraal")
        w1 = ns.GA.GreffeWhy(h, 32)
        r.say(f"Niveau 32, 1100 jamais rendue, la règle de Polestar n'ouvre pas encore le Kraal : raison « {w1} ».")
        r.check(w1 == "hook", "ni accroche ni donjon ouvert : pas de proposition")
        L.globals().BENCH_OPEN = True
        G.turnin(1069)  # a hand-in of the level (Deep Ocean, Vast Sea), the rule's answer changes with it
        G.tick(2)
        w2 = ns.GA.GreffeWhy(h, 32)
        r.say(f"Un rendu dans le même niveau, la règle ouvre maintenant le Kraal : raison « {w2} ».")
        r.check(w2 != "hook", "le rendu remet le calcul à jour : le chapitre n'attend plus le niveau suivant")
        calls = L.globals().BENCH_CALLS
        L.globals().BENCH_FAIL = True
        G.turnin(1070)
        ns.GA.GreffeWhy(h, 32)
        L.globals().BENCH_FAIL = False
        w3 = ns.GA.GreffeWhy(h, 32)
        r.say(f"Après une erreur de la règle, appels {calls} puis {L.globals().BENCH_CALLS}, raison « {w3} ».")
        r.check(w3 != "hook" and L.globals().BENCH_CALLS >= calls + 2, "une réponse en erreur n'est pas gardée : la suivante refait le calcul")
        ns.GA.PolestarCandidates = L.globals().BENCH_REAL_CANDIDATES
    return run(args, "Scénario P2b : accroche dépassée, donjon ouvert par un rendu du même niveau", prelude=ACCOUNT + char_db([route], 1, others_answered("kraal")),
               before=set_level(32), after=after)


def hook_ahead(args):
    """The hook still ahead on the route: the Deadmines at the level-up to 21 in Loch Modan, before
    The Defias Traitor (155): neither Polestar's card nor ours; ours at 155."""
    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        G.levelUp(21)
        G.tick(2)
        G.clearOther()
        G.tick(2)
        c = G.card()
        shown = polestar_shown(G, ["deadmines"])
        opened = G.polestarCard("deadmines", 21)[1]
        r.say(f"Niveau 21 avant 155 : carte « {c} » ; la règle de Polestar ouvre les Mortemines : {bool(opened)} ; raison : {ns.GA.GreffeWhy(G.entry('mortemines'))}.")
        r.check("greffe:mortemines" not in c and not shown, "l'accroche est devant : ni notre carte ni celle de Polestar")
        G.turnin(155)
        G.clearOther()
        G.tick(2)
        r.check(G.card().startswith("greffe:mortemines"), "notre chapitre au rendu de 155")
    return run(args, "Scénario P3 : accroche encore devant", prelude=ACCOUNT + char_db([ROUTE_DM], 1, others_answered("mortemines")), before=at_hook(ROUTE_DM, 155, 20), after=after)


def outlevelled(args):
    """A chapter outlevelled without ever being offered (Blackfathom Deeps, max 28, its hook never
    done): Polestar's own card for that dungeon is no longer held back, as without this pack."""
    route = "forever/alliance/06-wetlands"

    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        G.levelUp(29)
        G.tick(4)
        seen, n = [], 0
        CT = ns.UI.ClassToast
        while CT.current and n < 6:
            n += 1
            m = CT.current
            seen.append(("dungeon:" + str(m.dungeon)) if m.dungeon else ("greffe:" + str(m.greffe)) if m.greffe else "other")
            CT.Later()
            G.tick(3)
        r.say(f"Niveau 29, Brassenoire jamais proposé : cartes vues {seen or 'aucune'} ; raison : {ns.GA.GreffeWhy(G.entry('brassenoire'))}.")
        r.check(not ns.GA.GreffeHolds("blackfathom-deeps", 29), "le module ne retient plus la carte de Polestar pour Brassenoire")
        r.check("greffe:brassenoire" not in seen, "notre chapitre n'est pas proposé au-dessus de son maximum")
    return run(args, "Scénario P4 : chapitre dépassé sans avoir été proposé", prelude=ACCOUNT + char_db([route], 1, others_answered("brassenoire")),
               before=set_level(28), after=after)


def migration_chapter(args):
    """D: a character of 0.12.2 with an old chapter open (the Stockade, 08b-prison, same id since
    0.13.0) beside its retired zone guide: the chapter tab stays (with its new content), the zone
    guide's tab becomes Polestar's guide for the level; the chapter's end goes back to that tab."""
    h_ = HISTORIES["mig26"]
    done, log = history("mig26")
    done_lua = "{" + ",".join(f"[{q}]=true" for q in done) + "}"
    log_lua = "{" + ",".join(str(q) for q in log[-25:]) + "}"
    prelude = (ACCOUNT + char_db([h_["guide"], "groupe-alliance/08b-prison"], 2) +
               f"for q in pairs({done_lua}) do BENCH.completed[q] = true end\nGREFFE.log = {log_lua}\nGREFFE.level = {h_['level']}\n")

    def after(L, G, ns, r):
        G.tick(8)
        G.clearOther()
        tabs = G.tabs()
        gid, step, title = G.active()
        r.say(f"Historique : {h_['label']}, onglets sauvegardés `{h_['guide']}` et `groupe-alliance/08b-prison` (actif). "
              f"Après la connexion : {tabs} ; actif {gid}, étape {step} « {title} » ; carte « {G.card()} ».")
        r.check(gid == "groupe-alliance/08b-prison" and step is not None, "le chapitre de la Prison revient, actif, à une étape")
        r.check("forever/alliance/" in tabs and h_["guide"] not in tabs, "l'onglet du guide retiré tient le guide de Polestar du niveau")
        r.check("greffe:prison" not in G.card() and not G.polestarCard("stormwind-stockade", 26)[0], "ni notre carte ni celle de Polestar pour la Prison")
        G.finish("groupe-alliance/08b-prison")
        r.check(G.active()[0].startswith("forever/alliance/"), f"fin du chapitre : retour au guide de Polestar ({G.tabs()})")
    return run(args, "Scénario D : migration avec un chapitre ouvert (la Prison)", prelude=prelude, after=after)


def notes(args):
    """E: this pack's notes in "What's new", once per account, after Polestar's own."""
    spec2 = importlib.util.spec_from_file_location("notes_jeu", REPO / "tools" / "notes-jeu.py")
    nj = importlib.util.module_from_spec(spec2)
    spec2.loader.exec_module(nj)
    # The real notes of the pack's version (CHANGELOG.md, "### En jeu" / "### In game"), shown here
    # as version 0.13.0 whatever the version: the scenarios read that title.
    version = json.loads((REPO / "pack" / "pack.json").read_text(encoding="utf-8"))["version"]
    changelog = (REPO / "CHANGELOG.md").read_text(encoding="utf-8-sig")
    notes_src = nj.notes_lua(version, changelog).replace(f'"{version}"', '"0.13.0"')
    assert "GA.NOTES = nil" not in notes_src, f"CHANGELOG.md has no in-game notes for {version}"
    rows, bad = [], 0
    saved = {}
    # "Polestar's own notes seen": its newest notes' version (UI/WhatsNew.lua, NOTES[1]), and since
    # Polestar 0.4.3 the layout section they come with too (UI/LayoutCard.lua, PolestarDB.layoutCardSeen).
    wn_src = (REPO / "addons" / "Polestar" / "UI" / "WhatsNew.lua").read_text(encoding="utf-8")
    latest = re.search(r'^local NOTES = \{\s*\{\s*version = "([^"]+)"', wn_src, re.M).group(1)
    seen = f'whatsNewSeen = "{latest}", layoutCardSeen = 1'

    def before(L, G, ns):
        err = L.eval("function(src, ns) local f, e = loadstring(src, '@Notes.lua') if not f then return e end f('Polestar', ns) return nil end")(notes_src, ns)
        assert err is None, err

    def first(L, G, ns, r):
        G.tick(10)
        WN = ns.UI.WhatsNew
        title = WN.frame and WN.frame.Hero.Title.GetText(WN.frame.Hero.Title)
        r.say(f"Connexion (notes de Polestar déjà vues, les nôtres jamais) : fenêtre ouverte {bool(WN.IsShown())}, titre « {title} ».")
        r.check(bool(WN.IsShown()) and title and "Groupe Alliance 0.13.0" in title, "la fenêtre s'ouvre avec notre note, sous notre titre")
        heads = [str(n.Head.GetText(n.Head)) for n in cp.lua_list(WN.frame.Body.Notes) if n.Head]
        r.say(f"Notes affichées : {heads} ; pied : « {WN.frame.Site.GetText(WN.frame.Site)} ».")
        r.check(ns.DB().whatsNewSeen == WN.LATEST, f"le drapeau de Polestar ne bouge pas ({ns.DB().whatsNewSeen})")
        LC = ns.UI.LayoutCard
        r.check(not (LC and LC.IsShown and LC.IsShown()), "pas de choix de disposition de Polestar sous nos notes (0.14.0)")
        WN.Hide()
        G.tick(2)
        saved["db"] = to_py(ns.DB().groupeAlliance)
        r.check(saved["db"].get("notesSeen") == "0.13.0", f"vue pour ce compte : groupeAlliance.notesSeen = {saved['db'].get('notesSeen')}")
    lines, b = run(args, "Scénario E1 : nos notes de version, première connexion", before=before, after=first,
                   prelude='PolestarDB = { welcomeSeen = 1, ' + seen + ', groupeAlliance = { autoTold = true } }\n' + char_db([ROUTE_DM]))
    rows += lines
    bad += b

    def second(L, G, ns, r):
        G.tick(10)
        WN = ns.UI.WhatsNew
        r.check(not WN.IsShown(), "connexion suivante, même compte : la fenêtre ne s'ouvre plus")
    lines, b = run(args, "Scénario E2 : connexion suivante", before=before, after=second,
                   prelude=f'PolestarDB = {{ welcomeSeen = 1, {seen}, groupeAlliance = {lua_literal(saved.get("db", {}))} }}\n' + char_db([ROUTE_DM]))
    rows += lines
    bad += b

    def both(L, G, ns, r):
        G.tick(10)
        WN = ns.UI.WhatsNew
        t1 = WN.frame and WN.frame.Hero.Title.GetText(WN.frame.Hero.Title)
        r.say(f"Polestar a aussi changé de version (drapeau 0.3.7) : d'abord « {t1} ».")
        r.check(bool(WN.IsShown()) and "Groupe Alliance" not in str(t1), "les notes de Polestar s'ouvrent d'abord, sous leur titre")
        LC = ns.UI.LayoutCard
        offered = bool(LC and LC.Offered and LC.Offered())
        shown1 = bool(LC and LC.IsShown and LC.IsShown())
        r.say(f"Choix de disposition (Atlas ou Standard) offert : {offered} ; affiché sous les notes de Polestar : {shown1}.")
        r.check(shown1 == offered, "sous les notes de Polestar, le choix de disposition est là quand Polestar l'offre")
        WN.Hide()
        G.tick(10)
        t2 = WN.frame.Hero.Title.GetText(WN.frame.Hero.Title)
        r.say(f"Fermées : puis « {t2} » ; drapeau de Polestar {ns.DB().whatsNewSeen}.")
        r.check(bool(WN.IsShown()) and "Groupe Alliance" in str(t2), "puis les nôtres, une fois les siennes fermées")
        r.check(not (LC and LC.IsShown and LC.IsShown()), "pas de choix de disposition sous nos notes")
        r.check(ns.DB().whatsNewSeen == WN.LATEST, "les notes de Polestar restent marquées vues")
    lines, b = run(args, "Scénario E3 : Polestar et notre paquet changent ensemble", before=before, after=both,
                   prelude='PolestarDB = { welcomeSeen = 1, whatsNewSeen = "0.3.7", groupeAlliance = { autoTold = true } }\n' + char_db([ROUTE_DM]))
    rows += lines
    bad += b

    def english_notes(L, G, ns, r):
        G.tick(10)
        WN = ns.UI.WhatsNew
        title = WN.frame and WN.frame.Hero.Title.GetText(WN.frame.Hero.Title)
        r.check(bool(WN.IsShown()) and "Group Alliance 0.13.0" in str(title), f"client anglais : titre et notes en anglais (« {title} »)")
    lines, b = run(args, "Scénario E4 : client anglais", locale="enUS", before=before, after=english_notes,
                   prelude='PolestarDB = { welcomeSeen = 1, ' + seen + ', groupeAlliance = { autoTold = true } }\n' + char_db([ROUTE_DM]))
    rows += lines
    bad += b
    return rows, bad


# ---------------------------------------------------------------------------------------------
# Corrections of the two reviews (0.13.0): steps that hold, the chapter's end, the stop, the faction,
# /ga donjon, the cases the bench did not cover
# ---------------------------------------------------------------------------------------------
CHAPTER_PRISON = "groupe-alliance/08b-prison"
CHAPTER_GNOME = "groupe-alliance/10b-gnomeregan"


def first(x):
    """The first value of what a Lua function returned (lupa gives a tuple for several)."""
    return x[0] if isinstance(x, tuple) else x


def open_chapter(route, cid, extra_tabs=()):
    """Before login: the chapter open in a tab beside the route's, the route's tab remembered."""
    return char_db([route, *extra_tabs, cid], 2 + len(extra_tabs),
                   f', gaGreffe = {{ answers = {{}}, from = {{ ["{cid}"] = "{route}" }} }}')


def step_holds(args):
    """B1: a step whose goals were all optional is now shown and holds: the Stockade's Warden Thelwater
    step for Bazil Thredd (389 handed in, 391 taken; passed at once before), and Gnomeregan's group
    question for the two Dalaran quests (never asked before)."""
    route = "forever/alliance/06-wetlands"

    def before(L, G, ns):
        L.globals().GREFFE.level = 30
        G.addLog(389)

    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        gid = G.active()[0]
        G.accept(387)
        G.tick(4)
        i, title = G.live()
        g = ns.Guides.Get(CHAPTER_PRISON)
        want = next(s for s, st in enumerate(cp.lua_list(g.steps), 1) if any(x.t == "turnin" and x.quest == 389 for x in cp.lua_list(st.goals)))
        r.say(f"La Prison ouverte avec 389 dans le journal, 387 prise : actif {gid}, étape vivante {i} « {title} » (l'étape qui rend 389 : {want}).")
        r.check(gid == CHAPTER_PRISON and i == want, "l'étape du gardien Thelwater pour Bazil Thredd (rendu de 389, prise de 391) est affichée et retient le guide")
        G.accept(388)
        G.tick(2)
        i2, title2 = G.live()
        r.check(i2 == i, f"elle retient tant que 389 n'est pas rendue (toujours l'étape {i2} « {title2} »)")
        G.turnin(389)
        G.accept(391)
        G.tick(4)
        i3, title3 = G.live()
        r.check(i3 is not None and i3 > i, f"389 rendue et 391 prise : le guide passe à la suite (étape {i3} « {title3} »)")
    lines, bad = run(args, "Scénario B1a : une étape qui n'avait que des objectifs facultatifs est affichée (Prison)",
                     prelude=ACCOUNT + open_chapter(route, CHAPTER_PRISON) , before=before, after=after)

    def after2(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        G.accept(2928)
        G.tick(4)
        i, title = G.live()
        q = first(ns.Engine.GroupQuestion())
        r.say(f"Gnomeregan ouvert, 2928 prise : étape vivante {i} « {title} » ; question de groupe posée : {q}.")
        r.check(q == 92456 and i == 2, "la question de groupe des deux quêtes de Dalaran est posée à l'étape 2 (elle était passée d'office)")
        ns.Engine.AnswerGroup(92456, "do")
        G.tick(4)
        i2, _ = G.live()
        r.check(i2 == 2, f"« La faire en groupe » : l'étape retient jusqu'aux deux prises (étape {i2})")
        G.accept(92456)
        G.accept(92489)
        G.tick(4)
        i3, title3 = G.live()
        r.check(i3 is not None and i3 > 2, f"les deux quêtes prises : la suite ({i3} « {title3} »)")
    lines2, bad2 = run(args, "Scénario B1b : la question de groupe de Gnomeregan est posée",
                       prelude=ACCOUNT + open_chapter(route, CHAPTER_GNOME), before=set_level(31), after=after2)
    return lines + lines2, bad + bad2


def group_skipped_end(args):
    """B1 and A2: Gnomeregan with its two group questions answered "Skip it" (Dalaran's quests, the
    Green Glow detour), Gnogaine in the log but not finished, then its end hand-ins: the tab closes. A
    conditional hand-in ready in the log (Essential Artificials) holds it until handed in."""
    route = "forever/alliance/06-wetlands"

    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        fin = cp.lua_list(ns.GA.ChapterFin(CHAPTER_GNOME))
        r.say(f"Fin de Gnomeregan (GreffeData.lua) : {fin} ; autres rendus : {cp.lua_list(ns.GA.ChapterOthers(CHAPTER_GNOME))}.")
        r.check(not ({2926, 2962, 2930, 2924, 2947} & set(fin)), "la fin ne compte aucun rendu conditionnel (Gnogaine, Green Glow, Data Rescue, Essential Artificials, Return of the Ring)")
        G.accept(2928)
        G.tick(2)
        asked = []
        q = first(ns.Engine.GroupQuestion())
        if q:
            asked.append(q)
            ns.Engine.AnswerGroup(q, "skip")
            G.tick(2)
        for x in (2929, 2930, 2922, 2927, 2924):
            G.accept(x)
        G.turnin(2927)
        G.accept(2926)
        # Gnogaine and Data Rescue taken but not finished (no phial filled, a punch card missed)
        L.globals().GREFFE.notReady[2926] = True
        L.globals().GREFFE.notReady[2930] = True
        G.tick(2)
        r.say(f"Questions de groupe passées : {asked} ; journal : {cp.lua_list(L.globals().GREFFE.log)}.")
        r.check(92456 in asked and 92489 not in cp.lua_list(L.globals().GREFFE.log), "« La passer » à la question de Dalaran : ses quêtes ne sont pas prises")
        for x in (2929, 2922, 2928):
            G.turnin(x)
        G.tick(6)
        r.check(CHAPTER_GNOME in G.tabs(), f"rendus de la fin faits, Essential Artificials (conditionnelle) prête dans le journal : l'onglet attend son rendu ({G.tabs()})")
        G.turnin(2924)
        G.tick(6)
        r.say(f"2924 rendue, 2926 (Gnogaine) toujours dans le journal, pas finie : onglets {G.tabs()} ; actif {G.active()[0]} ; réponses {G.answers()}.")
        r.check(CHAPTER_GNOME not in G.tabs() and G.active()[0] == route, "l'onglet se ferme : ce que le joueur pouvait faire est fait, le parcours revient")
    return run(args, "Scénario B1c : quête de groupe passée, l'onglet se ferme quand même (Gnomeregan)",
               prelude=ACCOUNT + open_chapter(route, CHAPTER_GNOME), before=set_level(31), after=after)


def no_key_end(args):
    """No key: the second Zul'Farrak run answered "Skip it" (nobody has the mallet) closes its tab; the
    55-60 dungeons with their five questions skipped close theirs."""
    rows, bad = [], 0
    for cid, route, level, label in (("groupe-alliance/zul-farrak-2", "forever/alliance/40-50/07-un-goro-crater", 49, "Zul'Farrak, second passage, sans le marteau"),
                                     ("groupe-alliance/33-donjons-fin", "forever/alliance/50-60/03-winterspring", 55, "donjons 55-60, les cinq questions passées")):
        def after(L, G, ns, r, cid=cid, route=route):
            L.execute('BENCH_COMPLETED = ""')
            ns.On("GUIDE_COMPLETED", L.eval('function(id) BENCH_COMPLETED = BENCH_COMPLETED .. " " .. tostring(id) end'))
            G.tick(6)
            G.clearOther()
            asked = []
            for _ in range(8):
                q = first(ns.Engine.GroupQuestion())
                if not q or G.active()[0] != cid:
                    break
                asked.append(q)
                ns.Engine.AnswerGroup(q, "skip")
                G.tick(4)
            G.tick(6)
            fired = str(L.globals().BENCH_COMPLETED).split()
            r.check(asked and cid in fired, f"tout passé ({asked}) : Polestar déclare le guide du chapitre fini (GUIDE_COMPLETED : {fired or 'non'})")
            if cid in G.tabs():
                # The fake game drops a timer set by a timer (BENCH.RunTimers): Polestar sends the
                # message from its own timed evaluation, and the module closes the tab a frame later.
                # Handed on again here, as that next frame.
                ns.Fire("GUIDE_COMPLETED", cid)
                G.tick(4)
            r.say(f"Questions passées : {asked} ; onglets {G.tabs()} ; actif {G.active()[0]} ; réponses {G.answers()}.")
            r.check(cid not in G.tabs() and G.active()[0] == route, "l'onglet du chapitre se ferme, le parcours revient")
        lines, b = run(args, f"Scénario B1d : {label}", prelude=ACCOUNT + open_chapter(route, cid), before=set_level(level), after=after)
        rows += lines
        bad += b
    return rows, bad


def stop_first(args):
    """B2: the card waits for the end of the route's stop: the Ruins at Auberdine (Tharnariun's Hope
    is the first of seven goals there), offered once the stop's last hand-in is done."""
    route, q, kind, level, done = CHAPTERS["ruines"]

    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        G.turnin(q)
        G.tick(4)
        G.clearOther()
        mid = G.card()
        why = ns.GA.GreffeWhy(G.entry("ruines"))
        r.say(f"{q} rendue, le reste de l'arrêt d'Auberdine encore à faire : carte « {mid} » ; raison : {why} ({ns.GA.GreffeReason(G.entry('ruines'))}).")
        r.check("greffe:ruines" not in mid and why == "stop", "la carte attend la fin de l'arrêt")
        G.finishStop()
        G.clearOther()
        G.tick(2)
        r.check(G.card().startswith("greffe:ruines"), f"l'arrêt fini, la carte vient (« {G.card()} » ; étape vivante {G.live()[0]} « {G.live()[1]} »)")
    return run(args, "Scénario B2 : la carte attend la fin de l'arrêt du parcours (Ruines à Auberdine)",
               prelude=ACCOUNT + char_db([route], 1, others_answered("ruines", level=level)), before=at_route(route, q, kind, level, done), after=after)


def horde(args):
    """A1: a Horde character on the same account, in the Deadmines' range: never offered a chapter,
    Polestar's own dungeon cards left whole."""
    prelude = 'UnitRace = function() return "Orc", "Orc", 2 end\nUnitFactionGroup = function() return "Horde", "Horde" end\n'

    def after(L, G, ns, r):
        G.tick(6)
        for lv in (21, 22):
            G.levelUp(lv)
            G.tick(2)
        due = [h.key for h in cp.lua_list(ns.GA.GreffeDue(22))]
        why = ns.GA.GreffeWhy(G.entry("mortemines"), 22)
        held = [k for k in ("deadmines", "blackfathom-deeps", "stormwind-stockade") if ns.GA.GreffeHolds(k, 22)]
        seen = (G.dismissed or "") + " " + G.card()
        r.say(f"Personnage orc niveau 22 : chapitres dus {due or 'aucun'} ; raison (Mortemines) : {why} ; cartes vues : {seen.strip() or 'aucune'} ; cartes de Polestar retenues : {held or 'aucune'}.")
        r.check(not due and why == "faction" and "greffe:" not in seen, "aucun chapitre de l'Alliance proposé")
        r.check(not held, "aucune carte de donjon de Polestar retenue par le module")
    return run(args, "Scénario A1 : personnage de la Horde", prelude=prelude + ACCOUNT + char_db(["forever/horde/orc/01-durotar"]), before=set_level(20), after=after)


def busy_and_tabs(args):
    """A10 and A5: never in combat nor in an instance; six tabs open: the card stays, a clear line in
    the chat; the Codex not loaded at login (only a level-up loads it): the hook offers all the same."""
    rows, bad = [], 0

    def after(L, G, ns, r):
        g = L.globals()
        G.tick(6)
        G.clearOther()
        loaded = ns.Codex.IsLoaded()
        g.BENCH.combat = True
        G.turnin(155)
        G.tick(4)
        in_combat = G.card()
        g.BENCH.combat = False
        L.execute('IsInInstance = function() return true, "party" end')
        g.BENCH.Fire("PLAYER_REGEN_ENABLED")
        G.tick(4)
        in_instance = G.card()
        L.execute('IsInInstance = function() return false, "none" end')
        g.BENCH.Fire("PLAYER_REGEN_ENABLED")
        G.tick(4)
        G.clearOther()
        G.tick(2)
        out = G.card()
        r.say(f"Codex chargé à la connexion : {bool(loaded)} ; 155 rendue en combat : carte « {in_combat} » ; fin du combat dans une instance : « {in_instance} » ; dehors : « {out} ».")
        r.check(not loaded, "le Codex n'est pas chargé à la connexion (seul un passage de niveau le charge, comme en jeu)")
        r.check("greffe:" not in in_combat and "greffe:" not in in_instance, "jamais en combat, jamais en instance")
        r.check(out.startswith("greffe:mortemines"), "hors combat et hors instance, la carte vient, sans le Codex")
    lines, b = run(args, "Scénario A10a : combat, instance, Codex non chargé", prelude=ACCOUNT + char_db([ROUTE_DM]), before=at_hook(ROUTE_DM, 155, 20), after=after,
                   exclude=("Polestar_Codex",))
    rows += lines
    bad += b

    six = [ROUTE_DM, "forever/alliance/02-westfall", "forever/alliance/03-darkshore", "forever/alliance/04-redridge-mountains",
           "forever/alliance/05-duskwood", "forever/alliance/06-wetlands"]

    def after6(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        G.turnin(155)
        G.clearOther()
        G.tick(2)
        n0 = len(cp.lua_list(L.globals().BENCH.printed))
        ok = ns.UI.ClassToast.Act()
        G.tick(2)
        said = cp.lua_list(G.printed(n0 + 1))
        r.say(f"Six onglets : {G.tabs()} ; « Ouvrir le chapitre » : {ok} ; carte « {G.card()} » ; chat : {' / '.join(str(x) for x in said) or '(rien)'}.")
        r.check(not ok and G.card().startswith("greffe:mortemines"), "six onglets : le chapitre ne s'ouvre pas, la carte reste")
        r.check(any("six onglets" in str(x) and "Fermer un onglet" in str(x) for x in said), "une ligne claire dans le chat dit quoi faire")
        E = ns.Engine
        E.CloseTab(6)
        G.tick(2)
        ok2 = ns.UI.ClassToast.Act()
        G.tick(4)
        r.check(ok2 and G.active()[0] == CHAPTER_DM, f"un onglet fermé, la même carte ouvre le chapitre ({G.tabs()})")
    lines, b = run(args, "Scénario A5 : six onglets ouverts", prelude=ACCOUNT + char_db(six, 1), before=at_hook(ROUTE_DM, 155, 20), after=after6)
    rows += lines
    bad += b
    return rows, bad


def background_close(args):
    """A4: a chapter's tab closed while another tab is on screen: the player's tab stays."""
    route = ROUTE_DM
    other = "forever/alliance/04-redridge-mountains"

    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        E = ns.Engine
        tabs = cp.lua_list(E.GetTabs()[0])
        idx_other = next(i for i, t in enumerate(tabs, 1) if t.guideId == other)
        E.SelectTab(idx_other)
        G.tick(2)
        idx = next(i for i, t in enumerate(cp.lua_list(E.GetTabs()[0]), 1) if t.guideId == CHAPTER_DM)
        E.CloseTab(idx)
        G.tick(4)
        r.say(f"Onglet du chapitre fermé pendant que `{other}` est affiché : onglets {G.tabs()} ; actif {G.active()[0]}.")
        r.check(G.active()[0] == other and CHAPTER_DM not in G.tabs(), "l'onglet affiché reste affiché (le parcours n'est pas sélectionné à sa place)")
    return run(args, "Scénario A4 : onglet de chapitre fermé en arrière-plan",
               prelude=ACCOUNT + char_db([route, other, CHAPTER_DM], 3, f', gaGreffe = {{ answers = {{ mortemines = {{ a = "open", level = 20 }} }}, from = {{ ["{CHAPTER_DM}"] = "{route}" }} }}'),
               before=at_hook(ROUTE_DM, 155, 20), after=after)


def slash_again(args):
    """B6: /ga donjon brings back a chapter declined with "Not for me", says why none is due in the
    client's language; a "Later" given at the top of the range lets Polestar's card through above it."""
    rows, bad = [], 0

    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        G.turnin(155)
        G.clearOther()
        G.tick(2)
        ns.UI.ClassToast.Off()
        G.tick(2)
        ns.GA.GreffeSlash()
        G.tick(2)
        r.check(G.card().startswith("greffe:mortemines"), f"« Pas pour moi », puis /ga donjon : la carte revient (« {G.card()} »)")
        ns.UI.ClassToast.Later()
        G.tick(2)
        L.globals().GREFFE.level = 30
        n0 = len(cp.lua_list(L.globals().BENCH.printed))
        ns.GA.GreffeSlash()
        said = [str(x) for x in cp.lua_list(G.printed(n0 + 1))]
        r.say("/ga donjon au niveau 30 : " + " / ".join(said[:5]) + " …")
        r.check(any("dépassé (proposé jusqu'au niveau 24)" in x for x in said) and any("/polestar guides" in x for x in said),
                "les raisons sont lisibles en français (« dépassé… ») et la ligne dit où retrouver un chapitre")
        r.check(not any(x.endswith(": above") or x.endswith(": hook") or x.endswith(": no") for x in said), "plus aucun code brut (above, hook, no)")
    lines, b = run(args, "Scénario B6a : /ga donjon après « Pas pour moi », raisons en français", prelude=ACCOUNT + char_db([ROUTE_DM]),
                   before=at_hook(ROUTE_DM, 155, 20), after=after)
    rows += lines
    bad += b

    def after_en(L, G, ns, r):
        G.tick(6)
        n0 = len(cp.lua_list(L.globals().BENCH.printed))
        ns.GA.GreffeSlash()
        said = [str(x) for x in cp.lua_list(G.printed(n0 + 1))]
        r.say("/ga dungeon, client anglais : " + " / ".join(said[:4]) + " …")
        r.check(any("not at its stop of the route yet" in x or "from level" in x for x in said) and any("/polestar guides" in x for x in said), "les raisons en anglais sur un client anglais")
    lines, b = run(args, "Scénario B6b : /ga dungeon, client anglais", locale="enUS", prelude=ACCOUNT + char_db([ROUTE_DM]), before=at_hook(ROUTE_DM, 155, 20), after=after_en)
    rows += lines
    bad += b

    def after_max(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        held24 = ns.GA.GreffeHolds("deadmines", 24)
        held25 = ns.GA.GreffeHolds("deadmines", 25)
        r.say(f"« Plus tard » au niveau 24 (maximum des Mortemines) : carte de Polestar retenue à 24 : {held24} ; à 25 : {held25} ; raison à 25 : {ns.GA.GreffeWhy(G.entry('mortemines'), 25)}.")
        r.check(held24 and not held25, "au-dessus du maximum, la carte de Polestar n'est plus retenue après « Plus tard »")
    lines, b = run(args, "Scénario B6c : « Plus tard » au dernier niveau de la fourchette",
                   prelude=ACCOUNT + char_db([ROUTE_DM], 1, ', gaGreffe = { answers = { mortemines = { a = "later", level = 24 } } }'), before=set_level(24), after=after_max)
    rows += lines
    bad += b
    return rows, bad


def finished_before(args):
    """A3: a chapter of 0.12.x finished to its end under the same id (Polestar's saved guideDone):
    not offered again."""
    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        G.turnin(155)
        G.clearOther()
        G.tick(2)
        why = ns.GA.GreffeWhy(G.entry("mortemines"))
        r.check("greffe:mortemines" not in G.card() and why == "done", f"chapitre fini en 0.12 (guideDone) : pas reproposé (raison : {why}, carte : {G.card()})")
    return run(args, "Scénario A3 : chapitre fini avant la 0.13", prelude=ACCOUNT + char_db([ROUTE_DM], 1, f', guideDone = {{ ["{CHAPTER_DM}"] = true }}'),
               before=at_hook(ROUTE_DM, 155, 20), after=after)


LATE_TURNIN = r'''
return function(G, q)
	-- Handed in, but the game's completed flag not set yet (BENCH.completed left alone).
	G.dropLog(q)
	BENCH.Fire("QUEST_TURNED_IN", q, 1000, 0)
	BENCH.Fire("QUEST_REMOVED", q)
	BENCH.Fire("QUEST_LOG_UPDATE")
	G.tick()
end
'''


def late_flag_end(args):
    """R4: the chapter's last end hand-in made while the game's completed flag is not set yet when the
    module looks (it can come late, Polestar's Core/Engine.lua says so and keeps its own list): the
    tab closes all the same, on the session's hand-ins."""
    fin = (166, 214, 373, 168, 167)

    def before(L, G, ns):
        L.globals().GREFFE.level = 21

    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        for q in fin[:-1]:
            G.accept(q)
            G.turnin(q)
        G.accept(fin[-1])
        G.tick(2)
        r.check(CHAPTER_DM in G.tabs(), f"avant le dernier rendu de la fin ({fin[-1]}), l'onglet des Mortemines est ouvert : {G.tabs()}")
        n = len(cp.lua_list(L.globals().BENCH.printed))
        L.execute(LATE_TURNIN)(G, fin[-1])
        G.tick(4)
        flag = bool(L.globals().BENCH.completed[fin[-1]])
        said = " | ".join(str(x) for x in cp.lua_list(G.printed(n + 1)))
        r.say(f"{fin[-1]} rendue, drapeau « quête rendue » du jeu encore absent ({flag}) : onglets {G.tabs()} ; actif {G.active()[0]} ; chat : {said}")
        r.check(not flag and CHAPTER_DM not in G.tabs() and G.active()[0] == ROUTE_DM and "terminé" in said,
                "l'onglet se ferme sans attendre le drapeau du jeu (rendus de la session), le parcours revient, « chapitre terminé »")
    return run(args, "Scénario R4 : fin du chapitre avant le drapeau « quête rendue » du jeu (Mortemines)",
               prelude=ACCOUNT + open_chapter(ROUTE_DM, CHAPTER_DM), before=before, after=after)


def reopened_finished(args):
    """R5: a chapter already finished, opened again by the player from the guide list: a hand-in of
    another quest leaves it open; a hand-in of its own (a conditional one left) still closes it."""
    fin = (166, 214, 373, 168, 167)
    other = 2040  # Underground Assault (Shoni the Shilent): a hand-in of the chapter outside its `fin`
    stranger = 109  # Report to Gryan Stoutmantle: no hand-in of this chapter

    def before(L, G, ns):
        L.globals().GREFFE.level = 22
        for q in fin:
            L.globals().BENCH.completed[q] = True
        G.addLog(stranger)

    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        r.check(CHAPTER_DM in G.tabs(), f"chapitre fini rouvert depuis la liste des guides : onglets {G.tabs()}")
        n = len(cp.lua_list(L.globals().BENCH.printed))
        G.turnin(stranger)
        G.tick(4)
        said = " | ".join(str(x) for x in cp.lua_list(G.printed(n + 1)))
        r.say(f"Rendu d'une quête sans rapport ({stranger}) : onglets {G.tabs()} ; chat : {said or '-'}")
        r.check(CHAPTER_DM in G.tabs() and "terminé" not in said, "un rendu sans rapport ne referme pas le chapitre rouvert, aucun « chapitre terminé »")
        G.accept(other)
        G.turnin(other)
        G.tick(4)
        said = " | ".join(str(x) for x in cp.lua_list(G.printed(n + 1)))
        r.say(f"Rendu d'une quête du chapitre ({other}), sa fin déjà faite : onglets {G.tabs()} ; chat : {said}")
        r.check(CHAPTER_DM not in G.tabs(), "un rendu du chapitre le referme, comme avant")
    return run(args, "Scénario R5 : chapitre fini rouvert depuis la liste (Mortemines)",
               prelude=ACCOUNT + char_db([ROUTE_DM, CHAPTER_DM], 2, ', gaGreffe = { answers = { mortemines = { a = "done", level = 21 } }, from = {} }'),
               before=before, after=after)


# ---------------------------------------------------------------------------------------------
# T (0.14.1): this module's lines in the tooltip of a guide line, hovered through Polestar's own
# code (the row's OnEnter in UI/GuideFrame.lua). Polestar 0.4.3 shows an item line's tooltip with
# Widgets.ItemTip (the game's item tooltip, the guide's lines in its `extra`) instead of
# Widgets.Tooltip, which the module hooked alone: the tip, the hint and the Ctrl-click were lost on
# those lines. Then the tooltip set again when the item's data arrives (GET_ITEM_INFO_RECEIVED).
# ---------------------------------------------------------------------------------------------
TIP_LIB = r'''
-- The rows of the guide window on screen (Polestar's goal rows carry their goal as psGoal).
function G.rows()
	local out = {}
	for _, f in ipairs(BENCH.frames) do
		local goal = rawget(f, "psGoal")
		if type(goal) == "table" and f.__shown and f.__scripts.OnEnter then out[#out + 1] = f end
	end
	return out
end
-- The first step of the active guide with a line of each kind that has a tip of ours: an item
-- line (Polestar's subjectKind "item": shown with Widgets.ItemTip) and a line without an item.
function G.tipSteps()
	local E, GA = G.ns.Engine, G.ns.GA
	local g = E.GetGuide()
	local item, plain
	for i = 1, #g.steps do
		if item and plain then break end
		E.Goto(i)
		G.tick(1)
		for _, f in ipairs(G.rows()) do
			local goal = f.psGoal
			if GA.TipOf(goal) then
				if goal.item and goal.subjectKind == "item" and not item then item = { step = i, quest = goal.quest, item = goal.item, t = goal.t }
				elseif not goal.item and not plain then plain = { step = i, quest = goal.quest, t = goal.t } end
			end
		end
	end
	return item, plain
end
-- Shows step `want.step` and returns its row for that goal.
function G.rowFor(want)
	G.ns.Engine.Goto(want.step)
	G.tick(1)
	for _, f in ipairs(G.rows()) do
		local goal = f.psGoal
		if goal.quest == want.quest and goal.t == want.t and goal.item == want.item then return f end
	end
end
function G.tipLines() local out = {} for i, l in ipairs(GameTooltip.__lines) do out[i] = tostring(l) end return out end
function G.count(lines, text) local n = 0 for _, l in ipairs(lines) do if l:find(text, 1, true) then n = n + 1 end end return n end
-- The tip line as the module writes it, in French.
function G.tipText(row) local t = G.ns.GA.TipOf(row.psGoal) return t and ("Astuce : " .. (t.frFR or t.enUS)) end
-- A Ctrl-click on the row: the link Polestar's copy window gets, or nil.
function G.ctrlClick(row)
	local UI, copied = G.ns.UI, nil
	local show, ctrl = UI.ShowCopy, IsControlKeyDown
	UI.ShowCopy = function(_, link) copied = link end
	IsControlKeyDown = function() return true end
	BENCH.Run(row, "OnClick", "LeftButton")
	UI.ShowCopy, IsControlKeyDown = show, ctrl
	return copied
end
'''


def guide_tooltips(args):
    """T: our lines in a guide line's tooltip, through the row's own OnEnter, item line and other line."""
    def after(L, G, ns, r):
        L.execute(TIP_LIB)
        G.tick(6)
        hint = "Ctrl+clic : lien Wowhead"
        item, plain = G.tipSteps()
        r.say(f"Guide de Polestar `{ROUTE_DM}` : ligne à objet avec astuce {to_py(item)} ; ligne sans objet avec astuce {to_py(plain)}.")
        r.check(item is not None and plain is not None, "le guide a une ligne de chaque sorte, avec une astuce du module")
        if item is None or plain is None:
            return
        # The item line first, on a row hovered for the first time (its Ctrl-click not hooked yet).
        row = G.rowFor(item)
        r.check(row is not None, f"la ligne à objet est à l'écran (étape {item.step})")
        if row is None:
            return
        tip = G.tipText(row)
        L.globals().BENCH.Run(row, "OnEnter")
        lines = cp.lua_list(G.tipLines())
        r.say(f"Survol de la ligne à objet (quête {item.quest}, objet {item.item}) : {len(lines)} lignes : {' / '.join(lines)}")
        r.check(G.count(G.tipLines(), "(game line)") == 1, "la ligne à objet montre l'infobulle d'objet du jeu (Widgets.ItemTip, Polestar 0.4.3)")
        r.check(G.count(G.tipLines(), tip) == 1, f"l'astuce est dans l'infobulle, une fois (« {tip[:60]}... »)")
        r.check(G.count(G.tipLines(), hint) == 1, "l'indice Ctrl+clic est dans l'infobulle, une fois")
        link = G.ctrlClick(row)
        r.check(link is not None and f"/fr/quest={item.quest}" in str(link), f"Ctrl+clic sur la ligne à objet : lien Wowhead ({link})")
        # The game's item data arrives: Polestar sets the tooltip again (Theme/Widgets.lua, `arrived`).
        L.globals().GameTooltip.AddLine(L.globals().GameTooltip, "(bench mark)")
        L.globals().BENCH.Fire("GET_ITEM_INFO_RECEIVED", item.item, True)
        lines = cp.lua_list(G.tipLines())
        r.say(f"GET_ITEM_INFO_RECEIVED {item.item} : {len(lines)} lignes : {' / '.join(lines)}")
        r.check(G.count(G.tipLines(), "(bench mark)") == 0 and G.count(G.tipLines(), "(game line)") == 1, "l'infobulle est bien reposée par Polestar")
        r.check(G.count(G.tipLines(), tip) == 1 and G.count(G.tipLines(), hint) == 1, "après le repos : l'astuce et l'indice reviennent, une fois chacun")
        # The line without an item: Widgets.Tooltip, as before.
        L.globals().GameTooltip.Hide(L.globals().GameTooltip)
        row2 = G.rowFor(plain)
        r.check(row2 is not None, f"la ligne sans objet est à l'écran (étape {plain.step})")
        if row2 is None:
            return
        tip2 = G.tipText(row2)
        L.globals().BENCH.Run(row2, "OnEnter")
        lines = cp.lua_list(G.tipLines())
        r.say(f"Survol de la ligne sans objet (quête {plain.quest}, {plain.t}) : {len(lines)} lignes : {' / '.join(lines)}")
        r.check(G.count(G.tipLines(), tip2) == 1 and G.count(G.tipLines(), hint) == 1, "ligne sans objet : l'astuce et l'indice, une fois chacun")
        link = G.ctrlClick(row2)
        r.check(link is not None and f"/fr/quest={plain.quest}" in str(link), f"Ctrl+clic sur la ligne sans objet : lien Wowhead ({link})")
        # Another owner of Widgets.ItemTip (a reward or loot tile: no psGoal) keeps Polestar's lines only.
        tile = L.eval('function() local f = CreateFrame("Button") return f end')()
        L.execute('GBENCH_EXTRA = function(tip) tip:AddLine("(tile extra)") end')
        ns.Widgets.ItemTip(tile, item.item, L.globals().GBENCH_EXTRA)
        lines = cp.lua_list(G.tipLines())
        r.check(G.count(G.tipLines(), "(tile extra)") == 1 and G.count(G.tipLines(), hint) == 0 and G.count(G.tipLines(), "Astuce") == 0,
                f"une tuile d'objet sans ligne du guide (Widgets.ItemTip ailleurs) : rien du module ({' / '.join(lines)})")
    return run(args, "Scénario T : nos lignes dans l'infobulle d'une ligne du guide, survolée par le code de Polestar (0.14.1)",
               prelude=ACCOUNT + char_db([ROUTE_DM]), after=after)


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--ui", type=pathlib.Path, required=True)
    ap.add_argument("--strings", type=pathlib.Path, required=True)
    ap.add_argument("--bascule", type=pathlib.Path)
    ap.add_argument("--report", type=pathlib.Path)
    ap.add_argument("--only")
    args = ap.parse_args()
    sys.stdout.reconfigure(encoding="utf-8")
    cp.LOCALE = "frFR"
    out, bad = ["# Banc de la greffe", ""], 0
    todo = [("proposal", proposal), ("close", close_tab), ("refuse", refuse), ("edges", edge_cases), ("reload", reload_mid),
            ("late", late_chapter), ("sync", synced), ("french", french), ("english", english)]
    todo += [(f"c-{k}", (lambda k: lambda a: chapter_scenario(a, k))(k)) for k in CHAPTERS]
    todo += [("c-meeting", meeting_card), ("c-ruins", ruins_left_open),
             ("c-prison-gnome", lambda a: two_due(a, "Prison et Gnomeregan dus ensemble : la Prison d'abord",
                                                  "forever/alliance/06-wetlands", 293, 31, "prison", "gnomeregan", done=(95647,))),
             ("c-dalaran2", dalaran_second), ("c-optional", optional_handins),
             ("c-sm-rfd", lambda a: two_due(a, "Monastère puis Souilles, tous deux reportés à 43", ROUTE_SM, 1052, 44, "monastere", "souilles", done=(1448,),
                                            later={"monastere": 43, "souilles": 43})),
             ("c-rfd-ulda", lambda a: two_due(a, "Souilles avant Uldaman à la fin des Riverglades", "forever/alliance/40-50/01b-riverglades", 94893, 44,
                                              "souilles", "uldaman", done=(1448,), later={"souilles": 43})),
             ("c-temple2", temple_with_quest), ("c-end55", end_dungeons_55),
             ("p-levels", polestar_levels), ("p-passed", hook_passed), ("p-passed-later", hook_passed_open_later), ("p-ahead", hook_ahead), ("p-outlevelled", outlevelled),
             ("mig29", lambda a: migration(a, "mig29", hooks=MIG_HOOKS)), ("mig34", lambda a: migration(a, "mig34")),
             ("mig46", lambda a: migration(a, "mig46")), ("mig55", lambda a: migration(a, "mig55")),
             ("mig-chapter", migration_chapter), ("notes", notes),
             ("b1-steps", step_holds), ("b1-skip", group_skipped_end), ("b1-nokey", no_key_end), ("b2-stop", stop_first),
             ("a1-horde", horde), ("a10-busy", busy_and_tabs), ("a4-background", background_close), ("b6-slash", slash_again),
             ("a3-before", finished_before), ("r4-late", late_flag_end), ("r5-reopened", reopened_finished),
             ("t-tips", guide_tooltips)]
    for key, fn in todo:
        if args.only and key not in args.only.split(","):
            continue
        try:
            lines, b = fn(args)
        except Exception as e:  # a scenario that breaks is a failure, the others still run
            import traceback
            lines, b = [f"### {key}", f"- **ÉCHEC** : le scénario s'arrête : {type(e).__name__}: {e}",
                        "```", traceback.format_exc()[-1500:], "```"], 1
        out += lines + [""]
        bad += b
    out.append(f"Résultat : {'tout passe' if not bad else str(bad) + ' échec(s)'}.")
    text = "\n".join(out) + "\n"
    print(text)
    if args.report:
        args.report.write_text(text, encoding="utf-8", newline="\n")
    sys.exit(1 if bad else 0)


if __name__ == "__main__":
    main()
