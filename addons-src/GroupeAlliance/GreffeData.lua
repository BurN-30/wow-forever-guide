-- Groupe Alliance: where this pack's dungeon chapters join Polestar's own route
-- (Greffe.lua reads it; prototype of the branch greffe, two chapters so far).
--
-- One entry per chapter, in route order:
--   id       the chapter's guide id (a guide of this pack, category Dungeons, no `next`)
--   key      a short name, the key of the player's answer (PolestarCharDB.gaGreffe)
--   turnin   the hook: the chapter is offered once this quest is handed in (or one of a
--            list: a second hook for a race whose start does it, or for a character who came
--            from this pack's own route by another way)
--   accept   (instead of, or with, turnin) once this quest (or one of a list) is in the log
--            or handed in
--   min, max the player's level to offer it: below min it waits, above max it is
--            never offered (the chapter is behind the player)
--   done     quests of the chapter: one of them handed in, the chapter counts as done
--            (run before, with Polestar's Dungeons window or alone) and is never offered
--   dungeon  the Dungeons codex key (Polestar_Codex/Dungeons1.lua): Polestar's own heads-up
--            card for that dungeon is marked told once ours is shown, so the player is not
--            asked twice
--   route    Polestar's guide whose step hands in or takes the hook quest, in Polestar
--            0.4.2.2 (forever/alliance/...): read by tools/check-greffe.py and by whoever
--            checks the table on a new Polestar version; the hook itself is the quest, which
--            survives a guide moving or being renamed
--   name     the dungeon's name, per client language
--   where    one line under the name: place, group, levels
local _, ns = ...
local GA = ns.GA or {}
ns.GA = GA

GA.GREFFE = {
	{
		id = "groupe-alliance/greffe/mortemines", key = "mortemines", dungeon = "deadmines",
		turnin = 155, min = 18, max = 24, done = { 166, 214 },
		route = "forever/alliance/03-loch-modan",
		name = { frFR = "Les Mortemines", enUS = "The Deadmines" },
		where = { frFR = "Sous Ruisselune, Marche de l'Ouest · groupe de 5 · niveaux 16 à 21",
			enUS = "Under Moonbrook, Westfall · group of 5 · levels 16 to 21" },
	},
	{
		id = "groupe-alliance/greffe/monastere-ecarlate", key = "monastere", dungeon = "scarlet-monastery",
		turnin = 1052, min = 34, max = 46, done = { 1053 },
		route = "forever/alliance/40-50/02-badlands",
		name = { frFR = "Le Monastère écarlate", enUS = "The Scarlet Monastery" },
		where = { frFR = "Clairières de Tirisfal · groupe de 5 · niveaux 30 à 42",
			enUS = "Tirisfal Glades · group of 5 · levels 30 to 42" },
	},

	-- Lot A: the chapters from the meeting point to the City of Dalaran (pack/guides/greffe/).
	-- switchId: the id the chapter takes at the switch (its guide id in the pack up to 0.12.x),
	-- read by whoever makes the switch; Greffe.lua does not read it.
	{
		id = "groupe-alliance/greffe/rendez-vous", key = "rendez-vous",
		turnin = 109, min = 10, max = 17,
		route = "forever/alliance/02-westfall", switchId = "groupe-alliance/02-rendez-vous-hurlevent",
		name = { frFR = "Rendez-vous dans la Marche de l'Ouest", enUS = "Meeting in Westfall" },
		where = { frFR = "Colline des sentinelles · jouer le parcours à plusieurs",
			enUS = "Sentinel Hill · playing the route together" },
	},
	{
		id = "groupe-alliance/greffe/salle-des-thanes", key = "thanes", dungeon = "the-hall-of-thanes",
		turnin = 13, min = 13, max = 19, done = { 96403, 96394 },
		route = "forever/alliance/02-westfall", switchId = "groupe-alliance/04-salle-des-thanes",
		name = { frFR = "La Salle des Thanes", enUS = "The Hall of Thanes" },
		where = { frFR = "Sous Forgefer · groupe de 5 · niveaux 13 à 20",
			enUS = "Under Ironforge · group of 5 · levels 13 to 20" },
	},
	{
		id = "groupe-alliance/greffe/ruines-de-lordaeron", key = "ruines", dungeon = "ruins-of-lordaeron",
		turnin = { 947, 2139 }, accept = 948, min = 17, max = 22, done = { 95250 },
		route = "forever/alliance/03-darkshore", switchId = "groupe-alliance/06-ruines-de-lordaeron",
		name = { frFR = "Les Ruines de Lordaeron", enUS = "The Ruins of Lordaeron" },
		where = { frFR = "Clairières de Tirisfal, par le bateau de Baie-du-Sud · groupe de 5 · niveaux 15 à 22",
			enUS = "Tirisfal Glades, by the Southshore boat · group of 5 · levels 15 to 22" },
	},
	{
		id = "groupe-alliance/greffe/brassenoire", key = "brassenoire", dungeon = "blackfathom-deeps",
		turnin = { 1025, 1054, 98027 }, min = 23, max = 28, done = { 1275 },
		route = "forever/alliance/06-ashenvale",
		name = { frFR = "Les Profondeurs de Brassenoire", enUS = "Blackfathom Deeps" },
		where = { frFR = "Grève de Zoram, Orneval · groupe de 5 · niveaux 24 à 32",
			enUS = "The Zoram Strand, Ashenvale · group of 5 · levels 24 to 32" },
	},
	{
		id = "groupe-alliance/greffe/prison", key = "prison", dungeon = "stormwind-stockade",
		turnin = { 269, 72, 293 }, min = 25, max = 31, done = { 387 },
		route = "forever/alliance/05-duskwood", switchId = "groupe-alliance/08b-prison",
		name = { frFR = "La Prison", enUS = "The Stockade" },
		where = { frFR = "Hurlevent · groupe de 5 · niveaux 24 à 32",
			enUS = "Stormwind · group of 5 · levels 24 to 32" },
	},
	{
		id = "groupe-alliance/greffe/site-de-fouilles", key = "fouilles", dungeon = "excavation-site-wetlands",
		turnin = 95737, min = 27, max = 34, done = { 95647, 95646 },
		route = "forever/alliance/06-wetlands", switchId = "groupe-alliance/10-site-de-fouilles",
		name = { frFR = "Le Site de fouilles : les Paluns", enUS = "Excavation Site: Wetlands" },
		where = { frFR = "Les Paluns · groupe de 5 · niveaux 26 à 33",
			enUS = "Wetlands · group of 5 · levels 26 to 33" },
	},
	{
		id = "groupe-alliance/greffe/gnomeregan", key = "gnomeregan", dungeon = "gnomeregan",
		turnin = 293, min = 29, max = 35, done = { 2929 },
		route = "forever/alliance/06-wetlands", switchId = "groupe-alliance/10b-gnomeregan",
		name = { frFR = "Gnomeregan", enUS = "Gnomeregan" },
		where = { frFR = "Dun Morogh · groupe de 5 · niveaux 29 à 38",
			enUS = "Dun Morogh · group of 5 · levels 29 to 38" },
	},
	{
		id = "groupe-alliance/greffe/kraal-de-tranchebauge", key = "kraal", dungeon = "razorfen-kraul",
		turnin = 1100, min = 29, max = 37, done = { 1101, 1144 },
		route = "forever/alliance/30-40/03-ashenvale",
		name = { frFR = "Le Kraal de Tranchebauge", enUS = "Razorfen Kraul" },
		where = { frFR = "Sud des Tarides · groupe de 5 · niveaux 29 à 38",
			enUS = "Southern Barrens · group of 5 · levels 29 to 38" },
	},
	{
		id = "groupe-alliance/greffe/dalaran", key = "dalaran", dungeon = "city-of-dalaran",
		accept = 92432, turnin = 92432, min = 30, max = 38, done = { 92457, 92458 },
		route = "forever/alliance/30-40/01-hillsbrad-foothills", switchId = "groupe-alliance/12-dalaran",
		name = { frFR = "La Cité de Dalaran", enUS = "The City of Dalaran" },
		where = { frFR = "Montagnes d'Alterac · groupe de 5 · niveaux 28 à 35",
			enUS = "Alterac Mountains · group of 5 · levels 28 to 35" },
	},
}

-- This pack's leveling guides up to 0.12.x. Once a version leaves them out (the switch to
-- Polestar's route), a character whose saved tab names one gets Polestar's own leveling
-- guide for its level in that tab (Polestar.RetireGuides, Guides.Successor), placed from
-- the quest log. While the pack still has them, nothing changes (a retired id that is
-- registered keeps its guide). The meeting point (02) and the dungeon chapters stay: they
-- become chapters offered on the route, under the same ids.
GA.RETIRED = {
	"groupe-alliance/01-depart-elfe-de-la-nuit", "groupe-alliance/01-depart-gnome",
	"groupe-alliance/01-depart-humain", "groupe-alliance/01-depart-nain",
	"groupe-alliance/03-marche-de-l-ouest",
	"groupe-alliance/05-sombrivage", "groupe-alliance/07-carmines",
	"groupe-alliance/08-bois-de-la-penombre", "groupe-alliance/09-orneval-paluns",
	"groupe-alliance/11-mille-pointes", "groupe-alliance/13-solo-loch-modan",
	"groupe-alliance/14-paluns-hautebrande", "groupe-alliance/15-desolace",
	"groupe-alliance/16-orneval-paluns", "groupe-alliance/17-strangleronce",
	"groupe-alliance/18-arathi", "groupe-alliance/19-terres-ingrates",
	"groupe-alliance/20-strangleronce-marecage", "groupe-alliance/21-terres-ingrates-hinterlands",
	"groupe-alliance/22-feralas", "groupe-alliance/23-tanaris",
	"groupe-alliance/24-hinterlands", "groupe-alliance/25-gorge-des-vents-brulants",
	"groupe-alliance/26-un-goro", "groupe-alliance/27-steppes-ardentes",
	"groupe-alliance/28-gangrebois", "groupe-alliance/29-berceau-de-l-hiver",
	"groupe-alliance/30-maleterres", "groupe-alliance/31-silithus",
	"groupe-alliance/32-silithus-fin",
}
