"""Checks our French for the texts Polestar leaves in English (tools/fr-texts-polestar-manquants.json).

  python tools/check-fr-polestar.py [file.json]

Every entry is checked, English key against French value:
  - no empty French, no French left identical to the English (unless it is only names);
  - the same {kind:id} tokens, the same number of times;
  - the same formatting: line breaks, WoW escape codes (|c |r |T |t |H |h |n), format codes (%s %d);
  - no address to the player ("tu", "vous", "ton", "votre"... : the guides speak impersonally);
  - no em dash, no en dash, no replacement character, no broken UTF-8, no common word left without
    its accent, no space missing before a French colon or semicolon;
  - no key given twice in the file.
Prints each defect and the total; exits 1 when there is any.
"""
import json, pathlib, re, sys
from collections import Counter

REPO = pathlib.Path(__file__).resolve().parent.parent
DEFAULT = REPO / "tools" / "fr-texts-polestar-manquants.json"
TOKEN = re.compile(r"\{[a-z]+:\d+\}")
ESCAPE = re.compile(r"\|c[0-9a-fA-F]{8}|\|r|\|T[^|]*\|t|\|H[^|]*\|h|\|h|\|n|%[sd]")
ADDRESS = re.compile(r"(?<![\w'’-])(tu|vous|votre|vos|ton|ta|tes|te|toi|t'|t’)(?![\w'’-])|(?<=-)(toi|vous|te)\b", re.I)
# Words that a French text never writes without their accent.
UNACCENTED = [
    "deja", "apres", "tres", "pres", "ete", "etre", "meme", "memes", "premiere", "derniere", "riviere",
    "foret", "forets", "quete", "quetes", "elite", "elites", "etape", "etapes", "a cote", "jusqu'a",
    "la-bas", "au-dela", "derriere", "lacher", "lache", "lachent", "creature", "creatures", "equipe",
    "ecarlate", "acces", "succes", "frere", "fenetre", "tete", "tetes", "chene", "ile", "iles", "ecaille",
    "ecailles", "epee", "eleve", "eleves", "deuxieme", "troisieme", "quatrieme", "cinquieme", "systeme",
    "evenement", "debut", "fete", "general", "experience", "metier", "metiers", "recompense", "recompenses",
    "arriere", "entree", "entrees", "cote", "cotes", "ou aller", "a l'est", "a l'ouest", "a l'interieur",
    "interieur", "exterieur", "rendre visite a", "grace a", "proximite", "repaire",
]
UNACCENTED = [w for w in UNACCENTED if w != "repaire"]
# Case-sensitive, so that a name left in English ("General ...") is not taken for a French word; the
# words a sentence starts with are checked capitalised too.
STARTS = ["deja", "apres", "tres", "pres", "etre", "meme", "premiere", "derniere", "quete", "quetes", "etape",
          "a cote", "jusqu'a", "la-bas", "derriere", "lacher", "interieur", "a l'est", "a l'ouest", "a l'interieur"]
UNACCENTED += [w[0].upper() + w[1:] for w in STARTS]
BAD_WORD = re.compile(r"(?<![\w'’-])(" + "|".join(re.escape(w) for w in UNACCENTED) + r")(?![\w'’-])")
MOJIBAKE = re.compile("Ã.|â€|Â |�")
COLON = re.compile(r"(?<=[^\s\d}])[:;](?=\s|$)")  # a French ':' or ';' after a word wants a space


def pairs_hook(pairs):
    seen, dup = {}, []
    for k, v in pairs:
        if k in seen:
            dup.append(k)
        seen[k] = v
    if dup:
        pairs_hook.dups.extend(dup)
    return seen


pairs_hook.dups = []


def check(en, fr):
    out = []
    if not fr.strip():
        return ["empty French"]
    # A text made only of names (every word capitalised) stays in English when the game has no French
    # name for it: the player reads it so on the screen. Any other text must be translated.
    if fr == en and re.search(r"(?<![\w'])[a-z]{3,}", TOKEN.sub("", en)):
        out.append("French identical to the English")
    if Counter(TOKEN.findall(en)) != Counter(TOKEN.findall(fr)):
        out.append(f"tokens differ: {sorted(TOKEN.findall(en))} / {sorted(TOKEN.findall(fr))}")
    if en.count("\n") != fr.count("\n"):
        out.append(f"line breaks differ: {en.count(chr(10))} / {fr.count(chr(10))}")
    if Counter(ESCAPE.findall(en)) != Counter(ESCAPE.findall(fr)):
        out.append("formatting codes differ")
    for m in ADDRESS.finditer(fr):
        out.append(f"addresses the player: {m.group(0)!r}")
    if "—" in fr or "–" in fr:
        out.append("em or en dash")
    if MOJIBAKE.search(fr):
        out.append("replacement character or broken UTF-8")
    for m in BAD_WORD.finditer(fr):
        out.append(f"missing accent: {m.group(0)!r}")
    flat = TOKEN.sub("X", fr).replace("SI:7", "SI7")
    for m in COLON.finditer(flat):
        out.append(f"no space before {m.group(0)!r}: ...{flat[max(0, m.start() - 15):m.end() + 5]!r}")
    return out


def main():
    path = pathlib.Path(sys.argv[1]) if len(sys.argv) > 1 else DEFAULT
    sys.stdout.reconfigure(encoding="utf-8")
    data = json.loads(path.read_text(encoding="utf-8"), object_pairs_hook=pairs_hook)
    defects = 0
    for k in pairs_hook.dups:
        print("DUPLICATE KEY:", k[:80])
        defects += 1
    for en, fr in data.items():
        for d in check(en, fr):
            print(f"{d}\n    EN: {en[:100]!r}")
            defects += 1
    print(f"{len(data)} texts, {sum(1 for v in data.values() if v.strip())} translated, {defects} defects")
    sys.exit(1 if defects else 0)


if __name__ == "__main__":
    main()
