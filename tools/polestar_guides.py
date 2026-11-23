"""The guides as the game reads them, without the game: shared by tools/check-chapitres.py,
tools/check-accroches.py and tools/check-lua.py (Lua 5.1 through lupa, as the game: pip install lupa).

  guides = load()            every guide of addons/: Polestar's (pack "guides") and this pack's
  route = alliance_route(guides)   Polestar's Alliance route, step by step, from each race's start
  table = greffe()           GreffeData.lua's GA.GREFFE and GA.RETIRED, as Python

load() runs the compiled Guides.lua of every Polestar_Guides* and PolestarPack_GroupeAlliance folder
of addons/ (forge guide compile writes them: Polestar.RegisterGuide({...}) blocks) with a stand-in
for Polestar's registration calls, and returns {id: guide} as plain Python (dicts and lists). A
step's `when` predicates are kept as compiled ({k, neg, quest...}), and its `along` and `label`; a goal
keeps t, quest, optional, pre (one of them is enough), preAll (all of them), closedBy, minLevel.

alliance_route() follows each Alliance start (Human, Dwarf, Gnome, Night Elf) by `next` (on the
guides both factions share, `nextChoices` holds one per faction: the Alliance's is taken) to the
route's end, and gives the steps in order, each with its estimated level: the guide's level range
(factionLevels for the Alliance when set) spread evenly over its steps. Polestar's guides have no
level per step; the estimate is good to about one level.
"""
import pathlib
from lupa import lua51

REPO = pathlib.Path(__file__).resolve().parent.parent
ADDONS = REPO / "addons"
STARTS = {
    "Human": "forever/alliance/human/01-elwynn-forest",
    "Dwarf": "forever/alliance/dwarf/01-dun-morogh",
    "Gnome": "forever/alliance/gnome/01-dun-morogh",
    "NightElf": "forever/alliance/nightelf/01-teldrassil",
}

STUB = r'''
GUIDES = {}
local noop = function() end
Polestar = setmetatable({
    RegisterGuide = function(g) GUIDES[#GUIDES + 1] = g end,
}, { __index = function() return noop end })
'''


def to_py(v):
    if lua51.lua_type(v) == "table":
        keys = list(v.keys())
        if keys and all(isinstance(k, int) for k in keys) and sorted(keys) == list(range(1, len(keys) + 1)):
            return [to_py(v[k]) for k in range(1, len(keys) + 1)]
        return {k: to_py(x) for k, x in v.items()}
    return v


def load(addons=ADDONS):
    """{guide id: guide} for every compiled guide of the Polestar_Guides* folders and this pack."""
    L = lua51.LuaRuntime(unpack_returned_tuples=True)
    L.execute(STUB)
    folders = sorted(p for p in addons.iterdir() if p.is_dir() and (p.name.startswith("Polestar_Guides") or p.name == "PolestarPack_GroupeAlliance"))
    for folder in folders:
        for f in sorted(folder.glob("*.lua")):
            text = f.read_text(encoding="utf-8")
            if "RegisterGuide(" not in text:
                continue
            L.execute(text, folder.name)
    out = {}
    for g in L.globals().GUIDES.values():
        # Only what the checks read: the names tables are large and not needed.
        steps = []
        for s in (g.steps or {}).values():
            goals = []
            for x in (s.goals or {}).values():
                goals.append({k: to_py(x[k]) for k in ("t", "quest", "optional", "pre", "preAll", "closedBy", "minLevel", "qlvl", "title", "item", "npc", "object", "only", "note") if x[k] is not None})
            steps.append({"title": s.title, "when": to_py(s.when) or [], "only": to_py(s.only), "goals": goals, "label": s.label,
                          "along": s.along, "note": s.note})
        out[g.id] = {
            "id": g.id, "pack": g.pack, "title": g.title, "category": g.category, "faction": g.faction,
            "minLevel": g.minLevel, "maxLevel": g.maxLevel, "factionLevels": to_py(g.factionLevels),
            "next": g.next, "nextChoices": to_py(g.nextChoices), "steps": steps,
        }
    return out


def next_of(guides, g):
    """The guide after g on the Alliance route."""
    choices = g.get("nextChoices") or ([g["next"]] if g.get("next") else [])
    for c in choices:
        t = guides.get(c)
        if t and t.get("faction") in (None, "Alliance"):
            return c
    return None


def levels(g):
    fl = (g.get("factionLevels") or {}).get("Alliance")
    if fl:
        return fl["min"], fl["max"]
    return g.get("minLevel") or 1, g.get("maxLevel") or g.get("minLevel") or 1


def step_applies(step, race, cls="Warrior"):
    """Whether a step (or goal) `only` restriction lets this race and class through."""
    only = step.get("only") or {}
    races, classes = only.get("races"), only.get("classes")
    if races and race not in races:
        return False
    if classes and cls.upper() not in [c.upper() for c in classes]:
        return False
    return True


def alliance_route(guides, race="Human"):
    """[(guide id, step index (1-based), estimated level, step)] from race's start to the route's end."""
    out, seen, gid = [], set(), STARTS[race]
    while gid and gid not in seen and gid in guides:
        seen.add(gid)
        g = guides[gid]
        lo, hi = levels(g)
        n = len(g["steps"])
        for i, step in enumerate(g["steps"], 1):
            out.append((gid, i, lo + (hi - lo) * (i - 1) / max(1, n - 1), step))
        gid = next_of(guides, g)
    return out


def is_dungeon_step(step):
    """A `when dungeon` step: off in Polestar 0.4.2.2 (its dungeon runs are read as passed)."""
    return any(p.get("k") == "dungeon" and not p.get("neg") for p in step.get("when") or [])


def greffe(path=REPO / "addons-src" / "GroupeAlliance" / "GreffeData.lua"):
    """GreffeData.lua's GA.GREFFE (list of dicts, `turnin`, `accept`, `dungeon`, `done`, `fin` always lists) and GA.RETIRED."""
    L = lua51.LuaRuntime(unpack_returned_tuples=True)
    ns = L.table()
    L.execute(path.read_text(encoding="utf-8"), "GroupeAlliance", ns)
    rows = []
    for h in to_py(ns.GA.GREFFE):
        for key in ("turnin", "accept", "dungeon", "done", "fin"):
            v = h.get(key)
            h[key] = [] if v is None or v == {} else (v if isinstance(v, list) else [v])
        rows.append(h)
    return rows, to_py(ns.GA.RETIRED) or []
