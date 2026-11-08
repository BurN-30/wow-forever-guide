-- French (frFR): the guide groupe-alliance/18-arathi (guides/18-arathi.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1417} Arathi Highlands · {zone:1416} Alterac Mountains · {zone:1435} Swamp of Sorrows
	["Group 16 · {zone:1417}, {zone:1416} & {zone:1435}"] = "Groupe 16 · {zone:1417}, {zone:1416} et {zone:1435}",

	-- Step 1: Fly to Darkshire
	["Fly to Darkshire"] = "Envolez-vous pour Sombre-Comté.",
	["Everyone at their own pace: what you already did ticks itself, the guide picks up where you are. Playing together? Group XP is best within 4 levels."] = "Chacun à son rythme : ce qui est déjà fait se coche tout seul, le guide reprend où vous en êtes. En groupe ? L'XP de groupe est meilleure à 4 niveaux d'écart ou moins.",
	-- {object:3204} Booty Bay
	["{object:3204} flight master"] = "Maître de vol de {object:3204}",

	-- Step 3: Watcher Biggs
	-- {npc:5476} Watcher Biggs · {npc:217412} Amaryllis Webb
	["{npc:5476} guards the road junction in the west of the swamp. {npc:217412} stands a short way north of him."] = "{npc:5476} garde le carrefour à l'ouest du marais. {npc:217412} se tient un peu au nord de lui.",
	-- {npc:217412} Amaryllis Webb · {zone:1443} Desolace
	["{npc:217412}: three critters to catch in Arathi, {zone:1443} and Stranglethorn"] = "{npc:217412} : trois bestioles à capturer en Arathi, en {zone:1443} et à Strangleronce",

	-- Step 4: The western swamp
	["The western swamp"] = "Le marais occidental",
	-- plural, as words: Sorrow Spinners = {npc:858} Sorrow Spinner · Swamp Jaguars = {npc:767} Swamp Jaguar
	["Young crocolisks, Sorrow Spinners and Swamp Jaguars all roam the swamp around the road."] = "Jeunes crocilisques, Tisseuses des pleurs et Jaguars du marécage parcourent tous le marais autour de la route.",

	-- Step 6: The Harborage
	["The Harborage"] = "The Harborage",
	["Follow the road north to the draenei of the Harborage."] = "Suivez la route vers le nord jusqu'aux draeneï du Harborage.",

	-- Step 7: Fallow Sanctuary
	["Fallow Sanctuary"] = "Fallow Sanctuary",
	-- {npc:256028} The Lost One
	["East along the road to the Fallow Sanctuary. {npc:256028} mobs drop the crystals; Noboru walks the ruins and drops his cudgel."] = "Vers l'est le long de la route jusqu'au Fallow Sanctuary. Les sbires de {npc:256028} laissent tomber les cristaux ; Noboru arpente les ruines et laisse tomber sa massue.",

	-- Step 8: The Lost Caravan
	-- plural, as words: Lost Ones = {npc:254797} Lost One
	["The wrecked caravan lies off the road near Biggs.\nCareful: The camp is full of Lost Ones around level 38. They stand in linked groups of 2-3, many are casters, and they respawn quickly."] = "La caravane détruite se trouve à l'écart de la route, près de Biggs.\nAttention : le camp est rempli d'Égarés de niveau 38 environ. Ils se tiennent en groupes liés de 2 ou 3, beaucoup lancent des sorts, et ils réapparaissent vite.",

	-- Step 9: Galen Goodward
	-- {npc:5391} Galen Goodward
	["{npc:5391} is caged at the north end of the sanctuary. Free him and keep him alive on the walk out; his strongbox waits by the road afterwards."] = "{npc:5391} est enfermé dans une cage au nord du sanctuaire. Libérez-le et gardez-le en vie pendant la sortie ; son coffre vous attend ensuite au bord de la route.",

	-- Step 13: Fly to Stormwind
	-- {zone:1453} Stormwind
	["Fly to {zone:1453}"] = "Volez jusqu'à {zone:1453}",
	-- {zone:1430} Deadwind Pass
	["Back west through {zone:1430} to Darkshire."] = "Retour vers l'ouest par {zone:1430} jusqu'à Sombre-Comté.",
	-- {npc:2409} Felicia Maline
	["{npc:2409}, Darkshire"] = "{npc:2409}, Sombre-Comté",

	-- Step 14: Stormwind
	-- {npc:1141} Angus Stern
	["{npc:1141}, Stormwind Harbor road"] = "{npc:1141}, route du port de Hurlevent",

	-- Step 15: The Binding
	-- {npc:6122} Gakin the Darkbinder · {object:2164} Slaughtered Lamb · {object:2101} Mage Quarter · {item:6913} Heartswood Core · {quest:65602} What Is Love? · {item:190309} Wooden Figurine
	["{npc:6122} waits in the {object:2164}'s cellar, in the {object:2101}. Use the {item:6913} at the summoning circle there and defeat the succubus it calls. If you took {quest:65602}, hand him the {item:190309} too, place it at the same circle and defeat the incubus."] = "{npc:6122} attend dans la cave de {object:2164}, dans {object:2101}. Utilisez le {item:6913} sur le cercle d'invocation et vainquez la succube invoquée. Si vous avez pris {quest:65602}, donnez-lui aussi la {item:190309}, placez-la sur le même cercle et vainquez l'incube.",
	["Subdue the succubus"] = "Soumettez la succube",
	["Summon Succubus"] = "Invoquer un succube",
	-- {quest:65602} What Is Love?
	["{quest:65602}, if you took it"] = "{quest:65602}, si vous l'avez prise",
	-- {npc:185335} Summoned Incubus
	["{npc:185335}, at the same circle"] = "{npc:185335}, sur le même cercle",
	-- {npc:6122} Gakin the Darkbinder
	["{npc:6122} binds the incubus to you"] = "{npc:6122} vous lie l'incube",

	-- Step 16: Stormwind
	-- {npc:12336} Brother Crowley
	["{npc:12336}, Cathedral of Light"] = "{npc:12336}, Cathedral of Light",

	-- Step 19: Stormwind
	-- {npc:1440} Milton Sheaf
	["{npc:1440}, the Royal Library in the keep"] = "{npc:1440}, la Royal Library du donjon",

	-- Step 20: Tram to Ironforge
	-- {zone:1455} Ironforge
	["Tram to {zone:1455}"] = "Tram pour {zone:1455}",

	-- Step 21: Fly to Southshore
	-- {quest:538} Southshore
	["Fly to {quest:538}"] = "Envolez-vous pour {quest:538}",
	-- {zone:1455} Ironforge
	["{zone:1455} flight master"] = "Maître de vol de {zone:1455}",

	-- Step 23: Shadowy Assassin
	-- {npc:2434} Shadowy Assassin · {quest:538} Southshore
	["A {npc:2434} lurks unseen on the edge of {quest:538}; kill him and read the contract he carries."] = "Un {npc:2434} rôde invisible au bord de {quest:538} ; tuez-le et lisez le contrat qu'il porte.",
	-- {npc:2276} Magistrate Henry Maleb
	["{npc:2276}, inside"] = "{npc:2276}, à l'intérieur",

	-- Step 26: Refuge Pointe
	-- {object:2685} Refuge Pointe
	["Follow the road east out of Hillsbrad over Thoradin's Wall to {object:2685}."] = "Suivez la route vers l'est depuis Hautebrande par le Mur de Thoradin jusqu'à {object:2685}.",

	-- Step 27: Witherbark Village
	["The Witherbark trolls live in the hills south of Go'Shek Farm; Witch Doctors stand in the village, Shadow Hunters guard the far end of the valley."] = "Les trolls Flétrécorce vivent dans les collines au sud de la Ferme de Go'Shek ; des Sorciers-docteurs se tiennent dans le village, des Chasseurs de l'ombre gardent le fond de la vallée.",

	-- Step 28: Northfold Manor
	-- {object:2685} Refuge Pointe · {npc:217589} Hay Weevil · {npc:217412} Amaryllis Webb
	["The Syndicate hold the farm north-west of {object:2685}. A {npc:217589} crawls about the farm: catch one with {npc:217412}'s Entomology Starter Kit, then tick it off.\nCareful: Syndicate Highwaymen are level 30-31 and can cast Sneak while out of combat, so they are often stealthed and hard to spot."] = "Le Syndicat occupe la ferme au nord-ouest de {object:2685}. Un {npc:217589} rampent dans la ferme : attrapez-en un avec le Kit de démarrage en entomologie de {npc:217412}, puis cochez-le.\nAttention : les Routiers du Syndicat sont de niveau 30-31 et peuvent lancer Camouflage hors combat, ils sont donc souvent camouflés et difficiles à repérer.",
	-- {npc:217589} Hay Weevil · {quest:93176} My Little Friends
	["{npc:217589}: catch it, for {quest:93176}"] = "{npc:217589} : capturez-le, pour {quest:93176}",

	-- Step 29: Faldir's Cove
	["Faldir's Cove"] = "Crique de Faldir",
	-- {npc:2766} Lolo the Lookout
	["West along the coast to the goblins' cove; {npc:2766} keeps watch on the rocks above it."] = "Vers l'ouest le long de la côte jusqu'à la crique des gobelins ; {npc:2766} surveille les rochers au-dessus.",

	-- Step 30: Phizzlethorpe
	["Phizzlethorpe"] = "Phizzlethorpe",
	["Escort the professor to the beach north of the cove and guard him while he works; naga attack in waves.\nCareful: The ambush is two level 40 water elementals, and they are immune to frost. If the fight happens inside the cave, the professor joins in instead of working and further elementals keep appearing; holding the elementals at the cave entrance, away from him, lets him finish with only the first two to deal with."] = "Escortez le professeur jusqu'à la plage au nord de la crique et protégez-le pendant qu'il travaille ; les nagas attaquent par vagues.\nAttention : l'embuscade se compose de deux élémentaires d'eau de niveau 40, insensibles au givre. Si le combat a lieu dans la grotte, le professeur s'y joint au lieu de travailler et d'autres élémentaires continuent d'apparaître ; retenir les élémentaires à l'entrée de la grotte, loin de lui, lui permet de terminer avec seulement les deux premiers à affronter.",

	-- Step 32: The Drowned Reef: kill these as you meet them
	["The Drowned Reef: kill these as you meet them"] = "Le Récif Noyé : tuez-les au fur et à mesure",
	["The two wrecks lie in the bay west of the cove. The charts and logs are inside them; the gems lie on the sea floor around them. Daggerspine naga swim the whole bay."] = "Les deux épaves reposent dans la baie à l'ouest de la crique. Les cartes et les journaux sont à l'intérieur ; les gemmes gisent au fond de la mer autour. Des nagas Daguéchine nagent dans toute la baie.",
	-- {npc:2595} Daggerspine Raider
	["{npc:2595}, underwater"] = "{npc:2595}, sous l'eau",
	-- {item:4492} Elven Gem
	["{item:4492}; underwater"] = "{item:4492} ; sous l'eau",
	-- {npc:2596} Daggerspine Sorceress
	["{npc:2596}, underwater"] = "{npc:2596}, sous l'eau",
	-- {object:2709} Maiden's Folly Log
	["{object:2709}; underwater"] = "{object:2709} ; sous l'eau",
	-- {object:2707} Maiden's Folly Charts
	["{object:2707}; underwater"] = "{object:2707} ; sous l'eau",
	-- {object:2710} Spirit of Silverpine Log
	["{object:2710}; underwater"] = "{object:2710} ; sous l'eau",
	-- {object:2708} Spirit of Silverpine Charts
	["{object:2708}; underwater"] = "{object:2708} ; sous l'eau",

	-- Step 33: Faldir's Cove
	-- {npc:2487} Fleet Master Seahorn · {object:3204} Booty Bay
	["For {npc:2487} in {object:3204}: keep it"] = "Pour {npc:2487} à {object:3204} : gardez-le",

	-- Step 34: Ebenezer Rustlocke
	["Ebenezer Rustlocke"] = "Ebenezer Rustlocke",
	["Walk back onto the span: Ebenezer lies under its Arathi end."] = "Revenez sur le pont : Ebenezer gît sous son extrémité côté Arathi.",
	-- {object:2652} Ebenezer Rustlocke's Corpse
	["{object:2652}, inside"] = "{object:2652}, à l'intérieur",

	-- Step 35: Shadow Hunter Knife
	-- {item:5040} Shadow Hunter Knife
	["{item:5040}; below ground"] = "{item:5040} ; sous terre",

	-- Step 36: Shards of Myzrael
	["Head north past Go'Shek Farm; the shards glitter on the hill by the Circle of East Binding."] = "Allez au nord passé la ferme de Go'Shek ; les éclats brillent sur la colline près du Cercle de Liaison Est.",
	["Only if Gluggle gave you the pendant in Stranglethorn"] = "Seulement si Gluggle vous a donné le pendentif à Strangleronce",

	-- Step 37: Drywhisker Gorge: kill these as you meet them
	["Drywhisker Gorge: kill these as you meet them"] = "Gorge Sèche-Moustache : tuez-les au fur et à mesure",
	["The Drywhisker kobolds dig in the gorge east of Hammerfall (Horde); skirt the town to the north. They drop both the motes and Krazek's ore.\nCareful: Every kobold type runs off for help when low on health (Kobolds at 30%, Surveyors and Diggers at 15%), which can pull more of them."] = "Les kobolds Sèche-Moustache creusent dans la gorge à l'est de Hammerfall (Horde) ; contournez la ville par le nord. Ils laissent tomber à la fois les particules et le minerai de Krazek.\nAttention : chaque type de kobold s'enfuit chercher de l'aide quand sa vie est basse (kobolds à 30 %, arpenteurs et foreurs à 15 %), ce qui peut en attirer d'autres.",
	-- {item:4435} Mote of Myzrael · {npc:2572} Drywhisker Kobold · {npc:2573} Drywhisker Surveyor · {npc:2574} Drywhisker Digger
	["{item:4435} from {npc:2572}, {npc:2573} and {npc:2574}, by this stop"] = "{item:4435} depuis {npc:2572}, {npc:2573} et {npc:2574}, à cet arrêt",

	-- Step 38: Iridescent Shards
	["The shards lie at the far end of Drywhisker Gorge."] = "Les éclats se trouvent au fond de la Gorge Sèche-Moustache.",
	["Below ground"] = "Sous terre",

	-- Step 39: Stones of Binding
	-- {object:2685} Refuge Pointe · {object:2702} Stone of Inner Binding
	-- plural, as words: Burning Exiles = {npc:2760} Burning Exile · Thundering Exiles = {npc:2762} Thundering Exile · Cresting Exiles = {npc:2761} Cresting Exile
	["Each key lies at one of the Highlands' standing-stone circles: east of the shards, near {object:2685} and in the west. The {object:2702} stands west of {object:2685}.\nCareful: Each center stone is guarded by around three elementals near level 39 that attack together if you click the stone without clearing them: Burning Exiles at West, Thundering Exiles at Outer, Cresting Exiles at East."] = "Chaque clé se trouve dans l'un des cercles de pierres dressées des Hautes-terres : à l'est des éclats, près de {object:2685} et à l'ouest. Le {object:2702} se trouve à l'ouest de {object:2685}.\nAttention : chaque pierre centrale est gardée par environ trois élémentaires de niveau 39 environ qui attaquent ensemble si vous cliquez sur la pierre sans les avoir éliminés : Exilés ardents à l'Ouest, Exilés tonnants à l'Extérieur, Exilés déferlants à l'Est.",

	-- Step 40: Quae
	-- {object:2685} Refuge Pointe · {npc:2712} Quae · {npc:2713} Kinelory
	["Head back north-east past {object:2685}; {npc:2712} and {npc:2713} camp in the hills north of Go'Shek Farm."] = "Revenez au nord-est passé {object:2685} ; {npc:2712} et {npc:2713} campent dans les collines au nord de la ferme de Go'Shek.",

	-- Step 41: Forsaken Courier
	["The courier walks the road west of Go'Shek Farm with two guards; pull them off the road."] = "Le courrier emprunte la route à l'ouest de la ferme de Go'Shek avec deux gardes ; attirez-les hors de la route.",

	-- Step 42: Circle of Outer Binding
	["Circle of Outer Binding"] = "Cercle de Liaison Extérieur",

	-- Step 43: Quae and Kinelory
	-- {npc:2712} Quae · {npc:2713} Kinelory
	["{npc:2712} and {npc:2713}"] = "{npc:2712} et {npc:2713}",

	-- Step 44: Kinelory's errand
	-- {npc:2713} Kinelory
	["{npc:2713}'s errand"] = "La mission de {npc:2713}",
	-- {npc:2713} Kinelory
	["Stay with {npc:2713} while she sneaks into Go'Shek Farm and back; Horde orcs jump you on the way.\nCareful: Orcs that drop to low health run away. {npc:2713} follows them and can pull more mobs, so kill or slow runners fast."] = "Restez avec {npc:2713} pendant qu'elle s'infiltre dans la ferme de Go'Shek et en ressort ; des orcs de la Horde vous attaquent en chemin.\nAttention : les orcs qui tombent à basse vie s'enfuient. {npc:2713} les poursuit et peut attirer plus de monstres, donc tuez ou ralentissez les fuyards rapidement.",

	-- Step 45: Quae
	-- {npc:2711} Phin Odelic · {quest:538} Southshore
	["For {npc:2711} in {quest:538}"] = "Pour {npc:2711} dans {quest:538}",

	-- Step 46: Circle of West Binding
	["Circle of West Binding"] = "Cercle de Liaison Ouest",

	-- Step 48: Kor'gresh Coldrage
	-- {npc:2793} Kor'gresh Coldrage
	["{npc:2793}, an ogre mage, holds the cave at the southern end of the Witherbark valley."] = "{npc:2793}, un mage ogre, occupe la grotte à l'extrémité sud de la vallée des Witherbark.",
	-- {item:4525} Trelane's Wand of Invocation
	["{item:4525}; below ground"] = "{item:4525} ; sous terre",

	-- Step 50: Fly to Southshore
	-- {object:2685} Refuge Pointe
	["{object:2685} flight master"] = "Maître de vol de {object:2685}",

	-- Step 52: Gavin's Naze
	["Gavin's Naze"] = "Cap de Gavin",
	-- {quest:538} Southshore · {npc:2306} Baron Vardus
	["Follow the road north out of {quest:538} into the mountains. Mountain lions roam the slopes; the Syndicate in Strahnbrad wear the signet rings, and {npc:2306} walks the manor grounds on the north side of town."] = "Suivez la route vers le nord depuis {quest:538} jusqu'aux montagnes. Des lions des montagnes rodent sur les pentes ; le Syndicat à Strahnbrad porte les anneaux sigillaires, et {npc:2306} se promène dans le domaine du manoir au nord de la ville.",

	-- Step 53: Ruins of Alterac: kill these as you meet them
	["Ruins of Alterac: kill these as you meet them"] = "Ruines d'Alterac : tuez-les au fur et à mesure",
	-- plural, as words: Argus Shadow Mages = {npc:2318} Argus Shadow Mage · Crushridge Warmongers = {npc:2287} Crushridge Warmonger
	["The tomes lie in the ruined keep west of Strahnbrad; Argus Shadow Mages hold the ruins.\nCareful: Crushridge Warmongers call nearby allies within 15 yd once they fall below half health."] = "Les tomes se trouvent dans le donjon en ruine à l'ouest de Strahnbrad ; des mages de l'ombre Argus occupent les ruines.\nAttention : les belliqueux Crêtecrin appellent les alliés proches dans un rayon de 15 m une fois leur vie descendue sous la moitié.",
	-- {item:3658} Recovered Tome
	["{item:3658}: Crushridge ogres"] = "{item:3658} : ogres Cassecrête",
	-- {item:3659} Worn Leather Book · {object:1760} Weathered Bookcase
	["{item:3659}: the {object:1760}; inside"] = "{item:3659} : {object:1760} ; à l'intérieur",

	-- Step 54: Ruins of Alterac: kill these as you meet them
	-- {npc:2417} Grel'borg the Miser
	["These are elite mobs: grouping up is encouraged, look for people to do it with. {npc:2417} is a level 40 elite: most classes solo it at level 42, but you may need help. Skip it if you are alone: the route has you grind the XP back."] = "Ce sont des monstres élites : il est conseillé de se grouper, cherchez des joueurs avec qui le faire. {npc:2417} est un élite de niveau 40 : la plupart des classes le battent seules au niveau 42, mais vous aurez peut-être besoin d'aide. Passez-le si vous êtes seul : l'itinéraire vous fait regagner l'expérience en tuant des monstres.",

	-- Step 55: Strahnbrad: kill these as you meet them
	["Strahnbrad: kill these as you meet them"] = "Strahnbrad : tuez-les au fur et à mesure",
	-- {npc:2320} Nagaz
	["Careful: Syndicate Spies and Assassins can be stealthed. Assassins also poison you.\nCareful: About three stealthed Syndicate mobs are inside {npc:2320}'s house. {npc:2320} does not join when they are pulled, and a ranged attack through the doorway brings him out by himself."] = "Attention : les Espions et les Assassins du Syndicat peuvent être camouflés. Les Assassins vous empoisonnent aussi.\nAttention : environ trois membres du Syndicat camouflés se trouvent dans la maison de {npc:2320}. {npc:2320} ne se joint pas au combat quand vous les attirez, et une attaque à distance par la porte le fait sortir seul.",

	-- Step 56: Crushridge ogres
	["Crushridge ogres"] = "Ogres Cassecrête",
	-- {item:3706} Ensorcelled Parchment · {npc:2320} Nagaz · {quest:537} Dark Council
	["The Crushridge ogres hold the hills north of Strahnbrad. Farther north, a worn wooden chest holds the {item:3706}; {npc:2320} of the {quest:537} stands right by it."] = "Les ogres Crêtecrin occupent les collines au nord de Strahnbrad. Plus au nord, une caisse en bois usée contient le {item:3706} ; {npc:2320} du {quest:537} se tient juste à côté.",
	["Inside"] = "À l'intérieur",

	-- Step 58: Dalaran
	["Dalaran"] = "Dalaran",
	-- {zone:1421} Silverpine Forest · {npc:269127} Image of Archmage Modera
	["South-west to the Kirin Tor camp on the lake shore west of Dalaran, just over the border into {zone:1421}: the {npc:269127} stands there. Archmage Ansirem stands south-east of it, by the dome."] = "Au sud-ouest, au camp du Kirin Tor sur la rive du lac à l'ouest de Dalaran, juste au-delà de la frontière dans {zone:1421} : le {npc:269127} s'y trouve. L'archimage Ansirem se tient au sud-est, près du dôme.",
	-- {npc:2542} Catelyn the Blade · {object:3204} Booty Bay
	["For {npc:2542} in {object:3204}: keep it"] = "Pour {npc:2542} à {object:3204} : gardez-le",

	-- Step 60: Southshore
	-- {item:2321} Fine Thread · {npc:2438} Bartolo Ginsetti · {npc:2381} Micha Yance
	["{item:2321} for {npc:2438}'s cloak, from {npc:2381}, if you have none"] = "{item:2321} pour la cape de {npc:2438}, chez {npc:2381}, si vous n'en avez pas",
	-- {npc:1440} Milton Sheaf · {zone:1453} Stormwind
	["For {npc:1440} in {zone:1453}: keep it"] = "Pour {npc:1440} à {zone:1453} : gardez-la",

	-- Step 65: Thelsamar
	["Thelsamar"] = "Thelsamar",
	-- {zone:1455} Ironforge · {zone:1426} Dun Morogh · {zone:1432} Loch Modan
	["From {zone:1455} take the tunnel east through {zone:1426} into {zone:1432} and follow the road to Thelsamar."] = "Depuis {zone:1455}, prenez le tunnel vers l'est à travers {zone:1426} jusqu'à {zone:1432} et suivez la route jusqu'à Thelsamar.",
	-- {npc:1470} Ghak Healtouch
	["{npc:1470}, below ground"] = "{npc:1470}, sous terre",

	-- Step 66: Prospector Ironband
	["South-east along the loch to the dig site."] = "Longez le loch vers le sud-est jusqu'au site de fouilles.",
}
