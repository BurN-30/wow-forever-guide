"""Contrôle des chapitres du paquet face au parcours Alliance de Polestar (depuis la 0.13.0).

  python tools/check-chapitres.py [--detail]

Remplace check-donjons.py et check-prereqs.py, qui suivaient les guides de parcours du paquet
(retirés en 0.13.0). Lit les guides compilés de addons/ (ceux de Polestar et ceux du paquet,
tools/polestar_guides.py) et la table des chapitres (addons-src/GroupeAlliance/GreffeData.lua).

Pour chaque chapitre et chaque race de l'Alliance (Humain, Nain, Gnome, Elfe de la nuit ; classe
guerrier, sans quête de classe dans les chapitres), le parcours de Polestar est suivi depuis le
départ de la race jusqu'à l'étape de la première accroche du chapitre, comprise (étapes `when
dungeon` laissées : désactivées dans Polestar 0.4.2.2), ou jusqu'à la première étape au niveau
minimal du chapitre quand l'accroche vient avant (il attend alors ce niveau). Une étape à question
de groupe (`when
group`) ou un objectif facultatif compte comme « peut-être fait ». Puis le chapitre est suivi
dans l'ordre de ses étapes.

Échecs (code de sortie 1) :
- le guide du chapitre manque au paquet, ou son accroche n'est sur le parcours d'aucune race ;
- une quête prise par le chapitre (non facultative, hors étape à condition) a un prérequis
  (`pre` : l'un d'eux suffit, `preAll` : tous, ceux que Polestar applique) qui n'est rendu ni par
  le parcours avant l'accroche, ni plus tôt dans le chapitre ;
- une quête du chapitre (prise ou rendue, non facultative) est déjà rendue par le parcours
  avant l'accroche, hors les quêtes d'accroche elles-mêmes ;
- le journal dépasse 40 quêtes (limite du client Forever, comme Polestar : Core/Compat.lua
  GetLogCap) : quêtes en cours à l'accroche, questions de groupe comprises, plus le plus haut
  atteint pendant le chapitre ;
- la fin du chapitre ne peut pas se juger sur des rendus : aucun rendu non facultatif (sauf le
  rendez-vous, kind "meeting", qui se finit par sa ligne cochée), ou un rendu non facultatif d'une
  quête que ni le chapitre (prise non facultative) ni le parcours (journal à l'accroche) ne
  donne : l'onglet ne se fermerait jamais tout seul.
Alertes (sans échec) : prérequis rendu seulement sur une réponse de groupe, ou manquant pour une
prise facultative ou sous condition ; quête du chapitre peut-être rendue par le parcours ; rendus
dans une partie à question de groupe (la fin passe alors par GUIDE_COMPLETED si la partie est
passée).
"""
import sys

import polestar_guides as pg

LOG_CAP = 40
CLASS = "Warrior"
COND = {"onquest", "turnedin", "complete", "available", "done", "has", "group", "level"}


def quests(v):
    if v is None:
        return []
    return [int(x) for x in (v if isinstance(v, list) else [v]) if isinstance(x, (int, float))]


def kinds(step):
    return {p.get("k") for p in step.get("when") or []}


def route_state(route, entry, race):
    """Walk Polestar's route up to the first hook step (included), or on to the first step at the
    chapter's min level when the hook comes earlier (the chapter waits for that level-up).
    -> (hook (guide, step, level) | None, offer (guide, step, level) | None, done_sure, done_maybe, log)"""
    tin, acc = set(entry["turnin"]), set(entry["accept"])
    sure, maybe, log = set(), set(), []
    hook = offer = None
    for gid, i, lv, step in route:
        if hook and lv >= entry["min"]:
            offer = (gid, i, lv)
            break
        if pg.is_dungeon_step(step) or not pg.step_applies(step, race, CLASS):
            continue
        group = "group" in kinds(step)
        hit = False
        for goal in step["goals"]:
            q = goal.get("quest")
            if not isinstance(q, (int, float)) or not pg.step_applies(goal, race, CLASS):
                continue
            q = int(q)
            t = goal.get("t")
            unsure = group or goal.get("optional")
            if t == "accept":
                if q not in sure and q not in log:
                    log.append(q)
                if q in acc:
                    hit = True
            elif t == "turnin":
                if q in log:
                    log.remove(q)
                (maybe if unsure else sure).add(q)
                if q in tin or q in acc:
                    hit = True
            elif t == "abandon" and q in log:
                log.remove(q)
        if hit and not hook:
            hook = (gid, i, lv)
            if lv >= entry["min"] - 0.5:
                offer = hook
                break
    return hook, offer or hook, sure, maybe - sure, log


