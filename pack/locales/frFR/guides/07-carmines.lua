-- French (frFR): the guide groupe-alliance/07-carmines (guides/07-carmines.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1433} Redridge Mountains
	["Group 6 · {zone:1433}"] = "Groupe 6 · {zone:1433}",

	-- Step 1: Boat to Stormwind Harbor
	["Boat to Stormwind Harbor"] = "Bateau pour le port de Hurlevent",
	-- {zone:1439} Darkshore
	["Only if you are still in {zone:1439} (Ruins of Lordaeron skipped)."] = "Seulement si le groupe est encore à {zone:1439} (Ruines de Lordaeron sautées).",

	-- Step 2: Stormwind
	-- {npc:1646} Baros Alexston · {zone:1429} Elwynn Forest
	["The Auberdine boat docks at Stormwind Harbor. Walk up into the city for training and {npc:1646}, then leave by the main gate and follow the road east through {zone:1429}."] = "Le bateau d'Auberdine accoste au port de Hurlevent. Montez en ville pour l'entraînement et {npc:1646}, puis sortez par la porte principale et suivez la route vers l'est à travers {zone:1429}.",
	["Everyone at their own pace: what you already did ticks itself, the guide picks up where you are. Playing together? Group XP is best within 4 levels."] = "Chacun à son rythme : ce qui est déjà fait se coche tout seul, le guide reprend où vous en êtes. En groupe ? L'XP de groupe est meilleure à 4 niveaux d'écart ou moins.",
	["Level 18 and 20 spells"] = "Sorts des niveaux 18 et 20",
	-- {npc:1646} Baros Alexston
	["{npc:1646}: Thundris' letter from Auberdine"] = "{npc:1646} : Lettre de Thundris depuis Auberdine",
	-- {quest:97914} Expanding Horizons · {npc:3649} Thundris Windweaver
	["Only once {quest:97914} is handed in: for {npc:3649}, back in Auberdine (06-ashenvale)"] = "Une fois seulement {quest:97914} remis : pour {npc:3649}, de retour à Auberdine (06-ashenvale)",

	-- Step 3: Woo Ping
	-- {npc:11867} Woo Ping · {object:2096} Trade District
	["While you're here: learn Polearms from {npc:11867} ({object:2096}, 1 gold); two-handers level a Warrior fastest."] = "Pendant que vous y êtes : apprenez le maniement des armes d'hast auprès de {npc:11867} ({object:2096}, 1 pièce d'or) ; les armes à deux mains font progresser un Guerrier le plus vite.",

	-- Step 4: Woo Ping
	-- {npc:11867} Woo Ping · {object:2096} Trade District
	["While you're here: learn Polearms from {npc:11867} ({object:2096}, 1 gold); a Hunter's melee weapon is mostly its stats, and two-handers carry the most."] = "Pendant que vous y êtes : apprenez le maniement des armes d'hast auprès de {npc:11867} ({object:2096}, 1 pièce d'or) ; l'arme de mêlée d'un Chasseur vaut surtout par ses caractéristiques, et les armes à deux mains en portent le plus.",

	-- Step 5: Stormwind class quests
	-- {zone:1453} Stormwind
	["{zone:1453} class quests"] = "Quêtes de classe à {zone:1453}",
	-- {npc:332} Master Mathias Shaw · {object:2100} Old Town · {npc:6122} Gakin the Darkbinder · {object:2164} Slaughtered Lamb · {object:2101} Mage Quarter · {npc:376} High Priestess Laurena
	["{npc:332} is at SI:7 in {object:2100}, {npc:6122} in the {object:2164}'s cellar in the {object:2101}, {npc:376} in the Cathedral of Light."] = "{npc:332} est au SI:7, dans {object:2100}, {npc:6122} dans la cave de {object:2164}, dans {object:2101}, {npc:376} dans la Cathedral of Light.",
	-- {npc:332} Master Mathias Shaw · {npc:7024} Agent Kearnen · {zone:1436} Westfall · {zone:1431} Duskwood
	["{npc:332}: {npc:7024} in {zone:1436} takes it, at the end of {zone:1431}"] = "{npc:332} : à rendre à {npc:7024} en {zone:1436}, à la fin de {zone:1431}",
	-- {npc:6122} Gakin the Darkbinder · {npc:6244} Takar the Seer · {zone:1413} Barrens
	["{npc:6122}: {npc:6244} in the {zone:1413} takes it, later"] = "{npc:6122} : à rendre plus tard à {npc:6244}, dans {zone:1413}",
	-- {npc:376} High Priestess Laurena · {npc:11406} High Priest Rohan · {zone:1455} Ironforge
	["{npc:376}: {npc:11406} in {zone:1455} takes it, later"] = "{npc:376} : à rendre plus tard à {npc:11406}, à {zone:1455}",
	-- {npc:376} High Priestess Laurena · {npc:258785} High Priestess Mims · {zone:1455} Ironforge
	["{npc:376}: {npc:258785} in {zone:1455} takes it, later"] = "{npc:376} : à rendre plus tard à {npc:258785}, à {zone:1455}",
	-- {npc:376} High Priestess Laurena · {npc:11401} Priestess Alathea · {zone:1457} Darnassus
	["{npc:376}: {npc:11401} in {zone:1457} takes it, later"] = "{npc:376} : à rendre plus tard à {npc:11401}, à {zone:1457}",

	-- Step 6: Tram to Ironforge
	-- {zone:1455} Ironforge
	["Tram to {zone:1455}"] = "Tram pour {zone:1455}",

	-- Step 7: Shaman training
	["Shaman training"] = "Entraînement de chaman",
	-- {zone:1453} Stormwind · {object:28027} Dwarven District · {zone:1455} Ironforge · {npc:258098} Eldrun Stormbreaker
	["{zone:1453} has no shaman trainer: take the Deeprun Tram from the {object:28027} to {zone:1455}, train with {npc:258098}, then ride the tram back."] = "{zone:1453} n'a pas de maître des chamans : prenez le Tram des profondeurs depuis {object:28027} jusqu'à {zone:1455}, entraînez-vous auprès de {npc:258098}, puis reprenez le tram.",

	-- Step 8: Fly to Sentinel Hill
	-- {object:81} Sentinel Hill
	["Fly to {object:81}"] = "Envolez-vous vers {object:81}",
	-- {zone:1453} Stormwind
	["{zone:1453} flight master"] = "Maître de vol de {zone:1453}",

	-- Step 9: Half Pendant of Aquatic Endurance
	-- {object:81} Sentinel Hill · {object:177790} Strange Lockbox
	["Fly to {object:81} and head north-west to the coast: the {object:177790} lies on the sea floor off the shore. Then head east along the road through Elwynn to Redridge."] = "Envolez-vous vers {object:81} et dirigez-vous au nord-ouest vers la côte : {object:177790} gît sur le fond marin au large. Puis suivez la route vers l'est à travers la Forêt d'Elwynn jusqu'aux Carmines.",
	-- {item:15882} Half Pendant of Aquatic Endurance · {object:177790} Strange Lockbox
	["{item:15882}: the {object:177790}"] = "{item:15882} : l'{object:177790}",

	-- Step 10: Back to Elwynn Forest
	-- {zone:1429} Elwynn Forest
	["Back to {zone:1429}"] = "Retour à {zone:1429}",

	-- Step 13: Henze Faulk
	-- {npc:6172} Henze Faulk · {item:6866} Symbol of Life · {item:6846} Defias Script
	-- plural, as words: Defias Rogue Wizards = {npc:474} Defias Rogue Wizard
	["On the road east, past the Tower of Azora, head north from the bridge to Stone Cairn Lake. {npc:6172} lies south of the lake: use the {item:6866} on him. The Defias Rogue Wizards around him carry the {item:6846}."] = "Sur la route vers l'est, après la tour d'Azora, allez au nord depuis le pont jusqu'au lac du Cairn. {npc:6172} se trouve au sud du lac : utilisez {item:6866} sur lui. Les sorciers-voleurs défias autour de lui portent {item:6846}.",
	-- {item:6866} Symbol of Life · {npc:6172} Henze Faulk
	["Use the {item:6866} on {npc:6172}"] = "Utilisez le {item:6866} sur {npc:6172}",
	-- {item:6846} Defias Script
	-- plural, as words: Defias Rogue Wizards = {npc:474} Defias Rogue Wizard
	["{item:6846}: Defias Rogue Wizards"] = "{item:6846} : Sorciers-voleurs défias",

	-- Step 15: Three Corners
	["Three Corners"] = "Trois chemins",
	-- {npc:464} Guard Parker · {zone:1431} Duskwood
	["The road from Elwynn enters Redridge at Three Corners. {npc:464} stands where the roads to Redridge and {zone:1431} meet."] = "La route venant de la forêt d'Elwynn entre dans les Carmines à Trois chemins. {npc:464} se tient là où se rejoignent les routes vers les Carmines et {zone:1431}.",
	-- {npc:464} Guard Parker
	["{npc:464} walks around Three Corners: look inside the circle on the map"] = "{npc:464} se promène à Trois chemins : regardez à l'intérieur du cercle sur la carte",

	-- Step 16: Lakeridge Highway
	["Lakeridge Highway"] = "Grand-route de la Crête du lac",
	-- {npc:1070} Deputy Feldon · {npc:903} Guard Howe
	["Follow the road along the south shore of Lake Everstill to the gryphon master. {npc:1070} and {npc:903} stand by the road next to her."] = "Suivez la route le long de la rive sud du lac Placide jusqu'au maître des griffons. {npc:1070} et {npc:903} se tiennent près de la route à côté d'elle.",

	-- Step 17: Lakeshire
	["Lakeshire"] = "Comté-du-Lac",
	-- {npc:341} Foreman Oslow · {npc:382} Marshal Marris · {npc:900} Bailiff Conacher · {npc:381} Dockmaster Baren · {npc:266} Wiley the Black · {npc:343} Chef Breanna · {npc:342} Martie Jainrose
	["Cross the long bridge north into town. {npc:341} and {npc:382} stand at the north end of the bridge, {npc:900} in the town hall, {npc:381} and {npc:266} on the docks, {npc:343} at the inn, {npc:342} in her garden at the west end."] = "Traversez le long pont vers le nord jusqu'à la ville. {npc:341} et {npc:382} se tiennent au bout nord du pont, {npc:900} dans l'hôtel de ville, {npc:381} et {npc:266} sur les quais, {npc:343} à l'auberge, {npc:342} dans son jardin, à l'ouest.",
	-- {npc:266} Wiley the Black
	["{npc:266}, by the docks; upstairs"] = "{npc:266}, près des quais ; à l'étage",
	["Inside"] = "À l'intérieur",
	-- {npc:343} Chef Breanna
	["{npc:343}, inside"] = "{npc:343}, à l'intérieur",

	-- Step 18: Spotted Sunfish on the way
	-- {item:1467} Spotted Sunfish
	["{item:1467} on the way"] = "{item:1467} en chemin",

	-- Step 19: Sunken Chest
	["Swim east from the bridge into Lake Everstill; the chest lies on the lake bed."] = "Nagez vers l'est depuis le pont dans le lac Placide ; le coffre gît au fond du lac.",
	-- {item:1309} Oslow's Toolbox
	["{item:1309}; underwater"] = "{item:1309} ; sous l'eau",

	-- Step 21: Lakeridge Highway: kill these as you meet them
	["Lakeridge Highway: kill these as you meet them"] = "Grand-route de la Crête du lac : tuez-les au fur et à mesure",
	-- plural, as words: Redridge Mongrels = {npc:423} Redridge Mongrel · Redridge Thrashers = {npc:712} Redridge Thrasher · Redridge Brutes = {npc:426} Redridge Brute · Iron Pikes = {item:2856} Iron Pike · Dire Condors = {npc:428} Dire Condor · Great Goretusks = {npc:547} Great Goretusk
	["Redridge Mongrels and other gnolls hold the hills east of Three Corners, north of the road; Redridge Thrashers prowl among them, Poachers camp south of the road. Redridge Brutes, for the Iron Pikes and Rivets, hold the hills further north; Dire Condors and Great Goretusks roam the hills east of them."] = "Les bâtards des Carmines et d'autres gnolls occupent les collines à l'est de Trois chemins, au nord de la route ; les vandales des Carmines rôdent parmi eux, les braconniers campent au sud de la route. Les brutes des Carmines, pour les clous et les vis en fer, tiennent les collines plus au nord ; les condors redoutables et les grands broche-tripes errent dans les collines à l'est.",
	-- {item:280911} Spiked Collar
	-- plural, as words: Redridge Thrashers = {npc:712} Redridge Thrasher
	["{item:280911}: Redridge Thrashers"] = "{item:280911} : Vandales des Carmines",

	-- Step 25: Redridge Canyons
	["Redridge Canyons"] = "Canyons des Carmines",

	-- Step 26: Lakeshire
	-- {npc:341} Foreman Oslow · {quest:89} The Everstill Bridge
	["{npc:341}: after {quest:89}"] = "{npc:341} : après {quest:89}",

	-- Step 27: Lake Everstill: kill these as you meet them
	["Lake Everstill: kill these as you meet them"] = "lac Placide : tuez-les au fur et à mesure",
	-- {item:1467} Spotted Sunfish
	-- plural, as words: Murloc Flesheaters = {npc:422} Murloc Flesheater · Greater Tarantulas = {npc:505} Greater Tarantula
	["Murloc Flesheaters and Tidecallers line the south shore east of the bridge. Any of them can carry a {item:1467} or a fin.\nGreater Tarantulas crawl on the slopes around the mill north-east of the lake."] = "Des Dévoreurs murlocs et des Mande-flots murlocs bordent la rive sud à l'est du pont. N'importe lequel peut porter un {item:1467} ou une nageoire.\nDes Grandes tarentules rampent sur les pentes autour du moulin au nord-est du lac.",

	-- Step 28: Blackrock camps
	["Blackrock camps"] = "Camps Blackrock",
	-- {object:116} Stonewatch Keep
	["South-east from the mill, west of Galardell Valley's gnolls, to the Blackrock camps east of {object:116}. Renegades, Grunts and Outrunners fill them; keep east of the keep, whose orcs are elite."] = "Au sud-est du moulin, à l'ouest des gnolls de la vallée de Galardell, jusqu'aux camps Rochenoire à l'est de {object:116}. Renégats, grunts et coureurs les occupent ; restez à l'est du donjon, dont les orcs sont élites.",

	-- Step 29: Back to Lakeshire
	["Back to Lakeshire"] = "Retour à Comté-du-Lac",

	-- Step 30: Render's Valley
	["Render's Valley"] = "Vallée des Etripeurs",
	-- plural, as words: Blackrock Champions = {npc:435} Blackrock Champion
	["Head north out of Lakeshire up the Redridge Canyons to Render's Valley. Blackrock Champions camp in the valley."] = "Sortez de Comté-du-Lac par le nord et remontez les canyons des Carmines jusqu'à la vallée des Etripeurs. Les champions Blackrock y campent.",
	-- {npc:435} Blackrock Champion
	["{npc:435}, below ground"] = "{npc:435}, sous terre",

	-- Step 31: Corporal Keeshan
	-- {zone:1428} Burning Steppes
	["Keeshan hides at the very north end of the valley, by the {zone:1428} border. Escort him down to Lakeshire; Blackrock orcs ambush you on the way."] = "Keeshan se cache tout au nord de la vallée, près de la frontière de {zone:1428}. Escortez-le jusqu'à Comté-du-Lac ; des orcs rochenoires vous tendent une embuscade en route.",
	-- {npc:349} Corporal Keeshan
	["{npc:349}, below ground"] = "{npc:349}, sous terre",

	-- Step 32: Lakeshire
	-- {npc:903} Guard Howe
	["{npc:903}, by the gryphons south of the bridge"] = "{npc:903}, près des griffons au sud du pont",

	-- Step 33: The Stockade, later (dungeon, optional): Guard Berton
	-- {npc:859} Guard Berton
	["The Stockade, later (dungeon, optional): {npc:859}"] = "La Prison, plus tard (donjon, facultatif) : {npc:859}",
	-- {zone:1453} Stormwind · {zone:1431} Duskwood
	["What Comes Around is for the Stockade, the prison dungeon in {zone:1453} after {zone:1431} (group of 5, 24 to 28). Alone? Skip it."] = "Cette quête est pour la Prison, le donjon de {zone:1453} après le {zone:1431} (groupe de 5, 24 à 28). Seul ? La passer.",
	-- {npc:859} Guard Berton
	["{npc:859}, by the town hall"] = "{npc:859}, près de l'hôtel de ville",
	-- {zone:1431} Duskwood
	["{zone:1431} is next: follow the road west to Three Corners, then south to Darkshire."] = "{zone:1431} est la suite : suivez la route vers l'ouest jusqu'à Trois chemins, puis au sud jusqu'à Sombre-Comté.",

	-- Step 34: Blackrock Blockade
	-- {npc:382} Marshal Marris · {object:116} Stonewatch Keep
	["{npc:382} has one more quest, done alone: the stolen weapons and the Blackrock supplies lie on the ground in the orc camps south-east of {object:116}, where you found the axes."] = "{npc:382} a une quête de plus, faisable seul : les armes volées et les provisions Rochenoire sont au sol dans les camps orcs au sud-est de {object:116}, là où étaient les haches.",

	-- Step 35: Stonewatch elites (group, optional)
	["Stonewatch elites (group, optional)"] = "Les élites de Guet-de-pierre (groupe, facultatif)",
	-- {object:116} Stonewatch Keep · {npc:382} Marshal Marris · {quest:98387} Blackrock Blockade
	["Four elite quests around {object:116}, about 12,000 XP: best with 3 to 5 players at 23 to 25. Alone: the guide skips them. {npc:382} gives his two once {quest:98387} is handed in."] = "Quatre quêtes élites autour de {object:116}, environ 12 000 XP : idéal à 3 à 5 joueurs, niveaux 23 à 25. Seul : le guide les passe. {npc:382} donne les deux siennes une fois {quest:98387} rendue.",
	["The WANTED poster by the town hall door"] = "L'affiche AVIS DE RECHERCHE près de la porte de l'hôtel de ville",
	["The other WANTED poster beside it"] = "L'autre affiche AVIS DE RECHERCHE juste à côté",

	-- Step 36: The camps below Stonewatch
	["The camps below Stonewatch"] = "Les camps sous Guet-de-pierre",
	["Click the weapons and racks, the grain sacks, meat and water barrels in the camps; they come back slowly and other players take them too."] = "Cliquer les armes et râteliers, sacs de grain, viandes et tonneaux d'eau des camps ; ils reviennent lentement et d'autres joueurs les prennent aussi.",

	-- Step 37: Incinerator Gar'im
	["At the back of a cave south-east of the camps, with an imp and two helpers: kill the helpers first and keep an interrupt (Counterspell, Spell Lock) for his long fire cast. Two players are enough at 23."] = "Au fond d'une grotte au sud-est des camps, avec un diablotin et deux aides : tuer les aides d'abord et garder une interruption (Contresort, Verrou magique) pour sa longue incantation de feu. Deux joueurs suffisent au niveau 23.",
	-- {item:271872} Broken Staff of Incinerator Gar'im · {npc:214519} Incinerator Gar'im
	["{item:271872}: {npc:214519}, elite 23"] = "{item:271872} : {npc:214519}, élite 23",

	-- Step 39: Marshal Marris: elite quests
	-- {npc:382} Marshal Marris
	["{npc:382}: elite quests"] = "{npc:382} : quêtes élites",

	-- Step 40: Tharil'zun
	["Not inside the keep: behind the broken gate on the right of its entrance, by a camp fire, with two guards. Crowd-control a guard and burst him. Two or three players at 23-25; alone, nearer 29."] = "Pas dans le donjon : derrière le portail cassé à droite de son entrée, près d'un feu de camp, avec deux gardes. Neutraliser un garde et le tuer vite. À deux ou trois vers 23-25 ; seul, plutôt vers 29.",
	-- {item:1260} Tharil'zun's Head · {quest:19} Tharil'zun
	["{item:1260}: {quest:19}, elite 24"] = "{item:1260} : {quest:19}, élite 24",

	-- Step 41: Stonewatch Keep
	-- {npc:334} Gath'Ilzogg
	-- plural, as words: Blackrock Shadowcasters = {npc:436} Blackrock Shadowcaster
	["Only the Blackrock Shadowcasters drop the orbs, all through the keep. {npc:334} holds the top floor with two guards and a fire-breathing whelp: a full group only, and keep moving, the keep respawns fast."] = "Seuls les exhalombres Blackrock donnent les orbes, dans tout le donjon. {npc:334} tient le dernier étage avec deux gardes et un dragonnet qui crache du feu : groupe complet seulement, et sans traîner, le donjon réapparaît vite.",
	-- {quest:115} Shadow Magic · {zone:1428} Burning Steppes
	["{quest:115} alone: the cave far north of Lakeshire (by the {zone:1428} road) holds Shadowcasters too; pull them one at a time and leave its level 24 boss alone."] = "{quest:115} seul : la grotte loin au nord de Comté-du-Lac (près de la route de {zone:1428}) a aussi des lanceurs d'ombre ; les tirer un par un et laisser son chef de niveau 24.",
	-- {item:1261} Midnight Orb · {npc:436} Blackrock Shadowcaster
	["{item:1261}: {npc:436}, elite"] = "{item:1261} : {npc:436}, élite",
	-- {item:3633} Head of Gath'Ilzogg · {npc:334} Gath'Ilzogg
	["{item:3633}: {npc:334}, elite 26, top floor"] = "{item:3633} : {npc:334}, élite 26, dernier étage",

	-- Step 42: Lakeshire rewards
	["Lakeshire rewards"] = "Récompenses à Comté-du-Lac",
	-- {npc:344} Magistrate Solomon
	["{npc:344}, in the town hall"] = "{npc:344}, dans l'hôtel de ville",
	-- {npc:344} Magistrate Solomon
	["{npc:344}: hand it in even if the log does not show it complete"] = "{npc:344} : la rendre même si le journal ne la dit pas finie",

	-- No longer in the guide (its English changed or it went away): reuse or delete.
	-- ["Back to {area:12}"] = "Retour dans la {area:12}",
	-- ["Back to {area:69}"] = "Retour à {area:69}",
	-- ["Bellygrub"] = "Fouailleventre",
	-- ["Boat to {area:17203}"] = "Bateau pour {area:17203}",
	-- ["East past the mill and across the river. Shadowhide gnolls fill the valley; {npc:703} (26, well above you) leads them at its north end: clear his escort first and fight him at full health. Stay out of {area:2099} to the south: its orcs are elite."] = "À l'est, au-delà du moulin et de la rivière. Les gnolls Sombrepoil remplissent la vallée ; {npc:703} (26, bien au-dessus de vous) les mène à son extrémité nord : éliminez d'abord son escorte et combattez-le en pleine santé. Évitez {area:2099} au sud : ses orcs sont élites.",
	-- ["East past the mill and across the river. Shadowhide gnolls fill the valley; {npc:703} (26, well above you) leads them at its north end: clear his escort first and fight him at full health. Stay out of {area:2099} to the south: its orcs are elite.\nCareful: Two gnoll guards stay with him and join the fight whenever he is attacked, even if he has wandered a short way off; other gnolls stand close by and wander through the area."] = "À l'est, après le moulin, de l'autre côté de la rivière. Les gnolls Sombrepoil remplissent la vallée ; {npc:703} (niveau 26, bien au-dessus de vous) les mène à son extrémité nord : éliminez d'abord son escorte et combattez-le avec toute votre vie. Évitez {area:2099} au sud : ses orcs sont des élites.\nAttention : deux gardes gnolls restent avec lui et se joignent au combat dès qu'il est attaqué, même s'il s'est un peu éloigné ; d'autres gnolls se tiennent tout près et errent dans le secteur.",
	-- ["East past the mill and across the river. Shadowhide gnolls fill the valley; {npc:703} (26, well above you) leads them at its north end: clear his escort first and fight him at full health. Stay out of {object:116} to the south: its orcs are elite.\nCareful: Two gnoll guards stay with him and join the fight whenever he is attacked, even if he has wandered a short way off; other gnolls stand close by and wander through the area."] = "À l'est, passez le moulin et traversez la rivière. Les gnolls ombrepeau remplissent la vallée ; {npc:703} (26, bien au-dessus de vous) les mène à son extrémité nord : éliminez d'abord son escorte et combattez-le à pleine santé. Évitez {object:116} au sud : ses orcs sont élites.\nAttention : Deux gardes gnolls restent avec lui et rejoignent le combat chaque fois qu'il est attaqué, même s'il s'est un peu éloigné ; d'autres gnolls se tiennent à proximité et errent dans la zone.",
	-- ["Fly to {area:108}"] = "Prendre un vol pour {area:108}",
	-- ["Fly to {area:108} and head north-west to the coast: the {object:177790} lies on the sea floor off the shore. Then head east along the road through Elwynn to Redridge."] = "Prenez un vol pour {area:108} et allez au nord-ouest jusqu'à la côte : le {object:177790} repose au fond de la mer, au large. Suivez ensuite la route vers l'est à travers la forêt d'Elwynn jusqu'aux Carmines.",
	-- ["Fly to {area:108} and ride north-west to the coast: the {object:177790} lies on the sea floor off the shore. Then ride east along the road through Elwynn to Redridge."] = "Prenez un vol pour {area:108} et allez au nord-ouest jusqu'à la côte : l'{object:177790} repose au fond de la mer, au large. Suivez ensuite la route vers l'est à travers la forêt d'Elwynn jusqu'aux Carmines.",
	-- ["Follow the road along the south shore of {area:68} to the gryphon master. {npc:1070} and {npc:903} stand by the road next to her."] = "Suivez la route le long de la rive sud de {area:68} jusqu'à la maîtresse des griffons. {npc:1070} et {npc:903} se tiennent au bord de la route, près d'elle.",
	-- ["For {npc:3649}, on the return to {area:442} (06-ashenvale)"] = "Pour {npc:3649}, au retour à {area:442} (06-ashenvale)",
	-- ["Galardell Valley: kill these as you meet them"] = "Vallée de Galardell : tuez-les au fur et à mesure",
	-- ["Gnolls toward {area:1002}"] = "Gnolls vers {area:1002}",
	-- ["Greater Tarantulas crawl on the slopes around the mill north-east of the lake; Blackrock Renegades hold the mill itself."] = "Des Grandes tarentules rampent sur les pentes autour du moulin, au nord-est du lac ; des Renégats Blackrock occupent le moulin.",
	-- ["Group: highest player at most 4 levels above the lowest. Above 23? Wait for the others."] = "Groupe : le plus haut au maximum 4 niveaux au-dessus du plus bas. Au-delà de 23 ? Attendre les autres.",
	-- ["Group: highest player at most 4 levels above the lowest. Above 24? Wait for the others."] = "Groupe : le plus haut au maximum 4 niveaux au-dessus du plus bas. Au-delà de 24 ? Attendre les autres.",
	-- ["Head north out of {area:69} up the {area:95} to {area:997}. Blackrock Champions camp in the valley."] = "Allez au nord hors de {area:69} par {area:95} jusqu'à {area:997}. Des Champions Blackrock campent dans la vallée.",
	-- ["Hearth to Lakeshire"] = "Pierre de foyer pour Comté-du-Lac",
	-- ["Hearth to {area:69}"] = "Pierre de foyer vers {area:69}",
	-- ["Keeshan hides at the very north end of the valley, by the {zone:1428} border. Escort him down to {area:69}; Blackrock orcs ambush you on the way."] = "Keeshan se cache tout au nord de la vallée, près de la frontière de {zone:1428}. Escortez-le jusqu'à {area:69} ; des orcs Blackrock vous tendent des embuscades en chemin.",
	-- ["Lake murlocs"] = "Murlocs du lac",
	-- ["Murloc Flesheaters and Tidecallers line the south shore east of the bridge. Any of them can carry a {item:1467} or a fin."] = "Des Dévoreurs murlocs et des Maîtres des flots murlocs bordent la rive sud à l'est du pont. Chacun peut porter un {item:1467} ou une nageoire.",
	-- ["On the road east, past the {area:91}, head north from the bridge to {area:86}. {npc:6172} lies south of the lake: use the {item:6866} on him. The Defias Rogue Wizards around him carry the {item:6846}."] = "Sur la route vers l'est, après la {area:91}, partez vers le nord depuis le pont jusqu'au {area:86}. {npc:6172} gît au sud du lac : utilisez le {item:6866} sur lui. Les Sorciers-voleurs défias autour de lui portent le {item:6846}.",
	-- ["On the top floor"] = "Au dernier étage",
	-- ["Only once {quest:97914} is handed in: for {npc:3649}, back in {area:442} (06-ashenvale)"] = "Seulement une fois {quest:97914} rendue : pour {npc:3649}, de retour à {area:442} (06-ashenvale)",
	-- ["Redridge Mongrels and other gnolls hold the hills east of {area:1002}, north of the road; Redridge Thrashers prowl among them, Poachers camp south of the road. Dire Condors and Great Goretusks roam the same hills."] = "Les Bâtards des Carmines et d'autres gnolls tiennent les collines à l'est de {area:1002}, au nord de la route ; des Vandales des Carmines rôdent parmi eux, des Braconniers des Carmines campent au sud de la route. Des Condors redoutables et des Grands Broche-tripes parcourent les mêmes collines.",
	-- ["Redridge Mongrels and other gnolls hold the hills east of {area:1002}, north of the road; Redridge Thrashers prowl among them, Poachers camp south of the road. Redridge Brutes, for the Iron Pikes and Rivets, hold the hills further north; Dire Condors and Great Goretusks roam the hills east of them."] = "Des Bâtards des Carmines et d'autres gnolls tiennent les collines à l'est de {area:1002}, au nord de la route ; des Vandales des Carmines rôdent parmi eux, des Braconniers campent au sud de la route. Les Brutes des Carmines, pour les Clous en fer et les rivets, tiennent les collines plus au nord ; des Condors redoutables et des Grands Broche-tripes parcourent les collines à leur est.",
	-- ["South down the valley's east side to the Blackrock camps east of {area:2099}. Renegades, Grunts and Outrunners fill them; keep east of the keep, whose orcs are elite."] = "Descendez vers le sud par le côté est de la vallée jusqu'aux camps Blackrock à l'est de {area:2099}. Des Renégats, des Grunts et des Estafettes les remplissent ; restez à l'est du donjon, dont les orcs sont des élites.",
	-- ["South down the valley's east side to the Blackrock camps east of {object:116}. Renegades, Grunts and Outrunners fill them; keep east of the keep, whose orcs are elite."] = "Descendez au sud le long du flanc est de la vallée vers les camps rochenoires à l'est de {object:116}. Renégats, grunts et coureurs les occupent ; restez à l'est du donjon, dont les orcs sont élites.",
	-- ["Swim east from the bridge into {area:68}; the chest lies on the lake bed."] = "Nagez vers l'est depuis le pont dans {area:68} ; le coffre repose au fond du lac.",
	-- ["The Wanted poster by the inn: {npc:703}, in Galardell Valley"] = "L'affiche de recherche près de l'auberge : {npc:703}, dans la vallée de Galardell",
	-- ["The Wanted poster by the inn: {npc:703}, in {area:1000}"] = "L'avis de recherche près de l'auberge : {npc:703}, à {area:1000}",
	-- ["The road from Elwynn enters Redridge at {area:1002}. {npc:464} stands where the roads to Redridge and {zone:1431} meet."] = "La route d'Elwynn entre dans les Carmines à {area:1002}. {npc:464} se tient au croisement des routes des Carmines et de {zone:1431}.",
	-- ["The {area:442} boat docks at {area:17203}. Walk up into the city for training and {npc:1646}, then leave by the main gate and follow the road east through {area:12}."] = "Le bateau d'{area:442} accoste au {area:17203}. Montez en ville pour vous entraîner et voir {npc:1646}, puis sortez par la grande porte et suivez la route vers l'est à travers la {area:12}.",
	-- ["The {area:442} boat docks at {area:17203}. Walk up into the city for training and {npc:1646}, then leave by the main gate and follow the road east through {zone:1429}."] = "Le bateau d'{area:442} accoste à {area:17203}. Montez en ville pour l'entraînement et {npc:1646}, puis sortez par la porte principale et suivez la route vers l'est à travers {zone:1429}.",
	-- ["{area:1000}: kill these as you meet them"] = "{area:1000} : tuez-les au passage",
	-- ["{area:1001}: kill these as you meet them"] = "{area:1001} : tuez-les au passage",
	-- ["{area:68}: kill these as you meet them"] = "{area:68} : tuez-les au passage",
	-- ["{item:1075}: any Shadowhide gnoll"] = "{item:1075} : tout gnoll Sombrepoil",
	-- ["{item:3014}: any Blackrock orc"] = "{item:3014} : tout orc Blackrock",
	-- ["{item:3014}: the Blackrock Renegades at the mill"] = "{item:3014} : les Renégats Blackrock du moulin",
	-- ["{npc:1646}: Thundris' letter from {area:442}"] = "{npc:1646} : la lettre de Thundris, d'{area:442}",
	-- ["{npc:266}, by the docks"] = "{npc:266}, près des quais",
	-- ["{npc:344}, in the town hall"] = "{npc:344}, dans l'hôtel de ville",
	-- ["{npc:345} (level 24) roots around the pen just west of Lakeshire. Pull him away from the other boars and fight at full health."] = "{npc:345} (niveau 24) fouille autour de l'enclos juste à l'ouest de Comté-du-Lac. Attirez-le loin des autres sangliers et combattez-le à pleine santé.",
	-- ["{npc:345} (level 24) roots around the pen just west of {area:69}. Pull him away from the other boars and fight at full health."] = "{npc:345} (niveau 24) fouille l'enclos juste à l'ouest de {area:69}. Éloignez-le des autres sangliers et combattez-le avec toute votre vie.",
	-- ["{npc:464} walks around {area:1002}: look inside the circle on the map"] = "{npc:464} se promène autour de {area:1002} : cherchez dans le cercle sur la carte",
	-- ["{npc:900}, inside"] = "{npc:900}, à l'intérieur",
	-- ["{zone:1431} is next: follow the road west to {area:1002}, then south to {area:42}."] = "Ensuite, {zone:1431} : suivez la route vers l'ouest jusqu'à {area:1002}, puis vers le sud jusqu'à {area:42}.",
	-- ["{zone:1453} has no shaman trainer: take the {area:2257} from the {object:28027} to {zone:1455}, train with {npc:258098}, then ride the tram back."] = "{zone:1453} n'a pas de maître chaman : prenez {area:2257} depuis {object:28027} jusqu'à {zone:1455}, entraînez-vous auprès de {npc:258098}, puis reprenez le tram pour revenir.",
}
