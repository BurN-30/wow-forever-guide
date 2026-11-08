-- French (frFR): the guide groupe-alliance/06-ruines-de-lordaeron (guides/06-ruines-de-lordaeron.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["Group 5 · Ruins of Lordaeron (dungeon 17-21)"] = "Groupe 5 · Ruines de Lordaeron (donjon 17-21)",

	-- Step 1: Auberdine: boat to Southshore
	["Auberdine: boat to Southshore"] = "Auberdine : bateau pour Austrivage",
	-- {zone:1420} Tirisfal Glades · {zone:1453} Stormwind
	["Ruins of Lordaeron: a 5-player Forever dungeon in {zone:1420}, best at 16 to 22 (17 or more is comfortable). Alone? Skip it: the guide takes you to {zone:1453} for Redridge. The Southshore boat leaves from Auberdine's pier. Keep 4 free quest log slots."] = "Ruines de Lordaeron : un donjon de Forever pour 5 joueurs, à {zone:1420}, idéal de 16 à 22 (confortable dès 17). Seul ? La passer : le guide mène à {zone:1453} pour les Carmines. Le bateau pour Austrivage part du ponton d'Auberdine. Garder 4 places libres dans le journal.",

	-- Step 2: Southshore
	["Southshore"] = "Austrivage",

	-- Step 3: Ruins of Lordaeron entrance
	["Ruins of Lordaeron entrance"] = "Entrée des Ruines de Lordaeron",
	["Horde land: travel together. North past Hillsbrad Fields, around Dalaran, then swim north up Lordamere Lake into Tirisfal and follow the road. If you die inside, the spirit healer is right outside the dungeon."] = "Terres de la Horde : voyager ensemble. Au nord par les champs de Hautebrande, contourner Dalaran, puis nager vers le nord sur le lac Lordamere jusqu'à Tirisfal et suivre la route. Mort dans le donjon ? Le gardien des âmes est juste à la sortie.",
	["Ruins of Lordaeron"] = "Ruines de Lordaeron",

	-- Step 4: Captain Truman
	-- {quest:95195} Bloodied Insignia
	["On your left just after the portal. The bosses can be done in any order. Any undead may drop a {quest:95195}: right-click it, then keep looting them, there are plenty for everyone."] = "À gauche juste après le portail. Les boss se font dans n'importe quel ordre. N'importe quel mort-vivant peut lâcher {quest:95195} : clic droit dessus, puis continuer à les ramasser, il y en a pour tout le monde.",
	["Share each quest with your group: click it in the quest log, then Share."] = "Partagez chaque quête au groupe : clic sur la quête dans le journal, puis Partager.",
	-- {quest:95195} Bloodied Insignia
	["{quest:95195}, from any undead: right-click it"] = "{quest:95195}, sur n'importe quel mort-vivant : clic droit dessus",

	-- Step 5: Witherfang
	-- {npc:250483} Witherfang
	["The spider wing, King's Alley. {npc:250483} patrols with two spiders: kill them first and cleanse Leech Poison off the tank. Spider packs patrol too: pull with care."] = "L'aile des araignées, allée du Roi. {npc:250483} patrouille avec deux araignées : les tuer d'abord et dissiper le poison sur le tank. Des groupes d'araignées patrouillent aussi : tirer avec prudence.",

	-- Step 6: The Baron
	["Right from the entrance. Skeletons and banshees guard him; the banshees silence, so stun the packs. His head drops for everyone on the quest. The crypt door with a banshee in front of him is one of the Crest's spots."] = "À droite depuis l'entrée. Squelettes et banshees le gardent ; les banshees réduisent au silence, étourdir les groupes. Sa tête tombe pour chaque joueur qui a la quête. La porte de crypte gardée par une banshee devant lui est une des places possibles de l'écusson.",

	-- Step 7: Lordamere Overlook: Viktor the Vile (optional)
	-- {npc:256035} Viktor the Vile
	["Lordamere Overlook: {npc:256035} (optional)"] = "Belvédère de Lordamere : {npc:256035} (facultatif)",
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
	-- {npc:265701} Captain Truman
	["{npc:265701}, by the entrance"] = "{npc:265701}, près de l'entrée",

	-- Step 12: Stormwind rewards
	-- {zone:1453} Stormwind
	["{zone:1453} rewards"] = "Récompenses à {zone:1453}",
	-- {npc:466} General Marcus Jonathan · {npc:15991} Lady Dena Kennedy
	["{npc:466} by the gate, the Matron at the orphanage, {npc:15991} in the keep."] = "{npc:466} près de la porte, la matrone à l'orphelinat, {npc:15991} au donjon.",
	-- {zone:1431} Duskwood · {npc:228} Avette Fellwood · {item:279870} Tarnished Locket
	["Next letter for Darkshire, in {zone:1431} later: {npc:228} gives the {item:279870}"] = "Lettre suivante pour Sombre-Comté, plus tard au {zone:1431} : {npc:228} donne {item:279870}",

	-- No longer in the guide (its English changed or it went away): reuse or delete.
	-- ["Blood-stained letter, by a body in the graveyard"] = "Lettre tachée de sang, près d'un corps au cimetière",
	-- ["Group 5 · Ruins of Lordaeron (dungeon 15-20)"] = "Groupe 5 · Ruines de Lordaeron (donjon 15-20)",
	-- ["Horde land: travel as a group. The dungeon stairs are on the left of the outer courtyard."] = "Terres de la Horde : voyager en groupe. L'escalier du donjon est à gauche de la cour extérieure.",
	-- ["Inside the dungeon"] = "Dans le donjon",
	-- ["Next letter for Darkshire, in {zone:1431} later"] = "Lettre suivante pour Sombre-Comté, plus tard dans {zone:1431}",
	-- ["The Southshore boat leaves from Auberdine's pier. Keep 4 free quest log slots."] = "Le bateau pour Austrivage part du ponton d'Auberdine. Garder 4 places libres dans le journal.",
	-- ["{npc:265701} stands on the left just after the portal. Right-click each quest item as it drops; every player needs their own."] = "{npc:265701} est à gauche juste après le portail. Clic droit sur chaque objet de quête ramassé ; chacun a besoin du sien.",
	-- ["{quest:95189}, in a tower or side room"] = "{quest:95189}, dans une tour ou une salle annexe",
	-- ["{quest:95195}, from the undead"] = "{quest:95195}, sur les morts-vivants",
}
