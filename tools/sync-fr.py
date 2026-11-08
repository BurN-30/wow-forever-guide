"""Regenerate the French texts files of the pack (forge i18n guides sync frFR).

Since 0.6.0 the pack's last guide has no `next` into Polestar's own guides, so the pack
compiles alone and the sync needs nothing set aside.
Usage: python tools/sync-fr.py <forge.exe> <polestar checkout with data/forever>
"""
import pathlib, subprocess, sys

forge, root = sys.argv[1], sys.argv[2]
pack = pathlib.Path(__file__).resolve().parent.parent / "pack"
r = subprocess.run([forge, "i18n", "guides", "sync", "frFR", "--pack", str(pack), "--root", root],
                   cwd=pack, capture_output=True, text=True, encoding="utf-8", errors="replace")
print((r.stdout + r.stderr).strip())
sys.exit(r.returncode)