def check_chapter(guides, entry, race, out):
    """Appends (level, text) to out: level "fail", "warn" or "info". -> facts for the report"""
    g = guides.get(entry["id"])
    if not g:
        out.append(("fail", f"guide {entry['id']} absent du paquet compilé"))
        return None
    route = pg.alliance_route(guides, race)
    hook, offer, sure, maybe, log = route_state(route, entry, race)
    if not hook:
        out.append(("warn" if race != "Human" else "fail", f"{race} : accroche absente du parcours ({entry['turnin'] + entry['accept']})"))
        return None
    hooks = set(entry["turnin"]) | set(entry["accept"])
    chapter_done, chapter_log, peak = set(), set(log), len(log)
    accepted_firm = set()
    handins = []
    for n, step in enumerate(g["steps"], 1):
        k = kinds(step)
        cond = bool(k & COND)
        for goal in step["goals"]:
            q = goal.get("quest")
            if not isinstance(q, (int, float)):
                continue
            q, t, opt = int(q), goal.get("t"), bool(goal.get("optional"))
            where = f"étape {n} « {step['title']} »"
            if t == "accept":
                if not opt and not cond:
                    accepted_firm.add(q)
                elif not opt:
                    accepted_firm.add(q)  # under a condition the step itself names (onquest, available...)
                for p in quests(goal.get("preAll")):
                    if p in sure or p in chapter_done:
                        continue
                    lvl = "warn" if (opt or cond or p in maybe) else "fail"
                    out.append((lvl, f"{race} : {where} : prise de {q} avant son prérequis {p}" + (" (rendu seulement sur une réponse de groupe)" if p in maybe else "")))
                anyof = quests(goal.get("pre"))
                if anyof and not any(p in sure or p in chapter_done for p in anyof):
                    lvl = "warn" if (opt or cond or any(p in maybe for p in anyof)) else "fail"
                    out.append((lvl, f"{race} : {where} : prise de {q} sans aucun de ses prérequis {anyof}"))
                if q not in chapter_log and q not in sure:
                    chapter_log.add(q)
                    peak = max(peak, len(chapter_log))
            elif t == "turnin":
                chapter_log.discard(q)
                chapter_done.add(q)
                if not opt:
                    handins.append((q, n, step["title"], "group" in k))
            if q in sure and q not in hooks and not opt and t in ("accept", "turnin"):
                out.append(("fail" if not cond else "warn", f"{race} : {where} : {t} {q}, déjà rendue par le parcours avant l'accroche"))
            elif q in maybe and q not in hooks and t in ("accept", "turnin"):
                out.append(("warn", f"{race} : {where} : {t} {q}, peut-être rendue par le parcours (réponse de groupe)"))
    if peak > LOG_CAP:
        out.append(("fail", f"{race} : journal à {peak} quêtes pendant le chapitre ({len(log)} à l'accroche), au-delà de {LOG_CAP}"))
    if not handins and entry.get("kind") != "meeting":
        out.append(("fail", "aucun rendu non facultatif : la fin du chapitre ne peut pas se juger sur des rendus"))
    for q, n, title, grp in handins:
        if q not in accepted_firm and q not in log and q not in sure and q not in maybe:
            out.append(("fail", f"{race} : étape {n} « {title} » : rendu de {q}, quête que ni le chapitre ni le parcours ne donne : l'onglet ne se fermerait pas tout seul"))
    if any(grp for *_, grp in handins):
        out.append(("info", "rendus dans des parties à question de groupe : une partie passée laisse la fin à GUIDE_COMPLETED"))
    return {"hook": hook, "offer": offer, "log": len(log), "peak": peak, "handins": [q for q, *_ in handins]}


def main():
    sys.stdout.reconfigure(encoding="utf-8")
    detail = "--detail" in sys.argv
    guides = pg.load()
    table, _ = pg.greffe()
    fails = warns = 0
    for entry in table:
        out, facts = [], None
        for race in pg.STARTS:
            f = check_chapter(guides, entry, race, out)
            if race == "Human":
                facts = f
        seen, rows = set(), []
        for lvl, text in out:
            key = (lvl, text.split(" : ", 1)[-1])
            if key in seen:
                continue
            seen.add(key)
            rows.append((lvl, text))
        nf = sum(1 for lvl, _ in rows if lvl == "fail")
        nw = sum(1 for lvl, _ in rows if lvl == "warn")
        fails, warns = fails + nf, warns + nw
        head = f"{entry['key']:12} {entry['id']}"
        if facts:
            gid, step, lv = facts["hook"]
            head += f" : accroche {gid.split('/', 2)[-1]} étape {step} (vers {lv:.0f})"
            if facts["offer"] != facts["hook"]:
                gid, step, lv = facts["offer"]
                head += f", proposé au niveau {entry['min']} ({gid.split('/', 2)[-1]} étape {step} sur le parcours)"
            head += (f", fourchette {entry['min']}-{entry['max']},"
                     f" journal {facts['log']} à l'accroche, {facts['peak']} au plus, fin sur {len(facts['handins'])} rendus")
        print(head + (" : OK" if not nf else f" : {nf} ÉCHEC(S)") + (f", {nw} alerte(s)" if nw else ""))
        for lvl, text in rows:
            if lvl == "fail" or detail:
                print(f"    {'ÉCHEC' if lvl == 'fail' else 'alerte' if lvl == 'warn' else 'note'} : {text}")
    print(f"Chapitres : {len(table)}, {fails} échec(s), {warns} alerte(s)" + ("" if detail else " (--detail pour les alertes)"))
    sys.exit(1 if fails else 0)


if __name__ == "__main__":
    main()
