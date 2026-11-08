-- Groupe Alliance: a small module built into Polestar (modified by BurN-30,
-- 2026-11-06, GPL-3.0; tools/build.py adds this folder to Polestar.toc).
--  * Ctrl-click a line of the guide window (quest, NPC, item, object): Polestar's
--    own copy window opens with the Wowhead Forever link, selected for Ctrl-C.
--  * Hovering a line adds this pack's tip for the quest (Tips.lua), a "?"
--    reliability line for the quests not fully confirmed (Reliability.lua) and
--    one hint line ("Ctrl-click: Wowhead link").
--  * Three buttons at the right end of the guide window's tab strip: a gear
--    (Polestar's options), "?" (a short help in its tooltip) and "_" (reduce:
--    the window gives way to a small Polestar icon, see "Reduced window").
--  * Quests accepted and turned in for the player (0.7.3), with Polestar's own
--    engine (Core/Automation.lua): only the quests of the guide's current step,
--    Shift held skips once, never a reward choice, a quest that costs money or
--    flags for PvP. On top of it (see "Quest automation" below): never a quest
--    the player excepted (right-click a guide line, list on the Questing page),
--    never a group quest not answered "Do it with a group", and the quests a
--    party member shares or starts (escorts) taken at once from the current
--    step or the next two.
--  * Calm defaults for a group of beginners, as Polestar defaults (the player
--    can still change them in Polestar's options): no guide-end or route-choice
--    window, no class guide offered by itself, group quests asked one by one, guides suggested from this pack first (Polestar's own
--    fill in where it has none), no welcome window, Polestar's minimap button on,
--    grey quests left out (friends play at different times: whoever is ahead
--    is not sent back to quests that no longer give XP), and Polestar's quest
--    map marks on, kept calm (0.6.2): turn-ins, and the objectives of the
--    guide's current step only; no shaded areas, no quest givers, nothing on
--    the minimap. Each one is a tick in the "Polestar: quest markers" submenu
--    of the world map's and the minimap's tracking menus ("Quest markers").
--  * A small green mark at the end of a guide line whose quest has a tip:
--    hover it to read the tip.
--  * A small orange or red warning mark on a line that is hard at the player's
--    real level (Danger.lua: elites, packs, escorts, quests well above the
--    player); its tooltip says why, the level advised alone and the group size.
--  * A purple "Escort" label at the end of an escort quest's lines (0.7.4,
--    GA.IsEscort: Polestar's `escort` flag plus GA.EXTRA_ESCORTS); its tooltip
--    says what an escort is and how to do it in a group. Off: ui.gaEscortBadge.
--  * Group quests are asked, one by one (Polestar's "Skip it / Do it with a
--    group" banner): whoever plays alone skips them in one click.
--  * /ga lang auto|fr|en: language of the links (default: the client's).
local _, ns = ...
local GA = ns.GA or {}
ns.GA = GA

-- 0.7.3: autoAccept and autoTurnin back to Polestar's own default (on), set
-- here too so the module says what it ships. Only values unlike the default
-- are stored (Core/Init.lua): a player of 0.7.2 who never touched them, or
-- who switched them off then (false was the default, so nothing was stored),
-- gets them on.
ns.RegisterDefaults("behavior", {
	autoAccept = true,
	autoTurnin = true,
	gaShared = true, -- ours: a quest a party member shares or starts (escort), taken from the next steps too
	guideEnd = "continue", -- the next guide loads in place, no window
	routeChoice = "recommended", -- no route-choice window
	offerClassQuests = false, -- no tab opening by itself: class quests are in this pack's guides
	groupQuests = "ask", -- friends who often play alone: each group quest is asked once (Skip it / Do it with a group)
	suggestFrom = "groupe-alliance", -- this pack first, Polestar fills in
	skipGrey = true, -- whoever went ahead alone is not sent back to grey quests
})
-- Polestar's quest marks (Quests/QuestDB.lua), off by default there. Settings
-- equal to their default are not stored (Core/Init.lua), so these reach every
-- player who did not change them. 0.6.2: areas and quest givers off (every
-- spawn of every objective in the log, shaded, made the map unreadable), and
-- gaStepObjectives (ours) keeps only the objectives of the guide's current step.
ns.RegisterDefaults("qol", {
	mapObjectives = true,
	gaStepObjectives = true,
	objectiveAreas = false,
	turnInMarkers = true,
	availableQuests = false,
	minimapObjectives = false,
	questLevelWindow = 3,
	guideDim = true,
})
-- Polestar's own minimap button (Maps/MinimapButton.lua), off by default
-- outside the gamepad interface: on, a click shows or hides the guide.
ns.RegisterDefaults("maps", { minimapButton = true })

local function settings()
	local db = ns.DB()
	if type(db.groupeAlliance) ~= "table" then db.groupeAlliance = {} end
	return db.groupeAlliance
end

local function locale()
	local lang = settings().lang
	if lang == "fr" then return "frFR" end
	if lang == "en" then return "enUS" end
	return GetLocale() == "frFR" and "frFR" or "enUS"
end
GA.Locale = locale

local T = {
	frFR = {
		hint = "Ctrl+clic : lien Wowhead (commentaires utiles)",
		copy = "Lien Wowhead",
		lang = "Langue des liens Wowhead : %s (auto, fr, en).",
		reliable = "Fiabilité",
		tip = "Astuce",
		danger = "Difficile au niveau %d",
		dangerSolo = "conseillé seul : niveau %d",
		dangerGroup = "ou à %d joueurs",
		dangerElite = "Quête élite : un ennemi élite tape bien plus fort qu'un ennemi normal. Seul : revenir quelques niveaux plus tard ; sinon à deux ou trois.",
		dangerEscort = "Escorte : le PNJ attire des embuscades. Seul : soigner ou tuer vite, rester près de lui.",
		dangerHigh = "Quête bien au-dessus du niveau : ennemis plus forts, plus de coups ratés. Seul : la garder pour plus tard ; à plusieurs, elle passe.",
		escortGroup = "Escorte à plusieurs : chacun prend la quête AVANT que l'un d'eux lance l'escorte, sinon elle ne compte pas pour lui.",
		escortBadge = "Escorte",
		escortWhat = "Un PNJ marche jusqu'à un lieu et il faut le protéger en route : s'il meurt, la quête échoue et il faut la reprendre.",
		escortNear = "Ne pas trop s'éloigner du PNJ : s'il se retrouve seul trop longtemps, l'escorte peut échouer.",
		escortAuto = "Lancée par un membre du groupe, l'escorte est acceptée toute seule si elle est dans l'étape en cours ou les deux suivantes (Maj enfoncée : pas cette fois).",
		escortOption = "Badge « Escorte »",
		escortOptionHelp = "Une étiquette violette « Escorte » en bout de ligne sur les quêtes d'escorte ; la survoler explique comment faire seul ou en groupe.",
		helpTitle = "Groupe Alliance : aide",
		help = {
			"Survoler une ligne : détails et astuces.",
			"Ctrl+clic sur une ligne : lien Wowhead, Ctrl+C pour le copier.",
			"|cffffd100?|r jaune : info pas encore confirmée, à vérifier sur Wowhead.",
			"Marque orange ou rouge : difficile à ton niveau, la survoler pour savoir comment faire seul ou à plusieurs.",
			"|cffa385ffEscorte|r en bout de ligne : quête d'escorte, en groupe chacun la prend avant le départ.",
			"Quête de groupe : le guide propose « La passer » ou « La faire en groupe » ; seul, la passer.",
			"Quêtes de l'étape en cours prises et rendues toutes seules. Maj enfoncée : pas cette fois. Clic droit sur une ligne : jamais pour cette quête.",
			"Changer de guide : /polestar guides, ou le + des onglets.",
			"/ga lang fr, en ou auto : langue des liens Wowhead.",
			"Réduire : bouton _ ; masquer : /polestar hide, raccourci dans Options > Raccourcis > Polestar.",
			"Roue dentée : réglages de Polestar (flèche, affichage, automatismes).",
		},
		reduceTitle = "Réduire",
		reduce = { "La fenêtre laisse place à une petite icône Polestar. Clic sur l'icône : la rouvrir." },
		gearTitle = "Réglages",
		gear = "Réglages : flèche de direction, affichage, automatismes…",
		noGuide = "Aucun guide ouvert",
		step = "Étape %d sur %d : %s",
		done = "Guide terminé",
		miniClick = "Clic : rouvrir la fenêtre du guide",
		miniRight = "Clic droit : icône ou bannière",
		miniDrag = "Glisser : déplacer",
		report = "Un souci dans un guide Groupe Alliance : le dire au groupe ou ouvrir une issue sur github.com/BurN-30/wow-forever-guide, pas sur le Discord de Polestar.",
		marks = "Polestar : repères de quête",
		marksObjectives = "Objectifs sur la carte",
		marksStep = "Seulement ceux de l'étape en cours",
		marksStepHelp = "Pendant un guide, les cartes ne montrent que les objectifs des quêtes de l'étape en cours ; sans guide, tous les objectifs restent affichés.",
		marksAreas = "Zones d'objectif ombrées",
		marksTurnin = "Quêtes à rendre",
		marksAvailable = "Quêtes disponibles",
		marksMinimap = "Repères sur la minicarte",
		autoMenu = "Ne pas prendre ni rendre automatiquement",
		autoMenuTip = "Cette quête n'est plus prise ni rendue toute seule, pour ce compte. Même entrée pour décocher ; liste dans la roue dentée, Quêtes.",
		autoHeld = "Prise et rendue à la main (clic droit pour changer).",
		autoSection = "Groupe Alliance : quêtes automatiques",
		autoShared = "Quêtes partagées et escortes du groupe",
		autoSharedHelp = "Une quête qu'un membre du groupe partage, ou une escorte qu'il lance, est acceptée tout de suite si elle est dans l'étape en cours ou les deux suivantes, sauf exception. Avec « Accepter les quêtes du guide » allumé. Maj enfoncée : pas cette fois.",
		autoList = "Exceptions",
		autoListHelp = "Quêtes jamais prises ni rendues toutes seules. Ajouter : clic droit sur une ligne du guide. Décocher une quête ci-dessous lui rend l'automatisme.",
		autoClear = "Tout retirer",
		autoClearText = "Toutes les quêtes de la liste seront de nouveau prises et rendues toutes seules quand le guide y arrive.",
		autoRowHelp = "Cochée : jamais prise ni rendue toute seule. Décocher pour lui rendre l'automatisme.",
		escortTaken = "Groupe Alliance : quête de %s acceptée tout de suite : %s.",
		autoTold = "Groupe Alliance 0.7.3 : le guide prend et rend tout seul les quêtes de l'étape en cours. Maj enfoncée : pas cette fois. Clic droit sur une ligne : jamais pour cette quête. Couper : roue dentée, Quêtes, Quêtes plus rapides.",
		leatrix = "Groupe Alliance : l'option « Automate quests » de Leatrix Plus est allumée. Elle prend aussi les quêtes de groupe que le guide propose de passer : l'éteindre dans Leatrix Plus (/ltp). Le guide prend déjà les quêtes de l'étape en cours.",
	},
	enUS = {
		hint = "Ctrl-click: Wowhead link (useful comments)",
		copy = "Wowhead link",
		lang = "Wowhead link language: %s (auto, fr, en).",
		reliable = "Reliability",
		tip = "Tip",
		danger = "Hard at level %d",
		dangerSolo = "advised alone: level %d",
		dangerGroup = "or %d players",
		dangerElite = "Elite quest: an elite enemy hits far harder than a normal one. Alone: come back a few levels later; else bring one or two friends.",
		dangerEscort = "Escort: the NPC draws ambushes. Alone: heal or kill fast and stay close to them.",
		dangerHigh = "Quest well above your level: tougher enemies, more missed hits. Alone: keep it for later; in a group it is fine.",
		escortGroup = "Escort in a group: everyone takes the quest BEFORE one of you starts the escort, or it does not count for them.",
		escortBadge = "Escort",
		escortWhat = "An NPC walks to a place and you protect them on the way: if they die, the quest fails and you take it again.",
		escortNear = "Do not stray far from the NPC: left alone too long, the escort can fail.",
		escortAuto = "Started by a party member, the escort is accepted for you when it is in the current step or the next two (hold Shift: not this time).",
		escortOption = "\"Escort\" badge",
		escortOptionHelp = "A purple \"Escort\" label at the end of an escort quest's lines; hover it to see how to do it alone or in a group.",
		helpTitle = "Group Alliance: help",
		help = {
			"Hover a line: details and tips.",
			"Ctrl-click a line: Wowhead link, Ctrl-C to copy it.",
			"Yellow |cffffd100?|r: not confirmed yet, check Wowhead.",
			"Orange or red mark: hard at your level, hover it to see how to do it alone or in a group.",
			"|cffa385ffEscort|r at the end of a line: an escort quest, in a group everyone takes it before the start.",
			"Group quest: the guide asks \"Skip it\" or \"Do it with a group\"; alone, Skip it.",
			"The current step's quests are accepted and turned in for you. Hold Shift: not this time. Right-click a line: never for that quest.",
			"Change guide: /polestar guides, or the tabs' +.",
			"/ga lang fr, en or auto: Wowhead link language.",
			"Reduce: the _ button; hide: /polestar hide, key binding in Options > Keybindings > Polestar.",
			"Gear: Polestar's settings (arrow, display, automation).",
		},
		reduceTitle = "Reduce",
		reduce = { "The window gives way to a small Polestar icon. Click the icon to open it again." },
		gearTitle = "Settings",
		gear = "Settings: direction arrow, display, automation…",
		noGuide = "No guide open",
		step = "Step %d of %d: %s",
		done = "Guide complete",
		miniClick = "Click: open the guide window again",
		miniRight = "Right-click: icon or banner",
		miniDrag = "Drag: move",
		report = "A problem in a Group Alliance guide: tell the group or open an issue on github.com/BurN-30/wow-forever-guide, not on Polestar's Discord.",
		marks = "Polestar: quest markers",
		marksObjectives = "Objectives on the map",
		marksStep = "Only the current step's",
		marksStepHelp = "While a guide runs, the maps show only the objectives of the current step's quests; without a guide, every objective stays shown.",
		marksAreas = "Shaded objective areas",
		marksTurnin = "Turn-ins",
		marksAvailable = "Available quests",
		marksMinimap = "Markers on the minimap",
		autoMenu = "Don't accept or turn in automatically",
		autoMenuTip = "This quest is no longer accepted or turned in for you, on this account. Same entry to untick; list under the gear, Questing.",
		autoHeld = "Accepted and turned in by hand (right-click to change).",
		autoSection = "Group Alliance: automatic quests",
		autoShared = "Shared quests and group escorts",
		autoSharedHelp = "A quest a party member shares, or an escort they start, is accepted at once when it is in the current step or the next two, unless excepted. With \"Accept guide quests\" on. Hold Shift: not this time.",
		autoList = "Exceptions",
		autoListHelp = "Quests never accepted or turned in for you. Add one: right-click a guide line. Untick a quest below to give it back to the automation.",
		autoClear = "Remove all",
		autoClearText = "Every quest of the list will be accepted and turned in for you again when the guide gets there.",
		autoRowHelp = "Ticked: never accepted or turned in for you. Untick to give it back to the automation.",
		escortTaken = "Group Alliance: %s's quest accepted at once: %s.",
		autoTold = "Group Alliance 0.7.3: the guide now accepts and turns in the current step's quests for you. Hold Shift: not this time. Right-click a line: never for that quest. Off: gear, Questing, Faster questing.",
		leatrix = "Group Alliance: Leatrix Plus's \"Automate quests\" is on. It also takes the group quests the guide lets you skip: switch it off in Leatrix Plus (/ltp). The guide already takes the current step's quests.",
	},
}
local function tr(key) return T[locale()][key] end

---------------------------------------------------------------------------
-- Quest markers. Polestar's quest tracker (Quests/Tracker.lua) publishes one
-- marker per spawn cluster of every objective of every quest in the log, on
-- the "quests.objectives" Pins layer. With qol.gaStepObjectives on and a guide
-- running, that layer keeps only the markers of the current step's quests
-- (Polestar's own set, QuestDB.IsGuideQuest). Turn-ins and quest givers are
-- other layers, left whole. The "Polestar: quest markers" submenu in the world
-- map's and the minimap's tracking menus ticks the same settings as the Map
-- options page; each tick fires SETTING_CHANGED, so the maps redraw at once.
---------------------------------------------------------------------------

local OBJECTIVES = "quests.objectives"

local function guideRunning()
	local E = ns.Engine
	local guide = E and E.GetGuide and E.GetGuide()
	local i = guide and E.GetStepIndex and E.GetStepIndex()
	return i ~= nil and type(guide.steps) == "table" and type(guide.steps[i]) == "table"
end

-- The objective markers to show: all of them, or the current step's only.
function GA.StepObjectives(pins)
	local Q = ns.QuestDB
	if type(pins) ~= "table" or not ns.Get("qol.gaStepObjectives") or not (Q and Q.IsGuideQuest) or not guideRunning() then
		return pins
	end
	local out = {}
	for i = 1, #pins do
		local pin, keep = pins[i], false
		local refs = pin.refs
		if type(refs) ~= "table" then
			keep = true
		else
			for k = 1, #refs do
				local r = refs[k]
				local q = type(r) == "number" and r or (type(r) == "table" and r.q)
				if q and Q.IsGuideQuest(q) then
					keep = true
					break
				end
			end
		end
		if keep then out[#out + 1] = pin end
	end
	return out
end

local function hookPins()
	local Pins = ns.Pins
	if not (Pins and Pins.SetLayer) or Pins.gaSetLayer then return end
	local setLayer = Pins.SetLayer
	Pins.gaSetLayer = setLayer
	Pins.SetLayer = function(name, pins, opts)
		if name == OBJECTIVES then pins = GA.StepObjectives(pins) end
		return setLayer(name, pins, opts)
	end
end

-- The tracker does not listen to our setting: setting qol.objectiveAreas to
-- its own value fires the SETTING_CHANGED it republishes its layers on.
ns.On("SETTING_CHANGED", function(path)
	if path == "qol.gaStepObjectives" then ns.Set("qol.objectiveAreas", ns.Get("qol.objectiveAreas")) end
end)

local MARKS = {
	{ "marksObjectives", "qol.mapObjectives" },
	{ "marksStep", "qol.gaStepObjectives" },
	{ "marksAreas", "qol.objectiveAreas" },
	{ "marksTurnin", "qol.turnInMarkers" },
	{ "marksAvailable", "qol.availableQuests" },
	false, -- a divider
	{ "marksMinimap", "qol.minimapObjectives" },
}
-- The tracker loads its quest data only while qol.questDB is on.
local NEEDS_DB = { ["qol.mapObjectives"] = true, ["qol.turnInMarkers"] = true, ["qol.availableQuests"] = true, ["qol.minimapObjectives"] = true }

function GA.AddMarksMenu(_, root)
	local menu = root:CreateButton(tr("marks"))
	for _, m in ipairs(MARKS) do
		if not m then
			menu:CreateDivider()
		else
			local key = m[2]
			menu:CreateCheckbox(tr(m[1]), function() return ns.Get(key) == true end, function()
				local on = not ns.Get(key)
				if on and NEEDS_DB[key] and not ns.Get("qol.questDB") then ns.Set("qol.questDB", true) end
				ns.Set(key, on)
				return MenuResponse and MenuResponse.Refresh
			end)
		end
	end
end

-- As Polestar's own entries (Maps/Services.lua, Nav/Nearby.lua): not with
-- the gamepad interface, whose focus the game's menus join as they open.
ns.OnLogin(function()
	if (ns.GamepadUI and ns.GamepadUI()) or not (Menu and Menu.ModifyMenu) then return end
	Menu.ModifyMenu("MENU_WORLD_MAP_TRACKING", GA.AddMarksMenu)
	Menu.ModifyMenu("MENU_MINIMAP_TRACKING", GA.AddMarksMenu)
end)

---------------------------------------------------------------------------
-- Quest automation (0.7.3). Polestar's engine accepts and turns in the
-- quests of the guide's live step (Core/Automation.lua, Engine.WantsQuest).
-- tools/build.py makes it ask GA.HoldsQuest(q) before it acts and, on a
-- quest window a party member opened (a shared quest), GA.AcceptSpan() for
-- how many steps past the live one it may look. Held back:
--  * the player's exceptions: right-click a guide line, "Don't accept or
--    turn in automatically"; account-wide (groupeAlliance.noAuto[q] = the
--    quest's title, or true), listed on the Questing page;
--  * a quest of a step that waits on a group answer (`when group X`) unless
--    X is answered "do". Engine.WantsQuest already leaves out a step whose
--    answer is "skip" and the one quest an unanswered step asks about, but
--    not that step's other quests (Redridge: `when group 19` takes 169 and
--    95999) nor an `along` step, which never waits for its answer.
-- Polestar's own window closing (behavior.closeSkipped, guideTakes) does not
-- ask here: a held quest's window stays open for the player.
-- Escorts: a party member starting one fires QUEST_ACCEPT_CONFIRM (who,
-- title) and the game shows its QUEST_ACCEPT dialog, whose Yes calls
-- ConfirmAcceptQuest. With behavior.autoAccept and behavior.gaShared on and
-- Shift up, a quest of that title the guide takes in the live step or the
-- next SPAN, not held, is confirmed at once and the dialog closed (as
-- Polestar's QoL.ClosePopup does for summons; left up under the gamepad
-- interface). No title match: the dialog stays, the player answers.
---------------------------------------------------------------------------

local SPAN = 2 -- steps past the live one for shared quests and escorts
GA.SPAN = SPAN

local function noAuto()
	local s = settings()
	if type(s.noAuto) ~= "table" then s.noAuto = {} end
	return s.noAuto
end

function GA.NoAuto(q)
	local s = settings().noAuto
	return type(q) == "number" and type(s) == "table" and s[q] ~= nil and s[q] ~= false
end

-- The exceptions the Questing page lists this session: those of login, sorted,
-- then each one added since. A row stays after its quest is unticked, so it
-- can be ticked back; it is gone at the next login.
local listed
local function listedQuests()
	if not listed then
		listed = {}
		for q in pairs(settings().noAuto or {}) do
			if type(q) == "number" and GA.NoAuto(q) then listed[#listed + 1] = q end
		end
		table.sort(listed)
	end
	return listed
end
GA.Listed = listedQuests

function GA.SetNoAuto(q, on, title)
	if type(q) ~= "number" then return end
	local list = noAuto()
	if on then
		list[q] = type(title) == "string" and title ~= "" and title or (type(list[q]) == "string" and list[q]) or true
		local shown = listedQuests()
		local found = false
		for i = 1, #shown do if shown[i] == q then found = true break end end
		if not found then shown[#shown + 1] = q end
	else
		list[q] = nil
	end
end

local function questName(q)
	local N = ns.Names
	local name = N and N.Quest and N.Quest(q)
	local s = settings().noAuto
	if not name and type(s) == "table" and type(s[q]) == "string" then name = s[q] end
	return name or ("#" .. q)
end

-- The guides open in tabs, steps read (Engine.TabIds, Guides.Get), the
-- active one first.
local function openGuides()
	local out, seen = {}, {}
	local E, G = ns.Engine, ns.Guides
	local function add(g)
		if type(g) == "table" and not seen[g] and type(g.steps) == "table" then
			seen[g] = true
			out[#out + 1] = g
		end
	end
	add(E and E.GetGuide and E.GetGuide())
	local ids = E and E.TabIds and E.TabIds() or {}
	for id in pairs(ids) do add(G and G.Get and G.Get(id)) end
	return out
end

-- Per guide's step list: quest -> the group quests (`when group X`, not
-- `!group`) of the steps that accept or turn it in.
local groupIndex = setmetatable({}, { __mode = "k" })
local GATED = { accept = true, turnin = true }
local function groupsOf(steps)
	local idx = groupIndex[steps]
	if idx then return idx end
	idx = {}
	for _, step in ipairs(steps) do
		local groups
		for _, p in ipairs(type(step.when) == "table" and step.when or {}) do
			if type(p) == "table" and p.k == "group" and not p.neg and type(p.q) == "number" then
				groups = groups or {}
				groups[#groups + 1] = p.q
			end
		end
		if groups then
			for _, goal in ipairs(type(step.goals) == "table" and step.goals or {}) do
				local q = type(goal) == "table" and GATED[goal.t] and goal.quest
				if type(q) == "number" then
					local list = idx[q] or {}
					for _, x in ipairs(groups) do list[#list + 1] = x end
					idx[q] = list
				end
			end
		end
	end
	groupIndex[steps] = idx
	return idx
end

-- A quest of a group step whose answer is not "do" (unanswered or skipped).
function GA.GroupHeld(q)
	local E = ns.Engine
	if type(q) ~= "number" or not (E and E.GroupAnswer) then return false end
	for _, g in ipairs(openGuides()) do
		for _, x in ipairs(groupsOf(g.steps)[q] or {}) do
			if E.GroupAnswer(x) ~= "do" then return true end
		end
	end
	return false
end

-- Asked by Core/Automation.lua (tools/build.py) before each accept or turn-in.
function GA.HoldsQuest(q)
	if type(q) ~= "number" then return false end
	return GA.NoAuto(q) or GA.GroupHeld(q)
end

local function readable(v)
	local C = ns.Compat
	if C and C.Readable then return C.Readable(v) end
	return v
end

-- The quest window shows a quest a party member shares (its giver is a
-- player, not an NPC): look SPAN steps past the live one. Else Polestar's 0.
function GA.AcceptSpan()
	if not ns.Get("behavior.gaShared") then return 0 end
	if not (UnitExists and UnitIsPlayer) then return 0 end
	for _, unit in ipairs({ "questnpc", "npc" }) do
		if readable(UnitExists(unit)) and readable(UnitIsPlayer(unit)) and not (UnitIsUnit and readable(UnitIsUnit(unit, "player"))) then
			return SPAN
		end
	end
	return 0
end

local function norm(s)
	s = readable(s)
	if type(s) ~= "string" then return nil end
	s = s:lower():gsub("^%s+", ""):gsub("%s+$", "")
	return s
end

-- The quest called `title` (as the game names it) that the guide takes in
-- the live step or the next SPAN, not in the log, not held; or nil.
function GA.EscortQuest(title)
	local want = norm(title)
	local E, C, N = ns.Engine, ns.Compat, ns.Names
	if not want or want == "" or not (E and E.WantsQuest and C) then return nil end
	local seen = {}
	for _, g in ipairs(openGuides()) do
		for _, step in ipairs(g.steps) do
			for _, goal in ipairs(type(step.goals) == "table" and step.goals or {}) do
				local q = type(goal) == "table" and goal.t == "accept" and goal.quest
				if type(q) == "number" and not seen[q] then
					seen[q] = true
					local named = norm(C.GetQuestTitle and C.GetQuestTitle(q)) == want
						or norm(N and N.Cached and N.Cached("quest", q)) == want
						or norm(goal.title) == want
					if named and not (C.IsOnQuest and C.IsOnQuest(q)) and not GA.HoldsQuest(q) and E.WantsQuest("accept", q, SPAN) then
						return q
					end
				end
			end
		end
	end
	return nil
end

function GA.OnEscort(_, who, title)
	if not (ns.Get("behavior.autoAccept") and ns.Get("behavior.gaShared")) or not ConfirmAcceptQuest then return false end
	local C = ns.Compat
	if C and C.IsShiftKeyDown and C.IsShiftKeyDown() then return false end
	if C and C.GetLogQuests and C.GetLogCap and #C.GetLogQuests() >= C.GetLogCap() then return false end
	local q = GA.EscortQuest(title)
	if not q then return false end
	ConfirmAcceptQuest()
	local QoL = ns.QoL
	if QoL and QoL.ClosePopup then QoL.ClosePopup("QUEST_ACCEPT") end
	if ns.Print then ns.Print(tr("escortTaken"):format(tostring(readable(who) or "?"), questName(q))) end
	return true
end
if ns.RegisterEvent then ns.RegisterEvent("QUEST_ACCEPT_CONFIRM", GA.OnEscort) end

-- The quest titles of the next steps, asked of the server ahead (an escort's
-- title is matched on them).
local function askTitles()
	local E, C = ns.Engine, ns.Compat
	local g = E and E.GetGuide and E.GetGuide()
	local i = E and E.GetLiveStep and E.GetLiveStep()
	if not (g and type(g.steps) == "table" and i and C and C.RequestQuest and C.GetQuestTitle) then return end
	for s = i, math.min(#g.steps, i + 5) do
		for _, goal in ipairs(type(g.steps[s].goals) == "table" and g.steps[s].goals or {}) do
			if goal.t == "accept" and type(goal.quest) == "number" and not C.GetQuestTitle(goal.quest) then C.RequestQuest(goal.quest) end
		end
	end
end
for _, msg in ipairs({ "GUIDE_CHANGED", "STEP_CHANGED" }) do ns.On(msg, askTitles) end

-- A guide line's right-click menu (UI/GuideFrame.lua, rowMenu, through
-- tools/build.py): one ticked entry, the quest's exception.
function GA.RowMenu(goal, items)
	local q = type(goal) == "table" and goal.quest
	if type(q) ~= "number" or type(items) ~= "table" then return end
	items[#items + 1] = { separator = true }
	items[#items + 1] = { text = tr("autoMenu"), checked = GA.NoAuto(q), tip = tr("autoMenuTip"),
		onClick = function() GA.SetNoAuto(q, not GA.NoAuto(q), goal.title) end }
end

local AUTO_SLOTS = 40
local function autoOptions()
	if not (ns.RegisterOptions and ns.L) then return end
	local controls = {
		{ kind = "toggle", key = "behavior.gaShared", label = tr("autoShared"), help = tr("autoSharedHelp"),
			search = "escort, share, shared quest, party, group, auto accept" },
		{ kind = "button", button = tr("autoClear"), icon = "reset", label = tr("autoList"),
			help = tr("autoListHelp"), search = "exceptions, auto accept, auto turn in, quest, never",
			confirm = true, confirmTitle = tr("autoClear"), confirmAction = tr("autoClear"), confirmText = tr("autoClearText"),
			onClick = function()
				for _, q in ipairs(listedQuests()) do GA.SetNoAuto(q, false) end
			end },
	}
	for i = 1, AUTO_SLOTS do
		controls[#controls + 1] = { kind = "toggle", child = true, help = tr("autoRowHelp"),
			label = function() local q = listedQuests()[i] return q and questName(q) or "" end,
			needs = function() return listedQuests()[i] ~= nil end,
			get = function() return GA.NoAuto(listedQuests()[i]) end,
			set = function(on) local q = listedQuests()[i] if q then GA.SetNoAuto(q, on and true or false) end end }
	end
	ns.RegisterOptions({ page = ns.L["Questing"], tab = ns.L["Quests"], section = tr("autoSection"), controls = controls })
end
GA.AutoOptions = autoOptions

-- Once per account: the automation is on now (0.7.3), and how to stop it.
-- Leatrix Plus (a separate addon) has its own quest automation, which does
-- not know the guide's group questions: said once when it is on (its saved
-- settings, LeaPlusDB.AutomateQuests == "On"; nothing is read otherwise).
local function tellOnce()
	local s = settings()
	if not s.autoTold and (ns.Get("behavior.autoAccept") or ns.Get("behavior.autoTurnin")) then
		s.autoTold = true
		if ns.Print then ns.Print(tr("autoTold")) end
	end
	local lea = rawget(_G, "LeaPlusDB")
	if not s.leatrixTold and type(lea) == "table" and lea.AutomateQuests == "On" then
		s.leatrixTold = true
		if ns.Print then ns.Print(tr("leatrix")) end
	end
end
GA.TellOnce = tellOnce
ns.OnLogin(function()
	if ns.After then ns.After(6, tellOnce) else tellOnce() end
end)

-- https://www.wowhead.com/forever/quest=96394 (English) and
-- https://www.wowhead.com/forever/fr/quest=96394 (French), checked on 2026-11-06.
local function wowhead(kind, id)
	local lang = locale() == "frFR" and "fr/" or ""
	return ("https://www.wowhead.com/forever/%s%s=%d"):format(lang, kind, id)
end

-- The goal's subject: the quest first, then the NPC, the item, the object.
local function subject(goal)
	if type(goal) ~= "table" then return end
	if goal.quest then return "quest", goal.quest end
	if goal.npc then return "npc", goal.npc end
	if goal.item then return "item", goal.item end
	if goal.object then return "object", goal.object end
end

local function onClick(row, button)
	if button ~= "LeftButton" or not IsControlKeyDown() then return end
	local kind, id = subject(row.psGoal)
	if kind and ns.UI and ns.UI.ShowCopy then
		ns.UI.ShowCopy(tr("copy"), wowhead(kind, id))
	end
end

-- Polestar's tooltips go through Widgets.Tooltip(owner, anchor, title, lines);
-- a goal row carries its goal as owner.psGoal.
-- The tip mark: Polestar's own star (Media/UI/star.tga, 32x32), tinted the
-- tooltip's tip green, after the line's text.
-- The tip of a guide line (Tips.lua). An entry gives a tip for the whole quest (frFR, enUS)
-- and/or one per objective (goals["item:2449"], ["npc:2945"], ["object:17188"]): an
-- objective line (collect, kill, use, interact) shows its own objective's tip, else the
-- quest's; the other lines (accept, turn-in, complete) show the quest's only.
local OBJECTIVE_VERBS = { collect = true, kill = true, use = true, interact = true }
function GA.ObjectiveKey(goal)
	if type(goal) ~= "table" or not OBJECTIVE_VERBS[goal.t] then return nil end
	if goal.item then return "item:" .. goal.item end
	if goal.npc then return "npc:" .. goal.npc end
	if goal.object then return "object:" .. goal.object end
end
function GA.TipOf(goal)
	local q = type(goal) == "table" and goal.quest
	local e = q and GA.Tips and GA.Tips[q]
	if type(e) ~= "table" then return nil end
	local key = GA.ObjectiveKey(goal)
	if key and type(e.goals) == "table" and e.goals[key] then return e.goals[key] end
	if e.enUS then return e end
	return nil
end

local TIP_MARK = "  |TInterface\\AddOns\\Polestar\\Media\\UI\\star:12:12:0:0:32:32:0:32:0:32:140:255:140|t"

-- Escorts (0.7.4). Polestar compiles `escort` on an escort quest's accept and
-- objective lines (Core/Engine.lua, goal views). Two escorts of this pack's
-- route lack it in Polestar's data, listed here (accept and objective lines,
-- never the turn-in): Escape Through Stealth (995, Volcor walks out of the
-- cave, the same NPC as 994, flagged) and Gyromast's Revenge (2078, the
-- Threshwackonator follows the player to Gelkak).
GA.EXTRA_ESCORTS = { [995] = true, [2078] = true }
local ESCORT_KINDS = { accept = true, complete = true, kill = true, collect = true, interact = true, use = true, talk = true }
function GA.IsEscort(goal)
	if type(goal) ~= "table" then return false end
	if goal.escort == true then return true end
	local q = goal.quest
	return type(q) == "number" and GA.EXTRA_ESCORTS[q] == true and ESCORT_KINDS[goal.t] == true
end
-- The badge: a purple label (Polestar's own escort colour, Theme "dungeon")
-- at the end of an open escort line, before the tip and difficulty marks; off
-- with ui.gaEscortBadge (Guide page, Window tab, Groupe Alliance section).
ns.RegisterDefaults("ui", { gaEscortBadge = true })
local function escortHex()
	local Th = ns.Theme
	local ok, hex = false, nil
	if Th and Th.Hex then ok, hex = pcall(Th.Hex, "dungeon") end
	return ok and type(hex) == "string" and hex or "ffa385ff"
end
function GA.EscortBadge(goal)
	if not GA.IsEscort(goal) or goal.status == "done" or goal.status == "skipped" then return nil end
	if ns.Get("ui.gaEscortBadge") == false then return nil end
	return "  |c" .. escortHex() .. tr("escortBadge") .. "|r"
end
-- Difficulty (Danger.lua): the advised level and group for goal's quest at the
-- player's real level (UnitLevel), or nil when it is fine. -> rec, grp, text, gap
local DANGER_KINDS = { accept = true, complete = true, kill = true, collect = true, interact = true, use = true, talk = true }
local function questLevel(q)
	local C = ns.Compat
	local l = C and C.GetQuestLevel and C.GetQuestLevel(q)
	if type(l) ~= "number" then
		local Q = ns.QuestDB
		if Q and Q.F and Q.QuestRecord and (not Q.IsLoaded or Q.IsLoaded()) then
			local r = Q.QuestRecord(q)
			l = r and r[Q.F.LEVEL]
		end
	end
	return type(l) == "number" and l > 0 and l or nil
end
local function playerLevel()
	local l = UnitLevel and UnitLevel("player")
	return type(l) == "number" and l > 0 and l or nil
end
function GA.DangerOf(goal)
	if type(goal) ~= "table" or goal.status == "done" or goal.status == "skipped" then return nil end
	local q = goal.quest
	if not q or (goal.t and not DANGER_KINDS[goal.t]) then return nil end
	local plvl = playerLevel()
	if not plvl then return nil end
	local e = GA.Danger and GA.Danger[q]
	local rec, grp, text
	if e then
		rec, grp, text = e.lvl, e.grp, e[locale()] or e.enUS
	else
		local qlvl = questLevel(q)
		if not qlvl then return nil end
		local p = goal.party
		if type(p) == "table" and p.kind == "elite" then
			rec, grp, text = qlvl + 2, 3, tr("dangerElite")
		elseif GA.IsEscort(goal) then
			rec, text = qlvl, tr("dangerEscort")
		elseif qlvl >= plvl + 3 then
			rec, grp, text = qlvl - 1, 2, tr("dangerHigh")
		end
	end
	if not rec or plvl >= rec then return nil end
	return rec, grp, text, rec - plvl
end
GA.PlayerLevel = playerLevel
-- Polestar's own kill icon (Media/UI/icon-kill.tga, 32x32, white), orange
-- 1-2 levels short, red 3 or more.
local DANGER_MARK = "  |TInterface\\AddOns\\Polestar\\Media\\UI\\icon-kill:12:12:0:0:32:32:0:32:0:32:%s|t"
local function dangerMark(gap)
	return DANGER_MARK:format(gap >= 3 and "255:70:70" or "255:150:30")
end

local function markTips()
	local UI = ns.UI
	if not (UI and UI.GoalLine) or UI.psGATipMark then return end
	local line = UI.GoalLine
	UI.GoalLine = function(goal, ...)
		local text = line(goal, ...)
		local badge = type(text) == "string" and GA.EscortBadge(goal)
		if badge then text = text .. badge end
		if GA.TipOf(goal) and goal.status ~= "done" and goal.status ~= "skipped" and type(text) == "string" then
			text = text .. TIP_MARK
		end
		if type(text) == "string" then
			local rec, _, _, gap = GA.DangerOf(goal)
			if rec then text = text .. dangerMark(gap) end
		end
		return text
	end
	UI.psGATipMark = true
end

-- The guide window redraws its lines at once when the badge is switched.
ns.On("SETTING_CHANGED", function(path)
	if path ~= "ui.gaEscortBadge" then return end
	local GF = ns.UI and ns.UI.GuideFrame
	if GF and GF.Render then GF.Render() end
end)

local hooked = setmetatable({}, { __mode = "k" })
local function afterTooltip(owner)
	if not (owner and owner.psGoal and GameTooltip:IsOwned(owner)) then return end
	local goal = owner.psGoal
	if not subject(goal) then return end
	if not hooked[owner] and owner.HookScript then
		owner:HookScript("OnClick", onClick)
		hooked[owner] = true
	end
	local q = goal.quest
	local rec, grp, why, gap = GA.DangerOf(goal)
	if rec then
		local head = tr("danger"):format(playerLevel()) .. (locale() == "frFR" and " : " or ": ") .. tr("dangerSolo"):format(rec)
		if grp then head = head .. ", " .. tr("dangerGroup"):format(grp) end
		local r, g, b = 1, 0.6, 0.12
		if gap >= 3 then r, g, b = 1, 0.3, 0.3 end
		GameTooltip:AddLine(head .. ".", r, g, b, true)
		if why then GameTooltip:AddLine(why, 1, 0.82, 0.6, true) end
	end
	if q and (goal.t == "accept" or goal.t == "turnin") and goal.status ~= "done" and GA.NoAuto(q) then
		GameTooltip:AddLine(tr("autoHeld"), 0.8, 0.8, 0.8, true)
	end
	-- The badge's tooltip: the line's own, with what an escort is and how to
	-- do it in a group. Badge off: the group line only, as in 0.7.3.
	if GA.EscortBadge(goal) then
		local hex = escortHex()
		local r, g, b = tonumber(hex:sub(3, 4), 16) / 255, tonumber(hex:sub(5, 6), 16) / 255, tonumber(hex:sub(7, 8), 16) / 255
		GameTooltip:AddLine(tr("escortBadge") .. (locale() == "frFR" and " : " or ": ") .. tr("escortWhat"), r, g, b, true)
		GameTooltip:AddLine(tr("escortGroup"), 1, 0.82, 0.6, true)
		GameTooltip:AddLine(tr("escortNear"), 1, 0.82, 0.6, true)
		if ns.Get("behavior.autoAccept") and ns.Get("behavior.gaShared") then
			GameTooltip:AddLine(tr("escortAuto"), 0.8, 0.8, 0.8, true)
		end
	elseif GA.IsEscort(goal) and goal.status ~= "done" and goal.status ~= "skipped" then
		GameTooltip:AddLine(tr("escortGroup"), 1, 0.82, 0.6, true)
	end
	local tip = GA.TipOf(goal)
	if tip then
		GameTooltip:AddLine(tr("tip") .. (locale() == "frFR" and " : " or ": ") .. (tip[locale()] or tip.enUS), 0.55, 1, 0.55, true)
	end
	local rel = q and GA.Reliability and GA.Reliability[q]
	if rel then
		GameTooltip:AddLine(("|cffffd100%s|r  %s%s%s"):format(rel[1], tr("reliable"), locale() == "frFR" and " : " or ": ", rel[2][locale()] or rel[2].enUS), 0.8, 0.8, 0.8, true)
	end
	GameTooltip:AddLine(tr("hint"), 0.55, 0.75, 1, true)
	GameTooltip:Show()
end

---------------------------------------------------------------------------
-- Reduced window: a small Polestar icon (32 px, Polestar's minimap button
-- look) or, right-click, a thin banner (the icon and the current step on one
-- line). Reducing hides the guide window the way /polestar hide does
-- (ui.shown false) and sets groupeAlliance.reduced; the window's own size,
-- resize grip and combat fade stay untouched, since the window is simply not
-- shown. Anything that shows the window again (the icon, /polestar, the key
-- binding, the minimap button) clears the flag and hides the icon; hiding it
-- for good (/polestar hide) hides the icon too. Saved account-wide, like
-- ui.shown: groupeAlliance.reduced, .miniBanner, .miniPos.
---------------------------------------------------------------------------

local ICON, BANNER_W, BANNER_H = 32, 220, 24
local mini

local function stepLines()
	local E = ns.Engine
	local g = E and E.GetGuide and E.GetGuide()
	if not g then return "Polestar", tr("noGuide") end
	local i = E.GetStepIndex()
	if not i then return g.title, tr("done") end
	local view = E.GetStepView(i)
	local summary = view and ns.UI and ns.UI.StepSummary and ns.UI.StepSummary(view) or ""
	return g.title, tr("step"):format(i, E.GetStepCount(), summary)
end

local function placeMini()
	mini:ClearAllPoints()
	local pos = settings().miniPos
	if type(pos) == "table" and type(pos[1]) == "number" and type(pos[2]) == "number" then
		mini:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", pos[1], pos[2])
		return
	end
	-- First time: where the guide window's top-right corner was.
	local F = ns.UI and ns.UI.GuideFrame and ns.UI.GuideFrame.frame
	local right, top = F and F:GetRight(), F and F:GetTop()
	if right and top then
		mini:SetPoint("TOPRIGHT", UIParent, "BOTTOMLEFT", right, top)
	else
		mini:SetPoint("TOP", UIParent, "TOP", 0, -120)
	end
end

local function paintMini()
	local banner = settings().miniBanner and true or false
	mini:SetSize(banner and BANNER_W or ICON, banner and BANNER_H or ICON)
	mini.Circle:SetShown(not banner)
	mini.Hover:SetShown(not banner)
	mini.Back:SetShown(banner)
	mini.Logo:ClearAllPoints()
	if banner then
		mini.Logo:SetSize(BANNER_H - 6, BANNER_H - 6)
		mini.Logo:SetPoint("LEFT", mini, "LEFT", 4, 0)
		local _, line = stepLines()
		mini.Text:SetText(line)
		mini.Text:Show()
	else
		mini.Logo:SetSize(ICON - 10, ICON - 10)
		mini.Logo:SetPoint("CENTER", mini, "CENTER", 0, 0)
		mini.Text:Hide()
	end
end

local function miniTip(self)
	local W = ns.Widgets
	if not (W and W.Tooltip) then return end
	local title, line = stepLines()
	W.Tooltip(self, "ANCHOR_BOTTOMLEFT", title, { line, tr("miniClick"), tr("miniRight"), tr("miniDrag") })
end

local function buildMini()
	if mini then return mini end
	local W = ns.Widgets
	if not (W and W.Tex and W.Text) then return nil end
	mini = CreateFrame("Button", "PolestarGroupeAllianceMini", UIParent)
	mini:SetFrameStrata("MEDIUM")
	mini:SetClampedToScreen(true)
	mini:SetMovable(true)
	mini:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	mini:RegisterForDrag("LeftButton")
	mini.Circle = W.Tex(mini, "BACKGROUND", "circle", "panel")
	mini.Circle:SetAllPoints(mini)
	mini.Back = W.Fill(mini, "panel", "BACKGROUND")
	mini.Logo = W.Tex(mini, "ARTWORK", "logo")
	mini.Hover = W.Tex(mini, "HIGHLIGHT", "circle", "accent")
	mini.Hover:SetAllPoints(mini)
	mini.Hover:SetAlpha(0.25)
	-- The step on one line, cut with "..." at the banner's right edge.
	mini.Text = W.Text(mini, "small", "text")
	mini.Text:SetPoint("LEFT", mini.Logo, "RIGHT", 4, 0)
	mini.Text:SetPoint("RIGHT", mini, "RIGHT", -6, 0)
	mini:SetScript("OnClick", function(self, which)
		W.HideTooltip(self)
		if which == "RightButton" then
			settings().miniBanner = not settings().miniBanner or nil
			paintMini()
			miniTip(self)
		else
			ns.Fire("SHOW_FRAME")
		end
	end)
	mini:SetScript("OnEnter", miniTip)
	mini:SetScript("OnLeave", function(self) W.HideTooltip(self) end)
	mini:SetScript("OnDragStart", function(self)
		W.HideTooltip(self)
		self:StartMoving()
	end)
	mini:SetScript("OnDragStop", function(self)
		self:StopMovingOrSizing()
		local left, top = self:GetLeft(), self:GetTop()
		if left and top then settings().miniPos = { math.floor(left + 0.5), math.floor(top + 0.5) } end
		placeMini()
	end)
	mini:Hide()
	return mini
end

-- The icon shows while the window is reduced, and only then.
local function refreshMini()
	if not ns.IsLoggedIn() then return end
	local s = settings()
	if s.reduced and ns.Get("ui.shown") then s.reduced = nil end
	if not s.reduced then
		if mini then mini:Hide() end
		return
	end
	if not buildMini() then return end
	placeMini()
	paintMini()
	mini:Show()
end

function GA.Reduce()
	settings().reduced = true
	ns.Set("ui.shown", false) -- SETTING_CHANGED shows the icon
end

ns.On("SETTING_CHANGED", function(path)
	if path == "ui.shown" or path == "ui" or path == "" then refreshMini() end
end)
-- /polestar hide while reduced: hidden for good, no icon left behind.
ns.On("HIDE_FRAME", function()
	settings().reduced = nil
	refreshMini()
end)
local function stepMoved()
	if mini and mini:IsShown() then
		paintMini()
		if GameTooltip:IsOwned(mini) then miniTip(mini) end
	end
end
for _, msg in ipairs({ "GUIDE_CHANGED", "STEP_CHANGED", "STEP_UPDATED", "GUIDE_COMPLETED", "TABS_CHANGED" }) do
	ns.On(msg, stepMoved)
end
ns.OnLogin(refreshMini)

---------------------------------------------------------------------------
-- The strip's buttons (UI/GuideFrame.lua calls GA.StripButtons(strip) as it
-- builds the tab strip, and keeps STRIP_W pixels for them at its right end):
-- from left to right the gear (Polestar's options, as the "Open Polestar
-- options" key binding), "?" (the help is its tooltip, on hover or on click)
-- and "_" (reduce).
---------------------------------------------------------------------------

GA.STRIP_W = 64

-- A letter button in the game's gold, white on hover, as Polestar's "?" was.
local function letterButton(parent, letter, dy, tip, onClick)
	local b = CreateFrame("Button", nil, parent)
	b:SetSize(20, 20)
	local t = b:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	t:SetPoint("CENTER", b, "CENTER", 0, dy or 0)
	t:SetText(letter)
	b.Label = t
	b:SetScript("OnEnter", function(self)
		t:SetTextColor(1, 1, 1)
		tip(self)
	end)
	b:SetScript("OnLeave", function(self)
		t:SetTextColor(1, 0.82, 0)
		if GameTooltip:IsOwned(self) then GameTooltip:Hide() end
	end)
	b:SetScript("OnClick", onClick or tip)
	return b
end

local function tooltip(title, lines)
	return function(self)
		local W = ns.Widgets
		if W and W.Tooltip then W.Tooltip(self, "ANCHOR_BOTTOMLEFT", tr(title), tr(lines)) end
	end
end

function GA.StripButtons(parent)
	local reduce = letterButton(parent, "_", 4, tooltip("reduceTitle", "reduce"), function(self)
		if GameTooltip:IsOwned(self) then GameTooltip:Hide() end
		GA.Reduce()
	end)
	reduce:SetPoint("RIGHT", parent, "RIGHT", -2, 0)
	local help = letterButton(parent, "?", 0, tooltip("helpTitle", "help"))
	help:SetPoint("RIGHT", reduce, "LEFT", 0, 0)
	local list = { help, reduce }
	local W = ns.Widgets
	if W and W.IconButton then
		local gear = W.IconButton(parent, "gear", 20, nil, function(self)
			W.HideTooltip(self)
			ns.Fire("TOGGLE_OPTIONS")
		end, 12)
		gear.psTip = tr("gear")
		gear.psTipAnchor = "ANCHOR_BOTTOMLEFT"
		gear:SetPoint("RIGHT", help, "LEFT", 0, 0)
		table.insert(list, 1, gear)
	end
	return list
end

ns.OnInit(function()
	-- No welcome window: the guide opens by itself (Polestar's flags, UI/Welcome.lua).
	local s = ns.CharState()
	if (tonumber(s.welcomeSeen) or 0) < 1 then s.welcomeSeen = 1 end
	local db = ns.DB()
	if (tonumber(db.welcomeSeen) or 0) < 1 then db.welcomeSeen = 1 end
	local W = ns.Widgets
	if W and W.Tooltip then hooksecurefunc(W, "Tooltip", afterTooltip) end
	markTips()
	hookPins()
	autoOptions()
	if ns.RegisterOptions and ns.L then
		ns.RegisterOptions({ page = ns.L["Map"], tab = ns.L["Guide & quests"], section = "Groupe Alliance", controls = {
			{ kind = "toggle", key = "qol.gaStepObjectives", label = tr("marksStep"), help = tr("marksStepHelp"),
				search = "map pins, markers, objectives, guide step, crowded" },
		} })
		ns.RegisterOptions({ page = ns.L["Guide"], tab = ns.L["Window"], section = "Groupe Alliance", controls = {
			{ kind = "toggle", key = "ui.gaEscortBadge", label = tr("escortOption"), help = tr("escortOptionHelp"),
				search = "escort, escorte, badge, label, group, groupe" },
		} })
	end
	-- The bug button sends reports to Polestar's Discord: say where ours go.
	local GF = ns.UI and ns.UI.GuideFrame
	local nav = GF and GF.menuButton and GF.menuButton:GetParent()
	if nav and nav.Report then
		nav.Report.psTipLines = { T[locale()].report }
	end
end)

SLASH_GROUPEALLIANCE1 = "/ga"
SlashCmdList.GROUPEALLIANCE = function(msg)
	local arg = (msg or ""):lower():match("lang%s+(%a+)")
	local db = settings()
	if arg == "fr" or arg == "en" then db.lang = arg
	elseif arg == "auto" then db.lang = nil
	elseif not arg then
		for _, line in ipairs(tr("help")) do print(line) end
	end
	print(tr("lang"):format(db.lang or "auto"))
end
