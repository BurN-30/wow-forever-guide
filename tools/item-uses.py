"""Build the data of the "What is this item for" tooltip line (Polestar/GroupeAlliance/ItemUseData.lua).

  python tools/item-uses.py --db <folder of client tables> --trainers <TDB world .sql or trainer_spell.csv>
                            [--out addons-src/GroupeAlliance/ItemUseData.lua] [--sample sample.json]

Every fact comes from the game, never from another addon:
  * the WoW Forever client tables, from wago.tools (product wowf), as CSV files in --db:
    ItemSparse, Item, ItemEffect, SpellEffect, SpellMisc, SpellDuration, SpellReagents,
    SpellTotems, SpellLevels, SkillLine (+ SkillLine_frFR), SkillLineAbility,
    SkillRaceClassInfo, ChrClasses (+ ChrClasses_frFR), and the Classic Era item list
    (Era_Item.csv, build 1.15.9.70576, product wow_classic_era) to tell the items Forever
    added. Download (one per table, <build> = 1.60.1.70888 today):
      curl -o <db>/ItemSparse.csv "https://wago.tools/db2/ItemSparse/csv?build=<build>&product=wowf"
      curl -o <db>/SkillLine_frFR.csv "https://wago.tools/db2/SkillLine/csv?build=<build>&product=wowf&locale=frFR"
      curl -o <db>/Era_Item.csv "https://wago.tools/db2/Item/csv?build=1.15.9.70576&product=wow_classic_era"
  * the rank a profession trainer asks before teaching a recipe: the client has none, so it
    comes from the trainer lists sniffed on the Forever servers, kept in the Forever
    TrinityCore world database (github.com/Karrz1/TrinityCore, release forever-tdb-2026-10-14,
    GPL-2.0, facts only: table trainer_spell, rows of build 70124);
  * the quests: the pack's own Polestar_QuestDB (addons/, shipped with Polestar).

A profession is named for every recipe of its skill lines that uses the item; the rank
"from N" is said only when it is certain: the lowest rank at which those recipes are taught
(learned with the profession: 1, a Forever trainer's rank, a recipe item's required rank),
known for every one of them, or 1 for one of them (nothing can be lower). "Only worth selling" needs the opposite
certainty, so it is judged against every recipe and spell of the tables, every quest of the
database, and only for items Classic already had (the quest data is thin on Forever's own).
"""
import argparse, csv, json, pathlib, re, statistics, sys

REPO = pathlib.Path(__file__).resolve().parent.parent
ADDONS = REPO / "addons"

# Profession skill lines (Forever adds one child line per profession: 2937-2948, 2988).
PROFESSIONS = {129, 164, 165, 171, 182, 185, 186, 197, 202, 333, 356, 393, 40}
LEARN_SPELL = 36           # SpellEffect.Effect: teaches EffectTriggerSpell
AURA = 6                   # SpellEffect.Effect: apply aura
TRIGGER_SPELL = 64         # SpellEffect.Effect: casts EffectTriggerSpell
FOOD_AURA, DRINK_AURA = 84, 85   # health and mana regeneration while eating or drinking
FOREVER_TRAINER_BUILD = 70124    # trainer_spell.VerifiedBuild of the Forever sniffs
ITEM_FLAG_HAS_LOOT = 0x4         # ItemSparse.Flags_0: opens (a box, a bag of loot)
# The Forever client still carries Season of Discovery's spells (ids 400000-499999: its
# recipes, and the Engraving skill line 2851 of its runes), which Forever does not have: they
# never make a use, but still keep an item off "only worth selling".
SOD_SPELLS = range(400000, 500000)
SOD_SKILL_LINES = {2851}


def table(db, name):
    p = db / f"{name}.csv"
    with open(p, encoding="utf-8", newline="") as f:
        return list(csv.DictReader(f))


def num(v):
    try:
        return int(float(v))
    except (TypeError, ValueError):
        return 0


