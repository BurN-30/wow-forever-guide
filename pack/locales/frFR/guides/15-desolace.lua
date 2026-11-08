-- French (frFR): the guide groupe-alliance/15-desolace (guides/15-desolace.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1443} Desolace
	["Group 13 · {zone:1443}"] = "Groupe 13 · {zone:1443}",

	-- Step 1: Nijel's Point
	-- {object:19559} Sun Rock Retreat · {object:19556} Charred Vale · {zone:1443} Desolace · {object:176948} Nijel's Point
	["Follow the road west past {object:19559} (Horde) and south-west through the {object:19556} into {zone:1443}; {object:176948} stands at the top of the pass."] = "Suivez la route vers l'ouest passé {object:19559} (Horde) et au sud-ouest à travers {object:19556} jusqu'à {zone:1443} ; {object:176948} se trouve au sommet du col.",
	["Everyone at their own pace: what you already did ticks itself, the guide picks up where you are. Playing together? Group XP is best within 4 levels."] = "Chacun à son rythme : ce qui est déjà fait se coche tout seul, le guide reprend où vous en êtes. En groupe ? L'XP de groupe est meilleure à 4 niveaux d'écart ou moins.",

	-- Step 2: Malem chest
	["Malem chest"] = "Coffre de Malem",
	-- {object:176948} Nijel's Point
	["The chest lies in the ruins south-west of {object:176948}."] = "Le coffre se trouve dans les ruines au sud-ouest de {object:176948}.",

	-- Step 3: Sargeron
	["Sargeron"] = "Sargeron",
	-- {object:176948} Nijel's Point
	-- plural, as words: Hatefury Rogues = {npc:4670} Hatefury Rogue · Hatefury Tricksters = {npc:4671} Hatefury Trickster
	["The Hatefury satyrs hold the ruins of Sargeron, east of {object:176948}.\nCareful: Hatefury Rogues spawn stealthed, and Hatefury Tricksters have a poison proc on their attacks."] = "Les satyres Fielfurie occupent les ruines de Sargeron, à l'est de {object:176948}.\nAttention : Les voleurs Fielfurie apparaissent camouflés, et les entourloupeurs Fielfurie ont un effet de poison sur leurs attaques.",

	-- Step 6: Azore Aldamort
	-- {npc:11863} Azore Aldamort
	["{npc:11863}'s tower stands on the hill west of Thunder Axe Fortress: take his quest first, the sceptre he wants is in the fortress."] = "La tour de {npc:11863} se trouve sur la colline à l'ouest de la forteresse Hache-Tonnerre : prenez sa quête d'abord, le sceptre qu'il veut est dans la forteresse.",

	-- Step 7: Dalinda Malem
	-- {npc:5644} Dalinda Malem · {object:176948} Nijel's Point
	["{npc:5644} hides inside the Burning Blade's fortress south-west of {object:176948}."] = "{npc:5644} se cache à l'intérieur de la forteresse de la Lame ardente au sud-ouest de {object:176948}.",
	["Inside"] = "À l'intérieur",

	-- Step 8: Tyranis Malem and the Seer
	-- {npc:5643} Tyranis Malem
	["{npc:5643} and the Seer"] = "{npc:5643} et le Prophète",
	-- {npc:5643} Tyranis Malem · {npc:13019} Burning Blade Seer
	["Her brother {npc:5643} (36) walks the fortress with the Burning Blade cultists (30-33): pull him alone. The {npc:13019} keeps the sceptre in the fortress's main building."] = "Son frère {npc:5643} (36) arpente la forteresse avec les sectateurs de la Lame ardente (30-33) : attirez-le seul. {npc:13019} garde le sceptre dans le bâtiment principal de la forteresse.",
	-- {item:6767} Tyranis' Pendant
	["{item:6767}; inside"] = "{item:6767} ; à l'intérieur",
	-- {quest:5741} Sceptre of Light
	["{quest:5741}; on the top floor"] = "{quest:5741} ; au dernier étage",

	-- Step 9: Escort Dalinda Malem
	-- {npc:5644} Dalinda Malem
	["Escort {npc:5644}"] = "Escortez {npc:5644}",
	-- {npc:5644} Dalinda Malem
	["{npc:5644}, inside"] = "{npc:5644}, à l'intérieur",
	["Out of Thunder Axe Fortress"] = "Sortie de la Forteresse de Hache-Tonnerre",
	-- {npc:5644} Dalinda Malem · {npc:5642} Vahlarriel Demonslayer · {object:176948} Nijel's Point
	["Lead {npc:5644} out of the fortress; she walks off once you are clear of it. {npc:5642} takes the turn-in at {object:176948} at the end of the guide."] = "Sortez {npc:5644} de la forteresse ; elle s'en va une fois que vous en êtes sorti. {npc:5642} récupère la quête à {object:176948} à la fin du guide.",

	-- Step 10: Smeed Scrabblescrew
	-- {npc:11596} Smeed Scrabblescrew
	["{npc:11596}'s camp is on the road south of Kolkar Village, by the Kodo Graveyard."] = "Le camp de {npc:11596} se trouve sur la route au sud du village des Kolkar, près du cimetière des kodos.",

	-- Step 11: Kodo Graveyard
	["Kodo Graveyard"] = "Cimetière des kodos",
	-- {npc:11596} Smeed Scrabblescrew · {item:13892} Kodo Kombobulator · {npc:4700} Aged Kodo
	-- plural, as words: Aged Kodos = {npc:4700} Aged Kodo
	["Use {npc:11596}'s {item:13892} on an {npc:4700} and walk the tamed kodo back to his camp, five times; Aged Kodos also drop the hides."] = "Utilisez le {item:13892} de {npc:11596} sur un {npc:4700} et ramenez le kodo apprivoisé à son camp, cinq fois ; les Vieux kodos lâchent aussi les peaux.",

	-- Step 13: Scorpashi venom
	["Scorpashi venom"] = "Venin scorpashi",
	["The Scorpashi scorpids hunt the hills around Kormek's Hut on the road south."] = "Les scorpides Scorpashi chassent dans les collines autour de la hutte de Kormek sur la route vers le sud.",

	-- Step 15: Kolkar Village
	["Kolkar Village"] = "Village des Kolkar",
	-- {npc:5752} Corporal Melkins
	["The Kolkar roam the plains around Kolkar Village; their ears are for {npc:5752}."] = "Les Kolkar errent dans les plaines autour du village des Kolkar ; leurs oreilles sont pour {npc:5752}.",

	-- Step 17: Fly to Astranaar
	["Fly to Astranaar"] = "Envolez-vous vers Astranaar",
	-- {object:176948} Nijel's Point
	["{object:176948} flight master"] = "Maître de vol de {object:176948}",

	-- Step 18: Delgren the Purifier
	-- {object:19863} Maestra's Post
	["Follow the road west out of Astranaar; {object:19863} lies north of it."] = "Suivez la route vers l'ouest en sortant d'Astranaar ; {object:19863} se trouve au nord.",

	-- Step 19: Heartswood
	-- {quest:1738} Heartswood · {object:19863} Maestra's Post · {quest:65602} What Is Love? · {item:190309} Wooden Figurine
	["From Astranaar head north-west into the hills: the {quest:1738} is a glowing tree north of the road to {object:19863}. If you took {quest:65602}, the {item:190309} lies in a house among the trees north of {object:19863} (26.6,22.0). Then back past Astranaar to the Talondeep Path."] = "Depuis Astranaar, dirigez-vous au nord-ouest dans les collines : le {quest:1738} est un arbre lumineux au nord de la route vers {object:19863}. Si vous avez pris {quest:65602}, le {item:190309} se trouve dans une maison parmi les arbres au nord de {object:19863} (26.6,22.0). Puis retournez par Astranaar jusqu'au sentier de Talondeep.",
	-- {item:190309} Wooden Figurine · {object:19863} Maestra's Post
	["{item:190309}, north of {object:19863}"] = "{item:190309}, au nord de {object:19863}",
}
