-- BuffAlerts Forever - Core
-- Target: WoW Forever (modern client, interface 16001, with Midnight-style API restrictions)
local ADDON, ns = ...


------------------------------------------------------------
-- Utilities
------------------------------------------------------------
local function IsSecret(v)
    return issecretvalue ~= nil and issecretvalue(v) == true
end
ns.IsSecret = IsSecret

local function SafeCall(fn, ...)
    if not fn then return false end
    return pcall(fn, ...)
end

local function Print(msg)
    print("|cffc79c6eBuffAlerts Forever:|r " .. tostring(msg))
end
ns.Print = Print

local function CopyDefaults(src, dst)
    for k, v in pairs(src) do
        if type(v) == "table" then
            if type(dst[k]) ~= "table" then dst[k] = {} end
            CopyDefaults(v, dst[k])
        elseif dst[k] == nil then
            dst[k] = v
        end
    end
end

local function IsKnown(id)
    if not id then return false end
    if C_SpellBook and C_SpellBook.IsSpellKnown then
        local ok, known = SafeCall(C_SpellBook.IsSpellKnown, id)
        if ok and not IsSecret(known) and known then return true end
    end
    if IsPlayerSpell then
        local ok, known = SafeCall(IsPlayerSpell, id)
        if ok and not IsSecret(known) and known then return true end
    end
    return false
end

local function SpellName(id)
    if id and C_Spell and C_Spell.GetSpellName then
        local ok, name = SafeCall(C_Spell.GetSpellName, id)
        if ok and name and not IsSecret(name) then return name end
    end
end

local function SpellIcon(id)
    if id and C_Spell and C_Spell.GetSpellTexture then
        local ok, tex = SafeCall(C_Spell.GetSpellTexture, id)
        if ok and tex and not IsSecret(tex) then return tex end
    end
end
ns.SpellIcon = SpellIcon

------------------------------------------------------------
-- State
------------------------------------------------------------
local db
local frames = {}
local playerClass
local inCombat = false
local spec = "none"
local myAlerts = {}        -- buff alerts for the current class
local idInfo = {}          -- spellID -> { family, rank, extra }
local nameInfo = {}        -- localized name -> family
local durations = {}       -- spellID -> duration read from the game
local recommended = {}     -- alertKey -> { id = spellID, family = key }
local upgrades = {}        -- alertKey -> spellID of a better version not trained yet
local validId = {}         -- IDs confirmed to be the right spell on this client
local myWeapon = {}        -- weapon alerts for the current class
local myWarn = {}          -- wrong-buff-in-combat warnings
local myUsable = {}        -- reactive ability alerts (Overpower, Revenge, Execute...)
local myPet = {}           -- missing pet alerts
local myUtility = {}       -- small utility alerts (shards, ammo, durability...)
local usableIds = {}       -- alertKey -> spellID of the best known rank
local usableSince = {}     -- alertKey -> GetTime() when the ability became usable (proc countdown)
local weaponExp = {}       -- [16]/[17] = GetTime() when the temporary enchant ends
local WeaponMissing        -- defined further below
local trackers = {}        -- alertKey -> list of { sid, name, family, expires }
local selfDirty = true
ns.unlocked = false
ns.frames = frames

for fk, fam in pairs(ns.FAMILIES) do
    for rank, id in ipairs(fam.ids) do idInfo[id] = { family = fk, rank = rank } end
    for _, id in ipairs(fam.extra or {}) do idInfo[id] = { family = fk, rank = 0, extra = true } end
end

local patternInfo = {}     -- { pattern, family } for families matched by name fragments

local function FamilyOf(sid, name)
    if sid and not IsSecret(sid) and idInfo[sid] then
        if validId[sid] then return idInfo[sid].family end
        return nil
    end
    if name and not IsSecret(name) then
        if nameInfo[name] then return nameInfo[name] end
        for _, p in ipairs(patternInfo) do
            if name:find(p[1], 1, true) then return p[2] end
        end
    end
end
ns.FamilyOf = FamilyOf

