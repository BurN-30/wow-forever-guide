-- BuffAlerts Forever: patches of the wow-forever-guide pack (BurN-30, https://github.com/BurN-30/wow-forever-guide).
-- MIT, like the rest of the addon. The release files are left untouched; this file is listed last in
-- BuffAlertsForever.toc, so it runs after Data.lua, Core.lua, Party.lua and Options.lua but before
-- ADDON_LOADED and PLAYER_LOGIN. Reasons and in-game checks: docs/buffalerts-correctifs.md
local ADDON, ns = ...

------------------------------------------------------------
-- [pack patch #1] Food and campfire buffs in the client's language
-- Data.lua matches them by English name only (wellFed, campfire: no spell ID), so on a French
-- client "Bien nourri" and "Avantages du camp" are never recognized and both alerts stay up.
-- Each English name of those lists gets its twin in the client's language, read from a spell
-- that has exactly that English name on build 1.60.1.70862 (wago.tools, SpellName enUS/frFR).
------------------------------------------------------------
local NAME_SOURCES = {
    wellFed  = { 19705, 1283082 },               -- "Well Fed" (frFR "Bien nourri", "Personnage bien nourri")
    campfire = { 1229741, 7353, 18191, 18193 },  -- "Camp Benefits", "Cozy Fire", "Increased Stamina", "Increased Spirit"
}

local function AddLocalizedNames()
    local getName = C_Spell and C_Spell.GetSpellName
    if not (getName and ns.FAMILIES) then return end
    for fk, ids in pairs(NAME_SOURCES) do
        local fam = ns.FAMILIES[fk]
        if fam then
            fam.names = fam.names or {}
            for _, id in ipairs(ids) do
                local ok, name = pcall(getName, id)
                if ok and name and not (ns.IsSecret and ns.IsSecret(name)) and type(name) == "string" and name ~= "" then
                    local known = false
                    for _, n in ipairs(fam.names) do
                        if n == name then known = true; break end
                    end
                    if not known then fam.names[#fam.names + 1] = name end
                end
            end
        end
    end
end

AddLocalizedNames()
-- Again at login, in case spell names were not ready yet (Core rebuilds its name table every 5 s out of combat)
local loginFrame = CreateFrame("Frame")
loginFrame:RegisterEvent("PLAYER_LOGIN")
loginFrame:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")
    AddLocalizedNames()
end)

------------------------------------------------------------
-- [pack patch #2] Battle Shout alert plays a sound by default
-- The option exists ("Play sound", off for every alert), but this client does not load the addon's
-- settings back at login, so only defaults last. A saved choice still wins (CopyDefaults fills nil only).
------------------------------------------------------------
if ns.DEFAULTS and ns.DEFAULTS.battleShout then
    ns.DEFAULTS.battleShout.sound = true
end

------------------------------------------------------------
-- [pack patch #3] Options window keys in combat
-- Options.lua calls SetPropagateKeyboardInput on every key press; the client refuses that call in
-- combat (blocked action). Same handler, with the call made out of combat only.
------------------------------------------------------------
local CreateOptions = ns.CreateOptions
if CreateOptions then
    ns.CreateOptions = function(...)
        CreateOptions(...)
        local panel = _G.BuffAlertsForeverOptions
        if panel and panel.SetPropagateKeyboardInput then
            panel:SetScript("OnKeyDown", function(self, key)
                local fight = InCombatLockdown and InCombatLockdown()
                if key == "ESCAPE" then
                    if not fight then self:SetPropagateKeyboardInput(false) end
                    self:Hide()
                elseif not fight then
                    self:SetPropagateKeyboardInput(true)
                end
            end)
        end
    end
end

------------------------------------------------------------
-- [pack patch #4] Large alerts under the player's buffs, medium size
-- The release centres them on the screen (64 px, y = +80 to +150). The pack puts them in a row
-- under the game's buff frame, right-aligned, left of Polestar's guide window, at 40 px (62 %).
-- Anchor "PACK_BUFFS": the icon's TOPRIGHT at BuffFrame's BOTTOMRIGHT + (x, y), so the row follows
-- the buffs when Edit Mode moves them. BuffFrame always has the size of its full grid (32 buffs,
-- 11 per row: 3 rows), so the row stays clear of it whatever the number of buffs. Default Edit Mode
-- layout, from the screen's top-right corner: buffs x -255 to -655, y -10 to -145; debuffs
-- x -270 to -550, y -155 to -245; Polestar's guide window from x -64 to -404, from y -240 down.
-- Row 1 here: x -410 to -582, y -260 to -300; row 2 (hunter, unused Victory Rush) 44 px lower.
-- Defaults only: dragging an icon ("Move icons") or a saved position still wins.
------------------------------------------------------------
local PACK_ANCHOR = "PACK_BUFFS"
local LAYOUT_VERSION = 1
local SIZE = 40
local SLOT_X = { [0] = -287, -243, -199, -155 }  -- right edge of each slot, from BuffFrame's right edge
local ROW_Y = { -115, -159 }                       -- top edge of each row, from BuffFrame's bottom edge
local BUFFS_RIGHT, BUFFS_BOTTOM = -255, -145      -- BuffFrame's default corner, if the frame is missing

-- alert key = { slot (0 = left), row }; same left-to-right order as the release
local LAYOUT = {
    battleShout = { 0, 1 }, overpower = { 1, 1 }, revenge = { 2, 1 }, execute = { 3, 1 }, victoryRush = { 3, 2 },
    roguePoison = { 2, 1 }, riposte = { 3, 1 },
    hunterAspect = { 0, 1 }, trueshotAura = { 1, 1 }, hunterPet = { 2, 1 }, hunterPack = { 3, 1 }, hunterCheetah = { 3, 1 },
    mongooseBite = { 1, 2 }, counterattack = { 2, 2 },
    innerFire = { 0, 1 }, priestFortitude = { 1, 1 }, divineSpirit = { 2, 1 }, shadowProtection = { 3, 1 },
    mageArmor = { 2, 1 }, mageIntellect = { 3, 1 },
    warlockArmor = { 2, 1 }, warlockPet = { 3, 1 },
    paladinBlessing = { 0, 1 }, paladinAura = { 1, 1 }, righteousFury = { 2, 1 }, paladinSeal = { 3, 1 },
    druidMark = { 1, 1 }, omenOfClarity = { 2, 1 }, thorns = { 3, 1 },
    lightningShield = { 2, 1 }, shamanWeapon = { 3, 1 },
}

local RELEASE = {}  -- the release's default place of each moved alert
if ns.DEFAULTS then
    for key, pos in pairs(LAYOUT) do
        local def = ns.DEFAULTS[key]
        if type(def) == "table" then
            RELEASE[key] = { x = def.x, y = def.y, size = def.size }
            def.anchor, def.size, def.x, def.y = PACK_ANCHOR, SIZE, SLOT_X[pos[1]], ROW_Y[pos[2]]
        end
    end
end

-- A settings file saved before this layout (if the client ever loads one back) gets PACK_ANCHOR
-- filled in by CopyDefaults next to its old centre-based x and y. Release defaults left untouched
-- take the pack's place; a place the player chose keeps its centre anchor.
local checked = false
local function KeepSavedPlaces(db)
    checked = true
    if db.packLayout == LAYOUT_VERSION then return end
    for key, rel in pairs(RELEASE) do
        local cfg, def = db[key], ns.DEFAULTS[key]
        if type(cfg) == "table" and cfg.anchor == PACK_ANCHOR
                and not (cfg.x == def.x and cfg.y == def.y and cfg.size == def.size) then
            if cfg.x == rel.x and cfg.y == rel.y and cfg.size == rel.size then
                cfg.x, cfg.y, cfg.size = def.x, def.y, def.size
            else
                cfg.anchor = "CENTER"
            end
        end
    end
    db.packLayout = LAYOUT_VERSION
end

local ApplyLayout = ns.ApplyLayout
if ApplyLayout then
    ns.ApplyLayout = function(key, ...)
        local db = ns.db
        if db and not checked then KeepSavedPlaces(db) end
        ApplyLayout(key, ...)  -- size, countdown font, "Train" badge
        local f, cfg = _G["BuffAlertsForever_" .. tostring(key)], db and db[key]
        if not (f and type(cfg) == "table") then return end
        if not f.packDragHooked then
            -- A dragged icon is saved from the screen centre (Core SaveFramePosition): switch it to
            -- the centre anchor first, as in the release.
            f.packDragHooked = true
            local onDragStop = f:GetScript("OnDragStop")
            f:SetScript("OnDragStop", function(self, ...)
                local c = ns.db and ns.db[key]
                if type(c) == "table" and c.anchor == PACK_ANCHOR then c.anchor = "CENTER" end
                if onDragStop then return onDragStop(self, ...) end
            end)
        end
        if cfg.anchor ~= PACK_ANCHOR then return end
        f:ClearAllPoints()
        local buffs = _G.BuffFrame
        if type(buffs) == "table" and buffs.GetObjectType then
            f:SetPoint("TOPRIGHT", buffs, "BOTTOMRIGHT", cfg.x, cfg.y)
        else
            f:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", BUFFS_RIGHT + cfg.x, BUFFS_BOTTOM + cfg.y)
        end
    end
end

------------------------------------------------------------
-- [pack patch #5] "Reset to defaults" stopped halfway
-- ns.ResetDefaults (Core.lua) runs pairs() on every entry of ns.DEFAULTS, and hideAll is a boolean:
-- Lua error "table expected, got boolean" as soon as it is reached, so the rest of the reset,
-- Resolve() and the refresh never run. Plain values are reset here and left out of the call.
------------------------------------------------------------
local ResetDefaults = ns.ResetDefaults
if ResetDefaults and ns.DEFAULTS then
    ns.ResetDefaults = function(...)
        local plain = {}
        for k, v in pairs(ns.DEFAULTS) do
            if type(v) ~= "table" then plain[k] = v end
        end
        for k, v in pairs(plain) do
            if ns.db then ns.db[k] = v end
            ns.DEFAULTS[k] = nil
        end
        local ok, err = pcall(ResetDefaults, ...)
        for k, v in pairs(plain) do ns.DEFAULTS[k] = v end
        if not ok then error(err, 0) end
    end
end
