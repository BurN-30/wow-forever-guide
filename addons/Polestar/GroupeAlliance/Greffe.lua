-- Groupe Alliance: this pack's chapters offered on Polestar's own route (tools/build.py adds this
-- file to Polestar.toc). Since 0.13.0 the pack has no leveling guide of its own: Polestar's route
-- leads, and this pack's chapters (dungeons, the Westfall meeting point) come in at the right moment.
--
--  * Chapters offered at the right moment (GreffeData.lua, GA.GREFFE): while the
--    active tab holds a leveling guide that is not this pack's, a chapter whose
--    hook quest is handed in (or taken), at a level between its min and max,
--    neither done nor answered, is offered on Polestar's heads-up card (UI.ClassToast.ShowCard,
--    the card its dungeon and class quest heads-ups use) once the route's step that hands in (or
--    takes) the hook is finished, the rest of that stop done (GA.GreffeAtHookStop):
--    "Open the chapter", "Later", "Not for me". One card at a time, the chapter
--    that leaves the player's level first; after an answer, the next one waits
--    for a quest handed in, a level gained or the next login. Never in combat or
--    in an instance; never over another heads-up (it waits for HEADS_UP_HIDDEN).
--    Answers, per character (PolestarCharDB.gaGreffe.answers[key]):
--      "open"  the chapter was opened (not offered again);
--      "later" offered again once the player has gained a level, while in range;
--      "no"    not offered again by itself (/ga donjon brings it back; the guide list still has it);
--      "done"  finished, or one of its `done` quests handed in, or its guide finished before
--              (Polestar's saved guideDone: a chapter of 0.12.x played to its end).
--    A chapter is for its guide's faction only (Guides.GuideMatches): a Horde character on the
--    same account is never offered one, and Polestar's own cards stay whole for it.
--    The card's close button counts as "later". The meeting point (kind "meeting")
--    says so on its card instead of "group dungeon".
--  * One offer per dungeon: Polestar's own dungeon heads-up (UI/DungeonToast.lua) leaves out a
--    dungeon one of these chapters covers (`dungeon`, a key or a list) while that chapter can
--    still be offered or has been (answered, open, done, or the player's level not above its
--    max): GA.GreffeHolds, applied to UI.DungeonToast.Candidates (its "any" mode, the
--    /polestar dungeontoast command, is left alone). Never worse than Polestar alone: a chapter
--    whose hook the player went past without doing it is offered when Polestar's own rule opens
--    the dungeon (UI.DungeonToast.Candidates in "any" mode, once the Codex is loaded: at a
--    level-up), and a chapter the player outlevelled without seeing it lets Polestar's card through.
--  * Opening: the chapter goes into a tab of its own (Engine.OpenTab, as Polestar's
--    Dungeons window opens a pick-up guide); Polestar's guide keeps its tab and its
--    place. The tab it came from is kept (gaGreffe.from[chapter id]).
--  * Back to the route: when the chapter's guide is complete (GUIDE_COMPLETED), or its end
--    hand-ins (GreffeData.lua, `fin`: the hand-ins of its steps without a condition) are all
--    done and no other hand-in of the chapter waits in the log, ready to hand in (a boss line or
--    a goto left unticked does not hold it, nor a group quest skipped, a quest never taken or one
--    the group could not finish), its tab closes and the tab it came from comes back. This is looked
--    at on a hand-in of the chapter, counted at once (the session's hand-ins, the game's completed
--    flag can come later): a finished chapter opened again from the guide list stays open on a
--    hand-in of another quest. When the
--    player closes the chapter's tab (TAB_CLOSED), that tab comes back too if the chapter's tab
--    was the one on screen. Without a tab to come
--    back to (a chapter opened from the guide list, or by Polestar's "Sync to my
--    guide"), the first leveling tab, else Polestar's guide for the level
--    (Engine.StartGuide). Polestar places its guide from the quest log: the
--    chapter's hand-ins count for its own steps.
--  * A /reload mid-chapter: Polestar brings both tabs back; the answers and the
--    tab to come back to are saved, so nothing is asked again.
--  * Retired leveling guides (GA.RETIRED): Polestar.RetireGuides, so a saved tab
--    of one opens Polestar's leveling guide for the character's level.
--  * Polestar's French guide texts are completed at build time, in Polestar_frFR's
--    Texts.lua itself (tools/fr-polestar.py, tools/build.py): that file runs while
--    Polestar loads, before this module.
--  * This pack's release notes in Polestar's "What's new" window (Notes.lua,
--    written by tools/build.py from CHANGELOG.md's "### En jeu" / "### In game";
--    UI/WhatsNew.lua takes WN.Extra, see tools/build.py): once per account and per
--    pack version, after Polestar's own notes when both are due, under a title
--    that names this pack.
--  /ga donjon: the chapter offered now (a "Later" or "Not for me" in the player's level range
--  is forgotten first), or why none is, chapter by chapter, in the client's language.
local _, ns = ...
local GA = ns.GA or {}
ns.GA = GA

local PACK = "groupe-alliance"

-- 0.14.0: the module's language (GA.Locale, GroupeAlliance.lua: /ga lang, else the language
-- Polestar shows), so the cards and notes match the chapters' texts, which Polestar loads in it.
local function lang()
	if GA.Locale then return GA.Locale() end
	return (GetLocale and GetLocale() == "frFR") and "frFR" or "enUS"
end

local T = {
	frFR = {
		head = "NIVEAU %d · DONJON DU GROUPE",
		facts = "Niveau %d · Donjon du groupe",
		title = "%s : le chapitre du groupe",
		headMeeting = "NIVEAU %d · RENDEZ-VOUS DU GROUPE",
		factsMeeting = "Niveau %d · Jouer à plusieurs",
		titleMeeting = "%s",
		route = "Le guide du parcours garde sa place dans son onglet et revient à la fin du chapitre.",
		open = "Ouvrir le chapitre",
		later = "Plus tard",
		no = "Pas pour moi",
		tabs = "Groupe Alliance : six onglets ouverts, c'est le maximum. Fermer un onglet (sa croix), puis « Ouvrir le chapitre » sur la carte, toujours là.",
		back = "Groupe Alliance : chapitre %s terminé, retour au parcours (%s).",
		closed = "Groupe Alliance : retour au parcours (%s). Le chapitre reste dans la liste des guides.",
		offer = "Groupe Alliance : chapitre proposé : %s (%s). /ga donjon pour le revoir.",
		none = "Groupe Alliance : aucun chapitre de donjon à proposer maintenant. Chapitre par chapitre :",
		list = "Tous les chapitres restent dans /polestar guides, Groupe Alliance : les ouvrir de là à tout moment.",
		why = {
			missing = "absent du paquet",
			faction = "pour l'Alliance seulement",
			open = "ouvert dans un onglet",
			no = "refusé (« Pas pour moi »)",
			done = "déjà fait",
			level = "niveau du personnage inconnu",
			above = "dépassé (proposé jusqu'au niveau %d)",
			below = "à partir du niveau %d",
			later = "« Plus tard » : revient au niveau suivant",
			hook = "pas encore à son arrêt du parcours",
			stop = "à son arrêt du parcours : la carte vient une fois l'arrêt fini",
			route = "l'onglet actif n'est pas un guide du parcours de Polestar",
			due = "dû maintenant",
		},
		notesTitle = "Groupe Alliance %s : les nouveautés du guide",
		notesSite = "Notes complètes : github.com/BurN-30/wow-forever-guide",
	},
	enUS = {
		head = "LEVEL %d · GROUP DUNGEON",
		facts = "Level %d · Group dungeon",
		title = "%s: the group's chapter",
		headMeeting = "LEVEL %d · GROUP MEETING POINT",
		factsMeeting = "Level %d · Playing together",
		titleMeeting = "%s",
		route = "The route's guide keeps its place in its tab and comes back when the chapter ends.",
		open = "Open the chapter",
		later = "Later",
		no = "Not for me",
		tabs = "Group Alliance: six tabs open, the most there can be. Close a tab (its cross), then \"Open the chapter\" on the card, still there.",
		back = "Group Alliance: chapter %s done, back to the route (%s).",
		closed = "Group Alliance: back to the route (%s). The chapter stays in the guide list.",
		offer = "Group Alliance: chapter offered: %s (%s). /ga donjon to see it again.",
		none = "Group Alliance: no dungeon chapter to offer now. Chapter by chapter:",
		list = "Every chapter stays in /polestar guides, Group Alliance: open it from there at any time.",
		why = {
			missing = "not in the pack",
			faction = "for the Alliance only",
			open = "open in a tab",
			no = "declined (\"Not for me\")",
			done = "done already",
			level = "character's level unknown",
			above = "behind the character (offered up to level %d)",
			below = "from level %d",
			later = "\"Later\": back at the next level",
			hook = "not at its stop of the route yet",
			stop = "at its stop of the route: the card comes once the stop is done",
			route = "the active tab is not one of Polestar's route guides",
			due = "due now",
		},
		notesTitle = "Group Alliance %s: what's new in the guide",
		notesSite = "Full notes: github.com/BurN-30/wow-forever-guide",
	},
}
local function tr(key) return T[lang()][key] end
GA.GreffeText = tr

---------------------------------------------------------------------------
-- State, per character
---------------------------------------------------------------------------

local function state()
	local s = ns.CharState()
	if type(s.gaGreffe) ~= "table" then s.gaGreffe = {} end
	local g = s.gaGreffe
	if type(g.answers) ~= "table" then g.answers = {} end
	if type(g.from) ~= "table" then g.from = {} end
	return g
end
GA.GreffeState = state

-- The Dungeons codex keys a chapter covers (`dungeon`: one key, or a list for the end-of-route
-- chapter's five dungeons).
local function dungeonsOf(h)
	if type(h.dungeon) == "table" then return h.dungeon end
	if type(h.dungeon) == "string" then return { h.dungeon } end
	return {}
end
GA.GreffeDungeons = dungeonsOf

local byId, byKey, byDungeon = {}, {}, {}
for _, h in ipairs(GA.GREFFE or {}) do
	byId[h.id], byKey[h.key] = h, h
	for _, d in ipairs(dungeonsOf(h)) do
		byDungeon[d] = byDungeon[d] or {}
		table.insert(byDungeon[d], h)
	end
end

local function answerOf(h)
	local a = state().answers[h.key]
	if type(a) == "table" then return a.a, a.level end
	return nil
end

local function setAnswer(h, a)
	state().answers[h.key] = { a = a, level = GA.PlayerLevel and GA.PlayerLevel() or nil }
end
GA.GreffeAnswer = function(key, a)
	local h = byKey[key]
	if h then setAnswer(h, a) end
end

local function C() return ns.Compat end
-- Quests handed in this session (QUEST_TURNED_IN): the game's completed flag can come later than
-- the hand-in (Polestar keeps the same list for it, Core/Engine.lua `turnedIn`), so neither a
-- chapter's end nor a hook waits for that flag.
local turnedIn = {}
local function done(q)
	if type(q) ~= "number" then return false end
	if turnedIn[q] then return true end
	local c = C()
	return c and c.IsQuestCompleted(q) and true or false
end
local function inLog(q) local c = C() return type(q) == "number" and c and c.IsOnQuest(q) or false end

local function isLeveling(g)
	return type(g) == "table" and (g.category == nil or g.category == "Leveling")
end

-- Chapter h's guide, when it is in the pack and for the player's faction (the chapters are
-- Alliance guides: a Horde character on the same account is never offered one). -> guide | nil, why
local function chapterGuide(h)
	local G = ns.Guides
	local g = G and G.Get and G.Get(h.id)
	if not g then return nil, "missing" end
	local player = ns.Compat and ns.Compat.GetPlayerInfo and ns.Compat.GetPlayerInfo() or nil
	if player and G.GuideMatches and not G.GuideMatches(g, player) then return nil, "faction" end
	return g
end
GA.GreffeGuide = chapterGuide

-- Chapter h finished before, as Polestar's save records it (CharState().guideDone: a chapter of
-- 0.12.x played to its end under the same id, or one finished since).
local function finishedBefore(h)
	local s = ns.CharState and ns.CharState()
	local saved = type(s) == "table" and s.guideDone
	return type(saved) == "table" and saved[h.id] == true
end

---------------------------------------------------------------------------
-- Which chapter is due
---------------------------------------------------------------------------

-- The guide that follows g on the player's route (`nextChoices` holds one per faction on the
-- guides both factions share, e.g. Shen'dralas).
local function nextOf(g)
	local G = ns.Guides
	local list = type(g.nextChoices) == "table" and g.nextChoices or { g.next }
	local player = ns.Compat and ns.Compat.GetPlayerInfo and ns.Compat.GetPlayerInfo() or nil
	local first
	for _, id in ipairs(list) do
		local t = type(id) == "string" and G.Get(id)
		if t then
			if not player or not G.GuideMatches or G.GuideMatches(t, player) then return id end
			first = first or id
		end
	end
	return first
end

-- Whether the active tab's guide comes before chapter h's hook on Polestar's route: h.route, or
-- a guide whose `next` chain leads to it. The hook is still ahead: the chapter waits for it.
local function beforeHook(h)
	local E, G = ns.Engine, ns.Guides
	if not (h.route and E and E.GetGuide and G and G.Get) then return false end
	local g = E.GetGuide()
	local id, seen, n = g and g.id, {}, 0
	while type(id) == "string" and not seen[id] and n < 80 do
		if id == h.route then return true end
		seen[id], n = true, n + 1
		local x = G.Get(id)
		if not x then return false end
		id = nextOf(x)
	end
	return false
end
GA.GreffeBeforeHook = beforeHook

-- The dungeons Polestar's own heads-up rule opens to the character now (UI.DungeonToast.Candidates
-- in "any" mode: level at or past the dungeon's best-at, quests to take now), or nil when it
-- cannot say without loading the Codex (only a level-up loads it).
-- Cached per level, Polestar's heads-up and dungeon settings, and quests handed in or taken (any of
-- them can open a dungeon's page: a prerequisite handed in), an empty answer included; an answer
-- that raised an error is not kept. 0.14.0: since Polestar 0.4.3 a candidate costs the dungeon's
-- whole pick-up plan, with route plans for its givers (Dungeons.PickupPlan, ns.TravelCost), worked
-- out here in one go where Polestar spreads its own a few a frame: only asked for a chapter in range
-- whose hook is not done (openedLate), and at most once per state as above, as in 0.13.1. Our checks
-- stay before Polestar's (1 s after a hand-in, 2 s after a level-up; Polestar's at 1.5 s): waiting
-- for its plans would let its card come first.
local turnins, accepts = 0, 0
local opened = { key = nil, set = nil }
local function polestarOpens(level)
	local X = ns.Codex
	if not (X and X.IsLoaded and X.IsLoaded()) then return nil end
	local key = table.concat({ tostring(level), tostring(ns.Get and ns.Get("dungeons.headsUp")),
		tostring(ns.Get and ns.Get("dungeons.enabled")), turnins, accepts }, ":")
	if opened.key == key then return opened.set end
	local DT = ns.UI and ns.UI.DungeonToast
	local candidates = GA.PolestarCandidates or (DT and DT.Candidates)
	local set = {}
	if candidates then
		local ok, list = pcall(candidates, level, "any")
		if not ok then return set end
		if type(list) == "table" then
			for _, c in ipairs(list) do
				if type(c) == "table" and c.key then set[c.key] = true end
			end
		end
	end
	opened.key, opened.set = key, set
	return set
