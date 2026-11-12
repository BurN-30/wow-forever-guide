-- A small fake of the WoW Forever client for tools/check-pack.py (Lua 5.1 through lupa).
-- It is not the game: it loads every addon of the pack in one Lua state, in the game's order,
-- and records what each addon touches outside its own frames (globals, slash commands,
-- console variables, hooks, events, tooltips, libraries). An error here is a lead to read,
-- not a proof of a bug in game; a clean run is no proof of no bug either.
--
-- Python sets, before this file runs: BENCH_LOCALE ("frFR" or "enUS"), BENCH_API (the
-- functions, enums and constants read from Blizzard_APIDocumentationGenerated, or nil).

local rawget, rawset, type, pairs, tostring = rawget, rawset, type, pairs, tostring

BENCH = {
	current = "(bench)",      -- the addon whose code runs now
	errors = {},              -- { addon, where, message }
	globals = {},             -- name -> { addon = true, ... } (first writer kept in order)
	globalOrder = {},
	cvarsSet = {},            -- { addon, name, value }
	cvars = {},
	hooks = {},               -- { addon, target }
	scriptHooks = {},         -- { addon, frame, script }
	replaced = {},            -- { addon, target } a Blizzard function written over
	events = {},              -- addon -> { event = true }
	tooltipCalls = {},        -- { addon, kind }
	bindings = {},
	frames = {},              -- every frame made
	timers = {},
	combat = false,
	loaded = {},              -- addon -> true
	printed = {},
}
local B = BENCH

