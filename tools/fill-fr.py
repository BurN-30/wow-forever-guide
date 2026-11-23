"""Fill the empty French texts of pack/locales/frFR from a JSON dictionary
(English -> French). Only `""` values are filled; every {kind:id} token of the
English must be in the French, except the places Polestar_frFR has no French name for
(NO_FRENCH below: the French text writes the place's French name instead of its token, so
the client does not show it in English). Usage: python tools/fill-fr.py tools/fr-texts.json [more.json]
"""
import json, pathlib, re, sys

base = pathlib.Path(__file__).resolve().parent.parent / "pack" / "locales" / "frFR"
# Places (game objects naming an area) with no French name in Polestar_frFR/Names.lua, or a name
# whose article would be doubled ("dans la {object:32372}" for "La Grande Forge"): written in French.
NO_FRENCH = {f"{{object:{i}}}" for i in (
    81, 1162, 1680, 1772, 2159, 3204, 19844, 32377, 142345, 142475, 142476, 149024, 151976, 152576, 164911,
    170558, 170559, 170570, 170571, 171531, 174825, 175434, 175435, 175438, 175449, 175462, 175564, 175621,
    176907, 176945, 176948, 178905, 179746, 171709, 32372, 131474)}
fr = {}
for f in sys.argv[1:]:
    fr.update(json.loads(pathlib.Path(f).read_text(encoding="utf-8")))
tok = re.compile(r"\{[a-z]+:\d+\}")
for k, v in fr.items():
    need = sorted(t for t in tok.findall(k) if t not in NO_FRENCH)
    have = sorted(t for t in tok.findall(v) if t not in NO_FRENCH)
    assert need == have, f"tokens differ: {k!r}"
def lua(s):
    return s.replace("\\", "\\\\").replace('"', '\\"').replace("\n", "\n")
line = re.compile(r'^(\t\["(.*)"\] = )""(,)$')
filled = 0
for p in sorted(base.rglob("*.lua")):
    out = []
    for l in p.read_text(encoding="utf-8").split("\n"):
        m = line.match(l)
        if m:
            key = m.group(2).replace('\\"', '"').replace("\n", "\n").replace("\\\\", "\\")
            if key in fr:
                l = f'{m.group(1)}"{lua(fr[key])}"{m.group(3)}'
                filled += 1
        out.append(l)
    p.write_text("\n".join(out), encoding="utf-8", newline="\n")
print("filled", filled)
