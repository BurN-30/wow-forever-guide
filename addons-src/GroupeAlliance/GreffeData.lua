-- Groupe Alliance: where this pack's dungeon chapters join Polestar's own route
-- (Greffe.lua reads it; prototype of the branch greffe, two chapters so far).
--
-- One entry per chapter, in route order:
--   id       the chapter's guide id (a guide of this pack, category Dungeons, no `next`)
--   key      a short name, the key of the player's answer (PolestarCharDB.gaGreffe)
--   turnin   the hook: the chapter is offered once this quest is handed in
--   accept   (instead of turnin) once this quest is in the log or handed in
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
