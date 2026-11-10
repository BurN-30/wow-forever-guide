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

### Correctif 4 : noms des membres du groupe sous une quête (demande de Nathan, 10/11)

- Ticket : aucun, vu en jeu par le groupe (infobulle d'un monstre de quête quand plusieurs membres ont la quête).
- Clients : les deux (lignes typées par le jeu, aucune chaîne lue).
- Fichier : `Tooltips/Unit.lua`, lecture des lignes de quête (`QuestPlayer`) et affichage de la section des quêtes ; repères `[pack patch]`.
- Cause : le jeu écrit, sous le titre de la quête, le nom de chaque membre du groupe (ligne `QuestPlayer`, en jaune dans l'infobulle d'origine) puis ses objectifs. PrettyTooltip traitait le nom comme un objectif : même couleur beige, même retrait. Les noms ne se distinguaient plus des lignes « Orbe de minuit : 1/3 ».
- Correction : une ligne `QuestPlayer` garde la couleur que lui donne le jeu (or de quête si elle est illisible) avec un retrait de 8 ; les objectifs qui la suivent passent à un retrait de 16, sous le nom. Sans membre du groupe sur la quête, rien ne change.
- Réappliquer : dans la boucle de lecture, marquer `row.player` et `row.playerColor` pour `LINE.QuestPlayer` ; dans la construction de la section des quêtes, couleur et retrait selon `row.player`, retrait 16 pour les objectifs qui suivent un nom. À retirer si l'amont distingue un jour ces lignes.

### Correctif 5 : badge de dépeçage perdu pour les créatures absentes des données (audit du 10/11)

- Ticket : aucun, trouvé à l'audit des distinctions (plus bas).
- Clients : les deux (chaîne du jeu `UNIT_SKINNABLE_LEATHER`, « Skinnable » sur le client anglais, dans la langue du client sur le français ; aucun texte écrit en dur).
- Fichier : `Tooltips/Unit.lua`, lecture des lignes (`readUnit`, ligne `SHOWN_ELSEWHERE`) et badges (`badges`) ; repères `[pack patch]`.
- Cause : sur le cadavre d'une créature que l'on peut dépecer, le jeu ajoute la ligne `UNIT_SKINNABLE_LEATHER`. PrettyTooltip la retire toujours (liste `SHOWN_ELSEWHERE`, ligne 46 : « montrée par les badges »), mais n'affiche le badge qu'avec les données de `Data/Skinning.lua` (tables de butin de CMaNGOS, Classic 1.12, par numéro de créature). Pour une créature absente de ces tables, propre à Forever par exemple, l'information disparaît : ni ligne ni badge. La page CurseForge annonce au contraire que ce qui n'est pas lu reste en bas, « pour garder le plus d'information possible ».
- Correction : la ligne du jeu, quand elle est là, donne aussi le badge. Les détails (Dépeçage requis, cuirs et peaux, sous **Maj**) restent réservés aux créatures connues des données. Aucun changement pour une créature connue.
- Banc : lecteur `readUnit` réel, cadavre d'une créature inconnue avec la ligne du jeu, en anglais et en français : la release perd l'information, la copie du pack marque le badge.
- Réappliquer : dans `readUnit`, sous `elseif SHOWN_ELSEWHERE[text] then`, poser `model.skinnable = true` quand `text == UNIT_SKINNABLE_LEATHER` ; dans `badges`, `if model.skinning or model.skinnable then`. À retirer si l'amont garde la ligne ou le badge sans données.

### Correctif 6 : objectifs remplis non cochés dans le journal de la carte (audit du 10/11)

- Ticket : aucun, trouvé à l'audit.
- Clients : les deux (couleur du jeu `GRAY_FONT_COLOR`, aucun texte lu).
- Fichier : `Tooltips/Quest.lua`, nouvelle fonction `isGrey` (après `isRed`) et lecture d'un objectif dans `readRow` ; repères `[pack patch]`.
- Cause : l'infobulle d'une quête survolée dans le journal de la carte du monde est écrite ligne par ligne par le jeu (`QuestMapLogTitleButton_OnEnter`, `Blizzard_UIPanels_Game/Mainline/QuestMapFrame.lua` 2257 à 2279, chargé sur Forever) : chaque objectif en blanc (`HIGHLIGHT_FONT_COLOR`), en gris (`GRAY_FONT_COLOR`) une fois rempli ; de même pour l'argent demandé. PrettyTooltip lit ces lignes sans type ni drapeau « terminé » et ne coche un objectif que s'il finit par un compte « 3/8 » atteint. Un objectif sans compte (« Parler à… », escorte, lieu à explorer, argent demandé) restait décoché et beige même rempli, à côté d'objectifs comptés correctement cochés.
- Correction : sur une ligne lue dans l'infobulle (pas une ligne typée), une couleur de police égale à `GRAY_FONT_COLOR` (à 0,03 près) coche l'objectif, comme le jeu le grise. Les lignes typées réutilisent la couleur atténuée de PrettyTooltip et ne sont jamais lues ainsi (un gris clair 0,6 atténué à 0,51 ne doit pas passer pour du gris). Sans `GRAY_FONT_COLOR` dans le client, rien ne change.
- Banc : lecteur `readQuest` réel sur les lignes du journal (un objectif sans compte gris, un blanc, un compté en cours, un compté rempli) et sur une ligne typée gris clair, en anglais et en français : la release laisse l'objectif gris décoché, la copie du pack le coche, le reste ne bouge pas.
- Réappliquer : ajouter `isGrey` après `isRed`, et avant `objective.completed = objectiveDone(objective)` : `if objective.completed == nil and row.textColor ~= row.color and isGrey(row.textColor) then objective.completed = true end`. À retirer si l'amont lit la couleur de ces lignes.

### Audit des distinctions (demande de Nathan, 10/11)

Après le correctif 4, Nathan a demandé de chercher les autres endroits où l'infobulle d'origine distingue une information (couleur, retrait, ordre, séparateur) et où PrettyTooltip la rend indistincte ou trompeuse. Méthode : chaque type d'infobulle (objet, unité joueur, PNJ et familier, aura, quête, sort, objet du monde, recette, courrier, trajets) et chaque type de ligne (`Enum.TooltipDataLineType`, `TooltipInfoSharedDocumentation.lua` 34 à 85) comparés au code de l'interface de Forever (dépôt Gethe/wow-ui-source, branche `forever`, build 1.60.1.70888, famille Mainline). `TooltipDataRules.lua` n'ajoute que trois choses aux lignes : la couleur du nom d'unité (lignes 7 à 16), l'icône d'objectif terminé ou non (100 à 113) et le retrait de `GemSocketEnchantment` (122 à 128) ; le reste vient des champs `leftColor`, `usable` et `completed` donnés par le client, que PrettyTooltip lit.

| Endroit (PrettyTooltip) | Ce que le jeu distingue | Ce que fait PrettyTooltip | Verdict |
|---|---|---|---|
| `Tooltips/Unit.lua`, nom d'un membre du groupe sous une quête | Ligne `QuestPlayer` en jaune, objectifs dessous | Même beige, même retrait | Corrigé en 0.9.3 (correctif 4) |
| `Tooltips/Unit.lua` 46, 263, 338 : cadavre dépeçable | Ligne `UNIT_SKINNABLE_LEATHER` | Ligne retirée, badge seulement si la créature est dans les données | Vrai problème, corrigé (correctif 5) |
| `Tooltips/Quest.lua` 63 à 67, 146 à 155 : journal de la carte | Objectif rempli en gris, en cours en blanc, avec ou sans compte | Seul un compte « n/m » coche l'objectif | Vrai problème, corrigé (correctif 6) |
| Objets : niveau requis, classes, races, métier, réputation | Rouge si non rempli | Rouge (`Item.lua` 456 à 498, 619 à 631, drapeau `usable`) | Conservé |
| Objets : type d'arme ou d'armure inutilisable, lien, « Unique » | Rouge pour l'inutilisable | Rouge gardé dans l'en-tête | Conservé |
| Objets : pièces d'ensemble possédées ou non, bonus actifs ou non | Blanc ou gris, vert ou gris | Mêmes distinctions (correctif 1 pour le bonus actif) | Conservé |
| Objets : « Déjà connu », objet de quête, objet qui commence une quête, effets verts, durabilité, composants manquants, changements de stats verts et rouges | Couleurs du jeu | Gardées (lignes du bas ou barre de durabilité colorée) | Conservé |
| Unités : couleur de réaction, mob déjà tapé, niveau en couleur de difficulté, cible de la cible, guilde, propriétaire d'un familier, objectif `completed` | Couleurs du jeu | Gardées (« Vous » en rouge pour la cible) | Conservé |
| Sorts : prérequis et talents non remplis, temps de recharge restant | Rouge | Rouge, recharge en orange | Conservé |
| Auras, objets du monde (prérequis, couleur de chance de gain, serrure), courrier (contre remboursement en rouge si l'argent manque), trajets (coût non coloré par le jeu) | Couleurs du jeu | Gardées | Conservé |
| Lignes des autres addons (`quietColor`, `Game/TooltipData.lua` 14 à 21 : couleurs atténuées à 85 %, blanc passé en gris) | Couleurs de l'addon | Atténuées, toutes à part | Conservé : Polestar « Quête : 3/8 » beige contre vert une fois fait, amélioration d'équipement verte, rouge, orange ou grise toujours distinctes, « Marqué camelote » rouge contre « Marqué à garder » vert ; Auctionator colore ses prix dans le texte, non touché ; seuls le blanc pur et le gris clair se rapprochent, et aucune paire de ce genre ne porte d'information. BuffAlerts n'ajoute aucune ligne. |

Choix de style annoncés par l'auteur (page CurseForge), laissés :
- Nom des joueurs à la couleur de leur classe au lieu de la couleur de réaction : l'hostilité ne se lit plus dans le nom, mais le blason de faction et le badge JcJ la donnent ; rien d'utile caché hors JcJ.
- Lignes d'équipement réécrites en caractéristiques, « Utiliser : », « Équipé : », « Chances quand vous touchez : » remplacés par des icônes : avec les icônes (réglage par défaut), enchantements et effets restent distincts ; sans elles, les enchantements (beiges au lieu du vert du jeu, `Item.lua` 1050) se confondent avec les caractéristiques.
- Lignes non lues et lignes des autres addons regroupées en bas, sous un filet, couleurs atténuées : voir la dernière ligne du tableau, aucune distinction utile perdue.
- Bande coût, incantation, recharge et portée des sorts, quête en liste à cocher, durabilité en barre : plus d'information que l'original.

Cas douteux, non touchés (à regarder en jeu, **Alt** affiche l'infobulle d'origine pour comparer) :
1. Quête survolée dans le journal de la carte en groupe : le jeu appelle `SetQuestPartyProgress` (`QuestMapFrame.lua` 2295 à 2302), qui vide l'infobulle (`TooltipDataHandler.lua` 272 à 274) avant d'y écrire la progression du groupe. PrettyTooltip relirait les lignes et pourrait prendre le nom d'un membre pour le titre. Rien ne montre ici ce que Forever affiche vraiment.
2. Membres du groupe sur un objet de quête (`Tooltips/Object.lua` 203 à 215) : la ligne `QuestPlayer` n'y est pas lue. Si le jeu l'envoie pour un objet, le nom tomberait en bas et les objectifs du membre se mêleraient à ceux du joueur. Le code de l'interface ne dit pas si elle arrive.
3. Coût d'un sort en rouge quand la ressource manque : `readStat` (`Tooltips/Spell.lua` 81 à 90) ignore la couleur. La couleur est posée par le client, invérifiable ici ; à comparer avec peu de mana.
4. Lignes JcJ, Mort et Cadavre retirées (`Unit.lua` 46 et 263) alors que leurs badges demandent que l'unité soit retrouvée (`unitFor`) ; rare, l'unité survolée est presque toujours trouvée.
5. Badge de dépeçage affiché d'après les données même quand le jeu ne montre plus la ligne (cadavre déjà dépecé) : à observer en jeu avant de toucher, le correctif 5 n'y change rien.
6. PNJ dont la faction s'appelle exactement « Alliance » ou « Horde » : ligne retirée, alors que le blason ne s'affiche que pour les joueurs ; mineur.
7. Noms de quêtes de la minicarte tous de la même couleur (ticket amont #15, `Tooltips/Minimap.lua` 23 retire les codes couleur) : déjà classé comme cause incertaine.

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
4. **Noms du groupe** (clients FR et EN) : en groupe, avec la même quête que d'autres membres, survoler un monstre de cette quête. Attendu : sous le titre de la quête, chaque nom en jaune, et ses objectifs décalés en dessous, en beige.
5. **Badge de dépeçage** (clients FR et EN, un personnage qui a le Dépeçage ou non) : tuer une bête dépeçable, survoler le cadavre. Attendu : le badge de dépeçage (texte du jeu, « Skinnable » en anglais) en haut du cadre, comme avant pour une bête de Classic ; il apparaît maintenant aussi pour une bête propre à Forever. Comparer avec **Alt** (infobulle d'origine) : badge présent quand la ligne y est. Noter aussi si le badge reste après le dépeçage (cas douteux 5).
6. **Journal de la carte** (clients FR et EN) : ouvrir la carte (M), survoler dans la liste une quête dont un objectif sans compte est rempli (parler à un PNJ, explorer un lieu, escorte) et un autre pas. Attendu : l'objectif rempli coché en vert, l'autre décoché ; un objectif « 3/10 » reste décoché. **Alt** pour comparer : l'objectif rempli y est gris.

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

### Patch 4: party member names under a quest (Nathan's request, 11/10)

- Issue: none, seen in game by the group (tooltip of a quest mob when several members have the quest).
- Clients: both (lines typed by the game, no string parsed).
- File: `Tooltips/Unit.lua`, quest line reading (`QuestPlayer`) and the quest section; `[pack patch]` markers.
- Cause: under the quest title the game writes each party member's name (`QuestPlayer` line, yellow in the default tooltip), then their objectives. PrettyTooltip drew the name like an objective: same beige, same indent, so names no longer stood out from "Midnight Orb: 1/3".
- Fix: a `QuestPlayer` line keeps the game's color (quest gold if unreadable) with an 8 indent; the objectives after it get a 16 indent, under the name. Nothing changes without party members on the quest.
- Re-apply: in the reading loop, set `row.player` and `row.playerColor` for `LINE.QuestPlayer`; when building the quest section, color and indent by `row.player`, indent 16 for objectives following a name. Drop it if upstream ever tells these lines apart.

### Patch 5: skinning badge lost for creatures missing from the data (audit, 11/10)

- Issue: none, found by the distinction audit below. Clients: both (the game's `UNIT_SKINNABLE_LEATHER`, "Skinnable" in English, the client's own word in French; no hard-coded text).
- File: `Tooltips/Unit.lua`, line reading (`readUnit`, the `SHOWN_ELSEWHERE` branch) and `badges`; `[pack patch]` markers.
- Cause: on a skinnable corpse the game adds the `UNIT_SKINNABLE_LEATHER` line. PrettyTooltip always drops it (`SHOWN_ELSEWHERE`, line 46, "shown as badges") but only shows the badge with `Data/Skinning.lua` data (CMaNGOS Classic 1.12 loot tables, by creature ID). For a creature missing from those tables, a Forever-only one for instance, the information is gone: no line, no badge. The CurseForge page says the opposite: what is not parsed stays at the bottom, "to preserve as much information as possible".
- Fix: the game's line, when present, also gives the badge. The details (Skinning required, leathers and hides, under **Shift**) stay limited to creatures in the data. Nothing changes for a known creature.
- Bench: the real `readUnit` on an unknown creature's corpse with the game's line, English and French: the release loses it, the pack's copy flags the badge.
- Re-apply: under `elseif SHOWN_ELSEWHERE[text] then` in `readUnit`, set `model.skinnable = true` when `text == UNIT_SKINNABLE_LEATHER`; in `badges`, `if model.skinning or model.skinnable then`. Drop it if upstream keeps the line or the badge without data.

### Patch 6: done objectives not ticked in the world map quest log (audit, 11/10)

- Issue: none, found by the audit. Clients: both (the game's `GRAY_FONT_COLOR`, no text read).
- File: `Tooltips/Quest.lua`, new `isGrey` (after `isRed`) and objective reading in `readRow`; `[pack patch]` markers.
- Cause: the tooltip of a quest hovered in the world map's quest log is written line by line by the game (`QuestMapLogTitleButton_OnEnter`, `Blizzard_UIPanels_Game/Mainline/QuestMapFrame.lua` 2257-2279, loaded on Forever): each objective white (`HIGHLIGHT_FONT_COLOR`), grey (`GRAY_FONT_COLOR`) once done; the same for required money. PrettyTooltip reads those lines without a type or a done flag and only ticks an objective ending in a reached "3/8" count. An objective without a count ("Speak to...", escort, area to explore, required money) stayed unticked and beige even when done, next to counted ones ticked correctly.
- Fix: on a line read from the tooltip (not a typed line), a font color equal to `GRAY_FONT_COLOR` (within 0.03) ticks the objective, as the game greys it. Typed lines reuse PrettyTooltip's dimmed color and are never read this way (a light grey 0.6 dimmed to 0.51 must not pass for grey). Without `GRAY_FONT_COLOR` in the client nothing changes.
- Bench: the real `readQuest` on the quest log's lines (a grey objective without a count, a white one, a counted one in progress, a counted one done) and on a typed light grey line, English and French: the release leaves the grey objective unticked, the pack's copy ticks it, nothing else moves.
- Re-apply: add `isGrey` after `isRed`, and before `objective.completed = objectiveDone(objective)`: `if objective.completed == nil and row.textColor ~= row.color and isGrey(row.textColor) then objective.completed = true end`. Drop it if upstream reads these lines' color.

### Distinction audit (Nathan's request, 11/10)

After patch 4, Nathan asked to look for other places where the default tooltip tells information apart (color, indent, order, separator) and PrettyTooltip renders it indistinct or misleading. Every tooltip type and every `Enum.TooltipDataLineType` was compared with Forever's UI code (Gethe/wow-ui-source, `forever` branch, build 1.60.1.70888). `TooltipDataRules.lua` only adds the unit name color, the objective done icon and the `GemSocketEnchantment` indent; everything else comes from the client's `leftColor`, `usable` and `completed` fields, which PrettyTooltip reads.

| Place (PrettyTooltip) | What the game tells apart | What PrettyTooltip does | Verdict |
|---|---|---|---|
| `Tooltips/Unit.lua`, party member name under a quest | `QuestPlayer` line in yellow, objectives below | Same beige, same indent | Fixed in 0.9.3 (patch 4) |
| `Tooltips/Unit.lua` 46, 263, 338: skinnable corpse | `UNIT_SKINNABLE_LEATHER` line | Line dropped, badge only for creatures in the data | Real problem, fixed (patch 5) |
| `Tooltips/Quest.lua` 63-67, 146-155: world map quest log | Done objective grey, open one white, with or without a count | Only an "n/m" count ticks it | Real problem, fixed (patch 6) |
| Items: required level, classes, races, profession, reputation; unusable weapon or armor type; binding, Unique; set pieces owned or not, set bonuses active or not; Already known, quest items, green effects, durability, missing reagents, green and red stat changes | Game colors | Kept (red for what is not met, `usable` flag, correction 1 for active bonuses) | Kept |
| Units: reaction color, tapped mob, level in difficulty color, target of target, guild, pet owner, `completed` objectives | Game colors | Kept ("You" in red as target) | Kept |
| Spells (unmet requirements, cooldown left), auras, world objects (requirements, skill-up color, lock), mail (COD in red without the money), flight paths (cost not colored by the game) | Game colors | Kept | Kept |
| Other addons' rows (`quietColor`, `Game/TooltipData.lua` 14-21: colors dimmed to 85 %, white to grey) | The addon's colors | Dimmed, set apart | Kept: Polestar's "Quest: 3/8" beige vs green when done, gear upgrade green, red, orange or grey still distinct, "Marked junk" red vs "Marked to keep" green; Auctionator colors its prices inside the text, untouched; only pure white and light grey come closer, and no such pair carries information. BuffAlerts adds no line. |

Author's announced style choices (CurseForge page), left alone: player names in class color rather than reaction color (faction crest and PvP badge still give hostility); gear lines rewritten as stats with icons instead of "Use:", "Equip:", "Chance on hit:" (with icons, the default, enchants and effects stay distinct; without them, enchants, beige instead of the game's green, `Item.lua` 1050, blend with stats); unparsed and other addons' rows grouped at the bottom, dimmed (see the last table row); spell cost, cast, cooldown and range strip, quest checklist, durability bar (more than the original).

Doubtful cases, untouched (check in game, **Alt** shows the default tooltip): a quest hovered in the map's quest log while in a group (`SetQuestPartyProgress` clears the tooltip, `TooltipDataHandler.lua` 272-274, so a member's name might be read as the title); party members on a quest object (`Tooltips/Object.lua` 203-215 does not read `QuestPlayer`, unknown whether the game sends it); a spell's cost in red without enough resource (`readStat`, `Spell.lua` 81-90, ignores the color); PvP, Dead and Corpse lines dropped while their badges need the unit (rare); the skinning badge shown from the data after the corpse is skinned (observe first); an NPC whose faction is literally "Alliance" or "Horde" (line dropped, crest only for players); minimap quest names all one color (upstream #15).

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
4. **Party names** (FR and EN clients): in a group sharing a quest, hover one of its mobs. Expected: under the quest title, each name in yellow, its objectives indented below in beige.
5. **Skinning badge** (FR and EN clients): kill a skinnable beast, hover the corpse. Expected: the skinning badge ("Skinnable") at the top, as before for a Classic beast, and now also for a Forever-only one. **Alt** for the default tooltip: badge present whenever the line is. Also note whether the badge stays after skinning (doubtful case).
6. **World map quest log** (FR and EN clients): open the map (M), hover a quest with one done objective without a count (talk to an NPC, explore, escort) and one not done. Expected: the done one ticked green, the other unticked; a "3/10" objective stays unticked. **Alt** to compare: the done one is grey there.
