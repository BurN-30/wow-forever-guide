-- French (frFR): the guide groupe-alliance/20-strangleronce-marecage (guides/20-strangleronce-marecage.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1434} Stranglethorn Vale · {zone:1445} Dustwallow Marsh · {zone:1435} Swamp of Sorrows
	["Group 18 · {zone:1434}, {zone:1445} & {zone:1435}"] = "Groupe 18 · {zone:1434}, {zone:1445} et {zone:1435}",

	-- Step 1: Theramore
	["Theramore"] = "Theramore",
	-- {quest:1260} Morgan Stern · {npc:4897} Helenia Olden
	["{quest:1260} stands near the inn; {npc:4897}, a trade supplier a few steps south, sells the spices Jarl wants."] = "{quest:1260} se tient près de l'auberge ; {npc:4897}, une marchande à quelques pas au sud, vend les épices que veut Jarl.",
	["Everyone at their own pace: what you already did ticks itself, the guide picks up where you are. Playing together? Group XP is best within 4 levels."] = "Chacun à son rythme : ce qui est déjà fait se coche tout seul, le guide reprend où vous en êtes. En groupe ? L'XP de groupe est meilleure à 4 niveaux d'écart ou moins.",
	-- {quest:1260} Morgan Stern
	["{quest:1260}, inside"] = "{quest:1260}, à l'intérieur",
	-- {item:3713} Soothing Spices
	["{item:3713}, for \"Swamp Eye\" Jarl"] = "{item:3713}, pour « Œil-des-marais » Jarl",

	-- Step 2: Sentry Point
	-- {object:21053} Sentry Point
	-- plural, as words: Mudrock Burrowers = {npc:4398} Mudrock Burrower
	["Follow the road north-west out of Theramore to the watchtower at {object:21053}. Mudrock Burrowers roam the marsh around it."] = "Suivez la route au nord-ouest depuis Theramore jusqu'à la tour de guet à {object:21053}. Des creuseuses Rochefange rôdent dans le marais autour.",

	-- Step 3: Archmage Tervosh
	-- {object:21057} Foothold Citadel
	["Back in Theramore: Tervosh waits with Lady Jaina in the tower of {object:21057}."] = "De retour à Theramore : Tervosh attend avec dame Jaina dans la tour de {object:21057}.",
	["Upstairs"] = "À l'étage",

	-- Step 6: Theramore
	-- {npc:4794} Morgan Stern
	["{npc:4794}, inside"] = "{npc:4794}, à l'intérieur",

	-- Step 7: Swamplight Manor
	["Swamplight Manor"] = "Manoir des Flammeroles",
	["Take the road north to the ruined manor; Jarl lives in the shack beside it and the loose dirt is at the corner of the house."] = "Prenez la route vers le nord jusqu'au manoir en ruine ; Jarl vit dans la cabane voisine et la terre meuble se trouve à l'angle de la maison.",
	-- {quest:1218} Soothing Spices
	["{quest:1218}, for \"Swamp Eye\" Jarl"] = "{quest:1218}, pour « Œil-des-marais » Jarl",
	["with the spices from Theramore"] = "avec les épices de Theramore",

	-- Step 8: "Stinky" Ignatz
	["\"Stinky\" Ignatz"] = "Ignatz \"Puant\"",
	-- {object:21054} North Point Tower
	["Stinky waits west of the manor, in the marsh below {object:21054}. Lead him to his Bogbean leaves and keep the swamp creatures off him."] = "Stinky attend à l'ouest du manoir, dans le marais sous {object:21054}. Menez-le à ses feuilles de ményanthes et empêchez les créatures du marais de l'approcher.",

	-- Step 9: North Point Tower
	-- {npc:4966} Private Hendel
	["{npc:4966} holds the tower with a few deserters. He turns on you: beat him until he yields.\nCareful: Hendel has two guards who join the fight when he turns hostile. The guards flee once he surrenders."] = "{npc:4966} tient la tour avec quelques déserteurs. Il se retourne contre vous : battez-le jusqu'à ce qu'il se rende.\nAttention : Hendel a deux gardes qui se joignent au combat quand il devient hostile. Les gardes s'enfuient dès qu'il se rend.",

	-- Step 10: Darkmist Cavern
	["Darkmist Cavern"] = "Caverne de Sombrebrume",
	-- plural, as words: Darkmist Lurkers = {npc:4377} Darkmist Lurker
	["The Darkmist spiders nest around the cavern in the north-west of the marsh; every spider drops eyes.\nCareful: Darkmist Lurkers move about stealthed and use poison once in combat. The spiders stand close together, so adds are common; pulling single targets from the outer edge cuts down on them."] = "Les araignées Sombrebrume nichent autour de la caverne au nord-ouest du marais ; toutes lâchent des yeux.\nAttention : les Rôdeuses de Sombrebrume se déplacent camouflées et empoisonnent une fois en combat. Les araignées se tiennent près les unes des autres, les renforts sont donc fréquents ; attirer des cibles isolées depuis la bordure les limite.",

	-- Step 11: Mudcrush Durtfeet
	["Ride south to the giant's hut in the middle of the marsh."] = "Chevauchez vers le sud jusqu'à la hutte du géant au milieu du marais.",

	-- Step 12: The Shady Rest Inn
	-- {zone:1413} Barrens
	["The burned inn stands on the road west, toward the {zone:1413}; the guard's badge lies in the ashes and the hoofprints are in the mud beside the inn."] = "L'auberge brûlée se trouve sur la route à l'ouest, vers {zone:1413} ; le badge du garde gît dans les cendres et les empreintes de sabots sont dans la boue à côté de l'auberge.",

	-- Step 13: Theramore
	-- {object:21057} Foothold Citadel
	["Follow the road east back to Theramore. Tervosh, Lady Jaina and the officers are in the tower and {object:21057}."] = "Suivez la route vers l'est pour retourner à Theramore. Tervosh, dame Jaina et les officiers sont dans la tour et {object:21057}.",
	-- {npc:4967} Archmage Tervosh
	["{npc:4967}, upstairs"] = "{npc:4967}, à l'étage",
	-- {npc:4968} Lady Jaina Proudmoore
	["{npc:4968}, on the top floor"] = "{npc:4968}, au dernier étage",
	["On the top floor"] = "Au dernier étage",
	-- {npc:4948} Adjutant Tesoran
	["{npc:4948}, on the top floor"] = "{npc:4948}, au dernier étage",

	-- Step 14: Mirefin murlocs
	["Mirefin murlocs"] = "Murlocs Aileron boueux",
	["The Mirefin murlocs crowd the north coast past Swamplight Manor; finish the tongues on the tortoises beside them."] = "Les murlocs Aileron boueux encombrent la côte nord au-delà du Manoir des Flammeroles ; terminez les langues sur les tortues à côté d'eux.",

	-- Step 15: Swamplight Manor
	-- {item:3853} Moonsteel Broadsword
	["only if you carry a {item:3853} (a blacksmith's craft)"] = "seulement si vous avez une {item:3853} (fabriquée par un forgeron)",

	-- Step 17: Balos Jacken
	-- {npc:4503} Mudcrush Durtfeet
	["The deserters camp south of the road, west of {npc:4503}'s hut."] = "Les déserteurs campent au sud de la route, à l'ouest de la hutte de {npc:4503}.",

	-- Step 19: The Affray
	-- {npc:6236} Klannoc Macleod · {npc:6238} Big Will
	["On the ride north to Ratchet, Fray Island lies off the Merchant Coast south of the town: wade over the sand bar shallows. {npc:6236} sends four challengers and then {npc:6238} (level 33) at you, one at a time."] = "Sur la route vers le nord jusqu'à Cabestan, l'île de la Dispute se trouve au large de la Côte des marchands, au sud de la ville : traversez les bas-fonds du banc de sable. {npc:6236} envoie quatre adversaires puis {npc:6238} (niveau 33) contre vous, un à la fois.",
	-- {npc:6238} Big Will
	["Defeat the challengers and {npc:6238}"] = "Vainquez les adversaires et {npc:6238}",
	-- {npc:6236} Klannoc Macleod
	["{npc:6236}: Berserker Stance"] = "{npc:6236} : Posture berserker",
	-- {npc:6236} Klannoc Macleod
	["{npc:6236} offers The Windwatcher next (1791): the Whirlwind weapon chain, with an elite at the end, is in the Warrior class guide Whirlwind Weapon."] = "{npc:6236} propose ensuite La Vigie des vents (1791) : la suite de l'arme Tourbillon, avec un élite à la fin, se trouve dans le guide de classe Guerrier Arme Tourbillon.",

	-- Step 21: Boat to Menethil Harbor
	-- {object:1162} Menethil Harbor
	["Boat to {object:1162}"] = "Bateau pour {object:1162}",

	-- Step 22: Fly to Stormwind
	-- {zone:1453} Stormwind
	["Fly to {zone:1453}"] = "Volez jusqu'à {zone:1453}",
	-- {object:1162} Menethil Harbor
	["{object:1162} flight master"] = "Maître de vol de {object:1162}",

	-- Step 24: Riding at 40
	["Riding at 40"] = "Monte au niveau 40",
	-- {npc:4732} Randal Hunter · {object:95} Eastvale Logging Camp · {zone:1429} Elwynn Forest · {npc:384} Katie Hunter
	["At 40 with 100 gold you can learn to ride, and learning it gives you a mount. {npc:4732} teaches Humans at {object:95} in eastern {zone:1429}, beside {npc:384}'s horses. Forever may let any race learn from any riding trainer (unconfirmed). Collectibles, Mounts · Level 40 lists every colour."] = "Au niveau 40 avec 100 or, vous pouvez apprendre à monter, et l'apprentissage vous donne une monture. {npc:4732} enseigne aux humains à {object:95} à l'est de {zone:1429}, près des chevaux de {npc:384}. Forever pourrait permettre à n'importe quelle race d'apprendre auprès de n'importe quel maître de monte (non confirmé). Collectibles, Montures · Niveau 40 liste toutes les couleurs.",
	-- {npc:384} Katie Hunter
	["{npc:384}: other colours, 20g"] = "{npc:384} : autres couleurs, 20 po",

	-- Step 25: Riding at 40
	-- {npc:265756} Genn Fairweather
	["At 40 with 100 gold you can learn to ride, and learning it gives you a mount. Skyborne learn it from {npc:265756}, the stablemaster and riding trainer at the Fairweather Stables in Valanaar on Zephras Isle, who also sells the Galestriders: the skyboat to the isle leaves the north side of Dalaran about every five minutes. Collectibles, Mounts · Level 40 lists the Galestriders."] = "Au niveau 40 avec 100 or, vous pouvez apprendre à monter, et l'apprentissage vous donne une monture. Les Skyborne l'apprennent auprès de {npc:265756}, le maître des écuries et maître de monte aux Écuries Beautemps à Valanaar sur l'Île de Zéphras, qui vend aussi les trotteurs des trombes : le bateau céleste pour l'île part du côté nord de Dalaran environ toutes les cinq minutes. Collectibles, Montures · Niveau 40 liste les trotteurs des trombes.",
	-- {npc:265756} Genn Fairweather
	["Riding and Galestriders: {npc:265756}, at the Fairweather Stables in Valanaar on Zephras Isle."] = "Monte et trotteurs des trombes : {npc:265756}, aux Écuries Beautemps à Valanaar sur l'Île de Zéphras.",
	["Skyboat to Zephras Isle: the north side of Dalaran, about every five minutes."] = "Bateau céleste pour l'île de Zephras : le côté nord de Dalaran, environ toutes les cinq minutes.",

	-- Step 26: Boat to Booty Bay
	-- {object:3204} Booty Bay
	["Boat to {object:3204}"] = "Bateau pour {object:3204}",

	-- Step 46: Fly to Darkshire
	["Fly to Darkshire"] = "Envolez-vous pour Sombre-Comté.",
	-- {object:3204} Booty Bay
	["{object:3204} flight master"] = "Maître de vol de {object:3204}",

	-- Step 48: Fly to Booty Bay
	-- {object:3204} Booty Bay
	["Fly to {object:3204}"] = "Envolez-vous pour {object:3204}",
	["Darkshire flight master"] = "Maître de vol de Sombre-Comté",

	-- Step 49: Booty Bay
	-- {npc:773} Krazek
	["{npc:773}, upstairs"] = "{npc:773}, à l'étage",
	-- {npc:770} Corporal Kaleb
	["for {npc:770} at the Rebel Camp, on the northern loop"] = "pour {npc:770} au camp rebelle, sur la boucle nord",
	-- {npc:773} Krazek · {quest:2864} Tran'rek · {zone:1446} Tanaris
	["{npc:773}: for {quest:2864} in {zone:1446}, keep it"] = "{npc:773} : pour {quest:2864} en {zone:1446}, gardez-la",
	-- {npc:2487} Fleet Master Seahorn
	["{npc:2487}, top floor"] = "{npc:2487}, dernier étage",
	["Inside"] = "À l'intérieur",
	["Seahorn's next errand goes back to Arathi: skip it."] = "La course suivante de Seahorn ramène en Arathi : passez-la.",
	-- {npc:2542} Catelyn the Blade
	["{npc:2542}, upstairs"] = "{npc:2542}, à l'étage",
	-- {zone:1446} Tanaris
	["for Stoley in {zone:1446}: keep it; on the top floor"] = "pour Stoley à {zone:1446} : gardez-le ; au dernier étage",

	-- Step 50: Bloodsail camp
	["Bloodsail camp"] = "Camp de la Voile sanglante",
	["Leave town by the tunnel and follow the coast north; the letter lies in the Bloodsail camp on the beach, where \"Pretty Boy\" Duncan walks."] = "Quittez la ville par le tunnel et suivez la côte vers le nord ; la lettre se trouve dans le camp de la Voile sanglante sur la plage, où se promène Duncan \"le Beau garçon\".",

	-- Step 51: Booty Bay
	-- {npc:2488} Deeg
	["{npc:2488}, on the top floor"] = "{npc:2488}, au dernier étage",
	-- {npc:2624} Gazban
	["{npc:2624} swims off the north-west coast, on the northern loop"] = "{npc:2624} nage au large de la côte nord-ouest, lors de la boucle nord",

	-- Step 52: Wild Shore: kill these as you meet them
	["Wild Shore: kill these as you meet them"] = "Le Rivage cruel : tuez-les au fur et à mesure",
	-- {item:3910} Snuff · {npc:2493} Dizzy One-Eye · {object:3204} Booty Bay
	["Every Bloodsail drops {item:3910} and one of them carries {npc:2493}'s eye; the Swashbucklers walk the shore just north of town. The charts and orders lie in the pirate camp on the Wild Shore, south of {object:3204}."] = "Chaque pirate de la Voile sanglante laisse tomber {item:3910} et l'un d'eux porte l'œil de {npc:2493} ; les bretteurs arpentent le rivage juste au nord de la ville. Les cartes et les ordres se trouvent dans le camp de pirates du Rivage cruel, au sud de {object:3204}.",

	-- Step 53: Mistvale Giblets on the way
	-- {item:3919} Mistvale Giblets
	["{item:3919} on the way"] = "{item:3919} en chemin",

	-- Step 55: Gorilla hills
	["Gorilla hills"] = "Collines des gorilles",
	-- {npc:1449} Witch Doctor Unbagwa
	-- plural, as words: Elder Mistvale Gorillas = {npc:1557} Elder Mistvale Gorilla
	["Ride inland to the Mistvale gorilla hills. Elder Mistvale Gorillas drop the giblets; {npc:1449} sits among them."] = "Chevauchez vers l'intérieur jusqu'aux collines des gorilles de Valbrume. Les Anciens gorilles de Valbrume laissent tomber les abats ; {npc:1449} est assis parmi eux.",
	-- {npc:1449} Witch Doctor Unbagwa
	["{npc:1449}, inside Spirit Den"] = "{npc:1449}, à l'intérieur de l'Antre des esprits",

	-- Step 56: Unbagwa's ritual
	["Unbagwa's ritual"] = "Le rituel d'Unbagwa",
	-- {npc:1514} Mokk the Savage
	["Hand in the fangs and stay: three waves of gorillas come, {npc:1514} last. Fight at full health."] = "Rendez les crocs et restez : trois vagues de gorilles arrivent, {npc:1514} en dernier. Combattez avec toute votre vie.",

	-- Step 58: Naga Explorers
	-- plural, as words: Naga Explorers = {npc:1907} Naga Explorer
	["Naga Explorers"] = "Explorateurs nagas",
	["The naga comb the beaches north of the Bloodsail camp; they drop the reeds."] = "Les nagas fouillent les plages au nord du camp de la Voile sanglante ; ils laissent tomber les roseaux.",

	-- Step 59: Booty Bay
	["Ride back down to town; Shaky stands at the tunnel mouth."] = "Redescendez en ville ; Phillippe le Chancelant se tient à l'entrée du tunnel.",
	-- {npc:2616} Privateer Groy
	["for {npc:2616} in Theramore: keep it"] = "pour {npc:2616} à Theramore : gardez-la",
	["\"Sea Wolf\" MacKinley, on the top floor"] = "« Loup de mer » MacKinley, au dernier étage",

	-- Step 60: The Bloodsail captains
	["The Bloodsail captains"] = "Les capitaines de la Voile sanglante",
	-- {npc:2546} Fleet Master Firallon
	["The captains stand on the ships anchored off the Wild Shore, each with a crew of 42-45 pirates: Stillwater (45) and Keelhaul (46) on the nearer decks, {npc:2546} (48) on the flagship. At 42 this is a fight for a group or for the end of the guide; clear each deck first if you go. Cortello's scroll lies on the wreck by the shore."] = "Les capitaines se tiennent sur les navires ancrés au large du Rivage cruel, chacun avec un équipage de pirates de niveau 42-45 : Stillwater (45) et Keelhaul (46) sur les ponts les plus proches, {npc:2546} (48) sur le vaisseau amiral. Au niveau 42, c'est un combat pour un groupe ou pour la fin du guide ; nettoyez chaque pont d'abord si vous y allez. Le parchemin de Cortello gît sur l'épave près du rivage.",
	-- {zone:1435} Swamp of Sorrows
	["for the {zone:1435} later"] = "pour {zone:1435} plus tard",

	-- Step 61: Zanzil's village
	["Zanzil's village"] = "Le village de Zanzil",
	-- {npc:2537} Chucky "Ten Thumbs"
	["Every Zanzil follower can drop the mixture; {npc:2537} walks the south of the camp."] = "Tout disciple de Zanzil peut laisser tomber le mélange ; {npc:2537} arpente le sud du camp.",

	-- Step 62: Maury "Club Foot" Wilkins and Jon-Jon the Crow
	-- {npc:2535} Maury "Club Foot" Wilkins · {npc:2536} Jon-Jon the Crow
	["{npc:2535} and {npc:2536}"] = "{npc:2535} et {npc:2536}",
	-- {npc:2535} Maury "Club Foot" Wilkins · {npc:2536} Jon-Jon the Crow
	["Ride north to the hills west of the road. {npc:2535} and {npc:2536} stand together just north of Zanzil's village."] = "Chevauchez vers le nord jusqu'aux collines à l'ouest de la route. {npc:2535} et {npc:2536} se tiennent ensemble juste au nord du village de Zanzil.",

	-- Step 63: Cold Eye Basilisks
	-- plural, as words: Cold Eye Basilisks = {npc:690} Cold Eye Basilisk
	["Cold Eye Basilisks"] = "Basilics Oeil-de-glace",
	-- plural, as words: Cold Eye Basilisks = {npc:690} Cold Eye Basilisk
	["The Cold Eye Basilisks lie on the rocks west of the mine."] = "Les Basilics Oeil-de-glace se tiennent sur les rochers à l'ouest de la mine.",

	-- Step 64: The north-west coast
	["The north-west coast"] = "La côte nord-ouest",
	-- {npc:2624} Gazban · {item:4034} Stone of the Tides
	-- plural, as words: Giant Clams = {object:2744} Giant Clam
	["Ride north-west from the mine to the bay on the north-west coast. The Giant Clams lie on its floor and hold the pearls; {npc:2624} swims among them and drops the {item:4034}."] = "Chevauchez vers le nord-ouest depuis la mine jusqu'à la baie de la côte nord-ouest. Les Palourdes géantes reposent au fond et contiennent les perles ; {npc:2624} nage parmi elles et laisse tomber la {item:4034}.",
	-- {item:4611} Blue Pearl
	["{item:4611}; underwater"] = "{item:4611} ; sous l'eau",

	-- Step 65: Rebel Camp
	["Rebel Camp"] = "Camp rebelle",
	-- {npc:217588} Arbor Tarantula
	["Ride north-east past Nesingwary's camp and follow the road north to the camp at the top of the vale. On the way, an {npc:217588} crawls in the jungle south-east of Nesingwary's camp: catch one with the Entomology Starter Kit, then tick it off."] = "Chevauchez vers le nord-est après le camp de Nesingwary et suivez la route vers le nord jusqu'au camp en haut de la vallée. En chemin, une {npc:217588} rampe dans la jungle au sud-est du camp de Nesingwary : attrapez-en une avec le Kit d’entomologiste novice, puis cochez-la.",
	-- {npc:217588} Arbor Tarantula · {quest:93176} My Little Friends
	["{npc:217588}: catch it, for {quest:93176}"] = "{npc:217588} : attrapez-la, pour {quest:93176}",

	-- Step 67: Panther Mastery
	-- {npc:728} Bhag'thera
	["These are elite mobs: grouping up is encouraged, look for people to do it with. {npc:728} is a level 40 elite: most classes solo it at level 42, but you may need help. Skip it if you are alone: the route has you grind the XP back."] = "Ce sont des monstres élites : il est conseillé de se grouper, cherchez des joueurs avec qui le faire. {npc:728} est un élite de niveau 40 : la plupart des classes le battent seules au niveau 42, mais vous aurez peut-être besoin d'aide. Passez-le si vous êtes seul : l'itinéraire vous fait regagner l'expérience en tuant des monstres.",

	-- Step 68: Ruins of Zul'Mamwe: kill these as you meet them
	["Ruins of Zul'Mamwe: kill these as you meet them"] = "Ruines de Zul'Mamwe : tuez-les au fur et à mesure",
	-- plural, as words: Shadowmaw Panthers = {npc:684} Shadowmaw Panther
	["The Skullsplitter trolls hold the ruins just east of the mine; any of them can drop tusks, their panthers always do.\nFollow the road north-east to the Venture Co. camp at the Crystalvein Mine; the miners, surveyors and foremen drop the crystals.\nCareful: Stealthed Shadowmaw Panthers and Stranglethorn Tigresses roam the area around the camp."] = "Les trolls Skullsplitter occupent les ruines juste à l'est de la mine ; n'importe lequel peut laisser tomber des défenses, leurs panthères le font toujours.\nSuivez la route au nord-est jusqu'au camp de la KapitalRisk à la Mine aux cristaux ; les mineurs, géomètres et contremaîtres laissent tomber les cristaux.\nAttention : des panthères Ombregueule camouflées et des tigresses de Strangleronce rôdent dans la zone autour du camp.",

	-- Step 69: Booty Bay
	-- {npc:2498} Crank Fizzlebub · {zone:1441} Thousand Needles
	["{npc:2498}'s next Zanzil errand starts in {zone:1441}: skip it."] = "La course suivante de {npc:2498} concernant Zanzil commence à {zone:1441} : passez-la.",
	-- {npc:737} Kebok
	["{npc:737}, upstairs"] = "{npc:737}, à l'étage",
	["MacKinley's next task sends you after elite ogres: skip it."] = "La tâche suivante de MacKinley vous envoie contre des ogres élites : passez-la.",

	-- Step 74: Level 42.23
	["Level 42.23"] = "Niveau 42.23",
	-- {quest:193} Panther Mastery
	["If you skipped {quest:193}, grind here to level 42.23 to stay on the route's plan."] = "Si vous avez passé {quest:193}, tuez des monstres ici jusqu'au niveau 42.23 pour suivre le plan de l'itinéraire.",
	-- {npc:690} Cold Eye Basilisk
	["grind on {npc:690}"] = "tuez en boucle : {npc:690}",

	-- Step 75: Raptor Mastery
	-- {npc:730} Tethis
	["These are elite mobs: grouping up is encouraged, look for people to do it with. {npc:730} is a level 43 elite: most classes solo it at level 45, but you may need help. Skip it if you are alone: the route has you grind the XP back."] = "Ce sont des monstres élites : il est conseillé de se grouper, cherchez des joueurs avec qui le faire. {npc:730} est un élite de niveau 43 : la plupart des classes le battent seules au niveau 45, mais vous aurez peut-être besoin d'aide. Passez-le si vous êtes seul : l'itinéraire vous fait regagner l'expérience en tuant des monstres.",

	-- Step 78: Level 42.27
	["Level 42.27"] = "Niveau 42.27",
	-- {quest:196} Raptor Mastery
	["If you skipped {quest:196}, grind here to level 42.27 to stay on the route's plan."] = "Si vous avez passé {quest:196}, tuez des monstres ici jusqu'au niveau 42.27 pour suivre le plan de l'itinéraire.",

	-- Step 79: Big Game Hunter
	-- {npc:731} King Bangalash
	["These are elite mobs: grouping up is encouraged, look for people to do it with. {npc:731} is a level 43 elite: most classes solo it at level 45, but you may need help. Skip it if you are alone: the route has you grind the XP back.\nCareful: Tigers and stealthed shadowmaw panthers roam close to him. Clear them before you pull him. When he is pulled, {npc:731} calls for help from creatures within 20 yd."] = "Ce sont des monstres élites : il est conseillé de se grouper, cherchez des joueurs avec qui le faire. {npc:731} est un élite de niveau 43 : la plupart des classes le battent seules au niveau 45, mais vous aurez peut-être besoin d'aide. Passez-le si vous êtes seul : l'itinéraire vous fait regagner l'expérience en tuant des monstres.\nAttention : des tigres et des panthères Ombregueule camouflées rôdent près de lui. Éliminez-les avant de l'attirer. Quand vous l'attirez, {npc:731} appelle à l'aide les créatures dans un rayon de 20 m.",

	-- Step 81: Level 42.33
	["Level 42.33"] = "Niveau 42.33",
	-- {quest:208} Big Game Hunter
	["If you skipped {quest:208}, grind here to level 42.33 to stay on the route's plan."] = "Si vous avez passé {quest:208}, tuez des monstres ici jusqu'au niveau 42.33 pour suivre le plan de l'itinéraire.",

	-- Step 82: Fly to Stormwind
	-- {object:81} Sentinel Hill
	["{object:81} flight master"] = "{object:81} maître de vol",

	-- Step 83: Stormwind
	-- {npc:1141} Angus Stern · {object:2169} Blue Recluse · {npc:5384} Brohann Caskbelly · {object:28027} Dwarven District
	["{npc:1141} cooks in the {object:2169}; {npc:5384} is in the {object:28027}."] = "{npc:1141} cuisine au {object:2169} ; {npc:5384} est dans {object:28027}.",
	-- {npc:5694} High Sorcerer Andromath
	["{npc:5694}: for Nethergarde Keep, keep it"] = "{npc:5694} : pour Rempart-du-Néant, gardez-le",

	-- Step 84: Stormwind
	-- {npc:1440} Milton Sheaf · {object:2117} Stormwind Keep
	["{npc:1440}, the Royal Library in {object:2117}"] = "{npc:1440}, la bibliothèque royale de {object:2117}",

	-- Step 86: Paladin: The Tome of Nobility
	-- {quest:1661} The Tome of Nobility
	["Paladin: {quest:1661}"] = "Paladin : {quest:1661}",
	-- {npc:6171} Duthorian Rall
	["{npc:6171}, in the Cathedral of Light"] = "{npc:6171}, dans la cathédrale de la Lumière",

	-- Step 87: Stormwind City
	["Stormwind City"] = "Cité de Hurlevent",

	-- Step 88: Warlock: Summon Felsteed
	-- {quest:3631} Summon Felsteed
	["Warlock: {quest:3631}"] = "Démoniste : {quest:3631}",
	-- {npc:461} Demisette Cloyce · {object:2164} Slaughtered Lamb · {npc:6251} Strahad Farsan
	["{npc:461}, in the {object:2164}: {npc:6251} in Ratchet takes it at the end of the next guide"] = "{npc:461}, dans {object:2164} : {npc:6251} à Cabestan le prend à la fin du guide suivant",

	-- Step 89: Fly to Darkshire
	-- {zone:1453} Stormwind
	["{zone:1453} flight master"] = "Maître de vol de {zone:1453}",

	-- Step 91: Misty Valley
	["Misty Valley"] = "Vallée des brumes",
	["The scroll lies in the marsh north of Biggs. The Swampwalkers north of it can drop Khadgar's essays."] = "Le parchemin se trouve dans le marais au nord de Biggs. Les Maraistreurs au nord peuvent laisser tomber les essais de Khadgar.",
	["The riddle's next scroll lies in western Dustwallow: skip it."] = "Le parchemin suivant de l'énigme se trouve dans l'ouest d'Âprefange : passez-le.",

	-- Step 93: Level 42.46
	["Level 42.46"] = "Niveau 42.46",
	-- {quest:543} The Perenolde Tiara
	["If you skipped {quest:543}, grind here to level 42.46 to stay on the route's plan."] = "Si vous avez passé {quest:543}, tuez des monstres ici jusqu'au niveau 42.46 pour suivre le plan de l'itinéraire.",
	-- {npc:766} Tangled Horror
	["grind on {npc:766}"] = "tuez en boucle : {npc:766}",

	-- Step 94: Cortello's Riddle
	-- {npc:217412} Amaryllis Webb · {quest:93176} My Little Friends
	["{npc:217412}: {quest:93176}, from 30-40/05-arathi-highlands"] = "{npc:217412} : {quest:93176}, depuis 30-40/05-arathi-highlands",

	-- Step 95: Watcher Biggs
	-- {npc:5476} Watcher Biggs
	["{npc:5476} stands by the road junction in the west of the swamp."] = "{npc:5476} se tient près du carrefour à l'ouest du marais.",

	-- Step 96: Into Deadwind Pass
	-- {zone:1430} Deadwind Pass
	["Into {zone:1430}"] = "Vers le {zone:1430}",

	-- Step 97: Into Duskwood
	-- {zone:1431} Duskwood
	["Into {zone:1431}"] = "Vers {zone:1431}",

	-- Step 98: Into Stormwind
	-- {zone:1453} Stormwind
	["Into {zone:1453}"] = "Vers {zone:1453}",

	-- Step 101: Fly to Rut'theran Village
	["Fly to Rut'theran Village"] = "Envolez-vous vers le village de Rut'theran",
	["Auberdine flight master"] = "Maître de vol d'Auberdine",

	-- Step 103: Riding at 40
	-- {npc:4753} Jartsam · {zone:1457} Darnassus · {npc:4730} Lelanai · {npc:4732} Randal Hunter · {object:95} Eastvale Logging Camp · {zone:1429} Elwynn Forest
	["At 40 with 100 gold you can learn to ride, and learning it gives you a mount. {npc:4753} teaches Night Elves in {zone:1457}, beside {npc:4730}'s sabers: the boat from Stormwind Harbor to Auberdine, then the flight to Rut'theran Village. Forever may let any race learn from any riding trainer (unconfirmed), such as {npc:4732} at {object:95} in {zone:1429}. Collectibles, Mounts · Level 40 lists every colour."] = "Au niveau 40 avec 100 or, vous pouvez apprendre à monter, et l'apprentissage vous donne une monture. {npc:4753} enseigne aux elfes de la nuit à {zone:1457}, près des sabres de {npc:4730} : le bateau du port de Hurlevent à Auberdine, puis le vol vers le village de Rut'theran. Forever pourrait permettre à n'importe quelle race d'apprendre auprès de n'importe quel maître de monte (non confirmé), comme {npc:4732} à {object:95} dans {zone:1429}. Collectibles, Montures · Niveau 40 liste toutes les couleurs.",
	-- {npc:4730} Lelanai
	["{npc:4730}: other colours, 20g"] = "{npc:4730} : autres couleurs, 20 po",

	-- Step 105: Fly to Auberdine
	["Fly to Auberdine"] = "Envolez-vous pour Auberdine",
	["Rut'theran Village flight master"] = "Maître de vol du village de Rut'theran",

	-- Step 106: Boat to Stormwind Harbor
	["Boat to Stormwind Harbor"] = "Bateau pour le port de Hurlevent",

	-- Step 107: Into Elwynn Forest
	-- {zone:1429} Elwynn Forest
	["Into {zone:1429}"] = "Vers {zone:1429}",

	-- Step 109: Into Swamp of Sorrows
	-- {zone:1435} Swamp of Sorrows
	["Into {zone:1435}"] = "Vers {zone:1435}",

	-- Step 111: The sunken temple
	["The sunken temple"] = "Le temple englouti",
	-- plural, as words: Tangled Horrors = {npc:766} Tangled Horror
	["Ride east; the Tangled Horrors along the way also drop the essays. Search the edge of the Pool of Tears, where the temple's ruins break the water."] = "Allez vers l'est ; les horreurs enchevêtrées sur le chemin laissent aussi tomber les essais. Fouillez le bord du Bassin des larmes, où les ruines du temple émergent de l'eau.",

	-- Step 112: Misty Reed Strand
	["Misty Reed Strand"] = "Grève de Brumejonc",
	["The driftwood washes up along the eastern shore."] = "Le bois flotté s'échoue le long de la rive est.",

	-- Step 113: Watcher Biggs
	["for Nethergarde Keep: keep it"] = "pour Rempart-du-Néant : gardez-le",

	-- Step 116: Stormwind
	-- {npc:5635} Falstad Wildhammer
	["for {npc:5635} at Aerie Peak: keep it"] = "pour {npc:5635} au nid-de-l'Aigle : gardez-le",

	-- Step 117: Tram to Ironforge
	-- {zone:1455} Ironforge
	["Tram to {zone:1455}"] = "Tram pour {zone:1455}",

	-- Step 120: Ironforge
	-- {object:28027} Dwarven District · {npc:5637} Roetten Stonehammer · {object:32356} Hall of Explorers · {npc:1356} Prospector Stormpike · {npc:2786} Gerrig Bonegrip · {object:32383} Forlorn Cavern
	["Take the Deeprun Tram from the {object:28027}. {npc:5637} is in the Reclaimers' hall by the {object:32356}, {npc:1356} in the hall itself, {npc:2786} in the {object:32383}. The next guide flies on to Thelsamar."] = "Prenez le tram des profondeurs depuis {object:28027}. {npc:5637} se trouve dans la salle des Récupérateurs près de {object:32356}, {npc:1356} dans la salle elle-même, {npc:2786} dans {object:32383}. Le guide suivant vole vers Thelsamar.",
	-- {zone:1453} Stormwind
	["{zone:1453} has no shaman trainer"] = "{zone:1453} n'a pas de maître des chamans",

	-- Step 121: Scarlet Monastery (dungeon, optional): Librarian Mae Paledust
	-- {npc:3979} Librarian Mae Paledust
	["Scarlet Monastery (dungeon, optional): {npc:3979}"] = "Monastère écarlate (donjon, optionnel) : {npc:3979}",
	-- {zone:1420} Tirisfal Glades · {object:32356} Hall of Explorers
	["The Scarlet Monastery: four wings in {zone:1420}, for a group of 5 at 38 to 44: the Library, the Armory and the Cathedral hold the quests. Group 19 sends you there from Southshore, after Raleigh. Alone? Skip it. Mae Paledust stands in the {object:32356}, by the bookshelves."] = "Le Monastère écarlate : quatre ailes dans {zone:1420}, pour un groupe de 5 niveau 38 à 44 : la Bibliothèque, l'Armurerie et la Cathédrale contiennent les quêtes. Le groupe 19 vous y envoie depuis Austrivage, après Raleigh. Seul ? Passez. Mae Paledust se tient dans l'{object:32356}, près des étagères.",
	-- {npc:3979} Librarian Mae Paledust
	["{npc:3979}: the book is in the Library wing"] = "{npc:3979} : le livre se trouve dans l'aile Bibliothèque",

	-- Step 122: Uldaman (dungeon, optional): Hall of Explorers
	-- {object:32356} Hall of Explorers
	["Uldaman (dungeon, optional): {object:32356}"] = "Uldaman (donjon, optionnel) : {object:32356}",
	-- {zone:1418} Badlands · {object:32356} Hall of Explorers
	["Uldaman: a dwarf and titan dungeon in the north of the {zone:1418}, for a group of 5, levels 42 to 52 on Forever: best at 43 or more. The next guide runs it once its {zone:1418} quests are done. Alone? Skip it. Both stand in the {object:32356}."] = "Uldaman : un donjon nain et titan au nord des {zone:1418}, pour un groupe de 5, niveaux 42 à 52 sur Forever : optimal à 43 ou plus. Le guide suivant le fait une fois ses quêtes des {zone:1418} finies. Seul ? Passez. Tous deux se tiennent dans l'{object:32356}.",

	-- Step 123: Fly to Thelsamar
	["Fly to Thelsamar"] = "Volez vers Thelsamar",
	-- {zone:1455} Ironforge
	["{zone:1455} flight master"] = "Maître de vol de {zone:1455}",

	-- Step 125: Hammertoe's Digsite
	["Hammertoe's Digsite"] = "Site de fouilles d'Hammertoe",

	-- Step 126: Hammertoe's Digsite
	-- {zone:1432} Loch Modan · {zone:1418} Badlands · {npc:2860} Sigrun Ironhew
	["Ride south out of {zone:1432} through the pass into the {zone:1418}; {npc:2860} camps at the dig."] = "Allez vers le sud depuis {zone:1432} par le col jusqu'à {zone:1418} ; {npc:2860} campe sur le site de fouilles.",

	-- Step 127: Garek
	-- {npc:2888} Garek
	["{npc:2888} camps by himself in Dustwind Gulch, south-east of the digsite."] = "{npc:2888} campe seul dans le Goulet de la Bourrasque, au sud-est du site de fouilles.",

	-- Step 129: Riding at 40
	-- {npc:4772} Ultham Ironhorn · {zone:1432} Loch Modan · {npc:1261} Veron Amberstill
	["At 40 with 100 gold you can learn to ride, and learning it gives you a mount. {npc:4772} teaches Dwarves at Amberstill Ranch, east of Kharanos on the road to {zone:1432}, beside {npc:1261}'s rams. Forever may let any race learn from any riding trainer (unconfirmed). Collectibles, Mounts · Level 40 lists every colour."] = "Au niveau 40 avec 100 or, vous pouvez apprendre à monter, et l'apprentissage vous donne une monture. {npc:4772} enseigne aux nains à la Ferme des Amberstill, à l'est de Kharanos sur la route vers {zone:1432}, à côté des béliers de {npc:1261}. Forever pourrait permettre à n'importe quelle race d'apprendre auprès de n'importe quel maître de monte (non confirmé). Collectibles, Montures · Niveau 40 liste toutes les couleurs.",
	-- {npc:1261} Veron Amberstill
	["{npc:1261}: other colours, 20g"] = "{npc:1261} : autres couleurs, 20 po",

	-- Step 130: Fly to Ironforge
	-- {zone:1455} Ironforge
	["Fly to {zone:1455}"] = "Envolez-vous vers {zone:1455}",
	["Thelsamar flight master"] = "Maître de vol de Thelsamar",

	-- Step 131: Riding at 40
	-- {npc:7954} Binjy Featherwhistle · {npc:7955} Milli Featherwhistle
	["At 40 with 100 gold you can learn to ride, and learning it gives you a mount. {npc:7954} teaches Gnomes at Steelgrill's Depot, just east of Kharanos, beside {npc:7955}'s mechanostriders. Forever may let any race learn from any riding trainer (unconfirmed). Collectibles, Mounts · Level 40 lists every colour."] = "Au niveau 40 avec 100 or, vous pouvez apprendre à monter, et l'apprentissage vous donne une monture. {npc:7954} enseigne aux gnomes au dépôt de Steelgrill, juste à l'est de Kharanos, à côté des méchanostrucs de {npc:7955}. Forever pourrait permettre à n'importe quelle race d'apprendre auprès de n'importe quel maître de monte (non confirmé). Collectibles, Montures · Niveau 40 liste toutes les couleurs.",
	-- {npc:7955} Milli Featherwhistle
	["{npc:7955}: other colours, 20g"] = "{npc:7955} : autres couleurs, 20 po",

	-- No longer in the guide (its English changed or it went away): reuse or delete.
	-- ["Uldaman: a dwarf and titan dungeon in the north of the {zone:1418}, for a group of 5, levels 42 to 52 on Forever: best at 43 or more. The next chapter runs it from the {zone:1418}. Alone? Skip it. Both stand in the {object:32356}."] = "Uldaman : un donjon nain et titan au nord des {zone:1418}, pour un groupe de 5, niveaux 42 à 52 sur Forever : optimal à 43 ou plus. Le chapitre suivant le fait depuis les {zone:1418}. Seul ? Passez. Tous deux se tiennent dans l'{object:32356}.",
}
