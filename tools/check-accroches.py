"""Contrôle des points d'accroche des chapitres sur le parcours Alliance de Polestar.

  python tools/check-accroches.py

À lancer à chaque nouvelle version de Polestar (tools/build.py le lance à chaque construction) :
Polestar retire ou déplace des quêtes d'une version à l'autre, et un chapitre dont l'accroche
n'existe plus ne serait jamais proposé, sans aucune erreur en jeu.

Lit les guides compilés de addons/ (tools/polestar_guides.py), la table des chapitres
(addons-src/GroupeAlliance/GreffeData.lua) et les clés de donjon du codex de Polestar
(addons/Polestar_Codex/Dungeons1.lua). Pour chaque entrée, sur le parcours de chaque race de
l'Alliance (départ, puis les guides par `next`, étapes `when dungeon` laissées), la première étape
qui rend une quête de `turnin` ou prend ou rend une quête de `accept`, et son niveau estimé (la
fourchette de niveaux du guide répartie sur ses étapes, à un niveau près).

Échecs (code de sortie 1), chacun avec ce qu'il faut faire :
- le guide du chapitre manque au paquet ;
- l'accroche n'est plus sur le parcours de l'humain (alerte seulement pour une autre race) ;
- l'accroche arrive au-dessus du niveau maximal de l'entrée : le chapitre ne serait jamais proposé ;
- le champ `route` de l'entrée ne nomme plus le guide de la première accroche (il sert au moteur à
  savoir si l'accroche est encore devant le joueur) ;
- une clé `dungeon` n'est plus dans le codex de Polestar (sa carte ne serait plus tenue).
Notes : accroche atteinte sous le niveau minimal (le chapitre attend ce niveau) ; quête `done`
absente du guide du chapitre.
"""
import re
import sys

import polestar_guides as pg


def codex_keys():
    text = (pg.ADDONS / "Polestar_Codex" / "Dungeons1.lua").read_text(encoding="utf-8")
    return set(re.findall(r"\d+:([a-z][a-z0-9-]+)", text))


def first_hook(route, entry, race):
    tin, acc = set(entry["turnin"]), set(entry["accept"])
    for gid, i, lv, step in route:
        if pg.is_dungeon_step(step) or not pg.step_applies(step, race):
            continue
        for goal in step["goals"]:
            q = goal.get("quest")
            if not isinstance(q, (int, float)):
                continue
            q, t = int(q), goal.get("t")
            if (t == "turnin" and q in tin) or (t in ("accept", "turnin") and q in acc):
                return gid, i, lv, t, q, step["title"]
    return None


def main():
    sys.stdout.reconfigure(encoding="utf-8")
    guides = pg.load()
    table, retired = pg.greffe()
    keys = codex_keys()
    routes = {race: pg.alliance_route(guides, race) for race in pg.STARTS}
    fails = 0
    print(f"Parcours Alliance de Polestar : {len(routes['Human'])} étapes depuis le départ humain, jusqu'à {routes['Human'][-1][0]}")
    for entry in table:
        msgs = []
        chapter = guides.get(entry["id"])
        if not chapter:
            msgs.append(("fail", f"guide {entry['id']} absent du paquet compilé"))
        found = {race: first_hook(routes[race], entry, race) for race in pg.STARTS}
        human = found["Human"]
        for race, f in found.items():
            if not f:
                msgs.append(("fail" if race == "Human" else "warn",
                             f"{race} : aucune étape du parcours ne rend {entry['turnin']} ni ne prend {entry['accept']} : choisir une autre accroche dans GreffeData.lua"))
        if human:
            gid, step, lv, t, q, title = human
            if lv > entry["max"] + 0.5:
                msgs.append(("fail", f"accroche vers le niveau {lv:.0f}, au-dessus du maximum {entry['max']} : le chapitre ne serait jamais proposé"))
            if lv < entry["min"] - 0.5:
                msgs.append(("note", f"accroche vers {lv:.0f}, sous le minimum {entry['min']} : proposé au passage du niveau {entry['min']}"))
            if entry.get("route") != gid:
                msgs.append(("fail", f"champ route « {entry.get('route')} » : la première accroche est maintenant dans {gid} (étape {step}) : mettre ce guide dans `route`"))
        for d in entry["dungeon"]:
            if d not in keys:
                msgs.append(("fail", f"clé de donjon « {d} » absente du codex de Polestar : la reprendre de Polestar_Codex/Dungeons1.lua"))
        if chapter:
            own = {int(g["quest"]) for s in chapter["steps"] for g in s["goals"] if isinstance(g.get("quest"), (int, float))}
            for q in entry["done"]:
                if q not in own:
                    msgs.append(("note", f"quête done {q} absente du guide du chapitre"))
        nf = sum(1 for m in msgs if m[0] == "fail")
        fails += nf
        where = "-"
        if human:
            gid, step, lv, t, q, title = human
            where = f"{t} {q} : {gid.split('/', 2)[-1]} étape {step} « {title} », vers {lv:.0f}"
        print(f"{entry['key']:12} {entry['min']:2}-{entry['max']:2}  {where}" + ("" if not nf else f"  ({nf} ÉCHEC(S))"))
        for lvl, text in msgs:
            print(f"    {'ÉCHEC' if lvl == 'fail' else 'alerte' if lvl == 'warn' else 'note'} : {text}")
    known = set(guides)
    back = [r for r in retired if r in known]
    if back:
        print(f"ÉCHEC : guides retirés (GA.RETIRED) encore présents : {back}")
        fails += len(back)
    print(f"Accroches : {len(table)} entrées, {fails} échec(s)")
    sys.exit(1 if fails else 0)


if __name__ == "__main__":
    main()
