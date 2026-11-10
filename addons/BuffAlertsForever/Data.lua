-- BuffAlerts Forever - Spell data
-- ids: from highest to lowest rank. extra: "Greater"/"Brilliance" versions, which also count as an active buff.
local ADDON, ns = ...

ns.FAMILIES = {
    battleShout     = { label = "Battle Shout",     duration = 180,  ids = { 2048, 25289, 11551, 11550, 11549, 6192, 5242, 6673 } },

    -- charges: buffs consumed by physical hits taken. The addon counts hits in combat, where auras cannot be read.
    lightningShield = { label = "Lightning Shield", duration = 600, charges = 3,  ids = { 25472, 25469, 10432, 10431, 8134, 945, 905, 325, 324 } },

    innerFire       = { label = "Inner Fire", duration = 600, charges = 20, ids = { 25431, 10952, 10951, 1006, 602, 7128, 588 } },
    fortitude       = { label = "Power Word: Fortitude", duration = 1800, ids = { 25389, 10938, 10937, 2791, 1245, 1244, 1243 }, extra = { 25392, 21564, 21562 } },

    -- Hunter aspects (no duration: active until switched)
    hawk    = { label = "Aspect of the Hawk",    duration = math.huge, ids = { 27044, 25296, 14322, 14321, 14320, 14319, 14318, 13165 } },
    monkey  = { label = "Aspect of the Monkey",  duration = math.huge, ids = { 13163 } },
    cheetah = { label = "Aspect of the Cheetah", duration = math.huge, ids = { 5118 } },
    beast   = { label = "Aspect of the Beast",   duration = math.huge, ids = { 13161 } },
    pack    = { label = "Aspect of the Pack",    duration = math.huge, ids = { 13159 } },
    wild    = { label = "Aspect of the Wild",    duration = math.huge, ids = { 27045, 20190, 20043 } },
    viper   = { label = "Aspect of the Viper",   duration = math.huge, ids = { 34074 } },

    divineSpirit     = { label = "Divine Spirit", duration = 1800, talent = true, ids = { 25312, 27841, 14819, 14818, 14752 }, extra = { 32999, 27681 } },
    shadowProtection = { label = "Shadow Protection", duration = 600, ids = { 25433, 10958, 10957, 976 }, extra = { 39374, 27683 } },
    trueshot         = { label = "Trueshot Aura", duration = 1800, talent = true, ids = { 27066, 20906, 20905, 19506 } },
    thorns           = { label = "Thorns", duration = 600, ids = { 26992, 9910, 9756, 8914, 1075, 782, 467 } },
    omen             = { label = "Omen of Clarity", duration = 600, talent = true, ids = { 16864 } },
    righteousFury    = { label = "Righteous Fury", duration = 1800, ids = { 25780 } },

    -- Paladin seals (30 s, consumed by Judgement)
    sealRighteousness = { label = "Seal of Righteousness", duration = 30, ids = { 27155, 20293, 20292, 20291, 20290, 20289, 20288, 20287, 21084 } },
    sealCrusader      = { label = "Seal of the Crusader",  duration = 30, ids = { 27158, 20308, 20307, 20306, 20305, 20162, 21082 } },
    sealJustice       = { label = "Seal of Justice",       duration = 30, ids = { 31895, 20164 } },
    sealLight         = { label = "Seal of Light",         duration = 30, ids = { 27160, 20349, 20348, 20347, 20165 } },
    sealWisdom        = { label = "Seal of Wisdom",        duration = 30, ids = { 27166, 20357, 20356, 20166 } },
    sealCommand       = { label = "Seal of Command",       duration = 30, talent = true, ids = { 27170, 20920, 20919, 20918, 20915, 20375 } },
    sealFury          = { label = "Seal of Fury",          duration = 30, ids = {}, names = { "Seal of Fury" } },  -- Forever tanking seal: ID unknown, matched by name

    -- Paladin auras (no duration: active until switched)
    devotion         = { label = "Devotion Aura",             duration = math.huge, ids = { 27149, 10293, 10292, 1032, 10291, 643, 10290, 465 } },
    retributionAura  = { label = "Retribution Aura",          duration = math.huge, ids = { 27150, 10301, 10300, 10299, 10298, 7294 } },
    concentration    = { label = "Concentration Aura",        duration = math.huge, ids = { 19746 } },
    sanctity         = { label = "Sanctity Aura",             duration = math.huge, talent = true, ids = { 20218 } },
    shadowResAura    = { label = "Shadow Resistance Aura",    duration = math.huge, ids = { 27151, 19896, 19895, 19876 } },
    frostResAura     = { label = "Frost Resistance Aura",     duration = math.huge, ids = { 27152, 19898, 19897, 19888 } },
    fireResAura      = { label = "Fire Resistance Aura",      duration = math.huge, ids = { 27153, 19900, 19899, 19891 } },
    crusaderAura     = { label = "Crusader Aura",             duration = math.huge, ids = { 32223 } },

    -- Reactive abilities (usable only after a dodge/parry/block, or below 20% health for Execute)
    overpower        = { label = "Overpower",     duration = 0, ids = { 11585, 11584, 7887, 7384 } },
    revenge          = { label = "Revenge",       duration = 0, ids = { 30357, 25269, 25288, 11601, 11600, 7379, 6574, 6572 } },
    execute          = { label = "Execute",       duration = 0, ids = { 25236, 25234, 20662, 20661, 20660, 20658, 5308 } },
    victoryRush      = { label = "Victory Rush",  duration = 0, ids = { 34428 } },
    riposte          = { label = "Riposte",       duration = 0, ids = { 14251 } },
    counterattack    = { label = "Counterattack", duration = 0, ids = { 27067, 20910, 20909, 19306 } },
    mongooseBite     = { label = "Mongoose Bite", duration = 0, ids = { 36916, 14271, 14270, 14269, 1495 } },

    -- Pet summons (only used to know the class can have a pet, and for the icon)
    summonImp        = { label = "Summon Imp", duration = 0, ids = { 688 } },
    callPet          = { label = "Call Pet",   duration = 0, ids = { 883 } },

    -- Consumable buffs (not class spells: matched by aura name, plus a few known IDs)
    wellFed  = { label = "Well Fed", duration = 900, ids = {},
                 names = { "Well Fed" } },
    -- patterns: any buff whose name contains one of these also counts (the Forever campfire buff name is not confirmed)
    campfire = { label = "Camp Benefits", duration = 900, ids = {},
                 names = { "Camp Benefits", "Cozy Fire", "Warm Fire", "Increased Stamina", "Increased Spirit" },
                 patterns = { "Camp Benefit", "Cozy", "Campfire", "Camp Fire", "Warm" } },

    -- Shaman weapon imbues (not auras: only used to know the skill exists, for the icon and for casts)
    rockbiter       = { label = "Rockbiter Weapon",   duration = 300, ids = { 25485, 25479, 16316, 16315, 16314, 10399, 8019, 8018, 8017 } },
    flametongue     = { label = "Flametongue Weapon", duration = 300, ids = { 25489, 16342, 16341, 16339, 8030, 8027, 8024 } },
    frostbrand      = { label = "Frostbrand Weapon",  duration = 300, ids = { 25500, 16356, 16355, 10456, 8038, 8033 } },
    windfury        = { label = "Windfury Weapon",    duration = 300, ids = { 25505, 16362, 10486, 8235, 8232 } },

    felArmor        = { label = "Fel Armor",        duration = 1800, ids = { 28189, 28176 } },
    demonArmor      = { label = "Demon Armor",      duration = 1800, ids = { 27260, 11735, 11734, 11733, 1086, 706 } },
    demonSkin       = { label = "Demon Skin",       duration = 1800, ids = { 696, 687 } },

    moltenArmor     = { label = "Molten Armor",     duration = 1800, ids = { 30482 } },
    mageArmor       = { label = "Mage Armor",       duration = 1800, ids = { 27125, 22783, 22782, 6117 } },
    iceArmor        = { label = "Ice Armor",        duration = 1800, ids = { 27124, 10220, 10219, 7320, 7302 } },
    frostArmor      = { label = "Frost Armor",      duration = 1800, ids = { 7301, 7300, 168 } },
    markOfTheWild   = { label = "Mark of the Wild", duration = 1800, ids = { 26990, 9885, 9884, 8907, 5234, 6756, 5232, 1126 }, extra = { 26991, 21850, 21849 } },
    arcaneIntellect = { label = "Arcane Intellect", duration = 1800, ids = { 27126, 10157, 10156, 1461, 1460, 1459 }, extra = { 27127, 23028 } },

    might     = { label = "Blessing of Might",       duration = 300, ids = { 27140, 25291, 19838, 19837, 19836, 19835, 19834, 19740 }, extra = { 27141, 25916, 25782 } },
    wisdom    = { label = "Blessing of Wisdom",      duration = 300, ids = { 27142, 25290, 19854, 19853, 19852, 19850, 19742 },        extra = { 27143, 25918, 25894 } },
    kings     = { label = "Blessing of Kings",       duration = 300, talent = true, ids = { 20217 },                                                   extra = { 25898 } },
    sanctuary = { label = "Blessing of Sanctuary",   duration = 300, talent = true, ids = { 27168, 20914, 20913, 20912, 20911 },                       extra = { 27169, 25899 } },
    light     = { label = "Blessing of Light",       duration = 300, ids = { 27144, 19979, 19978, 19977 },                              extra = { 27145, 25890 } },
    salvation = { label = "Blessing of Salvation",   duration = 300, ids = { 1038 },                                                    extra = { 25895 } },
}

