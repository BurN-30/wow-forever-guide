-- French (frFR): the guide groupe-alliance/08b-prison (guides/08b-prison.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["Dungeon · The Stockade (25-31)"] = "Donjon · La Prison (25-31)",

	-- Step 1: Baros Alexston: Bazil Thredd (after the Deadmines)
	-- {npc:1646} Baros Alexston · {quest:389} Bazil Thredd
	["{npc:1646}: {quest:389} (after the Deadmines)"] = "{npc:1646} : {quest:389} (après les Mortemines)",
	-- {npc:1646} Baros Alexston · {object:2159} City Hall · {object:2098} Cathedral Square · {npc:1719} Warden Thelwater · {quest:391} The Stockade Riots
	["{npc:1646}, in the {object:2159} on {object:2098}, sends whoever handed in VanCleef's Unsent Letter to {npc:1719}: it opens {quest:391}, the prison's best quest."] = "{npc:1646}, dans l'hôtel de ville ({object:2159}) sur la {object:2098}, envoie chez {npc:1719} qui a rendu la lettre jamais envoyée de VanCleef : elle ouvre {quest:391}, la meilleure quête de la prison.",

	-- Step 2: Stormwind: Warden Thelwater
	-- {zone:1453} Stormwind · {object:2101} Mage Quarter · {object:2100} Old Town · {npc:1719} Warden Thelwater · {object:2098} Cathedral Square
	["The Stockade, {zone:1453}'s prison taken over by rioting Defias, is a group dungeon in the canals between the {object:2101} and {object:2100}, levels 24 to 32 in the group finder: at 26 or more it goes well. {npc:1719} keeps its gate, south of the {object:2098}."] = "La Prison de {zone:1453}, prise par des Défias en révolte, est un donjon de groupe dans les canaux entre le {object:2101} et la {object:2100}, niveaux 24 à 32 dans la recherche de groupe : à 26 ou plus, il passe bien. {npc:1719} garde sa porte, au sud de la {object:2098}.",
	["Keep 6 free quest log slots. Everyone takes the quests on their own; meet at the prison gate for the run."] = "Garder 6 places libres dans le journal. Chacun prend les quêtes de son côté ; rendez-vous à la porte de la prison pour le donjon.",

	-- Step 3: Warden Thelwater: Bazil Thredd (after the Deadmines)
	-- {npc:1719} Warden Thelwater · {quest:389} Bazil Thredd
	["{npc:1719}: {quest:389} (after the Deadmines)"] = "{npc:1719} : {quest:389} (après les Mortemines)",

	-- Step 4: Old Town: Nikova Raskol
	-- {npc:1721} Nikova Raskol · {object:2100} Old Town
	-- plural, as words: Red Wool Bandanas = {item:2909} Red Wool Bandana
	["{npc:1721} stands in {object:2100}: the Red Wool Bandanas she wants drop from the Defias inside."] = "{npc:1721} se tient dans la {object:2100} : les bandanas en laine rouge qu'elle veut tombent des Défias de la prison.",

	-- Step 5: What Comes Around, for whoever carries it
	["What Comes Around, for whoever carries it"] = "Retour de bâton, pour qui la porte",

	-- Step 6: Crime and Punishment, for whoever carries it
	-- {quest:377} Crime and Punishment
	["{quest:377}, for whoever carries it"] = "{quest:377}, pour qui la porte",

	-- Step 7: Enter the Stockade
	["Enter the Stockade"] = "Entrer dans la Prison",
	-- {npc:1719} Warden Thelwater
	-- plural, as words: Defias Prisoners = {npc:1706} Defias Prisoner
	["The gate is by {npc:1719}, at the top of the stairs on the canal. Group of 5 at 24 to 29, or 3 at 26 to 29. Every prisoner is elite (23 to 26); the Defias Prisoners disarm, so the tank builds threat before anyone hits."] = "La porte est près de {npc:1719}, en haut de l'escalier sur le canal. Groupe de 5 de 24 à 29, ou de 3 de 26 à 29. Tous les prisonniers sont élites (23 à 26) ; les prisonniers défias désarment, donc le tank prend la menace avant que les autres frappent.",
	-- {quest:391} The Stockade Riots · {npc:1719} Warden Thelwater · {quest:388} The Color of Blood · {npc:1721} Nikova Raskol
	["In the log before going in: Quell the Uprising and {quest:391} ({npc:1719}), {quest:388} ({npc:1721}). Share each quest with the group: click it in the quest log, then Share."] = "Dans le journal avant d'entrer : Mater la révolte (Quell the Uprising) et {quest:391} ({npc:1719}), {quest:388} ({npc:1721}). Partager chaque quête avec le groupe : clic sur la quête dans le journal, puis Partager.",
	["The Stockade"] = "La Prison",

	-- Step 8: The entry corridor and Targorr
	["The entry corridor and Targorr"] = "Le couloir d'entrée et Targorr",
	-- {npc:1696} Targorr the Dread
	["Cells line both sides, 3 or 4 elites each, and runners flee into the next cell for help: stop them or clear each cell as you pass. {npc:1696} hides in a side cell of this corridor (often first on the right or second on the left); a patrol walks between the two wings."] = "Des cellules des deux côtés, 3 ou 4 élites chacune, et les fuyards courent chercher de l'aide dans la cellule voisine : les arrêter ou vider chaque cellule au passage. {npc:1696} se cache dans une cellule de ce couloir (souvent la 1re à droite ou la 2e à gauche) ; une patrouille circule entre les deux ailes.",
	-- plural, as words: Red Wool Bandanas = {item:2909} Red Wool Bandana
	["Red Wool Bandanas and the prisoners for Quell the Uprising come from every Defias."] = "Les bandanas en laine rouge et les prisonniers de Mater la révolte (Quell the Uprising) viennent de tous les Défias.",
	-- {item:3630} Head of Targorr · {npc:1696} Targorr the Dread · {npc:859} Guard Berton
	["{item:3630}: {npc:1696}, elite 24. For What Comes Around ({npc:859}, Lakeshire): the hand-in comes after the run."] = "{item:3630} : {npc:1696}, élite 24. Pour Retour de bâton ({npc:859}, Comté-du-Lac) : le rendu vient après le donjon.",
	-- {npc:1720} Bruegal Ironknuckle
	["At the junction, type /target {npc:1720}: if a frame shows, the rare elite (26) is in a cell nearby, with the best loot of the dungeon."] = "Au croisement, taper /target {npc:1720} : si un cadre s'affiche, l'élite rare (26) est dans une cellule proche, avec le meilleur butin du donjon.",

	-- Step 9: The west wing: Dextren Ward
	-- {npc:1663} Dextren Ward
	["The west wing: {npc:1663}"] = "L'aile ouest : {npc:1663}",
	["Left at the junction, to the small hall at the end. Clear every room around it first: his Intimidating Shout fears the group into fresh packs. He runs at low health: stop him."] = "À gauche au croisement, jusqu'à la petite salle du bout. Vider d'abord chaque pièce autour : son cri d'intimidation fait fuir le groupe vers des groupes frais. Il fuit à faible vie : l'arrêter.",
	-- {item:3628} Hand of Dextren Ward · {quest:377} Crime and Punishment · {npc:270} Councilman Millstipe
	["{item:3628}, elite 26. For {quest:377} ({npc:270}, Darkshire): the hand-in comes after the run."] = "{item:3628}, élite 26. Pour {quest:377} ({npc:270}, Sombre-Comté) : le rendu vient après le donjon.",

	-- Step 10: The east wing: Kam, Hamhock and Bazil Thredd
	-- {npc:1717} Hamhock · {npc:1716} Bazil Thredd
	["The east wing: Kam, {npc:1717} and {npc:1716}"] = "L'aile est : Kam, {npc:1717} et {npc:1716}",
	-- {npc:1666} Kam Deepfury · {npc:1717} Hamhock · {npc:1716} Bazil Thredd
	["Right at the junction. {npc:1666} sits in a cell (second on the left); {npc:1717} comes with two linked Insurgents and casts Chain Lightning: crowd-control an add and spread out. {npc:1716} waits at the very end: he hits one target hard and his Smoke Bomb stuns, so keep the tank topped up."] = "À droite au croisement. {npc:1666} est dans une cellule (la 2e à gauche) ; {npc:1717} vient avec deux insurgés liés et lance Chaîne d'éclairs : neutraliser un des deux et s'écarter. {npc:1716} attend tout au bout : il frappe fort une seule cible et sa bombe fumigène étourdit, garder le tank plein de vie.",
	-- {item:2926} Head of Bazil Thredd
	["{item:2926}, elite 29"] = "{item:2926}, élite 29",

	-- Step 11: Finish the clear
	["Finish the clear"] = "Finir le nettoyage",
	["One Convict short after a full clear? Wait a few minutes at the entrance for the respawn rather than resetting. Two chests, one in each wing. Leaving through the portal drops whatever chases you."] = "Un forçat manquant après un tour complet ? Attendre quelques minutes la réapparition à l'entrée plutôt que réinitialiser. Deux coffres, un par aile. Ressortir par le portail fait lâcher prise à tout poursuivant.",
	-- plural, as words: Defias Prisoners = {npc:1706} Defias Prisoner
	["Defias Prisoners, Convicts and Insurgents"] = "Prisonniers, détenus et insurgés défias",
	-- {item:2909} Red Wool Bandana
	["{item:2909}: any Defias inside"] = "{item:2909} : n'importe quel Défias à l'intérieur",

	-- Step 14: Warden Thelwater: The Curious Visitor (the end of the Defias story)
	-- {npc:1719} Warden Thelwater · {quest:392} The Curious Visitor
	["{npc:1719}: {quest:392} (the end of the Defias story)"] = "{npc:1719} : {quest:392} (la fin de l'histoire des Défias)",
	-- {zone:1453} Stormwind · {item:2933} Seal of Wrynn · {npc:1721} Nikova Raskol · {object:2100} Old Town
	["The end of the Defias story follows, all in {zone:1453} and at the farm by its gate: about 8,000 XP and the {item:2933}, a ring, at the end; its last fight is better with the group. Short on time? Skip it: {npc:1721} in {object:2100} ends the chapter."] = "La fin de l'histoire des Défias suit, toute à {zone:1453} et à la ferme près de sa porte : environ 8 000 XP et le {item:2933}, une bague, à la fin ; son dernier combat passe mieux en groupe. Peu de temps ? La passer : {npc:1721}, dans {object:2100}, termine le chapitre.",
	-- {quest:392} The Curious Visitor · {npc:1646} Baros Alexston · {object:2098} Cathedral Square
	["{quest:392}: for {npc:1646}, {object:2098}"] = "{quest:392} : pour {npc:1646}, {object:2098}",

	-- Step 15: Baros Alexston: The Curious Visitor
	-- {npc:1646} Baros Alexston · {object:2159} City Hall · {object:2098} Cathedral Square
	["{npc:1646} is in the {object:2159} on {object:2098}."] = "{npc:1646} est dans l'hôtel de ville ({object:2159}), sur {object:2098}.",

	-- Step 16: Stormwind: the end of the Defias story
	-- {zone:1453} Stormwind
	["{zone:1453}: the end of the Defias story"] = "{zone:1453} : la fin de l'histoire des Défias",
	-- {quest:391} The Stockade Riots · {npc:1646} Baros Alexston · {object:2159} City Hall · {object:2098} Cathedral Square · {object:2100} Old Town · {npc:482} Elling Trias · {object:2096} Trade District · {npc:7766} Tyrion · {object:2117} Stormwind Keep
	["Only if you did {quest:391}. {npc:1646} is in the {object:2159} on {object:2098}, Mathias Shaw upstairs at SI:7 in {object:2100}, {npc:482} upstairs in the cheese shop of the {object:2096}, {npc:7766} in the garden beside {object:2117}."] = "Seulement après {quest:391}. {npc:1646} est dans l'hôtel de ville ({object:2159}) sur la {object:2098}, Mathias Shaw à l'étage du SI:7 dans la {object:2100}, {npc:482} à l'étage de la fromagerie du {object:2096}, {npc:7766} dans le jardin à côté du {object:2117}.",

	-- Step 17: Clara's apples
	["Clara's apples"] = "Les pommes de Clara",
	-- {zone:1453} Stormwind · {item:4306} Silk Cloth
	["The bowl of apples sits on the table of the farmhouse just outside the {zone:1453} gate, south-west of the road. {item:4306}: from your bags, humanoids or the Auction House."] = "Le bol de pommes repose sur la table de la ferme juste à l'extérieur de la porte de {zone:1453}, au sud-ouest de la route. {item:4306} : dans les sacs, sur des humanoïdes ou à l'hôtel des ventes.",

	-- Step 18: The Attack!
	-- {npc:1754} Lord Gregor Lescovar · {npc:1755} Marzon the Silent Blade
	["{npc:1754} and {npc:1755} meet in the garden beside the keep: listen to them, then fight both, together. Better with the group."] = "{npc:1754} et {npc:1755} se retrouvent dans le jardin à côté du donjon : les écouter, puis les combattre tous les deux, ensemble. Mieux avec le groupe.",
	-- {npc:1755} Marzon the Silent Blade
	["Overhear Lescovar and {npc:1755} in the garden, then kill both"] = "Écouter Lescovar et {npc:1755} dans le jardin, puis les tuer tous les deux",

	-- Step 19: Brotherhood's End
	-- {npc:1749} Lady Katrana Prestor · {object:2117} Stormwind Keep · {item:2933} Seal of Wrynn
	["{npc:1749}, in the throne room of {object:2117}: {item:2933}"] = "{npc:1749}, dans la salle du trône de l'{object:2117} : {item:2933}",

	-- Step 20: Lakeshire: Guard Berton
	-- {npc:859} Guard Berton
	["Lakeshire: {npc:859}"] = "Comté-du-Lac : {npc:859}",
	["Fly to Lakeshire and back: a few minutes for the biggest reward of the prison."] = "Aller-retour en vol à Comté-du-Lac : quelques minutes pour la plus grosse récompense de la Prison.",

	-- Step 21: Darkshire: Councilman Millstipe
	-- {npc:270} Councilman Millstipe
	["Darkshire: {npc:270}"] = "Sombre-Comté : {npc:270}",
	-- {npc:270} Councilman Millstipe
	["{npc:270}, town hall"] = "{npc:270}, hôtel de ville",

	-- Step 22: Old Town: Nikova Raskol
	["Last stop of the chapter: the route's own guide comes back once this is handed in."] = "Dernier arrêt du chapitre : le guide du parcours revient une fois cette quête rendue.",
}
