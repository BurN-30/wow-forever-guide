# À quoi sert cet objet (module Groupe Alliance)

*English below.*

## Ce que fait le module

Une ligne courte, en bleu, sous l'infobulle d'un objet (sacs, butin, marchand, hôtel des ventes, liens du chat). Elle n'apparaît que lorsqu'elle apprend quelque chose, et jamais quand l'information n'est pas sûre. Au plus deux de ces indications, séparées par « · », dans cet ordre :

| Cas | Exemple (client français) |
|---|---|
| Quête que ce personnage peut encore faire, ni dans son journal ni plus loin dans le guide (Polestar les affiche déjà) | Quête : Les écailles de dragonnet (pas encore prise) |
| Objet de quête dont toutes les quêtes de ce personnage sont rendues | Quête déjà rendue : La prime pour Garrick Padfoot |
| Nourriture ou boisson par rapport au niveau du personnage | Nourriture dépassée : celle du niveau 15 rend plus |
| Boisson pour un guerrier ou un voleur | Boisson : rend du mana, que votre classe n'a pas |
| Composant d'un sort de classe | Composant de sort : Chaman (Réincarnation) |
| Outil d'un sort de classe | Outil de sort : Chaman |
| Composant de métier, avec le niveau de métier à partir duquel une recette s'en sert quand il est sûr | Composant : Couture (dès 55), Secourisme (dès 80), Ingénierie |
| Outil de métier | Outil : Forge, Ingénierie |
| Objet gris que rien ne demande | Seulement à vendre : 5 pc (prix marchand du jeu) |

Les métiers du personnage passent en premier. Au-delà de trois métiers ou classes, la ligne dit « +2 ».

Ce qu'elle ne dit pas :

- **Équipement** : rien. Polestar compare déjà l'objet à celui qui est porté (« Polestar · Armes : +12 % amélioration »).
- **Quêtes** déjà présentes dans l'infobulle par Polestar : objectifs du journal, quêtes plus loin dans le guide, quête que l'objet commence.
- **Quêtes grises**, ou plus de dix niveaux au-dessus du personnage : rien, conserver l'objet aussi longtemps n'est pas un conseil.
- **Quête déjà rendue** : dit seulement pour un objet de quête. Une étoffe ou une herbe qu'une quête a demandée garde ses autres usages.
- **Nourriture avec un bonus** (« Bien nourri ») : jamais dite dépassée.
- **Objets ajoutés par Forever** : jamais « seulement à vendre », car la base de quêtes ne les connaît pas encore tous.

Couper la ligne : `/ga objets` (ou `/ga items`), `/ga objets off`, `/ga objets on` ; ou la case **À quoi sert cet objet** dans Échap › Options › AddOns › **Groupe Alliance** ; ou dans la roue dentée de Polestar, Confort de jeu › Quêtes. Réglage gardé par compte (`qol.gaItemUse`, allumé par défaut). Aucune fenêtre, aucun bouton, aucun son.

## D'où viennent les données

Tout vient du jeu, jamais d'un autre addon. Le fichier `Polestar/GroupeAlliance/ItemUseData.lua` (environ 116 Ko) est produit par `tools/item-uses.py` :

