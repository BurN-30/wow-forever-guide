# Groupe Alliance : guides WoW Forever pour jouer entre amis

1. Fermer World of Warcraft.
2. Double-cliquer sur `Installer.bat`.
3. Relancer WoW et, à l'écran des personnages, cliquer sur **AddOns** et cocher **Polestar** et **Groupe Alliance**.

Relancer `Installer.bat` plus tard met tout à jour (les anciennes versions sont remplacées).

---

## Ce que c'est

Un paquet de guides pour l'addon gratuit **[Polestar](https://github.com/fitzforge/polestar)**
(guides de montée en niveau faits pour WoW Forever, flèche de direction, interface en français
ou en anglais selon la langue du jeu). Ce dépôt n'invente pas de route : il reprend les guides
Polestar et les chapitres de donjon du guide d'Aurum, et les assemble pour un groupe Alliance.

| Guide (menu Polestar, Guides communautaires, Groupe Alliance) | Niveaux | Pour qui |
|---|---|---|
| Départ · Humain : Forêt d'Elwynn | 1-11 | Humains (quêtes de démoniste et de mage incluses) |
| Départ · Nain : Dun Morogh | 1-12 | Nains (quêtes de classe incluses) |
| Groupe 1 · Rendez-vous à Hurlevent | 10-13 | Tout le monde ; les Elfes de la nuit viennent de Darnassus par bateau |
| Groupe 2 · Marche de l'Ouest | 11-15 | |
| Groupe 3 · La salle des Thanes (donjon) | 12-16 | Quêtes à prendre à Forgefer et Dun Morogh avant d'entrer |
| Groupe 4 · Sombrivage | 15-20 | |
| Groupe 5 · Ruines de Lordaeron (donjon) | 16-20 | |
| Groupe 6 · Les Carmines | 20-24 | |
| Groupe 7 · Bois de la Pénombre | 24-26 | |
| Groupe 8 · Orneval, Les Paluns et Les Serres-Rocheuses | 26-28 | |
| Groupe 9 · Site de fouilles : Les Paluns (donjon) | 26-30 | |
| Groupe 10 · Mille pointes, Bois de la Pénombre et Les Paluns | 28-31 | |
| Groupe 11 · Cité de Dalaran (donjon) | 28-31 | Puis la suite de Polestar (Contreforts de Hautebrande, 30-40) |

Textes en français : ceux de Polestar, complétés par traduction automatique relue par sondage là où
Polestar n'en avait pas encore (quelques noms de lieux peuvent différer du jeu). Les noms de
quêtes, PNJ, objets et zones viennent du jeu lui-même, donc dans la langue de chaque joueur.

Chaque guide enchaîne sur le suivant. Les guides de départ se terminent au rendez-vous de Hurlevent.

**Seul ou en groupe.** Chacun monte seul avec son guide de départ jusqu'au rendez-vous, puis tout
le monde suit le même guide. Au début de chaque zone, une note rappelle l'écart de niveau à ne pas
dépasser (4 niveaux) : au-delà, l'XP de groupe et des quêtes baisse pour le plus haut. Celui qui est
en avance fait ses quêtes de classe ou ses métiers en solo (le midi par exemple).

**Druide Elfe de la nuit.** Guérison du poison (14), forme aquatique (16) et forme de félin (20)
s'obtiennent par des quêtes de classe dans Forever : guides Polestar, catégorie Classe, Druide.

## Ce qu'apporte l'addon Groupe Alliance

- **Ctrl+clic** sur une ligne du guide (quête, PNJ, objet) : la petite fenêtre de copie de Polestar
  s'ouvre avec le lien **Wowhead Forever** déjà sélectionné ; Ctrl+C puis coller dans le navigateur
  (un addon ne peut pas ouvrir de navigateur). Les commentaires Wowhead aident souvent.
  Le lien est en français si le jeu est en français, en anglais sinon. Pour forcer :
  `/ga lang fr`, `/ga lang en` ou `/ga lang auto`.
- **Au survol** d'une ligne, l'infobulle de Polestar gagne une ligne « Ctrl+clic : lien Wowhead »
  et, si besoin, l'indicateur de fiabilité.
