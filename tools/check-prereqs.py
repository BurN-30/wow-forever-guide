"""Audit des prérequis du guide Groupe Alliance.

Parcourt pack/guides dans l'ordre de jeu, une fois par race (01-depart-<race> puis 02 à la fin),
et signale :
- une quête prise (accept) alors qu'un de ses prérequis n'est pas encore rendu (`pre` : l'un d'eux suffit, `preAll` : tous, comme Polestar) ;
- une quête prise alors qu'une quête qui l'exclut (closedBy) a déjà été prise ou rendue ;
- un rendu (turnin) d'une quête jamais prise ;
- une quête prise deux fois.

Les prérequis et exclusions viennent du guide compilé (pack/dist/PolestarPack_GroupeAlliance/Guides.lua),
c'est-à-dire des données Forever utilisées par forge. Une quête prise par une autre voie que `accept`
(objet qui démarre une quête, etc.) peut donner une fausse alerte : la vérifier à la main.

Usage : python tools/check-prereqs.py
"""
import re
import sys
from pathlib import Path

RACINE = Path(__file__).resolve().parent.parent
GUIDES = RACINE / "pack" / "guides"
DIST = RACINE / "pack" / "dist" / "PolestarPack_GroupeAlliance" / "Guides.lua"


def liste(txt):
    return [int(x) for x in re.findall(r"\d+", txt or "")]


def donnees():
    """quête -> (pre, closedBy, titre) d'après les étapes accept du guide compilé."""
    info = {}
    for ligne in DIST.read_text(encoding="utf-8").splitlines():
        m = re.search(r't = "accept", quest = (\d+), title = "((?:[^"\\]|\\.)*)"', ligne)
        if not m:
            continue
        q = int(m.group(1))
        pre = re.search(r"\bpre = \{([^}]*)\}", ligne)
        tous = re.search(r"\bpreAll = \{([^}]*)\}", ligne)
        clos = re.search(r"\bclosedBy = \{([^}]*)\}", ligne)
        info[q] = (liste(pre and pre.group(1)), liste(clos and clos.group(1)), m.group(2), liste(tous and tous.group(1)))
    return info


RACES = {"Human", "Dwarf", "Gnome", "NightElf", "Skyborne", "Draenei", "Worgen", "HighElf"}
RACE_DU_DEPART = {"humain": "Human", "nain": "Dwarf", "gnome": "Gnome", "elfe-de-la-nuit": "NightElf"}


def etapes(fichier, race):
    """(action, quête, ligne) des prises et rendus qui valent pour cette race. Les lignes réservées
    à une classe (`only Warrior`...) sont ignorées : elles ne valent pas pour tout le groupe."""
    for n, ligne in enumerate(fichier.read_text(encoding="utf-8").splitlines(), 1):
        m = re.match(r"\s*(accept|turnin)\s+(\d+)\b", ligne)
        if not m:
            continue
        seul = re.search(r"\bonly ([A-Za-z,]+)", ligne.split("--")[0])
        if seul:
            noms = set(seul.group(1).split(","))
            if noms - RACES:
                continue
            if race not in noms:
                continue
        yield m.group(1), int(m.group(2)), n


def main():
    info = donnees()
    tous = sorted(GUIDES.glob("*.guide"))
    departs = [f for f in tous if f.name.startswith("01-")]
    # Après les départs, l'ordre du jeu : la chaîne des `next` depuis le Groupe 1 (0.11.0 ;
    # avant, l'ordre des noms de fichiers, qui mettait le 11 avant le 10 et le 10b).
    par_id = {}
    for f in tous:
        m = re.search(r"^guide (\S+)", f.read_text(encoding="utf-8"), re.M)
        n = re.search(r"^next (\S+)", f.read_text(encoding="utf-8"), re.M)
        par_id[m.group(1)] = (f, n.group(1).rstrip(",") if n else None)
    suite, gid = [], "groupe-alliance/02-rendez-vous-hurlevent"
    while gid in par_id and par_id[gid][0] not in suite:
        suite.append(par_id[gid][0])
        gid = par_id[gid][1]
    suite += [f for f in tous if not f.name.startswith("01-") and f not in suite]  # hors parcours (Solo)
    alertes = {}
    for depart in departs:
        pris, rendus = set(), set()
        for f in [depart] + suite:
            for action, q, n in etapes(f, RACE_DU_DEPART[depart.name[10:-6]]):
                lieu = f"{f.name}:{n}"
                titre = info.get(q, ((), (), "?", ()))[2]
                if action == "accept":
                    # Comme Polestar (Core/Engine.lua, Own.preBlocked) : `pre` = l'un d'eux suffit, `preAll` = tous.
                    pre, clos, _, tous = info.get(q, ((), (), "?", ()))
                    manque = [p for p in tous if p not in rendus]
                    if pre and not any(p in rendus for p in pre):
                        manque += [p for p in pre]
                    if manque:
                        alertes.setdefault((lieu, q, f"prérequis non rendu : {manque}"), set()).add(depart.name)
                    deja = [c for c in clos if c in pris or c in rendus]
                    if deja:
                        alertes.setdefault((lieu, q, f"exclue par une quête déjà prise : {deja}"), set()).add(depart.name)
                    if q in pris or q in rendus:
                        alertes.setdefault((lieu, q, "prise deux fois"), set()).add(depart.name)
                    pris.add(q)
                else:
                    if q not in pris:
                        alertes.setdefault((lieu, q, "rendue sans avoir été prise"), set()).add(depart.name)
                    pris.discard(q)
                    rendus.add(q)
    races = {d.name for d in departs}
    for (lieu, q, quoi), qui in sorted(alertes.items()):
        titre = info.get(q, ((), (), "?", ()))[2]
        portee = "toutes les races" if qui == races else ", ".join(sorted(x[10:-6] for x in qui))
        print(f"{lieu}\t{q} {titre}\t{quoi}\t({portee})")
    print(f"{len(alertes)} alerte(s)", file=sys.stderr)
    return 1 if alertes else 0


if __name__ == "__main__":
    sys.exit(main())
