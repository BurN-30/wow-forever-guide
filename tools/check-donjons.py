"""Contrôle des quêtes de donjon et de groupe du guide Groupe Alliance.

Suit le parcours réel de chaque race, guide après guide par les lignes `next` (départ, puis Groupe 1,
2, ...), une fois « en groupe » (toutes les questions « La faire en groupe », goals `optional` faits)
et une fois « seul » (toutes les questions « La passer », goals `optional` laissés). À chaque goal :

- `accept` : ses prérequis (`pre` : l'un d'eux suffit, `preAll` : tous) doivent être rendus, aucune
  quête qui la ferme (`closedBy`) ne doit être prise ou rendue, et elle ne doit pas être déjà prise ;
- `turnin` (sauf `direct`) : la quête doit être dans le journal ;
- objectif lié à une quête (`collect`, `kill`, `interact`, `use`, `complete` avec `quest N` ou `complete N`) :
  la quête doit être dans le journal à ce moment-là ;
- journal : jamais plus de 40 quêtes en cours (limite du client Forever,
  QuestLogConstsMainlineCamelot.MAXIMUM_NUM_QUESTS_LOG_CAN_ACCEPT, la même que Polestar,
  Core/Compat.lua GetLogCap) ;
- niveau : une quête prise dans un guide dont le niveau maximal est sous son niveau requis est
  signalée (avertissement).

Prérequis, exclusions et niveaux : ceux du guide compilé (pack/dist/PolestarPack_GroupeAlliance/Guides.lua),
c'est-à-dire ceux que Polestar applique en jeu (données Forever de Polestar, sans les quêtes
d'acheminement, que le compilateur retire).

Quêtes surveillées (une faute sur elles fait échouer le contrôle) : celles du codex des donjons de
Polestar (addons/Polestar_Codex/Dungeons1.lua), celles des guides de la catégorie Dungeons et
celles des étapes à question de groupe (`when group`). Les autres constats du parcours sont comptés
à part, sans faire échouer (voir aussi tools/check-prereqs.py).

Les conditions `when` que le contrôle ne peut pas connaître (niveau, argent, zone, métier, objet,
temps de recharge) sont supposées vraies.

Usage : python tools/check-donjons.py [--detail]
"""
import re
import sys
from pathlib import Path

RACINE = Path(__file__).resolve().parent.parent
GUIDES = RACINE / "pack" / "guides"
DIST = RACINE / "pack" / "dist" / "PolestarPack_GroupeAlliance" / "Guides.lua"
CODEX = RACINE / "addons" / "Polestar_Codex" / "Dungeons1.lua"
LIMITE_JOURNAL = 40
RACES = ["Human", "Dwarf", "Gnome", "NightElf"]
TOUTES_RACES = {"Human", "Dwarf", "Gnome", "NightElf", "Skyborne", "Orc", "Troll", "Tauren", "Undead", "Scourge"}
CLASSES = {"Warrior", "Paladin", "Hunter", "Rogue", "Priest", "Shaman", "Mage", "Warlock", "Druid"}
CLASSE_TYPE = "Warrior"  # une classe sans quête de classe dans les donjons ajoutés
OBJECTIFS = ("collect", "kill", "interact", "use", "talk")


def entiers(txt):
    return [int(x) for x in re.findall(r"-?\d+", txt or "")]


def donnees_compilees():
    info = {}
    for ligne in DIST.read_text(encoding="utf-8").splitlines():
        m = re.search(r't = "accept", quest = (\d+), title = "((?:[^"\\]|\\.)*)"', ligne)
        if not m:
            continue
        q = int(m.group(1))
        d = info.setdefault(q, {"titre": m.group(2), "pre": [], "preAll": [], "closedBy": [], "minLevel": 0})
        for cle in ("pre", "preAll", "closedBy"):
            mm = re.search(r"\b%s = \{([^}]*)\}" % cle, ligne)
            if mm:
                d[cle] = sorted(set(d[cle]) | set(entiers(mm.group(1))))
        mm = re.search(r"\bminLevel = (\d+)", ligne)
        if mm:
            d["minLevel"] = max(d["minLevel"], int(mm.group(1)))
    return info


def quetes_codex():
    """Identifiants des quêtes listées par le codex des donjons (pages des donjons)."""
    texte = CODEX.read_text(encoding="utf-8")
    return {int(x) for x in re.findall(r"\{id=(\d+),title=", texte.replace('\\"', '"'))}


class Etape:
    def __init__(self, guide, ligne, titre):
        self.guide, self.ligne, self.titre = guide, ligne, titre
        self.when, self.only, self.label, self.goals = [], None, None, []


