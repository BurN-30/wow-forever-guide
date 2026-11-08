-- Reliability of the quests this pack added (docs: README, "Fiabilité").
-- No entry: confirmed for Forever by at least two sources (Polestar's reference
-- data built from QuestieDB Forever 1.0.11 and the 1.60.1 client tables,
-- Polestar's Dungeons codex, RestedXP's free Forever guides, Aurum's pack).
-- "?": one Forever source only, or a beta-era source not yet played on live.
-- "!": taken from Classic, not confirmed for Forever (none so far).
local _, ns = ...
ns.GA = ns.GA or {}

local BETA_ROUTE = {
	frFR = "Ids confirmés (données Polestar, codex Donjons) ; trajet repris d'Aurum (bêta), pas encore joué sur Forever.",
	enUS = "Ids confirmed (Polestar data, Dungeons codex); route from Aurum (beta), not yet played on Forever.",
}

ns.GA.Reliability = {
	[92415] = { "?", {
		frFR = "Deux objets de départ possibles dans les données (251270, 251520).",
		enUS = "Two possible start items in the data (251270, 251520).",
	} },
	[95161] = { "?", {
		frFR = "Une seule source Forever : données Polestar (QuestieDB).",
		enUS = "One Forever source only: Polestar data (QuestieDB).",
	} },
	-- Excavation Site and City of Dalaran: Aurum marks his chapters past 20 as untested.
	[95647] = { "?", BETA_ROUTE }, [98815] = { "?", BETA_ROUTE }, [95646] = { "?", BETA_ROUTE },
	[95809] = { "?", BETA_ROUTE }, [95810] = { "?", BETA_ROUTE }, [98824] = { "?", BETA_ROUTE },
	[92456] = { "?", BETA_ROUTE }, [92489] = { "?", BETA_ROUTE }, [92432] = { "?", BETA_ROUTE },
	[92457] = { "?", BETA_ROUTE }, [92458] = { "?", BETA_ROUTE },
	-- Solo · Loch Modan: quests confirmed (Polestar data, RestedXP's live guides, Lodestar),
	-- but places missing from Polestar's data.
	[86667] = { "?", {
		frFR = "Les deux PNJ et la plaque de neige manquent aux données Polestar : positions reprises de Lodestar (bêta) et des guides RestedXP.",
		enUS = "Both NPCs and the snowy patch are missing from Polestar's data: places from Lodestar (beta) and RestedXP's guides.",
	} },
	[86758] = { "?", {
		frFR = "Daggerfang manque aux données Polestar : position reprise de Lodestar (bêta), sur la rive est selon RestedXP.",
		enUS = "Daggerfang is missing from Polestar's data: place from Lodestar (beta), on the east shore per RestedXP.",
	} },
	[86614] = { "?", {
		frFR = "La boîte de pêche manque aux données Polestar : plusieurs emplacements possibles au fond du lac (RestedXP).",
		enUS = "The fishing toolbox is missing from Polestar's data: several possible spots on the lake floor (RestedXP).",
	} },
	-- 0.4.0: group quests and the Deadmines and Stockade chapters, from Polestar's Forever data
	-- and Wowhead Forever; not played in game yet.
	[95999] = { "?", {
		frFR = "Gar'im est à 72,8 ; 86,3 dans les données Polestar, vers 77 ; 86 selon un commentaire Wowhead de 2026 : à vérifier en jeu.",
		enUS = "Gar'im is at 72.8, 86.3 in Polestar's data, near 77, 86 per a 2026 Wowhead comment: to check in game.",
	} },
	[115] = { "?", {
		frFR = "Les données Polestar demandent Blackrock Blockade rendue d'abord ; un commentaire Wowhead ajoute Alther's Mill, contredit par un autre.",
		enUS = "Polestar's data needs Blackrock Blockade handed in first; one Wowhead comment adds Alther's Mill, another says no.",
	} },
	[92749] = { "?", {
		frFR = "Le nombre (10) et le type (Rough Dynamite) viennent de deux commentaires Wowhead de la bêta, le texte de la quête dit encore Coarse.",
		enUS = "The amount (10) and kind (Rough Dynamite) come from two beta Wowhead comments; the quest text still says Coarse.",
	} },
	[95646] = { "?", {
		frFR = "Les données Polestar n'ont pas de prérequis ; deux commentaires Wowhead exigent la chaîne de Rethiel (463, 276, 277, 275).",
		enUS = "Polestar's data has no prerequisite; two Wowhead comments require Rethiel's chain (463, 276, 277, 275).",
	} },
	[98028] = { "?", {
		frFR = "Taux des fragments tiré du tableau de butin de Wowhead (environ 9 % sur les nagas, 42 % sur la Beastmistress) ; Fathom Stone d'après les commentaires.",
		enUS = "Fragment rates from Wowhead's drop table (about 9% from the naga, 42% from the Beastmistress); the Fathom Stone from the comments.",
	} },
	[2078] = { "?", {
		frFR = "Conseils de combat tirés de commentaires Classic : aucun retour de Forever encore.",
		enUS = "Fight advice from Classic comments: no Forever report yet.",
	} },
	[386] = { "?", {
		frFR = "Cellule de Targorr variable selon les commentaires ; le guide Wowhead Forever (bêta) le place au bout du couloir nord.",
		enUS = "Targorr's cell varies per the comments; Wowhead's Forever guide (beta) puts him at the end of the north corridor.",
	} },
}
