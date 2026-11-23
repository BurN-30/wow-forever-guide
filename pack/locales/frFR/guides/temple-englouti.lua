-- French (frFR): the guide groupe-alliance/temple-englouti (guides/temple-englouti.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["Dungeon · The Sunken Temple (50-56)"] = "Donjon · Le temple englouti (50-56)",

	-- Step 1: Stormwind: Brohann Caskbelly
	-- {zone:1435} Swamp of Sorrows · {npc:5384} Brohann Caskbelly · {zone:1453} Stormwind
	["The Sunken Temple: a troll and dragon dungeon under the Pool of Tears in the {zone:1435}, levels 50 to 60, best from about 52 with a group of 5: its last bosses are 55. Its main quest is {npc:5384}'s, in {zone:1453}: from Nethergarde Keep, the flight to {zone:1453} and back, about 7 minutes."] = "Le temple englouti : un donjon de trolls et de dragons sous le Bassin des larmes, dans le {zone:1435}, niveaux 50 à 60, idéal à partir de 52 environ en groupe de 5 : ses derniers boss sont de niveau 55. Sa quête principale est celle de {npc:5384}, à {zone:1453} : depuis Rempart-du-Néant, le vol pour {zone:1453} et retour, environ 7 minutes.",

	-- Step 2: Sunken Temple: the Pool of Tears
	["Sunken Temple: the Pool of Tears"] = "Temple englouti : le Bassin des larmes",
	-- {zone:1419} Blasted Lands · {zone:1435} Swamp of Sorrows
	["Ride north out of the {zone:1419} into the {zone:1435}, then east past Stonard (Horde) to the Pool of Tears. The temple lies under the water: swim down into it and find the dungeon's entrance inside."] = "Sortir des {zone:1419} par le nord vers le {zone:1435}, puis aller à l'est après Pierrêche (Horde) jusqu'au Bassin des larmes. Le temple est sous l'eau : plonger, entrer et trouver l'entrée du donjon à l'intérieur.",
	-- {quest:1475} Into The Temple of Atal'Hakkar · {npc:5384} Brohann Caskbelly · {zone:1453} Stormwind · {zone:1446} Tanaris · {quest:3446} Into the Depths · {quest:3447} Secret of the Circle · {npc:7771} Marvon Rivetseeker
	["Group of 5. Keep 4 free quest log slots. In the quest log before going in: {quest:1475} ({npc:5384}, {zone:1453}); for whoever took them at the Broken Pillar in {zone:1446}, {quest:3446} and {quest:3447} ({npc:7771}). Share each one with the group: click it in the quest log, then Share."] = "Groupe de 5. Garder 4 places libres dans le journal. Dans le journal avant d'entrer : {quest:1475} ({npc:5384}, {zone:1453}) ; pour qui les a prises au Pilier Brisé en {zone:1446}, {quest:3446} et {quest:3447} ({npc:7771}). Partager chacune avec le groupe : clic sur la quête dans le journal, puis Partager.",
	["Sunken Temple"] = "Temple englouti",

	-- Step 3: Marvon Rivetseeker: Into the Depths
	-- {npc:7771} Marvon Rivetseeker · {zone:1446} Tanaris · {object:148836} Altar of Hakkar
	["Taken from {npc:7771} at the Broken Pillar in {zone:1446}: it is handed in at the {object:148836}, in the temple's lowest hall."] = "Prise auprès de {npc:7771} au Pilier Brisé en {zone:1446} : elle se rend à l'{object:148836}, dans la salle la plus basse du temple.",

	-- Step 4: Marvon Rivetseeker: Secret of the Circle
	-- {npc:7771} Marvon Rivetseeker · {object:148838} Idol of Hakkar
	["Taken from {npc:7771} too: the six statues of the circle around the upper ring, lit in the right order, raise the {object:148838}."] = "Prise aussi auprès de {npc:7771} : les six statues du cercle autour de l'anneau supérieur, allumées dans le bon ordre, font apparaître l'{object:148838}.",

	-- Step 5: Sunken Temple: the circle and the Altar of Hakkar
	-- {object:148836} Altar of Hakkar
	["Sunken Temple: the circle and the {object:148836}"] = "Temple englouti : le cercle et l'{object:148836}",
	-- {object:148838} Idol of Hakkar · {object:148836} Altar of Hakkar · {npc:8580} Atal'alarion
	["On the upper ring, six Atal'ai statues stand around the central pit: click them in this order, south, north, south-west, south-east, north-west, north-east (the original game's order, to check in game); the {object:148838} rises, with a chest. The {object:148836} is at the bottom of the central pit, where {npc:8580} waits."] = "Sur l'anneau supérieur, six statues atal'ai entourent la fosse centrale : les cliquer dans cet ordre, sud, nord, sud-ouest, sud-est, nord-ouest, nord-est (l'ordre du jeu d'origine, à vérifier en jeu) ; l'{object:148838} apparaît, avec un coffre. L'{object:148836} est au fond de la fosse centrale, où attend {npc:8580}.",

	-- Step 6: Sunken Temple: the tablets and Jammal'an
	["Sunken Temple: the tablets and Jammal'an"] = "Temple englouti : les tablettes et Jammal'an",
	-- {npc:5710} Jammal'an the Prophet
	-- plural, as words: Atal'ai Tablets = {item:6288} Atal'ai Tablet
	["The Atal'ai Tablets lie in the temple's halls: pick them up as you clear. {npc:5710} waits on the upper level, once the six troll champions of the balconies around the central pit are dead."] = "Les tablettes atal'ai sont dans les salles du temple : les ramasser en avançant. {npc:5710} attend au niveau supérieur, une fois tués les six champions trolls des balcons qui entourent la fosse centrale.",

	-- Step 7: Sunken Temple: the Shade of Eranikus
	-- {npc:5709} Shade of Eranikus
	["Sunken Temple: the {npc:5709}"] = "Temple englouti : {npc:5709}",
	-- {npc:5709} Shade of Eranikus · {item:10454} Essence of Eranikus · {object:148512} Essence Font
	["The {npc:5709} waits at the very end, past the green dragons. He drops the {item:10454}: right-click it, then hand it in at the {object:148512} in his room before leaving."] = "{npc:5709} attend tout au fond, après les dragons verts, et laisse l'{item:10454} : clic droit dessus, puis la rendre au {object:148512}, dans la même salle, avant de partir.",
	-- {item:10454} Essence of Eranikus
	["{item:10454}, a drop"] = "{item:10454}, un butin",

	-- Step 8: Stormwind: Brohann Caskbelly
	-- {zone:1435} Swamp of Sorrows · {zone:1453} Stormwind · {zone:1455} Ironforge
	["Out of the {zone:1435} to Nethergarde Keep, then the flight to {zone:1453}. Last stop of the chapter: the route's own guide comes back once this is handed in; its next stop, {zone:1455}, is a ride on the Deeprun Tram."] = "Sortir du {zone:1435} vers Rempart-du-Néant, puis le vol pour {zone:1453}. Dernier arrêt du chapitre : le guide du parcours revient une fois cette quête rendue ; son arrêt suivant, {zone:1455}, est à un trajet du Tram des profondeurs.",

}
