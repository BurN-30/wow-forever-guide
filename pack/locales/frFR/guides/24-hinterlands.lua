-- French (frFR): the guide groupe-alliance/24-hinterlands (guides/24-hinterlands.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1425} The Hinterlands · {zone:1419} Blasted Lands · {zone:1432} Loch Modan
	["Group 22 · {zone:1425}, {zone:1419} & {zone:1432}"] = "Groupe 22 · {zone:1425}, {zone:1419} et {zone:1432}",

	-- Step 1: The Altar of Zul
	-- {zone:1425} The Hinterlands · {npc:7996} Qiaga the Keeper · {npc:8636} Morta'gya the Keeper
	-- plural, as words: Vilebranch Soothsayers = {npc:4467} Vilebranch Soothsayer
	["Ride south-east to the Altar of Zul, the stepped Vilebranch temple in the south of the {zone:1425}, and climb to the top. {npc:7996} and {npc:8636} (elite, 50) stand up there: touch the top and come straight back down.\nCareful: Elite trolls guard the top platform, including {npc:7996} and {npc:8636}, along with several Vilebranch Soothsayers. The soothsayers cast spells and are linked to the rest of the group."] = "Allez au sud-est jusqu'à l'Autel de Zul, le temple à degrés des Vilebranche au sud des {zone:1425}, et grimpez au sommet. {npc:7996} et {npc:8636} (élite, 50) s'y tiennent : touchez le sommet et redescendez directement.\nAttention : Des trolls élites gardent la plateforme supérieure, dont {npc:7996} et {npc:8636}, ainsi que plusieurs Devin Vilebranche. Les devins lancent des sorts et sont liés au reste du groupe.",
	["Everyone at their own pace: what you already did ticks itself, the guide picks up where you are. Playing together? Group XP is best within 4 levels."] = "Chacun à son rythme : ce qui est déjà fait se coche tout seul, le guide reprend où vous en êtes. En groupe ? L'XP de groupe est meilleure à 4 niveaux d'écart ou moins.",

	-- Step 2: The Mallet of Zul'Farrak (second Zul'Farrak run)
	-- {item:9240} Mallet of Zul'Farrak
	["The {item:9240} (second Zul'Farrak run)"] = "Le {item:9240} (second passage à Zul'Farrak)",
	-- {npc:7273} Gahz'rilla · {item:9240} Mallet of Zul'Farrak · {npc:7996} Qiaga the Keeper · {item:9241} Sacred Mallet
	["For {npc:7273}, one player of the group needs the {item:9240}. Kill {npc:7996} (elite 50) at the top of the Altar of Zul for the {item:9241}, then ride east to Jintha'Alor and fight up to the altar at its very top: use the {item:9241} there. Both temples are full of elite trolls of 46 to 50: the whole group goes. Keep the mallet in the bags until Group 24."] = "Pour {npc:7273}, un joueur du groupe doit avoir le {item:9240}. Tuer {npc:7996} (élite 50) au sommet de l'Autel de Zul pour le {item:9241}, puis partir à l'est vers Jintha'Alor et monter jusqu'à l'autel tout en haut : y utiliser le {item:9241}. Les deux temples sont pleins de trolls élites de 46 à 50 : tout le groupe y va. Garder le marteau dans les sacs jusqu'au Groupe 24.",
	["At the Jintha'Alor altar, the very top"] = "À l'autel de Jintha'Alor, tout en haut",

	-- Step 3: Atal'ai Exile (Sunken Temple, optional)
	-- {npc:5598} Atal'ai Exile
	["{npc:5598} (Sunken Temple, optional)"] = "{npc:5598} (Temple englouti, facultatif)",
	-- {npc:5598} Atal'ai Exile · {zone:1453} Stormwind
	["Shadra'Alor, the troll ruins west of the Altar of Zul: the {npc:5598} waits on a ledge beside the steps of one of the pyramids, not at the top. His quest is for the Sunken Temple, which the guide offers in Group 25 (levels 50 to 55; the question comes in {zone:1453}, further on): take it only if your group means to run it. It stays in the quest log until then. Alone? Skip it."] = "Shadra'Alor, les ruines trolls à l'ouest de l'autel de Zul : l'{npc:5598} attend sur une corniche, à côté des marches d'une des pyramides, pas au sommet. Sa quête est pour le Temple englouti, que le guide propose au Groupe 25 (niveaux 50 à 55 ; la question vient plus loin, à {zone:1453}) : ne la prendre que si le groupe compte le faire. Elle reste dans le journal jusque-là. Seul ? La passer.",
	-- {npc:5598} Atal'ai Exile · {quest:1446} Jammal'an the Prophet
	["{npc:5598}: {quest:1446}, in the Sunken Temple"] = "{npc:5598} : {quest:1446}, dans le Temple englouti",

	-- Step 4: Skulk Rock
	["Skulk Rock"] = "Rocher de l'Affût",
	-- {zone:1425} The Hinterlands
	-- plural, as words: Green Sludges = {npc:2655} Green Sludge · Jade Oozes = {npc:2656} Jade Ooze
	["Ride north to Skulk Rock in the middle of the {zone:1425}. Green Sludges and Jade Oozes crawl all around it.\nCareful: Panthers move around the area in stealth."] = "Allez au nord jusqu'au Rocher de l'Affût au milieu des {zone:1425}. Des limaces vertes et des limons de jade rampent tout autour.\nAttention : des panthères se déplacent camouflées dans la zone.",

	-- Step 5: Aerie Peak
	["Aerie Peak"] = "Nid-de-l'Aigle",
	["Inside"] = "À l'intérieur",
	-- {npc:5636} Gryphon Master Talonaxe
	["{npc:5636}, inside"] = "{npc:5636}, à l'intérieur",
	-- {quest:2990} Thadius Grimshade
	["for {quest:2990} at Nethergarde Keep, later"] = "pour {quest:2990} à Rempart-du-Néant, plus tard",

	-- Step 6: Fly to Ironforge
	-- {zone:1455} Ironforge
	["Fly to {zone:1455}"] = "Envolez-vous vers {zone:1455}",
	["Aerie Peak flight master"] = "Maître de vol de Nid-de-l'Aigle",

	-- Step 7: Librarian Mae Paledust
	-- {object:32356} Hall of Explorers
	["In the {object:32356}, by the bookshelves."] = "Dans le {object:32356}, près des étagères.",

	-- Step 8: Class trainer
	["Class trainer"] = "Maître de classe",

	-- Step 9: Tram to Stormwind
	-- {zone:1453} Stormwind
	["Tram to {zone:1453}"] = "Tram pour {zone:1453}",

	-- Step 11: Cathedral of Light: Archbishop Benedictus
	-- {npc:1284} Archbishop Benedictus
	["Cathedral of Light: {npc:1284}"] = "Cathédrale de la Lumière : {npc:1284}",
	-- {quest:3636} Bring the Light · {npc:1284} Archbishop Benedictus
	["{quest:3636}, from Razorfen Downs: {npc:1284} is in the Cathedral of Light."] = "{quest:3636}, des Souilles de Tranchebauge : {npc:1284} est dans la cathédrale de la Lumière.",

	-- Step 12: Sunken Temple (dungeon, optional): Brohann Caskbelly
	-- {npc:5384} Brohann Caskbelly
	["Sunken Temple (dungeon, optional): {npc:5384}"] = "Temple englouti (donjon, facultatif) : {npc:5384}",
	-- {zone:1435} Swamp of Sorrows · {zone:1419} Blasted Lands
	["The Sunken Temple: a troll and dragon dungeon under the Pool of Tears in the {zone:1435}, best at 50 to 55 with a group of 5. This guide runs it later, from the {zone:1419} (Group 25). Alone? Skip it."] = "Le Temple englouti : un donjon de trolls et de dragons sous le Bassin des larmes, dans le {zone:1435}, idéal de 50 à 55 à 5 joueurs. Le guide le fait plus tard, depuis les {zone:1419} (Groupe 25). Seul ? La passer.",

	-- Step 14: Darkshire
	["Darkshire"] = "Sombre-Comté",

	-- Step 15: Fly to Lakeshire
	["Fly to Lakeshire"] = "Envolez-vous vers Comté-du-Lac",
	["Darkshire flight master"] = "Maître de vol de Sombre-Comté",

	-- Step 16: Morgan's Vigil flight master
	["Morgan's Vigil flight master"] = "Maître de vol de la Veille de Morgan",

	-- Step 17: Fly to Thelsamar
	["Fly to Thelsamar"] = "Volez vers Thelsamar",

	-- Step 19: Ironband's Excavation Site
	["Ironband's Excavation Site"] = "Excavations de Baguefer",
	["Ride east along the south shore of the loch to Ironband's camp."] = "Chevauchez vers l'est le long de la rive sud du Loch jusqu'aux Excavations de Baguefer.",

	-- Step 20: Thelsamar
	["Thelsamar"] = "Thelsamar",
	-- {npc:1470} Ghak Healtouch
	["{npc:1470}, below ground"] = "{npc:1470}, sous terre",

	-- Step 21: Into Badlands
	-- {zone:1418} Badlands
	["Into {zone:1418}"] = "Dans {zone:1418}",

	-- Step 23: The Uldaman dig
	["The Uldaman dig"] = "La fouille d'Uldaman",
	-- {zone:1418} Badlands
	["Ride south through the pass into the {zone:1418}' northern edge: the Stonevault troggs dig outside Uldaman there. The carved urns and the magenta mushroom clusters sit in their caves and tunnels, outside the dungeon itself."] = "Allez au sud à travers le col jusqu'au bord nord des {zone:1418} : les troggs de Coffrepierre fouillent à l'extérieur d'Uldaman. Les urnes sculptées et les grappes de champignons magenta se trouvent dans leurs grottes et tunnels, à l'extérieur du donjon lui-même.",
	-- {item:8047} Magenta Fungus Cap
	["{item:8047}; below ground"] = "{item:8047} ; sous terre",
	-- {object:2743} Carved Stone Urn
	["{object:2743}; below ground"] = "{object:2743} ; sous terre",

	-- Step 24: Into Loch Modan
	-- {zone:1432} Loch Modan
	["Into {zone:1432}"] = "Dans les {zone:1432}",

	-- Step 27: Ironband's Excavation Site
	["Ride back north to Ironband's camp."] = "Revenez vers le nord jusqu'aux Excavations de Baguefer.",

	-- Step 28: Fly to Menethil Harbor
	-- {object:1162} Menethil Harbor
	["Fly to {object:1162}"] = "Envolez-vous vers {object:1162}",
	["Thelsamar flight master"] = "Maître de vol de Thelsamar",

	-- Step 31: Rut'theran Village
	["Rut'theran Village"] = "Village de Rut'theran",
	-- {npc:7907} Daryn Lightwind · {npc:7916} Erelas Ambersky
	["{npc:7907} stands upstairs, above {npc:7916}: go up inside, the arrow cannot tell the floors apart."] = "{npc:7907} se tient à l'étage, au-dessus de {npc:7916} : montez à l'intérieur, la flèche ne distingue pas les étages.",
	-- {npc:7907} Daryn Lightwind · {zone:1446} Tanaris
	["{npc:7907}'s next errand goes to {zone:1446}: skip it."] = "La course suivante de {npc:7907} Lightwind mène en {zone:1446} : passez-la.",
	-- {npc:7916} Erelas Ambersky · {zone:1428} Burning Steppes
	["{npc:7916}: keep it, the feathers come at the end of the {zone:1428} guide"] = "{npc:7916} : gardez-la, les plumes viennent à la fin du guide des {zone:1428}",
	["the book on her table"] = "le livre sur sa table",

	-- Step 33: Temple of the Moon
	["Temple of the Moon"] = "Temple de la Lune",
	-- {zone:1457} Darnassus
	["Step through the portal into {zone:1457}. The Temple of the Moon is in the south of the city."] = "Franchissez le portail vers {zone:1457}. Le Temple de la Lune se trouve au sud de la cité.",
	-- {npc:7740} Gracina Spiritmight
	["{npc:7740}, beside her"] = "{npc:7740}, à côté d'elle",

	-- Step 35: Craftsmen's Terrace
	["Craftsmen's Terrace"] = "Terrasse des Artisans",

	-- Step 36: Cenarion Enclave
	["Cenarion Enclave"] = "Enclave cénarienne",
	-- {npc:3516} Arch Druid Fandral Staghelm
	["{npc:3516}, at the top of the tree"] = "{npc:3516}, au sommet de l'arbre",

	-- Step 38: Cenarion Enclave
	-- {zone:1449} Un'Goro Crater
	["the soil comes from {zone:1449}, later"] = "la terre vient du {zone:1449}, plus tard",

	-- Step 39: Portal to Teldrassil
	-- {zone:1438} Teldrassil
	["Portal to {zone:1438}"] = "Portail vers {zone:1438}",

	-- Step 40: Fly to Auberdine
	["Fly to Auberdine"] = "Envolez-vous pour Auberdine",
	["Rut'theran Village flight master"] = "Maître de vol du village de Rut'theran",

	-- Step 41: Boat to Stormwind Harbor
	["Boat to Stormwind Harbor"] = "Bateau pour le port de Hurlevent",

	-- Step 44: The bloodmages
	["The bloodmages"] = "Les mages de sang",
	-- {zone:1419} Blasted Lands
	["The bloodmages' camp is the first stop beside the road into the {zone:1419}, north-west of Nethergarde Keep."] = "Le camp des mages de sang est le premier arrêt au bord de la route menant aux {zone:1419}, au nord-ouest de Rempart-du-Néant.",

	-- Step 45: Nethergarde Keep
	["Nethergarde Keep"] = "Rempart-du-Néant",
	-- {item:6091} Crate of Power Stones
	["Ride on east along the road to the keep first: the {item:6091} expires an hour after Darkshire, and the bloodmages' beasts take longer than that."] = "Continuez vers l'est le long de la route jusqu'au donjon d'abord : le {item:6091} expire une heure après Sombre-Comté, et les bêtes des mages de sang mettent plus de temps que cela.",
	-- {quest:2990} Thadius Grimshade
	["{quest:2990}, at the top of the keep"] = "{quest:2990}, au sommet du donjon",
	-- {npc:8022} Thadius Grimshade · {quest:2991} Nekrum's Medallion
	["{npc:8022}' next task, {quest:2991}, is a Zul'Farrak quest: only for the second run (Group 24), taken in the next step; otherwise skip it."] = "La tâche suivante de {npc:8022}, {quest:2991}, est une quête de Zul'Farrak : seulement pour le second passage (Groupe 24), prise à l'étape suivante ; sinon, la passer.",
	-- {npc:5385} Watcher Mahar Ba
	["{npc:5385}, upstairs"] = "{npc:5385}, à l'étage",

	-- Step 46: Thadius Grimshade: Nekrum's Medallion (second Zul'Farrak run)
	-- {quest:2990} Thadius Grimshade · {quest:2991} Nekrum's Medallion
	["{quest:2990}: {quest:2991} (second Zul'Farrak run)"] = "{quest:2990} : {quest:2991} (second passage à Zul'Farrak)",
	-- {quest:2991} Nekrum's Medallion · {npc:8022} Thadius Grimshade · {npc:7796} Nekrum Gutchewer
	["Back up to the top of the keep: each player takes {quest:2991} from {npc:8022} (it cannot be shared). {npc:7796} is fought in Zul'Farrak in Group 24, and {npc:8022} takes the medallion back in Group 25."] = "Remonter en haut du donjon : chaque joueur prend {quest:2991} auprès de {npc:8022} (elle ne se partage pas). {npc:7796} se combat dans Zul'Farrak au Groupe 24, et {npc:8022} reprend le médaillon au Groupe 25.",

	-- Step 47: Blasted Lands: kill these as you meet them
	-- {zone:1419} Blasted Lands
	["{zone:1419}: kill these as you meet them"] = "{zone:1419} : tuez-les au fur et à mesure que vous les rencontrez",
	-- {npc:5982} Black Slayer · {npc:8301} Clack the Reaver
	-- plural, as words: Starving Snickerfangs = {npc:5984} Starving Snickerfang · Scorpok Stingers = {npc:5988} Scorpok Stinger · Ashmane Boars = {npc:5992} Ashmane Boar · Redstone Basilisks = {npc:5990} Redstone Basilisk
	["Ride west: Starving Snickerfangs roam the dry hills just south of the bloodmages' camp; Scorpok Stingers (level 50) scuttle across the middle of the north. {npc:5982} vultures circle over all of it. Pull one at a time.\nAshmane Boars and Redstone Basilisks share the slopes south-west of the keep. Keep clear of the Helboars further south: they are level 52.\nCareful: Scorpok Stingers use Venom Sting; {npc:8301} adds Knockdown."] = "Allez à l'ouest : des raillecrocs affamées rôdent sur les collines sèches juste au sud du camp des mages de sang ; des aiguillonneurs scorpok (niveau 50) traversent le milieu du nord. Des vautours {npc:5982} tournent au-dessus de tout cela. Attirez-en un à la fois.\nDes sangliers cendrés et des basilics Rougepierre partagent les pentes au sud-ouest du donjon. Éloignez-vous des sangliers infernaux plus au sud : ils sont de niveau 52.\nAttention : les aiguillonneurs scorpok utilisent Piqûre venimeuse ; {npc:8301} ajoute Renversement.",

	-- Step 48: The bloodmages
	["The bloodmages' second tier pays for the same parts with a buff item and no experience: skip it."] = "Le second palier des mages de sang paie les mêmes morceaux avec un objet d'amélioration et sans expérience : passez-le.",

	-- Step 49: Fly to Booty Bay
	-- {object:3204} Booty Bay
	["Fly to {object:3204}"] = "Envolez-vous pour {object:3204}",
	["Nethergarde Keep flight master"] = "Maître de vol de Rempart-du-Néant",

	-- Step 50: Monogrammed Sash
	-- {quest:8552} The Monogrammed Sash
	["These are elite mobs: grouping up is encouraged, look for people to do it with. {quest:8552} needs a group of 2. Skip it if you are alone: the route has you grind the XP back."] = "Ce sont des monstres élites : il est conseillé de se grouper, cherchez des joueurs avec qui le faire. {quest:8552} demande un groupe de 2. Passez-la si vous êtes seul : l'itinéraire vous fait regagner l'expérience en tuant des monstres.",

	-- Step 54: Facing Negolash
	-- {npc:1494} Negolash
	["These are elite mobs: grouping up is encouraged, look for people to do it with. {npc:1494} (level 52 elite) needs a group of 2. Skip it if you are alone: the route has you grind the XP back."] = "Ce sont des monstres élites : il est conseillé de se grouper, cherchez des joueurs avec qui le faire. {npc:1494} (élite de niveau 52) demande un groupe de 2. Passez-le si vous êtes seul : l'itinéraire vous fait regagner l'expérience en tuant des monstres.",
}
