-- French (frFR): the guide groupe-alliance/brassenoire (guides/brassenoire.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["Dungeon · Blackfathom Deeps (23-28)"] = "Donjon · Profondeurs de Brassenoire (23-28)",

	-- Step 1: Auberdine: Gershala Nightwhisper
	-- {npc:8997} Gershala Nightwhisper
	["Auberdine: {npc:8997}"] = "Auberdine : {npc:8997}",
	-- {zone:1440} Ashenvale · {zone:1457} Darnassus
	["Blackfathom Deeps: a 5-player dungeon on the north-west coast of {zone:1440}, levels 24 to 32 in the group finder: at 25 or more it goes well. Its quests are taken here and in {zone:1457}, the dungeon is run from the Zoram Strand, and they are handed in back here."] = "Profondeurs de Brassenoire : un donjon pour 5 joueurs sur la côte nord-ouest d'{zone:1440}, niveaux 24 à 32 dans la recherche de groupe : à 25 ou plus, il passe bien. Ses quêtes se prennent ici et à {zone:1457}, le donjon se fait depuis la grève de Zoram, et elles se rendent ici au retour.",
	["Keep 5 free quest log slots. Bind your hearthstone at the inn: it brings you back here after the dungeon."] = "Garder 5 places libres dans le journal. Lier la pierre de foyer à l'auberge : elle ramène ici après le donjon.",

	-- Step 2: Darnassus: the Argent Dawn (Blackfathom Deeps, optional detour)
	-- {zone:1457} Darnassus · {object:92525} Argent Dawn
	["{zone:1457}: the {object:92525} (Blackfathom Deeps, optional detour)"] = "{zone:1457} : {object:92525} (Profondeurs de Brassenoire, détour facultatif)",
	-- {zone:1457} Darnassus · {object:92525} Argent Dawn · {quest:1198} In Search of Thaelrid · {quest:1200} Blackfathom Villainy · {quest:1199} Twilight Falls
	["Two more Blackfathom quests wait in {zone:1457}, with the {object:92525}: {quest:1198}, then {quest:1200} from Thaelrid inside the dungeon, and {quest:1199}. About 19,600 XP with the hand-ins, and a blue reward. The detour: the boat from the Auberdine dock to Rut'theran Village (Night Elves fly), the portal up to {zone:1457}, then back; the hand-ins need the same trip after the dungeon. Short on time? Skip it."] = "Deux autres quêtes de Brassenoire attendent à {zone:1457}, chez l'{object:92525} : {quest:1198}, puis {quest:1200} donnée par Thaelrid dans le donjon, et {quest:1199}. Environ 19 600 XP avec les rendus, et une récompense bleue. Le détour : le bateau du quai d'Auberdine pour le village de Rut'theran (les elfes de la nuit volent), le portail qui monte à {zone:1457}, puis le retour ; les rendus demandent le même trajet après le donjon. Peu de temps ? Le passer.",

	-- Step 3: Back to Auberdine
	["Back to Auberdine"] = "Retour à Auberdine",
	["Back down the portal to Rut'theran Village, then the flight to Auberdine."] = "Redescendre par le portail au village de Rut'theran, puis le vol pour Auberdine.",

	-- Step 4: Blackfathom Deeps: before going in
	["Blackfathom Deeps: before going in"] = "Profondeurs de Brassenoire : avant d'entrer",
	-- {zone:1439} Darkshore · {zone:1440} Ashenvale
	["South along the coast road out of {zone:1439}, then the {zone:1440} shore to the Zoram Strand, its north end: about ten minutes' ride. The way in is the sunken ruins' pit at the north end of the strand: down the stairs, then swim through the tunnels under the wall, past the blue crystals, to the portal. Every enemy inside is elite."] = "Vers le sud par la route côtière de {zone:1439}, puis la rive d'{zone:1440} jusqu'au nord de la grève de Zoram : une dizaine de minutes. L'entrée est la fosse des ruines englouties au nord de la grève : descendre l'escalier, puis nager dans les tunnels sous le mur, passé les cristaux bleus, jusqu'au portail. Tous les ennemis à l'intérieur sont élites.",
	-- {quest:1275} Researching the Corruption · {npc:8997} Gershala Nightwhisper · {quest:1198} In Search of Thaelrid · {quest:1199} Twilight Falls · {zone:1457} Darnassus
	["In the log before going in: {quest:1275} ({npc:8997}, Auberdine); {quest:1198} and {quest:1199} for whoever went to {zone:1457}. Share each quest with the group: click it in the quest log, then Share."] = "Dans le journal avant d'entrer : {quest:1275} ({npc:8997}, Auberdine) ; {quest:1198} et {quest:1199} pour qui est allé à {zone:1457}. Partager chaque quête avec le groupe : clic sur la quête dans le journal, puis Partager.",
	["Blackfathom Deeps"] = "Profondeurs de Brassenoire",

	-- Step 5: Blackfathom Deeps: along the way
	["Blackfathom Deeps: along the way"] = "Profondeurs de Brassenoire : en chemin",
	-- plural, as words: Twilight Pendants = {item:5879} Twilight Pendant
	["Collected all through the dungeon: the brain stems from the nagas and the Fallenroot satyrs (those outside the portal drop them too), the Twilight Pendants from the Twilight's Hammer cultists, about 4 kills in 5 for each. Every player with the quest loots their own; with a full group on them, a second run may be needed."] = "À ramasser dans tout le donjon : les troncs cérébraux sur les nagas et les satyres (ceux d'avant le portail en lâchent aussi), les pendentifs du Crépuscule sur les cultistes du Marteau du crépuscule, environ 4 fois sur 5 pour chacun. Chaque joueur qui a la quête ramasse les siens ; avec tout le groupe dessus, un second passage peut être nécessaire.",
	-- {item:5952} Corrupted Brain Stem
	["{item:5952}: Blackfathom nagas, Fallenroot satyrs"] = "{item:5952} : nagas et satyres du donjon",
	-- {item:5879} Twilight Pendant
	["{item:5879}: Twilight's Hammer cultists"] = "{item:5879} : cultistes du Marteau du crépuscule",

	-- Step 6: Paladins: Seeking the Kor Gem
	-- {quest:1442} Seeking the Kor Gem
	["Paladins: {quest:1442}"] = "Paladins : {quest:1442}",
	-- {item:6995} Corrupted Kor Gem · {npc:3649} Thundris Windweaver
	["The Blackfathom Tide Priestesses, Oracles and Sea Witches (the naga casters) drop the {item:6995}, about 1 in 2. {npc:3649} in Auberdine cleanses it, on the way back."] = "Les prêtresses des marées, oracles et sorcières des mers de Brassenoire (les nagas lanceuses de sorts) lâchent la {item:6995}, environ 1 fois sur 2. {npc:3649}, à Auberdine, la purifie au retour.",
	-- {item:6995} Corrupted Kor Gem
	["{item:6995}: naga casters"] = "{item:6995} : nagas lanceuses de sorts",

	-- Step 7: Warlocks: The Orb of Soran'ruk
	-- {quest:1740} The Orb of Soran'ruk
	["Warlocks: {quest:1740}"] = "Démonistes : {quest:1740}",
	-- {object:1680} Shadowfang Keep · {item:6898} Orb of Soran'ruk
	-- plural, as words: Twilight Acolytes = {npc:4809} Twilight Acolyte · Soran'ruk Fragments = {item:6914} Soran'ruk Fragment
	["The Twilight Acolytes of the Twilight's Hammer area drop the Soran'ruk Fragments. The large fragment comes from {object:1680}, a Horde dungeon: Polestar's class guides ({item:6898}) cover it."] = "Les acolytes du Crépuscule du quartier du Marteau du crépuscule lâchent les fragments de Soran'ruk. Le grand fragment vient du donjon d'Ombrecroc, un donjon de la Horde : les guides de classe de Polestar ({item:6898}) s'en chargent.",
	-- {item:6914} Soran'ruk Fragment
	-- plural, as words: Twilight Acolytes = {npc:4809} Twilight Acolyte
	["{item:6914}: Twilight Acolytes"] = "{item:6914} : acolytes du Crépuscule",

	-- Step 8: Blackfathom Deeps: Ghamoo-ra's pool
	-- {npc:4887} Ghamoo-ra
	["Blackfathom Deeps: {npc:4887}'s pool"] = "Profondeurs de Brassenoire : le bassin de {npc:4887}",
	-- {npc:4887} Ghamoo-ra · {npc:4787} Argent Guard Thaelrid
	["The great turtle {npc:4887} lives in the first big pool. {npc:4787} waits by a campfire in an underwater side cave, its entrance south-east of the same pool (next step)."] = "La grande tortue {npc:4887} vit dans le premier grand bassin. {npc:4787} attend près d'un feu de camp dans une grotte sous-marine voisine, dont l'entrée est au sud-est du même bassin (étape suivante).",

	-- Step 9: Blackfathom Deeps: Argent Guard Thaelrid
	-- {npc:4787} Argent Guard Thaelrid
	["Blackfathom Deeps: {npc:4787}"] = "Profondeurs de Brassenoire : {npc:4787}",
	-- {object:92525} Argent Dawn · {npc:4887} Ghamoo-ra · {quest:1200} Blackfathom Villainy
	["Thaelrid of the {object:92525} waits in an underwater cave whose entrance is south-east of {npc:4887}'s pool. Talk to him BEFORE killing Kelris: Kelris's head drops only for players who already hold {quest:1200}."] = "Thaelrid, de {object:92525}, attend dans une grotte sous l'eau dont l'entrée est au sud-est du bassin de {npc:4887}. Lui parler AVANT de tuer Kelris : la tête de Kelris ne tombe que pour les joueurs qui ont déjà {quest:1200}.",

	-- Step 10: Blackfathom Deeps: Argent Guard Thaelrid (without the Darnassus quest)
	-- {npc:4787} Argent Guard Thaelrid · {zone:1457} Darnassus
	["Blackfathom Deeps: {npc:4787} (without the {zone:1457} quest)"] = "Profondeurs de Brassenoire : {npc:4787} (sans la quête de {zone:1457})",
	-- {object:92525} Argent Dawn · {npc:4887} Ghamoo-ra · {quest:1200} Blackfathom Villainy · {quest:1198} In Search of Thaelrid
	["Thaelrid of the {object:92525} waits in an underwater cave whose entrance is south-east of {npc:4887}'s pool. He offers {quest:1200} without {quest:1198} too. Talk to him BEFORE killing Kelris; not offered? Carry on."] = "Thaelrid, de {object:92525}, attend dans une grotte sous l'eau dont l'entrée est au sud-est du bassin de {npc:4887}. Il propose {quest:1200} même sans {quest:1198}. Lui parler AVANT de tuer Kelris ; pas proposée ? Continuer.",

	-- Step 11: Blackfathom Deeps: Lady Sarevess and Gelihast
	-- {npc:4831} Lady Sarevess · {npc:6243} Gelihast
	["Blackfathom Deeps: {npc:4831} and {npc:6243}"] = "Profondeurs de Brassenoire : {npc:4831} et {npc:6243}",
	-- {npc:4831} Lady Sarevess · {npc:6243} Gelihast
	["{npc:4831}, the second boss, comes with two guards: interrupt her Forked Lightning, it chains between players standing close (spread out). {npc:6243}, the murloc of the side cave, is optional: pull his murlocs one at a time; the stone behind him gives the Blessing of Blackfathom. The Twilight's Hammer cultists come after them."] = "{npc:4831}, le deuxième boss, vient avec deux gardes : interrompre son Éclair fourchu, qui rebondit entre les joueurs proches (s'écarter). {npc:6243}, le murloc de la grotte latérale, est facultatif : tirer ses murlocs un par un ; la pierre derrière lui donne la Bénédiction de Brassenoire. Les cultistes du Marteau du crépuscule viennent ensuite.",

	-- Step 12: Blackfathom Deeps: Twilight Lord Kelris
	-- {npc:4832} Twilight Lord Kelris
	["Blackfathom Deeps: {npc:4832}"] = "Profondeurs de Brassenoire : {npc:4832}",
	-- {quest:1200} Blackfathom Villainy · {npc:4829} Aku'mai
	["Kelris waits in the ceremonial chamber before the last room. Interrupt his Sleep and kill his adds first. Every player on {quest:1200} loots their own head. {npc:4829}, behind him, is optional: no quest, good loot."] = "Kelris attend dans la salle de cérémonie avant la dernière salle. Interrompre son Sommeil et tuer ses aides d'abord. Chaque joueur qui a {quest:1200} ramasse sa propre tête. {npc:4829}, derrière lui, est facultatif : pas de quête, du bon butin.",

	-- Step 13: Hearthstone to Auberdine
	["Hearthstone to Auberdine"] = "Pierre de foyer vers Auberdine",
	["Out by the portal, then the hearthstone: it was bound in Auberdine at the start of the chapter. On cooldown? Ride back north along the coast."] = "Sortie par le portail, puis la pierre de foyer : elle a été liée à Auberdine au début du chapitre. En recharge ? Remonter vers le nord le long de la côte.",
	["Auberdine"] = "Auberdine",

	-- Step 14: Darnassus: Blackfathom hand-ins (detour)
	-- {zone:1457} Darnassus
	["{zone:1457}: Blackfathom hand-ins (detour)"] = "{zone:1457} : rendus de Brassenoire (détour)",
	-- {zone:1457} Darnassus · {npc:4783} Dawnwatcher Selgorm · {npc:4784} Argent Guard Manados · {object:92525} Argent Dawn
	["From Auberdine to Rut'theran Village: the flight, or the boat from the Auberdine dock for whoever never learned that flight path; then the portal up to {zone:1457}. {npc:4783} and {npc:4784} stand with the {object:92525}."] = "D'Auberdine au village de Rut'theran : le vol, ou le bateau du quai d'Auberdine pour qui n'a jamais appris ce trajet ; puis le portail qui monte à {zone:1457}. {npc:4783} et {npc:4784} se tiennent avec {object:92525}.",

	-- Step 15: Darnassus: Twilight Falls (detour)
	-- {zone:1457} Darnassus · {quest:1199} Twilight Falls
	["{zone:1457}: {quest:1199} (detour)"] = "{zone:1457} : {quest:1199} (détour)",
	-- {zone:1457} Darnassus · {npc:4784} Argent Guard Manados · {object:92525} Argent Dawn
	["From Auberdine to Rut'theran Village: the flight, or the boat from the Auberdine dock for whoever never learned that flight path; then the portal up to {zone:1457}. {npc:4784} stands with the {object:92525}."] = "D'Auberdine au village de Rut'theran : le vol, ou le bateau du quai d'Auberdine pour qui n'a jamais appris ce trajet ; puis le portail qui monte à {zone:1457}. {npc:4784} se tient avec {object:92525}.",
	-- {npc:4784} Argent Guard Manados
	["{npc:4784}, with the 10 pendants"] = "{npc:4784}, avec les 10 pendentifs",

	-- Step 17: Auberdine: Gershala Nightwhisper
	-- {npc:8997} Gershala Nightwhisper · {object:1162} Menethil Harbor
	["Last stop of the chapter: {npc:8997} stands a short walk west of Terenthis. The route's own guide comes back once this is handed in: Terenthis, then the boat to {object:1162}."] = "Dernier arrêt du chapitre : {npc:8997} se tient à quelques pas à l'ouest de Terenthis. Le guide du parcours revient une fois la quête rendue : Terenthis, puis le bateau pour le port de Menethil.",
}
