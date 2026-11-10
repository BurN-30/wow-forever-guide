-- BuffAlerts Forever - Party frame indicators
local ADDON, ns = ...

local myParty = {}      -- party alerts for the current class
local indicators = {}   -- [key][i] = frame
local dirty = true

function ns.MarkPartyDirty() dirty = true end

local function SafeBool(fn, ...)
    local ok, v = pcall(fn, ...)
    return ok and not ns.IsSecret(v) and v and true or false
end

-- Find the visible frame for the group member (default or raid-style party frames)
local function FindPartyFrame(i, unit)
    local candidates = {}
    if PartyFrame and PartyFrame["MemberFrame" .. i] then candidates[#candidates + 1] = PartyFrame["MemberFrame" .. i] end
    if _G["PartyMemberFrame" .. i] then candidates[#candidates + 1] = _G["PartyMemberFrame" .. i] end
    for j = 1, 5 do
        local f = _G["CompactPartyFrameMember" .. j]
        if f then
            local fu = f.displayedUnit or f.unit
            if fu and not ns.IsSecret(fu) and SafeBool(UnitIsUnit, fu, unit) then
                candidates[#candidates + 1] = f
            end
        end
    end
    for _, f in ipairs(candidates) do
        if SafeBool(f.IsVisible, f) then return f end
    end
end

local function GetIndicator(key, i)
    indicators[key] = indicators[key] or {}
    local f = indicators[key][i]
    if not f then
        f = CreateFrame("Frame", nil, UIParent)
        f:SetFrameStrata("MEDIUM")
        f.icon = f:CreateTexture(nil, "ARTWORK")
        f.icon:SetAllPoints()
        f.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
        f:Hide()
        indicators[key][i] = f
    end
    return f
end

local function HideAll(key)
    for _, f in pairs(indicators[key] or {}) do f:Hide() end
end

-- true = buff missing; false = has the buff or it cannot be known right now
local function MemberMissing(alert, unit)
    if not SafeBool(UnitIsConnected, unit) or SafeBool(UnitIsDeadOrGhost, unit) then return false end
    if not SafeBool(UnitIsVisible, unit) then return false end
    if alert.manaOnly then
        local ok, _, class = pcall(UnitClass, unit)
        if not ok or ns.IsSecret(class) or not ns.MANA_CLASSES[class] then return false end
    end
    local list = ns.ScanAuras(unit)
    if not list then return false end
    for _, a in ipairs(list) do
        local fk = ns.FamilyOf(a.sid, a.name)
        if fk then
            for _, want in ipairs(alert.families) do
                if fk == want then return false end
            end
        end
    end
    return true
end

function ns.UpdateParty()
    if not ns.db then return end
    for index, alert in ipairs(myParty) do
        local cfg = ns.db[alert.key]
        -- Only check buffs the player can actually cast (e.g. Divine Spirit needs the talent)
        local active = cfg.enabled and not ns.db.hideAll and ns.HasRecommendation(alert.iconFrom) and not ns.IsInCombat()
            and SafeBool(IsInGroup) and not SafeBool(IsInRaid)
        if not active and not ns.unlocked then
            HideAll(alert.key)
        else
            local tex = ns.GetRecommendedIcon(alert.iconFrom)
                or ns.SpellIcon(ns.FAMILIES[alert.families[1]].ids[#ns.FAMILIES[alert.families[1]].ids])
            for i = 1, 4 do
                local unit = "party" .. i
                local ind = GetIndicator(alert.key, i)
                local show = false
                local pf
                if SafeBool(UnitExists, unit) then
                    pf = FindPartyFrame(i, unit)
                    if pf then
                        show = ns.unlocked or (active and MemberMissing(alert, unit))
                    end
                end
                if show then
                    ind:SetSize(cfg.size, cfg.size)
                    -- Same layer as the party frame itself, so windows like the map cover it
                    pcall(function()
                        ind:SetFrameStrata(pf:GetFrameStrata() or "MEDIUM")
                        ind:SetFrameLevel((pf:GetFrameLevel() or 1) + 2)
                    end)
                    ind:ClearAllPoints()
                    -- Each of the class's party buffs gets its own slot beside the frame (right by default, left if chosen)
                    local offset = 2 + (index - 1) * (cfg.size + 2)
                    if cfg.side == "left" then
                        ind:SetPoint("RIGHT", pf, "LEFT", -offset, 0)
                    else
                        ind:SetPoint("LEFT", pf, "RIGHT", offset, 0)
                    end
                    ind.icon:SetTexture(tex or 134400)
                    ind:Show()
                else
                    ind:Hide()
                end
            end
        end
    end
    dirty = false
end

function ns.InitParty()
    local class = ns.PlayerClass()
    for _, alert in ipairs(ns.PARTY_ALERTS) do
        if alert.class == class then myParty[#myParty + 1] = alert end
    end
    ns.myParty = myParty
    -- fast refresh when a group member's buff changes
    local f = CreateFrame("Frame")
    local acc = 0
    f:SetScript("OnUpdate", function(_, elapsed)
        acc = acc + elapsed
        if acc < 0.25 then return end
        acc = 0
        if dirty then ns.UpdateParty() end
    end)
end

function ns.DebugParty()
    if #myParty == 0 then return end
    ns.Print("In group: " .. tostring(SafeBool(IsInGroup)) .. " | In raid: " .. tostring(SafeBool(IsInRaid)))
    for i = 1, 4 do
        local unit = "party" .. i
        if SafeBool(UnitExists, unit) then
            local pf = FindPartyFrame(i, unit)
            local name = pf and (pf.GetName and pf:GetName()) or "?"
            ns.Print(unit .. ": frame " .. (pf and tostring(name) or "not found"))
        end
    end
end
