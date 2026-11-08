-- French (frFR): the pack's own texts (its title and notes, its guides' folders).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Pack
	["Group Alliance 1-33"] = "Groupe Alliance 1-33",
	["Alliance route for friends who play alone or together: start guides, Stormwind meeting point, zones, the four Forever dungeons, the Deadmines and the Stockade, group quests to take or skip."] = "Parcours Alliance pour des amis qui jouent seuls ou ensemble : guides de départ, rendez-vous à Hurlevent, zones, les quatre donjons de Forever, les Mortemines et la Prison, quêtes de groupe à faire ou à passer.",

	-- Folders
	["Group Alliance"] = "Groupe Alliance",

	-- No longer in the guide (its English changed or it went away): reuse or delete.
	-- ["Alliance route for a group: start guides, Stormwind meeting point, zones and the four Forever dungeons."] = "Parcours Alliance en groupe : guides de départ, rendez-vous à Hurlevent, zones et les quatre donjons de Forever.",
}