end

-- Whether the player stands at the route's stop of chapter h's hook with work of that stop still
-- open: the active tab's live step (the first open one) hands in or takes one of h's hook quests,
-- and one of its other errands (a hand-in, a quest to take, a flight path, the hearthstone to bind)
-- is not done yet. The card waits for them, so a player who opens the chapter leaves nothing
-- behind there; the stop's own travel (the flight out, a walk) does not hold it, and neither does
-- the meeting point's card (it moves nobody).
local TRAVEL = { fly = true, ["goto"] = true, enter = true, hearth = true, vendor = true, note = true }
local function atHookStop(h)
	if h.kind == "meeting" then return false end
	local E = ns.Engine
	if not (E and E.GetGuide and E.GetLiveStep and E.GoalDone and E.Applies) then return false end
	local g, i = E.GetGuide(), E.GetLiveStep()
	local step = type(g) == "table" and type(g.steps) == "table" and type(i) == "number" and g.steps[i]
	if type(step) ~= "table" or type(step.goals) ~= "table" then return false end
	local hooks, here = {}, false
	for _, q in ipairs(type(h.turnin) == "table" and h.turnin or { h.turnin }) do hooks["turnin:" .. tostring(q)] = true end
	for _, q in ipairs(type(h.accept) == "table" and h.accept or { h.accept }) do hooks["accept:" .. tostring(q)] = true end
	for _, goal in ipairs(step.goals) do
		if type(goal) == "table" and hooks[tostring(goal.t) .. ":" .. tostring(goal.quest)] then here = true end
	end
	if not here then return false end
	for j, goal in ipairs(step.goals) do
		if type(goal) == "table" and not TRAVEL[goal.t] and not goal.optional and E.Applies(i, j) and not E.GoalDone(i, j) then return true end
	end
	return false