def trainer_ranks(path):
    """spellID -> the lowest rank a Forever trainer asks for it."""
    rows = []
    if path.suffix.lower() == ".sql":
        pat = re.compile(r"\((\d+),(\d+),(\d+),(\d+),(\d+),(\d+),(\d+),(\d+),(\d+),(-?\d+)\)")
        with open(path, encoding="utf-8", errors="replace") as f:
            for line in f:
                if line.startswith("INSERT INTO `trainer_spell` VALUES"):
                    rows += [tuple(map(int, m.groups())) for m in pat.finditer(line)]
    else:
        with open(path, encoding="utf-8", newline="") as f:
            for r in csv.DictReader(f):
                rows.append((num(r["TrainerId"]), num(r["SpellId"]), num(r["MoneyCost"]), num(r["ReqSkillLine"]),
                             num(r["ReqSkillRank"]), 0, 0, 0, num(r["ReqLevel"]), num(r["VerifiedBuild"])))
    out = {}
    for _, spell, _, _, rank, _, _, _, _, build in rows:
        if build == FOREVER_TRAINER_BUILD:
            rank = max(rank, 1)
            out[spell] = min(out.get(spell, rank), rank)
    return out


def lua_chunks(path, kind):
    """Records of a Polestar data file: R("<kind>", lo, hi, [[ ... ]]) -> {id: fields}."""
    out = {}
    text = path.read_text(encoding="utf-8")
    for m in re.finditer(r'R\("' + kind + r'", \d+, \d+, \[\[\n(.*?)\n\]\]\)', text, re.S):
        for line in m.group(1).split("\n"):
            if "\t" in line:
                i, rest = line.split("\t", 1)
                out[int(i)] = rest.split(";")
    return out


def ids(field):
    field = (field or "").lstrip("{")
    return [int(x) for x in field.split(",") if x.strip().lstrip("-").isdigit()]


# Quests the database keeps but nobody can take: Blizzard's placeholders.
UNUSED_TITLE = re.compile(r"^\s*[<\[]|UNUSED|DEPRECATED|\bNYI\b|\(old\)|\bTEST\b|^Test ", re.I)


def quests_of_items():
    """item -> [(quest, kind)] with kind o (objective), s (starts it), u (given or used by it);
    quest -> (side, races, classes, excl, level); the quests that cannot be taken (a placeholder
    title, or no NPC, object or item that starts them) and the holidays' quests are left out
    of both, but their items
    are still in the third result, every item the database names (for "only worth selling")."""
    recs = lua_chunks(ADDONS / "Polestar_QuestDB" / "Quests.lua", "quests")
    uses, quests, named = {}, {}, set()
    for q, f in recs.items():
        f = f + [""] * (19 - len(f))
        title = f[0].lstrip("'")
        for field in (f[8], f[11], f[18]):
            named.update(ids(field))
        if UNUSED_TITLE.search(title) or not (ids(f[6]) or ids(f[8])) or f[15]:
            continue  # a placeholder, a quest nothing starts, or a holiday's (only while it runs)
        side = {"1": "A", "2": "H"}.get(f[5], "")
        quests[q] = (side, num(f[3]), num(f[4]), ids(f[10]), num(f[1]))
        obj = ids(f[11])
        for i in range(0, len(obj) - 1, 3):  # kind, id, count (the last count may be missing)
            if obj[i] == 2:
                uses.setdefault(obj[i + 1], []).append((q, "o"))
        for it in ids(f[8]):
            uses.setdefault(it, []).append((q, "s"))
        for it in ids(f[18]):
            if (q, "o") not in uses.get(it, []):
                uses.setdefault(it, []).append((q, "u"))
    db_items = set(lua_chunks(ADDONS / "Polestar_QuestDB" / "Items.lua", "items")) | named
    return uses, quests, db_items



