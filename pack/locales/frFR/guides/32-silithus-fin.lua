-- French (frFR): the guide groupe-alliance/32-silithus-fin (guides/32-silithus-fin.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1451} Silithus · {zone:1448} Felwood · {zone:1452} Winterspring
	["Group 30 · {zone:1451}, {zone:1448}, {zone:1452} & the Plaguelands"] = "Groupe 30 · {zone:1451}, {zone:1448}, {zone:1452} & les Maleterres",

	-- Step 1: To Ratchet
	["To Ratchet"] = "Vers Cabestan",
	-- {object:1162} Menethil Harbor
	["Use your hearthstone: it is bound in Ratchet. On cooldown? Fly to {object:1162}, take the boat to Theramore, then fly to Ratchet."] = "Utilisez votre pierre de foyer : elle est liée à Cabestan. En recharge ? Griffon pour {object:1162}, bateau pour Theramore, puis griffon pour Cabestan.",
	["Everyone at their own pace: what you already did ticks itself, the guide picks up where you are. Playing together? Group XP is best within 4 levels."] = "Chacun à son rythme : ce qui est déjà fait se coche tout seul, le guide reprend où vous en êtes. En groupe ? L'XP de groupe est meilleure à 4 niveaux d'écart ou moins.",
	["Ratchet"] = "Cabestan",

	-- Step 2: Fly to Talrendis Point
	["Fly to Talrendis Point"] = "Envolez-vous vers la Halte de Talrendis",
	["Ratchet flight master"] = "Maître de vol de Cabestan",

	-- Step 4: The Emerald Sanctuary
	["The Emerald Sanctuary"] = "Le Sanctuaire d'émeraude",
	-- {zone:1448} Felwood
	["Ride north out of Astranaar into {zone:1448} to the druids' camp on the road just past the border."] = "Sortez d'Astranaar par le nord pour entrer en {zone:1448}, jusqu'au camp des druides sur la route, juste après la frontière.",
	["Inside"] = "À l'intérieur",
	-- {npc:9116} Eridan Bluewind
	["Wait a moment for {npc:9116}"] = "Patientez un instant pour {npc:9116}",

	-- Step 5: Shadow Hold braziers
	["Shadow Hold braziers"] = "Braseros du Fort des ombres",
	-- {item:12906} Purified Moonwell Water · {item:11172} Silvery Claws
	["Shadow Hold is the cave at the back of Jaedenar, west of the road. Use the {item:12906} on the four braziers inside. Kill the Angerclaw bears and Felpaw wolves you pass for the {item:11172}.\nCareful: Shadow Council mobs of level 53-55 fill the cave and often come in large linked groups, many with stuns. A group of 2-3 players is recommended."] = "Le Fort des ombres est la grotte au fond de Jaedenar, à l'ouest de la route. Utilisez le {item:12906} sur les quatre braseros à l'intérieur. Tuez les ours de la griffe colérique et les loups Gangrepatte que vous croisez pour le {item:11172}.\nAttention : des monstres du Shadow Council de niveau 53-55 remplissent la grotte et viennent souvent en grands groupes liés, beaucoup avec des étourdissements. Un groupe de 2-3 joueurs est recommandé.",
	["Angerclaw bears and Felpaw wolves"] = "Ours de la griffe colérique et loups Gangrepatte",
	-- {object:176159} Brazier of Malice
	["{object:176159}, below ground"] = "{object:176159}, sous terre",
	-- {object:176160} Brazier of Suffering
	["{object:176160}, below ground"] = "{object:176160}, sous terre",
	-- {object:176158} Brazier of Pain
	["{object:176158}, below ground"] = "{object:176158}, sous terre",
	-- {object:176161} Brazier of Hatred
	["{object:176161}, below ground"] = "{object:176161}, sous terre",

	-- Step 7: Irontree Woods
	["Irontree Woods"] = "Bois d'Arbrefer",
	-- plural, as words: Irontree Stompers = {npc:7139} Irontree Stomper · Felpaw Ravagers = {npc:8961} Felpaw Ravager
	["Follow the road north to Irontree Woods. The Irontree Stompers carry the heart; finish the claws on the Angerclaw Grizzlies and Felpaw Ravagers of the north."] = "Suivez la route au nord jusqu'au Bois d'Arbrefer. Les Arbrefer marteleurs portent le cœur ; finissez les griffes sur les grizzlys de la griffe colérique et les ravageurs Gangrepatte du nord.",
	-- plural, as words: Irontree Stompers = {npc:7139} Irontree Stomper
	["Irontree Stompers"] = "Arbrefer marteleurs",

	-- Step 8: Arei
	-- {npc:9598} Arei · {quest:5086} Toxic Horrors
	["{npc:9598} waits in Irontree Woods. Escort her out of the woods and keep her alive.\nCareful: Three {quest:5086} ambush you soon after the escort starts."] = "{npc:9598} attend dans le Bois d'Arbrefer. Escortez-la hors des bois et gardez-la en vie.\nAttention : trois {quest:5086} vous tendent une embuscade peu après le début de l'escorte.",

	-- Step 9: Felpaw Village
	["Felpaw Village"] = "Village de Gangrepatte",
	["Ride north to the Deadwood furbolgs' village by the Timbermaw Hold cave mouth."] = "Partez au nord jusqu'au village des furbolgs Mort-bois, près de l'entrée de la grotte du Repaire des Grumegueules.",
	-- {object:176091} Deadwood Cauldron · {zone:1452} Winterspring
	["{object:176091}, if you found the Firewater flask in {zone:1452}"] = "{object:176091}, si vous avez trouvé le flacon d'eau de feu au {zone:1452}",
	-- {quest:5085} Mystery Goo · {npc:9298} Donova Snowden · {zone:1452} Winterspring
	["{quest:5085}: {npc:9298} in {zone:1452}, keep it"] = "{quest:5085} : {npc:9298} au {zone:1452}, gardez-la",

	-- Step 10: A Final Blow
	-- {npc:9861} Moora · {npc:9860} Salia · {npc:9517} Shadow Lord Fel'dan
	["Back into Shadow Hold: {npc:9861} and {npc:9860} guard {npc:9517} in its deepest chamber.\nCareful: The three bosses fight as a group. Kill the nearby mobs first so you don't pull extra enemies."] = "Retour au Fort des ombres : {npc:9861} et {npc:9860} gardent {npc:9517} dans sa salle la plus profonde.\nAttention : les trois boss combattent ensemble. Tuez d'abord les monstres proches pour ne pas attirer d'ennemis supplémentaires.",
	-- {npc:9861} Moora
	["{npc:9861}, below ground"] = "{npc:9861}, sous terre",
	-- {npc:9860} Salia
	["{npc:9860}, below ground"] = "{npc:9860}, sous terre",
	-- {npc:9517} Shadow Lord Fel'dan
	["{npc:9517}; below ground"] = "{npc:9517} ; sous terre",

	-- Step 11: The Emerald Sanctuary
	["Ride back south along the road to the Sanctuary."] = "Revenez vers le sud par la route jusqu'au sanctuaire.",
	-- {npc:9116} Eridan Bluewind
	["{npc:9116}, inside"] = "{npc:9116}, à l'intérieur",
	-- {item:11169} Book of Aquor
	["Keep the {item:11169}, the claws and the heart he hands back"] = "Gardez le {item:11169}, les griffes et le cœur qu'il vous rend",

	-- Step 13: Fly to Gadgetzan
	["Fly to Gadgetzan"] = "Envolez-vous pour Gadgetzan",
	["Talrendis Point flight master"] = "Maître de vol de la Halte de Talrendis",

	-- Step 14: Gadgetzan
	["Gadgetzan"] = "Gadgetzan",
	-- {quest:5801} Fire Plume Forged
	-- plural, as words: Thorium Bars = {item:12359} Thorium Bar
	["Fly to Gadgetzan. Buy two Thorium Bars at the Auction House here for {quest:5801}."] = "Envolez-vous vers Gadgetzan. Achetez ici deux barres de thorium à l'Hôtel des ventes pour {quest:5801}.",
	-- {npc:5594} Alchemist Pestlezugg
	["{npc:5594}, inside"] = "{npc:5594}, à l'intérieur",

	-- Step 15: Aquementas
	-- {item:11169} Book of Aquor · {quest:4005} Aquementas
	["Ride east into the hills. Use the {item:11169} to summon {quest:4005}, then defeat him for the totem."] = "Chevauchez vers l'est dans les collines. Utilisez le {item:11169} pour invoquer {quest:4005}, puis vainquez-le pour obtenir le totem.",

	-- Step 16: Broken Pillar
	["Broken Pillar"] = "Pilier brisé",
	-- {npc:7771} Marvon Rivetseeker
	["Ride south-west to {npc:7771}'s camp at the Broken Pillar."] = "Partez au sud-ouest jusqu'au camp de {npc:7771}, au Pilier brisé.",

	-- Step 18: The Slithering Scar
	["The Slithering Scar"] = "La Balafre sinueuse",
	-- {npc:10041} Gorishi Hive Queen
	["Take the road west down into the crater and ride to the Slithering Scar, the silithid cave in the south. The {npc:10041} waits in its deepest chamber."] = "Prenez la route vers l'ouest pour descendre dans le cratère et allez jusqu'à la Balafre sinueuse, la grotte des silithides au sud. Le {npc:10041} attend dans sa salle la plus profonde.",

	-- Step 19: Fire Plume Ridge
	["Fire Plume Ridge"] = "Crête de la Fournaise",
	-- {item:14644} Skeleton Key Mold · {npc:9616} Laris Geardawdle
	-- plural, as words: Thorium Bars = {item:12359} Thorium Bar · Empty Pure Sample Jars = {item:11953} Empty Pure Sample Jar · Primal Oozes = {npc:6557} Primal Ooze
	["Climb Fire Plume Ridge in the middle of the crater and use the {item:14644} by the lava lake at the top, with two Thorium Bars in your bags. Fill {npc:9616}'s Empty Pure Sample Jars on the Primal Oozes in the pools around the ridge."] = "Grimpez sur la Crête de la Fournaise au centre du cratère et utilisez le {item:14644} près du lac de lave au sommet, avec deux barres de thorium dans vos sacs. Remplissez les pots d'échantillon pur vides de {npc:9616} sur les limons primitifs des bassins autour de la crête.",
	["Use the jars on slain oozes"] = "Utilisez les pots sur les limons tués",

	-- Step 20: Marshal's Refuge
	["Marshal's Refuge"] = "Refuge des Marshal",
	-- {npc:10980} Umi's Mechanical Yeti · {npc:10977} Quixxil
	["Ride north to Marshal's Refuge. Use {npc:10980} beside {npc:10977}."] = "Partez au nord jusqu'au Refuge des Marshal. Utilisez {npc:10980} à côté de {npc:10977}.",
	-- {npc:9117} J.D. Collie
	["{npc:9117}, below ground"] = "{npc:9117}, sous terre",
	-- {npc:8737} Linken
	["{npc:8737}, at the back of the refuge"] = "{npc:8737}, au fond du refuge",

	-- Step 21: Fly to Cenarion Hold
	["Fly to Cenarion Hold"] = "Envolez-vous vers le Fort cénarien",
	["Marshal's Refuge flight master"] = "Maître de vol du Refuge des Marshal",

	-- Step 22: Cenarion Hold
	["Cenarion Hold"] = "Fort cénarien",
	-- {npc:15189} Beetix Ficklespragg
	["{npc:15189} stands upstairs in his building: go up inside, the arrow cannot tell the floors apart."] = "{npc:15189} se tient à l'étage de son bâtiment : montez par l'intérieur, la flèche ne distingue pas les étages.",

	-- Step 23: Hive'Ashi: kill these as you meet them
	["Hive'Ashi: kill these as you meet them"] = "Ruche'Ashi : tuez-les au fur et à mesure",
	-- {item:20404} Encrypted Twilight Text · {npc:15306} Bor Wildmane · {npc:15194} Hermit Ortell
	-- plural, as words: Dust Stormers = {npc:11744} Dust Stormer · Desert Rumblers = {npc:11746} Desert Rumbler
	["The Twilight's Hammer dig fills the north-west corner: tablet fragments lie on the ground and the Dust Stormers and Desert Rumblers carry them too. Every cultist can drop an {item:20404}: keep twenty, ten for {npc:15306} and ten for {npc:15194} later."] = "Les fouilles du Marteau du crépuscule occupent le coin nord-ouest : des fragments de tablette jonchent le sol, et les Tempétueux de poussière et Grondeurs du désert en portent aussi. Tout sectateur peut laisser tomber un {item:20404} : gardez-en vingt, dix pour {npc:15306} et dix pour {npc:15194} plus tard.",
	["Twilight's Hammer cultists"] = "Sectateurs du Marteau du crépuscule",
	-- plural, as words: Twilight Tablet Fragments = {item:20378} Twilight Tablet Fragment
	["Twilight Tablet Fragments"] = "Fragments de la Tablette du crépuscule",
	-- {quest:8323} True Believers
	["Ten more for {quest:8323}"] = "Dix de plus pour {quest:8323}",

	-- Step 24: Hive'Zora
	["Hive'Zora"] = "Ruche'Zora",
	-- {npc:17080} Marshal Bluewall
	["{npc:17080} camps outside Hive'Zora, the western hive. Pick up a Silithyst at one of the red geysers nearby and carry it to the Alliance extractor at his camp.\nCareful: You lose the Silithyst if you mount, stealth, use Divine Shield, Feign Death or Vanish. Blink and Power Word: Shield do not drop it."] = "{npc:17080} campe devant la Ruche'Zora, la ruche de l'ouest. Ramassez de la silithyste à l'un des geysers rouges voisins et portez-la jusqu'à l'extracteur de l'Alliance à son camp.\nAttention : vous perdez la silithyste si vous montez en monture, vous camouflez, utilisez Bouclier divin, Feindre la mort ou Disparition. Transfert et Mot de pouvoir : Bouclier ne la font pas tomber.",

	-- Step 26: Cenarion Hold
	-- {npc:15190} Noggle Ficklespragg
	["{npc:15190} stands upstairs in his building: go up inside, the arrow cannot tell the floors apart."] = "{npc:15190} se tient à l'étage de son bâtiment : montez par l'intérieur, la flèche ne distingue pas les étages.",

	-- Step 27: Southwind Village
	["Southwind Village"] = "Village de Sudevent",
	-- {object:179565} Dusty Reliquary
	-- plural, as words: Tortured Sentinels = {npc:12179} Tortured Sentinel
	["Ride east to the ruins of Southwind Village. The {object:179565} lies among the ruined buildings, watched by Tortured Sentinels."] = "Partez à l'est jusqu'aux ruines du Village de Sudevent. {object:179565} se trouve parmi les bâtiments en ruine, surveillé par des sentinelles torturées.",
	-- {object:179565} Dusty Reliquary
	["{object:179565}; inside"] = "{object:179565} ; à l'intérieur",

	-- Step 28: Hermit Ortell
	["The hermit hides among the rocks south-east of Southwind Village."] = "L'ermite se cache parmi les rochers au sud-est du Village de Sudevent.",
	["Below ground"] = "Sous terre",

	-- Step 29: Bronzebeard's Encampment
	["Bronzebeard's Encampment"] = "Campement de Bronzebeard",
	-- {npc:15171} Frankal Stonebridge · {npc:15170} Rutgar Glyphshaper · {npc:15190} Noggle Ficklespragg
	["Ride south-west to the dwarves' camp near the southern mountains and question {npc:15171} and {npc:15170}. {npc:15190}'s satchel lies in the sand just south-east of the camp."] = "Chevauchez vers le sud-ouest jusqu'au camp des nains près des montagnes du sud et interrogez {npc:15171} et {npc:15170}. La Sacoche de {npc:15190} se trouve dans le sable juste au sud-est du camp.",

	-- Step 30: The Twilight Post
	["The Twilight Post"] = "Le Poste du Crépuscule",
	-- {npc:11803} Twilight Keeper Exeter
	["{npc:11803} holds the cultists' camp in the far south-west."] = "{npc:11803} tient le camp des sectateurs à l'extrême sud-ouest.",

	-- Step 31: Twilight Keeper Mayna
	["Ride north along the west side to Mayna's small camp."] = "Chevauchez vers le nord par le côté ouest jusqu'au petit camp de Mayna.",

	-- Step 32: Twilight Keeper Havunth
	["Havunth's camp sits just west of Cenarion Hold."] = "Le camp d'Havunth se trouve juste à l'ouest du Fort cénarien.",

	-- Step 33: Hermit Ortell
	["Ride back south-east to the hermit."] = "Revenez vers le sud-est jusqu'à l'ermite.",
	["Hand him the ten texts you kept"] = "Remettez-lui les dix textes que vous avez gardés",

	-- Step 35: Gadgetzan
	["Fly to Gadgetzan."] = "Envolez-vous vers Gadgetzan.",
	-- {npc:7740} Gracina Spiritmight · {zone:1457} Darnassus
	["{npc:7740} in {zone:1457}: keep it"] = "{npc:7740} à {zone:1457} : gardez-la",

	-- Step 36: Forest Song
	["Forest Song"] = "Chant des forêts",
	-- {zone:1447} Azshara · {zone:1440} Ashenvale
	["Fly to Talrendis Point in {zone:1447} and ride west along the road to Forest Song, just over the {zone:1440} border."] = "Envolez-vous vers la Halte de Talrendis en {zone:1447} et suivez la route vers l'ouest jusqu'à Chant des forêts, juste après la frontière de {zone:1440}.",

	-- Step 37: Fly to Everlook
	["Fly to Everlook"] = "Envolez-vous vers Long-Guet",

	-- Step 38: Everlook
	["Everlook"] = "Long-Guet",
	["Ride back to Talrendis Point and fly to Everlook."] = "Retournez à la Halte de Talrendis et envolez-vous vers Long-Guet.",

	-- Step 40: Ranshalla
	-- {npc:10300} Ranshalla · {object:177404} Altar of Elune
	["{npc:10300} waits at Owl Wing Thicket, south of Everlook.\nProtect {npc:10300} while she lights the torches on the way to the {object:177404}."] = "{npc:10300} attend au Fourré de l'Aile de la chouette, au sud de Long-Guet.\nProtégez {npc:10300} pendant qu'elle allume les torches sur le chemin de {object:177404}.",
	-- {npc:10300} Ranshalla
	["{npc:10300}: her escort comes later on the route"] = "{npc:10300} : son escorte viendra plus tard sur l'itinéraire",

	-- Step 41: Darkwhisper Gorge
	["Darkwhisper Gorge"] = "Gorge du Sombre murmure",
	-- {npc:9298} Donova Snowden
	["Follow {npc:9298}'s directions to the mouth of Darkwhisper Gorge, past the Frostmaul giants: pass them one at a time."] = "Suivez les indications de {npc:9298} jusqu'à l'entrée de la Gorge du Sombre murmure, au-delà des géants Cognegivre : passez-les un par un.",

	-- Step 43: Dire Maul (optional)
	["Dire Maul (optional)"] = "Hache-tripes (facultatif)",
	-- {zone:1444} Feralas
	["Running Dire Maul in {zone:1444} instead of grinding gets you there faster in a group. Skip this step to grind solo."] = "En groupe, faire Hache-tripes en {zone:1444} au lieu de tuer des monstres en boucle vous y amène plus vite. Sautez cette étape pour monter en solo.",
	-- {npc:7446} Rabid Shardtooth
	["Dire Maul fits levels 55 to 60; the {npc:7446} grind below gets you to 59 alone."] = "Hache-tripes convient aux niveaux 55 à 60 ; tuer des {npc:7446} en boucle ci-dessous vous amène seul au niveau 59.",

	-- Step 44: Donova Snowden
	-- {npc:9298} Donova Snowden
	["Keep west on the road to {npc:9298}'s camp beside the hot springs."] = "Continuez vers l'ouest sur la route jusqu'au camp de {npc:9298}, à côté des sources chaudes.",

	-- Step 47: Felpaw Village
	-- {npc:11558} Kernda
	["{npc:11558}, just inside the cave: only from Neutral with the Timbermaw; walks around here: look inside the circle on the map"] = "{npc:11558}, juste à l'entrée de la grotte : seulement à partir de Neutre avec les Grumegueules ; se promène ici : cherchez à l'intérieur du cercle sur la carte",
	-- {npc:11557} Meilosh · {quest:6031} Runecloth
	["{npc:11557}, if you have thirty {quest:6031}; below ground"] = "{npc:11557}, si vous avez trente {quest:6031} ; sous terre",

	-- Step 51: Winterspring: kill these as you meet them
	-- {zone:1452} Winterspring
	["{zone:1452}: kill these as you meet them"] = "{zone:1452} : tuez-les au fur et à mesure",
	["The western Winterfall furbolgs drop the beads.\nCareful: Turning in spawns three or four level 56-57 Winterfall ambushers that attack you; you can escape them while mounted, in stealth or with Feign Death, and they then gather by the lake so you can take the next quest."] = "Les furbolgs Tombe-hiver de l'ouest laissent tomber les perles.\nAttention : rendre la quête fait apparaître trois ou quatre embusqués Tombe-hiver de niveau 56-57 qui vous attaquent ; vous pouvez leur échapper sur votre monture, camouflé ou avec Feindre la mort, et ils se regroupent ensuite près du lac pour que vous puissiez prendre la quête suivante.",

	-- Step 55: Umber
	-- {zone:1452} Winterspring · {npc:9298} Donova Snowden · {zone:1450} Moonglade · {npc:11939} Umber
	["Take the Timbermaw Hold tunnel from its {zone:1452} mouth, west of {npc:9298}, and follow the {zone:1450} branch to Nighthaven. {npc:11939} studies by the lake shore."] = "Prenez le tunnel du Repaire des Grumegueules par son entrée du {zone:1452}, à l'ouest de {npc:9298}, et suivez la branche vers {zone:1450} jusqu'à Havrenuit. {npc:11939} étudie sur la rive du lac.",
	-- {npc:11939} Umber
	["{npc:11939} walks around Nighthaven: look inside the circle on the map"] = "{npc:11939} se promène dans Havrenuit : cherchez dans le cercle sur la carte",

	-- Step 56: Rabine Saturna
	-- {npc:11801} Rabine Saturna · {npc:11939} Umber
	["{npc:11801}'s house stands in Nighthaven, east of {npc:11939}."] = "La maison de {npc:11801} se dresse à Havrenuit, à l'est de {npc:11939}.",

	-- Step 58: Nighthaven
	["Nighthaven"] = "Havrenuit",
	["Learn the flight path in Nighthaven."] = "Apprenez le point de vol de Havrenuit.",

	-- Step 59: Fly to Rut'theran Village
	["Fly to Rut'theran Village"] = "Envolez-vous vers le village de Rut'theran",

	-- Step 60: Rut'theran Village
	["Rut'theran Village"] = "Village de Rut'theran",
	-- {npc:7916} Erelas Ambersky
	["The flight lands in Rut'theran Village. {npc:7916} stands a short walk north-west of the flight master."] = "Le vol atterrit à Rut'theran. {npc:7916} se tient à quelques pas au nord-ouest du maître de vol.",

	-- Step 62: Darnassus
	-- {zone:1457} Darnassus
	["Take the portal up to {zone:1457}."] = "Prenez le portail pour monter à {zone:1457}.",
	-- {npc:7740} Gracina Spiritmight
	["{npc:7740}, in the Temple of the Moon"] = "{npc:7740}, dans le Temple de la Lune",
	-- {npc:4155} Idriana
	["{npc:4155}, in the bank"] = "{npc:4155}, à la banque",
	-- {npc:3516} Arch Druid Fandral Staghelm
	["{npc:3516}, atop the Cenarion Enclave"] = "{npc:3516}, au sommet de l'Enclave cénarienne",

	-- Step 63: Portal to Teldrassil
	-- {zone:1438} Teldrassil
	["Portal to {zone:1438}"] = "Portail vers {zone:1438}",

	-- Step 64: Fly to Auberdine
	["Fly to Auberdine"] = "Envolez-vous pour Auberdine",
	["Rut'theran Village flight master"] = "Maître de vol du village de Rut'theran",

	-- Step 65: Boat to Menethil Harbor
	-- {object:1162} Menethil Harbor
	["Boat to {object:1162}"] = "Bateau pour {object:1162}",

	-- Step 66: Fly to Ironforge
	-- {zone:1455} Ironforge
	["Fly to {zone:1455}"] = "Envolez-vous vers {zone:1455}",
	-- {object:1162} Menethil Harbor
	["{object:1162} flight master"] = "Maître de vol de {object:1162}",

	-- Step 67: Fly to Stormwind
	-- {zone:1453} Stormwind
	["Fly to {zone:1453}"] = "Volez jusqu'à {zone:1453}",
	-- {zone:1455} Ironforge
	["{zone:1455} flight master"] = "Maître de vol de {zone:1455}",

	-- Step 68: Stormwind
	-- {npc:14722} Clavicus Knavingham · {quest:6031} Runecloth
	["{npc:14722} takes sixty Silk, sixty Mageweave and sixty {quest:6031}: hand in what you carry (or buy at the Auction House), skip the rest."] = "{npc:14722} prend soixante Étoffes de soie, soixante Étoffes de tisse-mage et soixante {quest:6031} : rendez ce que vous portez (ou achetez à l'hôtel des ventes), laissez le reste.",
	-- {item:4306} Silk Cloth
	["{item:4306}, from your bags"] = "{item:4306}, depuis vos sacs",
	-- {item:4338} Mageweave Cloth
	["{item:4338}, from your bags"] = "{item:4338}, depuis vos sacs",
	-- {npc:14722} Clavicus Knavingham · {object:2096} Trade District
	["{npc:14722}, in the {object:2096}"] = "{npc:14722}, dans {object:2096}",

	-- Step 69: Ironforge
	-- {zone:1455} Ironforge · {npc:14724} Bubulo Acerbus · {npc:14723} Mistina Steelshield · {item:14047} Runecloth
	-- plural, as words: Jadefire Shadowstalkers = {npc:7110} Jadefire Shadowstalker
	["Take the Deeprun Tram to {zone:1455}. {npc:14724} and {npc:14723} each take sixty Wool, sixty Silk and sixty Mageweave, then sixty {item:14047}: hand in what you carry (or buy at the Auction House), skip the rest.\nCareful: Jadefire Shadowstalkers are level 51-52 and move stealthed. They use Slowing Poison and are found about 550 yd south of Bloodvenom Post.\nCareful: Jadefire Shadowstalkers sneak around and use Slowing Poison."] = "Prenez le Tram des profondeurs jusqu'à {zone:1455}. {npc:14724} et {npc:14723} prennent chacun soixante étoffes de laine, soixante étoffes de soie et soixante étoffes de tisse-mage, puis soixante {item:14047} : rendez ce que vous avez sur vous (ou achetez-le à l'Hôtel des ventes), laissez tomber le reste.\nAttention : les traqueurs des ombres Jadefeu sont de niveau 51-52 et se déplacent camouflés. Ils utilisent un poison ralentissant et se trouvent à environ 550 m au sud du Poste de la Vénéneuse.\nAttention : les traqueurs des ombres Jadefeu rôdent camouflés et utilisent un poison ralentissant.",
	-- {item:2592} Wool Cloth
	["{item:2592}, from your bags"] = "{item:2592}, depuis vos sacs",
	-- {item:14047} Runecloth
	["{item:14047}, from your bags"] = "{item:14047}, depuis vos sacs",
	-- {zone:1453} Stormwind
	["{zone:1453} has no shaman trainer"] = "{zone:1453} n'a pas de maître des chamans",

	-- Step 71: Stormwind City
	["Stormwind City"] = "Cité de Hurlevent",
	-- {item:2592} Wool Cloth
	["Sixty {item:2592}, if you carry them"] = "Soixante {item:2592}, si vous en avez",

	-- Step 73: Fly to Southshore
	["Fly to Southshore"] = "Envolez-vous pour Austrivage",
	-- {zone:1453} Stormwind
	["{zone:1453} flight master"] = "Maître de vol de {zone:1453}",

	-- Step 77: Chillwind Camp
	["Chillwind Camp"] = "Camp du Noroît",
	-- {npc:1852} Araj the Summoner
	["{npc:1852} is a level 61 elite"] = "{npc:1852} est un élite de niveau 61",

	-- Step 78: Andorhal
	["Andorhal"] = "Ruines d'Andorhal",
	-- {npc:10667} Chromie · {npc:1852} Araj the Summoner
	["{npc:10667} waits in the ruined inn on the west side of Andorhal, the ruined city north of the camp. {npc:1852} guards his phylactery in the middle of the town."] = "{npc:10667} attend dans l'auberge en ruine du côté ouest des Ruines d'Andorhal, la ville en ruine au nord du camp. {npc:1852} garde son phylactère au milieu de la ville.",
	["Araj is elite: grouping up is advised."] = "Araj est élite : mieux vaut être en groupe.",
	-- {npc:10667} Chromie
	["{npc:10667}, upstairs"] = "{npc:10667}, à l'étage",

	-- Step 79: Felstone Field
	["Felstone Field"] = "Champ de Felstone",
	-- {npc:10778} Janice Felstone
	-- plural, as words: Jabbering Ghouls = {npc:10801} Jabbering Ghoul
	["{npc:10778}'s ghost wanders by the farmhouse of Felstone Field, west of Andorhal. The Jabbering Ghouls in the field carry the other half of the charm: combine the two halves.\nThe game does not count the half-charm, so the ghoul's tooltip shows nothing; it drops only while you carry the quest. With both halves in the bags, right-click one of them to put the charm back together."] = "Le fantôme de {npc:10778} erre près de la ferme du Champ de Felstone, à l'ouest d'Andorhal. Les goules jacassantes du champ portent l'autre moitié du porte-bonheur : assemblez les deux moitiés.\nLe jeu ne compte pas le demi-charme : l'infobulle de la goule n'affiche rien, et elle ne le laisse tomber que si la quête est dans le journal. Avec les deux moitiés dans les sacs, clic droit sur l'une d'elles pour reconstituer le porte-bonheur.",
	["Upstairs"] = "À l'étage",

	-- Step 80: Northridge Lumber Camp
	["Northridge Lumber Camp"] = "Camp de bûcherons de la Crête du nord",
	["Ride north up the road to the lumber mill and set the termite barrel down in the middle of it."] = "Remontez la route vers le nord jusqu'à la scierie et posez le tonneau de termites en son centre.",

	-- Step 81: Tirion Fordring (optional)
	-- {npc:1855} Tirion Fordring
	["{npc:1855} (optional)"] = "{npc:1855} (facultatif)",
	-- {npc:1855} Tirion Fordring · {quest:5781} Of Forgotten Memories
	["{npc:1855} lives in a small hut on the border river, north-east of the lumber camp. Hand in {quest:5781} if you finished it."] = "{npc:1855} vit dans une petite hutte au bord de la rivière frontalière, au nord-est du camp de bûcherons. Rendez {quest:5781} si vous l'avez terminée.",

	-- Step 83: Of Lost Honor
	["Underwater"] = "Sous l'eau",

	-- Step 86: Scholomance (optional)
	["Scholomance (optional)"] = "Scholomance (facultatif)",
	-- {zone:1422} Western Plaguelands
	["Running Scholomance (Caer Darrow, south-east {zone:1422}) or Stratholme instead of grinding gets you there faster in a group. Skip this step to grind solo."] = "En groupe, faire la Scholomance (Caer Darrow, au sud-est des {zone:1422}) ou Stratholme au lieu de tuer des monstres en boucle vous y amène plus vite. Sautez cette étape pour monter en solo.",
	-- {quest:5505} The Key to Scholomance
	["Scholomance fits levels 58 to 60; {quest:5505} is handed in at Chillwind Camp below."] = "La Scholomance convient aux niveaux 58 à 60 ; {quest:5505} se rend au Camp du Noroît ci-dessous.",

	-- Step 87: Grind to 60
	["Grind to 60"] = "Monter au niveau 60",
	-- {npc:1855} Tirion Fordring
	-- plural, as words: Terrordale Spirits = {npc:14564} Terrordale Spirit
	["Cross the river east of {npc:1855} into Terrordale. The Terrordale Spirits haunt the woods there."] = "Traversez la rivière à l'est de {npc:1855} pour entrer à Val-Terreur. Les esprits de Val-Terreur hantent les bois.",
	-- {npc:14564} Terrordale Spirit · {zone:1423} Eastern Plaguelands
	["grind on {npc:14564} at Terrordale, {zone:1423}"] = "tuer des {npc:14564} en boucle à Val-Terreur, {zone:1423}",

	-- Step 89: Chillwind Camp
	["Ride back south-west to Chillwind Camp."] = "Retournez au sud-ouest jusqu'au Camp du Noroît.",

	-- No longer in the guide (its English changed or it went away): reuse or delete.
	-- ["{npc:10778}'s ghost wanders by the farmhouse of Felstone Field, west of Andorhal. The Jabbering Ghouls in the field carry the other half of the charm: combine the two halves."] = "Le fantôme de {npc:10778} erre près de la ferme du Champ de Felstone, à l'ouest d'Andorhal. Les goules jacassantes du champ portent l'autre moitié du porte-bonheur : assemblez les deux moitiés.",
}
