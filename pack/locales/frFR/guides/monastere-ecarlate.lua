-- French (frFR): the guide groupe-alliance/monastere-ecarlate (guides/monastere-ecarlate.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["Dungeon · The Scarlet Monastery (34-46)"] = "Donjon · Le Monastère écarlate (34-46)",

	-- Step 1: Nijel's Point: Brother Anton
	-- {quest:261} Down the Scarlet Path · {npc:1182} Brother Anton · {object:176948} Nijel's Point · {zone:1443} Desolace
	["Raleigh's quest for the monastery follows {quest:261}, from {npc:1182} at the north end of {object:176948}, in {zone:1443}: the route gives it at about 39."] = "La quête de Raleigh pour le monastère suit {quest:261}, de {npc:1182} au nord de la Combe de Nijel, en {zone:1443} : le parcours la donne vers 39.",

	-- Step 2: Southshore: Raleigh the Devout
	-- {npc:3980} Raleigh the Devout
	["Southshore: {npc:3980}"] = "Austrivage : {npc:3980}",
	-- {zone:1420} Tirisfal Glades · {object:171531} The Library
	["The Scarlet Monastery: four wings in {zone:1420}, for a group of 5, levels 30 to 42 (group finder: Graveyard 30-38, Library 33-41, Armory 36-44, Cathedral 38-46). {object:171531}, the Armory and the Cathedral hold the quests."] = "Le Monastère écarlate : quatre ailes dans {zone:1420}, pour un groupe de 5, niveaux 30 à 42 (recherche de groupe : Cimetière 30-38, Bibliothèque 33-41, Armurerie 36-44, Cathédrale 38-46). La Bibliothèque, l'Armurerie et la Cathédrale portent les quêtes.",
	-- {object:176948} Nijel's Point · {zone:1443} Desolace · {object:1162} Menethil Harbor · {npc:3980} Raleigh the Devout
	["From {object:176948}, in {zone:1443}: the flight to Theramore, the boat to {object:1162}, then the flight to Southshore. {npc:3980} is upstairs in the inn."] = "Depuis la Combe de Nijel, en {zone:1443} : le vol pour Theramore, le bateau pour le port de Menethil, puis le vol pour Austrivage. {npc:3980} est à l'étage de l'auberge.",
	-- {npc:3980} Raleigh the Devout · {quest:1052} Down the Scarlet Path · {npc:1182} Brother Anton
	["{npc:3980}: {quest:1052}, from {npc:1182}"] = "{npc:3980} : {quest:1052}, de {npc:1182}",
	-- {npc:3980} Raleigh the Devout
	["{npc:3980}, upstairs in the inn: four Scarlet bosses"] = "{npc:3980}, à l'étage de l'auberge : quatre boss écarlates",

	-- Step 3: Magus Olvek
	["On the way north: he stands on the western edge of the Dalaran crater, by the road from Hillsbrad to Silverpine."] = "En route vers le nord : il se tient sur le bord ouest du cratère de Dalaran, près de la route de Hautebrande à Pins-Argentés.",
	-- {npc:264265} Magus Olvek · {quest:96800} Past Due · {npc:6487} Arcanist Doan
	["{npc:264265}: {quest:96800}, {npc:6487}'s book"] = "{npc:264265} : {quest:96800}, livre de {npc:6487}",

	-- Step 5: Before entering the Scarlet Monastery
	["Before entering the Scarlet Monastery"] = "Avant d'entrer dans le Monastère écarlate",
	-- {zone:1421} Silverpine Forest · {zone:1420} Tirisfal Glades
	["Ride through {zone:1421}, then east across {zone:1420}: Horde land, keep clear of Brill and the guards on the roads. The monastery stands in the far north-east; the four wings are four doors in the courtyard."] = "Traverser {zone:1421}, puis {zone:1420} vers l'est : terre de la Horde, rester loin de Brill et des gardes sur les routes. Le monastère est tout au nord-est ; les quatre ailes sont quatre portes dans la cour.",
	-- {quest:1053} In the Name of the Light · {quest:96800} Past Due · {npc:264265} Magus Olvek · {quest:1050} Mythology of the Titans · {zone:1455} Ironforge
	["In the log before going in: {quest:1053} (Raleigh, Southshore) and {quest:96800} ({npc:264265}, Alterac); {quest:1050} too for whoever took it from Mae Paledust in {zone:1455}. Share each quest with the group: click it in the quest log, then Share."] = "Dans le journal avant d'entrer : {quest:1053} (Raleigh, Austrivage) et {quest:96800} ({npc:264265}, Alterac) ; {quest:1050} aussi pour qui l'a prise auprès de Mae Paledust à {zone:1455}. Partager chaque quête avec le groupe : clic sur la quête dans le journal, puis Partager.",
	["Scarlet Monastery"] = "Monastère Écarlate",

	-- Step 6: The Library: Houndmaster Loksey and Arcanist Doan
	-- {object:171531} The Library · {npc:3974} Houndmaster Loksey · {npc:6487} Arcanist Doan
	["{object:171531}: {npc:3974} and {npc:6487}"] = "La Bibliothèque : {npc:3974} et {npc:6487}",
	-- {npc:264265} Magus Olvek · {quest:1050} Mythology of the Titans · {zone:1455} Ironforge
	["Loksey and his dogs wait in a small alcove near the start. Doan is the last boss: at half health he shields himself and blows up everything near him, run out and come back. The red book for {npc:264265} is on a table on the right of Doan's room; {quest:1050}, for whoever took it in {zone:1455}, on the floor of a Library corridor, under a window; the Scarlet Key, for the Armory and Cathedral doors, in the chest behind him."] = "Loksey et ses chiens attendent dans une petite alcôve près de l'entrée. Doan est le dernier boss : à mi-vie, il se protège puis fait exploser tout ce qui l'entoure, sortir de la zone puis revenir. Le livre rouge pour {npc:264265} est sur une table à droite de la salle de Doan ; {quest:1050}, pour qui l'a prise à {zone:1455}, par terre dans un couloir de la Bibliothèque, sous une fenêtre ; la clé écarlate, pour les portes de l'Armurerie et de la Cathédrale, dans le coffre derrière lui.",
	-- {npc:6548} Magus Tirth · {item:7274} Rituals of Power
	["Mages on {npc:6548}'s chain: the book of {item:7274}, for Tabetha, is in the Library too."] = "Mages sur la suite de {npc:6548} : le livre de {item:7274}, pour Tabetha, est lui aussi dans la Bibliothèque.",
	-- {npc:3974} Houndmaster Loksey
	["{npc:3974}, elite 34"] = "{npc:3974}, élite 34",
	-- {npc:6487} Arcanist Doan
	["{npc:6487}, elite 37"] = "{npc:6487}, élite 37",
	-- {item:273169} The Lost Magic of the Runemasters
	["{item:273169}, red book on a table in Doan's room"] = "{item:273169}, livre rouge sur une table dans la salle de Doan",
	-- {quest:1050} Mythology of the Titans · {npc:3979} Librarian Mae Paledust · {zone:1455} Ironforge
	["{quest:1050}, on the floor of a corridor: for {npc:3979} in {zone:1455}, taken on the Uldaman chapter's way"] = "{quest:1050}, par terre dans un couloir : pour {npc:3979} à {zone:1455}, prise sur le chemin du chapitre d'Uldaman",

	-- Step 7: The Armory: Herod
	-- {npc:3975} Herod
	["The Armory: {npc:3975}"] = "L'Armurerie : {npc:3975}",
	-- {npc:3975} Herod
	["{npc:3975} spins with Whirlwind: everyone but the tank steps away until it ends. When he dies, a wave of trainees runs in: fight them at the door."] = "{npc:3975} tourne sur lui-même avec Tourbillon : tout le monde sauf le tank s'écarte jusqu'à la fin. À sa mort, une vague de recrues accourt : les combattre à la porte.",
	-- {npc:3975} Herod
	["{npc:3975}, elite 40"] = "{npc:3975}, élite 40",

	-- Step 8: The Cathedral: Mograine and Whitemane
	["The Cathedral: Mograine and Whitemane"] = "La Cathédrale : Mograine et Blanchetête",
	["Clear the chapel's pews first: pulling Mograine brings the whole room. Mograine first; when he falls, Whitemane runs in, puts the group to sleep and raises him once: kill him again, then her."] = "Vider d'abord les bancs de la chapelle : attaquer Mograine attire toute la salle. Mograine d'abord ; quand il tombe, Blanchetête accourt, endort le groupe et le relève une fois : le tuer de nouveau, puis elle.",
	-- {npc:3976} Scarlet Commander Mograine
	["{npc:3976}, elite 42"] = "{npc:3976}, élite 42",
	-- {npc:3977} High Inquisitor Whitemane
	["{npc:3977}, elite 42"] = "{npc:3977}, élite 42",

	-- Step 9: Back to Magus Olvek
	-- {npc:264265} Magus Olvek
	["Back to {npc:264265}"] = "Retour vers {npc:264265}",

	-- Step 10: Southshore rewards
	["Southshore rewards"] = "Récompenses à Austrivage",
	-- {object:1162} Menethil Harbor · {quest:1050} Mythology of the Titans · {zone:1455} Ironforge
	["Last stop of the chapter: the route's own guide comes back once this is handed in. Its next stop is Theramore: the flight to {object:1162}, then the boat to Theramore. With {quest:1050} done, the chapter goes by {zone:1455} first."] = "Dernier arrêt du chapitre : le guide du parcours revient une fois cette quête rendue. Son arrêt suivant est Theramore : le vol pour le port de Menethil, puis le bateau pour Theramore. Avec {quest:1050} faite, le chapitre passe d'abord par {zone:1455}.",
	-- {npc:3980} Raleigh the Devout
	["{npc:3980}, upstairs in the inn"] = "{npc:3980}, à l'étage de l'auberge",

	-- Step 11: Ironforge: Mythology of the Titans
	-- {zone:1455} Ironforge · {object:32356} Hall of Explorers · {object:1162} Menethil Harbor
	["From Southshore, the flight to {zone:1455}: Mae Paledust stands in the {object:32356}, by the bookshelves. Last stop of the chapter: then the flight to {object:1162} and the boat to Theramore, where the route goes on."] = "Depuis Austrivage, le vol pour {zone:1455} : Mae Paledust se tient dans {object:32356}, près des étagères. Dernier arrêt du chapitre : ensuite le vol pour le port de Menethil et le bateau pour Theramore, où le parcours reprend.",
}
