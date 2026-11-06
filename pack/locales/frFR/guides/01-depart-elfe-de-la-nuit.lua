-- French (frFR): the guide groupe-alliance/01-depart-elfe-de-la-nuit (guides/01-depart-elfe-de-la-nuit.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {quest:940} Teldrassil
	["Start · Night Elf: {quest:940}"] = "Départ · Elfe de la nuit : {quest:940}",

	-- Step 1: Aldrassil
	["Aldrassil"] = "Aldrassil",
	["You start at the foot of Aldrassil, the great tree of Shadowglen."] = "Vous commencez au pied d'Aldrassil, le grand arbre de Sombrevallon.",
	-- {npc:2077} Melithar Staghelm
	["{npc:2077}, by the path"] = "{npc:2077}, près du chemin",
	-- {npc:1992} Tarindrella
	["{npc:1992}, south of the tree"] = "{npc:1992}, au sud de l'arbre",

	-- Step 2: Young Thistle Boar on the way
	-- {npc:1984} Young Thistle Boar
	["{npc:1984} on the way"] = "{npc:1984} en chemin",
	-- {npc:1984} Young Thistle Boar
	["{npc:1984} along the way to Back at Aldrassil"] = "{npc:1984} en chemin vers le retour à Aldrassil",

	-- Step 3: Shadowglen: kill these as you meet them
	["Shadowglen: kill these as you meet them"] = "Sombrevallon : tuez-les au passage",
	-- {item:3297} Fel Moss
	-- plural, as words: Young Nightsabers = {npc:2031} Young Nightsaber · Young Thistle Boars = {npc:1984} Young Thistle Boar · Gnarlpine Totems = {item:279082} Gnarlpine Totem
	["Young Nightsabers and Young Thistle Boars roam around Aldrassil. Grells carry {item:3297} in the woods west of the tree, where the Gnarlpine Totems stand."] = "Les jeunes sabres-de-nuit et les jeunes sangliers des chardons rôdent autour d'Aldrassil. Les grells portent la {item:3297} dans les bois à l'ouest de l'arbre, là où se dressent les totems Pin-tordu.",

	-- Step 4: Back at Aldrassil
	["Back at Aldrassil"] = "Retour à Aldrassil",
	-- {npc:3593} Alyissia
	["{npc:3593}, the warrior trainer; inside"] = "{npc:3593}, la maîtresse des guerriers ; à l'intérieur",
	-- {npc:2079} Conservator Ilthalaine · {npc:3596} Ayanna Everstride
	["{npc:2079}: a sigil for {npc:3596}"] = "{npc:2079} : un sceau pour {npc:3596}",
	-- {npc:3596} Ayanna Everstride
	["{npc:3596}, the hunter trainer"] = "{npc:3596}, la maîtresse des chasseurs",
	-- {npc:3594} Frahun Shadewhisper
	["{npc:3594}, the rogue trainer"] = "{npc:3594}, le maître des voleurs",
	-- {npc:3595} Shanda
	["{npc:3595}, the priest trainer: in at the tree's front entrance and up the ramp"] = "{npc:3595}, la maîtresse des prêtres : entrez par l'entrée principale de l'arbre et montez la rampe",
	-- {npc:3597} Mardant Strongoak
	["{npc:3597}, the druid trainer at Aldrassil"] = "{npc:3597}, le maître des druides d'Aldrassil",
	-- {npc:2082} Gilshalan Windwalker
	["{npc:2082}, on the tree's ramp"] = "{npc:2082}, sur la rampe de l'arbre",
	-- {npc:3595} Shanda
	["{npc:3595}: in at the tree's front entrance and up the ramp; upstairs"] = "{npc:3595} : entrez par l'entrée principale de l'arbre et montez la rampe ; à l'étage",
	-- {quest:97979} The Goddess Provides · {npc:3595} Shanda
	["{quest:97979}: cast Elune's Light and Shadowmeld, then hand it back to {npc:3595}"] = "{quest:97979} : lancez Lumière d'Élune et Camouflage dans l'ombre, puis rendez la quête à {npc:3595}",
	-- {npc:8583} Dirania Silvershine
	["{npc:8583}, east of the tree"] = "{npc:8583}, à l'est de l'arbre",

	-- Step 5: North to Shadowthread Cave
	["North to Shadowthread Cave"] = "Au nord, vers la grotte de Tissombre",
	-- {npc:1994} Githyiss the Vile
	-- plural, as words: Mangy Nightsabers = {npc:2032} Mangy Nightsaber · Thistle Boars = {npc:1985} Thistle Boar
	["Mangy Nightsabers and Thistle Boars roam north of Aldrassil, on the way to the cave. {npc:1994} sits deep inside."] = "Les sabres-de-nuit galeux et les sangliers des chardons rôdent au nord d'Aldrassil, sur le chemin de la grotte. {npc:1994} se tient tout au fond.",

	-- Step 7: North to Shadowthread Cave
	-- {npc:8584} Iverron
	["{npc:8584} waits in the trees west of the cave mouth."] = "{npc:8584} attend dans les arbres à l'ouest de l'entrée de la grotte.",
	-- plural, as words: Webwood Spiders = {npc:1986} Webwood Spider
	["Webwood Spiders; below ground"] = "Araignées Tissebois ; sous terre",

	-- Step 9: Moonpetal Lily on the way
	-- {item:10641} Moonpetal Lily
	["{item:10641} on the way"] = "{item:10641} en chemin",

	-- Step 10: Hyacinth Mushroom on the way
	-- {item:10639} Hyacinth Mushroom
	["{item:10639} on the way"] = "{item:10639} en chemin",
	-- {item:10639} Hyacinth Mushroom
	["{item:10639} along the way to Aldrassil"] = "{item:10639} en chemin vers Aldrassil",

	-- Step 11: Webwood Egg and the antidote
	-- {quest:917} Webwood Egg
	["{quest:917} and the antidote"] = "{quest:917} et l'antidote",
	-- {object:4406} Webwood Eggs
	-- plural, as words: Hyacinth Mushrooms = {item:10639} Hyacinth Mushroom
	["The {object:4406} lie at the back of Shadowthread Cave: take the central path, then left where it splits, up to the high ledge. Hyacinth Mushrooms drop from Grells, Moonpetal Lilies grow by the ponds north of Aldrassil."] = "Les {object:4406} sont au fond de la grotte de Tissombre : prenez le chemin central, puis à gauche à l'embranchement, jusqu'à la corniche en hauteur. Les grells lâchent les champignons jacinthe, les lys pétale-de-lune poussent près des mares au nord d'Aldrassil.",

	-- Step 12: Shadowthread Cave
	["Shadowthread Cave"] = "Grotte de Tissombre",

	-- Step 13: Shadowglen
	["Shadowglen"] = "Sombrevallon",
	["Below ground"] = "Sous terre",
	-- {quest:97236} Fang of Githyiss
	["{quest:97236}; below ground"] = "{quest:97236} ; sous terre",

	-- Step 14: Aldrassil
	-- {npc:3514} Tenaron Stormgrip
	["{npc:3514}, at the top of the tree"] = "{npc:3514}, au sommet de l'arbre",

	-- Step 15: The moonwell and Iverron
	-- {npc:8584} Iverron
	["The moonwell and {npc:8584}"] = "Le puits de lune et {npc:8584}",
	["The moonwell sits north of Aldrassil."] = "Le puits de lune se trouve au nord d'Aldrassil.",
	-- {item:5185} Crystal Phial
	["Use the {item:5185} at the moonwell"] = "Utilisez la {item:5185} au puits de lune",

	-- Step 16: Tenaron Stormgrip
	-- {object:654846} Lost Journal
	["Back to the top of Aldrassil. The {object:654846} lies beside him."] = "Retour au sommet d'Aldrassil. Le {object:654846} est posé à côté de lui.",
	["Upstairs"] = "À l'étage",
	-- {object:654846} Lost Journal
	["{object:654846}, upstairs"] = "{object:654846}, à l'étage",

	-- Step 17: The moonwell and Iverron
	-- {npc:8584} Iverron · {quest:3522} Iverron's Antidote
	["{npc:8584} is a little further north-west. {quest:3522} lasts five minutes: fill the phial and go straight on to him."] = "{npc:8584} est un peu plus au nord-ouest. {quest:3522} dure cinq minutes : remplissez la fiole et allez directement le voir.",

	-- Step 18: Porthannius
	-- {npc:6780} Porthannius
	["Leave Shadowglen by the path south-east of Aldrassil: {npc:6780} stands beside it, where it goes down towards the road to Dolanaar."] = "Quittez Sombrevallon par le chemin au sud-est d'Aldrassil : {npc:6780} se tient au bord, là où il descend vers la route de Dolanaar.",

	-- Step 19: Zenn Foulhoof
	-- {npc:2150} Zenn Foulhoof
	["Follow the road south-west out of Shadowglen. {npc:2150} sits beside it just east of Dolanaar."] = "Suivez la route vers le sud-ouest en sortant de Sombrevallon. {npc:2150} est assis au bord, juste à l'est de Dolanaar.",

	-- Step 20: Dolanaar
	["Dolanaar"] = "Dolanaar",
	-- {npc:265811} Lyreena Duskblade
	["{npc:265811}, by the campfire"] = "{npc:265811}, près du feu de camp",

	-- Step 21: The Great Outdoors
	-- {npc:265811} Lyreena Duskblade
	["/sit by {npc:265811}'s campfire until you get Boosted Rest"] = "/asseoir près du feu de camp de {npc:265811} jusqu'à obtenir le repos renforcé (Boosted Rest)",
	-- {npc:6286} Zarrin
	["{npc:6286}, south of the inn: Camping 101 asks you to learn it"] = "{npc:6286}, au sud de l'auberge : Camping 101 vous demande de l'apprendre",

	-- Step 22: Dolanaar
	-- {npc:3515} Corithras Moonrage
	["{npc:3515}, south of the inn"] = "{npc:3515}, au sud de l'auberge",
	-- {npc:3608} Aldia
	["{npc:3608}, upstairs"] = "{npc:3608}, à l'étage",
	-- {npc:3567} Tallonkai Swiftroot
	["{npc:3567}, upstairs"] = "{npc:3567}, à l'étage",
	-- {npc:3600} Laurna Morninglight
	["{npc:3600}, inside"] = "{npc:3600}, à l'intérieur",

	-- Step 23: Dolanaar
	-- {npc:2151} Moon Priestess Amara
	["{npc:2151} patrols the road west of the village: if she isn't at the arrow, follow the road until you meet her."] = "{npc:2151} patrouille sur la route à l'ouest du village : si elle n'est pas à la flèche, suivez la route jusqu'à la croiser.",
	-- {npc:2151} Moon Priestess Amara
	["{npc:2151}, on the road west of the village"] = "{npc:2151}, sur la route à l'ouest du village",

	-- Step 24: Teldrassil: kill these as you meet them
	-- {quest:940} Teldrassil
	["{quest:940}: kill these as you meet them"] = "{quest:940} : tuez-les au passage",
	-- {object:12352} Starbreeze Village
	-- plural, as words: Nightsabers = {npc:2042} Nightsaber · Strigid Owls = {npc:1995} Strigid Owl · Webwood Lurkers = {npc:1998} Webwood Lurker
	["Nightsabers, Strigid Owls and Webwood Lurkers roam all around Dolanaar and along the road east; the lurkers also drop the recipe's spider legs. The moonwell is at the west edge of {object:12352}."] = "Les sabres-de-nuit, chouettes strigides et rôdeuses de Tisse-bois rôdent tout autour de Dolanaar et le long de la route vers l'est ; les rôdeuses lâchent aussi les pattes d'araignée de la recette. Le puits de lune est à l'ouest de {object:12352}.",
	-- plural, as words: Nightsabers = {npc:2042} Nightsaber
	["Nightsabers"] = "Sabres-de-nuit sauvages",
	-- plural, as words: Webwood Lurkers = {npc:1998} Webwood Lurker
	["Webwood Lurkers"] = "Rôdeuses Tissebois",

	-- Step 25: Zenn Foulhoof
	-- {npc:2150} Zenn Foulhoof
	["North from the lake to {npc:2150}, on the road back to Dolanaar."] = "Au nord du lac jusqu'à {npc:2150}, sur la route du retour à Dolanaar.",

	-- Step 26: Starbreeze Village
	-- {npc:2107} Gaerolas Talvethren · {object:126158} Tallonkai's Dresser
	["{npc:2107} stands in the village, east of the moonwell. {object:126158} is in the house on the hill at the east end of the village."] = "{npc:2107} se tient dans le village, à l'est du puits de lune. {object:126158} se trouve dans la maison sur la colline, à l'extrémité est du village.",
	-- {item:5619} Jade Phial
	["Use the {item:5619} at the moonwell"] = "Utilisez la {item:5619} au puits de lune",
	-- {object:126158} Tallonkai's Dresser
	["{object:126158}; inside"] = "{object:126158} ; à l'intérieur",

	-- Step 27: Lake Al'Ameth
	["Lake Al'Ameth"] = "Lac Al'Ameth",
	-- {npc:2150} Zenn Foulhoof · {npc:2080} Denalan · {quest:919} Timberling Sprouts
	-- plural, as words: Lasher Sproutlings = {npc:275703} Lasher Sproutling
	["South-west of Starbreeze, south of {npc:2150}. {npc:2080} tends his saplings on the shore; Lasher Sproutlings and Timberlings wander around him, and the {quest:919} grow among them."] = "Au sud-ouest de Brise-d'étoiles, au sud de {npc:2150}. {npc:2080} soigne ses jeunes arbres sur la rive ; des Jeunes pousses de flagellant et des Sylvains errent autour de lui, et les {quest:919} poussent parmi eux.",
	-- {npc:2080} Denalan · {quest:922} Rellian Greenspyre · {zone:1457} Darnassus
	["{npc:2080}: {quest:922} in {zone:1457} takes it"] = "{npc:2080} : {quest:922} à {zone:1457} la prend",

	-- Step 31: Fel Rock's mouth
	["Fel Rock's mouth"] = "Entrée de Gangreroche (Fel Rock)",
	["Fel Rock"] = "Gangreroche (Fel Rock)",

	-- Step 32: Fel Rock
	-- {npc:2038} Lord Melenas
	["{npc:2038} waits inside the cave, at the bottom or up on the ledge; keep to the right."] = "{npc:2038} attend dans la grotte, en bas ou en haut sur la corniche ; gardez la droite.",
	-- {npc:2038} Lord Melenas
	["{npc:2038}; below ground"] = "{npc:2038} ; sous terre",

	-- Step 33: The road to Darnassus
	-- {zone:1457} Darnassus
	["The road to {zone:1457}"] = "La route de {zone:1457}",
	-- plural, as words: Gnarlpine Ambushers = {npc:2152} Gnarlpine Ambusher
	["Gnarlpine Ambushers hide along the road west of Fel Rock."] = "Les embusqués Pin-tordu se cachent le long de la route à l'ouest de Gangreroche.",

	-- Step 34: Ban'ethil Barrow Den
	["Ban'ethil Barrow Den"] = "Antre du tertre de Ban'ethil",
	-- {npc:275744} Sentinel Lynessa Duskblossom · {npc:7317} Oben Rageclaw
	["The barrow is south of the road. {npc:275744} is held inside, {npc:7317} sleeps in its depths, and the four relic chests sit in the lower rooms."] = "Le refuge se trouve au sud de la route. {npc:275744} y est retenue, {npc:7317} dort dans ses profondeurs, et les quatre coffres à reliques se trouvent dans les salles inférieures.",
	-- {npc:7317} Oben Rageclaw
	["{npc:7317}, below ground"] = "{npc:7317}, sous terre",
	-- plural, as words: Gnarlpine Shamans = {npc:2009} Gnarlpine Shaman
	["Gnarlpine Shamans"] = "Chamans Pin-tordu",
	-- {npc:7318} Rageclaw
	["{npc:7318}, in the den; walks around Ban'ethil Hollow: look inside the circle on the map"] = "{npc:7318}, dans l'antre ; patrouille dans le creux de Ban'ethil : regardez dans le cercle sur la carte",

	-- Step 35: Escaping Ban'ethil
	-- {npc:275744} Sentinel Lynessa Duskblossom · {npc:2081} Sentinel Kyra Starsong
	["Escort {npc:275744} out of the barrow; {npc:2081} in Dolanaar takes the report."] = "Escortez {npc:275744} hors du tertre ; {npc:2081}, à Dolanaar, reçoit le rapport.",
	["Walk Lynessa out and keep her alive"] = "Accompagnez Lynessa dehors et gardez-la en vie",
	["Ban'ethil Hollow, outside the barrow"] = "Creux de Ban'ethil, devant le tertre",

	-- Step 36: The Pools of Arlithrien
	["The Pools of Arlithrien"] = "Les bassins d'Arlithrien",
	["South-west of the barrow. The moonwell sits by the pools."] = "Au sud-ouest du refuge. Le puits de lune se trouve près des bassins.",
	-- {item:5621} Tourmaline Phial
	["Use the {item:5621} at the moonwell"] = "Utilisez la {item:5621} au puits de lune",

	-- Step 37: Gnarlpine Hold
	["Gnarlpine Hold"] = "Repaire des Pin-tordu",
	-- {object:6751} Strange Fruited Plant
	["South of the pools. The {object:6751} grows by the Hold."] = "Au sud des bassins. La {object:6751} pousse près du Camp des Pins-tordus.",

	-- Step 38: Hearth to Dolanaar
	["Hearth to Dolanaar"] = "Pierre de foyer vers Dolanaar",

	-- Step 40: Seek Redemption!
	-- {npc:2150} Zenn Foulhoof · {npc:7234} Ferocitas the Dream Eater
	-- plural, as words: Fel Cones = {item:3418} Fel Cone
	["Fel Cones lie under the trees all around Dolanaar and {npc:2150}: pick them up on the road east and hand them to {npc:2150} on the way to {npc:7234}."] = "Les gangrecônes sont au pied des arbres tout autour de Dolanaar et de {npc:2150} : ramassez-les sur la route de l'est et donnez-les à {npc:2150} en allant vers {npc:7234}.",

	-- Step 41: Ferocitas the Dream Eater
	-- {npc:7234} Ferocitas the Dream Eater · {object:12352} Starbreeze Village · {item:8049} Gnarlpine Necklace
	-- plural, as words: Gnarlpine Mystics = {npc:7235} Gnarlpine Mystic
	["Gnarlpine Mystics and {npc:7234} camp north-east of {object:12352}. {npc:7234} drops the {item:8049}: open it for the jewel.\nCareful: {npc:7234} waits near the camp fire with mystics around him, so pulling him without adds is hard."] = "Les mystiques Pin-tordu et {npc:7234} campent au nord-est de {object:12352}. {npc:7234} lâche le {item:8049} : ouvrez-le pour avoir le joyau.\nAttention : {npc:7234} attend près du feu entouré de mystiques, il est difficile de l'attirer seul.",

	-- Step 42: The Oracle Glade
	-- {object:6752} Strange Fronded Plant
	["The moonwell is in the middle of the glade. The {object:6752} grows at its north end."] = "Le puits de lune se trouve au milieu de la clairière. La {object:6752} pousse à son extrémité nord.",
	-- {npc:3519} Sentinel Arynia Cloudsbreak
	["{npc:3519}, by the moonwell"] = "{npc:3519}, près du puits de lune",

	-- Step 43: Bloodfeather harpies
	["Bloodfeather harpies"] = "Harpies Plumesang",
	["The Bloodfeather harpies nest on the slopes west and north of the glade.\nCareful: The harpies stand packed together, so extra ones often join a fight. Casters are mixed in among them."] = "Les harpies Plumesang nichent sur les pentes à l'ouest et au nord de la clairière.\nAttention : les harpies se tiennent serrées, alors d'autres se joignent souvent au combat. Des lanceuses de sorts sont mêlées à elles.",

	-- Step 44: Sentinel Arynia Cloudsbreak
	["Back to the moonwell."] = "Retour au puits de lune.",

	-- Step 45: The named harpies
	["The named harpies"] = "Les harpies nommées",
	-- {npc:272034} Hatescreech · {npc:272044} Windmistress Gaedress · {npc:272046} Witchmother Arysa
	["{npc:272034} and {npc:272044} fly just west of the moonwell, {npc:272046} further north."] = "{npc:272034} et {npc:272044} volent juste à l'ouest du puits de lune, {npc:272046} plus au nord.",

	-- Step 46: The Oracle Glade
	-- {item:18152} Amethyst Phial
	["Use the {item:18152} at the moonwell"] = "Utilisez la {item:18152} au puits de lune",

	-- Step 47: Sentinel Arynia again
	["Sentinel Arynia again"] = "De nouveau la sentinelle Arynia",
	-- {object:673378} Oracle Tree Bark
	["{object:673378}, just west of the moonwell"] = "{object:673378}, juste à l'ouest du puits de lune",
	-- {object:673378} Oracle Tree Bark · {zone:1457} Darnassus
	["the same {object:673378}: Fandral in {zone:1457} takes it"] = "le même {object:673378} : Fandral, à {zone:1457}, le prend",

	-- Step 48: Ursal the Mauler
	-- {npc:2039} Ursal the Mauler
	["Walk south along the west side of the island. {npc:2039} prowls the far south, below the Pools of Arlithrien.\nCareful: Gnarlpine of roughly level 9-12 crowd the camp and sit close together, so it is easy to pull several at once. Take them on singly before you engage {npc:2039}."] = "Descendez vers le sud par la côte ouest de l'île. {npc:2039} rôde tout au sud, sous les bassins d'Arlithrien.\nAttention : des Pin-tordu de niveau 9 à 12 environ remplissent le camp, serrés les uns contre les autres, il est facile d'en attirer plusieurs. Éliminez-les un par un avant d'attaquer {npc:2039}.",

	-- Step 49: Dolanaar
	-- {npc:2039} Ursal the Mauler
	["North-east from {npc:2039}'s den, back to Dolanaar."] = "Au nord-est depuis l'antre de {npc:2039}, retour à Dolanaar.",
	-- {npc:6094} Byancie
	["{npc:6094}, inside"] = "{npc:6094}, à l'intérieur",
	-- {item:3371} Empty Vial · {npc:3614} Narret Shadowgrove · {npc:6094} Byancie
	["{item:3371} from {npc:3614}, beside {npc:6094}"] = "{item:3371} chez {npc:3614}, à côté de {npc:6094}",
	-- {npc:3600} Laurna Morninglight · {npc:11401} Priestess Alathea · {zone:1457} Darnassus
	["{npc:3600}: {npc:11401} in {zone:1457} takes it"] = "{npc:3600} : {npc:11401} à {zone:1457} la prend",
	-- {item:159} Refreshing Spring Water · {npc:6736} Innkeeper Keldamyr · {npc:6094} Byancie
	["{item:159} from {npc:6736}, for {npc:6094}"] = "{item:159} chez {npc:6736}, pour {npc:6094}",
	-- {zone:1457} Darnassus
	["Fandral in {zone:1457} takes it"] = "Fandral à {zone:1457} la prend",
	-- {npc:3602} Kal · {npc:4217} Mathrengyl Bearwalker · {zone:1457} Darnassus
	["{npc:3602}: {npc:4217} in {zone:1457} takes it"] = "{npc:3602} : {npc:4217} à {zone:1457} la prend",
	-- {npc:3598} Kyra Windblade · {quest:1684} Elanaria · {zone:1457} Darnassus
	["{npc:3598}, the warrior trainer: {quest:1684} in {zone:1457} takes it"] = "{npc:3598}, la maîtresse des guerriers : {quest:1684}, à {zone:1457}, la prend",

	-- Step 50: Lake Al'Ameth
	-- {npc:2080} Denalan
	-- plural, as words: Lasher Sproutlings = {npc:275703} Lasher Sproutling
	["South-east of Dolanaar, to {npc:2080}. Lasher Sproutlings wander around him on the shore."] = "Au sud-est de Dolanaar, vers {npc:2080}. Les Jeunes pousses de flagellant errent autour de lui sur la rive.",
	-- {object:7510} Sprouted Frond
	["{object:7510}, beside him"] = "{object:7510}, à côté de lui",

	-- Step 51: Dolanaar again
	["Dolanaar again"] = "De nouveau Dolanaar",

	-- Step 52: Dolanaar
	-- {item:8049} Gnarlpine Necklace · {npc:7234} Ferocitas the Dream Eater
	["{item:8049}, from {npc:7234}"] = "{item:8049}, sur {npc:7234}",
	-- {npc:3567} Tallonkai Swiftroot
	["{npc:3567}, back in Dolanaar; upstairs"] = "{npc:3567}, de retour à Dolanaar ; à l'étage",

	-- Step 53: Dolanaar again
	-- {npc:6094} Byancie · {item:159} Refreshing Spring Water · {npc:6736} Innkeeper Keldamyr
	["{npc:6094} takes a {item:159} with the fronds and the vial: if you drank yours, buy another from {npc:6736} in this inn before you hand in."] = "{npc:6094} prend une {item:159} avec les frondes et la fiole : si vous avez bu la vôtre, achetez-en une autre à {npc:6736} dans cette auberge avant de rendre la quête.",

	-- Step 54: Taming the Beast
	-- {item:15908} Taming Rod
	-- plural, as words: Webwood Lurkers = {npc:1998} Webwood Lurker · Nightsaber Stalkers = {npc:2043} Nightsaber Stalker · Strigid Screechers = {npc:1996} Strigid Screecher
	["Each of Dazalar's quests hands you a {item:15908}: use it on the beast he names, then bring the rod back to him in Dolanaar. Webwood Lurkers creep around the village, Nightsaber Stalkers and Strigid Screechers roam the woods south of it."] = "Chaque quête de Dazalar donne un {item:15908} : utilisez-le sur la bête indiquée, puis rapportez-le-lui à Dolanaar. Les rôdeuses de Tisse-bois rampent autour du village, les traqueurs sabre-de-nuit et les chouettes strigides hurlantes parcourent les bois au sud.",
	-- {npc:1998} Webwood Lurker · {item:15908} Taming Rod
	["{npc:1998}: tame it with the {item:15908}"] = "{npc:1998} : apprivoisez-la avec le {item:15908}",
	-- {npc:1998} Webwood Lurker
	["Tame {npc:1998}"] = "Apprivoiser : {npc:1998}",
	-- {npc:2043} Nightsaber Stalker · {item:15908} Taming Rod
	["{npc:2043}: tame it with the {item:15908}"] = "{npc:2043} : apprivoisez-le avec le {item:15908}",
	-- {npc:2043} Nightsaber Stalker
	["Tame {npc:2043}"] = "Apprivoiser : {npc:2043}",
	-- {npc:1996} Strigid Screecher · {item:15908} Taming Rod
	["{npc:1996}: tame it with the {item:15908}"] = "{npc:1996} : apprivoisez-le avec le {item:15908}",
	-- {npc:1996} Strigid Screecher
	["Tame {npc:1996}"] = "Apprivoiser : {npc:1996}",
	["Tame Beast"] = "Apprivoiser une bête",
	-- {npc:4146} Jocaste · {zone:1457} Darnassus
	["{npc:4146} in {zone:1457} takes it"] = "{npc:4146} à {zone:1457} la prend",

	-- Step 55: Sentinel Eralya Leafshadow
	-- {zone:1457} Darnassus
	["Take the road north-west from Dolanaar again; she still lies beside it, on the way to {zone:1457}."] = "Reprenez la route au nord-ouest de Dolanaar ; elle gît toujours au bord, sur le chemin de {zone:1457}.",

	-- Step 56: Into Darnassus
	-- {zone:1457} Darnassus
	["Into {zone:1457}"] = "Entrez dans {zone:1457}",

	-- Step 58: Elanaria
	-- {quest:1684} Elanaria
	["{quest:1684} stands on the Warrior's Terrace, just inside the city."] = "{quest:1684} se tient sur la terrasse des Guerriers, juste à l'entrée de la ville.",

	-- Step 59: Vorlus Vilehoof
	-- {quest:1683} Vorlus Vilehoof · {quest:1684} Elanaria
	["Back out of the city gate and east along the road: {quest:1683} stands south of it, by Ban'ethil Hollow. Bring his horn back to {quest:1684}."] = "Ressortez par la porte de la ville et suivez la route vers l'est : {quest:1683} se tient au sud, près du creux de Ban'ethil. Rapportez sa corne à {quest:1684}.",

	-- Step 61: Darnassus
	-- {zone:1457} Darnassus · {npc:4241} Mydrannul · {npc:3516} Arch Druid Fandral Staghelm · {quest:922} Rellian Greenspyre · {npc:4092} Lariia · {npc:7999} Tyrande Whisperwind · {npc:7316} Sister Aquinne
	["Follow the road west into {zone:1457}. {npc:4241} stands on the Craftsmen's Terrace just inside the city. {npc:3516} is in the Cenarion Enclave at the north end of the city, {quest:922} just south of it; {npc:4092} and {npc:7999} are in the Temple of the Moon at the south end. {npc:7316} is in the west of the city, on the way to the pink portal down to Rut'theran."] = "Suivez la route vers l'ouest jusqu'à {zone:1457}. {npc:4241} se tient sur la terrasse des Artisans, juste à l'entrée. {npc:3516} est dans l'Enclave cénarienne au nord de la ville, {quest:922} juste au sud ; {npc:4092} et {npc:7999} sont dans le temple de la Lune, au sud. {npc:7316} est à l'ouest de la ville, sur le chemin du portail rose qui descend à Rut'theran.",
	-- {npc:4088} Elanaria
	["{npc:4088}, on the Warrior's Terrace: Defensive Stance"] = "{npc:4088}, sur la terrasse des Guerriers : Posture défensive",
	-- {npc:3516} Arch Druid Fandral Staghelm
	["{npc:3516}, in the Cenarion Enclave"] = "{npc:3516}, dans l'Enclave cénarienne",

	-- Step 62: Cenarion Enclave
	["Cenarion Enclave"] = "Enclave cénarienne",
	-- {npc:4146} Jocaste
	["{npc:4146}, in the Cenarion Enclave: Beast Training"] = "{npc:4146}, dans l'Enclave cénarienne : Dressage des bêtes",
	-- {npc:4217} Mathrengyl Bearwalker
	["{npc:4217}, in the Cenarion Enclave"] = "{npc:4217}, dans l'Enclave cénarienne",
	-- {npc:4092} Lariia
	["{npc:4092}, in the Temple of the Moon"] = "{npc:4092}, dans le Temple de la Lune",
	-- {npc:7999} Tyrande Whisperwind · {npc:4092} Lariia
	["{npc:7999}, above {npc:4092}"] = "{npc:7999}, au-dessus de {npc:4092}",
	-- {npc:11401} Priestess Alathea
	["{npc:11401}, in the Temple of the Moon: Starshards"] = "{npc:11401}, dans le Temple de la Lune : Eclats stellaires",

	-- Step 63: Ilyenia Moonfire
	-- {npc:11866} Ilyenia Moonfire
	["While you're here: learn Staves from {npc:11866} (Warrior's Terrace, 10 silver); a Hunter's melee weapon is mostly its stats, and two-handers carry the most."] = "Au passage : apprenez les bâtons auprès de {npc:11866} (terrasse des Guerriers, 10 pièces d'argent) ; l'arme de mêlée d'un chasseur compte surtout pour ses caractéristiques, et les armes à deux mains en ont le plus.",

	-- Step 64: Ilyenia Moonfire
	-- {npc:11866} Ilyenia Moonfire
	["While you're here: learn Staves from {npc:11866} (Warrior's Terrace, 10 silver); a staff carries more spell stats than a one-hander while you level."] = "Au passage : apprenez les bâtons auprès de {npc:11866} (terrasse des Guerriers, 10 pièces d'argent) ; un bâton donne plus de caractéristiques de sort qu'une arme à une main pendant la montée de niveau.",

	-- Step 65: Portal to Teldrassil
	-- {quest:940} Teldrassil
	["Portal to {quest:940}"] = "Portail vers {quest:940}",

	-- Step 66: Rut'theran Village
	["Rut'theran Village"] = "Village de Rut'theran",
	-- {npc:10118} Nessa Shadowsong · {npc:3838} Vesprystus · {quest:6342} Flight to Auberdine · {npc:4200} Laird
	["Take the portal down to Rut'theran Village. {npc:10118} stands on the dock, {npc:3838} by the hippogryphs. Once you have {quest:6342}, talk to {npc:3838} again and choose the flight to Auberdine: it is free and lands beside {npc:4200}. If the flight map opens instead, close it and talk to him again holding Shift."] = "Prenez le portail qui descend au village de Rut'theran. {npc:10118} se tient sur le quai, {npc:3838} près des hippogriffes. Une fois {quest:6342} en poche, reparlez à {npc:3838} et choisissez le vol pour Auberdine : il est gratuit et se pose à côté de {npc:4200}. Si la carte des vols s'ouvre à la place, fermez-la et reparlez-lui en maintenant Maj.",
	-- {npc:3838} Vesprystus · {quest:6342} Flight to Auberdine
	["talk to {npc:3838} again: free with {quest:6342}"] = "parlez de nouveau à {npc:3838} : gratuit avec {quest:6342}",

	-- Step 67: Auberdine
	["Auberdine"] = "",
	-- {npc:3841} Caylais Moonfeather · {npc:4200} Laird
	["Learn the flight path from {npc:3841} where you land. {npc:4200}'s fish stall is just north of her, by the docks.\nThe boat docks west of the village. The flight master stands on the hill south of the inn; the quest givers are spread along the main street."] = "Apprenez le trajet aérien auprès de {npc:3841}, là où vous atterrissez. L'étal de poissons de {npc:4200} se trouve juste au nord d'elle, près des quais.\nLe bateau accoste à l'ouest du village. La maîtresse de vol se tient sur la colline au sud de l'auberge ; les donneurs de quêtes sont répartis le long de la rue principale.",

	-- Step 68: Return to Nessa
	-- {npc:3841} Caylais Moonfeather · {item:16263} Laird's Response · {npc:10118} Nessa Shadowsong
	["Fly back to Rut'theran Village from {npc:3841}, hand {item:16263} to {npc:10118} on the dock, then fly back to Auberdine for the boat."] = "Revolez vers le village de Rut'theran depuis {npc:3841}, remettez {item:16263} à {npc:10118} sur le quai, puis revolez vers Auberdine pour le bateau.",

	-- Step 69: Moonglade
	-- {quest:5921} Moonglade · {npc:11802} Dendrite Starblaze · {quest:5929} Great Bear Spirit · {npc:11800} Silva Fil'naveth
	["Cast Teleport: {quest:5921}. {npc:11802} is in Nighthaven; the {quest:5929} sits in the woods to the north-west. Then {npc:11800} in Nighthaven flies Druids straight to Rut'theran Village, no flight path needed."] = "Lancez Téléportation : {quest:5921}. {npc:11802} est à Havrenuit ; l'{quest:5929} se tient dans les bois au nord-ouest. Ensuite, {npc:11800} à Havrenuit emmène les druides directement au village de Rut'theran, sans trajet de vol à connaître.",
	-- {quest:5929} Great Bear Spirit
	["Speak with the {quest:5929}"] = "Parlez à l'{quest:5929}",

	-- Step 70: Back to Darnassus
	-- {npc:10118} Nessa Shadowsong · {npc:4217} Mathrengyl Bearwalker
	["{npc:10118} stands on the Rut'theran dock where you land. Then take the portal up to {npc:4217} in the Cenarion Enclave."] = "{npc:10118} se tient sur le quai de Rut'theran, à l'arrivée. Prenez ensuite le portail qui monte vers {npc:4217}, dans l'Enclave cénarienne.",

	-- Step 71: The Moonkin Stone
	-- {object:177525} Moonkin Stone
	["The {object:177525}"] = "{object:177525}",
	-- {object:177525} Moonkin Stone · {item:15208} Cenarion Moondust · {npc:12144} Lunaclaw Spirit
	["Go back down to Rut'theran Village and fly to Auberdine. The {object:177525} stands in the hills just east of the village: use the {item:15208} there, defeat Lunaclaw and speak to the {npc:12144}."] = "Redescendez au village de Rut'theran et volez vers Auberdine. La {object:177525} se dresse dans les collines juste à l'est du village : utilisez-y la {item:15208}, battez Griffe-de-lune et parlez à l'{npc:12144}.",

	-- Step 72: Body and Heart
	-- {npc:4217} Mathrengyl Bearwalker
	["Fly to Rut'theran Village once more and take the portal up to {npc:4217}, then fly back to Auberdine for the boat."] = "Volez encore vers le village de Rut'theran et prenez le portail qui monte vers {npc:4217}, puis revolez vers Auberdine pour le bateau.",
	-- {npc:4217} Mathrengyl Bearwalker
	["{npc:4217}: Bear Form"] = "{npc:4217} : Forme d'ours",

	-- Step 73: Boat to Stormwind
	-- {zone:1453} Stormwind
	["Boat to {zone:1453}"] = "Bateau pour {zone:1453}",
	-- {zone:1453} Stormwind
	["Take the boat to {zone:1453} from Auberdine's docks."] = "Prenez le bateau pour {zone:1453} aux quais d'Auberdine.",
	-- {zone:1453} Stormwind
	["Group: the next guide is the meeting point in {zone:1453}."] = "Groupe : le guide suivant est le rendez-vous à {zone:1453}.",

	-- No longer in the guide (its English changed or it went away): reuse or delete.
	-- ["The Long Wash"] = "Le Long rivage (The Long Wash)",
	-- ["The WANTED poster outside the inn"] = "L'affiche AVIS DE RECHERCHE devant l'auberge",
	-- ["Tide Crawlers scuttle along the shore below the village; {object:17182} stands on the beach just south of the docks. Darkshore Threshers swim in the shallows. The {object:175207} lies on the shore just south of the village."] = "Des Clampants des marées courent le long du rivage sous le village ; {object:17182} se dresse sur la plage juste au sud des quais. Des Batteurs de Sombrivage nagent dans les hauts-fonds. La {object:175207} repose sur le rivage juste au sud du village.",
	-- ["{npc:10216}, on the pier: only with {skill:356}"] = "{npc:10216}, sur la jetée : uniquement avec {skill:356}",
	-- ["{npc:3649}, north end of the village"] = "{npc:3649}, au nord du village",
}