-- Level at which each rank becomes available at the trainer (Classic data).
-- Used to flag when a better version can be trained. Talent spells are not listed here.
ns.LEVELS = {
    -- Battle Shout
    [6673] = 1, [5242] = 12, [6192] = 22, [11549] = 32, [11550] = 42, [11551] = 52, [25289] = 60, [2048] = 69,
    -- Warlock
    [687] = 1, [696] = 10,
    [706] = 20, [1086] = 30, [11733] = 40, [11734] = 50, [11735] = 60, [27260] = 70,
    [28176] = 62, [28189] = 69,
    -- Mage
    [168] = 1, [7300] = 10, [7301] = 20,
    [7302] = 30, [7320] = 40, [10219] = 50, [10220] = 60, [27124] = 69,
    [6117] = 34, [22782] = 46, [22783] = 58, [27125] = 71,
    [30482] = 62,
    [1459] = 1, [1460] = 14, [1461] = 28, [10156] = 42, [10157] = 56, [27126] = 70,
    -- Paladin
    [19740] = 4, [19834] = 12, [19835] = 22, [19836] = 32, [19837] = 42, [19838] = 52, [25291] = 60, [27140] = 70,
    [19742] = 14, [19850] = 24, [19852] = 34, [19853] = 44, [19854] = 54, [25290] = 60, [27142] = 65,
    [20912] = 40, [20913] = 50, [20914] = 60, [27168] = 70,
    [19977] = 40, [19978] = 50, [19979] = 60, [27144] = 69,
    [1038] = 26,
    -- Lightning Shield
    [324] = 8, [325] = 16, [905] = 24, [945] = 32, [8134] = 40, [10431] = 48, [10432] = 56, [25469] = 63, [25472] = 70,
    -- Priest
    [588] = 12, [7128] = 20, [602] = 30, [1006] = 40, [10951] = 50, [10952] = 60, [25431] = 69,
    [1243] = 1, [1244] = 12, [1245] = 24, [2791] = 36, [10937] = 48, [10938] = 60, [25389] = 70,
    -- Hunter
    [13163] = 4, [13165] = 10, [14318] = 18, [14319] = 28, [14320] = 38, [14321] = 48, [14322] = 58, [25296] = 60, [27044] = 68,
    [5118] = 20, [13161] = 30, [13159] = 40, [20043] = 46, [20190] = 56, [27045] = 68, [34074] = 64,
    [14752] = 30, [14818] = 40, [14819] = 50, [27841] = 60, [25312] = 70,
    [976] = 30, [10957] = 42, [10958] = 56, [25433] = 68,
    [25780] = 16,
    -- Paladin seals
    [21084] = 1, [20287] = 10, [20288] = 18, [20289] = 26, [20290] = 34, [20291] = 42, [20292] = 50, [20293] = 58, [27155] = 66,
    [21082] = 6, [20162] = 16, [20305] = 26, [20306] = 36, [20307] = 46, [20308] = 56, [27158] = 65,
    [20164] = 22, [31895] = 62,
    [20165] = 30, [20347] = 40, [20348] = 50, [20349] = 60, [27160] = 70,
    [20166] = 38, [20356] = 48, [20357] = 58, [27166] = 68,
    [20915] = 30, [20918] = 40, [20919] = 50, [20920] = 60, [27170] = 70,
    -- Paladin auras
    [465] = 1, [10290] = 10, [643] = 20, [10291] = 30, [1032] = 40, [10292] = 50, [10293] = 60, [27149] = 70,
    [7294] = 16, [10298] = 26, [10299] = 36, [10300] = 46, [10301] = 56, [27150] = 66,
    [19746] = 22,
    [19876] = 28, [19895] = 40, [19896] = 52, [27151] = 64,
    [19888] = 32, [19897] = 44, [19898] = 56, [27152] = 65,
    [19891] = 36, [19899] = 48, [19900] = 60, [27153] = 66,
    [32223] = 62,
    -- Druid
    [467] = 6, [782] = 14, [1075] = 24, [8914] = 34, [9756] = 44, [9910] = 54, [26992] = 64,
    [1126] = 1, [5232] = 10, [6756] = 20, [5234] = 30, [8907] = 40, [9884] = 50, [9885] = 60, [26990] = 70,
}