function ns.FamilyName(fk)
    local fam = ns.FAMILIES[fk]
    if not fam then return tostring(fk) end
    return SpellName(fam.ids[#fam.ids]) or fam.label
end

------------------------------------------------------------
-- Spell, spec and recommendation resolution
------------------------------------------------------------
local function BestKnown(fk)
    local fam = ns.FAMILIES[fk]
    for _, id in ipairs(fam.ids) do
        if validId[id] and IsKnown(id) then return id end
    end
    -- Fallback: look up by localized name (in case Forever uses new IDs), or by the family's known names
    local names = {}
    if #fam.ids > 0 then names[#names + 1] = SpellName(fam.ids[#fam.ids]) end
    for _, n in ipairs(fam.names or {}) do names[#names + 1] = n end
    for _, name in ipairs(names) do
        if C_Spell and C_Spell.GetSpellInfo then
            local ok, info = SafeCall(C_Spell.GetSpellInfo, name)
            if ok and info and not IsSecret(info.spellID) and IsKnown(info.spellID) then return info.spellID end
        end
    end
end

local function DetectSpec()
    local sigs = ns.SPEC_SIGNATURES[playerClass]
    if not sigs then return "none" end
    local best, bestScore = "none", 0
    for _, entry in ipairs(sigs) do
        local score = 0
        for _, id in ipairs(entry[2]) do
            if IsKnown(id) then score = score + 1 end
        end
        if score > bestScore then best, bestScore = entry[1], score end
    end
    return best
end

local function AutoOrder(alert)
    if alert.specPriority then
        return alert.specPriority[spec] or alert.specPriority.none
    end
    return alert.families
end

-- Preference order: fixed choice (if any), then the automatic order
local function Order(alert)
    local choice = db[alert.key].choice
    local order = {}
    if choice and choice ~= "auto" and ns.FAMILIES[choice] then order[1] = choice end
    for _, fk in ipairs(AutoOrder(alert)) do order[#order + 1] = fk end
    return order
end

local function Recommend(alert)
    for _, fk in ipairs(Order(alert)) do
        local id = BestKnown(fk)
        if id then return id, fk end
    end
end

-- Best rank of the family the trainer would already offer at your level
local function BestAvailable(fk, level)
    local fam = ns.FAMILIES[fk]
    if fam.talent then
        local talented = false
        for _, id in ipairs(fam.ids) do
            if validId[id] and IsKnown(id) then talented = true; break end
        end
        if not talented then return nil end
    end
    for _, id in ipairs(fam.ids) do
        local req = ns.LEVELS[id]
        if validId[id] and req and req <= level then return id end
    end
end

-- Is there something better to train? Returns the spellID or nil
local function FindUpgrade(alert)
    local ok, level = SafeCall(UnitLevel, "player")
    if not ok or IsSecret(level) or not level then return nil end
    for _, fk in ipairs(Order(alert)) do
        local avail = BestAvailable(fk, level)
        if avail then
            if IsKnown(avail) then return nil end
            local known = BestKnown(fk)
            if known and not idInfo[known] then return nil end  -- new Forever ID: ranks cannot be compared
            if known and idInfo[known].rank <= idInfo[avail].rank then return nil end  -- already knows an equal or higher rank
            return avail
        end
    end
end

-- Discard IDs that belong to a different spell on this client (name differs from rank 1)
local function ValidateIds()
    local function check(list)
        if not list or #list == 0 then return end
        local base = SpellName(list[#list])
        for _, id in ipairs(list) do
            validId[id] = (base == nil) or (SpellName(id) == base)
        end
    end
    for _, fam in pairs(ns.FAMILIES) do
        check(fam.ids)
        check(fam.extra)
    end
end

-- Text for the options window: what automatic mode would pick
function ns.AutoRecommendationName(key)
    for _, alert in ipairs(myAlerts) do
        if alert.key == key then
            for _, fk in ipairs(AutoOrder(alert)) do
                if BestKnown(fk) then return ns.FamilyName(fk) end
            end
        end
    end
    return "none learned"
end

function ns.GetSpec() return spec end

local function Resolve()
    ValidateIds()
    wipe(nameInfo)
    for fk, fam in pairs(ns.FAMILIES) do
        for _, list in ipairs({ fam.ids, fam.extra or {} }) do
            for _, id in ipairs(list) do
                local n = validId[id] and SpellName(id)
                if n then nameInfo[n] = fk end
            end
        end
        for _, n in ipairs(fam.names or {}) do nameInfo[n] = fk end
    end
    wipe(patternInfo)
    for fk, fam in pairs(ns.FAMILIES) do
        for _, p in ipairs(fam.patterns or {}) do patternInfo[#patternInfo + 1] = { p, fk } end
    end
    spec = DetectSpec()
    for _, alert in ipairs(myAlerts) do
        local id, fk = Recommend(alert)
        recommended[alert.key] = id and { id = id, family = fk } or nil
        upgrades[alert.key] = FindUpgrade(alert)
        local f = frames[alert.key]
        if f then
            local fam = ns.FAMILIES[fk or alert.families[1]]
            f.baseIcon = SpellIcon(id) or SpellIcon(upgrades[alert.key]) or SpellIcon(fam.ids[#fam.ids]) or alert.icon or 134400
            f.icon:SetTexture(f.baseIcon)
            if upgrades[alert.key] then
                f.train.icon:SetTexture(SpellIcon(upgrades[alert.key]) or 134400)
            end
        end
    end
    for _, alert in ipairs(myWeapon) do
        local tex = alert.icon
        for _, fk in ipairs(alert.families or {}) do
            local id = BestKnown(fk)
            if id then tex = SpellIcon(id); break end
        end
        if frames[alert.key] then frames[alert.key].icon:SetTexture(tex or 134400) end
    end
    for _, alert in ipairs(myWarn) do
        local fam = ns.FAMILIES[alert.family]
        if frames[alert.key] then
            frames[alert.key].icon:SetTexture(SpellIcon(BestKnown(alert.family)) or SpellIcon(fam.ids[#fam.ids]) or 134400)
        end
    end
    for _, list in ipairs({ myUsable, myPet }) do
        for _, alert in ipairs(list) do
            local id = BestKnown(alert.family)
            usableIds[alert.key] = id
            local fam = ns.FAMILIES[alert.family]
            if frames[alert.key] then
                frames[alert.key].icon:SetTexture(SpellIcon(id) or SpellIcon(fam.ids[#fam.ids]) or 134400)
            end
        end
    end
    if ns.RefreshOptions then ns.RefreshOptions() end
end
ns.Resolve = Resolve

function ns.HasRecommendation(key)
    return recommended[key] ~= nil
end

function ns.GetRecommendedIcon(key)
    local rec = recommended[key]
    if rec then return SpellIcon(rec.id) end
end

------------------------------------------------------------
-- Aura reading (only when the game allows it)
------------------------------------------------------------
local function AurasLocked()
    if C_Secrets and C_Secrets.ShouldAurasBeSecret then
        local ok, v = SafeCall(C_Secrets.ShouldAurasBeSecret)
        if not ok or IsSecret(v) then return true end
        return v and true or false
    end
    return false
end
ns.AurasLocked = AurasLocked

-- List of a unit's buffs, or nil if they cannot be read right now
function ns.ScanAuras(unit)
    if AurasLocked() then return nil end
    if not (C_UnitAuras and C_UnitAuras.GetAuraDataByIndex) then return nil end
    local ok, list = pcall(function()
        local out = {}
        for i = 1, 40 do
            local a = C_UnitAuras.GetAuraDataByIndex(unit, i, "HELPFUL")
            if not a then break end
            local sid, name, exp, dur = a.spellId, a.name, a.expirationTime, a.duration
            if IsSecret(sid) or IsSecret(name) or IsSecret(exp) or IsSecret(dur) then error("secret") end
            out[#out + 1] = { sid = sid, name = name, exp = exp, dur = dur }
        end
        return out
    end)
    if ok then return list end
end

local function FamilySet(alert)
    if not alert.familySet then
        alert.familySet = {}
        for _, fk in ipairs(alert.families) do alert.familySet[fk] = true end
    end
    return alert.familySet
end

local function RefreshSelfFromAuras()
    local list = ns.ScanAuras("player")
    if not list then return false end
    for _, alert in ipairs(myAlerts) do
        local set, t = FamilySet(alert), {}
        for _, a in ipairs(list) do
            local fk = FamilyOf(a.sid, a.name)
            if fk and set[fk] then
                if a.dur and a.dur > 0 then durations[a.sid] = a.dur end
                -- Charges are unknown from the aura read; assume a full stack (a.applications is used when available)
                local fam = ns.FAMILIES[fk]
                local charges = fam.charges and (tonumber(a.applications) or 0) > 0 and tonumber(a.applications) or fam.charges
                t[#t + 1] = { sid = a.sid, name = a.name, family = fk, charges = charges,
                              expires = (a.exp and a.exp > 0) and a.exp or math.huge }
            end
        end
        trackers[alert.key] = t
    end
    return true
end

-- Does the active buff satisfy the alert? (strict mode requires the recommended buff, at the recommended rank or higher)
local function Satisfies(entry, alert)
    if not db[alert.key].strict then return true end
    local rec = recommended[alert.key]
    if not rec then return true end
    if entry.family ~= rec.family then return false end
    local info, recInfo = idInfo[entry.sid], idInfo[rec.id]
    if not info or info.extra or not recInfo then return true end
    return info.rank <= recInfo.rank
end

local function BuffMissing(alert)
    local now = GetTime()
    for _, entry in ipairs(trackers[alert.key] or {}) do
        if now < entry.expires and Satisfies(entry, alert) then return false end
    end
    return true
end

-- Seconds left on the best matching buff (nil when none or when it has no expiry)
local function BuffRemaining(alert)
    local now, best = GetTime(), nil
    for _, entry in ipairs(trackers[alert.key] or {}) do
        if now < entry.expires and entry.expires ~= math.huge and Satisfies(entry, alert) then
            if not best or entry.expires > best.expires then best = entry end
        end
    end
    return best and (best.expires - now) or nil, best
end

local function SetTimer(f, seconds)
    if seconds and seconds > 0 then
        f.timer:SetText(string.format("%d", math.ceil(seconds)))
        f.timer:Show()
    else
        f.timer:Hide()
    end
end

-- In combat the game hides auras, so we track our own casts
local function CastOnSelf()
    local ok, res = pcall(function()
        if not UnitExists("target") then return true end
        if UnitIsUnit("target", "player") then return true end
        if not UnitIsFriend("player", "target") then return true end
        return false
    end)
    return ok and res == true
end

local function OnPlayerCast(spellID)
    if spellID == nil or IsSecret(spellID) then return end
    -- Some casts consume a tracked buff (e.g. Judgement removes the active Seal)
    for _, alert in ipairs(myAlerts) do
        for _, id in ipairs(alert.consumedBy or {}) do
            if spellID == id then trackers[alert.key] = {} end
        end
    end
    local fk = FamilyOf(spellID, SpellName(spellID))
    if not fk then return end
    for _, alert in ipairs(myWeapon) do
        for _, wf in ipairs(alert.families or {}) do
            if wf == fk then
                local slot = WeaponMissing(16) and 16 or (WeaponMissing(17) and 17 or nil)
                if slot then weaponExp[slot] = GetTime() + ns.FAMILIES[fk].duration end
            end
        end
    end
    for _, alert in ipairs(myAlerts) do
        if FamilySet(alert)[fk] and (not alert.targeted or CastOnSelf()) then
            local t = trackers[alert.key] or {}
            for i = #t, 1, -1 do
                if alert.exclusive or t[i].family == fk then table.remove(t, i) end
            end
            t[#t + 1] = { sid = spellID, family = fk, charges = ns.FAMILIES[fk].charges,
                          expires = GetTime() + (durations[spellID] or ns.FAMILIES[fk].duration) }
            trackers[alert.key] = t
        end
    end
end

------------------------------------------------------------
-- Alert frames
------------------------------------------------------------
local function SaveFramePosition(key)
    local f = frames[key]
    local cx, cy = f:GetCenter()
    local ux, uy = UIParent:GetCenter()
    if not cx or not ux then return end
    if db[key].anchor == "TOP" then uy = UIParent:GetTop() or uy end
    db[key].x = math.floor(cx - ux + 0.5)
    db[key].y = math.floor(cy - uy + 0.5)
    ns.ApplyLayout(key)
    if ns.RefreshOptions then ns.RefreshOptions() end
end

local function CreateAlert(key, label)
    local f = CreateFrame("Frame", "BuffAlertsForever_" .. key, UIParent)
    f.key = key
    f:SetFrameStrata("HIGH")
    f:SetClampedToScreen(true)
    f:SetMovable(true)
    f:EnableMouse(false)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", function(self) self:StartMoving() end)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        SaveFramePosition(key)
    end)

    f.icon = f:CreateTexture(nil, "ARTWORK")
    f.icon:SetAllPoints()
    f.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    f.icon:SetTexture(134400)

    f.border = f:CreateTexture(nil, "BACKGROUND")
    f.border:SetPoint("TOPLEFT", -3, 3)
    f.border:SetPoint("BOTTOMRIGHT", 3, -3)
    f.border:SetColorTexture(0.1, 0.9, 0.1, 0.8)
    f.border:Hide()

    f.label = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    f.label:SetPoint("TOP", f, "BOTTOM", 0, -4)
    f.label:SetText(label)
    f.label:Hide()

    -- Countdown shown on the icon (remaining buff time or proc window)
    f.timer = f:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
    f.timer:SetPoint("CENTER", f, "CENTER", 0, 0)
    f.timer:SetTextColor(1, 1, 1)
    f.timer:Hide()

    -- "Train" badge: shown above the alert when the trainer has a better version
    f.train = CreateFrame("Frame", nil, f)
    f.train:SetPoint("BOTTOM", f, "TOP", 0, 6)
    f.train.bg = f.train:CreateTexture(nil, "BACKGROUND")
    f.train.bg:SetPoint("TOPLEFT", -2, 2)
    f.train.bg:SetPoint("BOTTOMRIGHT", 2, -2)
    f.train.bg:SetColorTexture(1, 0.82, 0, 1)
    f.train.icon = f.train:CreateTexture(nil, "ARTWORK")
    f.train.icon:SetAllPoints()
    f.train.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    f.train.text = f.train:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    f.train.text:SetPoint("BOTTOM", f.train, "TOP", 0, 2)
    f.train.text:SetTextColor(0.2, 1, 0.2)
    f.train.text:SetText("Train")
    f.train:Hide()

    f:Hide()
    frames[key] = f
end

function ns.ApplyLayout(key)
    local f, cfg = frames[key], db[key]
    if not f then return end
    f:SetSize(cfg.size, cfg.size)
    if f.timer then
        -- Big outlined countdown, scaled with the icon
        local font = f.timer:GetFont()
        if font then f.timer:SetFont(font, math.max(14, math.floor(cfg.size * 0.62)), "THICKOUTLINE") end
    end
    if f.train then
        local ts = math.max(14, math.floor(cfg.size * 0.45))
        f.train:SetSize(ts, ts)
    end
    f:ClearAllPoints()
    if cfg.anchor == "TOP" then
        f:SetPoint("TOP", UIParent, "TOP", cfg.x, cfg.y)
    else
        f:SetPoint("CENTER", UIParent, "CENTER", cfg.x, cfg.y)
    end
end

function ns.SetUnlocked(state)
    ns.unlocked = state and true or false
    for _, f in pairs(frames) do
        f:EnableMouse(ns.unlocked)
        f.border:SetShown(ns.unlocked)
        f.label:SetShown(ns.unlocked)
    end
    ns.Update()
    if ns.UpdateParty then ns.UpdateParty() end
end

function ns.ResetDefaults()
    for key, def in pairs(ns.DEFAULTS) do
        for k, v in pairs(def) do db[key][k] = v end
        ns.ApplyLayout(key)
    end
    Resolve()
    ns.Update()
end

------------------------------------------------------------
-- Display logic
------------------------------------------------------------
local function PlayerDead()
    local ok, dead = SafeCall(UnitIsDeadOrGhost, "player")
    return ok and not IsSecret(dead) and dead
end

local function OnTaxi()
    local ok, v = SafeCall(UnitOnTaxi, "player")
    return ok and not IsSecret(v) and v
end

local function ShowPlain(f)
    f:SetAlpha(1)
    if not f:IsShown() and not ns.unlocked and f.key and db[f.key] and db[f.key].sound then
        pcall(PlaySound, SOUNDKIT and SOUNDKIT.RAID_WARNING or 8959, "Master")
    end
    f:Show()
end

-- At level 1 an alert only appears for a spell the character already knows;
-- "train this" reminders for spells not learned yet start at level 2
local function IsLevelOne()
    local ok, level = SafeCall(UnitLevel, "player")
    return ok and not IsSecret(level) and level == 1
end

local function UpdateSelfAlert(alert)
    local f = frames[alert.key]
    local upgrade = upgrades[alert.key]
    f.train:SetShown(upgrade ~= nil)
    if ns.unlocked then ShowPlain(f) return end
    -- A spell you have never learned gets no alert of its own; the "Train" badge only rides on a
    -- normal alert (e.g. Mage Armor not learned yet shows on the Armor alert when no armor is active)
    local known = recommended[alert.key] ~= nil or alert.noSpell
    local cfg = db[alert.key]
    if not cfg.enabled or not known or PlayerDead() or OnTaxi()
       or (cfg.combatOnly and not inCombat) or (alert.hideInCombat and inCombat)
       or (alert.specOnly and spec ~= alert.specOnly and not cfg.allSpecs) then
        f:Hide() return
    end
    -- The "Train" badge follows the alert: it goes away when the buff is applied
    if BuffMissing(alert) then
        if f.baseIcon then f.icon:SetTexture(f.baseIcon) end
        SetTimer(f, nil)
        ShowPlain(f)
        return
    end
    -- Buff is up: show the countdown while active (showTimer) or shortly before it expires
    local warn = cfg.expiryWarn or 0
    local remaining, entry
    if warn > 0 or cfg.showTimer then remaining, entry = BuffRemaining(alert) end
    if remaining and (cfg.showTimer or remaining <= warn) then
        -- Icon follows the buff that is actually active (e.g. the current seal)
        local tex = entry and SpellIcon(entry.sid)
        f.icon:SetTexture(tex or f.baseIcon or 134400)
        SetTimer(f, remaining)
        ShowPlain(f)
    else
        f:Hide()
    end
end

-- Reactive abilities: shown while the game reports the spell as usable
local function UpdateUsable(alert)
    local f, id = frames[alert.key], usableIds[alert.key]
    if ns.unlocked then ShowPlain(f) return end
    if not (db[alert.key].enabled and id) or PlayerDead() then
        f:Hide() return
    end
    if not (C_Spell and C_Spell.IsSpellUsable) then f:Hide() return end
    local ok, usable, noPower = SafeCall(C_Spell.IsSpellUsable, id)
    if not ok then f:Hide() return end
    -- Execute: also show below 20% health when rage is the only thing missing
    if alert.showWithoutPower and not IsSecret(usable) and not usable
       and noPower ~= nil and not IsSecret(noPower) and noPower then
        usable = true
    end
    if IsSecret(usable) then
        -- In combat the game may hide the value; let the widget itself decide the opacity.
        -- The countdown still runs from the combat event that triggered the ability.
        if f.SetAlphaFromBoolean then
            local since = usableSince[alert.key]
            if alert.window and since and GetTime() - since < alert.window then
                SetTimer(f, alert.window - (GetTime() - since))
            else
                SetTimer(f, nil)
            end
            f:Show()
            if not pcall(f.SetAlphaFromBoolean, f, usable, 1, 0) then f:Hide() end
        else
            f:Hide()
        end
        return
    end
    if usable then
        -- Countdown of the proc window, measured from the moment the ability became usable
        if alert.window then
            if not usableSince[alert.key] then usableSince[alert.key] = GetTime() end
            SetTimer(f, alert.window - (GetTime() - usableSince[alert.key]))
        end
        ShowPlain(f)
    else
        -- Keep a trigger-based start time (it may predate the game reporting "usable")
        if usableSince[alert.key] and GetTime() - usableSince[alert.key] > (alert.window or 0) then
            usableSince[alert.key] = nil
        end
        f:Hide()
    end
end

-- Missing pet: shown in and out of combat while no living pet is out
local function UpdatePet(alert)
    local f = frames[alert.key]
    if ns.unlocked then ShowPlain(f) return end
    if not (db[alert.key].enabled and usableIds[alert.key]) or (db[alert.key].combatOnly and not inCombat)
       or PlayerDead() or OnTaxi() then
        f:Hide() return
    end
    local okE, exists = SafeCall(UnitExists, "pet")
    local okD, dead = SafeCall(UnitIsDead, "pet")
    if not okE or IsSecret(exists) or (okD and IsSecret(dead)) then f:Hide() return end
    if not exists or (okD and dead) then ShowPlain(f) else f:Hide() end
end

------------------------------------------------------------
-- Temporary weapon enchants (weapon imbues / poisons)
------------------------------------------------------------
local function HasWeapon(slot)
    local ok, itemID = SafeCall(GetInventoryItemID, "player", slot)
    if not ok or IsSecret(itemID) or not itemID then return false end
    if slot == 16 then return true end
    -- Off-hand only counts if it is a weapon (ignores shields and held-in-off-hand items)
    local getInfo = (C_Item and C_Item.GetItemInfoInstant) or GetItemInfoInstant
    local ok2, _, _, _, _, _, classID = SafeCall(getInfo, itemID)
    if not ok2 or IsSecret(classID) then return false end
    return classID == 2
end

-- Read from the game when possible; if values come back secret, keep the last reading
-- Fallback: look for a temporary enchant line, e.g. "Rockbiter 1 (5 min)", in the item tooltip
local function TooltipHasTempEnchant(slot)
    if not (C_TooltipInfo and C_TooltipInfo.GetInventoryItem) then return nil end
    local ok, data = pcall(C_TooltipInfo.GetInventoryItem, "player", slot)
    if not ok or type(data) ~= "table" or type(data.lines) ~= "table" then return nil end
    for _, line in ipairs(data.lines) do
        local text = line.leftText
        if text and not IsSecret(text) and (text:find("%(%d+ [Mm]in%)") or text:find("%(%d+ [Ss]ec%)")) then
            return true
        end
    end
    return false
end

local function ReadWeaponEnchants()
    if not GetWeaponEnchantInfo then return false end
    local ok, hasMH, mhExp, _, _, hasOH, ohExp = pcall(GetWeaponEnchantInfo)
    if not ok or IsSecret(hasMH) or IsSecret(mhExp) or IsSecret(hasOH) or IsSecret(ohExp) then return false end
    local now = GetTime()
    weaponExp[16] = hasMH and ((mhExp and mhExp > 0) and (now + mhExp / 1000) or math.huge) or nil
    weaponExp[17] = hasOH and ((ohExp and ohExp > 0) and (now + ohExp / 1000) or math.huge) or nil
    -- If the API says "no enchant" but the tooltip shows one, trust the tooltip
    for _, slot in ipairs({ 16, 17 }) do
        if not weaponExp[slot] and HasWeapon(slot) and TooltipHasTempEnchant(slot) then weaponExp[slot] = math.huge end
    end
    return true
end

WeaponMissing = function(slot)
    if not HasWeapon(slot) then return false end
    return not weaponExp[slot] or GetTime() >= weaponExp[slot]
end

local function WeaponAlertAvailable(alert)
    local ok, level = SafeCall(UnitLevel, "player")
    if not ok or IsSecret(level) or not level or level < alert.minLevel then return false end
    if alert.families then
        for _, fk in ipairs(alert.families) do
            if BestKnown(fk) then return true end
        end
        return false
    end
    return true
end

-- Icon of the weapon equipped in the slot (keeps the default icon if it cannot be read)
local function SetWeaponIcon(f, slot)
    local ok, tex = SafeCall(GetInventoryItemTexture, "player", slot)
    if ok and tex and not IsSecret(tex) then f.icon:SetTexture(tex) end
end

-- In-combat warning when the tracked buff is the "wrong" one (e.g. Aspect of the Pack)
local function UpdateWarnAlert(alert)
    local f = frames[alert.key]
    if ns.unlocked then ShowPlain(f) return end
    if not db[alert.key].enabled or not inCombat or PlayerDead() then f:Hide() return end
    local now = GetTime()
    for _, e in ipairs(trackers[alert.source] or {}) do
        if e.family == alert.family and now < e.expires then ShowPlain(f) return end
    end
    f:Hide()
end

local function UpdateWeaponAlert(alert)
    local f = frames[alert.key]
    if ns.unlocked then SetWeaponIcon(f, 16); ShowPlain(f) return end
    if not db[alert.key].enabled or (db[alert.key].combatOnly and not inCombat)
       or PlayerDead() or OnTaxi() or not WeaponAlertAvailable(alert) then
        f:Hide() return
    end
    -- Show the weapon that is missing an enchant (main hand first)
    local slot = WeaponMissing(16) and 16 or (WeaponMissing(17) and 17 or nil)
    if slot then
        SetWeaponIcon(f, slot)
        SetTimer(f, nil)
        ShowPlain(f)
        return
    end
    -- Both enchanted: warn before the first one runs out
    local warn, now = db[alert.key].expiryWarn or 0, GetTime()
    local soonSlot, soonLeft
    for _, s in ipairs({ 16, 17 }) do
        if warn > 0 and HasWeapon(s) and weaponExp[s] and weaponExp[s] ~= math.huge then
            local left = weaponExp[s] - now
            if left <= warn and (not soonLeft or left < soonLeft) then soonSlot, soonLeft = s, left end
        end
    end
    if soonSlot then
        SetWeaponIcon(f, soonSlot)
        SetTimer(f, soonLeft)
        ShowPlain(f)
    else
        f:Hide()
    end
end

------------------------------------------------------------
-- Utility checks: each returns true when the alert should show, false otherwise
------------------------------------------------------------
local function Num(v) return (v ~= nil and not IsSecret(v)) and tonumber(v) or nil end

ns.UtilityChecks = {
    soulShards = function(cfg)
        local getCount = (C_Item and C_Item.GetItemCount) or GetItemCount
        local ok, n = SafeCall(getCount, 6265)
        n = ok and Num(n)
        return n ~= nil and n < (cfg.threshold or 5)
    end,
    ammo = function(cfg)
        local okR, ranged = SafeCall(GetInventoryItemID, "player", 18)
        if not okR or IsSecret(ranged) or not ranged then return false end   -- no ranged weapon: handled by Missing Weapon
        local getInfo = (C_Item and C_Item.GetItemInfoInstant) or GetItemInfoInstant
        local okI, _, _, _, _, _, classID, subClassID = SafeCall(getInfo, ranged)
        -- Only bows (2), guns (3) and crossbows (18) use ammo; wands and thrown do not
        if not okI or IsSecret(subClassID) or not (subClassID == 2 or subClassID == 3 or subClassID == 18) then return false end
        local okA, ammoID = SafeCall(GetInventoryItemID, "player", 0)
        if not okA or IsSecret(ammoID) or not ammoID then return true end
        local okC, count = SafeCall(GetInventoryItemCount, "player", 0)
        count = okC and Num(count)
        return count ~= nil and count < (cfg.threshold or 200)
    end,
    petHappiness = function()
        if not GetPetHappiness then return false end
        local okE, exists = SafeCall(UnitExists, "pet")
        if not okE or IsSecret(exists) or not exists then return false end
        local ok, happiness = SafeCall(GetPetHappiness)
        happiness = ok and Num(happiness)
        return happiness ~= nil and happiness < 3   -- 3 = happy, 2 = content, 1 = unhappy
    end,
    missingWeapon = function()
        local ok, mh = SafeCall(GetInventoryItemID, "player", 16)
        if ok and not IsSecret(mh) and not mh then return true end
        if playerClass == "HUNTER" then
            local okR, ranged = SafeCall(GetInventoryItemID, "player", 18)
            if okR and not IsSecret(ranged) and not ranged then return true end
        end
        return false
    end,
    durability = function(cfg)
        if not GetInventoryItemDurability then return false end
        local worst
        for slot = 1, 18 do
            local ok, cur, max = SafeCall(GetInventoryItemDurability, slot)
            cur, max = ok and Num(cur), ok and Num(max)
            if cur and max and max > 0 then
                local pct = cur / max * 100
                if not worst or pct < worst then worst = pct end
            end
        end
        return worst ~= nil and worst < (cfg.threshold or 20)
    end,
}

local function UpdateUtility(alert)
    local f, cfg = frames[alert.key], db[alert.key]
    if ns.unlocked then ShowPlain(f) return end
    if not cfg.enabled or inCombat or PlayerDead() or OnTaxi() or IsLevelOne() then f:Hide() return end
    local check = ns.UtilityChecks[alert.check]
    local ok, show = pcall(check, cfg)
    if ok and show then ShowPlain(f) else f:Hide() end
end

function ns.Update()
    if not db or not playerClass then return end
    if db.hideAll and not ns.unlocked then
        for _, f in pairs(frames) do f:Hide() end
        return
    end
    if #myWeapon > 0 then ReadWeaponEnchants() end
    if selfDirty and not AurasLocked() then
        if RefreshSelfFromAuras() then selfDirty = false end
    end
    for _, alert in ipairs(myAlerts) do UpdateSelfAlert(alert) end
    for _, alert in ipairs(myUsable) do UpdateUsable(alert) end
    for _, alert in ipairs(myPet) do UpdatePet(alert) end
    for _, alert in ipairs(myUtility) do UpdateUtility(alert) end
    for _, alert in ipairs(myWeapon) do UpdateWeaponAlert(alert) end
    for _, alert in ipairs(myWarn) do UpdateWarnAlert(alert) end
end

function ns.IsInCombat() return inCombat end
function ns.PlayerClass() return playerClass end

------------------------------------------------------------
-- Events
------------------------------------------------------------
local driver = CreateFrame("Frame")

local function SafeRegister(event, unit)
    if unit then
        pcall(driver.RegisterUnitEvent, driver, event, unit)
    else
        pcall(driver.RegisterEvent, driver, event)
    end
end

SafeRegister("ADDON_LOADED")
SafeRegister("PLAYER_LOGIN")

local fastAcc, slowAcc, resolveAcc = 0, 0, 0
local function OnUpdate(_, elapsed)
    fastAcc, slowAcc, resolveAcc = fastAcc + elapsed, slowAcc + elapsed, resolveAcc + elapsed
    if resolveAcc >= 5 then
        resolveAcc = 0
        if not inCombat then Resolve() end
    end
    if slowAcc >= 1 then
        slowAcc = 0
        selfDirty = true
        if ns.UpdateParty then ns.UpdateParty() end
    end
    if fastAcc >= 0.1 then
        fastAcc = 0
        ns.Update()
    end
end

-- A physical hit taken in combat consumes one charge of charge-based buffs (Lightning Shield, Inner Fire).
-- When the charges run out the buff is treated as gone, so the alert comes back mid-fight.
local function OnPhysicalHitTaken()
    for _, t in pairs(trackers) do
        for _, e in ipairs(t) do
            if e.charges then
                e.charges = e.charges - 1
                if e.charges <= 0 then e.expires = 0 end
            end
        end
    end
end

driver:SetScript("OnEvent", function(_, event, arg1, arg2, arg3, arg4, arg5)
    if event == "ADDON_LOADED" and arg1 == ADDON then
        BuffAlertsForeverDB = BuffAlertsForeverDB or {}
        CopyDefaults(ns.DEFAULTS, BuffAlertsForeverDB)
        db = BuffAlertsForeverDB
        ns.db = db

    elseif event == "PLAYER_LOGIN" then
        local _, class = UnitClass("player")
        playerClass = class
        for _, alert in ipairs(ns.SELF_ALERTS) do
            if alert.class == class or alert.class == "ALL" then
                myAlerts[#myAlerts + 1] = alert
                CreateAlert(alert.key, alert.label)
                ns.ApplyLayout(alert.key)
            end
        end
        for _, group in ipairs({ { ns.USABLE_ALERTS, myUsable }, { ns.PET_ALERTS, myPet } }) do
            for _, alert in ipairs(group[1]) do
                if alert.class == class then
                    group[2][#group[2] + 1] = alert
                    CreateAlert(alert.key, alert.label)
                    ns.ApplyLayout(alert.key)
                end
            end
        end
        ns.myUsable = myUsable
        ns.myPet = myPet
        for _, alert in ipairs(ns.UTILITY_ALERTS) do
            if alert.class == class or alert.class == "ALL" then
                myUtility[#myUtility + 1] = alert
                CreateAlert(alert.key, alert.label)
                frames[alert.key].icon:SetTexture(alert.icon)
                ns.ApplyLayout(alert.key)
            end
        end
        ns.myUtility = myUtility
        for _, alert in ipairs(ns.WEAPON_ALERTS) do
            if alert.class == class then
                myWeapon[#myWeapon + 1] = alert
                CreateAlert(alert.key, alert.label)
                ns.ApplyLayout(alert.key)
            end
        end
        for _, alert in ipairs(ns.WARN_ALERTS) do
            if alert.class == class then
                myWarn[#myWarn + 1] = alert
                CreateAlert(alert.key, alert.label)
                local f = frames[alert.key]
                f.warnBorder = f:CreateTexture(nil, "BACKGROUND", nil, -1)
                f.warnBorder:SetPoint("TOPLEFT", -3, 3)
                f.warnBorder:SetPoint("BOTTOMRIGHT", 3, -3)
                f.warnBorder:SetColorTexture(0.9, 0.1, 0.1, 0.9)
                f.warnText = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                f.warnText:SetPoint("BOTTOM", f, "TOP", 0, 4)
                f.warnText:SetTextColor(1, 0.25, 0.25)
                f.warnText:SetText(alert.text)
                ns.ApplyLayout(alert.key)
            end
        end
        ns.myAlerts = myAlerts
        ns.myWeapon = myWeapon
        ns.myWarn = myWarn
        Resolve()
        RefreshSelfFromAuras()
        inCombat = (InCombatLockdown and InCombatLockdown()) or false
        SafeRegister("PLAYER_REGEN_DISABLED")
        SafeRegister("PLAYER_REGEN_ENABLED")
        SafeRegister("PLAYER_DEAD")
        SafeRegister("SPELLS_CHANGED")
        SafeRegister("PLAYER_LEVEL_UP")
        SafeRegister("GROUP_ROSTER_UPDATE")
        SafeRegister("UNIT_AURA")
        pcall(driver.RegisterUnitEvent, driver, "UNIT_COMBAT", "player", "target")
        SafeRegister("UNIT_SPELLCAST_SUCCEEDED", "player")
        driver:SetScript("OnUpdate", OnUpdate)
        if ns.InitParty then ns.InitParty() end
        if ns.CreateOptions then ns.CreateOptions() end

    elseif event == "PLAYER_REGEN_DISABLED" then
        RefreshSelfFromAuras()   -- last guaranteed reading before the lockdown
        inCombat = true
        ns.Update()
        if ns.UpdateParty then ns.UpdateParty() end

    elseif event == "PLAYER_REGEN_ENABLED" then
        inCombat = false
        selfDirty = true
        ns.Update()
        if ns.UpdateParty then ns.UpdateParty() end

    elseif event == "PLAYER_DEAD" then
        for k in pairs(trackers) do trackers[k] = {} end

    elseif event == "SPELLS_CHANGED" or event == "PLAYER_LEVEL_UP" then
        if not inCombat then Resolve() end

    elseif event == "GROUP_ROSTER_UPDATE" then
        if ns.UpdateParty then ns.UpdateParty() end

    elseif event == "UNIT_COMBAT" then
        -- args: unit, action, flag, amount, schoolMask (1 = physical)
        if arg1 == "player" and inCombat and arg2 == "WOUND" and not IsSecret(arg5) and (arg5 == nil or arg5 == 1) then
            OnPhysicalHitTaken()
        end
        -- Dodges, parries and blocks start the countdown of reactive abilities
        if not IsSecret(arg2) and not IsSecret(arg1) then
            for _, alert in ipairs(myUsable) do
                local t = alert.trigger and alert.trigger[arg1]
                if t and t[arg2] then usableSince[alert.key] = GetTime() end
            end
        end

    elseif event == "UNIT_AURA" then
        if arg1 == "player" then
            selfDirty = true
        elseif ns.MarkPartyDirty then
            ns.MarkPartyDirty()
        end

    elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
        OnPlayerCast(arg3)
    end
end)

------------------------------------------------------------
-- Commands
------------------------------------------------------------
SLASH_BUFFALERTSFOREVER1 = "/balert"
SLASH_BUFFALERTSFOREVER2 = "/buffalerts"
SlashCmdList.BUFFALERTSFOREVER = function(msg)
    msg = (msg or ""):lower()
    if msg == "debug" then
        Print("Class: " .. tostring(playerClass) .. " | Detected spec: " .. tostring(spec))
        Print("Auras locked now: " .. tostring(AurasLocked()) .. " | In combat: " .. tostring(inCombat))
        local bad = {}
        for id, ok in pairs(validId) do
            if not ok and SpellName(id) then bad[#bad + 1] = id .. "=" .. SpellName(id) end
        end
        if #bad > 0 then Print("Discarded IDs (different spell on this client): " .. table.concat(bad, ", ")) end
        for _, alert in ipairs(myAlerts) do
            local rec = recommended[alert.key]
            local active = {}
            for _, e in ipairs(trackers[alert.key] or {}) do
                active[#active + 1] = tostring(e.sid) .. string.format("(%.0fs)", e.expires - GetTime())
            end
            Print(alert.label .. ": recommended " .. (rec and (tostring(rec.id) .. " " .. ns.FamilyName(rec.family)) or "none")
                .. " | active: " .. (#active > 0 and table.concat(active, ", ") or "none"))
            local up = upgrades[alert.key]
            if up then
                Print("  To train: " .. tostring(up) .. " " .. tostring(SpellName(up)) .. " (level " .. tostring(ns.LEVELS[up]) .. ")")
            end
        end
        for _, alert in ipairs(myUsable) do
            local id = usableIds[alert.key]
            local state = "not learned"
            if id and C_Spell and C_Spell.IsSpellUsable then
                local ok, u = SafeCall(C_Spell.IsSpellUsable, id)
                state = not ok and "error" or IsSecret(u) and "secret value" or tostring(u)
            end
            Print(alert.label .. ": ID " .. tostring(id) .. " | usable: " .. state)
        end
        for _, alert in ipairs(myPet) do
            local ok, exists = SafeCall(UnitExists, "pet")
            Print("Pet out: " .. (not ok and "error" or IsSecret(exists) and "secret value" or tostring(exists)))
        end
        if #myWeapon > 0 then
            local readable = ReadWeaponEnchants()
            local function slotInfo(slot)
                if not HasWeapon(slot) then return "no weapon" end
                if not weaponExp[slot] then return "no enchant" end
                return weaponExp[slot] == math.huge and "enchanted" or string.format("enchanted (%.0fs)", weaponExp[slot] - GetTime())
            end
            if GetWeaponEnchantInfo then
                local okR, a, b, c, d, e, g = pcall(GetWeaponEnchantInfo)
                local function v(x) return IsSecret(x) and "secret" or tostring(x) end
                Print("GetWeaponEnchantInfo: " .. (okR and (v(a) .. ", " .. v(b) .. ", " .. v(c) .. ", " .. v(d) .. ", " .. v(e) .. ", " .. v(g)) or ("error: " .. tostring(a))))
            else
                Print("GetWeaponEnchantInfo: not available")
            end
            Print("Tooltip temp enchant: main hand " .. tostring(TooltipHasTempEnchant(16)) .. " | off hand " .. tostring(TooltipHasTempEnchant(17)))
            Print("Weapons: main hand " .. slotInfo(16) .. " | off hand " .. slotInfo(17)
                .. (readable and "" or " | (last known values, game is hiding data)"))
        end
        if ns.DebugParty then ns.DebugParty() end
    elseif msg == "buffs" then
        -- Lists your current buffs with their IDs and how the addon classifies them
        local list = ns.ScanAuras("player")
        if not list then Print("Buffs cannot be read right now (in combat)."); return end
        Print("Your buffs:")
        for _, a in ipairs(list) do
            local fk = FamilyOf(a.sid, a.name)
            Print("  " .. tostring(a.name) .. " (ID " .. tostring(a.sid) .. ")" .. (fk and (" -> " .. fk) or ""))
        end
    elseif msg == "toggle" then
        db.hideAll = not db.hideAll
        ns.Update()
        if ns.UpdateParty then ns.UpdateParty() end
        if ns.RefreshOptions then ns.RefreshOptions() end
        Print(db.hideAll and "All alerts hidden." or "Alerts shown.")
    elseif msg == "reset" then
        ns.ResetDefaults()
        if ns.RefreshOptions then ns.RefreshOptions() end
        Print("Settings restored.")
    else
        if ns.ToggleOptions then ns.ToggleOptions() end
    end
end
