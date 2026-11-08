-- French (frFR): the guide groupe-alliance/14-paluns-hautebrande (guides/14-paluns-hautebrande.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1437} Wetlands · {zone:1424} Hillsbrad Foothills
	["Group 12 · {zone:1437} & {zone:1424}"] = "Groupe 12 · {zone:1437} et {zone:1424}",

	-- Step 1: To Deepwater Tavern
	["To Deepwater Tavern"] = "Vers la taverne de l'Eau-profonde",
	["Everyone at their own pace: what you already did ticks itself, the guide picks up where you are. Playing together? Group XP is best within 4 levels."] = "Chacun à son rythme : ce qui est déjà fait se coche tout seul, le guide reprend où vous en êtes. En groupe ? L'XP de groupe est meilleure à 4 niveaux d'écart ou moins.",
	["Deepwater Tavern"] = "Taverne de l'Eau-profonde",

	-- Step 2: Menethil Harbor
	-- {npc:2104} Captain Stoutfist · {npc:270637} Howin Kindfeather
	["{npc:2104}: for {npc:270637}; on the top floor"] = "{npc:2104} : pour {npc:270637} ; au dernier étage",

	-- Step 3: Howin Kindfeather
	-- {zone:1455} Ironforge
	["For King Magni in {zone:1455}, at the end of this guide"] = "Pour le roi Magni à {zone:1455}, à la fin de ce guide",

	-- Step 4: Angerfang Encampment
	["Angerfang Encampment"] = "Campement de Hargnecroc",
	-- {object:671518} Tattered Spellbook
	["South to the Dragonmaw's Angerfang Encampment: the first catapult stands on the way, and the {object:671518} lies in the camp."] = "Au sud vers le campement de Hargnecroc des Dragonmaw : la première catapulte se trouve sur le chemin, et le {object:671518} se trouve dans le camp.",

	-- Step 6: Angerfang Encampment
	-- {quest:474} Defeat Nek'rosh
	["The next step, {quest:474}, pits you against an elite chieftain: skip it."] = "L'étape suivante, {quest:474}, vous oppose à un chef élite : passez-la.",
	-- {object:671518} Tattered Spellbook · {npc:2104} Captain Stoutfist
	["{object:671518}: for {npc:2104}"] = "{object:671518} : pour {npc:2104}",

	-- Step 7: Defeat Nek'rosh
	-- {npc:2091} Chieftain Nek'rosh
	["These are elite mobs: grouping up is encouraged, look for people to do it with. {npc:2091} is a level 32 elite: most classes solo it at level 34, but you may need help. Skip it if you are alone: the route has you grind the XP back.\nCareful: Shadowcasters stand on either side of him, and at least one is linked to him, so it joins when he is pulled. Non-elite centurions and captains are spread around his ring of tents."] = "Ce sont des monstres élites : il est conseillé de se grouper, cherchez des joueurs avec qui le faire. {npc:2091} est un élite de niveau 32 : la plupart des classes le battent seules au niveau 34, mais vous aurez peut-être besoin d'aide. Passez-le si vous êtes seul : l'itinéraire vous fait regagner l'expérience en tuant des monstres.\nAttention : des lanceurs de sorts se tiennent de chaque côté de lui, et au moins l'un d'eux lui est lié : il se joint au combat quand vous l'attirez. Des centurions et des capitaines non élites sont répartis autour de son cercle de tentes.",

	-- Step 8: Golm
	-- {npc:271462} Golm · {item:279996} Goaz Stone
	["{npc:271462} stands in the south-eastern hills: use the {item:279996} beside it."] = "{npc:271462} se dresse dans les collines du sud-est : utilisez la {item:279996} à côté.",

	-- Step 9: Dragonmaw Gates: kill these as you meet them
	["Dragonmaw Gates: kill these as you meet them"] = "Portes des Dragonmaw : tuez-les au fur et à mesure",
	-- {npc:271338} Ados · {item:279996} Goaz Stone
	["North-east to the Dragonmaw Gates: {npc:271338} stands at the gates (use the {item:279996})."] = "Au nord-est vers les Portes des Dragonmaw : {npc:271338} se trouve aux portes (utiliser le {item:279996}).",

	-- Step 10: The Green Belt
	["The Green Belt"] = "La Ceinture Verte",

	-- Step 11: Dun Modr
	-- {object:376} Dun Modr · {npc:271460} Modr · {item:279996} Goaz Stone · {npc:271481} Captive Fire Elemental · {npc:1072} Roggo Harlbarrow
	["North along the road to {object:376}. {npc:271460} stands in the ruins (use the {item:279996}); the {npc:271481} is held on the west side: lead it out to {npc:1072}."] = "Au nord le long de la route vers {object:376}. {npc:271460} se trouve dans les ruines (utiliser le {item:279996}) ; le {npc:271481} est retenu du côté ouest : ramenez-le à {npc:1072}.",

	-- Step 13: Waterlogged Envelope
	["Underwater"] = "Sous l'eau",

	-- Step 14: The Villards
	["The Villards"] = "Les Villard",
	-- {npc:5683} Comar Villard · {object:376} Dun Modr · {object:2673} Thandol Span · {npc:271322} Essene Villard
	["{npc:5683} waits north of {object:376} by the {object:2673}; {npc:271322} a short walk further north-east."] = "{npc:5683} attend au nord de {object:376} près du {object:2673} ; {npc:271322} un peu plus loin au nord-est.",
	-- {npc:5683} Comar Villard
	["{npc:5683} (Groupe Alliance: optional, Forever players report he no longer offers it)"] = "{npc:5683} (Groupe Alliance : facultative, des joueurs de Forever signalent qu'il ne la propose plus)",

	-- Step 15: Dun Modr
	-- {npc:1071} Longbraid the Grim
	["{npc:1071} stands in the dwarves' camp."] = "{npc:1071} se tient dans le camp des nains.",

	-- Step 16: Thandol Span
	-- {object:376} Dun Modr · {zone:1437} Wetlands · {npc:1075} Rhag Garmason
	["Follow the road south over the bridge to {object:376} at the {zone:1437} end, where {npc:1075} waits."] = "Suivez la route vers le sud par le pont jusqu'à {object:376} à l'extrémité {zone:1437}, où {npc:1075} attend.",

	-- Step 18: Prospector Whelgar
	["Below ground"] = "Sous terre",

	-- Step 19: Menethil Harbor
	["West along the road to Menethil."] = "À l'ouest par la route jusqu'au Port de Menethil.",
	["On the top floor"] = "Au dernier étage",

	-- Step 20: Menethil Harbor
	-- {npc:2104} Captain Stoutfist
	["{npc:2104} stands on the top floor of Menethil Keep: go up inside, the arrow cannot tell the floors apart."] = "{npc:2104} se trouve au dernier étage du donjon de Menethil : montez à l'intérieur, la flèche ne distingue pas les étages.",

	-- Step 21: Level 31.23
	["Level 31.23"] = "Niveau 31.23",
	-- {quest:474} Defeat Nek'rosh
	["If you skipped {quest:474}, grind here to level 31.23 to stay on the route's plan."] = "Si vous avez passé {quest:474}, tuez des monstres ici jusqu'au niveau 31.23 pour suivre le plan de l'itinéraire.",
	-- {npc:1418} Bluegill Raider
	["grind on {npc:1418}"] = "tuez en boucle : {npc:1418}",

	-- Step 23: Boat to Southshore
	["Boat to Southshore"] = "Bateau pour Austrivage",

	-- Step 24: Southshore
	["Southshore"] = "Austrivage",
	-- {npc:2381} Micha Yance · {npc:2438} Bartolo Ginsetti · {npc:2366} Barkeep Kelly
	["Pick up everything in town before heading out. {npc:2381} and {npc:2438} stand between the flight master and the inn, Farren and {npc:2366} at the inn, Maleb in the town hall."] = "Prenez tout en ville avant de partir. {npc:2381} et {npc:2438} se tiennent entre le maître de vol et l'auberge, Farren et {npc:2366} à l'auberge, Maleb à l'hôtel de ville.",
	-- {item:3713} Soothing Spices · {npc:2381} Micha Yance
	["{item:3713}, from {npc:2381}"] = "{item:3713}, chez {npc:2381}",
	-- {npc:2382} Darren Malvew
	["{npc:2382}: the lions come later"] = "{npc:2382} : les lions viendront plus tard",
	-- {npc:2430} Chef Jessen
	["{npc:2430}, upstairs"] = "{npc:2430}, à l'étage",
	-- {npc:2366} Barkeep Kelly · {object:3204} Booty Bay
	["{npc:2366}, in the inn: for {object:3204} (04-stranglethorn-vale)"] = "{npc:2366}, à l'auberge : pour {object:3204} (04-vallée-de-strangleronce)",
	-- {npc:2228} Lieutenant Farren Orinelle
	["{npc:2228}, inside"] = "{npc:2228}, à l'intérieur",
	-- {npc:2711} Phin Odelic
	["{npc:2711}: his trail leads to Arathi"] = "{npc:2711} : sa piste mène en Arathi",
	-- {npc:2276} Magistrate Henry Maleb
	["{npc:2276}, inside"] = "{npc:2276}, à l'intérieur",

	-- Step 25: Torn Fin murlocs
	["Torn Fin murlocs"] = "Murlocs Aileron déchiré",
	["The Torn Fin murlocs crowd the Western Strand, south-west of Southshore.\nCareful: One camp holds a tight cluster of Oracles that all aggro together."] = "Les murlocs Aileron déchiré encombrent le Rivage occidental, au sud-ouest d'Austrivage.\nAttention : Un camp contient un groupe serré d'oracles qui attaquent tous ensemble.",

	-- Step 26: Farren
	["Farren"] = "Farren",
	["Inside"] = "À l'intérieur",

	-- Step 27: Murloc heads
	["Murloc heads"] = "Têtes de murloc",
	["Back to the same murlocs; not every one drops a head."] = "Retournez voir les mêmes murlocs ; tous ne lâchent pas de tête.",

	-- Step 29: Daggerspine naga
	["Daggerspine naga"] = "Nagas Daguéchine",
	["The naga hold the shore south-east of Southshore."] = "Les nagas occupent le rivage au sud-est d'Austrivage.",

	-- Step 32: Farren
	-- {object:2117} Stormwind Keep
	["A report for {object:2117}; inside"] = "Un rapport pour {object:2117} ; à l'intérieur",

	-- Step 33: Southshore
	-- {npc:251493} Captain McManus
	["Off the boat, {npc:251493} is the first you meet, north-west of the flight master."] = "En descendant du bateau, {npc:251493} est le premier que vous rencontrez, au nord-ouest du maître de vol.",

	-- Step 34: Yeti cave
	["Yeti cave"] = "Grotte des yétis",
	["The yetis live in the cave in the hills north of Southshore, on your way back south."] = "Les yetis vivent dans la grotte dans les collines au nord d'Austrivage, sur votre chemin du retour vers le sud.",
	-- {npc:2438} Bartolo Ginsetti · {item:3719} Hillman's Cloak · {item:2997} Bolt of Woolen Cloth · {item:2321} Fine Thread
	["{npc:2438} also wants a {item:3719}, a {item:2997} and {item:2321}: crafted or bought; the cloak is turned in when you are back in Southshore later."] = "{npc:2438} veut aussi un {item:3719}, un {item:2997} et {item:2321} : fabriqués ou achetés ; la cape est à rendre quand vous revenez à Austrivage plus tard.",

	-- Step 35: On the way
	["On the way"] = "En chemin",

	-- Step 37: Syndicate camp
	["Syndicate camp"] = "Camp du Syndicat",
	-- {object:1772} Tarren Mill
	["The Syndicate camp sits on the Alterac border in northern Hillsbrad, west of {object:1772} (Horde); the documents lie in the camp."] = "Le camp du Syndicat se trouve à la frontière d'Alterac dans le nord de Hautebrande, à l'ouest de {object:1772} (Horde) ; les documents se trouvent dans le camp.",

	-- Step 39: Snapjaws
	["Snapjaws"] = "Gueules d'acier",
	-- {object:1772} Tarren Mill
	["The Snapjaw turtles bask along the river east of Southshore, south of {object:1772} (Horde)."] = "Les tortues Gueule d'acier se prélassent le long de la rivière à l'est d'Austrivage, au sud de {object:1772} (Horde).",

	-- Step 43: Fly to Ironforge
	-- {zone:1455} Ironforge
	["Fly to {zone:1455}"] = "Envolez-vous vers {zone:1455}",
	["Southshore flight master"] = "Maître de vol d'Austrivage",

	-- Step 44: Deeprun Tram
	["Deeprun Tram"] = "Tram des profondeurs",
	-- {object:28027} Dwarven District · {zone:1455} Ironforge
	["Take the Deeprun Tram from the {object:28027} to {zone:1455}."] = "Prenez le Tram des profondeurs depuis le {object:28027} jusqu'à {zone:1455}.",
	["Level 30 and 32 spells"] = "Sorts des niveaux 30 et 32",

	-- Step 47: Deeprun Tram
	-- {npc:2784} King Magni Bronzebeard · {object:171709} High Seat
	["{npc:2784}, the {object:171709}"] = "{npc:2784}, {object:171709}",

	-- Step 49: Fly to Stormwind
	-- {zone:1453} Stormwind
	["Fly to {zone:1453}"] = "Volez jusqu'à {zone:1453}",
	-- {zone:1455} Ironforge
	["{zone:1455} flight master"] = "Maître de vol de {zone:1455}",

	-- Step 50: The Islander
	-- {npc:5479} Wu Shen · {object:2100} Old Town · {npc:6236} Klannoc Macleod · {zone:1413} Barrens
	["{npc:5479} trains warriors in {object:2100}, beside the Pig and Whistle. {npc:6236} waits on Fray Island in the {zone:1413}, on the way to Ratchet much later (40-50/01)."] = "{npc:5479} forme les guerriers dans {object:2100}, à côté de la taverne du Cochon siffleur. {npc:6236} attend sur l'île de la Dispute dans {zone:1413}, sur la route de Cabestan, bien plus tard (40-50/01).",

	-- Step 51: Elling Trias
	-- {object:2096} Trade District
	["The cheese shop in the {object:2096}."] = "La fromagerie dans {object:2096}.",

	-- Step 52: Druid training
	["Druid training"] = "Entraînement de druide",
	-- {zone:1455} Ironforge · {npc:5504} Sheldras Moontree · {zone:1453} Stormwind
	["{zone:1455} has no druid trainer: train with {npc:5504} in {zone:1453} before the tram."] = "{zone:1455} n'a pas de maître des druides : entraînez-vous auprès de {npc:5504} à {zone:1453} avant le tram.",

	-- Step 54: Dashel Stonefist
	-- {npc:4961} Dashel Stonefist · {object:2100} Old Town
	["{npc:4961} waits in the Pig and Whistle tavern in {object:2100}; he and his two thugs fight you, but stop once beaten."] = "{npc:4961} attend à la Taverne du Cochon siffleur, dans {object:2100} ; lui et ses deux voyous vous attaquent, mais s'arrêtent une fois vaincus.",

	-- Step 56: Cathedral of Light
	["Cathedral of Light"] = "Cathédrale de la Lumière",

	-- Step 57: Mage Quarter
	-- {npc:2708} Archmage Malin · {object:2164} Slaughtered Lamb · {npc:211033} Garion Wendell · {npc:5081} Connor Rivers · {object:2101} Mage Quarter
	["{npc:2708} is in the {object:2164}; {npc:211033} near the canal; {npc:5081} south of the {object:2101}."] = "{npc:2708} est dans {object:2164} ; {npc:211033} près du canal ; {npc:5081} au sud de {object:2101}.",
	-- {npc:211033} Garion Wendell
	-- plural, as words: Library Books = {object:386691} Library Book
	["{npc:211033}: only offered once you have handed in library books (the Library Books guide)"] = "{npc:211033} : proposée seulement une fois que vous avez rendu des livres de la bibliothèque (le guide Livres de la bibliothèque)",

	-- Step 62: Fly to Astranaar
	["Fly to Astranaar"] = "Envolez-vous vers Astranaar",
	["Auberdine flight master"] = "Maître de vol d'Auberdine",
}
