-- Groupe Alliance: this pack's chapters offered on Polestar's own route (tools/build.py adds this
-- file to Polestar.toc). Since 0.13.0 the pack has no leveling guide of its own: Polestar's route
-- leads, and this pack's chapters (dungeons, the Westfall meeting point) come in at the right moment.
--
--  * Chapters offered at the right moment (GreffeData.lua, GA.GREFFE): while the
--    active tab holds a leveling guide that is not this pack's, a chapter whose
--    hook quest is handed in (or taken), at a level between its min and max,
--    neither done nor answered, is offered on Polestar's heads-up card
--    (UI.ClassToast.ShowCard, the card its dungeon and class quest heads-ups use):
--    "Open the chapter", "Later", "Not for me". One card at a time, the chapter
--    that leaves the player's level first; after an answer, the next one waits
--    for a quest handed in, a level gained or the next login. Never in combat or
--    in an instance; never over another heads-up (it waits for HEADS_UP_HIDDEN).
--    Answers, per character (PolestarCharDB.gaGreffe.answers[key]):
--      "open"  the chapter was opened (not offered again);
--      "later" offered again once the player has gained a level, while in range;
--      "no"    never offered again (the guide list still has the chapter);
--      "done"  finished, or one of its `done` quests handed in.
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
--  * Back to the route: when the chapter's guide is complete (GUIDE_COMPLETED), or its
--    hand-ins are all done (a boss line or a goto left unticked does not hold it), its
--    tab closes and the tab it came from comes back; when the player closes the
--    chapter's tab (TAB_CLOSED), that tab comes back too. Without a tab to come
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
--  /ga donjon: the chapter offered now, or why none is.
local _, ns = ...
local GA = ns.GA or {}
ns.GA = GA

local PACK = "groupe-alliance"

local function lang()
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
		tabs = "Groupe Alliance : six onglets ouverts, en fermer un pour ouvrir le chapitre.",
		back = "Groupe Alliance : chapitre %s terminé, retour au parcours (%s).",
		closed = "Groupe Alliance : retour au parcours (%s). Le chapitre reste dans la liste des guides.",
		offer = "Groupe Alliance : chapitre proposé : %s (%s). /ga donjon pour le revoir.",
		none = "Groupe Alliance : aucun chapitre de donjon à proposer maintenant.",
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
		tabs = "Group Alliance: six tabs open, close one to open the chapter.",
		back = "Group Alliance: chapter %s done, back to the route (%s).",
		closed = "Group Alliance: back to the route (%s). The chapter stays in the guide list.",
		offer = "Group Alliance: chapter offered: %s (%s). /ga donjon to see it again.",
		none = "Group Alliance: no dungeon chapter to offer now.",
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
local function done(q) local c = C() return type(q) == "number" and c and c.IsQuestCompleted(q) or false end
local function inLog(q) local c = C() return type(q) == "number" and c and c.IsOnQuest(q) or false end

local function isLeveling(g)
	return type(g) == "table" and (g.category == nil or g.category == "Leveling")
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
-- cannot say without loading the Codex (only a level-up loads it). Cached per level and hand-in.
local turnins = 0
local opened = { level = nil, turnins = nil, set = nil }
local function polestarOpens(level)
	local X = ns.Codex
	if not (X and X.IsLoaded and X.IsLoaded()) then return nil end
	if opened.level == level and opened.turnins == turnins then return opened.set end
	local DT = ns.UI and ns.UI.DungeonToast
	local candidates = GA.PolestarCandidates or (DT and DT.Candidates)
	local set = {}
	if candidates then
		local ok, list = pcall(candidates, level, "any")
		if ok and type(list) == "table" then
			for _, c in ipairs(list) do
				if type(c) == "table" and c.key then set[c.key] = true end
			end
		end
	end
	opened.level, opened.turnins, opened.set = level, turnins, set
	return set
end

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
	local E, G = ns.Engine, ns.Guides
	if not (E and G and G.Get and G.Get(h.id)) then return "missing" end
	local a, at = answerOf(h)
	if a == "open" or a == "no" or a == "done" then return a end
	for _, q in ipairs(h.done or {}) do
		if done(q) then
			setAnswer(h, "done")
			return "done"
		end
	end
	if E.TabIds and E.TabIds()[h.id] then return "open" end
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
	return nil
end

-- Whether one of this pack's chapters holds dungeon `key` back from Polestar's own heads-up at
-- `level`: a chapter covering it whose guide is in, answered (open, later, no, done), open in a
-- tab, done by one of its `done` quests, or not outlevelled yet (it will be offered on the route).
function GA.GreffeHolds(key, level)
	local E, G = ns.Engine, ns.Guides
	for _, h in ipairs(byDungeon[key] or {}) do
		if G and G.Get and G.Get(h.id) then
			if answerOf(h) or (E and E.TabIds and E.TabIds()[h.id]) then return true end
			for _, q in ipairs(h.done or {}) do
				if done(q) then return true end
			end
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

