# Groupe Alliance : guides WoW Forever entre amis

> Basé sur l'addon gratuit [Polestar](https://github.com/fitzforge/polestar) et des guides de la communauté, recoupés avec Wowhead Forever. Des erreurs restent possibles, vérifiez sur Wowhead en cas de doute.
> *Based on the free [Polestar](https://github.com/fitzforge/polestar) addon and community guides, cross-checked with Wowhead Forever. Prepared with AI help: mistakes are possible, check Wowhead when in doubt.*

## Installer / mettre à jour en 1 clic

Deux manières, au choix : le programme (recommandé, 1 clic) ou le ZIP avec `Installer.bat` (repli). *English below.*

### Manière 1 (recommandée) : le programme

1. Télécharger **[GuideWoWForever.exe](https://github.com/BurN-30/wow-forever-guide/releases/latest/download/GuideWoWForever.exe)** (toujours la dernière version).
2. Double-cliquer dessus. Au premier lancement, Windows affiche « Windows a protégé votre ordinateur » : cliquer sur **Informations complémentaires**, puis **Exécuter quand même** (pourquoi : voir « Avertissement de Windows » plus bas).
3. Le programme trouve WoW Forever tout seul (sinon il demande le dossier `World of Warcraft`), télécharge la dernière version du guide, la vérifie, l'installe et dit en clair ce qu'il a fait (« Première installation » ou « Mise à jour de 0.6.2 vers 0.7.0 »). Pour une première installation, si WoW est ouvert, il demande de le fermer.
4. Relancer WoW (un `/reload` ne suffit pas pour un premier ajout) : rien à cocher, le guide s'ouvre tout seul.

**Mettre à jour** : double-clic sur le raccourci **Mettre à jour le guide WoW** du Bureau (créé au premier lancement, aussi dans le menu Démarrer). S'il n'y a rien de neuf, il le dit. Le jeu peut en général rester ouvert (sinon le programme le dit) : à la fin, un bandeau en gros dit quoi faire.

- Bandeau vert « **Mise à jour faite. En jeu, tapez /reload dans le chat** » : taper `/reload` dans le chat du jeu suffit, pas besoin de relancer.
- Bandeau orange « **Quittez complètement le jeu puis relancez-le** » : cette version ajoute ou retire des fichiers d'addon, que le jeu ne lit qu'au lancement ; un `/reload` ne suffit pas. Les notes de la version le disent aussi (« Relancer le jeu »).

Le programme se met aussi à jour lui-même : s'il est plus ancien que la dernière version publiée, il télécharge le nouveau, vérifie son empreinte, se remplace et se relance tout seul. Un ancien `GuideWoWForever.exe` (0.5.0 ou 0.6.x) passe donc au nouveau dès son prochain lancement.

Le guide ne s'ouvre pas ? Écran de sélection des personnages → bouton **AddOns** en bas à gauche → cocher **Polestar** (avec tout ce qu'il regroupe) et, si besoin, **Charger les addons périmés**.

<details>
<summary>Ce que fait le programme, ce qu'il ne touche pas</summary>

- Il lit la dernière version publiée sur GitHub (page [Releases](https://github.com/BurN-30/wow-forever-guide/releases/latest)), télécharge `GuideWoWForever-addons.zip` et refuse le fichier si sa taille ou son empreinte SHA-256 diffère de celle publiée (`SHA256SUMS.txt`).
- Dossier du jeu : celui retenu la fois d'avant, le jeu ouvert, le registre et la configuration de Battle.net, les emplacements habituels sur chaque disque, sinon une fenêtre de choix (le choix est retenu).
- Il repère une installation existante (version écrite dans le `.toc` du paquet, ou Polestar seul déjà présent) et l'annonce avant de commencer.
- Il remplace seulement les dossiers du guide dans `World of Warcraft\_forever_\Interface\AddOns` (`Polestar`, `Polestar...`, `Auctionator`, `PrettyTooltip`, `BuffAlertsForever`, `BugSack` et `!BugGrabber`) et retire ceux d'une ancienne version du guide. Les autres addons et le dossier `WTF` (réglages, progression du guide) ne sont pas touchés.
- L'ancienne version est mise de côté dans `_forever_\Interface\_guide-sauvegarde` (seulement la dernière). En cas de problème pendant le remplacement, elle est remise en place toute seule.
- Aucun droit administrateur. Ses fichiers sont dans `%LOCALAPPDATA%\GuideWoWForever` : la copie du programme visée par le raccourci, `journal.txt` (le détail de chaque lancement, à joindre en cas de problème) et `etat.txt` (dossier du jeu et version installée).
- Désinstaller : supprimer le raccourci, ce dossier, et les dossiers `Polestar...`, `Auctionator`, `PrettyTooltip`, `BuffAlertsForever`, `BugSack` et `!BugGrabber` de `AddOns`. Un seul réglage du jeu reste changé : le texte de quête instantané, que Polestar allume (roue dentée, Quêtes plus rapides) et ne rend qu'en décochant l'option. Le décocher avant de supprimer les dossiers, ou plus tard dans les options d'interface du jeu.
</details>

### Manière 2 (repli) : le ZIP et `Installer.bat`

1. Bouton vert **Code** → **Download ZIP** (ou `Source code (zip)` sur la page [Releases](https://github.com/BurN-30/wow-forever-guide/releases/latest)), puis dézipper.
2. Fermer WoW, double-cliquer sur **`Installer.bat`** (il trouve le dossier du jeu et remplace les dossiers du guide). Windows bloque le fichier ? Clic droit sur `Installer.bat` → **Propriétés** → cocher **Débloquer** → **OK**.
3. Relancer WoW.

Mettre à jour : retélécharger le ZIP et relancer `Installer.bat` (l'ancienne version est mise de côté dans `_forever_\Interface\_guide-sauvegarde`, comme avec le programme). Encore plus à la main : télécharger `GuideWoWForever-addons.zip` sur la page [Releases](https://github.com/BurN-30/wow-forever-guide/releases/latest) et le dézipper dans `World of Warcraft\_forever_\Interface\AddOns` en remplaçant les dossiers existants.

### Install / update in 1 click (English)

Two ways: the program (recommended, 1 click) or the ZIP with `Installer.bat` (fallback).

**Way 1 (recommended): the program**

1. Download **[GuideWoWForever.exe](https://github.com/BurN-30/wow-forever-guide/releases/latest/download/GuideWoWForever.exe)** (always the latest version).
2. Double-click it. On the first run, Windows shows "Windows protected your PC": click **More info**, then **Run anyway** (why: see "Windows warning" below).
3. The program finds WoW Forever by itself (otherwise it asks for the `World of Warcraft` folder), downloads the latest guide, checks it, installs it and tells you what it did ("First install" or "Update from 0.6.2 to 0.7.0"), in English if Windows is in English. For a first install, if WoW is running, it asks you to close it.
4. Restart WoW (a `/reload` is not enough the first time): nothing to tick, the guide opens by itself.

**Update**: double-click the **Update the WoW guide** shortcut on the desktop (created on the first run, also in the Start menu). If there is nothing new, it says so. The game can usually stay open (otherwise the program says so): at the end, a large banner says what to do. Green "**Update done. In game, type /reload in the chat**": `/reload` is enough. Orange "**Quit the game completely, then start it again**": this version adds or removes addon files, which the game only reads at startup. The program also updates itself (downloads the new one, checks its checksum, replaces itself and restarts), so an old `GuideWoWForever.exe` switches to the new one on its next run.

It only replaces the guide folders (`Polestar...`, `Auctionator`, `PrettyTooltip`, `BuffAlertsForever`, `BugSack` and `!BugGrabber`) in `World of Warcraft\_forever_\Interface\AddOns`. Other addons and the `WTF` folder (settings, guide progress) are left alone. The previous version is kept in `_forever_\Interface\_guide-sauvegarde`. Log in case of trouble: `%LOCALAPPDATA%\GuideWoWForever\journal.txt`. No admin rights needed.

**Way 2 (fallback): the ZIP and `Installer.bat`**

1. Green **Code** button → **Download ZIP** (or `Source code (zip)` on the [Releases](https://github.com/BurN-30/wow-forever-guide/releases/latest) page), then unzip.
2. Close WoW, double-click **`Installer.bat`** (it finds the game folder and replaces the guide folders). Windows blocks the file? Right-click `Installer.bat` → **Properties** → tick **Unblock** → **OK**.
3. Restart WoW.

Update: download the ZIP again and run `Installer.bat` again. Fully manual: download `GuideWoWForever-addons.zip` from the [Releases](https://github.com/BurN-30/wow-forever-guide/releases/latest) page and unzip it into `World of Warcraft\_forever_\Interface\AddOns`, replacing existing folders.

### Avertissement de Windows (SmartScreen) / Windows warning

`GuideWoWForever.exe` n'est pas signé avec un certificat payant, et Windows se méfie de tout programme nouveau et peu téléchargé : il affiche « Windows a protégé votre ordinateur ». Ce n'est pas un virus détecté. Passer outre : **Informations complémentaires** → **Exécuter quand même** (une seule fois : le raccourci créé ensuite ne redemande rien). Le programme est construit par GitHub à partir du code de ce dépôt (dossier `installer-exe`, fichier `.github/workflows/release.yml`). Vérifier le fichier téléchargé : dans PowerShell, `Get-FileHash "$env:USERPROFILE\Downloads\GuideWoWForever.exe"` doit donner l'empreinte écrite dans `SHA256SUMS.txt` de la release.

*The exe is not signed with a paid certificate, so Windows warns about any new, rarely downloaded program. It is not a virus alert: **More info** → **Run anyway**. GitHub builds it from this repository's code; compare `Get-FileHash` with `SHA256SUMS.txt` to check it.*

Un antivirus bloque le programme à tort ? Utiliser la manière 2, et signaler le faux positif à l'éditeur de l'antivirus (pour Microsoft Defender : [wdsi/filesubmission](https://www.microsoft.com/wdsi/filesubmission)). *An antivirus wrongly blocks the program? Use way 2 and report the false positive to the antivirus vendor.*

## Utiliser

- Le guide de parcours de Polestar s'ouvre tout seul pour ton personnage (voir « Premier lancement »). Changer : `/polestar guides`. Les chapitres de donjon du paquet sont proposés tout seuls au bon moment (voir « Le parcours et les donjons ») ; ils sont aussi dans `/polestar guides` → **Guides de la communauté** → **Groupe Alliance**.
- En haut à droite de la fenêtre du guide : la **roue dentée** ouvre les réglages de Polestar (flèche de direction, affichage, automatismes), **?** donne l'aide en bref.
- **Réduire** : bouton **_** à côté du **?**. La fenêtre devient une petite icône Polestar (à glisser où on veut ; clic droit : fine bannière avec l'étape en cours ; clic : la fenêtre revient). Masquer : `/polestar hide`, le bouton Polestar de la minicarte, ou un raccourci dans Options > Raccourcis > Polestar.
- **En donjon** (et en raid, champ de bataille, arène), la fenêtre reste visible : c'est là que servent les chapitres de donjon (réglage du paquet depuis la 0.13.1 ; Polestar seul la cache en entrant). La cacher en donjon : roue dentée → **Guide** → **Fenêtre** → **Dans les donjons et champs de bataille** : **Masquer** ; `/polestar` la rouvre alors dans le donjon jusqu'à la sortie. Ce choix est gardé, les mises à jour du guide n'y touchent pas.
- **Survole** n'importe quelle ligne : l'infobulle explique tout, avec une astuce (en vert) sur les quêtes pénibles. Une petite **étoile verte** en bout de ligne signale qu'une astuce attend.
- **Marque orange ou rouge** en bout de ligne : passage difficile à ton niveau réel (élite, monstres en groupe, escorte, quête bien au-dessus de toi). L'infobulle dit pourquoi, le niveau conseillé seul, le nombre de joueurs conseillé et comment faire seul ou à plusieurs. Elle disparaît d'elle-même quand tu as le niveau. Orange : il manque 1 ou 2 niveaux ; rouge : 3 ou plus.
- **Escorte** (étiquette violette) en bout de ligne : quête d'escorte. L'infobulle rappelle de la prendre AVANT le départ si l'on est en groupe et de ne pas trop s'éloigner du PNJ. Masquer : roue dentée, Guide, Fenêtre, Groupe Alliance.
- **Quêtes de groupe** : à certaines étapes du parcours, Polestar affiche un bandeau « Quête de groupe » qui propose **La passer** ou **La faire en groupe** (en anglais : *Skip it*, *Do it with a group*). Seul : La passer, le guide reste sur la route solo. Changer d'avis : roue dentée, Découverte, Quêtes de groupe (une par une), ou tout répondre d'un coup dans le menu déroulant Quêtes de groupe. Les donjons du chapitre de fin (Rochenoire, Hache-Tripes, Stratholme, Scholomance) posent aussi cette question, chacun la sienne.
- **Donjons** : une carte propose le chapitre du groupe au bon moment, **Ouvrir le chapitre**, **Plus tard** ou **Pas pour moi** (détail dans « Le parcours et les donjons »). `/ga donjon` pour la revoir, même après « Pas pour moi ». Avant le donjon, le chapitre rappelle les quêtes à avoir dans le journal.
- **Carte** : la carte du monde montre les quêtes prêtes à rendre et les objectifs des quêtes de l'étape en cours (là où se trouvent les monstres et objets demandés), rien de plus. Pour en voir plus ou moins : menu de suivi de la carte du monde (bouton de filtre en haut à droite de la carte, celui où se trouve « Polestar : services PNJ ») ou de la minicarte, sous-menu **Polestar : repères de quête**. Cases : objectifs sur la carte, seulement ceux de l'étape en cours, zones d'objectif ombrées, quêtes à rendre, quêtes disponibles (donneurs jusqu'à 3 niveaux au-dessus), repères sur la minicarte. La carte change tout de suite. Mêmes réglages dans la roue dentée, Carte, Guide et quêtes.
- **« Bigobox 827 », « Bigobox 525 »…** sur la carte ou dans le guide : c'est le vrai nom de ces quêtes de Sombrivage. Une Bigobox est une petite boîte-robot posée dans la nature : on lui rend la quête et elle donne la suivante.
- **Ctrl+clic** sur une ligne : lien Wowhead prêt à copier (Ctrl+C), en français ou en anglais selon ton jeu (`/ga lang fr`, `en` ou `auto` pour forcer).
- **?** dans une infobulle : info pas encore confirmée, à vérifier sur Wowhead.
- Les quêtes de l'étape en cours sont prises et rendues toutes seules (voir « Confort en jeu »). Aucune fenêtre ne s'ouvre toute seule.

## Prix de l'hôtel des ventes (Auctionator)

Le guide installe aussi [Auctionator](https://www.curseforge.com/wow/addons/auctionator) : le prix de l'hôtel des ventes s'affiche dans l'infobulle des objets et des ressources, partout dans le jeu.

- Mettre les prix à jour : à l'hôtel des ventes, onglet **Auctionator**, bouton **Analyse complète** (*Full Scan*). À refaire de temps en temps, les prix gardés sont ceux de la dernière analyse.
- Vendre : onglet **Ventes** d'Auctionator, il propose un prix juste sous le moins cher. Acheter : onglet **Achats** et listes de courses.
- Un Auctionator déjà installé est remplacé par la version du guide ; ses réglages et ses prix (dossier `WTF`) sont gardés.
- Version 354 avec deux correctifs du pack (0.14.0) : les prix des objets à suffixe (« ... de l'Ours ») ne s'arrêtent plus après le premier reconnu, et la conversion des anciens prix ne peut plus bloquer le chargement des prix. Détail, bancs et diff : [`docs/auctionator-correctifs.md`](docs/auctionator-correctifs.md).

## Infobulles redessinées (PrettyTooltip)

Le guide installe aussi [PrettyTooltip](https://www.curseforge.com/wow/addons/prettytooltip) (édition Forever) : les infobulles des objets, des sorts, des personnages et PNJ, des améliorations et affaiblissements (*buffs*, *debuffs*), des herbes, minerais et coffres et des quêtes sont redessinées, plus lisibles (caractéristiques en couleur, niveau d'objet, barre de vie, ce que donne une herbe ou un minerai).

- Les lignes ajoutées par les autres addons restent, en bas de l'infobulle et à part : objectifs de quête, « amélioration » d'équipement, provenance et « Alt-clic : me guider » de Polestar, prix d'Auctionator, ligne « À quoi sert cet objet ». Les infobulles du guide lui-même (lignes du guide, flèche, boutons) gardent l'aspect du jeu.
- **Alt** maintenue : l'infobulle d'origine du jeu, le temps de l'appui. L'Alt-clic de Polestar sur un objet marche toujours.
- **Maj** maintenue : les détails (résultats de désenchantement, contenu des herbes et minerais, numéro de l'objet ou du PNJ). Maj garde aussi son rôle habituel : comparer avec l'objet équipé.
- `/ptip` : éditeur de style, refait en 1.5.0 : réglages généraux (**General**), puis pour toutes les infobulles et pour chaque type (**All Tooltips**) : ce qui est redessiné (**Restyle**), ce qui suit le curseur (allumé pour les herbes, minerais et coffres), les touches, l'aspect de chaque partie ; un clic sur une partie de l'exemple la règle. La page de PrettyTooltip dans les options du jeu (`/ptip options`) n'a plus qu'un bouton qui ouvre l'éditeur.
- Revenir aux infobulles du jeu : `/ptip`, le type voulu, décocher **Restyle** ; ou décocher PrettyTooltip dans la liste des addons (écran des personnages, bouton **AddOns**).
- Réglages : ceux de PrettyTooltip, le guide n'en impose aucun (rien à changer pour Polestar ni Auctionator). Un PrettyTooltip déjà installé est remplacé par la version du guide ; ses réglages (dossier `WTF`) sont gardés.
- Version 1.5.0 avec correctifs du pack, pour les clients français et anglais : deux libellés français, noms des membres du groupe sous une quête, objectifs remplis cochés dans le journal de la carte. Le bonus d'ensemble actif gardé dans la liste est maintenant corrigé par l'auteur, avec en plus son nombre de pièces, « (2) » : le correctif du pack est retiré, comme deux autres avant lui (numéro de sort à la place de la description d'une amélioration, badge de dépeçage des créatures propres à Forever). Depuis la 1.4.1, les infobulles de la minicarte sont réduites au texte du jeu : Blizzard a retiré la lecture de leurs données, le niveau de cueillette et la couleur de classe n'y sont plus. Détail, tickets amont et diff : [`docs/prettytooltip-correctifs.md`](docs/prettytooltip-correctifs.md).

## À quoi sert cet objet

Sous l'infobulle d'un objet, une ligne bleue dit à quoi il sert encore, seulement quand c'est sûr : quête que le personnage peut encore faire (ou déjà rendue, pour un objet de quête), nourriture ou boisson adaptée à son niveau ou dépassée, composant d'un sort de classe, composant d'un métier (et dès quel niveau de métier, quand il est connu), outil, objet gris seulement à vendre (avec le prix du marchand). Rien pour l'équipement (Polestar le compare déjà à celui porté), rien quand on ne sait pas.

- Exemples : « Composant : Couture (dès 55), Secourisme (dès 80), Ingénierie », « Quête : Les écailles de dragonnet (pas encore prise) », « Nourriture dépassée : celle du niveau 15 rend plus », « Seulement à vendre : 5 pc ».
- Couper : `/ga objets` (rallumer : la même commande), ou la case **À quoi sert cet objet** dans Échap › Options › AddOns › **Groupe Alliance**, ou roue dentée › Confort de jeu › Quêtes.
- Données tirées des tables du jeu (client 1.60.1), vérifiées sur un échantillon de 68 objets. Détail, sources et limites : [`docs/a-quoi-sert-cet-objet.md`](docs/a-quoi-sert-cet-objet.md).

*English: a blue line under item tooltips says what the item is still for, only when certain (quest, food or drink for your level, spell reagent, profession reagent and from which rank, tool, grey item only worth selling). Off: `/ga items`, or Esc › Options › AddOns › Groupe Alliance.*

## Rappels d'améliorations (BuffAlerts Forever)

Le guide installe aussi [BuffAlerts Forever](https://www.curseforge.com/wow/addons/buffalerts), **éteint à la première installation** : rien ne s'affiche tant qu'il n'est pas coché. **L'allumer** : écran des personnages, bouton **AddOns**, cocher **BuffAlerts Forever** (en jeu : menu Échap, **AddOns**, cocher, puis recharger l'interface). Un ami qui l'avait déjà avant la 0.10.0 le garde tel qu'il était ; le décocher au même endroit pour l'éteindre. *English: off on a first install; turn it on from the character screen, **AddOns** button, tick **BuffAlerts Forever**.*

Une fois allumé, une icône apparaît en haut à droite, sous les améliorations, quand une amélioration de classe (*buff*) manque, et une rangée de petites icônes en haut de l'écran rappelle le reste. Seules les alertes de la classe jouée se chargent.

- **Guerrier** : Cri de guerre (*Battle Shout*), en combat, avec un son (réglage du guide) et un compte à rebours 5 s avant la fin ; Fulgurance (*Overpower*), Vengeance (*Revenge*) et Exécution (*Execute*) quand le jeu les rend utilisables.
- **Druide** : Marque du fauve (*Mark of the Wild*, le Don du fauve compte aussi), avec une petite icône à côté du cadre de chaque membre du groupe qui ne l'a pas ; Épines (*Thorns*) ; Idées claires (*Clearcasting*) le temps où l'Augure de clarté (*Omen of Clarity*) se déclenche, si le talent est pris.
- **Démoniste** : Peau de démon ou Armure démoniaque (*Demon Skin*, *Demon Armor*), démon absent, moins de 5 Fragments d'âme (*Soul Shard*).
- **Mage** : armure (n'importe laquelle éteint l'alerte ; l'icône propose celle de la spécialisation), Intelligence des arcanes (*Arcane Intellect*, l'Illumination des arcanes compte aussi), avec la petite icône à côté des membres du groupe qui utilisent du mana.
- **Toutes les classes**, hors combat : nourriture (« Bien nourri », *Well Fed*), feu de camp (« Avantages du camp », *Camp Benefits*), sac de couchage douillet (« Bien reposé », seulement avec le sac dans les sacs), durabilité sous 20 %, arme absente. À cheval, hors combat, toutes les alertes se cachent (`/balert mount` pour les garder). Les autres classes (prêtre, paladin, chasseur, voleur, chaman) ont aussi leurs alertes.
- `/balert` (ou `/buffalerts`) : fenêtre des options, en anglais (activer chaque alerte, *Only in combat*, *Play sound*, taille, position ; bouton **Move icons** pour déplacer les icônes à la souris). `/balert toggle` : masquer ou réafficher toutes les alertes. `/balert buffs` : liste des améliorations en cours avec leur numéro, à joindre si une alerte ne s'éteint pas.
- Limites du jeu : en combat, le jeu cache les améliorations aux addons. BuffAlerts part de la dernière lecture d'avant le combat et des sorts lancés par le personnage ; une amélioration dissipée en combat n'est vue qu'après. Les réglages reviennent à leurs valeurs par défaut à chaque connexion (bogue du client bêta selon l'auteur) : un changement dans `/balert` dure jusqu'à la déconnexion.
- Temps restant du Cri de guerre (ou d'un autre sort) en barre : le jeu a son **gestionnaire de temps de recharge** (*Cooldown Manager*). L'activer dans Échap › Options › Options avancées › Gestionnaire de temps de recharge, le placer en **Mode édition** (*Edit Mode*), choisir les sorts suivis avec `/cdm`. Les deux se complètent : la barre montre le temps restant, BuffAlerts signale l'oubli.
- Si une icône recouvre la flèche de Polestar (selon l'échelle de l'interface) : glisser la flèche ailleurs, Polestar retient sa place.
- Réglages du guide : éteint à la première installation, le son de l'alerte du Cri de guerre, les icônes sous les améliorations en taille moyenne. Version 3.14.1 avec correctifs du pack, pour les clients français et anglais : en français, les rappels de nourriture, de feu de camp et du sac de couchage ne s'éteignaient jamais (noms anglais seulement), les parchemins et buffs de camp qui remplacent un buff de classe n'étaient pas reconnus (même cause) et l'alerte Idées claires ne s'affichait jamais en combat (même cause) ; touches de la fenêtre d'options en combat. Nouveautés de l'auteur depuis la 3.11.4 : mode sommeil (en ville ou à l'auberge, les rappels d'améliorations se mettent en pause, la petite rangée utilitaire reste ; `/balert sleep`), alerte *Reckless Swings* (guerrier Fureur), option *Only in combat* réparée pour les capacités réactives, Bouclier d'eau (*Water Shield*) du chaman, Idées claires en alerte de déclenchement (au lieu d'une icône permanente), *Victory Rush* cherché aussi par son nom ; depuis la 3.13.1, parchemins et buffs de camp comptés comme le buff de classe qu'ils remplacent, et le buff qui bloque un sort appris (`/balert buffs`, `/balert forget`) ; alertes cachées à cheval (3.14.0) ; alerte du sac de couchage (3.14.1). Les fichiers de l'auteur ne sont pas modifiés, hors trois lignes du `.toc` (`X-Pack-Patches`, éteint à la première installation, `PackPatches.lua`) ; tout le code du paquet tient dans `PackPatches.lua`. Détail, vérifications et diff : [`docs/buffalerts-correctifs.md`](docs/buffalerts-correctifs.md).
- Couper les alertes : `/balert toggle` (jusqu'à la déconnexion), ou décocher BuffAlerts Forever dans la liste des addons (écran des personnages, bouton **AddOns**). Un BuffAlerts Forever déjà installé est remplacé par la version du guide ; sa case (cochée ou non) ne change pas.

## Erreurs d'addon à envoyer (BugSack)

Le guide installe aussi [BugSack](https://github.com/funkydude/BugSack) et [BugGrabber](https://www.curseforge.com/wow/addons/bug-grabber) (dossier `!BugGrabber`). Quand un addon du guide plante (Polestar, Auctionator, PrettyTooltip, BuffAlerts…), le jeu n'affiche rien et l'erreur est perdue. Avec BugSack, elle est gardée avec tout ce qu'il faut pour la corriger (fichier, ligne, enchaînement des appels), prête à copier pour BurN-30. BugSack ne corrige rien et n'envoie rien tout seul.

**Repérer une erreur** : un son (« Fatality ») et l'icône BugSack, un petit sac à gauche de la minicarte, passe au rouge. Son infobulle donne le nombre d'erreurs de la session. Aucune fenêtre ne s'ouvre toute seule, jamais en combat.

**Copier une erreur et l'envoyer, pas à pas** :

1. Ouvrir BugSack : **clic gauche** sur l'icône du sac, ou taper `/bugsack` dans le chat. La fenêtre montre la dernière erreur.
2. Plusieurs erreurs : boutons **< Précédent** et **Suivant >** (*< Previous*, *Next >*) ; en haut à droite, « 2/3 » veut dire erreur 2 sur 3. Onglets en bas : **Tous les bugs** (*All bugs*), **Session actuelle** (*Current session*), **Session précédente** (*Previous session*, la connexion d'avant), **Options**.
3. Cliquer dans le texte de l'erreur, puis **Ctrl+A** (tout sélectionner) et **Ctrl+C** (copier). Le jeu n'a pas de clic droit « Copier » : seul le raccourci marche.
4. Coller (**Ctrl+V**) dans un message Discord à BurN-30 ou au groupe (ou dans un fichier texte). Une erreur par message s'il y en a plusieurs. Le « 3x » au début veut dire que l'erreur est arrivée 3 fois : c'est utile, le laisser.
5. Ajouter en quelques mots :
   - la **version du guide** : le numéro à côté de « Groupe Alliance · donjons » dans `/polestar guides` (ligne de l'auteur d'un guide du groupe), ou celui que donne le programme d'installation (« Guide déjà installé : v0.9.3 ») ;
   - la **langue du jeu** : français ou anglais ;
   - **ce que faisait le personnage** : guide et étape, quête, PNJ, fenêtre ouverte, en combat ou non, et si l'erreur revient.
6. Une fois envoyé, pour repartir de zéro (facultatif) : clic droit sur l'icône → onglet **Options** → **Effacer les bugs enregistrés** (*Wipe saved bugs*).

Bon à savoir :

- Les erreurs sont gardées d'une connexion à l'autre (500 au plus) : une erreur d'hier est dans **Session précédente** ou **Tous les bugs**. Copier avant de se déconnecter reste le plus sûr.
- Les lignes « [ADDON_ACTION_BLOCKED] L'AddOn '…' a tenté d'appeler la fonction protégée '…' » sont aussi des erreurs à envoyer.
- Fermer la fenêtre : la croix en haut à droite, ou un clic sur l'icône (Échap ne la ferme pas). **Maj + clic** sur l'icône recharge l'interface, comme `/reload`.
- Couper le son : clic droit sur l'icône → **Options** → cocher **Muet** (*Mute*). Déplacer l'icône : la glisser autour de la minicarte. La masquer : décocher **Icône mini-carte** (*Minimap icon*) ; `/bugsack` marche toujours.
- **Envoyer les bugs** (*Send bugs*), dans la fenêtre : envoie les erreurs de la session affichée à un autre joueur qui a BugSack, en jeu (à essayer entre nous).
- Réglages : ceux de l'auteur (son, icône, pas de fenêtre automatique). Le guide change seulement la place de l'icône à la première installation, à l'écart du bouton Polestar de la minicarte (ils étaient l'un sur l'autre), et corrige l'infobulle française de l'icône. Les fichiers de l'auteur ne sont pas modifiés, tout tient dans `BugSack/PackPatches.lua`. Détail, vérifications et diff : [`docs/bugsack-correctifs.md`](docs/bugsack-correctifs.md).
- Avec BugSack, la liste des polices de `/ptip` (PrettyTooltip) montre d'autres noms (« Friz Quadrata TT »…) : les infobulles ne changent pas.
- Ne plus s'en servir : décocher BugSack et !BugGrabber dans la liste des addons (écran des personnages, bouton **AddOns**). Un BugSack ou un BugGrabber déjà installé est remplacé par la version du guide.

*English client: when a guide addon breaks, a sound plays and the BugSack icon (a small sack on the left of the minimap) turns red. To send the error to BurN-30: left-click the icon (or type `/bugsack`), use **< Previous** / **Next >** to pick the error, click in its text, press **Ctrl+A** then **Ctrl+C**, and paste it (**Ctrl+V**) in a Discord message. Add the guide version (the number next to "Group Alliance · dungeons" in `/polestar guides`), the game language (English or French) and what the character was doing (guide step, quest, NPC, window, combat). Errors are kept across logins (**Previous session** tab). Right-click the icon → **Options** → **Mute** turns the sound off; **Shift+click** on the icon reloads the UI.*

## Confort en jeu

Polestar fait déjà, sans autre addon, la plupart des petits automatismes de confort. Tout se règle dans la **roue dentée** (en haut à droite de la fenêtre du guide) ; la case de recherche des réglages trouve chaque option par son nom.

| Quoi | Où, dans la roue dentée | Par défaut |
|---|---|---|
| Prendre et rendre les quêtes du guide | Quêtes → Quêtes → Quêtes plus rapides : **Accepter les quêtes du guide**, **Rendre les quêtes du guide** | allumé (depuis la 0.7.3) |
| Texte de quête instantané, dialogues à choix unique passés, option de dialogue de l'étape choisie | Quêtes → Quêtes → Quêtes plus rapides | allumé |
| Butin rapide (avec la fouille automatique du jeu) | Quêtes → Quêtes → Quêtes plus rapides : **Fouille automatique rapide** | allumé |
| Récompenses : la meilleure marquée, prise toute seule, équipée | Quêtes → Récompenses et équipement | marquée seulement |
| Marchands : vendre les objets gris, réparer, acheter pour le guide | Confort de jeu → Marchands → Marchands | vendre et réparer allumés |
| Réapprovisionnement (boissons, nourriture, munitions) | Confort de jeu → Marchands → Racheter | bouton allumé, rien n'est acheté sans clic |
| Sacs : place libre, marques camelote et à garder | Confort de jeu → Marchands → Sacs | allumé |
| Entraîneurs : apprendre les nouveaux sorts, rappel de monte | Confort de jeu → Marchands → Maîtres | rappel de monte seulement |
| Maîtres de vol : carte de vol ouverte, destination marquée | Confort de jeu → Voyages → Maîtres de vol | allumé |
| Pierre de foyer : lieu de repos à l'auberge du guide, bouton | Confort de jeu → Voyages → Pierre de foyer | bouton seulement |
| Mort : cadavre ou esprit guérisseur, manque d'air | Confort de jeu → Voyages → Mort | cadavre ou esprit guérisseur |
| Social : invocations, résurrections, groupes d'amis, refus des duels et invitations | Confort de jeu → Social | éteint |

**Quêtes prises et rendues toutes seules** (0.7.3) :

- Seulement les quêtes de l'étape en cours du guide. Jamais de choix entre des récompenses, ni de quête qui coûte de l'or ou active le JcJ. **Maj** enfoncée en parlant au PNJ : pas cette fois.
- Quêtes de groupe : jamais prises tant que la question n'a pas reçu « La faire en groupe ». Passée (« La passer ») ou sans réponse : rien n'est pris.
- **Une quête précise** : clic droit sur sa ligne dans le guide → **Ne pas prendre ni rendre automatiquement** (à cocher ou décocher, gardé pour tout le compte). La liste des exceptions, pour les voir et les retirer : roue dentée → Quêtes → Quêtes → **Groupe Alliance : quêtes automatiques**.
- **Escortes et quêtes partagées** : quand un membre du groupe lance une escorte ou partage une quête, elle est acceptée tout de suite si elle fait partie de l'étape en cours ou des deux suivantes, sauf exception. Réglage **Quêtes partagées et escortes du groupe**, dans la même section.
- Tout couper : décocher **Accepter les quêtes du guide** et **Rendre les quêtes du guide**.
- Déjà joueur de la 0.7.2 : l'automatisme s'allume, même pour qui l'avait éteint (Polestar ne garde pas un réglage égal à la valeur par défaut, et l'ancien défaut était « éteint »). Un message dans le chat le dit une fois, à la connexion.

Leatrix Plus reste installable à part (depuis sa page officielle), mais son option « Automate quests » doit rester éteinte : sinon elle prend aussi les quêtes de groupe que le guide propose de passer (le guide prévient une fois s'il la voit allumée).

## Autres addons, non inclus

Étudiés en novembre 2026 et laissés hors du paquet. Chacun s'installe à part, depuis sa page officielle (fichier téléchargé sur le site, sans l'application CurseForge), en dézippant son dossier dans `World of Warcraft\_forever_\Interface\AddOns`. Le programme d'installation du guide ne touche pas à ces dossiers.

| Addon | Ce qu'il fait | Pourquoi il n'est pas dans le paquet | Avec le guide |
|---|---|---|---|
| [OpenMap](https://github.com/openmap-world/openmap/releases) (licence MIT) | carte du monde d'un seul tenant, zoom d'une zone à l'autre | 126 Mo à lui seul (plus que le paquet entier, environ 94 Mo depuis Polestar 0.4), une version par jour depuis sa sortie, défauts encore ouverts (baisse d'images par seconde, action bloquée à l'ouverture de la carte que BugSack signalerait : ticket #82, présent dans toutes les versions de la 0.5.0 à la 0.8.5, d'où l'absence d'option dans `Installer.bat` tant qu'il n'est pas corrigé) | Polestar le reconnaît : ses repères, sa trace et ses trajets s'affichent sur la carte d'OpenMap. Couper les autres addons de carte |
| [Keep or Toss: Forever](https://www.curseforge.com/wow/addons/keep-or-toss-forever) (tous droits réservés) | dit dans l'infobulle à quoi sert encore un objet (quête, métier, composant, secret de Forever) | licence : pas de redistribution | le paquet a sa propre ligne, écrite à partir des tables du jeu (« À quoi sert cet objet », plus haut) : inutile de l'ajouter ; sinon, sans Questie, il ne connaît pas les quêtes pas encore prises (il le dit) et ses marques dans les sacs s'ajoutent à celles de Polestar |
| [Node Sight](https://www.curseforge.com/wow/addons/node-sight) (tous droits réservés) | image de chaque herbe et minerai sur la minicarte, flèche et étincelles en option | licence : pas de redistribution ; balaie la minicarte en la déplaçant sous la souris | utile seulement aux herboristes et mineurs ; ses étincelles changent des réglages du jeu (touche d'interaction), à couper avant de le retirer |

*Other addons studied and left out of the pack (install them yourself from their official page): OpenMap (MIT, but 126 MB, daily releases, open issues; Polestar draws its markers on it), Keep or Toss: Forever and Node Sight (all rights reserved: not redistributable).*

## Le parcours et les donjons

**Le parcours est celui de Polestar** (depuis la 0.13.0) : ses guides de zone, tenus à jour par ses auteurs, de la vallée de départ de chaque race jusqu'au niveau 60, avec les zones nouvelles de Forever (les Riverglades, Shen'dralas, le mont Hyjal). **Chacun joue à son rythme** : Polestar relit le journal de quêtes à chaque connexion, coche tout seul ce qui est déjà rendu ou en cours, et reprend au bon endroit. Un joueur en avance n'est pas renvoyé vers les quêtes devenues grises (réglage « Passer les quêtes grises », activé par le paquet). En groupe, avec Polestar chez tout le monde, le panneau de groupe montre où en est chacun ; l'XP de groupe est meilleure à 4 niveaux d'écart ou moins.

**Le paquet ajoute les chapitres du groupe** : le rendez-vous de la Marche de l'Ouest et 17 chapitres de donjon, chacun avec ses quêtes à prendre, le trajet jusqu'à l'entrée, le donjon (boss par boss pour la plupart) et les rendus. Aucune étape n'est passée d'office : un boss se coche à la main (ou tout seul quand une quête le demande), une quête de groupe pose sa question « La passer / La faire en groupe ».

- **Une carte propose le chapitre au bon moment**, au-dessus de la fenêtre du guide (la même carte que les annonces de Polestar) : quand le parcours de Polestar passe au point d'accroche du chapitre (une quête rendue ou prise), au niveau du donjon, une fois l'arrêt du parcours fini (ses autres rendus, son point de vol, sa pierre de foyer), pour ne rien y laisser. Jamais en combat, jamais dans une instance, une seule carte à la fois. Pour l'Alliance seulement : un personnage de la Horde du même compte n'en voit aucune.
- **Ouvrir le chapitre** : il s'ouvre dans un onglet de plus. Le guide du parcours garde son onglet et son étape. L'onglet du chapitre se ferme de lui-même une fois ses rendus faits (ceux de toutes ses étapes sans condition, et ceux d'une quête facultative prise en route si elle est finie) : une quête de groupe passée, une quête jamais prise ou une quête que le groupe n'a pas pu finir ne le retiennent pas. Le parcours revient alors, avec les quêtes rendues dans le chapitre comptées. Les Ruines de Lordaeron rendent leurs quêtes à Hurlevent, plus tard sur le parcours : retourner à la main sur l'onglet du parcours après le bateau, l'onglet des Ruines se ferme à ces rendus. Les donjons 55-60 et le second passage à Zul'Farrak se ferment à la fin de leur guide.
- **S'arrêter avant la fin** (groupe qui se sépare, quête principale ratée) : fermer l'onglet du chapitre à sa croix ; le parcours revient. Le chapitre reste dans `/polestar guides` → **Guides de la communauté** → **Groupe Alliance**, pour le rouvrir plus tard.
- **Plus tard** : la carte revient une fois au niveau suivant, tant que le donjon est à niveau ; au-delà, la carte de Polestar pour ce donjon peut revenir. **Pas pour moi** : plus proposée d'elle-même, `/ga donjon` la remontre. Les réponses sont gardées par personnage.
- **Une seule proposition par donjon** : la carte de Polestar pour un donjon du paquet ne sort plus, la nôtre la remplace. Jamais moins bien que Polestar seul : chaque chapitre est proposé au plus tard au niveau où Polestar aurait proposé le même donjon ; un personnage qui a dépassé le point d'accroche sans faire sa quête reçoit le chapitre quand Polestar aurait sorti sa carte ; un chapitre dépassé sans avoir été proposé laisse revenir la carte de Polestar.
- **Revoir la proposition** : `/ga donjon` (ou `/ga dungeon`) remontre la carte du chapitre dû, même refusé par « Pas pour moi » s'il est encore à niveau, ou dit chapitre par chapitre pourquoi aucun ne l'est (déjà fait, dépassé, à partir du niveau..., pas encore à son arrêt du parcours), dans la langue du jeu.

| Chapitre (`/polestar guides`, Groupe Alliance) | Proposé (parcours de Polestar) | Niveaux | Ce qu'il contient |
|---|---|---|---|
| Groupe · Rendez-vous dans la Marche de l'Ouest | Colline des sentinelles, premier arrêt (vers 11 à 16 selon la race) | 10-17 | Jouer le parcours à plusieurs : niveaux d'arrivée par race, outils de groupe de Polestar, fonctionnement des cartes ; se finit en cochant sa ligne |
| Donjon · La Salle des Thanes | dernier arrêt de la Colline des sentinelles, avant le vol pour Hurlevent (vers 15) | 13-19 | Quêtes de Forgefer, les quatre boss, An Ancient Grudge |
| Donjon · Ruines de Lordaeron | Auberdine, avant le bateau (vers 20) | 17-22 | Bateau pour Austrivage, quêtes, le donjon ; les rendus de Hurlevent attendent le passage du parcours (l'onglet reste ouvert jusque-là) |
| Donjon · Les Mortemines | rendu du traître défias à la Colline des sentinelles (vers 21) | 18-24 | Gryan, Hurlevent, le donjon boss par boss, Bazil Thredd pour la Prison |
| Donjon · Profondeurs de Brassenoire | Astranaar, fin de la première visite d'Orneval (vers 25) | 23-28 | Un seul détour depuis Auberdine, Aube d'argent en option (Darnassus) |
| Donjon · La Prison | dernier arrêt de Hurlevent du Bois de la Pénombre (vers 29) ou des Paluns (vers 31) | 25-31 | Quêtes de Hurlevent, le donjon, la fin de l'histoire des Défias (anneau Sceau de Wrynn) |
| Donjon · Site de fouilles : les Paluns | Menethil, fin des Paluns (vers 30) | 27-34 | Quêtes de Menethil et de Caitlin, rendus sur le chemin de Forgefer |
| Donjon · Gnomeregan | Hurlevent, fin des Paluns (vers 31) ; après la Prison si les deux sont dus | 29-35 | Shoni, Brikabrok, Kharanos, le donjon pièce par pièce |
| Donjon · Cité de Dalaran | Austrivage, An Alarming Request (vers 31) ; sinon chez Modera (vers 37) | 30-38 | Depuis le camp de Modera, sept boss |
| Donjon · Kraal de Tranchebauge | rendu du journal de Lonebrow à Falfindel (vers 33) | 29-37 | The Crone of the Kraul, Willix, Charlga |
| Donjon · Le Monastère écarlate | Down the Scarlet Path prise au poste de Nijel (vers 39) ; sinon chez Raleigh à Austrivage (vers 44) | 37-46 | Bibliothèque, Armurerie, Cathédrale, Past Due ; retour au parcours par Menethil et le bateau pour Theramore |
| Donjon · Souilles de Tranchebauge | Brohann à Hurlevent (vers 41) | 39-46 | Par Baie-du-Butin et Cabestan, Belnistrasz, Amnennar |
| Donjon · Uldaman | fin des Riverglades à Hurlevent (vers 44) | 41-48 | Forgefer, Thelsamar, A Sign of Hope, les disques de platine ; le parcours reprend à Hurlevent (maître de classe) |
| Donjon · Maraudon | fin de Shen'dralas (vers 45-46), à partir du niveau 46 | 46-51 | Woodwyrd, poste de Nijel, ailes orange et violette, Theradras |
| Donjon · Zul'Farrak | premier arrêt de Gadgetzan (vers 46) | 44-50 | Quêtes de Gadgetzan, la pyramide, Velratha |
| Donjon · Zul'Farrak, second passage | retour à Gadgetzan avec le guide d'Un'Goro (vers 49) | 48-53 | Gahz'rilla, avec le Marteau de Zul'Farrak ; sans marteau dans le groupe, « La passer » ferme le chapitre |
| Donjon · Le temple englouti | Rempart-du-Néant, fin des Terres foudroyées (vers 51) | 50-56 | Tablettes atal'ai, Jammal'an, Eranikus, quêtes de Marvon |
| Donjons 55-60 · Rochenoire, Hache-Tripes, Stratholme, Scholomance | au passage du niveau 55 (Veille de Morgan faite) ; sinon à la fin de Silithus | 55-60 | Profondeurs et pic inférieur de Rochenoire, Hache-Tripes est et ouest, Stratholme, Scholomance, chacun avec sa question « La passer / La faire en groupe » ; un groupe qui s'arrête ferme l'onglet |

### Pas couvert

Donjons sans chapitre, laissés à la carte et à la fenêtre Donjons de Polestar : les Cavernes des Lamentations et le donjon d'Ombrecroc (loin du parcours de l'Alliance), les donjons propres à Forever (The Drowned City, Kroldok Stronghold, Alcaz Prison, Blackmaw Hold, Shaper's Terrace), le pic Rochenoire supérieur (dix joueurs). Dans les chapitres, quelques quêtes restent de côté (chacun le dit en tête de fichier) : la suite du collier de Talvash à Uldaman (second passage), The Prophecy of Mosh'aru (Zul'Farrak), les quêtes de classe du Temple englouti, The Love Potion et les harmonisations de raid (Rochenoire), la chaîne de Ras Frostwhisper (Scholomance).

## Premier lancement

Rien à choisir : Polestar lit la race, la classe et le niveau du personnage et ouvre son propre guide de parcours qui lui correspond. Chaque guide enchaîne tout seul sur le suivant ; les chapitres du paquet viennent par leurs cartes.

| Personnage | Guide ouvert | Quoi faire |
|---|---|---|
| Humain, Nain, Gnome, Elfe de la nuit ou Skyborne, niveau 1 | le départ de sa race chez Polestar | rien |
| Personnage déjà avancé, aucun guide ouvert avant | le guide de Polestar de son niveau, quêtes déjà rendues cochées | rien |
| Personnage qui suivait un guide de parcours du paquet (0.12 ou avant) | à la connexion, Polestar met dans cet onglet son guide de parcours du niveau du personnage et le place d'après les quêtes rendues et le journal | rien : rien n'est à refaire. Les chapitres dont le niveau convient sont proposés, un à la fois |
| Personnage qui avait un chapitre de donjon du paquet ouvert (Mortemines, Prison, Dalaran...) | le chapitre reste ouvert dans son onglet, sous sa nouvelle forme ; à sa fin, retour au guide de Polestar | rien |
| Personnage qui suivait déjà un guide de Polestar | Polestar rouvre ce guide | rien |

Changer de guide à tout moment : `/polestar guides`. Revoir une proposition de donjon : `/ga donjon`.

## Un problème ?

Noter le guide, l'étape et le niveau, et ouvrir une *issue* sur ce dépôt (ou l'envoyer au groupe). Erreur d'addon (son et icône BugSack rouge) : la copier comme dit dans « Erreurs d'addon à envoyer (BugSack) ». Souci d'installation : joindre `%LOCALAPPDATA%\GuideWoWForever\journal.txt` (bouton **Ouvrir le journal** du programme).

---

<details>
<summary>Crédits, licence et sources</summary>

- **Polestar** © 2026 The Polestar authors, GPL-3.0 : moteur et parcours (dossiers `addons/Polestar*`, release 0.4.3.1 du 26/11/2026, dont ses guides de parcours, livrés tels quels). Modifiée par BurN-30 (chaque fichier modifié le dit, liste dans `tools/build.py`) : le module Groupe Alliance est dans `Polestar/GroupeAlliance` et chargé par `Polestar.toc`, boutons réglages, aide et réduire et entrée du menu de ligne dans `UI/GuideFrame.lua`, place de ces boutons réservée dans `UI/GuideFrameTabs.lua`, `Core/Automation.lua` qui demande au module avant de prendre ou rendre une quête, `Core/Engine.lua` dont la migration des quêtes grises de Polestar 0.4.3 garde le réglage par défaut du module, `Quests/PartyChat.lua` qui n'annonce au groupe que les mots de l'objectif, `UI/WhatsNew.lua` qui affiche aussi les notes du paquet (sans le choix de disposition de Polestar dessous), `Polestar_frFR/Texts.lua` qui reçoit le français des textes que Polestar laisse en anglais (jamais à la place d'une traduction de Polestar). Les chapitres du paquet sont écrits à partir de ses données Forever et de son codex des donjons ; leur carte remplace la sienne pour les mêmes donjons, sans modifier ses fichiers.
- **Aurums Night Elf Druid Guide** © 2026 Aurum, GPL-3.0 : chapitres de donjon adaptés à toutes les classes.
- Modifications et ajouts par **BurN-30** : chapitres de donjon et rendez-vous de la Marche de l'Ouest (avec leurs points d'accroche sur le parcours de Polestar), français des chapitres et des textes de Polestar restés en anglais, module Groupe Alliance (propositions des chapitres, liens Wowhead, astuces de quête, marques de difficulté, réglages calmes, aide, notes en jeu), installateur. Jusqu'à la 0.12.2, le paquet avait aussi son propre parcours (départs, Groupes 1 à 30, d'après les guides de Polestar, et un guide solo du Loch Modan d'après Lodestar, licence MIT) : retiré en 0.13.0.
- **Auctionator** © 2020-2025 plusmouse, borjamacare, tous droits réservés : dossier `addons/Auctionator`, version 354 publiée sur [CurseForge](https://www.curseforge.com/wow/addons/auctionator), avec deux correctifs du pack (liste dans `docs/auctionator-correctifs.md`, diff dans `docs/auctionator-354.patch`), incluse pour notre groupe avec ce crédit.
- **PrettyTooltip** © 2026 FallenShard, licence MIT : dossier `addons/PrettyTooltip`, version 1.5.0 publiée sur [GitHub](https://github.com/FallenShard/PrettyTooltip/releases/tag/v1.5.0), avec correctifs du pack (liste dans `docs/prettytooltip-correctifs.md`, diff dans `docs/prettytooltip-1.5.0.patch`) ; la notice de la licence MIT est dans `addons/PrettyTooltip/LICENSE`.
- **BuffAlerts Forever** © 2026 Thork, licence MIT : dossier `addons/BuffAlertsForever`, version 3.14.1 publiée sur [CurseForge](https://www.curseforge.com/wow/addons/buffalerts), fichiers de l'auteur non modifiés hors trois lignes du `.toc`, plus `PackPatches.lua` (correctifs et réglage du pack, même licence ; liste dans `docs/buffalerts-correctifs.md`, diff dans `docs/buffalerts-3.14.1.patch`) ; la notice de la licence MIT est dans `addons/BuffAlertsForever/LICENSE`.
- **BugSack** © funkydude (Funkeh), tous droits réservés (« You are free to fork and modify on GitHub, please ask us about anything else ») : dossier `addons/BugSack`, version v12.1.9 publiée sur [GitHub](https://github.com/funkydude/BugSack/releases/tag/v12.1.9), fichiers de l'auteur non modifiés, plus `PackPatches.lua` (réglage et correctif du pack ; liste dans `docs/bugsack-correctifs.md`, diff dans `docs/bugsack-12.1.9.patch`), incluse pour notre groupe avec ce crédit.
- **BugGrabber** © funkydude (Funkeh), tous droits réservés : dossier `addons/!BugGrabber`, version v12.1.1 telle que publiée sur [CurseForge](https://www.curseforge.com/wow/addons/bug-grabber), non modifiée, incluse pour notre groupe avec ce crédit.
- **À quoi sert cet objet** (module Groupe Alliance, `Polestar/GroupeAlliance/ItemUse.lua`) : données refaites par `tools/item-uses.py` à partir des tables du client WoW Forever 1.60.1.70888 (wago.tools : `ItemSparse`, `Item`, `ItemEffect`, `ItemXItemEffect`, `SpellEffect`, `SpellMisc`, `SpellDuration`, `SpellReagents`, `SpellTotems`, `SpellLevels`, `SkillLine`, `SkillLineAbility`, `SkillRaceClassInfo`, `ChrClasses` ; liste des objets de Classic Era 1.15.9), des niveaux demandés par les maîtres de métier relevés sur les serveurs Forever ([base du monde TrinityCore Forever](https://github.com/Karrz1/TrinityCore/releases/tag/forever-tdb-2026-10-14), GPL-2.0, faits seulement) et de la base de quêtes de Polestar. Merci à [Keep or Toss: Forever](https://www.curseforge.com/wow/addons/keep-or-toss-forever) d'Aquary, dont l'idée a inspiré ce module ; il n'est pas inclus et rien n'en est repris. *Thanks to Keep or Toss: Forever by Aquary, whose idea inspired this module; it is not included and nothing is taken from it.*
- Le paquet (guides, module Groupe Alliance, correctifs, outils, installateur) a été écrit avec l'aide d'outils d'IA puis relu ; c'est aussi le cas d'une partie des addons qu'il rassemble (Polestar, d'après son dépôt). Les erreurs restent possibles, les signaler aide. *The pack was written with the help of AI tools and reviewed, as part of the addons it gathers were (Polestar, by its repository).*
- L'ensemble, hors Auctionator, BugSack et BugGrabber, est sous **GPL-3.0** (fichier `LICENSE`) ; PrettyTooltip et BuffAlerts Forever gardent leur licence MIT, compatible avec la GPL-3.0. Les données du jeu appartiennent à Blizzard Entertainment.

Jeu visé : WoW Forever (client 1.60.1). Sources consultées du 06 au 27/11/2026 :

| Source | Mise à jour | Jeu | Usage |
|---|---|---|---|
| [Polestar](https://github.com/fitzforge/polestar) 0.4.3.1 (moteur et parcours) | 26/11/2026 | Forever | parcours livré tel quel, points d'accroche des chapitres |
| [Données Forever de Polestar](https://github.com/fitzforge/polestar/releases/tag/data-v2026.11.1) | 02/11/2026 | Forever | vérification des quêtes |
| [QuestieDB Forever](https://github.com/Questie/Questie/releases) 1.0.11 | 06/11/2026 | Forever | vérification |
| [wago.tools](https://wago.tools), client 1.60.1.70532 | 06/11/2026 | Forever | cartes et zones |
| [wago.tools](https://wago.tools), `AreaTable` enUS et frFR, client 1.60.1.70532 | 08/11/2026 | Forever | noms français des lieux |
| [Wowhead Forever en français](https://fr.wowhead.com/forever) | 08/11/2026 | Forever | noms français des PNJ absents des données de Polestar |
| [Wowhead Forever](https://www.wowhead.com/forever) | 08/11/2026 | Forever | liens, vérifications, astuces des commentaires reformulées, guides de donjon (Ruines de Lordaeron, Mortemines, Prison, Site de fouilles), pages du Monastère écarlate et d'Uldaman, niveaux des marques de difficulté |
| [Aurums Night Elf Druid Guide](https://github.com/AurumTitanos/Aurums-Night-Elf-Druid-Guide) 0.4.37 | 22/10/2026 | Forever (bêta) | chapitres de donjon |
| [RestedXP, guides gratuits](https://github.com/RestedXP/RXPGuides) | 06/11/2026 | Forever | méthode et conseils reformulés, aucun texte repris (licence CC BY-NC-SA) |
| [MittenQuest](https://github.com/petllama/mittenquest-guides) (GPL-3.0) | 21/10/2026 | Forever (bêta) | recoupement |
| [wago.tools](https://wago.tools), tables d'objets, de sorts et de métiers, client 1.60.1.70888 | 12/11/2026 | Forever | données « À quoi sert cet objet » |
| [TrinityCore Forever](https://github.com/Karrz1/TrinityCore/releases/tag/forever-tdb-2026-10-14), base du monde (GPL-2.0) | 14/10/2026 | Forever | niveaux demandés par les maîtres de métier ; prérequis des quêtes de donjon recoupés (`quest_template_addon`, 0.11.0) |
| [Warcraft Tavern](https://www.warcrafttavern.com/forever/guides/dungeons/) et [Icy Veins](https://www.icy-veins.com/wow-forever/), guides de quêtes de donjon Forever | 05/10 et 11/11/2026 | Forever | lieux des PNJ, objets et machines dans les donjons, partage des quêtes (0.11.0 ; Wowhead Forever illisible ce jour-là ; 0.12.0 : Profondeurs et pic Rochenoire, Hache-Tripes, Stratholme, Scholomance, lus le 12/11/2026, écrits d'après Classic) |

Textes français : ceux de Polestar, complétés par traduction pour le paquet (chapitres, et textes des guides de Polestar qu'il laisse en anglais). Depuis la 0.6.0, les noms écrits en toutes lettres (lieux, PNJ, monstres, objets, quêtes) sont ceux du client français : tables du client 1.60.1 (wago.tools, `AreaTable` en frFR), noms français de Polestar (`Polestar_frFR`), et Wowhead en français pour les PNJ qui manquaient. Un nom absent de ces sources reste en anglais. Noms affichés par Polestar dans les lignes du guide : ceux du jeu, dans la langue de chaque joueur.
</details>

<details>
<summary>Questie, modification du paquet</summary>

**Questie** n'est pas inclus : Polestar affiche déjà les mêmes repères de quêtes à partir de sa propre base (voir `docs/etude-questie-guidelime.md`). Pour l'ajouter quand même : [releases Questie](https://github.com/Questie/Questie/releases), copier les dossiers `Questie` et `QuestieDB` dans `World of Warcraft\_forever_\Interface\AddOns`.

Chapitres : `pack/guides` (format Polestar, [aide-mémoire](https://github.com/fitzforge/polestar/blob/next/docs/GUIDE_CHEATSHEET.md)), un guide autonome par chapitre (catégorie Dungeons, sans `next`), textes français : `pack/locales/frFR`. Leurs points d'accroche sur le parcours de Polestar : `addons-src/GroupeAlliance/GreffeData.lua` (une entrée par chapitre, dans l'ordre du parcours : quête d'accroche, fourchette de niveaux, quêtes qui le disent fait, donjons du codex de Polestar qu'il couvre, guide de Polestar de l'accroche) ; le mécanisme : `addons-src/GroupeAlliance/Greffe.lua`. Français des guides de Polestar : `tools/fr-texts-polestar-manquants.json` (anglais vers français), écrit dans `addons-src/Polestar_frFR/Complement.lua` par `tools/fr-polestar.py`.

Reconstruire avec [`forge`](https://github.com/fitzforge/polestar/releases) (forge-v0.2.0, dernier binaire publié). Le clone de Polestar au tag `v0.3.4`, avec dans `data/forever` les données de la release [`data-v2026.11.1`](https://github.com/fitzforge/polestar/releases/tag/data-v2026.11.1) (dossier ignoré par git, à copier à la main), sert de contexte à la compilation des chapitres ; les dossiers `Polestar*` livrés viennent de la release Polestar 0.4.3.1 (`Polestar-0.4.3.1.zip` dézippé, dernier argument de `build.py`), qui lit le paquet ainsi compilé (Polestar 0.4 accepte les formats 1 à 11 ; la forge 0.2.0 écrit le format 5). Les contrôles en Python demandent `pip install lupa`.

```
python tools/sync-fr.py <forge.exe> <clone de polestar>
python tools/fill-fr.py tools/fr-texts-polestar.json tools/fr-texts.json tools/fr-texts-greffe-a.json tools/fr-texts-greffe-b.json
python tools/build.py <forge.exe> <clone de polestar> <Polestar-0.4.3.1 dézippé>
python tools/check-greffe.py --ui <ui> --strings <textes> --report banc.md
```

`build.py` compile les chapitres, remplace les dossiers `Polestar*` de `addons/` par la release, y pose le module, applique les modifications de fichiers de Polestar (table `POLESTAR_CHANGES` : chacune doit s'appliquer exactement une fois, sinon la construction s'arrête), vérifie que les fonctions internes de Polestar dont le module dépend sont toujours là, mot pour mot (table `POLESTAR_USES` : carte des donjons, carte d'annonce, onglets, codex, guides retirés), puis lance les contrôles rapides et s'arrête au premier qui échoue :

- `check-lua.py` : syntaxe Lua 5.1 du module et du paquet, module lancé contre de petites imitations du jeu, astuces par objectif présentes dans les guides suivis (ceux de Polestar et les chapitres), badge d'escorte, addons éteints à la première installation ;
- `check-fr-polestar.py` : le français des textes de Polestar (jetons, retours à la ligne, codes, pas de « vous », accents, tirets) ;
- `check-accroches.py` : pour chaque chapitre, sa quête d'accroche est encore rendue ou prise par le parcours Alliance de Polestar, sous son niveau maximal, dans le guide que nomme la table ; ses clés de donjon existent dans le codex de Polestar ; il échoue en disant quoi faire si une version de Polestar déplace ou retire l'accroche ;
- `check-chapitres.py` : pour chaque chapitre et chaque race, le parcours de Polestar suivi jusqu'à l'accroche (ou jusqu'au niveau minimal du chapitre), puis le chapitre : chaque quête prise a ses prérequis rendus par le parcours ou plus tôt dans le chapitre, aucune quête du chapitre n'est déjà rendue par le parcours, le journal ne dépasse pas 40 quêtes, la fin du chapitre se juge sur des rendus que le chapitre ou le parcours donne (`--detail` pour les alertes).

`check-greffe.py` (le banc, environ une minute et demie, à lancer à la main) charge tout `addons/` dans le faux jeu de `check-pack.py` avec un faux journal de quêtes, une connexion par scénario : un scénario par chapitre (accroche sur le parcours de Polestar, carte, ouverture dans un onglet, rendus, retour au parcours à son étape), les cas particuliers (rendez-vous fini par sa ligne cochée, onglet des Ruines laissé ouvert, Prison et Gnomeregan dus ensemble, seconde accroche de Dalaran, rendus facultatifs, Monastère puis Souilles, Souilles avant Uldaman, Temple avec sa quête déjà prise, donjons 55-60 au niveau 55), « jamais moins bien que Polestar seul » (niveau de la carte de Polestar pour chaque donjon sur son parcours, et le nôtre ; accroche dépassée sans être faite ; accroche encore devant ; chapitre dépassé sans avoir été proposé), la reprise de personnages de la 0.12 (historiques dans `tools/check-greffe-historique.json`, dont un chapitre ouvert), le français complété et les notes en jeu. Une erreur du banc est une piste à lire, pas la preuve d'un bug en jeu.

**À chaque nouvelle version de Polestar** :

1. Dézipper la release, cloner la version (pour `guides/locales/frFR`), relancer `build.py` avec la nouvelle release : il s'arrête si une ligne modifiée chez Polestar (`POLESTAR_CHANGES`) ou une fonction dont le module dépend (`POLESTAR_USES`) a changé. Lire alors le nouveau code de Polestar, adapter la modification ou `Greffe.lua`, puis la table.
2. `check-accroches.py` (lancé par la construction) : une accroche absente, au-dessus de la fourchette ou dans un autre guide se corrige dans `GreffeData.lua` (choisir une quête du parcours près du donjon, au bon niveau, avec `check-chapitres.py` pour vérifier que le chapitre tient encore).
3. `python tools/fr-polestar.py <clone de la nouvelle version>` : les textes que Polestar a traduits sortent du complément, les nouveaux textes sans français s'ajoutent vides à `tools/fr-texts-polestar-manquants.json` ; les traduire, relancer l'outil, puis `check-fr-polestar.py`. La construction avertit tant que le complément vient d'une autre version.
4. `check-greffe.py` : le scénario P1 redit, donjon par donjon, à quel niveau la carte de Polestar viendrait sur son nouveau parcours et à quel niveau nous proposons le chapitre ; un « plus tard que Polestar » se corrige par une accroche plus tôt ou un niveau minimal plus bas.
5. Mettre à jour les numéros de version de Polestar dans ce README et dans la notice de `build.py` (`README.txt` de Polestar).

**Publier une version** : mettre le numéro dans `pack/pack.json` (la construction le reporte dans `## Version:` de `addons/PolestarPack_GroupeAlliance/PolestarPack_GroupeAlliance.toc`), ajouter la section `## vX.Y.Z` dans `CHANGELOG.md` (`### Français` et `### English` pour le programme d'installation ; `### En jeu` et `### In game` pour la fenêtre des nouveautés en jeu, lues par `tools/notes-jeu.py`, facultatives), construire, committer `addons/`, puis pousser un tag `vX.Y.Z` : le workflow `.github/workflows/release.yml` construit `GuideWoWForever-addons.zip` (`tools/release.py`) et `GuideWoWForever.exe` (`installer-exe`, .NET Framework 4.8), calcule `SHA256SUMS.txt`, installe pour de vrai le paquet avec cet exe dans un faux dossier de jeu, avec un faux GitHub local (`tools/test-installeur.py` : première installation, relance, mise à jour d'une ancienne version, mise à jour du paquet 0.13.1 avec et sans la mémoire du programme : les dossiers que Polestar 0.4.3 a fondus dans d'autres partent dans la sauvegarde), et publie la release seulement si cette installation réussit. Il refuse un tag différent de la version du `.toc`. Sur une pull request, il construit seulement (fichiers dans l'onglet Actions). Le même test en local, après `python tools/release.py package --version X.Y.Z --out <dist>`, `python tools/release.py sums <dist>` et la construction de l'exe : `python tools/test-installeur.py <GuideWoWForever.exe> <dist>`.

`item-uses.py` refait les données de la ligne « À quoi sert cet objet » à partir des tables du client (commandes dans [`docs/a-quoi-sert-cet-objet.md`](docs/a-quoi-sert-cet-objet.md)).

`check-pack.py` charge **tout le paquet ensemble** dans un faux jeu (`tools/fakegame.lua`), dans l'ordre du jeu, client français puis anglais, puis rejoue la connexion, un combat, une infobulle d'objet et l'ouverture de la carte. Il survole aussi des objets pour la ligne « À quoi sert cet objet » (sacs, marchand, hôtel des ventes, combat, quête rendue) : elle doit sortir une seule fois, sous les lignes du jeu, sans erreur ; il donne la mémoire des données et le temps d'une infobulle. Il liste par addon les erreurs, les globals écrits par plusieurs addons, les commandes slash, les variables de console écrites, les fonctions et cadres du jeu accrochés ou réécrits, les infobulles, les événements et les bibliothèques LibStub. `--extra <dossier>` ajoute des addons candidats (jamais livrés) pour juger leur cohabitation. Il lui faut une copie de l'interface du client Forever et ses textes :

```
git clone --depth 1 --filter=blob:none --sparse -b forever https://github.com/Gethe/wow-ui-source.git <ui>
git -C <ui> sparse-checkout set --no-cone "*.lua" "*.xml" "*.toc"
curl -o <textes>/GlobalStrings_frFR.csv "https://wago.tools/db2/GlobalStrings/csv?build=1.60.1.70888&product=wowf&locale=frFR"
curl -o <textes>/GlobalStrings_enUS.csv "https://wago.tools/db2/GlobalStrings/csv?build=1.60.1.70888&product=wowf&locale=enUS"
python tools/check-pack.py --ui <ui> --strings <textes> [--extra <dossier d'addons>] [--report rapport.md]
```

Une erreur du banc est une piste à lire, pas la preuve d'un bug en jeu ; un banc propre veut seulement dire « se charge et démarre ».
</details>
