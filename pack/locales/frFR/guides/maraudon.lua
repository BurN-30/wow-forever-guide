-- French (frFR): the guide groupe-alliance/maraudon (guides/maraudon.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["Dungeon · Maraudon (45-51)"] = "Donjon · Maraudon (45-51)",

	-- Step 1: Shen'dralas: Woodwyrd
	-- {zone:2652} Shen'dralas
	["{zone:2652}: Woodwyrd"] = "{zone:2652} : Woodwyrd",
	-- {zone:1443} Desolace
	["Maraudon: the caves of the centaurs' sacred ground in western {zone:1443}, for a group of 5, levels 46 to 55 in the group finder: at 45-46 it takes a solid group. A long dungeon: two wings, then the inner part, whose last boss is 51. Woodwyrd, the treant in the middle of the Forlorn Gardens, wants water from inside it."] = "Maraudon : les grottes de la terre sacrée des centaures, à l'ouest de la {zone:1443}, pour un groupe de 5, niveaux 46 à 55 dans la recherche de groupe : à 45-46, il faut un groupe solide. Un long donjon : deux ailes, puis la partie intérieure, dont le dernier boss est de niveau 51. Woodwyrd, le tréant au milieu des Forlorn Gardens, veut de l'eau de l'intérieur.",
	-- {zone:1443} Desolace · {npc:13656} Willow · {object:176948} Nijel's Point · {object:152576} Feathermoon Stronghold · {zone:1444} Feralas
	["Keep 7 free quest log slots. The way: north into {zone:1443} for {npc:13656} and {object:176948}, back south-west to the caves, the run, then Woodwyrd and the hand-ins; the flight from {object:176948} to {object:152576} joins the route's {zone:1444} guide."] = "Garder 7 places libres dans le journal. Le trajet : au nord en {zone:1443} pour {npc:13656} et {object:176948}, retour au sud-ouest vers les grottes, le donjon, puis Woodwyrd et les rendus ; le vol de {object:176948} pour {object:152576} rejoint le guide {zone:1444} du parcours.",
	-- {quest:93404} Rot and Regret
	["Woodwyrd: {quest:93404}"] = "Woodwyrd : {quest:93404}",

	-- Step 2: Desolace: Willow
	-- {zone:2652} Shen'dralas · {npc:13656} Willow
	["Ride north out of {zone:2652} through the Valley of Bones and on along the road to Kormek's Hut, by Thunder Axe Fortress: {npc:13656} waits there."] = "Sortir de {zone:2652} vers le nord par la Vallée des Ossements, puis suivre la route jusqu'à la hutte de Kormek, près de la forteresse Hache-Tonnerre : {npc:13656} y attend.",

	-- Step 3: Nijel's Point
	-- {npc:11715} Talendria · {item:17693} Coated Cerulean Vial · {quest:7065} Corruption of Earth and Seed
	["North up the road to the night elf outpost. {npc:11715}'s quest cannot be shared: each player takes it here, with its {item:17693}. {quest:7065} needs level 45."] = "Au nord par la route jusqu'à l'avant-poste elfe de la nuit. La quête de {npc:11715} ne se partage pas : chaque joueur la prend ici, avec sa {item:17693}. {quest:7065} demande le niveau 45.",

	-- Step 4: Maraudon: before going in
	["Maraudon: before going in"] = "Maraudon : avant d'entrer",
	-- {npc:13697} Cavindra · {item:17693} Coated Cerulean Vial
	["Ride south-west to the Valley of Spears: the caves of Maraudon open in the hills west of it. {npc:13697} waits in the first cave. Fill the {item:17693} at an orange crystal pool, outside the orange portal (the right-hand path where the caves split); the blue water does not count."] = "Partir au sud-ouest vers la vallée des Lances : les grottes de Maraudon s'ouvrent dans les collines à l'ouest. {npc:13697} attend dans la première grotte. Remplir la {item:17693} à un bassin aux cristaux orange, devant le portail orange (le chemin de droite là où les grottes se séparent) ; l'eau bleue ne compte pas.",
	-- {quest:93404} Rot and Regret · {quest:7028} Twisted Evils · {npc:13656} Willow · {quest:7041} Vyletongue Corruption · {quest:7065} Corruption of Earth and Seed · {object:176948} Nijel's Point · {quest:7044} Legends of Maraudon · {npc:13697} Cavindra · {npc:11715} Talendria
	["In the quest log before going in: {quest:93404} (Woodwyrd), {quest:7028} ({npc:13656}), {quest:7041} and {quest:7065} ({object:176948}), {quest:7044} ({npc:13697}, here). Share each one but {npc:11715}'s with the group: click it in the quest log, then Share."] = "Dans le journal avant d'entrer : {quest:93404} (Woodwyrd), {quest:7028} ({npc:13656}), {quest:7041} et {quest:7065} ({object:176948}), {quest:7044} ({npc:13697}, ici). Partager chacune sauf celle de {npc:11715} avec le groupe : clic sur la quête dans le journal, puis Partager.",
	-- {item:17696} Filled Cerulean Vial
	["{item:17696}: the orange crystal pool"] = "{item:17696} : le bassin aux cristaux orange",
	["Maraudon"] = "Maraudon",

	-- Step 5: Maraudon: along the way
	["Maraudon: along the way"] = "Maraudon : en chemin",
	-- plural, as words: Theradric Crystal Carvings = {item:17684} Theradric Crystal Carving
	["Collected all through the dungeon: the Theradric Crystal Carvings, from the centaurs, satyrs and dryads and from most bosses. Every player with the quest loots their own."] = "À ramasser dans tout le donjon : les gravures de cristal théradrique, sur les centaures, les satyres, les dryades et la plupart des boss. Chaque joueur qui a la quête ramasse les siennes.",

	-- Step 6: Maraudon: the orange side
	["Maraudon: the orange side"] = "Maraudon : le côté orange",
	-- {item:17696} Filled Cerulean Vial · {npc:13696} Noxxious Scion · {item:17702} Celebrian Rod
	-- plural, as words: Vylestem Vines = {object:178905} Vylestem Vine
	["On the orange side, by the Vylestem Vines: use the {item:17696} near one, a {npc:13696} comes out (45, immune to Nature); kill it to heal the vine, 8 times. Noxxion, at the end of this side, drops the {item:17702}."] = "Du côté orange, près des Vylestem Vines : utiliser la {item:17696} près de l'une d'elles, une {npc:13696} en sort (niveau 45, insensible à la Nature) ; la tuer guérit la vigne, 8 fois. Noxxion, au bout de ce côté, lâche le {item:17702}.",
	-- {npc:13696} Noxxious Scion
	["{npc:13696}: one per vine"] = "{npc:13696} : une par vigne",
	-- {item:17702} Celebrian Rod
	["{item:17702}: Noxxion"] = "{item:17702} : Noxxion",

	-- Step 7: Maraudon: the purple side
	["Maraudon: the purple side"] = "Maraudon : le côté violet",
	-- {npc:12236} Lord Vyletongue · {item:17703} Celebrian Diamond
	["Back out and in through the purple portal: {npc:12236}, at the end of this side, drops the {item:17703}."] = "Ressortir et entrer par le portail violet : {npc:12236}, au bout de ce côté, lâche le {item:17703}.",

	-- Step 8: Maraudon: Celebras
	["Maraudon: Celebras"] = "Maraudon : Celebras",
	-- {npc:12225} Celebras the Cursed · {npc:13716} Celebras the Redeemed · {quest:7044} Legends of Maraudon
	["In the inner part, {npc:12225}: once beaten, he comes back as {npc:13716}. Hand him {quest:7044}; his next quest cannot be shared: each player takes it, then waits while he makes the scepter and speaks with him again."] = "Dans la partie intérieure, {npc:12225} : une fois vaincu, il revient en {npc:13716}. Lui rendre {quest:7044} ; sa quête suivante ne se partage pas : chaque joueur la prend, attend qu'il ait fabriqué le sceptre et lui parle de nouveau.",

	-- Step 9: Maraudon: the Earth Song Falls
	["Maraudon: the Earth Song Falls"] = "Maraudon : la cascade de la partie intérieure",
	-- {item:258296} Vial of Earth Song Water
	["The inner part's great cavern, under the falls: the {item:258296} for Woodwyrd is an object there, which every player with the quest takes. Its exact place is to check in game."] = "La grande caverne de la partie intérieure, sous la cascade : la {item:258296} pour Woodwyrd est un objet à cet endroit, que prend chaque joueur qui a la quête. Sa place exacte reste à vérifier en jeu.",

	-- Step 10: Maraudon: Princess Theradras
	-- {npc:12201} Princess Theradras
	["Maraudon: {npc:12201}"] = "Maraudon : {npc:12201}",
	-- {npc:12201} Princess Theradras · {npc:12238} Zaetar's Spirit · {quest:7066} Seed of Life · {npc:11832} Keeper Remulos · {zone:1450} Moonglade · {zone:1452} Winterspring
	["{npc:12201}, the last boss (51), at the far end of the inner part. {npc:12238} then rises: its quest, {quest:7066}, goes to {npc:11832} in {zone:1450}; keep it until the route passes there, around 53 on the way to {zone:1452}."] = "{npc:12201}, le dernier boss (51), tout au fond de la partie intérieure. {npc:12238} se lève ensuite : sa quête, {quest:7066}, va à {npc:11832} au {zone:1450} ; la garder jusqu'au passage du parcours, vers 53, sur le chemin du {zone:1452}.",

	-- Step 11: Shen'dralas: Woodwyrd
	["Out of the caves, south through the Valley of Bones to the Forlorn Gardens: pour the water on Woodwyrd, then hand it in."] = "Hors des grottes, au sud par la Vallée des Ossements jusqu'aux Forlorn Gardens : verser l'eau sur Woodwyrd, puis rendre la quête.",
	["Woodwyrd extinguished"] = "Woodwyrd éteint",
	["Woodwyrd"] = "Woodwyrd",

	-- Step 12: Maraudon: quests not done
	["Maraudon: quests not done"] = "Maraudon : quêtes pas faites",
	-- {npc:12201} Princess Theradras · {quest:7065} Corruption of Earth and Seed · {zone:1443} Desolace
	["{npc:12201} not beaten: {quest:7065} cannot be finished on this route, which does not come back to {zone:1443}. Abandon it."] = "{npc:12201} pas vaincue : {quest:7065} ne peut pas être finie sur ce parcours, qui ne revient pas en {zone:1443}. L'abandonner.",

	-- Step 13: Desolace: Willow
	-- {npc:13656} Willow
	["North again along the road: {npc:13656} at Kormek's Hut."] = "De nouveau au nord par la route : {npc:13656} à la hutte de Kormek.",

	-- Step 14: Nijel's Point: the rewards
	-- {object:176948} Nijel's Point
	["{object:176948}: the rewards"] = "{object:176948} : les récompenses",
	-- {object:176948} Nijel's Point · {object:152576} Feathermoon Stronghold · {zone:1444} Feralas
	["Last stop of the chapter: the route's own guide comes back once these are handed in. Then fly from {object:176948} to {object:152576}: the route's {zone:1444} guide starts there."] = "Dernier arrêt du chapitre : le guide du parcours revient une fois ces quêtes rendues. Prendre ensuite le vol de {object:176948} pour {object:152576} : le guide {zone:1444} du parcours commence là.",
}
