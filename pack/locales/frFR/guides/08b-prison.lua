-- French (frFR): the guide groupe-alliance/08b-prison (guides/08b-prison.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["Group 7b · The Stockade (dungeon 24-28, optional)"] = "Groupe 7b · La Prison (donjon 24-28, facultatif)",

	-- Step 1: Stormwind: Stockade quests
	-- {zone:1453} Stormwind
	["{zone:1453}: Stockade quests"] = "{zone:1453} : quêtes de la Prison",
	-- {zone:1453} Stormwind · {object:2101} Mage Quarter · {object:2100} Old Town · {zone:1440} Ashenvale
	["The Stockade, {zone:1453}'s prison taken over by rioting Defias, is a group dungeon in the canals between the {object:2101} and {object:2100}, best at 24 to 28. Alone? Skip it: the guide goes on to {zone:1440}."] = "La Prison, la geôle de {zone:1453} prise par des Défias en révolte, est un donjon de groupe dans les canaux entre {object:2101} et {object:2100}, idéal de 24 à 28. Seul ? La passer : le guide continue en {zone:1440}.",
	["Keep 6 free quest log slots. Every player takes the quests on their own; meet at the prison gate for the run."] = "Garder 6 places libres dans le journal. Chacun prend les quêtes de son côté ; rendez-vous à la porte de la prison pour le donjon.",
	-- {npc:1719} Warden Thelwater
	["{npc:1719}, at the prison gate"] = "{npc:1719}, à la porte de la prison",
	-- {npc:1719} Warden Thelwater · {quest:389} Bazil Thredd
	["{npc:1719}: {quest:389}, after the Deadmines"] = "{npc:1719} : {quest:389}, après les Mortemines",

	-- Step 2: Enter the Stockade
	["Enter the Stockade"] = "Entrer dans la Prison",
	-- {npc:1719} Warden Thelwater
	-- plural, as words: Defias Prisoners = {npc:1706} Defias Prisoner
	["The gate is by {npc:1719}, at the top of the stairs on the canal. Group of 5 at 24 to 28, or 3 at 26 to 29. Every prisoner is elite (23 to 26); the Defias Prisoners disarm, so the tank builds threat before anyone hits."] = "La porte est près de {npc:1719}, en haut des marches sur le canal. Groupe de 5 de 24 à 28, ou de 3 de 26 à 29. Tous les prisonniers sont élites (23 à 26) ; les prisonniers défias désarment, le tank prend la menace avant que les autres frappent.",
	["The Stockade"] = "La Prison",

	-- Step 3: The entry corridor and Targorr the Dread
	-- {npc:1696} Targorr the Dread
	["The entry corridor and {npc:1696}"] = "Le couloir d'entrée et {npc:1696}",
	-- {npc:1696} Targorr the Dread
	["Cells line both sides, 3 or 4 elites each, and runners flee into the next cell for help: stop them or clear each cell as you pass. {npc:1696} hides in a side cell of this corridor (often first on the right or second on the left); a patrol walks between the two wings."] = "Des cellules des deux côtés, 3 ou 4 élites chacune, et les fuyards courent chercher de l'aide dans la cellule voisine : les arrêter ou vider chaque cellule au passage. {npc:1696} se cache dans une cellule de ce couloir (souvent la 1re à droite ou la 2e à gauche) ; une patrouille circule entre les deux ailes.",
	-- plural, as words: Red Wool Bandanas = {item:2909} Red Wool Bandana
	["Share each quest with your group: click it in the quest log, then Share. Red Wool Bandanas and the prisoners for Quell the Uprising come from every Defias."] = "Partager chaque quête avec le groupe : la cliquer dans le journal, puis Partager. Les foulards en laine rouge et les prisonniers d'Écraser la rébellion viennent de tous les Défias.",
	-- {item:3630} Head of Targorr · {npc:1696} Targorr the Dread
	["{item:3630}: {npc:1696}, elite 24"] = "{item:3630} : {npc:1696}, élite 24",
	-- {npc:1720} Bruegal Ironknuckle
	["At the junction, type /target {npc:1720}: if a frame shows, the rare elite (26) is in a cell nearby, with the best loot of the dungeon."] = "Au croisement, taper /target {npc:1720} : si un cadre s'affiche, l'élite rare (26) est dans une cellule proche, avec le meilleur butin du donjon.",

	-- Step 4: The west wing: Dextren Ward
	-- {npc:1663} Dextren Ward
	["The west wing: {npc:1663}"] = "L'aile ouest : {npc:1663}",
	["Left at the junction, to the small hall at the end. Clear every room around it first: his Intimidating Shout fears the group into fresh packs. He runs at low health: stop him."] = "À gauche au croisement, jusqu'à la petite salle du bout. Vider d'abord chaque pièce autour : son cri d'intimidation fait fuir le groupe vers des groupes frais. Il fuit à faible vie : l'arrêter.",
	-- {item:3628} Hand of Dextren Ward
	["{item:3628}, elite 26"] = "{item:3628}, élite 26",

	-- Step 5: The east wing: Kam, Hamhock and Bazil Thredd
	-- {npc:1717} Hamhock · {npc:1716} Bazil Thredd
	["The east wing: Kam, {npc:1717} and {npc:1716}"] = "L'aile est : Kam, {npc:1717} et {npc:1716}",
	-- {npc:1666} Kam Deepfury · {npc:1717} Hamhock · {npc:1716} Bazil Thredd
	["Right at the junction. {npc:1666} sits in a cell (second on the left); {npc:1717} comes with two linked Insurgents and casts Chain Lightning: crowd-control an add and spread out. {npc:1716} waits at the very end: he hits one target hard and his Smoke Bomb stuns, so keep the tank topped up."] = "À droite au croisement. {npc:1666} est dans une cellule (la 2e à gauche) ; {npc:1717} vient avec deux insurgés liés et lance Chaîne d'éclairs : neutraliser un des deux et s'écarter. {npc:1716} attend tout au bout : il frappe fort une seule cible et sa bombe fumigène étourdit, garder le tank plein de vie.",
	-- {npc:1666} Kam Deepfury · {zone:1437} Wetlands
	["{npc:1666}: his head is for The Fury Runs Deep, a {zone:1437} quest left for later"] = "{npc:1666} : sa tête sert à Fureur dans les Profondeurs, une quête des {zone:1437} laissée pour plus tard",
	-- {item:2926} Head of Bazil Thredd
	["{item:2926}, elite 29"] = "{item:2926}, élite 29",

	-- Step 6: Finish the clear
	["Finish the clear"] = "Finir le nettoyage",
	["One Convict short after a full clear? Wait a few minutes at the entrance for the respawn rather than resetting. Two chests, one in each wing. Leaving through the portal drops whatever chases you."] = "Un forçat manquant après un tour complet ? Attendre quelques minutes la réapparition à l'entrée plutôt que réinitialiser. Deux coffres, un par aile. Ressortir par le portail fait lâcher prise à ce qui vous poursuit.",
	-- plural, as words: Defias Prisoners = {npc:1706} Defias Prisoner
	["Defias Prisoners, Convicts and Insurgents"] = "Prisonniers, détenus et insurgés défias",
	-- {item:2909} Red Wool Bandana
	["{item:2909}: any Defias inside"] = "{item:2909} : n'importe quel Défias à l'intérieur",

	-- Step 7: Stormwind rewards
	-- {zone:1453} Stormwind
	["{zone:1453} rewards"] = "Récompenses à {zone:1453}",
	-- {quest:392} The Curious Visitor · {npc:1646} Baros Alexston · {object:2098} Cathedral Square
	["{quest:392}: for {npc:1646}, {object:2098}"] = "{quest:392} : pour {npc:1646}, {object:2098}",

	-- Step 8: Lakeshire: Guard Berton
	-- {npc:859} Guard Berton
	["Lakeshire: {npc:859}"] = "Comté-du-Lac : {npc:859}",
	["Fly to Lakeshire and back: a few minutes for the biggest reward of the prison."] = "Aller-retour en vol à Comté-du-Lac : quelques minutes pour la plus grosse récompense de la Prison.",
	-- {npc:956} Dorin Songblade
	["{npc:956}, in the stables past the bridge: for the Excavation Site, later"] = "{npc:956}, dans les écuries après le pont : pour le Site de fouilles, plus tard",

	-- Step 9: Darkshire: Councilman Millstipe
	-- {npc:270} Councilman Millstipe
	["Darkshire: {npc:270}"] = "Sombre-Comté : {npc:270}",
	-- {npc:270} Councilman Millstipe
	["{npc:270}, town hall"] = "{npc:270}, hôtel de ville",

	-- Step 10: Back to Stormwind
	-- {zone:1453} Stormwind
	["Back to {zone:1453}"] = "Retour à {zone:1453}",
	-- {zone:1453} Stormwind
	["Fly back to {zone:1453} if you went to Lakeshire or Darkshire."] = "Revenir en vol à {zone:1453} après Comté-du-Lac ou Sombre-Comté.",
	-- {zone:1440} Ashenvale
	["{zone:1440} next: the boat for Auberdine leaves from Stormwind Harbor."] = "Ensuite {zone:1440} : le bateau pour Auberdine part du port de Hurlevent.",
}
