"""Build the `addons` folder the installer copies.

  python tools/build.py <forge.exe> <polestar checkout with data/forever> <Polestar release folder>

1. forge guide lint, then forge guide compile of pack/ (Polestar's guides as context);
2. the Polestar* folders of addons/ = the Polestar release (unzipped Polestar-<version>.zip)
   and the compiled pack (PolestarPack_GroupeAlliance and its _frFR texts addon); the other
   folders (Auctionator as released, PrettyTooltip as released plus the pack patches of
   docs/prettytooltip-1.3.8.patch, BuffAlertsForever as released plus PackPatches.lua, see
   docs/buffalerts-3.11.4.patch, !BugGrabber as released, BugSack as released plus
   PackPatches.lua, see docs/bugsack-12.1.9.patch) are committed and left alone;
3. the Groupe Alliance module (addons-src/GroupeAlliance) goes inside Polestar's own
   folder, so there is no extra addon to tick: its files are added to Polestar.toc,
   UI/GuideFrame.lua gets the gear, "?" help and "_" reduce buttons at the tab strip's
   right end and the module's entry in a guide line's right-click menu, and
   Core/Automation.lua asks the module before it accepts or turns in a quest
   (POLESTAR_CHANGES below, each applied exactly once or the build stops). Polestar is GPL-3.0: the changed files say so.
"""
import pathlib, shutil, subprocess, sys

forge, root, release = sys.argv[1], sys.argv[2], pathlib.Path(sys.argv[3])
repo = pathlib.Path(__file__).resolve().parent.parent
pack = repo / "pack"
addons = repo / "addons"
MODULE = ["Reliability.lua", "Tips.lua", "Danger.lua", "GroupeAlliance.lua"]
NOTICE = "Modified by BurN-30 on 2026-11-08 (github.com/BurN-30/wow-forever-guide)"

