-- Difficulty marks (GroupeAlliance.lua): a small warning icon on a guide line whose
-- quest is hard at the player's level (UnitLevel), and a tooltip line saying why and
-- how to do it alone or with others. The level is the player's real one, checked
-- every time the line is drawn: the mark goes away by itself once the player is
-- strong enough.
--   lvl: level advised to do it alone (below it, the mark shows);
--   grp: players advised to do it at the guide's level (nil: alone is fine at lvl);
--   frFR / enUS: why it is hard, then the way alone and the way in a group.
-- Quests with no entry still get a mark from Polestar's data: an elite quest
-- (2 levels above the quest's, group of 3), an escort (the quest's level), or any
-- quest 3 or more levels above the player (red in the quest log).
-- Facts from Wowhead Forever (quest pages and their comments, read on 2026-11-08) and
-- Polestar's Forever data; every text is written in our own words.
local _, ns = ...
ns.GA = ns.GA or {}

ns.GA.Danger = {
	-- Redridge Mountains: the Stonewatch elites (07-carmines)
	[95999] = { lvl = 26, grp = 2,
		frFR = "Incinerator Gar'im est un élite 23 avec un diablotin et deux aides, et un gros sort de feu de 2,5 s. Seul : niveau 26 avec une interruption ; à deux : tuer les aides d'abord, garder l'interruption pour son feu.",
		enUS = "Incinerator Gar'im is a level 23 elite with an imp, two helpers and a 2.5 s fire cast. Alone: level 26 with an interrupt; as a pair: kill the helpers first, save the interrupt for his fire.",
	},
	[19] = { lvl = 28, grp = 3,
		frFR = "Tharil'zun est un élite 24 avec deux gardes, devant le donjon de Stonewatch. Seul : vers 28-29 ; à deux ou trois vers 23-25 : neutraliser un garde et le tuer vite.",
		enUS = "Tharil'zun is a level 24 elite with two guards, outside Stonewatch Keep. Alone: about 28-29; two or three players at 23-25: crowd-control a guard and burst him.",
	},
	[169] = { lvl = 32, grp = 5,
		frFR = "Gath'Ilzogg est un élite 26 au sommet d'un donjon plein d'élites qui réapparaissent vite, avec deux gardes et un dragonnet. Pas de solo raisonnable : groupe de 4 ou 5 vers 24-26.",
		enUS = "Gath'Ilzogg is a level 26 elite atop a keep full of fast-respawning elites, with two guards and a whelp. No sensible solo: a group of 4 or 5 at 24-26.",
	},
	[115] = { lvl = 25, grp = 2,
		frFR = "Les orbes ne tombent que sur les Blackrock Shadowcaster, élites 22-23. Seul : la grotte au nord de Comté-du-Lac, en les tirant un par un ; à plusieurs : dans le donjon avec Tharil'zun.",
		enUS = "Only Blackrock Shadowcasters, level 22-23 elites, drop the orbs. Alone: the cave north of Lakeshire, one at a time; in a group: in the keep along with Tharil'zun.",
	},
	-- Westfall: the Deadmines' quests done outside the instance (07b-mortemines)
	[168] = { lvl = 21, grp = 2,
		frFR = "Les cartes tombent sur des morts-vivants élites 17-18, en paires, avant le portail des Mortemines. Seul : niveau 21 et un à la fois ; à deux dès 19, mais chacun loote ses cartes (taux faible).",
		enUS = "The cards drop from level 17-18 elite undead, in pairs, before the Deadmines portal. Alone: level 21, one at a time; two players from 19, but each loots their own cards (low rate).",
	},
	[167] = { lvl = 23, grp = 2,
		frFR = "Foreman Thistlenettle est un élite 20 au bout de la zone des morts-vivants, avec un mob lié. Seul : niveau 23 ; à deux : niveau 19-20.",
		enUS = "Foreman Thistlenettle is a level 20 elite at the far end of the undead area, with a linked add. Alone: level 23; two players: 19-20.",
	},
	[155] = { lvl = 18,
		frFR = "Escorte jusqu'à Ruisselune : à la fontaine, un Défias et un lanceur de sorts attaquent ensemble. Seul : nettoyer Ruisselune avant, neutraliser le lanceur (Métamorphose, Peur). S'il disparaît en passant une limite de zone, bug connu : reprendre la quête.",
		enUS = "Escort to Moonbrook: at the fountain a Defias and a caster attack together. Alone: clear Moonbrook first and crowd-control the caster (Polymorph, Fear). If he vanishes at a zone border, it is a known bug: take the quest again.",
	},
	-- Darkshore (05-sombrivage)
	[4740] = { lvl = 18, grp = 2,
		frFR = "Murkdeep arrive après deux vagues de murlocs qui sortent de l'eau, avec un garde, et le camp réapparaît vite. Seul : niveau 18, combattre loin du rivage pour souffler entre les vagues ; à 15-16, venir à deux.",
		enUS = "Murkdeep comes after two waves of murlocs out of the water, with a guard, and the camp respawns fast. Alone: level 18, fight away from the shore to rest between waves; at 15-16, bring a friend.",
	},
	[731] = { lvl = 21, grp = 2,
		frFR = "Escorte la plus dure de la zone : Remtravel attire élémentaires et golems par trois, puis une embuscade mage et guerrier. Seul : niveau 21, une classe qui soigne aide ; à deux ou trois : facile. Le mage de l'embuscade en premier, sinon il le tue.",
		enUS = "The zone's hardest escort: Remtravel pulls elementals and golems in threes, then a mage and warrior ambush. Alone: level 21, a class that heals helps; two or three players: easy. Kill the ambush mage first or he kills Remtravel.",
	},
	[2139] = { lvl = 19, grp = 2,
		frFR = "La Den Mother et ses quatre oursons viennent ensemble, et elle renverse. Seul : niveau 19, oursons d'abord ; en cas de pépin, sauter de la corniche sous la grotte, ils abandonnent. À deux : une formalité.",
		enUS = "The Den Mother and her four cubs come together, and she knocks you down. Alone: level 19, cubs first; if it goes wrong, jump off the ledge below the cave, they give up. Two players: a formality.",
	},
	[2078] = { lvl = 22, grp = 2,
		frFR = "Le Threshwackonator 4100 est un robot élite 20 qui frappe à 80-100. Seul : il faut une immobilisation ou une peur (druide, démoniste, mage, prêtre) ; corps à corps sans contrôle : venir à deux.",
		enUS = "The Threshwackonator 4100 is a level 20 elite robot hitting for 80-100. Alone you need a root or a fear (Druid, Warlock, Mage, Priest); melee without control: come as a pair.",
	},
	[98028] = { lvl = 21, grp = 2,
		frFR = "Baron Marinous est un élite 21 invoqué, immunisé au Givre, qui lance Éclair de givre et Nova de givre. Seul : niveau 20-21 à distance en jouant la ligne de vue des piliers ; à plusieurs : une seule invocation, chacun reçoit son globe.",
		enUS = "Baron Marinous is a summoned level 21 elite, immune to Frost, casting Frostbolt and Frost Nova. Alone: level 20-21 at range, using the pillars to break line of sight; in a group: one summon, everyone gets a globe.",
	},
	[994] = { lvl = 24, grp = 3,
		frFR = "Volcor fonce dans le camp de furbolgs et des renforts arrivent même camp vidé, deux chamans qui soignent. Seul : prendre Escape Through Stealth à la place (même suite) ; la version Force à deux ou trois, avec un soigneur.",
		enUS = "Volcor charges the furbolg camp and reinforcements come even when cleared, two healing shamans. Alone: take Escape Through Stealth instead (same follow-up); the Force way with two or three players and a healer.",
	},
	[951] = { lvl = 19,
		frFR = "Les nagas de Mathystra (18-21) sont en groupes serrés et le cimetière est très loin. Seul : niveau 19, les tirer un par un depuis le bord des ruines.",
		enUS = "The Mathystra naga (18-21) stand in tight packs and the graveyard is far away. Alone: level 19, pull them one at a time from the edge of the ruins.",
	},
}
