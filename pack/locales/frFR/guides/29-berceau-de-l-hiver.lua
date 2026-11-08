-- French (frFR): the guide groupe-alliance/29-berceau-de-l-hiver (guides/29-berceau-de-l-hiver.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1452} Winterspring · {zone:1423} Eastern Plaguelands
	["Group 27 · {zone:1452} & {zone:1423}"] = "Groupe 27 · {zone:1452} & {zone:1423}",

	-- Step 1: Into Winterspring
	-- {zone:1452} Winterspring
	["Into {zone:1452}"] = "Entrer dans {zone:1452}",
	["Everyone at their own pace: what you already did ticks itself, the guide picks up where you are. Playing together? Group XP is best within 4 levels."] = "Chacun à son rythme : ce qui est déjà fait se coche tout seul, le guide reprend où vous en êtes. En groupe ? L'XP de groupe est meilleure à 4 niveaux d'écart ou moins.",

	-- Step 3: Everlook
	["Everlook"] = "Long-Guet",
	-- {npc:11118} Innkeeper Vizzie
	["{npc:11118}: bind your hearthstone here"] = "{npc:11118} : liez votre pierre de foyer ici",
	-- {npc:11629} Jessica Redpath
	["{npc:11629}: keep it for Darrowshire; inside"] = "{npc:11629} : gardez-la pour Comté-de-Darrow ; à l'intérieur",
	-- {npc:10431} Gregor Greystone
	["{npc:10431}: keep both for the Plaguelands; inside"] = "{npc:10431} : gardez les deux pour les Maleterres ; à l'intérieur",
	-- {npc:11754} Meggi Peppinrocker
	["{npc:11754} walks around Everlook: look inside the circle on the map"] = "{npc:11754} se promène dans Long-Guet : cherchez dans le cercle sur la carte",
	-- {item:12383} Moontouched Feather
	["{item:12383}, 110 yd north"] = "{item:12383}, à 110 mètres au nord",

	-- Step 5: Ice Thistle Hills: kill these as you meet them
	["Ice Thistle Hills: kill these as you meet them"] = "Collines des Chardons de glace : tuez-les au fur et à mesure",
	-- plural, as words: Chillwind Chimaeras = {npc:7448} Chillwind Chimaera
	["Ice Thistle yetis live in the hills south of Winterfall Village, Chillwind Chimaeras in the valley toward Everlook."] = "Les yétis Chardon de glace vivent dans les collines au sud du Village Tombe-hiver, les chimères Noroît dans la vallée vers Long-Guet.",

	-- Step 6: The Ruins of Kel'Theril
	-- {object:177132} Starfall Village
	-- plural, as words: Moontouched Feathers = {item:12383} Moontouched Feather
	["The ruins lie around the frozen lake south of {object:177132}. Pick up the four relic fragments lying in the ruins and the Moontouched Feathers on the ground where the wildkin roam."] = "Les ruines entourent le lac gelé au sud de {object:177132}. Ramassez les quatre fragments de relique qui traînent dans les ruines et les plumes de Chouettard lunaire au sol, là où rôdent les Indomptables.",

	-- Step 7: Donova Snowden
	-- {npc:9298} Donova Snowden
	["Follow the road west to {npc:9298}'s camp beside the hot springs."] = "Suivez la route vers l'ouest jusqu'au camp de {npc:9298} Snowden, près des sources chaudes.",
	-- {zone:1444} Feralas
	["Keep it: Gregan in {zone:1444} brews the elixir later"] = "Gardez-le : Gregan Brewspewer, en {zone:1444}, prépare l'élixir plus tard",

	-- Step 8: Salfa
	-- {npc:11556} Salfa · {npc:9298} Donova Snowden
	["{npc:11556} guards the mouth of Timbermaw Hold, north-west of {npc:9298}."] = "{npc:11556} garde l'entrée du Repaire des Grumegueules, au nord-ouest de {npc:9298}.",

	-- Step 9: On the way
	["On the way"] = "En chemin",

	-- Step 10: On the way
	-- {npc:7442} Winterfall Pathfinder · {npc:9298} Donova Snowden
	["{npc:7442} along the way to {npc:9298}"] = "{npc:7442} sur le chemin de {npc:9298}",
	-- {npc:7440} Winterfall Den Watcher · {npc:9298} Donova Snowden
	["{npc:7440} along the way to {npc:9298}"] = "{npc:7440} sur le chemin de {npc:9298}",
	-- {npc:7441} Winterfall Totemic · {npc:9298} Donova Snowden
	["{npc:7441} along the way to {npc:9298}"] = "{npc:7441} sur le chemin de {npc:9298}",

	-- Step 11: Frostfire Hot Springs: kill these as you meet them
	["Frostfire Hot Springs: kill these as you meet them"] = "Sources de Givrefeu : tuez-les au fur et à mesure",
	-- {npc:11556} Salfa · {npc:9298} Donova Snowden · {item:12771} Empty Firewater Flask · {quest:8471} Winterfall Ritual Totem · {quest:6031} Runecloth
	["The western Winterfall camp sits in the hills between {npc:11556} and {npc:9298}. Any furbolg here can drop an {item:12771} (about one in ten) and, rarely, a {quest:8471}: right-click whichever drops. Keep the {quest:6031} the furbolgs drop for Meilosh."] = "Le camp Tombe-hiver de l'ouest est dans les collines entre {npc:11556} et {npc:9298} Snowden. Chaque furbolg ici peut laisser {item:12771} (environ une fois sur dix) et, rarement, {quest:8471} : faites un clic droit sur ce qui tombe. Gardez {quest:6031} laissé par les furbolgs pour Meilosh.",
	-- {item:12771} Empty Firewater Flask
	["{item:12771}, a rare drop"] = "{item:12771}, butin rare",
	-- {quest:6031} Runecloth
	["{quest:6031}, for Meilosh later"] = "{quest:6031}, pour Meilosh plus tard",
	-- {quest:8471} Winterfall Ritual Totem
	["{quest:8471}, a rare drop"] = "{quest:8471}, butin rare",
	["For Kernda in Timbermaw Hold: keep it"] = "Pour Kernda, au Repaire des Grumegueules : gardez-la",

	-- Step 12: Donova Snowden
	-- {zone:1448} Felwood
	["The Deadwood cauldron in {zone:1448}: keep it"] = "Le Chaudron des Mort-bois en {zone:1448} : gardez-la",

	-- Step 13: Level 55.05
	["Level 55.05"] = "Niveau 55.05",
	["Top up here to level 55.05 before the hand-ins at Everlook: they take you to level 56."] = "Montez ici jusqu'au niveau 55.05 avant les rendus à Long-Guet : ils vous amènent au niveau 56.",
	-- {npc:11552} Timbermaw Mystic
	["grind on {npc:11552}"] = "tuez en boucle : {npc:11552}",

	-- Step 15: Winterfall Village
	["Winterfall Village"] = "Village Tombe-hiver",
	-- {npc:10738} High Chief Winterfall
	["The Winterfall furbolg village lies east of Everlook: Shaman (56-57), Den Watchers (55-56) and Ursa (57-58), all above you. Kill the Shaman first, they heal, and pull from the edge. {npc:10738} in the cave at the back is elite: stay out."] = "Le village des furbolgs Tombe-hiver se trouve à l'est de Long-Guet : chamans (56-57), protecteurs (55-56) et ursas (57-58), tous au-dessus de votre niveau. Tuez d'abord les chamans, ils soignent, et attirez depuis la bordure. {npc:10738}, dans la grotte du fond, est un élite : n'y allez pas.",

	-- Step 16: Optional: Sunken Temple
	["Optional: Sunken Temple"] = "Facultatif : Temple englouti",
	["Short of level 54 after the yetis? Running the Sunken Temple (50-54) instead of grinding gets you there faster in a group. Come back to Everlook afterwards."] = "Pas encore niveau 54 après les yétis ? En groupe, faire le Temple englouti (50-54) vous y amène plus vite que de tuer des monstres en boucle. Revenez ensuite à Long-Guet.",

	-- Step 17: Pristine Yeti Horns
	-- plural, as words: Pristine Yeti Horns = {item:12367} Pristine Yeti Horn
	["Pristine Yeti Horns"] = "Cornes de yéti en parfait état",
	-- plural, as words: Ice Thistle Matriarchs = {npc:7459} Ice Thistle Matriarch
	["Back to the hills: only the Ice Thistle Matriarchs and Patriarchs carry the horns. Keep killing yetis until level 54: Harlo's wildkin quests are red before that."] = "Retour aux collines : seuls les matriarches et patriarches Chardon de glace portent les cornes. Continuez à tuer des yétis jusqu'au niveau 54 : les quêtes d'Indomptables de Harlo sont rouges avant cela.",

	-- Step 18: Everlook
	-- {npc:10978} Legacki
	["On {npc:10978}, by the inn"] = "Sur {npc:10978}, près de l'auberge",
	-- {npc:10978} Legacki · {npc:7583} Sprinkle · {npc:10977} Quixxil
	["{npc:10978}: {npc:7583} and {npc:10977} come later"] = "{npc:10978} : {npc:7583} et {npc:10977} viennent plus tard",

	-- Step 19: Jaron Stoneshaper's camp
	-- {npc:10301} Jaron Stoneshaper
	["{npc:10301}'s camp"] = "Camp de {npc:10301}",
	-- {npc:10301} Jaron Stoneshaper
	["Ride south-east down the valley to {npc:10301}'s damaged crate in the snow at Mazthoril, with his wrecked wagon just east of it."] = "Descendez la vallée vers le sud-est jusqu'à la caisse endommagée de {npc:10301}, dans la neige à Mazthoril, avec son chariot détruit juste à l'est.",

	-- Step 20: Jaron Stoneshaper's supplies
	-- {npc:10301} Jaron Stoneshaper
	["{npc:10301}'s supplies"] = "Fournitures de {npc:10301}",
	-- {npc:10301} Jaron Stoneshaper
	["Pick up the supplies around the wagon and take {npc:10301}'s amulet back from the owlbeasts nearby."] = "Ramassez les fournitures autour du chariot et reprenez l'amulette de {npc:10301} aux chouettards voisins.",

	-- Step 22: Starfall Village
	["Ride north-west back to the village."] = "Retournez au village au nord-ouest.",

	-- Step 24: Fly to Theramore
	["Fly to Theramore"] = "Volez jusqu'à Theramore",
	["Everlook flight master"] = "Maître de vol de Long-Guet",

	-- Step 25: Boat to Menethil Harbor
	-- {object:1162} Menethil Harbor
	["Boat to {object:1162}"] = "Bateau pour {object:1162}",

	-- Step 26: Fly to Southshore
	["Fly to Southshore"] = "Envolez-vous pour Austrivage",
	-- {object:1162} Menethil Harbor
	["{object:1162} flight master"] = "Maître de vol de {object:1162}",

	-- Step 28: Chillwind Camp
	["Chillwind Camp"] = "Camp du Noroît",
	["From Southshore, ride north up the road through Alterac to Chillwind Camp."] = "Depuis Austrivage, remontez la route vers le nord à travers les montagnes d'Alterac jusqu'au Camp du Noroît.",
	-- {npc:11616} Nathaniel Dumah
	["{npc:11616}: the termites come later, in Terrordale"] = "{npc:11616} : les termites viendront plus tard, à Val-Terreur",

	-- Step 29: Into Eastern Plaguelands
	-- {zone:1423} Eastern Plaguelands
	["Into {zone:1423}"] = "Entrer dans {zone:1423}",

	-- Step 31: Pamela Redpath
	-- {zone:1423} Eastern Plaguelands · {npc:10926} Pamela Redpath
	["Follow the southern road east into the {zone:1423}; the ruins of Darrowshire lie south of it. {npc:10926}'s ghost plays by the ruined house at the south end."] = "Suivez la route du sud vers l'est pour entrer dans {zone:1423} ; les ruines de Comté-de-Darrow se trouvent au sud. Le fantôme de {npc:10926} joue près de la maison en ruine, à l'extrémité sud.",

	-- Step 32: Pamela Redpath's doll
	-- {npc:10926} Pamela Redpath
	["{npc:10926}'s doll"] = "Poupée de {npc:10926}",
	["The three pieces of the doll lie in the ruined houses of Darrowshire; picking one up can call out ghosts. Combine them into the doll."] = "Les trois morceaux de la poupée sont dans les maisons en ruine de Comté-de-Darrow ; en ramasser un peut faire surgir des fantômes. Combinez-les pour former la poupée.",
	-- {item:12886} Pamela's Doll's Head
	["{item:12886}; inside"] = "{item:12886} ; à l'intérieur",
	-- {item:12888} Pamela's Doll's Right Side
	["{item:12888}; inside"] = "{item:12888} ; à l'intérieur",

	-- Step 33: Pamela Redpath
	-- {quest:5152} Auntie Marlene · {zone:1422} Western Plaguelands
	["{quest:5152}, in the {zone:1422}: keep it"] = "{quest:5152}, dans {zone:1422} : gardez-la",

	-- Step 34: Light's Hope Chapel
	["Light's Hope Chapel"] = "Chapelle de l'Espoir de Lumière",
	["Follow the road east across the zone to the chapel."] = "Suivez la route vers l'est à travers la zone jusqu'à la Chapelle de l'Espoir de Lumière.",
	-- {npc:11038} Caretaker Alen · {npc:12250} Zaeldarr the Outcast
	["{npc:11038}: {npc:12250} is a level 54 elite"] = "{npc:11038} : {npc:12250} est un élite de niveau 54",

	-- Step 35: Light's Hope Chapel
	-- {npc:11038} Caretaker Alen
	["{npc:11038}, by the graves south of the chapel"] = "{npc:11038}, près des tombes au sud de la chapelle",

	-- Step 36: Corin's Crossing
	-- {object:176970} Corin's Crossing
	-- plural, as words: Darrowshire Spirits = {npc:11064} Darrowshire Spirit
	["The Scourge around {object:176970}, west of the chapel, drop both kinds of Scourgestone; Darrowshire Spirits rise from them: talk to each one to free it."] = "Le Fléau autour de {object:176970}, à l'ouest de la chapelle, laisse tomber les deux sortes de pierres du Fléau ; des esprits de Darrowshire s'en élèvent : parlez à chacun pour le libérer.",
	-- plural, as words: Darrowshire Spirits = {npc:11064} Darrowshire Spirit
	["Free Darrowshire Spirits: talk to them"] = "Libérer les esprits de Darrowshire : parlez-leur",

	-- Step 38: The Undercroft
	["The Undercroft"] = "Le caveau de Zaeldarr",
	-- {npc:12250} Zaeldarr the Outcast
	["{npc:12250} is elite: grouping up is advised. He waits at the bottom of the Undercroft, the crypt in the south-west of the zone."] = "{npc:12250} est un élite : il est conseillé de se grouper. Il attend au fond du caveau de Zaeldarr, la crypte au sud-ouest de la zone.",
	-- {item:15785} Zaeldarr's Head
	["{item:15785}; below ground"] = "{item:15785} ; sous terre",

	-- Step 39: Browman Mill: kill these as you meet them
	["Browman Mill: kill these as you meet them"] = "Scierie de Browman : tuez-les au fur et à mesure",
	-- {npc:10411} Eye of Naxxramas
	-- plural, as words: Rockwing Gargoyles = {npc:10408} Rockwing Gargoyle
	["Careful: {npc:10411} goes invisible when out of combat and calls Rockwing Gargoyles once a fight starts. Only 3 exist and they respawn every 15 min."] = "Attention : {npc:10411} devient invisible hors combat et appelle des Gargouilles Aile-de-roc dès qu'un combat commence. Il n'en existe que 3 et ils réapparaissent toutes les 15 min.",

	-- Step 40: Light's Hope Chapel
	["The next guide starts here and flies to Chillwind Camp."] = "Le guide suivant commence ici et s'envole vers le Camp du Noroît.",

	-- No longer in the guide (its English changed or it went away): reuse or delete.
	-- ["{npc:11118}: the last guide binds here, so this usually ticks at once"] = "{npc:11118} : le guide précédent vous lie ici, cette étape se coche donc généralement aussitôt",
}
