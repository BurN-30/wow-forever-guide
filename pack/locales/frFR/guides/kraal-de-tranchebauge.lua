-- French (frFR): the guide groupe-alliance/kraal-de-tranchebauge (guides/kraal-de-tranchebauge.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["Dungeon · Razorfen Kraul (29-37)"] = "Donjon · Kraal de Tranchebauge (29-37)",

	-- Step 1: Falfindel Waywarder: The Crone of the Kraul
	-- {zone:1413} Barrens · {object:19844} Great Lift · {npc:4048} Falfindel Waywarder · {npc:4421} Charlga Razorflank
	["Razorfen Kraul: a 5-player quilboar dungeon in the bramble at the southern edge of the {zone:1413}, west of the top of the {object:19844}, levels 29 to 38 in the group finder; the last bosses are 33. {npc:4048} wants the medallion of {npc:4421}, its last boss."] = "Kraal de Tranchebauge : un donjon de huttiers pour 5 joueurs dans les ronces au sud des {zone:1413}, à l'ouest du haut du Grand élévateur, niveaux 29 à 38 dans la recherche de groupe ; les derniers boss sont de niveau 33. {npc:4048} veut le médaillon de {npc:4421}, son dernier boss.",
	["Keep 3 free quest log slots."] = "Garder 3 places libres dans le journal.",

	-- Step 2: Razorfen Kraul entrance
	["Razorfen Kraul entrance"] = "Entrée du Kraal de Tranchebauge",
	-- {object:19844} Great Lift
	["Back east to the {object:19844} and up: wait on the platform until the lift is level with it before you step on. At the top, west along the cliffs into the bramble. Horde land: keep clear of the Horde's camps and guards."] = "Retour vers l'est jusqu'au Grand élévateur, et monter : attendre sur la plateforme que l'élévateur soit à son niveau avant de monter dessus. En haut, vers l'ouest le long des falaises jusque dans les ronces. Terre de la Horde : rester à l'écart de ses camps et de ses gardes.",
	-- {quest:1144} Willix the Importer · {npc:4510} Heralath Fallowbrook · {quest:1101} The Crone of the Kraul
	["{quest:1144} and {npc:4510} give their quests inside, at the end: nothing else to take beforehand. Share {quest:1101} with the group: click it in the quest log, then Share."] = "{quest:1144} et {npc:4510} donnent leurs quêtes à l'intérieur, à la fin : rien d'autre à prendre avant. Partager {quest:1101} avec le groupe : clic sur la quête dans le journal, puis Partager.",
	["Razorfen Kraul"] = "Kraal de Tranchebauge",

	-- Step 3: Warriors: Fire Hardened Mail
	-- {quest:1701} Fire Hardened Mail
	["Warriors: {quest:1701}"] = "Guerriers : {quest:1701}",

	-- Step 4: Razorfen Kraul: Charlga Razorflank
	-- {npc:4421} Charlga Razorflank
	["Razorfen Kraul: {npc:4421}"] = "Kraal de Tranchebauge : {npc:4421}",
	-- {npc:4424} Aggem Thorncurse · {npc:4428} Death Speaker Jargba · {npc:4420} Overlord Ramtusk · {npc:4422} Agathelos the Raging · {npc:4421} Charlga Razorflank · {quest:1101} The Crone of the Kraul
	["Roogug, {npc:4424}, {npc:4428}, {npc:4420} and {npc:4422} come before her (the codex's order). {npc:4421}, the last boss, fights on the ramp outside her hut and teleports back into it now and then: the tank grabs her again. Her Purity dispels every debuff and makes her immune for a while: no damage-over-time on her. Each player on {quest:1101} loots the medallion."] = "Roogug, {npc:4424}, {npc:4428}, {npc:4420} et {npc:4422} viennent avant elle (l'ordre du codex). {npc:4421}, le dernier boss, combat sur la rampe devant sa hutte et s'y téléporte de temps en temps : le tank la reprend. Sa Pureté dissipe tous les effets négatifs et la rend insensible un moment : pas de dégâts sur la durée sur elle. Chaque joueur qui a {quest:1101} ramasse le médaillon.",
	-- {quest:1701} Fire Hardened Mail · {item:6841} Vial of Phlogiston · {zone:1437} Wetlands
	["{quest:1701}, for Warriors: Roogug, the first boss, drops the {item:6841}. The other items of the quest come from Stonetalon and the {zone:1437}: Polestar's class guides (Fire Hardened Armor) cover them."] = "{quest:1701}, pour les guerriers : Roogug, le premier boss, lâche la {item:6841}. Les autres objets de la quête viennent des Serres-Rocheuses et des {zone:1437} : les guides de classe de Polestar (Fire Hardened Armor) les couvrent.",

	-- Step 5: Shamans: Elemental Aid
	-- {quest:96264} Elemental Aid
	["Shamans: {quest:96264}"] = "Chamans : {quest:96264}",
	-- {quest:96264} Elemental Aid · {npc:259023} Veyric Thunderhame · {zone:1417} Arathi Highlands · {item:274463} Tattered Note · {npc:4421} Charlga Razorflank
	["{quest:96264} ({npc:259023}, {zone:1417}): the {item:274463} comes from {npc:4421}. To check in game: the drop rate is not known."] = "{quest:96264} ({npc:259023}, {zone:1417}) : la {item:274463} vient de {npc:4421}. À vérifier en jeu : le taux de butin n'est pas connu.",

	-- Step 6: Razorfen Kraul: Heralath Fallowbrook
	-- {npc:4510} Heralath Fallowbrook
	["Razorfen Kraul: {npc:4510}"] = "Kraal de Tranchebauge : {npc:4510}",
	-- {npc:4421} Charlga Razorflank · {npc:4510} Heralath Fallowbrook · {quest:1142} Mortality Wanes · {item:5825} Treshala's Pendant · {zone:1457} Darnassus
	["Jump down from {npc:4421}'s area and kill a few quilboars: {npc:4510}, a night elf who died in the Kraul, lies by a tent in the north of that area. {quest:1142} asks for {item:5825}, about 1 quilboar in 10, for each player on the quest: by now most of the Kraul is cleared, so it often takes the walk back or a second run. Its hand-in is in {zone:1457}, off the route: whenever the player is there, Polestar lists it."] = "Sauter depuis le repaire de {npc:4421} et tuer quelques huttiers : {npc:4510}, une elfe de la nuit morte dans le Kraal, gît près d'une tente au nord de cette zone. {quest:1142} demande le {item:5825}, environ 1 huttier sur 10, pour chaque joueur qui a la quête : le Kraal est alors presque vidé, il faut donc souvent le chemin du retour ou un second passage. Elle se rend à {zone:1457}, hors du parcours : Polestar l'affiche dès que le joueur y passe.",
	-- {item:5825} Treshala's Pendant
	["{item:5825}: quilboars of the Kraul, about 1 in 10"] = "{item:5825} : huttes-épines du kraal, environ 1 fois sur 10",

	-- Step 7: Razorfen Kraul: Willix the Importer
	-- {quest:1144} Willix the Importer
	["Razorfen Kraul: {quest:1144}"] = "Kraal de Tranchebauge : {quest:1144}",
	-- {quest:1144} Willix the Importer · {npc:4510} Heralath Fallowbrook
	["{quest:1144}, a goblin, is held in the same tent as {npc:4510}. Everyone takes his quest before he starts walking; he walks back to the entrance by the south side, past many armored boars. He gives the reward himself at the end."] = "{quest:1144}, un gobelin, est retenu dans la même tente que {npc:4510}. Chacun prend sa quête avant qu'il se mette en marche ; il retourne à l'entrée par le côté sud, devant de nombreux sangliers cuirassés. Il donne lui-même la récompense à la fin.",
	["Not there? Another group is escorting him: wait for him to come back, or join them."] = "Pas là ? Un autre groupe l'escorte : attendre son retour, ou se joindre à eux.",
	["Polestar asks whether to do this escort: in a group, answer Do it (Skip it takes the quest out of the chapter)."] = "Polestar demande s'il faut faire cette escorte : en groupe, répondre « La faire » (« La passer » retire la quête du chapitre).",
	["Escort him out of the Kraul"] = "L'escorter hors du kraal",

	-- Step 8: Razorfen Kraul: Willix the Importer's reward
	-- {npc:4508} Willix the Importer
	["Razorfen Kraul: {npc:4508}'s reward"] = "Kraal de Tranchebauge : la récompense de {npc:4508}",
	-- {quest:1144} Willix the Importer
	["{quest:1144} gives the reward himself, at the entrance, once he is safe."] = "{quest:1144} donne la récompense lui-même, à l'entrée, une fois en sécurité.",
	-- {quest:1144} Willix the Importer
	["{quest:1144}, at the entrance"] = "{quest:1144}, à l'entrée",

	-- Step 9: Falfindel Waywarder: back to the route
	-- {npc:4048} Falfindel Waywarder
	["{npc:4048}: back to the route"] = "{npc:4048} : retour au parcours",
	-- {object:19844} Great Lift · {npc:4048} Falfindel Waywarder · {zone:1441} Thousand Needles
	["Back to the {object:19844} and down, then west past Highperch to {npc:4048}'s camp. Last stop of the chapter: the route's own guide comes back once this is handed in, and goes on east through {zone:1441}."] = "Retour au Grand élévateur et descendre, puis vers l'ouest, passé Highperch, jusqu'au camp de {npc:4048}. Dernier arrêt du chapitre : le guide du parcours revient une fois la quête rendue, et continue vers l'est à travers {zone:1441}.",
}
