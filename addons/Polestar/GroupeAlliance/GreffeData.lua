-- Groupe Alliance: where this pack's chapters join Polestar's own route (Greffe.lua reads it).
--
-- One entry per chapter, in the order of Polestar's Alliance route (0.4.2.2). When two
-- chapters are due at once, the one with the lower `max` comes first, then the one higher in
-- this table.
--   id       the chapter's guide id (a guide of this pack, category Dungeons, no `next`)
--   key      a short name, the key of the player's answer (PolestarCharDB.gaGreffe)
--   kind     "meeting" for the Westfall meeting point (its card does not say "group dungeon");
--            nil for a dungeon chapter
--   turnin   the hook: the chapter is offered once this quest is handed in (or one of a list)
--   accept   (instead of, or with, turnin) once this quest (or one of a list) is in the log or
--            handed in
--   min, max the player's level to offer it: below min it waits (a hook reached earlier offers
--            it at the level-up to min, wherever the player is), above max it is never offered
--            (the chapter is behind the player)
--   done     quests of the chapter: one of them handed in, the chapter counts as done (run
--            before, with Polestar's Dungeons window or alone) and is never offered
--   fin      the chapter's end: its hand-ins without a condition (non-optional turn-ins of steps
--            without `when`, of a quest the chapter takes without a condition or the route surely
--            gives). "Without a condition" means every player of the chapter has the quest: taken
--            from someone or something always there (a giver, the Discs of Norgannon, a drop the data
--            gives at 100%, like VanCleef's letter), in a step without `when`, not `optional`. A quest
--            started by an item that may not drop for everyone, or by an object at a random spot or
--            one the data cannot place (the Treaty of Understanding, the Bloodied Insignia, the
--            Crest of Lordaeron, the blood-stained letter, the Titan Relic), is taken `optional`:
--            its hand-in then holds only whoever took it, and it is not in `fin`.
--            Once they are all handed in, and no other hand-in of the chapter waits in the
--            log ready to hand in, the chapter's tab closes and the route comes back (Greffe.lua,
--            GA.ChapterFinished). A hand-in under a condition (a group question, `when complete`,
--            a quest taken on a condition or optionally) never counts: a player who skips it is not
--            held. Empty: the chapter ends with its guide (GUIDE_COMPLETED), or by its tab closed.
--            tools/check-chapitres.py fails when this list is not exactly those hand-ins.
--   dungeon  the Dungeons codex key (Polestar_Codex/Dungeons1.lua), or a list of them: Polestar's
--            own heads-up card for those dungeons stays quiet while this chapter can still be
--            offered or has been (Greffe.lua, GA.GreffeHolds), so each dungeon is offered once,
--            by this pack's chapter; a chapter whose hook the player went past without doing it is
--            offered when Polestar's card would have come
--   route    Polestar's guide whose step hands in or takes the first hook quest (Polestar 0.4.2.2):
--            the hook still ahead while the active guide comes before it on the route; also read
--            by tools/check-accroches.py, which fails when a new Polestar version moves the hook
--   name     the dungeon's name, per client language
--   where    one line under the name: place, group, the level the dungeon opens at (the group
--            finder's): never a top level the card could come above (it is offered up to `max`)
-- Levels where Polestar's own card would come, and the checks: tools/check-accroches.py,
-- tools/check-chapitres.py, tools/check-greffe.py.
local _, ns = ...
local GA = ns.GA or {}
ns.GA = GA

GA.GREFFE = {
	{ -- about 11 to 16 by race: the first stop at Sentinel Hill
		id = "groupe-alliance/02-rendez-vous-hurlevent", key = "rendez-vous", kind = "meeting",
		turnin = 109, min = 10, max = 17, fin = {},
		route = "forever/alliance/02-westfall",
		name = { frFR = "Rendez-vous dans la Marche de l'Ouest", enUS = "Meeting in Westfall" },
		where = { frFR = "Colline des sentinelles · jouer le parcours à plusieurs",
			enUS = "Sentinel Hill · playing the route together" },
	},
	{ -- about 15-16, last stop at Sentinel Hill before the flight to Stormwind (Polestar's card: 15)
		id = "groupe-alliance/04-salle-des-thanes", key = "thanes", dungeon = "the-hall-of-thanes",
		turnin = 13, min = 13, max = 19, done = { 96403, 96394 },
		fin = { 96395, 96403, 96394 },
		route = "forever/alliance/02-westfall",
		name = { frFR = "La Salle des Thanes", enUS = "The Hall of Thanes" },
		where = { frFR = "Sous Forgefer · groupe de 5 · dès le niveau 13",
			enUS = "Under Ironforge · group of 5 · from level 13" },
	},
	{ -- about 19-20, Auberdine before the boat (Polestar has no card: the Undercity's dungeon)
		id = "groupe-alliance/06-ruines-de-lordaeron", key = "ruines", dungeon = "ruins-of-lordaeron",
		turnin = { 947, 2139 }, accept = 948, min = 17, max = 22, done = { 95250 },
		fin = { 95250 },
		route = "forever/alliance/03-darkshore",
		name = { frFR = "Les Ruines de Lordaeron", enUS = "The Ruins of Lordaeron" },
		where = { frFR = "Clairières de Tirisfal, par le bateau d'Austrivage · groupe de 5 · dès le niveau 15",
			enUS = "Tirisfal Glades, by the Southshore boat · group of 5 · from level 15" },
	},
	{ -- about 21, The Defias Traitor handed in at Sentinel Hill (Polestar's card: 21)
		id = "groupe-alliance/07b-mortemines", key = "mortemines", dungeon = "deadmines",
		turnin = 155, min = 18, max = 24, done = { 166, 214 },
		fin = { 166, 214, 373, 168, 167 },
		route = "forever/alliance/03-loch-modan",
		name = { frFR = "Les Mortemines", enUS = "The Deadmines" },
		where = { frFR = "Sous Ruisselune, Marche de l'Ouest · groupe de 5 · dès le niveau 17",
			enUS = "Under Moonbrook, Westfall · group of 5 · from level 17" },
	},
	{ -- about 25, Astranaar before the flight to Auberdine (Polestar's card: 29)
		id = "groupe-alliance/brassenoire", key = "brassenoire", dungeon = "blackfathom-deeps",
		turnin = { 1025, 1054, 98027 }, min = 23, max = 28, done = { 1275 },
		fin = { 1275 },
		route = "forever/alliance/06-ashenvale",
		name = { frFR = "Les Profondeurs de Brassenoire", enUS = "Blackfathom Deeps" },
		where = { frFR = "Grève de Zoram, Orneval · groupe de 5 · dès le niveau 24",
			enUS = "The Zoram Strand, Ashenvale · group of 5 · from level 24" },
	},
	{ -- about 28-29, last Stormwind stop of Duskwood; else 30-31 at Stormwind (Polestar's card: 29)
		id = "groupe-alliance/08b-prison", key = "prison", dungeon = "stormwind-stockade",
		turnin = { 269, 72, 293 }, min = 25, max = 31, done = { 387 },
		fin = { 387, 388 },
		route = "forever/alliance/05-duskwood",
		name = { frFR = "La Prison", enUS = "The Stockade" },
		where = { frFR = "Hurlevent · groupe de 5 · dès le niveau 24",
			enUS = "Stormwind · group of 5 · from level 24" },
	},
	{ -- about 30, Menethil before the flight to Ironforge (Polestar's card: 31)
		id = "groupe-alliance/10-site-de-fouilles", key = "fouilles", dungeon = "excavation-site-wetlands",
		turnin = 95737, min = 27, max = 34, done = { 95647, 95646 },
		fin = { 95647, 95646, 98815, 95809 },
		route = "forever/alliance/06-wetlands",
		name = { frFR = "Le Site de fouilles : les Paluns", enUS = "Excavation Site: Wetlands" },
		where = { frFR = "Les Paluns · groupe de 5 · dès le niveau 26",
			enUS = "Wetlands · group of 5 · from level 26" },
	},
	{ -- about 30-31, Stormwind (Polestar's card: 35)
		id = "groupe-alliance/10b-gnomeregan", key = "gnomeregan", dungeon = "gnomeregan",
		turnin = 293, min = 29, max = 35, done = { 2929 },
		fin = { 2927, 2929, 2922, 2928 },
		route = "forever/alliance/06-wetlands",
		name = { frFR = "Gnomeregan", enUS = "Gnomeregan" },
		where = { frFR = "Dun Morogh · groupe de 5 · dès le niveau 29, conseillé vers 31",
			enUS = "Dun Morogh · group of 5 · from level 29, best from about 31" },
	},
	{ -- about 31 at Southshore, or 37 at Modera's camp (Polestar's card: 33)
		id = "groupe-alliance/12-dalaran", key = "dalaran", dungeon = "city-of-dalaran",
		accept = 92432, turnin = 92432, min = 30, max = 38, done = { 92457, 92458 },
		fin = { 92432, 92457, 92458 },
		route = "forever/alliance/30-40/01-hillsbrad-foothills",
		name = { frFR = "La Cité de Dalaran", enUS = "The City of Dalaran" },
		where = { frFR = "Montagnes d'Alterac · groupe de 5 · dès le niveau 28",
			enUS = "Alterac Mountains · group of 5 · from level 28" },
	},
	{ -- about 32-33, Falfindel north of Highperch (Polestar's card: 33)
		id = "groupe-alliance/kraal-de-tranchebauge", key = "kraal", dungeon = "razorfen-kraul",
		turnin = 1100, min = 29, max = 37, done = { 1101, 1144 },
		fin = { 1101 },
		route = "forever/alliance/30-40/03-ashenvale",
		name = { frFR = "Le Kraal de Tranchebauge", enUS = "Razorfen Kraul" },
		where = { frFR = "Sud des Tarides · groupe de 5 · dès le niveau 29",
			enUS = "Southern Barrens · group of 5 · from level 29" },
	},
	{ -- about 39, Down the Scarlet Path taken at Nijel's Point; else 44 at Raleigh's (Polestar's card: 39)
		id = "groupe-alliance/monastere-ecarlate", key = "monastere", dungeon = "scarlet-monastery",
		accept = 1052, turnin = 1052, min = 37, max = 46, done = { 1053 },
		fin = { 1052, 96800, 1053 },
		route = "forever/alliance/30-40/06b-desolace",
		name = { frFR = "Le Monastère écarlate", enUS = "The Scarlet Monastery" },
		where = { frFR = "Clairières de Tirisfal, depuis Austrivage · groupe de 5 · quatre ailes, de 30 à 46",
			enUS = "Tirisfal Glades, from Southshore · group of 5 · four wings, 30 to 46" },
	},
	{ -- about 41, Brohann in Stormwind (Polestar's card: 44). Same max as the Monastery: when both
		-- are due at Raleigh's (both answered "Later"), the Monastery comes first.
		id = "groupe-alliance/souilles-de-tranchebauge", key = "souilles", dungeon = "razorfen-downs",
		turnin = 1448, min = 39, max = 46, done = { 3636 },
		fin = { 3636, 3523, 3525 },
		route = "forever/alliance/40-50/01-stranglethorn-vale",
		name = { frFR = "Les Souilles de Tranchebauge", enUS = "Razorfen Downs" },
		where = { frFR = "Sud des Tarides, depuis Hurlevent · groupe de 5 · dès le niveau 37",
			enUS = "Southern Barrens, from Stormwind · group of 5 · from level 37" },
	},
	{ -- about 44, end of the Riverglades in Stormwind (Polestar shows no card on its route)
		id = "groupe-alliance/uldaman", key = "uldaman", dungeon = "uldaman",
		turnin = { 94894, 94893 }, min = 41, max = 48, done = { 2240 },
		fin = { 721, 722, 2398, 2278, 723, 2240, 1360, 724, 725, 726 },
		route = "forever/alliance/40-50/01b-riverglades",
		name = { frFR = "Uldaman", enUS = "Uldaman" },
		where = { frFR = "Nord des Terres ingrates, depuis Forgefer · groupe de 5 · dès le niveau 41",
			enUS = "Northern Badlands, from Ironforge · group of 5 · from level 41" },
	},
	{ -- about 45-46, end of Shen'dralas, offered from 46, the group finder's floor (Polestar's card: 49)
		id = "groupe-alliance/maraudon", key = "maraudon", dungeon = "maraudon",
		turnin = { 99257, 99258 }, min = 46, max = 51, done = { 7065, 7046 },
		fin = { 7044, 7046, 7028, 7041 },
		route = "forever/40-50/shendralas",
		name = { frFR = "Maraudon", enUS = "Maraudon" },
		where = { frFR = "Ouest de la Désolace · groupe de 5 · dès le niveau 46, conseillé vers 48",
			enUS = "Western Desolace · group of 5 · from level 46, best from about 48" },
	},
	{ -- about 46, Tran'rek at the first Gadgetzan stop (Polestar's card: 50)
		id = "groupe-alliance/zul-farrak", key = "zulfarrak", dungeon = "zulfarrak",
		turnin = 2864, min = 44, max = 50, done = { 2865, 2768, 3042 },
		fin = { 2865, 3042, 2768 },
		route = "forever/alliance/40-50/04-tanaris",
		name = { frFR = "Zul'Farrak", enUS = "Zul'Farrak" },
		where = { frFR = "Nord-ouest de Tanaris · groupe de 5 · dès le niveau 44",
			enUS = "North-western Tanaris · group of 5 · from level 44" },
	},
	{ -- about 49-50, the Un'Goro guide's Gadgetzan stops (The Borrower, then Marin, Andi Lynn, Tran'rek)
		id = "groupe-alliance/zul-farrak-2", key = "zulfarrak2", dungeon = "zulfarrak",
		turnin = { 2941, 2605, 5863, 3362 }, min = 48, max = 53, done = { 2770 }, fin = {},
		route = "forever/alliance/40-50/07-un-goro-crater",
		name = { frFR = "Zul'Farrak, second passage", enUS = "Zul'Farrak, second run" },
		where = { frFR = "Tanaris · groupe de 5 · Gahz'rilla, avec le Marteau de Zul'Farrak",
			enUS = "Tanaris · group of 5 · Gahz'rilla, with the Mallet of Zul'Farrak" },
	},
	{ -- about 51, the blood mages at Nethergarde (Polestar's card: 56)
		id = "groupe-alliance/temple-englouti", key = "temple", dungeon = "sunken-temple",
		turnin = { 2585, 2581, 2601 }, min = 50, max = 56, done = { 1475 },
		fin = { 1475 },
		route = "forever/alliance/50-60/01-burning-steppes",
		name = { frFR = "Le temple englouti", enUS = "The Sunken Temple" },
		where = { frFR = "Marais des Chagrins · groupe de 5 · dès le niveau 50, conseillé vers 52",
			enUS = "Swamp of Sorrows · group of 5 · from level 50, best from about 52" },
	},
	{ -- level 55 once Extinguish the Firegut is handed in at Morgan's Vigil (about 50), wherever the
		-- player is (Polestar's Blackrock Depths card: 55; Dire Maul, the Spire, Stratholme: 58-59);
		-- else at the end of Silithus, the route's last hand-ins
		id = "groupe-alliance/33-donjons-fin", key = "donjons-fin",
		dungeon = { "blackrock-depths", "blackrock-spire", "dire-maul", "stratholme", "scholomance" },
		turnin = { 3823, 8287, 8304, 8282 }, min = 55, max = 60, done = {}, fin = {},
		route = "forever/alliance/50-60/01-burning-steppes",
		name = { frFR = "Les donjons 55-60", enUS = "The level 55-60 dungeons" },
		where = { frFR = "Rochenoire, Hache-Tripes, Stratholme, Scholomance · groupe de 5 · niveaux 55 à 60",
			enUS = "Blackrock, Dire Maul, Stratholme, Scholomance · group of 5 · levels 55 to 60" },
	},
}

-- This pack's leveling guides up to 0.12.x, gone since 0.13.0 (the switch to Polestar's route): a
-- character whose saved tab names one gets Polestar's own leveling guide for its level in that tab
-- (Polestar.RetireGuides, Guides.Successor), placed from the quest log. The meeting point (02) and
-- the dungeon chapters that had a guide of their own (04, 06, 07b, 08b, 10, 10b, 12, 33) are still
-- in the pack, under the same ids: a tab saved on one of them opens the chapter.
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
