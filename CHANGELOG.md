# Journal des versions / Changelog

Chaque section `## vX.Y.Z` devient les notes de la release GitHub du même tag (voir `tools/release.py`). Le programme d'installation affiche la partie `### Français` ou `### English` selon la langue de Windows : garder ces deux titres et des puces courtes.

## v0.11.0 (en préparation)

### Français
- Trois donjons facultatifs de plus, chacun avec sa question « La passer / La faire en groupe » : les Profondeurs de Brassenoire (Groupe 8, Orneval, 22-28), le Kraal de Tranchebauge (Groupe 9, sur la route des Mille pointes, 25-33) et Gnomeregan (nouveau Groupe 10b, entre le Site de fouilles et Dalaran, 25-34). Avec Maraudon et les compléments de Zul'Farrak et du Temple englouti (plus bas), le guide passe de 54 à 92 quêtes de donjon (plus 3 de la suite de A Sign of Hope).
- Les quêtes se prennent quand le groupe passe près du donneur : Knowledge in the Deeps à Forgefer dès le Groupe 3, The Corruption Abroad à Hurlevent et Researching the Corruption à Auberdine au début du Groupe 8, Gyrodrillmatic Excavationators chez Shoni au début du Groupe 9, le reste de Gnomeregan à Brikabrok et Kharanos. Le détour par Darnassus (Aube d'argent) a sa propre question et le dit.
- Avant chaque donjon, une étape « avant d'entrer » liste les quêtes à avoir dans le journal et où les reprendre. Dedans, ce qui se ramasse tout du long reste affiché (étape « en chemin »), puis les boss dans l'ordre ; Thaelrid est à voir avant Kelris (sa tête ne tombe que pour qui a la quête).
- Rendus sans aller-retour : Auberdine et Darnassus à la fin d'Orneval, Forgefer sur le passage du Groupe 8, Mortality Wanes à Darnassus au Groupe 14, A Fine Mess (Gnomeregan) à Baie-du-Butin au Groupe 15.
- Lieux dans les donjons vérifiés sur deux guides Forever (Warcraft Tavern et Icy Veins) : Thaelrid et le manuscrit près du bassin de Ghamoo-ra, Techbot et la première machine à cartes devant le portail de Gnomeregan, les trois autres machines salle par salle, Heralath et Willix près de Charlga dans le Kraal (quêtes prises à la fin, escorte vers l'entrée).
- Gnomeregan : The Only Cure is More Green Glow ajoutée, avec sa propre question (aller-retour à Kharanos avant le donjon, retombées valables deux heures).
- Uldaman : la suite de A Sign of Hope (Ryedol, Hammertoe Grez et l'amulette devant le donjon, Karnik et Belgrum à Forgefer) et la récompense des disques de platine.
- Nouveau donjon facultatif : les Souilles de Tranchebauge, au début du Groupe 20 sur la route des Tarides (question à Hurlevent au Groupe 18, rendu au Groupe 22).
- Nouveau donjon facultatif : Maraudon, à la fin du Groupe 20 (question au quai de la côte Oubliée, niveau 45) : bateau et vol vers le poste de Nijel (Talendria, Keeper Marandis), Willow à la hutte de Kormek, Cavindra et la fiole devant le donjon, côté orange, côté violet, Celebras, Theradras, rendus au retour, puis vol vers Thalanaar. Shadowshard Fragments se prend chez Tervosh à Theramore (Groupe 18) et s'y rend au Groupe 21 ; Seed of Life se rend à Remulos, à Reflet-de-Lune, au Groupe 28.
- Zul'Farrak : Tiara of the Deep, prise chez Tabetha à quelques pas de Balos Jacken (Groupe 18, sa propre question), rendue en passant par Theramore. Second passage facultatif au Groupe 24, depuis Gadgetzan (question à la piste des Mirages au Groupe 21) : Gahz'rilla, avec le marteau de Zul'Farrak fait au début du Groupe 22 (maillet sacré de Qiaga, autel de Jintha'Alor), et Nekrum's Medallion (Thadius, Groupe 22), suivi de The Divination et Return to the Hinterlands au Groupe 25. The Prophecy of Mosh'aru reste hors parcours (il faudrait Féralas entre deux passages à Tanaris).
- Temple englouti : Jammal'an the Prophet, prise chez l'exilé atal'ai à Shadra'Alor (Groupe 22, sa propre question), rendue en repassant dans les Hinterlands au Groupe 25 ; pour les prêtres, Blood of Morphaz chez Ogtinc, rendue à Greta Mosshoof au Groupe 26. Les suites de Marvon et de Gregan, offertes après le donjon, sont signalées.
- Une quête de donjon prise mais pas finie est abandonnée sur le guide juste après le donjon (le parcours n'y revient pas), au lieu de rester dans le journal.
- Journal de quêtes : les neuf dons d'étoffe se prennent au Groupe 30, là où ils se rendent, au lieu du Groupe 29 ; le journal monte au plus à 37 sur 40 (39 avant).
- Of Lost Honor (Maleterres, Groupe 30) n'est plus demandée à qui n'a pas fait Of Forgotten Memories, la quête élite qui l'ouvre.
- Relecture des donjons 16 à 47 sur deux guides Forever (Warcraft Tavern, Icy Veins) et les données du jeu : niveaux de chaque donjon alignés sur le codex de Polestar, avec la tranche de la recherche de groupe ; Thaelrid juste après Ghamoo-ra (Brassenoire) ; commission de frère Sarno (Gnomeregan) prise à Hurlevent au Groupe 9 ; Dalaran et la Bibliothèque du Monastère écarlate précisés.
- Quêtes de classe des donjons signalées à la classe qui les porte, sans retenir le parcours : paladin (Mortemines, Brassenoire), démoniste (Brassenoire), guerrier et chaman (Kraal), mage (Uldaman).
- Nouveau contrôle `tools/check-donjons.py` : il suit le vrai parcours de chaque race, en groupe et seul, et échoue sur une quête de donjon ou de groupe prise avant d'être disponible, un objectif demandé sans la quête, ou un journal de plus de 40 quêtes.

### English
- Three more optional dungeons, each with its "Skip it / Do it with a group" question: Blackfathom Deeps (Group 8, Ashenvale, 22-28), Razorfen Kraul (Group 9, on the road to Thousand Needles, 25-33) and Gnomeregan (new Group 10b, between the Excavation Site and Dalaran, 25-34). With Maraudon and the Zul'Farrak and Sunken Temple additions (below), the guide goes from 54 to 92 dungeon quests (plus 3 from the rest of A Sign of Hope).
- Quests are taken as the group passes their giver: Knowledge in the Deeps in Ironforge from Group 3, The Corruption Abroad in Stormwind and Researching the Corruption in Auberdine at the start of Group 8, Gyrodrillmatic Excavationators at Shoni's at the start of Group 9, the rest of Gnomeregan in Tinker Town and Kharanos. The Darnassus detour (Argent Dawn) has its own question and says so.
- Before each dungeon, a "before going in" step lists the quests to have in the log and where to get them back. Inside, what drops all along stays listed ("along the way" step), then the bosses in order; Thaelrid comes before Kelris (his head drops only for players on the quest).
- Hand-ins without back-and-forth: Auberdine and Darnassus at the end of Ashenvale, Ironforge on Group 8's way, Mortality Wanes in Darnassus in Group 14, A Fine Mess (Gnomeregan) in Booty Bay in Group 15.
- Places inside the dungeons checked against two Forever guides (Warcraft Tavern and Icy Veins): Thaelrid and the manuscript by Ghamoo-ra's pool, Techbot and the first punch card machine outside Gnomeregan's portal, the other three machines room by room, Heralath and Willix near Charlga in the Kraul (quests taken at the end, escort back to the entrance).
- Gnomeregan: The Only Cure is More Green Glow added, with its own question (back to Kharanos before the run, the fallout lasts two hours).
- Uldaman: the rest of A Sign of Hope (Ryedol, Hammertoe Grez and the amulet outside the dungeon, Karnik and Belgrum in Ironforge) and the Platinum Discs reward.
- New optional dungeon: Razorfen Downs, at the start of Group 20 on the road through the Barrens (asked in Stormwind in Group 18, handed in in Group 22).
- New optional dungeon: Maraudon, at the end of Group 20 (asked at the Forgotten Coast dock, level 45): boat and flight to Nijel's Point (Talendria, Keeper Marandis), Willow at Kormek's Hut, Cavindra and the vial outside the dungeon, the orange side, the purple side, Celebras, Theradras, hand-ins on the way back, then the flight to Thalanaar. Shadowshard Fragments is taken from Tervosh in Theramore (Group 18) and handed in there in Group 21; Seed of Life goes to Remulos in Moonglade in Group 28.
- Zul'Farrak: Tiara of the Deep, from Tabetha a short walk from Balos Jacken (Group 18, its own question), handed in on the way through Theramore. Optional second run in Group 24, from Gadgetzan (asked at the Mirage Raceway in Group 21): Gahz'rilla, with the Mallet of Zul'Farrak made at the start of Group 22 (Qiaga's Sacred Mallet, Jintha'Alor altar), and Nekrum's Medallion (Thadius, Group 22), followed by The Divination and Return to the Hinterlands in Group 25. The Prophecy of Mosh'aru stays off the route (it needs Feralas between two visits to Tanaris).
- Sunken Temple: Jammal'an the Prophet, from the Atal'ai Exile at Shadra'Alor (Group 22, its own question), handed in on the way back through the Hinterlands in Group 25; for priests, Blood of Morphaz from Ogtinc, handed in to Greta Mosshoof in Group 26. Marvon's and Gregan's follow-ups, offered after the dungeon, are pointed out.
- A dungeon quest taken but not finished is abandoned by the guide right after the dungeon (the route does not come back), instead of staying in the quest log.
- Quest log: the nine cloth donations are taken in Group 30, where they are handed in, instead of Group 29; the log now peaks at 37 of 40 (39 before).
- Of Lost Honor (Plaguelands, Group 30) is no longer asked of players who skipped Of Forgotten Memories, the elite quest that opens it.
- Dungeons 16 to 47 reviewed against two Forever guides (Warcraft Tavern, Icy Veins) and the game data: each dungeon's levels now follow Polestar's codex, with the group finder's range; Thaelrid right after Ghamoo-ra (Blackfathom Deeps); Brother Sarno's errand (Gnomeregan) taken in Stormwind in Group 9; Dalaran and the Scarlet Library spelled out.
- Dungeon class quests pointed out to the class that holds them, without holding the route: Paladin (Deadmines, Blackfathom Deeps), Warlock (Blackfathom Deeps), Warrior and Shaman (Razorfen Kraul), Mage (Uldaman).
- New check `tools/check-donjons.py`: it follows each race's real route, in a group and alone, and fails on a dungeon or group quest taken before it is available, an objective asked without the quest, or a quest log over 40.

## v0.10.0 (2026-11-12)

### Français
- BuffAlerts Forever est éteint à la première installation : rien ne s'affiche tant qu'il n'est pas coché. L'allumer : écran des personnages, bouton AddOns, cocher BuffAlerts Forever. Qui l'avait déjà le garde tel qu'il était (coché ou non).
- Nouveau : **À quoi sert cet objet**. Sous l'infobulle d'un objet, une ligne bleue dit à quoi il sert encore, seulement quand c'est sûr : quête que le personnage peut encore faire (ou déjà rendue, pour un objet de quête), nourriture ou boisson adaptée au niveau ou dépassée, boisson inutile à un guerrier ou un voleur, composant de sort de classe, composant de métier et dès quel niveau de métier quand il est connu, outil, objet gris seulement à vendre avec son prix. Rien pour l'équipement (Polestar le compare déjà). Données tirées des tables du jeu. Couper : `/ga objets`, ou Échap › Options › AddOns › Groupe Alliance.
- Lisez-moi : nouvelle partie « Autres addons, non inclus » : OpenMap (carte du monde d'un seul tenant, trop lourd pour le paquet, mais Polestar affiche ses repères dessus), Keep or Toss et Node Sight (licence qui interdit de les redistribuer), avec ce qu'il faut savoir pour les installer à part.

### English
- BuffAlerts Forever is off on a first install: nothing shows until it is ticked. Turn it on: character screen, AddOns button, tick BuffAlerts Forever. Whoever already had it keeps it as it was (ticked or not).
- New: **What is this item for**. A blue line under an item's tooltip says what it is still for, only when certain: a quest the character can still do (or already did, for a quest item), food or drink right for the level or outgrown, a drink a warrior or rogue has no use for, a class spell reagent, a profession reagent and from which skill rank when known, a tool, a grey item only worth selling with its price. Nothing for gear (Polestar already compares it). Data from the game's own tables. Off: `/ga items`, or Esc › Options › AddOns › Groupe Alliance.
- Readme: new "Other addons, not included" part: OpenMap (seamless world map, too heavy for the pack, but Polestar draws its markers on it), Keep or Toss and Node Sight (licences that forbid redistribution), with what to know to install them separately.

## v0.9.9 (2026-11-11)

### Français
- Orneval (Groupe 8) : c'est une zone contestée. Deux notes à l'arrivée : les postes de la Horde (Zoram'gar sur la côte ouest, Bois-brisé à l'est) et les endroits où les quêtes de la Horde du même niveau croisent celles du guide (nagas de la grève de Zoram, camp Crin-de-Chardon, Vile-sylve, lac Mystral). Endroit occupé : passer l'étape (bouton Passer) et y revenir plus tard. Les Paluns, plus loin dans le guide, n'ont aucune quête de la Horde.
- Même rappel à l'entrée des Serres-Rocheuses (Retraite de Roche-Soleil, Horde) et au début du Groupe 14 (camps de l'est autour du poste de Bois-brisé).
- Diminution de la menace (Dal Griffesang) : astuce tirée d'une observation en jeu, pas encore vérifiée. Il lui arrive de quitter son camp et de se retrouver seul : attendre à couvert et l'attaquer à ce moment, sans tuer ses gardes un par un.
- Les bracelets d'élémentaire (lac Mystral, Groupe 8) : l'étape explique pourquoi l'infobulle des élémentaires ne compte rien (le jeu ne compte que le Parchemin divin, pas les bracelets) et que c'est la ligne des bracelets du guide qui les compte. Elle nomme les Élémentaires d'eau souillés, dit que tous n'en donnent pas (environ 1 sur 5 d'après les données) et que seuls les Bracelets élémentaires intacts comptent. Nouvelle ligne « Utiliser Parchemin de divination » : clic droit dans les sacs avec 5 bracelets, puis rendre la quête. Le bouton d'objet de quête propose le parchemin.
- Même explication pour deux étapes du même genre : Les maraudeurs du Darrowshire (Crânes fétides changés par le Cristal mystique en Crânes résonants, Maleterres de l'Est) et Deux moitiés deviennent Une (demi-charme des goules, Maleterres de l'Ouest).
- Port-Menethil (Groupe 8) : Karl Boran ne propose « Rapporter la statuette » (la quête propre à Forever, pour le capitaine Stoutfist) qu'après le rendu de la première « Rapporter la statuette », à la fin de la chaîne des cabanes murlocs. Le guide la demandait dès l'arrivée et restait bloqué. Elle est maintenant prise après ce rendu, puis rendue à Stoutfist ; sa suite (Proche de la famille chez Stoutfist puis Bolvar, Le lieutenant déshonoré) garde sa place.
- Relecture des Groupes 8, 9 et 12 avec Wowhead Forever (160 fiches de quêtes) et MetaForge. Quêtes demandées avant celles qui les débloquent, remises à leur place : chez Prospector Whelgar, Understanding Our Present, Gleaning Our Future et For Further Study suivent Uncovering the Past (prises au Groupe 9 puis 12, au lieu de toutes ensemble au Groupe 8) ; Carnage est proposée après Blisters on the Land ; Crimson Crate Delivery suit Crocs of the Sky (facultative en attendant mieux).
- Le dormeur s'est éveillé (Kerlonian) : sur Forever, l'escorte s'arrête à son sac, au sud de Sombrivage, et échoue en Orneval ; quête chronométrée (25 minutes, rendu compris).
- Butin de guerre (Port-Menethil) : le bois et le fer sont dans l'eau tout autour du port. La Tour d'Althalaxx : la gemme d'âme tombe très rarement (astuce).
- Groupe 12 : MacKreel's Moonshine (15 minutes jusqu'à Austrivage, trop court pour ce parcours) devient facultative ; Hillsbrad's Hoard a enfin son étape (déposer la requête sur le lutrin de l'hôtel de ville des champs de Hautebrande), rendue au retour à Austrivage.

### English
- Ashenvale (Group 8): it is a contested zone. Two notes on arrival: the Horde's posts (Zoram'gar on the west coast, Splintertree in the east) and the spots where same-level Horde quests meet the guide's (Zoram Strand nagas, Thistlefur camp, Foulweald, Mystral Lake). Spot taken: skip the step (Skip button) and come back later. The Wetlands, later in the guide, have no Horde quests.
- Same reminder when entering Stonetalon (Sun Rock Retreat, Horde) and at the start of Group 14 (the eastern camps around Splintertree Post).
- Culling the Threat (Dal Bloodclaw): a tip from one player's sighting in game, not confirmed yet. He sometimes leaves his camp and ends up alone: wait out of sight and pull him then, instead of clearing his guards one at a time.
- Elemental Bracers (Mystral Lake, Group 8): the step explains why the elementals' tooltip counts nothing (the game counts only the Divined Scroll, not the bracers) and that the guide's bracer line counts them. It names the Befouled Water Elementals, says not every one drops a bracer (about 1 in 5 in the data) and that only Intact Elemental Bracers count. New line "Use Divining Scroll": right-click it in the bags with 5 bracers, then hand in the quest. The quest item button offers the scroll.
- Same explanation for two steps of the same kind: Marauders of Darrowshire (Fetid Skulls turned into Resonating Skulls by the Mystic Crystal, Eastern Plaguelands) and Two Halves Become One (the ghouls' half-charm, Western Plaguelands).
- Menethil Harbor (Group 8): Karl Boran offers Forever's "Return the Statuette" (for Captain Stoutfist) only after the first "Return the Statuette" is handed in, at the end of the murloc hovels chain. The guide asked for it on arrival and got stuck. It is now taken after that hand-in, then goes to Stoutfist; its follow-ups (A Friend of the Family from Stoutfist then Bolvar, The Shamed Lieutenant) keep their place.
- Review of Groups 8, 9 and 12 against Wowhead Forever (160 quest pages) and MetaForge. Quests asked before the ones that unlock them are back in place: at Prospector Whelgar, Understanding Our Present, Gleaning Our Future and For Further Study follow Uncovering the Past (taken in Groups 9 then 12 instead of all at once in Group 8); Carnage comes after Blisters on the Land; Crimson Crate Delivery follows Crocs of the Sky (optional for now).
- The Sleeper Has Awakened (Kerlonian): on Forever the escort ends at his bag in southern Darkshore and fails in Ashenvale; timed quest (25 minutes, hand-in included).
- Spoils of War (Menethil Harbor): the timber and iron lie in the water all around the harbor. The Tower of Althalaxx: the soul gem drops very rarely (tip).
- Group 12: MacKreel's Moonshine (15 minutes to Southshore, too short for this route) becomes optional; Hillsbrad's Hoard finally has its step (put the request on the lectern in the Hillsbrad Fields town hall), handed in back in Southshore.

## v0.9.8 (2026-11-11)

### Français
- BugSack : la croix de la fenêtre la ferme bien (avant : il fallait recliquer sur l'icône).
- BugSack : « Envoyer les bugs » retient le nom du joueur à qui les envoyer. Taper une fois le nom du personnage (comme pour un message privé), il est proposé les fois suivantes. Le destinataire doit être connecté et avoir BugSack.

### English
- BugSack: the window's close button closes it (before: only the icon did).
- BugSack: "Send bugs" remembers the player to send them to. Type the character name once (as for a whisper), it is offered the next times. The recipient must be online and have BugSack.

## v0.9.7 (2026-11-11)

### Français
- Polestar : plus d'erreur « Invalid escape code in chat message » en groupe. L'annonce d'un objectif terminé dans le chat du groupe ne reprend plus que les mots de l'objectif (sans les codes de couleur, d'icône ou d'accord du jeu), et une ligne que le chat refuse est abandonnée sans erreur.

### English
- Polestar: no more "Invalid escape code in chat message" error in a party. The party chat line for a finished objective now carries only the objective's plain words (no colour, icon or grammar codes), and a line chat refuses is dropped without an error.

## v0.9.6 (2026-11-10)

### Français
- Guide : les rendus des quêtes que le guide fait prendre ne se valident plus tout seuls. Aux Carmines, les avis de recherche (Tharil'zun, Magie des Ténèbres, Gath'Ilzogg, Gar'im) terminaient le chapitre avant d'être rendus au Comté-du-Lac : l'étape attend maintenant leur rendu (pour ceux qui ont pris les quêtes ; les autres n'ont rien à faire).
- Même correction pour 8 autres rendus : à Auberdine (Sombrivage), dans les Contreforts de Hautebrande et les Hautes-terres d'Arathi (Austrivage et le Havre), dans les Hinterlands, en Gangrebois, au Berceau-de-l'Hiver et dans les Maleterres de l'Est.

### English
- Guide: hand-ins of quests the guide has you take no longer tick themselves. In Redridge, the wanted posters (Tharil'zun, Shadow Magic, Gath'Ilzogg, Gar'im) ended the chapter before being handed in at Lakeshire: the step now waits for the hand-ins (for those who took the quests; nothing to do for the others).
- Same fix for 8 other hand-ins: Business in Auberdine (Darkshore), Hillsbrad and Arathi (Magtoor, Marshal Redpath, Southshore), Hinterlands (Sprogger), Felwood (Emerald Sanctuary), Winterspring (Donova Snowden), Eastern Plaguelands (Tirion Fordring).

## v0.9.5 (2026-11-10)

### Français
- Programme d'installation : quand il se met à jour lui-même, la nouvelle fenêtre s'ouvre au premier plan (avant : elle passait derrière les autres fenêtres, comme réduite).
- Programme d'installation : thème sombre (fenêtre, barre de titre, journal, barre de progression, boutons, questions). Bandeaux de fin vert et orange gardés, plus sombres.

### English
- Installer: when it updates itself, the new window opens in front (before: it went behind the other windows, as if minimised).
- Installer: dark theme (window, title bar, log, progress bar, buttons, questions). Green and orange end banners kept, darker.

## v0.9.4 (2026-11-10)

### Français
- BuffAlerts : les grandes icônes d'alerte quittent le milieu de l'écran. Elles s'affichent en haut à droite, sous les améliorations (buffs) du jeu, à gauche de la fenêtre du guide, en taille moyenne (40 au lieu de 64). Le son du Cri de guerre reste.
- Elles suivent les améliorations si le Mode édition du jeu les déplace. Pour les mettre ailleurs : `/balert`, « Move icons », glisser, puis « Lock icons ».
- BuffAlerts : « Reset to defaults » (et `/balert reset`) s'arrêtait sur une erreur à mi-chemin ; il remet maintenant tous les réglages du guide.
- PrettyTooltip : sur le cadavre d'une bête que l'on peut dépecer, le badge de dépeçage s'affiche aussi pour les créatures propres à Forever (avant : l'information disparaissait).
- PrettyTooltip : dans le journal de quêtes de la carte, un objectif rempli sans compteur (parler à quelqu'un, explorer, escorte) est coché, comme le jeu le grise (avant : il restait décoché).

### English
- BuffAlerts: the large alert icons leave the middle of the screen. They now show top right, under the game's buffs, left of the guide window, at medium size (40 instead of 64). The Battle Shout sound stays.
- They follow the buffs if the game's Edit Mode moves them. To put them elsewhere: `/balert`, "Move icons", drag, then "Lock icons".
- BuffAlerts: "Reset to defaults" (and `/balert reset`) stopped halfway on an error; it now restores every guide setting.
- PrettyTooltip: on a skinnable beast's corpse, the skinning badge now also shows for Forever-only creatures (before: the information disappeared).
- PrettyTooltip: in the world map's quest log, a done objective without a count (talk to someone, explore, escort) is ticked, as the game greys it (before: it stayed unticked).

## v0.9.3 (2026-11-10)

### Français
- BugSack (version 12.1.9, par funkydude) et BugGrabber (12.1.1) installés avec le guide : quand un addon du guide plante, l'erreur est gardée, prête à copier, au lieu d'être perdue.
- Signal : un son, et l'icône BugSack (petit sac à gauche de la minicarte) passe au rouge. Aucune fenêtre ne s'ouvre toute seule.
- Envoyer une erreur à BurN-30 : clic gauche sur l'icône (ou `/bugsack`), cliquer dans le texte, Ctrl+A puis Ctrl+C, coller (Ctrl+V) dans Discord. Ajouter la version du guide, la langue du jeu et ce que faisait le personnage.
- « < Précédent » et « Suivant > » (*< Previous*, *Next >*) : erreur par erreur. Onglet « Session précédente » (*Previous session*) : celles de la connexion d'avant.
- Couper le son : clic droit sur l'icône, Options, « Muet » (*Mute*). Maj + clic sur l'icône recharge l'interface.
- Réglages du guide : icône placée à l'écart du bouton Polestar de la minicarte (les deux étaient l'un sur l'autre), infobulle française de l'icône corrigée.
- PrettyTooltip : dans l'infobulle d'un monstre de quête, le nom de chaque membre du groupe ressort en jaune, ses objectifs en dessous, comme dans l'infobulle d'origine (avant : noms et objectifs dans la même couleur).
- Programme d'installation : accepte le dossier `!BugGrabber` (le « ! » le fait charger avant les autres addons). Un ancien programme se met à jour tout seul avant d'installer.

### English
- BugSack (version 12.1.9, by funkydude) and BugGrabber (12.1.1) installed with the guide: when a guide addon breaks, the error is kept, ready to copy, instead of being lost.
- Signal: a sound, and the BugSack icon (a small sack on the left of the minimap) turns red. No window opens by itself.
- Send an error to BurN-30: left-click the icon (or `/bugsack`), click in the text, Ctrl+A then Ctrl+C, paste (Ctrl+V) in Discord. Add the guide version, the game language and what the character was doing.
- "< Previous" and "Next >": one error after another. "Previous session" tab: errors from the last login.
- Mute: right-click the icon, Options, "Mute". Shift+click on the icon reloads the UI.
- Guide defaults: icon placed away from Polestar's minimap button (they sat on top of each other), French icon tooltip fixed.
- PrettyTooltip: in a quest mob's tooltip, each party member's name stands out in yellow with their objectives below, as in the default tooltip (before: names and objectives in the same color).
- Install program: accepts the `!BugGrabber` folder (the "!" makes it load before the other addons). An older program updates itself before installing.

## v0.9.2 (2026-11-10)

### Français
- BuffAlerts Forever (version 3.11.4, par Thork) installé avec le guide : une icône au milieu de l'écran quand une amélioration de classe manque, de petites icônes en haut pour le reste.
- Guerrier : Cri de guerre (Battle Shout) en combat, avec un son ; Fulgurance, Vengeance et Exécution quand elles sont utilisables.
- Druide : Marque du fauve (aussi à côté des cadres du groupe), Épines, Augure de clarté. Démoniste : armure, démon absent, moins de 5 fragments d'âme. Mage : armure, Intelligence des arcanes (aussi à côté des cadres du groupe).
- Toutes les classes, hors combat : nourriture, feu de camp, durabilité sous 20 %, arme absente.
- `/balert` : options (en anglais) ; `/balert toggle` : masquer ou réafficher toutes les alertes.
- Limites : en combat, le jeu cache les améliorations (l'addon se fie à la lecture d'avant le combat et aux sorts lancés par le personnage) ; les réglages reviennent à ceux du guide à chaque connexion.
- Correctif du guide : sur le client français, les rappels de nourriture et de feu de camp s'éteignent quand l'amélioration est là.
- Temps restant du Cri de guerre en barre : gestionnaire de temps de recharge du jeu (Échap › Options › Options avancées), placé en Mode édition, sorts choisis avec `/cdm`.

### English
- BuffAlerts Forever (version 3.11.4, by Thork) installed with the guide: an icon in the middle of the screen when a class buff is missing, small icons at the top for the rest.
- Warrior: Battle Shout in combat, with a sound; Overpower, Revenge and Execute when usable.
- Druid: Mark of the Wild (also beside the party frames), Thorns, Omen of Clarity. Warlock: armor, missing demon, fewer than 5 soul shards. Mage: armor, Arcane Intellect (also beside the party frames).
- Every class, out of combat: food, campfire, durability under 20%, missing weapon.
- `/balert`: options; `/balert toggle`: hide or show every alert.
- Limits: in combat the game hides buffs (the addon trusts the reading taken before the pull and the character's own casts); settings go back to the guide's at every login.
- Guide fix: on the French client, the food and campfire reminders turn off once the buff is up.
- Battle Shout's time left as a bar: the game's Cooldown Manager (Esc › Options › Advanced Options), placed in Edit Mode, spells chosen with `/cdm`.

## v0.9.1 (2026-11-10)

### Français
- Programme d'installation : une mise à jour qui saute plusieurs versions affiche les nouveautés de chacune, de la plus récente à la plus ancienne (avant : seulement la dernière).
- Il demande aussi de relancer le jeu si une seule des versions sautées l'exige (avant : seulement si la dernière le demandait).
- Guide recompilé : textes devenus inutiles retirés, rien ne change en jeu.

### English
- Installer: an update that skips several versions shows what's new in each of them, newest first (before: only the latest).
- It also asks to restart the game if any skipped version needs it (before: only if the latest did).
- Guide rebuilt: unused texts removed, nothing changes in game.

## v0.9.0 (2026-11-10)

### Français
- PrettyTooltip (version 1.3.8, par FallenShard) installé avec le guide : infobulles redessinées pour les objets, les sorts, les personnages et PNJ, les améliorations et affaiblissements, les herbes, minerais et coffres, les quêtes.
- PrettyTooltip avec correctifs du pack (détail dans `docs/prettytooltip-correctifs.md`) : un bonus d'ensemble actif reste dans la liste des bonus, en vert, au lieu de partir en bas ; le numéro d'un sort n'est plus pris pour la description d'une amélioration ; en français, « NivO » pour le niveau d'objet et « Occupé(e) » pour Ne pas déranger.
- Les lignes de Polestar (objectifs de quête, amélioration d'équipement, provenance d'un objet) et les prix d'Auctionator restent dans l'infobulle, en bas, à part.
- **Alt** maintenue : l'infobulle d'origine du jeu. **Maj** maintenue : les détails (désenchantement, contenu des herbes et minerais, numéros). `/ptip` : éditeur de style ; `/ptip options` : ce qui est redessiné.
- Un PrettyTooltip déjà installé est remplacé par cette version (l'ancien est mis de côté dans `_guide-sauvegarde`) ; ses réglages (dossier WTF) sont gardés.
- Guide : « Les lingots de sancteforge » (Lightforge Ingots) n'est plus prise aux Paluns vers le niveau 20, où elle n'est pas encore proposée (il faut d'abord « Le fer de sancteforge ») ; les lingots se font plus tard avec « La Flotte perdue », « Le fer de sancteforge » et « Les lingots perdus ». « Le mystère de Kurzen » (Kurzen's Mystery) est prise après les deux quêtes du Sergent Yohwa, qui l'ouvrent.

### English
- PrettyTooltip (version 1.3.8, by FallenShard) installed with the guide: redrawn tooltips for items, spells, players and NPCs, buffs and debuffs, herbs, ore and chests, quests.
- PrettyTooltip with the pack's patches (details in `docs/prettytooltip-correctifs.md`): an active set bonus stays in the bonus list, green, instead of moving to the bottom; a spell ID is no longer taken for a buff's description; in French, "NivO" for item level and "Occupé(e)" for Do Not Disturb.
- Polestar's lines (quest objectives, gear upgrade, where an item comes from) and Auctionator prices stay in the tooltip, at the bottom, set apart.
- Hold **Alt**: the game's original tooltip. Hold **Shift**: the details (disenchanting, herb and ore contents, IDs). `/ptip`: style editor; `/ptip options`: what gets redrawn.
- A PrettyTooltip already installed is replaced by this version (the old one is kept in `_guide-sauvegarde`); its settings (WTF folder) are kept.
- Guide: Lightforge Ingots is no longer taken in the Wetlands around level 20, where it is not offered yet (Lightforge Iron comes first); the ingots come later with The Doomed Fleet, Lightforge Iron and The Lost Ingots. Kurzen's Mystery is taken after Sergeant Yohwa's two quests, which open it.

## v0.8.0 (2026-11-09)

### Français
- Auctionator (version 343, par plusmouse) installé avec le guide : prix de l'hôtel des ventes dans l'infobulle des objets et des ressources.
- Mettre les prix à jour : à l'hôtel des ventes, onglet **Auctionator**, bouton **Analyse complète** (Full Scan). Les prix restent ensuite affichés partout, même loin de l'HdV.
- Un Auctionator déjà installé est remplacé par cette version (l'ancien est mis de côté dans `_guide-sauvegarde`) ; ses réglages et ses prix (dossier WTF) sont gardés.

### English
- Auctionator (version 343, by plusmouse) installed with the guide: auction house prices in item and reagent tooltips.
- Update prices: at the auction house, **Auctionator** tab, **Full Scan** button. Prices then show everywhere, even away from the AH.
- An Auctionator already installed is replaced by this version (the old one is kept in `_guide-sauvegarde`); its settings and prices (WTF folder) are kept.

## v0.7.4 (2026-11-08)

### Français
- Étiquette violette « Escorte » en bout de ligne sur les quêtes d'escorte (22 sur le parcours), avant la marque de difficulté.
- Son infobulle : ce qu'est une escorte, la prendre AVANT le départ en groupe, rester près du PNJ, acceptée toute seule quand un membre du groupe la lance.
- Masquer l'étiquette : roue dentée, Guide, Fenêtre, Groupe Alliance (allumée par défaut).
- Mise à jour : un `/reload` suffit.

### English
- A purple "Escort" label at the end of escort quests' lines (22 on the route), before the difficulty mark.
- Its tooltip: what an escort is, take it BEFORE the start in a group, stay close to the NPC, accepted for you when a party member starts it.
- Hide the label: gear, Guide, Window, Groupe Alliance (on by default).
- Update: a `/reload` is enough.

## v0.7.3 (2026-11-08)

### Français
- Quêtes prises et rendues toutes seules, allumé par défaut : seulement celles de l'étape en cours, Maj enfoncée pour passer une fois. Déjà en 0.7.2 : allumé même si vous l'aviez éteint, un message le dit une fois.
- Quêtes de groupe jamais prises sans la réponse « La faire en groupe ».
- Clic droit sur une ligne du guide : « Ne pas prendre ni rendre automatiquement » cette quête ; la liste est dans la roue dentée, Quêtes.
- Escortes et quêtes partagées par le groupe acceptées tout de suite si elles sont dans l'étape en cours ou les deux suivantes.
- README : section « Confort en jeu » (ce que Polestar fait déjà, où le régler) ; Leatrix Plus : laisser « Automate quests » éteint.

### English
- Quests accepted and turned in for you, on by default: only the current step's, hold Shift to skip once. Already on 0.7.2: on even if you had switched it off, a message says so once.
- Group quests are never taken without the "Do it with a group" answer.
- Right-click a guide line: "Don't accept or turn in automatically" for that quest; the list is under the gear, Questing.
- Escorts and quests shared by the group are accepted at once when they are in the current step or the next two.
- README: "Confort en jeu" section (what Polestar already does, where to set it); Leatrix Plus: keep "Automate quests" off.

## v0.7.2 (2026-11-08)

### Français
- Un maître perdu : l'astuce dit où chercher les Géniteurs et Matriarches traquelunes (au sud du Glaive du Maître).

### English
- A Lost Master: the tip says where the Moonstalker Sires and Matriarchs are (south of the Master's Glaive).

## v0.7.1 (2026-11-08)

### Français
- Un maître perdu (Sombrivage) : l'astuce donne les vrais noms des monstres qui lâchent la Belle peau de traquelune (Géniteur et Matriarche traquelunes, pas les Traquelunes simples).

### English
- A Lost Master (Darkshore): the tip now names the creatures that drop the Fine Moonstalker Pelt (Moonstalker Sires and Matriarchs, not plain Moonstalkers).

## v0.7.0 (2026-11-08)

### Français
- Programme d'installation : il dit « Première installation » ou « Mise à jour de X vers Y », et à la fin un bandeau en gros dit quoi faire : `/reload` en jeu, ou relancer le jeu quand la version l'exige.
- Plus besoin de fermer le jeu pour une simple mise à jour : un `/reload` suffit.
- Cité de Dalaran devient facultatif, avec la question de groupe à Hurlevent ; passé, le guide renvoie à Menethil.
- Uldaman se fait après les quêtes des Terres ingrates, avec les rendus à Forgefer sur le vol vers Austrivage (environ 7 minutes gagnées).
- Nouveau donjon facultatif : le Temple englouti, question chez Brohann à Hurlevent.
- Pierre de foyer : notes « utilisez votre pierre de foyer » sur les longs retours, avec le chemin à prendre si elle recharge ; deux notes de lien fausses corrigées.
- Astuces par objectif : la Terrestrine et les champignons lunaires ont chacun la leur, et dix astuces sont rattachées à la bonne ligne.

### English
- Installer: it says "First install" or "Update from X to Y", and a large banner at the end says what to do: `/reload` in game, or restart the game when the version needs it.
- No need to close the game for a plain update any more: a `/reload` is enough.
- City of Dalaran is now optional, with the group question in Stormwind; skipped, the guide sends you back to Menethil.
- Uldaman now comes after the Badlands quests, with the Ironforge hand-ins on the flight to Southshore (about 7 minutes saved).
- New optional dungeon: the Sunken Temple, asked at Brohann in Stormwind.
- Hearthstone: "use your hearthstone" notes on the long trips back, with the way to go when it is on cooldown; two wrong bind notes fixed.
- Tips per objective: Earthroot and the Lunar Fungi each get their own, and ten tips now sit on the right line.

## v0.6.2 (2026-11-08)

### Français
- Carte du monde allégée : seulement les quêtes à rendre et les objectifs de l'étape en cours ; plus de zones ombrées ni de donneurs de quêtes par défaut.
- Nouveau sous-menu « Polestar : repères de quête » dans le menu de suivi de la carte du monde et de la minicarte : chaque repère s'active ou se coupe d'un clic.
- Astuce sur « Bigobox 827 » : c'est le vrai nom de la quête, une Bigobox est une boîte-robot qui donne la suivante.

### English
- Lighter world map: only turn-ins and the current step's objectives; no shaded areas or quest givers by default.
- New "Polestar: quest markers" submenu in the world map's and the minimap's tracking menu: each marker type is switched on or off in one click.
- Tip on "Buzzbox 827": it is the quest's real name, a buzzbox is a robot box that gives the next one.

## v0.6.1 (2026-11-08)

### Français
- Moins d'allers-retours : après Dalaran, plus de vol vers Hurlevent ; les deux récompenses de Hurlevent se rendent à l'arrêt de Hurlevent du guide suivant (environ 6 minutes gagnées).

### English
- Fewer back-and-forth trips: after Dalaran, no more flight to Stormwind; the two Stormwind rewards are handed in at the next guide's Stormwind stop (about 6 minutes saved).

## v0.6.0 (2026-11-08)

### Français
- Vrais noms français : lieux, PNJ, monstres, objets et quêtes écrits dans les textes reprennent ceux du client français (environ 470 textes corrigés, départs compris).
- Parcours jusqu'au niveau 60 : Steppes ardentes, Gangrebois, Berceau-de-l'Hiver, Maleterres et Silithus (Groupes 25 à 30), avec la note « chacun à son rythme ».
- Nouveau donjon facultatif : Zul'Farrak, question posée à Gadgetzan (trois quêtes).
- Quêtes 30-43 relues contre Wowhead Forever (donneur, rendu, niveau, position) ; 85 astuces de plus (318 en tout), surtout entre 30 et 43.

### English
- Real French names: places, NPCs, creatures, items and quests written in the French texts now use the French client's names (about 470 texts fixed, start zones included).
- Route up to level 60: Burning Steppes, Felwood, Winterspring, the Plaguelands and Silithus (Groups 25 to 30), with the "everyone at their own pace" note.
- New optional dungeon: Zul'Farrak, asked in Gadgetzan (three quests).
- Quests 30-43 checked against Wowhead Forever (giver, ender, level, position); 85 more tips (318 in all), mostly between 30 and 43.

## v0.5.0 (2026-11-08)

### Français
- Parcours Alliance jusqu'au niveau 50 : guides Polestar 30-50 repris avec des notes de groupe.
- Donjons facultatifs ajoutés : Monastère écarlate et Uldaman (question posée à Forgefer).
- Fin de l'histoire des Défias à Hurlevent (Lescovar, anneau Sceau de Wrynn) et chaîne de Martek facultative.
- 233 astuces de quête, textes français complets.
- Nouveau : `GuideWoWForever.exe` installe et met à jour le guide en un double-clic, puis laisse un raccourci « Mettre à jour le guide WoW » sur le Bureau.

### English
- Alliance route up to level 50: Polestar 30-50 guides included with group notes.
- New optional dungeons: Scarlet Monastery and Uldaman (asked in Ironforge).
- End of the Defias story in Stormwind (Lescovar, Seal of Wrynn ring) and optional Martek chain.
- 233 quest tips, full French texts.
- New: `GuideWoWForever.exe` installs and updates the guide with one double-click, then leaves an "Update the WoW guide" shortcut on the desktop.

## v0.4.0 (2026-11-08)

### Français
- Quêtes de groupe « à demander » (La passer / La faire en groupe), chapitres Mortemines et Prison, marques de difficulté orange et rouge.

### English
- Group quests asked first (Skip it / Do it with a group), Deadmines and Stockade chapters, orange and red difficulty marks.

## v0.3.0 (2026-11-08)

### Français
- Polestar 0.3.4, chacun à son rythme (le guide reprend au bon endroit), repères de quêtes sur la carte, premières astuces.

### English
- Polestar 0.3.4, everyone at their own pace (the guide resumes at the right step), quest markers on the map, first tips.

## v0.1.0 (2026-11-06)

### Français
- Première version : paquet de guides Polestar pour un groupe Alliance, liens Wowhead, installateur `Installer.bat`.

### English
- First version: Polestar guide pack for an Alliance group, Wowhead links, `Installer.bat` installer.