local BLESSINGS = { "might", "wisdom", "kings", "sanctuary", "light", "salvation" }

-- Self-buff alerts
ns.SELF_ALERTS = {
    { key = "battleShout", class = "WARRIOR", label = "Battle Shout",
      families = { "battleShout" }, exclusive = true },

    { key = "lightningShield", class = "SHAMAN", label = "Lightning Shield",
      families = { "lightningShield" }, exclusive = true },

    { key = "innerFire", class = "PRIEST", label = "Inner Fire",
      families = { "innerFire" }, exclusive = true },

    { key = "priestFortitude", class = "PRIEST", label = "Power Word: Fortitude",
      families = { "fortitude" }, targeted = true },

    { key = "divineSpirit", class = "PRIEST", label = "Divine Spirit",
      families = { "divineSpirit" }, targeted = true },

    { key = "shadowProtection", class = "PRIEST", label = "Shadow Protection",
      families = { "shadowProtection" }, targeted = true },

    { key = "trueshotAura", class = "HUNTER", label = "Trueshot Aura",
      families = { "trueshot" }, exclusive = true },

    { key = "thorns", class = "DRUID", label = "Thorns",
      families = { "thorns" }, targeted = true },

    { key = "omenOfClarity", class = "DRUID", label = "Omen of Clarity",
      families = { "omen" }, exclusive = true },

    { key = "paladinAura", class = "PALADIN", label = "Aura",
      families = { "devotion", "retributionAura", "concentration", "sanctity", "shadowResAura", "frostResAura", "fireResAura", "crusaderAura" },
      choices = { "devotion", "retributionAura", "concentration", "sanctity", "crusaderAura" }, exclusive = true,
      specPriority = {
          holy        = { "concentration", "devotion" },
          protection  = { "devotion", "retributionAura" },
          retribution = { "sanctity", "retributionAura", "devotion" },
          none        = { "devotion" },
      } },

    -- Seals: any seal counts; Judgement consumes the active one (consumedBy)
    { key = "paladinSeal", class = "PALADIN", label = "Seal",
      families = { "sealRighteousness", "sealCrusader", "sealJustice", "sealLight", "sealWisdom", "sealCommand", "sealFury" },
      exclusive = true, consumedBy = { 20271 },
      -- The icon follows the active seal; the spec order only picks the icon when no seal is up
      specPriority = {
          retribution = { "sealCommand", "sealRighteousness" },
          protection  = { "sealFury", "sealRighteousness" },
          none        = { "sealRighteousness" },
      } },

    { key = "righteousFury", class = "PALADIN", label = "Righteous Fury",
      families = { "righteousFury" }, exclusive = true, specOnly = "protection" },

    -- Consumable reminders for every class (hidden in combat, where you cannot eat anyway)
    { key = "foodBuff", class = "ALL", label = "Food buff", noSpell = true, hideInCombat = true,
      families = { "wellFed" }, icon = "Interface\\Icons\\INV_Misc_Food_15" },
    { key = "campfireBuff", class = "ALL", label = "Campfire buff", noSpell = true, hideInCombat = true,
      families = { "campfire" }, icon = "Interface\\Icons\\Spell_Fire_Fire" },

    -- Any aspect counts; the icon recommends Hawk (or Monkey before level 10)
    { key = "hunterAspect", class = "HUNTER", label = "Aspect",
      families = { "hawk", "monkey", "cheetah", "beast", "pack", "wild", "viper" }, exclusive = true },

    { key = "warlockArmor", class = "WARLOCK", label = "Armor (Warlock)",
      families = { "felArmor", "demonArmor", "demonSkin" }, choices = { "felArmor", "demonArmor", "demonSkin" }, exclusive = true },

    { key = "mageArmor", class = "MAGE", label = "Armor (Mage)",
      families = { "moltenArmor", "mageArmor", "iceArmor", "frostArmor" },
      choices = { "moltenArmor", "mageArmor", "iceArmor", "frostArmor" }, exclusive = true,
      specPriority = {
          frost  = { "iceArmor", "frostArmor" },
          fire   = { "moltenArmor", "mageArmor", "iceArmor", "frostArmor" },
          arcane = { "mageArmor", "iceArmor", "frostArmor" },
          none   = { "mageArmor", "iceArmor", "frostArmor" },
      } },

    { key = "mageIntellect", class = "MAGE", label = "Arcane Intellect",
      families = { "arcaneIntellect" }, targeted = true },

    { key = "druidMark", class = "DRUID", label = "Mark of the Wild",
      families = { "markOfTheWild" }, targeted = true },

    { key = "paladinBlessing", class = "PALADIN", label = "Blessing",
      families = BLESSINGS, choices = BLESSINGS, targeted = true,
      specPriority = {
          holy        = { "wisdom", "might" },
          protection  = { "kings", "sanctuary", "might" },
          retribution = { "might" },
          none        = { "might", "wisdom" },
      } },
}