class Guide:
    def __init__(self, fichier):
        self.fichier = fichier
        self.id = None
        self.next = []
        self.niveau_max = 60
        self.donjon = False
        self.etapes = []
        cur = None
        for n, brut in enumerate(fichier.read_text(encoding="utf-8").splitlines(), 1):
            ligne = brut.split("--")[0].rstrip()
            if not ligne.strip() or ligne.lstrip().startswith("#"):
                continue
            if not brut.startswith((" ", "\t")):
                mot = ligne.split()[0]
                if mot == "guide":
                    self.id = ligne.split()[1]
                elif mot == "next":
                    self.next.append(ligne.split()[1].rstrip(","))
                elif mot == "levels":
                    self.niveau_max = int(ligne.split()[1].split("-")[-1])
                elif mot == "category" and "Dungeons" in ligne:
                    self.donjon = True
                elif mot == "step":
                    cur = Etape(fichier.name, n, ligne[5:].strip())
                    self.etapes.append(cur)
                continue
            if cur is None:
                continue
            mots = ligne.split()
            if mots[0] == "when":
                cur.when.append(ligne.strip()[5:].strip())
            elif mots[0] == "only":
                cur.only = ligne.strip()[5:].strip()
            elif mots[0] == "label":
                cur.label = mots[1]
            elif mots[0] in ("accept", "turnin", "complete") + OBJECTIFS:
                cur.goals.append((mots[0], ligne.strip(), n))


def correspond(only, race, classe):
    if not only:
        return True
    noms = [x.strip() for x in only.split(",") if x.strip()]
    races = [x for x in noms if x.lstrip("!") in TOUTES_RACES or x in ("Alliance", "Horde")]
    classes = [x for x in noms if x.lstrip("!") in CLASSES]
    ok_race = not races or any((x == race or x == "Alliance") for x in races if not x.startswith("!")) \
        or (all(x.startswith("!") for x in races) and ("!" + race) not in races)
    ok_classe = not classes or classe in classes or (all(x.startswith("!") for x in classes) and ("!" + classe) not in classes)
    return ok_race and ok_classe


def only_du_goal(texte):
    m = re.search(r"\bonly ([A-Za-z!,]+)", texte)
    return m.group(1) if m else None


class Parcours:
    def __init__(self, info, surveillees, race, groupe):
        self.info, self.surveillees, self.race, self.groupe = info, surveillees, race, groupe
        self.journal, self.rendues, self.prises = set(), set(), set()
        self.faites = set()  # labels des étapes suivies
        self.sautees = set()  # quêtes dont la prise a été passée avec une question de groupe
        self.erreurs, self.autres, self.avert = [], [], []
        self.max_journal, self.ou_max = 0, ""
        self.max_donjon, self.ou_donjon = 0, ""  # le même, sur les étapes de donjon ou de groupe

    def condition(self, pred):
        neg = pred.startswith("!")
        p = pred.lstrip("!").strip()
        mot, _, reste = p.partition(" ")
        if mot == "group":
            v = self.groupe
        elif mot == "done":
            v = reste.strip() in self.faites
        elif mot == "onquest":
            v = any(q in self.journal for q in entiers(reste))
        elif mot == "complete":
            v = any(q in self.journal for q in entiers(reste))
        elif mot == "turnedin":
            v = any(q in self.rendues for q in entiers(reste))
        elif mot == "available":
            v = all(self.dispo(q) is None for q in entiers(reste))
        else:
            return True  # niveau, argent, zone, métier, objet : inconnus ici, supposés vrais
        return (not v) if neg else v

    def dispo(self, q):
        d = self.info.get(q)
        if q in self.journal or q in self.rendues:
            return "déjà prise"
        if not d:
            return None
        manque = [p for p in d["preAll"] if p not in self.rendues]
        if d["pre"] and not any(p in self.rendues for p in d["pre"]):
            manque += d["pre"]
        if manque:
            return f"prérequis non rendu {manque}"
        fermee = [c for c in d["closedBy"] if c in self.journal or c in self.rendues]
        if fermee:
            return f"fermée par {fermee}"
        return None

    def note(self, q, lieu, quoi, grave=True):
        cible = self.erreurs if (grave and q in self.surveillees) else self.autres
        cible.append((lieu, q, quoi))

    def suivre(self, guide):
        for e in guide.etapes:
            donjon = guide.donjon or any(w.lstrip("!").startswith(("group", "done")) for w in e.when)
            if e.only and not correspond(e.only, self.race, CLASSE_TYPE):
                continue
            if not all(self.condition(w) for w in e.when):
                if any(w.startswith("group") for w in e.when):
                    for action, texte, n in e.goals:
                        if action == "accept":
                            self.sautees.update(entiers(texte.split()[1])[:1])
                continue
            for action, texte, n in e.goals:
                lieu = f"{e.guide}:{n}"
                go = only_du_goal(texte)
                if go and not correspond(go, self.race, CLASSE_TYPE):
                    continue
                optionnel = re.search(r"\boptional\b", texte) is not None
                if optionnel and not self.groupe:
                    continue
                ids = entiers(texte.split()[1]) if len(texte.split()) > 1 else []
                q = ids[0] if ids else None
                if action == "accept" and q:
                    pb = self.dispo(q)
                    if pb == "déjà prise":
                        # Polestar coche toute seule une prise déjà faite : redondant, pas bloquant.
                        self.note(q, lieu, "prise alors que déjà prise ou rendue (cochée toute seule)", grave=False)
                    elif pb:
                        # Une prise facultative jamais proposée ne bloque rien ; une prise obligatoire
                        # est marquée indisponible par Polestar, mais le guide la demande à tort.
                        self.note(q, lieu, f"prise alors que {pb}", grave=not optionnel)
                    self.journal.add(q)
                    self.prises.add(q)
                    d = self.info.get(q)
                    if d and d["minLevel"] > guide.niveau_max:
                        self.avert.append((lieu, q, f"niveau requis {d['minLevel']}, guide jusqu'au niveau {guide.niveau_max}"))
                elif action == "turnin" and q:
                    if re.search(r"\bdirect\b", texte):
                        self.rendues.add(q)
                        continue
                    if q not in self.journal:
                        # Rendu facultatif (« si vous l'avez ») ou d'une quête passée à la question de
                        # groupe : Polestar le passe ; sinon le guide attend un rendu impossible.
                        self.note(q, lieu, "rendue sans être dans le journal",
                                  grave=not optionnel and q not in self.sautees)
                    self.journal.discard(q)
                    self.rendues.add(q)
                elif action == "complete" and q:
                    if q not in self.journal:
                        self.note(q, lieu, "objectifs demandés sans la quête dans le journal",
                                  grave=not optionnel and q not in self.sautees)
                else:
                    m = re.search(r"\bquest (\d+)", texte)
                    if m:
                        qq = int(m.group(1))
                        if qq not in self.journal:
                            self.note(qq, lieu, f"objectif ({action}) demandé sans la quête dans le journal",
                                      grave=not optionnel and qq not in self.sautees)
                if len(self.journal) > self.max_journal:
                    self.max_journal, self.ou_max = len(self.journal), lieu
                if donjon and len(self.journal) > self.max_donjon:
                    self.max_donjon, self.ou_donjon = len(self.journal), lieu
                if len(self.journal) > LIMITE_JOURNAL:
                    self.erreurs.append((lieu, q, f"journal plein : {len(self.journal)} quêtes (limite {LIMITE_JOURNAL})"))
            if e.label:
                self.faites.add(e.label)


