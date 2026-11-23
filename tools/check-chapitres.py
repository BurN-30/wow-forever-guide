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
- une étape (hors étape `along`) sans aucun objectif qui retient (que des `note` ou des objectifs
  `optional`) : Polestar la passe d'office (docs/GUIDE_FORMAT.md, « a step of optional goals only
  is done at once »), sauf exception justifiée dans SANS_OBJECTIF ci-dessous ; une prise `accept Q` sous
  `when onquest Q` (ou `complete Q`, `turnedin Q`) ne retient pas : la quête est au journal dès que
  l'étape s'applique, la prise est donc faite et l'étape passée sans que son texte soit vu. Seule est
  permise (note) l'étape « porteuse » qui ne contient que de telles prises et aucun texte (ni `tip`, ni
  `note`, ni note `--`) : la prise que demande le compilateur avant les lignes d'objectif d'une quête
  prise ailleurs ;
- un rendu `optional` : un rendu ne l'est jamais (Polestar laisse de lui-même le rendu d'une quête
  que le joueur n'a pas prise sur une prise facultative ou sous condition, et une quête qui peut ne
  pas être finie a son étape `when complete`) ;
- la fin du chapitre (GreffeData.lua, `fin`) n'est pas exactement la liste de ses rendus sans
  condition : rendus non facultatifs d'étapes sans `when`, d'une quête que le chapitre prend dans
  une étape sans `when` (prise non facultative) ou que le parcours donne sûrement avant
  l'accroche. Un rendu conditionnel (étape avec `when`, quête prise sous condition ou en
  facultatif) dans `fin` est un échec : un joueur qui ne le fait pas garderait l'onglet ouvert. Une
  liste vide est permise (fin laissée à Polestar, GUIDE_COMPLETED) seulement quand le chapitre n'a
  aucun rendu sans condition.
Alertes (sans échec) : prérequis rendu seulement sur une réponse de groupe, ou manquant pour une
prise facultative ou sous condition ; quête du chapitre peut-être rendue par le parcours ; étape
après le dernier rendu de `fin` qui n'est pas une étape de rendu à condition (l'onglet se ferme
avant elle). Notes (--detail) : les rendus conditionnels, hors de la fin (prêts dans le journal, ils
retiennent l'onglet jusqu'à leur rendu).
"""
import sys

import polestar_guides as pg

LOG_CAP = 40
CLASS = "Warrior"
COND = {"onquest", "turnedin", "complete", "available", "done", "has", "group", "level"}
# Steps with no goal that holds, allowed: (chapter key, step title as compiled) -> why. None since
# 0.13.0: each step either holds (a hand-in, a boss line, a task to tick) or is an `along` step.
SANS_OBJECTIF = {}
HOLDS_NOT = {"note"}


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
    fin = check_end(g, entry, sure | set(log), out, race)
    return {"hook": hook, "offer": offer, "log": len(log), "peak": peak, "handins": sorted(fin)}


def in_log(step):
    """Quests the step's `when` holds only with them in the log or handed in: a `onquest`, `complete` or
    `turnedin` (not `!`) naming one quest. Their `accept` is done as soon as the step applies (Polestar,
    Core/Engine.lua, goalDoneLive: an accept is done once its quest is in the log or done)."""
    out = set()
    for p in step.get("when") or []:
        qs = quests(p.get("q"))
        if not p.get("neg") and p.get("k") in ("onquest", "complete", "turnedin") and len(qs) == 1:
            out.add(qs[0])
    return out


def holds(goal, step=None):
    if goal.get("t") in HOLDS_NOT or goal.get("optional"):
        return False
    # `accept Q` under `when onquest Q`: done before the step is ever shown, it holds nothing.
    return not (step and goal.get("t") == "accept" and goal.get("quest") in in_log(step))


def has_text(step):
    """The step says something to the player: a tip, a note line, or a goal's `--` note."""
    return bool(step.get("note")) or any(x.get("t") == "note" or x.get("note") for x in step["goals"])


def carrier(step):
    """A step that only takes, for the compiler, quests its `when` already puts in the log (the accept
    the objective lines of a quest carried from elsewhere need), with no text at all: passed at once,
    nothing of it is lost."""
    goals = step["goals"]
    return bool(goals) and not has_text(step) and all(x.get("t") == "accept" and x.get("quest") in in_log(step) for x in goals)