end
GA.GreffeAtHookStop = atHookStop

-- Whether Polestar would offer one of chapter h's dungeons now while h's hook is behind the player
-- (passed on the route without being done, or the player is not on Polestar's route).
local function openedLate(h, level)
	if beforeHook(h) then return false end
	local set = polestarOpens(level)
	if not set then return false end
	for _, d in ipairs(dungeonsOf(h)) do
		if set[d] then return true end
	end
	return false
end

-- Why chapter h is not offered now, or nil when it is due.
function GA.GreffeWhy(h, level)
	local E = ns.Engine
	if not E then return "missing" end
	local _, out = chapterGuide(h)
	if out then return out end
	local a, at = answerOf(h)
	if a == "open" or a == "no" or a == "done" then return a end
	if E.TabIds and E.TabIds()[h.id] then return "open" end
	for _, q in ipairs(h.done or {}) do
		if done(q) then
			setAnswer(h, "done")
			return "done"
		end
	end
	if finishedBefore(h) then
		setAnswer(h, "done")
		return "done"
	end
	level = level or (GA.PlayerLevel and GA.PlayerLevel())
	if not level then return "level" end
	if level > h.max then return "above" end
	if level < h.min then return "below" end
	if a == "later" and at and level <= at then return "later" end
	local hooked = false
	for _, q in ipairs(type(h.turnin) == "table" and h.turnin or { h.turnin }) do hooked = hooked or done(q) end
	for _, q in ipairs(type(h.accept) == "table" and h.accept or { h.accept }) do hooked = hooked or inLog(q) or done(q) end
	if not hooked and not openedLate(h, level) then return "hook" end
	local g = E.GetGuide and E.GetGuide()
	if not isLeveling(g) or g.pack == PACK then return "route" end
	if atHookStop(h) then return "stop" end
	return nil
end

-- Whether one of this pack's chapters holds dungeon `key` back from Polestar's own heads-up at
-- `level`: a chapter covering it whose guide is in and for the player's faction, opened, declined
-- ("no"), done (answer, `done` quest, guide finished before), open in a tab, or not outlevelled yet
-- (it will be offered on the route, or comes back after "Later"). A chapter left on "Later" or never
-- answered lets Polestar's card through once the player's level is above its max.
function GA.GreffeHolds(key, level)
	local E = ns.Engine
	for _, h in ipairs(byDungeon[key] or {}) do
		if chapterGuide(h) then
			local a = answerOf(h)
			if a == "open" or a == "no" or a == "done" or (E and E.TabIds and E.TabIds()[h.id]) then return true end
			for _, q in ipairs(h.done or {}) do
				if done(q) then return true end
			end
			if finishedBefore(h) then return true end
			if type(level) ~= "number" or level <= h.max then return true end
		end
	end
	return false
end

-- Polestar's dungeon heads-up (UI/DungeonToast.lua): its candidates leave out the dungeons this
-- pack's chapters hold (GA.GreffeHolds), so the player is asked once per dungeon, by the chapter.
-- "any" (the /polestar dungeontoast command, and GA's own look at what Polestar would open) is
-- left whole. Without that function (another Polestar version), Polestar's cards stay as they are.
local function holdPolestarCards()
	local DT = ns.UI and ns.UI.DungeonToast
	if not (DT and type(DT.Candidates) == "function") or DT.Candidates == GA.HeldCandidates then return end
	local released = DT.Candidates
	GA.PolestarCandidates = released
	GA.HeldCandidates = function(level, mode, questId)
		local list = released(level, mode, questId)
		if mode == "any" or type(list) ~= "table" then return list end
		local lv = type(level) == "number" and level or (GA.PlayerLevel and GA.PlayerLevel())
		local out = {}
		for _, c in ipairs(list) do
			if not (type(c) == "table" and GA.GreffeHolds(c.key, lv)) then out[#out + 1] = c end
		end
		return out
	end
	DT.Candidates = GA.HeldCandidates
end
holdPolestarCards()
ns.OnInit(holdPolestarCards)

-- The chapters due now, the one that leaves the player's level first first.
function GA.GreffeDue(level)
	local out = {}
	for i, h in ipairs(GA.GREFFE or {}) do
		if not GA.GreffeWhy(h, level) then out[#out + 1] = { h = h, i = i } end
	end
	table.sort(out, function(x, y)
		if x.h.max ~= y.h.max then return x.h.max < y.h.max end
		return x.i < y.i
	end)
	for i = 1, #out do out[i] = out[i].h end
	return out
end

---------------------------------------------------------------------------
-- The card
---------------------------------------------------------------------------

local quiet = false -- after an answer: nothing until a hand-in, a level or a login

local function card() return ns.UI and ns.UI.ClassToast end

function GA.GreffeModel(h)
	local lv = GA.PlayerLevel and GA.PlayerLevel() or h.min
	local Th = ns.Theme
	local name = h.name[lang()] or h.name.enUS
	local meeting = h.kind == "meeting"
	local m = { greffe = h.key, titleColor = "text", iconColor = meeting and "accent" or "dungeon" }
	if Th and Th.Media then m.icon = Th.Media(meeting and "flag" or "icon-dungeon") end
	m.head = tr(meeting and "headMeeting" or "head"):format(lv)
	m.facts = tr(meeting and "factsMeeting" or "facts"):format(lv)
	m.title = tr(meeting and "titleMeeting" or "title"):format(name)
	m.giver = h.where[lang()] or h.where.enUS
	m.route = tr("route")
	m.act = { label = tr("open"), run = function() return GA.OpenChapter(h) end }
	m.off = { label = tr("no"), run = function() setAnswer(h, "no") quiet = true end }
	m.later = { label = tr("later"), run = function() setAnswer(h, "later") quiet = true end }
	return m
end

GA.greffeShown = nil -- the key on the card, for the bench and /ga donjon

function GA.GreffeCheck(why)
	if why == "turnin" or why == "level" or why == "login" then quiet = false end
	if quiet or not ns.IsLoggedIn() then return nil end
	local c = C()
	if c and ((c.InCombat and c.InCombat()) or (c.IsInInstance and c.IsInInstance())) then return nil end
	local CT = card()
	if CT and CT.current ~= nil then return nil end -- another heads-up, or ours, on the card
	local h = GA.GreffeDue()[1]
	if not h then return nil end
	GA.greffeShown = h.key
	if CT and CT.ShowCard then
		-- On screen, or waiting for the guide window to show (the card keeps it as current).
		local m = GA.GreffeModel(h)
		CT.ShowCard(m)
		if CT.current == m then return h.key end
	end
	-- No card (the gamepad interface, a window hidden): one line in the chat, and a
	-- "later", so the chat line is not repeated at every step.
	setAnswer(h, "later")
	quiet = true
	if ns.Print then ns.Print(tr("offer"):format(h.name[lang()] or h.name.enUS, h.where[lang()] or h.where.enUS)) end
	return h.key
end

-- The card closed by its button: "later" unless answered. Another heads-up gone (a class
-- quest, Polestar's own dungeon card): ours may come now.
ns.On("HEADS_UP_HIDDEN", function(m)
	if type(m) ~= "table" then return end
	if not m.greffe then
		ns.After(1, function() GA.GreffeCheck("card") end)
		return
	end
	if GA.greffeShown == m.greffe then GA.greffeShown = nil end
	local h = byKey[m.greffe]
	if h and not answerOf(h) then
		setAnswer(h, "later")
		quiet = true
	end
end)

---------------------------------------------------------------------------
-- Opening a chapter and coming back
---------------------------------------------------------------------------

function GA.OpenChapter(h)
	local E = ns.Engine
	if not (E and E.OpenTab) then return false end
	local from = E.GetGuide and E.GetGuide()
	if not E.OpenTab(h.id, true) then
		if ns.Print then ns.Print(tr("tabs")) end
		return false
	end
	if from and from.id ~= h.id then state().from[h.id] = from.id end
	setAnswer(h, "open")
	quiet = true
	if ns.Set then ns.Set("ui.shown", true) end
	local CT = card()
	if CT and CT.current and CT.current.greffe == h.key then CT.Hide() end
	return true
end

local function tabOf(id)
	local E = ns.Engine
	for i, t in ipairs(E and E.GetTabs and E.GetTabs() or {}) do
		if t.guideId == id then return i, t end
	end
	return nil
end

-- The tab to come back to from chapter `id`: the one it came from, else the first
-- leveling tab. -> index, title | nil
local function backTab(id)
	local E, G = ns.Engine, ns.Guides
	local from = state().from[id]
	if from then
		local i, t = tabOf(from)
		if i then return i, t.title end
	end
	for k, tab in ipairs(E.GetTabs() or {}) do
		if tab.guideId ~= id and isLeveling(G.Get(tab.guideId)) then return k, tab.title end
	end
	return nil
end

-- Chapter `id` finished (finished) or its tab closed by the player (shown: whether the chapter's
-- tab was the one on screen; a tab closed in the background leaves the active tab as it is).
function GA.ChapterBack(id, finished, shown)
	local E = ns.Engine
	local h = byId[id]
	if not (E and E.GetTabs) then return end
	if h and finished then setAnswer(h, "done") end
	if finished then
		local mine = tabOf(id)
		local _, active = E.GetTabs()
		shown = mine ~= nil and mine == active
		if mine then E.CloseTab(mine, true) end
	end
	local i, title = backTab(id)
	state().from[id] = nil
	if i and shown == false then
		-- Its tab was not on screen: the player's tab stays, a line in the chat says so.
		local g = E.GetGuide and E.GetGuide()
		title = g and g.title or title
	elseif i then
		E.SelectTab(i)
	elseif E.StartGuide then
		E.StartGuide()
		local g = E.GetGuide and E.GetGuide()
		title = g and g.title
	end
	if ns.Print then
		ns.Print(finished and tr("back"):format(h and (h.name[lang()] or h.name.enUS) or id, title or "?") or tr("closed"):format(title or "?"))
	end
end

local function isChapter(id)
	if byId[id] then return true end
	local g = ns.Guides and ns.Guides.Get and ns.Guides.Get(id)
	return type(g) == "table" and g.pack == PACK and g.category == "Dungeons" and state().from[id] ~= nil
end

-- A chapter's end (GreffeData.lua, `fin`): the hand-ins of its steps without a condition, which
-- every player of the chapter makes. An empty list (the meeting point, the 55-60 dungeons, the
-- second Zul'Farrak run: every part behind a question) leaves the end to Polestar (GUIDE_COMPLETED).
function GA.ChapterFin(id)
	local h = byId[id]
	return h and type(h.fin) == "table" and h.fin or {}
end

-- The chapter's other hand-ins (its steps' turn-ins outside `fin`: a group quest, a quest taken
-- on a condition, a drop), read from its guide once.
local othersOf = {}
local function others(id)
	if othersOf[id] then return othersOf[id] end
	local g = ns.Guides and ns.Guides.Get and ns.Guides.Get(id)
	if not (g and type(g.steps) == "table") then return {} end
	local fin, list, seen = {}, {}, {}
	for _, q in ipairs(GA.ChapterFin(id)) do fin[q] = true end
	for _, step in ipairs(g.steps) do
		for _, goal in ipairs(type(step.goals) == "table" and step.goals or {}) do
			local q = goal.quest
			if goal.t == "turnin" and type(q) == "number" and not fin[q] and not seen[q] then
				seen[q] = true
				list[#list + 1] = q
			end
		end
	end
	othersOf[id] = list
	return list
end
GA.ChapterOthers = others

-- Whether chapter h is finished: every hand-in of its `fin` done, and none of its other hand-ins
-- in the log ready to hand in (that one still has its step). A quest the player skipped (a group
-- question answered "Skip it"), never took, or could not finish holds nothing: what the player
-- could do is done. A line left unticked (a boss's kill, the cannon door, a goto walked past)
-- holds nothing either.
function GA.ChapterFinished(h)
	local fin = GA.ChapterFin(h.id)
	if #fin == 0 then return false end
	for _, q in ipairs(fin) do
		if not done(q) then return false end
	end
	local c = C()
	for _, q in ipairs(others(h.id)) do
		if not done(q) and inLog(q) and c and c.IsQuestReadyForTurnIn and c.IsQuestReadyForTurnIn(q) then return false end
	end
	return true
end

-- Whether quest q is one of chapter h's hand-ins (its `fin`, or another turn-in of its steps).
local function handinOf(h, q)
	for _, x in ipairs(GA.ChapterFin(h.id)) do
		if x == q then return true end
	end
	for _, x in ipairs(others(h.id)) do
		if x == q then return true end
	end
	return false
end

-- An open chapter that is finished gives way: its tab closes, the route comes back. Looked at when
-- quest q leaves the log (handed in, or abandoned while it held the chapter), and only for the
-- chapters q is a hand-in of: a chapter the player opened again from the guide list once finished
-- stays open on a hand-in that has nothing to do with it. Without q, every open chapter.
function GA.ChapterDoneCheck(q)
	local E = ns.Engine
	local open = E and E.TabIds and E.TabIds() or {}
	for _, h in ipairs(GA.GREFFE or {}) do
		if open[h.id] and (type(q) ~= "number" or handinOf(h, q)) and GA.ChapterFinished(h) then GA.ChapterBack(h.id, true) end
	end
end

-- Polestar fires GUIDE_COMPLETED from inside its evaluation: the tab closes a moment later.
ns.On("GUIDE_COMPLETED", function(id)
	if type(id) == "string" and isChapter(id) then
		ns.After(0, function() GA.ChapterBack(id, true) end)
	end
end)
-- Whether the tab the player closes is the one on screen: Engine.CloseTab, which the tab's cross
-- calls, is wrapped once to note it before Polestar picks the next active tab (TAB_CLOSED comes
-- after). Without that function (another Polestar version), the route's tab comes back as before.
local closedShown = {}
local function noteClosing()
	local E = ns.Engine
	if not (E and type(E.CloseTab) == "function" and E.GetTabs) or E.CloseTab == GA.NotedCloseTab then return end
	local released = E.CloseTab
	GA.NotedCloseTab = function(index, quiet)
		local list, active = E.GetTabs()
		local t = type(index) == "number" and type(list) == "table" and list[index]
		if type(t) == "table" and t.guideId then closedShown[t.guideId] = (index == active) end
		return released(index, quiet)
	end
	E.CloseTab = GA.NotedCloseTab
end
noteClosing()
ns.OnInit(noteClosing)
ns.On("TAB_CLOSED", function(id)
	if type(id) == "string" and isChapter(id) then
		local shown = closedShown[id]
		closedShown[id] = nil
		ns.After(0, function() GA.ChapterBack(id, false, shown) end)
	end
end)

-- When to look: a step or guide change, a hand-in, a level, the login.
for _, msg in ipairs({ "STEP_CHANGED", "GUIDE_CHANGED", "GUIDE_PLACED" }) do
	ns.On(msg, function() ns.After(0, function() GA.GreffeCheck("step") end) end)
end
if ns.RegisterEvent then
	ns.RegisterEvent("QUEST_TURNED_IN", function(_, questID)
		turnins = turnins + 1
		if type(questID) == "number" then turnedIn[questID] = true end
		ns.After(1, function()
			GA.ChapterDoneCheck(questID)
			GA.GreffeCheck("turnin")
		end)
	end)
	-- A quest abandoned that held a finished chapter (another hand-in of it, ready in the log).
	ns.RegisterEvent("QUEST_REMOVED", function(_, questID)
		if type(questID) == "number" then ns.After(1, function() GA.ChapterDoneCheck(questID) end) end
	end)
	-- A hook that is a quest taken (Down the Scarlet Path, An Alarming Request): looked at once it
	-- is in the log, even when the step it belongs to goes on.
	ns.RegisterEvent("QUEST_ACCEPTED", function()
		accepts = accepts + 1
		ns.After(1, function() GA.GreffeCheck("accept") end)
	end)
	ns.RegisterEvent("PLAYER_LEVEL_UP", function() ns.After(2, function() GA.GreffeCheck("level") end) end)
	ns.RegisterEvent("PLAYER_REGEN_ENABLED", function() ns.After(1, function() GA.GreffeCheck("combat") end) end)
end
ns.OnLogin(function() ns.After(8, function() GA.GreffeCheck("login") end) end)

-- Why chapter h is not offered, in the client's language (/ga donjon).
function GA.GreffeReason(h, level)
	local code = GA.GreffeWhy(h, level) or "due"
	local text = T[lang()].why[code] or code
	if code == "above" then text = text:format(h.max) elseif code == "below" then text = text:format(h.min) end
	return text, code
end

-- /ga donjon: the card again, or why none is due. A "Later" or a "Not for me" given to a chapter in
-- the player's level range is forgotten first: the player asks to see it again.
function GA.GreffeSlash()
	quiet = false
	local lv = GA.PlayerLevel and GA.PlayerLevel()
	for _, h in ipairs(GA.GREFFE or {}) do
		local a = answerOf(h)
		if (a == "later" or a == "no") and lv and lv >= h.min and lv <= h.max then state().answers[h.key] = nil end
	end
	if GA.GreffeCheck("asked") then return end
	if not ns.Print then return end
	ns.Print(tr("none"))
	for _, h in ipairs(GA.GREFFE or {}) do
		if chapterGuide(h) then ns.Print(("  %s : %s"):format(h.name[lang()] or h.name.enUS, (GA.GreffeReason(h, lv)))) end
	end
	ns.Print(tr("list"))
end

---------------------------------------------------------------------------
-- Retired leveling guides
---------------------------------------------------------------------------

if ns.RetireGuides and GA.RETIRED then ns.RetireGuides("guides", GA.RETIRED) end

---------------------------------------------------------------------------
-- This pack's notes in Polestar's "What's new" window
---------------------------------------------------------------------------

local function settings()
	local db = ns.DB()
	if type(db.groupeAlliance) ~= "table" then db.groupeAlliance = {} end
	return db.groupeAlliance
end

-- The window's entry for GA.NOTES (Notes.lua): { version, title, site, notes }.
function GA.NotesEntry()
	local N = GA.NOTES
	local list = type(N) == "table" and (N[lang()] or N.enUS)
	if type(list) ~= "table" or #list == 0 then return nil end
	local entry = { version = N.version, title = tr("notesTitle"):format(N.version), site = tr("notesSite"), notes = {} }
	for i, n in ipairs(list) do
		local text = n[2]
		entry.notes[i] = { glyph = i == 1 and "guides" or "icon-dungeon", color = "accent", head = n[1], text = function() return text end }
	end
	return entry
end

-- The window closing: our entry leaves it, and our notes may come next (after Polestar's).
local hookedHide = false
local function hookHide(WN)
	if hookedHide or not (WN and WN.frame and WN.frame.HookScript) then return end
	hookedHide = true
	WN.frame:HookScript("OnHide", function()
		WN.Extra = nil
		ns.After(1, function() GA.NotesCheck() end)
	end)
end

function GA.ShowNotes()
	local WN = ns.UI and ns.UI.WhatsNew
	local entry = GA.NotesEntry()
	if not (WN and WN.Show and WN.IsShown and entry) then return false end
	WN.Extra = entry
	WN.Show()
	if not WN.IsShown() then
		-- Not on screen (Polestar keeps it for after a fight or a cinematic): our entry leaves, and
		-- that pending opening too, so Polestar's own notes are not shown again in its place.
		WN.Extra = nil
		if WN.Hide then WN.Hide() end
		return false
	end
	hookHide(WN)
	settings().notesSeen = entry.version
	return true
end

-- Due: notes for this version, not seen on this account. Shown once Polestar's own
-- notes are seen (they open first when both are due), out of combat, out of an
-- instance and of a cinematic, with no welcome and no "What's new" on screen: tried again when that window
-- closes, when combat ends, and every 5 seconds for 10 minutes. A new account (Polestar's
-- welcome instead) marks them seen.
local notesTries = 0
function GA.NotesCheck()
	local N = GA.NOTES
	if type(N) ~= "table" or not N.version or settings().notesSeen == N.version or not GA.NotesEntry() then return false end
	local WN = ns.UI and ns.UI.WhatsNew
	if not WN then return false end
	local c = C()
	local cinematic = (InCinematic and InCinematic()) or (IsInCinematicScene and IsInCinematicScene()) or false
	local busy = cinematic or (c and ((c.InCombat and c.InCombat()) or (c.IsInInstance and c.IsInInstance())))
		or (WN.IsShown and WN.IsShown())
		or ns.DB().whatsNewSeen ~= WN.LATEST
		or (ns.UI.Welcome and ns.UI.Welcome.Busy and ns.UI.Welcome.Busy())
	if busy then
		if WN.IsShown and WN.IsShown() then hookHide(WN) end
		notesTries = notesTries + 1
		if notesTries < 120 then ns.After(5, GA.NotesCheck) end
		return false
	end
	return GA.ShowNotes()
end

ns.OnInit(function()
	local N = GA.NOTES
	if type(N) == "table" and N.version and settings().notesSeen == nil and ns.IsNewAccount and ns.IsNewAccount() then
		settings().notesSeen = N.version
	end
end)
ns.OnLogin(function() ns.After(6, GA.NotesCheck) end)
if ns.RegisterEvent then
	ns.RegisterEvent("PLAYER_REGEN_ENABLED", function() ns.After(2, GA.NotesCheck) end)
end