def main():
    detail = "--detail" in sys.argv
    info = donnees_compilees()
    guides = {}
    for f in sorted(GUIDES.glob("*.guide")):
        g = Guide(f)
        guides[g.id] = g
    surveillees = set(quetes_codex())
    for g in guides.values():
        for e in g.etapes:
            if g.donjon or any(w.lstrip("!").startswith("group") for w in e.when):
                for action, texte, n in e.goals:
                    surveillees.update(entiers(texte.split()[1])[:1] if len(texte.split()) > 1 else [])
    departs = {"Human": "groupe-alliance/01-depart-humain", "Dwarf": "groupe-alliance/01-depart-nain",
               "Gnome": "groupe-alliance/01-depart-gnome", "NightElf": "groupe-alliance/01-depart-elfe-de-la-nuit"}
    echec = False
    for race in RACES:
        for groupe in (True, False):
            p = Parcours(info, surveillees, race, groupe)
            gid, vus = departs[race], []
            while gid and gid in guides and gid not in vus:
                vus.append(gid)
                p.suivre(guides[gid])
                gid = guides[gid].next[0] if guides[gid].next else None
            mode = "en groupe" if groupe else "seul"
            print(f"{race}, {mode} : {len(vus)} guides, journal au plus {p.max_journal}/{LIMITE_JOURNAL} ({p.ou_max}), "
                  f"dans les donjons et quêtes de groupe au plus {p.max_donjon} ({p.ou_donjon}), "
                  f"{len(p.erreurs)} faute(s) sur les quêtes de donjon ou de groupe, {len(p.autres)} autre(s) constat(s), "
                  f"{len(p.avert)} avertissement(s) de niveau")
            for lieu, q, quoi in p.erreurs:
                print(f"  FAUTE {lieu}\t{q} {info.get(q, {}).get('titre', '?')}\t{quoi}")
            if detail:
                for lieu, q, quoi in p.autres:
                    print(f"  autre {lieu}\t{q} {info.get(q, {}).get('titre', '?')}\t{quoi}")
                for lieu, q, quoi in p.avert:
                    print(f"  niveau {lieu}\t{q} {info.get(q, {}).get('titre', '?')}\t{quoi}")
            echec = echec or bool(p.erreurs)
    print("check-donjons :", "ÉCHEC" if echec else "OK")
    return 1 if echec else 0


if __name__ == "__main__":
    sys.exit(main())
