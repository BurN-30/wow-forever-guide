# BuffAlerts Forever 3.11.4 : correctifs et réglages du pack / pack patches and defaults

Français d'abord, [English below](#english).

## Français

Le pack installe BuffAlerts Forever 3.11.4 (Thork, licence MIT), à partir du fichier publié sur [CurseForge](https://www.curseforge.com/wow/addons/buffalerts) (`BuffAlertsForever 3.11.4.zip`, SHA-256 `e94eb4ac638033fbd6b7b3e0e0d0df4a7cef89637108ad06c17f7fc28654c5b0`). Le numéro de version reste 3.11.4 dans `BuffAlertsForever.toc`, pour que l'auteur reconnaisse la base ; une ligne `## X-Pack-Patches:` signale les changements.

Les fichiers de la release ne sont pas modifiés, sauf trois lignes du `.toc` : `## X-Pack-Patches:`, `## DefaultState: disabled` (éteint à la première installation, réglage 6) et `PackPatches.lua`. Tout le code que le pack change tient dans ce seul fichier ajouté, `PackPatches.lua`, chargé en dernier par le `.toc` : il passe après `Data.lua`, `Core.lua`, `Party.lua` et `Options.lua`, mais avant les événements `ADDON_LOADED` et `PLAYER_LOGIN`, donc avant que l'addon lise ses réglages. Pour reprendre une nouvelle version de l'addon : recopier la release, puis rajouter au `.toc` la ligne `## X-Pack-Patches:` et la ligne `PackPatches.lua`, et vérifier que chaque correctif sert encore (voir « À retirer quand »).

Le diff complet est dans [`buffalerts-3.11.4.patch`](buffalerts-3.11.4.patch) : appliqué sur la release décompressée (`git -c core.autocrlf=false apply -p1 docs/buffalerts-3.11.4.patch` depuis le dossier qui contient `BuffAlertsForever`), il redonne le dossier `addons/BuffAlertsForever` du dépôt octet pour octet (vérifié le 10/11/2026). Les fichiers de l'addon sont en LF et le restent. Chaque correctif porte la marque `[pack patch #n]` dans `PackPatches.lua`.

### Méthode

- Code lu en entier : `Data.lua`, `Core.lua`, `Party.lua`, `Options.lua`, le `.toc`, le `CHANGELOG.md` de l'addon (3.11.4 à 1.0.0) et la page CurseForge (description, limites annoncées).
- Pas de suivi de bugs public. La page des commentaires CurseForge (15 commentaires annoncés) ne se lit pas sans navigateur (contenu chargé en JavaScript) : non lue, rien n'a été contourné.
- Le pack sert avec le client français (frFR) et le client anglais (enUS) : chaque alerte et chaque correction doivent marcher sur les deux. Ne sont corrigés que les vrais bugs dont la cause est certaine dans le code, avec une correction petite et locale.
- Numéros et noms des sorts vérifiés dans les tables SpellName (enUS et frFR), SpellMisc et SpellDuration du build 1.60.1.70862 (wago.tools, produit wowf).
- Le jeu ne peut pas être lancé ici. Banc hors jeu : les cinq fichiers de l'addon chargés sous Lua 5.1 (la version du jeu) avec un faux jeu (sorts connus, améliorations en cours, combat, sorts lancés), noms des sorts en français puis en anglais tirés de SpellName. 46 contrôles (guerrier, druide, démoniste, mage, alertes communes, fenêtre d'options) : la release reproduit le bug du correctif 1 en français, la copie du pack non, et rien ne change en anglais. Reste à confirmer en jeu (voir plus bas).

### Comment l'addon repère les alertes du groupe

Règle générale : un sort de classe est reconnu par son numéro (`FamilyOf`, `Core.lua` lignes 99 à 110). Au chargement, chaque numéro est validé en comparant son nom à celui du rang 1, dans la langue du client (`ValidateIds`, `Core.lua` 209 à 221) : un numéro qui n'existe pas sur Forever (rangs de Burning Crusade) est écarté. Le nom traduit sert seulement de repli, construit à partir des numéros (`Resolve`, `Core.lua` 239 à 248). Hors combat, les améliorations sont relues en continu (`RefreshSelfFromAuras`, 344 à 363) ; en combat le jeu les cache (`AurasLocked`, 308 à 315), et l'addon part de la dernière lecture d'avant le combat (1008 à 1012) et de ses propres sorts lancés (`UNIT_SPELLCAST_SUCCEEDED`, 1049 à 1050, `OnPlayerCast` 415 à 444).

