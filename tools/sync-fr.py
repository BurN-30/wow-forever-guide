"""Regenerate the French texts files of the pack (forge i18n guides sync frFR).

forge compiles the pack alone for the sync, so the cross-pack `next` of the last
guide (a Polestar guide) is set aside for the time of the sync, then put back.
Usage: python tools/sync-fr.py <forge.exe> <polestar checkout with data/forever>
"""
import pathlib, subprocess, sys

forge, root = sys.argv[1], sys.argv[2]
pack = pathlib.Path(__file__).resolve().parent.parent / "pack"
last = pack / "guides" / "12-dalaran.guide"
text = last.read_text(encoding="utf-8")
line = "next forever/alliance/30-40/01-hillsbrad-foothills\n"
assert line in text
last.write_text(text.replace(line, "# next set aside for the sync\n"), encoding="utf-8", newline="\n")
try:
    r = subprocess.run([forge, "i18n", "guides", "sync", "frFR", "--pack", str(pack), "--root", root],
                       cwd=pack, capture_output=True, text=True, encoding="utf-8", errors="replace")
    print((r.stdout + r.stderr).strip())
finally:
    last.write_text(text, encoding="utf-8", newline="\n")
