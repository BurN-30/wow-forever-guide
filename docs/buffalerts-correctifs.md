# BuffAlerts Forever 3.11.4 : correctifs et réglages du pack / pack patches and defaults

Français d'abord, [English below](#english).

## Français

Le pack installe BuffAlerts Forever 3.11.4 (Thork, licence MIT), à partir du fichier publié sur [CurseForge](https://www.curseforge.com/wow/addons/buffalerts) (`BuffAlertsForever 3.11.4.zip`, SHA-256 `e94eb4ac638033fbd6b7b3e0e0d0df4a7cef89637108ad06c17f7fc28654c5b0`). Le numéro de version reste 3.11.4 dans `BuffAlertsForever.toc`, pour que l'auteur reconnaisse la base ; une ligne `## X-Pack-Patches:` signale les changements.

Les fichiers de la release ne sont pas modifiés. Tout ce que le pack change tient dans un seul fichier ajouté, `PackPatches.lua`, chargé en dernier par le `.toc` : il passe après `Data.lua`, `Core.lua`, `Party.lua` et `Options.lua`, mais avant les événements `ADDON_LOADED` et `PLAYER_LOGIN`, donc avant que l'addon lise ses réglages. Pour reprendre une nouvelle version de l'addon : recopier la release, puis rajouter au `.toc` la ligne `## X-Pack-Patches:` et la ligne `PackPatches.lua`, et vérifier que chaque correctif sert encore (voir « À retirer quand »).

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
- Une valeur enregistrée l'emporte toujours (`CopyDefaults`, `Core.lua` 24 à 33, ne remplit que les réglages absents) : si le client se met à recharger les réglages, un « Play sound » décoché reste décoché. « Reset to defaults » remet le son, comme toute valeur du guide.
- Couper le son : `/balert`, section Battle Shout, décocher « Play sound » (jusqu'à la déconnexion).

### Correctif 3 : touches de la fenêtre d'options en combat

- Clients : les deux.
- Fichier : `Options.lua` lignes 342 à 350 (script `OnKeyDown` de la fenêtre).
- Cause : la fenêtre capte le clavier et appelle `SetPropagateKeyboardInput` à chaque touche pour laisser passer les touches au jeu. Le client refuse cet appel en combat (action bloquée) : Polestar le note sur le même client et s'en garde (`Theme/Widgets.lua` 2145, `UI/Gamepad.lua` 625 à 630, « the client refuses the change in a fight »). Fenêtre `/balert` ouverte en combat : message d'action bloquée à chaque touche.
- Correction (`PackPatches.lua`, `[pack patch #3]`) : le même script, avec l'appel fait hors combat seulement ; Échap ferme toujours la fenêtre. La fonction `ns.CreateOptions` est enveloppée pour poser ce script après la création de la fenêtre.
- Limite : en combat, les touches suivent le dernier choix fait hors combat ; une fenêtre ouverte pour la première fois en combat peut garder les touches jusqu'à Échap.
- À retirer quand : l'amont protège cet appel.

### Conflits examinés

- **Polestar** : commandes `/balert` et `/buffalerts` (BuffAlerts) distinctes de `/polestar`, `/pole`, `/way`, `/ga` et `/ptip`. Noms globaux propres (`BuffAlertsForeverDB`, `BuffAlertsForever_<alerte>`, `BuffAlertsForeverOptions`). Aucun crochet (`hooksecurefunc`), aucune infobulle, aucun cadre protégé touché : pas de corruption (*taint*) possible par ce chemin. Les icônes ne prennent pas la souris (`EnableMouse(false)`, `Core.lua` 467) : la flèche, ses boutons et le cadre de guide restent cliquables à travers.
- **Positions par rapport à Polestar** : la rangée de petites icônes est ancrée en haut (`TOP`, y = -40, 36 px, donc de 40 à 76 px du haut) ; le bandeau de transport de Polestar commence à 72 px (`Nav/Alerts.lua` 77 à 88) : 4 px de recouvrement, seulement quand les deux s'affichent ensemble. Les grandes icônes sont centrées à y = +150 (64 px : de 118 à 182 px au-dessus du centre), la flèche de Polestar est ancrée en haut (`Nav/Arrow.lua` 82 à 85 et 630 : 200 × 130 px, de 140 à 270 px du haut). Elles se chevauchent seulement si la hauteur de l'interface est sous 904 unités. Avec l'échelle d'interface à 1 (hauteur 768), les icônes du druide, du mage, du démoniste et celles du milieu du guerrier tombent sur la distance et le nom du point sous le cadran de la flèche (strate HIGH au-dessus de MEDIUM) ; avec une échelle de 0,85 ou moins, rien ne se chevauche. Pas de déplacement imposé : l'échelle varie d'un joueur à l'autre, et à 768 de haut il n'y a pas de place libre plus bas sans couvrir le personnage ou les icônes du gestionnaire de temps de recharge. À vérifier en jeu. Remède qui dure : glisser la flèche de Polestar (Polestar retient sa place, réglage `nav.arrowPos`).
- **PrettyTooltip** : BuffAlerts n'affiche aucune infobulle et n'utilise pas `GameTooltip` ; seule lecture, `C_TooltipInfo.GetInventoryItem` (données, sans cadre), et seulement pour le voleur et le chaman.
- **Auctionator** : rien en commun (ni événement exclusif, ni nom global, ni cadre).
- **Gestionnaire de temps de recharge du jeu** (*Cooldown Manager*) : BuffAlerts n'y touche pas. Les deux se complètent : la barre suivie montre le temps restant du Cri de guerre, BuffAlerts signale son absence. Positions par défaut du gestionnaire dans l'interface moderne (Blizzard, `EditModePresetLayouts.lua`) : barres suivies en bas à droite du centre (x = +420), icônes en bas au centre : loin des icônes de BuffAlerts (x de -207 à +207, au-dessus du centre). Les positions de Forever ne sont pas publiées : à vérifier en jeu.
- **Fenêtre d'options du jeu** : le bouton « Open options » de BuffAlerts dans Options › AddOns ferme le panneau du jeu par `HideUIPanel` (`Options.lua` 440) ; risque de corruption faible, seulement à ce clic. Préférer `/balert`.

### Laissé tel quel

- Réglages remis à zéro à chaque connexion : l'auteur l'attribue au client bêta. Polestar, sur le même client, retrouve ses réglages et sa progression ; le code de BuffAlerts (`## SavedVariables: BuffAlertsForeverDB`, `ADDON_LOADED`, `Core.lua` 930 à 934) ne montre pas de cause. Cause non certaine : rien de corrigé, à observer en jeu.
- Épines affichée hors combat pour tous les druides, y compris en forme de félin : choix de l'auteur, à décocher dans `/balert` si inutile.
- Feu de camp : l'icône reste hors camp, c'est le principe de l'alerte (rappel de camper).
- Seuils : fragments d'âme sous 5, durabilité sous 20 % : valeurs de l'auteur, raisonnables pour le groupe.
- Interface de l'addon en anglais, noms des sorts dans la langue du client.

### À vérifier en jeu

1. **Cri de guerre** (guerrier, clients FR et EN) : sans Cri de guerre, engager un combat : icône au milieu de l'écran et son d'avertissement. Lancer le Cri : l'icône disparaît. Rester en combat jusqu'aux 5 dernières secondes : icône avec compte à rebours et son. Hors combat : jamais d'icône. Vérifier aussi qu'un Cri lancé avant le combat éteint bien l'alerte à l'engagement.
2. **Fulgurance, Vengeance, Exécution** (guerrier, FR et EN) : icônes quand le jeu les rend utilisables, avec compte à rebours pour Fulgurance et Vengeance.
3. **Nourriture et feu de camp** (toutes classes, client FR d'abord, puis EN) : manger un plat qui donne « Bien nourri » : l'icône de nourriture disparaît. S'installer à un feu de camp jusqu'à « Avantages du camp » : l'icône du feu de camp disparaît. Si une icône reste, taper `/balert buffs` et noter le nom et le numéro affichés.
4. **Druide** (FR et EN) : Marque du fauve, Épines, Augure de clarté (si le talent est pris) s'éteignent une fois lancés, y compris en forme de félin ; en groupe, petite icône de la Marque à côté du cadre d'un membre qui ne l'a pas.
5. **Démoniste** (FR et EN) : armure (Peau de démon ou Armure démoniaque), icône « démon absent » quand le démon est renvoyé ou mort, icône des fragments d'âme sous 5 (hors combat).
6. **Mage** (FR et EN) : armure et Intelligence des arcanes ; en groupe, icône d'Intelligence à côté des membres à mana qui ne l'ont pas (pas à côté du guerrier).
7. **Polestar** (toutes classes, une fois) : avec la flèche affichée et une alerte visible (par exemple sans Marque du fauve ou sans armure), regarder si l'icône recouvre la distance ou le nom sous la flèche. Si oui, glisser la flèche plus haut ; le signaler pour décider d'une autre position par défaut.
8. **Fenêtre d'options en combat** (une classe, un client) : `/balert` ouvert en combat, appuyer sur une touche de déplacement puis Échap : pas de message d'action bloquée, la fenêtre se ferme.
9. **Réglages** (une classe, un client) : décocher une option dans `/balert`, se déconnecter puis se reconnecter : noter si l'option revient (bogue annoncé) ou reste.
10. **Gestionnaire de temps de recharge** (guerrier) : la barre du Cri de guerre et l'icône de BuffAlerts ne se recouvrent pas.

## English

BuffAlerts Forever 3.11.4 (Thork, MIT licence), installed from the file published on [CurseForge](https://www.curseforge.com/wow/addons/buffalerts) (`BuffAlertsForever 3.11.4.zip`, SHA-256 `e94eb4ac638033fbd6b7b3e0e0d0df4a7cef89637108ad06c17f7fc28654c5b0`). `BuffAlertsForever.toc` keeps version 3.11.4 so the author recognises the base; a `## X-Pack-Patches:` line flags the changes.

The release files are not modified. Everything the pack changes lives in one added file, `PackPatches.lua`, listed last in the `.toc`: it runs after `Data.lua`, `Core.lua`, `Party.lua` and `Options.lua` but before `ADDON_LOADED` and `PLAYER_LOGIN`, so before the addon reads its settings. To take a new upstream version: copy the release, add the `## X-Pack-Patches:` and `PackPatches.lua` lines back to the `.toc`, and check each patch is still needed. The full diff is [`buffalerts-3.11.4.patch`](buffalerts-3.11.4.patch): `git -c core.autocrlf=false apply -p1 docs/buffalerts-3.11.4.patch`, run from the folder holding the unzipped `BuffAlertsForever`, rebuilds the repository's `addons/BuffAlertsForever` byte for byte (checked 2026-11-10; files stay LF). Each patch carries a `[pack patch #n]` mark.

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

- `ns.DEFAULTS.battleShout.sound = true`; every other default stays the author's. A warrior in the group asked for a reminder when Battle Shout is missing, and this client does not load the addon's settings back at login, so only a default lasts. Effect: the raid warning sound once when the icon appears (combat start without Battle Shout, and 5 s before it ends in combat). A saved choice still wins (`CopyDefaults` only fills missing values). Turn it off: `/balert`, Battle Shout, untick "Play sound".

### Patch 3: options window keys in combat

- `Options.lua` 342-350 calls `SetPropagateKeyboardInput` on every key; the client refuses that call in combat (Polestar notes it on the same client, `Theme/Widgets.lua` 2145, `UI/Gamepad.lua` 625-630). Fix: the same handler, with the call made out of combat only; Escape still closes the window.

### Conflicts checked

- Polestar: distinct slash commands and globals, no hooks, no tooltips, icons do not take the mouse. Layout: the large icons (CENTER, y = +150, 64 px) overlap the lower part of Polestar's arrow (TOP, 140 to 270 px from the top) only when the UI is less than 904 units tall; at UI scale 1 (768 tall) they cover the distance and label under the dial. Not moved by default (it depends on each player's UI scale, and at 768 tall there is no free spot lower down); in-game check, and dragging Polestar's arrow fixes it for good (Polestar saves its position). The small top row touches Polestar's transport banner by 4 px.
- PrettyTooltip, Auctionator: nothing shared. The game's Cooldown Manager: untouched, complementary (its tracked bar shows Battle Shout's time left, BuffAlerts flags it missing).

### Left as is

Settings reset at login (the author blames the beta client; Polestar's settings load fine on the same client, but no cause shows in BuffAlerts' code: to observe in game), Thorns shown for every druid, the campfire icon outside camps, the author's thresholds (5 soul shards, 20 % durability).

### In-game checks

1. Battle Shout (warrior, FR and EN): pull without it, icon and sound; cast it, icon gone; last 5 s in combat, countdown and sound; never out of combat.
2. Overpower, Revenge, Execute (warrior, FR and EN): icons when usable.
3. Food and campfire (any class, FR first, then EN): "Bien nourri" / "Well Fed" and "Avantages du camp" / "Camp Benefits" turn their icons off; if not, `/balert buffs` and note the name and ID.
4. Druid, warlock, mage (FR and EN): their buffs turn their icons off, party indicators beside members who lack them.
5. Polestar (once): with the arrow up and an alert showing, check whether the icon covers the text under the arrow.
6. Options window opened in combat: no blocked action message, Escape closes it.
7. Settings: untick an option, log out and in, note whether it stays.
