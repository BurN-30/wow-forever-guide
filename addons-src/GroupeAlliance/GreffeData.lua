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
	-- Lot B: the dungeons of 39 to 60 (pack/guides/greffe). Hooks read in Polestar 0.4.2.2's
	-- route; levels: the dungeons' Forever ranges (Polestar's Dungeons codex). Razorfen Downs keeps
	-- max 46, like the Scarlet Monastery: when both are due at Raleigh's, the Monastery comes first.
	{
		id = "groupe-alliance/greffe/souilles-de-tranchebauge", key = "souilles", dungeon = "razorfen-downs",
		turnin = 1448, min = 39, max = 46, done = { 3636 },
		route = "forever/alliance/40-50/01-stranglethorn-vale",
		name = { frFR = "Les Souilles de Tranchebauge", enUS = "Razorfen Downs" },
		where = { frFR = "Sud des Tarides, depuis Hurlevent · groupe de 5 · niveaux 37 à 46",
			enUS = "Southern Barrens, from Stormwind · group of 5 · levels 37 to 46" },
	},
	{
		id = "groupe-alliance/greffe/uldaman", key = "uldaman", dungeon = "uldaman",
		turnin = { 94894, 94893 }, min = 41, max = 48, done = { 2240 },
		route = "forever/alliance/40-50/01b-riverglades",
		name = { frFR = "Uldaman", enUS = "Uldaman" },
		where = { frFR = "Nord des Terres ingrates, depuis Forgefer · groupe de 5 · niveaux 41 à 51",
			enUS = "Northern Badlands, from Ironforge · group of 5 · levels 41 to 51" },
	},
	{
		id = "groupe-alliance/greffe/maraudon", key = "maraudon", dungeon = "maraudon",
		turnin = { 99257, 99258 }, min = 45, max = 51, done = { 7065, 7046 },
		route = "forever/40-50/shendralas",
		name = { frFR = "Maraudon", enUS = "Maraudon" },
		where = { frFR = "Ouest de la Désolace · groupe de 5 · niveaux 46 à 55",
			enUS = "Western Desolace · group of 5 · levels 46 to 55" },
	},
	{
		id = "groupe-alliance/greffe/zul-farrak", key = "zulfarrak", dungeon = "zulfarrak",
		turnin = 2864, min = 44, max = 50, done = { 2865, 2768, 3042 },
		route = "forever/alliance/40-50/04-tanaris",
		name = { frFR = "Zul'Farrak", enUS = "Zul'Farrak" },
		where = { frFR = "Nord-ouest de Tanaris · groupe de 5 · niveaux 44 à 54",
			enUS = "North-western Tanaris · group of 5 · levels 44 to 54" },
	},
	{
		id = "groupe-alliance/greffe/zul-farrak-2", key = "zulfarrak2", dungeon = "zulfarrak",
		turnin = 2941, accept = 2605, min = 48, max = 53, done = { 2770 },
		route = "forever/alliance/40-50/07-un-goro-crater",
		name = { frFR = "Zul'Farrak, second passage", enUS = "Zul'Farrak, second run" },
		where = { frFR = "Tanaris · groupe de 5 · Gahz'rilla, avec le Marteau de Zul'Farrak",
			enUS = "Tanaris · group of 5 · Gahz'rilla, with the Mallet of Zul'Farrak" },
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