-- Chapter `id` finished (finished) or its tab closed by the player.
function GA.ChapterBack(id, finished)
	local E = ns.Engine
	local h = byId[id]
	if not (E and E.GetTabs) then return end
	if h and finished then setAnswer(h, "done") end
	if finished then
		local mine = tabOf(id)
		if mine then E.CloseTab(mine, true) end
	end
	local i, title = backTab(id)
	state().from[id] = nil
	if i then
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

-- A chapter's hand-ins: the quests its steps turn in, optional ones left out.
local handinsOf = {}
local function handins(id)
	if handinsOf[id] then return handinsOf[id] end
	local g = ns.Guides and ns.Guides.Get and ns.Guides.Get(id)
	if not (g and type(g.steps) == "table") then return {} end
	local list = {}
	for _, step in ipairs(g.steps) do
		for _, goal in ipairs(type(step.goals) == "table" and step.goals or {}) do
			if goal.t == "turnin" and type(goal.quest) == "number" and not goal.optional then list[#list + 1] = goal.quest end
		end
	end
	handinsOf[id] = list
	return list
end
GA.ChapterHandins = handins

-- An open chapter whose hand-ins are all done is finished, even with a line left unticked
-- (a boss's kill, the cannon door, a goto the player walked past): its tab gives way.
function GA.ChapterDoneCheck()
	local E = ns.Engine
	local open = E and E.TabIds and E.TabIds() or {}
	for _, h in ipairs(GA.GREFFE or {}) do
		if open[h.id] then
			local list, all = handins(h.id), true
			for _, q in ipairs(list) do
				if not done(q) then all = false break end
			end
			if all and #list > 0 then GA.ChapterBack(h.id, true) end
		end
	end
end

-- Polestar fires GUIDE_COMPLETED from inside its evaluation: the tab closes a moment later.
ns.On("GUIDE_COMPLETED", function(id)
	if type(id) == "string" and isChapter(id) then
		ns.After(0, function() GA.ChapterBack(id, true) end)
	end
end)
ns.On("TAB_CLOSED", function(id)
	if type(id) == "string" and isChapter(id) then
		ns.After(0, function() GA.ChapterBack(id, false) end)
	end
end)

-- When to look: a step or guide change, a hand-in, a level, the login.
for _, msg in ipairs({ "STEP_CHANGED", "GUIDE_CHANGED", "GUIDE_PLACED" }) do
	ns.On(msg, function() ns.After(0, function() GA.GreffeCheck("step") end) end)
end
if ns.RegisterEvent then
	ns.RegisterEvent("QUEST_TURNED_IN", function()
		turnins = turnins + 1
		ns.After(1, function()
			GA.ChapterDoneCheck()
			GA.GreffeCheck("turnin")
		end)
	end)
	-- A hook that is a quest taken (Down the Scarlet Path, An Alarming Request): looked at once it
	-- is in the log, even when the step it belongs to goes on.
	ns.RegisterEvent("QUEST_ACCEPTED", function() ns.After(1, function() GA.GreffeCheck("accept") end) end)
	ns.RegisterEvent("PLAYER_LEVEL_UP", function() ns.After(2, function() GA.GreffeCheck("level") end) end)
	ns.RegisterEvent("PLAYER_REGEN_ENABLED", function() ns.After(1, function() GA.GreffeCheck("combat") end) end)
end
ns.OnLogin(function() ns.After(8, function() GA.GreffeCheck("login") end) end)

-- /ga donjon: the card again (out of "later" for the chapter due), or why none is due.
function GA.GreffeSlash()
	quiet = false
	local lv = GA.PlayerLevel and GA.PlayerLevel()
	for _, h in ipairs(GA.GREFFE or {}) do
		if answerOf(h) == "later" and lv and lv >= h.min and lv <= h.max then state().answers[h.key] = nil end
	end
	if GA.GreffeCheck("asked") then return end
	if ns.Print then ns.Print(tr("none")) end
	for _, h in ipairs(GA.GREFFE or {}) do
		if ns.Print then ns.Print(("  %s: %s"):format(h.name[lang()] or h.name.enUS, GA.GreffeWhy(h) or "due")) end
	end
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
	if not (WN and WN.Show and entry) then return false end
	WN.Extra = entry
	WN.Show()
	hookHide(WN)
	settings().notesSeen = entry.version
	return WN.IsShown and WN.IsShown() or false
end

-- Due: notes for this version, not seen on this account. Shown once Polestar's own
-- notes are seen (they open first when both are due), out of combat, out of an
-- instance, with no welcome and no "What's new" on screen: tried again when that window
-- closes, when combat ends, and every 5 seconds for 10 minutes. A new account (Polestar's
-- welcome instead) marks them seen.
local notesTries = 0
function GA.NotesCheck()
	local N = GA.NOTES
	if type(N) ~= "table" or not N.version or settings().notesSeen == N.version or not GA.NotesEntry() then return false end
	local WN = ns.UI and ns.UI.WhatsNew
	if not WN then return false end
	local c = C()
	local busy = (c and ((c.InCombat and c.InCombat()) or (c.IsInInstance and c.IsInInstance())))
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
