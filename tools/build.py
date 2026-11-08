"""Build the `addons` folder the installer copies.

  python tools/build.py <forge.exe> <polestar checkout with data/forever> <Polestar release folder>

1. forge guide lint, then forge guide compile of pack/ (Polestar's guides as context);
2. addons/ = the Polestar release (unzipped Polestar-<version>.zip) and the compiled
   pack (PolestarPack_GroupeAlliance and its _frFR texts addon);
3. the Groupe Alliance module (addons-src/GroupeAlliance) goes inside Polestar's own
   folder, so there is no extra addon to tick: its files are added to Polestar.toc and
   UI/GuideFrame.lua gets the gear, "?" help and "_" reduce buttons at the tab strip's
   right end (POLESTAR_CHANGES below, each applied exactly once or the build stops). Polestar is GPL-3.0: the changed files say so.
"""
import pathlib, shutil, subprocess, sys

forge, root, release = sys.argv[1], sys.argv[2], pathlib.Path(sys.argv[3])
repo = pathlib.Path(__file__).resolve().parent.parent
pack = repo / "pack"
addons = repo / "addons"
MODULE = ["Reliability.lua", "Tips.lua", "GroupeAlliance.lua"]
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
    ("README.txt", "Leveling guides for World of Warcraft: Forever.\r\n",
     "Leveling guides for World of Warcraft: Forever.\r\n\r\n"
     + NOTICE + ": the GroupeAlliance folder (Wowhead links,\r\n"
     "quest tips, calm defaults) is loaded by Polestar.toc, and UI/GuideFrame.lua\r\n"
     "has gear, \"?\" help and \"_\" reduce buttons. Everything else is Polestar 0.3.4 as released.\r\n"),
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
if addons.exists():
    shutil.rmtree(addons)
addons.mkdir()
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
