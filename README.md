# Groupe Alliance : guides WoW Forever entre amis

> Basé sur l'addon gratuit [Polestar](https://github.com/fitzforge/polestar) et des guides de la communauté, recoupés avec Wowhead Forever. Préparé avec l'aide de l'IA : des erreurs restent possibles, vérifiez sur Wowhead en cas de doute.
> *Based on the free [Polestar](https://github.com/fitzforge/polestar) addon and community guides, cross-checked with Wowhead Forever. Prepared with AI help: mistakes are possible, check Wowhead when in doubt.*

## Installer

1. Bouton vert **Code** → **Download ZIP**, puis dézipper.
2. Fermer WoW, double-cliquer sur **`Installer.bat`**.
3. Relancer WoW → bouton **AddOns** (écran des personnages) → cocher **Polestar** et **Groupe Alliance**.

Mise à jour : retélécharger le ZIP et relancer `Installer.bat`.
Windows bloque le fichier ? Clic droit sur `Installer.bat` → **Propriétés** → cocher **Débloquer** → **OK**.

## Utiliser

- Le guide de ton personnage s'ouvre tout seul. Sinon : `/polestar guides` → **Guides communautaires** → **Groupe Alliance**.
- **Survole** n'importe quelle ligne : l'infobulle explique tout.
- **Ctrl+clic** sur une ligne : lien Wowhead prêt à copier (Ctrl+C), en français ou en anglais selon ton jeu (`/ga lang fr`, `en` ou `auto` pour forcer).
- **?** dans une infobulle : info pas encore confirmée, à vérifier sur Wowhead.
- Aucune action automatique, aucune fenêtre qui s'ouvre toute seule.

## Le parcours

Chacun fait son **départ** seul (Humain : Elwynn, Nain : Dun Morogh, Elfe de la nuit : guide Teldrassil de Polestar), puis tout le monde se retrouve à **Hurlevent** vers le niveau 10-12 et suit les mêmes guides : Marche de l'Ouest, Sombrivage, Carmines, Bois de la Pénombre, Paluns, Mille pointes, avec 4 donjons (Salle des Thanes, Ruines de Lordaeron, Site de fouilles, Dalaran). Restez à 4 niveaux d'écart maximum : au-delà, l'XP de groupe baisse.

## Un problème ?

Note le guide, l'étape et ton niveau, et ouvre une *issue* sur ce dépôt (ou envoie-le au groupe).

---

<details>
<summary>Crédits, licence et sources</summary>

- **Polestar** © 2026 The Polestar authors, GPL-3.0 : moteur (dossiers `addons/Polestar*`, release 0.3.2 du 05/11/2026, inchangée) et guides repris dans `pack/guides` (révision `08536e3` du 06/11/2026 ; chaque fichier repris le dit en tête).
- **Aurums Night Elf Druid Guide** © 2026 Aurum, GPL-3.0 : chapitres de donjon adaptés à toutes les classes.
- Modifications et ajouts par **BurN-30** : enchaînement des guides, rendez-vous de Hurlevent, notes de groupe, textes français ajoutés, addon Groupe Alliance, installateur.
- L'ensemble est sous **GPL-3.0** (fichier `LICENSE`). Les données du jeu appartiennent à Blizzard Entertainment.

Jeu visé : WoW Forever (client 1.60.1). Sources consultées le 06/11/2026 :

| Source | Mise à jour | Jeu | Usage |
|---|---|---|---|
| [Polestar](https://github.com/fitzforge/polestar) 0.3.2 et guides | 05-06/11/2026 | Forever | base reprise |
| [Données Forever de Polestar](https://github.com/fitzforge/polestar/releases/tag/data-v2026.11.1) | 02/11/2026 | Forever | vérification des quêtes |
| [QuestieDB Forever](https://github.com/Questie/Questie/releases) 1.0.11 | 06/11/2026 | Forever | vérification |
| [wago.tools](https://wago.tools), client 1.60.1.70532 | 06/11/2026 | Forever | cartes et zones |
| [Wowhead Forever](https://www.wowhead.com/forever) | 06/11/2026 | Forever | liens, vérifications |
| [Aurums Night Elf Druid Guide](https://github.com/AurumTitanos/Aurums-Night-Elf-Druid-Guide) 0.4.37 | 22/10/2026 | Forever (bêta) | chapitres de donjon |
| [RestedXP, guides gratuits](https://github.com/RestedXP/RXPGuides) | 06/11/2026 | Forever | recoupement (aucun texte repris) |
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
