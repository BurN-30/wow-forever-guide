-- French (frFR): the guide groupe-alliance/greffe/mortemines (guides/greffe/mortemines.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["Dungeon · The Deadmines (18-24)"] = "Donjon · Les Mortemines (18-24)",

	-- Step 1: Sentinel Hill: the Deadmines quests
	-- {object:81} Sentinel Hill
	["{object:81}: the Deadmines quests"] = "{object:81} : les quêtes des Mortemines",
	-- {npc:234} Gryan Stoutmantle · {npc:820} Scout Riell · {object:81} Sentinel Hill
	["The Deadmines: a 5-player dungeon under Moonbrook, levels 16 to 21 (17 to 26 in the group finder): at 20 or more it goes well. {npc:234} and {npc:820} stand at the top of the {object:81} tower."] = "Les Mortemines : un donjon pour 5 joueurs sous Ruisselune, niveaux 16 à 21 (17 à 26 dans la recherche de groupe) : à 20 ou plus, il passe bien. {npc:234} et {npc:820} se tiennent en haut de la tour de {object:81}.",
	["Keep 6 free quest log slots. Everyone takes the quests at their own pace; meet at the Moonbrook entrance for the run."] = "Garder 6 places libres dans le journal. Chacun prend les quêtes à son rythme ; rendez-vous à l'entrée de Ruisselune pour le donjon.",
	-- {npc:820} Scout Riell · {quest:214} Red Silk Bandanas
	["{npc:820}, at the top of the tower: {quest:214}"] = "{npc:820}, en haut de la tour : {quest:214}",

	-- Step 2: Stormwind: the miners' quests
	-- {zone:1453} Stormwind
	["{zone:1453}: the miners' quests"] = "{zone:1453} : les quêtes des mineurs",
	-- {zone:1453} Stormwind · {npc:656} Wilder Thistlenettle · {object:28027} Dwarven District · {npc:6579} Shoni the Shilent
	["Fly to {zone:1453} for two more quests of the mine; train while you are here. {npc:656} stands in the tavern of the {object:28027}, {npc:6579} nearby."] = "Vol vers {zone:1453} pour deux autres quêtes de la mine ; passer chez le maître de classe au passage. {npc:656} est dans la taverne du {object:28027}, {npc:6579} tout près.",
	["Oh Brother..."] = "Ah, mon frère...",

	-- Step 3: Before entering the Deadmines
	["Before entering the Deadmines"] = "Avant d'entrer dans les Mortemines",
	-- {quest:155} The Defias Brotherhood · {quest:214} Red Silk Bandanas · {object:81} Sentinel Hill · {quest:168} Collecting Memories · {zone:1453} Stormwind · {quest:2040} Underground Assault · {npc:6579} Shoni the Shilent · {npc:234} Gryan Stoutmantle · {npc:820} Scout Riell · {npc:656} Wilder Thistlenettle
	["In the log before the portal: {quest:155} and {quest:214} ({object:81}), {quest:168} and Oh Brother... ({zone:1453}), {quest:2040} if {npc:6579} gave it. One missing? {npc:234} and {npc:820} at {object:81}, {npc:656} in {zone:1453}."] = "Dans le journal avant le portail : {quest:155} et {quest:214} ({object:81}), {quest:168} et Ah, mon frère... ({zone:1453}), {quest:2040} si {npc:6579} l'a donnée. Il en manque une ? {npc:234} et {npc:820} à {object:81}, {npc:656} à {zone:1453}.",
	["Share each quest with the group before going in: click it in the quest log, then Share."] = "Partager chaque quête avec le groupe avant d'entrer : clic sur la quête dans le journal, puis Partager.",
	["The Deadmines"] = "Les Mortemines",

	-- Step 4: The mine outside the portal
	["The mine outside the portal"] = "La mine avant le portail",
	-- {npc:626} Foreman Thistlenettle
	-- plural, as words: Miners' Union Cards = {item:1894} Miners' Union Card
	["Moonbrook's smithy hides the mine. Before the portal, the purple area of the minimap holds elite undead miners in pairs: the Miners' Union Cards drop there, not inside, and {npc:626} stands at the far end with a linked add."] = "La forge de Ruisselune cache la mine. Avant le portail, la zone violette de la minicarte abrite des mineurs morts-vivants élites, par paires : les cartes du syndicat des mineurs tombent là, pas dans l'instance, et {npc:626} se tient au bout, avec un garde lié.",
	["Alone: around 20-21 for the cards, 23 for the Foreman. Two players: fine at 19-20. The cards drop rarely and each player loots their own: skip them if time runs short."] = "Seul : vers 20-21 pour les cartes, 23 pour le contremaître. À deux : faisable vers 19-20. Les cartes tombent rarement et chacun ramasse les siennes : les laisser si le temps manque.",
	-- {item:1894} Miners' Union Card
	-- plural, as words: Undead Excavators = {npc:624} Undead Excavator
	["{item:1894}: Undead Excavators and Dynamiters, elite"] = "{item:1894} : excavateurs et dynamiteurs morts-vivants, élites",
	-- {item:1875} Thistlenettle's Badge · {npc:626} Foreman Thistlenettle
	["{item:1875}: {npc:626}, elite"] = "{item:1875} : {npc:626}, élite",

	-- Step 5: Rhahk'Zor
	-- {npc:644} Rhahk'Zor · {npc:3586} Miner Johnson
	["Group of 5, level 18 or more. Pull the two Watchmen away from {npc:644} first, and turn around after every boss: patrols come from behind. {npc:3586}, a rare, may stand in the small tunnel on the left after him: kill his miners first."] = "Groupe de 5, niveau 18 ou plus. Éloigner d'abord les deux guetteurs de {npc:644}, et se retourner après chaque boss : des patrouilles arrivent par derrière. {npc:3586}, un rare, peut se tenir dans le petit tunnel à gauche après lui : tuer ses mineurs d'abord.",
	-- {quest:214} Red Silk Bandanas
	["{quest:214} drop from Defias all through the dungeon."] = "Les {quest:214} tombent sur les Défias dans tout le donjon.",
	-- {item:915} Red Silk Bandana
	["{item:915}: any Defias"] = "{item:915} : n'importe quel Défias",

	-- Step 6: Sneed's Shredder and Sneed
	-- {npc:642} Sneed's Shredder · {npc:643} Sneed
	["{npc:642} and {npc:643}"] = "{npc:642} et {npc:643}",
	-- {npc:641} Goblin Woodcarver · {npc:643} Sneed
	["Clear every {npc:641} of the lumber room first, pulling them back to the previous room: the Shredder's Terrify sends you running into them. {npc:643} jumps out when it breaks; he disarms."] = "Vider d'abord chaque {npc:641} de la scierie, en les tirant dans la salle précédente : la Terreur du broyeur fait fuir droit sur eux. {npc:643} saute dehors quand la machine casse ; il désarme.",

	-- Step 7: Gilnid's foundry
	-- {npc:1763} Gilnid
	["{npc:1763}'s foundry"] = "La fonderie de {npc:1763}",
	-- {npc:1763} Gilnid
	-- plural, as words: Goblin Engineers = {npc:622} Goblin Engineer
	["Goblin Engineers and Craftsmen summon golems: kill or stun the goblin, the golem goes with it. {npc:1763} has an Engineer at his side."] = "Les ingénieurs et artisans gobelins invoquent des golems : tuer ou étourdir le gobelin, le golem disparaît avec lui. {npc:1763} a un ingénieur à ses côtés.",

	-- Step 8: The cannon door
	["The cannon door"] = "La porte du canon",
	-- {item:5397} Defias Gunpowder
	["The {item:5397} barrel sits in the alcove on the right just before the cannon. Fire the cannon, then step back: a patrol of elites comes out through the broken door. A Rogue can pick the lock instead."] = "Le tonneau de {item:5397} est dans l'alcôve à droite juste avant le canon. Tirer, puis reculer : une patrouille d'élites sort par la porte brisée. Un voleur peut crocheter la serrure à la place.",
	["The cannon door is open"] = "La porte du canon est ouverte",

	-- Step 9: Mr. Smite
	-- plural, as words: Defias Blackguards = {npc:636} Defias Blackguard
	["In the cove: two stealthed Defias Blackguards join him by the walkway, kill them before he reaches 66%. At 66% and 33% he stuns the whole group for a few seconds and changes weapons: keep the tank's health up before each."] = "Dans la crique : deux canailles défias camouflées le rejoignent près de la passerelle, les tuer avant qu'il arrive à 66 %. À 66 % et 33 %, il étourdit tout le groupe quelques secondes et change d'arme : garder le tank plein de vie avant chaque fois.",

	-- Step 10: Captain Greenskin
	["On the ship. Crowd-control the Squallshaper, kill the Companion, then the Pirate, then Greenskin facing away from the group (Cleave)."] = "Sur le bateau. Neutraliser le façonneur de grains, tuer le compagnon, puis le pirate, puis Peau-Verte tourné dos au groupe (Enchaînement).",

	-- Step 11: Edwin VanCleef
	["Captain's cabin, top of the ship. Two Blackguards join at the pull, two more at half health: a stun at 51 to 55% skips the second pair. Everyone on the quest loots their own head and their own letter."] = "Cabine du capitaine, en haut du bateau. Deux canailles le rejoignent au début, deux autres à mi-vie : un étourdissement vers 51 à 55 % évite la seconde paire. Chaque joueur qui a la quête ramasse sa tête et sa lettre.",
	-- {item:2874} An Unsent Letter
	["{item:2874}, on VanCleef: right-click it, it opens the Stockade chain"] = "{item:2874}, sur VanCleef : clic droit dessus, elle ouvre la suite vers la Prison",
	["Cookie, on the lower deck, is optional: interrupt his healing cast. Do not hearth: leave by the back, along the coast."] = "Macaron, sur le pont inférieur, est facultatif : interrompre son soin. Pas de pierre de foyer : sortir par l'arrière, le long de la côte.",

	-- Step 12: Sentinel Hill rewards
	-- {object:81} Sentinel Hill
	["{object:81} rewards"] = "Récompenses à {object:81}",
	-- {object:81} Sentinel Hill
	["Out by the back of the cove and north along the road to {object:81}."] = "Sortie par l'arrière de la crique, puis vers le nord par la route jusqu'à {object:81}.",
	-- {npc:820} Scout Riell
	["{npc:820}, top of the tower"] = "{npc:820}, en haut de la tour",

	-- Step 13: Stormwind rewards
	-- {zone:1453} Stormwind
	["{zone:1453} rewards"] = "Récompenses à {zone:1453}",
	["Last stop of the chapter: the route's own guide comes back once these are handed in."] = "Dernier arrêt du chapitre : le guide du parcours revient une fois ces quêtes rendues.",
}
