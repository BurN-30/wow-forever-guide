-- French (frFR): the guide groupe-alliance/19-terres-ingrates (guides/19-terres-ingrates.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1418} Badlands · {zone:1443} Desolace
	["Group 17 · {zone:1418} & {zone:1443}"] = "Groupe 17 · {zone:1418} & {zone:1443}",

	-- Step 1: Into Badlands
	-- {zone:1418} Badlands
	["Into {zone:1418}"] = "Dans {zone:1418}",
	["Everyone at their own pace: what you already did ticks itself, the guide picks up where you are. Playing together? Group XP is best within 4 levels."] = "Chacun à son rythme : ce qui est déjà fait se coche tout seul, le guide reprend où vous en êtes. En groupe ? L'XP de groupe est meilleure à 4 niveaux d'écart ou moins.",

	-- Step 3: Hammertoe's Digsite
	["Hammertoe's Digsite"] = "Site de fouilles de Marteleur",
	-- {zone:1432} Loch Modan · {zone:1418} Badlands · {npc:2910} Prospector Ryedol · {npc:2860} Sigrun Ironhew
	["Head back west to the road and follow it south out of {zone:1432} through the pass into the {zone:1418}. {npc:2910} and {npc:2860} camp side by side at the dig."] = "Revenez à l'ouest vers la route et suivez-la vers le sud hors de {zone:1432} à travers le col jusqu'à {zone:1418}. {npc:2910} et {npc:2860} campent côte à côte sur le site de fouilles.",

	-- Step 4: Hammertoe's Digsite: kill these as you meet them
	["Hammertoe's Digsite: kill these as you meet them"] = "Site de fouilles de Marteleur : tuez-les au fur et à mesure",
	-- plural, as words: Crag Coyotes = {npc:2727} Crag Coyote
	["The Shadowforge dwarves camp just north of the digsite; the crumpled map lies among their tents. Tunnelers and Darkweavers carry Ryedol's pick. Crag Coyotes roam the slopes around it."] = "Les nains Ombreforge campent juste au nord du site de fouilles ; la carte froissée se trouve parmi leurs tentes. Les Tunneliers Ombreforge et les Tisseurs d'ombre Ombreforge portent la pioche de Ryedol. Des Coyotes des rochers parcourent les pentes alentour.",

	-- Step 5: The excavation crate
	["The excavation crate"] = "La caisse d'excavation",
	["Head north-east to the abandoned dig; the supply crate lies there among the Dustbelcher ogres."] = "Allez au nord-est jusqu'au site de fouilles abandonné ; la caisse de ravitaillement s'y trouve, parmi les ogres Crache-poussières.",

	-- Step 6: Hammertoe's Digsite
	["Ryedol's next errand goes into Uldaman: skip it."] = "La prochaine mission de Ryedol mène à Uldaman : ignorez-la.",

	-- Step 7: Valley of Fangs
	["Valley of Fangs"] = "Vallée des Crocs",
	-- {npc:4618} Martek the Exiled · {npc:2817} Rigglefuzz · {zone:1418} Badlands
	["{npc:4618} and {npc:2817} camp together in the Valley of Fangs, in the middle of the {zone:1418}."] = "{npc:4618} et {npc:2817} campent ensemble dans la Vallée des Crocs, au milieu de {zone:1418}.",
	-- {quest:1106} Martek the Exiled · {zone:1441} Thousand Needles
	["{quest:1106}: if you took his letter in {zone:1441}"] = "{quest:1106} : si vous avez pris sa lettre dans {zone:1441}",
	["The clams lie on Stranglethorn's north-west coast, in the next guide: keep it"] = "Les palourdes se trouvent sur la côte nord-ouest de Strangleronce, dans le guide suivant : gardez-la",

	-- Step 8: Indurium Flake on the way
	-- {item:5797} Indurium Flake
	["{item:5797} on the way"] = "{item:5797} en chemin",

	-- Step 9: Agmond's End
	["Agmond's End"] = "Fin d'Agmond",
	-- {npc:2785} Theldurin the Lost
	["The battered skeleton lies just east of the ogres, at the edge of the Stonevault trogg camp; the Bonesnappers and Shamans around it drop the flakes. {npc:2785} sits by the ruined camp further south."] = "Le squelette maltraité gît juste à l'est des ogres, au bord du camp des troggs de Cavepierre ; les Brise-os et chamans autour laissent tomber les écailles. {npc:2785} est assis près du camp en ruine plus au sud.",

	-- Step 10: Lotwil Veriatus
	-- {npc:2921} Lotwil Veriatus
	["Head west into the Dustbowl; {npc:2921} works by his machines in the middle of it."] = "Allez à l'ouest dans la Cuvette Poussiéreuse ; {npc:2921} travaille près de ses machines au milieu.",

	-- Step 11: Agmond's End: kill these as you meet them
	["Agmond's End: kill these as you meet them"] = "Fin d'Agmond : tuez-les au fur et à mesure",
	-- {quest:739} Murdaloc · {npc:2921} Lotwil Veriatus
	-- plural, as words: Lesser Rock Elementals = {npc:2735} Lesser Rock Elemental · Dustbelcher Lords = {npc:2719} Dustbelcher Lord
	["The Dustbelcher ogres camp just south of the valley; any of them drops scrap. Buzzards circle the plain to the east.\nThe battered skeleton lies at the edge of the Stonevault trogg camp; {quest:739}, Agmond's killer, walks among the Bonesnappers.\nThe Lesser Rock Elementals wander the Dustbowl west of {npc:2921}.\nCareful: Dustbelcher Lords are level 44-45. They use Battle Shout and Demoralizing Shout, and below 50% health they call for help from allies within 15 yd. Seven of them stand about 750 yd south of Kargath."] = "Les ogres Poussiéreux campent juste au sud de la vallée ; chacun laisse tomber de la ferraille. Des vautours tournent au-dessus de la plaine à l'est.\nLe squelette maltraité gît au bord du camp des troggs de Cavepierre ; {quest:739}, le tueur d'Agmond, se promène parmi les Brise-os.\nLes élémentaires de roche inférieurs errent dans la Cuvette Poussiéreuse à l'ouest de {npc:2921}.\nAttention : les seigneurs Poussiéreux sont de niveau 44-45. Ils utilisent Cri de guerre et Cri démoralisant, et en dessous de 50 % de vie, ils appellent à l'aide les alliés dans un rayon de 15 m. Sept d'entre eux se tiennent à environ 750 m au sud de Kargath.",
	-- {quest:739} Murdaloc · {zone:1418} Badlands
	["The skeleton's next task, {quest:739}, waits until the later {zone:1418} guide at 43."] = "La prochaine tâche du squelette, {quest:739}, attend le guide {zone:1418} ultérieur au niveau 43.",

	-- Step 13: Lucien Tosselwrench
	-- {npc:2921} Lotwil Veriatus
	["{npc:2921}'s next test needs crafted gear: skip it."] = "Le test suivant de {npc:2921} demande de l'équipement fabriqué : passez-le.",

	-- Step 14: The Ancient Chest
	-- {object:126260} Ancient Chest
	["The {object:126260}"] = "{object:126260}",
	-- {zone:1418} Badlands · {npc:2745} Ambassador Infernus
	["Head north-east to the dwarven ruins in the north of the {zone:1418}; the chest sits among the Shadowforge dwarves. {npc:2745} nearby is elite: give him room."] = "Allez au nord-est vers les ruines naines au nord de {zone:1418} ; le coffre se trouve parmi les nains Ombreforge. {npc:2745} à proximité est élite : laissez-lui de l'espace.",
	-- {item:4631} Tablet of Ryun'eh
	["{item:4631}; below ground"] = "{item:4631} ; sous terre",

	-- Step 15: Theldurin the Lost
	["Head south to Agmond's End."] = "Allez au sud jusqu'à la Fin d'Agmond.",
	-- {npc:2786} Gerrig Bonegrip · {zone:1455} Ironforge
	["for {npc:2786} in {zone:1455}: keep it"] = "pour {npc:2786} à {zone:1455} : gardez-la",
	-- {npc:2893} Stonevault Bonesnapper
	["{npc:2893}, 130 yd north"] = "{npc:2893}, 130 m au nord",

	-- Step 16: Rock Elementals
	-- plural, as words: Rock Elementals = {npc:92} Rock Elemental
	["Rock Elementals"] = "Elémentaires de roche",
	-- {npc:2921} Lotwil Veriatus
	-- plural, as words: Rock Elementals = {npc:92} Rock Elemental · Giant Buzzards = {npc:2831} Giant Buzzard · Elder Crag Coyotes = {npc:2729} Elder Crag Coyote
	["The Rock Elementals roam south-east of {npc:2921}; Giant Buzzards and Elder Crag Coyotes share the plain to their west."] = "Les élémentaires de roche rodent au sud-est de {npc:2921} ; de grands vautours et des coyotes des rochers anciens partagent la plaine à leur ouest.",

	-- Step 18: Lucien Tosselwrench
	-- {npc:2920} Lucien Tosselwrench · {npc:2921} Lotwil Veriatus
	["{npc:2920}, beside {npc:2921}"] = "{npc:2920}, à côté de {npc:2921}",
	-- {item:2868} Patterned Bronze Bracers
	["only if you carry {item:2868} (a blacksmith's craft)"] = "seulement si vous avez des {item:2868} (fabriqués par un forgeron)",

	-- Step 19: To Stoutlager Inn
	["To Stoutlager Inn"] = "Vers l'auberge Stoutlager",
	["Stoutlager Inn"] = "Auberge Stoutlager",

	-- Step 20: Thelsamar
	["Thelsamar"] = "Thelsamar",
	-- {npc:1470} Ghak Healtouch
	["{npc:1470}, in the inn; below ground"] = "{npc:1470}, dans l'auberge ; sous terre",

	-- Step 21: Fly to Menethil Harbor
	-- {object:1162} Menethil Harbor
	["Fly to {object:1162}"] = "Envolez-vous vers {object:1162}",
	["Thelsamar flight master"] = "Maître de vol de Thelsamar",

	-- Step 23: Theramore
	["Theramore"] = "Theramore",
	-- {object:21057} Foothold Citadel · {npc:5083} Clerk Lendry · {npc:4964} Commander Samaul
	["The flight master stands by the gate of {object:21057}; {npc:5083} and {npc:4964} are inside the citadel."] = "Le maître de vol se tient près de la porte de {object:21057} ; {npc:5083} et {npc:4964} sont à l'intérieur de la citadelle.",
	-- {npc:5083} Clerk Lendry
	["{npc:5083}, on the top floor"] = "{npc:5083}, au dernier étage",
	-- {npc:4964} Commander Samaul
	["{npc:4964}, on the top floor"] = "{npc:4964}, au dernier étage",
	["for the Dustwallow loop in the next guide"] = "pour la boucle du marécage d'Âprefange, dans le guide suivant",

	-- Step 25: Bibbly F'utzbuckle
	["Follow the road south to Kormek's Hut."] = "Suivez la route au sud jusqu'à la hutte de Kormek.",

	-- Step 26: Kodo Graveyard
	["Kodo Graveyard"] = "Cimetière des kodos",
	-- {npc:6019} Hornizz Brimbuzzle · {object:176751} Kodo Bones · {npc:217590} Flesh Picker
	["{npc:6019} stands at the edge of the Kodo Graveyard, south-west of Kormek's Hut; {object:176751} lie among the skeletons. A {npc:217590} crawls about the graveyard: catch one with the Entomology Starter Kit, then tick it off."] = "{npc:6019} se tient au bord du cimetière des kodos, au sud-ouest de la hutte de Kormek ; {object:176751} gisent parmi les squelettes. Un {npc:217590} rampent dans le cimetière : attrapez-en un avec le kit de démarrage d'entomologie, puis cochez-le.",
	-- {npc:217590} Flesh Picker
	["{npc:217590}: catch it, for My Little Friends"] = "{npc:217590} : attrapez-le, pour My Little Friends",

	-- Step 27: Maraudine centaurs
	["Maraudine centaurs"] = "Centaures maraudine",
	["The Maraudine centaurs hold the Valley of Spears west of the graveyard; every kind drops the totems."] = "Les centaures maraudines occupent la vallée des Lances à l'ouest du cimetière ; chaque type laisse tomber les totems.",

	-- Step 28: Melizza Brimbuzzle
	-- {npc:12277} Melizza Brimbuzzle
	["{npc:12277} is held in the centaur camp west of the graveyard. Free her and keep her alive on the walk out; she stops by the graveyard.\nCareful: The scripted groups are linked and only appear during the escort, so you cannot clear them in advance or pull them one at a time. Clearing the normal centaurs on the path before you start does help."] = "{npc:12277} est retenue dans le camp de centaures à l'ouest du cimetière. Libérez-la et gardez-la en vie pendant la sortie ; elle s'arrête près du cimetière.\nAttention : les groupes scriptés sont liés et n'apparaissent que pendant l'escorte : vous ne pouvez ni les éliminer à l'avance ni les attirer un par un. Éliminer les centaures normaux sur le chemin avant de commencer aide quand même.",
	-- {npc:12277} Melizza Brimbuzzle
	["escort {npc:12277} back toward the graveyard"] = "escortez {npc:12277} jusqu'au cimetière",

	-- Step 29: Mannoroc Coven
	["Mannoroc Coven"] = "Coven de Mannoroc",
	-- {zone:1443} Desolace
	-- plural, as words: Mana Eaters = {npc:4678} Mana Eater · Ley Hunters = {npc:4685} Ley Hunter · Nether Maidens = {npc:4679} Nether Maiden · Doomwarder Captains = {npc:4680} Doomwarder Captain
	["The demons gather at the Mannoroc Coven in southern {zone:1443}: felhounds (Mana Eaters, Mage and Ley Hunters), Nether Maidens and Sisters, and Doomwarder Captains around the pit.\nCareful: Most of the mobs here walk patrol routes, so you can easily pull extra mobs."] = "Les démons se rassemblent au Coven de Mannoroc au sud de {zone:1443} : gangrechiens (mangeurs de mana, chasseurs de mages et de ley), servantes et sœurs du Néant, et capitaines garde-funeste autour de la fosse.\nAttention : la plupart des monstres ici suivent des routes de patrouille, vous pouvez donc facilement attirer des monstres supplémentaires.",

	-- Step 30: The Valley of Bones
	["The Valley of Bones"] = "La vallée des Os",
	-- {item:15848} Crate of Ghost Magnets
	-- plural, as words: Undead Ravagers = {npc:11561} Undead Ravager · Magrami Spectres = {npc:11560} Magrami Spectre
	["Undead Ravagers roam the bone fields south of the Magram village, east of the Coven; at the far south-east, use the {item:15848} to draw the Magrami Spectres."] = "Des Ravageurs morts-vivants parcourent les champs d'ossements au sud du Village des Magram, à l'est du Convent de Mannoroc ; à l'extrême sud-est, utilisez la {item:15848} pour attirer les Spectres magrami.",

	-- Step 33: Azore Aldamort
	-- {zone:1443} Desolace · {npc:11863} Azore Aldamort
	["Follow the road west across the north of {zone:1443} to the ruins of Ethel Rethor. {npc:11863}'s tower stands on the hill there, on the way to the wreck."] = "Suivez la route vers l'ouest à travers le nord de {zone:1443} jusqu'aux ruines d'Ethel Rethor. La tour de {npc:11863} se dresse sur la colline là-bas, sur le chemin vers l'épave.",

	-- Step 34: Karnitol's Chest
	-- {npc:11863} Azore Aldamort
	["The wrecked ship's chest lies on the shore just west of {npc:11863}'s tower."] = "Le coffre du navire échoué se trouve sur le rivage, juste à l'ouest de la tour d'{npc:11863}.",

	-- Step 35: Claim Rackmore's Treasure!
	["Underwater"] = "Sous l'eau",

	-- Step 36: Nijel's Point
	-- {object:176948} Nijel's Point
	["Follow the road north to {object:176948}."] = "Suivez la route vers le nord jusqu'à {object:176948}.",
	-- {npc:5637} Roetten Stonehammer · {zone:1455} Ironforge
	["for {npc:5637} in {zone:1455}: keep it"] = "pour {npc:5637} à {zone:1455} : gardez-la",
	-- {npc:3980} Raleigh the Devout
	["for {npc:3980} in Southshore: keep it"] = "pour {npc:3980} à Austrivage : gardez-le",

	-- Step 37: Sar'theris Strand: kill these as you meet them
	["Sar'theris Strand: kill these as you meet them"] = "Rivage de Sar'theris : tuez-les au fur et à mesure",
	-- {npc:12369} Lord Kragaru · {npc:11863} Azore Aldamort
	["{npc:12369}, a centaur chieftain, camps on the north-west coast, north of {npc:11863}'s tower."] = "{npc:12369}, un chef centaure, campe sur la côte nord-ouest, au nord de la tour d'{npc:11863}.",

	-- Step 40: Kormek's Hut
	["Kormek's Hut"] = "Hutte de Kormek",

	-- Step 42: Fly to Theramore
	["Fly to Theramore"] = "Volez jusqu'à Theramore",
	["The next guide starts in Theramore."] = "Le guide suivant commence à Theramore.",
}
