-- French (frFR): the guide groupe-alliance/28-gangrebois (guides/28-gangrebois.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1448} Felwood
	["Group 26 · {zone:1448}"] = "Groupe 26 · {zone:1448}",

	-- Step 1: Fly to Astranaar
	["Fly to Astranaar"] = "Envolez-vous vers Astranaar",
	["Everyone at their own pace: what you already did ticks itself, the guide picks up where you are. Playing together? Group XP is best within 4 levels."] = "Chacun à son rythme : ce qui est déjà fait se coche tout seul, le guide reprend où vous en êtes. En groupe ? L'XP de groupe est meilleure à 4 niveaux d'écart ou moins.",
	["Rut'theran Village flight master"] = "Maître de vol du village de Rut'theran",

	-- Step 3: The Emerald Sanctuary
	["The Emerald Sanctuary"] = "Sanctuaire d'émeraude",
	-- {npc:9528} Arathandris Silversky · {npc:11554} Grazle
	["{npc:9528}, in the ruins just east of {npc:11554}"] = "{npc:9528}, dans les ruines juste à l'est de {npc:11554}",
	-- {npc:9116} Eridan Bluewind
	["{npc:9116}, inside"] = "{npc:9116}, à l'intérieur",

	-- Step 4: Grazle
	-- {zone:1448} Felwood · {npc:11554} Grazle
	["Ride north out of Astranaar into {zone:1448}. {npc:11554} the furbolg stands by the road just south of the Emerald Sanctuary."] = "Partez vers le nord depuis Astranaar pour entrer dans {zone:1448}. {npc:11554} le furbolg se tient au bord de la route, juste au sud du Sanctuaire d'émeraude.",

	-- Step 5: Deadwood Village
	["Deadwood Village"] = "Village des Mort-bois",
	-- {npc:11554} Grazle
	-- plural, as words: Deadwood Headdress Feathers = {item:21377} Deadwood Headdress Feather
	["The Deadwood furbolgs live in the village just south-west of {npc:11554}; keep the Deadwood Headdress Feathers they drop."] = "Les furbolgs Mort-bois vivent dans le village juste au sud-ouest de {npc:11554} ; gardez les Coiffures de plumes mort-bois qu'ils laissent tomber.",

	-- Step 6: Level 52.58
	["Level 52.58"] = "Niveau 52.58",
	-- {item:9328} Super Snapper FX
	["If you skipped The Horn of the Beast or The {item:9328}, grind here to level 52.58 to stay on the route's plan."] = "Si vous avez passé La corne de la bête ou {item:9328}, tuez des monstres ici jusqu'au niveau 52.58 pour suivre le plan de l'itinéraire.",
	-- {npc:7153} Deadwood Warrior
	["grind on {npc:7153}"] = "tuez en boucle : {npc:7153}",

	-- Step 7: Grazle
	-- {npc:15395} Nafien · {zone:1448} Felwood
	["{npc:15395} waits at the north end of {zone:1448}"] = "{npc:15395} attend à l'extrémité nord de {zone:1448}",
	["Five feathers buy a little Timbermaw reputation"] = "Cinq plumes rapportent un peu de réputation Grumegueule",

	-- Step 8: Level 52.69
	["Level 52.69"] = "Niveau 52.69",
	["Top up here to level 52.69 before the hand-ins at Jaedenar: they take you to level 53."] = "Montez ici jusqu'au niveau 52.69 avant les rendus de Jaedenar : ils vous amènent au niveau 53.",
	-- {npc:7155} Deadwood Pathfinder
	["grind on {npc:7155}"] = "tuez en boucle : {npc:7155}",

	-- Step 9: Jadefire Glen
	["Jadefire Glen"] = "Vallon des Jadefeu",
	-- {npc:9454} Xavathras
	-- plural, as words: Jadefire Shadowstalkers = {npc:7110} Jadefire Shadowstalker
	["The Jadefire satyrs hold the glen west of the road, with {npc:9454} at its back.\nCareful: Jadefire Shadowstalkers (level 51-52) use Sneak and Slowing Poison and are stealthed, so they often join fights uninvited."] = "Les satyres Jadefeu tiennent le vallon à l'ouest de la route, avec {npc:9454} au fond.\nAttention : les traqueurs des ombres Jadefeu (niveau 51-52) utilisent Sneak et Slowing Poison et sont camouflés, si bien qu'ils se joignent souvent aux combats sans y être invités.",
	-- {npc:7109} Jadefire Felsworn
	["grind on {npc:7109}"] = "tuez en boucle : {npc:7109}",

	-- Step 10: Ruins of Constellas
	["Ruins of Constellas"] = "Ruines de Constellas",

	-- Step 11: Jaedenar
	["Jaedenar"] = "Jaedenar",
	-- {item:13140} Blood Red Key · {npc:11018} Arko'narin
	["Jaedenar is the ruined temple north of the glen. Some of its cultists drop a {item:13140}, about one kill in thirty: it opens {npc:11018}'s cell in Shadow Hold, the cave at the back. If it drops, clear the way out before you free her; if not, skip her quests."] = "Jaedenar est le temple en ruine au nord du vallon. Certains de ses cultistes laissent tomber {item:13140}, environ une fois sur trente : il ouvre la cellule de {npc:11018} dans le Fort des ombres, la grotte du fond. S'il tombe, dégagez la sortie avant de la libérer ; sinon, passez ses quêtes.",
	-- {item:13140} Blood Red Key
	["{item:13140}, a rare drop"] = "{item:13140}, butin rare",
	-- {npc:11016} Captured Arko'narin
	["{npc:11016}, in Shadow Hold; below ground"] = "{npc:11016}, dans le Fort des ombres ; sous terre",
	-- {npc:7125} Jaedenar Hound
	["grind on {npc:7125}"] = "tuez en boucle : {npc:7125}",

	-- Step 12: Jaedenar
	["Keep her alive until she is out of the cave"] = "Gardez-la en vie jusqu'à sa sortie de la grotte",

	-- Step 13: Level 52.9
	["Level 52.9"] = "Niveau 52.9",
	["Top up here to level 52.9 before the hand-ins at Emerald Sanctuary: they take you to level 53."] = "Montez ici jusqu'au niveau 52.9 avant les rendus au Sanctuaire d'émeraude : ils vous amènent au niveau 53.",

	-- Step 15: Shatter Scar Vale
	["Shatter Scar Vale"] = "Val Grêlé",
	-- plural, as words: Entropic Beasts = {npc:9878} Entropic Beast
	["Follow the road north to the cratered vale and walk to each crater, killing the Entropic Beasts and Horrors between them."] = "Suivez la route vers le nord jusqu'au val criblé de cratères et rendez-vous à chaque cratère, en tuant les Bêtes d'entropie et les Horreurs entre eux.",
	["First crater"] = "Premier cratère",
	["Second crater"] = "Deuxième cratère",
	["Third crater"] = "Troisième cratère",

	-- Step 16: Irontree Woods
	["Irontree Woods"] = "Bois d'Arbrefer",
	-- {item:11503} Blood Amber
	["The Warpwood treants of Irontree Woods, east of Jadefire Run, carry the {item:11503}."] = "Les tréants Crochebois du Bois d'Arbrefer, à l'est du Défilé des Jadefeu, portent {item:11503}.",
	["Below ground"] = "Sous terre",

	-- Step 17: Nafien
	-- {npc:15395} Nafien
	["Follow the road north to the cave mouth of Timbermaw Hold; {npc:15395} guards it."] = "Suivez la route vers le nord jusqu'à l'entrée de la grotte du Repaire des Grumegueules ; {npc:15395} la garde.",

	-- Step 18: Felpaw Village
	["Felpaw Village"] = "Village de Gangrepatte",
	-- {quest:8470} Deadwood Ritual Totem
	["The Deadwood furbolgs of Felpaw Village fill the hills west of the cave. The Avengers can drop a {quest:8470}.\nCareful: Den Watchers are level 53-54; they call nearby allies within 25 yd once below 50% health and run off for help below 15%."] = "Les furbolgs Mort-bois du Village de Gangrepatte occupent les collines à l'ouest de la grotte. Les vengeurs peuvent laisser tomber {quest:8470}.\nAttention : les protecteurs sont de niveau 53-54 ; sous 50 % de vie, ils appellent les alliés à moins de 25 mètres, et sous 15 % ils s'enfuient chercher de l'aide.",

	-- Step 19: Nafien
	-- {zone:1452} Winterspring
	["Salfa stands at the {zone:1452} end of the tunnel: keep it"] = "Salfa se tient à l'extrémité du tunnel côté {zone:1452} : gardez-la",

	-- Step 20: Felpaw Village
	-- {quest:8470} Deadwood Ritual Totem
	["{quest:8470}, a rare drop"] = "{quest:8470}, butin rare",

	-- Step 22: Timbermaw Hold
	["Timbermaw Hold"] = "Repaire des Grumegueules",
	-- {npc:11558} Kernda · {npc:11557} Meilosh
	["Step into the cave: {npc:11558} and {npc:11557} stand just inside."] = "Entrez dans la grotte : {npc:11558} et {npc:11557} se tiennent juste à l'intérieur.",
	-- {npc:11558} Kernda
	["{npc:11558}: the Timbermaw speak to you only from Neutral; walks around here: look inside the circle on the map"] = "{npc:11558} : les Grumegueules ne vous parlent qu'à partir de Neutre ; patrouille par ici : regardez dans le cercle sur la carte",
	-- {npc:11557} Meilosh · {quest:6031} Runecloth
	["{npc:11557}: thirty {quest:6031}, handed in when you pass through again at 57; below ground"] = "{npc:11557} : trente {quest:6031}, à rendre quand vous repasserez au niveau 57 ; sous terre",

	-- Step 23: Jadefire Run: kill these as you meet them
	["Jadefire Run: kill these as you meet them"] = "Défilé des Jadefeu : tuez-les au fur et à mesure",
	-- {npc:10648} Xavaric · {quest:939} Flute of Xavaric · {item:11674} Jadefire Felbind
	["Jadefire Run is the satyr valley in the north-west, with {npc:10648} at its far end. He drops the {quest:939}; every Jadefire satyr can drop {item:11674}."] = "Le Défilé des Jadefeu est la vallée des satyres au nord-ouest, avec {npc:10648} tout au fond. Il laisse tomber {quest:939} ; chaque satyre Jadefeu peut laisser tomber {item:11674}.",

	-- Step 24: Jaedenar again
	["Jaedenar again"] = "Retour à Jaedenar",
	-- {item:12922} Empty Canteen · {npc:11018} Arko'narin · {npc:9518} Rakaiah
	["Use the {item:12922} at the corrupted moonwell in the middle of Jaedenar. If you freed {npc:11018}, go back into Shadow Hold for the succubus {npc:9518}."] = "Utilisez {item:12922} au puits de lune corrompu au centre de Jaedenar. Si vous avez libéré {npc:11018}, retournez dans le Fort des ombres pour la succube {npc:9518}.",

	-- Step 25: Oozes
	["Oozes"] = "Limons",
	-- plural, as words: Tainted Oozes = {npc:7092} Tainted Ooze
	["The Cursed and Tainted Oozes slide about the streams and fel pools around Jaedenar and Bloodvenom Falls: kill them and use Laris's Empty Ooze Jars on their remains."] = "Les limons maudits et les limons corrompus glissent le long des ruisseaux et des bassins gangrenés autour de Jaedenar et des Chutes de la Vénéneuse : tuez-les et utilisez les pots vides de Laris sur leurs restes.",

	-- Step 26: Jaedenar again
	["Trey Lightforge's remains lie beside her."] = "Les restes de Trey Lightforge gisent à côté d'elle.",
	-- {npc:9518} Rakaiah
	["{npc:9518}, below ground"] = "{npc:9518}, sous terre",
	-- {npc:11020} Remains of Trey Lightforge
	["{npc:11020}, below ground"] = "{npc:11020}, sous terre",

	-- Step 28: The Emerald Sanctuary
	-- {zone:1448} Felwood
	["Ride south-east from Jaedenar to the Emerald Sanctuary, the druids' camp by the road in southern {zone:1448}."] = "Partez vers le sud-est depuis Jaedenar jusqu'au Sanctuaire d'émeraude, le camp des druides au bord de la route, dans le sud de {zone:1448}.",

	-- Step 29: The Emerald Sanctuary
	-- {zone:1457} Darnassus
	["The vial is filled in {zone:1457}: keep it; inside"] = "La fiole se remplit à {zone:1457} : gardez-la ; à l'intérieur",
	-- {zone:1413} Barrens
	["Ends in the {zone:1413}: keep it"] = "Se termine dans {zone:1413} : gardez-la",
}