local function note(list, row) list[#list + 1] = row end
function BENCH.Error(where, msg)
	note(B.errors, { B.current, where, tostring(msg) })
end

------------------------------------------------------------------------------------------
-- Magic values: what a Blizzard function the bench does not know returns, and the fields of
-- frames it does not model. Callable, indexable, usable in arithmetic and concatenation.
------------------------------------------------------------------------------------------
local MAGIC = {}
local function magic(path)
	return setmetatable({ __path = path }, MAGIC)
end
BENCH.magic = magic
local NUMERIC = { Width = 1, Height = 1, Scale = 1, EffectiveScale = 1, Alpha = 1, FrameLevel = 1,
	Left = 1, Right = 1, Top = 1, Bottom = 1, NumPoints = 1, NumChildren = 1, StringWidth = 1,
	StringHeight = 1, Value = 1, ID = 1, Size = 1, Center = 1 }
MAGIC.__index = function(t, k)
	local m = magic(rawget(t, "__path") .. "." .. tostring(k))
	rawset(t, k, m)
	return m
end
MAGIC.__call = function(self, ...)
	local name = (rawget(self, "__path") or ""):match("([%w_]+)$") or ""
	local base = name:match("^Get(%u%a*)$")
	if base then
		for k in pairs(NUMERIC) do if base:find(k, 1, true) then return 0, 0 end end
		return nil
	end
	if name:match("^Is%u") or name:match("^Has%u") or name:match("^Can%u") then return false end
	if name:match("^Format") then return "" end
	return nil
end
local function zero() return 0 end
MAGIC.__add, MAGIC.__sub, MAGIC.__mul, MAGIC.__div, MAGIC.__mod, MAGIC.__pow, MAGIC.__unm = zero, zero, zero, zero, zero, zero, zero
MAGIC.__concat = function(a, b) return tostring(type(a) == "table" and rawget(a, "__path") or a) .. tostring(type(b) == "table" and rawget(b, "__path") or b) end
MAGIC.__tostring = function(t) return rawget(t, "__path") end
MAGIC.__newindex = function(t, k, v)
	if type(v) == "function" and B.current ~= "(game)" and B.current ~= "(bench)" then
		note(B.replaced, { B.current, rawget(t, "__path") .. "." .. tostring(k) })
	end
	rawset(t, k, v)
end
MAGIC.__lt = function() return false end
MAGIC.__le = function() return true end

------------------------------------------------------------------------------------------
-- Lua extras of the game
------------------------------------------------------------------------------------------
local function band(a, b) local r, m = 0, 1 a, b = a % 4294967296, b % 4294967296
	for _ = 1, 32 do if a % 2 == 1 and b % 2 == 1 then r = r + m end a, b, m = math.floor(a / 2), math.floor(b / 2), m * 2 end return r end
local function bor(a, b) local r, m = 0, 1 a, b = a % 4294967296, b % 4294967296
	for _ = 1, 32 do if a % 2 == 1 or b % 2 == 1 then r = r + m end a, b, m = math.floor(a / 2), math.floor(b / 2), m * 2 end return r end
local function bxor(a, b) local r, m = 0, 1 a, b = a % 4294967296, b % 4294967296
	for _ = 1, 32 do if (a % 2) ~= (b % 2) then r = r + m end a, b, m = math.floor(a / 2), math.floor(b / 2), m * 2 end return r end
bit = { band = band, bor = bor, bxor = bxor, bnot = function(a) return 4294967295 - a % 4294967296 end,
	lshift = function(a, n) return (a * 2 ^ n) % 4294967296 end, rshift = function(a, n) return math.floor((a % 4294967296) / 2 ^ n) end,
	arshift = function(a, n) return math.floor(a / 2 ^ n) end, tobit = function(a) return a end }
strsplit = function(sep, s, limit)
	local out, pos = {}, 1
	s = tostring(s or "")
	while true do
		if limit and #out == limit - 1 then out[#out + 1] = s:sub(pos) break end
		local a, b = s:find("[" .. sep:gsub("%p", "%%%0") .. "]", pos)
		if not a then out[#out + 1] = s:sub(pos) break end
		out[#out + 1] = s:sub(pos, a - 1)
		pos = b + 1
	end
	return unpack(out)
end
strsplittable = function(sep, s) return { strsplit(sep, s) } end
strtrim = function(s, chars) chars = chars and ("[" .. chars:gsub("%p", "%%%0") .. "]") or "%s"
	return (tostring(s):gsub("^" .. chars .. "+", ""):gsub(chars .. "+$", "")) end
strjoin = function(sep, ...) return table.concat({ ... }, sep) end
strconcat = function(...) return table.concat({ ... }) end
string.split, string.trim, string.join = strsplit, strtrim, strjoin
strmatch, strfind, strsub, strlen, strlower, strupper, strrep, strbyte, strchar, strrev, gsub, format, gmatch =
	string.match, string.find, string.sub, string.len, string.lower, string.upper, string.rep, string.byte,
	string.char, string.reverse, string.gsub, string.format, string.gmatch
strcmputf8i = function(a, b) a, b = tostring(a):lower(), tostring(b):lower() return a < b and -1 or (a > b and 1 or 0) end
strlenutf8 = function(s) local _, n = tostring(s):gsub("[^\128-\191]", "") return n end
tinsert, tremove, sort, getn, tconcat = table.insert, table.remove, table.sort, table.getn, table.concat
wipe = function(t) for k in pairs(t) do t[k] = nil end return t end
table.wipe = wipe
tContains = function(t, v) for _, x in pairs(t) do if x == v then return true end end return false end
tInvert = function(t) local o = {} for k, v in pairs(t) do o[v] = k end return o end
abs, ceil, floor, max, min, sqrt, random, mod, fmod, exp, log, log10, deg, rad, PI =
	math.abs, math.ceil, math.floor, math.max, math.min, math.sqrt, math.random, math.fmod, math.fmod,
	math.exp, math.log, math.log10, math.deg, math.rad, math.pi
sin = function(d) return math.sin(math.rad(d)) end
cos = function(d) return math.cos(math.rad(d)) end
Clamp = function(v, a, b) return math.min(math.max(v, a), b) end
Round = function(v) return math.floor(v + 0.5) end
Lerp = function(a, b, t) return a + (b - a) * t end
Saturate = function(v) return Clamp(v, 0, 1) end
issecretvalue = function() return false end
issecrettable = function() return false end
canaccessvalue = function() return true end
canaccesstable = function() return true end
securecall = function(f, ...) if type(f) == "string" then f = _G[f] end return f(...) end
securecallfunction = securecall
secureexecuterange = function(t, f, ...) for k, v in pairs(t) do f(k, v, ...) end end
issecure = function() return false end
issecurevariable = function() return true, nil end
forceinsecure = function() end
debugstack = function() return "" end
debuglocals = function() return "" end
debugprofilestop = function() return os.clock() * 1000 end
debugprofilestart = function() end
GetTime = function() return os.clock() + 1000 end
GetTimePreciseSec = GetTime
GetServerTime = function() return os.time() end
time, date = os.time, os.date
local handler = function(e) BENCH.Error("error handler", e) end
geterrorhandler = function() return handler end
seterrorhandler = function(f) handler = f end
scrub = function(...) return ... end
CopyTable = function(t, shallow) local o = {} for k, v in pairs(t) do o[k] = (type(v) == "table" and not shallow) and CopyTable(v) or v end return o end
Mixin = function(o, ...)
	for i = 1, select("#", ...) do
		local m = select(i, ...)
		if type(m) == "table" and getmetatable(m) == MAGIC then
			-- a Blizzard mixin the bench only knows by name: its methods are magic
			if not getmetatable(o) then setmetatable(o, { __index = m }) end
		else
			for k, v in pairs(m) do o[k] = v end
		end
	end
	return o
end
CreateFromMixins = function(...) return Mixin({}, ...) end
CreateAndInitFromMixin = function(m, ...) local o = Mixin({}, m) if o.Init then o:Init(...) end return o end
GenerateClosure = function(f, ...) local a = { ... } return function(...) local b = { unpack(a) } for i = 1, select("#", ...) do b[#b + 1] = (select(i, ...)) end return f(unpack(b)) end end
GetCurrentRegion = function() return 3 end
GetCurrentRegionName = function() return "EU" end
GetLocale = function() return BENCH_LOCALE end
GetBuildInfo = function() return "1.60.1", "70888", "Nov 10 2026", 16001, "", "", 16001 end
IsLoggedIn = function() return B.loggedIn == true end
InCombatLockdown = function() return B.combat end
UnitAffectingCombat = function() return B.combat end
UnitName = function(u) if u == "player" then return "Testeur", nil end return nil end
UnitClass = function(u) if u == "player" then return BENCH_LOCALE == "frFR" and "Guerrier" or "Warrior", "WARRIOR", 1 end return nil end
UnitClassBase = function(u) return "WARRIOR", 1 end
UnitRace = function(u) return BENCH_LOCALE == "frFR" and "Humain" or "Human", "Human", 1 end
UnitLevel = function() return 20 end
UnitQuestTrivialLevelRange = function() return 5 end
UnitFactionGroup = function() return "Alliance", BENCH_LOCALE == "frFR" and "Alliance" or "Alliance" end
UnitGUID = function(u) if u == "player" then return "Player-1-0000000A" end return nil end
UnitExists = function(u) return u == "player" end
UnitIsUnit = function(a, b) return a == b end
UnitHealth = function() return 100 end
UnitHealthMax = function() return 100 end
UnitPower = function() return 50 end
UnitPowerMax = function() return 100 end
UnitSex = function() return 2 end
GetRealmName = function() return "Forever" end
GetNormalizedRealmName = function() return "Forever" end
GetMoney = function() return 12345 end
GetMoneyString = function(m) m = tonumber(m) or 0
	local g, s, c = math.floor(m / 10000), math.floor(m / 100) % 100, m % 100
	return (g > 0 and (g .. "g ") or "") .. (s > 0 and (s .. "s ") or "") .. c .. "c" end
GetCVar = function(n) return B.cvars[n] end
GetCVarBool = function(n) return B.cvars[n] == "1" end
GetCVarDefault = function() return "0" end
SetCVar = function(n, v) note(B.cvarsSet, { B.current, tostring(n), tostring(v) }) B.cvars[n] = tostring(v) return true end
RegisterCVar = function(n, v) B.cvars[n] = B.cvars[n] or v end
C_CVar = { GetCVar = GetCVar, SetCVar = SetCVar, GetCVarBool = GetCVarBool, GetCVarDefault = GetCVarDefault, RegisterCVar = RegisterCVar,
	GetCVarInfo = function(n) return B.cvars[n], "0" end }
GetCVarNumberOrDefault = function(n) return tonumber(B.cvars[n]) or 0 end
SetBinding = function(key, action) note(B.bindings, { B.current, tostring(key), tostring(action) }) return true end
SetBindingClick = function(key, button) note(B.bindings, { B.current, tostring(key), "CLICK " .. tostring(button) }) return true end
SetOverrideBinding = function(_, _, key, action) note(B.bindings, { B.current, tostring(key), "override " .. tostring(action) }) end
SetOverrideBindingClick = function(_, _, key, button) note(B.bindings, { B.current, tostring(key), "override CLICK " .. tostring(button) }) end
ClearOverrideBindings = function() end
GetBindingKey = function() return nil end
SaveBindings = function() note(B.bindings, { B.current, "(SaveBindings)", "" }) end
print = function(...) local t = {} for i = 1, select("#", ...) do t[#t + 1] = tostring((select(i, ...))) end note(B.printed, { B.current, table.concat(t, " ") }) end

------------------------------------------------------------------------------------------
-- Frames
------------------------------------------------------------------------------------------
local FrameMethods = {}
local FRAME = {}
FRAME.__index = function(t, k)
	local m = FrameMethods[k]
	if m then return m end
	if type(k) == "string" and k:match("^Get%a*Texture$") then
		return function(self) local x = rawget(self, "__tex_" .. k) if not x then x = B.NewFrame("Texture", nil, self) rawset(self, "__tex_" .. k, x) end return x end
	end
	if type(k) == "string" and (k:match("^%u") or rawget(t, "__template")) then
		-- an unknown method or a template's child: a magic value
		local v = magic((rawget(t, "__name") or "frame") .. "." .. k)
		return v
	end
	return nil
end
local function owner(f) return rawget(f, "__owner") or "?" end
-- A function written into a game frame (a method replaced): noted.
FRAME.__newindex = function(t, k, v)
	if type(v) == "function" and owner(t) == "(game)" and B.current ~= "(game)" and B.current ~= "(bench)" then
		note(B.replaced, { B.current, (rawget(t, "__name") or "game frame") .. "." .. tostring(k) })
	end
	rawset(t, k, v)
end
function FrameMethods:SetScript(s, fn) self.__scripts[s] = fn end
function FrameMethods:GetScript(s) return self.__scripts[s] end
function FrameMethods:HasScript() return true end
function FrameMethods:HookScript(s, fn)
	local blizzard = owner(self) == "(game)"
	if blizzard or owner(self) ~= B.current then note(B.scriptHooks, { B.current, rawget(self, "__name") or ("frame of " .. owner(self)), s }) end
	local old = self.__scripts[s]
	self.__scripts[s] = function(...) if old then old(...) end return fn(...) end
end
function FrameMethods:RegisterEvent(e)
	self.__events[e] = true
	local o = owner(self)
	B.events[o] = B.events[o] or {}
	B.events[o][e] = true
end
FrameMethods.RegisterUnitEvent = FrameMethods.RegisterEvent
function FrameMethods:UnregisterEvent(e) self.__events[e] = nil end
function FrameMethods:UnregisterAllEvents() self.__events = {} end
function FrameMethods:IsEventRegistered(e) return self.__events[e] == true end
function FrameMethods:RegisterAllEvents() self.__allEvents = true end
function FrameMethods:GetName() return rawget(self, "__name") end
function FrameMethods:GetDebugName() return rawget(self, "__name") or "frame" end
function FrameMethods:GetObjectType() return self.__type end
function FrameMethods:IsObjectType(t) return self.__type == t end
function FrameMethods:IsForbidden() return false end
function FrameMethods:IsProtected() return false, false end
function FrameMethods:Show() local was = self.__shown self.__shown = true if not was and self.__scripts.OnShow then B.Run(self, "OnShow") end end
function FrameMethods:Hide() local was = self.__shown self.__shown = false if was and self.__scripts.OnHide then B.Run(self, "OnHide") end end
function FrameMethods:SetShown(v) if v then self:Show() else self:Hide() end end
function FrameMethods:IsShown() return self.__shown end
function FrameMethods:IsVisible() return self.__shown end
function FrameMethods:GetParent() return self.__parent end
function FrameMethods:SetParent(p) self.__parent = p end
function FrameMethods:GetChildren() return unpack(self.__children) end
function FrameMethods:GetNumChildren() return #self.__children end
function FrameMethods:GetRegions() return end
function FrameMethods:GetFrameLevel() return self.__level end
function FrameMethods:SetFrameLevel(l) self.__level = l end
function FrameMethods:GetFrameStrata() return self.__strata end
function FrameMethods:SetFrameStrata(s) self.__strata = s end
function FrameMethods:GetWidth() return self.__w end
function FrameMethods:GetHeight() return self.__h end
function FrameMethods:SetWidth(w) self.__w = w end
function FrameMethods:SetHeight(h) self.__h = h end
function FrameMethods:SetSize(w, h) self.__w, self.__h = w, h or w end
function FrameMethods:GetSize() return self.__w, self.__h end
function FrameMethods:GetScale() return 1 end
function FrameMethods:GetEffectiveScale() return 1 end
function FrameMethods:GetAlpha() return 1 end
function FrameMethods:GetEffectiveAlpha() return 1 end
function FrameMethods:GetLeft() return 0 end
function FrameMethods:GetRight() return self.__w end
function FrameMethods:GetTop() return self.__h end
function FrameMethods:GetBottom() return 0 end
function FrameMethods:GetCenter() return self.__w / 2, self.__h / 2 end
function FrameMethods:GetRect() return 0, 0, self.__w, self.__h end
function FrameMethods:GetNumPoints() return 0 end
function FrameMethods:GetPoint() return "CENTER", UIParent, "CENTER", 0, 0 end
function FrameMethods:GetID() return self.__id or 0 end
function FrameMethods:SetID(i) self.__id = i end
function FrameMethods:GetText() return self.__text end
function FrameMethods:SetText(t) self.__text = t end
function FrameMethods:SetFormattedText(f, ...) self.__text = string.format(f, ...) end
function FrameMethods:GetStringWidth() return 10 end
function FrameMethods:GetStringHeight() return 10 end
function FrameMethods:GetUnboundedStringWidth() return 10 end
function FrameMethods:GetFont() return "Fonts\\FRIZQT__.TTF", 12, "" end
function FrameMethods:GetTextColor() return 1, 1, 1, 1 end
function FrameMethods:GetVertexColor() return 1, 1, 1, 1 end
function FrameMethods:GetTexture() return self.__tex end
function FrameMethods:SetTexture(t) self.__tex = t end
function FrameMethods:GetAtlas() return nil end
function FrameMethods:GetValue() return self.__value or 0 end
function FrameMethods:SetValue(v) self.__value = v end
function FrameMethods:GetMinMaxValues() return 0, 1 end
function FrameMethods:GetChecked() return self.__checked or false end
function FrameMethods:SetChecked(v) self.__checked = v and true or false end
function FrameMethods:GetAttribute(k) return self.__attr[k] end
function FrameMethods:SetAttribute(k, v) self.__attr[k] = v end
function FrameMethods:IsMouseOver() return false end
function FrameMethods:IsMouseEnabled() return false end
function FrameMethods:GetNumLines() return #self.__lines end
FrameMethods.NumLines = FrameMethods.GetNumLines
function FrameMethods:IsOwned(o) return self.__tipOwner == o end
function FrameMethods:GetOwner() return self.__tipOwner end
-- A tooltip given a new owner or cleared loses its lines and runs OnTooltipCleared, as the game's.
local function clearTip(self)
	self.__lines = {}
	if self.__scripts.OnTooltipCleared then B.Run(self, "OnTooltipCleared") end
end
function FrameMethods:SetOwner(o) self.__tipOwner = o clearTip(self) end
function FrameMethods:AddLine(t) self.__lines[#self.__lines + 1] = t end
function FrameMethods:AddDoubleLine(a, b) self.__lines[#self.__lines + 1] = tostring(a) .. " | " .. tostring(b) end
function FrameMethods:ClearLines() clearTip(self) end
function FrameMethods:GetItem() return nil, nil end
function FrameMethods:GetSpell() return nil, nil end
function FrameMethods:GetUnit() return nil, nil end
function FrameMethods:GetPrimaryTooltipData() return nil end
function FrameMethods:CreateTexture(name, ...) return B.NewFrame("Texture", name, self) end
function FrameMethods:CreateFontString(name, ...) return B.NewFrame("FontString", name, self) end
function FrameMethods:CreateMaskTexture(name, ...) return B.NewFrame("MaskTexture", name, self) end
function FrameMethods:CreateLine(name, ...) return B.NewFrame("Line", name, self) end
function FrameMethods:CreateAnimationGroup(name, ...) return B.NewFrame("AnimationGroup", name, self) end
function FrameMethods:CreateAnimation(t, name, ...) return B.NewFrame("Animation", name, self) end
function FrameMethods:GetFontString() local fs = rawget(self, "__fs") if not fs then fs = B.NewFrame("FontString", nil, self) rawset(self, "__fs", fs) end return fs end
function FrameMethods:GetNormalTexture() return B.NewFrame("Texture", nil, self) end
function FrameMethods:GetHighlightTexture() return B.NewFrame("Texture", nil, self) end
function FrameMethods:GetPushedTexture() return B.NewFrame("Texture", nil, self) end
function FrameMethods:GetCanvas() local c = rawget(self, "__canvas") if not c then c = B.NewFrame("Frame", nil, self) rawset(self, "__canvas", c) end return c end
function FrameMethods:GetMapID() return 1429 end
function FrameMethods:GetScrollChild() return self:GetCanvas() end

local made = 0
function BENCH.NewFrame(ftype, name, parent, ...)
	made = made + 1
	local f = setmetatable({ __type = ftype or "Frame", __scripts = {}, __events = {}, __children = {}, __attr = {},
		__lines = {}, __shown = true, __level = 1, __strata = "MEDIUM", __w = 100, __h = 100,
		__owner = B.current, __parent = parent }, FRAME)
	if type(name) == "string" then
		name = name:gsub("%$parent", parent and rawget(parent, "__name") or "")
		f.__name = name
		_G[name] = f
	end
	if type(parent) == "table" and rawget(parent, "__children") then
		local kids = rawget(parent, "__children")
		kids[#kids + 1] = f
	end
	B.frames[#B.frames + 1] = f
	return f
end
CreateFrame = function(ftype, name, parent, template, id) local f = B.NewFrame(ftype, name, parent) if id then f.__id = id end if template then f.__template = template end return f end
CreateFramePool = function() return { Acquire = function() return CreateFrame("Frame") end, Release = function() end, ReleaseAll = function() end, EnumerateActive = function() return pairs({}) end } end
CreateTexturePool, CreateFontStringPool, CreateMaskTexturePool, CreateLinePool, CreateActorPool, CreateUnsecuredFramePool,
	CreateSecureFramePool, CreateUnsecuredObjectPool, CreateFramePoolCollection = CreateFramePool, CreateFramePool, CreateFramePool,
	CreateFramePool, CreateFramePool, CreateFramePool, CreateFramePool, CreateFramePool, CreateFramePool
CreateObjectPool = function(create) return { Acquire = function(self) return create(self) end, Release = function() end, ReleaseAll = function() end, EnumerateActive = function() return pairs({}) end } end
CreateColor = function(r, g, b, a) return { r = r, g = g, b = b, a = a or 1, GetRGB = function(s) return s.r, s.g, s.b end,
	GetRGBA = function(s) return s.r, s.g, s.b, s.a end, GenerateHexColor = function() return "ffffffff" end,
	GenerateHexColorMarkup = function() return "|cffffffff" end, WrapTextInColorCode = function(_, t) return "|cffffffff" .. tostring(t) .. "|r" end,
	SetRGB = function(s, r2, g2, b2) s.r, s.g, s.b = r2, g2, b2 end, IsEqualTo = function() return false end } end

-- The game's own frames: owned by "(game)", so a hook on them is noted.
local function game(ftype, name, parent)
	local cur = B.current
	B.current = "(game)"
	local f = B.NewFrame(ftype, name, parent)
	B.current = cur
	return f
end
BENCH.GameFrame = game
UIParent = game("Frame", "UIParent")
WorldFrame = game("Frame", "WorldFrame")
for _, n in ipairs({ "GameTooltip", "ItemRefTooltip", "ShoppingTooltip1", "ShoppingTooltip2", "EmbeddedItemTooltip",
	"WorldMapTooltip", "GameTooltipStatusBar", "Minimap", "MinimapCluster", "WorldMapFrame", "BattlefieldMapFrame",
	"BuffFrame", "DebuffFrame", "ChatFrame1", "ChatFrame1EditBox", "GameMenuFrame", "PlayerFrame", "TargetFrame",
	"PartyFrame", "CompactRaidFrameContainer", "ObjectiveTrackerFrame", "QuestFrame", "GossipFrame", "MerchantFrame",
	"BankFrame", "MailFrame", "ContainerFrameCombinedBags", "ContainerFrame1", "CharacterFrame", "PlayerSpellsFrame",
	"ProfessionsFrame", "TradeSkillFrame", "ClassTrainerFrame", "AuctionHouseFrame", "SettingsPanel", "AddonList",
	"StaticPopup1", "LootFrame", "QuestLogFrame", "QuestMapFrame", "MainMenuBar", "MultiBarBottomLeft",
	"ActionButton1", "SpellBookFrame", "TalentFrame", "FriendsFrame", "ChatFrameMenuButton", "UIErrorsFrame",
	"RaidWarningFrame", "ZoneTextFrame", "MinimapZoneText", "TimeManagerClockButton", "GameTimeFrame",
	"AddonCompartmentFrame", "QueueStatusButton", "ExpansionLandingPageMinimapButton", "ItemRefShoppingTooltip1" }) do
	game(n:match("Tooltip") and "GameTooltip" or "Frame", n, UIParent)
end
DEFAULT_CHAT_FRAME = ChatFrame1
SELECTED_CHAT_FRAME = ChatFrame1
NUM_CHAT_WINDOWS = 10
WorldMapFrame.ScrollContainer = game("ScrollFrame", nil, WorldMapFrame)
WorldMapFrame.pinPools = {}
WorldMapFrame.dataProviders = {}
WorldMapFrame.GetPinFrameLevelsManager = function()
	return { GetValidFrameLevel = function() return 2000 end, InsertFrameLevelAbove = function() return true end,
		AddFrameLevel = function() end }
end
Minimap.GetZoom = function() return 0 end
Minimap.GetZoomLevels = function() return 5 end
function ChatFrame1:AddMessage(t) note(B.printed, { B.current, tostring(t) }) end
StaticPopupDialogs = {}
StaticPopup_Show = function() end
StaticPopup_Hide = function() end
UISpecialFrames = {}
UIPanelWindows = {}
ShowUIPanel = function(f) if f then f:Show() end end
HideUIPanel = function(f) if f then f:Hide() end end
ToggleFrame = function(f) if f then f:SetShown(not f:IsShown()) end end
PlaySound = function() return true end
PlaySoundFile = function() return true end
StopSound = function() end
SlashCmdList = {}
hash_SlashCmdList = {}
ChatFrame_AddMessageEventFilter = function() end
ChatFrame_RemoveMessageEventFilter = function() end
ChatEdit_InsertLink = function() return false end
GetMouseFoci = function() return {} end
GetMouseFocus = function() return nil end
GetCursorPosition = function() return 0, 0 end
GetScreenWidth = function() return 1920 end
GetScreenHeight = function() return 1080 end
GetPhysicalScreenSize = function() return 1920, 1080 end
IsShiftKeyDown, IsControlKeyDown, IsAltKeyDown, IsModifierKeyDown = function() return false end, function() return false end, function() return false end, function() return false end
IsLeftShiftKeyDown, IsRightShiftKeyDown = IsShiftKeyDown, IsShiftKeyDown
IsMouseButtonDown = function() return false end
GetFramerate = function() return 60 end
GetNetStats = function() return 0, 0, 30, 30 end
RAID_CLASS_COLORS = setmetatable({}, { __index = function(t, k) local c = CreateColor(1, 1, 1) c.colorStr = "ffffffff" rawset(t, k, c) return c end })
CUSTOM_CLASS_COLORS = nil
ITEM_QUALITY_COLORS = setmetatable({}, { __index = function(t, k) local c = CreateColor(1, 1, 1) c.hex = "|cffffffff" c.color = c rawset(t, k, c) return c end })
NORMAL_FONT_COLOR, HIGHLIGHT_FONT_COLOR, RED_FONT_COLOR, GREEN_FONT_COLOR, GRAY_FONT_COLOR, YELLOW_FONT_COLOR, WHITE_FONT_COLOR,
	DISABLED_FONT_COLOR, LIGHTBLUE_FONT_COLOR, ORANGE_FONT_COLOR, BLUE_FONT_COLOR, LIGHTGRAY_FONT_COLOR, PASSIVE_SPELL_FONT_COLOR,
	EPIC_PURPLE_COLOR, ARTIFACT_GOLD_COLOR, TOOLTIP_DEFAULT_COLOR, TOOLTIP_DEFAULT_BACKGROUND_COLOR =
	CreateColor(1, .82, 0), CreateColor(1, 1, 1), CreateColor(1, .1, .1), CreateColor(.1, 1, .1), CreateColor(.5, .5, .5),
	CreateColor(1, 1, 0), CreateColor(1, 1, 1), CreateColor(.5, .5, .5), CreateColor(.5, .5, 1), CreateColor(1, .5, 0),
	CreateColor(0, .5, 1), CreateColor(.75, .75, .75), CreateColor(.7, .7, .7), CreateColor(.6, .2, .9), CreateColor(.9, .8, .5),
	CreateColor(1, 1, 1), CreateColor(0, 0, 0)

-- hooksecurefunc: the hook runs after the function; a Blizzard target is noted.
hooksecurefunc = function(t, name, fn)
	if type(t) == "string" then t, name, fn = _G, t, name end
	local target = (t == _G and name) or ((type(t) == "table" and rawget(t, "__name") or "table") .. ":" .. tostring(name))
	note(B.hooks, { B.current, target })
	local old = t[name]
	if type(old) ~= "function" and not (type(old) == "table" and getmetatable(old) == MAGIC) then
		BENCH.Error("hooksecurefunc", "no function to hook: " .. target)
		return
	end
	rawset(t, name, function(...) local r = { old(...) } fn(...) return unpack(r) end)
end

-- Tooltip post-calls (the modern tooltip data): recorded, and run by BENCH.Tooltip.
TooltipDataProcessor = { postCalls = {}, preCalls = {} }
function TooltipDataProcessor.AddTooltipPostCall(kind, fn)
	note(B.tooltipCalls, { B.current, "post " .. tostring(kind) })
	local l = TooltipDataProcessor.postCalls
	l[#l + 1] = { kind = kind, fn = fn, addon = B.current }
end
function TooltipDataProcessor.AddTooltipPreCall(kind, fn)
	note(B.tooltipCalls, { B.current, "pre " .. tostring(kind) })
end
function TooltipDataProcessor.AddLinePreCall() end
function TooltipDataProcessor.AddLinePostCall() end
function TooltipDataProcessor.AddPostCall() end
TooltipUtil = { GetDisplayedItem = function() return nil end, SurfaceArgs = function() end, GetDisplayedUnit = function() return nil end,
	GetDisplayedSpell = function() return nil end }

-- EventRegistry (callbacks): recorded and fired with the events of the same name.
EventRegistry = { callbacks = {} }
function EventRegistry:RegisterCallback(event, fn, owner)
	local l = self.callbacks[event] or {}
	self.callbacks[event] = l
	l[#l + 1] = { fn = fn, owner = owner, addon = B.current }
end
function EventRegistry:UnregisterCallback() end
function EventRegistry:TriggerEvent(event, ...) end
function EventRegistry:RegisterFrameEventAndCallback(event, fn, owner) self:RegisterCallback(event, fn, owner) end
CallbackRegistryMixin = { OnLoad = function() end, RegisterCallback = function() end, TriggerEvent = function() end, GenerateCallbackEvents = function() end }
EventUtil = { ContinueOnAddOnLoaded = function(name, fn) B.onAddon = B.onAddon or {} note(B.onAddon, { name, fn, B.current }) end,
	RegisterOnceFrameEventAndCallback = function(e, fn) B.once = B.once or {} note(B.once, { e, fn, B.current }) end,
	ContinueAfterAllEvents = function(fn) end }

-- Timers: run once, in order, by BENCH.RunTimers.
C_Timer = {}
function C_Timer.After(s, fn) note(B.timers, { fn, B.current }) end
local function ticker(s, fn, n) local t = { Cancel = function(self) self.cancelled = true end, IsCancelled = function(self) return self.cancelled end }
	note(B.timers, { function() if not t.cancelled then fn(t) end end, B.current }) return t end
C_Timer.NewTimer = function(s, fn) return ticker(s, fn, 1) end
C_Timer.NewTicker = function(s, fn, n) return ticker(s, fn, n) end

-- AddOns: filled by Python (BENCH.addons[name] = { title, toc = {key = value}, lod = bool }).
BENCH.addons = {}
BENCH.addonOrder = {}
C_AddOns = {}
function C_AddOns.GetNumAddOns() return #B.addonOrder end
local function addonOf(i) if type(i) == "number" then return B.addonOrder[i] end return i end
function C_AddOns.GetAddOnInfo(i) local n = addonOf(i) local a = B.addons[n] if not a then return nil end
	return n, a.meta.Title or n, a.meta.Notes or "", true, a.lod and "DEMAND_LOADED" or nil, "INSECURE", false end
function C_AddOns.GetAddOnMetadata(i, key) local a = B.addons[addonOf(i)] return a and a.meta[key] end
function C_AddOns.IsAddOnLoaded(i) local n = addonOf(i) return B.loaded[n] == true, B.loaded[n] == true end
function C_AddOns.IsAddOnLoadable(i) return B.addons[addonOf(i)] ~= nil end
function C_AddOns.IsAddOnLoadOnDemand(i) local a = B.addons[addonOf(i)] return a and a.lod or false end
function C_AddOns.DoesAddOnExist(i) return B.addons[addonOf(i)] ~= nil end
function C_AddOns.GetAddOnEnableState(i) return B.addons[addonOf(i)] and 2 or 0 end
function C_AddOns.IsAddOnDefaultEnabled(i) local a = B.addons[addonOf(i)] return a and (a.meta.DefaultState or "enabled"):lower() ~= "disabled" end
function C_AddOns.EnableAddOn() end
function C_AddOns.DisableAddOn() end
function C_AddOns.GetAddOnDependencies(i) local a = B.addons[addonOf(i)] return unpack(a and a.deps or {}) end
function C_AddOns.LoadAddOn(i)
	local n = addonOf(i)
	if not B.addons[n] then return false, "MISSING" end
	if B.loaded[n] then return true end
	BENCH.LoadAddOn(n) -- set by Python
	return true
end
GetNumAddOns, GetAddOnInfo, GetAddOnMetadata, IsAddOnLoaded, LoadAddOn, IsAddOnLoadOnDemand, EnableAddOn, DisableAddOn,
	GetAddOnEnableState, GetAddOnDependencies =
	C_AddOns.GetNumAddOns, C_AddOns.GetAddOnInfo, C_AddOns.GetAddOnMetadata, C_AddOns.IsAddOnLoaded, C_AddOns.LoadAddOn,
	C_AddOns.IsAddOnLoadOnDemand, C_AddOns.EnableAddOn, C_AddOns.DisableAddOn, C_AddOns.GetAddOnEnableState, C_AddOns.GetAddOnDependencies

------------------------------------------------------------------------------------------
-- The documented API (Blizzard_APIDocumentationGenerated): every function exists and returns
-- values of its documented types (false, 0, "", an empty table, nil when nilable).
------------------------------------------------------------------------------------------
Enum = setmetatable({}, { __index = function(t, k) local e = setmetatable({}, { __index = function() return 0 end }) rawset(t, k, e) return e end })
Constants = setmetatable({}, { __index = function(t, k) local e = setmetatable({}, { __index = function() return 0 end }) rawset(t, k, e) return e end })
local DEFAULT = { bool = false, number = 0, luaIndex = 1, string = "", cstring = "", time_t = 0, BigUInteger = 0, size = 0,
	WOWGUID = "", fileID = 0, textureAtlas = "", UnitToken = "player", uiMapID = 0, ScriptRegion = nil }
local function returnsOf(fn)
	local out, n = {}, 0
	for i, r in ipairs(fn.Returns or {}) do
		n = i
		if not r.Nilable then
			local d = DEFAULT[r.Type]
			if d == nil and r.Type and r.Type ~= "ScriptRegion" and r.Type ~= "SimpleFrame" then
				d = (rawget(Enum, r.Type) and 0) or {}
			end
			out[i] = d
		end
	end
	return out, n
end
BENCH.apiFunctions = 0
function BENCH.InstallAPI(tables)
	-- enums and constants first (constants may name enum values)
	for _, sys in ipairs(tables) do
		for _, t in ipairs(sys.Tables or {}) do
			if t.Type == "Enumeration" then
				local e = {}
				for _, f in ipairs(t.Fields or {}) do e[f.Name] = f.EnumValue end
				rawset(Enum, t.Name, setmetatable(e, { __index = function() return 0 end }))
			elseif t.Type == "Constants" then
				local c = {}
				for _, v in ipairs(t.Values or {}) do c[v.Name] = v.Value end
				rawset(Constants, t.Name, c)
			end
		end
	end
	for _, sys in ipairs(tables) do
		if sys.Type ~= "ScriptObject" then
			local into = _G
			if sys.Namespace then
				into = rawget(_G, sys.Namespace)
				if into == nil then into = {} rawset(_G, sys.Namespace, into) end
			end
			for _, fn in ipairs(sys.Functions or {}) do
				if rawget(into, fn.Name) == nil then
					local out, n = returnsOf(fn)
					local fname = (sys.Namespace and (sys.Namespace .. ".") or "") .. fn.Name
					rawset(into, fn.Name, function()
						local r = {}
						for i = 1, n do local v = out[i] r[i] = type(v) == "table" and {} or v end
						return unpack(r, 1, n)
					end)
					BENCH.apiFunctions = BENCH.apiFunctions + 1
				end
			end
		end
	end
end

------------------------------------------------------------------------------------------
-- _G: who writes which global; unknown global strings and constants of the interface.
------------------------------------------------------------------------------------------
BENCH.strings = {}
SOUNDKIT = setmetatable({}, { __index = function() return 1 end })

-- FrameXML names read from the client's interface source (check-pack.py --ui): functions
-- that do nothing, tables and mixins that are empty, named frames, simple constants.
function BENCH.InstallUI(funcs, tables, frames, consts)
	for _, n in ipairs(funcs) do if rawget(_G, n) == nil then rawset(_G, n, magic(n)) end end
	for _, n in ipairs(tables) do if rawget(_G, n) == nil then rawset(_G, n, magic(n)) end end
	for n, ftype in pairs(frames) do if rawget(_G, n) == nil then game(ftype, n, UIParent) end end
	for n, v in pairs(consts) do if rawget(_G, n) == nil then rawset(_G, n, v) end end
end

BENCH.blizzard = {}
for k in pairs(_G) do BENCH.blizzard[k] = true end
function BENCH.SealGlobals()
	for k in pairs(_G) do BENCH.blizzard[k] = true end
	setmetatable(_G, {
		__newindex = function(t, k, v)
			if type(k) == "string" then
				local who = B.current
				if B.blizzard[k] and type(rawget(t, k)) == "function" and who ~= "(game)" and who ~= "(bench)" then
					note(B.replaced, { who, k })
				end
				local g = B.globals[k]
				if not g then g = {} B.globals[k] = g note(B.globalOrder, k) end
				if not g[who] then g[who] = true g.__n = (g.__n or 0) + 1 end
			end
			rawset(t, k, v)
		end,
		__index = function(t, k)
			if type(k) ~= "string" then return nil end
			-- the interface's global strings (GlobalStrings of the client, in its language)
			local s = B.strings[k]
			if s ~= nil then return s end
			-- LE_ constants of the client (LE_EXPANSION_..., LE_ITEM_...): numbers
			if k:match("^LE_") then local h = 0 for i = 1, #k do h = (h * 31 + k:byte(i)) % 100000 end return h end
			return nil
		end,
	})
end

-- Events to every frame that registered them (OnEvent), owner as the current addon.
function BENCH.Run(f, script, ...)
	local fn = f.__scripts[script]
	if not fn then return end
	local prev = B.current
	B.current = owner(f)
	local args, n = { ... }, select("#", ...)
	local ok, err = xpcall(function() return fn(f, unpack(args, 1, n)) end, function(e) return tostring(e) end)
	if not ok then BENCH.Error(script, err) end
	B.current = prev
end
-- lupa: varargs through xpcall need a closure
function BENCH.Fire(event, ...)
	local args = { ... }
	local n = select("#", ...)
	for i = 1, #B.frames do
		local f = B.frames[i]
		if (f.__events[event] or f.__allEvents) and f.__scripts.OnEvent then
			local prev = B.current
			B.current = owner(f)
			local ok, err = pcall(f.__scripts.OnEvent, f, event, unpack(args, 1, n))
			if not ok then BENCH.Error(event, err) end
			B.current = prev
		end
	end
	for _, c in ipairs(EventRegistry.callbacks[event] or {}) do
		local prev = B.current
		B.current = c.addon
		local ok, err
		if c.owner ~= nil and type(c.fn) == "function" then ok, err = pcall(c.fn, c.owner, unpack(args, 1, n))
		elseif type(c.fn) == "function" then ok, err = pcall(c.fn, unpack(args, 1, n)) else ok = true end
		if not ok then BENCH.Error("EventRegistry " .. event, err) end
		B.current = prev
	end
	if event == "ADDON_LOADED" then
		for _, c in ipairs(B.onAddon or {}) do
			if c[1] == args[1] and not c.done then
				c.done = true
				local prev = B.current
				B.current = c[3]
				local ok, err = pcall(c[2])
				if not ok then BENCH.Error("ContinueOnAddOnLoaded", err) end
				B.current = prev
			end
		end
	end
	for _, c in ipairs(B.once or {}) do
		if c[1] == event and not c.done then
			c.done = true
			local prev = B.current
			B.current = c[3]
			local ok, err = pcall(c[2], unpack(args, 1, n))
			if not ok then BENCH.Error(event, err) end
			B.current = prev
		end
	end
end

function BENCH.RunTimers(rounds)
	for _ = 1, rounds or 3 do
		local list = B.timers
		B.timers = {}
		for _, t in ipairs(list) do
			local prev = B.current
			B.current = t[2]
			local ok, err = pcall(t[1])
			if not ok then BENCH.Error("C_Timer", err) end
			B.current = prev
		end
	end
	B.timers = {}
end

-- Items the bench knows (check-pack.py fills it): id -> { name, quality, level, reqLevel,
-- equipLoc, sellPrice, classID, subclassID }. C_Item answers from it like the game's cache.
BENCH.items = {}
function BENCH.InstallItems()
	C_Item = C_Item or {}
	local function info(id)
		if type(id) == "string" then id = tonumber(id:match("item:(%d+)")) end
		local it = B.items[id]
		if not it then return nil end
		return it.name, "|cffffffff|Hitem:" .. id .. "::::::::20:::::|h[" .. it.name .. "]|h|r", it.quality, it.level or 1,
			it.reqLevel or 0, "", "", 20, it.equipLoc or "", 134400, it.sellPrice or 0, it.classID or 15, it.subclassID or 0
	end
	C_Item.GetItemInfo = info
	GetItemInfo = info
	C_Item.GetItemInfoInstant = function(id)
		if type(id) == "string" then id = tonumber(id:match("item:(%d+)")) end
		local it = B.items[id]
		if not it then return nil end
		return id, "", "", it.equipLoc or "", 134400, it.classID or 15, it.subclassID or 0
	end
	GetItemInfoInstant = C_Item.GetItemInfoInstant
	-- Quests the scenario marks done (BENCH.completed[questID] = true).
	C_QuestLog = C_QuestLog or {}
	C_QuestLog.IsQuestFlaggedCompleted = function(q) return B.completed[q] == true end
end
BENCH.completed = {}

-- An item tooltip shown: the post-calls of every addon, in the order they were added.
-- keep: run the post-calls again on the tooltip as it is (the game refreshes a shown
-- tooltip that way), without a new owner.
function BENCH.Tooltip(tip, itemID, keep, owner)
	if not keep then
		tip:SetOwner(owner or UIParent, "ANCHOR_NONE")
		-- The game's own lines come first: the name and one more.
		local it = B.items[itemID]
		tip:AddLine(it and it.name or ("Item " .. itemID))
		tip:AddLine("(game line)")
	end
	local data = { type = 0, id = itemID, lines = {}, hyperlink = "item:" .. itemID }
	tip.GetPrimaryTooltipData = function() return data end
	tip.GetItem = function() return "Item " .. itemID, "|cffffffff|Hitem:" .. itemID .. "::::::::20:::::|h[Item]|h|r", itemID end
	for _, c in ipairs(TooltipDataProcessor.postCalls) do
		if c.kind == (Enum.TooltipDataType and Enum.TooltipDataType.Item or 0) or c.kind == "ALL" or c.kind == TooltipDataProcessor.AllTypes then
			local prev = B.current
			B.current = c.addon
			local ok, err = pcall(c.fn, tip, data)
			if not ok then BENCH.Error("tooltip post-call", err) end
			B.current = prev
		end
	end
	if tip.__scripts.OnTooltipSetItem then BENCH.Run(tip, "OnTooltipSetItem") end
	local ok, err = pcall(tip.Show, tip)
	if not ok then BENCH.Error("tooltip Show (hooks)", err) end
	return #tip.__lines
end
