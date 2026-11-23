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

local ULDAMAN = {
	frFR = "Quête et donneur confirmés (données Polestar, codex Donjons) ; salles et combats repris du jeu d'origine, Wowhead Forever pas encore lu pour Uldaman.",
	enUS = "Quest and giver confirmed (Polestar data, Dungeons codex); rooms and fights from the original game, Wowhead Forever not read yet for Uldaman.",
}

local SUNKEN = {
	frFR = "Quête, donneur et niveau confirmés (données Polestar, codex Donjons) ; Wowhead Forever pas lu pour le Temple englouti (accès bloqué), aucun commentaire Forever derrière les conseils.",
	enUS = "Quest, giver and level confirmed (Polestar data, Dungeons codex); Wowhead Forever not read for the Sunken Temple (access blocked), no Forever comment behind the tips.",
}

local ZULFARRAK = {
	frFR = "Quête, donneur et butin confirmés (données Polestar, codex Donjons) ; événement de la pyramide repris du jeu d'origine, pas encore joué sur Forever.",
	enUS = "Quest, giver and drop confirmed (Polestar data, Dungeons codex); the pyramid event from the original game, not yet played on Forever.",
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
	-- 0.4.0: group quests and the Deadmines and Stockade chapters, from Polestar's Forever data
	-- and Wowhead Forever; not played in game yet.
	[95999] = { "?", {
		frFR = "Gar'im est à 72,8 ; 86,3 dans les données Polestar, vers 77 ; 86 selon un commentaire Wowhead de 2026 : à vérifier en jeu.",
		enUS = "Gar'im is at 72.8, 86.3 in Polestar's data, near 77, 86 per a 2026 Wowhead comment: to check in game.",
	} },
	[95646] = { "?", {
		frFR = "Les données Polestar n'ont pas de prérequis ; deux commentaires Wowhead exigent la chaîne de Rethiel (463, 276, 277, 275).",
		enUS = "Polestar's data has no prerequisite; two Wowhead comments require Rethiel's chain (463, 276, 277, 275).",
	} },
	[386] = { "?", {
		frFR = "Cellule de Targorr variable selon les commentaires ; le guide Wowhead Forever (bêta) le place au bout du couloir nord.",
		enUS = "Targorr's cell varies per the comments; Wowhead's Forever guide (beta) puts him at the end of the north corridor.",
	} },
	-- 0.5.0: Stormwind chain and Scarlet Monastery (Polestar's Forever data; Wowhead Forever pages
	-- read on 08/11/2026, some blocked); not played in game yet.
	[395] = { "?", {
		frFR = "Fin de chaîne (395, 396) tirée des seules données Polestar : pages Wowhead non lues.",
		enUS = "End of the chain (395, 396) from Polestar's data only: Wowhead pages not read.",
	} },
	[396] = { "?", {
		frFR = "Rendue à Dame Katrana Prestor d'après les données Polestar : page Wowhead non lue.",
		enUS = "Handed to Lady Katrana Prestor per Polestar's data: Wowhead page not read.",
	} },
	[1050] = { "?", {
		frFR = "Place du livre dans la Bibliothèque reprise du jeu d'origine, pas encore vérifiée sur Forever.",
		enUS = "The book's place in the Library comes from the original game, not yet checked on Forever.",
	} },
	[1053] = { "?", {
		frFR = "Ordre des ailes et combats repris du jeu d'origine ; besoin d'une clé pour l'Armurerie et la Cathédrale sur Forever non confirmé.",
		enUS = "Wing order and fights from the original game; whether the Armory and Cathedral need a key on Forever is not confirmed.",
	} },
	-- 0.5.0: Uldaman (its chapter since 0.13.0: uldaman.guide).
	[2398] = { "?", ULDAMAN }, [2240] = { "?", ULDAMAN }, [1360] = { "?", ULDAMAN }, [2418] = { "?", ULDAMAN },
	[2278] = { "?", ULDAMAN }, [2279] = { "?", ULDAMAN }, [2198] = { "?", ULDAMAN },
	[1437] = { "?", {
		frFR = "Coffre vers 56,17 au nord de la Forteresse de Hache-Tonnerre ; en 2021 sur Classic il restait grisé (quête impossible), aucun retour de Forever encore.",
		enUS = "Chest near 56,17 north of Thunder Axe Fortress; in 2021 on Classic it stayed greyed out (quest impossible), no Forever report yet.",
	} },
	[98219] = { "?", {
		frFR = "Un commentaire Forever dit qu'un humain ne peut pas la prendre ; Wowhead retire les humains de toutes les quêtes propres à Forever, sans doute une erreur d'affichage : à vérifier en jeu avec un humain.",
		enUS = "One Forever comment says a human cannot take it; Wowhead leaves humans out of every Forever-only quest, likely a display error: to check in game with a human.",
	} },
	-- 0.6.0: Zul'Farrak (its chapter since 0.13.0: zul-farrak.guide).
	[2865] = { "?", ZULFARRAK }, [3042] = { "?", ZULFARRAK }, [2768] = { "?", ZULFARRAK },
	-- 0.7.0: Sunken Temple (its chapter since 0.13.0: temple-englouti.guide).
	[1475] = { "?", SUNKEN }, [3373] = { "?", SUNKEN },
}
