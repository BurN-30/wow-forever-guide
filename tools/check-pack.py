"""Load the whole pack together without the game (Lua 5.1 through lupa: pip install lupa).

  python tools/check-pack.py --ui <wow-ui-source, branch forever> --strings <folder of GlobalStrings_<locale>.csv>
                            [--extra <folder>]... [--report <file.md>] [--locale frFR]

Every folder of addons/ (and of each --extra folder: candidate addons, never shipped) is
loaded in one Lua state, as the client does: "!" folders and dependencies first, then by
name, each file of its .toc in order (inline directives and [Game], [Family], [TextLocale]
for WoW Forever: game type camelot, family mainline), XML <Script> and <Include> followed,
load-on-demand addons when an addon asks for them. Then ADDON_LOADED, PLAYER_LOGIN,
PLAYER_ENTERING_WORLD, the timers, a combat (PLAYER_REGEN_DISABLED / ENABLED), an item
tooltip and the world map opened. Twice: French client (frFR), then English (enUS).

The fake game is tools/fakegame.lua. From --ui (a checkout of Gethe/wow-ui-source, branch
forever, its Lua and XML files: README.md says how), every documented function exists and
returns values of its documented types (Blizzard_APIDocumentationGenerated), with the
interface's enums and constants, and the other global functions, tables and named frames of
the interface exist (as do-nothing stand-ins). From --strings, the client's global strings
in each language (wago.tools, table GlobalStrings, build 1.60.1.70888).

What it reports, per addon: errors (with the file and line), globals written by more than
one addon, slash commands, console variables written, Blizzard functions hooked or written
over, scripts hooked on the game's frames, tooltip post-calls, events, key bindings set,
LibStub libraries (every version offered, the one that wins). An error is a lead to read,
not a proof of a bug in game (the fake game is small); a clean run proves no more than
"loads and starts". The exit code is 1 when a file does not compile or an addon of the pack
(not --extra) raises an error while loading or starting.
"""
import argparse, pathlib, re, sys
from lupa import lua51

REPO = pathlib.Path(__file__).resolve().parent.parent
GAME_TYPE, FAMILY = "camelot", "mainline"


def parse_toc(folder):
    name = folder.name
    toc = None
    for suffix in ("_Forever", "_Camelot", "_Mainline", ""):
        p = folder / f"{name}{suffix}.toc"
        if p.is_file():
            toc = p
            break
    if toc is None:
        return None
    meta, files = {}, []
    for raw in toc.read_text(encoding="utf-8-sig", errors="replace").splitlines():
        line = raw.strip()
        if not line:
            continue
        if line.startswith("##"):
            m = re.match(r"##\s*([^:]+?)\s*:\s*(.*)$", line)
            if m:
                key, value = m.group(1), m.group(2)
                value, ok = directives(value)
                if ok and key not in meta:
                    meta[key] = value.strip()
            continue
        if line.startswith("#"):
            continue
        path, ok = directives(line)
        if ok:
            files.append(path.strip())
    return {"name": name, "toc": toc, "meta": meta, "files": files, "folder": folder}


def directives(text):
    """Applies the inline [Directive value] of a .toc line; returns (text, keep)."""
    keep = True
    for d in re.findall(r"\[(\w+)(?:\s+([^\]]*))?\]", text):
        key, value = d[0].lower(), [v.strip().lower() for v in (d[1] or "").split(",") if v.strip()]
        if key == "allowloadgametype":
            keep &= GAME_TYPE in value or FAMILY in value or "forever" in value
        elif key == "excludeloadgametype":
            keep &= not (GAME_TYPE in value or FAMILY in value or "forever" in value)
        elif key == "allowloadtextlocale":
            keep &= LOCALE.lower() in value
        elif key == "excludeloadtextlocale":
            keep &= LOCALE.lower() not in value
    text = re.sub(r"\s*\[(AllowLoad\w*|ExcludeLoad\w*|AllowLoad)(\s+[^\]]*)?\]", "", text, flags=re.I)
    text = text.replace("[Game]", "Camelot").replace("[Family]", "Mainline").replace("[TextLocale]", LOCALE)
    return text, keep


_UI = None


