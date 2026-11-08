# Questie, Guidelime et notre guide : étude du 08/11/2026

## En bref

- **Questie : pas besoin de l'installer.** Ce qu'il apporte d'utile pour nous (objectifs des quêtes sur la carte, zones où trouver les monstres, rendus prêts, donneurs de quêtes) existe déjà dans Polestar, tiré en partie de la même base de données, mais était éteint par défaut. Le paquet l'allume maintenant, en version légère : carte du monde seulement, quêtes de l'étape en avant, le reste atténué.
- **Questie ne se justifie que** pour son suivi d'objectifs (qui remplace celui du jeu), son journal de quêtes ou les trajets de patrouille des PNJ. Coût : 212 Mo sur le disque (dont environ 185 Mo inutiles pour Forever), une base de 15,5 Mo chargée en jeu, des micro-saccades signalées le 07/11 (corrigées le jour même, sans recul).
- **Guidelime : non.** Il exige Questie sur Forever, et ses guides Alliance gratuits ne sont pas meilleurs que les nôtres pour un groupe francophone : plus de quêtes (Mortemines, Prison, élites), mais texte sec en anglais, sans astuces, et le Site de fouilles manque ou est bridé. On leur reprend des idées et des quêtes, pas l'addon.
- **Jouer chacun à son rythme** : Polestar le gère déjà mieux que les deux autres. Il relit le journal de quêtes et les quêtes rendues à chaque connexion, coche ce qui est fait, reprend à la première étape utile. Guidelime coche aussi tout seul, mais Questie n'a pas de guide. Le paquet ajoute « Passer les quêtes grises » par défaut, pour qu'un joueur en avance ne soit pas renvoyé vers des quêtes qui ne rapportent plus rien.
- **« Limité à 44 »** : aucun plafond à 44 trouvé. Le plafond de WoW Forever est 60 depuis la sortie du 04/11 (pendant la bêta : 20 puis 30), et Blizzard dit qu'il restera à 60. Aucune limite de 44 addons non plus dans le jeu. Le nombre vient peut-être d'ailleurs (un écran, un ami, un serveur ?) : à préciser. Nos guides s'arrêtent à 33 et passent ensuite aux guides de Polestar jusqu'à 60, donc rien n'est à couper.

## Ce qui a changé dans le paquet (version 0.3.0)

