-- French (frFR): the guide groupe-alliance/11-mille-pointes (guides/11-mille-pointes.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1441} Thousand Needles · {zone:1431} Duskwood · {zone:1437} Wetlands
	["Group 9 · {zone:1441}, {zone:1431} & {zone:1437}"] = "Groupe 9 · {zone:1441}, {zone:1431} et {zone:1437}",

	-- Step 1: The Missing Diplomat
	-- {zone:1431} Duskwood · {zone:1455} Ironforge
	["Level 28 required: below 28, skip it and its follow-ups in {zone:1431}. Take the Deeprun Tram from {zone:1455}, then the Cathedral and the Keep."] = "Niveau 28 requis : en dessous, laisser de côté cette quête et sa suite à {zone:1431}. Tram des profondeurs depuis {zone:1455}, puis la Cathédrale et le Donjon.",
	-- {npc:4982} Thomas
	["{npc:4982}, in the Cathedral of Light"] = "{npc:4982}, dans la Cathédrale de la Lumière",

	-- Step 2: Jorgen and Elling Trias
	-- {npc:4959} Jorgen · {npc:482} Elling Trias
	["{npc:4959} and {npc:482}"] = "{npc:4959} et {npc:482}",
	-- {npc:482} Elling Trias · {object:2096} Trade District
	["{npc:482}, the cheese shop in the {object:2096}"] = "{npc:482}, la fromagerie du {object:2096}",

	-- Step 3: Stormwind: Shoni the Shilent (Gnomeregan, optional)
	-- {zone:1453} Stormwind · {npc:6579} Shoni the Shilent
	["{zone:1453}: {npc:6579} (Gnomeregan, optional)"] = "{zone:1453} : {npc:6579} (Gnomeregan, facultatif)",
	-- {zone:1426} Dun Morogh · {zone:1455} Ironforge · {npc:6579} Shoni the Shilent
	["Gnomeregan: the gnomes' fallen city under {zone:1426}, a 5-player dungeon best at 29 to 33. The guide runs it after Group 10 (Group 10b), from {zone:1455}, where the other quests are given. {npc:6579}'s quest is the only one given elsewhere: take it now. Alone? Skip it: Group 10b is then skipped too."] = "Gnomeregan : la cité perdue des gnomes sous {zone:1426}, un donjon pour 5 joueurs idéal de 29 à 33. Le guide le fait après le Groupe 10 (Groupe 10b), depuis {zone:1455}, où sont données les autres quêtes. La quête de {npc:6579} est la seule donnée ailleurs : la prendre maintenant. Seul ? La passer : le Groupe 10b est alors passé aussi.",
	-- {npc:6579} Shoni the Shilent · {object:28027} Dwarven District
	["{npc:6579} stands in the {object:28027}, by the tram. The quest waits in the log until Gnomeregan."] = "{npc:6579} se tient dans {object:28027}, près du tram. La quête attend dans le journal jusqu'à Gnomeregan.",

	-- Step 4: Duskwood
	["Everyone at their own pace: what you already did ticks itself, the guide picks up where you are. Playing together? Group XP is best within 4 levels."] = "Chacun à son rythme : ce qui est déjà fait se coche tout seul, le guide reprend où vous en êtes. En groupe ? L'XP de groupe est meilleure à 4 niveaux d'écart ou moins.",

	-- Step 5: Watcher Backus
	-- {npc:840} Watcher Backus
	["{npc:840}, at the north entrance of town; walks around Darkshire: look inside the circle on the map"] = "{npc:840}, à l'entrée nord de la ville ; se promène dans Sombre-Comté : regardez à l'intérieur du cercle sur la carte",

	-- Step 6: Darkshire
	["Darkshire"] = "Sombre-Comté",
	-- {npc:6790} Innkeeper Trelayne
	["{npc:6790}, Scarlet Raven Tavern"] = "{npc:6790}, taverne du Corbeau écarlate",
	-- {item:4371} Bronze Tube · {npc:3133} Herble Baubbletump
	["{item:4371}, from {npc:3133}, if you have none"] = "{item:4371}, chez {npc:3133}, si vous n'en avez pas",
	-- {npc:276} Viktori Prism'Antras
	["{npc:276}, at the east end of town; inside"] = "{npc:276}, à l'extrémité est de la ville ; à l'intérieur",

	-- Step 7: Nightbane Shadow Weavers
	-- plural, as words: Nightbane Shadow Weavers = {npc:533} Nightbane Shadow Weaver
	["Nightbane Shadow Weavers"] = "Tisseurs d'ombre Plaie-de-nuit",
	["The worgen hold the woods of Brightwood, west of Darkshire and north of the road. Pull them one at a time."] = "Les worgens occupent le Bois-Clair, à l'ouest de Sombre-Comté et au nord de la route. Tirez-les un par un.",

	-- Step 9: Nightbane Dark Runners
	-- plural, as words: Nightbane Dark Runners = {npc:205} Nightbane Dark Runner
	["Nightbane Dark Runners"] = "Messagers Plaie-de-nuit",
	["The Dark Runners prowl the woods south of the road, west of Darkshire."] = "Les Coureurs noirs rodent dans les bois au sud de la route, à l'ouest de Sombre-Comté.",

	-- Step 11: Blind Mary
	["Her house stands on the hill south-east of Darkshire."] = "Sa maison se trouve sur la colline au sud-est de Sombre-Comté.",
	["Inside"] = "À l'intérieur",

	-- Step 12: Nightbane Vile Fangs and the Insane Ghoul
	-- {npc:511} Insane Ghoul
	-- plural, as words: Nightbane Vile Fangs = {npc:206} Nightbane Vile Fang
	["Nightbane Vile Fangs and the {npc:511}"] = "Crocs noirs Plaie-de-nuit et {npc:511}",
	-- {npc:511} Insane Ghoul
	["The strongest worgen roam the woods south of Darkshire, west and south of the Tranquil Gardens Cemetery. The {npc:511} hides in the small crypt by the cemetery.\nCareful: Curse of Blood lasts 10 minutes and adds 13 to each hit of physical damage you take.\nCareful: Some worgen outside the cave stand in groups, including one camp of four. To avoid adds, pull them one at a time from the raised ground next to the cave entrance."] = "Les worgens les plus forts rôdent dans les bois au sud de Sombre-Comté, à l'ouest et au sud du cimetière des jardins paisibles. {npc:511} se cache dans la petite crypte près du cimetière.\nAttention : Malédiction de sang dure 10 minutes et ajoute 13 à chaque coup de dégâts physiques que vous subissez.\nAttention : Certains worgens à l'extérieur de la grotte sont en groupes, dont un camp de quatre. Pour éviter les renforts, tirez-les un par un depuis le terrain surélevé à côté de l'entrée de la grotte.",
	-- {item:1946} Mary's Looking Glass
	["{item:1946}; inside"] = "{item:1946} ; à l'intérieur",

	-- Step 13: Darkshire
	-- {npc:276} Viktori Prism'Antras
	["{npc:276}, inside"] = "{npc:276}, à l'intérieur",
	-- {npc:661} Jonathan Carevin · {npc:633} Elaine Carevin
	["{npc:661}, by {npc:633}'s house; inside"] = "{npc:661}, près de la maison de {npc:633} ; à l'intérieur",

	-- Step 14: Vul'Gol Ogre Mound: kill these as you meet them
	["Vul'Gol Ogre Mound: kill these as you meet them"] = "Tertre des ogres Vul'Gol : tuez-les au fur et à mesure",
	-- {object:119} Abercrombie's Crate
	["Head east to the ogre mound. {object:119} sits in the camp at its entrance; Splinter Fist ogres guard it."] = "Allez vers l'est jusqu'au tertre des ogres. {object:119} se trouve dans le camp à son entrée ; des ogres Brisepoing la gardent.",
	-- {npc:272273} Lost Watcher · {quest:96138} Merrick's Bow
	["Only if a {npc:272273} dropped {quest:96138}: right-click it"] = "Seulement si un {npc:272273} a laissé tomber {quest:96138} : clic droit dessus",
	["Below ground"] = "Sous terre",

	-- Step 15: Defias Strongbox
	-- {zone:1431} Duskwood · {object:102} Raven Hill · {zone:1436} Westfall
	["The Defias camp lies in the south-west of {zone:1431}, south of {object:102} near the {zone:1436} border. The strongbox stands among the tents."] = "Le camp des Défias se trouve au sud-ouest de {zone:1431}, au sud de {object:102} près de la frontière de {zone:1436}. Le coffre-fort se dresse parmi les tentes.",
	-- {item:5947} Defias Docket
	["{item:5947}; inside"] = "{item:5947} ; à l'intérieur",

	-- Step 17: Raven Hill Cemetery: kill these as you meet them
	["Raven Hill Cemetery: kill these as you meet them"] = "Cimetière de Colline-aux-Corbeaux : tuez-les au fur et à mesure",
	-- {npc:522} Mor'Ladim · {npc:311} Sven Yorgen
	-- plural, as words: Plague Spreaders = {npc:604} Plague Spreader · Skeletal Raiders = {npc:1110} Skeletal Raider
	["The Plague Spreaders walk the northern half of the Raven Hill Cemetery. {npc:522}, an elite, wanders the graves: keep away from him.\nSkeletal Raiders, Healers and Warders hold the west part of the cemetery, just east of {npc:311}'s camp.\nCareful: The skeletons in the catacombs are packed close together, so you can easily pull extra mobs."] = "Les répandeurs de peste arpentent la moitié nord du cimetière de Colline-aux-Corbeaux. {npc:522}, un élite, erre parmi les tombes : tenez-vous à l'écart.\nDes écumeurs, soigneurs et gardiens squelettes occupent la partie ouest du cimetière, juste à l'est du camp de {npc:311}.\nAttention : Les squelettes dans les catacombes sont serrés, vous pouvez donc facilement attirer des mobs supplémentaires.",

	-- Step 19: Sven Yorgen's Camp
	-- {npc:311} Sven Yorgen
	["{npc:311}'s Camp"] = "Le camp de {npc:311}",
	-- {npc:1212} Bishop Farthing · {zone:1453} Stormwind
	["For {npc:1212} in {zone:1453}, in the next guide"] = "Pour {npc:1212} à {zone:1453}, dans le guide suivant",

	-- Step 21: Watcher Backus again
	-- {npc:840} Watcher Backus
	["{npc:840} again"] = "De nouveau {npc:840}",
	-- {npc:840} Watcher Backus
	["{npc:840} walks around Darkshire: look inside the circle on the map"] = "{npc:840} se promène dans Sombre-Comté : regardez à l'intérieur du cercle sur la carte",
	-- {npc:482} Elling Trias · {zone:1453} Stormwind
	["For {npc:482} in {zone:1453}, in the next guide"] = "Pour {npc:482} à {zone:1453}, dans le guide suivant",

	-- Step 22: Back to Darkshire
	["Back to Darkshire"] = "Retour à Sombre-Comté",
	-- {npc:263} Lord Ello Ebonlocke
	["{npc:263}, in the town hall"] = "{npc:263}, à l'hôtel de ville",
	-- {npc:268} Sirra Von'Indi
	["{npc:268}, in the house behind the town hall"] = "{npc:268}, dans la maison derrière l'hôtel de ville",
	["Wait a moment, then speak with her again"] = "Patientez un instant, puis parlez-lui de nouveau",

	-- Step 23: Fly to Stormwind
	-- {zone:1453} Stormwind
	["Fly to {zone:1453}"] = "Prendre un vol pour {zone:1453}",
	["Darkshire flight master"] = "Maître de vol de Sombre-Comté",

	-- Step 24: Fly to Menethil Harbor
	-- {object:1162} Menethil Harbor
	["Fly to {object:1162}"] = "Envolez-vous vers {object:1162}",
	-- {zone:1453} Stormwind
	["{zone:1453} flight master"] = "Maître de vol de {zone:1453}",

	-- Step 25: Menethil Harbor
	-- {npc:1239} First Mate Fitzsimmons
	["{npc:1239}, in the inn"] = "{npc:1239}, à l'auberge",
	-- {item:2594} Flagon of Mead · {npc:1464} Innkeeper Helbrek
	["{item:2594}, from {npc:1464}"] = "{item:2594}, chez {npc:1464}",

	-- Step 26: The Lost Fleet: kill these as you meet them
	["The Lost Fleet: kill these as you meet them"] = "La Flotte perdue : tuez-les au fur et à mesure",
	-- {npc:1159} First Mate Snellig
	-- plural, as words: Cursed Sailors = {npc:1157} Cursed Sailor · Cursed Marines = {npc:1158} Cursed Marine · Giant Wetlands Crocolisks = {npc:2089} Giant Wetlands Crocolisk · Fen Creepers = {npc:1040} Fen Creeper
	["Follow the coast north to the wrecked ship. Cursed Sailors walk the beach, Cursed Marines the deck; {npc:1159} stands on the beach by the bow. Giant Wetlands Crocolisks lurk on the coast just north of it.\nCareful: Fen Creepers hide in stealth where the river splits close to the ghost ship, and they can join a fight."] = "Suivez la côte vers le nord jusqu'à l'épave. Des Marins maudits arpentent la plage, des Soldats de marine maudits le pont ; {npc:1159} se tient sur la plage près de la proue. Des Crocilisques géants des Paluns rôdent sur la côte juste au nord.\nAttention : des Rampants des tourbières se cachent, camouflés, là où la rivière se divise près du navire fantôme, et peuvent se joindre au combat.",

	-- Step 28: Captain Halyndor
	["The captain walks the deck of the wrecked ship; his strongbox sits in the hold."] = "Le capitaine arpente le pont du navire échoué ; son coffre est dans la cale.",

	-- Step 29: On the way
	["On the way"] = "En chemin",
	-- {item:2658} Ados Fragment · {npc:1078} Ormer Ironbraid
	["{item:2658} along the way to {npc:1078} and Whelgar"] = "{item:2658} en chemin vers {npc:1078} et Whelgar",
	-- {item:2659} Modr Fragment · {npc:1078} Ormer Ironbraid
	["{item:2659} along the way to {npc:1078} and Whelgar"] = "{item:2659} en chemin vers {npc:1078} et Whelgar",
	-- {item:2660} Golm Fragment · {npc:1078} Ormer Ironbraid
	["{item:2660} along the way to {npc:1078} and Whelgar"] = "{item:2660} en chemin vers {npc:1078} et Whelgar",
	-- {item:2661} Neru Fragment · {npc:1078} Ormer Ironbraid
	["{item:2661} along the way to {npc:1078} and Whelgar"] = "{item:2661} en chemin vers {npc:1078} et Whelgar",

	-- Step 30: Whelgar's Excavation Site: kill these as you meet them
	["Whelgar's Excavation Site: kill these as you meet them"] = "Excavations de Whelgar : tuez-les au fur et à mesure",
	-- {npc:1353} Sarltooth
	["The relics lie in the dig itself. {npc:1353}, a big Razormaw, prowls the raptor valley just west of it.\nThe Dragonmaw orcs camp east of the excavation site. Raiders and Swamprunners carry the war banners."] = "Les reliques se trouvent dans les fouilles elles-mêmes. {npc:1353}, un gros tranchegueule, rôde dans la vallée des raptors juste à l'ouest.\nLes orcs Dragonmaw campent à l'est du site de fouilles. Les écumeurs et les arpenteurs portent les bannières de guerre.",

	-- Step 31: Ormer Ironbraid and Whelgar
	-- {npc:1078} Ormer Ironbraid
	["{npc:1078} and Whelgar"] = "{npc:1078} et Whelgar",
	-- {npc:1077} Prospector Whelgar
	["{npc:1077}, below ground"] = "{npc:1077}, sous terre",

	-- Step 32: Goaz Warder
	-- {item:279996} Goaz Stone
	-- plural, as words: Goaz Warders = {npc:270892} Goaz Warder
	["The Goaz Warders stand just west of Whelgar's camp: use the {item:279996} he gave you beside one."] = "Les Goaz Warders se tiennent juste à l'ouest du camp de Whelgar : utiliser à côté de l'un d'eux {item:279996} qu'il a remise.",

	-- Step 33: Prospector Whelgar
	-- {item:279996} Goaz Stone · {zone:1437} Wetlands
	["A new {item:279996}, for the four titan watchers around the {zone:1437}, in Group 12; below ground"] = "Une nouvelle {item:279996}, pour les quatre gardiens titans des {zone:1437}, au Groupe 12 ; sous terre",

	-- Step 34: Glorin Steelbrow
	-- {npc:1284} Archbishop Benedictus · {zone:1453} Stormwind
	["For {npc:1284} in {zone:1453}, in the next guide"] = "Pour {npc:1284} à {zone:1453}, dans le guide suivant",
	["On the top floor"] = "Au dernier étage",
	-- {quest:98221} From the Ashes · {quest:465} Nek'rosh's Gambit
	["{quest:98221}: {quest:465} comes after it on Forever"] = "{quest:98221} : sur Forever, {quest:465} vient après",

	-- Step 35: Angerfang Encampment
	["Angerfang Encampment"] = "Campement de Hargnecroc",
	-- {npc:2091} Chieftain Nek'rosh
	["Head east again to the Dragonmaw camp. The four sets of Attack Plans lie in the Angerfang Encampment; {npc:2091}, an elite, stands in the camp too."] = "Reprenez la direction de l'est vers le camp Dragonmaw. Les quatre plans d'attaque se trouvent au campement de Hargnecroc ; {npc:2091}, un élite, s'y tient également.",

	-- Step 36: To Theramore
	["To Theramore"] = "Vers Theramore",
	-- {npc:2104} Captain Stoutfist
	["{npc:2104}, in Menethil Keep; on the top floor"] = "{npc:2104}, au Donjon de Menethil ; au dernier étage",
	-- {zone:1437} Wetlands
	["For the Dragonmaw catapult, on the {zone:1437} loop of the next guide"] = "Pour la catapulte Dragonmaw, lors de la boucle des {zone:1437} du guide suivant",
	-- {object:21056} Theramore Isle · {zone:1445} Dustwallow Marsh
	["Take the boat from Menethil's pier to {object:21056} in {zone:1445}."] = "Prenez le bateau depuis le quai de Menethil jusqu'à {object:21056} en {zone:1445}.",

	-- Step 38: Into The Barrens
	-- {zone:1413} The Barrens
	["Into {zone:1413}"] = "Dans les {zone:1413}",

	-- Step 39: Takar the Seer
	-- {zone:1413} The Barrens · {npc:6244} Takar the Seer
	["On the road south through the {zone:1413}, {npc:6244} camps east of the road, north-east of Camp Taurajo; come in from the east and keep clear of the Horde guards."] = "Sur la route vers le sud à travers {zone:1413}, {npc:6244} campe à l'est de la route, au nord-est du Camp Taurajo ; arrivez par l'est et évitez les gardes de la Horde.",
	-- {quest:1738} Heartswood · {zone:1440} Ashenvale · {zone:1443} Desolace
	["{quest:1738}: in {zone:1440}, on the way to {zone:1443}"] = "{quest:1738} : en {zone:1440}, en route vers {zone:1443}",
	-- {quest:65602} What Is Love? · {item:190309} Wooden Figurine · {quest:1738} Heartswood
	["{quest:65602}: the incubus, beside the succubus; the {item:190309} is near the {quest:1738}"] = "{quest:65602} : l'incube, à côté de la succube ; la {item:190309} est près de {quest:1738}",

	-- Step 40: Razorfen Kraul (dungeon, optional)
	["Razorfen Kraul (dungeon, optional)"] = "Kraal de Tranchebauge (donjon, facultatif)",
	-- {zone:1413} The Barrens · {zone:1441} Thousand Needles
	["Razorfen Kraul: a 5-player quilboar dungeon in the bramble at the southern edge of the {zone:1413}, west of the road down to {zone:1441}, best at 27 to 32. Its two Alliance quests are given inside: nothing to take beforehand. Alone? Skip it: the guide goes on to {zone:1441}."] = "Kraal de Tranchebauge : un donjon de huttes-épines pour 5 joueurs, dans les ronces au sud de {zone:1413}, à l'ouest de la route qui descend vers {zone:1441}, idéal de 27 à 32. Ses deux quêtes de l'Alliance sont données à l'intérieur : rien à prendre avant. Seul ? Le passer : le guide continue vers {zone:1441}.",
	["Horde land: keep clear of Camp Taurajo and its guards. Keep 2 free quest log slots."] = "Terre de la Horde : se tenir loin du Camp Taurajo et de ses gardes. Garder 2 places libres dans le journal.",
	["Razorfen Kraul"] = "Kraal de Tranchebauge",

	-- Step 41: Razorfen Kraul: Heralath Fallowbrook
	-- {npc:4510} Heralath Fallowbrook
	["Razorfen Kraul: {npc:4510}"] = "Kraal de Tranchebauge : {npc:4510}",
	-- {npc:4510} Heralath Fallowbrook · {quest:1142} Mortality Wanes · {item:5825} Treshala's Pendant
	["{npc:4510}, a night elf who died in the Kraul, lies inside (his spot: to check in game). {quest:1142} asks for {item:5825}: it drops from the quilboars of the Kraul, about 1 kill in 10, for each player on the quest."] = "{npc:4510}, un elfe de la nuit mort dans le kraal, gît à l'intérieur (sa place : à vérifier en jeu). {quest:1142} demande {item:5825} : il tombe sur les huttes-épines du kraal, environ 1 fois sur 10, pour chaque joueur qui a la quête.",

	-- Step 42: Razorfen Kraul: along the way
	["Razorfen Kraul: along the way"] = "Kraal de Tranchebauge : en chemin",
	-- {item:5825} Treshala's Pendant
	["{item:5825}: quilboars of the Kraul, about 1 in 10"] = "{item:5825} : huttes-épines du kraal, environ 1 fois sur 10",

	-- Step 43: Razorfen Kraul: Charlga Razorflank
	-- {npc:4421} Charlga Razorflank
	["Razorfen Kraul: {npc:4421}"] = "Kraal de Tranchebauge : {npc:4421}",
	-- {npc:4424} Aggem Thorncurse · {npc:4428} Death Speaker Jargba · {npc:4420} Overlord Ramtusk · {npc:4422} Agathelos the Raging · {npc:4421} Charlga Razorflank
	["Roogug, {npc:4424}, {npc:4428}, {npc:4420} and {npc:4422} come before her (the codex's order). {npc:4421} heals and calls her guards: interrupt her and kill the guards first."] = "Roogug, {npc:4424}, {npc:4428}, {npc:4420} et {npc:4422} viennent avant elle (ordre du codex). {npc:4421} soigne et appelle ses gardes : l'interrompre et tuer les gardes d'abord.",

	-- Step 44: Razorfen Kraul: Willix the Importer
	-- {quest:1144} Willix the Importer
	["Razorfen Kraul: {quest:1144}"] = "Kraal de Tranchebauge : {quest:1144}",
	-- {quest:1144} Willix the Importer
	["{quest:1144}, a goblin, is held prisoner inside (his spot: to check in game). Everyone takes his quest before he starts walking; he walks all the way back to the entrance and quilboars attack on the way. He gives the reward himself at the end."] = "{quest:1144}, un gobelin, est retenu prisonnier à l'intérieur (sa place : à vérifier en jeu). Chacun prend sa quête avant qu'il se mette en marche ; il marche jusqu'à l'entrée et des huttes-épines attaquent en chemin. Il donne lui-même la récompense à la fin.",
	["Not there? Another group is escorting him: wait for him to come back, or join them."] = "Pas là ? Un autre groupe l'escorte : attendre son retour, ou se joindre à eux.",
	["Escort him out of the Kraul"] = "L'escorter hors du kraal",
	-- {quest:1144} Willix the Importer
	["{quest:1144}, at the entrance"] = "{quest:1144}, à l'entrée",

	-- Step 47: Mirage Raceway
	["Mirage Raceway"] = "Piste des mirages",
	["Follow the canyons east to the salt flats. The goblins and gnomes of the Mirage Raceway are neutral and give quests to both factions."] = "Suivez les canyons vers l'est jusqu'aux plaines de sel. Les gobelins et gnomes de la Piste des mirages sont neutres et donnent des quêtes aux deux factions.",
	-- {quest:5762} Hemet Nesingwary
	["For {quest:5762} in Stranglethorn, later"] = "Pour {quest:5762} à Strangleronce, plus tard",

	-- Step 48: Mirage Raceway: kill these as you meet them
	["Mirage Raceway: kill these as you meet them"] = "Piste des mirages : tuez-les au fur et à mesure",
	-- {object:19868} Rocket Car Rubble
	-- plural, as words: Scorpid Reavers = {npc:4140} Scorpid Reaver · Saltstone Basilisks = {npc:4147} Saltstone Basilisk
	["{object:19868} lies all over the flats. Scorpid Reavers roam the north half; keep to it, away from the Saltstone Basilisks, Crystalhides and Gazers (32-35) of the middle and the far south."] = "{object:19868} jonchent les Salines. Les Scorpides ravageurs parcourent la moitié nord : restez-y, loin des Basilics du sel gemme, Peaux de cristal et Contemplateurs (32-35) du centre et de l'extrême sud.",

	-- Step 49: Mirage Raceway
	-- {npc:4454} Fizzle Brassbolts · {zone:1418} Badlands
	["{npc:4454}: for Martek in the {zone:1418}, at 39; not offered? Go on"] = "{npc:4454} : pour Martek dans {zone:1418}, à 39 ; non proposé ? Continuer",

	-- No longer in the guide (its English changed or it went away): reuse or delete.
	-- ["Back to Menethil"] = "Retour à Menethil",
	-- ["Back to {area:42}"] = "Retour à {area:42}",
	-- ["Bluegill Raiders"] = "Écumeurs Branchie-bleue",
	-- ["Dragonmaw camp"] = "Camp Dragonmaw",
	-- ["Dragonmaw catapult"] = "Catapulte Dragonmaw",
	-- ["Fly to {area:150}"] = "Prendre un vol pour {area:150}",
	-- ["Follow the canyons east to the salt flats. The goblins and gnomes of the {area:2240} are neutral and give quests to both factions."] = "Suivez les canyons vers l'est jusqu'aux Salines. Les gobelins et les gnomes de {area:2240} sont neutres et donnent des quêtes aux deux factions.",
	-- ["Follow the coast north to the wrecked ship. Cursed Sailors walk the beach, Cursed Marines the deck; {npc:1159} stands on the beach by the bow. Giant Wetlands Crocolisks lurk on the coast just north of it."] = "Suivez la côte vers le nord jusqu'à l'épave. Des Marins maudits ({npc:1157}) arpentent la plage, des Soldats de marine maudits ({npc:1158}) le pont ; {npc:1159} se tient sur la plage près de la proue. Des Crocilisques géants des Paluns ({npc:2089}) rôdent sur la côte juste au nord.",
	-- ["Follow the coast north-east past the wreck: the Bluegill Raiders hold the marsh beyond the Giant Crocolisks."] = "Suivez la côte vers le nord-est après l'épave : les Écumeurs Branchie-bleue tiennent le marais au-delà des Crocilisques géants.",
	-- ["Follow the road east to the excavation site."] = "Suivez la route vers l'est jusqu'aux Excavations de Whelgar.",
	-- ["For the Dragonmaw catapult, on the {zone:1437} loop of the next guide"] = "Pour la catapulte des Dragonmaw, lors de la boucle des {zone:1437} du guide suivant",
	-- ["For {npc:4048} in {zone:1444}, much later"] = "Pour {npc:4048} en {zone:1444}, bien plus tard",
	-- ["From Theramore follow the road west out of Dustwallow into the {zone:1413} and south along it; give {area:378} a wide berth. {area:485} at the {zone:1413}' south end takes you down into {zone:1441}. The journal lies at the foot of the lift."] = "Depuis Theramore, suivez la route vers l'ouest pour quitter Âprefange et entrer dans {zone:1413}, puis vers le sud ; évitez largement {area:378}. {area:485}, à l'extrémité sud de {zone:1413}, vous fait descendre à {zone:1441}. Le journal se trouve au pied de l'élévateur.",
	-- ["From {npc:352} in {zone:1453}"] = "De {npc:352} à {zone:1453}",
	-- ["Group 10 · {zone:1441}, {zone:1431} & {zone:1437}"] = "Groupe 10 · {zone:1441}, {zone:1431} et {zone:1437}",
	-- ["Group: highest player at most 4 levels above the lowest. Above 30? Wait for the others."] = "Groupe : le plus haut au maximum 4 niveaux au-dessus du plus bas. Au-delà de 30 ? Attendre les autres.",
	-- ["Group: highest player at most 4 levels above the lowest. Above 31? Wait for the others."] = "Groupe : le plus haut au maximum 4 niveaux au-dessus du plus bas. Au-delà de 31 ? Attendre les autres.",
	-- ["Head east again to the Dragonmaw camp. The four sets of Attack Plans lie in the {area:1036}; {npc:2091}, an elite, stands in the camp too."] = "Retournez vers l'est jusqu'au camp Dragonmaw. Les quatre jeux de plans d'attaque se trouvent au {area:1036} ; {npc:2091}, un élite, se tient aussi dans le camp.",
	-- ["Hearth to Darkshire"] = "Pierre de foyer pour Sombre-Comté",
	-- ["Hearth to {area:42}"] = "Pierre de foyer vers {area:42}",
	-- ["Her house stands on the hill south-east of {area:42}."] = "Sa maison se trouve sur la colline au sud-est de {area:42}.",
	-- ["Menethil Bay"] = "Baie de Menethil",
	-- ["Nightbane Shadow Weavers"] = "Tisseurs d'ombre Plaie-de-nuit",
	-- ["No {item:4371} for {quest:174}? {npc:3133} sells it in the house beside {npc:276}, in limited stock; {npc:1448} in {area:150} sells it too."] = "Pas de {item:4371} pour {quest:174} ? {npc:3133} en vend dans la maison voisine de celle de {npc:276}, en stock limité ; {npc:1448} à {area:150} en vend aussi.",
	-- ["On the road south through the {zone:1413}, {npc:6244} camps east of the road, north-east of {area:378}; come in from the east and keep clear of the Horde guards."] = "Sur la route vers le sud à travers les {zone:1413}, {npc:6244} campe à l'est de la route, au nord-est du {area:378} ; arrivez par l'est et évitez les gardes de la Horde.",
	-- ["Plague Spreaders"] = "Répandeurs de peste",
	-- ["Ride back west along the road to {area:150}."] = "Revenez vers l'ouest le long de la route jusqu'à {area:150}.",
	-- ["Ride east again to the Dragonmaw camp. The four sets of Attack Plans lie in the {area:1036}; {npc:2091}, an elite, stands in the camp too."] = "Repartez vers l'est jusqu'au camp des Dragonmaw. Les quatre jeux de plans d'attaque se trouvent dans {area:1036} ; {npc:2091}, un élite, se tient aussi dans le camp.",
	-- ["Ride east again; the catapult stands at the Dragonmaw camp south of the road."] = "Chevauchez de nouveau vers l'est ; la catapulte se trouve au camp Dragonmaw au sud de la route.",
	-- ["Ride east to the ogre mound. {item:1349} sits in the camp at its entrance; Splinter Fist ogres guard it."] = "Chevauchez vers l'est jusqu'au tertre des ogres. {item:1349} se trouve dans le camp à son entrée ; des ogres Brisepoing la gardent.",
	-- ["Ride east to the ogre mound. {object:119} sits in the camp at its entrance; Splinter Fist ogres guard it."] = "Chevauchez vers l'est jusqu'au tertre des ogres. La {object:119} se trouve dans le camp à son entrée ; des ogres Brisepoing la gardent.",
	-- ["Ride west along the road; the hermit's shack stands north-east of the {area:492}."] = "Chevauchez vers l'ouest le long de la route ; la cabane de l'ermite se trouve au nord-est de {area:492}.",
	-- ["Skeletal Raiders, Healers and Warders hold the west part of the cemetery, just east of {npc:311}'s camp."] = "Les Écumeurs, Soigneurs et Gardiens squelettes tiennent la partie ouest du cimetière, juste à l'est du camp de {npc:311}.",
	-- ["Take the boat from Menethil's pier to {area:513} in {zone:1445}."] = "Prenez le bateau du quai de Menethil pour {area:513}, dans {zone:1445}.",
	-- ["The Dark Runners prowl the woods south of the road, west of {area:42}."] = "Les Messagers rôdent dans les bois au sud de la route, à l'ouest de {area:42}.",
	-- ["The Defias camp lies in the south-west of {area:10}, south of {area:94} near the {zone:1436} border. The strongbox stands among the tents."] = "Le camp des Défias se trouve dans le sud-ouest du {area:10}, au sud de {area:94}, près de la frontière avec {zone:1436}. Le coffre se trouve parmi les tentes.",
	-- ["The Defias camp lies in the south-west of {zone:1431}, south of {area:94} near the {zone:1436} border. The strongbox stands among the tents."] = "Le camp défias se trouve dans le sud-ouest de {zone:1431}, au sud de {area:94}, près de la frontière de {zone:1436}. Le coffre se trouve parmi les tentes.",
	-- ["The Dragonmaw orcs camp east of the excavation site. Raiders and Swamprunners carry the war banners."] = "Les orcs Dragonmaw campent à l'est des Excavations de Whelgar. Les Écumeurs et les Arpenteurs portent les bannières de guerre.",
	-- ["The Goaz Warders stand just west of Whelgar's camp: use the {item:279996} he gave you beside one.\nThe relics lie in the dig itself. {npc:1353}, a big Razormaw, prowls the raptor valley just west of it.\nThe Dragonmaw orcs camp east of the excavation site. Raiders and Swamprunners carry the war banners."] = "Les Goaz Warders se tiennent juste à l'ouest du camp de Whelgar : utilisez à côté de l'un d'eux le {item:279996} qu'il vous a donné.\nLes reliques se trouvent dans les fouilles elles-mêmes. {npc:1353}, un gros tranchegueule, rôde dans la vallée des raptors juste à l'ouest.\nLes orcs Dragonmaw campent à l'est du site de fouilles. Les écumeurs et les arpenteurs portent les bannières de guerre.",
	-- ["The Plague Spreaders walk the northern half of the {area:492}. {npc:522}, an elite, wanders the graves: keep away from him."] = "Les Répandeurs de peste errent dans la moitié nord de {area:492}. {npc:522}, un élite, rôde parmi les tombes : tenez-vous à l'écart.",
	-- ["The Plague Spreaders walk the northern half of the {area:492}. {npc:522}, an elite, wanders the graves: keep away from him.\nSkeletal Raiders, Healers and Warders hold the west part of the cemetery, just east of {npc:311}'s camp.\nCareful: The skeletons in the catacombs are packed close together, so you can easily pull extra mobs."] = "Les Répandeurs de peste errent dans la moitié nord du {area:492}. {npc:522}, un élite, rôde parmi les tombes : tenez-vous à l'écart.\nDes Écumeurs squelettes, des Soigneurs squelettes et des Gardiens squelettes tiennent la partie ouest du cimetière, juste à l'est du camp de {npc:311}.\nAttention : les squelettes des catacombes sont serrés les uns contre les autres : vous pouvez facilement attirer des monstres en plus.",
	-- ["The dig and {npc:1353}"] = "Les fouilles et {npc:1353}",
	-- ["The next step, Defeat Nek'rosh, pits you against an elite chieftain: skip it."] = "L'étape suivante, Vaincre Nek'rosh, vous oppose à un chef élite : passez-la.",
	-- ["The relics lie in the dig itself. {npc:1353}, a big Razormaw, prowls the raptor valley just west of it."] = "Les reliques se trouvent dans les fouilles mêmes. {npc:1353}, un grand raptor Razormaw, rôde dans la vallée des raptors juste à l'ouest.",
	-- ["The salt flats"] = "Les Salines",
	-- ["The strongest worgen roam the woods south of {area:42}, west and south of the {area:121}. The {npc:511} hides in the small crypt by the cemetery."] = "Les worgens les plus forts rôdent dans les bois au sud de {area:42}, à l'ouest et au sud de {area:121}. Le {npc:511} se cache dans la petite crypte près du cimetière.",
	-- ["The strongest worgen roam the woods south of {area:42}, west and south of the {area:121}. The {npc:511} hides in the small crypt by the cemetery.\nCareful: {spell:8282} lasts 10 minutes and adds 13 to each hit of physical damage you take.\nCareful: Some worgen outside the cave stand in groups, including one camp of four. To avoid adds, pull them one at a time from the raised ground next to the cave entrance."] = "Les worgens les plus forts parcourent les bois au sud de {area:42}, à l'ouest et au sud du {area:121}. {npc:511} se cache dans la petite crypte près du cimetière.\nAttention : {spell:8282} dure 10 minutes et ajoute 13 points à chaque coup physique que vous subissez.\nAttention : certains worgens devant la grotte se tiennent en groupes, dont un camp de quatre. Pour éviter les renforts, attirez-les un par un depuis la butte à côté de l'entrée de la grotte.",
	-- ["The worgen hold the woods of Brightwood, west of {area:42} and north of the road. Pull them one at a time."] = "Les worgens tiennent les bois du Bosquet de Clairbois, à l'ouest de {area:42} et au nord de la route. Attirez-les un par un.",
	-- ["The wreck of the Third Fleet"] = "L'épave de la Troisième flotte",
	-- ["{area:1039}: kill these as you meet them"] = "{area:1039} : tuez-les au passage",
	-- ["{area:118}: kill these as you meet them"] = "{area:118} : tuez-les au passage",
	-- ["{area:2240}: kill these as you meet them"] = "{area:2240} : tuez-les au passage",
	-- ["{area:42} flight master"] = "Maître de vol de {area:42}",
	-- ["{area:492}, west"] = "{area:492}, ouest",
	-- ["{area:492}: kill these as you meet them"] = "{area:492} : tuez-les au passage",
	-- ["{area:93}: kill these as you meet them"] = "{area:93} : tuez-les au passage",
	-- ["{item:2661}: the {object:331}"] = "{item:2661} : le {object:331}",
	-- ["{npc:1217}, inside"] = "{npc:1217}, à l'intérieur",
	-- ["{npc:1217}, upstairs in the inn"] = "{npc:1217}, à l'étage de l'auberge",
	-- ["{npc:2104}, by the keep"] = "{npc:2104}, près du donjon",
	-- ["{npc:2104}, in {area:2103}"] = "{npc:2104}, dans {area:2103}",
	-- ["{npc:2104}, in {area:2103}; on the top floor"] = "{npc:2104}, dans {area:2103} ; au dernier étage",
	-- ["{npc:267}, in the town hall"] = "{npc:267}, à l'hôtel de ville",
	-- ["{npc:276}, at the east end of town"] = "{npc:276}, à l'extrémité est de la ville",
	-- ["{npc:4454}: for Martek in the {zone:1418}, later"] = "{npc:4454} : pour Martek dans {zone:1418}, plus tard",
	-- ["{npc:661}, by {npc:633}'s house"] = "{npc:661}, près de la maison de {npc:633}",
	-- ["{npc:663}, by the town hall"] = "{npc:663}, près de l'hôtel de ville",
	-- ["{npc:840} walks around {area:42}: look inside the circle on the map"] = "{npc:840} se promène autour de {area:42} : cherchez dans le cercle sur la carte",
	-- ["{npc:840}, at the north entrance of town"] = "{npc:840}, à l'entrée nord de la ville",
	-- ["{npc:840}, at the north entrance of town; walks around {area:42}: look inside the circle on the map"] = "{npc:840}, à l'entrée nord de la ville ; patrouille autour de {area:42} : regardez dans le cercle sur la carte",
	-- ["{object:19868} lies all over the flats. Scorpid Reavers, Sparkleshell Tortoises and Saltstone Basilisks roam the north half, Crystalhides, Scorpid Terrors and Snappers the middle, and the Gazers (34-35, five levels above you: one at a time) the far south. Vultures circle over all of it."] = "{object:19868} jonchent les Salines. Les Scorpides ravageurs, Tortues nacrétoile et Basilics du sel gemme parcourent la moitié nord, les Peaux de cristal, Scorpides terrifiants et Mordeuses au milieu, et les Contemplateurs (34-35, cinq niveaux au-dessus de vous : un à la fois) à l'extrême sud. Des vautours tournoient au-dessus de tout cela.",
}
