-- French (frFR): the guide groupe-alliance/21-terres-ingrates-hinterlands (guides/21-terres-ingrates-hinterlands.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1418} Badlands · {zone:1425} The Hinterlands
	["Group 19 · {zone:1418} & {zone:1425}"] = "Groupe 19 · {zone:1418} & {zone:1425}",

	-- Step 1: Fly to Thelsamar
	["Fly to Thelsamar"] = "Volez vers Thelsamar",
	["Everyone at their own pace: what you already did ticks itself, the guide picks up where you are. Playing together? Group XP is best within 4 levels."] = "Chacun à son rythme : ce qui est déjà fait se coche tout seul, le guide reprend où vous en êtes. En groupe ? L'XP de groupe est meilleure à 4 niveaux d'écart ou moins.",
	-- {zone:1455} Ironforge
	["{zone:1455} flight master"] = "Maître de vol de {zone:1455}",

	-- Step 3: Agmond's End
	["Agmond's End"] = "Fin d'Agmond",

	-- Step 4: Valley of Fangs
	["Valley of Fangs"] = "Vallée des Crocs",
	-- {npc:4454} Fizzle Brassbolts · {object:151976} Shimmering Flats · {zone:1446} Tanaris
	["for {npc:4454} in the {object:151976}: the {zone:1446} guide crosses them at 45, keep it"] = "pour {npc:4454} dans les {object:151976} : le guide de {zone:1446} les traverse au niveau 45, conservez-le",
	-- plural, as words: Blue Pearls = {item:4611} Blue Pearl
	["Blue Pearls from Stranglethorn"] = "Perles bleues de Strangleronce",
	-- {npc:2817} Rigglefuzz
	["{npc:2817}'s next quest pays no experience: skip it."] = "La quête suivante de {npc:2817} ne rapporte pas d'expérience : passez-la.",

	-- Step 5: Uldaman (dungeon, optional): Rigglefuzz
	-- {npc:2817} Rigglefuzz
	["Uldaman (dungeon, optional): {npc:2817}"] = "Uldaman (donjon, facultatif) : {npc:2817}",
	-- {zone:1418} Badlands · {zone:1455} Ironforge
	["Uldaman: a 5-player dungeon at the north end of the {zone:1418}, levels 42 to 52 on Forever: best at 43 or more. The {zone:1418} quests come first, then the dungeon, then the rewards in {zone:1455} on the way to Southshore. Alone? Skip it: the guide goes on in the {zone:1418}."] = "Uldaman : un donjon 5 joueurs au nord des {zone:1418}, niveaux 42 à 52 sur Forever : optimal à 43 ou plus. D'abord les quêtes des {zone:1418}, puis le donjon, puis les récompenses à {zone:1455} sur la route d'Austrivage. Seul ? Passez : le guide continue dans les {zone:1418}.",
	["Keep 5 free quest log slots. Everyone takes the quests at their own pace; meet at the entrance for the run."] = "Garder 5 emplacements libres dans le journal de quêtes. Chacun prend les quêtes à son rythme ; se retrouver à l'entrée pour le donjon.",
	-- {npc:2817} Rigglefuzz
	["{npc:2817}, Valley of Fangs"] = "{npc:2817}, Vallée des Crocs",

	-- Step 6: Boss Tho'grun
	-- {zone:1418} Badlands · {npc:2944} Boss Tho'grun
	["Ride west across the {zone:1418} to the Dustbelcher camp at Camp Boff. {npc:2944} stands in its middle with Wyrmhunters and Maulers around him."] = "Traversez les {zone:1418} vers l'ouest jusqu'au camp des Dustbelcher au camp Boff. {npc:2944} se tient au milieu avec des chasseurs de wyrms et des maulers autour de lui.",

	-- Step 7: Garek
	["Ride back east to Dustwind Gulch."] = "Retournez vers l'est au Goulet de la Bourrasque.",
	-- {npc:2888} Garek
	["{npc:2888}'s next task is an elite hunt: skip it."] = "La tâche suivante de {npc:2888} est une chasse élite : passez-la.",

	-- Step 8: Lethlor Ravine
	["Lethlor Ravine"] = "Ravin de Lethlor",
	-- {npc:2888} Garek · {item:4612} Black Drake's Heart
	-- plural, as words: Scalding Whelps = {npc:2725} Scalding Whelp · Scorched Guardians = {npc:2726} Scorched Guardian
	["The Scalding Whelps nest in the ravine east of {npc:2888}; leave the Scorched Guardians (elite) alone. The {item:4612} drops rarely: take it if it comes while you grind."] = "Les Dragonnets flamboyants nichent dans le ravin à l'est de {npc:2888} ; laissez tranquilles les Gardiens des terres brûlées (élites). Le {item:4612} tombe rarement : prenez-le s'il tombe pendant que vous tuez des monstres.",

	-- Step 9: Hammertoe Grez's Digsite
	-- {npc:2909} Hammertoe Grez
	["{npc:2909}'s Digsite"] = "Site de fouilles d'{npc:2909}",

	-- Step 10: Uldaman: Hammertoe Grez
	-- {npc:2909} Hammertoe Grez
	["Uldaman: {npc:2909}"] = "Uldaman : {npc:2909}",
	-- {npc:2909} Hammertoe Grez · {npc:2932} Magregan Deepshadow
	["{npc:2909} waits just outside Uldaman, west of the cave. His amulet is on {npc:2932}, a Shadowforge dwarf (elite 38) outside the dungeon portal, south of {npc:2909}."] = "{npc:2909} attend juste devant Uldaman, à l'ouest de la grotte. Son amulette est sur {npc:2932}, un nain Ombreforge (élite 38) devant le portail du donjon, au sud de {npc:2909}.",
	-- {item:4635} Hammertoe's Amulet · {npc:2932} Magregan Deepshadow
	["{item:4635}: {npc:2932}, elite 38"] = "{item:4635} : {npc:2932}, élite 38",
	-- {npc:2910} Prospector Ryedol · {zone:1418} Badlands
	["For {npc:2910}, on the way out of the {zone:1418}"] = "Pour {npc:2910}, en sortant des {zone:1418}",

	-- Step 11: The digsite and the outer cave
	["The digsite and the outer cave"] = "Le site de fouilles et la grotte extérieure",
	-- {npc:6294} Krom Stoutarm
	["The Shadowforge dwarves of the digsite in front of the cave and of the outer cave drop both power stones, not often: no need to enter the instance for them. {npc:6294}'s chest is in the outer cave, at the back of the left-hand hall, behind a pillar, with two guards."] = "Les nains Ombreforge du site de fouilles devant la grotte et de la grotte extérieure lâchent les deux pierres de pouvoir, rarement : pas besoin d'entrer dans l'instance pour elles. Le coffre de {npc:6294} est dans la grotte extérieure, au fond du couloir de gauche, derrière un pilier, avec deux gardes.",
	-- {item:8009} Dentrium Power Stone
	["{item:8009}: Shadowforge dwarves"] = "{item:8009} : nains Ombreforge",
	-- {item:8052} An'Alleum Power Stone
	["{item:8052}: Shadowforge dwarves"] = "{item:8052} : nains Ombreforge",
	-- {item:8027} Krom Stoutarm's Treasure
	["{item:8027}, from his chest"] = "{item:8027}, dans son coffre",
	["Uldaman"] = "Uldaman",

	-- Step 12: Baelog and the hidden chamber
	-- {npc:6906} Baelog
	["{npc:6906} and the hidden chamber"] = "{npc:6906} et la chambre cachée",
	-- {npc:6906} Baelog · {item:7740} Gni'kiv Medallion · {item:7733} Staff of Prehistoria
	["{npc:6906}, Eric and Olaf wait in the first halls, at the top of a ramp. The chest beside {npc:6906} holds the {item:7740}, Revelosh drops the Shaft of Tsol: together they make the {item:7733}. Plant it in the Map Room, kill Ironaya (elite), then walk all the way into the chamber."] = "{npc:6906}, Eric et Olaf attendent dans les premiers couloirs, en haut d'une rampe. Le coffre près de {npc:6906} contient le {item:7740}, Revelosh lâche la hampe : ensemble ils forment le {item:7733}. Le planter dans la Salle des Cartes, tuer Ironaya (élite), puis avancer jusqu'au fond de la chambre.",
	-- {item:7666} Shattered Necklace · {npc:6826} Talvash del Kissel · {zone:1455} Ironforge
	["Share each quest with your group: click it in the quest log, then Share. A {item:7666} may drop on the way: its chain goes on with {npc:6826} in {zone:1455}."] = "Partager chaque quête avec votre groupe : cliquer dessus dans le journal, puis Partager. Un {item:7666} peut tomber en route : sa suite continue avec {npc:6826} à {zone:1455}.",
	["Explore the hidden chamber"] = "Explorer la chambre cachée",
	-- {item:7666} Shattered Necklace · {npc:6826} Talvash del Kissel · {zone:1455} Ironforge
	["{item:7666}, a drop: for {npc:6826} in {zone:1455}"] = "{item:7666}, un butin : pour {npc:6826} à {zone:1455}",

	-- Step 13: Archaedas and the Discs of Norgannon
	-- {object:131474} Discs of Norgannon
	["Archaedas and the {object:131474}"] = "Archaédas et les {object:131474}",
	-- {object:131474} Discs of Norgannon
	["Archaedas, the last boss, wakes the stone guardians around his room during the fight. Behind him, the {object:131474}: click them, talk to the spirit on the left, then click the Discs again for the miniature copy before you leave."] = "Archaédas, le dernier boss, réveille les gardiens de pierre autour de sa salle pendant le combat. Derrière lui, les {object:131474} : les cliquer, parler à l'esprit à gauche, puis cliquer à nouveau sur les Disques pour la copie miniature avant de partir.",

	-- Step 14: Rigglefuzz
	["Leave by the front, south to the Valley of Fangs."] = "Sortir par l'entrée, au sud vers la Vallée des Crocs.",

	-- Step 15: Prospector Ryedol
	-- {zone:1432} Loch Modan
	["At the digsite by the road north to {zone:1432}, on the way to the Thelsamar flight."] = "Au site de fouilles, au bord de la route du nord vers {zone:1432}, sur le chemin du vol de Thelsamar.",
	-- {npc:2916} Historian Karnik · {zone:1455} Ironforge
	["For {npc:2916} in {zone:1455}"] = "Pour {npc:2916} à {zone:1455}",

	-- Step 16: Ironforge rewards
	-- {zone:1455} Ironforge
	["{zone:1455} rewards"] = "Récompenses à {zone:1455}",
	-- {zone:1455} Ironforge · {npc:1356} Prospector Stormpike · {npc:6294} Krom Stoutarm · {npc:5387} High Explorer Magellas · {object:32356} Hall of Explorers · {npc:6826} Talvash del Kissel · {object:32362} Mystic Ward
	["Fly from Thelsamar to {zone:1455}. {npc:1356}, {npc:6294} and {npc:5387} are all in the {object:32356}; {npc:6826} in the {object:32362}."] = "Griffon de Thelsamar à {zone:1455}. {npc:1356}, {npc:6294} et {npc:5387} sont tous dans l'{object:32356} ; {npc:6826} dans le {object:32362}.",
	-- {npc:6826} Talvash del Kissel
	["{npc:6826}: his follow-ups need another Uldaman run, not in this guide"] = "{npc:6826} : ses suites nécessitent un autre passage à Uldaman, pas dans ce guide",

	-- Step 17: Hall of Explorers: Historian Karnik and Advisor Belgrum
	-- {object:32356} Hall of Explorers · {npc:2916} Historian Karnik · {npc:2918} Advisor Belgrum
	["{object:32356}: {npc:2916} and {npc:2918}"] = "{object:32356} : {npc:2916} et {npc:2918}",
	-- {object:32356} Hall of Explorers · {zone:1418} Badlands
	["Both stand in the {object:32356}. Karnik's last task, An Ambassador of Evil, is in Angor Fortress in the {zone:1418}, which the route has left: do not take it."] = "Tous deux se tiennent dans {object:32356}. La dernière tâche de Karnik, An Ambassador of Evil, est dans la forteresse d'Angor, dans les {zone:1418}, que le parcours a quittées : ne pas la prendre.",

	-- Step 18: The Vault of Ironforge: the Platinum Discs reward
	-- {object:32377} Vault of Ironforge
	["The {object:32377}: the Platinum Discs reward"] = "{object:32377} : la récompense des disques de platine",
	-- {npc:5387} High Explorer Magellas · {object:131474} Discs of Norgannon · {npc:7292} Dinita Stonemantle · {object:32377} Vault of Ironforge
	["{npc:5387} hands a voucher for the {object:131474}: {npc:7292} pays it in the {object:32377}."] = "{npc:5387} remet un bon pour {object:131474} : {npc:7292} le paie dans {object:32377}.",
	-- {npc:7292} Dinita Stonemantle
	["{npc:7292}, in the Vault"] = "{npc:7292}, dans la Chambre forte",

	-- Step 19: Fly to Southshore
	["Fly to Southshore"] = "Envolez-vous pour Austrivage",

	-- Step 20: Fly to Southshore
	["Thelsamar flight master"] = "Maître de vol de Thelsamar",

	-- Step 21: Southshore
	["Southshore"] = "Austrivage",
	-- {npc:3980} Raleigh the Devout
	["Ride north to Thelsamar and fly to Southshore. {npc:3980} preaches by the inn."] = "Allez au nord jusqu'à Thelsamar et envolez-vous pour Austrivage. {npc:3980} prêche près de l'auberge.",
	-- {npc:3980} Raleigh the Devout
	["{npc:3980}, upstairs"] = "{npc:3980}, à l'étage",
	["Raleigh's next errand is in the Scarlet Monastery: alone, skip it; in a group, the next steps."] = "La prochaine commission de Raleigh est au Monastère écarlate : seul, passez ; en groupe, les étapes suivantes.",

	-- Step 22: Scarlet Monastery (dungeon, optional): Raleigh's errand
	["Scarlet Monastery (dungeon, optional): Raleigh's errand"] = "Monastère écarlate (donjon, optionnel) : commission de Raleigh",
	-- {quest:1053} In the Name of the Light · {quest:1052} Down the Scarlet Path · {npc:1182} Brother Anton · {zone:1443} Desolace
	["Group of 5. {quest:1053} only comes after {quest:1052}, from {npc:1182} in {zone:1443}: without it, the Library still pays for the two books."] = "Groupe de 5. {quest:1053} ne vient qu'après {quest:1052}, de {npc:1182} en {zone:1443} : sans elle, la Bibliothèque paie quand même pour les deux livres.",
	-- {npc:3980} Raleigh the Devout
	["{npc:3980}, upstairs in the inn: four Scarlet bosses"] = "{npc:3980}, à l'étage à l'auberge : quatre boss écarlates",

	-- Step 23: Magus Olvek
	["On the way north: he stands on the western edge of the Dalaran crater, by the road from Hillsbrad to Silverpine."] = "En route vers le nord : il se tient sur le bord ouest du cratère de Dalaran, près de la route de Hautebrande à Pins-Argentés.",
	-- {npc:264265} Magus Olvek · {quest:96800} Past Due · {npc:6487} Arcanist Doan
	["{npc:264265}: {quest:96800}, {npc:6487}'s book"] = "{npc:264265} : {quest:96800}, livre de {npc:6487}",

	-- Step 24: To the Scarlet Monastery
	["To the Scarlet Monastery"] = "Au Monastère Écarlate",
	-- {zone:1421} Silverpine Forest · {zone:1420} Tirisfal Glades
	["Ride through {zone:1421}, then east across {zone:1420}: Horde land, keep clear of Brill and the guards on the roads. The monastery stands in the far north-east; the four wings are four doors in the courtyard."] = "Traversez {zone:1421}, puis allez vers l'est à travers {zone:1420} : territoire de la Horde, évitez Brill et les gardes sur les routes. Le monastère se trouve à l'extrême nord-est ; les quatre ailes sont quatre portes dans la cour.",
	["Share each quest with your group: click it in the quest log, then Share."] = "Partagez chaque quête au groupe : clic sur la quête dans le journal, puis Partager.",
	["Scarlet Monastery"] = "Monastère Écarlate",

	-- Step 25: The Library: Houndmaster Loksey and Arcanist Doan
	-- {object:171531} The Library · {npc:3974} Houndmaster Loksey · {npc:6487} Arcanist Doan
	["{object:171531}: {npc:3974} and {npc:6487}"] = "{object:171531} : {npc:3974} et {npc:6487}",
	-- {quest:1050} Mythology of the Titans · {npc:264265} Magus Olvek
	["Loksey and his dogs wait in a small alcove near the start. {quest:1050} lies on a bench or the floor of the narrow corridors, to the left as you enter the room. Doan is the last boss: at half health he shields himself and blows up everything near him, run out and come back. The red book for {npc:264265} is on a table on the right of Doan's room; the Scarlet Key, for the Armory and Cathedral doors, in the chest behind him."] = "Loksey et ses chiens attendent dans une petite alcôve près de l'entrée. {quest:1050} se trouve sur un banc ou au sol des couloirs étroits, à gauche en entrant dans la pièce. Doan est le dernier boss : à moitié vie, il se protège par un bouclier et fait exploser tout ce qui est près de lui, sortez et revenez. Le livre rouge pour {npc:264265} est sur une table à droite de la salle de Doan ; la Clé Écarlate, pour les portes de l'Armurerie et de la Cathédrale, dans le coffre derrière lui.",
	-- {npc:3974} Houndmaster Loksey
	["{npc:3974}, elite 34"] = "{npc:3974}, élite 34",
	-- {quest:1050} Mythology of the Titans
	["{quest:1050}, on the floor of the Library"] = "{quest:1050}, au sol de la Bibliothèque",
	-- {npc:6487} Arcanist Doan
	["{npc:6487}, elite 37"] = "{npc:6487}, élite 37",
	-- {item:273169} The Lost Magic of the Runemasters
	["{item:273169}, red book on a table in Doan's room"] = "{item:273169}, livre rouge sur une table dans la salle de Doan",

	-- Step 26: The Armory: Herod
	-- {npc:3975} Herod
	["The Armory: {npc:3975}"] = "L'Armurerie : {npc:3975}",
	-- {npc:3975} Herod
	["{npc:3975} spins with Whirlwind: everyone but the tank steps away until it ends. When he dies, a wave of trainees runs in: fight them at the door."] = "{npc:3975} tourbillonne avec Tourbillon : tout le monde sauf le tank s'éloigne jusqu'à la fin. À sa mort, une vague de recrues arrive : combattez-les à la porte.",
	-- {npc:3975} Herod
	["{npc:3975}, elite 40"] = "{npc:3975}, élite 40",

	-- Step 27: The Cathedral: Mograine and Whitemane
	["The Cathedral: Mograine and Whitemane"] = "La Cathédrale : Mograine et Whitemane",
	["Clear the chapel's pews first: pulling Mograine brings the whole room. Mograine first; when he falls, Whitemane runs in, puts the group to sleep and raises him once: kill him again, then her."] = "Nettoyez d'abord les bancs de la chapelle : attirer Mograine fait venir toute la salle. Mograine en premier ; quand il tombe, Whitemane arrive, endort le groupe et le ressuscite une fois : tuez-le à nouveau, puis elle.",
	-- {npc:3976} Scarlet Commander Mograine
	["{npc:3976}, elite 42"] = "{npc:3976}, élite 42",
	-- {npc:3977} High Inquisitor Whitemane
	["{npc:3977}, elite 42"] = "{npc:3977}, élite 42",

	-- Step 28: Back to Magus Olvek
	-- {npc:264265} Magus Olvek
	["Back to {npc:264265}"] = "Retour vers {npc:264265}",

	-- Step 29: Southshore: Raleigh the Devout
	-- {npc:3980} Raleigh the Devout
	["Southshore: {npc:3980}"] = "Austrivage : {npc:3980}",
	-- {npc:3980} Raleigh the Devout
	["{npc:3980}, upstairs in the inn"] = "{npc:3980}, à l'étage dans l'auberge",
	-- {quest:1050} Mythology of the Titans · {zone:1455} Ironforge · {zone:1425} The Hinterlands
	["{quest:1050} goes back to Mae Paledust in {zone:1455}: the {zone:1425} guide (Group 22) passes there."] = "{quest:1050} retourne à Mae Paledust à {zone:1455} : le guide {zone:1425} (Groupe 22) y passe.",

	-- Step 31: Aerie Peak
	["Aerie Peak"] = "Nid-de-l'Aigle",
	-- {zone:1425} The Hinterlands · {npc:5635} Falstad Wildhammer · {quest:1450} Gryphon Master Talonaxe · {npc:7884} Fraggar Thundermantle
	["Ride north-east out of Southshore on the road into the {zone:1425}; Aerie Peak sits just past the border. {npc:5635} holds court at the top, {quest:1450} tends the aviary and {npc:7884} stands by the inn."] = "Sortez d'Austrivage vers le nord-est sur la route menant aux {zone:1425} ; Nid-de-l'Aigle se trouve juste après la frontière. {npc:5635} tient sa cour au sommet, {quest:1450} s'occupe de la volière et {npc:7884} se tient près de l'auberge.",
	-- {quest:1450} Gryphon Master Talonaxe
	["{quest:1450}, inside"] = "{quest:1450}, à l'intérieur",
	-- {npc:7884} Fraggar Thundermantle
	["{npc:7884}, inside"] = "{npc:7884}, à l'intérieur",
	-- {npc:7744} Innkeeper Thulfram
	["{npc:7744}, below ground: bind your hearthstone here"] = "{npc:7744}, sous terre : liez votre pierre de foyer ici",

	-- Step 32: Rhapsody Shindigger
	-- {npc:5634} Rhapsody Shindigger
	["{npc:5634} camps on the road east of Aerie Peak."] = "{npc:5634} campe sur la route à l'est de Nid-de-l'Aigle.",

	-- Step 33: Witherbark villages
	["Witherbark villages"] = "Villages de Fanécorce",
	-- {npc:5634} Rhapsody Shindigger
	["The first two cages stand together in the Witherbark village south of {npc:5634}; the third is in the next village to the east. Every Witherbark troll can drop a necklace."] = "Les deux premières cages se trouvent ensemble dans le village de Fanécorce au sud de {npc:5634} ; la troisième est dans le village suivant, à l'est. Chaque troll Witherbark peut lâcher un collier.",

	-- Step 34: Aerie Peak
	-- {npc:7884} Fraggar Thundermantle
	["{npc:7884} keeps paying for necklaces: hand in any extras"] = "{npc:7884} paie toujours les colliers : rendez ceux en trop",
	-- {npc:5636} Gryphon Master Talonaxe
	["{npc:5636}, beside the flight master at the top; inside"] = "{npc:5636}, à côté du maître de vol au sommet ; à l'intérieur",
	-- {zone:1425} The Hinterlands
	["Talonaxe's next task waits for a later {zone:1425} guide."] = "La prochaine tâche de Talonaxe attend un guide des {zone:1425} ultérieur.",

	-- Step 35: Fly to Menethil Harbor
	-- {object:1162} Menethil Harbor
	["Fly to {object:1162}"] = "Envolez-vous vers {object:1162}",
	["Aerie Peak flight master"] = "Maître de vol de Nid-de-l'Aigle",

	-- Step 37: Theramore
	["Theramore"] = "Theramore",
	-- {npc:2616} Privateer Groy
	["{npc:2616} stands on the docks where the boat lands."] = "{npc:2616} se tient sur les quais où accoste le bateau.",
	-- {npc:4944} Captain Garran Vimes
	["{npc:4944}, on the top floor"] = "{npc:4944}, au dernier étage",
	-- {npc:4968} Lady Jaina Proudmoore
	["{npc:4968}, on the top floor"] = "{npc:4968}, au dernier étage",

	-- Step 38: Cortello's Riddle
	["Inside Bloodfen Burrow"] = "À l'intérieur du Terrier des Rougefanges",

	-- Step 39: Theramore flight master
	["Theramore flight master"] = "Maître de vol de Theramore",

	-- Step 40: Ratchet
	["Ratchet"] = "Cabestan",

	-- Step 41: Warlock: Summon Felsteed
	-- {quest:3631} Summon Felsteed
	["Warlock: {quest:3631}"] = "Démoniste : {quest:3631}",
	-- {zone:1413} Barrens · {npc:6251} Strahad Farsan
	["From Theramore, ride north into the {zone:1413} to Ratchet, or fly if you know its flight path. {npc:6251} teaches in the house by the bank."] = "Depuis Theramore, allez au nord dans les {zone:1413} jusqu'à Cabestan, ou envolez-vous si vous connaissez son point de vol. {npc:6251} enseigne dans la maison près de la banque.",

	-- No longer in the guide (its English changed or it went away): reuse or delete.
	-- ["Raleigh's next errand is in the Scarlet Monastery: skip it."] = "La prochaine mission de Raleigh se trouve au Monastère écarlate : ignorez-la.",
	-- ["{npc:7744}: the last guide binds here, so this usually ticks at once; below ground"] = "{npc:7744} : le guide précédent vous fait lier votre pierre de foyer ici, donc ceci se coche généralement tout de suite ; sous terre",
}
