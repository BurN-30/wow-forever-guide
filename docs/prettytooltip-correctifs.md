# PrettyTooltip 1.3.8 : correctifs du pack / pack patches

Français d'abord, [English below](#english).

## Français

Le pack installe PrettyTooltip 1.3.8, édition Forever (FallenShard, licence MIT), à partir de la release officielle [v1.3.8](https://github.com/FallenShard/PrettyTooltip/releases/tag/v1.3.8) (`PrettyTooltip-v1.3.8-forever.zip`). Le numéro de version reste 1.3.8 dans `PrettyTooltip.toc`, pour que l'auteur reconnaisse la base ; une ligne `## X-Pack-Patches:` signale les changements.

Ce fichier liste chaque écart avec la release. Le diff complet est dans [`prettytooltip-1.3.8.patch`](prettytooltip-1.3.8.patch) : appliqué sur la release décompressée (`git apply -p1 docs/prettytooltip-1.3.8.patch` depuis le dossier qui contient `PrettyTooltip`), il redonne le dossier `addons/PrettyTooltip` du dépôt octet pour octet (vérifié le 10/11/2026). Les fichiers de l'addon sont en CRLF et le restent.

Chaque ajout dans le code porte la marque `[pack patch #n]`, à chercher pour les retrouver.

### Méthode

- Tickets amont lus le 10/11/2026 : les 25 ouverts (#12 à #51) et les fermés récents. Aucun commit sur `main` après le tag v1.3.8 (comparaison `v1.3.8...main` vide) : pas de correctif amont à reprendre.
- Le pack sert avec le client français (frFR) et le client anglais (enUS) : les tickets des deux comptent pareil, et chaque correction doit marcher sur les deux. Ne sont corrigés que les vrais bugs dont la cause est certaine dans le code, avec une correction petite et locale.
- Les termes du client viennent de la table GlobalStrings du build 1.60.1.70862 (wago.tools, produit wowf, frFR et enUS).
- Le jeu ne peut pas être lancé ici. Chaque correction a été vérifiée hors jeu : syntaxe Lua 5.1 des 54 fichiers de l'addon, et lecteur réel de l'addon (`Core/Util.lua`, `Game/TooltipData.lua`, `Tooltips/Aura.lua` ou `Tooltips/Item.lua` chargés sous Lua 5.1) appliqué aux lignes d'infobulle du ticket, en anglais et en français : la release reproduit le bug, la copie corrigée non. Reste à confirmer en jeu (voir plus bas).

### Correctif 1 : bonus d'ensemble actif déplacé en bas (ticket #47)

- Ticket : [#47](https://github.com/FallenShard/PrettyTooltip/issues/47), « when you get a set bonus it disappears from the list of bonuses and goes in a bottom region », étiquette `bug`.
- Clients : les deux. La correction lit les chaînes du jeu (`ITEM_SET_BONUS`, `ITEM_SET_BONUS_GRAY`), pas un texte écrit en dur : « Set: » en anglais, « Complet : » en français.
- Fichier : `Tooltips/Item.lua`, lignes 499 à 501 (fonction `readModel`).
- Cause : le client écrit un bonus inactif « (3) Ensemble : … » (`ITEM_SET_BONUS_GRAY`, « (3) Set: … » en anglais) et un bonus actif « Complet : … » (`ITEM_SET_BONUS`, « Set: … »), sans le nombre de pièces. Le lecteur ne reconnaissait que la première forme : dès qu'un bonus devenait actif, sa ligne quittait la liste des bonus et tombait dans les lignes diverses, en bas du cadre.
- Correction : la condition accepte aussi `ITEM_SET_BONUS`, toujours seulement après la ligne du nom de l'ensemble (`inSet`). Le bonus actif reste à sa place, en vert (la couleur vient déjà de la ligne du jeu, lue par `isActive`). Il garde le libellé du jeu, sans « (3) », comme dans l'infobulle d'origine.
- Réappliquer : dans `readModel`, remplacer `elseif inSet and unformat(trimmed, ITEM_SET_BONUS_GRAY) then` par `elseif inSet and (unformat(trimmed, ITEM_SET_BONUS_GRAY) or unformat(trimmed, ITEM_SET_BONUS)) then`. À retirer quand l'amont publie une version qui ferme #47.

### Correctif 2 : numéro du sort à la place de la description d'une aura (ticket #49)

- Ticket : [#49](https://github.com/FallenShard/PrettyTooltip/issues/49), « Buff panels show the spell ID as the description when tooltipShowAuraSpellIDs is on ». Le ticket donne la cause et la piste de correction.
- Clients : les deux. La chaîne du jeu `SPELL_ID` vaut « Spell ID: %d » en anglais et « Identifiant de sort : %d » en français.
- Fichier : `Tooltips/Aura.lua`, nouvelle fonction `isSpellIDLine` (lignes 46 à 52) et condition de `readAura` (ligne 122).
- Cause : avec la variable du jeu `tooltipShowAuraSpellIDs` activée (certains addons l'allument sans le dire, et elle reste pour tout le compte), le jeu ajoute sous le nom de l'aura la ligne « Identifiant de sort : 706 ». `readAura` prend la première ligne non vide comme description : le numéro devenait le texte principal, et la vraie description passait en petit et en gris sous la barre de durée.
- Correction : une ligne lue avec la chaîne du jeu `SPELL_ID` et dont le nombre est celui de l'aura n'est plus prise comme description ; elle va dans les lignes du bas, là où l'exemple de l'éditeur de style (`UI/Samples.lua`) place le numéro. Sans `SPELL_ID` dans le client, rien ne change.
- Réappliquer : ajouter `isSpellIDLine` après `isRemaining`, et ajouter `and not isSpellIDLine(text, spellID)` à la condition `elseif text ~= "" and not model.text then` de `readAura`. À retirer quand l'amont publie une version qui ferme #49.

### Correctif 3 : traduction française (`Locale/frFR.lua`)

Client français seulement : ce fichier ne se charge pas sur le client anglais. Seuls des libellés d'affichage sont changés, aucune chaîne qui sert à lire les infobulles.

| Ligne | Clé | Avant | Après | Raison |
|---|---|---|---|---|
| 96 | `L["iLvl %s"]` (plaque de niveau d'objet sous l'icône) | `NI %s` | `NivO %s` | « NI » n'existe pas dans le client ; son abréviation est « NivO » (`ITEM_LEVEL_ABBR`). Même longueur que « iLvl 88 » en anglais, et la largeur de la plaque est déjà mesurée sur ce texte. |
| 134 | `L["DND"]` (plaque d'un joueur en mode Ne pas déranger) | `NPD` | `Occupé(e)` | Le client dit « Occupé(e) » (`DND`, et « <Occupé(e)> » dans le chat) ; « NPD » n'y figure nulle part. « ABS » pour absent est déjà le terme du client (`AFK`). |

Réappliquer : remplacer ces deux valeurs dans `Locale/frFR.lua` tant que l'amont garde les anciennes.

Vérifié et laissé tel quel :
- Chaînes de lecture marquées « unconfirmed » : `formats.rare` = « Rare » et `formats.rareElite` = « Élite rare » correspondent aux termes du client (`MAP_LEGEND_RARE`, `MAP_LEGEND_RAREELITE`) ; la ligne de niveau d'une unité n'a pas pu être vue, mais rien ne prouve qu'elles soient fausses (et le rang vient aussi de `UnitClassification`). `formats.baseManaCost` (« %d%% du mana de base ») n'a pas d'équivalent dans GlobalStrings ; les sorts de Classic coûtent un nombre de points de mana, la ligne ne devrait pas apparaître.
- Noms des métiers (`skills`) : identiques à la table SkillLine frFR (Dépeçage, Minage, Herboristerie, Secourisme, Pêche, Forge, Couture, etc.).
- Types de dissipation (`dispels`) : identiques à SpellDispelType frFR (Magie, Malédiction, Maladie, Poison).
- Types de quête (`questTags`) : Élite, Donjon, Raid, JcJ figurent dans QuestInfo frFR ; « Groupe » n'y figure pas mais ne gêne pas.
- Client anglais : `Locale/English.lua` colle au client enUS là où un ticket le touche (noms de métiers identiques à SkillLine enUS, « Rare » et « Rare Elite » de `MAP_LEGEND_*`, « iLvl » est l'abréviation du client, `ITEM_LEVEL_ABBR`). Rien à changer.
- Les noms de quêtes, PNJ et lieux des exemples de l'éditeur de style n'ont pas été vérifiés : ils ne servent qu'aux aperçus.

### Tickets ouverts non corrigés

| Ticket | Sujet | Verdict |
|---|---|---|
| #51 | Objet 271096 non redessiné | Ticket sans description. L'objet (brassards en tissu d'après la table Item) n'est pas dans ItemSparse du client : ses données arrivent du serveur. Cause non trouvable par lecture du code. |
| #50 | Pas de couleur de difficulté au dépeçage | Comportement prévu : la compétence de Dépeçage requise, dans sa couleur, fait partie des détails affichés en maintenant **Maj** (option « Récolte »). La capture du ticket est prise sans Maj. Afficher la couleur sans Maj serait une nouvelle fonction. |
| #45 | Clignotement, objets de barre d'action, suivi du curseur | Déjà corrigé dans la 1.3.8 (commit amont `a33a8c4`, « Fix flicker with items and comparison from action bars », inclus dans le tag). Ticket resté ouvert. |
| #37 | Saccade au survol d'un équipement (comparaison) | Performance, réduite en 1.3.6 selon le rapporteur ; pas de cause précise. |
| #32 | Comparaisons avec ATT | ATT n'est pas dans le pack. |
| #28 | Audit taint et valeurs secrètes | Demande d'audit, sans bug précis. |
| #15 | Nom de quête en jaune dans l'infobulle de zone de quête de la minicarte | Cause incertaine : on ne sait pas comment Forever colore ces lignes (couleur de la ligne ou code couleur dans le texte). |
| #12, #13, #16, #17, #19, #21, #22, #24, #26, #27, #29, #30, #34, #35 | Couleurs, options, réglages, contenus en plus, API d'intégration | Demandes de fonctionnalité ou de présentation. |
| #23, #25 | Compatibilité EllesmereUI, Plater | Documentation ; aucun des deux n'est dans le pack. |

Aucun ticket ne cite Polestar, Auctionator ou le client français ; les rapports viennent du client anglais (et d'autres langues) et ont été triés avec la même règle.

### À vérifier en jeu

1. **#47** (clients FR et EN) : avec un ensemble dont un bonus est actif (par exemple 2 pièces d'un ensemble à bonus « (2) »), survoler une pièce. Attendu : le bonus actif reste dans la liste des bonus, en tête, en vert, écrit « Complet : … » (« Set: … » en anglais) ; les bonus inactifs suivent en gris ; plus de ligne de bonus isolée en bas du cadre. Vérifier aussi un ensemble sans aucun bonus actif (rien ne change) et la comparaison avec l'objet équipé (Maj).
2. **#49** (clients FR et EN) : taper `/run C_CVar.SetCVar("tooltipShowAuraSpellIDs", 1)`, survoler une amélioration (par exemple une armure de démoniste, une bénédiction). Attendu : la description sous le nom, puis la durée et la barre, et « Identifiant de sort : … » (« Spell ID: … » en anglais) en petit en bas. Ensuite `/run C_CVar.SetCVar("tooltipShowAuraSpellIDs", 0)` : cadre identique à avant, sans la ligne du numéro.
3. **Traduction** (client FR seulement) : survoler une pièce d'équipement (plaque « NivO 25 » sous l'icône, texte entier, non coupé) ; survoler un joueur en mode Ne pas déranger (`/dnd` tapé par un second personnage) : plaque « Occupé(e) ». Sur le client anglais, rien ne change (« iLvl 25 », « DND »).

## English

PrettyTooltip 1.3.8, Forever edition (FallenShard, MIT licence), installed from the official [v1.3.8](https://github.com/FallenShard/PrettyTooltip/releases/tag/v1.3.8) release (`PrettyTooltip-v1.3.8-forever.zip`), with the patches below. `PrettyTooltip.toc` keeps version 1.3.8 so the author recognises the base; a `## X-Pack-Patches:` line flags the changes. The full diff is [`prettytooltip-1.3.8.patch`](prettytooltip-1.3.8.patch): `git apply -p1 docs/prettytooltip-1.3.8.patch`, run from the folder holding the unzipped `PrettyTooltip`, rebuilds the repository's `addons/PrettyTooltip` byte for byte (checked 2026-11-10; files stay CRLF). Every code addition carries a `[pack patch #n]` mark.

### Method

- Upstream issues read on 2026-11-10: the 25 open ones (#12 to #51) and the recently closed ones. No commit on `main` after the v1.3.8 tag, so no upstream fix to take over.
- The pack is played with both the French (frFR) and the English (enUS) client: issues count the same for both, and every fix must work on both. Only real bugs with a certain cause in the code and a small, local fix are patched.
- Client wording comes from the GlobalStrings table of build 1.60.1.70862 (wago.tools, product wowf, frFR and enUS).
- The game cannot be run here. Each fix was checked outside the game: Lua 5.1 syntax of the addon's 54 files, and the addon's real reader (`Core/Util.lua`, `Game/TooltipData.lua`, `Tooltips/Aura.lua` or `Tooltips/Item.lua` loaded under Lua 5.1) run on the issue's tooltip lines in English and French: the release reproduces the bug, the patched copy does not. In-game checks are listed below.

### Patch 1: an active set bonus moves to the bottom (issue #47)

- Clients: both (reads the game's `ITEM_SET_BONUS` and `ITEM_SET_BONUS_GRAY`: "Set:" in English, "Complet :" in French).
- File: `Tooltips/Item.lua`, lines 499 to 501 (`readModel`).
- Cause: the client prints an inactive bonus as "(3) Set: ..." (`ITEM_SET_BONUS_GRAY`) and an active one as "Set: ..." (`ITEM_SET_BONUS`), without the piece count. The reader only knew the first form, so a bonus that became active left the bonus list and fell into the miscellaneous rows at the bottom.
- Fix: the condition also accepts `ITEM_SET_BONUS`, still only after the set name line (`inSet`). The active bonus stays in place, green, with the game's own wording.
- Re-apply: in `readModel`, replace `elseif inSet and unformat(trimmed, ITEM_SET_BONUS_GRAY) then` with `elseif inSet and (unformat(trimmed, ITEM_SET_BONUS_GRAY) or unformat(trimmed, ITEM_SET_BONUS)) then`. Drop it once upstream ships a release closing #47.

### Patch 2: the spell ID replaces an aura's description (issue #49)

- Clients: both (the game's `SPELL_ID` is "Spell ID: %d" in English, "Identifiant de sort : %d" in French).
- File: `Tooltips/Aura.lua`, new `isSpellIDLine` (lines 46 to 52) and the `readAura` condition (line 122).
- Cause: with the game's `tooltipShowAuraSpellIDs` CVar on (some addons turn it on, and it stays account-wide), the game adds "Spell ID: 706" under the aura's name. `readAura` takes the first non-empty line as the description, so the ID became the body text and the real description went small and grey under the duration bar.
- Fix: a line read with the game's `SPELL_ID` string whose number is the aura's ID is no longer taken as the description; it goes to the bottom rows, where the style editor's sample (`UI/Samples.lua`) puts it. Without `SPELL_ID` in the client nothing changes.
- Re-apply: add `isSpellIDLine` after `isRemaining`, and add `and not isSpellIDLine(text, spellID)` to `readAura`'s `elseif text ~= "" and not model.text then`. Drop it once upstream ships a release closing #49.

### Patch 3: French translation (`Locale/frFR.lua`)

French client only (the file does not load on the English client). Display labels only, no string used to read tooltips.

| Line | Key | Before | After | Why |
|---|---|---|---|---|
| 96 | `L["iLvl %s"]` (item level plate) | `NI %s` | `NivO %s` | The French client abbreviates item level "NivO" (`ITEM_LEVEL_ABBR`); "NI" appears nowhere. Same length as the English "iLvl 88" the plate is measured on. |
| 134 | `L["DND"]` (Do Not Disturb badge) | `NPD` | `Occupé(e)` | The French client says "Occupé(e)" (`DND`); "NPD" appears nowhere. |

Checked and left alone: the "unconfirmed" reading strings (`formats.rare` and `formats.rareElite` match the client's `MAP_LEGEND_RARE` and `MAP_LEGEND_RAREELITE` in both languages; `formats.baseManaCost` has no GlobalStrings counterpart and Classic spells cost flat mana), skill names (match SkillLine in frFR and enUS), dispel types (match SpellDispelType frFR), quest tags (QuestInfo frFR). `Locale/English.lua` matches the enUS client wherever a ticket touches it; its "iLvl" is the client's own `ITEM_LEVEL_ABBR`.

### Open issues not patched

| Issue | Topic | Verdict |
|---|---|---|
| #51 | Item 271096 not restyled | No description. The item (cloth bracers per the Item table) is missing from the client's ItemSparse: its data comes from the server. Cause cannot be found by reading the code. |
| #50 | No skinning difficulty color | Intended: the Skinning required, in its color, is part of the details shown while holding **Shift** ("Gathering" option). The issue's screenshot is taken without Shift. Showing it without Shift would be a new feature. |
| #45 | Flicker, action bar items, follow cursor | Already fixed in 1.3.8 (upstream commit `a33a8c4`, part of the tag). Issue left open. |
| #37 | Stutter on gear hover (comparison) | Performance, reduced in 1.3.6 per the reporter; no precise cause. |
| #32 | Comparisons with ATT | ATT is not in the pack. |
| #28 | Taint and secret value audit | Audit request, no precise bug. |
| #15 | Yellow quest name in minimap quest area tooltips | Uncertain cause: how Forever colors those lines is unknown. |
| #12, #13, #16, #17, #19, #21, #22, #24, #26, #27, #29, #30, #34, #35 | Colors, options, settings, extra content, integration API | Feature or layout requests. |
| #23, #25 | EllesmereUI, Plater compatibility | Documentation; neither is in the pack. |

### In-game checks

1. **#47** (FR and EN clients): with a set that has one active bonus, hover a piece. Expected: the active bonus stays first in the bonus list, green ("Set: ..." / "Complet : ..."), inactive bonuses follow in grey, no stray bonus line at the bottom. Also check a set with no active bonus (unchanged) and the comparison with the equipped item (Shift).
2. **#49** (FR and EN clients): `/run C_CVar.SetCVar("tooltipShowAuraSpellIDs", 1)`, hover a buff. Expected: description under the name, then time and bar, "Spell ID: ..." small at the bottom. Then `/run C_CVar.SetCVar("tooltipShowAuraSpellIDs", 0)`: panel as before, without the ID line.
3. **Translation** (FR client only): item plate "NivO 25" under the icon, not cut; a player in Do Not Disturb (`/dnd` on a second character) shows "Occupé(e)". The English client is unchanged ("iLvl 25", "DND").
