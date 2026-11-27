-- French (frFR): the guide groupe-alliance/02-rendez-vous-hurlevent (guides/02-rendez-vous-hurlevent.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1436} Westfall
	["Group · Meeting in {zone:1436}"] = "Groupe · Rendez-vous dans la {zone:1436}",

	-- Step 1: Sentinel Hill: playing the route together
	-- {object:81} Sentinel Hill
	["{object:81}: playing the route together"] = "Colline des sentinelles ({object:81}) : jouer le parcours à plusieurs",
	-- {zone:1436} Westfall
	["Polestar's route brings every race to {zone:1436}, each at its own level: Humans at about 11, Dwarves and Gnomes at about 14, Night Elves and the Skyborne (from Zephras Isle) at about 15. Whoever arrives first goes on: quests already handed in tick themselves for the others, and a friend ahead helps with their quests when you play together. Group XP stays good within about 4 levels."] = "Le parcours de Polestar amène chaque race en {zone:1436}, chacune à son niveau : les humains vers 11, les nains et les gnomes vers 14, les elfes de la nuit et les Éolides (depuis Zephras) vers 15. Le premier arrivé continue : les quêtes déjà rendues se cochent seules pour les autres, et un ami en avance aide aux quêtes des autres quand le groupe joue ensemble. L'XP de groupe reste bonne jusqu'à environ 4 niveaux d'écart.",
	["Polestar's group tools: the party panel (/polestar party) shows each friend's guide, step and level; its \"Sync to my guide\" button asks the others to come to your step, and each one accepts or declines. The option \"Wait for the group\" holds a hand-in until the friends in the zone are ready. Share a quest from the quest log: click it, then Share."] = "Les outils de groupe de Polestar : le panneau de groupe (/polestar party) montre le guide, l'étape et le niveau de chaque ami ; son bouton « Synchro sur mon guide » propose aux autres de rejoindre son étape, et chacun accepte ou refuse. Le réglage « Attendre le groupe » retient un rendu tant que les amis de la zone ne sont pas prêts. Partager une quête depuis le journal : clic sur la quête, puis Partager.",
	["Dungeons: a card offers each dungeon chapter of the group at the right moment of the route. The chapter opens in a tab of its own and the route comes back when it ends; /ga donjon shows the card again."] = "Donjons : une carte propose chaque chapitre de donjon du groupe au bon moment du parcours. Le chapitre s'ouvre dans son propre onglet et le parcours revient à la fin ; /ga donjon remontre la carte.",
	["Read: tick this line to close this tab and go back to the route"] = "Lu : cocher cette ligne pour fermer cet onglet et revenir au parcours",
}
