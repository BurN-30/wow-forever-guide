-- French (frFR): the guide groupe-alliance/04-salle-des-thanes (guides/04-salle-des-thanes.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["Dungeon · The Hall of Thanes (14-19)"] = "Donjon · La Salle des Thanes (14-19)",

	-- Step 1: Stormwind: the tram to Ironforge
	-- {zone:1453} Stormwind · {zone:1455} Ironforge
	["{zone:1453}: the tram to {zone:1455}"] = "{zone:1453} : le tram pour {zone:1455}",
	-- {zone:1455} Ironforge
	["The Hall of Thanes: a 5-player Forever dungeon under {zone:1455}, levels 13 to 20 in the group finder: at 15 or more it goes well. Its quests are taken in {zone:1455}, a few steps from its door, and handed in there."] = "La Salle des Thanes : un donjon de Forever pour 5 joueurs sous {zone:1455}, niveaux 13 à 20 dans la recherche de groupe : à 15 ou plus, il passe bien. Ses quêtes se prennent à {zone:1455}, à quelques pas de sa porte, et s'y rendent.",
	-- {object:171709} High Seat
	["Keep 5 free quest log slots. Everyone takes the quests on their own; meet at the door, west of the {object:171709}."] = "Garder 5 places libres dans le journal. Chacun prend les quêtes de son côté ; rendez-vous à la porte, à l'ouest du Haut Siège.",
	-- {zone:1455} Ironforge
	["Tram to {zone:1455}"] = "Tram pour {zone:1455}",

	-- Step 2: Earthseer Farsen: Underground Map
	-- {quest:96391} Underground Map · {item:274268} Dark Iron Map · {npc:264936} Earthseer Farsen · {quest:96393} Old Ironforge Incursion · {object:149024} Gol'Bolar Quarry
	["Carrying the {quest:96391} (the {item:274268} of the spies, in the Dwarf and Gnome starts)? {npc:264936} takes it, then gives {quest:96393}, the head of the last boss for King Magni, about 3,200 XP. Out of Ironforge's gate first, east past Kharanos to his camp above {object:149024}, then back for the dungeon's other quests: one trip through the city."] = "Avec {quest:96391} dans le journal (la {item:274268} des espions, dans les départs nain et gnome) ? {npc:264936} la prend, puis donne {quest:96393}, la tête du dernier boss pour le roi Magni, environ 3 200 XP. D'abord par la porte de Forgefer, vers l'est passé Kharanos jusqu'à son camp au-dessus de la carrière de Gol'Bolar, puis retour pour les autres quêtes du donjon : une seule traversée de la ville.",

	-- Step 3: Earthseer Farsen: Old Ironforge Incursion (optional)
	-- {npc:264936} Earthseer Farsen · {quest:96393} Old Ironforge Incursion
	["{npc:264936}: {quest:96393} (optional)"] = "{npc:264936} : {quest:96393} (facultatif)",
	-- {quest:96391} Underground Map · {item:274268} Dark Iron Map · {npc:264936} Earthseer Farsen · {quest:96393} Old Ironforge Incursion · {object:149024} Gol'Bolar Quarry
	["Only for whoever handed in {quest:96391} (the {item:274268} of the spies, in the Dwarf and Gnome starts): {npc:264936} gives {quest:96393}, the head of the last boss for King Magni, about 3,200 XP. Out of Ironforge's gate first, east past Kharanos to his camp above {object:149024}: about 10 minutes there and back. Short on time? Skip it."] = "Seulement pour qui a rendu {quest:96391} (la {item:274268} des espions, dans les départs nain et gnome) : {npc:264936} donne {quest:96393}, la tête du dernier boss pour le roi Magni, environ 3 200 XP. D'abord par la porte de Forgefer, vers l'est passé Kharanos jusqu'à son camp au-dessus de la carrière de Gol'Bolar : une dizaine de minutes aller et retour. Peu de temps ? Le passer.",

	-- Step 4: Ironforge: Thom Filch and Afadra Dunwall
	-- {zone:1455} Ironforge · {npc:265003} Thom Filch · {npc:264943} Afadra Dunwall
	["{zone:1455}: {npc:265003} and {npc:264943}"] = "{zone:1455} : {npc:265003} et {npc:264943}",
	-- {npc:1573} Gryth Thurden · {object:32372} Great Forge · {object:171709} High Seat · {npc:265003} Thom Filch · {npc:264943} Afadra Dunwall
	["{npc:1573}, the gryphon master, stands in the {object:32372}: take the flight path on the way. Then west past the {object:171709}: {npc:265003} and {npc:264943} stand a few steps apart, by the way down to the dungeon."] = "{npc:1573}, le maître des griffons, se tient dans la Grande Forge : prendre le point de vol au passage. Puis vers l'ouest, passé le Haut Siège : {npc:265003} et {npc:264943} se tiennent à quelques pas l'un de l'autre, près du chemin qui descend au donjon.",

	-- Step 5: Before entering the Hall of Thanes
	["Before entering the Hall of Thanes"] = "Avant d'entrer dans la Salle des Thanes",
	-- {object:171709} High Seat
	["From the {object:171709}, the cobwebbed passage on the left goes down to the door. Mind the edges on the way: the lava below kills."] = "Depuis le Haut Siège, le passage couvert de toiles d'araignée à gauche descend jusqu'à la porte. Attention aux bords en chemin : la lave en contrebas tue.",
	-- {quest:96403} Important Heirlooms · {npc:265003} Thom Filch · {quest:96394} The Restless Dead · {npc:264943} Afadra Dunwall · {quest:96393} Old Ironforge Incursion · {npc:264936} Earthseer Farsen
	["In the log: {quest:96403} ({npc:265003}) and {quest:96394} ({npc:264943}); {quest:96393} for whoever took it from {npc:264936}. Share each quest with the group: click it in the quest log, then Share."] = "Dans le journal : {quest:96403} ({npc:265003}) et {quest:96394} ({npc:264943}) ; {quest:96393} pour qui l'a prise chez {npc:264936}. Partager chaque quête avec le groupe : clic sur la quête dans le journal, puis Partager.",
	["The Hall of Thanes"] = "La salle des Thanes",

	-- Step 6: The Hall of Thanes: along the way
	["The Hall of Thanes: along the way"] = "La Salle des Thanes : en chemin",

	-- Step 7: Anvilmar's Rest: Faldrim Anvilmar
	-- {npc:261306} Faldrim Anvilmar
	["Anvilmar's Rest: {npc:261306}"] = "Le Repos d'Anvilmar : {npc:261306}",
	-- {npc:265002} Ghostly Attendant · {npc:261306} Faldrim Anvilmar
	["The {npc:265002} waits in the chamber west of the entrance: her quest is the first boss. {npc:261306} walks round the great tomb of the next room: clear the ghosts around it first. His Anvilmar's Curse slows the tank's attacks and spells for a long time: a Mage or a Druid can remove it. His Mind Blast can be interrupted."] = "{npc:265002} attend dans la salle à l'ouest de l'entrée : sa quête est le premier boss. {npc:261306} fait le tour du grand tombeau de la salle suivante : nettoyer d'abord les fantômes autour. Sa Malédiction d'Anvilmar ralentit longtemps les attaques et les sorts du tank : un mage ou un druide peut la retirer. Son Attaque mentale peut être interrompue.",
	-- {npc:264943} Afadra Dunwall
	-- plural, as words: Enraged Apparitions = {npc:263389} Enraged Apparition · Tormented Souls = {npc:263390} Tormented Soul · Dwarven Heirlooms = {item:274289} Dwarven Heirloom
	["The ghosts of the first chambers are {npc:264943}'s: Enraged Apparitions and Tormented Souls. The Dwarven Heirlooms lie all over the dungeon, many on candle-lit ledges of the corridors; the vaults of the last room hold enough for everyone, so nobody needs to race for them."] = "Les fantômes des premières salles sont pour {npc:264943} : apparitions enragées et âmes tourmentées. Les héritages nains sont partout dans le donjon, beaucoup sur des corniches éclairées de bougies dans les couloirs ; les caveaux de la dernière salle en contiennent assez pour tout le monde, inutile de se les disputer.",
	-- {npc:265002} Ghostly Attendant
	["{npc:265002}, on the way back too"] = "{npc:265002}, aussi au retour",

	-- Step 8: The fire elemental of the cavern
	["The fire elemental of the cavern"] = "L'élémentaire de feu de la caverne",
	-- {object:147516} Dark Iron · {npc:263438} Dark Iron Summoner
	-- plural, as words: Bloodhound Runts = {npc:263470} Bloodhound Runt
	["South-east out of Anvilmar's Rest: {object:147516} dwarves from here on. Bloodhound Runts leave a disease that makes their target take more damage (Stoneform or a poultice clears it); Engineers throw dynamite; Summoners call fire elementals: interrupt them. Ranged players can shoot the kegs of blasting powder to hit the packs around them. In the natural cavern, the fire elemental boss burns everyone near him: kill the {npc:263438} beside him first, ranged players keep away, and the healer watches the melee too."] = "Sortie au sud-est du Repos d'Anvilmar : des nains {object:147516} à partir d'ici. Les avortons de limier laissent une maladie qui fait subir plus de dégâts (Forme de pierre ou un cataplasme l'enlève) ; les ingénieurs lancent de la dynamite ; les invocateurs appellent des élémentaires de feu : les interrompre. Les joueurs à distance peuvent tirer sur les tonneaux de poudre explosive pour toucher les groupes autour. Dans la caverne naturelle, le boss élémentaire de feu brûle tous ceux qui l'entourent : tuer d'abord l'{npc:263438} à côté de lui, les joueurs à distance restent loin, et le soigneur surveille aussi les joueurs au corps à corps.",
	["Its name differs between sources (Infurnus in the dungeon journal, Magmatus in the guides): the only fire elemental boss of the dungeon."] = "Son nom change selon les sources (Infurnus dans le journal des donjons, Magmatus dans les guides) : le seul boss élémentaire de feu du donjon.",
	["The fire elemental is down"] = "L'élémentaire de feu est tombé",

	-- Step 9: Plunder
	-- {object:147516} Dark Iron · {npc:261311} Plunder
	["Back in the halls, a pack of four {object:147516} dwarves stands between two kegs: shoot the kegs from afar first. {npc:261311}, a stone golem, walks the hallway after it: pull him away from the others and tank him with his back to a wall, as he knocks back and charges whoever stands close."] = "De retour dans les salles, un groupe de quatre nains {object:147516} se tient entre deux tonneaux : tirer d'abord sur les tonneaux de loin. {npc:261311}, un golem de pierre, arpente le couloir qui suit : l'attirer à l'écart des autres et le tanker dos à un mur, car il repousse et charge ceux qui sont près de lui.",

	-- Step 10: The Reliquary of Kings: Durgen Dirgehammer
	-- {npc:261319} Durgen Dirgehammer
	["The Reliquary of Kings: {npc:261319}"] = "Le Reliquaire des rois : {npc:261319}",
	-- {npc:261319} Durgen Dirgehammer · {quest:96393} Old Ironforge Incursion · {item:281030} Treaty of Understanding
	-- plural, as words: Lesser Stone Golems = {npc:263466} Lesser Stone Golem
	["North over the bridge of the Lesser Stone Golems to the round last room. Clear it before the pull: {npc:261319} fears the whole group and whatever is left joins in. Kill his two Lesser Stone Golems first. Each player on {quest:96393} loots the head. Behind one of the vault doors of the room, the {item:281030}: each player clicks it for their own quest."] = "Vers le nord par le pont des golems de pierre inférieurs jusqu'à la dernière salle, ronde. La nettoyer avant d'attaquer : {npc:261319} fait fuir de peur tout le groupe et ce qui reste se joint au combat. Tuer d'abord ses deux golems de pierre inférieurs. Chaque joueur qui a {quest:96393} ramasse la tête. Derrière l'une des portes de caveau de la salle, le {item:281030} : chaque joueur clique dessus pour sa propre quête.",
	-- {item:281030} Treaty of Understanding
	["{item:281030}, behind a vault door of the room"] = "{item:281030}, derrière une porte de caveau de la salle",

	-- Step 11: King Magni: Old Ironforge Incursion
	-- {quest:96393} Old Ironforge Incursion
	["King Magni: {quest:96393}"] = "Le roi Magni : {quest:96393}",
	-- {object:171709} High Seat
	["Back out the way you came in: King Magni sits on the {object:171709}, east of the door."] = "Ressortir par le même chemin : le roi Magni siège sur le Haut Siège, à l'est de la porte.",

	-- Step 12: Ironforge rewards
	-- {zone:1455} Ironforge
	["{zone:1455} rewards"] = "Récompenses à {zone:1455}",
	-- {object:171709} High Seat · {zone:1453} Stormwind · {object:171524} Tinker Town
	["Back out the way you came in. King Magni sits on the {object:171709}, east of the door. Last stop of the chapter: the route's own guide comes back once these are handed in, and goes on in {zone:1453} (the tram from {object:171524})."] = "Ressortir par le même chemin. Le roi Magni siège sur le Haut Siège, à l'est de la porte. Dernier arrêt du chapitre : le guide du parcours revient une fois ces quêtes rendues, et continue à {zone:1453} (le tram depuis {object:171524}).",

	-- No longer in the guide (its English changed or it went away): reuse or delete.
	-- ["Only for whoever handed in {quest:96391} (the {item:274268} of the spies, in the Dwarf and Gnome starts): {npc:264936} gives {quest:96393}, the head of the last boss for King Magni, about 3,200 XP. Out of Ironforge's gate, east past Kharanos to his camp above {object:149024}: about 10 minutes there and back. Short on time? Skip it."] = "Seulement pour qui a rendu {quest:96391} (la {item:274268} des espions, dans les départs nain et gnome) : {npc:264936} donne {quest:96393}, la tête du dernier boss pour le roi Magni, environ 3 200 XP. Par la porte de Forgefer, vers l'est passé Kharanos jusqu'à son camp au-dessus de la carrière de Gol'Bolar : une dizaine de minutes aller et retour. Peu de temps ? Le passer.",
}