def scan_ui(root):
    """Global names of the client's interface: functions, tables, named frames, constants."""
    global _UI
    if _UI:
        return _UI
    funcs, tables, frames, consts = set(), set(), {}, {}
    base = root / "Interface" / "AddOns"
    for p in base.rglob("*.lua"):
        if "APIDocumentation" in p.parts[-2]:
            continue
        for line in p.read_text(encoding="utf-8", errors="replace").splitlines():
            m = re.match(r"function ([A-Za-z_][\w]*)\s*\(", line)
            if m:
                funcs.add(m.group(1))
                continue
            m = re.match(r"([A-Za-z_][\w]*)\s*=\s*(.+?)\s*;?\s*$", line)
            if m and not line.startswith("local"):
                name, val = m.group(1), m.group(2)
                if re.fullmatch(r"-?\d+(\.\d+)?", val):
                    consts.setdefault(name, float(val) if "." in val else int(val))
                elif re.fullmatch(r'"[^"\\]*"', val):
                    consts.setdefault(name, val[1:-1])
                elif val in ("true", "false"):
                    consts.setdefault(name, val == "true")
                elif val.startswith("{") or "Mixin" in val or val.startswith("CreateFromMixins"):
                    tables.add(name)
                elif val.startswith("function"):
                    funcs.add(name)
    for p in base.rglob("*.xml"):
        text = p.read_text(encoding="utf-8", errors="replace")
        for m in re.finditer(r"<(Frame|Button|CheckButton|StatusBar|ScrollFrame|EditBox|Slider|GameTooltip|Cooldown|MessageFrame|ScrollingMessageFrame|ModelScene|PlayerModel|DropdownButton|Font)\b([^>]*)>", text):
            attrs = m.group(2)
            nm = re.search(r'\bname\s*=\s*"([A-Za-z_][\w]*)"', attrs)
            if nm and not re.search(r'\bvirtual\s*=\s*"true"', attrs):
                frames.setdefault(nm.group(1), m.group(1))
    for n in list(frames):
        funcs.discard(n)
        tables.discard(n)
    _UI = (sorted(funcs), sorted(tables - funcs), frames, consts)
    return _UI


def deps(meta, key_names):
    out = []
    for k in key_names:
        for v in (meta.get(k) or "").split(","):
            v = v.strip()
            if v:
                out.append(v)
    return out


def main():
    global LOCALE
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--ui", type=pathlib.Path, required=True, help="checkout of Gethe/wow-ui-source, branch forever (Lua and XML)")
    ap.add_argument("--strings", type=pathlib.Path, required=True, help="folder of GlobalStrings_<locale>.csv (wago.tools, build 1.60.1)")
    ap.add_argument("--extra", type=pathlib.Path, action="append", default=[])
    ap.add_argument("--report", type=pathlib.Path)
    ap.add_argument("--locale", action="append")
    a = ap.parse_args()
    sys.stdout.reconfigure(encoding="utf-8")
    out_lines, worst = [], 0
    for LOCALE in a.locale or ["frFR", "enUS"]:
        lines, bad = run(a, LOCALE)
        out_lines += lines
        worst = max(worst, bad)
    text = "\n".join(out_lines) + "\n"
    print(text)
    if a.report:
        a.report.write_text(text, encoding="utf-8", newline="\n")
    sys.exit(1 if worst else 0)


