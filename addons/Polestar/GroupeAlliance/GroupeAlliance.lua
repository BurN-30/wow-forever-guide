-- Groupe Alliance: a small module built into Polestar (modified by BurN-30,
-- 2026-11-06, GPL-3.0; tools/build.py adds this folder to Polestar.toc).
--  * Ctrl-click a line of the guide window (quest, NPC, item, object): Polestar's
--    own copy window opens with the Wowhead Forever link, selected for Ctrl-C.
--  * Hovering a line adds this pack's tip for the quest (Tips.lua), a "?"
--    reliability line for the quests not fully confirmed (Reliability.lua) and
--    one hint line ("Ctrl-click: Wowhead link").
--  * A "?" button on the guide window's tab strip: a short help in its tooltip.
--  * Calm defaults for a group of beginners, as Polestar defaults (the player
--    can still change them in Polestar's options): no auto accept or turn-in,
--    no guide-end or route-choice window, no class guide offered by itself,
--    group quests done, guides suggested from this pack first (Polestar's own
--    fill in where it has none), no welcome window.
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
		},
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
		},
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

-- The "?" button (UI/GuideFrame.lua calls GA.HelpButton(strip) as it builds
-- the tab strip, and keeps room for it at its right end): the help is its
-- tooltip, on hover or on click.
function GA.HelpButton(parent)
	local b = CreateFrame("Button", nil, parent)
	b:SetSize(20, 20)
	local t = b:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	t:SetPoint("CENTER", b, "CENTER", 0, 0)
	t:SetText("?")
	b.Label = t
	local function show(self)
		local W = ns.Widgets
		if W and W.Tooltip then W.Tooltip(self, "ANCHOR_BOTTOMLEFT", tr("helpTitle"), tr("help")) end
	end
	b:SetScript("OnEnter", function(self)
		t:SetTextColor(1, 1, 1)
		show(self)
	end)
	b:SetScript("OnLeave", function(self)
		t:SetTextColor(1, 0.82, 0)
		if GameTooltip:IsOwned(self) then GameTooltip:Hide() end
	end)
	b:SetScript("OnClick", show)
	return b
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
