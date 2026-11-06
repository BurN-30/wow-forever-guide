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
--  * Calm defaults for a group of beginners, as Polestar defaults (the player
--    can still change them in Polestar's options): no auto accept or turn-in,
--    no guide-end or route-choice window, no class guide offered by itself,
--    group quests done, guides suggested from this pack first (Polestar's own
--    fill in where it has none), no welcome window, Polestar's minimap button on.
--  * /ga lang auto|fr|en: language of the links (default: the client's).
local _, ns = ...
local GA = ns.GA or {}
ns.GA = GA

ns.RegisterDefaults("behavior", {
	autoAccept = false,
	autoTurnin = false,
	guideEnd = "continue", -- the next guide loads in place, no window
	routeChoice = "recommended", -- no route-choice window
	offerClassQuests = false, -- no tab opening by itself: class quests are in this pack's guides
	groupQuests = "do", -- a group of friends: group quests are done, no question
	suggestFrom = "groupe-alliance", -- this pack first, Polestar fills in
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
		helpTitle = "Groupe Alliance : aide",
		help = {
			"Survoler une ligne : détails et astuces.",
			"Ctrl+clic sur une ligne : lien Wowhead, Ctrl+C pour le copier.",
			"|cffffd100?|r jaune : info pas encore confirmée, à vérifier sur Wowhead.",
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
	},
	enUS = {
		hint = "Ctrl-click: Wowhead link (useful comments)",
		copy = "Wowhead link",
		lang = "Wowhead link language: %s (auto, fr, en).",
		reliable = "Reliability",
		tip = "Tip",
		helpTitle = "Group Alliance: help",
		help = {
			"Hover a line: details and tips.",
			"Ctrl-click a line: Wowhead link, Ctrl-C to copy it.",
			"Yellow |cffffd100?|r: not confirmed yet, check Wowhead.",
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
	},
}
local function tr(key) return T[locale()][key] end

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
	local tip = q and GA.Tips and GA.Tips[q]
	if tip then
		GameTooltip:AddLine(("%s : %s"):format(tr("tip"), tip[locale()] or tip.enUS), 0.55, 1, 0.55, true)
	end
	local rel = q and GA.Reliability and GA.Reliability[q]
	if rel then
		GameTooltip:AddLine(("|cffffd100%s|r  %s : %s"):format(rel[1], tr("reliable"), rel[2][locale()]), 0.8, 0.8, 0.8, true)
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