-- Wrong-buff-in-combat warnings (use another alert's tracking)
ns.WARN_ALERTS = {
    { key = "hunterPack", class = "HUNTER", label = "Aspect of the Pack", source = "hunterAspect", family = "pack",
      text = "Switch aspect" },
    { key = "hunterCheetah", class = "HUNTER", label = "Aspect of the Cheetah", source = "hunterAspect", family = "cheetah",
      text = "Switch aspect" },
}

-- Reactive abilities: shown while the spell is usable
ns.USABLE_ALERTS = {
    -- window: seconds the ability stays usable after it triggers (shown as a countdown on the alert)
    -- trigger: combat events that start the window, as { unit = { actions } } (used when the game hides the usable state)
    { key = "overpower",     class = "WARRIOR", label = "Overpower",     family = "overpower", window = 5,
      trigger = { target = { DODGE = true } } },
    { key = "revenge",       class = "WARRIOR", label = "Revenge",       family = "revenge", window = 5,
      trigger = { player = { DODGE = true, PARRY = true, BLOCK = true } } },
    { key = "execute",       class = "WARRIOR", label = "Execute",       family = "execute", showWithoutPower = true },
    { key = "victoryRush",   class = "WARRIOR", label = "Victory Rush",  family = "victoryRush", window = 20 },
    { key = "riposte",       class = "ROGUE",   label = "Riposte",       family = "riposte", window = 5,
      trigger = { player = { PARRY = true } } },
    { key = "counterattack", class = "HUNTER",  label = "Counterattack", family = "counterattack", window = 5,
      trigger = { player = { PARRY = true } } },
    { key = "mongooseBite",  class = "HUNTER",  label = "Mongoose Bite", family = "mongooseBite", window = 5,
      trigger = { player = { DODGE = true } } },
}

-- Missing pet (shown in and out of combat)
ns.PET_ALERTS = {
    { key = "warlockPet", class = "WARLOCK", label = "Missing Pet", family = "summonImp" },
    { key = "hunterPet",  class = "HUNTER",  label = "Missing Pet", family = "callPet" },
}

-- Alerts for weapons without a temporary enchant (any enchant/poison counts)
ns.WEAPON_ALERTS = {
    { key = "shamanWeapon", class = "SHAMAN", label = "Weapon Enchant", minLevel = 1,
      families = { "flametongue", "rockbiter", "windfury", "frostbrand" } },
    { key = "roguePoison", class = "ROGUE", label = "Poisons", minLevel = 20,
      icon = "Interface\\Icons\\Ability_Poisons" },
}

-- Utility alerts (small, top of the screen). check = function name in ns.UtilityChecks
ns.UTILITY_ALERTS = {
    { key = "soulShards",    class = "WARLOCK", label = "Soul Shards",   check = "soulShards",    icon = "Interface\\Icons\\INV_Misc_Gem_Amethyst_02",
      threshold = { label = "Alert below (shards)", min = 1, max = 20, step = 1 } },
    { key = "ammo",          class = "HUNTER",  label = "Ammo",          check = "ammo",          icon = "Interface\\Icons\\INV_Ammo_Arrow_02",
      threshold = { label = "Alert below (ammo)", min = 0, max = 1000, step = 20 } },
    { key = "petHappiness",  class = "HUNTER",  label = "Pet Happiness", check = "petHappiness",  icon = "Interface\\Icons\\Ability_Hunter_BeastTraining" },
    { key = "missingWeapon", class = "ALL",     label = "Missing Weapon",check = "missingWeapon", icon = "Interface\\Icons\\INV_Sword_04" },
    { key = "durability",    class = "ALL",     label = "Durability",    check = "durability",    icon = "Interface\\Icons\\Trade_BlackSmithing",
      threshold = { label = "Alert below (%)", min = 5, max = 90, step = 5 } },
}

-- Party frame indicators
ns.PARTY_ALERTS = {
    { key = "mageParty", class = "MAGE", label = "Arcane Intellect (party)",
      families = { "arcaneIntellect" }, iconFrom = "mageIntellect", manaOnly = true },
    { key = "druidParty", class = "DRUID", label = "Mark of the Wild (party)",
      families = { "markOfTheWild" }, iconFrom = "druidMark" },
    { key = "priestParty", class = "PRIEST", label = "Fortitude (party)",
      families = { "fortitude" }, iconFrom = "priestFortitude" },
    { key = "priestSpiritParty", class = "PRIEST", label = "Divine Spirit (party)",
      families = { "divineSpirit" }, iconFrom = "divineSpirit" },
    { key = "priestShadowParty", class = "PRIEST", label = "Shadow Protection (party)",
      families = { "shadowProtection" }, iconFrom = "shadowProtection" },
    { key = "paladinParty", class = "PALADIN", label = "Blessing (party)",
      families = BLESSINGS, iconFrom = "paladinBlessing" },
}

ns.MANA_CLASSES = { MAGE = true, PRIEST = true, WARLOCK = true, DRUID = true, SHAMAN = true, PALADIN = true, HUNTER = true }

-- Spec detection via signature talents (ties go to the first entry)
ns.SPEC_SIGNATURES = {
    MAGE = {
        { "arcane", { 12043, 12042 } },          -- Presence of Mind, Arcane Power
        { "fire",   { 11366, 11113, 11129 } },   -- Pyroblast, Blast Wave, Combustion
        { "frost",  { 12472, 11958, 11426 } },   -- Cold Snap, Ice Block, Ice Barrier
    },
    PALADIN = {
        { "holy",        { 20216, 20473 } },         -- Divine Favor, Holy Shock
        { "retribution", { 20066, 20375 } },         -- Repentance, Seal of Command
        { "protection",  { 20217, 20925, 20911 } },  -- Kings, Holy Shield, Sanctuary (listed last: Kings is often taken by other specs)
    },
}

-- Default positions: one row per class at y = 150; the Hunter reactive abilities sit on a second row (y = 80)
ns.DEFAULTS = {
    -- Global
    hideAll          = false,
    -- All classes (anchored to the top of the screen)
    foodBuff         = { enabled = true, size = 36, x = -22, y = -40, anchor = "TOP" },
    campfireBuff     = { enabled = true, size = 36, x =  22, y = -40, anchor = "TOP" },
    missingWeapon    = { enabled = true, size = 36, x = -66, y = -40, anchor = "TOP" },
    durability       = { enabled = true, size = 36, x =  66, y = -40, anchor = "TOP", threshold = 20 },
    soulShards       = { enabled = true, size = 36, x = 110, y = -40, anchor = "TOP", threshold = 5 },
    ammo             = { enabled = true, size = 36, x = 110, y = -40, anchor = "TOP", threshold = 200 },
    petHappiness     = { enabled = true, size = 36, x = 154, y = -40, anchor = "TOP" },
    -- Warrior
    battleShout      = { enabled = true, size = 64, x = -105, y = 150, strict = false, combatOnly = true, expiryWarn = 5 },
    overpower        = { enabled = true, size = 64, x =  -35, y = 150, combatOnly = false },
    revenge          = { enabled = true, size = 64, x =   35, y = 150, combatOnly = false },
    execute          = { enabled = true, size = 64, x =  105, y = 150, combatOnly = false },
    victoryRush      = { enabled = true, size = 64, x =  175, y = 150, combatOnly = false },
    -- Rogue
    roguePoison      = { enabled = true, size = 64, x =  -40, y = 150, combatOnly = false, expiryWarn = 0 },
    riposte          = { enabled = true, size = 64, x =   40, y = 150, combatOnly = false },
    -- Hunter
    hunterAspect     = { enabled = true, size = 64, x = -105, y = 150, strict = false, combatOnly = false, expiryWarn = 0 },
    trueshotAura     = { enabled = true, size = 64, x =  -35, y = 150, strict = false, combatOnly = true, expiryWarn = 0 },
    hunterPet        = { enabled = true, size = 64, x =   35, y = 150, combatOnly = false },
    hunterPack       = { enabled = true, size = 64, x =  105, y = 150 },
    hunterCheetah    = { enabled = true, size = 64, x =  105, y = 150 },
    mongooseBite     = { enabled = true, size = 64, x =  -35, y =  80, combatOnly = false },
    counterattack    = { enabled = true, size = 64, x =   35, y =  80, combatOnly = false },
    -- Priest
    innerFire        = { enabled = true, size = 64, x = -105, y = 150, strict = false, combatOnly = false, expiryWarn = 5 },
    priestFortitude  = { enabled = true, size = 64, x =  -35, y = 150, strict = false, combatOnly = false, expiryWarn = 0 },
    divineSpirit     = { enabled = true, size = 64, x =   35, y = 150, strict = false, combatOnly = false, expiryWarn = 0 },
    shadowProtection = { enabled = true, size = 64, x =  105, y = 150, strict = false, combatOnly = false, expiryWarn = 0 },
    priestParty       = { enabled = true, size = 20, side = "right" },
    priestSpiritParty = { enabled = true, size = 20, side = "right" },
    priestShadowParty = { enabled = true, size = 20, side = "right" },
    -- Mage
    mageArmor        = { enabled = true, size = 64, x =  -40, y = 150, strict = false, choice = "auto", combatOnly = false, expiryWarn = 0 },
    mageIntellect    = { enabled = true, size = 64, x =   40, y = 150, strict = false, combatOnly = false, expiryWarn = 0 },
    mageParty        = { enabled = true, size = 20, side = "right" },
    -- Warlock
    warlockArmor     = { enabled = true, size = 64, x =  -40, y = 150, strict = false, choice = "auto", combatOnly = false, expiryWarn = 0 },
    warlockPet       = { enabled = true, size = 64, x =   40, y = 150, combatOnly = false },
    -- Paladin
    paladinBlessing  = { enabled = true, size = 64, x =  -70, y = 150, strict = false, choice = "auto", combatOnly = false, expiryWarn = 5 },
    paladinAura      = { enabled = true, size = 64, x =    0, y = 150, strict = false, choice = "auto", combatOnly = false, expiryWarn = 0 },
    paladinSeal      = { enabled = true, size = 64, x =  140, y = 150, strict = false, combatOnly = true, expiryWarn = 5, showTimer = true },
    righteousFury    = { enabled = true, size = 64, x =   70, y = 150, strict = false, combatOnly = true, allSpecs = false, expiryWarn = 0 },
    paladinParty     = { enabled = true, size = 20, side = "right" },
    -- Druid
    druidMark        = { enabled = true, size = 64, x =  -40, y = 150, strict = false, combatOnly = false, expiryWarn = 0 },
    omenOfClarity    = { enabled = true, size = 64, x =   40, y = 150, strict = false, combatOnly = false, expiryWarn = 0 },
    thorns           = { enabled = true, size = 64, x =  120, y = 150, strict = false, combatOnly = false, expiryWarn = 0 },
    druidParty       = { enabled = true, size = 20, side = "right" },
    -- Shaman
    lightningShield  = { enabled = true, size = 64, x =  -40, y = 150, strict = false, combatOnly = true, expiryWarn = 5 },
    shamanWeapon     = { enabled = true, size = 64, x =   40, y = 150, combatOnly = true, expiryWarn = 5 },
}
