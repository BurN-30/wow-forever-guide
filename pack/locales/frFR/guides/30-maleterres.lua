-- French (frFR): the guide groupe-alliance/30-maleterres (guides/30-maleterres.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1422} Western Plaguelands · {zone:1423} Eastern Plaguelands · {zone:1444} Feralas
	["Group 28 · {zone:1422}, {zone:1423} & {zone:1444}"] = "Groupe 28 · {zone:1422}, {zone:1423} & {zone:1444}",

	-- Step 1: Chillwind Camp
	["Chillwind Camp"] = "Camp du Noroît",
	["Everyone at their own pace: what you already did ticks itself, the guide picks up where you are. Playing together? Group XP is best within 4 levels."] = "Chacun à son rythme : ce qui est déjà fait se coche tout seul, le guide reprend où vous en êtes. En groupe ? L'XP de groupe est meilleure à 4 niveaux d'écart ou moins.",

	-- Step 2: Sorrow Hill: kill these as you meet them
	["Sorrow Hill: kill these as you meet them"] = "Colline des chagrins : tuez-les au fur et à mesure",
	-- {npc:10411} Eye of Naxxramas
	-- plural, as words: Skeletal Flayers = {npc:1783} Skeletal Flayer · Slavering Ghouls = {npc:1791} Slavering Ghoul · Rockwing Gargoyles = {npc:10408} Rockwing Gargoyle
	["Skeletal Flayers and Slavering Ghouls roam the fields north of the camp; all the Scourge here drop Scourgestones.\nCareful: These undead notice you from far away, and other undead nearby join the fight when one is pulled.\nCareful: The {npc:10411} (3 spawns, 15 min respawn) turns invisible when out of combat and calls in Rockwing Gargoyles once a fight starts."] = "Des Écorcheurs squelettes et des Goules écumantes parcourent les champs au nord du camp ; tout le Fléau ici laisse tomber des Pierres du Fléau.\nAttention : ces morts-vivants vous repèrent de loin, et les autres morts-vivants proches se joignent au combat quand vous en attirez un.\nAttention : l'{npc:10411} (3 apparitions, réapparition en 15 min) devient invisible hors combat et appelle des Gargouilles Aile-de-roc dès qu'un combat commence.",

	-- Step 3: Marlene Redpath
	-- {npc:10927} Marlene Redpath · {npc:10936} Joseph Redpath
	["{npc:10927}'s farmhouse stands on the hill east of the camp; {npc:10936}'s monument is just north of it."] = "La ferme de {npc:10927} se dresse sur la colline à l'est du camp ; le monument de {npc:10936} est juste au nord.",
	["Upstairs"] = "À l'étage",
	-- {item:12894} Joseph's Wedding Ring
	["{item:12894}, at the monument"] = "{item:12894}, au monument",

	-- Step 4: Mulgris Deepriver
	-- {npc:10739} Mulgris Deepriver
	["{npc:10739} stands by the farm at the Writhing Haunt, north-east of the fields."] = "{npc:10739} se tient près de la ferme du Repaire putride, au nord-est des champs.",
	["Inside"] = "À l'intérieur",

	-- Step 5: Dalson's Tears
	["Dalson's Tears"] = "Larmes de Dalson",
	-- {npc:10836} Farmer Dalson
	["Ride north-west to the Dalson farm. The diary lies in the barn; a wandering skeleton carries the outhouse key, and {npc:10836} waits in the outhouse with the cabinet key."] = "Allez au nord-ouest jusqu'à la ferme des Dalson. Le journal est dans la grange ; un squelette errant porte la clé des latrines, et {npc:10836} attend dans les latrines avec la clé de l'armoire.",
	-- {quest:5058} Mrs. Dalson's Diary
	["{quest:5058}, inside"] = "{quest:5058}, à l'intérieur",

	-- Step 6: The Writhing Haunt: kill these as you meet them
	["The Writhing Haunt: kill these as you meet them"] = "Le Repaire putride : tuez-les au fur et à mesure",

	-- Step 7: Dalson's Tears
	-- {object:175924} Locked Cabinet
	["{object:175924}, in the farmhouse; inside"] = "{object:175924}, dans la ferme ; à l'intérieur",

	-- Step 8: Chillwind Camp
	["Ride back south to the camp."] = "Retournez au camp, au sud.",

	-- Step 9: The Andorhal watchtowers
	["The Andorhal watchtowers"] = "Les tours de guet d'Andorhal",
	-- {item:12815} Beacon Torch
	["Use the {item:12815} at the foot of each of the four watchtowers around the edge of Andorhal, north of the camp."] = "Utilisez la {item:12815} au pied de chacune des quatre tours de guet en bordure d'Andorhal, au nord du camp.",
	-- {npc:10902} Andorhal Tower One · {item:12815} Beacon Torch
	["Mark {npc:10902} with the {item:12815}"] = "Marquer {npc:10902} avec la {item:12815}",
	-- {npc:10903} Andorhal Tower Two · {item:12815} Beacon Torch
	["Mark {npc:10903} with the {item:12815}"] = "Marquer {npc:10903} avec la {item:12815}",

	-- Step 10: Chromie
	-- {npc:10667} Chromie
	["{npc:10667} waits in the ruined inn on the west side of Andorhal."] = "{npc:10667} attend dans l'auberge en ruine, à l'ouest d'Andorhal.",

	-- Step 11: Felstone Field cauldron
	["Felstone Field cauldron"] = "Chaudron du Champ de Felstone",
	-- {npc:11075} Cauldron Lord Bilemaw
	["{npc:11075} guards the cauldron in Felstone Field, west of Andorhal."] = "{npc:11075} garde le chaudron du Champ de Felstone, à l'ouest d'Andorhal.",

	-- Step 12: Janice Felstone
	-- {npc:10778} Janice Felstone
	["{npc:10778}'s ghost wanders by the farmhouse of Felstone Field, west of Dalson's Tears; her parcel lies inside."] = "Le fantôme de {npc:10778} erre près de la ferme du Champ de Felstone, à l'ouest des Larmes de Dalson ; son colis se trouve à l'intérieur.",
	-- {object:175894} Janice's Parcel
	["{object:175894}, inside"] = "{object:175894}, à l'intérieur",
	-- {zone:1453} Stormwind
	["For {zone:1453}: keep it"] = "Pour {zone:1453} : gardez-la",

	-- Step 13: The Andorhal watchtowers
	-- {npc:10904} Andorhal Tower Three · {item:12815} Beacon Torch
	["Mark {npc:10904} with the {item:12815}"] = "Marquer {npc:10904} avec la {item:12815}",
	-- {npc:10905} Andorhal Tower Four · {item:12815} Beacon Torch
	["Mark {npc:10905} with the {item:12815}"] = "Marquer {npc:10905} avec la {item:12815}",

	-- Step 14: Chillwind Camp
	-- {npc:1852} Araj the Summoner
	["{npc:1852} is a level 61 elite"] = "{npc:1852} est un élite de niveau 61",

	-- Step 15: Dalson's Tears cauldron
	["Dalson's Tears cauldron"] = "Chaudron des Larmes de Dalson",
	["The cauldron sits at Dalson's Tears, north-east of Felstone; its Cauldron Lord stands beside it."] = "Le chaudron se trouve aux Larmes de Dalson, au nord-est du Champ de Felstone ; son Seigneur du Chaudron se tient à côté.",

	-- Step 16: Andorhal
	["Andorhal"] = "Ruines d'Andorhal",
	-- {item:12627} Temporal Displacer · {quest:5154} The Annals of Darrowshire · {quest:5537} Skeletal Fragments
	-- plural, as words: Temporal Parasites = {npc:10717} Temporal Parasite
	["Use the {item:12627} by the grain silos to draw out Temporal Parasites. {quest:5154} is one of the musty tomes in the town hall. Every skeleton in town drops {quest:5537}."] = "Utilisez le {item:12627} près des silos à grain pour faire sortir les Parasites temporels. {quest:5154} est l'un des vieux tomes de l'hôtel de ville. Tous les squelettes de la ville lâchent des {quest:5537}.",

	-- Step 18: Writhing Haunt cauldron
	["Writhing Haunt cauldron"] = "Chaudron du Repaire putride",
	-- {npc:10739} Mulgris Deepriver
	["The cauldron sits at the Writhing Haunt, by {npc:10739}' farm."] = "Le chaudron se trouve au Repaire putride, près de la ferme de {npc:10739}.",

	-- Step 20: Diseased Grizzlies
	["Diseased Grizzlies"] = "Grizzlys malades",

	-- Step 21: Mulgris Deepriver
	-- {zone:1457} Darnassus
	["For the druids of {zone:1457}: keep it"] = "Pour les druides de {zone:1457} : gardez-la",

	-- Step 24: Chromie
	-- {quest:5210} Brother Carlin
	["{quest:5210}, at Light's Hope Chapel: keep it"] = "{quest:5210}, à la chapelle de l'Espoir de Lumière : gardez-la",

	-- Step 25: Sorrow Hill: kill these as you meet them
	-- {npc:1852} Araj the Summoner
	["{npc:1852} is elite: grouping up is advised. He guards his phylactery in the middle of Andorhal.\nSmall lockboxes lie in the rubble all over Andorhal; each holds a watch.\nCareful: Ghouls and skeletons usually stand next to the boxes and attack when you come close. Searing ghouls also hurt anyone nearby and will break stealth."] = "{npc:1852} est élite : mieux vaut être en groupe. Il garde son phylactère au milieu d'Andorhal.\nDe petits coffrets reposent dans les décombres partout dans Andorhal ; chacun contient une montre.\nAttention : des goules et des squelettes se tiennent souvent près des coffrets et attaquent quand vous approchez. Les goules brûlantes blessent aussi tout ce qui est à proximité et rompent le camouflage.",

	-- Step 27: More watches
	["More watches"] = "Encore des montres",

	-- Step 29: Kirsta Deepshadow
	-- {npc:11610} Kirsta Deepshadow
	["Ride north up the road to the Northridge lumber mill; {npc:11610} hides at the camp's edge."] = "Remontez la route vers le nord jusqu'au Camp de bûcherons de la Crête du nord ; {npc:11610} se cache en bordure du camp.",

	-- Step 30: Scarlet Knight on the way
	-- {npc:1833} Scarlet Knight
	["{npc:1833} on the way"] = "{npc:1833} en chemin",
	-- {npc:1833} Scarlet Knight · {npc:11610} Kirsta Deepshadow
	["{npc:1833} along the way to {npc:11610}"] = "{npc:1833} sur le chemin de {npc:11610}",

	-- Step 31: The Scarlet Crusade
	["The Scarlet Crusade"] = "La Croisade écarlate",
	-- plural, as words: Scarlet Medics = {npc:10605} Scarlet Medic
	["The Scarlet Medics, Hunters, Knights and Mages patrol the lumber camp and the road toward Hearthglen."] = "Les médecins, chasseurs, chevaliers et mages écarlates patrouillent dans le camp de bûcherons et sur la route d'Âtreval.",

	-- Step 33: Radley and Durgen
	["Radley and Durgen"] = "Radley et Durgen",
	-- {npc:11613} Huntsman Radley · {npc:11610} Kirsta Deepshadow · {npc:11611} Cavalier Durgen
	["{npc:11613} walks the Northridge camp east of {npc:11610}; {npc:11611} guards the tower at Hearthglen's southern approach.\nCareful: Guards stand at the tower's base and one more circles it on patrol. Clear them before you engage Durgen so they don't join the fight."] = "{npc:11613} arpente le camp de la Crête du nord, à l'est de {npc:11610} ; {npc:11611} garde la tour à l'approche sud d'Âtreval.\nAttention : des gardes se tiennent au pied de la tour et un autre en fait le tour en patrouille. Éliminez-les avant d'engager Durgen pour qu'ils ne se joignent pas au combat.",

	-- Step 35: Hearthglen overlook
	["Hearthglen overlook"] = "Point de vue sur Âtreval",
	["Climb the hill west of Hearthglen to look down on the town.\nCareful: Sentinels posted at the gate can detect stealthed players. Additional sentinels are found within the town, and an elite walks a patrol route nearby."] = "Grimpez sur la colline à l'ouest d'Âtreval pour observer la ville d'en haut.\nAttention : les sentinelles postées à la porte peuvent détecter les joueurs camouflés. D'autres sentinelles se trouvent dans la ville, et un élite suit une patrouille à proximité.",

	-- Step 37: Tirion Fordring
	-- {npc:1855} Tirion Fordring
	["Ride east to the border river: {npc:1855} lives in a small hut on the bank."] = "Allez à l'est jusqu'à la rivière frontalière : {npc:1855} vit dans une petite cabane sur la rive.",

	-- Step 38: Slab of Carrion Worm Meat on the way
	-- {item:13853} Slab of Carrion Worm Meat
	["{item:13853} on the way"] = "{item:13853} en chemin",

	-- Step 39: Gahrron's Withering cauldron
	["Gahrron's Withering cauldron"] = "Chaudron de la Flétrissure de Gahrron",
	-- {npc:11078} Cauldron Lord Soulwrath
	["Ride south to Gahrron's Withering, where {npc:11078} guards the cauldron."] = "Partez au sud jusqu'à la Flétrissure de Gahrron, où {npc:11078} garde le chaudron.",

	-- Step 40: Chillwind Camp
	["Ride south-west to the camp."] = "Retournez au camp, au sud-ouest.",
	-- {npc:5411} Krinkle Goodsteel
	["{npc:5411} in Gadgetzan: keep it"] = "{npc:5411} à Gadgetzan : gardez-la",

	-- Step 41: Fly to Light's Hope Chapel
	["Fly to Light's Hope Chapel"] = "Envolez-vous vers la chapelle de l'Espoir de Lumière",
	["Chillwind Camp flight master"] = "Maître de vol du Camp du Noroît",

	-- Step 42: Light's Hope Chapel
	["Light's Hope Chapel"] = "Chapelle de l'Espoir de Lumière",

	-- Step 43: Aurora Skycaller
	["Ride north-west to Quel'Lithien Lodge, at the edge of the Plaguewood."] = "Partez au nord-ouest jusqu'au Gîte de Quel'Lithien, à la lisière du Pestebois.",

	-- Step 44: Villains of Darrowshire
	-- plural, as words: Plaguehounds = {npc:8597} Plaguehound
	["Horgus' skull lies at Blackwood Lake and Marduk's sword in the Infectis Scar, each where ghosts fight; grown Plaguehounds hunt the plains between."] = "Le crâne d'Horgus se trouve au Lac de Noirbois et l'épée de Marduk dans la Balafre infecte, chacun là où des fantômes se battent ; des chiens pestiférés adultes chassent dans les plaines entre les deux.",
	-- {item:12956} Skull of Horgus
	["{item:12956}; underwater"] = "{item:12956} ; sous l'eau",

	-- Step 45: Eastern Plaguelands: kill these as you meet them
	-- {zone:1423} Eastern Plaguelands
	["{zone:1423}: kill these as you meet them"] = "{zone:1423} : tuez-les au fur et à mesure",
	-- {item:15042} Empty Termite Jar
	-- plural, as words: Plaguehound Runts = {npc:8596} Plaguehound Runt · Plaguebats = {npc:8600} Plaguebat · Carrion Grubs = {npc:8603} Carrion Grub · Frenzied Plaguehounds = {npc:8598} Frenzied Plaguehound
	["Ride west to Terrordale. Plaguehound Runts, Plaguebats and Carrion Grubs roam its woods; fill the {item:15042} at the big termite mounds and kill the Frenzied Plaguehounds further north."] = "Partez à l'ouest jusqu'à Val-Terreur. Des chiens pestiférés chétifs, des chauves-souris pestiférées et des larves putrides parcourent ses bois ; remplissez le {item:15042} aux grandes termitières et tuez les chiens pestiférés frénétiques plus au nord.",

	-- Step 46: Augustus the Touched
	-- {npc:12384} Augustus the Touched · {npc:11140} Egan
	["Ride north to Terrordale. {npc:12384} lives in the ruined hut, and his receipt book lies in the ruined inn nearby.\n{npc:11140} stands by {npc:12384}' hut in Terrordale."] = "Partez au nord jusqu'à Val-Terreur. {npc:12384} vit dans la cabane en ruine, et son carnet de reçus se trouve dans l'auberge en ruine voisine.\n{npc:11140} se tient près de la cabane de {npc:12384} à Val-Terreur.",

	-- Step 47: Augustus the Touched
	-- {npc:8598} Frenzied Plaguehound
	["{npc:8598}, 170 yd north-east"] = "{npc:8598}, à 170 m au nord-est",

	-- Step 48: Plaguewood: kill these as you meet them
	["Plaguewood: kill these as you meet them"] = "Pestebois : tuez-les au fur et à mesure",

	-- Step 49: Tirion Fordring
	-- {npc:1855} Tirion Fordring
	["Cross the river west to {npc:1855}'s hut."] = "Traversez la rivière vers l'ouest jusqu'à la cabane de {npc:1855}.",

	-- Step 51: Tirion Fordring
	["Listen to his story"] = "Écouter son histoire",
	-- {npc:11886} Mercutio Filthgorger
	["{npc:11886} is elite: grouping up is advised"] = "{npc:11886} est un élite : mieux vaut être en groupe",

	-- Step 52: Davil's Libram
	-- {item:12954} Davil's Libram · {npc:1855} Tirion Fordring
	["{item:12954} lies in the town hall of Hearthglen, west of {npc:1855}: the Scarlet guards stand close together."] = "{item:12954} se trouve dans l'hôtel de ville d'Âtreval, à l'ouest de {npc:1855} : les gardes écarlates s'y tiennent serrés.",
	-- {item:12954} Davil's Libram
	["{item:12954}; inside"] = "{item:12954} ; à l'intérieur",

	-- Step 53: Redpath's Shield
	-- {item:12955} Redpath's Shield
	["{item:12955} lies east of the barn at Gahrron's Withering."] = "{item:12955} se trouve à l'est de la grange de la Flétrissure de Gahrron.",

	-- Step 55: The Undercroft
	["The Undercroft"] = "Le caveau de Zaeldarr",
	-- {object:177667} Torn Scroll · {npc:12248} Infiltrator Hameya
	["Cross the river east to the Undercroft, the crypt in the south-west of the zone. The {object:177667} lies inside: its key is on {npc:12248} in the far north-east, done in the next guide."] = "Traversez la rivière vers l'est jusqu'au caveau de Zaeldarr, la crypte au sud-ouest de la zone. Le {object:177667} se trouve à l'intérieur : sa clé est sur {npc:12248}, tout au nord-est, ce qui se fait dans le guide suivant.",
	-- {object:177667} Torn Scroll
	["{object:177667}, below ground"] = "{object:177667}, sous terre",

	-- Step 57: Fly to Southshore
	["Fly to Southshore"] = "Envolez-vous pour Austrivage",
	["Aerie Peak flight master"] = "Maître de vol de Nid-de-l'Aigle",

	-- Step 59: Fly to Rut'theran Village
	["Fly to Rut'theran Village"] = "Envolez-vous vers le village de Rut'theran",
	["Auberdine flight master"] = "Maître de vol d'Auberdine",

	-- Step 61: The Temple Gardens
	["The Temple Gardens"] = "Les Jardins du temple",
	-- {npc:10878} Herald Moonstalker · {npc:7740} Gracina Spiritmight · {item:11682} Eridan's Vial
	["{npc:10878} and {npc:7740} stand by the Temple of the Moon; fill {item:11682} at the moonwell inside."] = "{npc:10878} et {npc:7740} se tiennent près du temple de la Lune ; remplissez {item:11682} au puits de lune à l'intérieur.",
	-- {npc:7740} Gracina Spiritmight
	["{npc:7740}: keep it for Gadgetzan"] = "{npc:7740} : gardez-la pour Gadgetzan",

	-- Step 62: Darnassus
	-- {zone:1457} Darnassus
	["The portal in Rut'theran Village leads up to {zone:1457}."] = "Le portail de Rut'theran monte vers {zone:1457}.",
	-- {npc:9047} Jenal
	["{npc:9047}, in the Cenarion Enclave"] = "{npc:9047}, dans l'Enclave cénarienne",
	-- {zone:1455} Ironforge
	["{zone:1455}, where the next guide trains, has no druid trainer"] = "{zone:1455}, où le guide suivant passe chez les maîtres, n'a pas de maître druide",
	-- {item:11040} Morrowgrain · {item:11020} Evergreen Pouch
	["Ten {item:11040} from the {item:11020}"] = "Dix {item:11040} tirées de la {item:11020}",
	-- {quest:6762} Rabine Saturna · {zone:1450} Moonglade
	["{quest:6762} in {zone:1450}: keep it"] = "{quest:6762} à {zone:1450} : gardez-la",

	-- Step 63: Portal to Teldrassil
	-- {zone:1438} Teldrassil
	["Portal to {zone:1438}"] = "Portail vers {zone:1438}",

	-- Step 64: Rut'theran Village
	["Rut'theran Village"] = "Village de Rut'theran",
	-- {zone:1452} Winterspring
	["Ranshalla in {zone:1452}: keep it"] = "Ranshalla au {zone:1452} : gardez-la",

	-- Step 65: Feathermoon Stronghold
	-- {object:152576} Feathermoon Stronghold
	["From Rut'theran Village, fly to {object:152576}."] = "Depuis Rut'theran, envolez-vous vers {object:152576}.",
	-- {npc:7900} Angelas Moonbreeze · {zone:1446} Tanaris
	["{npc:7900}: keep it for {zone:1446}"] = "{npc:7900} : gardez-la pour {zone:1446}",

	-- Step 67: Boat to The Forgotten Coast
	["Boat to The Forgotten Coast"] = "Bateau pour la Côte oubliée",

	-- Step 68: Zorbin Fandazzle
	-- {npc:14637} Zorbin Fandazzle · {object:152574} Twin Colossals
	["Take the boat to the mainland and ride north-east to {npc:14637}'s camp by the {object:152574}."] = "Prenez le bateau pour le continent et partez au nord-est jusqu'au camp de {npc:14637}, près de {object:152574}.",

	-- Step 69: The Forgotten Coast: kill these as you meet them
	["The Forgotten Coast: kill these as you meet them"] = "La Côte oubliée : tuez-les au fur et à mesure",
	-- {object:152574} Twin Colossals
	["The shrunken giants roam the {object:152574}; the sea elementals wade along the coast to the west."] = "Les géants rapetissés errent autour de {object:152574} ; les élémentaires marins pataugent le long de la côte à l'ouest.",

	-- Step 71: Gregan Brewspewer
	-- {npc:7775} Gregan Brewspewer · {object:152574} Twin Colossals · {item:11243} Videre Elixir
	["{npc:7775}'s camp lies north of the {object:152574}. He sells the {item:11243} once he has his bait."] = "Le camp de {npc:7775} se trouve au nord de {object:152574}. Il vend le {item:11243} une fois qu'il a son appât.",

	-- Step 73: Fly to Theramore
	["Fly to Theramore"] = "Volez jusqu'à Theramore",
	["Thalanaar flight master"] = "Maître de vol de Thalanaar",

	-- Step 75: Ratchet
	["Ratchet"] = "Cabestan",
	-- {zone:1413} The Barrens
	["From Theramore, ride west into the {zone:1413} and north up the coast to Ratchet."] = "Depuis Theramore, partez à l'ouest dans {zone:1413} puis au nord le long de la côte jusqu'à Cabestan.",
	-- {npc:5901} Islen Waterseer
	["{npc:5901}, on the coast north of town"] = "{npc:5901}, sur la côte au nord de la ville",
	-- {zone:1448} Felwood
	["For {zone:1448}: keep it"] = "Pour {zone:1448} : gardez-la",
	-- {npc:8496} Liv Rizzlefix
	["{npc:8496}: keep it for Un'Goro; inside"] = "{npc:8496} : gardez-la pour Un'Goro ; à l'intérieur",

	-- Step 76: Fly to Everlook
	["Fly to Everlook"] = "Envolez-vous vers Long-Guet",
	["Ratchet flight master"] = "Maître de vol de Cabestan",

	-- Step 78: Donova Snowden
	["Ride west along the road to the hot springs."] = "Suivez la route vers l'ouest jusqu'aux sources chaudes.",
	-- {npc:9299} Gaeriyan
	["{npc:9299} in Gadgetzan: keep it"] = "{npc:9299} à Gadgetzan : gardez-la",

	-- Step 80: Rabine Saturna
	-- {zone:1450} Moonglade
	["Walk into Timbermaw Hold and take the {zone:1450} branch of the tunnel to Nighthaven."] = "Entrez dans le Repaire des Grumegueules et prenez la branche du tunnel vers {zone:1450} jusqu'à Havrenuit.",
	-- {zone:1451} Silithus
	["For {zone:1451}: keep it"] = "Pour {zone:1451} : gardez-la",

	-- Step 81: Fly to Gadgetzan
	["Fly to Gadgetzan"] = "Envolez-vous pour Gadgetzan",

	-- Step 82: Gadgetzan
	["Gadgetzan"] = "Gadgetzan",
	-- {npc:5594} Alchemist Pestlezugg
	["{npc:5594}, inside"] = "{npc:5594}, à l'intérieur",
	-- {npc:7583} Sprinkle
	["On {npc:7583}"] = "Sur {npc:7583}",
	["For Chillwind Camp: keep it"] = "Pour le Camp du Noroît : gardez-la",

	-- Step 83: Gaeriyan
	-- {npc:9299} Gaeriyan
	["{npc:9299} waits at the graveyard just east of town; the gravestone stands nearby."] = "{npc:9299} attend au cimetière juste à l'est de la ville ; la pierre tombale se trouve à proximité.",

	-- Step 84: Broken Pillar
	["Broken Pillar"] = "Pilier brisé",
	-- {npc:7771} Marvon Rivetseeker
	["Ride south-west to {npc:7771}'s camp at the Broken Pillar."] = "Partez au sud-ouest jusqu'au camp de {npc:7771}, au Pilier brisé.",
	-- {quest:3444} The Stone Circle
	["{quest:3444} is in Ratchet"] = "{quest:3444} se trouve à Cabestan",

	-- Step 86: Fly to Marshal's Refuge
	["Fly to Marshal's Refuge"] = "Envolez-vous vers le Refuge des Marshal",
	["Gadgetzan flight master"] = "Maître de vol de Gadgetzan",

	-- Step 87: Linken
	-- {npc:8737} Linken · {npc:9997} Spraggle Frock · {npc:9999} Ringo
	["Fly from Gadgetzan to Marshal's Refuge. {npc:8737}'s hut stands at the Lakkari Tar Pits, west of the refuge; J.D.\n{npc:9997}'s friend {npc:9999} has gone missing."] = "Envolez-vous de Gadgetzan au Refuge des Marshal. La cabane de {npc:8737} se dresse aux Fosses de goudron de Lakkari, à l'ouest du refuge ; J.D.\n{npc:9999}, l'ami de {npc:9997}, a disparu.",
	-- {npc:9997} Spraggle Frock
	["The wooden sign beside {npc:9997}"] = "Le panneau en bois à côté de {npc:9997}",

	-- Step 89: Cenarion Hold
	["Cenarion Hold"] = "Fort cénarien",
	-- {zone:1451} Silithus · {npc:15189} Beetix Ficklespragg
	["Ride out of the crater's north-western pass into {zone:1451} and on to Cenarion Hold. {npc:15189} stands upstairs in his building: go up inside, the arrow cannot tell the floors apart."] = "Sortez du cratère par le col nord-ouest pour entrer en {zone:1451} et continuez jusqu'au Fort cénarien. {npc:15189} se tient à l'étage de son bâtiment : montez par l'intérieur, la flèche ne distingue pas les étages.",

	-- Step 90: Silithus: kill these as you meet them
	-- {zone:1451} Silithus
	["{zone:1451}: kill these as you meet them"] = "{zone:1451} : tuez-les au fur et à mesure",
	-- plural, as words: Dredge Strikers = {npc:11740} Dredge Striker · Stonelash Scorpids = {npc:11735} Stonelash Scorpid · Sand Skitterers = {npc:11738} Sand Skitterer
	["Dredge Strikers dig in the dunes north-west of the hold; Stonelash Scorpids and Sand Skitterers roam all around."] = "Les Frappeurs térébrants creusent les dunes au nord-ouest du fort ; les Scorpides Cinglepierre et les Glisseuses du sable rôdent tout autour.",

	-- Step 91: Level 56.89
	["Level 56.89"] = "Niveau 56.89",
	-- {item:9328} Super Snapper FX
	["If you skipped The {item:9328}, grind here to level 56.89 to stay on the route's plan."] = "Si vous avez sauté la quête du {item:9328}, tuez des monstres ici jusqu'au niveau 56.89 pour rester dans le plan de la route.",
	-- {npc:11740} Dredge Striker
	["grind on {npc:11740}"] = "tuez en boucle : {npc:11740}",

	-- Step 92: Cenarion Hold
	-- {npc:15189} Beetix Ficklespragg
	["Follow the road south-west out of the pass to Cenarion Hold. {npc:15189} stands upstairs in his building: go up inside, the arrow cannot tell the floors apart."] = "Suivez la route vers le sud-ouest à la sortie du col jusqu'au Fort cénarien. {npc:15189} se tient à l'étage de son bâtiment : montez par l'intérieur, la flèche ne distingue pas les étages.",
	-- {npc:17082} Rifleman Torrig
	["{npc:17082}, at the Alliance tents"] = "{npc:17082}, aux tentes de l'Alliance",

	-- Step 93: Silithus: kill these as you meet them
	-- plural, as words: Dredge Crushers = {npc:11741} Dredge Crusher · Stonelash Pincers = {npc:11736} Stonelash Pincer · Rock Stalkers = {npc:11739} Rock Stalker
	["Dredge Crushers dig further west; Stonelash Pincers, Flayers and Rock Stalkers hunt the same sands."] = "Les Écraseurs térébrants creusent plus à l'ouest ; les Pinceurs Cinglepierre, Écorcheurs Cinglepierre et Traqueuses des rochers chassent sur les mêmes sables.",
	-- {npc:11741} Dredge Crusher
	["{npc:11741} walks around here: look inside the circle on the map"] = "{npc:11741} se promène par ici : cherchez dans le cercle sur la carte",

	-- Step 94: Layo Starstrike
	-- {npc:13220} Layo Starstrike
	["Ride east to {npc:13220}."] = "Chevauchez vers l'est jusqu'à {npc:13220}.",

	-- Step 95: Southwind Village
	["Southwind Village"] = "Village de Sudevent",
	-- {npc:13220} Layo Starstrike
	["The tortured druids and sentinels haunt the ruined village south-west of {npc:13220}."] = "Les Druides torturés et les Sentinelles torturées hantent le village en ruine au sud-ouest de {npc:13220}.",

	-- Step 97: The Hive'Ashi tower
	["The Hive'Ashi tower"] = "La tour de la Ruche'Ashi",
	["Ride east to the Hive'Ashi tower in Southwind Village; climb it and kill the ambushers that rise for the encrusted object."] = "Partez à l'est jusqu'à la tour de la Ruche'Ashi au Village de Sudevent ; grimpez-y et tuez les embusqués qui surgissent pour l'objet incrusté.",

	-- Step 98: Layo Starstrike
	-- {zone:1450} Moonglade
	["Umber in {zone:1450}: keep it"] = "Umber à {zone:1450} : gardez-la",

	-- Step 100: Un'Goro Crater: kill these as you meet them
	-- {zone:1449} Un'Goro Crater
	["{zone:1449}: kill these as you meet them"] = "{zone:1449} : tuez-les au fur et à mesure",

	-- Step 101: Krakle
	-- {npc:10302} Krakle
	["Ride west past Marshal's Refuge and south down the western side to Golakka Hot Springs: {npc:10302} the goblin sits by the water."] = "Partez à l'ouest au-delà du Refuge des Marshal puis au sud par le côté ouest jusqu'aux Sources de Golakka : {npc:10302} le gobelin est assis au bord de l'eau.",

	-- Step 102: Krakle's Thermometer
	-- {npc:10541} Krakle's Thermometer
	["Ride east to Fire Plume Ridge, climb it and use {npc:10541} at the lava vents near the top."] = "Partez à l'est jusqu'à la Crête de la Fournaise, grimpez-y et utilisez {npc:10541} aux bouches de lave près du sommet.",

	-- Step 103: Krakle
	-- {npc:9298} Donova Snowden · {zone:1452} Winterspring
	["Ends with {npc:9298} in {zone:1452}: keep it"] = "Se termine auprès de {npc:9298} au {zone:1452} : gardez-la",

	-- Step 104: Super Sticky Tar on the way
	-- {item:11834} Super Sticky Tar
	["{item:11834} on the way"] = "{item:11834} en chemin",

	-- Step 105: Northern Pylon
	["Northern Pylon"] = "Le Pylône nord",

	-- Step 106: J.D. Collie
	["Collie is up the hill behind it."] = "Collie est en haut de la colline derrière.",
	-- {npc:9117} J.D. Collie
	["{npc:9117}, below ground"] = "{npc:9117}, sous terre",

	-- Step 107: Marshal's Refuge
	["Marshal's Refuge"] = "Refuge des Marshal",

	-- Step 108: The crater
	["The crater"] = "Le cratère",
	-- {item:11018} Un'Goro Soil
	-- plural, as words: Tar Beasts = {npc:6517} Tar Beast · Gorishi Workers = {npc:6552} Gorishi Worker
	["Tar Beasts wallow in the Lakkari Tar Pits; the fire elementals of Fire Plume Ridge in the middle carry the ash; the Gorishi wasps of the Slithering Scar in the south carry the gland. Every creature in the crater can drop {item:11018}.\nCareful: Gorishi Workers that drop below 45% health have a 50% chance to call for help from allies within 25 yd."] = "Les bêtes du goudron se vautrent dans les Fosses de goudron de Lakkari ; les élémentaires de feu de la Crête de la Fournaise, au centre, portent les cendres ; les guêpes Gorishi de la Balafre sinueuse, au sud, portent les glandes. Toutes les créatures du cratère peuvent laisser tomber {item:11018}.\nAttention : les ouvriers Gorishi qui passent sous 45 % de vie ont 50 % de chances d'appeler à l'aide leurs alliés à moins de 25 m.",

	-- Step 110: Torwa Pathfinder
	-- {npc:9619} Torwa Pathfinder
	["Ride down the ramp into the crater: {npc:9619} camps at its foot."] = "Descendez la rampe dans le cratère : {npc:9619} campe à son pied.",
	["The pelts come after loop 2, on the gorilla plateau"] = "Les peaux viennent après la boucle 2, sur le plateau des gorilles",

	-- Step 111: Lakkari Tar Pits: kill these as you meet them
	["Lakkari Tar Pits: kill these as you meet them"] = "Fosses de goudron de Lakkari : tuez-les au fur et à mesure",
	-- {npc:9619} Torwa Pathfinder · {npc:9622} U'cha
	-- plural, as words: Un'Goro Gorillas = {npc:6514} Un'Goro Gorilla
	["The gorillas live on Ironstone Plateau, east of Marshal's Refuge. Keep their pelts for {npc:9619}. Stay out of the deepest cave: {npc:9622} is level 55.\nCareful: Un'Goro Gorillas (level 50-51) call for help from allies within 20 yd once they drop to 25% health. There is a cave full of apes in the area, and fighting there brings many adds."] = "Les gorilles vivent sur le Plateau de Rochefer, à l'est du Refuge des Marshal. Gardez leurs peaux pour {npc:9619}. N'entrez pas dans la grotte la plus profonde : {npc:9622} est de niveau 55.\nAttention : les gorilles d'Un'Goro (niveau 50-51) appellent à l'aide leurs alliés à moins de 20 m dès qu'ils tombent à 25 % de vie. Une grotte pleine de singes se trouve dans la zone, et y combattre attire de nombreux renforts.",
	-- {item:11478} Un'Goro Gorilla Pelt
	["{item:11478}; below ground"] = "{item:11478} ; sous terre",
	-- {item:11479} Un'Goro Stomper Pelt
	["{item:11479}; below ground"] = "{item:11479} ; sous terre",
	-- {item:11480} Un'Goro Thunderer Pelt
	["{item:11480}; below ground"] = "{item:11480} ; sous terre",

	-- Step 113: U'cha
	-- {npc:9622} U'cha
	["Ride north along the east side to the gorilla plateau. {npc:9622}, a level 55 gorilla, sits in its deepest cave: clear the gorillas at the cave mouth first."] = "Chevauchez vers le nord par le côté est jusqu'au plateau des gorilles. {npc:9622}, un gorille de niveau 55, se tient dans sa grotte la plus profonde : éliminez d'abord les gorilles de l'entrée.",
	["Below ground"] = "Sous terre",

	-- Step 114: Lar'korwi
	-- {npc:9684} Lar'korwi · {npc:9619} Torwa Pathfinder · {item:11568} Torwa's Pouch
	["{npc:9684}'s lair lies in the jungle north of {npc:9619}, below the eastern cliffs: use {item:11568} there. {npc:9684} is level 56: start at full health."] = "Le repaire de {npc:9684} se trouve dans la jungle au nord de {npc:9619}, sous les falaises est : utilisez-y la {item:11568}. {npc:9684} est de niveau 56 : commencez avec toute votre vie.",

	-- Step 115: Torwa Pathfinder
	-- {npc:9619} Torwa Pathfinder
	["Cross the south of the crater to {npc:9619} by the ramp."] = "Traversez le sud du cratère jusqu'à {npc:9619}, près de la rampe.",

	-- Step 116: The Marshlands: kill these as you meet them
	["The Marshlands: kill these as you meet them"] = "La Fondrière : tuez-les au fur et à mesure",

	-- Step 117: Ringo
	-- {npc:9999} Ringo
	["{npc:9999} sits on the south-east slope of Fire Plume Ridge, in the middle of the crater."] = "{npc:9999} est assis sur le versant sud-est de la Crête de la Fournaise, au centre du cratère.",

	-- Step 118: Escort Ringo
	-- {npc:9999} Ringo
	["Escort {npc:9999}"] = "Escorter {npc:9999}",
	-- {npc:9999} Ringo · {item:11804} Spraggle's Canteen
	["Lead {npc:9999} north to Marshal's Refuge. When he faints, use {item:11804} on him to wake him."] = "Escortez {npc:9999} au nord jusqu'au Refuge des Marshal. Quand il s'évanouit, utilisez {item:11804} sur lui pour le réveiller.",
}
