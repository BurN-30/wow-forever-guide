-- French (frFR): the guide groupe-alliance/10b-gnomeregan (guides/10b-gnomeregan.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["Group 10b · Gnomeregan (dungeon 29-33, optional)"] = "Groupe 10b · Gnomeregan (donjon 29-33, facultatif)",

	-- Step 1: Ironforge: Gnomeregan quests
	-- {zone:1455} Ironforge
	["{zone:1455}: Gnomeregan quests"] = "{zone:1455} : quêtes de Gnomeregan",
	-- {zone:1426} Dun Morogh · {npc:7800} Mekgineer Thermaplugg · {object:171524} Tinker Town · {zone:1437} Wetlands · {object:1162} Menethil Harbor · {zone:1455} Ironforge
	["Gnomeregan: a 5-player dungeon under {zone:1426}, best at 29 to 33; {npc:7800}, the last boss, is 34. Every quest giver stands in {object:171524}. From the {zone:1437}: fly from {object:1162} to {zone:1455}. Alone? Skip it: the guide goes on to Dalaran."] = "Gnomeregan : un donjon pour 5 joueurs sous {zone:1426}, idéal de 29 à 33 ; {npc:7800}, le dernier boss, est niveau 34. Tous les donneurs sont à {object:171524}. Depuis {zone:1437} : vol de {object:1162} à {zone:1455}. Seul ? Le passer : le guide continue vers Dalaran.",
	["Keep 8 free quest log slots. Every player takes the quests from the givers; sharing works too."] = "Garder 8 places libres dans le journal. Chaque joueur prend les quêtes auprès des donneurs ; le partage marche aussi.",
	-- {npc:6569} Gnoarn · {npc:1268} Ozzie Togglevolt
	["{npc:6569}: for {npc:1268} in Kharanos"] = "{npc:6569} : pour {npc:1268} à Kharanos",
	-- {npc:6169} Klockmort Spannerspan · {zone:1457} Darnassus
	["{npc:6169}: not offered without Mathiel's errand from {zone:1457}? Carry on without it"] = "{npc:6169} : pas proposée sans la course de Mathiel à {zone:1457} ? Continuer sans elle",

	-- Step 2: Kharanos: Ozzie Togglevolt
	-- {npc:1268} Ozzie Togglevolt
	["Kharanos: {npc:1268}"] = "Kharanos : {npc:1268}",
	-- {zone:1455} Ironforge
	["Ride out of {zone:1455} down to Kharanos. Ozzie hands you an empty lead phial for the fallout."] = "Sortir de {zone:1455} et descendre à Kharanos. Ozzie remet une fiole en plomb vide pour les retombées.",

	-- Step 3: The Gnomeregan outskirts
	["The Gnomeregan outskirts"] = "Les abords de Gnomeregan",
	-- {item:9283} Empty Leaden Collection Phial
	-- plural, as words: Irradiated Invaders = {npc:6213} Irradiated Invader
	["West of Kharanos, before the dungeon's door. Irradiated Invaders (elite 24) roam the outskirts: target one and use the {item:9283} from your bags to fill it."] = "À l'ouest de Kharanos, devant la porte du donjon. Les envahisseurs irradiés (élites 24) rôdent aux abords : en cibler un et utiliser {item:9283} depuis les sacs pour la remplir.",
	-- {quest:2930} Data Rescue
	-- plural, as words: White Punch Cards = {item:9279} White Punch Card · Irradiated Invaders = {npc:6213} Irradiated Invader
	["White Punch Cards, for {quest:2930}, drop from the Irradiated Invaders too (about 1 in 10): keep one."] = "Les cartes perforées blanches, pour {quest:2930}, tombent aussi sur les envahisseurs irradiés (environ 1 fois sur 10) : en garder une.",
	-- {item:9284} Full Leaden Collection Phial · {npc:6213} Irradiated Invader
	["{item:9284}: use the empty phial on an {npc:6213}"] = "{item:9284} : utiliser la fiole vide sur un {npc:6213}",

	-- Step 4: Gnomeregan: before going in
	["Gnomeregan: before going in"] = "Gnomeregan : avant d'entrer",
	["Group of 5 at 29 to 33. Everything inside is elite and the mechanical foes hit hard."] = "Groupe de 5 de 29 à 33. Tout est élite à l'intérieur et les ennemis mécaniques frappent fort.",
	-- {quest:2929} The Grand Betrayal · {quest:2930} Data Rescue · {quest:2922} Save Techbot's Brain! · {object:171524} Tinker Town · {quest:2928} Gyrodrillmatic Excavationators · {npc:6579} Shoni the Shilent · {zone:1453} Stormwind · {quest:2924} Essential Artificials · {npc:6169} Klockmort Spannerspan · {item:9279} White Punch Card · {item:9308} Grime-Encrusted Object · {object:142487} Sparklematic 5200
	["In the quest log before going in: {quest:2929}, {quest:2930} and {quest:2922} ({object:171524}). If you took them: {quest:2928} ({npc:6579}, {zone:1453}, Group 9) and {quest:2924} ({npc:6169}, {object:171524}). Bring a {item:9279} if you have one, and 3 silver per {item:9308} you want to put in the {object:142487}."] = "Dans le journal avant d'entrer : {quest:2929}, {quest:2930} et {quest:2922} ({object:171524}). Si elles ont été prises : {quest:2928} ({npc:6579}, {zone:1453}, Groupe 9) et {quest:2924} ({npc:6169}, {object:171524}). Apporter une {item:9279} si possible, et 3 pièces d'argent par {item:9308} à mettre dans {object:142487}.",
	["Gnomeregan"] = "Gnomeregan",

	-- Step 5: Gnomeregan: along the way
	["Gnomeregan: along the way"] = "Gnomeregan : en chemin",
	-- {item:9309} Robo-mechanical Guts · {item:9279} White Punch Card · {quest:2924} Essential Artificials · {npc:6231} Techbot · {item:9316} Prismatic Punch Card · {object:142487} Sparklematic 5200 · {quest:2945} Grime-Encrusted Ring · {npc:7850} Kernobee · {object:3204} Booty Bay
	-- plural, as words: Irradiated Invaders = {npc:6213} Irradiated Invader · Dark Iron Agents = {npc:6212} Dark Iron Agent · Addled Lepers = {npc:6221} Addled Leper · Artificial Extrapolators = {object:142344} Artificial Extrapolator
	["Collected all through the dungeon. {item:9309}: the Caverndeep troggs, the Irradiated Invaders and the Dark Iron Agents, about 4 kills in 5. {item:9279}: the Caverndeep troggs and the Addled Lepers, about 1 kill in 10. {quest:2924}: from the Artificial Extrapolators, machines on the floor (where: to check in game).\n{npc:6231} (elite 26): Polestar's data place him in the outskirts, the original game inside, near the start (to check in game). His Memory Core drops for every player on the quest.\nEach Matrix Punchograph 3005 turns one card into the next: A the White card into a Yellow one, B the Yellow into a Blue one, C the Blue into a Red one, D the Red into the {item:9316}. They stand along the way, D last, near the end (places and order of the original game: to check in game).\nThe Clean Zone, where the gnomes who stayed sheltered, holds the {object:142487}: put the {quest:2945} in it to clean it (the Sparklematic's own quests for the other grimy objects cost 3 silver each and give a random box: optional, not in the guide). {npc:7850}, a gnome to rescue, is inside too (where: to check in game): escort him to the Clockwerk Run exit, his reward waits at {object:3204}, on the route of Group 15."] = "À ramasser dans tout le donjon. {item:9309} : les troggs, les envahisseurs irradiés et les agents Sombrefer, environ 4 fois sur 5. {item:9279} : les troggs et les lépreux, environ 1 fois sur 10. {quest:2924} : sur les extrapolateurs (Artificial Extrapolator), des machines posées au sol (où : à vérifier en jeu).\n{npc:6231} (élite 26) : les données de Polestar le placent aux abords, le jeu d'origine à l'intérieur, près du début (à vérifier en jeu). Son noyau de mémoire tombe pour chaque joueur qui a la quête.\nChaque perforatrice (Matrix Punchograph 3005) change une carte en la suivante : A la blanche en jaune, B la jaune en bleue, C la bleue en rouge, D la rouge en {item:9316}. Elles sont sur le chemin, D en dernier, vers la fin (places et ordre du jeu d'origine : à vérifier en jeu).\nLa zone propre (Clean Zone), où se sont abrités les gnomes restés sur place, abrite {object:142487} : y mettre {quest:2945} pour le nettoyer (les quêtes de la machine pour les autres objets crasseux coûtent 3 pièces d'argent chacune et donnent une boîte au hasard : facultatif, hors du guide). {npc:7850}, un gnome à secourir, est aussi à l'intérieur (où : à vérifier en jeu) : l'escorter jusqu'à la sortie de Clockwerk Run, sa récompense attend à {object:3204}, sur le parcours du Groupe 15.",
	["Every player with the quest loots their own. Share the quests with your group: click each in the quest log, then Share."] = "Chaque joueur qui a la quête ramasse les siens. Partager les quêtes avec le groupe : clic sur chacune dans le journal, puis Partager.",
	-- {item:9277} Techbot's Memory Core · {npc:6231} Techbot
	["{item:9277}: {npc:6231}, elite 26"] = "{item:9277} : {npc:6231}, élite 26",
	-- {item:9316} Prismatic Punch Card · {object:142696} Matrix Punchograph 3005-D
	["{item:9316}: from the {object:142696}"] = "{item:9316} : dans {object:142696}",
	-- {item:9309} Robo-mechanical Guts
	["{item:9309}: the quest log gives the count"] = "{item:9309} : le journal donne le nombre",
	-- {item:9279} White Punch Card
	-- plural, as words: Addled Lepers = {npc:6221} Addled Leper
	["{item:9279}: Caverndeep troggs, Addled Lepers"] = "{item:9279} : troggs, lépreux",
	-- {item:9278} Essential Artificial
	-- plural, as words: Artificial Extrapolators = {object:142344} Artificial Extrapolator
	["{item:9278}: Artificial Extrapolators"] = "{item:9278} : extrapolateurs (Artificial Extrapolator)",
	-- {quest:2945} Grime-Encrusted Ring
	-- plural, as words: Dark Iron Agents = {npc:6212} Dark Iron Agent
	["{quest:2945}, a drop from the Dark Iron Agents: right-click it"] = "{quest:2945}, sur les agents Sombrefer : clic droit dessus",
	-- {quest:2947} Return of the Ring · {npc:6826} Talvash del Kissel · {zone:1455} Ironforge
	["{quest:2947}: for {npc:6826} in {zone:1455}"] = "{quest:2947} : pour {npc:6826} à {zone:1455}",
	-- {npc:7850} Kernobee
	["Escort {npc:7850} to the Clockwerk Run exit"] = "Escorter {npc:7850} jusqu'à la sortie de Clockwerk Run",

	-- Step 6: Gnomeregan: Mekgineer Thermaplugg
	-- {npc:7800} Mekgineer Thermaplugg
	["Gnomeregan: {npc:7800}"] = "Gnomeregan : {npc:7800}",
	-- {npc:6235} Electrocutioner 6000 · {npc:6229} Crowd Pummeler 9-60
	["The {npc:6235} and the {npc:6229} come before him (the codex's order). Thermaplugg (elite 34) calls bombs out of the walls: in the original game someone stops each new one by clicking the button below it while the others fight (to check in game)."] = "{npc:6235} et {npc:6229} viennent avant lui (ordre du codex). Thermaplugg (élite 34) fait sortir des bombes des murs : dans le jeu d'origine, un joueur arrête chaque nouvelle en cliquant le bouton sous elle pendant que les autres se battent (à vérifier en jeu).",

	-- Step 7: Kharanos: Ozzie Togglevolt
	-- {zone:1455} Ironforge
	["Out of Gnomeregan and east to Kharanos, on the way back to {zone:1455}. His next quest, The Only Cure is More Green Glow, would need another trip inside: not in the guide."] = "Sortir de Gnomeregan et aller à l'est jusqu'à Kharanos, sur le chemin de {zone:1455}. Sa quête suivante, The Only Cure is More Green Glow, demanderait un second passage dans le donjon : hors du guide.",

	-- Step 12: Mystic Ward: Talvash del Kissel
	-- {quest:2947} Return of the Ring · {npc:6826} Talvash del Kissel · {object:32362} Mystic Ward · {item:2842} Silver Bar · {item:1206} Moss Agate
	["{quest:2947}: {npc:6826} is in the {object:32362}. His next quest, Gnome Improvement, asks for a {item:2842} and a {item:1206}: not in the guide."] = "{quest:2947} : {npc:6826} est dans {object:32362}. Sa quête suivante, Gnome Improvement, demande {item:2842} et {item:1206} : hors du guide.",

	-- Step 13: Stormwind: Shoni the Shilent
	-- {zone:1453} Stormwind · {npc:6579} Shoni the Shilent · {object:28027} Dwarven District
	["Take the Deeprun Tram to {zone:1453}: {npc:6579} is in the {object:28027}, by the tram. Group 11 (Dalaran) starts in {zone:1453}."] = "Prendre le tram pour {zone:1453} : {npc:6579} est dans {object:28027}, près du tram. Le Groupe 11 (Dalaran) commence à {zone:1453}.",
}