POLESTAR_CHANGES = [
    ("Polestar.toc", "Alts\\Alts.xml\n",
     "Alts\\Alts.xml\n# " + NOTICE + ": the Groupe Alliance module.\n"
     + "".join(f"GroupeAlliance\\{f}\n" for f in MODULE)),
    ("UI/GuideFrame.lua", "\tlocal avail = F:GetWidth() - 2 - 30\n",
     "\tlocal avail = F:GetWidth() - 2 - 30 - (ns.GA and ns.GA.STRIP_W or 0) -- " + NOTICE
     + ": room for the Groupe Alliance buttons\n"),
    ("UI/GuideFrame.lua", "\thoverable(strip.Add)\n",
     "\thoverable(strip.Add)\n"
     "\t-- " + NOTICE + ": the Groupe Alliance buttons (gear, \"?\" help,\n"
     "\t-- \"_\" reduce) at the strip's right end, placed by the module.\n"
     "\tif ns.GA and ns.GA.StripButtons then\n"
     "\t\tfor _, b in ipairs(ns.GA.StripButtons(strip)) do hoverable(b) end\n"
     "\tend\n"),
    # 0.7.3: the guide line's right-click menu gets the module's entry
    # (no automation for this quest).
    ("UI/GuideFrame.lua", "\tW.ShowMenu(row, items)\n",
     "\t-- " + NOTICE + ": the Groupe Alliance entry\n"
     "\t-- (\"Don't accept or turn in automatically\" for this quest).\n"
     "\tif ns.GA and ns.GA.RowMenu then ns.GA.RowMenu(goal, items) end\n"
     "\tW.ShowMenu(row, items)\n"),
    # 0.7.3: the automation asks the module before it acts (GA.HoldsQuest: the
    # player's exceptions, group quests not answered "do"), and looks a few
    # steps ahead for a quest a party member shares (GA.AcceptSpan).
    ("Core/Automation.lua", "local function wantsAccept(q)\n\treturn q and q ~= 0 and ns.Engine.WantsQuest(\"accept\", q)\nend\n",
     "-- " + NOTICE + ": the Groupe Alliance module\n"
     "-- holds some quests back (GA.HoldsQuest: the player's exceptions, group quests\n"
     "-- not answered \"do\") and lets a quest a party member shares come from the\n"
     "-- next steps too (GA.AcceptSpan); without the module, as released.\n"
     "local function held(q)\n"
     "\tlocal GA = ns.GA\n"
     "\treturn GA and GA.HoldsQuest and GA.HoldsQuest(q) or false\n"
     "end\n\n"
     "local function wantsAccept(q, span)\n"
     "\treturn q and q ~= 0 and not held(q) and ns.Engine.WantsQuest(\"accept\", q, span)\n"
     "end\n"),
    ("Core/Automation.lua", "\treturn q and q ~= 0 and ns.Engine.WantsQuest(\"direct\", q)\n",
     "\treturn q and q ~= 0 and not held(q) and ns.Engine.WantsQuest(\"direct\", q)\n"),
    ("Core/Automation.lua", "\tif ns.Compat.IsOnQuest(q) then return ns.Engine.WantsQuest(\"turnin\", q) end\n",
     "\tif ns.Compat.IsOnQuest(q) then return not held(q) and ns.Engine.WantsQuest(\"turnin\", q) end\n"),
    ("Core/Automation.lua", "\tif not wantsAccept(q) then return false end\n",
     "\tif not wantsAccept(q, ns.GA and ns.GA.AcceptSpan and ns.GA.AcceptSpan() or 0) then return false end\n"),
    ("README.txt", "Leveling guides for World of Warcraft: Forever.\r\n",
     "Leveling guides for World of Warcraft: Forever.\r\n\r\n"
     + NOTICE + ": the GroupeAlliance folder (Wowhead links,\r\n"
     "quest tips, calm defaults, quest automation exceptions) is loaded by Polestar.toc,\r\n"
     "UI/GuideFrame.lua has gear, \"?\" help and \"_\" reduce buttons and a line menu entry,\r\n"
     "and Core/Automation.lua asks the module before it accepts or turns in a quest.\r\n"
     "Everything else is Polestar 0.3.4 as released.\r\n"),
]

def run(*args):
    r = subprocess.run([forge, *args, str(pack), "--root", root, "--quiet"], cwd=pack,
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    print((r.stdout + r.stderr).strip().splitlines()[-1])
    if r.returncode:
        print(r.stdout + r.stderr)
        sys.exit(r.returncode)

run("guide", "lint")
run("guide", "compile")
# Only the Polestar folders are rebuilt; the other addons shipped with the guide
# (Auctionator as released, PrettyTooltip with docs/prettytooltip-1.3.8.patch,
# BuffAlertsForever with docs/buffalerts-3.11.4.patch, !BugGrabber as released, BugSack
# with docs/bugsack-12.1.9.patch) are committed and stay as they are.
addons.mkdir(exist_ok=True)
for d in sorted(addons.iterdir()):
    if d.is_dir() and d.name.startswith("Polestar"):
        shutil.rmtree(d)
for d in sorted(release.iterdir()):
    if d.is_dir() and d.name.startswith("Polestar"):
        shutil.copytree(d, addons / d.name)
for d in sorted((pack / "dist").iterdir()):
    if d.is_dir():
        shutil.copytree(d, addons / d.name)

polestar = addons / "Polestar"
(polestar / "GroupeAlliance").mkdir()
for f in MODULE:
    shutil.copy2(repo / "addons-src" / "GroupeAlliance" / f, polestar / "GroupeAlliance" / f)
for name, old, new in POLESTAR_CHANGES:
    p = polestar / name
    text = p.read_bytes().decode("utf-8")
    if text.count(old) != 1:
        sys.exit(f"Polestar change not applied: {name}: {old!r} found {text.count(old)} times")
    p.write_bytes(text.replace(old, new).encode("utf-8"))
print("addons:", ", ".join(sorted(p.name for p in addons.iterdir())))
