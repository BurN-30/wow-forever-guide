# Groupe Alliance : guides WoW Forever entre amis

> Basé sur l'addon gratuit [Polestar](https://github.com/fitzforge/polestar) et des guides de la communauté, recoupés avec Wowhead Forever. Préparé avec l'aide de l'IA : des erreurs restent possibles, vérifiez sur Wowhead en cas de doute.
> *Based on the free [Polestar](https://github.com/fitzforge/polestar) addon and community guides, cross-checked with Wowhead Forever. Prepared with AI help: mistakes are possible, check Wowhead when in doubt.*

## Installer

1. Bouton vert **Code** → **Download ZIP**, puis dézipper.
2. Fermer WoW, double-cliquer sur **`Installer.bat`**.
3. Relancer WoW (un `/reload` ne suffit pas pour un premier ajout) : rien à cocher, le guide s'ouvre tout seul.

Le guide ne s'ouvre pas ? Écran de sélection des personnages → bouton **AddOns** en bas à gauche → cocher **Polestar** (avec tout ce qu'il regroupe) et, si besoin, **Charger les addons périmés**.

Mise à jour : retélécharger le ZIP et relancer `Installer.bat`.
Windows bloque le fichier ? Clic droit sur `Installer.bat` → **Propriétés** → cocher **Débloquer** → **OK**.

## Utiliser

- Le guide de ton personnage s'ouvre tout seul (voir « Premier lancement »). Changer : `/polestar guides` → **Guides de la communauté** → **Groupe Alliance**.
- Bouton **?** en haut à droite de la fenêtre du guide : l'aide en bref.
- **Survole** n'importe quelle ligne : l'infobulle explique tout, avec une astuce (en vert) sur les quêtes pénibles.
- **Ctrl+clic** sur une ligne : lien Wowhead prêt à copier (Ctrl+C), en français ou en anglais selon ton jeu (`/ga lang fr`, `en` ou `auto` pour forcer).
- **?** dans une infobulle : info pas encore confirmée, à vérifier sur Wowhead.
- Aucune action automatique, aucune fenêtre qui s'ouvre toute seule.

## Le parcours

Chacun fait son départ seul, puis tout le monde se retrouve à Hurlevent. Restez à 4 niveaux d'écart maximum : au-delà, l'XP de groupe baisse.

| Guide (`/polestar guides`, Guides de la communauté, Groupe Alliance) | Niveaux | Pour qui |
|---|---|---|
| Départ · Humain : Forêt d'Elwynn | 1-11 | Humains (quêtes de démoniste et de mage incluses) |
| Départ · Nain : Dun Morogh | 1-11 | Nains (quêtes de classe incluses) |
| Départ · Elfe de la nuit : Teldrassil | 1-11 | Elfes de la nuit (quêtes de druide incluses), finit au bateau pour Hurlevent |
| Groupe 1 · Rendez-vous à Hurlevent | 10-12 | Tout le monde |
| Groupe 2 · Marche de l'Ouest | 11-14 | |
| Groupe 3 · La salle des Thanes (donjon) | 13-17 | Quêtes à prendre à Forgefer et Dun Morogh avant d'entrer |
| Groupe 4 · Sombrivage | 15-19 | Tout le monde, Elfes de la nuit compris |
| Groupe 5 · Ruines de Lordaeron (donjon) | 17-21 | |
| Groupe 6 · Les Carmines | 20-23 | |
| Groupe 7 · Bois de la Pénombre | 22-24 | |
| Groupe 8 · Orneval, Les Paluns et Les Serres-Rocheuses | 24-27 | |
| Groupe 9 · Site de fouilles : Les Paluns (donjon) | 26-29 | |
| Groupe 10 · Mille pointes, Bois de la Pénombre et Les Paluns | 27-30 | Le diplomate disparu (Hurlevent, puis Bois de la Pénombre) seulement à partir du niveau 28 |
| Groupe 11 · Cité de Dalaran (donjon) | 30-33 | Niveau 30 requis pour la quête qui ouvre la route, puis la suite de Polestar (Contreforts de Hautebrande, 30-40) |

En retard le midi ? Loch Modan (niveaux 14-16, quêtes de Thelsamar) : ni le paquet ni Polestar n'ont de guide pour cette zone, la suivre avec Questie ou Wowhead.

## Premier lancement

Rien à choisir : Polestar lit la race, la classe et le niveau du personnage et ouvre le guide du paquet qui lui correspond (les quêtes de classe sont dans les guides). Chaque guide enchaîne tout seul sur le suivant.

