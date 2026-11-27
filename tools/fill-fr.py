"""Fill the empty French texts of pack/locales/frFR from a JSON dictionary
(English -> French). Only `""` values are filled, and only with a French that keeps every
{kind:id} token of the English, as many times. 0.14.0: the forge (0.2.0) drops a translation that
leaves a token out ("the translation leaves out {object:N}; it is left out, the English shows"),
so writing a place's French name instead of its token (the NO_FRENCH list of 0.6.0 to 0.13.1) made
the whole text show in English: a place Polestar_frFR has no French name for keeps its token, the
French words before it in brackets if wanted ("la Colline des sentinelles ({object:81})").
A text whose key has a line break is matched too. Usage: python tools/fill-fr.py tools/fr-texts.json [more.json]
"""
import json, pathlib, re, sys
from collections import Counter

base = pathlib.Path(__file__).resolve().parent.parent / "pack" / "locales" / "frFR"
fr = {}
for f in sys.argv[1:]:
    fr.update(json.loads(pathlib.Path(f).read_text(encoding="utf-8")))
tok = re.compile(r"\{[a-z]+:\d+\}")


def lua(s):
    return s.replace("\\", "\\\\").replace('"', '\\"').replace("\n", "\\n")


line = re.compile(r'^(\t\["(.*)"\] = )""(,)$')
filled, refused = 0, []
for p in sorted(base.rglob("*.lua")):
    out = []
    for l in p.read_text(encoding="utf-8").split("\n"):
        m = line.match(l)
        if m:
            key = m.group(2).replace("\\n", "\n").replace('\\"', '"').replace("\\\\", "\\")
            if key in fr:
                if Counter(tok.findall(key)) != Counter(tok.findall(fr[key])):
                    refused.append(key)
                else:
                    l = f'{m.group(1)}"{lua(fr[key])}"{m.group(3)}'
                    filled += 1
        out.append(l)
    p.write_text("\n".join(out), encoding="utf-8", newline="\n")
for k in refused:
    print("NOT FILLED, tokens differ (the forge would drop it):", k[:100])
print("filled", filled)
sys.exit(1 if refused else 0)