| Alerte | Classe | Repérage | Fichier:ligne | frFR | enUS |
|---|---|---|---|---|---|
| Cri de guerre (*Battle Shout*), en combat | Guerrier | Numéros des rangs 6673, 5242, 6192, 11549, 11550, 11551, 25289 (« Cri de guerre » / « Battle Shout » sur le build) ; 2048 absent, écarté. En combat : lecture d'avant le combat, ou le sort lancé, durée lue sur l'amélioration, sinon 180 s (identique au build : SpellMisc 6673, durée n° 25 = 180 000 ms). Compte à rebours 5 s avant la fin. | `Data.lua` 6, 151-152, 338 ; `Core.lua` 586-620 | oui | oui |
| Fulgurance (*Overpower*), Vengeance (*Revenge*), Exécution (*Execute*) | Guerrier | `C_Spell.IsSpellUsable` sur le numéro du meilleur rang connu ; Exécution aussi sous 20 % de vie quand seule la rage manque. *Victory Rush* (34428) n'existe pas sur Forever : pas d'icône. | `Data.lua` 50-53, 253-258 ; `Core.lua` 623-668 | oui | oui |
| Marque du fauve (*Mark of the Wild*), Don du fauve compte aussi | Druide | Numéros 1126 à 9885 (7 rangs), Don du fauve 21849 et 21850. Indicateur à côté des cadres du groupe pour chaque membre sans la Marque (hors combat, hors raid). | `Data.lua` 84, 228-229, 297-298 ; `Party.lua` 54-72 | oui | oui |
| Épines (*Thorns*) | Druide | Numéros 467 à 9910 (6 rangs). Affichée en et hors combat. | `Data.lua` 26, 172-173, 378 | oui | oui |
| Augure de clarté (*Omen of Clarity*) | Druide | Numéro 16864, seulement si le talent est appris. | `Data.lua` 27, 175-176 | oui | oui |
| Armure (Peau de démon, Armure démoniaque) | Démoniste | Numéros 687, 696 et 706 à 11735 ; *Fel Armor* n'existe pas sur Forever, écartée. N'importe quelle armure éteint l'alerte. | `Data.lua` 76-78, 212-213 | oui | oui |
| Démon absent | Démoniste | Sort 688 (Invocation d'un diablotin) connu, et `UnitExists("pet")` faux. En et hors combat. | `Data.lua` 269 ; `Core.lua` 671-682 | oui | oui |
| Fragments d'âme (*Soul Shard*) | Démoniste | Nombre de l'objet 6265, alerte sous 5, hors combat. | `Data.lua` 283-284, 334 ; `Core.lua` 801-806 | oui | oui |
| Armure (givre, glace, mage) | Mage | Numéros des rangs ; l'icône propose l'armure de la spécialisation, repérée par des talents (numéros), mais n'importe quelle armure éteint l'alerte. *Molten Armor* absente de Forever, écartée. | `Data.lua` 80-83, 215-223, 313-317 | oui | oui |
| Intelligence des arcanes (*Arcane Intellect*), Illumination des arcanes compte aussi | Mage | Numéros 1459 à 10157, Illumination 23028. Indicateur à côté des cadres du groupe, classes à mana seulement. | `Data.lua` 85, 225-226, 295-296 | oui | oui |
| Nourriture (« Bien nourri », *Well Fed*), hors combat | Toutes | **Nom anglais seul** (« Well Fed »), aucun numéro. | `Data.lua` 63-64, 203-204 | **non**, corrigé (correctif 1) | oui |
| Feu de camp (« Avantages du camp », *Camp Benefits*), hors combat | Toutes | **Noms et fragments anglais seuls**, aucun numéro. | `Data.lua` 66-68, 205-206 | **non**, corrigé (correctif 1) | oui |
| Arme absente | Toutes | Numéro de l'objet de la main droite (emplacement 16). | `Core.lua` 828-836 | oui | oui |
| Durabilité | Toutes | `GetInventoryItemDurability`, alerte sous 20 %. | `Data.lua` 333 ; `Core.lua` 837-849 | oui | oui |

Le seul texte écrit en dur qui sert à repérer quelque chose en dehors de ces deux alertes est la ligne d'enchantement temporaire de l'infobulle d'arme (`TooltipHasTempEnchant`, `Core.lua` 700 à 711, « (5 min) », « (30 sec) ») : elle ne sert qu'au voleur et au chaman, en repli quand le jeu ne donne rien. Hors groupe, laissée telle quelle.

### Correctif 1 : nourriture et feu de camp dans la langue du client

- Clients : français (et toute autre langue que l'anglais). Sur le client anglais, rien ne change.
- Fichiers : `Data.lua` lignes 63 à 68 (familles `wellFed` et `campfire`, listes `ids` vides), `Core.lua` 104 à 109 (repli par nom dans `FamilyOf`) et 239 à 252 (table des noms).
- Cause : ces deux améliorations n'ont pas de numéro de sort dans l'addon, seulement des noms anglais (« Well Fed » ; « Camp Benefits », « Cozy Fire », « Warm Fire », « Increased Stamina », « Increased Spirit » et les fragments « Camp Benefit », « Cozy », « Campfire », « Camp Fire », « Warm »). Le client français nomme l'amélioration « Bien nourri » et celle du camp « Avantages du camp » : aucune correspondance, donc l'icône de nourriture et celle du feu de camp restent affichées en permanence hors combat, même nourri et au camp. Reproduit au banc avec la release.
- Correction (`PackPatches.lua`, `[pack patch #1]`) : chaque nom anglais exact de ces listes reçoit son équivalent dans la langue du client, lu par `C_Spell.GetSpellName` sur un sort qui porte exactement ce nom anglais dans le build 1.60.1.70862. Ajout fait au chargement, refait à la connexion ; le cœur de l'addon reconstruit sa table de noms toutes les 5 s hors combat. Sur le client anglais les noms obtenus sont ceux déjà présents : rien n'est ajouté.

| Famille | Sort | enUS | frFR |
|---|---|---|---|
| `wellFed` | 19705 | Well Fed | Bien nourri |
| `wellFed` | 1283082 | Well Fed | Personnage bien nourri |
| `campfire` | 1229741 | Camp Benefits | Avantages du camp |
| `campfire` | 7353 | Cozy Fire | Feu douillet |
| `campfire` | 18191 | Increased Stamina | Endurance augmentée |
| `campfire` | 18193 | Increased Spirit | Esprit augmenté |

- Vérifié sur tout SpellName : les 30 sorts nommés « Well Fed » en anglais s'appellent « Bien nourri » (27) ou « Personnage bien nourri » (3) en français, et ces deux noms français ne désignent que des « Well Fed ». Même correspondance exacte, dans les deux sens, pour les quatre noms du camp. Le français reconnaît donc exactement les mêmes améliorations que l'anglais. « Warm Fire » n'existe pas sur le build (aucun sort de ce nom) : rien à traduire.
- Laissé : les fragments anglais (« Cozy », « Warm »…) restent valables en anglais seulement. Le français s'appuie sur les noms exacts, dont « Avantages du camp », l'amélioration de camp de Forever confirmée par l'auteur en 3.11.4.
- À retirer quand : l'amont donne des numéros de sort à `wellFed` et `campfire`, ou traduit ces noms.

### Réglage 2 : son sur l'alerte du Cri de guerre

- Clients : les deux.
- Valeur : `ns.DEFAULTS.battleShout.sound = true` (`PackPatches.lua`, `[pack patch #2]`). Toutes les autres valeurs par défaut restent celles de l'auteur (`Data.lua` 326 à 383).
- Pourquoi : un membre du groupe joue guerrier et veut un rappel quand son Cri de guerre manque. L'icône seule passe facilement inaperçue en plein combat. L'option « Play sound » existe, éteinte par défaut, mais le client ne recharge pas les réglages de l'addon à la connexion (limite annoncée par l'auteur) : cochée à la main, elle serait perdue à chaque connexion. Seule une valeur par défaut tient.
- Effet (`ShowPlain`, `Core.lua` 571 à 577) : le son d'avertissement de raid (`SOUNDKIT.RAID_WARNING`, canal principal), une fois, au moment où l'icône apparaît : en entrant en combat sans Cri de guerre, et 5 s avant sa fin en combat. Pas de répétition tant que l'icône reste. L'alerte reste « en combat seulement », comme dans la release.
- Une valeur enregistrée l'emporte toujours (`CopyDefaults`, `Core.lua` 24 à 33, ne remplit que les réglages absents) : si le client se met à recharger les réglages, un « Play sound » décoché reste décoché. « Reset to defaults » remet le son, comme toute valeur du guide (avec le correctif 5).
- Couper le son : `/balert`, section Battle Shout, décocher « Play sound » (jusqu'à la déconnexion).

### Correctif 3 : touches de la fenêtre d'options en combat

- Clients : les deux.
- Fichier : `Options.lua` lignes 342 à 350 (script `OnKeyDown` de la fenêtre).
- Cause : la fenêtre capte le clavier et appelle `SetPropagateKeyboardInput` à chaque touche pour laisser passer les touches au jeu. Le client refuse cet appel en combat (action bloquée) : Polestar le note sur le même client et s'en garde (`Theme/Widgets.lua` 2145, `UI/Gamepad.lua` 625 à 630, « the client refuses the change in a fight »). Fenêtre `/balert` ouverte en combat : message d'action bloquée à chaque touche.
- Correction (`PackPatches.lua`, `[pack patch #3]`) : le même script, avec l'appel fait hors combat seulement ; Échap ferme toujours la fenêtre. La fonction `ns.CreateOptions` est enveloppée pour poser ce script après la création de la fenêtre.
- Limite : en combat, les touches suivent le dernier choix fait hors combat ; une fenêtre ouverte pour la première fois en combat peut garder les touches jusqu'à Échap.
- À retirer quand : l'amont protège cet appel.

### Réglage 4 : grandes alertes sous les améliorations, en taille moyenne

- Clients : les deux (aucun texte lu, seulement des positions).
- Demande de Nathan : plus de grandes icônes au milieu de l'écran. Dans la release, elles sont centrées (`Data.lua` 337 à 382 : 64 px, y = +150, donc de 118 à 182 px au-dessus du centre ; seconde rangée du chasseur à y = +80). Choix retenu : près des améliorations, en haut à droite, sous la rangée des améliorations du joueur, à gauche de la minicarte, en taille moyenne. Le son du Cri de guerre (réglage 2) ne change pas.
- Valeurs (`PackPatches.lua`, `[pack patch #4]`) : taille 40 (au lieu de 64) et ancre `PACK_BUFFS` : le coin haut droit de chaque icône est posé au coin bas droit du cadre des améliorations du jeu (`BuffFrame`), décalé de `x` et `y`. Quatre emplacements, de droite à gauche x = -155, -199, -243, -287 (pas de 44 : 40 px d'icône et 4 d'écart) ; rangée 1 à y = -115, rangée 2 à y = -159. L'ordre de gauche à droite de la release est gardé, rangée calée à droite.

| Classe | Rangée 1, de gauche à droite | Rangée 2 |
|---|---|---|
| Guerrier | Cri de guerre, Fulgurance, Vengeance, Exécution | (*Victory Rush*, absente de Forever, jamais affichée) |
| Chasseur | Aspect, Aura de précision, familier absent, aspect de la meute ou du guépard en combat | Morsure de la mangouste, Contre-attaque (sous les 2e et 3e) |
| Prêtre | Feu intérieur, Robustesse, Esprit divin, Protection contre l'Ombre | |
| Paladin | Bénédiction, aura, Fureur vertueuse, sceau | |
| Druide | Marque du fauve, Augure de clarté, Épines (3 emplacements de droite) | |
| Mage, démoniste, voleur, chaman | armure ou bouclier, puis intelligence, démon, riposte ou arme (2 emplacements de droite) | |

- Ancré au cadre des améliorations, pas à l'écran : le Mode édition du jeu déplace ce cadre (système « Améliorations », position par défaut `TOPRIGHT` -255, -10 dans `Blizzard_EditMode/Mainline/EditModePresetLayouts.lua` 433 à 450, la même dans la disposition Classique, ligne 1199), et le jeu le descend quand un bandeau de ticket MJ ou de sondage s'affiche (`Blizzard_StatusTrayManager/StatusTrayManager.lua` 36 à 43) : la rangée suit. Le cadre a toujours la taille de sa grille complète : `AuraFrameMixin:UpdateSize` (`Blizzard_BuffFrame/BuffFrame.lua` 289 à 309) compte les 32 emplacements (`BUFF_MAX_DISPLAY`) quand `ignoreDisabledAurasForSize` n'est pas posé, ce qui est le cas de `BuffFrame` ; 11 par rangée, donc 3 rangées de 45 unités (135 de haut). Son bord bas est sous la 3e rangée même avec une seule amélioration : la rangée des alertes ne recouvre jamais les améliorations, quel que soit leur nombre. Source : dépôt Gethe/wow-ui-source, branche `forever`, build 1.60.1.70888 (Forever charge la famille Mainline, type de jeu camelot).
- Pas de corruption (*taint*) : aucun cadre du jeu n'est modifié, appelé ni accroché ; seules nos icônes (cadres ordinaires, ni protégés ni cliquables hors « Move icons ») reçoivent un point d'ancrage vers `BuffFrame`, comme Polestar et BugSack ancrent leurs boutons à `Minimap`. Si `BuffFrame` n'existe pas, même place comptée depuis le coin haut droit de l'écran (`UIParent`, `TOPRIGHT`, x = -410, y = -260 pour l'emplacement de droite).
- Place à l'écran avec la disposition par défaut, en unités d'interface depuis le coin haut droit : rangée 1 de x = -410 à -582, y = -260 à -300 ; rangée 2 de y = -304 à -344. Ce qu'il y a autour :

| Cadre | Place (x ; y depuis le coin haut droit) | Source | Recouvrement |
|---|---|---|---|
| Améliorations (`BuffFrame`) | -255 à -655 ; -10 à -145 | préréglage du Mode édition, `BuffFrame.lua` 289 à 309 | non |
| Affaiblissements (`DebuffFrame`, 2 rangées de 8) | -270 à -550 ; -155 à -245 | préréglage, lignes 451 à 467 | non ; le badge « Train » d'une icône (voir plus bas) n'atteindrait que la 2e rangée, à partir du 13e affaiblissement |
| Minicarte (`MinimapCluster`), calendrier, horloge, boutons Polestar (225°) et BugSack (160°) sur son bord | 0 à -256 ; 0 à -256 | `Blizzard_Minimap/Mainline/Minimap.xml` 3 à 10 | non |
| Fenêtre du guide Polestar | -64 à -404 ; à partir de -240 | `Polestar/UI/GuideFrame.lua` 3349, largeur 340 (`UI/UI.lua` 29) | non (6 unités d'écart) |
| Suivi des objectifs du jeu | -110 à -370 ; à partir de -275 | préréglage, lignes 555 à 567 ; largeur 260 | non |
| Flèche de Polestar | centre ± 100 ; -140 à -270 | `Polestar/Nav/Arrow.lua` 82 à 85 et 630 | non en 16:9 (voir les échelles) |
| Petite rangée utilitaire de BuffAlerts | centre -84 à +172 ; -40 à -76 | `Data.lua` 330 à 336 | non |

- Badge « Train » et textes au-dessus d'une icône : le badge (18 unités, `Core.lua` 497 à 511 et 527) et le mot « Train » montent jusqu'à environ 38 unités au-dessus (y = -222), dans le vide sous les affaiblissements. Le mot rouge « Switch aspect » du chasseur (aspect de la meute ou du guépard en combat) dépasse d'environ 17 unités sur le coin haut gauche de la fenêtre du guide, le temps de l'alerte.
- Échelles d'interface : toutes ces places se comptent depuis le coin haut droit, en unités d'interface ; elles ne bougent pas les unes par rapport aux autres quand l'échelle change. Seule la flèche de Polestar, centrée, se rapproche quand l'écran est étroit. Banc hors jeu (fichiers de l'addon sous Lua 5.1, faux `BuffFrame` à sa place par défaut, les neuf classes) en 16:9 à des hauteurs d'interface de 768 (échelle 1, 1365 de large), 900, 1082 et 1200 (2133 de large) : aucun recouvrement avec les cadres du tableau, ni entre icônes. À 768 de haut, l'icône de gauche s'arrête à 0,7 unité du cadre de la flèche. Les écrans 1920x1080 et 2560x1440 sont en 16:9 : même disposition, seule la taille réelle change (40 unités font 56 px en 1080p et 75 px en 1440p à l'échelle 1 ; 36 et 48 px à la hauteur 1200).
- Limites : en 16:10 (1920x1200) à l'échelle 1, la flèche (x de -514 à -714) touche le haut des deux icônes de gauche sur 10 unités, au niveau de la ligne de distance. Un cadre déplacé par le joueur (fenêtre du guide plus large que 340, améliorations déplacées dans le Mode édition) change ces calculs ; dans ce cas, déplacer les icônes (`/balert`, « Move icons ») ou la flèche.
- Taille moyenne : 40, soit 62,5 % de 64. Raisons : 4/3 d'une icône d'amélioration du jeu (30), l'alerte ressort à côté des améliorations sans prendre l'écran ; le compte à rebours reste lisible (police 24, `math.floor(40 * 0.62)`, `Core.lua` 524) et le badge « Train » garde 18 (`Core.lua` 527) ; quatre icônes (172 unités) tiennent entre la fenêtre du guide et la flèche à l'échelle 1. À 42 ou plus, les rangées de quatre (guerrier, paladin, prêtre, chasseur) toucheraient la flèche à 768 de haut ; sous 38, on sort de la fourchette voulue (60 à 70 %).
- Un choix enregistré l'emporte : `CopyDefaults` ne remplit que les réglages absents. Un piège est traité : si le client recharge un jour des réglages enregistrés avant cette version, le champ `anchor` (absent de ces anciens réglages) serait rempli par `PACK_BUFFS` à côté d'anciens `x` et `y` comptés depuis le centre de l'écran, et l'icône partirait en haut de l'écran. À la première mise en place de la session, `PackPatches.lua` vérifie : des réglages marqués par le pack (`packLayout = 1`) sont pris tels quels ; sinon, une icône restée à la place par défaut de la release prend celle du pack, et une icône que le joueur avait placée ou redimensionnée garde sa place (ancre au centre).
- Déplacer une icône (`/balert`, « Move icons ») : enregistrée depuis le centre de l'écran, comme dans la release (l'ancre passe au centre juste avant `SaveFramePosition`, `Core.lua` 449 à 459). Les curseurs « Position X » et « Position Y » de `/balert` déplacent l'icône depuis son ancre sous les améliorations. « Reset to defaults » remet la disposition du pack (avec le correctif 5).
- Contrôles du banc (29) : place et taille des icônes, rangée utilitaire inchangée, glisser, curseur, remise à zéro, anciens réglages de la release (place par défaut, icône déplacée, icône redimensionnée), réglages du pack, absence de `BuffFrame`.
- À revoir quand : l'amont change `ns.ApplyLayout` ou les ancres, ou la disposition par défaut des améliorations change.

### Correctif 5 : « Reset to defaults » s'arrête en cours de route

- Clients : les deux.
- Fichiers : `Core.lua` lignes 549 à 556 (`ns.ResetDefaults`), `Data.lua` 328 (`hideAll = false`).
- Cause : `ns.ResetDefaults` parcourt chaque entrée de `ns.DEFAULTS` avec `pairs(def)`, or `hideAll` vaut `false`, pas une table : erreur Lua « bad argument #1 to 'pairs' (table expected, got boolean) » dès que cette entrée arrive. L'ordre de `pairs` n'étant pas fixe, une partie des alertes est remise à zéro et pas le reste ; `Resolve()` et `ns.Update()` ne sont jamais appelés, et BugSack attrape l'erreur. Touche le bouton « Reset to defaults » et `/balert reset`. Reproduit au banc avec la release.
- Correction (`PackPatches.lua`, `[pack patch #5]`) : `ns.ResetDefaults` est enveloppée ; les valeurs simples (`hideAll`) sont remises à zéro directement et retirées de `ns.DEFAULTS` le temps de l'appel d'origine, puis remises.
- À retirer quand : l'amont saute les valeurs qui ne sont pas des tables.

### Réglage 6 : éteint à la première installation (0.10.0)

- Clients : les deux. Demande de Nathan : BuffAlerts ne doit pas s'imposer ; qui en veut l'allume.
- Avant la 0.10.0, l'addon était chargé et actif dès l'installation : toutes les alertes de la classe jouée (tableau plus haut), réglages de l'auteur, plus les réglages 2 et 4.
- Valeur : `## DefaultState: disabled` dans `BuffAlertsForever.toc`. Aucun fichier Lua ne change.
- Fonctionnement : le jeu garde, pour chaque personnage, la liste des addons cochés ou décochés (`WTF\Account\<compte>\<royaume>\<personnage>\AddOns.txt`). `DefaultState` ne sert qu'à un addon dont le jeu n'a encore aucun état enregistré sur le compte : il apparaît alors décoché dans la liste des addons et ne se charge pas (aucune mémoire, aucun événement). Un addon déjà vu garde l'état enregistré. Sources : [Warcraft Wiki, TOC format](https://warcraft.wiki.gg/wiki/TOC_format) (« Set to disabled to require the user to explicitly enable the addon in the AddOn List », lu le 12/11/2026) ; l'interface du client Forever 1.60.1.70888 lit cet état par défaut (`C_AddOns.IsAddOnDefaultEnabled`, `Blizzard_AddOnList/AddonList.lua` 961 et 969 à 978 : entrée `ADDON_LIST_RESET_TO_DEFAULT` du clic droit dans la liste des addons ; dépôt Gethe/wow-ui-source, branche `forever`) ; la règle « aucun état enregistré sur le compte » vient d'un code décompilé du client 3.3.5 (`UIUtil/AddOns.cpp`, `ComputeAddOnEnableState`) : supposée identique sur Forever, à vérifier en jeu.
- Ce que cela change :

| Joueur | BuffAlerts après la mise à jour |
|---|---|
| Première installation du paquet | décoché, rien ne s'affiche |
| Ami qui a déjà le paquet (0.4.0 à 0.9.9) | inchangé : coché s'il l'était, décoché s'il l'avait décoché |
| Nouveau personnage d'un ami qui a déjà le paquet | même état que ses autres personnages (coché partout : coché) |

- Pourquoi pas un réglage interne (« alertes cachées à la première installation », `hideAll = true` par défaut) : l'addon resterait chargé pour rien ; un ami qui a déjà le paquet garde aussi son `hideAll = false` enregistré, donc rien de mieux ; et si les réglages reviennent vraiment à zéro à chaque connexion (limite annoncée par l'auteur, voir « Laissé tel quel »), les alertes se recacheraient à chaque connexion, même allumées à la main. La case de la liste des addons est gardée par le jeu lui-même, pas par l'addon.
- Allumer : écran des personnages, bouton **AddOns**, cocher **BuffAlerts Forever** (pour tous les personnages ou celui-ci), puis entrer en jeu. En jeu : menu Échap, **AddOns**, cocher, puis recharger l'interface. Éteindre chez un ami qui l'a déjà : décocher au même endroit.
- Contrôle du banc (`tools/check-lua.py`, partie 5) : seul `BuffAlertsForever` porte `## DefaultState: disabled` parmi les dossiers de `addons/`.

### Conflits examinés

- **Polestar** : commandes `/balert` et `/buffalerts` (BuffAlerts) distinctes de `/polestar`, `/pole`, `/way`, `/ga` et `/ptip`. Noms globaux propres (`BuffAlertsForeverDB`, `BuffAlertsForever_<alerte>`, `BuffAlertsForeverOptions`). Aucun crochet (`hooksecurefunc`), aucune infobulle, aucun cadre protégé touché : pas de corruption (*taint*) possible par ce chemin. Les icônes ne prennent pas la souris (`EnableMouse(false)`, `Core.lua` 467) : la flèche, ses boutons et le cadre de guide restent cliquables à travers.
- **Positions par rapport à Polestar** : la rangée de petites icônes est ancrée en haut (`TOP`, y = -40, 36 px, donc de 40 à 76 px du haut) ; le bandeau de transport de Polestar commence à 72 px (`Nav/Alerts.lua` 77 à 88) : 4 px de recouvrement, seulement quand les deux s'affichent ensemble. Les grandes icônes étaient centrées à y = +150 dans la release et tombaient, à l'échelle 1, sur la distance et le nom sous le cadran de la flèche de Polestar ; depuis le réglage 4, elles sont en haut à droite, sous les améliorations, à l'écart de la flèche, de la fenêtre du guide et de la minicarte (tableau du réglage 4).
- **PrettyTooltip** : BuffAlerts n'affiche aucune infobulle et n'utilise pas `GameTooltip` ; seule lecture, `C_TooltipInfo.GetInventoryItem` (données, sans cadre), et seulement pour le voleur et le chaman.
- **Auctionator** : rien en commun (ni événement exclusif, ni nom global, ni cadre).
- **Gestionnaire de temps de recharge du jeu** (*Cooldown Manager*) : BuffAlerts n'y touche pas. Les deux se complètent : la barre suivie montre le temps restant du Cri de guerre, BuffAlerts signale son absence. Positions par défaut du gestionnaire dans l'interface moderne (Blizzard, `EditModePresetLayouts.lua`) : barres suivies en bas à droite du centre (x = +420), icônes en bas au centre : loin des icônes de BuffAlerts (en haut à droite depuis le réglage 4). Les positions de Forever ne sont pas publiées : à vérifier en jeu.
- **Fenêtre d'options du jeu** : le bouton « Open options » de BuffAlerts dans Options › AddOns ferme le panneau du jeu par `HideUIPanel` (`Options.lua` 440) ; risque de corruption faible, seulement à ce clic. Préférer `/balert`.

### Laissé tel quel

- Réglages remis à zéro à chaque connexion : l'auteur l'attribue au client bêta. Polestar, sur le même client, retrouve ses réglages et sa progression ; le code de BuffAlerts (`## SavedVariables: BuffAlertsForeverDB`, `ADDON_LOADED`, `Core.lua` 930 à 934) ne montre pas de cause. Cause non certaine : rien de corrigé, à observer en jeu.
- Épines affichée hors combat pour tous les druides, y compris en forme de félin : choix de l'auteur, à décocher dans `/balert` si inutile.
- Feu de camp : l'icône reste hors camp, c'est le principe de l'alerte (rappel de camper).
- Seuils : fragments d'âme sous 5, durabilité sous 20 % : valeurs de l'auteur, raisonnables pour le groupe.
- Interface de l'addon en anglais, noms des sorts dans la langue du client.

### À vérifier en jeu

1. **Cri de guerre** (guerrier, clients FR et EN) : sans Cri de guerre, engager un combat : icône en haut à droite, sous les améliorations, et son d'avertissement. Lancer le Cri : l'icône disparaît. Rester en combat jusqu'aux 5 dernières secondes : icône avec compte à rebours et son. Hors combat : jamais d'icône. Vérifier aussi qu'un Cri lancé avant le combat éteint bien l'alerte à l'engagement.
2. **Fulgurance, Vengeance, Exécution** (guerrier, FR et EN) : icônes quand le jeu les rend utilisables, avec compte à rebours pour Fulgurance et Vengeance.
3. **Nourriture et feu de camp** (toutes classes, client FR d'abord, puis EN) : manger un plat qui donne « Bien nourri » : l'icône de nourriture disparaît. S'installer à un feu de camp jusqu'à « Avantages du camp » : l'icône du feu de camp disparaît. Si une icône reste, taper `/balert buffs` et noter le nom et le numéro affichés.
4. **Druide** (FR et EN) : Marque du fauve, Épines, Augure de clarté (si le talent est pris) s'éteignent une fois lancés, y compris en forme de félin ; en groupe, petite icône de la Marque à côté du cadre d'un membre qui ne l'a pas.
5. **Démoniste** (FR et EN) : armure (Peau de démon ou Armure démoniaque), icône « démon absent » quand le démon est renvoyé ou mort, icône des fragments d'âme sous 5 (hors combat).
6. **Mage** (FR et EN) : armure et Intelligence des arcanes ; en groupe, icône d'Intelligence à côté des membres à mana qui ne l'ont pas (pas à côté du guerrier).
7. **Place des alertes** (une classe à quatre icônes, guerrier, paladin, prêtre ou chasseur, puis une autre ; clients FR et EN) : `/balert`, « Move icons » pour toutes les montrer. Attendu : une rangée de quatre icônes moyennes en haut à droite, sous les améliorations et les affaiblissements, à gauche de la fenêtre du guide ; rien sur la minicarte, ses boutons (Polestar, BugSack), le calendrier, l'horloge, la fenêtre du guide, la flèche de Polestar ni la petite rangée du haut. Refaire avec plusieurs améliorations (deux rangées si possible) et à deux échelles d'interface (réglage d'échelle de l'interface des options graphiques du jeu, *UI Scale*) : la rangée reste sous les améliorations. Déplacer les améliorations dans le Mode édition : les alertes suivent. « Lock icons » pour finir.
8. **Fenêtre d'options en combat** (une classe, un client) : `/balert` ouvert en combat, appuyer sur une touche de déplacement puis Échap : pas de message d'action bloquée, la fenêtre se ferme.
9. **Réglages** (une classe, un client) : décocher une option dans `/balert`, se déconnecter puis se reconnecter : noter si l'option revient (bogue annoncé) ou reste.
10. **Gestionnaire de temps de recharge** (guerrier) : la barre du Cri de guerre et l'icône de BuffAlerts ne se recouvrent pas.
11. **Reset to defaults** (une classe, un client) : dans `/balert`, « Move icons », glisser une icône ailleurs, « Lock icons », puis « Reset to defaults ». Attendu : aucune erreur (BugSack reste muet), l'icône revient sous les améliorations, « Hide all alerts » décoché.
12. **Éteint à la première installation** (réglage 6, un client) : sur un compte qui n'a jamais eu BuffAlerts (ou après avoir retiré la ligne `BuffAlertsForever` de chaque `AddOns.txt` du compte, jeu fermé), installer le paquet : BuffAlerts Forever décoché dans la liste des addons, aucune icône en jeu. Le cocher : les alertes reviennent. Sur le compte d'un ami qui l'avait déjà : toujours coché après la mise à jour.

## English

BuffAlerts Forever 3.11.4 (Thork, MIT licence), installed from the file published on [CurseForge](https://www.curseforge.com/wow/addons/buffalerts) (`BuffAlertsForever 3.11.4.zip`, SHA-256 `e94eb4ac638033fbd6b7b3e0e0d0df4a7cef89637108ad06c17f7fc28654c5b0`). `BuffAlertsForever.toc` keeps version 3.11.4 so the author recognises the base; a `## X-Pack-Patches:` line flags the changes.

The release files are not modified, except three `.toc` lines: `## X-Pack-Patches:`, `## DefaultState: disabled` (off on a first install, default 6) and `PackPatches.lua`. All the code the pack changes lives in that one added file, `PackPatches.lua`, listed last in the `.toc`: it runs after `Data.lua`, `Core.lua`, `Party.lua` and `Options.lua` but before `ADDON_LOADED` and `PLAYER_LOGIN`, so before the addon reads its settings. To take a new upstream version: copy the release, add the `## X-Pack-Patches:` and `PackPatches.lua` lines back to the `.toc`, and check each patch is still needed. The full diff is [`buffalerts-3.11.4.patch`](buffalerts-3.11.4.patch): `git -c core.autocrlf=false apply -p1 docs/buffalerts-3.11.4.patch`, run from the folder holding the unzipped `BuffAlertsForever`, rebuilds the repository's `addons/BuffAlertsForever` byte for byte (checked 2026-11-10; files stay LF). Each patch carries a `[pack patch #n]` mark.

### Method

- Whole code read (`Data.lua`, `Core.lua`, `Party.lua`, `Options.lua`, `.toc`, the addon's changelog, the CurseForge page). No public bug tracker; the CurseForge comments page only renders with JavaScript and was not read (nothing was bypassed).
- The pack is played with both the French and the English client: every alert and fix must work on both. Only real bugs with a certain cause and a small, local fix are patched.
- Spell IDs and names checked against SpellName (enUS and frFR), SpellMisc and SpellDuration of build 1.60.1.70862 (wago.tools, product wowf).
- The game cannot be run here. Offline bench: the addon's five files loaded under Lua 5.1 with a fake game, French then English spell names from SpellName, 46 checks (warrior, druid, warlock, mage, shared alerts, options window). The release reproduces patch 1's bug in French, the pack's copy does not, and nothing changes in English.

### How the group's alerts are detected

Class spells are matched by spell ID (`FamilyOf`, `Core.lua` 99-110), each ID validated against its rank 1 name in the client's language (`ValidateIds`, 209-221; Burning Crusade ranks missing from Forever are dropped). In combat auras are hidden: the addon uses the last reading before the pull and its own casts (`Core.lua` 1008-1012, 1049-1050, 415-444). Battle Shout (6673 to 25289, 180 s like SpellDuration on the build), Overpower, Revenge, Execute (`IsSpellUsable` by ID), Mark of the Wild and Gift of the Wild, Thorns, Omen of Clarity, warlock and mage armors, Arcane Intellect and Arcane Brilliance, missing pet (`UnitExists("pet")`), soul shards (item 6265), missing weapon (item ID) and durability (API) all work on both clients. Victory Rush, Fel Armor and Molten Armor do not exist on Forever and are dropped. Only the food and campfire alerts relied on English names (`Data.lua` 63-68): fixed by patch 1.

### Patch 1: food and campfire buffs in the client's language

- Clients: French (and any non-English client); English unchanged.
- Cause: `wellFed` and `campfire` have no spell ID, only English names ("Well Fed"; "Camp Benefits", "Cozy Fire", "Warm Fire", "Increased Stamina", "Increased Spirit", plus English fragments). The French client calls them "Bien nourri" and "Avantages du camp", so both icons stay up out of combat even when fed and camped.
- Fix: each exact English name gets its twin in the client's language through `C_Spell.GetSpellName` on a spell with exactly that English name (19705 and 1283082 for Well Fed, 1229741, 7353, 18191, 18193 for the camp names), at load and again at login. Checked over the whole SpellName table: the English and French names map one to one, so French matches exactly the buffs English does. The English-only fragments ("Cozy", "Warm"...) are left as they are.
- Drop it once upstream gives these families spell IDs or translates the names.

### Default 2: sound on the Battle Shout alert

- `ns.DEFAULTS.battleShout.sound = true`; every other default stays the author's. A warrior in the group asked for a reminder when Battle Shout is missing, and this client does not load the addon's settings back at login, so only a default lasts. Effect: the raid warning sound once when the icon appears (combat start without Battle Shout, and 5 s before it ends in combat). A saved choice still wins (`CopyDefaults` only fills missing values). Turn it off: `/balert`, Battle Shout, untick "Play sound". "Reset to defaults" brings the sound back (with patch 5).

### Patch 3: options window keys in combat

- `Options.lua` 342-350 calls `SetPropagateKeyboardInput` on every key; the client refuses that call in combat (Polestar notes it on the same client, `Theme/Widgets.lua` 2145, `UI/Gamepad.lua` 625-630). Fix: the same handler, with the call made out of combat only; Escape still closes the window.

### Default 4: large alerts under the buffs, medium size

- Clients: both (positions only, no text read).
- Nathan's request: no more large icons in the middle of the screen (release: `Data.lua` 337-382, centred, 64 px at y = +150, 118 to 182 px above the centre; the hunter's second row at y = +80). Chosen spot: near the buffs, top right, under the player's buff row, left of the minimap, medium size. The Battle Shout sound (default 2) is unchanged.
- Values (`PackPatches.lua`, `[pack patch #4]`): size 40 instead of 64, anchor `PACK_BUFFS`: each icon's top-right corner sits at the bottom-right corner of the game's buff frame (`BuffFrame`), offset by `x` and `y`. Four slots, right to left x = -155, -199, -243, -287 (44 pitch: 40 px icon, 4 gap); row 1 at y = -115, row 2 at y = -159. The release's left-to-right order is kept, right-aligned: 4 icons for warrior, paladin, priest and hunter (the hunter's Mongoose Bite and Counterattack in row 2 under the 2nd and 3rd), 3 for druid, 2 for mage, warlock, rogue and shaman. Victory Rush (absent from Forever, never shown) goes to row 2.
- Anchored to the buff frame, not the screen: Edit Mode moves that frame (default `TOPRIGHT` -255, -10, `Blizzard_EditMode/Mainline/EditModePresetLayouts.lua` 433-450, same in the Classic layout, line 1199) and the game lowers it while a GM ticket or survey tray shows (`Blizzard_StatusTrayManager/StatusTrayManager.lua` 36-43); the row follows. The frame always has the size of its full grid: `AuraFrameMixin:UpdateSize` (`Blizzard_BuffFrame/BuffFrame.lua` 289-309) counts all 32 slots (`BUFF_MAX_DISPLAY`) unless `ignoreDisabledAurasForSize` is set, which it is not for `BuffFrame`; 11 per row, so 3 rows of 45 units (135 tall). Its bottom edge is under the 3rd row even with a single buff, so the alerts never cover buffs, however many. Source: Gethe/wow-ui-source, `forever` branch, build 1.60.1.70888 (Forever loads the Mainline family, game type camelot).
- No taint: no game frame is changed, called or hooked; only our own icons (plain frames, not protected, mouse off outside "Move icons") get an anchor to `BuffFrame`, as Polestar and BugSack anchor their buttons to `Minimap`. Without `BuffFrame`, the same spot is counted from the screen's top-right corner (`UIParent`, `TOPRIGHT`, x = -410, y = -260 for the right slot).
- On screen with the default layout, in UI units from the top-right corner: row 1 from x -410 to -582, y -260 to -300; row 2 y -304 to -344. Clear of the buffs (-255 to -655; -10 to -145), the debuffs (2 rows of 8: -270 to -550; -155 to -245), the minimap cluster with its calendar, clock and the Polestar (225 degrees) and BugSack (160 degrees) buttons on its edge (0 to -256; 0 to -256), Polestar's guide window (from x -64 to -404, from y -240; 6 units gap), the objective tracker (-110 to -370, from y -275), Polestar's arrow (centre plus or minus 100; -140 to -270) and BuffAlerts' small top row (centre -84 to +172; -40 to -76). An icon's "Train" badge (18 units) and word reach about 38 units up (y -222), over the debuffs' second row only from the 13th debuff on. The hunter's red "Switch aspect" word overlaps the guide window's top-left corner by about 17 units while it shows.
- UI scales: every spot counts from the top-right corner in UI units, so they keep their relative places whatever the scale; only the centred Polestar arrow comes closer on a narrow screen. Offline bench (the addon's files under Lua 5.1, a fake `BuffFrame` at its default place, all nine classes), 16:9 at UI heights 768 (scale 1, 1365 wide), 900, 1082 and 1200 (2133 wide): no overlap with those frames nor between icons; at 768 tall the left icon ends 0.7 unit from the arrow's frame. 1920x1080 and 2560x1440 are both 16:9: same layout, only the real size changes (40 units are 56 px at 1080p and 75 px at 1440p at scale 1; 36 and 48 px at UI height 1200).
- Limits: on 16:10 (1920x1200) at scale 1 the arrow (x -514 to -714) touches the top 10 units of the two left icons, at its distance line. A frame the player moved (a guide window wider than 340, buffs moved in Edit Mode) changes these numbers: move the icons (`/balert`, "Move icons") or the arrow.
- Medium size: 40, i.e. 62.5 % of 64. 4/3 of a game buff icon (30), so the alert stands out beside the buffs without taking the screen; the countdown stays readable (font 24, `Core.lua` 524) and the "Train" badge keeps 18 (`Core.lua` 527); four icons (172 units) fit between the guide window and the arrow at scale 1. At 42 or more the four-icon rows would touch the arrow at 768 tall; under 38 it leaves the wanted range (60 to 70 %).
- A saved choice still wins: `CopyDefaults` only fills missing values. One trap is handled: if the client ever loads back settings saved before this version, the new `anchor` field would be filled with `PACK_BUFFS` next to old centre-based `x` and `y`, throwing the icon to the top of the screen. On the session's first layout, `PackPatches.lua` checks: settings marked by the pack (`packLayout = 1`) are taken as they are; otherwise an icon still at the release default takes the pack's spot, and an icon the player had moved or resized keeps its place (centre anchor).
- Dragging an icon (`/balert`, "Move icons") saves it from the screen centre, as in the release (the anchor switches to the centre just before `SaveFramePosition`, `Core.lua` 449-459). The "Position X" and "Position Y" sliders move the icon from its anchor under the buffs. "Reset to defaults" restores the pack layout (with patch 5).
- Bench checks (29): icon place and size, top row unchanged, drag, slider, reset, old release settings (default spot, moved icon, resized icon), pack settings, missing `BuffFrame`.

### Patch 5: "Reset to defaults" stops halfway

- `ns.ResetDefaults` (`Core.lua` 549-556) runs `pairs(def)` on every entry of `ns.DEFAULTS`, but `hideAll` (`Data.lua` 328) is `false`, not a table: Lua error "bad argument #1 to 'pairs' (table expected, got boolean)" when that entry comes up. `pairs` has no fixed order, so some alerts are reset and others not; `Resolve()` and `ns.Update()` never run, and BugSack catches the error. Hits the "Reset to defaults" button and `/balert reset`; reproduced on the bench with the release.
- Fix (`[pack patch #5]`): `ns.ResetDefaults` is wrapped; plain values (`hideAll`) are reset directly and left out of `ns.DEFAULTS` for the original call, then put back. Drop it once upstream skips non-table entries.

### Default 6: off on a first install (0.10.0)

- Both clients. Nathan's request: BuffAlerts should not push itself on anyone; whoever wants it turns it on. Before 0.10.0 the addon loaded and ran from the install: every alert of the played class, the author's settings plus defaults 2 and 4.
- Value: `## DefaultState: disabled` in `BuffAlertsForever.toc`; no Lua file changes.
- How it works: the game keeps, per character, which addons are ticked (`WTF\Account\<account>\<realm>\<character>\AddOns.txt`). `DefaultState` only applies to an addon the game has no saved state for on the account: it shows unticked in the AddOn list and does not load (no memory, no events). An addon already seen keeps its saved state. Sources: [Warcraft Wiki, TOC format](https://warcraft.wiki.gg/wiki/TOC_format) (read 2026-11-12); the Forever 1.60.1.70888 interface reads that default (`C_AddOns.IsAddOnDefaultEnabled`, `Blizzard_AddOnList/AddonList.lua` 961 and 969-978, the AddOn list's `ADDON_LIST_RESET_TO_DEFAULT` right-click entry; Gethe/wow-ui-source, `forever` branch); the "no saved state on the account" rule comes from decompiled 3.3.5 client code (`UIUtil/AddOns.cpp`, `ComputeAddOnEnableState`): assumed the same on Forever, to check in game.
- Effect: a first install of the pack shows BuffAlerts unticked; a friend who already has the pack (0.4.0 to 0.9.9) keeps it as it was (ticked, or unticked if they unticked it); a new character of such a friend gets the state of their other characters.
- Why not an in-addon default (`hideAll = true`): the addon would still load for nothing, a friend who already has the pack keeps their saved `hideAll = false` anyway, and if the settings really reset at every login (the author's warning, see "Left as is") the alerts would hide again at every login even when turned on by hand. The AddOn list's tick box is kept by the game itself.
- Turn it on: character screen, **AddOns** button, tick **BuffAlerts Forever**, then enter the world; in game: Escape menu, **AddOns**, tick, reload the UI. Bench check (`tools/check-lua.py`, part 5): only `BuffAlertsForever` says `## DefaultState: disabled` among the folders of `addons/`.

### Conflicts checked

- Polestar: distinct slash commands and globals, no hooks, no tooltips, icons do not take the mouse. Layout: in the release the large icons (CENTER, y = +150, 64 px) covered the distance and label under Polestar's arrow at UI scale 1; since default 4 they sit top right, under the buffs, clear of the arrow, the guide window and the minimap. The small top row touches Polestar's transport banner by 4 px.
- PrettyTooltip, Auctionator: nothing shared. The game's Cooldown Manager: untouched, complementary (its tracked bar shows Battle Shout's time left, BuffAlerts flags it missing).

### Left as is

Settings reset at login (the author blames the beta client; Polestar's settings load fine on the same client, but no cause shows in BuffAlerts' code: to observe in game), Thorns shown for every druid, the campfire icon outside camps, the author's thresholds (5 soul shards, 20 % durability).

### In-game checks

1. Battle Shout (warrior, FR and EN): pull without it, icon top right under the buffs, and sound; cast it, icon gone; last 5 s in combat, countdown and sound; never out of combat.
2. Overpower, Revenge, Execute (warrior, FR and EN): icons when usable.
3. Food and campfire (any class, FR first, then EN): "Bien nourri" / "Well Fed" and "Avantages du camp" / "Camp Benefits" turn their icons off; if not, `/balert buffs` and note the name and ID.
4. Druid, warlock, mage (FR and EN): their buffs turn their icons off, party indicators beside members who lack them.
5. Alert spot (a four-icon class, warrior, paladin, priest or hunter, then another; FR and EN): `/balert`, "Move icons" to show them all. Expected: a row of four medium icons top right, under the buffs and debuffs, left of the guide window; nothing over the minimap, its buttons (Polestar, BugSack), calendar, clock, the guide window, Polestar's arrow or the small top row. Again with many buffs (two rows if possible) and at two UI scales (the game's *UI Scale* graphics setting): the row stays under the buffs. Move the buffs in Edit Mode: the alerts follow. "Lock icons" to finish.
6. Options window opened in combat: no blocked action message, Escape closes it.
7. Settings: untick an option, log out and in, note whether it stays.
8. Reset to defaults (one class, one client): `/balert`, "Move icons", drag an icon away, "Lock icons", then "Reset to defaults". Expected: no error (BugSack stays quiet), the icon goes back under the buffs, "Hide all alerts" unticked.
9. Off on a first install (default 6, one client): on an account that never had BuffAlerts (or after removing the `BuffAlertsForever` line from every `AddOns.txt` of the account, game closed), install the pack: BuffAlerts Forever unticked in the AddOn list, no icon in game; tick it and the alerts come back. On a friend's account that already had it: still ticked after the update.
