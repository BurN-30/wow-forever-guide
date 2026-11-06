"""Fill the empty French texts of pack/locales/frFR from a JSON dictionary
(English -> French). Only `""` values are filled; every {kind:id} token of the
English must be in the French. Usage: python tools/fill-fr.py tools/fr-texts.json [more.json]
"""
import json, pathlib, re, sys

base = pathlib.Path(__file__).resolve().parent.parent / "pack" / "locales" / "frFR"
fr = {}
for f in sys.argv[1:]:
    fr.update(json.loads(pathlib.Path(f).read_text(encoding="utf-8")))
tok = re.compile(r"\{[a-z]+:\d+\}")
for k, v in fr.items():
    assert sorted(tok.findall(k)) == sorted(tok.findall(v)), f"tokens differ: {k!r}"
def lua(s):
    return s.replace("\\", "\\\\").replace('"', '\\"').replace("\n", "\\n")
line = re.compile(r'^(\t\["(.*)"\] = )""(,)$')
filled = 0
for p in sorted(base.rglob("*.lua")):
    out = []
    for l in p.read_text(encoding="utf-8").split("\n"):
        m = line.match(l)
        if m:
            key = m.group(2).replace('\\"', '"').replace("\\n", "\n").replace("\\\\", "\\")
            if key in fr:
                l = f'{m.group(1)}"{lua(fr[key])}"{m.group(3)}'
                filled += 1
        out.append(l)
    p.write_text("\n".join(out), encoding="utf-8", newline="\n")
print("filled", filled)
