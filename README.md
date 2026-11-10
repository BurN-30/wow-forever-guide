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
- Il remplace seulement les dossiers du guide dans `World of Warcraft\_forever_\Interface\AddOns` (`Polestar`, `Polestar...`, `Auctionator` et `PrettyTooltip`) et retire ceux d'une ancienne version du guide. Les autres addons et le dossier `WTF` (réglages, progression du guide) ne sont pas touchés.
- L'ancienne version est mise de côté dans `_forever_\Interface\_guide-sauvegarde` (seulement la dernière). En cas de problème pendant le remplacement, elle est remise en place toute seule.
- Aucun droit administrateur. Ses fichiers sont dans `%LOCALAPPDATA%\GuideWoWForever` : la copie du programme visée par le raccourci, `journal.txt` (le détail de chaque lancement, à joindre en cas de problème) et `etat.txt` (dossier du jeu et version installée).
- Désinstaller : supprimer le raccourci, ce dossier, et les dossiers `Polestar...`, `Auctionator` et `PrettyTooltip` de `AddOns`.
</details>

### Manière 2 (repli) : le ZIP et `Installer.bat`

1. Bouton vert **Code** → **Download ZIP** (ou `Source code (zip)` sur la page [Releases](https://github.com/BurN-30/wow-forever-guide/releases/latest)), puis dézipper.
2. Fermer WoW, double-cliquer sur **`Installer.bat`** (il trouve le dossier du jeu et remplace les dossiers du guide). Windows bloque le fichier ? Clic droit sur `Installer.bat` → **Propriétés** → cocher **Débloquer** → **OK**.
3. Relancer WoW.

Mettre à jour : retélécharger le ZIP et relancer `Installer.bat`. Encore plus à la main : télécharger `GuideWoWForever-addons.zip` sur la page [Releases](https://github.com/BurN-30/wow-forever-guide/releases/latest) et le dézipper dans `World of Warcraft\_forever_\Interface\AddOns` en remplaçant les dossiers existants.

### Install / update in 1 click (English)

Two ways: the program (recommended, 1 click) or the ZIP with `Installer.bat` (fallback).

**Way 1 (recommended): the program**

1. Download **[GuideWoWForever.exe](https://github.com/BurN-30/wow-forever-guide/releases/latest/download/GuideWoWForever.exe)** (always the latest version).
2. Double-click it. On the first run, Windows shows "Windows protected your PC": click **More info**, then **Run anyway** (why: see "Windows warning" below).
3. The program finds WoW Forever by itself (otherwise it asks for the `World of Warcraft` folder), downloads the latest guide, checks it, installs it and tells you what it did ("First install" or "Update from 0.6.2 to 0.7.0"), in English if Windows is in English. For a first install, if WoW is running, it asks you to close it.
4. Restart WoW (a `/reload` is not enough the first time): nothing to tick, the guide opens by itself.

**Update**: double-click the **Update the WoW guide** shortcut on the desktop (created on the first run, also in the Start menu). If there is nothing new, it says so. The game can usually stay open (otherwise the program says so): at the end, a large banner says what to do. Green "**Update done. In game, type /reload in the chat**": `/reload` is enough. Orange "**Quit the game completely, then start it again**": this version adds or removes addon files, which the game only reads at startup. The program also updates itself (downloads the new one, checks its checksum, replaces itself and restarts), so an old `GuideWoWForever.exe` switches to the new one on its next run.

It only replaces the guide folders (`Polestar...`, `Auctionator` and `PrettyTooltip`) in `World of Warcraft\_forever_\Interface\AddOns`. Other addons and the `WTF` folder (settings, guide progress) are left alone. The previous version is kept in `_forever_\Interface\_guide-sauvegarde`. Log in case of trouble: `%LOCALAPPDATA%\GuideWoWForever\journal.txt`. No admin rights needed.

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

- Le guide de ton personnage s'ouvre tout seul (voir « Premier lancement »). Changer : `/polestar guides` → **Guides de la communauté** → **Groupe Alliance**.
- En haut à droite de la fenêtre du guide : la **roue dentée** ouvre les réglages de Polestar (flèche de direction, affichage, automatismes), **?** donne l'aide en bref.
- **Réduire** : bouton **_** à côté du **?**. La fenêtre devient une petite icône Polestar (à glisser où on veut ; clic droit : fine bannière avec l'étape en cours ; clic : la fenêtre revient). Masquer : `/polestar hide`, le bouton Polestar de la minicarte, ou un raccourci dans Options > Raccourcis > Polestar.
- **Survole** n'importe quelle ligne : l'infobulle explique tout, avec une astuce (en vert) sur les quêtes pénibles. Une petite **étoile verte** en bout de ligne signale qu'une astuce attend.
- **Marque orange ou rouge** en bout de ligne : passage difficile à ton niveau réel (élite, monstres en groupe, escorte, quête bien au-dessus de toi). L'infobulle dit pourquoi, le niveau conseillé seul, le nombre de joueurs conseillé et comment faire seul ou à plusieurs. Elle disparaît d'elle-même quand tu as le niveau. Orange : il manque 1 ou 2 niveaux ; rouge : 3 ou plus.
- **Escorte** (étiquette violette) en bout de ligne : quête d'escorte. L'infobulle rappelle de la prendre AVANT le départ si l'on est en groupe et de ne pas trop s'éloigner du PNJ. Masquer : roue dentée, Guide, Fenêtre, Groupe Alliance.
- **Quêtes de groupe et donjons facultatifs** : à la première étape, un bandeau « Quête de groupe » propose **La passer** ou **La faire en groupe** (en anglais : *Skip it*, *Do it with a group*). Seul : La passer, le guide reste sur la route solo. Changer d'avis : roue dentée, Découverte, Quêtes de groupe (une par une), ou tout répondre d'un coup dans le menu déroulant Quêtes de groupe. Dès les départs, quelques élites courtes posent la question (humain : Narf, Nimsy, Croaky ; nain et gnome : Vagash), une seule fois chacune. Donjons facultatifs du paquet : Ruines de Lordaeron, Mortemines, Prison, Site de fouilles, Cité de Dalaran, Monastère écarlate, Uldaman, Zul'Farrak, Temple englouti.
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

## Infobulles redessinées (PrettyTooltip)

Le guide installe aussi [PrettyTooltip](https://www.curseforge.com/wow/addons/prettytooltip) (édition Forever) : les infobulles des objets, des sorts, des personnages et PNJ, des améliorations et affaiblissements (*buffs*, *debuffs*), des herbes, minerais et coffres et des quêtes sont redessinées, plus lisibles (caractéristiques en couleur, niveau d'objet, barre de vie, ce que donne une herbe ou un minerai).

- Les lignes ajoutées par les autres addons restent, en bas de l'infobulle et à part : objectifs de quête, « amélioration » d'équipement, provenance et « Alt-clic : me guider » de Polestar, prix d'Auctionator. Les infobulles du guide lui-même (lignes du guide, flèche, boutons) gardent l'aspect du jeu.
- **Alt** maintenue : l'infobulle d'origine du jeu, le temps de l'appui. L'Alt-clic de Polestar sur un objet marche toujours.
- **Maj** maintenue : les détails (résultats de désenchantement, contenu des herbes et minerais, numéro de l'objet ou du PNJ). Maj garde aussi son rôle habituel : comparer avec l'objet équipé.
- `/ptip` : éditeur de style (polices, couleurs, tailles ; un clic sur une partie de l'exemple la règle). `/ptip options` : ce qui est redessiné, type par type (**Restyler**), et ce qui suit le curseur (**Suivre le curseur**, allumé pour les herbes, minerais et coffres).
- Revenir aux infobulles du jeu : `/ptip options` et décocher les types voulus, ou décocher PrettyTooltip dans la liste des addons (écran des personnages, bouton **AddOns**).
- Réglages : ceux de PrettyTooltip, le guide n'en impose aucun (rien à changer pour Polestar ni Auctionator). Un PrettyTooltip déjà installé est remplacé par la version du guide ; ses réglages (dossier `WTF`) sont gardés.
- Version 1.3.8 avec correctifs du pack, pour les clients français et anglais : bonus d'ensemble actif gardé dans la liste, numéro de sort qui ne remplace plus la description d'une amélioration, deux libellés français. Détail, tickets amont et diff : [`docs/prettytooltip-correctifs.md`](docs/prettytooltip-correctifs.md).

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

## Le parcours

Chacun fait son départ seul, puis tout le monde se retrouve à Hurlevent. **Chacun joue à son rythme** : le guide relit le journal de quêtes à chaque connexion, coche tout seul ce qui est déjà rendu ou en cours, et reprend au bon endroit. Un joueur en avance n'est pas renvoyé vers les quêtes devenues grises (réglage « Passer les quêtes grises », activé par défaut). En groupe, avec Polestar chez tout le monde, le panneau de groupe s'ouvre seul et montre où en est chacun ; l'XP de groupe est meilleure à 4 niveaux d'écart ou moins.

| Guide (`/polestar guides`, Guides de la communauté, Groupe Alliance) | Niveaux | Pour qui |
|---|---|---|
| Départ · Humain : Forêt d'Elwynn | 1-11 | Humains (quêtes de démoniste et de mage incluses) |
| Départ · Nain : Dun Morogh | 1-11 | Nains (quêtes de classe incluses) |
| Départ · Gnome : Dun Morogh | 1-11 | Gnomes (quêtes de classe incluses), même vallée de départ que les Nains |
| Départ · Elfe de la nuit : Teldrassil | 1-11 | Elfes de la nuit (quêtes de druide incluses), finit au bateau pour Hurlevent |
| Groupe 1 · Rendez-vous à Hurlevent | 10-12 | Tout le monde |
| Groupe 2 · Marche de l'Ouest | 11-14 | Tout le monde : quêtes de Colline-des-Sentinelles (environ 70 étapes) |
| Groupe 3 · La salle des Thanes (donjon) | 13-17 | Quêtes à prendre à Forgefer et Dun Morogh avant d'entrer |
| Groupe 4 · Sombrivage | 15-19 | Tout le monde, Elfes de la nuit compris. En fin de guide, facultatif à plusieurs : Baron Marinous (élite 21, invoqué avec 20 fragments des nagas) et Gyromast's Revenge (robot élite 20) ; Volcor : sortie discrète seul, en force à plusieurs |
| Groupe 5 · Ruines de Lordaeron (donjon) | 17-21 | Donjon facultatif (question à la première étape) : quêtes à prendre, puis le donjon boss par boss, avec les cinq places possibles de l'écusson |
| Groupe 6 · Les Carmines | 20-23 | Tout le monde : quêtes de Lakeshire, plus Blackrock Blockade (seul) et, facultatif à 3-5 : Tharil'zun, Shadow Magic, Gath'Ilzogg, Incinerator Gar'im |
| Groupe 6b · Les Mortemines (donjon) | 20-23 | Donjon facultatif (question à Lakeshire) : la suite de la Confrérie défias (Lakeshire, Colline des Sentinelles, Hurlevent, escorte du traître), les quêtes de Hurlevent, puis le donjon boss par boss. Sauté seul, au-delà du niveau 24 ou sans la Confrérie défias rendue à Wiley |
| Groupe 7 · Bois de la Pénombre | 22-24 | Tout le monde : quêtes de Sombre-Comté, plus la suite de Jitters (facultative, en passant) |
| Groupe 7b · La Prison (donjon) | 24-28 | Donjon facultatif (question aux Carmines ou à Sombre-Comté) : quêtes de Hurlevent, de Lakeshire et de Sombre-Comté, le donjon aile par aile. The Stockade Riots seulement après les Mortemines |
| Groupe 8 · Orneval, Les Paluns et Les Serres-Rocheuses | 24-27 | Tout le monde : le plus long guide (environ 130 étapes), trois zones |
| Groupe 9 · Mille pointes, Bois de la Pénombre et Les Paluns | 27-30 | The Missing Diplomat (quête 1274) (Hurlevent, puis Bois de la Pénombre) seulement à partir du niveau 28 |
| Groupe 10 · Site de fouilles : Les Paluns (donjon) | 28-32 | Donjon facultatif, déplacé après les Mille pointes (quêtes de niveau 31, dernier boss 31) : à 5 vers 28-31, environ 39 000 XP de quêtes |
| Groupe 11 · Cité de Dalaran (donjon) | 30-33 | Donjon facultatif (question à Hurlevent, chez Shylamiir) ; passé, le guide renvoie à Menethil. Niveau 30 requis pour la quête qui ouvre la route. Avant le départ, à Hurlevent : la fin de l'histoire des Défias (Lescovar, anneau Sceau de Wrynn), seulement pour qui a fini la chaîne de la Prison |
| Groupe 12 · Les Paluns et les Contreforts de Hautebrande | 31-32 | Tout le monde ; facultatif à plusieurs : Defeat Nek'rosh (élite 32) |
| Groupe 13 · Désolace | 32-33 | Tout le monde |
| Groupe 14 · Orneval et Les Paluns | 33-34 | Tout le monde |
| Groupe 15 · Vallée de Strangleronce | 34-37 | Tout le monde : chasses de Nesingwary, Rebel Camp, Baie-du-Butin ; élites de Nesingwary à plusieurs |
| Groupe 16 · Hautes-terres d'Arathi, Montagnes d'Alterac et Marais des Chagrins | 37-39 | Tout le monde ; facultatif à plusieurs : The Perenolde Tiara |
| Groupe 17 · Terres ingrates et Désolace | 39-40 | Tout le monde. La chaîne de Martek (Indurium) seulement si Fizzle l'a proposée aux Mille pointes |
| Groupe 18 · Vallée de Strangleronce, Marécage d'Âprefange et Marais des Chagrins | 40-43 | Tout le monde ; monture à 40 (chaque race chez son maître de monte). À Forgefer, deux questions : Monastère écarlate et Uldaman |
| Groupe 19 · Terres ingrates et Les Hinterlands | 43-45 | Tout le monde. Uldaman facultatif (question à Forgefer) : après les quêtes des Terres ingrates, le donjon, puis les rendus à Forgefer sur le vol vers Austrivage. Monastère écarlate facultatif (question à Forgefer) : depuis Austrivage, Bibliothèque, Armurerie et Cathédrale, avec la quête Forever Past Due |
| Groupe 20 · Féralas | 43-45 | Tout le monde |
| Groupe 21 · Tanaris | 45-47 | Tout le monde. Zul'Farrak facultatif (question à Gadgetzan) : Scarab Shells, Troll Temper et Divino-matic Rod, puis retour à Gadgetzan |
| Groupe 22 · Les Hinterlands, Terres foudroyées et Loch Modan | 47-48 | Tout le monde ; élites des Hinterlands à plusieurs. À Hurlevent, chez Brohann : question du Temple englouti |
| Groupe 23 · Gorge des Vents brûlants | 48-49 | Tout le monde ; quêtes élites à plusieurs |
| Groupe 24 · Cratère d'Un'Goro | 49-50 | Tout le monde |
| Groupe 25 · Steppes ardentes et Azshara | 50-53 | Tout le monde ; facultatif à plusieurs : A Taste of Flame (Cyrus Therepentous), The Horn of the Beast (Loch Modan et Forgefer), The Super Snapper FX (élites des Hinterlands). Temple englouti facultatif (question à Hurlevent dans le Groupe 22) : depuis les Terres foudroyées, tablettes atal'ai et Ombre d'Eranikus, Brohann rendu à l'arrêt de Forgefer par le tram |
| Groupe 26 · Gangrebois | 53 | Tout le monde |
| Groupe 27 · Berceau-de-l'Hiver et Maleterres de l'Est | 53-56 | Tout le monde |
| Groupe 28 · Maleterres de l'Ouest, Maleterres de l'Est et Féralas | 56-58 | Tout le monde : le plus long guide 50-60 (environ 120 étapes) |
| Groupe 29 · Maleterres de l'Est | 58 | Tout le monde (départ par Cabestan vers Silithus) |
| Groupe 30 · Silithus, Gangrebois, Berceau-de-l'Hiver et Maleterres | 58-60 | Tout le monde, jusqu'au niveau 60 |
| Solo · Loch Modan (facultatif) | 14-16 | Joueur en retard sur le groupe, seul : environ 1 à 2 niveaux, retour à Forgefer en griffon. Ne s'ouvre jamais tout seul |

En retard sur le groupe ? `/polestar guides` → Guides de la communauté → Groupe Alliance → **Solo · Loch Modan** (quêtes de Thelsamar, de la tour de garde du sud et du pavillon de chasse ; quelques positions marquées **?**). De retour à 4 niveaux du groupe : reprendre le guide du groupe.

### Pas encore couvert

Le parcours ne prend pas toutes les quêtes. Zones et quêtes Alliance absentes du paquet (à suivre avec Questie ou Wowhead si besoin d'XP en plus) :

| Zone | Niveaux | Ce qui manque |
|---|---|---|
| Les Carmines | 15-24 | 18 quêtes de plus que le Groupe 6 (environ 15 000 XP) |
| Orneval | 20-28 | 18 quêtes (environ 30 000 XP) |
| Les Paluns | 27-31 | 13 quêtes (environ 30 000 XP) |
| Les Serres-Rocheuses | 21-27 | 9 quêtes |
| Les Tarides (Cabestan) | 14-21 | quêtes neutres, plus une quête Alliance propre à Forever |
| Désolace | 32-42 | une vingtaine de quêtes (chaîne des Khans kolkar, caravane de Gizelton) |
| Hautes-terres d'Arathi | 35-42 | Stromgarde (élites : Stromgarde Badges, avis de recherche, chaîne de Trelane) |
| Bois de la Pénombre | 30-35 | Morbent Fel (fin de la chaîne de Sven), Mor'Ladim (élite), fin de Stalvan |
| Gnomeregan, Kraal de Tranchebauge | 25-34 | donjons non couverts : Gnomeregan (beaucoup de quêtes à Forgefer) arrive en même temps que le Site de fouilles et Dalaran, le Kraal est loin au sud des Tarides en terre horde |
| Donjons 50-60 | 48-60 | aucun chapitre (le Temple englouti en a un, Groupe 25) : Profondeurs de Blackrock, Sommet et Bas du pic Rochenoire, Maraudon, Hache-Tripes, Stratholme, Scholomance (prévus pour une prochaine version) |

## Premier lancement

Rien à choisir : Polestar lit la race, la classe et le niveau du personnage et ouvre le guide du paquet qui lui correspond (les quêtes de classe sont dans les guides). Chaque guide enchaîne tout seul sur le suivant.

| Personnage | Guide ouvert | Quoi faire |
|---|---|---|
| Humain, Nain, Gnome ou Elfe de la nuit, niveau 1 | son Départ | rien |
| Personnage déjà avancé, aucun guide Polestar ouvert avant (ex. Humain niveau 8) | le guide de son niveau, quêtes déjà rendues cochées (Humain 8 : Départ · Humain) | rien |
| Elfe de la nuit niveau 10 à 12 (ex. druide 11 à Darnassus) | Départ · Elfe de la nuit ou Rendez-vous à Hurlevent, le plus proche | quêtes de Teldrassil pas finies : `/polestar guides` → Départ · Elfe de la nuit |
| Personnage qui suivait déjà un guide de Polestar | Polestar rouvre ce guide | `/polestar guides` → Guides de la communauté → Groupe Alliance → le guide de son niveau |
| Skyborne (hors du paquet) | le départ de Polestar, qui part ensuite vers la Marche de l'Ouest de Polestar | à la fin du départ : `/polestar guides` → Groupe 1 · Rendez-vous à Hurlevent |

Changer de guide à tout moment : `/polestar guides`.

## Un problème ?

Note le guide, l'étape et ton niveau, et ouvre une *issue* sur ce dépôt (ou envoie-le au groupe). Souci d'installation : joindre `%LOCALAPPDATA%\GuideWoWForever\journal.txt` (bouton **Ouvrir le journal** du programme).

---

<details>
<summary>Crédits, licence et sources</summary>

- **Polestar** © 2026 The Polestar authors, GPL-3.0 : moteur (dossiers `addons/Polestar*`, release 0.3.4 du 06/11/2026 ; modifiée par BurN-30 : le module Groupe Alliance est dans `Polestar/GroupeAlliance` et chargé par `Polestar.toc`, boutons réglages, aide et réduire et entrée du menu de ligne dans `UI/GuideFrame.lua`, `Core/Automation.lua` qui demande au module avant de prendre ou rendre une quête, voir `tools/build.py`) et guides repris dans `pack/guides` (révision `08536e3` du 06/11/2026, plus les corrections de ces guides jusqu'au tag `v0.3.4` ; chaque fichier repris le dit en tête).
- **Aurums Night Elf Druid Guide** © 2026 Aurum, GPL-3.0 : chapitres de donjon adaptés à toutes les classes.
- **Lodestar Guides for Polestar** (conversion de [Lodestar](https://github.com/danielcosta42/lodestar)), licence MIT : guide Loch Modan adapté dans `pack/guides/13-solo-loch-modan.guide` (révision `cc3bf4f` du 21/10/2026 ; trajet réordonné, quêtes vérifiées sur les données Forever, quêtes hors de la zone retirées). Notice exigée par la licence MIT, reprise aussi dans `LICENSE` et en tête du fichier :

  ```
  Polestar adaptation: Copyright (c) 2026 Petllama
  Copyright (c) 2026 Daniel Costa (danielcosta42)

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
  ```
- Modifications et ajouts par **BurN-30** : enchaînement des guides, rendez-vous de Hurlevent, notes de groupe, textes français ajoutés, module Groupe Alliance (liens Wowhead, astuces de quête, marques de difficulté, réglages calmes, aide), chapitres Mortemines, Prison, Monastère écarlate et Uldaman, guides Polestar 30-60 repris avec notes de groupe, chapitre Zul'Farrak, installateur.
- **Auctionator** © 2020-2025 plusmouse, borjamacare, tous droits réservés : dossier `addons/Auctionator`, version 343 telle que publiée sur [CurseForge](https://www.curseforge.com/wow/addons/auctionator), non modifiée, incluse pour notre groupe avec ce crédit.
- **PrettyTooltip** © 2026 FallenShard, licence MIT : dossier `addons/PrettyTooltip`, version 1.3.8 (édition Forever) publiée sur [GitHub](https://github.com/FallenShard/PrettyTooltip/releases/tag/v1.3.8), avec correctifs du pack (liste dans `docs/prettytooltip-correctifs.md`, diff dans `docs/prettytooltip-1.3.8.patch`) ; la notice de la licence MIT est dans `addons/PrettyTooltip/LICENSE`.
- L'ensemble, hors Auctionator, est sous **GPL-3.0** (fichier `LICENSE`) ; PrettyTooltip garde sa licence MIT, compatible avec la GPL-3.0. Les données du jeu appartiennent à Blizzard Entertainment.

Jeu visé : WoW Forever (client 1.60.1). Sources consultées les 06 et 08/11/2026 :

| Source | Mise à jour | Jeu | Usage |
|---|---|---|---|
| [Polestar](https://github.com/fitzforge/polestar) 0.3.4 et guides | 06/11/2026 | Forever | base reprise |
| [Données Forever de Polestar](https://github.com/fitzforge/polestar/releases/tag/data-v2026.11.1) | 02/11/2026 | Forever | vérification des quêtes |
| [QuestieDB Forever](https://github.com/Questie/Questie/releases) 1.0.11 | 06/11/2026 | Forever | vérification |
| [wago.tools](https://wago.tools), client 1.60.1.70532 | 06/11/2026 | Forever | cartes et zones |
| [wago.tools](https://wago.tools), `AreaTable` enUS et frFR, client 1.60.1.70532 | 08/11/2026 | Forever | noms français des lieux |
| [Wowhead Forever en français](https://fr.wowhead.com/forever) | 08/11/2026 | Forever | noms français des PNJ absents des données de Polestar |
| [Wowhead Forever](https://www.wowhead.com/forever) | 08/11/2026 | Forever | liens, vérifications, astuces des commentaires reformulées, guides de donjon (Ruines de Lordaeron, Mortemines, Prison, Site de fouilles), pages du Monastère écarlate et d'Uldaman, niveaux des marques de difficulté |
| [Aurums Night Elf Druid Guide](https://github.com/AurumTitanos/Aurums-Night-Elf-Druid-Guide) 0.4.37 | 22/10/2026 | Forever (bêta) | chapitres de donjon |
| [RestedXP, guides gratuits](https://github.com/RestedXP/RXPGuides) | 06/11/2026 | Forever | méthode et conseils reformulés, aucun texte repris (licence CC BY-NC-SA) |
| [Lodestar](https://github.com/petllama/lodestar-guides) (MIT) | 21/10/2026 | Forever (bêta) | guide Solo · Loch Modan adapté, recoupement |
| [MittenQuest](https://github.com/petllama/mittenquest-guides) (GPL-3.0) | 21/10/2026 | Forever (bêta) | recoupement |

Textes français : ceux de Polestar, complétés par traduction pour le paquet. Depuis la 0.6.0, les noms écrits en toutes lettres (lieux, PNJ, monstres, objets, quêtes) sont ceux du client français : tables du client 1.60.1 (wago.tools, `AreaTable` en frFR), noms français de Polestar (`Polestar_frFR`), et Wowhead en français pour les PNJ qui manquaient. Un nom absent de ces sources reste en anglais. Noms affichés par Polestar dans les lignes du guide : ceux du jeu, dans la langue de chaque joueur.
</details>

<details>
<summary>Questie, modification du paquet</summary>

**Questie** n'est pas inclus : Polestar affiche déjà les mêmes repères de quêtes à partir de sa propre base (voir `docs/etude-questie-guidelime.md`). Pour l'ajouter quand même : [releases Questie](https://github.com/Questie/Questie/releases), copier les dossiers `Questie` et `QuestieDB` dans `World of Warcraft\_forever_\Interface\AddOns`.

Guides : `pack/guides` (format Polestar, [aide-mémoire](https://github.com/fitzforge/polestar/blob/next/docs/GUIDE_CHEATSHEET.md)), textes français : `pack/locales/frFR`. Reconstruire avec [`forge`](https://github.com/fitzforge/polestar/releases) (forge-v0.2.0). Le clone de Polestar est au tag `v0.3.4`, avec dans `data/forever` les données de la release [`data-v2026.11.1`](https://github.com/fitzforge/polestar/releases/tag/data-v2026.11.1) (dossier ignoré par git, à copier à la main) :

```
python tools/sync-fr.py <forge.exe> <clone de polestar>
python tools/fill-fr.py tools/fr-texts-polestar.json tools/fr-texts.json
python tools/build.py <forge.exe> <clone de polestar> <Polestar-0.3.4 dézippé>
python tools/check-lua.py
```

**Publier une version** : mettre le numéro dans `## Version:` de `addons/PolestarPack_GroupeAlliance/PolestarPack_GroupeAlliance.toc`, ajouter la section `## vX.Y.Z` (Français et English) dans `CHANGELOG.md`, committer, puis pousser un tag `vX.Y.Z` : le workflow `.github/workflows/release.yml` construit `GuideWoWForever-addons.zip` (`tools/release.py`) et `GuideWoWForever.exe` (`installer-exe`, .NET Framework 4.8), calcule `SHA256SUMS.txt` et publie la release. Il refuse un tag différent de la version du `.toc`. Sur une pull request, il construit seulement (fichiers dans l'onglet Actions).

`check-lua.py` (Python et `pip install lupa`) vérifie la syntaxe Lua 5.1 du module et du paquet, et fait tourner le module Groupe Alliance contre de petites imitations du jeu : il attrape les fautes de frappe, pas les bugs visibles en jeu.
</details>