- **Tables du client WoW Forever** 1.60.1.70888, sur [wago.tools](https://wago.tools) (produit `wowf`) : `ItemSparse`, `Item`, `ItemEffect`, `ItemXItemEffect`, `SpellEffect`, `SpellMisc`, `SpellDuration`, `SpellReagents`, `SpellTotems`, `SpellLevels`, `SkillLine` (anglais et français), `SkillLineAbility`, `SkillRaceClassInfo`, `ChrClasses` (anglais et français). La liste des objets de Classic Era (`Item`, 1.15.9.70576) sert à reconnaître ceux que Forever a ajoutés.
  - Métiers : chaque recette (`SkillLineAbility`, ligne de métier ou sa ligne fille Forever) et ses composants (`SpellReagents`). Outils : catégorie d'outil demandée par la recette (`SpellTotems`, `ItemSparse.TotemCategoryID`).
  - Sorts de classe : lignes de compétence d'une seule classe (`SkillRaceClassInfo`), composants et outils de leurs sorts. Le sort nommé est celui du plus bas niveau.
  - Nourriture et boisson : consommables de la sous-classe « Nourriture et boisson », sort utilisé (avec le sort qu'il lance pour les nourritures à bonus de Forever), régénération toutes les 5 secondes pendant la durée du sort. Paliers : pour chaque niveau requis, la valeur habituelle des nourritures sans bonus (61, 243, 552, 874, 1 392, 2 148, 2 865 points de vie ; 151 à 4 200 de mana). « Adaptée » : au moins 90 % du palier atteint par le personnage. « Dépassée » : moins de 60 %.
  - Seulement à vendre : qualité médiocre (gris), prix de vente, pas équipable, pas d'effet à l'utilisation, ni serrure, ni page à lire, ni contenu, ne commence aucune quête, demandé par aucune recette ni aucun sort des tables, ni par aucune quête de la base, et déjà présent dans Classic.
- **Niveau de métier demandé par les maîtres** : le client ne l'a pas. Il vient des listes de maîtres relevées sur les serveurs Forever, gardées dans la base du monde de [TrinityCore Forever](https://github.com/Karrz1/TrinityCore/releases/tag/forever-tdb-2026-10-14) (GPL-2.0, lignes de la version 70124 de `trainer_spell`, faits seulement). Une recette apprise avec le métier compte pour 1, une recette apprise par un objet prend le niveau requis de l'objet (`ItemSparse.RequiredSkillRank`). « Dès N » n'est écrit que si chaque recette du métier qui utilise l'objet a un niveau connu, ou si l'une d'elles est au niveau 1. Sinon, le métier est nommé sans niveau. 91 % des paires objet-métier (946 sur 1 037) n'ont pas de niveau sûr, car les relevés Forever ne couvrent qu'une partie des maîtres.
- **Quêtes** : la base `Polestar_QuestDB` livrée avec le paquet (objectifs, objet qui commence la quête, objets remis) et `ItemSparse.StartQuestID`. Sont écartées : les quêtes de substitution de Blizzard (« <UNUSED> », « [DEPRECATED] »…), celles que rien ne commence et celles des fêtes. Restent : camp, races (quand la quête est réservée à une ou deux), classes, quêtes qui l'excluent, niveau. Les titres viennent de Polestar, dans la langue du client.
- **Écartés** : les sorts de Season of Discovery encore présents dans les tables du client (numéros 400000 à 499999, ligne Gravure 2851) ne donnent aucun usage, mais retirent l'objet de « seulement à vendre ».

Inspiration : [Keep or Toss: Forever](https://www.curseforge.com/wow/addons/keep-or-toss-forever) d'Aquary (tous droits réservés, non inclus). Sa lecture a signalé quatre cas limites, traités ici à notre façon : nourriture à bonus, boisson sans mana, objets propres à Forever, objets qui commencent une quête absents de la base de quêtes. Aucun code, texte ni fichier de données n'en est repris.

## Comment il a été vérifié

- **Échantillon de 68 objets** : 22 composants des métiers principaux (étoffes, herbes, minerais et barres, cuirs, poussières, viandes, pierres), 18 objets de quête des zones de niveau 1 à 40, 12 gris, 10 nourritures et boissons, 6 composants de sort.
  - Contre une seconde lecture des tables du client et de la base de quêtes, écrite à part : **68 sur 68** d'accord.
  - Contre les tables générées par Keep or Toss 1.7.0 (même version du client, lues pour comparer, rien n'est repris) : **44 sur 44** (métiers, nourritures, gris absents de ses listes d'usages connus).
  - Niveaux « dès N » relus sur les lignes des maîtres et les objets de recette : **40 sur 40**.
- **Wowhead Forever** : non lu. Chaque page (objet 2589 en anglais et en français, objet 2318, quête 6) renvoie une page d'attente anti-robot (statut 202). Rien n'a été contourné.
- **Banc** `tools/check-pack.py`, tout le paquet chargé ensemble, clients français et anglais. Il survole un composant (dans les sacs, à l'hôtel des ventes), un objet de quête (en combat, puis quête rendue), un gris (chez un marchand), une arme, une nourriture, une boisson pour un guerrier et un composant de sort, puis relance les appels de l'infobulle comme le jeu quand il la rafraîchit. Résultat : ligne présente une seule fois, sous les lignes du jeu et celles de Polestar, avec PrettyTooltip et Auctionator chargés (le faux jeu n'a pas de prix d'hôtel des ventes à afficher), 0 erreur. Une quête marquée faite donne bien « Quête déjà rendue ».
- **Mesures** (faux jeu, ordre de grandeur) : données 119 Kio en mémoire ; moins de 0,1 ms par ligne, 0,2 ms pour l'infobulle entière avec tout le paquet.

## Limites

- Le banc ne voit ni l'affichage réel ni le « taint ». Le module n'appelle aucune fonction protégée, ne réécrit rien de Blizzard et passe par l'unique crochet d'infobulle de Polestar (`TooltipDataProcessor`, après les lignes du jeu, chaque module dans son `pcall`).
- « Pas encore prise » repose sur `C_QuestLog.IsQuestFlaggedCompleted` : une quête répétable n'est jamais marquée faite.
- La base de quêtes peut ignorer une quête propre à Forever. Dans ce cas, l'objet n'a pas de ligne de quête, mais il n'est jamais dit « seulement à vendre ».
- Les métiers nommés sans niveau ont des recettes dont le niveau d'apprentissage n'est pas connu (maître non relevé sur Forever).
- « Nourriture dépassée » parle du personnage : pour un chasseur, la même nourriture peut encore nourrir son familier.
- Les noms des métiers et des classes sont en français ou en anglais ; les autres langues du client ont les noms anglais.

## Régénérer les données (nouveau client)

```
curl -o <tables>/ItemSparse.csv "https://wago.tools/db2/ItemSparse/csv?build=<version>&product=wowf"
(idem pour Item, ItemEffect, ItemXItemEffect, SpellEffect, SpellMisc, SpellDuration, SpellReagents, SpellTotems,
 SpellLevels, SkillLine, SkillLineAbility, SkillRaceClassInfo, ChrClasses ; SkillLine et ChrClasses aussi avec
 &locale=frFR, enregistrés en SkillLine_frFR.csv et ChrClasses_frFR.csv)
curl -o <tables>/Era_Item.csv "https://wago.tools/db2/Item/csv?build=1.15.9.70576&product=wow_classic_era"
python tools/item-uses.py --db <tables> --trainers <TDB_full_world_forever_….sql ou trainer_spell.csv> --build <version>
```

Puis `python tools/build.py …` (ou copier `addons-src/GroupeAlliance/ItemUse*.lua` dans `addons/Polestar/GroupeAlliance`), `python tools/check-lua.py` et `python tools/check-pack.py`.

---

# What is this item for (Group Alliance module)

## What it does

One short blue line under an item's tooltip (bags, loot, merchants, auction house, chat links). It shows only when it tells something new, never when the information is not certain. At most two of these, joined by "·", in this order:

| Case | Example (English client) |
|---|---|
| A quest this character can still do, not in the log nor further in the guide (Polestar already shows those) | Quest: Underbelly Scales (not taken yet) |
| A quest item whose quests are all done for this character | Quest already done: Bounty on Garrick Padfoot |
| Food or drink against the character's level | Outgrown food: level 15 food restores more |
| A drink for a warrior or a rogue | Drink: restores mana, which your class has none of |
| A class spell reagent | Spell reagent: Shaman (Reincarnation) |
| A class spell tool | Spell tool: Shaman |
| A profession reagent, with the skill rank from which a recipe uses it when that is certain | Reagent: Tailoring (from 55), First Aid (from 80), Engineering |
| A profession tool | Tool: Blacksmithing, Engineering |
| A grey item nothing wants | Only worth selling: 5c (the game's vendor price) |

The character's own professions come first. Past three professions or classes, the line says "+2".

What it does not say:

- **Gear**: nothing. Polestar already compares the item with the worn one.
- **Quests** Polestar already puts on the tooltip: log objectives, quests further in the guide, the quest an item starts.
- **Quests that are grey**, or more than ten levels above the character: nothing.
- **Quest already done**: only for quest items. Cloth or herbs a quest once asked for keep their other uses.
- **Food with a bonus** (Well Fed): never called outgrown.
- **Items Forever added**: never "only worth selling", since the quest database does not know all of them yet.

Turn it off: `/ga items` (or `/ga objets`), `/ga items off`, `/ga items on`; or the **What is this item for** box in Esc › Options › AddOns › **Groupe Alliance**; or Polestar's gear, Quality of Life › Quests. Saved per account (`qol.gaItemUse`, on by default). No window, no button, no sound.

## Where the data comes from

All from the game, nothing from another addon. `Polestar/GroupeAlliance/ItemUseData.lua` (about 116 KB) is made by `tools/item-uses.py`:

- **WoW Forever client tables** 1.60.1.70888 on wago.tools (product `wowf`), as listed in the French part. The Classic Era item list (1.15.9.70576) tells the items Forever added. Profession recipes and their reagents, recipe tools, single-class spell lines, food and drink (regeneration every 5 seconds over the spell's duration, Forever's bonus foods through the spell they cast; tiers: the usual value of plain food per required level; "right" at 90% of the reached tier or more, "outgrown" under 60%), and the "only worth selling" rule (poor quality, sells, not equippable, no on-use effect, lock, page or contents, starts no quest, wanted by no recipe, spell or quest, and already in Classic).
- **Rank asked by profession trainers**: not in the client. It comes from the trainer lists sniffed on the Forever servers, in the [Forever TrinityCore](https://github.com/Karrz1/TrinityCore/releases/tag/forever-tdb-2026-10-14) world database (GPL-2.0, `trainer_spell` rows of build 70124, facts only). A recipe learned with the profession counts as 1; a recipe item gives its required rank. "From N" is written only when every recipe of that profession using the item has a known rank, or one of them is rank 1; otherwise the profession is named without a rank (91% of item-profession pairs, 946 of 1,037: the Forever sniffs cover only some trainers).
- **Quests**: the pack's `Polestar_QuestDB` (objectives, starting item, items handed over) and `ItemSparse.StartQuestID`. Left out: Blizzard's placeholders ("<UNUSED>", "[DEPRECATED]"…), quests nothing starts, holiday quests. Kept: side, races (when kept to one or two), classes, quests that exclude it, level. Titles come from Polestar, in the client's language.
- **Left out**: Season of Discovery's spells still in the client's tables (ids 400000 to 499999, Engraving line 2851) give no use, but still keep an item off "only worth selling".

Inspiration: [Keep or Toss: Forever](https://www.curseforge.com/wow/addons/keep-or-toss-forever) by Aquary (all rights reserved, not included). Reading it pointed to four edge cases handled here our own way (bonus food, drinks without mana, Forever's own items, quest-starting items missing from the quest database); no code, text or data file is taken from it.

## How it was checked

- **Sample of 68 items** (22 reagents of the main professions, 18 quest items of level 1 to 40 zones, 12 greys, 10 foods and drinks, 6 spell reagents): **68 of 68** agree with a second reading of the client tables and the quest database written apart; **44 of 44** agree with Keep or Toss 1.7.0's generated tables (same client build, read for comparison only); "from N" ranks re-read from the trainer rows and recipe items: **40 of 40**.
- **Wowhead Forever**: not read. Every page tried (item 2589 in English and French, item 2318, quest 6) returned an anti-robot waiting page (status 202); nothing was bypassed.
- **Bench** `tools/check-pack.py`, the whole pack together, French and English clients: a reagent (bags, auction house), a quest item (in combat), a grey (merchant), a weapon, a food, a drink for a warrior and a spell reagent, the tooltip's calls run again as the game does when it refreshes it. The line shows once, under the game's and Polestar's lines, with PrettyTooltip and Auctionator loaded (the fake game has no auction prices to show), 0 errors; a quest flagged done gives "Quest already done". Data 119 KiB in memory; under 0.1 ms a line, 0.2 ms for the whole tooltip (fake game, order of magnitude).

## Limits

- The bench sees neither the real display nor taint. The module calls no protected function, overwrites nothing of Blizzard's and goes through Polestar's single tooltip hook.
- "Not taken yet" relies on `C_QuestLog.IsQuestFlaggedCompleted`: a repeatable quest is never flagged done.
- The quest database may miss a Forever-only quest: the item then has no quest line, but is never called "only worth selling".
- Professions named without a rank have recipes whose learning rank is not known.
- "Outgrown food" is about the character: a hunter's pet may still eat it.
- Profession and class names are in French or English; other client languages get the English ones.

## Rebuild the data (new client)

See the commands in the French part: download the tables listed above from wago.tools for the new build, then run `python tools/item-uses.py --db <tables> --trainers <TDB world .sql or trainer_spell.csv> --build <version>`, then `tools/build.py` (or copy `addons-src/GroupeAlliance/ItemUse*.lua` into `addons/Polestar/GroupeAlliance`), `tools/check-lua.py` and `tools/check-pack.py`.
