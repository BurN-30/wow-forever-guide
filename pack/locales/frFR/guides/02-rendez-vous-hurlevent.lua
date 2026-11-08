-- French (frFR): the guide groupe-alliance/02-rendez-vous-hurlevent (guides/02-rendez-vous-hurlevent.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1453} Stormwind
	["Group 1 · Meet in {zone:1453}"] = "Groupe 1 · Rendez-vous à {zone:1453}",

	-- Step 1: Night Elves: Darnassus to Stormwind
	-- {zone:1457} Darnassus · {zone:1453} Stormwind
	["Night Elves: {zone:1457} to {zone:1453}"] = "Elfes de la nuit : de {zone:1457} à {zone:1453}",
	-- {zone:1453} Stormwind
	["Portal down to Rut'theran Village, boat to Auberdine, then the {zone:1453} boat from the same pier."] = "Portail vers Rut'theran, bateau pour Auberdine, puis bateau pour {zone:1453} sur le même ponton.",
	["Druids: Cure Poison at 14, Aquatic Form at 16 and Cat Form at 20 come from class quests (Polestar guides, Class)."] = "Druides : Guérison du poison (14), Forme aquatique (16) et Forme de félin (20) s'obtiennent par des quêtes de classe (guides Polestar, Classe).",

	-- Step 2: Stormwind: meeting point
	-- {zone:1453} Stormwind
	["{zone:1453}: meeting point"] = "{zone:1453} : point de rendez-vous",
	["Play at your own pace: quests already turned in tick themselves and the guide picks up where you are, so friends who play at other times can go ahead or fall behind. Together, group XP is best within 4 levels; ahead of the others, help them with their quests when you play together."] = "Chacun joue à son rythme : les quêtes déjà rendues se cochent toutes seules et le guide reprend où vous en êtes, donc on peut prendre de l'avance ou du retard sur les autres. Ensemble, l'XP de groupe est meilleure à 4 niveaux d'écart ou moins ; en avance, aidez les autres sur leurs quêtes quand vous jouez ensemble.",
	["Group up with your friends when they are online"] = "Former le groupe avec les autres s'ils sont connectés",

	-- No longer in the guide (its English changed or it went away): reuse or delete.
	-- ["Group XP: keep the whole group within 4 levels. Ahead? Play class quests or professions solo, not zone quests."] = "XP de groupe : pas plus de 4 niveaux d'écart. En avance ? Quêtes de classe ou métiers en solo, pas les quêtes de zone.",
	-- ["Group up with your friends"] = "Former le groupe avec les autres",
}