def run(a, locale):
    folders = [p for p in sorted((REPO / "addons").iterdir()) if p.is_dir()]
    extra_names = set()
    for e in a.extra:
        for p in sorted(e.iterdir()):
            if p.is_dir() and (p / f"{p.name}.toc").exists():
                folders.append(p)
                extra_names.add(p.name)
    addons = {}
    for f in folders:
        t = parse_toc(f)
        if t:
            addons[t["name"]] = t

    L = lua51.LuaRuntime(unpack_returned_tuples=True, encoding="utf-8")
    g = L.globals()
    g.BENCH_LOCALE = locale
    L.execute((REPO / "tools" / "fakegame.lua").read_text(encoding="utf-8"))
    B = g.BENCH
    api = a.ui / "Interface" / "AddOns" / "Blizzard_APIDocumentationGenerated" if a.ui else None
    if api and api.is_dir():
        L.execute("DOCS = {} APIDocumentation = { AddDocumentationTable = function(_, t) DOCS[#DOCS + 1] = t end }")
        for p in sorted(api.glob("*.lua")):
            try:
                L.execute(p.read_text(encoding="utf-8", errors="replace"))
            except Exception as e:  # a doc file the fake Enum cannot read: skipped
                print(f"(api doc skipped: {p.name}: {e})", file=sys.stderr)
        L.execute("BENCH.InstallAPI(DOCS) DOCS = nil APIDocumentation = nil")
    if a.ui:
        funcs, tables, frames, consts = scan_ui(a.ui)
        cl = L.table()
        for k, v in consts.items():
            cl[k] = v
        fr = L.table()
        for k, v in frames.items():
            fr[k] = v
        g.BENCH.InstallUI(L.table(*funcs), L.table(*tables), fr, cl)
    if a.strings:
        csvp = a.strings / f"GlobalStrings_{locale}.csv"
        if csvp.is_file():
            import csv
            st = g.BENCH.strings
            with open(csvp, encoding="utf-8", newline="") as fh:
                for row in csv.DictReader(fh):
                    st[row["BaseTag"]] = row["TagText_lang"]
    L.execute("BENCH.SealGlobals()")

    for name, t in addons.items():
        meta = L.table()
        for k, v in t["meta"].items():
            meta[k] = v
        entry = L.table(meta=meta, lod=t["meta"].get("LoadOnDemand", "0").strip() == "1",
                        deps=L.table(*deps(t["meta"], ["Dependencies", "RequiredDeps", "Dep"])))
        B.addons[name] = entry
    order = sorted(addons, key=lambda n: n.lower())
    for i, n in enumerate(order, 1):
        B.addonOrder[i] = n

    compile_errors = []
    run_file = L.eval("""function(addon, path, src, ns)
        local f, err = loadstring(src, "@" .. addon .. "/" .. path)
        if not f then return "compile", err end
        local prev = BENCH.current
        BENCH.current = addon
        local ok, e = xpcall(function() return f(addon, ns) end, function(m) return tostring(m) end)
        if not ok then BENCH.Error("load " .. path, e) end
        BENCH.current = prev
        if not ok then return "run", e end
        return "ok", ""
    end""")
    xml_frame = L.eval("""function(addon, name, ftype, virtual)
        if virtual then return end
        local prev = BENCH.current
        BENCH.current = addon
        BENCH.NewFrame(ftype, name, nil)
        BENCH.current = prev
    end""")
    fire = L.eval("function(e, ...) BENCH.Fire(e, ...) end")
    namespaces = {}
    loading = set()

    def load_file(addon, folder, rel, ns):
        p = folder / rel.replace("\\", "/")
        if not p.is_file():
            # the client looks the file up without caring for case
            parent = p.parent
            hit = [q for q in parent.iterdir() if q.name.lower() == p.name.lower()] if parent.is_dir() else []
            if not hit:
                B.errors[len(B.errors) + 1] = L.table(addon, "toc", f"file listed but missing: {rel}")
                return
            p = hit[0]
        if p.suffix.lower() == ".xml":
            load_xml(addon, folder, p, ns)
            return
        src = p.read_bytes().decode("utf-8-sig", errors="replace")
        res = run_file(addon, p.relative_to(folder).as_posix(), src, ns)
        kind, err = res if isinstance(res, tuple) else (res, None)
        if kind == "compile":
            compile_errors.append(f"{addon}/{p.relative_to(folder).as_posix()}: {err}")

    def load_xml(addon, folder, p, ns):
        text = p.read_text(encoding="utf-8-sig", errors="replace")
        text = re.sub(r"<!--.*?-->", "", text, flags=re.S)
        for m in re.finditer(r"<(Script|Include)\s+file\s*=\s*\"([^\"]+)\"|<(Frame|Button|CheckButton|StatusBar|ScrollFrame|EditBox|Slider|GameTooltip|Cooldown|Model|PlayerModel|MessageFrame|SimpleHTML)\b([^>]*)>", text):
            if m.group(1):
                load_rel(addon, folder, p.parent, m.group(2), ns)
            else:
                attrs = m.group(4)
                nm = re.search(r'\bname\s*=\s*"([^"]+)"', attrs)
                virtual = re.search(r'\bvirtual\s*=\s*"true"', attrs) is not None
                if nm and "$parent" not in nm.group(1):
                    xml_frame(addon, nm.group(1), m.group(3), virtual)

    def load_rel(addon, folder, base, rel, ns):
        target = (base / rel.replace("\\", "/"))
        try:
            relp = target.resolve().relative_to(folder.resolve()).as_posix()
        except ValueError:
            relp = rel
        load_file(addon, folder, relp, ns)

    def load_addon(name):
        if name in loading or B.loaded[name]:
            return
        t = addons.get(name)
        if not t:
            return
        loading.add(name)
        for d in deps(t["meta"], ["Dependencies", "RequiredDeps", "Dep"]) + deps(t["meta"], ["OptionalDeps"]):
            if d in addons and not addons[d]["meta"].get("LoadOnDemand", "0").strip() == "1":
                load_addon(d)
            elif d in addons and d in deps(t["meta"], ["Dependencies", "RequiredDeps", "Dep"]):
                load_addon(d)
        ns = namespaces.setdefault(name, L.table())
        for rel in t["files"]:
            load_file(name, t["folder"], rel, ns)
        B.loaded[name] = True
        fire("ADDON_LOADED", name, False)
        loading.discard(name)

    B.LoadAddOn = lambda n: load_addon(n)
    for n in order:
        if addons[n]["meta"].get("LoadOnDemand", "0").strip() != "1":
            load_addon(n)
    L.execute("BENCH.loggedIn = true")
    for step in ("PLAYER_LOGIN", ("PLAYER_ENTERING_WORLD", True, False), "SPELLS_CHANGED", "BAG_UPDATE_DELAYED",
                 "QUEST_LOG_UPDATE", ("UNIT_AURA", "player"), "GROUP_ROSTER_UPDATE"):
        if isinstance(step, tuple):
            fire(*step)
        else:
            fire(step)
        L.execute("BENCH.RunTimers(1)")
    L.execute("BENCH.RunTimers(3)")
    # Situations that cross: combat, an item tooltip, the world map, the minimap.
    L.execute("""
        BENCH.current = "(bench: combat)"
        BENCH.combat = true
        BENCH.Fire("PLAYER_REGEN_DISABLED")
        BENCH.Fire("UNIT_AURA", "player")
        BENCH.Fire("UNIT_SPELLCAST_SUCCEEDED", "player", "Cast-0", 6673)
        BENCH.RunTimers(1)
        BENCH.combat = false
        BENCH.Fire("PLAYER_REGEN_ENABLED")
        BENCH.current = "(bench: tooltip)"
        BENCH.tooltipLines = BENCH.Tooltip(GameTooltip, 2447)
        BENCH.current = "(bench: map)"
        local ok, err = pcall(function() WorldMapFrame:Hide() WorldMapFrame:Show() end)
        if not ok then BENCH.Error("WorldMapFrame:Show (hooks)", err) end
        BENCH.Fire("WORLD_MAP_OPEN")
        for _, f in ipairs(BENCH.frames) do
            if f.__scripts.OnUpdate and f.__shown then BENCH.Run(f, "OnUpdate", 0.1) end
        end
        BENCH.RunTimers(2)
        BENCH.current = "(bench)"
    """)
    for n in order:
        if addons[n]["meta"].get("LoadOnDemand", "0").strip() != "1" and not B.loaded[n]:
            B.errors[len(B.errors) + 1] = L.table(n, "load", "not loaded")

    return report(L, B, addons, order, extra_names, compile_errors, locale)


