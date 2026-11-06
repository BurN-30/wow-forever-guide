-- French (frFR): the guide groupe-alliance/13-solo-loch-modan (guides/13-solo-loch-modan.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1432} Loch Modan
	["Solo · {zone:1432}"] = "Solo · {zone:1432}",

	-- Step 1: The southern guard tower
	["The southern guard tower"] = "La tour de garde du sud",
	-- {zone:1455} Ironforge · {zone:1426} Dun Morogh · {zone:1432} Loch Modan
	["From {zone:1455}, follow the road east across {zone:1426} to the South Gate Pass tunnel; the guard tower stands where it opens onto {zone:1432}."] = "Depuis {zone:1455}, suivez la route vers l'est à travers {zone:1426} jusqu'au tunnel qui mène au {zone:1432} ; la tour de garde se dresse à sa sortie.",
	["Solo catch-up for a player behind the group (lunch break, evening off). Back within 4 levels of the lowest player? Stop and rejoin: /polestar guides, Group Alliance, the group's guide."] = "Rattrapage en solo pour un joueur en retard sur le groupe (pause de midi, soirée libre). Revenu à 4 niveaux ou moins du plus bas du groupe ? Arrêtez et rejoignez-le : /polestar guides, Groupe Alliance, le guide du groupe.",

	-- Step 2: Thelsamar
	["Thelsamar"] = "Thelsamar",
	-- {npc:1340} Mountaineer Kadrell · {npc:1963} Vidra Hearthstove · {npc:49808} Grenhild Darktalon · {npc:1681} Brock Stoneseeker
	["North along the road to the town. {npc:1340} walks up and down the road through town; {npc:1963} and {npc:49808} stand in the middle of town, {npc:1681} on the east side, the gryphon master at the south end."] = "Vers le nord par la route jusqu'au village. {npc:1340} fait les cent pas sur la route qui traverse le village ; {npc:1963} et {npc:49808} se tiennent au centre, {npc:1681} du côté est, le maître des griffons à l'extrémité sud.",
	-- {npc:1572} Thorgrum Borrelson
	["{npc:1572}, the gryphon master"] = "{npc:1572}, le maître des griffons",
	-- {zone:1455} Ironforge
	["Handed in at the end, in {zone:1455}"] = "À rendre à la fin, à {zone:1455}",

	-- Step 3: Sausages on the way
	["Sausages on the way"] = "Boudins en chemin",
	-- plural, as words: Forest Lurkers = {npc:1195} Forest Lurker
	["Boars, black bears and Forest Lurkers (spiders) roam the hills west of the road, between the tunnel and the Silver Stream Mine."] = "Sangliers, ours noirs et araignées ({npc:1195}) parcourent les collines à l'ouest de la route, entre le tunnel et la mine du nord-ouest.",

	-- Step 4: The snowy patch
	["The snowy patch"] = "La plaque de neige",
	["Back south along the road, almost to the tunnel: use the Ceramic Jar Grenhild gave you while standing on the patch of snow."] = "Redescendez la route vers le sud, presque jusqu'au tunnel : utilisez le pot en céramique remis par Grenhild en vous tenant sur la plaque de neige.",

	-- Step 5: Stonesplinter Valley
	["Stonesplinter Valley"] = "La vallée des troggs",
	["The troggs camp in the valley east of the tower. Every trogg can drop a Stone Tooth: no need to hunt one kind."] = "Les troggs campent dans la vallée à l'est de la tour. Tous peuvent laisser une dent de pierre : inutile de viser une seule espèce.",
	-- plural, as words: Stonesplinter Troggs = {npc:1161} Stonesplinter Trogg
	["Stonesplinter Troggs"] = "{npc:1161} ×10",
	-- plural, as words: Stonesplinter Scouts = {npc:1162} Stonesplinter Scout
	["Stonesplinter Scouts"] = "{npc:1162} ×10",
	["Trogg Stone Teeth"] = "Dents de pierre de trogg",

	-- Step 7: Deeper in the valley
	["Deeper in the valley"] = "Au fond de la vallée",
	["Further south, past the first camp, Skullthumpers and Seers (13-14) hold the valley's end."] = "Plus au sud, après le premier camp, des troggs de niveau 13-14 tiennent le fond de la vallée.",
	-- plural, as words: Stonesplinter Skullthumpers = {npc:1163} Stonesplinter Skullthumper
	["Stonesplinter Skullthumpers"] = "{npc:1163} ×10",
	-- plural, as words: Stonesplinter Seers = {npc:1166} Stonesplinter Seer
	["Stonesplinter Seers"] = "{npc:1166} ×10",

	-- Step 9: The valley's end
	["The valley's end"] = "Le bout de la vallée",
	-- {npc:1090} Mountaineer Wallbang
	["Level 15 or more: {npc:1090} wants the Shamans and Bonesnappers (15-16) at the very back of the valley. Under 15, skip it."] = "Niveau 15 ou plus : {npc:1090} veut les troggs de niveau 15-16 tout au fond de la vallée. Sous le niveau 15, passez.",
	-- plural, as words: Stonesplinter Shamans = {npc:1197} Stonesplinter Shaman
	["Stonesplinter Shamans"] = "{npc:1197} ×10",
	-- plural, as words: Stonesplinter Bonesnappers = {npc:1164} Stonesplinter Bonesnapper
	["Stonesplinter Bonesnappers"] = "{npc:1164} ×10",

	-- Step 10: Silver Stream Mine
	["Silver Stream Mine"] = "La mine du nord-ouest",
	-- {npc:1343} Mountaineer Stormpike
	["North on the road past Thelsamar to the mine at the north-west end of the loch. {npc:1343} stands at its entrance."] = "Vers le nord par la route, après Thelsamar, jusqu'à la mine au bout nord-ouest du loch. {npc:1343} se tient à l'entrée.",

	-- Step 11: Rats and crates
	["Rats and crates"] = "Rats et caisses",
	-- {object:271} Miners' League Crates
	["The {object:271} sit inside the mine; Tunnel Rat kobolds fill it and the hills around it."] = "Les {object:271} sont dans la mine ; des kobolds la remplissent, ainsi que les collines alentour.",
	-- {item:2640} Miners' Gear
	["{item:2640}, from the crates"] = "{item:2640}, dans les caisses",
	-- plural, as words: Tunnel Rat Ears = {item:3110} Tunnel Rat Ear
	["Tunnel Rat Ears"] = "{item:3110} ×12",

	-- Step 13: Norric Lochthane
	["His house stands on the north-west shore of the loch, east of the mine."] = "Sa maison se trouve sur la rive nord-ouest du loch, à l'est de la mine.",

	-- Step 14: Thelsamar
	["Back south along the road."] = "Redescendez la route vers le sud.",

	-- Step 15: The fishing toolbox
	["The fishing toolbox"] = "La boîte de pêche",
	-- {object:665289} Discarded Fishing Toolbox
	-- plural, as words: Young Threshadons = {npc:1224} Young Threshadon
	["Optional, for swimmers: a {object:665289} lies on the lake floor east of town, at one of several spots: swim until its \"!\" shows on the minimap. Young Threshadons (19-20) swim in the loch: keep clear."] = "Facultatif, pour les nageurs : l'objet {object:665289} repose au fond du lac à l'est du village, à l'un de plusieurs endroits possibles : nagez jusqu'à voir son « ! » sur la minicarte. Des {npc:1224} (19-20) nagent dans le loch : tenez-vous à distance.",

	-- Step 16: Ironband's Excavation
	-- {npc:1345} Magmar Fellhew · {npc:1344} Prospector Ironband
	["East along the road on the south shore. {npc:1345} and {npc:1344} stand at the dig site; the troggs digging just east of them are 17-20: keep away."] = "Vers l'est par la route de la rive sud. {npc:1345} et {npc:1344} se tiennent sur le site de fouilles ; les troggs qui creusent juste à l'est sont de niveau 17-20 : restez à l'écart.",

	-- Step 17: Farstrider Lodge
	["Farstrider Lodge"] = "Le pavillon des chasseurs",
	-- plural, as words: Mountain Buzzards = {npc:1194} Mountain Buzzard
	["The lodge stands at the east end of the loch. Daryl's quest has a 15-minute timer: the Mountain Buzzards fly over the hills west and south-west of the lodge."] = "Le pavillon se trouve au bout est du loch. La quête de Daryl est limitée à 15 minutes : les {npc:1194} survolent les collines à l'ouest et au sud-ouest du pavillon.",
	-- plural, as words: Mountain Buzzards = {npc:1194} Mountain Buzzard
	["Mountain Buzzards"] = "{npc:1194} ×6",

	-- Step 18: A Hunter's Challenge
	-- plural, as words: Elder Mountain Boars = {npc:1192} Elder Mountain Boar
	["12 minutes this time: Elder Mountain Boars (16-17) roam the hills north-west of the lodge. Under 15, or short on time, skip it."] = "Cette fois 12 minutes : les {npc:1192} (16-17) parcourent les collines au nord-ouest du pavillon. Sous le niveau 15, ou pressé par le temps, passez.",
	-- plural, as words: Elder Mountain Boars = {npc:1192} Elder Mountain Boar
	["Elder Mountain Boars"] = "{npc:1192} ×5",

	-- Step 19: The loch shore
	["The loch shore"] = "La rive du loch",
	-- {npc:270693} Daggerfang · {npc:2476} Large Loch Crocolisk
	-- plural, as words: Loch Crocolisks = {npc:1693} Loch Crocolisk
	["Loch Crocolisks line the east and north shores. {npc:270693}, the named one, swims along the east shore north-west of the lodge. Leave the {npc:2476} (level 22) alone."] = "Les crocilisques ({npc:1693}) bordent les rives est et nord. {npc:270693}, le crocilisque nommé, nage le long de la rive est, au nord-ouest du pavillon. Laissez tranquille le {npc:2476} (niveau 22).",
	-- plural, as words: Crocolisk Skins = {item:2925} Crocolisk Skin
	["Crocolisk Skins"] = "{item:2925} ×6",

	-- Step 21: Thelsamar
	-- {npc:1684} Khara Deepwater
	["West along the road. {npc:1684} sells fishing supplies by the water north-east of town."] = "Vers l'ouest par la route. {npc:1684} vend des fournitures de pêche au bord de l'eau, au nord-est du village.",

	-- Step 22: Fly to Ironforge
	-- {zone:1455} Ironforge
	["Fly to {zone:1455}"] = "Vol vers {zone:1455}",

	-- Step 23: Ironforge
	-- {npc:1356} Prospector Stormpike · {object:32356} Hall of Explorers · {npc:4256} Golnir Bouldertoe · {object:32372} Great Forge · {npc:1573} Gryth Thurden
	["{npc:1356} is in the {object:32356}; {npc:4256} in the {object:32372}; {npc:1573} is the gryphon master where you landed."] = "{npc:1356} : {object:32356} ; {npc:4256} : {object:32372} ; {npc:1573} : le maître des griffons, à l'arrivée.",
	["Back with the group: /polestar guides, Group Alliance, the group's guide."] = "Retour au groupe : /polestar guides, Groupe Alliance, le guide du groupe.",
}
