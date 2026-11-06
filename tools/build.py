"""Build the `addons` folder the installer copies.

  python tools/build.py <forge.exe> <polestar checkout with data/forever> <Polestar release folder>

1. forge guide lint, then forge guide compile of pack/ (Polestar's guides as context);
2. addons/ = the Polestar release (unzipped Polestar-<version>.zip, unchanged),
   the compiled pack (PolestarPack_GroupeAlliance and its _frFR texts addon)
   and the companion addon addons-src/GroupeAlliance.
"""
import pathlib, shutil, subprocess, sys

forge, root, release = sys.argv[1], sys.argv[2], pathlib.Path(sys.argv[3])
repo = pathlib.Path(__file__).resolve().parent.parent
pack = repo / "pack"
addons = repo / "addons"

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
shutil.copytree(repo / "addons-src" / "GroupeAlliance", addons / "GroupeAlliance")
print("addons:", ", ".join(sorted(p.name for p in addons.iterdir())))
