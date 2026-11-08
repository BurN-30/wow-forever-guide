-- French (frFR): the guide groupe-alliance/05-sombrivage (guides/05-sombrivage.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1439} Darkshore
	["Group 4 · {zone:1439}"] = "Groupe 4 · {zone:1439}",

	-- Step 1: Business in Auberdine
	-- {npc:7232} Borgus Steelhand · {object:28027} Dwarven District
	["{npc:7232}, in the {object:28027}, sends you to his brother in Auberdine: free XP on the boat trip you take anyway."] = "{npc:7232}, dans {object:28027}, vous envoie chez son frère à Auberdine : de l'XP gratuite sur le trajet en bateau que vous faites de toute façon.",

	-- Step 2: Boat to Auberdine
	["Everyone at their own pace: what you already did ticks itself, the guide picks up where you are. Playing together? Group XP is best within 4 levels."] = "Chacun à son rythme : ce qui est déjà fait se coche tout seul, le guide reprend où vous en êtes. En groupe ? L'XP de groupe est meilleure à 4 niveaux d'écart ou moins.",

	-- Step 3: Auberdine
	["Auberdine"] = "Auberdine",
	-- {npc:3666} Wizbang Cranktoggle
	["The boat docks west of the village. The flight master stands on the hill south of the inn; the quest givers are spread along the main street. {npc:3666} stands upstairs in the inn: take the stairs inside, the arrow cannot tell the floors apart."] = "Le bateau accoste à l'ouest du village. Le maître de vol se tient sur la colline au sud de l'auberge ; les donneurs de quêtes sont répartis le long de la rue principale. {npc:3666} se tient à l'étage de l'auberge : prenez l'escalier intérieur, la flèche ne distingue pas les étages.",
	-- {npc:3649} Thundris Windweaver
	["{npc:3649}, north end of the village"] = "{npc:3649}, au nord du village",
	-- {npc:3649} Thundris Windweaver · {npc:1646} Baros Alexston · {zone:1453} Stormwind
	["{npc:3649}: for {npc:1646} in {zone:1453}"] = "{npc:3649} : pour {npc:1646} à {zone:1453}",
	-- {npc:6301} Gorbold Steelhand · {quest:97894} Business in Auberdine · {zone:1453} Stormwind
	["{npc:6301}: {quest:97894}, if you took it in {zone:1453}"] = "{npc:6301} : {quest:97894}, si vous l'avez prise à {zone:1453}",
	["The WANTED poster outside the inn"] = "L'affiche AVIS DE RECHERCHE devant l'auberge",
	["The WANTED poster"] = "L'affiche AVIS DE RECHERCHE",
	-- {npc:3666} Wizbang Cranktoggle
	["{npc:3666}, upstairs in the inn"] = "{npc:3666}, à l'étage de l'auberge",
	-- {npc:3644} Cerellean Whiteclaw
	["{npc:3644}, on the pier"] = "{npc:3644}, sur la jetée",
	-- {npc:10216} Gubber Blump · {skill:356} Fishing
	["{npc:10216}, on the pier: only with {skill:356}"] = "{npc:10216}, sur la jetée : uniquement avec {skill:356}",

	-- Step 4: The beach
	["The beach"] = "La plage",
	-- {quest:983} Buzzbox 827 · {object:175207} Beached Sea Creature
	-- plural, as words: Tide Crawlers = {npc:2232} Tide Crawler · Darkshore Threshers = {npc:2185} Darkshore Thresher
	["Tide Crawlers scuttle along the shore below the village; {quest:983} stands on the beach just south of the docks. Darkshore Threshers swim in the shallows. The {object:175207} lies on the shore just south of the village."] = "Les Clampants des marées grouillent sur la côte en contrebas du village ; {quest:983} se trouve sur la plage juste au sud des quais. Les Batteurs de Sombrivage nagent dans les hauts-fonds. La {object:175207} gît sur la côte juste au sud du village.",
	-- {item:12238} Darkshore Grouper
	["{item:12238}: fish from the pier"] = "{item:12238} : à pêcher depuis la jetée",
	-- plural, as words: Crawler Legs = {item:5385} Crawler Leg
	["Crawler Legs"] = "Pattes de clampant",

	-- Step 6: The skeletal turtle
	["The skeletal turtle"] = "La tortue squelettique",
	-- {item:12289} Sea Turtle Remains
	["{item:12289}, on the beach west of the docks; underwater"] = "{item:12289}, sur la plage à l'ouest des quais ; sous l'eau",

	-- Step 7: Plagued bears
	["Plagued bears"] = "Les ours pestiférés",
	-- {quest:2139} Tharnariun's Hope
	-- plural, as words: Rabid Thistle Bears = {npc:2164} Rabid Thistle Bear
	["Rabid Thistle Bears roam the hills just east of Auberdine. Use {quest:2139} on one and lead it back to him."] = "Les ours chardons enragés rôdent dans les collines juste à l'est d'Auberdine. Utilisez {quest:2139} sur l'un d'eux et ramenez-le vers lui.",
	-- {npc:3701} Tharnariun Treetender
	-- plural, as words: Rabid Thistle Bears = {npc:2164} Rabid Thistle Bear
	["the Rabid Thistle Bears nearest {npc:3701}"] = "les Ours des chardons enragés les plus proches de {npc:3701}",

	-- Step 8: Rabid Thistle Bear on the way
	-- {npc:2164} Rabid Thistle Bear
	["{npc:2164} on the way"] = "{npc:2164} en chemin",

	-- Step 9: Bears and the Blackwood camp
	["Bears and the Blackwood camp"] = "Les ours et le camp Noirbois",
	-- plural, as words: Rabid Thistle Bears = {npc:2164} Rabid Thistle Bear
	["Kill Rabid Thistle Bears in the hills east of Auberdine, then walk up to the furbolg camp south-east of them: nothing to kill yet."] = "Tuez des ours chardons enragés dans les collines à l'est d'Auberdine, puis allez au camp des furbolgs au sud-est d'eux : rien à tuer pour l'instant.",

	-- Step 10: Ameth'Aran
	-- {npc:3639} Sentinel Tysha Moonblade · {npc:2178} Wailing Highborne · {npc:3667} Anaya Dawnrunner · {npc:270196} Jai'vhanel · {quest:4722} Beached Sea Turtle
	["{npc:3639} stands at the north edge of the ruins. Cursed, Writhing and {npc:2178} haunt them; {npc:3667}'s ghost walks among them, {npc:270196} the owl circles east of them. The two tablets lie in the ruins; a {quest:4722} lies on the shore west of them."] = "{npc:3639} se tient à la lisière nord des ruines. Des Bien-nés maudits, des Bien-nés frémissants et des {npc:2178} les hantent ; le fantôme d'{npc:3667} erre parmi eux, la chouette {npc:270196} tournoie à l'est. Les deux tablettes se trouvent dans les ruines ; une {quest:4722} gît sur la côte à l'ouest.",
	-- plural, as words: Highborne Relics = {item:5360} Highborne Relic
	["Highborne Relics"] = "Reliques de bien-Né",
	-- {object:17188} Lay of Ameth'Aran
	["Read the {object:17188}"] = "Lisez {object:17188}",
	-- {object:17189} Fall of Ameth'Aran
	["Read the {object:17189}"] = "Lisez {object:17189}",

	-- Step 11: The red crystal
	["The red crystal"] = "Le cristal rouge",
	-- {object:12894} Ameth'Aran · {object:175524} Mysterious Red Crystal
	["Climb the eastern mountains east of {object:12894}; the {object:175524} sits on a ledge."] = "Grimpez les montagnes de l'est à l'est de {object:12894} ; le {object:175524} se trouve sur une corniche.",

	-- Step 13: Bashal'Aran
	-- {npc:3650} Asterion · {quest:954} Bashal'Aran · {quest:1001} Buzzbox 411 · {quest:4723} Beached Sea Creature
	-- plural, as words: Wild Grells = {npc:2190} Wild Grell · Vile Sprites = {npc:2189} Vile Sprite · Deth'ryll Satyrs = {npc:2212} Deth'ryll Satyr
	["North along the hills. {npc:3650} waits in the ruins of {quest:954}; Wild Grells and Vile Sprites fill them, Deth'ryll Satyrs the eastern edge. {quest:1001} stands by the road west of the ruins; a {quest:4723} lies on the shore on the way to him."] = "Au nord, le long des collines. {npc:3650} attend dans les ruines de {quest:954} ; des Grells sauvages et des Fées viles les peuplent, des Satyres Deth'ryll en occupent la lisière est. {quest:1001} se trouve près de la route à l'ouest des ruines ; une {quest:4723} gît sur la côte en chemin.",
	-- plural, as words: Grell Earrings = {item:5336} Grell Earring
	["Grell Earrings"] = "Boucles d'oreille de grell",
	-- {item:5338} Ancient Moonstone Seal
	-- plural, as words: Deth'ryll Satyrs = {npc:2212} Deth'ryll Satyr
	["{item:5338}: Deth'ryll Satyrs"] = "{item:5338} : Satyres Deth'ryll",

	-- Step 14: Auberdine
	["Fill the tube at the moonwell in the village"] = "Remplissez le tube au puits de lune du village",

	-- Step 15: A Lesson to Learn
	-- {npc:4217} Mathrengyl Bearwalker
	["Fly from Auberdine to Rut'theran Village and take the portal up to {npc:4217} in the Cenarion Enclave."] = "Volez d'Auberdine au village de Rut'theran et prenez le portail jusqu'à {npc:4217} dans l'Enclave cénarienne.",

	-- Step 18: Moonglade
	-- {zone:1450} Moonglade
	["Cast Teleport: {zone:1450}"] = "Lancez Téléportation : {zone:1450}",

	-- Step 19: Trial of the Lake
	-- {zone:1450} Moonglade · {npc:11802} Dendrite Starblaze · {object:177117} Shrine of Remulos · {npc:11799} Tajarri
	-- plural, as words: Shrine Baubles = {item:15877} Shrine Bauble
	["Cast Teleport: {zone:1450}. {npc:11802} stands upstairs in his building in Nighthaven: go up inside, the arrow cannot tell the floors apart. Shrine Baubles lie in the containers on the floor of Lake Elune'ara, below Nighthaven: take one to the {object:177117} in the north-west, use it there and speak to {npc:11799}. Then fly back to Auberdine from Nighthaven."] = "Lancez Téléportation : {zone:1450}. {npc:11802} se tient à l'étage de son bâtiment à Reflet-de-Lune : montez par l'intérieur, la flèche ne distingue pas les étages. Les bibelots du sanctuaire gisent dans les conteneurs au fond du lac Elune'ara, sous Reflet-de-Lune : prenez-en un jusqu'au {object:177117} au nord-ouest, utilisez-le là et parlez à {npc:11799}. Puis volez de retour à Auberdine depuis Reflet-de-Lune.",
	-- {quest:6122} The Principal Source
	["{quest:6122}: fill the sampler at Cliffspring Falls"] = "{quest:6122} : remplissez l'échantillonneur aux Chutes de Cliffspring",
	-- {item:15877} Shrine Bauble · {object:177785} Bauble Container
	["{item:15877}, from a {object:177785} in the lake"] = "{item:15877}, dans un {object:177785} au fond du lac",
	-- {object:177117} Shrine of Remulos
	["At the {object:177117}"] = "Au {object:177117}",
	-- {zone:1439} Darkshore · {zone:1436} Westfall
	["The half pendants lie in {zone:1439} and {zone:1436}: later on the route"] = "Les demi-pendentifs se trouvent en {zone:1439} et en {zone:1436} : plus tard sur l'itinéraire",

	-- Step 20: Blackwood furbolgs
	["Blackwood furbolgs"] = "Les furbolgs Noirbois",
	-- plural, as words: Blackwood Pathfinders = {npc:2167} Blackwood Pathfinder
	["Blackwood Pathfinders and Windtalkers hold the camp south-east of Auberdine."] = "Les éclaireurs et les parleurs du vent de Bois-Noir tiennent le camp au sud-est d'Auberdine.",

	-- Step 21: The southern beaches
	["The southern beaches"] = "Les plages du sud",
	-- {object:12894} Ameth'Aran · {quest:4728} Beached Sea Creature
	-- plural, as words: Greymist Oracles = {npc:2207} Greymist Oracle
	["Follow the coast south past {object:12894}: one {quest:4728} lies on the shore west of the Grove, another further south near Remtravel's Excavation. Three more remains lie further south-west among Greymist Oracles and Tidehunters (18-20): the guide leaves them for the last loop, when you are closer to their level."] = "Suivez la côte vers le sud passé {object:12894} : un {quest:4728} gît sur la rive ouest du Bosquet, un autre plus au sud près de l'Excavation de Remtravel. Trois autres restes gisent plus au sud-ouest parmi les oracles et les chasseurs des brumes grises (18-20) : le guide les laisse pour la dernière boucle, quand vous serez plus proche de leur niveau.",

	-- Step 22: The Ancient Flame
	-- {object:16393} Ancient Flame
	["The {object:16393}"] = "{object:16393}",
	-- {object:12894} Ameth'Aran
	["The flame burns in the south of {object:12894}."] = "La flamme brûle au sud de {object:12894}.",

	-- Step 23: The red crystal
	["Back north-east into the mountains to the crystal."] = "Retournez au nord-est dans les montagnes jusqu'au cristal.",

	-- Step 24: Cliffspring Falls
	["Cliffspring Falls"] = "Chutes de Cliffspring",
	-- {quest:954} Bashal'Aran
	["Follow the hills north to the Cliffspring River and up to the falls. Two more beached remains lie on the north shore: near the Ruins of Mathystra and north of {quest:954}."] = "Suivez les collines vers le nord jusqu'à la rivière de Cliffspring et jusqu'aux chutes. Deux autres restes échoués gisent sur la rive nord : près des ruines de Mathystra et au nord de {quest:954}.",
	-- {item:12349} Cliffspring River Sample
	["{item:12349}, at the waterfall"] = "{item:12349}, à la cascade",
	-- {item:15845} Filled Cliffspring Falls Sampler
	["{item:15845}: at the mouth of the cave by the falls"] = "{item:15845} : à l'entrée de la grotte près des chutes",
	-- {item:12237} Fine Crab Chunks · {npc:2233} Encrusted Tide Crawler · {npc:2235} Reef Crawler
	["{item:12237} from {npc:2233} and {npc:2235}, by this stop"] = "{item:12237} sur les {npc:2233} et {npc:2235}, près de cet arrêt",

	-- Step 26: Auberdine
	-- {item:12347} Filled Cleansing Bowl · {item:12346} Empty Cleansing Bowl · {object:174795} Auberdine Moonwell
	["{item:12347}: fill the {item:12346} at the {object:174795}"] = "{item:12347} : remplissez le {item:12346} au {object:174795}",

	-- Step 27: Mist's Edge
	["Mist's Edge"] = "Bord-de-Brume",
	-- plural, as words: Thresher Eyes = {item:5412} Thresher Eye
	["Thresher Eyes; underwater"] = "Yeux de batteur ; sous l'eau",

	-- Step 28: The bay wrecks
	["The bay wrecks"] = "Les épaves de la baie",
	-- plural, as words: Reef Crawlers = {npc:2235} Reef Crawler · Encrusted Tide Crawlers = {npc:2233} Encrusted Tide Crawler
	["Two wrecks lie on the sea floor in the bay north of Auberdine; each holds a lockbox. Reef Crawlers and Encrusted Tide Crawlers line this shore.\nCareful: The murlocs inside the wrecks are close together and fast. They often swim through the hull walls and holes, so you will usually pull extra murlocs."] = "Deux épaves gisent sur le fond marin dans la baie au nord d'Auberdine ; chacune contient une cassette. Des rampants des récifs et des rampants des marées incrustés longent ce rivage.\nAttention : Les murlocs à l'intérieur des épaves sont proches les uns des autres et rapides. Ils nagent souvent à travers les parois et les trous de la coque, vous attirerez donc généralement des murlocs supplémentaires.",
	-- {item:12191} Silver Dawning's Lockbox
	["{item:12191}; underwater"] = "{item:12191} ; sous l'eau",
	-- {item:12192} Mist Veil's Lockbox
	["{item:12192}; underwater"] = "{item:12192} ; sous l'eau",

	-- Step 30: Darkshore: kill these as you meet them
	-- {zone:1439} Darkshore
	["{zone:1439}: kill these as you meet them"] = "{zone:1439} : tuez-les au passage",
	-- {quest:954} Bashal'Aran · {quest:1002} Buzzbox 323
	["Moonstalkers prowl the hills between {quest:954} and the tower. {quest:1002} stands on the hill west of the tower."] = "Des Traquelunes rôdent dans les collines entre {quest:954} et la tour. {quest:1002} se trouve sur la colline à l'ouest de la tour.",
	-- plural, as words: Moonstalker Fangs = {item:5413} Moonstalker Fang
	["Moonstalker Fangs"] = "Crocs de traquelune",

	-- Step 31: Cliffspring River
	["Cliffspring River"] = "Rivière de Cliffspring",

	-- Step 32: The cave and the Den Mother
	-- {npc:6788} Den Mother
	["The cave and the {npc:6788}"] = "La grotte et la {npc:6788}",
	-- {item:5270} Death Cap · {npc:6788} Den Mother
	-- plural, as words: Scaber Stalks = {item:5271} Scaber Stalk
	["The cave lies south of the falls: Scaber Stalks grow all through it, the {item:5270} at the very back. The {npc:6788} lairs in the hills south of the falls."] = "La grotte se trouve au sud des chutes : des Pédoncules d'amanite ({item:5271}) poussent partout à l'intérieur, {item:5270} tout au fond. {npc:6788} a son repaire dans les collines au sud des chutes.",
	-- plural, as words: Scaber Stalks = {item:5271} Scaber Stalk
	["Scaber Stalks; below ground"] = "Pédoncules d'amanite ; sous terre",
	-- {item:5270} Death Cap
	["{item:5270}; below ground"] = "{item:5270} ; sous terre",

	-- Step 33: The northern Blackwood camp
	["The northern Blackwood camp"] = "Le camp Noirbois du nord",
	-- {item:12347} Filled Cleansing Bowl · {item:12346} Empty Cleansing Bowl · {object:174795} Auberdine Moonwell · {item:12355} Talisman of Corruption
	["The furbolg camp south of the Cliffspring River keeps its Nut, Fruit and Grain Stores by the bonfires. With a sample of each and the {item:12347} in your bags (the {item:12346} is filled at the {object:174795}), use the bowl by the bonfire closest to the river: it summons Xabraxxis, the satyr corruptor, and the {item:12355} lies in his Demon Bag."] = "Le camp des furbolgs au sud de la rivière de Cliffspring garde ses réserves de noix, de fruits et de grains près des feux de camp. Avec un échantillon de chacun et le {item:12347} dans vos sacs (le {item:12346} est rempli au {object:174795}), utilisez le bol près du feu de camp le plus proche de la rivière : cela invoque Xabraxxis, le satyre corrupteur, et le {item:12355} se trouve dans son sac de démon.",
	["By the bonfire closest to the river: summons Xabraxxis"] = "Près du feu le plus proche de la rivière : invoque Xabraxxis",
	-- {item:12355} Talisman of Corruption · {object:177624} Xabraxxis' Demon Bag
	["{item:12355}, in {object:177624}"] = "{item:12355}, dans le {object:177624}",

	-- Step 34: The cave and the Den Mother
	["Careful: If you attack one cub, the other cubs and often the mother join the fight, so expect to take on several at the same time."] = "Attention : si vous attaquez un ourson, les autres oursons et souvent la mère se joignent au combat : attendez-vous à en affronter plusieurs à la fois.",
	-- {npc:6788} Den Mother
	["{npc:6788}, below ground"] = "{npc:6788}, sous terre",

	-- Step 37: Onu
	-- {quest:948} Onu · {npc:270269} Arbal · {npc:11218} Kerlonian Evershade
	["{quest:948} is the ancient at the Grove; {npc:270269} and {npc:11218} sleep beside him."] = "{quest:948} est l'ancien du Bosquet ; {npc:270269} et {npc:11218} dorment à côté de lui.",

	-- Step 38: Lunar Fungus and Earthroot
	-- {item:15851} Lunar Fungus · {item:2449} Earthroot
	["{item:15851} and {item:2449}"] = "{item:15851} et {item:2449}",
	-- {item:2449} Earthroot · {skill:182} Herbalism · {zone:1439} Darkshore · {zone:1453} Stormwind · {npc:1313} Maria Lumere
	-- plural, as words: Lunar Fungal Blooms = {object:177750} Lunar Fungal Bloom
	["The Lunar Fungal Blooms grow in the moonkin caves in the hills just east of Auberdine; the moonkin there are irritable. {item:2449} needs {skill:182}: herbalists pick it all over {zone:1439}, anyone else brings it from {zone:1453} ({npc:1313}) or the Auction House."] = "Les champignons lunaires poussent dans les grottes des séléniens dans les collines juste à l'est d'Auberdine ; les séléniens y sont irritables. {item:2449} nécessite {skill:182} : les herboristes le cueillent partout en {zone:1439}, les autres l'apportent de {zone:1453} ({npc:1313}) ou de l'Hôtel des ventes.",

	-- Step 39: The Grove of the Ancients
	-- {quest:952} Grove of the Ancients
	["The {quest:952}"] = "{quest:952}",
	-- {quest:1003} Buzzbox 525
	-- plural, as words: Grizzled Thistle Bears = {npc:2165} Grizzled Thistle Bear
	["Grizzled Thistle Bears roam the hills around the Grove; {quest:1003} stands west of it among them."] = "Des Vieux ours des chardons errent dans les collines autour du Bosquet ; {quest:1003} se trouve à l'ouest, parmi eux.",
	-- plural, as words: Grizzled Scalps = {item:5414} Grizzled Scalp
	["Grizzled Scalps"] = "Scalps vieillis",

	-- Step 40: The Master's Glaive
	-- {object:10076} Scrying Bowl · {object:12666} Twilight Tome · {npc:3584} Therylune
	-- plural, as words: Moonstalker Sires = {npc:2237} Moonstalker Sire
	["Moonstalker Sires prowl the woods around the glaive. The {object:10076} and the {object:12666} sit at the bottom of the crater; {npc:3584} stands on its north side."] = "Des Géniteurs traquelunes rôdent dans les bois autour du glaive. Le {object:10076} et le {object:12666} se trouvent au fond du cratère ; {npc:3584} se tient sur son flanc nord.",
	-- plural, as words: Fine Moonstalker Pelts = {item:5386} Fine Moonstalker Pelt
	["Fine Moonstalker Pelts"] = "Belles peaux de traquelune",
	-- {zone:1440} Ashenvale
	["Escort her out of the glaive; Therysil takes the turn-in in {zone:1440}"] = "Escortez-la hors du glaive ; Therysil prend le rendu de quête en {zone:1440}",
	-- {item:5352} Book: The Powers Below
	["Only if a Disciple or Thug dropped {item:5352}: right-click it"] = "Seulement si un Disciple ou un Nervi a laissé tomber {item:5352} : clic droit dessus",
	-- {object:10076} Scrying Bowl
	["The {object:10076}"] = "{object:10076}",
	-- {object:12666} Twilight Tome
	["The {object:12666}"] = "{object:12666}",
	-- {item:279279} Peerless Eye
	-- plural, as words: Twilight Disciples = {npc:2338} Twilight Disciple
	["{item:279279}: Twilight Disciples and Thugs"] = "{item:279279} : Disciples du crépuscule et Nervis du crépuscule",

	-- Step 41: Prospector Remtravel
	-- {npc:10323} Murkdeep
	["Remtravel's Excavation lies on the coast south of {npc:10323}'s beach. Protect the prospector while he searches for the fossil.\nCareful: Ambushers appear as he passes certain spots: a scout comes out from under the board ramp, and more scouts come out when he checks the tent."] = "L'excavation de Remtravel se trouve sur la côte au sud de la plage de {npc:10323}. Protégez le prospecteur pendant qu'il cherche le fossile.\nAttention : Des embusqués apparaissent lorsqu'il passe certains endroits : un éclaireur sort de sous la rampe en planches, et d'autres éclaireurs surgissent quand il inspecte la tente.",

	-- Step 42: Level 18.47
	["Level 18.47"] = "Niveau 18.47",
	-- {quest:952} Grove of the Ancients
	["Top up here to level 18.47 before the hand-ins at {quest:952}: they take you to level 19."] = "Complétez ici jusqu'au niveau 18.47 avant les rendus de {quest:952} : ils vous font passer au niveau 19.",
	-- {npc:2339} Twilight Thug
	["grind on {npc:2339}"] = "tuez en boucle : {npc:2339}",

	-- Step 43: Murkdeep's beach
	-- {npc:10323} Murkdeep
	["{npc:10323}'s beach"] = "La plage de {npc:10323}",
	-- {npc:10323} Murkdeep
	["{npc:10323} camps on the beach west of the glaive: kill the murlocs at the camp fire; he comes in the third wave with his hound. Three beached remains lie on the beaches west and south-west of Remtravel's Excavation."] = "{npc:10323} campe sur la plage à l'ouest de la glaive : tuez les murlocs au feu de camp ; il arrive dans la troisième vague avec son chien. Trois restes échoués gisent sur les plages à l'ouest et au sud-ouest de l'excavation de Remtravel.",

	-- Step 46: Auberdine
	["Follow the road north."] = "Suivez la route vers le nord.",
	-- {quest:87760} Holy Diver · {npc:10219} Gwennyth Bly'Leggonde
	["{quest:87760}: {npc:10219} offers it once all nine beached remains are handed in"] = "{quest:87760} : {npc:10219} la propose une fois les neuf restes échoués rendus",
	-- {item:15826} Curative Animal Salve
	["She gives you the {item:15826}"] = "Elle vous donne le {item:15826}",

	-- Step 47: On the way
	["On the way"] = "En chemin",

	-- Step 48: The Tower of Althalaxx
	-- {npc:3661} Balthule Shadowstrike · {zone:1440} Ashenvale
	-- plural, as words: Dark Strand Fanatics = {npc:2336} Dark Strand Fanatic
	["{npc:3661} hides at the foot of the tower among the Dark Strand Fanatics. Keep his letter for Delgren in {zone:1440}."] = "{npc:3661} se cache au pied de la tour parmi les Fanatiques de la Rive noire. Gardez sa lettre pour Delgren le Purificateur en {zone:1440}.",
	-- {item:5348} Worn Parchment
	-- plural, as words: Dark Strand Fanatics = {npc:2336} Dark Strand Fanatic
	["{item:5348}: Dark Strand Fanatics"] = "{item:5348} : Fanatiques de la Rive noire",

	-- Step 49: The naga
	["The naga"] = "Les nagas",
	-- {quest:951} Mathystra Relics
	-- plural, as words: Stormscale Myrmidons = {npc:2181} Stormscale Myrmidon
	["Follow the coast north-east to the Ruins of Mathystra. {quest:951} lie among the ruins; Stormscale Myrmidons, Sorceresses and Warriors hold them, and Stormscale Beastmistresses walk the shore."] = "Suivez la côte au nord-est jusqu'aux Ruines de Mathystra. {quest:951} gisent parmi les ruines ; les Myrmidons, Sorcières et Guerriers Écaillorage les occupent, et les Maîtresses des bêtes Écaillorage arpentent le rivage.",

	-- Step 50: The Ruins of Mathystra
	["The Ruins of Mathystra"] = "Les Ruines de Mathystra",
	-- {npc:6667} Gelkak Gyromast
	-- plural, as words: Giant Foreststriders = {npc:2323} Giant Foreststrider · Raging Reef Crawlers = {npc:2236} Raging Reef Crawler
	["{npc:6667} hides on the little island off the ruins. The key pieces drop from Giant Foreststriders (top), Greymist murlocs (middle) and Raging Reef Crawlers (bottom)."] = "{npc:6667} se cache sur le petit îlot au large des ruines. Les morceaux de clé tombent des Trotteurs des forêts géants (haut), des murlocs Grisebrume (milieu) et des Clampants des récifs enragés (bas).",
	["Underwater"] = "Sous l'eau",
	-- {item:15883} Half Pendant of Aquatic Agility · {object:177792} Strange Lockbox
	["{item:15883}: the {object:177792} under the water off the north coast, west of the ruins"] = "{item:15883} : l'{object:177792} sous l'eau au large de la côte nord, à l'ouest des ruines",

	-- Step 51: Gyromast's Revenge (group, optional)
	-- {quest:2078} Gyromast's Revenge
	["{quest:2078} (group, optional)"] = "{quest:2078} (groupe, facultatif)",
	-- {npc:6667} Gelkak Gyromast · {npc:6669} Threshwackonator 4100
	["{npc:6667}'s key wakes the {npc:6669} on the shore south of his island; lead it back and it turns hostile near {npc:6667}: a level 20 elite robot. Alone you need a root or a fear: Druids root it and Moonfire from afar, Warlocks dot, Fear and let the Voidwalker hold it, Mages kite with Frost Nova. Melee: come with a friend. Water only resets it."] = "La clé de {npc:6667} réveille {npc:6669} sur la rive au sud de son île ; le ramener, il devient hostile près de {npc:6667} : un robot élite de niveau 20. Seul, il faut une immobilisation ou une peur : druide, Sarments puis Éclat lunaire de loin ; démoniste, sorts sur la durée, Peur et le marcheur du Vide devant ; mage, le promener avec Nova de givre. Corps à corps : venir à deux. L'eau ne fait que le réinitialiser.",
	["The robot, elite level 20"] = "Le robot, élite de niveau 20",

	-- Step 52: Baron Marinous (group, optional)
	-- {quest:98028} Baron Marinous
	["{quest:98028} (group, optional)"] = "{quest:98028} (groupe, facultatif)",
	-- {npc:271903} Stormscale Beastmistress · {quest:87760} Holy Diver · {object:177964} Fathom Stone · {quest:98028} Baron Marinous · {item:279275} Clouded Water Globe
	-- plural, as words: Mathystral Amulet Fragments = {item:279276} Mathystral Amulet Fragment
	["The Stormscale naga of the ruins drop Mathystral Amulet Fragments, about one naga in eleven (the {npc:271903}, for {quest:87760}, nearly one in two): 20 make the amulet at the {object:177964}, down the spiral stairs in the ruins. Using it summons {quest:98028}, a level 21 elite; his {item:279275} starts the quest."] = "Les nagas Écaille-des-tempêtes des ruines lâchent des fragments d'amulette, environ un naga sur onze ({npc:271903}, pour {quest:87760}, presque un sur deux) : 20 forment l'amulette à {object:177964}, en bas de l'escalier en colimaçon des ruines. L'utiliser invoque {quest:98028}, un élite de niveau 21 ; son {item:279275} lance la quête.",
	["Group: everyone hands their fragments to one player (they can be traded, the Auction House sells them too), who summons him once; every member loots a globe. Alone at 20 or more: hide behind a pillar as each cast ends, step out to shoot. He is immune to Frost: Mages use Fire. Stone gone? Someone just summoned him: it comes back in 5 to 10 minutes."] = "En groupe : chacun donne ses fragments à un seul joueur (ils s'échangent, l'hôtel des ventes en vend aussi), qui l'invoque une fois ; chaque membre ramasse un globe. Seul, au niveau 20 ou plus : se cacher derrière un pilier à la fin de chaque incantation, ressortir pour tirer. Il est insensible au Givre : mages en Feu. La pierre a disparu ? Quelqu'un vient de l'invoquer : elle revient en 5 à 10 minutes.",
	-- {item:279276} Mathystral Amulet Fragment · {npc:270269} Arbal
	["{item:279276}: any Stormscale naga, while you kill them for {npc:270269}"] = "{item:279276} : n'importe quel naga Écaille-des-tempêtes, en les tuant pour {npc:270269}",
	-- {item:279277} Mathystral Amulet · {object:177964} Fathom Stone · {quest:98028} Baron Marinous
	["{item:279277}, at the {object:177964}: summons {quest:98028}"] = "{item:279277}, à {object:177964} : invoque {quest:98028}",
	["Elite level 21"] = "Élite de niveau 21",
	-- {item:279275} Clouded Water Globe
	["{item:279275}, from the Baron: right-click it"] = "{item:279275}, sur le baron : clic droit dessus",

	-- Step 53: Mist's Edge: kill these as you meet them
	["Mist's Edge: kill these as you meet them"] = "Bord-de-la-Brume : tuez-les au fur et à mesure.",

	-- Step 54: Back south
	["Back south"] = "Retour au sud",
	-- {npc:3616} Onu
	["{npc:3616}, at the Grove"] = "{npc:3616}, au Bosquet des Anciens",

	-- Step 55: Onu: Baron Marinous
	-- {npc:3616} Onu
	["{npc:3616}: speak to him again afterwards, he has one more thing for you"] = "{npc:3616} : lui reparler ensuite, il a encore quelque chose à donner",

	-- Step 56: Volcor
	-- {npc:3692} Volcor · {item:5387} Enchanted Moonstalker Cloak · {npc:3693} Terenthis
	["{npc:3692} hides in Blackwood Den, in the hills east of the Master's Glaive. Equip the {item:5387} from {npc:3693} and use it near the cave: it slips you past the furbolgs. Then choose his way out."] = "{npc:3692} se cache dans le repaire des Sombrebois, dans les collines à l'est du Glaive du maître. Équiper {item:5387} reçue de {npc:3693} et l'utiliser près de la grotte : elle permet de passer les furbolgs sans être vu. Choisir ensuite sa façon de sortir.",
	-- {npc:3692} Volcor
	["{npc:3692}, inside Blackwood Den"] = "{npc:3692}, dans la Tanière de Bois-Noir",

	-- Step 57: Volcor: Escape Through Force (group)
	-- {npc:3692} Volcor · {quest:994} Escape Through Force
	["{npc:3692}: {quest:994} (group)"] = "{npc:3692} : {quest:994} (groupe)",
	["He charges into the furbolg camp and more furbolgs come even if you cleared it, two shamans healing them. Two or three players; a healer helps."] = "Il fonce dans le camp des furbolgs et d'autres arrivent même camp vidé, avec deux chamans qui les soignent. À deux ou trois ; un soigneur aide.",
	-- {npc:3692} Volcor
	["Help {npc:3692} to the road"] = "Aider {npc:3692} à rejoindre la route",

	-- Step 58: Volcor: Escape Through Stealth
	-- {quest:990} Trek to Ashenvale
	["Alone, the quiet way out: same reward line, same next quest ({quest:990}). Hearth back to Auberdine afterwards."] = "Seul, la sortie discrète : même suite ({quest:990}). Revenir ensuite à Auberdine par la pierre de foyer.",
	-- {npc:3692} Volcor
	["Help {npc:3692} escape the cave"] = "Aider {npc:3692} à quitter la grotte",

	-- Step 59: Darkshore before Auberdine
	-- {zone:1439} Darkshore
	["{zone:1439} before Auberdine"] = "{zone:1439} avant Auberdine",
	-- {npc:12298} Sickly Deer · {item:15826} Curative Animal Salve · {zone:1439} Darkshore
	["{npc:12298}: use the {item:15826} on them; they roam all of {zone:1439}"] = "{npc:12298} : utilisez le {item:15826} sur eux ; ils errent dans tout {zone:1439}",
	-- {npc:2237} Moonstalker Sire
	["grind on {npc:2237}"] = "tuez en boucle : {npc:2237}",

	-- Step 60: Auberdine
	-- {npc:3694} Sentinel Selarin · {npc:3691} Raene Wolfrunner · {zone:1440} Ashenvale
	["{npc:3694}: for {npc:3691} in Astranaar, on the later {zone:1440} leg"] = "{npc:3694} : pour {npc:3691} à Astranaar, lors de l'étape ultérieure en {zone:1440}",

	-- Step 61: Level 20
	["Level 20"] = "Niveau 20",
	-- {zone:1453} Stormwind
	["Top up here to level 20 before the hand-ins at {zone:1453}: they take you to level 21."] = "Complétez ici jusqu'au niveau 20 avant les rendus de quêtes à {zone:1453} : ils vous font passer au niveau 21.",
	-- {npc:2187} Elder Darkshore Thresher
	["grind on {npc:2187}"] = "tuez en boucle : {npc:2187}",

	-- Step 62: Auberdine flight master
	["Auberdine flight master"] = "Maître de vol d'Auberdine",

	-- Step 63: The Great Cat Spirit
	-- {npc:4217} Mathrengyl Bearwalker
	["Night Elves fly from Auberdine to Rut'theran Village; Skyborne take the boat from the Auberdine dock and learn the Rut'theran flight path there. Take the portal up to {npc:4217} in the Cenarion Enclave."] = "Les Elfes de la nuit volent d'Auberdine au village de Rut'theran ; les Éolides prennent le bateau au quai d'Auberdine et y apprennent le point de vol de Rut'theran. Prenez le portail pour monter jusqu'à {npc:4217} dans l'Enclave cénarienne.",

	-- Step 67: Dendrite Starblaze
	-- {zone:1450} Moonglade · {npc:11802} Dendrite Starblaze
	["Cast Teleport: {zone:1450}. {npc:11802} stands upstairs in his building in Nighthaven: go up inside, the arrow cannot tell the floors apart. Learn the flight path there if you do not have it."] = "Lancez Téléportation : {zone:1450}. {npc:11802} se tient à l'étage de son bâtiment à Reflet-de-Lune : montez par l'intérieur, la flèche ne distingue pas les étages. Apprenez le point de vol là-bas si vous ne l'avez pas.",

	-- Step 68: Dendrite Starblaze
	-- {npc:11802} Dendrite Starblaze
	["{npc:11802} stands upstairs in his building in Nighthaven: go up inside, the arrow cannot tell the floors apart."] = "{npc:11802} se tient à l'étage de son bâtiment à Reflet-de-Lune : montez par l'intérieur, la flèche ne distingue pas les étages.",
	-- {npc:11802} Dendrite Starblaze
	["{npc:11802}: the welcome from Sheldras"] = "{npc:11802} : le message de bienvenue de Sheldras Moontree",

	-- Step 70: The relics of the Barrow Dens
	["The relics of the Barrow Dens"] = "Les reliques du Refuge des saisons",
	-- {quest:98394} The Great Cat Spirit · {npc:272054} Avatar of Saeyleenan · {zone:1450} Moonglade · {object:177116} Stormrage Barrow Dens
	["{quest:98394} (Night Elves) and the {npc:272054} (Skyborne) wait in southern {zone:1450}. The three relics lie in the {object:177116}, east of them. Reports from the first weeks say a relic gives no loot while another player is looting it: wait a moment and try again."] = "{quest:98394} (Elfes de la nuit) et le {npc:272054} (Célestes) attendent au sud de {zone:1450}. Les trois reliques se trouvent dans le {object:177116}, à l'est d'eux. Les rapports des premières semaines indiquent qu'une relique ne donne pas de butin tant qu'un autre joueur la pille : attendez un instant et réessayez.",

	-- Step 71: Back to Dendrite Starblaze
	-- {npc:11802} Dendrite Starblaze
	["Back to {npc:11802}"] = "Retour auprès de {npc:11802}",
	-- {npc:11802} Dendrite Starblaze · {npc:11800} Silva Fil'naveth
	["Back to {npc:11802} in Nighthaven, then {npc:11800} there flies Druids straight to Rut'theran Village. {npc:11802} stands upstairs in his building: go up inside, the arrow cannot tell the floors apart."] = "Retournez auprès de {npc:11802} à Reflet-de-Lune, puis {npc:11800} y fait voler les druides directement au village de Rut'theran. {npc:11802} se tient à l'étage de son bâtiment : montez par l'intérieur, la flèche ne distingue pas les étages.",

	-- Step 73: To Darnassus
	-- {npc:4217} Mathrengyl Bearwalker · {zone:1453} Stormwind
	["Take the portal up to {npc:4217}, then fly back to Auberdine for the boat to {zone:1453}."] = "Prenez le portail jusqu'à {npc:4217}, puis volez de retour à Auberdine pour prendre le bateau vers {zone:1453}.",
	-- {npc:4217} Mathrengyl Bearwalker
	["{npc:4217}: Cat Form"] = "{npc:4217} : Forme de félin",
	-- {npc:4217} Mathrengyl Bearwalker
	["{npc:4217}: Cure Poison"] = "{npc:4217} : Guérison du poison",

	-- No longer in the guide (its English changed or it went away): reuse or delete.
	-- ["At the {area:2362}"] = "Au {area:2362}",
	-- ["Back to {npc:11802} in Nighthaven, then {npc:11800} there flies Druids straight to Rut'theran Village."] = "Retournez auprès de {npc:11802} à Reflet-de-Lune, puis {npc:11800} y fait voler les druides directement au village de Rut'theran.",
	-- ["Back to {npc:11802} in {area:2361}, then fly to {area:702} (by way of {area:442})."] = "Retournez voir {npc:11802} à {area:2361}, puis volez jusqu'au {area:702} (en passant par {area:442}).",
	-- ["Back to {npc:11802} in {area:2361}, then {npc:11800} there flies Druids straight to {area:702}."] = "Retournez voir {npc:11802} à {area:2361}, puis {npc:11800}, sur place, emmène les Druides en vol directement au {area:702}.",
	-- ["Blackwood Pathfinders and Windtalkers hold the camp south-east of {area:442}."] = "Des Guides Noirbois et des Messagers du Vent Noirbois tiennent le camp au sud-est d'{area:442}.",
	-- ["Boat to {zone:1453}"] = "Bateau pour {zone:1453}",
	-- ["Cast Teleport: {zone:1450}. {npc:11802} is in Nighthaven. Shrine Baubles lie in the containers on the floor of Lake Elune'ara, below Nighthaven: take one to the {object:177117} in the north-west, use it there and speak to {npc:11799}. Then fly back to Auberdine from Nighthaven."] = "Lancez Téléportation : {zone:1450}. {npc:11802} se trouve à Reflet-de-Lune. Les bibelots du sanctuaire gisent dans les conteneurs au fond du lac Elune'ara, sous Reflet-de-Lune : prenez-en un jusqu'au {object:177117} au nord-ouest, utilisez-le là et parlez à {npc:11799}. Puis volez de retour à Auberdine depuis Reflet-de-Lune.",
	-- ["Cast Teleport: {zone:1450}. {npc:11802} is in Nighthaven; learn the flight path there if you do not have it."] = "Lancez Téléportation : {zone:1450}. {npc:11802} se trouve à Reflet-de-Lune ; apprenez le point de vol là-bas si vous ne l'avez pas.",
	-- ["Cast {spell:18960}"] = "Lancez {spell:18960}",
	-- ["Cast {spell:18960}. {npc:11802} is in {area:2361}. Shrine Baubles lie in the containers on the floor of {area:656}, below {area:2361}: take one to the {area:2362} in the north-west, use it there and speak to {npc:11799}. Then fly back to {area:442} from {area:2361}."] = "Lancez {spell:18960}. {npc:11802} est à {area:2361}. Des Colifichets du sanctuaire se trouvent dans les récipients au fond du {area:656}, en contrebas de {area:2361} : apportez-en un au {area:2362}, au nord-ouest, utilisez-le là-bas et parlez à {npc:11799}. Puis revenez en vol à {area:442} depuis {area:2361}.",
	-- ["Cast {spell:18960}. {npc:11802} is in {area:2361}; learn the flight path there if you do not have it."] = "Lancez {spell:18960}. {npc:11802} est à {area:2361} ; apprenez-y le trajet aérien si vous ne l'avez pas.",
	-- ["Climb the eastern mountains east of {area:447}; the {object:175524} sits on a ledge."] = "Escaladez les montagnes à l'est d'{area:447} ; le {object:175524} repose sur une corniche.",
	-- ["Fly from {area:442} to {area:702} and take the portal up to {npc:4217} in the {area:1658}."] = "Volez d'{area:442} au {area:702} et prenez le portail pour monter jusqu'à {npc:4217} dans l'{area:1658}.",
	-- ["Follow the coast north-east to the {area:443}. {quest:951} lie among the ruins; Stormscale Myrmidons, Sorceresses and Warriors hold them, and Stormscale Beastmistresses walk the shore."] = "Suivez la côte au nord-est jusqu'aux {area:443}. Les {quest:951} se trouvent parmi les ruines ; des Myrmidons Tempécaille, des Ensorceleuses Tempécaille et des Guerriers Tempécaille les gardent, et des Maîtresses des bêtes tempécaille arpentent la côte.",
	-- ["Follow the coast north-east to the {area:443}. {quest:951} lie among the ruins; Stormscale Myrmidons, Sorceresses and Warriors hold them."] = "Suivez la côte au nord-est jusqu'aux {area:443}. Les {quest:951} se trouvent parmi les ruines ; des Myrmidons Tempécaille, des Ensorceleuses Tempécaille et des Guerriers Tempécaille les gardent.",
	-- ["Follow the coast south past {area:447}: one {quest:4728} lies on the shore west of the Grove, another further south near {area:450}."] = "Suivez la côte vers le sud au-delà d'{area:447} : une {quest:4728} gît sur la côte à l'ouest du Bosquet des Anciens, une autre plus au sud près de l'{area:450}.",
	-- ["Follow the coast south past {area:447}: one {quest:4728} lies on the shore west of the Grove, another further south near {area:450}. Three more remains lie further south-west among Greymist Oracles and Tidehunters (18-20): the guide leaves them for the last loop, when you are closer to their level."] = "Suivez la côte vers le sud au-delà d'{area:447} : une {quest:4728} gît sur la côte à l'ouest du Bosquet des Anciens, une autre plus au sud près de l'{area:450}. Trois autres restes gisent plus au sud-ouest parmi les Oracles Grisebrume et les Chasse-marée Grisebrume (18-20) : le guide les garde pour la dernière boucle, quand vous serez plus proche de leur niveau.",
	-- ["Follow the hills north to the {area:456} and up to the falls. Three more beached remains lie on the north shore: near the {area:443}, north of {quest:954} and west of {quest:954}."] = "Suivez les collines vers le nord jusqu'à la {area:456} et remontez jusqu'aux chutes. Trois autres restes échoués gisent sur la côte nord : près des {area:443}, au nord de {quest:954} et à l'ouest de {quest:954}.",
	-- ["Follow the hills north to the {area:456} and up to the falls. Two more beached remains lie on the north shore: near the {area:443} and north of {quest:954}."] = "Suivez les collines vers le nord jusqu'à la {area:456} et remontez jusqu'aux chutes. Deux autres restes échoués gisent sur la côte nord : près des {area:443} et au nord de {quest:954}.",
	-- ["Follow the road south. {quest:948} is the ancient at the Grove; {npc:270269} and {npc:11218} sleep beside him."] = "Suivez la route vers le sud. {quest:948} est l'ancien du Bosquet des Anciens ; {npc:270269} et {npc:11218} dorment à côté de lui.",
	-- ["Group: highest player at most 4 levels above the lowest. Above 19? Wait for the others."] = "Groupe : le plus haut au maximum 4 niveaux au-dessus du plus bas. Au-delà de 19 ? Attendre les autres.",
	-- ["Hearth to Auberdine"] = "Pierre de foyer à Auberdine",
	-- ["Hearth to {area:442}"] = "Pierre de foyer vers {area:442}",
	-- ["Hearthstone on cooldown? Follow the coast road back south."] = "Pierre de foyer en recharge ? Suivez la route côtière vers le sud.",
	-- ["Kill Rabid Thistle Bears in the hills east of {area:442}, then walk up to the furbolg camp south-east of them: nothing to kill yet."] = "Tuez des Ours des chardons enragés dans les collines à l'est d'{area:442}, puis montez jusqu'au camp de furbolgs au sud-est : rien à tuer pour l'instant.",
	-- ["Night Elves fly from {area:442} to {area:702}; Skyborne take the boat from the {area:442} dock and learn the Rut'theran flight path there. Take the portal up to {npc:4217} in the {area:1658}."] = "Les Elfes de la nuit volent d'{area:442} au {area:702} ; les Éolides prennent le bateau au quai d'{area:442} et y apprennent la route aérienne de Rut'theran. Prenez le portail pour monter jusqu'à {npc:4217} dans l'{area:1658}.",
	-- ["North along the hills. {npc:3650} waits in the ruins of {quest:954}; Wild Grells and Vile Sprites fill them, Deth'ryll Satyrs the eastern edge. {quest:1001} stands by the road west of the ruins."] = "Au nord, le long des collines. {npc:3650} attend dans les ruines de {quest:954} ; des Grells sauvages et des Fées viles les peuplent, des Satyres Deth'ryll en occupent la lisière est. {quest:1001} se trouve près de la route à l'ouest des ruines.",
	-- ["Rabid Thistle Bears roam the hills just east of {area:442}. Use {quest:2139} on one and lead it back to him."] = "Les Ours des chardons enragés errent dans les collines juste à l'est d'{area:442}. Utilisez {quest:2139} sur l'un d'eux et ramenez-le-lui.",
	-- ["Read both tablets"] = "Lisez les deux tablettes",
	-- ["Scaber Stalks"] = "Pédoncules d'amanite",
	-- ["Take the portal up to {npc:4217}, then fly back to {area:442} for the boat to {zone:1453}."] = "Prenez le portail pour monter jusqu'à {npc:4217}, puis revolez à {area:442} pour le bateau vers {zone:1453}.",
	-- ["The Lunar Fungal Blooms grow in the moonkin caves in the hills just east of {area:442}; the moonkin there are irritable. {item:2449} needs {skill:182}: herbalists pick it all over {zone:1439}, anyone else brings it from {zone:1453} ({npc:1313}) or the Auction House."] = "Les Floraisons fongiques lunaires poussent dans les grottes des séléniens, dans les collines juste à l'est d'{area:442} ; les Séléniens y sont irritables. La {item:2449} demande la compétence {skill:182} : les herboristes en cueillent partout en {zone:1439}, les autres l'apportent de {zone:1453} ({npc:1313}) ou de l'hôtel des ventes.",
	-- ["The boat docks west of the village. The flight master stands on the hill south of the inn; the quest givers are spread along the main street."] = "Le bateau accoste à l'ouest du village. Le maître de vol se tient sur la colline au sud de l'auberge ; les donneurs de quêtes sont répartis le long de la rue principale.",
	-- ["The cave lies south of the falls: Scaber Stalks grow all through it, the {item:5270} at the very back. The {npc:6788} lairs in the hills south of the falls; {object:177624} lies at the satyr camp north of her."] = "La grotte se trouve au sud des chutes : des Pédoncules d'amanite ({item:5271}) poussent partout à l'intérieur, {item:5270} tout au fond. {npc:6788} a son repaire dans les collines au sud des chutes ; {object:177624} se trouve au camp des satyres au nord de celle-ci.",
	-- ["The cave lies south of the falls: Scaber Stalks grow all through it, the {item:5270} at the very back. {area:364} Mother lairs in the hills south of the falls; {object:177624} lies at the satyr camp north of her."] = "La grotte se trouve au sud des chutes : des Pédoncules d'amanite poussent partout à l'intérieur, l'{item:5270} tout au fond. La Mère de la {area:364} niche dans les collines au sud des chutes ; le {object:177624} se trouve au camp des satyres au nord de son repaire.",
	-- ["The flame burns in the south of {area:447}."] = "La flamme brûle au sud d'{area:447}.",
	-- ["The furbolg camp south of the {area:456} keeps its Nut, Fruit and Grain Stores by the bonfires. With a sample of each and the {item:12347} in your bags (the {item:12346} is filled at the {object:174795}), use the bowl by the bonfire closest to the river: it summons Xabraxxis, the satyr corruptor, and the {item:12355} lies in his Demon Bag."] = "Le camp de furbolgs au sud de la {area:456} garde ses réserves de noix, de fruits et de céréales près des feux de joie. Avec un échantillon de chaque et le {item:12347} dans vos sacs (le {item:12346} se remplit au {object:174795}), utilisez le bol près du feu le plus proche de la rivière : il invoque Xabraxxis, le corrupteur satyre, et le {item:12355} se trouve dans son sac démoniaque.",
	-- ["The {area:443}"] = "{area:443}",
	-- ["The {area:448}"] = "{area:448}",
	-- ["Thresher Eyes"] = "Yeux de batteur",
	-- ["Tide Crawlers scuttle along the shore below the village; {quest:983} stands on the beach just south of the docks. Darkshore Threshers swim in the shallows. The {quest:4723} lies on the shore just south of the village."] = "Des Clampants des marées ({npc:2232}) rôdent sur le rivage sous le village ; {quest:983} se dresse sur la plage juste au sud des quais. Des Batteurs de Sombrivage ({npc:2185}) nagent dans les hauts-fonds. {quest:4723} gît sur le rivage juste au sud du village.",
	-- ["Tide Crawlers scuttle along the shore below the village; {quest:983} stands on the beach just south of the docks. {zone:1439} Threshers swim in the shallows. The {quest:4723} lies on the shore just south of the village."] = "Les Clampants des marées grouillent sur la côte en contrebas du village ; {quest:983} se trouve sur la plage juste au sud des quais. Les Batteurs de {zone:1439} nagent dans les hauts-fonds. La {quest:4723} gît sur la côte juste au sud du village.",
	-- ["Two wrecks lie on the sea floor in the bay north of {area:442}; each holds a lockbox. Reef Crawlers and Encrusted Tide Crawlers line this shore."] = "Deux épaves reposent au fond de la baie au nord d'{area:442} ; chacune contient un coffret. Des Clampants des récifs et des Clampants des marées incrustés longent cette côte.",
	-- ["Two wrecks lie on the sea floor in the bay north of {area:442}; each holds a lockbox. Reef Crawlers and Encrusted Tide Crawlers line this shore.\nCareful: The murlocs inside the wrecks are close together and fast. They often swim through the hull walls and holes, so you will usually pull extra murlocs."] = "Deux épaves reposent au fond de la mer dans la baie au nord d'{area:442} ; chacune contient un coffret. Des Clampants des récifs et des Clampants des marées incrustés bordent ce rivage.\nAttention : les murlocs dans les épaves sont proches les uns des autres et rapides. Ils traversent souvent les parois et les trous de la coque : vous en attirerez généralement d'autres.",
	-- ["{area:442} flight master"] = "Maître de vol d'{area:442}",
	-- ["{area:450} lies on the coast south of {npc:10323}'s beach. Protect the prospector while he searches for the fossil."] = "L'{area:450} se trouve sur la côte au sud de la plage de {npc:10323}. Protégez le prospecteur pendant qu'il cherche le fossile.",
	-- ["{area:450} lies on the coast south of {npc:10323}'s beach. Protect the prospector while he searches for the fossil.\nCareful: Ambushers appear as he passes certain spots: a scout comes out from under the board ramp, and more scouts come out when he checks the tent."] = "{area:450} se trouve sur la côte au sud de la plage de {npc:10323}. Protégez le prospecteur pendant qu'il cherche le fossile.\nAttention : des embusqués apparaissent quand il passe à certains endroits : un éclaireur sort de sous la rampe en planches, et d'autres éclaireurs sortent quand il fouille la tente.",
	-- ["{area:452}: kill these as you meet them"] = "{area:452} : tuez-les au passage",
	-- ["{item:12237} on the way"] = "{item:12237} en chemin",
	-- ["{item:12289}, on the beach west of the docks"] = "{item:12289}, sur la plage à l'ouest des quais",
	-- ["{item:15883}: the {object:177790} under the water off the north coast, west of the ruins"] = "{item:15883} : le {object:177790} sous l'eau au large de la côte nord, à l'ouest des ruines",
	-- ["{item:279276}: any Stormscale naga, along with Swelling Seas"] = "{item:279276} : n'importe quel naga Écaille-des-tempêtes, en même temps que la quête des nagas",
	-- ["{item:5414} on the way"] = "{item:5414} en chemin",
	-- ["{npc:10323} camps on the beach west of the glaive: kill the murlocs at the camp fire; he comes in the third wave with his hound. Three beached remains lie on the beaches south of {area:450}."] = "{npc:10323} campe sur la plage à l'ouest du glaive : tuez les murlocs autour du feu de camp ; il arrive à la troisième vague avec son chien. Trois restes échoués gisent sur les plages au sud de l'{area:450}.",
	-- ["{npc:10323} camps on the beach west of the glaive: kill the murlocs at the camp fire; he comes in the third wave with his hound. Three beached remains lie on the beaches west and south-west of {area:450}."] = "{npc:10323} campe sur la plage à l'ouest du glaive : tuez les murlocs autour du feu de camp ; il arrive à la troisième vague avec son chien. Trois restes échoués gisent sur les plages à l'ouest et au sud-ouest de l'{area:450}.",
	-- ["{npc:11218}: his escort to {area:413} is done on the {zone:1440} leg"] = "{npc:11218} : son escorte jusqu'au {area:413} se fait lors du passage en {zone:1440}",
	-- ["{npc:11218}: his escort to {object:19863} is done on the {zone:1440} leg"] = "{npc:11218} : son escorte jusqu'à {object:19863} se fait lors de l'étape {zone:1440}",
	-- ["{npc:3666}, by the inn"] = "{npc:3666}, près de l'auberge",
	-- ["{npc:3692} hides in the hills east of the Master's Glaive. Help him back to the road; he fights on his way out."] = "{npc:3692} se cache dans les collines à l'est du Glaive du Maître. Aidez-le à regagner la route ; il se bat en chemin.",
	-- ["{npc:3692} hides in the hills east of the {area:449}. Help him back to the road; he fights on his way out."] = "{npc:3692} se cache dans les collines à l'est du {area:449}. Aidez-le à regagner la route ; il se bat en chemin.",
	-- ["{npc:3692}, inside {area:455}"] = "{npc:3692}, à l'intérieur de {area:455}",
	-- ["{npc:3694}: for {npc:3691} in {area:415}, on the later {zone:1440} leg"] = "{npc:3694} : pour {npc:3691} à {area:415}, lors du passage ultérieur en {zone:1440}",
	-- ["{npc:4217}: Cat Form"] = "{npc:4217} : Forme de félin",
	-- ["{npc:4217}: Cure Poison"] = "{npc:4217} : Guérison du poison",
	-- ["{npc:6667} hides on the little island off the ruins; Stormscale Beastmistresses walk the shore. The key pieces drop from Giant Foreststriders (top), Greymist murlocs (middle) and Raging Reef Crawlers (bottom)."] = "{npc:6667} se cache sur le petit îlot au large des ruines ; des Maîtresses des bêtes tempécaille arpentent la côte. Les morceaux de clé tombent des Trotteurs des forêts géants (haut), des murlocs Grisebrume (milieu) et des Clampants des récifs enragés (bas).",
	-- ["{quest:1003} stands west of the Grove."] = "{quest:1003} se trouve à l'ouest du Bosquet des Anciens.",
	-- ["{quest:6122}: fill the sampler at {area:445}"] = "{quest:6122} : remplissez l'échantillonneur aux {area:445}",
	-- ["{quest:98394} (Night Elves) and the {npc:272054} (Skyborne) wait in southern {area:493}. The three relics lie in the {area:2363}, east of them. Reports from the first weeks say a relic gives no loot while another player is looting it: wait a moment and try again."] = "{quest:98394} (Elfes de la nuit) et l'{npc:272054} (Éolides) attendent au sud de {area:493}. Les trois reliques se trouvent dans les {area:2363}, à l'est. D'après les retours des premières semaines, une relique ne donne rien pendant qu'un autre joueur la fouille : attendez un instant et réessayez.",
}
