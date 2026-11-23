-- French (frFR): the guide groupe-alliance/10b-gnomeregan (guides/10b-gnomeregan.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["Dungeon · Gnomeregan (29-35)"] = "Donjon · Gnomeregan (29-35)",

	-- Step 1: Stormwind: Shoni the Shilent
	-- {zone:1426} Dun Morogh · {npc:7800} Mekgineer Thermaplugg · {npc:6579} Shoni the Shilent · {object:28027} Dwarven District · {object:171524} Tinker Town · {zone:1455} Ironforge
	["Gnomeregan: a 5-player dungeon under {zone:1426}, levels 29 to 38 in the group finder, best from about 31; {npc:7800}, the last boss, is 34. {npc:6579} stands by the tram in the {object:28027}; every other giver is in {object:171524}, at the {zone:1455} end of the tram."] = "Gnomeregan : un donjon pour 5 joueurs sous {zone:1426}, niveaux 29 à 38 dans la recherche de groupe, idéal à partir de 31 environ ; {npc:7800}, le dernier boss, est de niveau 34. {npc:6579} se tient près du tram, dans {object:28027} ; tous les autres donneurs sont à {object:171524}, au bout du tram côté {zone:1455}.",
	-- {quest:2926} Gnogaine
	["Keep 9 free quest log slots. Every quest can be shared except {quest:2926} and its follow-up: each player takes those from Ozzie."] = "Garder 9 places libres dans le journal. Toutes les quêtes se partagent sauf {quest:2926} et sa suite : chaque joueur les prend chez Ozzie.",

	-- Step 2: Stormwind: two quests for the City of Dalaran (optional)
	-- {zone:1453} Stormwind
	["{zone:1453}: two quests for the City of Dalaran (optional)"] = "{zone:1453} : deux quêtes pour la Cité de Dalaran (facultatif)",
	-- {zone:1416} Alterac Mountains · {zone:1453} Stormwind · {npc:5502} Shylamiir · {object:2096} Trade District · {npc:5694} High Sorcerer Andromath · {object:2101} Mage Quarter
	["The City of Dalaran, a Forever dungeon in the {zone:1416}, has two {zone:1453} quests: about 18,800 XP. Its chapter comes once An Alarming Request is taken in Southshore (about 31). {npc:5502} is in the {object:2096}, {npc:5694} in the {object:2101} tower; the hand-ins wait for the route's next {zone:1453} stop."] = "La Cité de Dalaran, un donjon de Forever dans les {zone:1416}, a deux quêtes à {zone:1453} : environ 18 800 XP. Son chapitre vient une fois Une requête alarmante (An Alarming Request) prise à Austrivage (vers 31). {npc:5502} est dans le {object:2096}, {npc:5694} dans la tour du {object:2101} ; les rendus attendent le prochain arrêt du parcours à {zone:1453}.",

	-- Step 3: Ironforge: Gnomeregan quests
	-- {zone:1455} Ironforge
	["{zone:1455}: Gnomeregan quests"] = "{zone:1455} : quêtes de Gnomeregan",
	-- {zone:1455} Ironforge · {object:171524} Tinker Town
	["The Deeprun Tram to {zone:1455}, then {object:171524}, right by the tram."] = "Le Tram des profondeurs jusqu'à {zone:1455}, puis {object:171524}, juste à côté du tram.",
	-- {zone:1455} Ironforge
	["Tram to {zone:1455}"] = "Tram pour {zone:1455}",
	-- {npc:6569} Gnoarn · {npc:1268} Ozzie Togglevolt
	["{npc:6569}: for {npc:1268} in Kharanos"] = "{npc:6569} : pour {npc:1268} à Kharanos",
	-- {npc:6169} Klockmort Spannerspan · {zone:1457} Darnassus
	["{npc:6169}: not offered without Mathiel's errand from {zone:1457}? Carry on without it"] = "{npc:6169} : pas proposée sans la course de Mathiel à {zone:1457} ? Continuer sans elle",

	-- Step 4: Kharanos: Ozzie Togglevolt
	-- {npc:1268} Ozzie Togglevolt
	["Kharanos: {npc:1268}"] = "Kharanos : {npc:1268}",
	-- {zone:1455} Ironforge · {item:9283} Empty Leaden Collection Phial
	["Ride out of {zone:1455} down to Kharanos. Ozzie hands you an {item:9283}."] = "Sortir de {zone:1455} et descendre à Kharanos. Ozzie remet {item:9283}.",

	-- Step 5: The Gnomeregan outskirts
	["The Gnomeregan outskirts"] = "Les abords de Gnomeregan",
	-- {npc:6213} Irradiated Invader · {item:9283} Empty Leaden Collection Phial · {npc:6231} Techbot · {quest:2930} Data Rescue · {item:9279} White Punch Card · {object:142345} Matrix Punchograph 3005-A · {item:9280} Yellow Punch Card
	["West of Kharanos, the paths down to the dungeon's portal, outside the instance. Kill an {npc:6213} (green glow, elite 24) and use the {item:9283} on its corpse. {npc:6231} (elite 26) has his own room off the northern part of these paths: his Memory Core drops for every player on the quest.\n{quest:2930} starts out here too: the {item:9279} drops from the troggs and lepers of the outskirts (about 1 kill in 10), and {object:142345}, a machine also outside the portal, turns it into a {item:9280}."] = "À l'ouest de Kharanos, les chemins qui descendent vers le portail du donjon, hors de l'instance. Tuer un {npc:6213} (lueur verte, élite 24) et utiliser la {item:9283} sur son cadavre. {npc:6231} (élite 26) a sa propre salle au nord de ces chemins : son noyau de mémoire tombe pour chaque joueur qui a la quête.\n{quest:2930} commence aussi dehors : la {item:9279} tombe des troggs et des lépreux des abords (environ 1 sur 10), et la matrice d'encodage 3005-A, une machine elle aussi hors du portail, la change en {item:9280}.",
	-- {item:9284} Full Leaden Collection Phial · {npc:6213} Irradiated Invader
	["{item:9284}: the empty phial, on an {npc:6213}'s corpse"] = "{item:9284} : la fiole vide, sur le cadavre d'un {npc:6213}",
	-- {item:9277} Techbot's Memory Core · {npc:6231} Techbot
	["{item:9277}: {npc:6231}, elite 26"] = "{item:9277} : {npc:6231}, élite 26",
	-- {item:9279} White Punch Card
	["{item:9279}: troggs and lepers"] = "{item:9279} : troggs et lépreux",
	-- {item:9280} Yellow Punch Card · {object:142345} Matrix Punchograph 3005-A
	["{item:9280}: the White one, at {object:142345}"] = "{item:9280} : la blanche, dans la matrice d'encodage 3005-A",

	-- Step 6: Kharanos: The Only Cure is More Green Glow (optional detour)
	-- {quest:2962} The Only Cure is More Green Glow
	["Kharanos: {quest:2962} (optional detour)"] = "Kharanos : {quest:2962} (détour facultatif)",
	-- {quest:2926} Gnogaine · {item:9364} Heavy Leaden Collection Phial
	["{quest:2926} is done outside the dungeon, so it can be handed in now: back to Kharanos, then back to the portal, about two rides of a couple of minutes. Ozzie's next quest is done inside: use his {item:9364} on a LIVING irradiated slime or horror, and the fallout lasts two hours, enough for the run and the ride back. Not each player's cup of tea? Skip it: {quest:2926} is handed in after the run."] = "{quest:2926} se fait hors du donjon, elle peut donc se rendre maintenant : retour à Kharanos, puis retour au portail, deux trajets de quelques minutes. La quête suivante d'Ozzie se fait à l'intérieur : utiliser sa {item:9364} sur un limon ou une horreur irradiés VIVANTS ; les retombées durent deux heures, assez pour le donjon et le retour. Pas envie ? La passer : {quest:2926} se rend après le donjon.",

	-- Step 7: Kharanos: Ozzie's next quest
	["Kharanos: Ozzie's next quest"] = "Kharanos : la quête suivante d'Ozzie",
	-- {npc:1268} Ozzie Togglevolt
	["{npc:1268}: then back to the portal"] = "{npc:1268} : puis retour au portail",

	-- Step 8: Gnomeregan: before going in
	["Gnomeregan: before going in"] = "Gnomeregan : avant d'entrer",
	["Group of 5, levels 29 to 38 in the group finder. Everything inside is elite and the mechanical foes hit hard."] = "Groupe de 5, niveaux 29 à 38 dans la recherche de groupe. Tout est élite à l'intérieur et les machines frappent fort.",
	-- {quest:2928} Gyrodrillmatic Excavationators · {npc:6579} Shoni the Shilent · {zone:1453} Stormwind · {quest:2929} The Grand Betrayal · {quest:2930} Data Rescue · {quest:2922} Save Techbot's Brain! · {object:171524} Tinker Town · {quest:2926} Gnogaine · {quest:2924} Essential Artificials · {npc:6169} Klockmort Spannerspan · {quest:2962} The Only Cure is More Green Glow · {item:9280} Yellow Punch Card · {item:9308} Grime-Encrusted Object · {object:142487} Sparklematic 5200
	["In the quest log before going in: {quest:2928} ({npc:6579}, {zone:1453}), {quest:2929}, {quest:2930} and {quest:2922} ({object:171524}), {quest:2926} (Ozzie, Kharanos). If you took them: {quest:2924} ({npc:6169}, {object:171524}), {quest:2962} (Ozzie, Kharanos). Bring the {item:9280} (or the White one), and 3 silver per {item:9308} you want to put in the {object:142487}."] = "Dans le journal avant d'entrer : {quest:2928} ({npc:6579}, {zone:1453}), {quest:2929}, {quest:2930} et {quest:2922} ({object:171524}), {quest:2926} (Ozzie, Kharanos). Si elles ont été prises : {quest:2924} ({npc:6169}, {object:171524}), {quest:2962} (Ozzie, Kharanos). Apporter la {item:9280} (ou la blanche), et 3 pièces d'argent par {item:9308} à mettre dans {object:142487}.",
	["Gnomeregan"] = "Gnomeregan",

	-- Step 9: Gnomeregan: along the way
	["Gnomeregan: along the way"] = "Gnomeregan : en chemin",
	-- {item:9309} Robo-mechanical Guts · {npc:6579} Shoni the Shilent · {quest:2924} Essential Artificials
	-- plural, as words: Artificial Extrapolators = {object:142344} Artificial Extrapolator
	["Collected all through the dungeon. {item:9309} (24 for {npc:6579}): the troggs, slimes, leper gnomes and machines. {quest:2924}: the Artificial Extrapolators, rectangular boxes on the floor all around the dungeon; each one vanishes once used, so a full group on the quest may have to search the whole dungeon. Every player with the quest loots their own."] = "À ramasser dans tout le donjon. {item:9309} (24 pour {npc:6579}) : les troggs, limons, gnomes lépreux et machines. {quest:2924} : les extrapolateurs (Artificial Extrapolator), des boîtes rectangulaires posées au sol partout dans le donjon ; chacune disparaît une fois utilisée, un groupe entier sur la quête doit donc parfois fouiller tout le donjon. Chaque joueur qui a la quête ramasse les siens.",
	["Share the quests with your group: click each in the quest log, then Share."] = "Partager les quêtes avec le groupe : clic sur chacune dans le journal, puis Partager.",
	-- {item:9278} Essential Artificial
	-- plural, as words: Artificial Extrapolators = {object:142344} Artificial Extrapolator
	["{item:9278}: Artificial Extrapolators"] = "{item:9278} : extrapolateurs (Artificial Extrapolator)",
	-- {item:9365} High Potency Radioactive Fallout
	["{item:9365}: the heavy phial, on a living irradiated slime or horror"] = "{item:9365} : la fiole lourde, sur un limon ou une horreur irradiés vivants",
	-- {quest:2945} Grime-Encrusted Ring
	-- plural, as words: Dark Iron Agents = {npc:6212} Dark Iron Agent
	["{quest:2945}, a drop from the Dark Iron Agents: right-click it"] = "{quest:2945}, sur les agents Sombrefer : clic droit dessus",

	-- Step 10: Gnomeregan: the Sparklematic, the Dormitory and the Clean Room
	["Gnomeregan: the Sparklematic, the Dormitory and the Clean Room"] = "Gnomeregan : le Sparklematic, le dortoir et la salle propre",
	-- {object:142487} Sparklematic 5200 · {quest:2945} Grime-Encrusted Ring · {npc:7850} Kernobee · {npc:7079} Viscous Fallout · {object:3204} Booty Bay · {object:142475} Matrix Punchograph 3005-B
	["{object:142487} machines stand in the room before the Dormitory: put the {quest:2945} in one to clean it. In the Dormitory, {npc:7850} waits before the {npc:7079} room: his escort runs all the way back to the dungeon's entrance; near the end a countdown starts, get him out before it reaches zero. His reward waits at {object:3204}, where the route goes at about 33. {object:142475}, in the Dormitory south of the Clean Room, turns the Yellow card into a Blue one."] = "Les machines {object:142487} sont dans la salle avant le dortoir : mettre l'{quest:2945} dans l'une d'elles pour le nettoyer. Dans le dortoir, {npc:7850} attend avant la salle de {npc:7079} : son escorte ramène jusqu'à l'entrée du donjon ; vers la fin, un compte à rebours démarre, le sortir avant zéro. Sa récompense attend à Baie-du-Butin, où le parcours passe vers 33. La matrice d'encodage 3005-B, dans le dortoir au sud de la salle blanche, change la carte jaune en bleue.",
	-- {npc:7079} Viscous Fallout
	["{npc:7079}, in the Clean Room"] = "{npc:7079}, dans la salle propre",
	-- {item:9282} Blue Punch Card · {object:142475} Matrix Punchograph 3005-B
	["{item:9282}: the Yellow one, at {object:142475}"] = "{item:9282} : la jaune, dans la matrice d'encodage 3005-B",
	-- {quest:2947} Return of the Ring · {npc:6826} Talvash del Kissel · {zone:1455} Ironforge
	["{quest:2947}: for {npc:6826} in {zone:1455}"] = "{quest:2947} : pour {npc:6826} à {zone:1455}",
	-- {npc:7850} Kernobee
	["Escort {npc:7850} back to the entrance"] = "Escorter {npc:7850} jusqu'à l'entrée",

	-- Step 11: Gnomeregan: the Launch Bay
	["Gnomeregan: the Launch Bay"] = "Gnomeregan : la baie de lancement",
	-- {npc:6235} Electrocutioner 6000 · {object:142476} Matrix Punchograph 3005-C
	["{npc:6235} stands on the Launch Bay platform; {object:142476}, on the same platform, turns the Blue card into a Red one."] = "{npc:6235} se tient sur la plateforme de la baie de lancement ; la matrice d'encodage 3005-C, sur la même plateforme, change la carte bleue en rouge.",
	-- {item:9281} Red Punch Card · {object:142476} Matrix Punchograph 3005-C
	["{item:9281}: the Blue one, at {object:142476}"] = "{item:9281} : la bleue, dans la matrice d'encodage 3005-C",

	-- Step 12: Gnomeregan: the Engineering Labs
	["Gnomeregan: the Engineering Labs"] = "Gnomeregan : les laboratoires d'ingénierie",
	-- {npc:6229} Crowd Pummeler 9-60 · {object:142696} Matrix Punchograph 3005-D · {item:9316} Prismatic Punch Card
	["The {npc:6229} fights in the Engineering Labs; {object:142696}, on the lower level of that room, turns the Red card into the {item:9316}."] = "{npc:6229} combat dans les laboratoires d'ingénierie ; {object:142696}, au niveau inférieur de cette salle, change la carte rouge en {item:9316}.",
	-- {item:9316} Prismatic Punch Card · {object:142696} Matrix Punchograph 3005-D
	["{item:9316}: the Red one, at {object:142696}"] = "{item:9316} : la rouge, dans {object:142696}",

	-- Step 13: Gnomeregan: Mekgineer Thermaplugg
	-- {npc:7800} Mekgineer Thermaplugg
	["Gnomeregan: {npc:7800}"] = "Gnomeregan : {npc:7800}",
	-- plural, as words: Walking Bombs = {npc:7915} Walking Bomb
	["The last boss. Tank Thermaplugg (elite 34) in the middle of the room: his Walking Bombs then take longer to reach the group; ranged players kill them. They come faster at half health and faster still at 20 %. Overwhelmed? A button on the pillars around the room stops them for a while: give that job to one ranged player. After each knock-back his threat resets: let the tank take him back."] = "Le dernier boss. Tanker Thermaplugg (élite 34) au milieu de la salle : ses bombes ambulantes mettent alors plus de temps à atteindre le groupe ; les joueurs à distance les tuent. Elles arrivent plus vite à mi-vie, plus vite encore à 20 %. Débordés ? Un bouton sur les piliers autour de la salle les arrête un moment : confier ce rôle à un joueur à distance. Après chaque projection, sa menace repart de zéro : laisser le tank le reprendre.",

	-- Step 14: Kharanos: Ozzie Togglevolt
	-- {zone:1455} Ironforge
	["Out of Gnomeregan and east to Kharanos, on the way back to {zone:1455}."] = "Sortir de Gnomeregan et aller à l'est jusqu'à Kharanos, sur le chemin de {zone:1455}.",

	-- Step 15: Kharanos: Ozzie Togglevolt (Green Glow)
	-- {npc:1268} Ozzie Togglevolt
	["Kharanos: {npc:1268} (Green Glow)"] = "Kharanos : {npc:1268} (lueur verte)",
	["Out of Gnomeregan and east to Kharanos, within the two hours of the fallout."] = "Sortir de Gnomeregan et aller à l'est jusqu'à Kharanos, dans les deux heures des retombées.",

	-- Step 16: Tinker Town: the hand-ins
	-- {object:171524} Tinker Town
	["{object:171524}: the hand-ins"] = "{object:171524} : les rendus",
	-- {object:171524} Tinker Town · {zone:1455} Ironforge
	["Back to {object:171524} by {zone:1455}'s gate."] = "Retour à {object:171524} par la porte de {zone:1455}.",

	-- Step 19: Mystic Ward: Talvash del Kissel
	-- {quest:2947} Return of the Ring · {npc:6826} Talvash del Kissel · {object:32362} Mystic Ward · {item:2842} Silver Bar · {item:1206} Moss Agate
	["{quest:2947}: {npc:6826} is in the {object:32362}. His next quest, Gnome Improvement, asks for a {item:2842} and a {item:1206}: not in the guide."] = "{quest:2947} : {npc:6826} est dans {object:32362}. Sa quête suivante, Gnome Improvement, demande {item:2842} et {item:1206} : hors du guide.",

	-- Step 20: Stormwind: Shoni the Shilent
	-- {zone:1453} Stormwind · {npc:6579} Shoni the Shilent · {object:28027} Dwarven District
	["Take the Deeprun Tram to {zone:1453}: {npc:6579} is in the {object:28027}, by the tram. Last stop of the chapter: the route's own guide comes back once this is handed in."] = "Le Tram des profondeurs jusqu'à {zone:1453} : {npc:6579} est dans le {object:28027}, près du tram. Dernier arrêt du chapitre : le guide du parcours revient une fois la quête rendue.",

}
