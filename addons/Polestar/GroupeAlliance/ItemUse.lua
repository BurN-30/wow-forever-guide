-- Groupe Alliance: "What is this item for" (modified Polestar, BurN-30, 2026-11-12, GPL-3.0;
-- tools/build.py adds this file and ItemUseData.lua to Polestar.toc).
--
-- One short line under an item's tooltip, only when it tells something the tooltip does not:
--   * a quest that wants it and that this character can still do, or that is done (quest
--     items only): "Quest: The Collector (not taken yet)";
--   * the professions whose recipes use it, with the rank from which one does when it is
--     known for sure: "Reagent: Tailoring (from 75), First Aid";
--   * a profession tool, a class spell that uses it or needs it as a tool;
--   * food or drink against the character's level: right for it, outgrown, or a drink for a
--     class without mana;
--   * a grey item nothing wants: "Only worth selling: 1s 20c" (the game's sell price).
-- At most two of these, joined. Nothing for gear (Polestar's own line compares it with what
-- is worn), nothing for an item the data does not know, nothing the tooltip or Polestar
-- already says (quests in the log, quests ahead in the guide, quests an item starts).
--
-- Data: ItemUseData.lua (tools/item-uses.py, from the client's tables): text blocks, a record
-- cut out when an item is hovered and kept in a small cache. Lines go through Polestar's own
-- tooltip hook (Core/Hooks.lua: one post-call for GameTooltip and ItemRefTooltip, forbidden
-- tooltips and secret values skipped, each owner in its own pcall, lines added once per show).
-- Off: /ga objets (or /ga items), the "Groupe Alliance" entry of the game's Options > AddOns,
-- or Polestar's gear, Quality of Life, Quests. Setting: qol.gaItemUse (on by default).
local _, ns = ...
local GA = ns.GA or {}
ns.GA = GA

local type, tonumber, pairs, ipairs, find, sub, format, gmatch, concat, floor =
	type, tonumber, pairs, ipairs, string.find, string.sub, string.format, string.gmatch, table.concat, math.floor

ns.RegisterDefaults("qol", { gaItemUse = true })

local FR = GetLocale and GetLocale() == "frFR"
local T = FR and {
	quest = "Quête : %s",
	questAny = "Objet de quête",
	notTaken = "pas encore prise",
	inLog = "en cours",
	more = "+%d",
	done = "Quête déjà rendue : %s",
	reagent = "Composant : %s",
	from = "%s (dès %d)",
	tool = "Outil : %s",
	spell = "Composant de sort : %s",
	spellTool = "Outil de sort : %s",
	food = "Nourriture adaptée à votre niveau",
	drink = "Boisson adaptée à votre niveau",
	foodOld = "Nourriture dépassée : celle du niveau %d rend plus",
	drinkOld = "Boisson dépassée : celle du niveau %d rend plus",
	noMana = "Boisson : rend du mana, que votre classe n'a pas",
	sell = "Seulement à vendre : %s",
	option = "À quoi sert cet objet",
	optionHelp = "Une ligne sous l'infobulle d'un objet : quête qui le demande, métier qui l'utilise (et dès quel niveau), sort de classe, nourriture adaptée ou dépassée, objet seulement à vendre. Rien quand l'information n'est pas sûre.",
	on = "Groupe Alliance : ligne « À quoi sert cet objet » allumée (/ga objets pour l'éteindre).",
	off = "Groupe Alliance : ligne « À quoi sert cet objet » éteinte (/ga objets pour la rallumer).",
} or {
	quest = "Quest: %s",
	questAny = "Quest item",
	notTaken = "not taken yet",
	inLog = "in progress",
	more = "+%d",
	done = "Quest already done: %s",
	reagent = "Reagent: %s",
	from = "%s (from %d)",
	tool = "Tool: %s",
	spell = "Spell reagent: %s",
	spellTool = "Spell tool: %s",
	food = "Food right for your level",
	drink = "Drink right for your level",
	foodOld = "Outgrown food: level %d food restores more",
	drinkOld = "Outgrown drink: level %d drinks restore more",
	noMana = "Drink: restores mana, which your class has none of",
	sell = "Only worth selling: %s",
	option = "What is this item for",
	optionHelp = "One line under an item's tooltip: the quest that wants it, the profession that uses it (and from which rank), a class spell, food right for your level or outgrown, an item only worth selling. Nothing when the information is not certain.",
	on = "Group Alliance: \"What is this item for\" line on (/ga items to turn it off).",
	off = "Group Alliance: \"What is this item for\" line off (/ga items to turn it back on).",
}
GA.ItemUseText = T

local NAME = FR and 2 or 1 -- the data's names: { English, French }
local SEP = " \194\183 "    -- " · " between two pieces
local MAX_NAMES = 3         -- professions or classes named on the line, the rest counted
local GOOD, OUTGROWN = 0.9, 0.6 -- share of the level's usual food: right for it, outgrown
local CACHE_MAX = 400
local QUEST_ITEM_CLASS = 12

---------------------------------------------------------------------------
-- Data records: "\n<id>\t<fields>\n" lines of ItemUseData.lua's blocks.
---------------------------------------------------------------------------

local function cut(block, id)
	if type(block) ~= "string" then return nil end
	local key = "\n" .. id .. "\t"
	local s = find(block, key, 1, true)
	if not s then return nil end
	local from = s + #key
	local e = find(block, "\n", from, true)
	return sub(block, from, (e or 0) - 1)
end

local cache, cached = {}, 0
local NONE = {}
local KINDS = { "prof", "tool", "spell", "ctool", "food", "quest" }

-- { prof = "197:75,...", tool, spell, ctool, food, quest, sell = true } or NONE
local function record(id)
	local r = cache[id]
	if r then return r end
	local D = GA.ItemUseData
	if not D then return NONE end
	r = {}
	local any = false
	for _, k in ipairs(KINDS) do
		local v = cut(D[k], id)
		if v then r[k] = v any = true end
	end
	if cut(D.sell, id) then r.sell = true any = true end
	if not any then r = NONE end
	if cached >= CACHE_MAX then cache, cached = {}, 0 end
	cache[id] = r
	cached = cached + 1
	return r
end
GA.ItemUseRecord = record

---------------------------------------------------------------------------
-- The character
---------------------------------------------------------------------------

local secret = ns.Compat and ns.Compat.IsSecret or function() return false end

local function readable(v)
	return v ~= nil and not secret(v)
end

local function playerLevel()
	local l = UnitLevel and UnitLevel("player")
	return readable(l) and type(l) == "number" and l or nil
end

local function playerClass()
	if not UnitClass then return nil end
	local _, token = UnitClass("player")
	return readable(token) and token or nil
end

local SIDES = { Alliance = "A", Horde = "H" }
local function playerSide()
	local f = UnitFactionGroup and UnitFactionGroup("player")
	return readable(f) and SIDES[f] or nil
end

local function playerRaceBit()
	if not UnitRace then return nil end
	local _, _, id = UnitRace("player")
	if not (readable(id) and type(id) == "number" and id > 0) then return nil end
	return 2 ^ (id - 1)
end

local CLASS_ID = { WARRIOR = 1, PALADIN = 2, HUNTER = 3, ROGUE = 4, PRIEST = 5, DEATHKNIGHT = 6, SHAMAN = 7,
	MAGE = 8, WARLOCK = 9, MONK = 10, DRUID = 11 }

-- Whether the character has mana: every class but warriors and rogues (a druid in a form
-- keeps it), read from the class, which a form or a stance never changes.
local function usesMana()
	local c = playerClass()
	return not (c == "WARRIOR" or c == "ROGUE")
end

local function hasBit(mask, bit)
	return mask % (bit * 2) >= bit
end

---------------------------------------------------------------------------
-- Pieces of the line
---------------------------------------------------------------------------

local function list(names)
	if #names > MAX_NAMES then
		local n = #names - MAX_NAMES
		for i = #names, MAX_NAMES + 1, -1 do names[i] = nil end
		names[#names + 1] = format(T.more, n)
	end
	return concat(names, ", ")
end

local function skillName(sl)
	local D = GA.ItemUseData
	local s = D and D.skills and D.skills[sl]
	return s and s[NAME] or nil
end

local function knows(sl)
	local C = ns.Compat
	if not (C and C.GetSkillRank) then return false end
	local ok, rank = pcall(C.GetSkillRank, sl)
	return ok and rank ~= nil
end

-- "Reagent: Tailoring (from 75), First Aid": the character's own professions first.
local function reagentPiece(v)
	local own, other = {}, {}
	for sl, rank in gmatch(v, "(%d+):(%d+)") do
		sl, rank = tonumber(sl), tonumber(rank)
		local name = skillName(sl)
		if name then
			if rank > 1 then name = format(T.from, name, rank) end
			local into = knows(sl) and own or other
			into[#into + 1] = name
		end
	end
	for _, n in ipairs(other) do own[#own + 1] = n end
	if #own == 0 then return nil end
	return format(T.reagent, list(own))
end

local function toolPiece(v)
	local names = {}
	for sl in gmatch(v, "%d+") do
		local name = skillName(tonumber(sl))
		if name then names[#names + 1] = name end
	end
	if #names == 0 then return nil end
	return format(T.tool, list(names))
end

local function className(token)
	local L = LOCALIZED_CLASS_NAMES_MALE
	local n = type(L) == "table" and L[token]
	if type(n) == "string" and n ~= "" then return n end
	local D = GA.ItemUseData
	local c = D and D.classes and D.classes[token]
	return c and c[NAME] or token
end

local function spellName(id)
	if C_Spell and C_Spell.GetSpellName then
		local ok, n = pcall(C_Spell.GetSpellName, id)
		if ok and type(n) == "string" and n ~= "" then return n end
	end
	if GetSpellInfo then
		local ok, n = pcall(GetSpellInfo, id)
		if ok and type(n) == "string" and n ~= "" then return n end
	end
	return nil
end

-- "Spell reagent: Shaman (Reincarnation)": the character's class first.
local function spellPiece(v)
	local mine = playerClass()
	local first, rest = {}, {}
	for token, id in gmatch(v, "(%u+):(%d+)") do
		local s = spellName(tonumber(id))
		local text = s and (className(token) .. " (" .. s .. ")") or className(token)
		local into = token == mine and first or rest
		into[#into + 1] = text
	end
	for _, n in ipairs(rest) do first[#first + 1] = n end
	if #first == 0 then return nil end
	return format(T.spell, list(first))
end

local function spellToolPiece(v)
	local names = {}
	for token in gmatch(v, "%u+") do names[#names + 1] = className(token) end
	if #names == 0 then return nil end
	return format(T.spellTool, list(names))
end

-- The usual amount of the highest tier the character has reached (tiers: { { level, amount } }).
local function tierAt(tiers, level)
	local best
	for _, t in ipairs(tiers or {}) do
		if t[1] <= level then best = t end
	end
	return best
end

-- Food: "right for your level", "outgrown" (and the tier that restores more), or a drink for
-- a class without mana. A food with a bonus (Well Fed) is never called outgrown.
local function foodPiece(v)
	local req, health, mana, bonus = v:match("^(%d+):(%d+):(%d+):(%d)$")
	if not req then return nil, false end
	req, health, mana, bonus = tonumber(req), tonumber(health), tonumber(mana), bonus == "1"
	local level = playerLevel()
	if not level or req > level then return nil, false end
	local D = GA.ItemUseData
	local isDrink = health == 0
	if isDrink and not usesMana() then return T.noMana, true end
	local tier = tierAt(isDrink and D.tiersM or D.tiersH, level)
	if not tier then return nil, false end
	local amount = isDrink and mana or health
	if amount >= tier[2] * GOOD then return isDrink and T.drink or T.food, false end
	if amount < tier[2] * OUTGROWN and not bonus then
		return format(isDrink and T.drinkOld or T.foodOld, tier[1]), true
	end
	return nil, false
end

local function sellPiece(id)
	local price
	if C_Item and C_Item.GetItemInfo then
		local ok, _, _, _, _, _, _, _, _, _, _, p = pcall(C_Item.GetItemInfo, id)
		if ok then price = p end
	end
	if not (readable(price) and type(price) == "number" and price > 0) then return nil end
	local money = GetMoneyString and GetMoneyString(price, true) or GetCoinTextureString and GetCoinTextureString(price)
	if type(money) ~= "string" or money == "" then return nil end
	return format(T.sell, money)
end

---------------------------------------------------------------------------
-- Quests
---------------------------------------------------------------------------

local function questRow(q)
	local D = GA.ItemUseData
	local v = D and cut(D.quests, q)
	if not v then return nil end
	local side, races, classes, excl, level = v:match("^(%a?);(%d*);(%d*);([%d,]*);(%d*)$")
	return side, tonumber(races), tonumber(classes), excl, tonumber(level)
end

-- Whether a quest is out of the character's reach for now: grey (no experience: the game's
-- own range) or far above (more than ABOVE levels: keeping the item that long is no advice).
local ABOVE = 10
local function outOfReach(questLevel)
	local level = playerLevel()
	if not (questLevel and level) then return false end
	if questLevel - level > ABOVE then return true end
	local range = 5
	if UnitQuestTrivialLevelRange then
		local ok, r = pcall(UnitQuestTrivialLevelRange, "player")
		if ok and readable(r) and type(r) == "number" then range = r end
	end
	return level - questLevel > range
end

local function questTitle(q)
	local Q = ns.QuestDB
	if Q and Q.IsLoaded and Q.IsLoaded() and Q.GetQuestTitle then
		local t = Q.GetQuestTitle(q)
		if t then return t end
	end
	local N = ns.Names
	local t = N and N.Quest and N.Quest(q)
	if t then return t end
	if C_QuestLog and C_QuestLog.GetTitleForQuestID then
		local ok, s = pcall(C_QuestLog.GetTitleForQuestID, q)
		if ok and type(s) == "string" and s ~= "" then return s end
	end
	return nil
end

-- Whether Polestar's own quest lines already name this quest on this item's tooltip
-- (Quests/Tooltips.lua): an objective of a quest in the log, a quest ahead in the guide,
-- a quest the item starts.
local function polestarSays(id, q, kind, state)
	local Q = ns.QuestDB
	if not (Q and Q.IsRunning and Q.IsRunning() and ns.Get("qol.questTooltips")) then return false end
	if kind == "s" and state == "todo" then return true end
	if state == "log" and Q.ObjectivesForItem then
		for _, o in ipairs(Q.ObjectivesForItem(id) or {}) do
			if o.q == q then return true end
		end
	end
	if state == "todo" and Q.ItemAheadList then
		for _, e in ipairs(Q.ItemAheadList(id) or {}) do
			if e.q == q then return true end
		end
	end
	return false
end

local function questState(q)
	local C = ns.Compat
	if C.IsQuestCompleted(q) then return "done" end
	if C.IsOnQuest(q) then return "log" end
	return "todo"
end

-- The quest piece, and whether it only says the item's quests are done.
local function questPiece(id, v)
	local C = ns.Compat
	if not (C and C.IsQuestCompleted and C.IsOnQuest) then return nil end
	local side, race, class = playerSide(), playerRaceBit(), CLASS_ID[playerClass() or ""]
	local open, openState, more, done, said, applicable = nil, nil, 0, nil, false, 0
	for q, kind in gmatch(v, "(%d+)(%a)") do
		q = tonumber(q)
		local qs, races, classes, excl, qlevel = questRow(q)
		local ok = qs ~= nil
		if ok and qs ~= "" and side and qs ~= side then ok = false end
		if ok and races and race and not hasBit(races, race) then ok = false end
		if ok and classes and class and not hasBit(classes, 2 ^ (class - 1)) then ok = false end
		if ok and excl and excl ~= "" then
			for x in gmatch(excl, "%d+") do
				local xq = tonumber(x)
				if C.IsQuestCompleted(xq) or C.IsOnQuest(xq) then ok = false break end
			end
		end
		if ok then
			applicable = applicable + 1
			local state = questState(q)
			if state == "done" then
				done = done or q
			elseif polestarSays(id, q, kind, state) then
				said = true
			elseif state == "todo" and outOfReach(qlevel) then
				said = true -- grey or far above: not worth a mention, nor a "done"
			elseif not open or (state == "log" and openState ~= "log") then
				if open then more = more + 1 end
				open, openState = q, state
			else
				more = more + 1
			end
		end
	end
	if open then
		local title = questTitle(open)
		local status = openState == "log" and T.inLog or T.notTaken
		local text = title and format(T.quest, title) or T.questAny
		text = text .. " (" .. status .. ")"
		if more > 0 then text = text .. " " .. format(T.more, more) end
		return text, false
	end
	if said or not done or applicable == 0 then return nil end
	-- Every quest of this character's that wants it is done: said only for a quest item,
	-- which has no other purpose (cloth or herbs a quest once asked for still have theirs).
	local classID = C_Item and C_Item.GetItemInfoInstant and select(6, C_Item.GetItemInfoInstant(id))
	if classID ~= QUEST_ITEM_CLASS then return nil end
	local title = questTitle(done)
	if not title then return nil end
	return format(T.done, title), true
end

---------------------------------------------------------------------------
-- The line
---------------------------------------------------------------------------

local BLUE = { 0.55, 0.78, 1 }
local GREY = { 0.62, 0.62, 0.62 }

-- -> text, r, g, b | nil: the line for item id, for this character, now.
function GA.ItemUseLine(id)
	if type(id) ~= "number" then return nil end
	local r = record(id)
	if r == NONE then return nil end
	local pieces, plain = {}, true
	local function add(text, negative)
		if text and #pieces < 2 then
			pieces[#pieces + 1] = text
			if not negative then plain = false end
		end
	end
	-- Most telling first: a quest, then what eating or drinking it is worth, then crafting.
	if r.quest then add(questPiece(id, r.quest)) end
	if r.food then add(foodPiece(r.food)) end
	if r.spell then add(spellPiece(r.spell)) end
	if r.ctool then add(spellToolPiece(r.ctool)) end
	if r.prof then add(reagentPiece(r.prof)) end
	if r.tool then add(toolPiece(r.tool)) end
	if r.sell and #pieces == 0 then add(sellPiece(id), true) end
	if #pieces == 0 then return nil end
	local c = plain and GREY or BLUE
	return concat(pieces, SEP), c[1], c[2], c[3]
end

local OWNER = "gaItemUse"

local function onItem(tooltip, _, id)
	local text, r, g, b = GA.ItemUseLine(id)
	if text then tooltip:AddLine(text, r, g, b, true) end
end

local hooked = false
local function refresh()
	local H = ns.Hooks
	if not (H and H.ItemLines) then return end
	local want = ns.Get("qol.gaItemUse") and true or false
	if want == hooked then return end
	hooked = want
	H.ItemLines(OWNER, want and onItem or nil)
end
GA.ItemUseRefresh = refresh

function GA.ItemUseToggle(on)
	if on == nil then on = not ns.Get("qol.gaItemUse") end
	ns.Set("qol.gaItemUse", on and true or false)
	print(on and T.on or T.off)
end

-- Quest states and the level change what the line says, not the record: no cache to clear.
ns.On("SETTING_CHANGED", function(path)
	if path == "qol.gaItemUse" or path == "qol" or path == "" then refresh() end
end)

---------------------------------------------------------------------------
-- Options: Polestar's window (Quality of Life, Quests) and the game's Options > AddOns
---------------------------------------------------------------------------

local function gameOptions()
	if not (Settings and Settings.RegisterCanvasLayoutCategory and Settings.RegisterAddOnCategory and CreateFrame) then return end
	local canvas = CreateFrame("Frame")
	canvas:Hide()
	local title = canvas:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	title:SetPoint("TOPLEFT", canvas, "TOPLEFT", 16, -16)
	title:SetText("Groupe Alliance")
	local box = CreateFrame("CheckButton", nil, canvas, "UICheckButtonTemplate")
	box:SetPoint("TOPLEFT", title, "BOTTOMLEFT", -4, -12)
	local label = canvas:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	label:SetPoint("LEFT", box, "RIGHT", 4, 0)
	label:SetText(T.option)
	local help = canvas:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	help:SetPoint("TOPLEFT", box, "BOTTOMLEFT", 4, -6)
	help:SetWidth(520)
	help:SetJustifyH("LEFT")
	help:SetText(T.optionHelp .. "\n/ga " .. (FR and "objets" or "items"))
	box:SetScript("OnClick", function(self) ns.Set("qol.gaItemUse", self:GetChecked() and true or false) end)
	canvas:SetScript("OnShow", function() box:SetChecked(ns.Get("qol.gaItemUse") and true or false) end)
	local ok, category = pcall(Settings.RegisterCanvasLayoutCategory, canvas, "Groupe Alliance")
	if ok and category then pcall(Settings.RegisterAddOnCategory, category) end
end

ns.OnInit(function()
	refresh()
	if ns.RegisterOptions and ns.L then
		ns.RegisterOptions({ page = ns.L["Quality of Life"], tab = ns.L["Quests"], section = "Groupe Alliance", controls = {
			{ kind = "toggle", key = "qol.gaItemUse", label = T.option, help = T.optionHelp,
				search = "item, objet, tooltip, infobulle, reagent, composant, quest, quête, vendor, vendre, food, nourriture" },
		} })
	end
	gameOptions()
end)
