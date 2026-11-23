-- French (frFR): the guide groupe-alliance/greffe/ruines-de-lordaeron (guides/greffe/ruines-de-lordaeron.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["Dungeon · Ruins of Lordaeron (17-22)"] = "Donjon · Ruines de Lordaeron (17-22)",

	-- Step 1: Auberdine: the boat to Southshore
	["Auberdine: the boat to Southshore"] = "Auberdine : le bateau pour Austrivage",
	-- {zone:1420} Tirisfal Glades · {object:1162} Menethil Harbor
	["Ruins of Lordaeron: a 5-player Forever dungeon in {zone:1420}, levels 15 to 22 in the group finder: at 18 or more it goes well. The boat for {object:1162} goes on to Southshore: stay aboard at Menethil."] = "Ruines de Lordaeron : un donjon de Forever pour 5 joueurs dans les {zone:1420}, niveaux 15 à 22 dans la recherche de groupe : à 18 ou plus, il passe bien. Le bateau pour {object:1162} continue jusqu'à Austrivage : rester à bord à Menethil.",
	["Keep 5 free quest log slots. Horde land past Southshore: travel together."] = "Garder 5 places libres dans le journal. Terre de la Horde passé Austrivage : voyager ensemble.",
	["Boat to Southshore"] = "Bateau pour Austrivage",

	-- Step 2: Southshore
	["Southshore"] = "Austrivage",
	["Off the boat, the flight master stands by the inn: take the flight path, then sell and repair."] = "En descendant du bateau, le maître de vol se tient près de l'auberge : prendre le point de vol, puis vendre et réparer.",

	-- Step 3: Ruins of Lordaeron entrance
	["Ruins of Lordaeron entrance"] = "Entrée des Ruines de Lordaeron",
	["Horde land: keep together and clear of the roads' guards. North past Hillsbrad Fields, round Dalaran, then swim north up Lordamere Lake into Tirisfal and follow the road to the ruined capital. If you die inside, the spirit healer is right outside the dungeon."] = "Terre de la Horde : rester groupés, à l'écart des gardes des routes. Vers le nord par les champs de Hautebrande, autour de Dalaran, puis nager vers le nord sur le lac Lordamere jusqu'à Tirisfal et suivre la route jusqu'à la capitale en ruine. En cas de mort à l'intérieur, le gardien des âmes est juste devant le donjon.",
	["Ruins of Lordaeron"] = "Ruines de Lordaeron",

	-- Step 4: Captain Truman
	-- {quest:95195} Bloodied Insignia
	["On the left just after the portal. The bosses can be done in any order. Any undead may drop a {quest:95195}: right-click it, then keep looting them, there are plenty for everyone."] = "À gauche juste après le portail. Les boss se font dans n'importe quel ordre. N'importe quel mort-vivant peut lâcher un {quest:95195} : clic droit dessus, puis continuer à les ramasser, il y en a pour tout le monde.",
	["Share each quest with the group: click it in the quest log, then Share."] = "Partager chaque quête avec le groupe : clic sur la quête dans le journal, puis Partager.",
	-- {quest:95195} Bloodied Insignia
	["{quest:95195}, from any undead: right-click it"] = "{quest:95195}, sur n'importe quel mort-vivant : clic droit dessus",

	-- Step 5: Witherfang
	-- {npc:250483} Witherfang
	["The spider wing, King's Alley. {npc:250483} patrols with two spiders: kill them first and cleanse Leech Poison off the tank. Spider packs patrol too: pull with care."] = "L'aile des araignées, allée du Roi. {npc:250483} patrouille avec deux araignées : les tuer d'abord et dissiper le poison sur le tank. Des groupes d'araignées patrouillent aussi : tirer avec prudence.",

	-- Step 6: The Baron
	["Right from the entrance. Skeletons and banshees guard him; the banshees silence, so stun the packs. His head drops for everyone on the quest. The crypt door with a banshee in front of him is one of the Crest's spots."] = "À droite depuis l'entrée. Squelettes et banshees le gardent ; les banshees réduisent au silence, étourdir les groupes. Sa tête tombe pour chaque joueur qui a la quête. La porte de crypte gardée par une banshee devant lui est une des places possibles de l'écusson.",

	-- Step 7: Lordamere Overlook: Viktor the Vile (optional)
	-- {npc:256035} Viktor the Vile
	["Lordamere Overlook: {npc:256035} (optional)"] = "Surplomb de Lordamere : {npc:256035} (facultatif)",
	-- plural, as words: Flesh Golems = {npc:1805} Flesh Golem
	["Flesh Golems hit hard and knock you into other packs; ghouls come in threes and fours. Viktor is optional: light the chimney of the ruined house in the south-west, survive 4 to 6 waves (leave the last enemy of each wave alive a moment so casters can drink), then he jumps out. Short group? Skip him."] = "Les golems de chair frappent fort et projettent dans d'autres groupes ; les goules viennent par trois ou quatre. Viktor est facultatif : allumer la cheminée de la maison en ruine au sud-ouest, tenir 4 à 6 vagues (laisser vivre un moment le dernier ennemi de chaque vague pour que les lanceurs de sorts boivent), puis il surgit. Groupe réduit ? Le laisser.",
	-- {npc:256035} Viktor the Vile
	["{npc:256035}, or skipped"] = "{npc:256035}, ou laissé",

	-- Step 8: Market Street: The Abandoned (optional)
	-- {npc:250631} The Abandoned
	["Market Street: {npc:250631} (optional)"] = "Rue du Marché : {npc:250631} (facultatif)",
	-- {npc:250631} The Abandoned
	["The statue with green eyes starts 3 waves, and the skeleton mage in the south corridor must die too; then {npc:250631}: Frost Nova, slows melee, drains the tank. Optional. The top of the west tower next to it is one of the Crest's spots."] = "La statue aux yeux verts lance 3 vagues, et le mage squelette du couloir sud doit mourir aussi ; puis {npc:250631} : Nova de givre, ralentit le corps à corps, draine le tank. Facultatif. Le haut de la tour ouest, à côté, est une des places possibles de l'écusson.",
	-- {npc:250631} The Abandoned
	["{npc:250631}, or skipped"] = "{npc:250631}, ou laissé",

	-- Step 9: The Crest of Lordaeron
	-- {quest:95189} Crest of Lordaeron
	["The {quest:95189}"] = "{quest:95189}",
	-- {npc:250660} The Baron · {npc:256097} Bjork
	["One crest per run, at a random spot with no mark on the minimap: the top of the east tower (left of the top floor doors), the banshee crypt door before {npc:250660}, the top of the west tower, the foot of the north-west tower by the double stairs, or the wall of {npc:256097}'s gazebo (nearly invisible: hover the wall)."] = "Un seul écusson par passage, à une place au hasard, sans marque sur la minicarte : le haut de la tour est (à gauche des portes du dernier étage), la porte de crypte à banshee devant {npc:250660}, le haut de la tour ouest, le pied de la tour nord-ouest près du double escalier, ou le mur du kiosque de {npc:256097} (presque invisible : passer la souris sur le mur).",
	-- {quest:95189} Crest of Lordaeron
	["{quest:95189}: each player clicks it"] = "{quest:95189} : chaque joueur clique dessus",

	-- Step 10: Bjork
	["The undead troll patrolling the north-west: a simple fight, just wait out his short Anti-Magic Shield."] = "Le troll mort-vivant qui patrouille au nord-ouest : un combat simple, attendre juste la fin de son court bouclier anti-magie.",

	-- Step 11: Rath'mael
	-- {npc:255699} Lordaeron Captain
	["The graveyard at the back. His one spell, Flamestrike, lands where the tank stood when he began it: step out at once, or stun him to stop it. The rare {npc:255699} is friendly to the Alliance: leave him be."] = "Le cimetière du fond. Son seul sort, Choc de flammes, tombe là où se tenait le tank au début de l'incantation : en sortir tout de suite, ou l'étourdir pour l'arrêter. Le rare {npc:255699} est amical pour l'Alliance : le laisser.",
	-- {quest:95195} Bloodied Insignia
	["{quest:95195}, from the undead all run long"] = "{quest:95195}, sur les morts-vivants pendant tout le donjon",
	-- {npc:250657} Rath'mael
	["Blood-stained letter, by {npc:250657}: each player clicks their own"] = "Lettre tachée de sang, près de {npc:250657} : chaque joueur clique la sienne",

	-- Step 12: Captain Truman: Abominable Creatures
	-- {npc:265701} Captain Truman
	["Back to the entrance on the way out: {npc:265701} takes the Baron's head."] = "Retour à l'entrée en sortant : {npc:265701} prend la tête du Baron.",
	-- {npc:265701} Captain Truman
	["{npc:265701}, by the entrance"] = "{npc:265701}, près de l'entrée",

	-- Step 13: Southshore: the boat to Menethil Harbor
	-- {object:1162} Menethil Harbor
	["Southshore: the boat to {object:1162}"] = "Austrivage : le bateau pour {object:1162}",
	-- {object:1162} Menethil Harbor · {zone:1432} Loch Modan
	["Back south to Southshore by the way you came. The boat calls at Auberdine, then {object:1162}: get off at Menethil, where the route's next guide starts ({zone:1432})."] = "Retour vers le sud jusqu'à Austrivage par le même chemin. Le bateau passe par Auberdine, puis {object:1162} : descendre à Menethil, où commence le guide suivant du parcours ({zone:1432}).",
	-- {object:1162} Menethil Harbor
	["Boat to {object:1162}"] = "Bateau pour {object:1162}",
	-- {zone:1453} Stormwind
	["Back to the route: click its tab now. This tab stays open for the three {zone:1453} rewards: the route reaches {zone:1453} at about 20, by the Deeprun Tram, and Polestar lists the hand-ins once there; this tab closes when they are in."] = "Retour au parcours : cliquer maintenant sur son onglet. Cet onglet reste ouvert pour les trois récompenses de {zone:1453} : le parcours arrive à {zone:1453} vers 20, par le Tram des profondeurs, et Polestar y affiche les rendus ; cet onglet se ferme une fois les quêtes rendues.",

	-- Step 14: Stormwind rewards
	-- {zone:1453} Stormwind
	["{zone:1453} rewards"] = "Récompenses à {zone:1453}",
	-- {npc:466} General Marcus Jonathan · {npc:14450} Orphan Matron Nightingale · {npc:15991} Lady Dena Kennedy · {zone:1431} Duskwood
	["{npc:466} stands at the city gate, {npc:14450} in the orphanage, {npc:15991} in the keep. The Matron gives the next letter, for Darkshire in {zone:1431}: the route stops there at about 25."] = "{npc:466} se tient à la porte de la ville, {npc:14450} à l'orphelinat, {npc:15991} dans le donjon. La matrone donne la lettre suivante, pour Sombre-Comté dans le {zone:1431} : le parcours s'y arrête vers 25.",
	-- {npc:228} Avette Fellwood
	["For {npc:228} in Darkshire"] = "Pour {npc:228}, à Sombre-Comté",
}