def lua_list(t):
    out, i = [], 1
    while t is not None and t[i] is not None:
        out.append(t[i])
        i += 1
    return out


def report(L, B, addons, order, extra_names, compile_errors, locale):
    lines = [f"## Client {locale}", ""]
    loaded = [n for n in order if B.loaded[n]]
    lines.append(f"Chargés : {len(loaded)} sur {len(order)} ({', '.join(n for n in order if not B.loaded[n]) or 'tous'} non chargés)")
    lines.append(f"Fonctions documentées installées : {B.apiFunctions}")
    lines.append("")
    errs = lua_list(B.errors)
    by_addon = {}
    for e in errs:
        by_addon.setdefault(e[1], []).append((e[2], e[3]))
    bad = len(compile_errors)
    lines.append(f"### Erreurs ({len(errs)}, compilation : {len(compile_errors)})")
    for c in compile_errors:
        lines.append(f"- COMPILATION {c}")
    for addon, items in sorted(by_addon.items()):
        if addon not in extra_names and not addon.startswith("(") and addon in addons:
            bad += len(items)
        seen = {}
        for where, msg in items:
            first = msg.split("\n")[0][:300]
            seen[(where, first)] = seen.get((where, first), 0) + 1
        for (where, first), n in seen.items():
            lines.append(f"- {addon}{' (candidat)' if addon in extra_names else ''} [{where}]{' x' + str(n) if n > 1 else ''} : {first}")
    lines.append("")

    lines.append("### Globals écrits par plusieurs addons")
    shared = []
    for k in lua_list(B.globalOrder):
        gt = B.globals[k]
        who = [w for w in gt.keys() if w != "__n" and not str(w).startswith("(")]
        if len(who) > 1:
            shared.append(f"- `{k}` : {', '.join(sorted(who))}")
    lines += shared or ["- aucun"]
    lines.append("")

    lines.append("### Commandes slash")
    slash = {}
    for k in lua_list(B.globalOrder):
        if k.startswith("SLASH_"):
            gt = B.globals[k]
            who = [w for w in gt.keys() if w != "__n"]
            v = L.globals()[k]
            slash.setdefault(str(v).lower(), []).append((", ".join(who), k))
    for cmd, rows in sorted(slash.items()):
        flag = " **EN DOUBLE**" if len({r[0] for r in rows}) > 1 else ""
        lines.append(f"- `{cmd}` : {'; '.join(r[0] for r in rows)}{flag}")
    lines.append("")

    def rows_of(t, fmt):
        return [fmt(r) for r in lua_list(t)]

    lines.append("### Variables de console écrites (SetCVar)")
    lines += sorted(set(rows_of(B.cvarsSet, lambda r: f"- {r[1]} : `{r[2]}` = {r[3]}"))) or ["- aucune"]
    lines.append("")
    lines.append("### Fonctions de Blizzard réécrites (global du jeu, ou méthode d'un cadre du jeu)")
    lines += sorted(set(rows_of(B.replaced, lambda r: f"- {r[1]} : `{r[2]}`"))) or ["- aucune"]
    lines.append("")
    lines.append("### hooksecurefunc")
    hooks = {}
    for r in lua_list(B.hooks):
        hooks.setdefault(r[2], set()).add(r[1])
    for target, who in sorted(hooks.items()):
        lines.append(f"- `{target}` : {', '.join(sorted(who))}{' **(plusieurs)**' if len(who) > 1 else ''}")
    lines.append("")
    lines.append("### Scripts accrochés aux cadres du jeu ou d'un autre addon (HookScript)")
    sh = {}
    for r in lua_list(B.scriptHooks):
        sh.setdefault(f"{r[2]}:{r[3]}", set()).add(r[1])
    for target, who in sorted(sh.items()):
        lines.append(f"- `{target}` : {', '.join(sorted(who))}{' **(plusieurs)**' if len(who) > 1 else ''}")
    lines.append("")
    lines.append("### Infobulles (TooltipDataProcessor)")
    tc = {}
    for r in lua_list(B.tooltipCalls):
        tc.setdefault(r[1], []).append(str(r[2]))
    for addon, kinds in sorted(tc.items()):
        lines.append(f"- {addon} : {', '.join(kinds)}")
    lines.append(f"- infobulle d'objet de test : {B.tooltipLines} lignes")
    lines.append("")
    lines.append("### Raccourcis clavier posés par le code")
    lines += sorted(set(rows_of(B.bindings, lambda r: f"- {r[1]} : {r[2]} -> {r[3]}"))) or ["- aucun"]
    lines.append("")
    lines.append("### Événements")
    for addon in sorted(k for k in B.events.keys()):
        evs = sorted(B.events[addon].keys())
        lines.append(f"- {addon} ({len(evs)}) : {', '.join(evs[:60])}{' …' if len(evs) > 60 else ''}")
    lines.append("")
    lines.append("### LibStub")
    libs = L.eval("""function()
        local out = {}
        local ls = rawget(_G, "LibStub")
        if not ls then return out end
        for name, lib in pairs(ls.libs or {}) do out[#out + 1] = name .. " = " .. tostring((ls.minors or {})[name]) end
        table.sort(out)
        return out
    end""")()
    lines += [f"- {x}" for x in lua_list(libs)] or ["- aucune"]
    lines.append("")
    return lines, bad


if __name__ == "__main__":
    LOCALE = "frFR"
    main()
