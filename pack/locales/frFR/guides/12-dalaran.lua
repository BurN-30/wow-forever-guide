-- French (frFR): the guide groupe-alliance/12-dalaran (guides/12-dalaran.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["Dungeon · City of Dalaran (30-38)"] = "Donjon · Cité de Dalaran (30-38)",

	-- Step 1: Southshore: Emissary Jacques
	-- {npc:247264} Emissary Jacques
	["Southshore: {npc:247264}"] = "Austrivage : {npc:247264}",
	-- {zone:1416} Alterac Mountains · {npc:247264} Emissary Jacques · {npc:269127} Image of Archmage Modera
	["City of Dalaran: a 5-player Forever dungeon in the {zone:1416}, levels 28 to 35 in the group finder. {npc:247264}'s errand leads to the {npc:269127}, by the city's wall: she gives the dungeon's two quests and the key of its sewers. His quest needs level 30."] = "Cité de Dalaran : un donjon de Forever pour 5 joueurs dans les {zone:1416}, niveaux 28 à 35 dans la recherche de groupe. La course de {npc:247264} mène à l'{npc:269127}, au pied du mur de la ville : elle donne les deux quêtes du donjon et la clé de ses égouts. La quête de l'émissaire demande le niveau 30.",
	["Keep 4 free quest log slots."] = "Garder 4 places libres dans le journal de quêtes.",

	-- Step 2: Image of Archmage Modera
	-- {object:1772} Tarren Mill · {zone:1421} Silverpine Forest
	["North-west past Hillsbrad Fields and round Dalaran's dome, keeping clear of {object:1772}: the Kirin Tor camp is on the lake shore west of the city, just over the border into {zone:1421}."] = "Vers le nord-ouest par les champs de Hautebrande, puis autour du dôme de Dalaran, à l'écart de Moulin-de-Tarren : le camp du Kirin Tor est sur la rive du lac, à l'ouest de la ville, juste après la frontière de la {zone:1421}.",
	-- {quest:92458} Heart of Disruption · {item:277507} Dalaran Sewer Key
	["{quest:92458}: it brings the {item:277507}"] = "{quest:92458} : elle donne la {item:277507}",

	-- Step 3: Stormwind's two quests, for whoever took them
	-- {zone:1453} Stormwind
	["{zone:1453}'s two quests, for whoever took them"] = "Les deux quêtes de {zone:1453}, pour qui les a prises",

	-- Step 4: Power Overwhelming, for whoever took it
	-- {quest:92489} Power Overwhelming
	["{quest:92489}, for whoever took it"] = "{quest:92489}, pour qui l'a prise",

	-- Step 5: City of Dalaran: the sewer grate
	["City of Dalaran: the sewer grate"] = "Cité de Dalaran : la grille des égouts",
	["The way in is the sewer grate in the city's western wall, by the lake, 30 yards from Modera's camp: the key opens it for the group."] = "L'entrée est la grille des égouts dans le mur ouest de la ville, au bord du lac, à 30 mètres du camp de Modera : la clé l'ouvre pour tout le groupe.",
	-- {quest:92457} Starving Arcane · {quest:92458} Heart of Disruption · {quest:92456} A Green Sample · {quest:92489} Power Overwhelming · {zone:1453} Stormwind
	["In the log before going in: {quest:92457} and {quest:92458} (Modera); {quest:92456} and {quest:92489} for whoever took them in {zone:1453}. Share each quest with the group: click it in the quest log, then Share."] = "Dans le journal avant d'entrer : {quest:92457} et {quest:92458} (Modera) ; {quest:92456} et {quest:92489} pour qui les a prises à {zone:1453}. Partager chaque quête avec le groupe : clic sur la quête dans le journal, puis Partager.",
	["City of Dalaran"] = "Cité de Dalaran",

	-- Step 6: The sewers: Atrexis the Grave Knight
	-- {npc:247126} Atrexis the Grave Knight
	["The sewers: {npc:247126}"] = "Les égouts : {npc:247126}",
	-- {npc:5913} Tremor Totem · {npc:247126} Atrexis the Grave Knight
	-- plural, as words: Mindless Horrors = {npc:255068} Mindless Horror · Kirin Tor Necromancers = {npc:269134} Kirin Tor Necromancer
	["Inside the Cantrips & Crows, cross the bridge and turn right: three large pipes lead to the Underbelly. Mindless Horrors fear (a Shaman's {npc:5913} helps), Kirin Tor Necromancers raise skeletons two at a time: the tank picks them up. {npc:247126}, in the summoning circle, is a stronger necromancer: clear the undead around him without pulling him, then a Shaman can purge his Unholy Frenzy."] = "Depuis la taverne (Cantrips & Crows), traverser le pont et tourner à droite : trois grosses canalisations mènent aux Entrailles (Underbelly). Les Horreurs décérébrées font fuir de peur (le {npc:5913} d'un chaman aide), les Nécromanciens du Kirin Tor lèvent des squelettes deux par deux : le tank les reprend. {npc:247126}, dans le cercle d'invocation, est un nécromancien plus fort : nettoyer les morts-vivants autour de lui sans l'attirer ; un chaman peut purger sa Frénésie impie.",
	-- {item:275989} Tome of Dalaran · {object:1680} Shadowfang Keep · {npc:247032} Lyn the Ignored
	["The square room by the sewers' exit holds a summoning circle: only with a {item:275989} (from {object:1680}, a Horde dungeon) does it call the hidden boss, {npc:247032}."] = "La salle carrée près de la sortie des égouts abrite un cercle d'invocation : seul un {item:275989} (venu du donjon d'Ombrecroc, un donjon de la Horde) y appelle le boss caché, {npc:247032}.",

	-- Step 7: The streets of Dalaran: along the way
	["The streets of Dalaran: along the way"] = "Les rues de Dalaran : en chemin",

	-- Step 8: The Violet Hold: Mana Devourer
	-- {npc:246297} Violet Hold · {npc:246008} Mana Devourer
	["The {npc:246297}: {npc:246008}"] = "{npc:246297} : {npc:246008}",
	["Left from the sewers' exit. Clear every enemy of the hold first: they join the fight. The mana serpent drains the tank and hits the whole group now and then: heal through it."] = "À gauche en sortant des égouts. Nettoyer d'abord tous les ennemis du fort : ils rejoignent le combat. Le serpent de mana draine le tank et frappe tout le groupe de temps en temps : soigner sans relâche pendant ce temps.",
	-- {npc:247001} Saturated Remnant
	-- plural, as words: Saturated Remnants = {npc:247001} Saturated Remnant · Mana Fiends = {npc:15527} Mana Fiend · Mana Phantoms = {npc:246683} Mana Phantom
	["Out of the sewers, the arcane remnants are all over the streets: Seeking and Saturated Remnants for Modera. A {npc:247001} leaves a Mana Leak field when it dies (casters stand in it), Mana Fiends explode when they die (spread out), Mana Phantoms cast Mana Burn (interrupt it)."] = "Sortis des égouts, les résidus arcaniques sont partout dans les rues : les résidus chercheurs et saturés pour Modera. Un {npc:247001} laisse une zone de fuite de mana en mourant (les lanceurs de sorts s'y placent), les démons de mana explosent en mourant (s'écarter), les fantômes de mana lancent Brûlure de mana (l'interrompre).",

	-- Step 9: Krasus' Landing: Arcane Anomaly
	-- {npc:245999} Arcane Anomaly
	["Krasus' Landing: {npc:245999}"] = "Aire de Krasus : {npc:245999}",
	["Back out and right. Clear the landing, then everyone stands close behind the boss: its Focal Blast is a beam that turns round it, easy to walk round from up close."] = "Ressortir et prendre à droite. Nettoyer l'aire, puis tout le monde se place tout près, derrière le boss : sa Déflagration focalisée est un rayon qui tourne autour de lui, facile à contourner de près.",

	-- Step 10: Runeweaver Square: Fel Ancient
	-- {npc:246003} Fel Ancient
	["Runeweaver Square: {npc:246003}"] = "Place Tisserune : {npc:246003}",
	-- {npc:246708} Magus Fansy Goodbringer · {npc:246003} Fel Ancient · {item:251983} Fel Infused Blossom · {quest:92456} A Green Sample
	["Into the middle of the city from the east: {npc:246708}, by the magic shield, lowers it. The {npc:246003} roots two players and drops burning fel timber under them: a Druid's shapeshift or a Paladin's Blessing of Freedom frees them. The {item:251983} for {quest:92456} is one of the big green bulbs of the square."] = "Vers le centre de la ville par l'est : {npc:246708}, près du bouclier magique, le baisse. L'{npc:246003} immobilise deux joueurs et fait tomber du bois gangrené en feu sous eux : un changement de forme de druide ou la Bénédiction de liberté d'un paladin les libère. La {item:251983} de {quest:92456} est l'un des gros bulbes verts de la place.",
	-- {item:251983} Fel Infused Blossom · {quest:92456} A Green Sample · {npc:5502} Shylamiir · {zone:1453} Stormwind
	["{item:251983}: a green bulb of the square, for {quest:92456} ({npc:5502}, {zone:1453}, offered by the Gnomeregan chapter)"] = "{item:251983} : un bulbe vert de la place, pour {quest:92456} ({npc:5502}, {zone:1453}, proposée par le chapitre de Gnomeregan)",

	-- Step 11: Path of Renewal: Arcanic Enigma
	-- {npc:246016} Arcanic Enigma
	["Path of Renewal: {npc:246016}"] = "Chemin du Renouveau : {npc:246016}",
	-- plural, as words: Mana Phantoms = {npc:246683} Mana Phantom
	["Counter-clockwise to the north-east, by Antonidas's statue. Kill its two Mana Phantoms first. The Enigma polymorphs players and silences everyone close to it: ranged players keep away."] = "Dans le sens inverse des aiguilles d'une montre, vers le nord-est, près de la statue d'Antonidas. Tuer d'abord ses deux fantômes de mana. L'Énigme métamorphose des joueurs et réduit au silence tous ceux qui l'approchent : les joueurs à distance restent loin.",
	-- {npc:246016} Arcanic Enigma · {quest:92489} Power Overwhelming · {npc:5694} High Sorcerer Andromath · {zone:1453} Stormwind
	["{npc:246016}, for {quest:92489} ({npc:5694}, {zone:1453}, offered by the Gnomeregan chapter)"] = "{npc:246016}, pour {quest:92489} ({npc:5694}, {zone:1453}, proposée par le chapitre de Gnomeregan)",

	-- Step 12: Magus Commerce Exchange: Unstable Sentry
	["Magus Commerce Exchange: Unstable Sentry"] = "Comptoir des mages : la Sentinelle instable",
	["West through the city, in a nook of the market. Spread out; when it casts Malfunction, everyone but the tank steps well away."] = "Vers l'ouest à travers la ville, dans un recoin du marché. S'écarter les uns des autres ; quand elle lance Dysfonctionnement, tout le monde sauf le tank s'éloigne bien.",
	["Unstable Sentry"] = "Sentinelle instable",

	-- Step 13: The Violet Citadel: Shade of the Archmage
	-- {npc:246020} Shade of the Archmage
	["The Violet Citadel: {npc:246020}"] = "La Citadelle pourpre : {npc:246020}",
	-- {npc:246748} Archmage Modera · {quest:92458} Heart of Disruption · {item:251961} Arcane Mote
	["{npc:246748} waits on the citadel's steps: talk to her for the portal to the Violet Chamber. A small room: ranged players spread out. Step out of the way of the slow bouncing orb (Bounding Mana). Out of mana, he polymorphs the whole group and casts Evocation: whoever can break free hits him then. Each player on {quest:92458} loots the {item:251961}."] = "{npc:246748} attend sur les marches de la citadelle : lui parler pour le portail vers la chambre Pourpre. Une petite salle : les joueurs à distance s'écartent. S'écarter de l'orbe lent qui rebondit (Mana bondissant). À court de mana, il métamorphose tout le groupe et lance Évocation : qui peut se libérer le frappe alors. Chaque joueur qui a {quest:92458} ramasse la {item:251961}.",

	-- Step 14: Modera's rewards
	["Modera's rewards"] = "Récompenses de Modera",
	-- {quest:92456} A Green Sample · {quest:92489} Power Overwhelming · {zone:1453} Stormwind
	["Back out through the grate to Modera's camp. Last stop of the chapter: the route's own guide comes back once these are handed in. {quest:92456} and {quest:92489} go to {zone:1453}: Polestar lists them at the route's next {zone:1453} stop."] = "Ressortir par la grille jusqu'au camp de Modera. Dernier arrêt du chapitre : le guide du parcours revient une fois ces quêtes rendues. {quest:92456} et {quest:92489} se rendent à {zone:1453} : Polestar les affiche au prochain arrêt du parcours à {zone:1453}.",
}