| Changement | Pourquoi |
|---|---|
| Polestar 0.3.2 remplacé par **0.3.4** | Le jeu en groupe marche enfin sur Forever (Polestar reconnaissait mal les membres du groupe) : panneau de groupe automatique, progression de chacun visible. Corrections de routes et de la fenêtre. |
| Corrections des guides Polestar reportées (0.3.2 vers 0.3.4) dans nos 10 guides adaptés | Bugs signalés par les joueurs : un PNJ amical à « tuer » au lieu de lui parler (Farsen's Watch, Nain et Gnome), le druide envoyé dans les montagnes d'Alterac au lieu de Hurlevent (Gnome), le Grand esprit du félin pointé 90 mètres trop loin (druide), PNJ à l'étage signalés, escorte de Kerlonian prise au bon moment, retours au foyer forcés retirés. |
| Nain : Breuvage brûlant de Nori pris au retour | Le breuvage dure 5 minutes, la route en prenait 10 avant la remise : la quête échouait. Le guide Gnome le faisait déjà correctement. |
| Mille pointes : Martek l'exilé (1106) retiré | Elle demande Hardened Shells (1105), que la route ne fait pas : la quête ne pouvait pas être prise. |
| Sombrivage : Business in Auberdine (97894) | Quête Forever gratuite à prendre à Hurlevent avant le bateau, rendue au premier passage à Auberdine. |
| Nain, Gnome : Copper Bar pour The Quarry's Smith | L'objectif manquait (forgerons seulement). |
| Notes de groupe réécrites | Les anciennes disaient « attendez les autres ». Elles disent maintenant que chacun peut avancer de son côté, et que le guide reprend où il en est. |
| Repères de quêtes sur la carte allumés | Voir « En bref ». |
| **34 astuces de plus** (132 en tout), surtout Sombrivage et Marche de l'Ouest | Tirées des commentaires Wowhead Forever, réécrites. Ex. la bonne tortue de Washed Ashore est sous l'eau à l'ouest du ponton, la flamme antique est verte, la plume de Jai'vhanel compte pour tout le groupe. |
| Étoile verte en bout de ligne quand une astuce existe | On sait où survoler. Disparaît une fois l'objectif fait. |
| `tools/check-lua.py` | Vérification sans le jeu (syntaxe Lua 5.1 et petit test du module). |

## À tester en jeu

1. Installation par-dessus l'ancienne version : le guide s'ouvre toujours seul, rien à recocher.
2. En groupe avec un autre joueur qui a le paquet : le panneau de groupe s'ouvre, la progression de l'autre s'affiche.
3. Carte du monde à Sombrivage : les objectifs et leurs zones s'affichent, sans trop encombrer. Sinon, roue dentée, Quêtes, décocher.
4. Étoile verte en bout de ligne, sur une quête avec astuce (ex. Washed Ashore à Auberdine) ; l'infobulle montre l'astuce.
5. Nain : Coldridge Valley, le Breuvage brûlant se rend à temps.
6. Hurlevent, avant le bateau : Borgus Steelhand propose bien Business in Auberdine (position notée dans les données, pas encore vérifiée en jeu).
7. Un joueur qui a déjà fait des quêtes seul : le guide les saute.

## Fait en 0.4.0 (08/11/2026)

- Quêtes de groupe réintégrées, chacune demandée une fois (bandeau de Polestar « La passer / La faire en groupe », réglage du paquet passé de « toujours » à « demander ») : Carmines (Blackrock Blockade seul ; Tharil'zun, Shadow Magic, Gath'Ilzogg, Incinerator Gar'im à plusieurs), Sombrivage (Baron Marinous, Gyromast's Revenge ; Volcor en force à plusieurs, discret seul), Bois de la Pénombre (chaîne de Jitters, facultative, sans question : ce n'est pas une quête de groupe).
- Chapitres Mortemines (Groupe 6b, après les Carmines) et Prison (Groupe 7b, après le Bois de la Pénombre), boss par boss ; Ruines de Lordaeron et Site de fouilles réécrits de même et rendus facultatifs.
- Site de fouilles déplacé après les Mille pointes (28-32) : quêtes de niveau 31 et dernier boss 31 sur Wowhead Forever.
- Marques de difficulté (orange, rouge) calculées sur le niveau réel du joueur, avec la façon de faire seul et à plusieurs.
- Paluns : Razormaw Needling (98245) et la chaîne Lightforge (270, 321, 324, 322) sont déjà dans le guide Polestar qui suit le nôtre (30-40, Contreforts de Hautebrande) ; Trying Times (98246) n'est pas ajoutée (positions des œufs absentes des données). Friend of the Kirin Tor (92459) pas ajoutée.

## Ce qui reste à faire (idées notées, pas faites)

- **Quêtes en plus pour un groupe**, présentes dans les autres guides et que la route solo de Polestar écarte : Carmines (Blackrock Blockade 98387, WANTED: Incinerator Gar'im 95999, élites Tharil'zun 19, Gath'Ilzogg 169, Shadow Magic 115), Bois de la Pénombre (chaîne de Jitters 163, 5, 93, 240), Sombrivage (Baron Marinous 98028, élite 21), Paluns (98245, 98246, chaîne Lightforge 321, 322, 324), Dalaran (Friend of the Kirin Tor 92459), Site de fouilles (98310, 98313 chez Whelgar). Il faut placer chaque étape (positions, ordre) : environ 1 à 2 heures par zone, et un essai en jeu.
- **Mortemines et Prison** : absentes chez nous, présentes dans tous les autres guides. Un chapitre de donjon chacun, sur le modèle de nos chapitres Salle des Thanes et Ruines : environ 3 heures chacun.
- **Site de fouilles** : ses quêtes sont de niveau 31, notre guide le met à 26-29. Les autres guides le placent vers 29-32. À revoir après retour en jeu.
- **Escortes en groupe** : rappeler que tout le monde prend la quête avant de parler au PNJ (idée de TUGs et Doggs).
- **Plus d'astuces** pour Carmines, Pénombre, Orneval et Paluns, même méthode (une demi-heure par zone).

---

## Détails : Questie 12.6.4 (07/11/2026)

Source : [release bundle/v12.6.4+v1.0.12](https://github.com/Questie/Questie/releases/tag/bundle/v12.6.4+v1.0.12) (93,9 Mo zippé), 1 134 étoiles, dépôt actif le 08/11.

### Ce qu'il fait, et ce que Polestar fait déjà

| Fonction | Questie | Polestar 0.3.4 |
|---|---|---|
| Donneurs de quêtes sur carte et minicarte | oui | oui (`qol.availableQuests`), éteint par défaut, **allumé par le paquet** (carte, 3 niveaux au-dessus) |
| Objectifs et zones des monstres et objets | oui | oui (`qol.mapObjectives`, `qol.objectiveAreas`), **allumé par le paquet** |
| Rendus prêts | oui | oui (`qol.turnInMarkers`), **allumé par le paquet** |
| Quêtes de l'étape en avant, autres atténuées | non | oui (`qol.guideHighlight`, `qol.guideDim`), **atténuation allumée par le paquet** |
| Infobulles sur monstres et objets | oui, avec taux de butin | oui, sans taux de butin |
| Icônes sur les barres de nom | oui | oui (`qol.nameplateIcons`), éteint |
| Suivi d'objectifs à la place de celui du jeu | oui (environ 60 options) | non, garde celui du jeu |
| Filtres race, classe, métier, prérequis | oui | oui |
| Journalières | module dédié | pas de module dédié vu |
| Journal de quêtes (historique, recherche) | oui | recherche par Lookup seulement |
| Annonces dans le chat du groupe | oui | non, volontairement |
| Progression du groupe | oui | oui, et depuis 0.3.4 elle marche sur Forever |
| Trajets de patrouille des PNJ | oui | non |

La base de quêtes de Polestar (`Polestar_QuestDB`, environ 1,2 Mo sur disque, environ 5 Mo en jeu) est construite en partie à partir de QuestieDB Forever (voir `addons/Polestar_QuestDB/LICENSE-DATA.txt`). Les positions d'objectifs des quêtes de nos étapes y sont déjà : par exemple The Red Crystal (4811), même point que Questie (47,3 ; 48,7).

### Coût

- Disque : 212 Mo dézippé, dont Questie 9,2 Mo et QuestieDB 203 Mo (sept versions du jeu ; la part Forever fait 15,5 Mo).
- Mémoire : aucune mesure récente pour Forever ; 62-65 Mo signalés en 2025 sur une ancienne base (#6965). La base Forever est décodée à la demande, sauf les traductions françaises, décodées au chargement.
- Chargement : les options n'étaient construites qu'au login (environ 19 s de travail réparti) jusqu'à la PR #8160 du 07/11 (12.6.3).
- Lag : #8180 (07/11), saccades de 0,5 à 1 s à chaque mise à jour de quête, corrigé par la PR #8194 dans 12.6.4. Pas de retour depuis.
- Conflits : aucun avec Polestar, Guidelime ou RestedXP. Erreur avec OpenMap (#8096, ouverte), boutons de carte avec HandyNotes et RareScanner (corrigés), contamination de l'interface au passage de niveau (#8206, ouverte).
- Encombrement : avec les marques de Polestar et de Questie allumées ensemble, les icônes sont en double. Il faut en éteindre une famille.

### Si quelqu'un veut quand même Questie, réglage léger

Dans ses options : couper la minicarte, le suivi (« Activer le suivi »), les trajets, les barres de nom, les annonces ; activer « Cacher les icônes sur la carte du continent », « Cacher les icônes des quêtes non suivies » et « Limiter le nombre d'icônes » (300 par exemple). Et dans Polestar (roue dentée, Quêtes) : décocher les marques de quêtes, pour éviter les doublons. Polestar sait lire le suivi de Questie (Intégrations, Questie).

### Reprendre des données de Questie ?

Possible (un décodeur d'environ 100 lignes lit sa base Forever), mais redondant : Polestar a déjà ces positions. Chiffrage si on le voulait : 4 à 6 heures. Licence : Questie accepte la reprise sous GPL-3.0 sans pouvoir le garantir pour tout l'historique ; Polestar ne reprend que des faits, avec crédit.

## Détails : Guidelime 6.017 (05/11/2026)

- 175 étoiles, tous droits réservés. Forever pris en charge depuis le 22/09, **Questie obligatoire** sur Forever ; sa propre base Classic de 29 Mo reste chargée même si elle ne sert pas. Environ 33 Mo plus Questie.
- Coche automatique : quête prise ou rendue, objectifs, niveau, XP, points de vol, foyer, sorts appris, et position (rayon autour d'un point). Flèche, marques sur la carte, acceptation et rendu automatiques, éditeur de guides, enregistreur de quêtes.
- Pas de jeu en groupe (aucune synchronisation). Bug ouvert #192 : avec deux quêtes chez le même PNJ, le rendu automatique bloque la seconde.

### Ses guides Alliance gratuits pour Forever

| Guide | Licence | Couverture | Qualité |
|---|---|---|---|
| TUGs (CurseForge, v1.28 du 07/11) | tous droits réservés | 1-60, 12-30 écrit en bêta, 30-60 route Classic | sec, une ligne par quête, Site de fouilles vide (« après le 01/01/2027 »), pas de Dalaran Alliance |
| Sage (CurseForge, 07/11) | tous droits réservés | 1-60, donjons Forever | version gratuite bridée (pas de lignes de classe ni de métier) |
| Bethink (GPL-3.0) | libre | 1-60, toutes races et classes | écrit à l'IA, non testé selon son auteur |
| Doggs (sans licence) | tous droits réservés | 1-30, chaman nain joué, deux variantes non jouées | meilleures consignes de groupe |
| ayanverse (MIT) | libre | 12-60, route Classic | mince, aucune quête Forever |

### Comparaison avec le nôtre (niveaux 9 à 34)

| | Quêtes | dont nouvelles Forever |
|---|---|---|
| Notre paquet | 256 | 42 |
| TUGs | 374 | 43 |
| Sage | 399 | 36 |
| Doggs | 456 | 64 |

Plus de quêtes chez eux (Mortemines, Prison, élites, Carmines plus complètes), mais le nôtre est le seul en français, avec astuces, notes de groupe et des chapitres pour les quatre donjons Forever. Leur grand avantage vient de ce que notre route reprend celle de Polestar, pensée en solo : elle écarte les élites et les quêtes « trop hautes », justement ce qu'un groupe peut faire. Voir « Ce qui reste à faire ».

### Ce qu'on leur reprend (idées, faits, pas de texte)

- Les quêtes listées dans « Ce qui reste à faire » (identifiants et ordre sont des faits).
- Élites marqués facultatifs avec la taille de groupe conseillée et le niveau de l'élite.
- Rappel avant chaque escorte : tout le monde prend la quête, couper l'acceptation automatique.
- Repères d'XP par chapitre, avec un coin où gagner le niveau manquant.

## Sources

- Questie : https://github.com/Questie/Questie (code, issues #6965, #8096, #8180, #8206, PR #8160, #8194).
- Guidelime : https://github.com/max-ri/Guidelime (issues #189 à #192, PR #183, #184).
- Plafond de niveau : [MMOs.com, 27/09/2026](https://mmos.com/news/mmorpg-news/wow-forever-november-4-launch) (« Our level cap is 60, and it's going to stay at 60 »), [Icy Veins, bêta à 20 puis 30](https://www.icy-veins.com/wow-forever/news/the-wow-forever-beta-starts-at-level-20-level-30-after-couple-of-weeks/).
- Polestar 0.3.3 et 0.3.4 : https://github.com/fitzforge/polestar/releases (notes de version).
- Commentaires Wowhead Forever des quêtes concernées, lus le 08/11/2026.