def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--db", type=pathlib.Path, required=True)
    ap.add_argument("--trainers", type=pathlib.Path, required=True)
    ap.add_argument("--build", default="1.60.1.70888")
    ap.add_argument("--out", type=pathlib.Path, default=REPO / "addons-src" / "GroupeAlliance" / "ItemUseData.lua")
    ap.add_argument("--sample", type=pathlib.Path, help="write every item's decoded uses as JSON (checks)")
    a = ap.parse_args()
    sys.stdout.reconfigure(encoding="utf-8")
    db = a.db

    sparse = {num(r["ID"]): r for r in table(db, "ItemSparse")}
    item = {num(r["ID"]): r for r in table(db, "Item")}
    era = {num(r["ID"]) for r in table(db, "Era_Item")}
    skill = {num(r["ID"]): r for r in table(db, "SkillLine")}
    skill_fr = {num(r["ID"]): r for r in table(db, "SkillLine_frFR")}
    chr_en = table(db, "ChrClasses")
    chr_fr = table(db, "ChrClasses_frFR")
    effects = {}
    for r in table(db, "SpellEffect"):
        effects.setdefault(num(r["SpellID"]), []).append(r)
    misc = {num(r["SpellID"]): r for r in table(db, "SpellMisc")}
    duration = {num(r["ID"]): num(r["Duration"]) for r in table(db, "SpellDuration")}
    levels = {num(r["SpellID"]): num(r["BaseLevel"]) or num(r["SpellLevel"]) for r in table(db, "SpellLevels")}
    reagents = {}
    for r in table(db, "SpellReagents"):
        sp = num(r["SpellID"])
        for i in range(8):
            it = num(r[f"Reagent_{i}"])
            if it > 0:
                reagents.setdefault(sp, set()).add(it)
    totems = {}
    for r in table(db, "SpellTotems"):
        totems[num(r["SpellID"])] = ([num(r["Totem_0"]), num(r["Totem_1"])],
                                     [num(r["RequiredTotemCategoryID_0"]), num(r["RequiredTotemCategoryID_1"])])
    sla = table(db, "SkillLineAbility")
    srci = table(db, "SkillRaceClassInfo")
    ranks = trainer_ranks(a.trainers)
    quest_uses, quests, quest_db_items = quests_of_items()

    # ChrClasses has no ID column in this export: its rows carry the class file name, whose ID
    # is the game's own (the class masks of SkillRaceClassInfo agree: shaman 64, mage 128).
    CLASS_ID = {"WARRIOR": 1, "PALADIN": 2, "HUNTER": 3, "ROGUE": 4, "PRIEST": 5, "DEATHKNIGHT": 6,
                "SHAMAN": 7, "MAGE": 8, "WARLOCK": 9, "MONK": 10, "DRUID": 11}
    class_token = {CLASS_ID[r["Filename"]]: r["Filename"] for r in chr_en}
    fr_by_file = {r["Filename"]: r["Name_lang"] for r in chr_fr}
    class_name = {r["Filename"]: (r["Name_lang"], fr_by_file.get(r["Filename"]) or r["Name_lang"]) for r in chr_en}
    skill_class_mask = {}
    for r in srci:
        m = num(r["ClassMask"])
        if m > 0:
            skill_class_mask[num(r["SkillID"])] = skill_class_mask.get(num(r["SkillID"]), 0) | m

    def parent(sl):
        p = num(skill.get(sl, {}).get("ParentSkillLineID"))
        return p if p else sl

    # Recipe items: the spell they teach and the rank they ask.
    teaches = {}  # recipe spell -> [(recipe item, required rank)]
    item_effect_spells = {}  # item -> [(spell, trigger type)]; ItemXItemEffect links the two
    ie_by_id = {num(r["ID"]): r for r in table(db, "ItemEffect")}
    for r in table(db, "ItemXItemEffect"):
        e = ie_by_id.get(num(r["ItemEffectID"]))
        if e:
            item_effect_spells.setdefault(num(r["ItemID"]), []).append((num(e["SpellID"]), num(e["TriggerType"])))
    for it, spells in item_effect_spells.items():
        s = sparse.get(it)
        if not s or num(item.get(it, {}).get("ClassID")) != 9:
            continue
        for sp, _ in spells:
            for e in effects.get(sp, []):
                if num(e["Effect"]) == LEARN_SPELL and num(e["EffectTriggerSpell"]):
                    teaches.setdefault(num(e["EffectTriggerSpell"]), []).append((it, num(s["RequiredSkillRank"])))

    # Profession recipes: each reagent, and the rank from which some recipe can use it.
    prof_use = {}     # item -> {profession: lowest rank}
    any_use = set()   # every item any recipe or spell of the tables uses (for "only worth selling")
    tool_use = {}     # item -> {profession}
    class_use = {}    # item -> {class token: (level, spell)}
    class_tool = {}   # item -> {class token}
    unsure = 0
    for r in sla:
        sl, sp = num(r["SkillLine"]), num(r["Spell"])
        top = parent(sl)
        cat = num(skill.get(top, {}).get("CategoryID"))
        used = reagents.get(sp, set())
        tot, cats = totems.get(sp, ([], []))
        any_use.update(used)
        any_use.update(t for t in tot if t)
        if sp in SOD_SPELLS or sl in SOD_SKILL_LINES:
            continue
        if top in PROFESSIONS:
            rank = None
            if num(r["AcquireMethod"]) == 1:
                rank = 1
            if sp in ranks:
                rank = min(rank or 999, ranks[sp])
            for rec_item, rr in teaches.get(sp, []):
                rank = min(rank or 999, max(rr, 1))
            if rank is None:
                unsure += 1  # taught somewhere the tables do not say: its rank stays unknown
            for it in used:
                d = prof_use.setdefault(it, {})
                known, unknown = d.get(top, (999, False))
                d[top] = (min(known, rank), unknown) if rank else (known, True)
            for c in cats:
                if c:
                    tool_use.setdefault(("cat", c), set()).add(top)
        elif cat == 7:
            mask = num(r["ClassMask"]) or skill_class_mask.get(sl, 0)
            toks = [class_token[i] for i in class_token if mask & (1 << (i - 1))]
            if len(toks) != 1:
                continue  # a line shared by every class (or none): not a class spell
            t = toks[0]
            lvl = levels.get(sp, 0)
            for it in used:
                d = class_use.setdefault(it, {})
                if t not in d or (lvl, sp) < d[t]:
                    d[t] = (lvl, sp)
            for it in tot:
                if it:
                    class_tool.setdefault(it, set()).add(t)
            for c in cats:
                if c:
                    tool_use.setdefault(("class", c), set()).add(t)
    # A profession's rank for an item: the lowest rank a recipe using it is taught at, when
    # every recipe's rank is known, or when a known one is 1 (nothing can be lower); else 0
    # (the profession is named without a rank).
    for it, d in prof_use.items():
        for p, (known, unknown) in d.items():
            d[p] = known if known == 1 or (known < 999 and not unknown) else 0
    # Every spell's reagents count for "only worth selling", whatever teaches it.
    for sp, used in reagents.items():
        any_use.update(used)
    for sp, (tot, _) in totems.items():
        any_use.update(t for t in tot if t)
    # Profession tools: items whose totem category a recipe asks for.
    prof_tool = {}
    for it, s in sparse.items():
        c = num(s["TotemCategoryID"])
        if c and ("cat", c) in tool_use:
            prof_tool[it] = tool_use[("cat", c)]
            any_use.add(it)
        if c and ("class", c) in tool_use:
            class_tool.setdefault(it, set()).update(tool_use[("class", c)])
            any_use.add(it)

    # Food and drink (consumable, food & drink subclass): what one restores in all.
    food = {}
    for it, s in sparse.items():
        if num(item.get(it, {}).get("ClassID")) != 0 or num(item.get(it, {}).get("SubclassID")) != 5:
            continue
        got = [0, 0, False]  # health, mana, a bonus besides

        def restore(sp, depth):
            # Regeneration auras give their points every 5 seconds of the spell's duration.
            # Forever's own bonus foods cast the plain Food or Drink spell (TRIGGER_SPELL).
            m = misc.get(sp)
            dur = duration.get(num(m["DurationIndex"]), 0) if m else 0
            for e in effects.get(sp, []):
                aura, eff = num(e["EffectAura"]), num(e["Effect"])
                pts = num(e["EffectBasePointsF"])
                if eff == AURA and aura == FOOD_AURA:
                    got[0] += pts * dur // 5000
                elif eff == AURA and aura == DRINK_AURA:
                    got[1] += pts * dur // 5000
                elif eff == TRIGGER_SPELL and depth == 0 and num(e["EffectTriggerSpell"]):
                    restore(num(e["EffectTriggerSpell"]), 1)
                else:
                    got[2] = True

        for sp, trig in item_effect_spells.get(it, []):
            if trig == 0:
                restore(sp, 0)
        if got[0] or got[1]:
            food[it] = (num(s["RequiredLevel"]), got[0], got[1], got[2])
    # Tiers: by required level, the usual amount of the plain foods (no bonus) at that level.
    tiers = {}
    for kind, idx in (("h", 1), ("m", 2)):
        by = {}
        for it, f in food.items():
            if f[3] or not f[idx] or (kind == "m" and f[1]):
                continue
            by.setdefault(f[0], []).append(f[idx])
        # A level with two plain foods or more makes a tier; level 0 is not one (odd items).
        tiers[kind] = sorted((lvl, int(statistics.median(v))) for lvl, v in by.items() if len(v) >= 2 and lvl > 0)

    # Only worth selling: poor quality, sells, does nothing, wanted by nothing we know of.
    sell = []
    for it, s in sparse.items():
        it_row = item.get(it, {})
        if num(s["OverallQualityID"]) != 0 or num(s["SellPrice"]) <= 0:
            continue
        if num(it_row.get("InventoryType")) != 0 or num(it_row.get("ClassID")) not in (15, 7):
            continue
        if item_effect_spells.get(it) or num(s["StartQuestID"]) or num(s["LockID"]) or num(s["PageID"]):
            continue
        if num(s["Flags_0"]) & ITEM_FLAG_HAS_LOOT or it in any_use or it in quest_uses or it in quest_db_items:
            continue
        if it not in era:
            continue  # added by Forever: its quests may not be known yet
        sell.append(it)

    # Quests the data names for an item, kept to those items. The item table knows every item
    # that starts a quest (StartQuestID), the quest data may not: added when the quest is known.
    for it, s in sparse.items():
        q = num(s["StartQuestID"])
        if q and q in quests and (q, "s") not in quest_uses.get(it, []):
            quest_uses.setdefault(it, []).append((q, "s"))
    used_quests = set()
    quest_rows = {}
    for it, lst in quest_uses.items():
        if it not in sparse:
            continue
        quest_rows[it] = lst
        used_quests.update(q for q, _ in lst)

    # ---------------------------------------------------------------- Lua
    def esc(s):
        return s.replace("\\", "\\\\").replace('"', '\\"')

    def block(rows):
        # Lua drops the newline right after "[[": one more keeps the first record's own.
        return "\n\n" + "\n".join(rows) + "\n"

    profs = sorted({p for d in prof_use.values() for p in d} | {p for s in prof_tool.values() for p in s})
    lines = []
    lines.append("-- Generated by tools/item-uses.py from the WoW Forever client tables (wago.tools, product wowf,")
    lines.append(f"-- build {a.build}), the trainer lists sniffed on the Forever servers (Forever TrinityCore world")
    lines.append("-- database, release forever-tdb-2026-10-14, GPL-2.0, facts only) and the pack's Polestar_QuestDB.")
    lines.append("-- Do not edit: rebuild with that tool. Game data (c) Blizzard Entertainment, used as facts.")
    lines.append("-- Records are \"\\n<itemID>\\t<fields>\\n\" lines, cut out by ItemUse.lua when an item is hovered:")
    lines.append("--   prof  <skillLine>:<rank>,...   professions whose recipes use it, from that rank (0: unknown)")
    lines.append("--   tool  <skillLine>,...          professions whose recipes need it as a tool")
    lines.append("--   spell <CLASS>:<spellID>,...    class spells that use it (the lowest-level one named)")
    lines.append("--   ctool <CLASS>,...              class spells that need it as a tool (totems)")
    lines.append("--   food  <reqLevel>:<health>:<mana>:<bonus 0|1>")
    lines.append("--   quest <questID><o|s|u>,...     o: an objective, s: starts the quest, u: given or used by it")
    lines.append("--   sell  (no fields)               only worth selling: poor, does nothing, wanted by nothing known")
    lines.append("-- quests: <questID>\\t<A|H|>;<races>;<classes>;<excl,...>;<level>: the side, the race mask of a")
    lines.append("--   quest kept to one or two races, the class mask, the quests that close it, its level. Titles: Polestar.")
    lines.append("local _, ns = ...")
    lines.append("ns.GA = ns.GA or {}")
    lines.append("ns.GA.ItemUseData = {")
    lines.append(f'\tbuild = "{a.build}",')
    lines.append("\tskills = {")
    for p in profs:
        en = skill[p]["DisplayName_lang"]
        fr = skill_fr.get(p, {}).get("DisplayName_lang") or en
        lines.append(f'\t\t[{p}] = {{ "{esc(en)}", "{esc(fr)}" }},')
    lines.append("\t},")
    lines.append("\tclasses = {")
    for t, (en, fr) in class_name.items():
        if t:
            lines.append(f'\t\t{t} = {{ "{esc(en)}", "{esc(fr)}" }},')
    lines.append("\t},")
    for kind in ("h", "m"):
        lines.append(f"\ttiers{kind.upper()} = {{ " + ", ".join(f"{{ {l}, {v} }}" for l, v in tiers[kind]) + " },")

    def rows_of(d, fmt):
        return [f"{it}\t{fmt(v)}" for it, v in sorted(d.items())]

    prof_rows = rows_of(prof_use, lambda d: ",".join(f"{p}:{r}" for p, r in sorted(d.items(), key=lambda x: (x[1] == 0, x[1], x[0]))))
    tool_rows = rows_of(prof_tool, lambda s: ",".join(str(p) for p in sorted(s)))
    spell_rows = rows_of(class_use, lambda d: ",".join(f"{t}:{v[1]}" for t, v in sorted(d.items())))
    ctool_rows = rows_of(class_tool, lambda s: ",".join(sorted(s)))
    food_rows = rows_of(food, lambda f: f"{f[0]}:{f[1]}:{f[2]}:{1 if f[3] else 0}")
    quest_item_rows = rows_of(quest_rows, lambda lst: ",".join(f"{q}{k}" for q, k in lst))
    for name, rows in (("prof", prof_rows), ("tool", tool_rows), ("spell", spell_rows), ("ctool", ctool_rows),
                       ("food", food_rows), ("quest", quest_item_rows)):
        lines.append(f"\t{name} = [[{block(rows)}]],")
    lines.append("\tsell = [[" + block([f"{x}\t" for x in sell]) + "]],")
    qrows = []
    for q in sorted(used_quests):
        side, races, cls, excl, level = quests[q]
        narrow = races and bin(races).count("1") <= 2  # a racial quest; a side's whole mask says no more than the side
        qrows.append(f"{q}\t{side};{races if narrow else ''};{cls or ''};{','.join(str(x) for x in excl)};{level or ''}")
    lines.append(f"\tquests = [[{block(qrows)}]],")
    lines.append("}")
    text = "\n".join(lines) + "\n"
    a.out.write_text(text, encoding="utf-8", newline="\n")
    print(f"{a.out}: {len(text.encode('utf-8'))} bytes")
    print(f"professions: {len(prof_use)} items ({unsure} recipes without a known rank: no Forever trainer sniff, recipe item or automatic learning)")
    print(f"profession tools: {len(prof_tool)}, class spells: {len(class_use)}, class tools: {len(class_tool)}")
    print(f"food and drink: {len(food)}, tiers: {tiers}")
    print(f"quest items: {len(quest_rows)} ({len(used_quests)} quests), only worth selling: {len(sell)}")
    if a.sample:
        out = {}
        for it in sparse:
            d = {}
            if it in prof_use: d["prof"] = prof_use[it]
            if it in prof_tool: d["tool"] = sorted(prof_tool[it])
            if it in class_use: d["spell"] = {t: v[1] for t, v in class_use[it].items()}
            if it in class_tool: d["ctool"] = sorted(class_tool[it])
            if it in food: d["food"] = food[it]
            if it in quest_rows: d["quest"] = quest_rows[it]
            if it in sell: d["sell"] = num(sparse[it]["SellPrice"])
            if d:
                d["name"] = sparse[it]["Display_lang"]
                d["quality"] = num(sparse[it]["OverallQualityID"])
                d["class"] = num(item.get(it, {}).get("ClassID"))
                out[it] = d
        a.sample.write_text(json.dumps(out, ensure_ascii=False, indent=0), encoding="utf-8")


if __name__ == "__main__":
    main()
