-- French (frFR): the guide groupe-alliance/27-steppes-ardentes (guides/27-steppes-ardentes.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1428} Burning Steppes · {zone:1447} Azshara
	["Group 25 · {zone:1428} & {zone:1447}"] = "Groupe 25 · {zone:1428} & {zone:1447}",

	-- Step 1: Shadowsong Shrine
	["Shadowsong Shrine"] = "Sanctuaire de Shadowsong",
	-- {zone:1447} Azshara
	["The shrine lies in the south-west corner of {zone:1447}, south of Talrendis Point."] = "Le sanctuaire se trouve dans le coin sud-ouest de {zone:1447}, au sud de la Halte de Talrendis.",
	["Everyone at their own pace: what you already did ticks itself, the guide picks up where you are. Playing together? Group XP is best within 4 levels."] = "Chacun à son rythme : ce qui est déjà fait se coche tout seul, le guide reprend où vous en êtes. En groupe ? L'XP de groupe est meilleure à 4 niveaux d'écart ou moins.",

	-- Step 2: Azshara: kill these as you meet them
	-- {zone:1447} Azshara
	["{zone:1447}: kill these as you meet them"] = "{zone:1447} : tuez-les au fur et à mesure",
	["The Highborne ghosts haunt the ruins around the shrine; the Haldarr satyrs hold the camp just north of it."] = "Les fantômes bien-nés hantent les ruines autour du sanctuaire ; les satyres Haldarr tiennent le Campement des Haldarr juste au nord.",

	-- Step 5: Ogtinc
	-- {npc:8405} Ogtinc
	["Ride north-east from the shrine: {npc:8405} camps at the Bear's Head, in the hills above the road."] = "Partez vers le nord-est depuis le sanctuaire : {npc:8405} campe à Tête d'ours, dans les collines au-dessus de la route.",

	-- Step 6: Mosshoof Coursers
	-- plural, as words: Mosshoof Coursers = {npc:8761} Mosshoof Courser
	["Mosshoof Coursers"] = "Coursiers Sabots-de-mousse",
	-- plural, as words: Mosshoof Coursers = {npc:8761} Mosshoof Courser
	["The nearest Mosshoof Coursers graze the hills north-east of the Bear's Head, toward the Legashi Encampment; a larger herd roams the open ground to the south."] = "Les coursiers Sabots-de-mousse les plus proches paissent dans les collines au nord-est de Tête d'ours, vers le Campement Legashi ; un troupeau plus grand parcourt la plaine au sud.",

	-- Step 9: Sanath Lim-yo
	-- {npc:8395} Sanath Lim-yo
	-- plural, as words: Undamaged Hippogryph Feathers = {item:10450} Undamaged Hippogryph Feather
	["Optional: {npc:8395} wants two Undamaged Hippogryph Feathers from the hippogryphs around his camp. The data lists no experience for it."] = "Facultatif : {npc:8395} veut deux Plumes d'hippogryphe sans défaut des hippogryphes autour de son camp. Les données n'indiquent aucune expérience pour cette quête.",
	-- {npc:6375} Thunderhead Hippogryph
	["grind on {npc:6375}"] = "tuez en boucle : {npc:6375}",

	-- Step 10: Kim'jael
	-- {npc:8420} Kim'jael
	["{npc:8420} camps at the Legashi Encampment in the north; his equipment lies all over the Thalassian Base Camp just south-east of him."] = "{npc:8420} campe au Campement Legashi, au nord ; son équipement est éparpillé dans tout le Camp de base thalassien, juste au sud-est.",
	-- {npc:6196} Spitelash Myrmidon
	["grind on {npc:6196}"] = "tuez en boucle : {npc:6196}",

	-- Step 11: The Ruins of Eldarath
	["The Ruins of Eldarath"] = "Ruines d'Eldarath",
	-- {item:13815} Some Rune · {npc:8507} Tymor · {item:10445} Drawing Kit
	["The Spitelash naga of the Ruins of Eldarath carry {item:13815}. {npc:8507}'s four runes stand among the ruins: use his {item:10445} on each."] = "Les nagas Fouette-bile des Ruines d'Eldarath portent {item:13815}. Les quatre runes de {npc:8507} se dressent parmi les ruines : utilisez son {item:10445} sur chacune.",

	-- Step 12: The Shattered Strand
	["The Shattered Strand"] = "La Grève fracassée",

	-- Step 15: Rubbing: Rune of Sael'hai
	-- {item:7972} Ichor of Undeath · {npc:7864} Lingering Highborne
	["{item:7972}: the {npc:7864}, about 10%"] = "{item:7972} : les {npc:7864}, environ 10 %",

	-- Step 17: Ogtinc: Blood of Morphaz (Sunken Temple)
	-- {npc:8405} Ogtinc · {quest:8257} Blood of Morphaz
	["{npc:8405}: {quest:8257} (Sunken Temple)"] = "{npc:8405} : {quest:8257} (Temple englouti)",
	-- {npc:8405} Ogtinc · {quest:8257} Blood of Morphaz · {npc:10922} Greta Mosshoof · {zone:1448} Felwood
	["{npc:8405}'s last task for priests, {quest:8257}, is done in the Sunken Temple later in this guide; {npc:10922}, in {zone:1448}, gives the reward at the start of the next guide. Each priest takes it here."] = "La dernière tâche d'{npc:8405} pour les prêtres, {quest:8257}, se fait dans le Temple englouti, plus loin dans ce guide ; {npc:10922}, en {zone:1448}, donne la récompense au début du guide suivant. Chaque prêtre la prend ici.",

	-- Step 18: Ravencrest Monument
	["Ravencrest Monument"] = "Colosse de Ravencrest",
	-- {zone:1447} Azshara · {npc:8392} Pilot Xiggs Fuselighter
	["Swim to the small island off the southern tip of {zone:1447}: {npc:8392} waits by the monument."] = "Nagez jusqu'au petit îlot au large de la pointe sud de {zone:1447} : {npc:8392} attend près du monument.",

	-- Step 19: Level 50.89
	["Level 50.89"] = "Niveau 50.89",
	-- {zone:1426} Dun Morogh
	["Top up here to level 50.89 before the hand-ins at {zone:1426}: they take you to level 51."] = "Complétez ici jusqu'au niveau 50.89 avant les rendus de quêtes à {zone:1426} : ils vous font passer au niveau 51.",

	-- Step 20: To Stoutlager Inn
	["To Stoutlager Inn"] = "Vers l'Auberge de la Fortebière",
	-- {object:1162} Menethil Harbor
	["Use your hearthstone: it is bound at the Stoutlager Inn, Thelsamar. On cooldown? Fly from Talrendis Point to Auberdine, take the boat to {object:1162}, then fly to Thelsamar."] = "Utilisez votre pierre de foyer : elle est liée à l'auberge de la Fortebière, à Thelsamar. En recharge ? Griffon de la Halte de Talrendis à Auberdine, bateau pour {object:1162}, puis griffon pour Thelsamar.",
	["Stoutlager Inn"] = "Auberge de la Fortebière",

	-- Step 21: Fly to Ironforge
	-- {zone:1455} Ironforge
	["Fly to {zone:1455}"] = "Envolez-vous vers {zone:1455}",
	["Thelsamar flight master"] = "Maître de vol de Thelsamar",

	-- Step 23: Fly to Morgan's Vigil
	["Fly to Morgan's Vigil"] = "Voler jusqu'à la Veille de Morgan",
	-- {zone:1455} Ironforge
	["{zone:1455} flight master"] = "Maître de vol de {zone:1455}",

	-- Step 24: Morgan's Vigil
	["Morgan's Vigil"] = "Veille de Morgan",
	["Morgan's Vigil sits in the south-east of the Steppes, at the top of the pass up from Redridge."] = "La Veille de Morgan se trouve au sud-est des Steppes ardentes, en haut du col qui monte depuis les Carmines.",

	-- Step 25: Dreadmaul Rock
	["Dreadmaul Rock"] = "Rocher des Cognepeurs",
	["The Firegut ogres hold the great rock north of the Vigil, with the Brutes on its east side."] = "Les ogres Brûlentrailles tiennent le grand rocher au nord de la Veille, avec les Brutes sur son flanc est.",
	-- {npc:7034} Firegut Ogre Mage
	["{npc:7034}, below ground"] = "{npc:7034}, sous terre",

	-- Step 26: Morgan's Vigil
	-- {npc:9177} Oralius
	["{npc:9177}: the Blackrock orcs drop the medallions, keep it open all through the Steppes"] = "{npc:9177} : les orcs Blackrock laissent tomber les médaillons, gardez-la ouverte dans toutes les Steppes",

	-- Step 27: Blackrock Medallion on the way
	-- {item:11467} Blackrock Medallion
	["{item:11467} on the way"] = "{item:11467} en chemin",

	-- Step 28: Thaurissan Relic on the way
	-- {object:153556} Thaurissan Relic
	["{object:153556} on the way"] = "{object:153556} en chemin",

	-- Step 29: Level 51.39
	["Level 51.39"] = "Niveau 51.39",
	["Top up here to level 51.39 before the hand-ins at Flame Crest: they take you to level 52."] = "Montez ici jusqu'au niveau 51.39 avant les rendus de la Corniche des flammes : ils vous amènent au niveau 52.",
	-- {npc:7034} Firegut Ogre Mage
	["grind on {npc:7034}"] = "tuez en boucle : {npc:7034}",

	-- Step 30: Flame Crest
	["Flame Crest"] = "Corniche des flammes",
	["Follow the road west, then climb north to the goblin camp on Flame Crest."] = "Suivez la route vers l'ouest, puis montez vers le nord jusqu'au camp gobelin de la Corniche des flammes.",

	-- Step 31: Level 52
	["Level 52"] = "Niveau 52",
	["Top up here to level 52 before the hand-ins at Flame Crest: they take you to level 53."] = "Montez ici jusqu'au niveau 52 avant les rendus de la Corniche des flammes : ils vous amènent au niveau 53.",

	-- Step 32: Ruins of Thaurissan: kill these as you meet them
	["Ruins of Thaurissan: kill these as you meet them"] = "Ruines de Thaurissan : tuez-les au fur et à mesure",
	-- {object:147516} Dark Iron · {item:12284} Draco-Incarcinatrix 900 · {npc:7047} Black Broodling
	["The relics are the carved stones scattered through the Ruins of Thaurissan around Flame Crest: click them until the information is recovered.\nRead the tablet in the {object:147516} camp among the ruins, south-west of Flame Crest, to copy the transcript.\nUse the {item:12284} on a {npc:7047} on the slopes east of Flame Crest just before it dies, then loot the essence it leaves."] = "Les reliques sont les pierres gravées éparpillées dans les Ruines de Thaurissan autour de la Corniche des flammes : cliquez dessus jusqu'à récupérer les informations.\nLisez la tablette dans le camp {object:147516} parmi les ruines, au sud-ouest de la Corniche des flammes, pour en copier la transcription.\nUtilisez {item:12284} sur un {npc:7047} sur les pentes à l'est de la Corniche des flammes juste avant qu'il meure, puis ramassez l'essence qu'il laisse.",

	-- Step 33: Flame Crest
	-- {quest:4808} Felnok Steelspring · {zone:1452} Winterspring
	["Ends with {quest:4808} in Everlook, {zone:1452}: keep it"] = "Se termine par {quest:4808} à Long-Guet, {zone:1452} : gardez-la",

	-- Step 34: Cyrus Therepentous
	["Below ground"] = "Sous terre",

	-- Step 35: A Taste of Flame
	-- {npc:9461} Frenzied Black Drake
	["These are elite mobs: grouping up is encouraged, look for people to do it with. {npc:9461} is a level 54 elite: most classes solo it at level 56, but you may need help. Skip it if you are alone: the route has you grind the XP back."] = "Ce sont des monstres élites : il est conseillé de se grouper, cherchez des joueurs avec qui le faire. {npc:9461} est un élite de niveau 54 : la plupart des classes le battent seules au niveau 56, mais vous aurez peut-être besoin d'aide. Passez-le si vous êtes seul : l'itinéraire vous fait regagner l'expérience en tuant des monstres.",

	-- Step 37: Level 52.08
	["Level 52.08"] = "Niveau 52.08",
	-- {quest:4022} A Taste of Flame
	["If you skipped {quest:4022}, grind here to level 52.08 to stay on the route's plan."] = "Si vous avez passé {quest:4022}, tuez des monstres ici jusqu'au niveau 52.08 pour suivre le plan de l'itinéraire.",
	-- {npc:9690} Ember Worg
	["grind on {npc:9690}"] = "tuez en boucle : {npc:9690}",

	-- Step 38: Blackrock Stronghold
	["Blackrock Stronghold"] = "Bastion Rochenoire",
	-- {npc:9176} Gor'tesh
	["{npc:9176} and the Blackrock orcs hold the camps and the stronghold at the foot of Blackrock Mountain, west of Flame Crest. Pull them one at a time; every orc and worg may drop a medallion, so kill them until you have fifty.\nCareful: {npc:9176} has a guard linked to him that joins the fight, and a second soldier patrols close by; clear the patrol before pulling."] = "{npc:9176} et les orcs Rochenoire tiennent les camps et le bastion au pied du Mont Rochenoire, à l'ouest de la Corniche des flammes. Attirez-les un par un ; chaque orc et chaque worg peut laisser tomber un médaillon, tuez-les jusqu'à en avoir cinquante.\nAttention : {npc:9176} a un garde lié qui rejoint le combat, et un second soldat patrouille tout près ; éliminez la patrouille avant d'attirer.",
	-- {item:11467} Blackrock Medallion
	["{item:11467}; inside"] = "{item:11467} ; à l'intérieur",

	-- Step 39: Morgan's Vigil
	["Ride back east along the road to the Vigil."] = "Revenez vers l'est par la route jusqu'à la Veille.",

	-- Step 40: Dreadmaul Rock
	["Climb to the top of Dreadmaul Rock and plant the head in the soft dirt mound."] = "Grimpez au sommet du Rocher des Cognepeurs et plantez la tête dans le monticule de terre meuble.",

	-- Step 42: Fly to Nethergarde Keep
	["Fly to Nethergarde Keep"] = "Voler jusqu'au Rempart-du-Néant",
	["Morgan's Vigil flight master"] = "Maître de vol de la Veille de Morgan",

	-- Step 43: Nethergarde Keep: Thadius Grimshade
	-- {npc:8022} Thadius Grimshade
	["Nethergarde Keep: {npc:8022}"] = "Rempart-du-Néant : {npc:8022}",
	-- {quest:2991} Nekrum's Medallion · {npc:8022} Thadius Grimshade
	["{quest:2991}: {npc:8022} waits at the top of the keep. He then reads the medallion: wait for his ritual, and his next errand goes to Aerie Peak, where this guide passes later."] = "{quest:2991} : {npc:8022} attend en haut du donjon. Il lit ensuite le médaillon : attendre la fin de son rituel ; sa tâche suivante mène au Nid-de-l'Aigle, où ce guide passe plus tard.",
	["Wait for the ritual"] = "Attendre la fin du rituel",
	-- {npc:5636} Gryphon Master Talonaxe
	["For {npc:5636}, Aerie Peak: keep it"] = "Pour {npc:5636}, au Nid-de-l'Aigle : la garder",

	-- Step 44: Kum'isha the Collector
	-- {npc:7363} Kum'isha the Collector · {zone:1419} Blasted Lands · {npc:7664} Razelikh the Defiler · {object:141891} Razelikh's Tear
	-- plural, as words: Imperfect Draenethyst Fragments = {item:10593} Imperfect Draenethyst Fragment
	["{npc:7363} waits at the Rise of the Defiler, the hill south-west of the keep. The {zone:1419} mobs on the way drop the Imperfect Draenethyst Fragments; bring her what you have.\nCareful: Felcular, {npc:7664} and Ilifar are all level 60 elites. Razelikh casts Mana Burn, Strong Cleave and Decimate, and as its health drops it adds {object:141891}, Flames of Chaos and then Enrage at 15%."] = "{npc:7363} attend à la Cime du Souilleur, la colline au sud-ouest du rempart. Les monstres de {zone:1419} en chemin laissent tomber les fragments de draenéthyste imparfaits ; apportez-lui ce que vous avez.\nAttention : Gangrénaire, {npc:7664} et Ilifar sont tous des élites de niveau 60. Razelikh lance Brûlure de mana, Strong Cleave et Decimate, et à mesure que sa vie baisse il ajoute {object:141891}, Flames of Chaos, puis s'enrage à 15 %.",
	-- {npc:7363} Kum'isha the Collector
	["{npc:7363} walks around here: look inside the circle on the map"] = "{npc:7363} se promène par ici : cherchez dans le cercle sur la carte",

	-- Step 45: Sunken Temple (dungeon, optional): the Pool of Tears
	["Sunken Temple (dungeon, optional): the Pool of Tears"] = "Temple englouti (donjon, facultatif) : le Bassin des larmes",
	-- {zone:1419} Blasted Lands · {zone:1435} Swamp of Sorrows
	["Ride north out of the {zone:1419} into the {zone:1435}, then east past Stonard (Horde) to the Pool of Tears. The temple lies under the water: swim down into it and find the dungeon's entrance inside."] = "Sortir des {zone:1419} par le nord vers le {zone:1435}, puis aller à l'est après Pierrêche (Horde) jusqu'au Bassin des larmes. Le temple est sous l'eau : plonger, entrer et trouver l'entrée du donjon à l'intérieur.",
	["Group of 5, levels 50 to 55. Keep 3 free quest log slots. Share each quest with your group: click it in the quest log, then Share."] = "Groupe de 5, niveaux 50 à 55. Garder 3 places libres dans le journal de quêtes. Partagez chaque quête au groupe : clic sur la quête dans le journal, puis Partager.",
	-- {quest:1475} Into The Temple of Atal'Hakkar · {npc:5384} Brohann Caskbelly · {zone:1453} Stormwind · {quest:1446} Jammal'an the Prophet · {npc:5598} Atal'ai Exile · {zone:1425} Hinterlands · {quest:8257} Blood of Morphaz · {npc:8405} Ogtinc · {zone:1447} Azshara · {npc:7771} Marvon Rivetseeker
	["In the quest log before going in: {quest:1475} ({npc:5384}, {zone:1453}, Group 22). If you took them: {quest:1446} ({npc:5598}, {zone:1425}, Group 22), and for priests {quest:8257} ({npc:8405}, {zone:1447}, earlier in this guide). Not on this route: {npc:7771}'s two quests and The God Hakkar, which open only after this run, and the other classes' quests."] = "Dans le journal avant d'entrer : {quest:1475} ({npc:5384}, {zone:1453}, Groupe 22). Si elles ont été prises : {quest:1446} ({npc:5598}, {zone:1425}, Groupe 22) et, pour les prêtres, {quest:8257} ({npc:8405}, {zone:1447}, plus tôt dans ce guide). Pas sur ce parcours : les deux quêtes de {npc:7771} et Le dieu Hakkar, qui ne s'ouvrent qu'après ce passage, ni les quêtes des autres classes.",
	["Sunken Temple"] = "Temple englouti",

	-- Step 46: Sunken Temple: the tablets and Jammal'an
	["Sunken Temple: the tablets and Jammal'an"] = "Temple englouti : les tablettes et Jammal'an",
	-- {quest:1446} Jammal'an the Prophet · {npc:5598} Atal'ai Exile
	-- plural, as words: Atal'ai Tablets = {item:6288} Atal'ai Tablet
	["The Atal'ai Tablets lie in the temple's halls: pick them up as you clear. {quest:1446} waits on the upper level, once the six troll champions of the balconies around the central pit are dead: his head is for the {npc:5598}'s quest (Group 22), and every player who has it loots one."] = "Les tablettes atal'ai sont dans les salles du temple : les ramasser en avançant. {quest:1446} attend au niveau supérieur, une fois tués les six champions trolls des balcons qui entourent la fosse centrale : sa tête est pour la quête de l'{npc:5598} (Groupe 22), et chaque joueur qui l'a en ramasse une.",

	-- Step 47: Sunken Temple: Morphaz (priests)
	["Sunken Temple: Morphaz (priests)"] = "Temple englouti : Morphaz (prêtres)",
	-- {npc:5709} Shade of Eranikus · {quest:8257} Blood of Morphaz
	["Morphaz, one of the green dragons on the way to the {npc:5709}, drops the {quest:8257} for the priest's quest."] = "Morphaz, l'un des dragons verts avant l'{npc:5709}, lâche le sang demandé par {quest:8257}, la quête des prêtres.",
	-- {quest:8257} Blood of Morphaz
	["{quest:8257}: Morphaz"] = "{quest:8257} : Morphaz",

	-- Step 48: Sunken Temple: the Shade of Eranikus
	-- {npc:5709} Shade of Eranikus
	["Sunken Temple: the {npc:5709}"] = "Temple englouti : {npc:5709}",
	-- {npc:5709} Shade of Eranikus · {item:10454} Essence of Eranikus · {object:148512} Essence Font
	["The {npc:5709} waits at the very end, past the green dragons. He drops the {item:10454}: right-click it, then hand it in at the {object:148512} in his room before you leave."] = "{npc:5709} attend tout au fond, après les dragons verts, et laisse l'{item:10454} : clic droit dessus, puis la rendre au {object:148512}, dans la même salle, avant de partir.",
	-- {item:10454} Essence of Eranikus
	["{item:10454}, a drop"] = "{item:10454}, un butin",

	-- Step 49: Jammal'an the Prophet: not done
	-- {quest:1446} Jammal'an the Prophet
	["{quest:1446}: not done"] = "{quest:1446} : pas faite",
	-- {quest:1446} Jammal'an the Prophet
	["{quest:1446} needs the Sunken Temple, and the guide does not come back to it: abandon it."] = "{quest:1446} demande le Temple englouti, et le guide n'y revient pas : l'abandonner.",

	-- Step 50: Blood of Morphaz: not done
	-- {quest:8257} Blood of Morphaz
	["{quest:8257}: not done"] = "{quest:8257} : pas faite",
	-- {quest:8257} Blood of Morphaz
	["{quest:8257} needs the Sunken Temple, and the guide does not come back to it: abandon it."] = "{quest:8257} demande le Temple englouti, et le guide n'y revient pas : l'abandonner.",

	-- Step 51: To Stoutlager Inn
	["Use your hearthstone (Stoutlager Inn, Thelsamar) if it is ready again. On cooldown? Fly from Nethergarde Keep to Thelsamar."] = "Utilisez votre pierre de foyer (auberge de la Fortebière, Thelsamar) si elle est de nouveau prête. En recharge ? Prenez le griffon du Rempart-du-Néant à Thelsamar.",

	-- Step 58: Stormwind: Brohann Caskbelly
	-- {zone:1455} Ironforge · {zone:1453} Stormwind · {npc:5384} Brohann Caskbelly · {object:28027} Dwarven District
	["Take the Deeprun Tram from {zone:1455} to {zone:1453} and back: {npc:5384} waits in the {object:28027}."] = "Prendre le Tram des profondeurs de {zone:1455} à {zone:1453}, aller et retour : {npc:5384} attend dans le {object:28027}.",

	-- Step 59: Fly to Aerie Peak
	["Fly to Aerie Peak"] = "Envolez-vous vers Nid-de-l'Aigle",

	-- Step 60: Aerie Peak: Gryphon Master Talonaxe
	-- {npc:5636} Gryphon Master Talonaxe
	["Aerie Peak: {npc:5636}"] = "Nid-de-l'Aigle : {npc:5636}",
	-- {quest:2993} Return to the Hinterlands
	["{quest:2993}: Talonaxe is in the aviary at the top of Aerie Peak. His next task, Saving Sharpbeak, sends you to the top of Jintha'Alor among elite trolls: not on this route, skip it."] = "{quest:2993} : Talonaxe est dans la volière en haut du Nid-de-l'Aigle. Sa tâche suivante, Sauver Bec-tranchant, envoie au sommet de Jintha'Alor parmi des trolls élites : hors parcours, la passer.",

	-- Step 61: Wildkin feathers
	["Wildkin feathers"] = "Plumes d'Indomptable",
	-- {zone:1425} Hinterlands
	-- plural, as words: Wildkin Feathers = {item:10819} Wildkin Feather
	["The Wildkin Feathers lie on the ground across the {zone:1425}, south and east of Aerie Peak, where the owlbeasts roam; the mobs here are well below you now."] = "Les plumes d'Indomptable jonchent le sol dans {zone:1425}, au sud et à l'est du Nid-de-l'Aigle, là où rôdent les chouettards ; les monstres du coin sont désormais bien en dessous de votre niveau.",

	-- Step 62: Atal'ai Exile
	-- {zone:1425} Hinterlands · {npc:5598} Atal'ai Exile
	["Jammal'an's head: ride south to Shadra'Alor, the troll ruins in the south-west of the {zone:1425}, west of the Altar of Zul. The {npc:5598} waits on a ledge beside the steps of one of the pyramids. A detour of about 10 minutes there and back."] = "La tête de Jammal'an : descendre au sud jusqu'à Shadra'Alor, les ruines trolls au sud-ouest des {zone:1425}, à l'ouest de l'autel de Zul. L'{npc:5598} attend sur une corniche, à côté des marches d'une des pyramides. Un détour d'environ 10 minutes aller-retour.",

	-- Step 63: The Super Snapper FX
	-- {npc:7977} Gammerita
	["These are elite mobs: grouping up is encouraged, look for people to do it with. {npc:7977} (level 48 elite) needs a group of 2. Skip it if you are alone: the route has you grind the XP back."] = "Ce sont des monstres élites : il est conseillé de se grouper, cherchez des joueurs avec qui le faire. {npc:7977} (élite de niveau 48) demande un groupe de 2. Passez-la si vous êtes seul : l'itinéraire vous fait regagner l'expérience en tuant des monstres.",

	-- Step 65: Fly to Southshore
	["Fly to Southshore"] = "Envolez-vous pour Austrivage",
	["Aerie Peak flight master"] = "Maître de vol de Nid-de-l'Aigle",

	-- Step 67: Fly to Rut'theran Village
	["Fly to Rut'theran Village"] = "Envolez-vous vers le village de Rut'theran",
	["Auberdine flight master"] = "Maître de vol d'Auberdine",

	-- Step 68: Rut'theran Village
	["Rut'theran Village"] = "Village de Rut'theran",
	-- {zone:1452} Winterspring
	["The wildkin are in {zone:1452}: keep it"] = "Les Indomptables sont au {zone:1452} : gardez-la",

	-- Step 69: Druid training
	["Druid training"] = "Entraînement de druide",
	-- {zone:1455} Ironforge · {zone:1457} Darnassus
	["{zone:1455} has no druid trainer: take the portal up to {zone:1457} and train in the Cenarion Enclave, then come back down to Rut'theran Village."] = "{zone:1455} n'a pas de maître des druides : prenez le portail vers {zone:1457}, entraînez-vous dans l'Enclave cénarienne, puis redescendez à Rut'theran.",

	-- Step 70: Back to Teldrassil
	-- {zone:1438} Teldrassil
	["Back to {zone:1438}"] = "Retour vers {zone:1438}",

	-- Step 71: Daryn Lightwind
	-- {npc:7907} Daryn Lightwind · {npc:7916} Erelas Ambersky
	["{npc:7907} stands upstairs, above {npc:7916}: go up inside, the arrow cannot tell the floors apart."] = "{npc:7907} se tient à l'étage, au-dessus de {npc:7916} : montez à l'intérieur, la flèche ne distingue pas les étages.",
}