- **Fiabilité** : rien = confirmé pour Forever par au moins deux sources ; **?** jaune dans
  l'infobulle = une seule source Forever ou trajet repris de la bêta, pas encore joué ;
  **!** = repris de Classic sans confirmation (aucun cas pour l'instant).
- **Aucune automatisation** : au premier lancement, l'addon coupe dans Polestar l'acceptation et la
  remise automatiques des quêtes, la fenêtre de fin de guide, la fenêtre de choix de route, l'offre
  automatique des guides de classe et la fenêtre d'accueil, et fait proposer nos guides en premier.
  Tout se rallume dans les options de Polestar (`/polestar options`).
- Rien dans le chat, aucune fenêtre qui s'ouvre toute seule.

Déjà dans Polestar, sans rien ajouter : rappel du maître de classe tous les 2 niveaux, onglet
Talents, points de vol pris au passage, onglet Donjons (quêtes de chaque donjon avec donneur et
prérequis), marchand le plus proche.

## Installation pas à pas

1. Télécharger ce dépôt (bouton vert **Code**, puis **Download ZIP**) et le dézipper où vous voulez.
2. Fermer World of Warcraft.
3. Double-cliquer sur `Installer.bat`. Le script cherche seul le dossier du jeu (jeu ouvert, registre,
   `C:\Program Files (x86)\World of Warcraft`, `C:\Games\World of Warcraft`, `D:\Jeux\...` et les
   autres disques). S'il ne le trouve pas, une fenêtre demande de choisir le dossier
   **World of Warcraft** (celui qui contient `_forever_`). Il copie les addons dans
   `World of Warcraft\_forever_\Interface\AddOns`. Aucun droit administrateur, aucun téléchargement.
4. Lancer le jeu, bouton **AddOns** en bas à gauche de l'écran des personnages : cocher tout ce qui
   commence par **Polestar** et **Groupe Alliance**.
5. En jeu, la fenêtre du guide s'ouvre sur le guide qui correspond au personnage. Sinon :
   `/polestar guides`, section **Guides communautaires**, **Groupe Alliance**, choisir le guide.

Windows bloque le script ? Clic droit sur `Installer.bat`, **Propriétés**, cocher **Débloquer**
en bas, **OK**, puis relancer.

**Questie** (points d'exclamation des quêtes sur la carte) n'est pas inclus : Polestar affiche déjà
ses propres repères (option **Carte**), et Questie pèse plus de 200 Mo. Polestar sait s'en servir
s'il est installé : [Questie sur GitHub](https://github.com/Questie/Questie/releases), fichier
`Questie-<version>.zip`, dossiers `Questie` et `QuestieDB` à copier dans le même dossier AddOns.

## Signaler un problème

Sur une étape fausse : survoler la ligne, noter le titre de l'étape, le guide et le niveau, puis
ouvrir une issue sur ce dépôt (ou l'envoyer au groupe) avec ces trois informations. Si le problème
vient de Polestar lui-même (flèche, interface), le bouton insecte de la fenêtre du guide prépare un
rapport pour l'auteur de Polestar.

## Pour modifier le paquet

Les guides sont des fichiers texte dans `pack/guides` (format Polestar :
[aide-mémoire](https://github.com/fitzforge/polestar/blob/next/docs/GUIDE_CHEATSHEET.md)), les textes
français dans `pack/locales/frFR`. Reconstruire :

```
python tools/sync-fr.py <forge.exe> <clone de polestar>
python tools/fill-fr.py tools/fr-texts.json
python tools/build.py <forge.exe> <clone de polestar> <Polestar-0.3.2 dézippé>
```

`forge.exe` vient des [releases de Polestar](https://github.com/fitzforge/polestar/releases)
(forge-v0.2.0) ; les données de référence se construisent dans le clone avec `forge data build`.

## Crédits et licence

- **Polestar** © 2026 The Polestar authors, GPL-3.0 : moteur (dossiers `addons/Polestar*`, release
  0.3.2 du 05/11/2026, inchangée) et guides repris dans `pack/guides` (révision `08536e3` du
  06/11/2026 ; chaque fichier repris le dit en tête).
- **Aurums Night Elf Druid Guide** © 2026 Aurum, GPL-3.0 : chapitres de donjon (salle des Thanes,
  Ruines de Lordaeron, Site de fouilles, Dalaran) adaptés à toutes les classes.
- Modifications et ajouts par **BurN-30** : identifiants et enchaînement des guides, rendez-vous
  de Hurlevent, notes de groupe, textes français des chapitres ajoutés, addon Groupe Alliance,
  installateur.
- L'ensemble est sous **GPL-3.0** (fichier `LICENSE`). Les données du jeu (noms, identifiants,
  positions) appartiennent à Blizzard Entertainment.

## Sources

Jeu visé : WoW Forever (sorti le 04/11/2026, client 1.60.1). Consultées le 06/11/2026.

| Source | Mise à jour | Jeu | Usage |
|---|---|---|---|
| [Polestar](https://github.com/fitzforge/polestar) 0.3.2 et guides | 05-06/11/2026 | Forever (après sortie) | base reprise |
| [Données Forever de Polestar](https://github.com/fitzforge/polestar/releases/tag/data-v2026.11.1) | 02/11/2026 | Forever | vérification des quêtes |
| [QuestieDB Forever](https://github.com/Questie/Questie/releases) 1.0.11 | 06/11/2026 | Forever | vérification (via Polestar) |
| [wago.tools](https://wago.tools), tables du client 1.60.1.70532 | 06/11/2026 | Forever | cartes et zones |
| [Wowhead Forever](https://www.wowhead.com/forever) | 06/11/2026 | Forever | format des liens, objet de départ du traité |
| [Aurums Night Elf Druid Guide](https://github.com/AurumTitanos/Aurums-Night-Elf-Druid-Guide) 0.4.37 | 22/10/2026 | Forever (bêta) | chapitres de donjon |
| [RestedXP, guides gratuits Forever](https://github.com/RestedXP/RXPGuides) | 06/11/2026 | Forever | recoupement des quêtes de donjon (aucun texte repris) |
| [Lodestar](https://github.com/petllama/lodestar-guides) et [MittenQuest](https://github.com/petllama/mittenquest-guides) pour Polestar | 21/10/2026 | Forever (bêta) | recoupement (Paluns, Hurlevent) |

Ce guide a été préparé avec l'aide de l'IA, pour rechercher, recouper les sources et assembler
rapidement un travail qui aurait pris beaucoup plus de temps. Des erreurs restent possibles : en
cas de doute, vérifiez sur Wowhead et signalez-les.

This guide was prepared with the help of AI, to research, cross-check sources and quickly put
together work that would have taken much longer. Mistakes are still possible: when in doubt,
check Wowhead and report them.