def check_steps(g, entry, out):
    """Steps that hold nothing, and optional hand-ins (the same for every race)."""
    for n, step in enumerate(g["steps"], 1):
        if step.get("along"):
            continue
        if not any(holds(x, step) for x in step["goals"]):
            why = SANS_OBJECTIF.get((entry["key"], step["title"]))
            dead = [x.get("quest") for x in step["goals"] if x.get("t") == "accept" and x.get("quest") in in_log(step)]
            if why:
                out.append(("info", f"étape {n} « {step['title']} » sans objectif qui retient, permis : {why}"))
            elif carrier(step):
                out.append(("info", f"étape {n} « {step['title']} » : seulement la prise de {dead}, déjà au journal sous son `when` (passée d'office, sans texte : permis)"))
            elif dead:
                out.append(("fail", f"étape {n} « {step['title']} » : son seul objectif qui retiendrait est la prise de {dead}, faite dès que la quête est au journal, "
                                    f"donc dès que l'étape s'applique (`when onquest`) : Polestar la passe d'office et son texte n'est jamais affiché"))
            else:
                out.append(("fail", f"étape {n} « {step['title']} » : aucun objectif qui retient (que des notes ou des objectifs facultatifs), Polestar la passe d'office"))
        for x in step["goals"]:
            if x.get("t") == "turnin" and x.get("optional"):
                out.append(("fail", f"étape {n} « {step['title']} » : rendu de {x.get('quest')} facultatif (un rendu ne l'est jamais : étape `when complete`, ou prise facultative, à la place)"))


def takes_if_missing(step, q):
    """A step that takes quest q for whoever has not got it (`when !onquest q`, `when !turnedin q`):
    past it, every player has q or has done it."""
    preds = step.get("when") or []
    def about(p):
        qs = p.get("q")
        qs = qs if isinstance(qs, list) else [qs]
        return p.get("neg") and p.get("k") in ("onquest", "turnedin") and qs == [q]
    return bool(preds) and all(about(p) for p in preds)


def check_end(g, entry, given, out, race):
    """The chapter's end: its hand-ins without a condition, against GreffeData.lua's `fin`.
    given: quests the route surely hands over before the hook (in the log or done). -> the computed set"""
    firm, unsure = set(given), set()
    computed, conditional, last_fin = set(), {}, 0
    for n, step in enumerate(g["steps"], 1):
        cond = bool(kinds(step))
        for x in step["goals"]:
            q = x.get("quest")
            if not isinstance(q, (int, float)):
                continue
            q, t = int(q), x.get("t")
            if t == "accept":
                if (cond and not takes_if_missing(step, q)) or x.get("optional"):
                    if q not in firm:
                        unsure.add(q)
                else:
                    firm.add(q)
                    unsure.discard(q)
            elif t == "turnin" and not x.get("optional"):
                if not cond and q in firm:
                    computed.add(q)
                    last_fin = n
                else:
                    if cond:
                        why = "étape à condition (" + ", ".join(sorted(str(k) for k in kinds(step))) + ")"
                    else:
                        why = "quête prise sous condition ou en facultatif"
                    conditional.setdefault(q, (n, step["title"], why))
    fin = set(entry.get("fin") or [])
    for q in sorted(fin - computed):
        if q in conditional:
            n, title, why = conditional[q]
            out.append(("fail", f"{race} : fin : rendu conditionnel {q} (étape {n} « {title} », {why}) : un joueur qui ne le fait pas garderait l'onglet ouvert"))
        else:
            out.append(("fail", f"{race} : fin : {q} n'est pas un rendu sans condition du chapitre"))
    for q in sorted(computed - fin):
        out.append(("fail", f"{race} : fin : rendu sans condition {q} absent de `fin` (GreffeData.lua)"))
    for q, (n, title, why) in sorted(conditional.items()):
        if q not in fin:
            out.append(("info", f"rendu conditionnel {q} (étape {n} « {title} », {why}) : hors de la fin, retient l'onglet seulement prêt dans le journal"))
    if not fin and entry.get("kind") != "meeting":
        out.append(("info", "fin vide : le chapitre se ferme à la fin de son guide (GUIDE_COMPLETED) ou à la main"))
    if last_fin:
        for n, step in enumerate(g["steps"][last_fin:], last_fin + 1):
            if step.get("along"):
                continue
            plain = all(x.get("t") in ("turnin", "accept", "note", "fly", "goto", "enter") for x in step["goals"])
            if not (kinds(step) and plain):
                out.append(("warn", f"étape {n} « {step['title']} » après le dernier rendu de la fin : l'onglet se ferme avant elle"))
    return computed


def main():
    sys.stdout.reconfigure(encoding="utf-8")
    detail = "--detail" in sys.argv
    guides = pg.load()
    table, _ = pg.greffe()
    fails = warns = 0
    for entry in table:
        out, facts = [], None
        if entry["id"] in guides:
            check_steps(guides[entry["id"]], entry, out)
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
                     f" journal {facts['log']} à l'accroche, {facts['peak']} au plus, fin sur {len(facts['handins'])} rendus sans condition")
        print(head + (" : OK" if not nf else f" : {nf} ÉCHEC(S)") + (f", {nw} alerte(s)" if nw else ""))
        for lvl, text in rows:
            if lvl == "fail" or detail:
                print(f"    {'ÉCHEC' if lvl == 'fail' else 'alerte' if lvl == 'warn' else 'note'} : {text}")
    print(f"Chapitres : {len(table)}, {fails} échec(s), {warns} alerte(s)" + ("" if detail else " (--detail pour les alertes)"))
    sys.exit(1 if fails else 0)


if __name__ == "__main__":
    main()
