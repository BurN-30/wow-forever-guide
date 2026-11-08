-- French (frFR): the guide groupe-alliance/12-dalaran (guides/12-dalaran.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["Group 11 · City of Dalaran (dungeon 30-33)"] = "Groupe 11 · Cité de Dalaran (donjon 30-33)",

	-- Step 1: Stormwind: the end of the Defias story
	-- {zone:1453} Stormwind
	["{zone:1453}: the end of the Defias story"] = "{zone:1453} : la fin de l'histoire des Défias",
	-- {npc:1646} Baros Alexston · {object:2159} City Hall · {object:2098} Cathedral Square · {object:2100} Old Town · {npc:482} Elling Trias · {object:2096} Trade District · {npc:7766} Tyrion · {object:2117} Stormwind Keep
	["Only if you did The Stockade Riots. {npc:1646} is in the {object:2159} on {object:2098}, Mathias Shaw upstairs at SI:7 in {object:2100}, {npc:482} upstairs in the cheese shop of the {object:2096}, {npc:7766} in the garden beside {object:2117}."] = "Uniquement si vous avez fait Les émeutes de la Prison. {npc:1646} se trouve dans l'{object:2159} sur la {object:2098}, Mathias Shaw à l'étage au SI:7 dans l'{object:2100}, {npc:482} à l'étage dans la fromagerie de l'{object:2096}, {npc:7766} dans le jardin près de l'{object:2117}.",

	-- Step 2: Clara's apples
	["Clara's apples"] = "Les pommes de Clara",
	-- {zone:1453} Stormwind · {item:4306} Silk Cloth
	["The bowl of apples sits on the table of the farmhouse just outside the {zone:1453} gate, south-west of the road. {item:4306}: from your bags, humanoids or the Auction House."] = "Le bol de pommes repose sur la table de la ferme juste à l'extérieur de la porte de {zone:1453}, au sud-ouest de la route. {item:4306} : dans vos sacs, sur des humanoïdes ou à l'hôtel des ventes.",

	-- Step 3: The Attack!
	-- {npc:1755} Marzon the Silent Blade
	["Overhear Lescovar and {npc:1755} in the garden, then kill both"] = "Écouter Lescovar et {npc:1755} dans le jardin, puis les tuer tous les deux",

	-- Step 4: Brotherhood's End
	-- {npc:1749} Lady Katrana Prestor · {object:2117} Stormwind Keep · {item:2933} Seal of Wrynn
	["{npc:1749}, in the throne room of {object:2117}: {item:2933}"] = "{npc:1749}, dans la salle du trône de l'{object:2117} : {item:2933}",

	-- Step 5: Stormwind: two dungeon quests
	-- {zone:1453} Stormwind
	["{zone:1453}: two dungeon quests"] = "{zone:1453} : deux quêtes du donjon",
	-- {npc:5502} Shylamiir · {object:2096} Trade District · {npc:5694} High Sorcerer Andromath · {object:2101} Mage Quarter
	["{npc:5502} is in the {object:2096}, {npc:5694} in the {object:2101} tower."] = "{npc:5502} est dans {object:2096}, {npc:5694} dans la tour de {object:2101}.",
	-- {quest:92432} An Alarming Request
	["Group: level 30 required for {quest:92432}, the quest that opens the way to Dalaran. Below 30? Level up first."] = "Groupe : niveau 30 requis pour {quest:92432}, la quête qui ouvre la route de Dalaran. En dessous de 30 ? Monter de niveau d'abord.",

	-- Step 6: Southshore: Emissary Jacques
	-- {npc:247264} Emissary Jacques
	["Southshore: {npc:247264}"] = "Austrivage : {npc:247264}",
	["His quest needs level 30: below that, the guide waits here. Ahead of the others? Take it, they can take it from him later on their own."] = "Sa quête demande le niveau 30 : en dessous, le guide attend ici. En avance sur les autres ? Prenez-la, ils la prendront plus tard auprès de lui de leur côté.",

	-- Step 7: Image of Archmage Modera
	-- {object:1772} Tarren Mill
	["North-west past Hillsbrad Fields, by Dalaran's outer sewer. Avoid {object:1772}."] = "Au nord-ouest après les champs de Hautebrande, près de l'égout extérieur de Dalaran. Éviter {object:1772}.",

	-- Step 8: City of Dalaran entrance
	["City of Dalaran entrance"] = "Entrée de la Cité de Dalaran",
	["Group of 5. Open the sewer gate with the key from Modera and follow the large pipe."] = "Groupe de 5. Ouvrir la grille de l'égout avec la clé de Modera et suivre la grosse canalisation.",
	["City of Dalaran"] = "Cité de Dalaran",

	-- Step 9: Inside the dungeon
	["Inside the dungeon"] = "Dans le donjon",
	-- {item:251961} Arcane Mote
	["Blossom in the central garden, remnants everywhere, the {item:251961} at the Violet Citadel end."] = "Fleur dans le jardin central, rémanents partout, {item:251961} au bout, côté Citadelle pourpre.",
	["Share each quest with your group: click it in the quest log, then Share."] = "Partagez chaque quête au groupe : clic sur la quête dans le journal, puis Partager.",

	-- Step 10: Modera's rewards
	["Modera's rewards"] = "Récompenses de Modera",
	-- {object:1162} Menethil Harbor · {npc:5502} Shylamiir · {npc:5694} High Sorcerer Andromath · {zone:1453} Stormwind
	["Next: {object:1162}, where your hearthstone is still bound (Deepwater Tavern). {npc:5502} and {npc:5694} take their quests at the next guide's {zone:1453} stop."] = "Ensuite : {object:1162}, où votre pierre de foyer est toujours liée (taverne de l'Eau-profonde). {npc:5502} et {npc:5694} attendent leurs quêtes à l'étape de {zone:1453} du guide suivant.",

	-- No longer in the guide (its English changed or it went away): reuse or delete.
	-- ["Group 11 · City of Dalaran (dungeon 28-33)"] = "Groupe 11 · Cité de Dalaran (donjon 28-33)",
	-- ["His quest needs level 30: the whole group should wait for it."] = "Sa quête demande le niveau 30 : tout le groupe doit l'attendre.",
	-- ["{zone:1453} rewards"] = "Récompenses à {zone:1453}",
}
