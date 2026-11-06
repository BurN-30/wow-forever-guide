-- Groupe Alliance: a small companion for Polestar.
--  * Ctrl-click a line of the guide window (quest, NPC, item, object): Polestar's
--    own copy window opens with the Wowhead Forever link, selected for Ctrl-C.
--  * Hovering a line adds one hint line ("Ctrl-click: Wowhead link") and, for the
--    quests this pack added that are not fully confirmed, a "?" reliability line.
--  * Calm defaults, applied once (the player can turn them back on in Polestar's
--    options): no auto accept or turn-in, no guide-end or route-choice window,
--    no class guide offered by itself, no welcome window; guides suggested
--    from this pack first (Polestar's own fill in where it has none).
--  * /ga lang auto|fr|en: language of the links (default: the client's).
-- Polestar exposes its namespace as the global `Polestar` (Core/Init.lua).
local ADDON, ns = ...

local function locale()
	local db = GroupeAllianceDB or {}
	if db.lang == "fr" then return "frFR" end
	if db.lang == "en" then return "enUS" end
	return GetLocale() == "frFR" and "frFR" or "enUS"
end

local T = {
	frFR = {
		hint = "Ctrl+clic : lien Wowhead (commentaires utiles)",
		copy = "Lien Wowhead",
		lang = "Langue des liens Wowhead : %s (auto, fr, en).",
		reliable = "Fiabilité",
	},
	enUS = {
		hint = "Ctrl-click: Wowhead link (useful comments)",
		copy = "Wowhead link",
		lang = "Wowhead link language: %s (auto, fr, en).",
		reliable = "Reliability",
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
	local P = Polestar
	if kind and P and P.UI and P.UI.ShowCopy then
		P.UI.ShowCopy(tr("copy"), wowhead(kind, id))
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
	local rel = goal.quest and ns.Reliability[goal.quest]
	if rel then
		GameTooltip:AddLine(("|cffffd100%s|r  %s : %s"):format(rel[1], tr("reliable"), rel[2][locale()]), 0.8, 0.8, 0.8, true)
	end
	GameTooltip:AddLine(tr("hint"), 0.55, 0.75, 1, true)
	GameTooltip:Show()
end

local function calmDefaults()
	local P = Polestar
	if not (P and P.Set and P.DB) then return end
	GroupeAllianceDB = GroupeAllianceDB or {}
	if not GroupeAllianceDB.calmApplied then
		P.Set("behavior.autoAccept", false)
		P.Set("behavior.autoTurnin", false)
		P.Set("behavior.guideEnd", "continue") -- next guide loads in place, no window
		P.Set("behavior.routeChoice", "recommended") -- no route-choice window
		P.Set("behavior.offerClassQuests", false) -- no tab opening by itself
		P.Set("behavior.suggestFrom", "groupe-alliance") -- this pack first, Polestar fills in
		P.DB().welcomeSeen = 1
		GroupeAllianceDB.calmApplied = 1
	end
	GroupeAllianceCharDB = GroupeAllianceCharDB or {}
	if not GroupeAllianceCharDB.calmApplied and P.CharState then
		P.CharState().welcomeSeen = 1
		GroupeAllianceCharDB.calmApplied = 1
	end
end

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(_, _, name)
	if name ~= ADDON then return end
	calmDefaults()
	local W = Polestar and Polestar.Widgets
	if W and W.Tooltip then hooksecurefunc(W, "Tooltip", afterTooltip) end
end)

SLASH_GROUPEALLIANCE1 = "/ga"
SlashCmdList.GROUPEALLIANCE = function(msg)
	local arg = (msg or ""):lower():match("lang%s+(%a+)")
	GroupeAllianceDB = GroupeAllianceDB or {}
	if arg == "fr" or arg == "en" then GroupeAllianceDB.lang = arg
	elseif arg == "auto" then GroupeAllianceDB.lang = nil end
	print(tr("lang"):format(GroupeAllianceDB.lang or "auto"))
end
