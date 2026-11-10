# BugSack v12.1.9 et BugGrabber v12.1.1 : correctifs et réglages du pack / pack patches and defaults

Français d'abord, [English below](#english).

## Français

Le pack installe deux addons du même auteur (funkydude, « Funkeh ») qui gardent les erreurs Lua des addons au lieu de les perdre :

- **BugGrabber** v12.1.1, dossier `addons/!BugGrabber` : attrape les erreurs et les enregistre. Fichier `!BugGrabber-v12.1.1.zip` publié sur [CurseForge](https://www.curseforge.com/wow/addons/bug-grabber) (fichier 9277326 du 21/10/2026, saveur Forever, versions de jeu dont 1.60.1), téléchargé par le lien officiel de la page du fichier. CurseForge ne publie pas d'empreinte SHA-256 ; celle du fichier reçu : `1e53e65c72f525a45c8951abe06415df5b1fb52ec21e30970c1416a2fbd4a250` (MD5 `737d6626decaca2ca59c79192c69d7ee`). BugGrabber n'a pas de dépôt public : le README de BugSack renvoie à CurseForge. Non modifié.
- **BugSack** v12.1.9, dossier `addons/BugSack` : la fenêtre qui montre les erreurs, l'icône de la minicarte. Release GitHub [funkydude/BugSack v12.1.9](https://github.com/funkydude/BugSack/releases/tag/v12.1.9) du 26/10/2026, `BugSack-v12.1.9.zip`, SHA-256 `2b3a96d352b5fc351dfc62628ea1c75fe86c837cc59967455e1ac482a1b92ac1`, identique à l'empreinte (`digest`) publiée par GitHub. Le `release.json` de la release déclare la saveur `forever` (interface 16001). Le ZIP contient BugSack seul, avec ses bibliothèques ; BugGrabber est à part.

Licences : « All Rights Reserved » pour les deux (pages de licence CurseForge). Le `.toc` de BugSack précise : « You are free to fork and modify on GitHub, please ask us about anything else. » Inclus pour notre groupe avec ce crédit, comme Auctionator.

Le nom `!BugGrabber` est voulu : le jeu charge les addons par ordre alphabétique, le « ! » le fait passer en premier, donc il attrape aussi les erreurs que les autres addons font pendant leur chargement. Le programme d'installation refusait un dossier dont le nom contient autre chose que lettres, chiffres et `_` (contrôle du ZIP, `installer-exe/Updater.cs`) : il accepte désormais un « ! » en tête. Un ancien `GuideWoWForever.exe` se met à jour lui-même avant d'installer, comme à chaque nouvelle version ; s'il n'y arrive pas, il refuse le paquet sans rien modifier (essayé avec le programme 0.9.2 : « Paquet téléchargé inattendu (!BugGrabber/!BugGrabber.toc) : rien n'a été modifié »). `Installer.bat` copie tous les dossiers de `addons`, sans contrôle de nom.

Les fichiers des deux releases ne sont pas modifiés. Tout ce que le pack change tient dans un fichier ajouté, `BugSack/PackPatches.lua`, chargé en dernier par `BugSack.toc` : il passe après `ldb.lua`, qui inscrit l'icône de la minicarte, et avant l'événement `PLAYER_LOGIN`, où LibDBIcon la place. Le numéro de version reste v12.1.9 dans le `.toc`, pour que l'auteur reconnaisse la base ; une ligne `## X-Pack-Patches:` signale les changements. Le diff complet est dans [`bugsack-12.1.9.patch`](bugsack-12.1.9.patch) : appliqué sur la release décompressée (`git -c core.autocrlf=false apply -p1 docs/bugsack-12.1.9.patch` depuis le dossier qui contient `BugSack`), il redonne le dossier `addons/BugSack` du dépôt octet pour octet (vérifié le 10/11/2026). Les fichiers de BugSack sont en CRLF, `PackPatches.lua` aussi ; ceux de BugGrabber sont en LF. Git signale des « trailing whitespace » en appliquant le diff : ce sont les retours chariot des lignes CRLF, c'est normal. Pour reprendre une nouvelle version : recopier les deux releases, remettre au `.toc` de BugSack la ligne `## X-Pack-Patches:` et la ligne `PackPatches.lua`, vérifier que chaque correctif sert encore.

### Méthode

- Code lu en entier : `BugGrabber.lua` et son `.toc` ; `core.lua`, `sack.lua`, `config.lua`, `ldb.lua`, `locales.lua` (enUS et frFR), `forever.lua`, `retail.lua`, `embeds.xml` et le `.toc` de BugSack ; les parties de LibDBIcon qui placent l'icône et gèrent le compartiment d'addons.
- Client Forever : code de l'interface du jeu publié dans [Gethe/wow-ui-source](https://github.com/Gethe/wow-ui-source), branche `forever` (1.60.1, build 70888, 10/11/2026). Le type de jeu de Forever est `camelot`, de la famille Mainline. Les addons de Blizzard de cette branche utilisent `## LoadSavedVariablesFirst: 1` (`Blizzard_DamageMeter`, `Blizzard_SettingsDefinitions_Shared`, `Blizzard_LegacyChallengeTracker`) : le client le connaît. Présents aussi : les modèles de fenêtre utilisés par BugSack (`PortraitFrameTemplate`, `SharedButtonTemplate`, `ScrollFrameTemplate`, `PanelTabButtonTemplate`, `WowStyle1DropdownTemplate`), les fonctions (`UnitNameUnmodified`, `GetErrorCallstackHeight`, `debuglocals`, `C_StringUtil.EscapeDecimalNonPrintables`, `C_UIFileAsset`) et un compartiment d'addons (`Blizzard_Minimap`, `Camelot\AddonCompartment.lua`).
- Le jeu ne peut pas être lancé ici. Banc hors jeu : BugGrabber, les bibliothèques, BugSack et `PackPatches.lua` chargés sous Lua 5.1 (la version du jeu) avec un faux jeu ; une erreur passée au gestionnaire d'erreurs du jeu, comme Polestar le fait. 11 contrôles, en français et en anglais, sans position enregistrée puis avec une position enregistrée (300°) : BugSack démarre avec BugGrabber, `forever.lua` est chargé, l'erreur est gardée dans la session, un son une seule fois, texte « 1x … » avec la pile et les variables locales, répétition comptée sans second son, icône rouge avec le nombre, réglages de l'auteur, clic gauche qui ouvre la fenêtre, commandes. La release sans `PackPatches.lua` met l'icône exactement au point du bouton Polestar (-53,0 ; -53,0 pour une minicarte de 140 px) ; avec, à 160° (-70,5 ; 25,7), et une position enregistrée reste.
- Programme d'installation : construit et lancé sans fenêtre (`--headless`) contre une fausse release GitHub et un faux dossier de jeu : 35 dossiers installés, `!BugGrabber` et `BugSack` identiques au dépôt, l'autre addon du dossier laissé en place. Même essai avec `Installer.ps1`.

### `.toc` chargé par le client 16001

- Un seul `.toc` par addon : `BugSack.toc` et `!BugGrabber.toc`. Leur ligne `## Interface:` cite 16001 parmi d'autres.
- Dans `BugSack.toc`, `retail.lua [AllowLoadGameType standard]` et `forever.lua [ExcludeLoadGameType standard, classic][AllowLoadGameType camelot]` : sur Forever (`camelot`), seul `forever.lua` est lu (`isForever`), et BugSack prend sa fenêtre moderne. Même écriture que le fichier `Source_Forever` d'Auctionator, déjà dans le pack.
- `## LoadSavedVariablesFirst: 1` (les deux) : les réglages et les erreurs gardées sont là quand les fichiers s'exécutent. BugGrabber en a besoin pour numéroter les sessions et garder les erreurs d'une connexion à l'autre.

### Comportement par défaut (réglages de l'auteur, gardés)

| Quoi | Comment | Fichier |
|---|---|---|
| Ce qui est attrapé | Toute erreur Lua de tout addon (BugGrabber remplace le gestionnaire d'erreurs du jeu) ; les actions bloquées (`ADDON_ACTION_BLOCKED`, `ADDON_ACTION_FORBIDDEN`), une fois par addon et par session ; les avertissements Lua (`LUA_WARNING`). La fenêtre d'erreur du jeu ne s'affiche plus. | `BugGrabber.lua` 317 à 423, 535 à 574 |
| Ce qui est gardé | Jusqu'à 500 erreurs dans `BugGrabberDB`, d'une session à l'autre. Une erreur qui revient est comptée (« 3x ») au lieu d'être recopiée. Au-delà de 10 erreurs par seconde, la capture s'arrête un moment, avec un message dans le chat. | `BugGrabber.lua` 34 à 37, 234 à 245, 480 à 516 |
| Signal | Le son « BugSack: Fatality » (canal des effets sonores) à chaque nouvelle erreur, au plus une fois toutes les 3 s, et une fois toutes les 30 s pour une même erreur. L'icône de la minicarte passe au rouge, son infobulle donne le nombre d'erreurs de la session et les dernières. Pas de ligne dans le chat (`chatframe`), pas de fenêtre qui s'ouvre toute seule (`auto` ; même allumée, jamais en combat). | `core.lua` 52 à 74, 323 à 364 ; `ldb.lua` 32 à 56 |
| Commandes | `/bugsack` ouvre la fenêtre ; `/buggrabber <n>` écrit l'erreur n dans le chat. Pas de `/bs`. Aucun conflit avec `/polestar`, `/pole`, `/way`, `/ga`, `/ptip`, `/balert`, `/buffalerts`, `/auctionator`, `/atr`. | `core.lua` 274 à 277 ; `BugGrabber.lua` 577 à 578 |
| Icône | Clic gauche : ouvrir ou fermer la fenêtre ; Maj + clic gauche : recharger l'interface (comme `/reload`) ; clic droit : options. Alt + clic pour tout effacer : éteint. | `ldb.lua` 16 à 30 |
| Fenêtre | Onglets Tous les bugs, Session actuelle, Session précédente, Options. Le texte est une zone de saisie (`EditBox`, 99 999 caractères) : clic dedans, Ctrl+A, Ctrl+C. « Envoyer les bugs » transmet la session affichée à un autre joueur qui a BugSack (AceComm, en chuchotement). Fermer : la croix ou l'icône (Échap ne ferme pas la fenêtre). | `sack.lua` 214 à 597 |
| Langues | Interface traduite en français dans `locales.lua` (une infobulle fausse, correctif 2) ; messages de BugGrabber traduits aussi. | `locales.lua` 1 à 58, 227 à 280 |

Le son est gardé : c'est le signal qui dit au joueur qu'une erreur est à envoyer, l'icône rouge seule passe inaperçue. Il est espacé (3 s, 30 s pour la même erreur) et joué sur le canal des effets sonores. Le couper : clic droit sur l'icône, onglet Options, « Muet » (*Mute*).

### Correctif 1 : icône de la minicarte à l'écart du bouton Polestar

- Clients : les deux.
- Cause : LibDBIcon (bibliothèque de BugSack, v57) place une icône jamais déplacée à 225° (`LibDBIcon-1.0.lua` 157), 5 px au-delà du bord (`lib.radius`, 19). Le guide allume le bouton de minicarte de Polestar (`Polestar/GroupeAlliance/GroupeAlliance.lua` 77), placé par défaut à 225° lui aussi (`Maps/Maps.lua` 27, `Maps/MinimapButton.lua` 29), 5 px au-delà du bord (23 et 39). Même centre : les deux boutons sont exactement l'un sur l'autre (banc : -53,0 ; -53,0 pour les deux).
- Correction (`PackPatches.lua`, `[pack patch #1]`) : si `BugSackLDBIconDB.minimapPos` n'existe pas, 160° (à gauche, un peu au-dessus du milieu), posé avant `PLAYER_LOGIN`, quand LibDBIcon place les icônes (`LibDBIcon-1.0.lua` 320 à 334). Une icône que le joueur a glissée garde sa place (LibDBIcon enregistre alors `minimapPos`).
- Pourquoi 160° : sur la minicarte de Forever (`Blizzard_Minimap`, dossier `Camelot`, branche `forever`), le calendrier et le compartiment d'addons sont en haut à droite, l'indicateur jour et nuit vers 57°, le courrier et les autres indicateurs sous le nom de la zone en haut à gauche, les boutons de zoom en bas à droite (vers 310 à 320°), le bouton d'événement (seulement pendant un événement) à gauche vers 195°. 160° tombe hors de tout cela, à 80 px du bouton Polestar. À vérifier en jeu.
- À retirer quand : Polestar ou LibDBIcon changent leur position par défaut.

### Correctif 2 : infobulle française de l'icône

- Clients : français seulement ; l'anglais est juste et ne change pas.
- Cause : `locales.lua` 232 dit « Maj + Clic droit pour recharger l'interface », mais `ldb.lua` 16 à 30 ouvre les options sur tout clic droit, Maj enfoncée ou non, et recharge l'interface sur Maj + clic gauche.
- Correction (`PackPatches.lua`, `[pack patch #2]`) : le même texte, avec « Maj + Clic ». `ldb.lua` relit ce texte à chaque ouverture de l'infobulle.
- À retirer quand : l'amont corrige la traduction.

### Bibliothèques et conflits examinés

- Bibliothèques de BugSack : LibStub 2, CallbackHandler-1.0 v8, LibDataBroker-1.1 v4, LibDBIcon-1.0 v57, LibSharedMedia-3.0 v12000005, AceComm-3.0 v14 (avec ChatThrottleLib), AceSerializer-3.0. LibStub garde la plus récente de chaque copie. Dans le pack, seul Auctionator embarque LibStub (même version 2, plus sa LibCBOR) ; aucune autre copie de LibDBIcon, LibDataBroker, CallbackHandler, LibSharedMedia ou Ace3 dans Polestar, PrettyTooltip ou BuffAlerts. Aucun conflit de version.
- **PrettyTooltip** se sert de LibSharedMedia quand elle est là (`Core/Settings.lua` 313 à 335) : avec BugSack, la liste des polices de `/ptip` montre les noms de LibSharedMedia (« Friz Quadrata TT »…) au lieu de ses quatre noms. Une police déjà choisie reste (cherchée par son nom dans la liste de PrettyTooltip si LibSharedMedia ne la connaît pas) ; la police par défaut, celle du jeu, ne change pas. Cas prévu par l'auteur de PrettyTooltip.
- **Polestar** garde ses propres erreurs (`Core/Init.lua` 158 à 212, fenêtre `/polestar report`) et les passe au gestionnaire d'erreurs du jeu, au plus une fois toutes les 30 s par message : elles arrivent donc aussi dans BugSack, les deux listes coexistent. BugGrabber remplace `seterrorhandler` par une fonction vide : aucun addon du pack ne l'appelle (Polestar n'utilise que `geterrorhandler`). Bouton de minicarte : correctif 1. Commandes distinctes.
- **BuffAlerts**, **Auctionator** : rien en commun. L'aide d'Auctionator conseille justement !BugGrabber et BugSack pour signaler un bug.
- BugGrabber désactive `!Swatter` et `!ImprovedErrorFrame` (anciens addons d'erreurs) s'ils sont installés : absents du pack.

### Réglages et rechargement

Les réglages de BugSack (`BugSackDB`, `BugSackLDBIconDB`) et les erreurs (`BugGrabberDB`) sont lus pendant l'exécution des fichiers grâce à `LoadSavedVariablesFirst`, que Forever connaît (ses propres addons s'en servent). La remise à zéro des réglages de BuffAlerts à chaque connexion vient de cet addon (cause non trouvée) ; Polestar retrouve les siens sur le même client. Si BugSack perdait quand même ses réglages, la gêne serait faible : les valeurs par défaut sont celles voulues (icône, son), le correctif 1 se repose à chaque connexion ; seul l'historique des sessions précédentes manquerait. Habitude sûre : copier l'erreur avant de se déconnecter. À vérifier en jeu.

### Laissé tel quel

- Son « Fatality », pas de fenêtre automatique, pas de ligne dans le chat : réglages de l'auteur (voir plus haut).
- Maj + clic sur l'icône recharge l'interface : choix de l'auteur, signalé dans le README.
- Échap ne ferme pas la fenêtre (elle n'est pas dans la liste des fenêtres du jeu) : la croix ou l'icône la ferment.
- Le texte copié garde les marques de couleur que BugSack ajoute s'il en reste après la copie (`|cff…`) : sans gêne pour lire l'erreur.

### À vérifier en jeu

1. **Chargement** (clients FR et EN) : écran des personnages, bouton AddOns : BugSack et !BugGrabber présents et cochés. À la connexion, pas de message « BugSack nécessite l'AddOn !BugGrabber ».
2. **Icône** : un petit sac à gauche de la minicarte, pas sur le bouton Polestar ni sur un bouton du jeu. Infobulle : « Maj + Clic » en français, « Shift-Click » en anglais.
3. **Erreur de test** : taper `/run error("test du guide")` dans le chat : un son, icône rouge ; clic sur l'icône : la fenêtre montre l'erreur. Cliquer dans le texte, Ctrl+A, Ctrl+C, coller dans le Bloc-notes ou Discord : le texte arrive lisible (noter s'il reste des `|cff…`).
4. **Session suivante** : `/reload` ou reconnexion : l'erreur de test est dans « Session précédente » ; un réglage changé (par exemple « Muet ») est toujours là.
5. **Combat** : une erreur en combat n'ouvre aucune fenêtre ; la fenêtre ouverte à la main se ferme par la croix.
6. **PrettyTooltip** : `/ptip`, liste des polices : noms de LibSharedMedia, infobulles inchangées.
7. **Polestar** : une erreur que Polestar attrape apparaît aussi dans BugSack.
8. **« Envoyer les bugs »** (une fois, à deux joueurs qui ont le guide) : la session envoyée arrive chez l'autre, avec « Envoyé par ».

## English

The pack installs two addons by the same author (funkydude, "Funkeh") that keep addon Lua errors instead of losing them:

- **BugGrabber** v12.1.1, folder `addons/!BugGrabber`: catches and stores errors. File `!BugGrabber-v12.1.1.zip` from [CurseForge](https://www.curseforge.com/wow/addons/bug-grabber) (file 9277326, 2026-10-21, Forever flavor, game versions including 1.60.1), downloaded through the file page's official link. CurseForge publishes no SHA-256; the file received has `1e53e65c72f525a45c8951abe06415df5b1fb52ec21e30970c1416a2fbd4a250` (MD5 `737d6626decaca2ca59c79192c69d7ee`). No public repository (BugSack's README points to CurseForge). Not modified.
- **BugSack** v12.1.9, folder `addons/BugSack`: the window and the minimap icon. GitHub release [funkydude/BugSack v12.1.9](https://github.com/funkydude/BugSack/releases/tag/v12.1.9) (2026-10-26), `BugSack-v12.1.9.zip`, SHA-256 `2b3a96d352b5fc351dfc62628ea1c75fe86c837cc59967455e1ac482a1b92ac1`, same as GitHub's published `digest`; its `release.json` declares the `forever` flavor (interface 16001). The ZIP holds BugSack only, with its libraries.

Licences: "All Rights Reserved" for both (CurseForge licence pages); BugSack's `.toc` adds "You are free to fork and modify on GitHub, please ask us about anything else." Included for our group with this credit, like Auctionator.

`!BugGrabber` keeps its "!": the game loads addons alphabetically, so it loads first and also catches errors raised while the other addons load. The install program rejected ZIP folder names with anything but letters, digits and `_` (`installer-exe/Updater.cs`); it now accepts a leading "!". An older `GuideWoWForever.exe` updates itself before installing, as with every new version; if it cannot, it refuses the package and changes nothing (tried with the 0.9.2 program). `Installer.bat` copies every folder without a name check.

The release files are not modified. The pack's changes live in one added file, `BugSack/PackPatches.lua`, listed last in `BugSack.toc`: after `ldb.lua` registers the minimap icon, before `PLAYER_LOGIN`, when LibDBIcon places it. `BugSack.toc` keeps v12.1.9 and gets a `## X-Pack-Patches:` line. The full diff is [`bugsack-12.1.9.patch`](bugsack-12.1.9.patch): `git -c core.autocrlf=false apply -p1 docs/bugsack-12.1.9.patch`, run from the folder holding the unzipped `BugSack`, rebuilds the repository's `addons/BugSack` byte for byte (checked 2026-11-10; BugSack's files and `PackPatches.lua` are CRLF, BugGrabber's LF; git's "trailing whitespace" warnings are those carriage returns).

### Method

- Whole code read (BugGrabber, BugSack, the LibDBIcon placement and addon compartment code).
- Forever client: the game's interface code in [Gethe/wow-ui-source](https://github.com/Gethe/wow-ui-source), `forever` branch (1.60.1 build 70888): game type `camelot`, Mainline family; Blizzard's own addons there use `## LoadSavedVariablesFirst: 1`, so the client supports it; the templates and functions BugSack uses exist; Forever has an addon compartment.
- The game cannot be run here. Offline bench under Lua 5.1 with a fake game: 11 checks in French and English, with and without a saved icon position (capture, sound once, "1x" text with stack and locals, repeat counted, red icon, author defaults, left click opens the window, commands). Without `PackPatches.lua` the icon sits exactly on Polestar's button (-53.0, -53.0 on a 140 px minimap); with it, at 160° (-70.5, 25.7); a saved position stays.
- Install program built and run headless against a fake GitHub release and game folder: 35 folders, `!BugGrabber` and `BugSack` identical to the repository, another addon left alone. Same with `Installer.ps1`.

### `.toc` loaded by client 16001

One `.toc` per addon, both list 16001. In `BugSack.toc`, `forever.lua [ExcludeLoadGameType standard, classic][AllowLoadGameType camelot]` loads on Forever (`camelot`), `retail.lua` does not; BugSack uses its modern window. `## LoadSavedVariablesFirst: 1` (both): settings and stored errors are there when the files run.

### Defaults (the author's, kept)

Every Lua error of every addon, blocked actions (once per addon and session) and Lua warnings are caught; up to 500 errors kept across sessions, repeats counted ("3x"); capture pauses above 10 errors per second. Signal: the "BugSack: Fatality" sound (sound effects channel) on a new error, at most every 3 s and every 30 s for the same error, and a red minimap icon whose tooltip lists the session's errors. No chat line, no window opening by itself (never in combat even when turned on). `/bugsack` opens the window, `/buggrabber <n>` prints error n; no `/bs`, no clash with the pack's commands. Icon: left click opens or closes, Shift + left click reloads the UI, right click opens the options. The text is an edit box: click, Ctrl+A, Ctrl+C. "Send bugs" whispers the viewed session to another player who has BugSack. Escape does not close the window (close button or icon). French translation complete except one tooltip (patch 2). The sound stays: it tells the player there is an error to send. Mute: right-click the icon, Options, "Mute".

### Patch 1: minimap icon away from Polestar's button

- Both clients. LibDBIcon puts a never-dragged icon at 225°, 5 px past the edge (`LibDBIcon-1.0.lua` 157, 19); the guide turns Polestar's minimap button on (`GroupeAlliance.lua` 77), also at 225° and 5 px past the edge (`Maps/Maps.lua` 27, `Maps/MinimapButton.lua` 23, 29, 39): the two buttons overlap exactly.
- Fix: when `BugSackLDBIconDB.minimapPos` is missing, 160° (left, a little above the middle), set before `PLAYER_LOGIN` (`LibDBIcon-1.0.lua` 320-334). A dragged icon keeps its place. On Forever's minimap (`Blizzard_Minimap\Camelot`), 160° is clear of the calendar and addon compartment (top right), the day/night indicator (about 57°), the mail and other indicators (top left, under the zone name), the zoom buttons (about 310-320°) and the event button (about 195°, during events only); 80 px from Polestar's button. To check in game.

### Patch 2: French minimap tooltip

- French client only. `locales.lua` 232 says "Maj + Clic droit" reloads the UI, but `ldb.lua` 16-30 reloads on Shift + left click and opens the options on any right click. Same text with "Maj + Clic".

### Libraries and conflicts checked

- LibStub 2, CallbackHandler-1.0 v8, LibDataBroker-1.1 v4, LibDBIcon-1.0 v57, LibSharedMedia-3.0 v12000005, AceComm-3.0 v14 with ChatThrottleLib, AceSerializer-3.0. Only Auctionator also embeds LibStub (same version 2): no version conflict.
- PrettyTooltip uses LibSharedMedia when present: its `/ptip` font list then shows LibSharedMedia's names; a chosen font stays, the default font does not change.
- Polestar keeps its own error list (`/polestar report`) and passes errors to the game's handler, so they also reach BugSack. BugGrabber replaces `seterrorhandler` with a no-op; no pack addon calls it. Minimap button: patch 1.
- BuffAlerts, Auctionator: nothing shared. BugGrabber disables `!Swatter` and `!ImprovedErrorFrame` if present (not in the pack).

### Settings across logins

Settings and stored errors load through `LoadSavedVariablesFirst`, which Forever supports. BuffAlerts' settings reset at each login comes from that addon (cause unknown); Polestar keeps its own on the same client. Should BugSack lose its settings anyway, little is lost: the defaults are the wanted ones and patch 1 applies again at each login; only the previous sessions' errors would be missing, so copying an error before logging out is the safe habit. To check in game.

### In-game checks

1. Character screen, AddOns: BugSack and !BugGrabber listed and ticked; no "BugSack requires !BugGrabber" message at login (FR and EN clients).
2. Small sack icon on the left of the minimap, not on Polestar's button or a game button; tooltip "Maj + Clic" (FR), "Shift-Click" (EN).
3. `/run error("guide test")`: sound, red icon; click it, the window shows the error; click the text, Ctrl+A, Ctrl+C, paste in Notepad or Discord: readable text (note any leftover `|cff…`).
4. `/reload` or log in again: the test error is under "Previous session"; a changed option (e.g. "Mute") is kept.
5. An error in combat opens no window.
6. PrettyTooltip `/ptip` font list: LibSharedMedia names, tooltips unchanged.
7. An error Polestar catches also shows in BugSack.
8. "Send bugs" between two players who have the guide: the session arrives, marked "Sent by".