| Personnage | Guide ouvert | Quoi faire |
|---|---|---|
| Humain, Nain ou Elfe de la nuit, niveau 1 | son Départ | rien |
| Personnage déjà avancé, aucun guide Polestar ouvert avant (ex. Humain niveau 8) | le guide de son niveau, quêtes déjà rendues cochées (Humain 8 : Départ · Humain) | rien |
| Elfe de la nuit niveau 10 à 12 (ex. druide 11 à Darnassus) | Départ · Elfe de la nuit ou Rendez-vous à Hurlevent, le plus proche | quêtes de Teldrassil pas finies : `/polestar guides` → Départ · Elfe de la nuit |
| Personnage qui suivait déjà un guide de Polestar | Polestar rouvre ce guide | `/polestar guides` → Guides de la communauté → Groupe Alliance → le guide de son niveau |
| Gnome ou Skyborne (hors du paquet) | le départ de Polestar, qui part ensuite vers la Marche de l'Ouest de Polestar | à la fin du départ : `/polestar guides` → Groupe 1 · Rendez-vous à Hurlevent |

Changer de guide à tout moment : `/polestar guides`.

## Un problème ?

Note le guide, l'étape et ton niveau, et ouvre une *issue* sur ce dépôt (ou envoie-le au groupe).

---

<details>
<summary>Crédits, licence et sources</summary>

- **Polestar** © 2026 The Polestar authors, GPL-3.0 : moteur (dossiers `addons/Polestar*`, release 0.3.2 du 05/11/2026 ; modifiée par BurN-30 : le module Groupe Alliance est dans `Polestar/GroupeAlliance` et chargé par `Polestar.toc`, bouton d'aide dans `UI/GuideFrame.lua`, voir `tools/build.py`) et guides repris dans `pack/guides` (révision `08536e3` du 06/11/2026 ; chaque fichier repris le dit en tête).
- **Aurums Night Elf Druid Guide** © 2026 Aurum, GPL-3.0 : chapitres de donjon adaptés à toutes les classes.
- Modifications et ajouts par **BurN-30** : enchaînement des guides, rendez-vous de Hurlevent, notes de groupe, textes français ajoutés, module Groupe Alliance (liens Wowhead, astuces de quête, réglages calmes, aide), installateur.
- L'ensemble est sous **GPL-3.0** (fichier `LICENSE`). Les données du jeu appartiennent à Blizzard Entertainment.

Jeu visé : WoW Forever (client 1.60.1). Sources consultées le 06/11/2026 :

| Source | Mise à jour | Jeu | Usage |
|---|---|---|---|
| [Polestar](https://github.com/fitzforge/polestar) 0.3.2 et guides | 05-06/11/2026 | Forever | base reprise |
| [Données Forever de Polestar](https://github.com/fitzforge/polestar/releases/tag/data-v2026.11.1) | 02/11/2026 | Forever | vérification des quêtes |
| [QuestieDB Forever](https://github.com/Questie/Questie/releases) 1.0.11 | 06/11/2026 | Forever | vérification |
| [wago.tools](https://wago.tools), client 1.60.1.70532 | 06/11/2026 | Forever | cartes et zones |
| [Wowhead Forever](https://www.wowhead.com/forever) | 06/11/2026 | Forever | liens, vérifications, astuces des commentaires reformulées |
| [Aurums Night Elf Druid Guide](https://github.com/AurumTitanos/Aurums-Night-Elf-Druid-Guide) 0.4.37 | 22/10/2026 | Forever (bêta) | chapitres de donjon |
| [RestedXP, guides gratuits](https://github.com/RestedXP/RXPGuides) | 06/11/2026 | Forever | méthode et conseils reformulés, aucun texte repris (licence CC BY-NC-SA) |
| [Lodestar](https://github.com/petllama/lodestar-guides), [MittenQuest](https://github.com/petllama/mittenquest-guides) | 21/10/2026 | Forever (bêta) | recoupement |

Textes français : ceux de Polestar, complétés par traduction automatique relue par sondage (quelques noms de lieux peuvent différer du jeu). Noms de quêtes, PNJ et objets : ceux du jeu, dans la langue de chaque joueur.
</details>

<details>
<summary>Questie, modification du paquet</summary>

**Questie** n'est pas inclus (plus de 200 Mo, Polestar a ses propres repères). Pour l'ajouter : [releases Questie](https://github.com/Questie/Questie/releases), copier les dossiers `Questie` et `QuestieDB` dans `World of Warcraft\_forever_\Interface\AddOns`.

Guides : `pack/guides` (format Polestar, [aide-mémoire](https://github.com/fitzforge/polestar/blob/next/docs/GUIDE_CHEATSHEET.md)), textes français : `pack/locales/frFR`. Reconstruire avec [`forge`](https://github.com/fitzforge/polestar/releases) (forge-v0.2.0) :

```
python tools/sync-fr.py <forge.exe> <clone de polestar>
python tools/fill-fr.py tools/fr-texts.json
python tools/build.py <forge.exe> <clone de polestar> <Polestar-0.3.2 dézippé>
```
</details>
