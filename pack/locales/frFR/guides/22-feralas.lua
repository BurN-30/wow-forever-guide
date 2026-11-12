-- French (frFR): the guide groupe-alliance/22-feralas (guides/22-feralas.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1444} Feralas
	["Group 20 · {zone:1444}"] = "Groupe 20 · {zone:1444}",

	-- Step 1: Into The Barrens
	-- {zone:1413} The Barrens
	["Into {zone:1413}"] = "Dans les {zone:1413}",
	["Everyone at their own pace: what you already did ticks itself, the guide picks up where you are. Playing together? Group XP is best within 4 levels."] = "Chacun à son rythme : ce qui est déjà fait se coche tout seul, le guide reprend où vous en êtes. En groupe ? L'XP de groupe est meilleure à 4 niveaux d'écart ou moins.",

	-- Step 2: Razorfen Downs (dungeon, optional)
	["Razorfen Downs (dungeon, optional)"] = "Souilles de Tranchebauge (donjon, facultatif)",
	-- {zone:1413} The Barrens · {object:19844} Great Lift · {npc:12866} Myriam Moonsinger · {zone:1444} Feralas
	["Razorfen Downs: a 5-player dungeon at the southern edge of the {zone:1413}, levels 35 to 41, east of the road down to the {object:19844}. At 43 or so it goes fast. {npc:12866} waits on a hill outside it. Alone? Skip it: the guide goes on to {zone:1444}."] = "Souilles de Tranchebauge : un donjon pour 5 joueurs au sud de {zone:1413}, niveaux 35 à 41, à l'est de la route qui descend vers {object:19844}. Vers 43, il va vite. {npc:12866} attend sur une colline devant. Seul ? Le passer : le guide continue vers {zone:1444}.",
	-- {quest:3636} Bring the Light · {npc:1284} Archbishop Benedictus · {zone:1453} Stormwind · {npc:12866} Myriam Moonsinger · {npc:8516} Belnistrasz
	["In the quest log before going in: {quest:3636} ({npc:1284}, {zone:1453}, Group 18). {npc:12866}'s quest is taken here; {npc:8516}'s two inside. Keep 3 free quest log slots."] = "Dans le journal avant d'entrer : {quest:3636} ({npc:1284}, {zone:1453}, Groupe 18). La quête de {npc:12866} se prend ici ; les deux de {npc:8516} à l'intérieur. Garder 3 places libres dans le journal.",
	-- {npc:12866} Myriam Moonsinger
	["{npc:12866}, on a hill outside"] = "{npc:12866}, sur une colline devant le donjon",

	-- Step 3: Razorfen Downs: outside the portal
	["Razorfen Downs: outside the portal"] = "Souilles de Tranchebauge : devant le portail",
	-- {quest:6626} A Host of Evil
	["The three targets of {quest:6626} live outside the portal, among the barrows and thorns (elites, 33)."] = "Les trois cibles de {quest:6626} sont devant le portail, parmi les tertres et les ronces (élites, 33).",

	-- Step 4: Razorfen Downs: Belnistrasz
	-- {npc:8516} Belnistrasz
	["Razorfen Downs: {npc:8516}"] = "Souilles de Tranchebauge : {npc:8516}",
	-- {npc:8516} Belnistrasz · {quest:3523} Scourge of the Downs · {quest:3525} Extinguishing the Idol
	["{npc:8516} waits in a prison cell inside. His quests cannot be shared: every player takes {quest:3523} and hands it in to him (he wants his Oathstone back) BEFORE anyone starts {quest:3525}. Then he walks to the idol and casts while waves of enemies come: stay close and keep them off him; it ends at his brazier."] = "{npc:8516} attend dans une cellule à l'intérieur. Ses quêtes ne se partagent pas : chaque joueur prend {quest:3523} et la lui rend (il veut récupérer sa pierre de serment) AVANT que quiconque lance {quest:3525}. Il marche alors jusqu'à l'idole et incante pendant que des vagues d'ennemis arrivent : rester près de lui et les tenir loin ; cela finit à son brasero.",
	["Protect him at the idol"] = "Le protéger à l'idole",

	-- Step 5: Razorfen Downs: Amnennar the Coldbringer
	-- {npc:7358} Amnennar the Coldbringer
	["Razorfen Downs: {npc:7358}"] = "Souilles de Tranchebauge : {npc:7358}",
	["The last boss (elite 41), at the far end."] = "Le dernier boss (élite 41), tout au fond.",

	-- Step 7: Thalanaar flight master
	["Thalanaar flight master"] = "Maître de vol de Thalanaar",

	-- Step 8: Boat to Feathermoon Stronghold
	-- {object:152576} Feathermoon Stronghold
	["Boat to {object:152576}"] = "Bateau pour {object:152576}",

	-- Step 9: Feathermoon Stronghold
	-- {object:152576} Feathermoon Stronghold · {npc:7880} Ginro Hearthkindle
	["{object:152576} stands on Sardor Isle, off the Forgotten Coast: the boat from the coast's dock crosses to it. {npc:7880} stands upstairs in his building: go up inside, the arrow cannot tell the floors apart."] = "{object:152576} se trouve sur l'île de Sardor, au large de la Côte oubliée : le bateau depuis le quai de la côte y mène. {npc:7880} se tient à l'étage dans son bâtiment : montez à l'intérieur, la flèche ne distingue pas les étages.",
	-- {npc:3936} Shandris Feathermoon
	["{npc:3936}, beside him"] = "{npc:3936}, à côté de lui",
	-- {npc:7877} Latronicus Moonspear
	["{npc:7877}, at the top of the stronghold"] = "{npc:7877}, au sommet du bastion",
	-- {npc:7764} Troyas Moonbreeze
	["{npc:7764}: his answer waits in Rut'theran Village, later"] = "{npc:7764} : sa réponse attend à Rut'theran Village, plus tard",

	-- Step 10: Ruins of Solarsal
	["Ruins of Solarsal"] = "Ruines de Solarsal",
	["Walk south along the island to the naga ruins; the gazebo stands among them."] = "Marchez vers le sud sur l'île jusqu'aux ruines nagas ; le belvédère se trouve parmi elles.",

	-- Step 12: Hatecrest naga
	["Hatecrest naga"] = "Nagas Hainecrête",
	["Back to the Ruins of Solarsal. Every Hatecrest naga there can drop scales."] = "Retour aux ruines de Solarsal. Chaque naga Hatecrest sur place peut laisser des écailles.",

	-- Step 13: Feathermoon Stronghold
	-- {npc:8136} Lord Shalzaru
	["{npc:8136} waits for the end of the mainland loop."] = "{npc:8136} attend la fin de la boucle sur le continent.",

	-- Step 14: Boat to The Forgotten Coast
	["Boat to The Forgotten Coast"] = "Bateau pour la Côte oubliée",

	-- Step 16: The courier's boat
	["The courier's boat"] = "Le bateau du messager",
	["Take the boat to the Forgotten Coast and follow the shore south to the wrecked row boat on the beach."] = "Prenez le bateau pour la Côte oubliée et suivez le rivage vers le sud jusqu'au canot détruit sur la plage.",

	-- Step 17: Gordunni ogres
	["Gordunni ogres"] = "Les ogres Gordunni",
	["Ride east to the Gordunni camp in the hills south-east of the yeti valley: Warlocks and Shaman hold the camp, Brutes wander the slopes around it and further north."] = "Chevauchez vers l'est jusqu'au camp Gordunni dans les collines au sud-est de la vallée des yétis : des Démonistes Gordunni et des Chamans Gordunni tiennent le camp, des Brutes Gordunni errent sur les pentes alentour et plus au nord.",

	-- Step 18: Feral Scar Vale
	["Feral Scar Vale"] = "Val des Griffes farouches",
	-- {npc:5346} Bloodroar the Stalker
	["Ride north into the yeti valley. Every Feral Scar yeti can drop a thick hide; {npc:5346} (level 48) prowls the middle."] = "Chevauchez vers le nord dans la vallée des yétis. Tout Yéti Griffe farouche peut laisser tomber une peau épaisse ; {npc:5346} (niveau 48) rôde au milieu.",

	-- Step 19: Feathermoon Stronghold
	-- {npc:7880} Ginro Hearthkindle
	["{npc:7880} stands upstairs in his building: go up inside, the arrow cannot tell the floors apart."] = "{npc:7880} se tient à l'étage dans son bâtiment : montez à l'intérieur, la flèche ne distingue pas les étages.",
	-- {npc:7879} Quintis Jonespyre
	["{npc:7879}, upstairs"] = "{npc:7879}, à l'étage",

	-- Step 22: Isle of Dread
	["Isle of Dread"] = "Île de l'effroi",
	-- {npc:8136} Lord Shalzaru
	-- plural, as words: Hatecrest Serpent Guards = {npc:5333} Hatecrest Serpent Guard
	["The Isle of Dread is the island just south of Sardor Isle: swim over. Hatecrest Serpent Guards and Sorceresses hold it; {npc:8136} (level 47) waits in the cave at its south end. Pull his guards first."] = "L'Île de l'effroi est l'île juste au sud de l'île de Sardor : rejoignez-la à la nage. Des gardes-serpents et des ensorceleuses Hainecrête l'occupent ; {npc:8136} (niveau 47) attend dans la grotte à son extrémité sud. Attirez d'abord ses gardes.",
	-- {item:9248} Mysterious Relic
	["{item:9248}; below ground"] = "{item:9248} ; sous terre",

	-- Step 25: Fly to Thalanaar
	["Fly to Thalanaar"] = "Envolez-vous pour Thalanaar",
	["Feathermoon flight master"] = "Maître de vol de Plumelune",

	-- Step 27: Grimtotem camp
	["Grimtotem camp"] = "Le camp Totem sinistre",
	-- {zone:1444} Feralas · {npc:7956} Kindal Moonweaver
	-- plural, as words: Sprite Darters = {npc:5278} Sprite Darter
	["Boat to the Forgotten Coast and ride east across {zone:1444} to the Grimtotem camp north of the road. {npc:7956} waits outside it; free the Sprite Darters from the pen in the middle and keep {npc:7956} and at least six of them alive."] = "Prenez le bateau pour la Côte oubliée et traversez les {zone:1444} vers l'est jusqu'au camp du Totem sinistre au nord de la route. {npc:7956} attend à l'extérieur ; libérez les fées fléchetteuses de l'enclos au centre et gardez {npc:7956} et au moins six d'entre elles en vie.",

	-- Step 28: Grimtotem tauren
	["Grimtotem tauren"] = "Taurens Totem sinistre",

	-- Step 29: Jer'kai Moonweaver
	-- {zone:1457} Darnassus
	["for Tyrande in {zone:1457}: the route takes you there at 47"] = "pour Tyrande Whisperwind à {zone:1457} : l'itinéraire vous y mène au niveau 47",

	-- Step 30: The Writhing Deep
	["Ride south-east to the Woodpaw gnolls; the courier's backpacks lie in their southern camp, and a parcel inside them starts a delivery to Thalanaar. The Zukk'ash hive is just south: fight down to the pod that holds Raschal, free him and keep him alive on the way out."] = "Allez au sud-est vers les gnolls Woodpaw ; les sacs du courrier se trouvent dans leur camp sud, et un colis à l'intérieur lance une livraison vers Thalanaar. La ruche Zukk'ash est juste au sud : frayez un chemin jusqu'à la cosse qui retient Raschal, libérez-le et gardez-le en vie sur le chemin du retour.",
	-- {item:11463} Undelivered Parcel
	["{item:11463}, from the backpacks"] = "{item:11463}, dans les sacs à dos",
	-- {object:164954} Zukk'ash Pod
	["{object:164954}, inside"] = "{object:164954}, à l'intérieur",

	-- Step 31: High Wilderness: kill these as you meet them
	-- {object:152577} High Wilderness
	["{object:152577}: kill these as you meet them"] = "{object:152577} : tuez-les au fur et à mesure",
	-- {quest:7735} Pristine Yeti Hide · {npc:7852} Pratt McGrubben
	["Ride back west along the road, then north into the Rage Scar hills. Every yeti here can drop a hide; one may drop a {quest:7735}, which {npc:7852} pays for too."] = "Revenez vers l'ouest par la route, puis montez au nord dans les collines du Repaire des Griffes féroces. Tout yéti ici peut laisser tomber une peau ; l'un d'eux peut donner une {quest:7735}, que {npc:7852} McGrubben paie aussi.",

	-- Step 32: Rage Scar Hold
	["Rage Scar Hold"] = "Repaire des Griffes féroces",

	-- Step 34: Feathermoon Stronghold
	-- {npc:3936} Shandris Feathermoon · {zone:1457} Darnassus
	["{npc:3936} then asks you to carry news to {zone:1457}: skip it, Gadgetzan sends you there instead."] = "{npc:3936} vous demande ensuite d'apporter des nouvelles à {zone:1457} : ignorez, Gadgetzan vous y enverra à la place.",

	-- Step 35: Grind to 45
	["Grind to 45"] = "Farmer jusqu'au niveau 45",
	-- {npc:14637} Zorbin Fandazzle
	["Boat to the Forgotten Coast and ride east into Feral Scar Vale. {npc:14637}'s quests on the coast need level 45."] = "Prenez le bateau pour la Côte oubliée et allez vers l'est dans le Val des Griffes farouches. Les quêtes de {npc:14637} sur la côte nécessitent le niveau 45.",
	-- {npc:5292} Feral Scar Yeti · {zone:1444} Feralas
	["grind on {npc:5292} at Feral Scar Vale, {zone:1444}"] = "Farmez {npc:5292} au Val des Griffes farouches, {zone:1444}",

	-- Step 37: Zorbin Fandazzle
	["Ride back to the Forgotten Coast; the goblin stands by the dock."] = "Retournez à la Côte oubliée ; le gobelin se tient près du quai.",

	-- Step 38: The Forgotten Coast: kill these as you meet them
	["The Forgotten Coast: kill these as you meet them"] = "La Côte oubliée : tuez-les au fur et à mesure",
	-- {item:18904} Zorbin's Ultra-Shrinker
	-- plural, as words: Shore Striders = {npc:5359} Shore Strider · Deep Striders = {npc:5360} Deep Strider · Wave Striders = {npc:5361} Wave Strider · Sea Elementals = {npc:5461} Sea Elemental · Sea Sprays = {npc:5462} Sea Spray
	["Shore Striders, Deep Striders and Wave Striders (elite giants) wade along the coast north of the dock: zap one with {item:18904} and kill the shrunken giant. Sea Elementals and Sea Sprays drift in the same surf."] = "Des Marcheurs des rivages, des Marcheurs des profondeurs et des Marcheurs des vagues (géants élites) arpentent la côte au nord du quai : frappez-en un avec l'{item:18904} et tuez le géant rétréci. Des Elémentaires marins et des Embruns dérivent dans les mêmes vagues.",

	-- Step 39: Zorbin Fandazzle
	-- {npc:14637} Zorbin Fandazzle
	["{npc:14637}'s refills are level 55: skip them."] = "Les recharges de {npc:14637} Fandazzle sont de niveau 55 : passez-les.",
	-- {zone:1446} Tanaris
	["You end at the Forgotten Coast dock: the {zone:1446} guide starts with the trip east from here."] = "Vous terminez au quai de la Côte oubliée : le guide de {zone:1446} commence par le trajet vers l'est depuis ici.",

	-- Step 40: Maraudon (dungeon, optional)
	["Maraudon (dungeon, optional)"] = "Maraudon (donjon, facultatif)",
	-- {zone:1443} Desolace · {object:152576} Feathermoon Stronghold · {object:176948} Nijel's Point
	["Maraudon: the caves of the centaurs' sacred ground in western {zone:1443}, levels 42 to 51, a long dungeon (two wings, then the inner part, whose last boss is 51). At 45 it takes a solid group of 5. From here: the boat to {object:152576}, the flight to {object:176948}, about ten minutes' ride to the dungeon, and the same way back; the guide then flies on to Thalanaar. Alone? Skip it."] = "Maraudon : les grottes de la terre sacrée des centaures, à l'ouest de {zone:1443}, niveaux 42 à 51, un long donjon (deux ailes, puis la partie intérieure, dont le dernier boss est niveau 51). Au niveau 45, il faut un groupe de 5 solide. D'ici : le bateau pour {object:152576}, le vol jusqu'à {object:176948}, une dizaine de minutes à cheval jusqu'au donjon, et le même chemin au retour ; le guide continue ensuite par le vol vers Thalanaar. Seul ? Le passer.",
	-- {object:176948} Nijel's Point
	["Three quests at {object:176948} and Kormek's Hut on the way, one at the dungeon's door. Keep 6 free quest log slots."] = "Trois quêtes en chemin, à {object:176948} et à la hutte de Kormek, une à la porte du donjon. Garder 6 places libres dans le journal.",

	-- Step 41: Maraudon: fly to Nijel's Point
	-- {object:176948} Nijel's Point
	["Maraudon: fly to {object:176948}"] = "Maraudon : vol vers {object:176948}",

	-- Step 42: Maraudon: Nijel's Point
	-- {object:176948} Nijel's Point
	["Maraudon: {object:176948}"] = "Maraudon : {object:176948}",
	-- {npc:11715} Talendria · {npc:13698} Keeper Marandis · {item:17693} Coated Cerulean Vial
	["{npc:11715} and {npc:13698} stand in the night elf outpost. {npc:11715}'s quest cannot be shared: each player takes it here, with its {item:17693}."] = "{npc:11715} et {npc:13698} se tiennent dans l'avant-poste elfe de la nuit. La quête de {npc:11715} ne se partage pas : chaque joueur la prend ici, avec sa {item:17693}.",

	-- Step 43: Maraudon: Willow
	-- {npc:13656} Willow
	["Maraudon: {npc:13656}"] = "Maraudon : {npc:13656}",
	-- {npc:13656} Willow
	["Ride south along the road to Kormek's Hut, by Thunder Axe Fortress: {npc:13656} waits there."] = "Descendre la route vers le sud jusqu'à la hutte de Kormek, près de la forteresse Hache-Tonnerre : {npc:13656} y attend.",

	-- Step 44: Maraudon: before going in
	["Maraudon: before going in"] = "Maraudon : avant d'entrer",
	-- {npc:13697} Cavindra · {item:17693} Coated Cerulean Vial
	["Ride south-west to the Valley of Spears: the caves of Maraudon open in the hills west of it. {npc:13697} waits in the first cave. Fill the {item:17693} at an orange crystal pool, outside the orange portal (the right-hand path where the caves split); the blue water does not count."] = "Partir au sud-ouest vers la vallée des Lances : les grottes de Maraudon s'ouvrent dans les collines à l'ouest. {npc:13697} attend dans la première grotte. Remplir la {item:17693} à un bassin aux cristaux orange, devant le portail orange (le chemin de droite là où les grottes se séparent) ; l'eau bleue ne compte pas.",
	-- {quest:7041} Vyletongue Corruption · {quest:7065} Corruption of Earth and Seed · {object:176948} Nijel's Point · {quest:7028} Twisted Evils · {npc:13656} Willow · {quest:7044} Legends of Maraudon · {npc:13697} Cavindra · {quest:7070} Shadowshard Fragments · {npc:4967} Archmage Tervosh · {item:17781} The Pariah's Instructions · {zone:1443} Desolace
	-- plural, as words: Shadowshard Rumblers = {npc:11777} Shadowshard Rumbler
	["In the quest log before going in: {quest:7041} and {quest:7065} ({object:176948}), {quest:7028} ({npc:13656}), {quest:7044} ({npc:13697}, here). If you took it: {quest:7070} ({npc:4967}, Theramore, Group 18): the Shadowshard Rumblers and Smashers (elite) roam the slopes north of the caves. Not on this route: {item:17781} (the centaur pariah of southern {zone:1443} sends you after five khans)."] = "Dans le journal avant d'entrer : {quest:7041} et {quest:7065} ({object:176948}), {quest:7028} ({npc:13656}), {quest:7044} ({npc:13697}, ici). Si elle a été prise : {quest:7070} ({npc:4967}, Theramore, Groupe 18) : les grondeurs et fracasseurs Ombréclat (élites) parcourent les pentes au nord des grottes. Pas sur ce parcours : {item:17781} (le paria centaure du sud de {zone:1443} envoie chasser cinq khans).",
	-- {item:17696} Filled Cerulean Vial
	["{item:17696}: the orange crystal pool"] = "{item:17696} : le bassin aux cristaux orange",
	-- {item:17756} Shadowshard Fragment
	-- plural, as words: Shadowshard Rumblers = {npc:11777} Shadowshard Rumbler
	["{item:17756}: Shadowshard Rumblers and Smashers"] = "{item:17756} : grondeurs et fracasseurs Ombréclat",
	["Maraudon"] = "Maraudon",

	-- Step 45: Maraudon: along the way
	["Maraudon: along the way"] = "Maraudon : en chemin",
	-- plural, as words: Theradric Crystal Carvings = {item:17684} Theradric Crystal Carving
	["Collected all through the dungeon: the Theradric Crystal Carvings, from the centaurs, satyrs and dryads and from most bosses. Every player with the quest loots their own."] = "À ramasser dans tout le donjon : les gravures de cristal théradrique, sur les centaures, les satyres, les dryades et la plupart des boss. Chaque joueur qui a la quête ramasse les siennes.",
	-- {quest:7028} Twisted Evils · {quest:7065} Corruption of Earth and Seed · {quest:7044} Legends of Maraudon
	["Share {quest:7028}, {quest:7065} and {quest:7044} with your group: click each in the quest log, then Share."] = "Partager {quest:7028}, {quest:7065} et {quest:7044} avec le groupe : cliquer sur chacune dans le journal, puis Partager.",

	-- Step 46: Maraudon: the orange side
	["Maraudon: the orange side"] = "Maraudon : le côté orange",
	-- {item:17696} Filled Cerulean Vial · {npc:13696} Noxxious Scion · {item:17702} Celebrian Rod
	-- plural, as words: Vylestem Vines = {object:178905} Vylestem Vine
	["On the orange side, by the Vylestem Vines: use the {item:17696} near one, a {npc:13696} comes out (45, immune to Nature); kill it to heal the vine, 8 times. Noxxion, at the end of this side, drops the {item:17702}."] = "Du côté orange, près des Vylestem Vines : utiliser la {item:17696} près de l'une d'elles, une {npc:13696} en sort (niveau 45, insensible à la Nature) ; la tuer guérit la vigne, 8 fois. Noxxion, au bout de ce côté, lâche le {item:17702}.",
	-- {npc:13696} Noxxious Scion
	["{npc:13696}: one per vine"] = "{npc:13696} : une par vigne",
	-- {item:17702} Celebrian Rod
	["{item:17702}: Noxxion"] = "{item:17702} : Noxxion",

	-- Step 47: Maraudon: the purple side
	["Maraudon: the purple side"] = "Maraudon : le côté violet",
	-- {npc:12236} Lord Vyletongue · {item:17703} Celebrian Diamond
	["Back out and in through the purple portal: {npc:12236}, at the end of this side, drops the {item:17703}."] = "Ressortir et entrer par le portail violet : {npc:12236}, au bout de ce côté, lâche le {item:17703}.",

	-- Step 48: Maraudon: Celebras
	["Maraudon: Celebras"] = "Maraudon : Celebras",
	-- {npc:12225} Celebras the Cursed · {npc:13716} Celebras the Redeemed · {quest:7044} Legends of Maraudon
	["In the inner part, {npc:12225}: once beaten, he comes back as {npc:13716}. Hand him {quest:7044}; his next quest cannot be shared: each player takes it, then waits while he makes the scepter and speaks with him again."] = "Dans la partie intérieure, {npc:12225} : une fois vaincu, il revient en {npc:13716}. Lui rendre {quest:7044} ; sa quête suivante ne se partage pas : chaque joueur la prend, attend qu'il ait fabriqué le sceptre et lui parle de nouveau.",

	-- Step 49: Maraudon: Princess Theradras
	-- {npc:12201} Princess Theradras
	["Maraudon: {npc:12201}"] = "Maraudon : {npc:12201}",
	-- {npc:12201} Princess Theradras · {npc:12238} Zaetar's Spirit · {quest:7066} Seed of Life · {npc:11832} Keeper Remulos · {zone:1450} Moonglade
	["{npc:12201}, the last boss (51), at the far end of the inner part. {npc:12238} then rises: its quest, {quest:7066}, goes to {npc:11832} in {zone:1450}, where the guide passes in Group 28; keep it until then."] = "{npc:12201}, le dernier boss (niveau 51), tout au bout de la partie intérieure. {npc:12238} apparaît ensuite : sa quête, {quest:7066}, va à {npc:11832} en {zone:1450}, où le guide passe au Groupe 28 ; la garder jusque-là.",

	-- Step 50: Maraudon: Willow
	-- {npc:13656} Willow
	["Back north along the road: {npc:13656} at Kormek's Hut."] = "Retour vers le nord par la route : {npc:13656} à la hutte de Kormek.",

	-- Step 51: Maraudon: Keeper Marandis
	-- {npc:13698} Keeper Marandis
	["Maraudon: {npc:13698}"] = "Maraudon : {npc:13698}",

	-- Step 52: Maraudon: Talendria
	-- {npc:11715} Talendria
	["Maraudon: {npc:11715}"] = "Maraudon : {npc:11715}",

	-- Step 53: Maraudon: quests not done
	["Maraudon: quests not done"] = "Maraudon : quêtes pas faites",
	-- {quest:7066} Seed of Life · {zone:1450} Moonglade
	["What is left of Maraudon in the quest log cannot be finished on this route (the guide does not come back): it is dropped here. {quest:7066} stays, for {zone:1450}."] = "Ce qui reste de Maraudon dans le journal ne peut plus se finir sur ce parcours (le guide ne revient pas) : on l'abandonne ici. {quest:7066} reste, pour {zone:1450}.",

	-- Step 54: Maraudon: fly to Thalanaar
	["Maraudon: fly to Thalanaar"] = "Maraudon : vol vers Thalanaar",
	-- {object:176948} Nijel's Point
	["{object:176948} flight master"] = "Maître de vol de {object:176948}",

	-- Step 55: Shadowshard Fragments: not done
	-- {quest:7070} Shadowshard Fragments
	["{quest:7070}: not done"] = "{quest:7070} : pas faite",
	-- {quest:7070} Shadowshard Fragments · {zone:1443} Desolace
	["{quest:7070} needs the elementals outside Maraudon, and the guide does not come back to {zone:1443}: abandon it."] = "{quest:7070} demande les élémentaires devant Maraudon, et le guide ne revient pas en {zone:1443} : l'abandonner.",

	-- Step 56: Thalanaar
	["Thalanaar"] = "Thalanaar",
	-- {zone:1441} Thousand Needles
	["Ride north-east to the night elf outpost on the {zone:1441} border."] = "Chevauchez au nord-est jusqu'à l'avant-poste elfe de la nuit à la frontière de {zone:1441}.",
	-- {npc:4048} Falfindel Waywarder
	["{npc:4048} walks around Thalanaar: look inside the circle on the map"] = "{npc:4048} se promène autour de Thalanaar : regardez à l'intérieur du cercle sur la carte",
}
