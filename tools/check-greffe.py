"""Bench scenarios of the branch greffe: this pack's chapters on Polestar's own route, its French
completed, characters moving over from this pack's route, this pack's notes in "What's new".

  python tools/check-greffe.py --ui <wow-ui-source> --strings <GlobalStrings folder> --bascule <dist folder>
                               [--report <file.md>]

Built on tools/check-pack.py (the whole addons/ folder loaded in one Lua 5.1 state, a fake game),
with a fake quest log: quests handed in (C_QuestLog.IsQuestFlaggedCompleted), quests in the log with
their objectives done, the player's level, a clock the scenario moves. Each scenario is its own run
(saved variables set before the addons load, as the game reads them from WTF). French client unless
said otherwise.

--bascule: the dist folder of a pack made like this one after the switch (only the chapters, none of
the 30 leveling guides; tools/build.py's forge compile of such a copy of pack/): the migration
scenarios load it instead of addons/PolestarPack_GroupeAlliance*.

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
GREFFE = { level = 20, log = {}, now = 1000 }
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
	for i = 1, 4 do out[i] = { text = "Objective " .. i .. ": 1/1", type = "monster", finished = true, numFulfilled = 1, numRequired = 1 } end
	return out
end
QL.ReadyForTurnIn = function(q) return idx(q) ~= nil end
QL.IsComplete = function(q) return idx(q) ~= nil end
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
-- Quests handed in and taken by a guide's steps before `upto` (its first step that hands in `q`).
function G.walk(guideId, turnin)
	local g = G.ns.Guides.Get(guideId)
	if not g then return nil, "no guide " .. guideId end
	local upto
	for s, step in ipairs(g.steps) do
		for _, goal in ipairs(step.goals) do
			if goal.t == "turnin" and goal.quest == turnin and not upto then
				local dungeon = false
				for _, p in ipairs(step.when or {}) do if p.k == "dungeon" and not p.neg then dungeon = true end end
				if not dungeon then upto = s end
			end
		end
	end
	if not upto then return nil, "no turnin " .. turnin end
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
	G.addLog(turnin)
	return upto
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
# A plausible history on this pack's route (0.12.2): its guides in `next` order from the Human
# start, the lone player's way (every `when group` step skipped, chapters left out), up to a
# step of a guide. -> quests handed in, quests in the log
# ---------------------------------------------------------------------------------------------
def history(stop_guide, stop_step, race="Human", cls="Warrior"):
    guides = {}
    for f in sorted((REPO / "pack" / "guides").glob("*.guide")):
        text = f.read_text(encoding="utf-8")
        gid = re.search(r"^guide (\S+)", text, re.M).group(1)
        nxt = re.search(r"^next (\S+)", text, re.M)
        cat = re.search(r"^category (\S+)", text, re.M)
        steps, cur = [], None
        for line in text.split("\n"):
            if line.startswith("step "):
                cur = {"when": [], "only": None, "goals": []}
                steps.append(cur)
            elif cur is not None and line.startswith("  "):
                parts = line.strip().split("--")[0].split()
                if not parts:
                    continue
                if parts[0] == "when":
                    cur["when"].append(" ".join(parts[1:]))
                elif parts[0] == "only":
                    cur["only"] = parts[1]
                elif parts[0] in ("accept", "turnin") and len(parts) > 1 and parts[1].isdigit():
                    rest = parts[2:]
                    only = rest[rest.index("only") + 1] if "only" in rest else None
                    cur["goals"].append((parts[0], int(parts[1]), "optional" in rest, only))
        guides[gid] = {"next": nxt.group(1).rstrip(",") if nxt else None, "cat": cat.group(1) if cat else None, "steps": steps}
    done, log = [], []
    gid = f"groupe-alliance/01-depart-{ {'Human': 'humain'}[race] }"
    while gid:
        g = guides[gid]
        if g["cat"] != "Dungeons":
            for i, st in enumerate(g["steps"], 1):
                if gid == stop_guide and i >= stop_step:
                    return done, log
                if st["only"] and race not in st["only"] and cls.lower() not in st["only"].lower():
                    continue
                if any(w.startswith("group") or w.startswith("done") for w in st["when"]):
                    continue
                for verb, q, optional, only in st["goals"]:
                    if optional or (only and race not in only and cls.lower() not in only.lower()):
                        continue
                    if verb == "accept" and q not in done and q not in log:
                        log.append(q)
                    elif verb == "turnin" and q in log:
                        log.remove(q)
                        done.append(q)
        if gid == stop_guide:
            break
        gid = g["next"]
    return done, log


# ---------------------------------------------------------------------------------------------
# Scenarios
# ---------------------------------------------------------------------------------------------
ROUTE_DM = "forever/alliance/03-loch-modan"
CHAPTER_DM = "groupe-alliance/greffe/mortemines"
ROUTE_SM = "forever/alliance/40-50/02-badlands"
CHAPTER_SM = "groupe-alliance/greffe/monastere-ecarlate"


# Two more chapters of the full table, played by the Deadmines chapter's guide (the switch has not
# made theirs yet), hooked on a quest every history here has handed in (The Defias Brotherhood, 65):
# both are due at 29; which one comes first, and that the other waits. Their real hooks and levels
# are in the design notes, not here.
MIG_HOOKS = [
    {"id": "groupe-alliance/greffe/mortemines", "key": "essai-prison", "turnin": 65, "min": 24, "max": 29, "done": [],
     "name": {"frFR": "La Prison (essai)", "enUS": "The Stockade (test)"}, "where": {"frFR": "Hurlevent", "enUS": "Stormwind"}},
    {"id": "groupe-alliance/greffe/mortemines", "key": "essai-fouilles", "turnin": 65, "min": 26, "max": 31, "done": [],
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
            why = ns.GA.GreffeWhy(ns.GA.GREFFE[1])
            r.check(G.card() == "none" and why == want, f"{label} : pas de proposition (raison du module : {why}, attendue : {want})")
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
    """The late chapter: the Scarlet Monastery at Raleigh, level 44."""
    def after(L, G, ns, r):
        G.tick(6)
        G.clearOther()
        gid, step, title = G.active()
        r.say(f"Niveau 44 sur `{ROUTE_SM}` juste avant le rendu de Down the Scarlet Path (1052) : actif {gid}, étape {step} « {title} ».")
        G.turnin(1052)
        G.clearOther()
        G.tick(2)
        card = G.card()
        r.check(card.startswith("greffe:monastere"), f"proposition du Monastère écarlate chez Raleigh (carte « {card} »)")
        before_step = G.tabStep(ROUTE_SM)
        ns.UI.ClassToast.Act()
        G.tick(4)
        r.check(G.active()[0] == CHAPTER_SM and G.tabStep(ROUTE_SM) == before_step, f"chapitre ouvert, Polestar garde son étape ({before_step}) : {G.tabs()}")
        for q in (1053, 96800):
            G.accept(q)
        for q in (96800, 1053):
            G.turnin(q)
        G.tick(6)
        gid, step, title = G.active()
        r.check(gid == ROUTE_SM and step is not None and step >= before_step, f"fin du chapitre : retour à `{ROUTE_SM}`, étape {step} « {title} »")
    return run(args, "Scénario 6 : un chapitre tardif (Monastère écarlate, niveau 44)", prelude=ACCOUNT + char_db([ROUTE_SM]),
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
        r.check("greffe:" not in G.card(), f"le chapitre déjà ouvert n'est pas proposé en plus (raison : {ns.GA.GreffeWhy(ns.GA.GREFFE[1])})")
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
        ours = [i for i, t in titles.items() if t == "Pillards squelettes"]
        theirs = [i for i, t in titles.items() if t == "Côtes de goule"]
        r.check(bool(ours), f"5. « Skeletal Raiders » (05-duskwood, sans français chez Polestar) s'affiche « Pillards squelettes » (étape {ours[0] if ours else '?'})")
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
        r.check("Skeletal Raiders" in titles and "Pillards squelettes" not in titles, "client anglais : le guide de Polestar reste en anglais, le complément ne s'applique pas")
    return run(args, "Scénario 8 : client anglais", locale="enUS", prelude=ACCOUNT + char_db([ROUTE_DM]), after=after)


def migration(args, level, stop_guide, stop_step, label, hooks=()):
    """D: a character of this pack's route (0.12.2) after the switch, its saved tab on a retired guide.
    hooks: extra entries for GA.GREFFE (chapters of the full table, played here by the Deadmines
    chapter's guide) to show which one is offered first and that the next one waits."""
    done, log = history(stop_guide, stop_step)
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
    return run(args, f"Scénario D : migration, {label}", prelude=prelude, before=before, after=after,
               exclude=("PolestarPack_GroupeAlliance", "PolestarPack_GroupeAlliance_frFR"), extra=[args.bascule])


def notes(args):
    """E: this pack's notes in "What's new", once per account, after Polestar's own."""
    spec2 = importlib.util.spec_from_file_location("notes_jeu", REPO / "tools" / "notes-jeu.py")
    nj = importlib.util.module_from_spec(spec2)
    spec2.loader.exec_module(nj)
    sample = (REPO / "tools" / "check-greffe-notes.md").read_text(encoding="utf-8")
    notes_src = nj.notes_lua("0.13.0", sample)
    rows, bad = [], 0
    saved = {}

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
        WN.Hide()
        G.tick(2)
        saved["db"] = to_py(ns.DB().groupeAlliance)
        r.check(saved["db"].get("notesSeen") == "0.13.0", f"vue pour ce compte : groupeAlliance.notesSeen = {saved['db'].get('notesSeen')}")
    lines, b = run(args, "Scénario E1 : nos notes de version, première connexion", before=before, after=first,
                   prelude='PolestarDB = { welcomeSeen = 1, whatsNewSeen = "0.4.0", groupeAlliance = { autoTold = true } }\n' + char_db([ROUTE_DM]))
    rows += lines
    bad += b

    def second(L, G, ns, r):
        G.tick(10)
        WN = ns.UI.WhatsNew
        r.check(not WN.IsShown(), "connexion suivante, même compte : la fenêtre ne s'ouvre plus")
    lines, b = run(args, "Scénario E2 : connexion suivante", before=before, after=second,
                   prelude=f'PolestarDB = {{ welcomeSeen = 1, whatsNewSeen = "0.4.0", groupeAlliance = {lua_literal(saved.get("db", {}))} }}\n' + char_db([ROUTE_DM]))
    rows += lines
    bad += b

    def both(L, G, ns, r):
        G.tick(10)
        WN = ns.UI.WhatsNew
        t1 = WN.frame and WN.frame.Hero.Title.GetText(WN.frame.Hero.Title)
        r.say(f"Polestar a aussi changé de version (drapeau 0.3.7) : d'abord « {t1} ».")
        r.check(bool(WN.IsShown()) and "Groupe Alliance" not in str(t1), "les notes de Polestar s'ouvrent d'abord, sous leur titre")
        WN.Hide()
        G.tick(10)
        t2 = WN.frame.Hero.Title.GetText(WN.frame.Hero.Title)
        r.say(f"Fermées : puis « {t2} » ; drapeau de Polestar {ns.DB().whatsNewSeen}.")
        r.check(bool(WN.IsShown()) and "Groupe Alliance" in str(t2), "puis les nôtres, une fois les siennes fermées")
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
                   prelude='PolestarDB = { welcomeSeen = 1, whatsNewSeen = "0.4.0", groupeAlliance = { autoTold = true } }\n' + char_db([ROUTE_DM]))
    rows += lines
    bad += b
    return rows, bad


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--ui", type=pathlib.Path, required=True)
    ap.add_argument("--strings", type=pathlib.Path, required=True)
    ap.add_argument("--bascule", type=pathlib.Path, required=True)
    ap.add_argument("--report", type=pathlib.Path)
    ap.add_argument("--only")
    args = ap.parse_args()
    sys.stdout.reconfigure(encoding="utf-8")
    cp.LOCALE = "frFR"
    out, bad = ["# Banc de la greffe", ""], 0
    todo = [("proposal", proposal), ("close", close_tab), ("refuse", refuse), ("edges", edge_cases), ("reload", reload_mid),
            ("late", late_chapter), ("sync", synced), ("french", french), ("english", english),
            ("mig29", lambda a: migration(a, 29, "groupe-alliance/11-mille-pointes", 26, "niveau 29, au milieu du Groupe 9 (Mille pointes)",
                                          hooks=MIG_HOOKS)),
            ("mig34", lambda a: migration(a, 34, "groupe-alliance/17-strangleronce", 21, "niveau 34, au milieu du Groupe 15 (Strangleronce)")),
            ("notes", notes)]
    for key, fn in todo:
        if args.only and key not in args.only.split(","):
            continue
        lines, b = fn(args)
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
