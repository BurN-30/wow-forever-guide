-- French (frFR): the guide groupe-alliance/26-un-goro (guides/26-un-goro.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1449} Un'Goro Crater
	["Group 24 · {zone:1449}"] = "Groupe 24 · {zone:1449}",

	-- Step 1: Fly to Menethil Harbor
	-- {object:1162} Menethil Harbor
	["Fly to {object:1162}"] = "Envolez-vous vers {object:1162}",
	["Everyone at their own pace: what you already did ticks itself, the guide picks up where you are. Playing together? Group XP is best within 4 levels."] = "Chacun à son rythme : ce qui est déjà fait se coche tout seul, le guide reprend où vous en êtes. En groupe ? L'XP de groupe est meilleure à 4 niveaux d'écart ou moins.",
	-- {zone:1455} Ironforge
	["{zone:1455} flight master"] = "Maître de vol de {zone:1455}",

	-- Step 3: Fly to Gadgetzan
	["Fly to Gadgetzan"] = "Envolez-vous pour Gadgetzan",
	["Theramore flight master"] = "Maître de vol de Theramore",

	-- Step 5: Gadgetzan
	["Gadgetzan"] = "Gadgetzan",
	["The flight from Theramore lands in Gadgetzan."] = "Le vol depuis Theramore atterrit à Gadgetzan.",

	-- Step 7: Zul'Farrak, second run (optional)
	["Zul'Farrak, second run (optional)"] = "Zul'Farrak, second passage (facultatif)",
	["The second Zul'Farrak run: ride north-west from Gadgetzan to the walled city, as in Group 21. About an hour with a group of 5; the trolls are below you now."] = "Le second passage à Zul'Farrak : partir au nord-ouest de Gadgetzan vers la cité fortifiée, comme au Groupe 21. Environ une heure à 5 ; les trolls sont maintenant sous votre niveau.",
	-- {quest:2770} Gahz'rilla · {npc:4453} Wizzle Brassbolts · {quest:2991} Nekrum's Medallion · {npc:8022} Thadius Grimshade · {item:9240} Mallet of Zul'Farrak
	["In the quest log before going in: {quest:2770} ({npc:4453}, Group 21) and {quest:2991} ({npc:8022}, Group 22: each player takes their own). In the bags of one player: the {item:9240} (start of Group 22). Without the mallet, {quest:2770} cannot be called: Nekrum alone is still worth the trip."] = "Dans le journal avant d'entrer : {quest:2770} ({npc:4453}, Groupe 21) et {quest:2991} ({npc:8022}, Groupe 22 : chacun la sienne). Dans les sacs d'un joueur : le {item:9240} (début du Groupe 22). Sans le marteau, {quest:2770} ne peut pas être appelé : Nekrum seul vaut encore le détour.",
	["Zul'Farrak"] = "Zul'Farrak",

	-- Step 8: Zul'Farrak: Nekrum Gutchewer
	-- {npc:7796} Nekrum Gutchewer
	["Zul'Farrak: {npc:7796}"] = "Zul'Farrak : {npc:7796}",
	-- {npc:7604} Sergeant Bly · {npc:7796} Nekrum Gutchewer · {npc:7275} Shadowpriest Sezz'ziz
	["Free {npc:7604}'s crew at the top of the pyramid stairs and hold the stairs: {npc:7796} and {npc:7275} come with the last wave, at the bottom of the stairs. Each player with the quest loots their own medallion."] = "Libérer l'équipe de {npc:7604} en haut des marches de la pyramide et tenir les marches : {npc:7796} et {npc:7275} arrivent avec la dernière vague, au pied des marches. Chaque joueur qui a la quête ramasse son médaillon.",

	-- Step 9: Zul'Farrak: Gahz'rilla
	-- {quest:2770} Gahz'rilla
	["Zul'Farrak: {quest:2770}"] = "Zul'Farrak : {quest:2770}",
	-- {quest:2770} Gahz'rilla · {npc:7795} Hydromancer Velratha · {item:9240} Mallet of Zul'Farrak
	["{quest:2770}'s pool is in {npc:7795}'s courtyard, round the corner from the entrance. The player with the {item:9240} uses it on the gong by the pool; {quest:2770} rises from the water and throws players into the air: fight him in the pool, or under the ruin left of the archway, to soften the falls."] = "Le bassin de {quest:2770} est dans la cour de {npc:7795}, juste après l'angle de l'entrée. Le joueur qui a le {item:9240} l'utilise sur le gong près du bassin ; {quest:2770} sort de l'eau et projette les joueurs en l'air : le combattre dans le bassin, ou sous la ruine à gauche de l'arche, pour amortir les chutes.",
	-- {item:9240} Mallet of Zul'Farrak
	["{item:9240}, at the gong"] = "{item:9240}, au gong",

	-- Step 10: Mirage Raceway: Wizzle Brassbolts
	-- {npc:4453} Wizzle Brassbolts
	["Mirage Raceway: {npc:4453}"] = "Piste des Mirages : {npc:4453}",
	-- {quest:2770} Gahz'rilla · {zone:1446} Tanaris · {object:151976} Shimmering Flats · {zone:1449} Un'Goro Crater
	["{quest:2770}: ride north out of {zone:1446} to the Mirage Raceway on the {object:151976}, about 3 minutes each way from Gadgetzan; the guide then goes on to {zone:1449}."] = "{quest:2770} : sortir de {zone:1446} vers le nord jusqu'à la piste des Mirages, sur les {object:151976}, environ 3 minutes dans chaque sens depuis Gadgetzan ; le guide continue ensuite vers le {zone:1449}.",

	-- Step 11: Gahz'rilla: not done
	-- {quest:2770} Gahz'rilla
	["{quest:2770}: not done"] = "{quest:2770} : pas faite",
	-- {quest:2770} Gahz'rilla · {item:9240} Mallet of Zul'Farrak · {quest:2991} Nekrum's Medallion · {npc:8022} Thadius Grimshade
	["{quest:2770} needs Zul'Farrak and the {item:9240}, and the guide does not come back to them: abandon it. A finished {quest:2991} stays, for {npc:8022} in Group 25."] = "{quest:2770} demande Zul'Farrak et le {item:9240}, et le guide n'y revient pas : l'abandonner. Un {quest:2991} terminé reste, pour {npc:8022} au Groupe 25.",

	-- Step 12: Nekrum's Medallion: not done
	-- {quest:2991} Nekrum's Medallion
	["{quest:2991}: not done"] = "{quest:2991} : pas faite",
	-- {quest:2991} Nekrum's Medallion
	["{quest:2991} needs Zul'Farrak, and the guide does not come back to it: abandon it."] = "{quest:2991} demande Zul'Farrak, et le guide n'y revient pas : l'abandonner.",

	-- Step 14: Torwa Pathfinder
	-- {zone:1449} Un'Goro Crater · {npc:9619} Torwa Pathfinder
	["Ride west out of Gadgetzan to the long ramp down into {zone:1449}. {npc:9619} camps at the foot of the ramp, in the south-east corner of the crater."] = "Sortez de Gadgetzan vers l'ouest jusqu'à la longue rampe descendant dans {zone:1449}. {npc:9619} campe au pied de la rampe, dans le coin sud-est du cratère.",

	-- Step 15: Fresh Threshadon Carcass
	-- {npc:9619} Torwa Pathfinder
	["The dead Threshadon lies by the water north of {npc:9619}."] = "Le battrodon mort se trouve au bord de l'eau au nord de {npc:9619}.",

	-- Step 17: Lar'korwi Mates and the raft
	-- plural, as words: Lar'korwi Mates = {npc:9683} Lar'korwi Mate
	["Lar'korwi Mates and the raft"] = "Compagnes de Lar'korwi et le radeau",
	-- {npc:9619} Torwa Pathfinder · {npc:8737} Linken · {item:11116} A Mangled Journal
	-- plural, as words: Lar'korwi Mates = {npc:9683} Lar'korwi Mate
	["The Lar'korwi Mates prowl the jungle west of {npc:9619}. The wrecked raft lies on the shore of the lake there; the small pack sits in the water beside it. Keep the compass, map and key for {npc:8737}. Any beast in the crater may drop {item:11116}: right-click it."] = "Les compagnes de Lar'korwi rôdent dans la jungle à l'ouest de {npc:9619}. L'épave du radeau gît sur la rive du lac là-bas ; le petit paquet repose dans l'eau à côté. Gardez la boussole, la carte et la clé pour {npc:8737}. Toute bête du cratère peut laisser tomber {item:11116} : faites un clic droit dessus.",

	-- Step 18: Karna Remtravel
	-- {npc:9618} Karna Remtravel
	["{npc:9618} stands just outside the refuge."] = "{npc:9618} se tient juste devant le refuge.",

	-- Step 19: Marshal's Refuge
	["Marshal's Refuge"] = "Refuge des Marshal",
	-- {object:157936} Un'Goro Dirt Pile
	["Ride west back to the refuge.\nGive the elite devilsaurs and stegodons a wide berth. Pick up every Power Crystal and {object:157936} you pass from here on."] = "Retournez vers l'ouest jusqu'au refuge.\nGardez vos distances avec les diablosaures et les stégodons élites. Ramassez désormais chaque Cristal de puissance et chaque {object:157936} que vous croisez.",
	-- {npc:9998} Shizzle
	["{npc:9998}, at the refuge entrance"] = "{npc:9998}, à l'entrée du refuge",
	-- {npc:9117} J.D. Collie
	["{npc:9117}, at the back of the cave; below ground"] = "{npc:9117}, au fond de la grotte ; sous terre",

	-- Step 20: Fire Plume Ridge and the eastern jungle
	["Fire Plume Ridge and the eastern jungle"] = "Crête de la Fournaise et la jungle est",
	-- {item:11113} Crate of Foodstuffs
	-- plural, as words: Bloodpetal Lashers = {npc:6509} Bloodpetal Lasher
	["Ride south to Fire Plume Ridge in the middle of the crater, then east into the eastern jungle. Crystal clusters stand all over the crater, many of them around Fire Plume Ridge: take a few extra of each colour. Bloodpetal Lashers and Threshers drop the petals; the expedition's {item:11113} sits at an abandoned camp in the eastern jungle."] = "Allez au sud jusqu'à la Crête de la Fournaise au centre du cratère, puis à l'est dans la jungle est. Des grappes de cristal parsèment le cratère, beaucoup autour de la Crête de la Fournaise : prenez-en quelques-unes de plus de chaque couleur. Les flagellants et batteurs Pétale-de-sang laissent tomber les pétales ; le {item:11113} de l'expédition se trouve dans un camp abandonné dans la jungle est.",

	-- Step 21: The Marshlands
	["The Marshlands"] = "La Fondrière",
	-- {object:161504} A Small Pack
	["{object:161504}, underwater"] = "{object:161504}, sous l'eau",

	-- Step 22: Lakkari Tar Pits
	["Lakkari Tar Pits"] = "Fosses de goudron de Lakkari",

	-- Step 23: Marshal's Refuge
	-- {npc:9117} J.D. Collie
	["{npc:9117}, below ground"] = "{npc:9117}, sous terre",
	-- {npc:9298} Donova Snowden · {zone:1452} Winterspring
	["Ends with {npc:9298} in {zone:1452}: keep it"] = "Se termine auprès de {npc:9298} au {zone:1452} : gardez-la",
	-- {npc:7775} Gregan Brewspewer · {zone:1444} Feralas
	["For {npc:7775} in {zone:1444}: keep it"] = "Pour {npc:7775} en {zone:1444} : gardez-la",

	-- Step 24: Northern Pylon
	["Northern Pylon"] = "Le Pylône nord",
	-- {npc:9998} Shizzle
	["The pylon stands on the slope east of the refuge. Pterrordax circle the slopes around it: they count for Spraggle and drop {npc:9998}'s scales."] = "Le pylône se dresse sur la pente à l'est du refuge. Des Pterreurdactyles tournoient sur les pentes alentour : ils comptent pour Spraggle et lâchent les écailles de {npc:9998}.",
	-- {item:11834} Super Sticky Tar · {npc:6518} Tar Lurker · {npc:6519} Tar Lord
	["{item:11834} from {npc:6518} and {npc:6519}, 60 yd south"] = "{item:11834} auprès de {npc:6518} et {npc:6519}, 60 yd au sud",

	-- Step 25: A-Me 01
	["Ride north to Ironstone Plateau, where the robot stands among the gorillas. Stay out of the deep cave there."] = "Allez au nord jusqu'au Plateau de Rochefer, où le robot se tient parmi les gorilles. N'entrez pas dans la grotte profonde là-bas.",
	["Below ground"] = "Sous terre",

	-- Step 26: Level 49.51
	["Level 49.51"] = "Niveau 49.51",
	["Top up here to level 49.51 before the hand-ins at Marshal's Refuge: they take you to level 50."] = "Montez ici jusqu'au niveau 49,51 avant de rendre les quêtes au Refuge des Marshal : elles vous feront atteindre le niveau 50.",
	["Pterrordax"] = "Pterreurdactyles",
	["grind on Pterrordax"] = "tuez des Pterreurdactyles en boucle",

	-- Step 27: The Gorishi hive
	["The Gorishi hive"] = "La ruche Gorishi",
	-- {npc:9619} Torwa Pathfinder · {quest:3764} Un'Goro Soil
	-- plural, as words: Gorishi Workers = {npc:6552} Gorishi Worker
	["Ride west from {npc:9619}: the silithid hive fills the south of the crater. Use the Scraping Vial on a hatchery, a chamber with hanging larvae. Gorishi wasps and workers drop {quest:3764}; Pterrordax nest on the southern cliffs if you still need kills.\nCareful: Gorishi silithids are level 51-54 and cast Silithid Pox or Tunneler Acid in melee; Gorishi Workers have a 50% chance to call for help within 25 yd once they fall below 45% health."] = "Allez à l'ouest depuis {npc:9619} : la ruche silithide remplit le sud du cratère. Utilisez la fiole de grattage sur une nurserie, une chambre avec des larves suspendues. Les guêpes et ouvriers Gorishi donnent {quest:3764} ; des pterreurdactyles nichent sur les falaises sud si vous avez encore des monstres à tuer.\nAttention : les silithides Gorishi sont de niveau 51-54 et lancent Variole silithide ou Acide de foreuse au corps à corps ; les ouvriers Gorishi ont 50 % de chances d'appeler à l'aide dans un rayon de 25 m une fois sous 45 % de vie.",
	-- {npc:9167} Frenzied Pterrordax
	["grind on {npc:9167}"] = "tuez en boucle : {npc:9167}",

	-- Step 28: Bones and equipment
	["Bones and equipment"] = "Os et équipement",
	-- {item:11112} Research Equipment
	-- plural, as words: Dinosaur Bones = {item:11114} Dinosaur Bone
	["Dinosaur Bones lie on the ground in the south-west, among the stegodons: those are elite, pick the bones up around them and take the rest from Diemetradons. The expedition's {item:11112} lies in the south-west jungle."] = "Les Os de dinosaure jonchent le sol au sud-ouest, parmi les stégodons : ceux-ci sont élites, ramassez les os autour d'eux et prenez le reste sur les Dimeurtrodons. L'{item:11112} de l'expédition se trouve dans la jungle sud-ouest.",
	-- {npc:9164} Elder Diemetradon
	["grind on {npc:9164}"] = "tuez en boucle : {npc:9164}",

	-- Step 29: Un'Goro Crater: kill these as you meet them
	-- {zone:1449} Un'Goro Crater
	["{zone:1449}: kill these as you meet them"] = "{zone:1449} : tuez-les au fur et à mesure",
	-- {npc:9165} Fledgling Pterrordax · {npc:9998} Shizzle
	-- plural, as words: Young Diemetradons = {npc:9162} Young Diemetradon
	["Ride south down the east side. Young Diemetradons graze the eastern jungle and {npc:9165} fly near the eastern cliffs; both drop {npc:9998}'s scales."] = "Descendez vers le sud par le côté est. Les Jeunes dimeurtrodons paissent dans la jungle est et les {npc:9165} volent près des falaises est ; les deux laissent tomber les écailles de {npc:9998}.",

	-- Step 30: Western Pylon
	["Western Pylon"] = "Le Pylône ouest",
	-- {npc:9167} Frenzied Pterrordax
	["The pylon stands on the western cliffs. {npc:9167} fly over the whole west side."] = "Le pylône se dresse sur les falaises ouest. Les {npc:9167} volent au-dessus de tout le côté ouest.",

	-- Step 31: The Slithering Scar
	["The Slithering Scar"] = "La Balafre sinueuse",

	-- Step 32: Eastern Pylon
	["Eastern Pylon"] = "Le Pylône est",
	["The pylon stands on the eastern cliffs."] = "Le pylône se dresse sur les falaises est.",

	-- Step 34: Marshal's Refuge
	["Ride north along the western jungle back to the refuge."] = "Remontez vers le nord par la jungle ouest jusqu'au refuge.",
	-- {npc:9998} Shizzle
	["{npc:9998}, at the refuge's entrance"] = "{npc:9998}, à l'entrée du refuge",

	-- Step 35: To Stoutlager Inn
	["To Stoutlager Inn"] = "Vers l'Auberge de la Fortebière",
	-- {object:1162} Menethil Harbor
	["Use your hearthstone: it is bound at the Stoutlager Inn, Thelsamar. On cooldown? Fly to Theramore, take the boat to {object:1162}, then fly to Thelsamar."] = "Utilisez votre pierre de foyer : elle est liée à l'auberge de la Fortebière, à Thelsamar. En recharge ? Griffon jusqu'à Theramore, bateau pour {object:1162}, puis griffon pour Thelsamar.",
	["Stoutlager Inn"] = "Auberge de la Fortebière",

	-- Step 36: Fly to Ironforge
	-- {zone:1455} Ironforge
	["Fly to {zone:1455}"] = "Envolez-vous vers {zone:1455}",
	["Thelsamar flight master"] = "Maître de vol de Thelsamar",

	-- Step 37: Hall of Explorers
	-- {npc:9616} Laris Geardawdle · {zone:1448} Felwood
	["{npc:9616}: the oozes are in {zone:1448}, keep it"] = "{npc:9616} : les limons sont en {zone:1448}, gardez-la",

	-- Step 38: Royal Historian Archesonus
	-- {object:171709} High Seat
	["Archesonus stands beside King Magni in the {object:171709}."] = "Archesonus se tient à côté du roi Magni dans {object:171709}.",
	-- {zone:1428} Burning Steppes
	["The relics are in the {zone:1428}: keep it"] = "Les reliques sont dans {zone:1428} : gardez-la",

	-- Step 39: Mystic Ward
	-- {zone:1447} Azshara
	["Four rune rubbings in {zone:1447}: keep it"] = "Quatre estampes de runes en {zone:1447} : gardez-la",
	-- {npc:11406} High Priest Rohan · {zone:1447} Azshara
	["{npc:11406}: for Ogtinc in {zone:1447}, keep it"] = "{npc:11406} : pour Ogtinc en {zone:1447}, gardez-la",

	-- Step 40: Bind and train
	["Bind and train"] = "Lier la pierre de foyer et s'entraîner",

	-- Step 41: Xiggs Fuselighter
	-- {object:32359} Military Ward
	["Xiggs waits in the {object:32359}."] = "Xiggs attend dans {object:32359}.",

	-- Step 44: Fly to Astranaar
	["Fly to Astranaar"] = "Envolez-vous vers Astranaar",
	["Auberdine flight master"] = "Maître de vol d'Auberdine",

	-- Step 45: Level 50.4
	["Level 50.4"] = "Niveau 50.4",
	["Top up here to level 50.4 before the hand-ins at Talrendis Point: they take you to level 51."] = "Montez ici jusqu'au niveau 50,4 avant de rendre les quêtes à la Halte de Talrendis : elles vous feront atteindre le niveau 51.",
	-- {npc:6116} Highborne Apparition
	["grind on {npc:6116}"] = "tuez en boucle : {npc:6116}",
}
