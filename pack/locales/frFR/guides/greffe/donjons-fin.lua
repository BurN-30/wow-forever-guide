-- French (frFR): the guide groupe-alliance/greffe/donjons-fin (guides/greffe/donjons-fin.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["End of route · Dungeons 52-60 (optional)"] = "Fin de parcours · Donjons 52-60 (facultatifs)",

	-- Step 1: Blackrock Depths (dungeon, optional)
	["Blackrock Depths (dungeon, optional)"] = "Profondeurs de Rochenoire (donjon, facultatif)",
	-- {object:147516} Dark Iron · {zone:1427} Searing Gorge · {zone:1428} Burning Steppes · {zone:1455} Ironforge · {zone:1453} Stormwind
	["Blackrock Depths: the {object:147516} dwarves' city under Blackrock Mountain, between the {zone:1427} and the {zone:1428}. Levels 52 to 60, bosses 51 to 59: easy for a group of 5 at 58 to 60; possible earlier at five (from about 54), difficult. The dungeon is huge: the guide splits it into three visits of one to two hours, with the quests given in {zone:1455}, Kharanos, the {zone:1428}, Lakeshire and {zone:1453}. Alone? Skip it."] = "Profondeurs de Rochenoire : la cité des nains {object:147516} sous le Mont Rochenoire, entre {zone:1427} et {zone:1428}. Niveaux 52 à 60, boss 51 à 59 : facile pour un groupe de 5 aux niveaux 58 à 60 ; possible plus tôt à cinq (vers 54), difficile. Le donjon est immense : le guide le découpe en trois visites d'une à deux heures, avec les quêtes données à {zone:1455}, Kharanos, dans {zone:1428}, à Comté-du-Lac et à {zone:1453}. Seul ? Le passer.",
	["Keep 12 free quest log slots. Most of these quests cannot be shared: each player takes their own."] = "Garder 12 places libres dans le journal de quêtes. La plupart de ces quêtes ne se partagent pas : chaque joueur prend la sienne.",
	-- {zone:1455} Ironforge · {object:1162} Menethil Harbor
	["From Cenarion Hold: a hearthstone bound in {zone:1455}, or the flight to Theramore, the boat to {object:1162} and the flight to {zone:1455}."] = "Depuis le Fort cénarien : une pierre de foyer liée à {zone:1455}, ou le vol pour Theramore, le bateau pour {object:1162} et le vol pour {zone:1455}.",

	-- Step 2: Ironforge: Royal Historian Archesonus
	-- {object:171709} High Seat · {quest:3701} The Smoldering Ruins of Thaurissan · {zone:1428} Burning Steppes · {zone:1453} Stormwind
	["Archesonus stands in the {object:171709}, beside King Magni. Magni's quest for Blackrock Depths waits for {quest:3701}, which the route offered as a group quest at 50: its relics are in the {zone:1428}, on this chapter's way, and it is handed in here on the trip to {zone:1453}."] = "Archesonus se tient dans {object:171709}, à côté du roi Magni. La quête de Magni pour les Profondeurs de Rochenoire attend {quest:3701}, que le parcours a proposée comme quête de groupe à 50 : ses reliques sont dans les {zone:1428}, sur le chemin de ce chapitre, et elle se rend ici lors du trajet vers {zone:1453}.",

	-- Step 3: Ironforge: King Magni Bronzebeard
	-- {object:171709} High Seat · {npc:8879} Royal Historian Archesonus · {npc:9021} Kharan Mighthammer
	["Magni stands in the {object:171709}, beside {npc:8879}. {npc:9021} is a prisoner in Blackrock Depths."] = "Magni se tient dans {object:171709}, à côté de {npc:8879}. {npc:9021} est prisonnier dans les Profondeurs de Rochenoire.",

	-- Step 4: Kharanos: Ragnar Thunderbrew
	-- {npc:1267} Ragnar Thunderbrew
	["Kharanos: {npc:1267}"] = "Kharanos : {npc:1267}",
	-- {zone:1455} Ironforge · {npc:1267} Ragnar Thunderbrew
	["Ride out of {zone:1455} down to Kharanos: {npc:1267} is in the Thunderbrew Distillery. His lost recipe is in the Grim Guzzler, the tavern of Blackrock Depths (third visit)."] = "Sortir de {zone:1455} et descendre jusqu'à Kharanos : {npc:1267} est dans la distillerie Tonnebière (Thunderbrew Distillery). Sa recette perdue est dans la taverne des Profondeurs de Rochenoire (Grim Guzzler, troisième visite).",

	-- Step 5: Fly to Morgan's Vigil
	["Fly to Morgan's Vigil"] = "Voler jusqu'à la Veille de Morgan",
	-- {zone:1455} Ironforge
	["{zone:1455} flight master"] = "Maître de vol de {zone:1455}",

	-- Step 6: Morgan's Vigil
	["Morgan's Vigil"] = "Veille de Morgan",
	-- {npc:9177} Oralius · {npc:9561} Jalinda Sprig · {npc:9562} Helendis Riverhorn · {npc:9560} Marshal Maxwell · {quest:4262} Overmaster Pyron
	["{npc:9177}, {npc:9561}, {npc:9562} and {npc:9560} stand in the camp. {quest:4262} is outside the dungeon, on the way in; Incendius, inside, comes after him."] = "{npc:9177}, {npc:9561}, {npc:9562} et {npc:9560} se tiennent dans le camp. {quest:4262} se fait hors du donjon, sur le chemin ; Incendius, dedans, vient après.",
	-- {npc:9177} Oralius
	["{npc:9177}: the fanny packs drop all through the dungeon"] = "{npc:9177} : les sacoches tombent dans tout le donjon",

	-- Step 7: Ruins of Thaurissan: the relics
	["Ruins of Thaurissan: the relics"] = "Ruines de Thaurissan : les reliques",
	-- {npc:8978} Thauris Balgarr · {object:147516} Dark Iron
	-- plural, as words: War Reavers = {npc:7039} War Reaver · Thaurissan Firewalkers = {npc:7037} Thaurissan Firewalker
	["The relics are the carved stones scattered through the Ruins of Thaurissan, west of Flame Crest: click them until the information is recovered. The War Reavers and Thaurissan Firewalkers there are 53-55, and {npc:8978} (57) holds the {object:147516} camp south-west of Flame Crest: take the relics at the edge of the ruins."] = "Les reliques sont les pierres sculptées éparpillées dans les ruines de Thaurissan, à l'ouest de la Corniche des flammes : les cliquer jusqu'à récupérer l'information. Les Ravageurs de guerre et les Marchefeux de Thaurissan y sont de niveau 53-55, et {npc:8978} (57) tient le camp {object:147516} au sud-ouest de la Corniche des flammes : prendre les reliques au bord des ruines.",

	-- Step 8: Morgan's Vigil: Helendis Riverhorn
	-- {npc:9562} Helendis Riverhorn
	["Morgan's Vigil: {npc:9562}"] = "Veille de Morgan : {npc:9562}",
	-- {npc:9562} Helendis Riverhorn · {quest:4182} Dragonkin Menace · {quest:4241} Marshal Windsor · {zone:1453} Stormwind
	["{npc:9562}'s chain ({quest:4182} done) leads to {quest:4241}, a prisoner in Blackrock Depths: first a round trip to Lakeshire and {zone:1453}, by flight."] = "La suite de {npc:9562} ({quest:4182} faite) mène à {quest:4241}, prisonnier dans les Profondeurs de Rochenoire : d'abord un aller-retour à Comté-du-Lac et à {zone:1453}, en vol.",

	-- Step 9: Morgan's Vigil: Dragonkin Menace
	-- {quest:4182} Dragonkin Menace
	["Morgan's Vigil: {quest:4182}"] = "Veille de Morgan : {quest:4182}",
	-- {quest:4241} Marshal Windsor · {npc:9562} Helendis Riverhorn · {quest:4182} Dragonkin Menace
	["{quest:4241}'s chain starts with {npc:9562}'s {quest:4182}: the black dragonkin of the hills east of Flame Crest and of the eastern edge of the Steppes, elite at around 52."] = "La suite de {quest:4241} commence par {quest:4182} de {npc:9562} : les draconiens noirs des collines à l'est de la Corniche des flammes et du bord est des Steppes, élites vers 52.",

	-- Step 10: The black dragonkin
	["The black dragonkin"] = "Les draconiens noirs",
	-- plural, as words: Black Drakes = {npc:7044} Black Drake
	["Ride north-east from the Vigil into the hills: Broodlings, Dragonspawn and Wyrmkin in packs, the three Black Drakes apart, one in the northern hills and two further south."] = "Partir au nord-est de la Veille, dans les collines : Broodlings, Dragonspawn et Wyrmkin en groupes, les trois Black Drakes à part, l'un dans les collines du nord, les deux autres plus au sud.",

	-- Step 12: Fly to Lakeshire
	["Fly to Lakeshire"] = "Envolez-vous vers Comté-du-Lac",
	["Morgan's Vigil flight master"] = "Maître de vol de la Veille de Morgan",

	-- Step 13: Lakeshire: Magistrate Solomon
	-- {npc:344} Magistrate Solomon
	["Lakeshire: {npc:344}"] = "Comté-du-Lac : {npc:344}",
	["Solomon is in the town hall of Lakeshire."] = "Solomon est dans l'hôtel de ville de Comté-du-Lac.",

	-- Step 14: Fly to Stormwind
	-- {zone:1453} Stormwind
	["Fly to {zone:1453}"] = "Prendre un vol pour {zone:1453}",
	["Lakeshire flight master"] = "Maître de vol de Comté-du-Lac",

	-- Step 15: Stormwind Keep: Bolvar and Lady Prestor
	-- {object:2117} Stormwind Keep
	["{object:2117}: Bolvar and Lady Prestor"] = "{object:2117} : Bolvar et Lady Prestor",
	-- {npc:1748} Highlord Bolvar Fordragon · {object:2117} Stormwind Keep · {npc:1749} Lady Katrana Prestor
	["{npc:1748} is in the throne room at the back of {object:2117}, {npc:1749} at his side: speak with her, then with him again."] = "{npc:1748} est dans la salle du trône, au fond de {object:2117}, {npc:1749} à ses côtés : lui parler, puis reparler à Bolvar.",
	-- {npc:1749} Lady Katrana Prestor
	["{npc:1749}: speak with her"] = "{npc:1749} : lui parler",

	-- Step 16: Ironforge: The Smoldering Ruins of Thaurissan
	-- {zone:1453} Stormwind · {object:28027} Dwarven District · {npc:8879} Royal Historian Archesonus · {object:171709} High Seat · {zone:1455} Ironforge
	["The Deeprun Tram from {zone:1453}'s {object:28027}: {npc:8879} and King Magni stand in the {object:171709}. Then the tram back to {zone:1453}, or the flight from {zone:1455} to Lakeshire."] = "Le Tram des profondeurs depuis {object:28027} de {zone:1453} : {npc:8879} et le roi Magni se tiennent dans {object:171709}. Puis le tram retour vers {zone:1453}, ou le vol de {zone:1455} pour Comté-du-Lac.",
	-- {npc:2784} King Magni Bronzebeard · {npc:9021} Kharan Mighthammer
	["{npc:2784}: {npc:9021} is a prisoner in Blackrock Depths"] = "{npc:2784} : {npc:9021} est prisonnier dans les Profondeurs de Rochenoire",

	-- Step 17: Fly to Lakeshire
	-- {zone:1453} Stormwind
	["{zone:1453} flight master"] = "Maître de vol de {zone:1453}",

	-- Step 20: Morgan's Vigil: Marshal Maxwell
	-- {npc:9560} Marshal Maxwell
	["Morgan's Vigil: {npc:9560}"] = "Veille de Morgan : {npc:9560}",
	-- {npc:9563} Ragged John
	["Maxwell sends you to {npc:9563}, at Flame Crest: the guide goes there next."] = "Maxwell envoie voir {npc:9563}, à la Corniche des flammes : le guide y va ensuite.",

	-- Step 21: Flame Crest
	["Flame Crest"] = "Corniche des flammes",
	-- {npc:9563} Ragged John · {npc:9536} Maxwort Uberglint · {npc:9544} Yuka Screwspigot
	["Ride north along the road, then climb to the goblin camp on Flame Crest. {npc:9563} tells his story in the camp; {npc:9536} and {npc:9544} give one quest each for the dungeon."] = "Suivre la route vers le nord, puis monter jusqu'au camp gobelin de la Corniche des flammes. {npc:9563} raconte son histoire dans le camp ; {npc:9536} et {npc:9544} donnent chacun une quête pour le donjon.",
	-- {npc:9563} Ragged John
	["{npc:9563}: speak with him, to the end of his story"] = "{npc:9563} : lui parler, jusqu'au bout de son histoire",

	-- Step 22: Cyrus Therepentous: the Frenzied Black Drake
	-- {npc:9459} Cyrus Therepentous · {npc:9461} Frenzied Black Drake
	["{npc:9459}: the {npc:9461}"] = "{npc:9459} : le {npc:9461}",
	-- {quest:4022} A Taste of Flame · {npc:9459} Cyrus Therepentous · {npc:9461} Frenzied Black Drake
	["{quest:4022}, first part (a group quest on the route at 50): {npc:9459} hides in a cave in the far east of the Steppes. The {npc:9461} (elite 54) appears outside it and drops the molt."] = "{quest:4022}, première partie (une quête de groupe du parcours à 50) : {npc:9459} se cache dans une grotte tout à l'est des Steppes. Le {npc:9461} (élite 54) apparaît devant et laisse tomber la mue.",

	-- Step 23: Cyrus Therepentous
	-- {npc:9459} Cyrus Therepentous · {item:11231} Altered Black Dragonflight Molt · {npc:9016} Bael'Gar
	["{npc:9459} hands over an {item:11231} with the quest: it goes on {npc:9016}'s remains, in the dungeon (second visit)."] = "{npc:9459} remet un {item:11231} avec la quête : il sert sur les restes de {npc:9016}, dans le donjon (deuxième visite).",

	-- Step 24: Morgan's Vigil: Marshal Maxwell
	-- {quest:4241} Marshal Windsor
	["Ride back south to the Vigil: Maxwell now sends you after {quest:4241}, in the dungeon's prison."] = "Revenir au sud jusqu'à la Veille : Maxwell envoie maintenant chercher {quest:4241}, dans la prison du donjon.",

	-- Step 25: Blackrock Mountain: Overmaster Pyron
	-- {quest:4262} Overmaster Pyron
	["Blackrock Mountain: {quest:4262}"] = "Mont Rochenoire : {quest:4262}",
	-- {quest:4262} Overmaster Pyron
	["Ride west along the road, past Blackrock Stronghold, into Blackrock Mountain. Inside, cross the great chain to the hanging building in the middle (Forgewright's Tomb), go down through it, then down the next chain to the Grinding Quarry: {quest:4262} (elite 52) walks there. The dungeon's door is past the quarry, on the left, at the far end of the Masonry."] = "Suivre la route vers l'ouest, passer le bastion de Rochenoire et entrer dans le Mont Rochenoire. Dedans, traverser la grande chaîne jusqu'au bâtiment suspendu du milieu (Forgewright's Tomb), descendre à travers, puis descendre la chaîne suivante jusqu'à la carrière (Grinding Quarry) : {quest:4262} (élite 52) y circule. La porte du donjon est après la carrière, sur la gauche, au fond de la maçonnerie (Masonry).",
	["Blackrock Mountain"] = "Mont Rochenoire",
	-- {quest:4262} Overmaster Pyron
	["{quest:4262}: the Grinding Quarry, before the dungeon's door"] = "{quest:4262} : la carrière (Grinding Quarry), avant la porte du donjon",

	-- Step 26: Franclorn Forgewright (one player is enough)
	-- {npc:8888} Franclorn Forgewright
	["{npc:8888} (one player is enough)"] = "{npc:8888} (un joueur suffit)",
	-- {item:11000} Shadowforge Key · {object:161460} Shadowforge Lock · {npc:8888} Franclorn Forgewright
	-- plural, as words: Shadowforge Gates = {object:170559} Shadowforge Gate
	["The {item:11000} opens the doors of the second and third visits (the Shadowforge Gates of the prison and the {object:161460}): one key in the group is enough. {npc:8888}'s ghost stands on his tomb in the hanging building, and only the dead see him. Whoever will carry the key: take off your gear (no repair bill), die in the lava under the chains, release, run back as a ghost from the graveyard and speak with {npc:8888}, then come back to life at your body or by a group mate's spell. To check in game."] = "La {item:11000} ouvre les portes des deuxième et troisième visites (les portes d'Ombreforge de la prison et {object:161460}) : une clé dans le groupe suffit. Le fantôme de {npc:8888} se tient sur son tombeau, dans le bâtiment suspendu, et seuls les morts le voient. Celui qui portera la clé : retirer son équipement (pas de frais de réparation), mourir dans la lave sous les chaînes, libérer son esprit, revenir en fantôme depuis le cimetière et parler à {npc:8888}, puis revenir à la vie près de son corps ou par le sort d'un équipier. À vérifier en jeu.",
	-- {npc:8888} Franclorn Forgewright
	["{npc:8888}, as a ghost"] = "{npc:8888}, en fantôme",

	-- Step 27: Blackrock Depths: along the way
	["Blackrock Depths: along the way"] = "Profondeurs de Rochenoire : en chemin",
	-- {quest:4123} The Heart of the Mountain
	-- plural, as words: Dark Iron Fanny Packs = {item:11468} Dark Iron Fanny Pack · Relic Coffer Keys = {item:11078} Relic Coffer Key
	["Collected all through the dungeon: the Dark Iron Fanny Packs, on the Anvilrage and Shadowforge dwarves (most of them carry one). The Relic Coffer Keys drop from the same dwarves, about one in eight, only for those on {quest:4123}: 12 keys open the 12 doors of the Black Vault (first visit), whoever carries them."] = "À ramasser dans tout le donjon : les sacoches Sombrefer (Dark Iron Fanny Packs), sur les nains Anvilrage et Shadowforge (la plupart en portent une). Les clés de coffre à reliques (Relic Coffer Keys) tombent des mêmes nains, environ une sur huit, seulement pour qui a {quest:4123} : 12 clés ouvrent les 12 portes de la chambre forte (Black Vault, première visite), quel que soit le joueur qui les porte.",
	-- {quest:4286} The Good Stuff · {quest:4123} The Heart of the Mountain · {quest:4126} Hurley Blackbreath
	["Share {quest:4286}, {quest:4123} and {quest:4126} with your group: click each in the quest log, then Share. The others cannot be shared."] = "Partager {quest:4286}, {quest:4123} et {quest:4126} avec le groupe : cliquer sur chacune dans le journal de quêtes, puis sur Partager. Les autres ne se partagent pas.",

	-- Step 28: Blackrock Depths, first visit: before going in
	["Blackrock Depths, first visit: before going in"] = "Profondeurs de Rochenoire, première visite : avant d'entrer",
	["First visit, no key needed: the Detention Block (the prison), the Ring of the Law, the Shrine of Thaurissan, the Black Vault and the Hall of Crafting. Bosses 51 to 56: 54 or more advised."] = "Première visite, sans clé : la prison (Detention Block), l'arène (Ring of the Law), le sanctuaire de Thaurissan (Shrine of Thaurissan), la chambre forte (Black Vault) et la salle des artisans (Hall of Crafting). Boss 51 à 56 : niveau 54 ou plus conseillé.",
	-- {quest:4341} Kharan Mighthammer · {quest:4241} Marshal Windsor · {quest:4286} The Good Stuff · {npc:9177} Oralius · {quest:4123} The Heart of the Mountain · {npc:9536} Maxwort Uberglint · {quest:3801} Dark Iron Legacy · {npc:8888} Franclorn Forgewright · {quest:4022} A Taste of Flame · {npc:9459} Cyrus Therepentous · {quest:4136} Ribbly Screwspigot · {npc:9544} Yuka Screwspigot · {quest:4126} Hurley Blackbreath · {npc:1267} Ragnar Thunderbrew · {npc:9500} Mistress Nagmara · {object:164869} Spectral Chalice · {npc:14387} Lothos Riftwaker
	["In the quest log: {quest:4341} (King Magni), {quest:4241} (Maxwell), {quest:4286} ({npc:9177}), {quest:4123} ({npc:9536}), {quest:3801} ({npc:8888}, if taken). For the next visits: {quest:4022} ({npc:9459}), {quest:4136} ({npc:9544}), {quest:4126} ({npc:1267}). Not on this route: {npc:9500}'s quest in the tavern (its herbs and silver are gathered outside), the {object:164869}'s (miners), {npc:14387}'s Attunement to the Core (raid)."] = "Dans le journal de quêtes : {quest:4341} (le roi Magni), {quest:4241} (Maxwell), {quest:4286} ({npc:9177}), {quest:4123} ({npc:9536}), {quest:3801} ({npc:8888}, si prise). Pour les visites suivantes : {quest:4022} ({npc:9459}), {quest:4136} ({npc:9544}), {quest:4126} ({npc:1267}). Pas sur ce parcours : la quête de {npc:9500} dans la taverne (ses herbes et son argent se récoltent dehors), celle de {object:164869} (mineurs), Attunement to the Core de {npc:14387} (raid).",
	["Blackrock Depths"] = "Profondeurs de Rochenoire",

	-- Step 29: Detention Block: Kharan Mighthammer and Windsor
	-- {npc:9021} Kharan Mighthammer
	["Detention Block: {npc:9021} and Windsor"] = "Prison : {npc:9021} et Windsor",
	-- {npc:9018} High Interrogator Gerstahn · {item:11140} Prison Cell Key · {quest:4341} Kharan Mighthammer · {quest:4241} Marshal Windsor · {npc:9021} Kharan Mighthammer · {npc:9025} Lord Roccor · {npc:9319} Houndmaster Grebmar
	["The Detention Block opens past the entrance. {npc:9018}, in the southernmost room, drops the {item:11140}, which opens the cells (a rogue can pick them instead). {quest:4341} and {quest:4241} are locked in the cells of the south-east corridor: listen to {npc:9021}'s whole story; Windsor has given up, and his news goes back to Maxwell. {npc:9025} patrols the northern ring, {npc:9319} waits at its lowest point. To check in game: which cell holds whom."] = "La prison (Detention Block) s'ouvre après l'entrée. {npc:9018}, dans la salle la plus au sud, donne la {item:11140}, qui ouvre les cellules (un voleur peut les crocheter). {quest:4341} et {quest:4241} sont enfermés dans les cellules du couloir sud-est : écouter toute l'histoire de {npc:9021} ; Windsor a perdu espoir, et ses nouvelles repartent chez Maxwell. {npc:9025} patrouille dans l'anneau nord, {npc:9319} attend à son point le plus bas. À vérifier en jeu : quelle cellule pour qui.",
	-- {quest:4341} Kharan Mighthammer
	["{quest:4341}: listen to his whole story"] = "{quest:4341} : écouter toute son histoire",
	["For King Magni"] = "Pour le roi Magni",
	-- {npc:9560} Marshal Maxwell
	["For {npc:9560}"] = "Pour {npc:9560}",

	-- Step 30: Ring of the Law and the Shrine of Thaurissan
	["Ring of the Law and the Shrine of Thaurissan"] = "L'arène et le sanctuaire de Thaurissan",
	-- {npc:9024} Pyromancer Loregrain · {object:164689} Monument of Franclorn Forgewright
	-- plural, as words: Arena Spectators = {npc:8916} Arena Spectator
	["The open gate on the east side of the Detention Block leads into the Ring of the Law: the gate closes behind you, two waves of beasts come, then a random boss. Once it is down, a second gate opens into the East Garrison. From there, climb the stairs beside the arena gate and walk round the stands, close to the inner railing (the Arena Spectators come at you when you pass too near), to the Shrine of Thaurissan: {npc:9024} kneels before the {object:164689}."] = "La grille ouverte du côté est de la prison mène dans l'arène (Ring of the Law) : la grille se ferme derrière le groupe, deux vagues de bêtes arrivent, puis un boss au hasard. Une fois celui-ci tombé, une deuxième grille s'ouvre sur la garnison est (East Garrison). De là, monter l'escalier à côté de la grille de l'arène et faire le tour des gradins, au ras de la rambarde intérieure (les spectateurs, Arena Spectators, attaquent quand on passe trop près), jusqu'au sanctuaire de Thaurissan (Shrine of Thaurissan) : {npc:9024} est agenouillé devant {object:164689}.",

	-- Step 31: The Domicile and the Black Vault
	["The Domicile and the Black Vault"] = "Les logis et la chambre forte",
	-- {npc:9041} Warder Stilgiss · {object:160836} Relic Coffer · {npc:9476} Watchman Doomgrip · {object:161495} Secret Safe · {object:160845} Dark Coffer · {object:165554} Heart of the Mountain
	-- plural, as words: Relic Coffer Keys = {item:11078} Relic Coffer Key · Warbringer Constructs = {npc:8905} Warbringer Construct
	["From the Shrine, the bridge leads into the Domicile, then to the upper balcony of the Hall of Crafting, which opens on the Black Vault: {npc:9041} and Verek (elite 56 and 55). With 12 Relic Coffer Keys, open the 12 {object:160836} doors; after the last one, the Warbringer Constructs wake, then {npc:9476} comes. The {object:161495} under the {object:160845} then holds the {object:165554}. Fewer than 12 keys? Leave it: the guide does not come back to the vault."] = "Depuis le sanctuaire, le pont mène aux logis (The Domicile), puis au balcon du haut de la salle des artisans (Hall of Crafting), qui donne sur la chambre forte (Black Vault) : {npc:9041} et Verek (élites 56 et 55). Avec 12 clés de coffre à reliques, ouvrir les 12 portes de {object:160836} ; après la dernière, les Warbringer Constructs se réveillent, puis {npc:9476} arrive. {object:161495}, sous {object:160845}, contient alors {object:165554}. Moins de 12 clés ? Laisser tomber : le guide ne revient pas à la chambre forte.",
	-- {quest:4123} The Heart of the Mountain · {object:161495} Secret Safe
	["{quest:4123}: the {object:161495}"] = "{quest:4123} : {object:161495}",

	-- Step 32: Hall of Crafting: Fineous Darkvire
	-- {npc:9056} Fineous Darkvire
	["Hall of Crafting: {npc:9056}"] = "Salle des artisans : {npc:9056}",
	-- {npc:9056} Fineous Darkvire · {item:10999} Ironfel · {quest:3802} Dark Iron Legacy
	["{npc:9056} (elite 54) walks up and down the winding ramp of the Hall of Crafting: clear the ramp first, interrupt his Holy Light. He drops {item:10999} for every player on {quest:3802}."] = "{npc:9056} (élite 54) monte et descend la rampe en spirale de la salle des artisans (Hall of Crafting) : nettoyer la rampe d'abord, interrompre sa Lumière sacrée. Il donne {item:10999} à chaque joueur qui a {quest:3802}.",

	-- Step 33: Shrine of Thaurissan: the monument
	["Shrine of Thaurissan: the monument"] = "Sanctuaire de Thaurissan : le monument",
	-- {item:10999} Ironfel · {object:164689} Monument of Franclorn Forgewright · {item:11000} Shadowforge Key
	["Back up through the Domicile to the Shrine: place {item:10999} on the {object:164689}. The {item:11000} is the reward. Then walk out the way you came: round the stands, through the Ring of the Law (its gates stay open) and the Detention Block."] = "Remonter par les logis jusqu'au sanctuaire : poser {item:10999} sur {object:164689}. La {item:11000} est la récompense. Puis ressortir par où le groupe est venu : le tour des gradins, l'arène (ses grilles restent ouvertes) et la prison.",

	-- Step 34: Flame Crest: Maxwort Uberglint
	-- {npc:9536} Maxwort Uberglint
	["Flame Crest: {npc:9536}"] = "Corniche des flammes : {npc:9536}",
	-- {zone:1428} Burning Steppes
	["Out of Blackrock Mountain on the {zone:1428} side, then north-east to Flame Crest."] = "Sortir du Mont Rochenoire du côté de {zone:1428}, puis aller au nord-est jusqu'à la Corniche des flammes.",

	-- Step 35: Morgan's Vigil: Marshal Maxwell
	-- {quest:4242} Abandoned Hope · {quest:4264} A Crumpled Up Note
	["Ride back to Morgan's Vigil. {quest:4242}: Maxwell takes the bad news; pick your reward. From now on, the Anvilrage dwarves of the Detention Block drop {quest:4264} for you (second visit)."] = "Revenir à la Veille de Morgan. {quest:4242} : Maxwell reçoit la mauvaise nouvelle ; choisir sa récompense. Désormais, les nains Anvilrage de la prison peuvent donner {quest:4264} (deuxième visite).",

	-- Step 36: Morgan's Vigil: Jalinda Sprig
	-- {npc:9561} Jalinda Sprig
	["Morgan's Vigil: {npc:9561}"] = "Veille de Morgan : {npc:9561}",
	-- {npc:9017} Lord Incendius
	["{npc:9017}, in the dungeon: second visit"] = "{npc:9017}, dans le donjon : deuxième visite",

	-- Step 37: Morgan's Vigil: Oralius
	-- {npc:9177} Oralius
	["Morgan's Vigil: {npc:9177}"] = "Veille de Morgan : {npc:9177}",

	-- Step 38: Fly to Ironforge
	-- {zone:1455} Ironforge
	["Fly to {zone:1455}"] = "Envolez-vous vers {zone:1455}",

	-- Step 39: Ironforge: King Magni Bronzebeard
	-- {quest:4361} The Bearer of Bad News
	["{quest:4361}: Magni then asks you to save Princess Moira, the Emperor's prisoner at the bottom of the dungeon (third visit)."] = "{quest:4361} : Magni demande ensuite de sauver la princesse Moira, prisonnière de l'empereur au fond du donjon (troisième visite).",

	-- Step 40: Fly to Thorium Point
	["Fly to Thorium Point"] = "Voler jusqu'à la Halte du Thorium",

	-- Step 41: Blackrock Depths, second visit: before going in
	["Blackrock Depths, second visit: before going in"] = "Profondeurs de Rochenoire, deuxième visite : avant d'entrer",
	-- {item:11000} Shadowforge Key · {npc:9016} Bael'Gar · {quest:4322} Jail Break! · {zone:1427} Searing Gorge
	["Second visit, with the {item:11000}: Windsor's note, the Dark Iron Highway ({npc:9016}), Shadowforge City (Incendius), the West Garrison (Angerforge), the Manufactory (Argelmach), then {quest:4322} from Windsor's cell. Bosses 52 to 57: 56 or more advised. From Thorium Point, ride south across the {zone:1427} into Blackrock Mountain."] = "Deuxième visite, avec la {item:11000} : le billet pour Windsor, la grand-route (Dark Iron Highway, {npc:9016}), la ville d'Ombreforge (Shadowforge City, Incendius), la garnison ouest (West Garrison, Angerforge), la manufacture (Manufactory, Argelmach), puis {quest:4322} depuis la cellule de Windsor. Boss 52 à 57 : niveau 56 ou plus conseillé. Depuis la Halte du Thorium, traverser {zone:1427} vers le sud jusqu'au Mont Rochenoire.",
	-- {quest:4022} A Taste of Flame · {npc:9459} Cyrus Therepentous · {quest:4263} Incendius! · {npc:9561} Jalinda Sprig · {quest:4322} Jail Break! · {quest:4362} The Fate of the Kingdom · {quest:4136} Ribbly Screwspigot · {quest:4126} Hurley Blackbreath
	["In the quest log: {quest:4022} ({npc:9459}), {quest:4263} ({npc:9561}). Keep one free quest log slot for {quest:4322}. For the third visit: {quest:4362} (Magni), {quest:4136}, {quest:4126}."] = "Dans le journal de quêtes : {quest:4022} ({npc:9459}), {quest:4263} ({npc:9561}). Garder une place libre dans le journal pour {quest:4322}. Pour la troisième visite : {quest:4362} (Magni), {quest:4136}, {quest:4126}.",

	-- Step 42: Detention Block: A Crumpled Up Note
	-- {quest:4264} A Crumpled Up Note
	["Detention Block: {quest:4264}"] = "Prison : {quest:4264}",
	-- {quest:4264} A Crumpled Up Note · {quest:4242} Abandoned Hope · {item:11140} Prison Cell Key
	["The Anvilrage dwarves of the Detention Block drop {quest:4264} (about one in four) to those who handed in {quest:4242}: right-click it. Kill Gerstahn again for the {item:11140} and bring the note to Windsor."] = "Les nains Anvilrage de la prison donnent {quest:4264} (environ une fois sur quatre) à qui a rendu {quest:4242} : clic droit dessus. Tuer de nouveau Gerstahn pour la {item:11140} et apporter le billet à Windsor.",
	-- {quest:4264} A Crumpled Up Note
	["{quest:4264}: Anvilrage dwarves"] = "{quest:4264} : nains Anvilrage",

	-- Step 43: Dark Iron Highway: Bael'Gar
	-- {npc:9016} Bael'Gar
	["Dark Iron Highway: {npc:9016}"] = "Grand-route : {npc:9016}",
	-- {object:170559} Shadowforge Gate · {npc:9016} Bael'Gar · {item:11231} Altered Black Dragonflight Molt
	["The {object:170559} on the north side of the Detention Block opens with the key onto the Dark Iron Highway: large packs of dwarves. {npc:9016} (elite 54) stands at its west end; once he is down, use the {item:11231} on his remains."] = "{object:170559}, du côté nord de la prison, s'ouvre avec la clé sur la grand-route (Dark Iron Highway) : gros groupes de nains. {npc:9016} (élite 54) se tient à son extrémité ouest ; une fois tombé, utiliser le {item:11231} sur ses restes.",
	-- {item:11230} Encased Fiery Essence · {npc:9016} Bael'Gar
	["{item:11230}: the molt on {npc:9016}'s remains"] = "{item:11230} : le cuir altéré sur les restes de {npc:9016}",

	-- Step 44: Shadowforge City: Lord Incendius
	-- {npc:9017} Lord Incendius
	["Shadowforge City: {npc:9017}"] = "Ville d'Ombreforge : {npc:9017}",
	-- {npc:9017} Lord Incendius · {object:174825} Black Anvil
	["The great doors at the east end of the Highway open on Shadowforge City, above a lava lake. {npc:9017} (elite 55) guards the {object:174825} on the central bridge: tank him in the middle, his Mighty Blow knocks you into the lava, with no way back up."] = "Les grandes portes à l'extrémité est de la grand-route donnent sur la ville d'Ombreforge (Shadowforge City), au-dessus d'un lac de lave. {npc:9017} (élite 55) garde {object:174825} sur le pont central : le tanker au milieu, son Coup puissant projette dans la lave, sans moyen de remonter.",

	-- Step 45: West Garrison and the Manufactory
	["West Garrison and the Manufactory"] = "Garnison ouest et manufacture",
	-- {object:170570} East Garrison Door · {object:161460} Shadowforge Lock · {npc:9033} General Angerforge · {npc:8983} Golem Lord Argelmach · {item:11464} Marshal Windsor's Lost Information
	["Back along the Highway to the Detention Block, then through the {object:170570} (the key) into the East Garrison. Go down the stairs to the {object:161460}, the great wheel, and open it with the key: the giant door over the Highway turns, and its passage leads across to the West Garrison. Down the left-hand stairs: {npc:9033} (elite 57, calls adds at low health). Down the right-hand stairs, across the Manufactory: {npc:8983} and his two golems (kill the golems first). Each drops part of {item:11464}."] = "Revenir par la grand-route jusqu'à la prison, puis passer {object:170570} (la clé) jusqu'à la garnison est (East Garrison). Descendre l'escalier jusqu'à {object:161460}, la grande roue, et l'ouvrir avec la clé : la porte géante au-dessus de la grand-route tourne, et son passage mène de l'autre côté, à la garnison ouest (West Garrison). Par l'escalier de gauche : {npc:9033} (élite 57, appelle des renforts quand sa vie baisse). Par l'escalier de droite, à travers la manufacture (Manufactory) : {npc:8983} et ses deux golems (tuer les golems d'abord). Chacun donne une partie de {item:11464}.",

	-- Step 46: Detention Block: Jail Break!
	-- {quest:4322} Jail Break!
	["Detention Block: {quest:4322}"] = "Prison : {quest:4322}",
	-- {quest:4282} A Shred of Hope · {quest:4322} Jail Break!
	["Back to Windsor's cell. Everyone hands in {quest:4282} before anyone starts {quest:4322}, with a free quest log slot. Windsor gets his gear back in the supply room clockwise from his cell, then frees his friends from the cells of the corridor round the Ring of the Law: open each cell when he asks, not before. Stay near him; he must not die. At the end he runs to the entrance and the quest is done. Failed? Abandon it, leave and reset the dungeon, then try again."] = "Retour à la cellule de Windsor. Tout le monde rend {quest:4282} avant que quiconque lance {quest:4322}, avec une place libre dans le journal. Windsor récupère son équipement dans la réserve, dans le sens des aiguilles d'une montre depuis sa cellule, puis libère ses amis des cellules du couloir qui fait le tour de l'arène : ouvrir chaque cellule quand il le demande, pas avant. Rester près de lui ; il ne doit pas mourir. À la fin, il court jusqu'à l'entrée et la quête est faite. Échec ? L'abandonner, sortir, réinitialiser le donjon et recommencer.",
	-- {npc:9023} Marshal Windsor
	["Escort {npc:9023}"] = "Escorter {npc:9023}",

	-- Step 47: Blackrock Depths, third visit: the Grim Guzzler
	["Blackrock Depths, third visit: the Grim Guzzler"] = "Profondeurs de Rochenoire, troisième visite : la taverne",
	-- {object:170570} East Garrison Door · {object:161460} Shadowforge Lock · {quest:4136} Ribbly Screwspigot · {quest:4126} Hurley Blackbreath · {object:170571} Bar Door · {npc:9499} Plugger Spazzring · {npc:9503} Private Rocknot
	-- plural, as words: Thunderbrew Lager Kegs = {object:164911} Thunderbrew Lager Keg · Dark Iron Ale Mugs = {item:11325} Dark Iron Ale Mug
	["Third visit: the bottom of the dungeon, bosses 55 to 59, 58 or more advised. With the time, go on in the same run; or come back later: through the {object:170570}, the {object:161460} and the West Garrison again. Past Argelmach, the bridge leads to the Grim Guzzler: its patrons are neutral, so no area spells. {quest:4136} is friendly until threatened (his talk option): he fights with his cronies. Smash the three Thunderbrew Lager Kegs of the storage room near him: {quest:4126} comes with his cronies. To open the {object:170571}, buy Dark Iron Ale Mugs from {npc:9499} and give them to {npc:9503} until he loses his temper: Phalanx then breaks the door and attacks."] = "Troisième visite : le fond du donjon, boss 55 à 59, niveau 58 ou plus conseillé. Avec le temps, continuer dans la même instance ; sinon revenir plus tard, en repassant par {object:170570}, {object:161460} et la garnison ouest. Après Argelmach, le pont mène à la taverne (Grim Guzzler) : ses clients sont neutres, donc pas de sorts de zone. {quest:4136} reste amical jusqu'à ce qu'on le menace (son option de dialogue) : il se bat alors avec ses acolytes. Briser les trois tonneaux de bière Tonnebière (Thunderbrew Lager Kegs) de la réserve près de lui : {quest:4126} arrive avec ses acolytes. Pour ouvrir {object:170571}, acheter des chopes de bière Sombrefer (Dark Iron Ale Mugs) à {npc:9499} et les donner à {npc:9503} jusqu'à ce qu'il s'énerve : Phalanx enfonce alors la porte et attaque.",

	-- Step 48: Ambassador Flamelash and the Seven
	-- {npc:9156} Ambassador Flamelash
	["{npc:9156} and the Seven"] = "{npc:9156} et les Sept",
	-- {object:170571} Bar Door · {npc:9156} Ambassador Flamelash · {npc:9039} Doom'rel
	["Through the {object:170571}, left into the Chamber of Enchantment: {npc:9156} (elite 57) calls adds from the corners, kill them before they reach him. Then the Mold Foundry and the Summoners' Tomb: speak with {npc:9039} to start the Seven, who come one after the other; the door opens after the last. To the right on the way out: the Molten Bridge and the Molten Core's portal (raid)."] = "Passé {object:170571}, à gauche dans la salle des enchantements (Chamber of Enchantment) : {npc:9156} (élite 57) appelle des renforts depuis les coins, les tuer avant qu'ils l'atteignent. Puis la fonderie (Mold Foundry) et le tombeau des invocateurs (Summoners' Tomb) : parler à {npc:9039} pour lancer les Sept, qui arrivent l'un après l'autre ; la porte s'ouvre après le dernier. À droite en sortant : le pont de lave (Molten Bridge) et le portail du Cœur du Magma (raid).",

	-- Step 49: The Lyceum and Magmus
	-- {object:170558} The Lyceum · {npc:9938} Magmus
	["{object:170558} and {npc:9938}"] = "{object:170558} et {npc:9938}",
	-- {npc:9938} Magmus
	-- plural, as words: Shadowforge Flame Keepers = {npc:9956} Shadowforge Flame Keeper
	["In the Lyceum, the Shadowforge Flame Keepers (red armour) drop two Shadowforge Torches: light the two braziers at the back, the doors open on the Iron Hall. {npc:9938} (elite 57) waits at the far end: keep out of the fire jets of the side alcoves."] = "Dans le lycée (Lyceum), les Shadowforge Flame Keepers (armure rouge) donnent deux torches d'Ombreforge : allumer les deux braseros du fond, les portes s'ouvrent sur la salle de fer (Iron Hall). {npc:9938} (élite 57) attend au bout : rester hors des jets de feu des alcôves latérales.",

	-- Step 50: The Imperial Seat: Emperor Dagran Thaurissan
	-- {npc:9019} Emperor Dagran Thaurissan
	["The Imperial Seat: {npc:9019}"] = "Le siège impérial : {npc:9019}",
	-- {npc:9019} Emperor Dagran Thaurissan · {npc:8929} Princess Moira Bronzebeard · {quest:4362} The Fate of the Kingdom
	["{npc:9019} (elite 59) and {npc:8929}. {quest:4362}: kill the Emperor WITHOUT killing Moira, who heals him: one player keeps her busy and interrupts her, everyone else on the Emperor. She then stops fighting: speak with her."] = "{npc:9019} (élite 59) et {npc:8929}. {quest:4362} : tuer l'empereur SANS tuer Moira, qui le soigne : un joueur l'occupe et l'interrompt, tous les autres sur l'empereur. Elle cesse alors de combattre : lui parler.",

	-- Step 51: Flame Crest: Yuka Screwspigot
	-- {npc:9544} Yuka Screwspigot
	["Flame Crest: {npc:9544}"] = "Corniche des flammes : {npc:9544}",
	-- {zone:1428} Burning Steppes
	["Out of the dungeon (the way back or your hearthstone), then out of Blackrock Mountain on the {zone:1428} side, north-east to Flame Crest."] = "Sortir du donjon (à pied ou avec la pierre de foyer), puis du Mont Rochenoire du côté de {zone:1428}, et aller au nord-est jusqu'à la Corniche des flammes.",

	-- Step 52: Cyrus Therepentous
	-- {npc:9459} Cyrus Therepentous
	["East along the hills to {npc:9459}'s cave."] = "Vers l'est par les collines jusqu'à la grotte de {npc:9459}.",

	-- Step 53: Morgan's Vigil: Marshal Maxwell
	["Ride back south to Morgan's Vigil. Maxwell's next quest, Stormwind Rendezvous, starts the long chain to Onyxia's Lair, through Upper Blackrock Spire: not in this guide."] = "Revenir au sud jusqu'à la Veille de Morgan. La quête suivante de Maxwell, Stormwind Rendezvous, ouvre la longue chaîne du repaire d'Onyxia, par le pic Rochenoire supérieur : pas dans ce guide.",

	-- Step 59: Blackrock Depths: quests not done
	["Blackrock Depths: quests not done"] = "Profondeurs de Rochenoire : quêtes non finies",
	["What is left of Blackrock Depths in the quest log is for another run: keep it for one, or drop it to free the log."] = "Ce qui reste des Profondeurs de Rochenoire dans le journal de quêtes est pour une autre fois : le garder pour une autre visite, ou l'abandonner pour libérer le journal.",

	-- Step 60: Lower Blackrock Spire (dungeon, optional)
	["Lower Blackrock Spire (dungeon, optional)"] = "Pic Rochenoire inférieur (donjon, facultatif)",
	["Lower Blackrock Spire: the orc city in the upper part of Blackrock Mountain, above Blackrock Depths. Levels 55 to 60, bosses 58 to 60: a group of 5 at 58 to 60 (possible from about 56, difficult). The quests come from Morgan's Vigil and Flame Crest, one more from a goblin hidden inside; the run has one short trip out to Morgan's Vigil and back. Alone? Skip it."] = "Pic Rochenoire inférieur : la cité des orcs dans le haut du Mont Rochenoire, au-dessus des Profondeurs de Rochenoire. Niveaux 55 à 60, boss 58 à 60 : un groupe de 5 aux niveaux 58 à 60 (possible vers 56, difficile). Les quêtes se prennent à la Veille de Morgan et à la Corniche des flammes, une de plus auprès d'une gobeline cachée dedans ; le passage compte un court aller-retour jusqu'à la Veille de Morgan. Seul ? Le passer.",
	["Keep 9 free quest log slots."] = "Garder 9 places libres dans le journal de quêtes.",

	-- Step 61: Morgan's Vigil: Helendis Riverhorn
	-- {quest:4701} Put Her Down · {npc:10220} Halycon · {npc:9560} Marshal Maxwell · {npc:10257} Bijou
	["{quest:4701}: {npc:10220}, the great worg of the Spire. {npc:9560}'s own quest comes later, through {npc:10257}, a goblin hidden in the dungeon."] = "{quest:4701} : {npc:10220}, la grande worg du Pic. La quête de {npc:9560} vient plus tard, par {npc:10257}, une gobeline cachée dans le donjon.",

	-- Step 62: Flame Crest: Kibler and Ragged John
	-- {npc:10260} Kibler · {npc:9563} Ragged John
	["Flame Crest: {npc:10260} and {npc:9563}"] = "Corniche des flammes : {npc:10260} et {npc:9563}",
	-- {npc:10260} Kibler · {item:12264} Worg Carrier · {item:12529} Smolderweb Carrier · {item:12262} Empty Worg Pup Cage · {npc:9563} Ragged John · {quest:4866} Mother's Milk
	["Ride north to Flame Crest. {npc:10260} stands inside the cave: his two quests give two pets, the {item:12264} and the {item:12529}, and he hands over an {item:12262}. {npc:9563}, in the camp: {quest:4866}, a rare reward."] = "Monter au nord jusqu'à la Corniche des flammes. {npc:10260} se tient dans la grotte : ses deux quêtes donnent deux mascottes, le {item:12264} et le {item:12529}, et il remet une {item:12262}. {npc:9563}, dans le camp : {quest:4866}, une récompense rare.",

	-- Step 63: Lower Blackrock Spire: before going in
	["Lower Blackrock Spire: before going in"] = "Pic Rochenoire inférieur : avant d'entrer",
	-- {zone:1428} Burning Steppes
	["Into Blackrock Mountain on the {zone:1428} side. Two ways to the portal: the door beside the Blackrock Spire meeting stone and the path up (elites on it), or along the great chain and the wall to the balcony where Bodley stands, then a jump down onto it, with no fight. Inside, the stairs up on the left lead to Upper Blackrock Spire: not this time."] = "Entrer dans le Mont Rochenoire du côté de {zone:1428}. Deux chemins jusqu'au portail : la porte à côté de la pierre de rencontre du pic Rochenoire et le chemin qui monte (des élites dessus), ou le long de la grande chaîne et du mur jusqu'au balcon où se tient Bodley, puis un saut dessus, sans combat. Dedans, l'escalier qui monte à gauche mène au pic Rochenoire supérieur : pas cette fois.",
	-- {quest:4701} Put Her Down · {npc:9562} Helendis Riverhorn · {quest:4729} Kibler's Exotic Pets · {quest:4862} En-Ay-Es-Tee-Why · {npc:10260} Kibler · {quest:4866} Mother's Milk · {npc:9563} Ragged John · {quest:4867} Urok Doomhowl · {npc:10799} Warosh · {quest:5001} Bijou's Belongings · {npc:10257} Bijou · {item:12344} Seal of Ascension · {zone:1452} Winterspring · {zone:1455} Ironforge
	["In the quest log: {quest:4701} ({npc:9562}), {quest:4729} and {quest:4862} ({npc:10260}), {quest:4866} ({npc:9563}). Given inside: {quest:4867} ({npc:10799}) and {quest:5001} ({npc:10257}). Not on this route: {item:12344} (Vaelan, inside: the key of Upper Blackrock Spire, a 10-player dungeon), The Final Tablets (the Mosh'aru tablets), Snakestone of the Shadow Huntress (Kilram, {zone:1452}), Deliana's dungeon set quests ({zone:1455})."] = "Dans le journal de quêtes : {quest:4701} ({npc:9562}), {quest:4729} et {quest:4862} ({npc:10260}), {quest:4866} ({npc:9563}). Données dedans : {quest:4867} ({npc:10799}) et {quest:5001} ({npc:10257}). Pas sur ce parcours : {item:12344} (Vaelan, dedans : la clé du pic Rochenoire supérieur, un donjon à 10 joueurs), The Final Tablets (les tablettes de Mosh'aru), Snakestone of the Shadow Huntress (Kilram, {zone:1452}), les quêtes d'ensembles de donjon de Deliana ({zone:1455}).",
	["Blackrock Spire"] = "Pic Rochenoire",

	-- Step 64: Hordemar City: Warosh and Bijou
	-- {npc:10799} Warosh · {npc:10257} Bijou
	["Hordemar City: {npc:10799} and {npc:10257}"] = "Cité de Hordemar : {npc:10799} et {npc:10257}",
	-- {npc:10799} Warosh · {npc:10257} Bijou · {npc:9196} Highlord Omokk · {npc:9237} War Master Voone · {npc:9568} Overlord Wyrmthalak · {npc:9560} Marshal Maxwell
	["Past the entrance door, Hordemar City. {npc:10799} walks around its first part. {npc:10257} waits on a ledge overlooking the city: one of the ramps down to Tazz'Alaor, the trolls' hall with the purple light, climbs to her. Her belongings are in a small chest tucked in a corner at the bottom of Hordemar City (it has several places). Leave {npc:9196}, {npc:9237} and {npc:9568} alive for now: {npc:9560}'s quest, given for {npc:10257}'s message, asks for them."] = "Passé la porte d'entrée, la cité de Hordemar (Hordemar City). {npc:10799} se promène dans sa première partie. {npc:10257} attend sur une corniche qui domine la cité : l'une des rampes qui descendent vers Tazz'Alaor, la salle des trolls à la lumière violette, monte jusqu'à elle. Ses affaires sont dans un petit coffre, dans un coin au fond de la cité de Hordemar (il a plusieurs emplacements). Laisser {npc:9196}, {npc:9237} et {npc:9568} en vie pour l'instant : la quête de {npc:9560}, donnée pour le message de {npc:10257}, les demande.",
	-- {quest:5001} Bijou's Belongings
	["{quest:5001}: a small chest at the bottom of Hordemar City"] = "{quest:5001} : un petit coffre au fond de la cité de Hordemar",

	-- Step 65: Message to Maxwell: out and back
	-- {quest:5002} Message to Maxwell
	["{quest:5002}: out and back"] = "{quest:5002} : aller-retour",
	["Leave the dungeon without resetting it: as long as the group stays together, the same instance waits, bosses alive (to check in game). Ride to Morgan's Vigil and back, a good quarter of an hour; a hearthstone bound at the Vigil shortens the way there."] = "Sortir du donjon sans le réinitialiser : tant que le groupe reste ensemble, la même instance attend, boss en vie (à vérifier en jeu). Aller jusqu'à la Veille de Morgan et revenir, un bon quart d'heure ; une pierre de foyer liée à la Veille raccourcit l'aller.",

	-- Step 66: Lower Blackrock Spire: along the way
	["Lower Blackrock Spire: along the way"] = "Pic Rochenoire inférieur : en chemin",
	-- {npc:10220} Halycon · {item:12262} Empty Worg Pup Cage · {npc:10596} Mother Smolderweb
	-- plural, as words: Bloodaxe Worg Pups = {npc:10221} Bloodaxe Worg Pup · Spire Spider Eggs = {item:12530} Spire Spider Egg
	["The Bloodaxe Worg Pups play in Hordemar City and in {npc:10220}'s lair: target one and use the {item:12262}. The Spire Spider Eggs lie in the Skitterweb Tunnels, {npc:10596}'s halls: each egg sac gives 1 to 3, and spiderlings may hatch from them."] = "Les louveteaux worgs Bloodaxe (Bloodaxe Worg Pups) jouent dans la cité de Hordemar et dans l'antre de {npc:10220} : en cibler un et utiliser la {item:12262}. Les œufs d'araignée du Pic (Spire Spider Eggs) sont dans les tunnels des araignées (Skitterweb Tunnels), le domaine de {npc:10596} : chaque cocon en donne 1 à 3, et des araignées peuvent en éclore.",

	-- Step 67: Highlord Omokk
	-- {quest:4867} Urok Doomhowl · {item:12533} Roughshod Pike · {npc:9196} Highlord Omokk
	["{quest:4867} needs a {item:12533}: they lean against the wall behind the Scarshield orcs, past the bridge out of Hordemar City. Then the Spirestone ogres: {npc:9196} (elite 59) and his two guards. His head is for the Urok event: one player with the quest carries the pike and the head."] = "{quest:4867} demande une {item:12533} : elles sont appuyées contre le mur derrière les orcs Scarshield, après le pont qui sort de la cité de Hordemar. Puis les ogres Spirestone : {npc:9196} (élite 59) et ses deux gardes. Sa tête sert pour l'événement d'Urok : un joueur qui a la quête porte la pique et la tête.",

	-- Step 68: Tazz'Alaor: War Master Voone
	-- {npc:9237} War Master Voone
	["Tazz'Alaor: {npc:9237}"] = "Tazz'Alaor : {npc:9237}",
	-- {npc:9236} Shadow Hunter Vosh'gajin · {npc:9237} War Master Voone
	["Down into Tazz'Alaor, the trolls' hall: {npc:9236} (elite 59, two priests at her side), then down the great ramp and along the hall to {npc:9237} (elite 59, no adds, hits very hard)."] = "Descendre dans Tazz'Alaor, la salle des trolls : {npc:9236} (élite 59, deux prêtres à ses côtés), puis la grande rampe et la salle jusqu'à {npc:9237} (élite 59, sans renforts, frappe très fort).",

	-- Step 69: Skitterweb Tunnels: Mother Smolderweb
	-- {npc:10596} Mother Smolderweb
	["Skitterweb Tunnels: {npc:10596}"] = "Tunnels des araignées : {npc:10596}",
	-- {npc:10260} Kibler · {npc:10596} Mother Smolderweb · {quest:4866} Mother's Milk · {npc:9563} Ragged John
	["The spiders' tunnels: the eggs for {npc:10260}. {npc:10596} (elite 59) waits at the top. Whoever has {quest:4866} lets her poison them, and nobody removes that poison; then kill her. The poison must still be there at {npc:9563}'s: if it would wear off before the end of the run (to check in game), that player goes out right after her and comes back."] = "Les tunnels des araignées : les œufs pour {npc:10260}. {npc:10596} (élite 59) attend au sommet. Celui qui a {quest:4866} se laisse empoisonner par elle, et personne ne retire ce poison ; puis la tuer. Le poison doit être encore là chez {npc:9563} : s'il risque de s'arrêter avant la fin du donjon (à vérifier en jeu), ce joueur sort juste après elle et revient.",

	-- Step 70: Urok's Tribute Pile
	-- {object:175621} Urok's Tribute Pile · {item:12533} Roughshod Pike · {item:12534} Omokk's Head · {quest:4867} Urok Doomhowl
	["Up the ramp past the tunnels, on the corner of the landing, behind two Spirestone orcs: {object:175621}, a heap of skulls. The player with the {item:12533} and {item:12534} stands by it and uses the head: waves of ogres come, then {quest:4867} (elite 60). Every 30 seconds, the pike used on the pile kills one ogre outright."] = "En haut de la rampe après les tunnels, au coin du palier, derrière deux orcs Spirestone : {object:175621}, un tas de crânes. Le joueur qui a la {item:12533} et {item:12534} se place à côté et utilise la tête : des vagues d'ogres arrivent, puis {quest:4867} (élite 60). Toutes les 30 secondes, la pique utilisée sur le tas tue un ogre d'un coup.",

	-- Step 71: Halycon and Gizrul
	-- {npc:10220} Halycon
	["{npc:10220} and Gizrul"] = "{npc:10220} et Gizrul",
	-- {npc:9736} Quartermaster Zigris · {npc:10220} Halycon · {npc:10268} Gizrul the Slavener
	["Past {npc:9736}, {npc:10220}'s lair: the great worg (elite 59) and her pups. {npc:10268} runs in right after her death: no time to rest in between."] = "Après {npc:9736}, l'antre de {npc:10220} : la grande worg (élite 59) et ses petits. {npc:10268} arrive aussitôt après sa mort : pas de repos entre les deux.",

	-- Step 72: Overlord Wyrmthalak
	-- {npc:9568} Overlord Wyrmthalak · {quest:5089} General Drakkisath's Command
	["The last boss, {npc:9568} (elite 60), calls two adds at half health. He drops {quest:5089} for each player: right-click it."] = "Le dernier boss, {npc:9568} (élite 60), appelle deux renforts à la moitié de sa vie. Il donne {quest:5089} à chaque joueur : clic droit dessus.",

	-- Step 73: Hordemar City: Warosh
	-- {npc:10799} Warosh
	["Hordemar City: {npc:10799}"] = "Cité de Hordemar : {npc:10799}",
	-- {npc:10799} Warosh
	["Back to the entrance: {npc:10799} walks around the first part of Hordemar City."] = "Retour à l'entrée : {npc:10799} se promène dans la première partie de la cité de Hordemar.",

	-- Step 74: Flame Crest: Ragged John
	-- {npc:9563} Ragged John
	["Flame Crest: {npc:9563}"] = "Corniche des flammes : {npc:9563}",
	-- {npc:9563} Ragged John · {quest:4866} Mother's Milk
	["Out of the Spire, north-east to Flame Crest. {npc:9563}: his talk option, while the poison is still on you. Poison gone? {quest:4866} cannot be done this time: skip this step."] = "Sortir du Pic, puis aller au nord-est jusqu'à la Corniche des flammes. {npc:9563} : son option de dialogue, tant que le poison est encore là. Le poison est parti ? {quest:4866} ne peut pas se faire cette fois : passer cette étape.",
	-- {npc:9563} Ragged John
	["{npc:9563}: let him milk you"] = "{npc:9563} : se laisser traire",

	-- Step 75: Flame Crest: Kibler's worg pup
	-- {npc:10260} Kibler
	["Flame Crest: {npc:10260}'s worg pup"] = "Corniche des flammes : le louveteau de {npc:10260}",

	-- Step 76: Flame Crest: Kibler's spider eggs
	-- {npc:10260} Kibler
	["Flame Crest: {npc:10260}'s spider eggs"] = "Corniche des flammes : les œufs de {npc:10260}",

	-- Step 79: Morgan's Vigil: General Drakkisath's Command
	-- {quest:5089} General Drakkisath's Command
	["Morgan's Vigil: {quest:5089}"] = "Veille de Morgan : {quest:5089}",
	-- {npc:10363} General Drakkisath · {item:12344} Seal of Ascension
	["Maxwell's next quest, {npc:10363}'s Demise, is for Upper Blackrock Spire (10 players, the {item:12344} to open it): not in this guide."] = "La quête suivante de Maxwell, qui envoie tuer {npc:10363}, est pour le pic Rochenoire supérieur (10 joueurs, {item:12344} pour l'ouvrir) : pas dans ce guide.",

	-- Step 80: Lower Blackrock Spire: quests not done
	["Lower Blackrock Spire: quests not done"] = "Pic Rochenoire inférieur : quêtes non finies",
	-- {item:12344} Seal of Ascension · {npc:9196} Highlord Omokk · {npc:9237} War Master Voone · {npc:9568} Overlord Wyrmthalak · {zone:1445} Dustwallow Marsh · {item:12300} Orb of Draconic Energy
	["What is left of Lower Blackrock Spire in the quest log is for another run: keep it for one, or drop it to free the log.\nUpper Blackrock Spire, up the stairs on the left past the Spire's entrance, is not in this guide: a dungeon made for a raid group of ten, behind a door that opens only with the {item:12344}. The seal takes Vaelan's two quests, given inside Lower Blackrock Spire: the gemstones of {npc:9196}, {npc:9237} and {npc:9568} with an Unadorned Seal from the Spire's orcs, then Emberstrife, a drake of the Wyrmbog in {zone:1445}, beaten down and bound with the {item:12300}."] = "Ce qui reste du pic Rochenoire inférieur dans le journal de quêtes est pour une autre fois : le garder pour une autre visite, ou l'abandonner pour libérer le journal.\nLe pic Rochenoire supérieur, en haut de l'escalier à gauche après l'entrée du pic, n'est pas dans ce guide : un donjon fait pour un groupe de raid de dix, derrière une porte qui ne s'ouvre qu'avec le {item:12344}. Le sceau demande les deux quêtes de Vaelan, données dans le pic Rochenoire inférieur : les gemmes de {npc:9196}, {npc:9237} et {npc:9568} avec un sceau sans ornement (Unadorned Seal of Ascension) pris sur les orcs du pic, puis Emberstrife, un drake du Wyrmbog (Wyrmbog), dans le {zone:1445}, battu puis soumis avec l'{item:12300}.",

	-- Step 81: Dire Maul (dungeon, optional)
	["Dire Maul (dungeon, optional)"] = "Hache-Tripes (donjon, facultatif)",
	-- {zone:1444} Feralas · {object:152576} Feathermoon Stronghold
	["Dire Maul: the ruined elf city in the middle of {zone:1444}, three wings. The guide does the eastern one (Warpwood Quarter, 55 to 58), whose imp carries the key of the others, then the western one (Capital Gardens, 58 to 60). A group of 5 at 58 to 60; possible from about 56, difficult. The quests come from {object:152576} and the Lariss Pavilion. Alone? Skip it."] = "Hache-Tripes : la cité elfe en ruine au milieu de {zone:1444}, en trois ailes. Le guide fait l'aile est (Warpwood Quarter, 55 à 58), dont le diablotin porte la clé des autres, puis l'aile ouest (Capital Gardens, 58 à 60). Un groupe de 5 aux niveaux 58 à 60 ; possible vers 56, difficile. Les quêtes se prennent à {object:152576} et au pavillon de Lariss. Seul ? Le passer.",
	["Keep 8 free quest log slots. The northern wing (the ogres' tribute) is not in the guide."] = "Garder 8 places libres dans le journal de quêtes. L'aile nord (le tribut des ogres) n'est pas dans le guide.",

	-- Step 82: Feathermoon Stronghold
	-- {npc:7877} Latronicus Moonspear · {npc:14374} Scholar Runethorn
	["{npc:7877} stands in the fort; {npc:14374} walks the road through it."] = "{npc:7877} se tient dans le fort ; {npc:14374} parcourt la route qui le traverse.",

	-- Step 83: Lariss Pavilion: Azj'Tordin
	-- {npc:14355} Azj'Tordin
	["Lariss Pavilion: {npc:14355}"] = "Pavillon de Lariss : {npc:14355}",
	-- {object:176945} Camp Mojache · {npc:14355} Azj'Tordin
	["The Lariss Pavilion stands north-east of {object:176945} (Horde), east of Dire Maul: from Feathermoon, the flight to Thalanaar and the road west is the quickest way. {npc:14355}'s book is with Pusillin, the imp at the eastern wing's entrance."] = "Le pavillon de Lariss se trouve au nord-est de {object:176945} (Horde), à l'est de Hache-Tripes : depuis Feathermoon, le vol jusqu'à Thalanaar puis la route vers l'ouest est le plus rapide. Le livre de {npc:14355} est chez Pusillin, le diablotin de l'entrée de l'aile est.",

	-- Step 84: Dire Maul: before going in
	["Dire Maul: before going in"] = "Hache-Tripes : avant d'entrer",
	-- {zone:1444} Feralas
	["Dire Maul stands on the plateau in the middle of {zone:1444}. The eastern wing opens on the east wall of the central courtyard, and from Eldreth Row at the city's gates; both lead to the upper level of the Warpwood Quarter."] = "Hache-Tripes se dresse sur le plateau au milieu de {zone:1444}. L'aile est s'ouvre sur le mur est de la cour centrale, et depuis l'allée d'Eldreth (Eldreth Row), aux portes de la cité ; les deux mènent au niveau supérieur de l'aile est (Warpwood Quarter).",
	-- {quest:7488} Lethtendris's Web · {npc:7877} Latronicus Moonspear · {quest:7482} Elven Legends · {quest:7441} Pusillin and the Elder Azj'Tordin · {npc:14368} Lorekeeper Lydros
	["In the quest log: {quest:7488} ({npc:7877}), {quest:7482} (Runethorn), {quest:7441}. A class book found in the dungeon starts a quest of its own: it goes to {npc:14368}, in the Athenaeum (western wing). Not on this route: the northern wing's quests, Lydros's libram quests."] = "Dans le journal de quêtes : {quest:7488} ({npc:7877}), {quest:7482} (Runethorn), {quest:7441}. Un livre de classe trouvé dans le donjon lance une quête à part : il va à {npc:14368}, dans l'Athénée (Athenaeum, aile ouest). Pas sur ce parcours : les quêtes de l'aile nord, les quêtes de libram de Lydros.",
	["Dire Maul"] = "Hache-Tripes",

	-- Step 85: Warpwood Quarter: Pusillin
	["Warpwood Quarter: Pusillin"] = "Aile est : Pusillin",
	-- {npc:14355} Azj'Tordin · {item:18261} Book of Incantations · {item:18249} Crescent Key
	["Pusillin the imp waits by the entrance: speak with him, then chase him through the first rooms, speaking with him each time he stops. He ends on a platform up a ramp near the back door, where he fights (elite 57). He drops {npc:14355}'s {item:18261} and the {item:18249}, which opens the western and northern wings: one key in the group is enough."] = "Pusillin le diablotin attend près de l'entrée : lui parler, puis le poursuivre à travers les premières salles, en lui reparlant à chaque arrêt. Il finit sur une plate-forme en haut d'une rampe près de la porte de derrière, où il se bat (élite 57). Il donne le {item:18261} de {npc:14355} et la {item:18249}, qui ouvre les ailes ouest et nord : une clé dans le groupe suffit.",
	-- {item:18261} Book of Incantations
	["{item:18261}: Pusillin"] = "{item:18261} : Pusillin",
	-- {item:18249} Crescent Key
	["{item:18249}: Pusillin"] = "{item:18249} : Pusillin",

	-- Step 86: Warpwood Quarter: Lethtendris
	["Warpwood Quarter: Lethtendris"] = "Aile est : Lethtendris",
	-- {npc:7877} Latronicus Moonspear
	["Lethtendris (elite 57), a blood elf warlock, fights with her imp Pimgib: interrupt her spells. Her web is for {npc:7877}."] = "Lethtendris (élite 57), une démoniste elfe de sang, se bat avec son diablotin Pimgib : interrompre ses sorts. Sa toile est pour {npc:7877}.",
	-- {quest:7488} Lethtendris's Web
	["{quest:7488}: Lethtendris"] = "{quest:7488} : Lethtendris",

	-- Step 87: Warpwood Quarter: Alzzin the Wildshaper
	-- {npc:11492} Alzzin the Wildshaper
	["Warpwood Quarter: {npc:11492}"] = "Aile est : {npc:11492}",
	-- {npc:11490} Zevrim Thornhoof · {npc:11491} Old Ironbark · {object:176907} Conservatory Door · {npc:11492} Alzzin the Wildshaper
	-- plural, as words: Warpwood Crushers = {npc:13021} Warpwood Crusher
	["Hydrospawn patrols the pool on the next level down. {npc:11490} (elite 57) sacrifices players on his altar; after him, speak with {npc:11491}: he opens the {object:176907}. Clear the Warpwood Crushers on the ramp, then {npc:11492} (elite 58), who changes shape."] = "Hydrospawn patrouille autour du bassin, un niveau plus bas. {npc:11490} (élite 57) sacrifie des joueurs sur son autel ; après lui, parler à {npc:11491} : il ouvre {object:176907}. Nettoyer les Warpwood Crushers de la rampe, puis {npc:11492} (élite 58), qui change de forme.",

	-- Step 88: Lariss Pavilion: Azj'Tordin
	-- {npc:11492} Alzzin the Wildshaper · {item:18249} Crescent Key
	["The door at the back of {npc:11492}'s room opens with the {item:18249} straight onto the Lariss Pavilion."] = "La porte au fond de la salle de {npc:11492} s'ouvre avec la {item:18249} directement sur le pavillon de Lariss.",

	-- Step 89: Dire Maul West: before going in
	["Dire Maul West: before going in"] = "Hache-Tripes ouest : avant d'entrer",
	-- {item:18249} Crescent Key · {npc:11496} Immol'thar · {npc:11480} Arcane Aberration · {npc:11483} Mana Remnant
	["Back to the central courtyard of Dire Maul: the western wing opens on its west wall, with the {item:18249}. Five pylons, great crystals, shield {npc:11496}'s prison: kill every {npc:11480} and {npc:11483} around a pylon to shut it down."] = "Retour à la cour centrale de Hache-Tripes : l'aile ouest s'ouvre sur son mur ouest, avec la {item:18249}. Cinq pylônes, de grands cristaux, protègent la prison de {npc:11496} : tuer toutes les {npc:11480} et tous les {npc:11483} autour d'un pylône pour l'éteindre.",

	-- Step 90: Capital Gardens and the Court of the Highborne
	["Capital Gardens and the Court of the Highborne"] = "Les jardins et la cour des Bien-nés",
	-- {npc:11489} Tendris Warpwood · {npc:11488} Illyanna Ravenoak · {npc:11487} Magister Kalendris · {npc:14358} Shen'dralar Ancient
	["The first pylon stands in the Capital Gardens, right in front of the entrance. Kill the wandering Ancients before {npc:11489} (elite 60), who calls them all. Upstairs, the Court of the Highborne: two more pylons, {npc:11488} and {npc:11487}. The {npc:14358} stands on the bridge of the upper level."] = "Le premier pylône se dresse dans les jardins de la capitale (Capital Gardens), juste devant l'entrée. Tuer les Anciens qui errent avant {npc:11489} (élite 60), qui les appelle tous. À l'étage, la cour des Bien-nés (Court of the Highborne) : deux autres pylônes, {npc:11488} et {npc:11487}. {npc:14358} se tient sur le pont du niveau supérieur.",

	-- Step 91: Immol'thar and Prince Tortheldrin
	-- {npc:11496} Immol'thar · {npc:11486} Prince Tortheldrin
	["{npc:11496} and {npc:11486}"] = "{npc:11496} et {npc:11486}",
	-- {npc:11496} Immol'thar · {npc:11486} Prince Tortheldrin
	["The last two pylons stand either side of the door of the Prison of Immol'thar: with all five down, its force field is gone. {npc:11496} (elite 61) calls adds and moves players to the middle of the room; he enrages at half health. A small tunnel then leads to the Athenaeum: {npc:11486} (elite 60)."] = "Les deux derniers pylônes se dressent de chaque côté de la porte de la prison d'Immol'thar : une fois les cinq éteints, son champ de force disparaît. {npc:11496} (élite 61) appelle des renforts et déplace des joueurs au milieu de la salle ; il s'enrage à la moitié de sa vie. Un petit tunnel mène ensuite à l'Athénée (Athenaeum) : {npc:11486} (élite 60).",

	-- Step 92: The Athenaeum: Elven Legends
	-- {quest:7482} Elven Legends
	["The Athenaeum: {quest:7482}"] = "L'Athénée : {quest:7482}",
	-- {npc:14368} Lorekeeper Lydros
	["The skeletal remains lie on the floor beside {npc:14368}, in the Athenaeum: choose to mourn the great loss."] = "Les restes du squelette gisent par terre à côté de {npc:14368}, dans l'Athénée : choisir de pleurer cette grande perte.",
	-- {npc:14368} Lorekeeper Lydros
	["Skeletal remains, beside {npc:14368}"] = "Restes du squelette, à côté de {npc:14368}",

	-- Step 93: The Shen'dralar Ancient and his treasure
	-- {npc:14358} Shen'dralar Ancient
	["The {npc:14358} and his treasure"] = "{npc:14358} et son trésor",
	-- {npc:14358} Shen'dralar Ancient · {object:179517} Treasure of the Shen'dralar
	["Back to the {npc:14358} on the bridge of the Court of the Highborne. His next quest sends you to the {object:179517}, a chest under the ramp of the Athenaeum: take the one he offers."] = "Retour auprès de {npc:14358}, sur le pont de la cour des Bien-nés. Sa quête suivante envoie au {object:179517}, un coffre sous la rampe de l'Athénée : prendre celle qu'il propose.",
	-- {npc:14358} Shen'dralar Ancient
	["{npc:14358}: the same quest, the other version"] = "{npc:14358} : la même quête, l'autre version",
	-- {object:179517} Treasure of the Shen'dralar
	["{object:179517}, under the ramp of the Athenaeum"] = "{object:179517}, sous la rampe de l'Athénée",

	-- Step 94: Feathermoon Stronghold: Latronicus Moonspear
	-- {object:152576} Feathermoon Stronghold
	["Out of Dire Maul, back to {object:152576} (the flight from Thalanaar, or the road west and the boat)."] = "Sortir de Hache-Tripes et revenir à {object:152576} (le vol depuis Thalanaar, ou la route vers l'ouest et le bateau).",

	-- Step 96: Dire Maul: quests not done
	["Dire Maul: quests not done"] = "Hache-Tripes : quêtes non finies",
	["What is left of Dire Maul in the quest log is for another run: keep it for one, or drop it to free the log."] = "Ce qui reste de Hache-Tripes dans le journal de quêtes est pour une autre fois : le garder pour une autre visite, ou l'abandonner pour libérer le journal.",

	-- Step 97: Shards of the Felvine (optional)
	-- {quest:5526} Shards of the Felvine
	["{quest:5526} (optional)"] = "{quest:5526} (facultative)",
	-- {zone:1450} Moonglade · {npc:11801} Rabine Saturna · {quest:5527} A Reliquary of Purity · {quest:5526} Shards of the Felvine · {zone:1451} Silithus · {npc:11492} Alzzin the Wildshaper
	["From Feathermoon, the flight to {zone:1450}. Now that you have been inside Dire Maul, {npc:11801} offers {quest:5527}, then {quest:5526}. A long chain: the Reliquary lies in Southwind Village, in {zone:1451}; back to {npc:11801} in {zone:1450}; then a new run of the eastern wing of Dire Maul, where the Felvine grows behind {npc:11492} (elite 58); and back to {npc:11801}. Take it only if your group means to run the eastern wing again. Alone? Skip it."] = "Depuis Feathermoon, le vol jusqu'à {zone:1450}. Après une visite de Hache-Tripes, {npc:11801} propose {quest:5527}, puis {quest:5526}. Une longue chaîne : le reliquaire se trouve au Village de Sudevent, en {zone:1451} ; retour chez {npc:11801} à {zone:1450} ; puis une nouvelle visite de l'aile est de Hache-Tripes, où la gangrevigne pousse derrière {npc:11492} (élite 58) ; et retour chez {npc:11801}. À prendre seulement si le groupe compte refaire l'aile est. Seul ? La passer.",
	["Keep 2 free quest log slots."] = "Garder 2 places libres dans le journal de quêtes.",
	["Nighthaven"] = "Havrenuit",

	-- Step 98: Moonglade: Rabine Saturna
	-- {npc:11801} Rabine Saturna
	["{npc:11801}'s house stands in Nighthaven."] = "La maison de {npc:11801} se trouve à Havrenuit.",

	-- Step 99: Southwind Village
	["Southwind Village"] = "Village de Sudevent",
	-- {zone:1450} Moonglade · {object:179565} Dusty Reliquary
	-- plural, as words: Tortured Sentinels = {npc:12179} Tortured Sentinel
	["From {zone:1450}, the flight to Cenarion Hold, then east to the ruins of Southwind Village. The {object:179565} lies among the ruined buildings, watched by Tortured Sentinels."] = "Depuis {zone:1450}, le vol jusqu'au Fort cénarien, puis à l'est jusqu'aux ruines du Village de Sudevent. {object:179565} se trouve parmi les bâtiments en ruine, surveillé par des sentinelles torturées.",
	-- {object:179565} Dusty Reliquary
	["{object:179565}; inside"] = "{object:179565} ; à l'intérieur",

	-- Step 100: Moonglade: Rabine Saturna
	-- {zone:1450} Moonglade
	["From Cenarion Hold, the flight back to {zone:1450}."] = "Depuis le Fort cénarien, le vol de retour jusqu'à {zone:1450}.",

	-- Step 102: Dire Maul: the eastern wing again
	["Dire Maul: the eastern wing again"] = "Hache-Tripes : l'aile est, à nouveau",
	-- {zone:1450} Moonglade · {object:152576} Feathermoon Stronghold · {npc:11490} Zevrim Thornhoof · {npc:11491} Old Ironbark · {object:176907} Conservatory Door · {npc:11492} Alzzin the Wildshaper · {item:22201} Reliquary of Purity
	-- plural, as words: Warpwood Crushers = {npc:13021} Warpwood Crusher
	["From {zone:1450}, the flight to {object:152576} or Thalanaar, then Dire Maul's eastern wing, as in the first run: {npc:11490}, {npc:11491} at the {object:176907}, the Warpwood Crushers on the ramp, then {npc:11492} (elite 58). Once he is dead, the Felvine behind him drops its shards: loot one, then use the {item:22201}."] = "Depuis {zone:1450}, le vol jusqu'à {object:152576} ou Thalanaar, puis l'aile est de Hache-Tripes, comme la première fois : {npc:11490}, {npc:11491} devant {object:176907}, les Warpwood Crushers de la rampe, puis {npc:11492} (élite 58). Une fois qu'il est mort, la gangrevigne derrière lui lâche ses éclats : en ramasser un, puis utiliser le {item:22201}.",
	-- {item:18540} Sealed Reliquary of Purity · {item:18501} Felvine Shard · {item:22201} Reliquary of Purity
	["{item:18540}: a {item:18501} in the {item:22201}"] = "{item:18540} : un {item:18501} dans le {item:22201}",

	-- Step 103: Moonglade: Rabine Saturna
	-- {quest:5526} Shards of the Felvine · {npc:11801} Rabine Saturna · {zone:1450} Moonglade
	["{quest:5526}: {npc:11801}, in her house in Nighthaven. From Feathermoon, the flight to {zone:1450}."] = "{quest:5526} : {npc:11801}, dans sa maison de Havrenuit. Depuis Feathermoon, le vol jusqu'à {zone:1450}.",

	-- Step 104: Shards of the Felvine: not done
	-- {quest:5526} Shards of the Felvine
	["{quest:5526}: not done"] = "{quest:5526} : pas finie",
	-- {quest:5526} Shards of the Felvine
	["{quest:5526} is not done and the guide does not go back to Dire Maul: abandon it, or keep it for a run of your own."] = "{quest:5526} n'est pas finie et le guide ne retourne pas à Hache-Tripes : l'abandonner, ou la garder pour une visite à part.",

	-- Step 105: Stratholme (dungeon, optional)
	["Stratholme (dungeon, optional)"] = "Stratholme (donjon, facultatif)",
	-- {zone:1423} Eastern Plaguelands · {npc:11140} Egan · {npc:1855} Tirion Fordring · {quest:5845} Of Lost Honor · {npc:11936} Artist Renfray · {npc:10813} Balnazzar
	["Stratholme: the dead city in the north-west of the {zone:1423}, levels 58 to 60, bosses 57 to 62: a group of 5 at 58 to 60; possible from about 56, difficult. The quests come from Light's Hope Chapel, from {npc:11140} in Terrordale and, for whoever helped {npc:1855} on the route ({quest:5845}), from {npc:11936} on Caer Darrow. Its quest chains ask for three visits to the same instance: the living side, then {npc:10813}, then the dead side, with rides back to Light's Hope in between. Alone? Skip it."] = "Stratholme : la ville morte au nord-ouest des {zone:1423}, niveaux 58 à 60, boss de 57 à 62 : un groupe de 5 de niveau 58 à 60 ; possible dès 56 environ, difficile. Les quêtes viennent de la chapelle de l'Espoir de Lumière, de {npc:11140} à Val-Terreur et, pour qui a aidé {npc:1855} sur le parcours ({quest:5845}), de {npc:11936} à Caer Darrow. Ses suites de quêtes demandent trois passages dans la même instance : le côté vivant, puis {npc:10813}, puis le côté mort, avec des retours à l'Espoir de Lumière entre les deux. Seul ? La passer.",
	["Keep 8 free quest log slots. Scholomance is asked next, here too: one of its quests is given in this chapel."] = "Garder 8 places libres dans le journal de quêtes. La Scholomance est demandée juste après, ici aussi : une de ses quêtes se prend dans cette chapelle.",
	["Light's Hope Chapel"] = "Chapelle de l'Espoir de Lumière",

	-- Step 106: Scholomance (dungeon, optional)
	["Scholomance (dungeon, optional)"] = "Scholomance (donjon, facultatif)",
	-- {zone:1422} Western Plaguelands · {item:13704} Skeleton Key · {quest:5505} The Key to Scholomance · {npc:11056} Alchemist Arbington · {npc:11035} Betina Bigglezink · {npc:11216} Eva Sarkhoff
	["Scholomance: the school of necromancy under Caer Darrow, the island of the lake in the south-east of the {zone:1422}. Levels 58 to 60, bosses 58 to 62: a group of 5 at 59 or 60. Its door opens only with the {item:13704}, the reward of {quest:5505}, a long chain from {npc:11056} at Chillwind Camp that the guide offers before the run: one key in the group is enough. The guide runs it after Stratholme; {npc:11035}, in this chapel, gives one of its quests, the others come from Chillwind Camp and from {npc:11216} at its door. Alone? Skip it."] = "Scholomance : l'école de nécromancie sous Caer Darrow, l'île du lac au sud-est des {zone:1422}. Niveaux 58 à 60, boss de 58 à 62 : un groupe de 5 de niveau 59 ou 60. Sa porte ne s'ouvre qu'avec la {item:13704}, récompense de {quest:5505}, une longue suite d'{npc:11056} au camp du Noroît que le guide propose avant le donjon : une clé dans le groupe suffit. Le guide la fait après Stratholme ; {npc:11035}, dans cette chapelle, donne une de ses quêtes, les autres viennent du camp du Noroît et de {npc:11216} devant sa porte. Seul ? La passer.",
	["Keep 4 free quest log slots."] = "Garder 4 places libres dans le journal de quêtes.",

	-- Step 107: Light's Hope Chapel: Stratholme
	["Light's Hope Chapel: Stratholme"] = "Chapelle de l'Espoir de Lumière : Stratholme",
	-- {npc:11036} Leonid Barthalomew the Revered · {npc:11035} Betina Bigglezink · {npc:11039} Duke Nicholas Zverenhoff · {npc:11033} Smokey LaRue
	["{npc:11036} stands inside the chapel; {npc:11035}, {npc:11039} and {npc:11033} stand around it."] = "{npc:11036} se tient dans la chapelle ; {npc:11035}, {npc:11039} et {npc:11033} se tiennent autour.",

	-- Step 108: Light's Hope Chapel: Scholomance
	["Light's Hope Chapel: Scholomance"] = "Chapelle de l'Espoir de Lumière : Scholomance",
	-- {quest:5529} Plagued Hatchlings · {npc:11035} Betina Bigglezink · {item:12368} Dawn's Gambit · {npc:10267} Tinkee Steamboil
	["{quest:5529}: the dragon whelps of Scholomance. {npc:11035}'s other Scholomance quest, {item:12368}, comes only after {npc:10267}'s chain through Upper Blackrock Spire: not in this guide."] = "{quest:5529} : les dragonnets de la Scholomance. L'autre quête de {npc:11035} pour la Scholomance, {item:12368}, ne vient qu'après la chaîne de {npc:10267}, qui passe par le pic Rochenoire supérieur : pas dans ce guide.",

	-- Step 109: Terrordale: Egan
	-- {npc:11140} Egan
	["Terrordale: {npc:11140}"] = "Val-Terreur : {npc:11140}",
	-- {npc:11140} Egan
	["Ride west across the zone to Terrordale: {npc:11140} waits in the westernmost of its three houses, where the route found him. His blaster frees the ghosts of Stratholme."] = "Traverser la zone vers l'ouest jusqu'à Val-Terreur : {npc:11140} attend dans la plus à l'ouest de ses trois maisons, là où le parcours l'a trouvé. Son fusil libère les fantômes de Stratholme.",

	-- Step 110: Tirion Fordring: Of Love and Family
	-- {npc:1855} Tirion Fordring · {quest:5846} Of Love and Family · {quest:5845} Of Lost Honor · {npc:11936} Artist Renfray · {zone:1422} Western Plaguelands
	["West of Terrordale, {npc:1855}'s hut on the bank of the border river. {quest:5846} follows {quest:5845}, done on the route: it goes to {npc:11936}, on Caer Darrow in the lake of the {zone:1422}, whose own quest is a painting in Stratholme."] = "À l'ouest de Val-Terreur, la cabane de {npc:1855} au bord de la rivière frontière. {quest:5846} suit {quest:5845}, faite sur le parcours : elle va à {npc:11936}, à Caer Darrow sur le lac des {zone:1422}, dont la quête suivante est un tableau caché dans Stratholme.",

	-- Step 111: Caer Darrow: Artist Renfray
	-- {npc:11936} Artist Renfray
	["Caer Darrow: {npc:11936}"] = "Caer Darrow : {npc:11936}",
	-- {zone:1422} Western Plaguelands
	["Ride south through the {zone:1422} to the lake and onto Caer Darrow: Renfray paints inside the ruined house. His quest cannot be shared. Then back north-east to Stratholme."] = "Descendre au sud à travers les {zone:1422} jusqu'au lac et à Caer Darrow : Renfray peint dans la maison en ruine. Sa quête ne se partage pas. Puis remonter au nord-est vers Stratholme.",
	-- {npc:11936} Artist Renfray
	["{npc:11936}, inside"] = "{npc:11936}, à l'intérieur",

	-- Step 112: Stratholme: along the way
	["Stratholme: along the way"] = "Stratholme : en chemin",
	-- {item:13180} Stratholme Holy Water · {npc:11140} Egan
	-- plural, as words: Plagued Flesh Samples = {item:13174} Plagued Flesh Sample · Restless Souls = {npc:11122} Restless Soul · Spectral Citizens = {npc:10384} Spectral Citizen
	["Collected all through the city: Plagued Flesh Samples on the ghouls, the abominations and the crypt beasts (not on the skeletons); {item:13180} in the supply crates by the streets (some are trapped: plagued insects swarm out). Restless Souls: do not kill the Ghostly and Spectral Citizens; equip the blaster {npc:11140} gave you, target one and use the blaster on it, then again on the soul that breaks free."] = "À ramasser dans toute la ville : les échantillons de chair pestiférée (Plagued Flesh Sample) sur les goules, les abominations et les bêtes des cryptes (pas sur les squelettes) ; l'{item:13180} dans les caisses de ravitaillement le long des rues (certaines sont piégées : des insectes pestiférés en sortent). Âmes en peine : ne pas tuer les citoyens fantomatiques et spectraux (Ghostly Citizen, Spectral Citizen) ; équiper le fusil donné par {npc:11140}, en cibler un et utiliser le fusil sur lui, puis encore sur l'âme qui s'en libère.",
	-- {quest:5212} The Flesh Does Not Lie · {quest:5251} The Archivist · {quest:5214} The Great Ezra Grimm · {quest:5243} Houses of the Holy · {quest:5282} The Restless Souls
	["Share {quest:5212}, {quest:5251}, {quest:5214} and {quest:5243} with your group: click each in the quest log, then Share. {quest:5282} and Renfray's painting quest cannot be shared."] = "Partager {quest:5212}, {quest:5251}, {quest:5214} et {quest:5243} avec le groupe : clic sur chacune dans le journal, puis Partager. {quest:5282} et la quête du tableau de Renfray ne se partagent pas.",
	-- {item:13180} Stratholme Holy Water
	["{item:13180}: supply crates"] = "{item:13180} : caisses de ravitaillement",
	-- {npc:11122} Restless Soul
	["{npc:11122}, freed with the blaster"] = "{npc:11122}, libérée avec le fusil",

	-- Step 113: Stratholme, first visit: before going in
	["Stratholme, first visit: before going in"] = "Stratholme, première visite : avant d'entrer",
	-- {object:175435} King's Square · {object:175438} Market Row · {object:175434} Crusaders' Square · {object:175433} Festival Lane · {object:175440} Elders' Square · {npc:10813} Balnazzar · {quest:5251} The Archivist · {item:7146} The Scarlet Key · {npc:6487} Arcanist Doan
	["First visit, the living side, by the main gate across the bridge: {object:175435}, {object:175438}, {object:175434} and the Scarlet Bastion, then {object:175433} and {object:175440}. Leave {npc:10813} alive this time: {quest:5251} must be handed in before he dies, or his head starts nothing. Warcraft Tavern (written from Classic) says the doors of the Scarlet Bastion open with {item:7146}, from {npc:6487}'s chest in the Scarlet Monastery Library: to check in game."] = "Première visite, le côté vivant, par la grande porte au bout du pont : {object:175435}, {object:175438}, {object:175434} et le Bastion écarlate (Scarlet Bastion), puis {object:175433} et {object:175440}. Laisser {npc:10813} en vie cette fois : {quest:5251} doit être rendue avant sa mort, sinon sa tête ne lance rien. D'après Warcraft Tavern (écrit d'après Classic), les portes du Bastion écarlate s'ouvrent avec {item:7146}, du coffre d'{npc:6487} dans la Bibliothèque du Monastère écarlate : à vérifier en jeu.",
	-- {quest:5212} The Flesh Does Not Lie · {npc:11035} Betina Bigglezink · {quest:5251} The Archivist · {quest:5214} The Great Ezra Grimm · {npc:11033} Smokey LaRue · {quest:5243} Houses of the Holy · {quest:5281} The Restless Souls · {npc:11140} Egan · {zone:1452} Winterspring · {npc:16016} Anthion Harmon · {npc:10508} Ras Frostwhisper · {object:176631} Menethil's Gift
	["In the quest log: {quest:5212} ({npc:11035}), {quest:5251} (Duke Nicholas), {quest:5214} ({npc:11033}), {quest:5243} (Leonid), {quest:5281} ({npc:11140}); Renfray's painting quest, for whoever took it. Not on this route: Sweet Serenity and Corruption ({zone:1452}), the dungeon set quests (Deliana, {npc:16016}), {npc:10508}'s chain ({object:176631})."] = "Dans le journal : {quest:5212} ({npc:11035}), {quest:5251} (duc Nicholas), {quest:5214} ({npc:11033}), {quest:5243} (Leonid), {quest:5281} ({npc:11140}) ; la quête du tableau de Renfray, pour qui l'a prise. Pas sur ce parcours : Sweet Serenity et Corruption ({zone:1452}), les quêtes d'ensembles de donjon (Deliana, {npc:16016}), la suite de {npc:10508} ({object:176631}).",
	["Stratholme"] = "Stratholme",

	-- Step 114: King's Square: Ezra Grimm
	-- {object:175435} King's Square · {npc:11058} Ezra Grimm
	["Past the main gate, {object:175435}: follow the road round to the left to its dead end, under the sign of {npc:11058}'s Premium Tobacco. {npc:11058}, undead (elite 61), stands in front of his shop."] = "Passé la grande porte, {object:175435} : suivre la route vers la gauche jusqu'au cul-de-sac, sous l'enseigne du tabac de {npc:11058} (Premium Tobacco). {npc:11058}, mort-vivant (élite 61), se tient devant sa boutique.",

	-- Step 115: Market Row and Crusaders' Square
	-- {object:175438} Market Row · {object:175434} Crusaders' Square
	["{object:175438} and {object:175434}"] = "{object:175438} et {object:175434}",
	-- {object:175435} King's Square · {object:175438} Market Row · {npc:10558} Hearthsinger Forresten · {object:175434} Crusaders' Square · {npc:10808} Timmy the Cruel · {npc:11120} Crimson Hammersmith
	["Back through {object:175435}, then {object:175438} ({npc:10558}, rare, may walk there) to {object:175434}: {npc:10808} runs out once the square is cleared. Never click a pattern on the ground during a fight: it calls the {npc:11120}. The Scarlet Bastion opens on the square."] = "Revenir par {object:175435}, puis {object:175438} ({npc:10558}, rare, peut y passer) jusqu'à {object:175434} : {npc:10808} accourt une fois la place nettoyée. Ne jamais cliquer sur un motif au sol pendant un combat : il appelle {npc:11120}. Le Bastion écarlate s'ouvre sur la place.",

	-- Step 116: The Scarlet Bastion: Malor's Strongbox
	-- {object:176112} Malor's Strongbox
	["The Scarlet Bastion: {object:176112}"] = "Le Bastion écarlate : {object:176112}",
	-- {npc:11032} Malor the Zealous · {item:12845} Medallion of Faith · {npc:10917} Aurius · {npc:10997} Cannon Master Willey
	["In the Bastion, {npc:11032} (elite 60) guards the Hoard: his strongbox, on the ground beside him, holds the {item:12845}. One medallion per run: whoever loots it keeps it for {npc:10917}, in the third visit. {npc:10997} (elite 60) holds the armoury and calls riflemen: the cannons of his room fire on them."] = "Dans le Bastion, {npc:11032} (élite 60) garde le Trésor (Hoard) : son coffre, par terre à côté de lui, contient le {item:12845}. Un seul médaillon par visite : qui le ramasse le garde pour {npc:10917}, à la troisième visite. {npc:10997} (élite 60) tient l'armurerie et appelle des fusiliers : les canons de sa salle tirent sur eux.",

	-- Step 117: The Scarlet Bastion: Archivist Galford
	-- {npc:10811} Archivist Galford
	["The Scarlet Bastion: {npc:10811}"] = "Le Bastion écarlate : {npc:10811}",
	-- {npc:10811} Archivist Galford · {npc:10813} Balnazzar · {object:176245} Scarlet Archive
	["{npc:10811} (elite 60) holds his library, across the hall from the last chamber, {npc:10813}'s: spread out against his fire. Once he is dead, use the {object:176245}, the book on the table behind him: the room burns. Leave {npc:10813} for the second visit."] = "{npc:10811} (élite 60) tient sa bibliothèque, en face de la dernière salle, celle de {npc:10813} : s'écarter les uns des autres contre son feu. Une fois qu'il est mort, utiliser {object:176245}, le livre sur la table derrière lui : la salle prend feu. Laisser {npc:10813} pour la deuxième visite.",
	-- {object:176245} Scarlet Archive
	["{object:176245}: set it on fire"] = "{object:176245} : y mettre le feu",

	-- Step 118: The Scarlet Bastion: the painting
	["The Scarlet Bastion: the painting"] = "Le Bastion écarlate : le tableau",
	-- {quest:5848} Of Love and Family · {object:177287} Unfinished Painting
	["{quest:5848}: an {object:177287} hangs on the wall of Galford's library, the twin moons on it; Renfray's painting is hidden behind it."] = "{quest:5848} : un {object:177287} est accroché au mur de la bibliothèque de Galford, les deux lunes dessus ; le tableau de Renfray est caché derrière.",
	-- {quest:5848} Of Love and Family · {object:177287} Unfinished Painting
	["{quest:5848}: behind the {object:177287}"] = "{quest:5848} : derrière le {object:177287}",

	-- Step 119: Festival Lane and Elders' Square
	-- {object:175433} Festival Lane · {object:175440} Elders' Square
	["{object:175433} and {object:175440}"] = "{object:175433} et {object:175440}",
	-- {object:175433} Festival Lane · {npc:10516} The Unforgiven · {object:175440} Elders' Square · {npc:10435} Magistrate Barthilas · {item:12382} Key to the City · {object:175461} Service Entrance
	["Out of the Bastion, {object:175433}: {npc:10516} (elite 57) calls spirits, kill them first. Then {object:175440}: {npc:10435} (elite 58) stands before Alonsus Chapel and drops the {item:12382}. It opens the {object:175461}, the gate on this square, and the gate of the Gauntlet: one key in the group is enough. Leave the dungeon by the {object:175461}, or the way you came; keep the group together, without resetting the instance: the next two visits come back into it."] = "En sortant du Bastion, {object:175433} : {npc:10516} (élite 57) appelle des esprits, les tuer d'abord. Puis {object:175440} : {npc:10435} (élite 58) se tient devant la chapelle d'Alonsus (Alonsus Chapel) et donne la {item:12382}. Elle ouvre {object:175461}, la porte de cette place, et la porte du Défilé (Gauntlet) : une clé dans le groupe suffit. Sortir du donjon par {object:175461}, ou par où le groupe est venu ; rester groupés, sans réinitialiser l'instance : les deux visites suivantes y reviennent.",

	-- Step 120: Light's Hope Chapel: Betina Bigglezink
	-- {npc:11035} Betina Bigglezink
	["Light's Hope Chapel: {npc:11035}"] = "Chapelle de l'Espoir de Lumière : {npc:11035}",
	-- {npc:11035} Betina Bigglezink
	["Ride back east to Light's Hope Chapel, a good ten minutes. {npc:11035}'s next quest is for the third visit."] = "Revenir vers l'est jusqu'à la chapelle de l'Espoir de Lumière, une bonne dizaine de minutes. La quête suivante de {npc:11035} est pour la troisième visite.",
	-- {item:13176} Scourge Data
	["The {item:13176}: a ziggurat of the dead side"] = "Les {item:13176} : une ziggourat du côté mort-vivant",

	-- Step 121: Light's Hope Chapel: Duke Nicholas Zverenhoff
	-- {npc:11039} Duke Nicholas Zverenhoff
	["Light's Hope Chapel: {npc:11039}"] = "Chapelle de l'Espoir de Lumière : {npc:11039}",
	-- {quest:5251} The Archivist · {npc:10813} Balnazzar
	["{quest:5251} handed in: {npc:10813}'s head now starts the next quest (second visit)."] = "{quest:5251} rendue : la tête de {npc:10813} lance maintenant la quête suivante (deuxième visite).",

	-- Step 122: Light's Hope Chapel: Smokey LaRue
	-- {npc:11033} Smokey LaRue
	["Light's Hope Chapel: {npc:11033}"] = "Chapelle de l'Espoir de Lumière : {npc:11033}",

	-- Step 123: Light's Hope Chapel: Leonid Barthalomew the Revered
	-- {npc:11036} Leonid Barthalomew the Revered
	["Light's Hope Chapel: {npc:11036}"] = "Chapelle de l'Espoir de Lumière : {npc:11036}",

	-- Step 124: Stratholme, second visit: Balnazzar
	-- {npc:10813} Balnazzar
	["Stratholme, second visit: {npc:10813}"] = "Stratholme, deuxième visite : {npc:10813}",
	-- {npc:10812} Grand Crusader Dathrohan · {npc:10813} Balnazzar · {quest:5262} The Truth Comes Crashing Down · {quest:5251} The Archivist
	["Second visit: back into the same instance by the main gate, through the cleared streets to the Scarlet Bastion's last chamber. {npc:10812} (elite 62) turns into {npc:10813}, a dread lord, during the fight: dispel his Deep Sleep, stand at range from his Psychic Scream. His head starts {quest:5262} for those who handed in {quest:5251}: right-click it."] = "Deuxième visite : retour dans la même instance par la grande porte, à travers les rues déjà nettoyées, jusqu'à la dernière salle du Bastion écarlate. {npc:10812} (élite 62) se change en {npc:10813}, un seigneur de l'effroi, pendant le combat : dissiper son Sommeil profond, se tenir à distance de son Cri psychique. Sa tête lance {quest:5262} pour ceux qui ont rendu {quest:5251} : clic droit dessus.",

	-- Step 125: Light's Hope Chapel: The Truth Comes Crashing Down
	-- {quest:5262} The Truth Comes Crashing Down
	["Light's Hope Chapel: {quest:5262}"] = "Chapelle de l'Espoir de Lumière : {quest:5262}",
	-- {object:175461} Service Entrance · {object:175440} Elders' Square · {npc:10440} Baron Rivendare · {quest:5263} Above and Beyond
	["Out by the {object:175461} in {object:175440} (or the way you came) and back to Light's Hope Chapel. Duke Nicholas takes the head and sends you after {npc:10440}, the last boss of the dead side: the third visit, in the same instance. Rather not ride again? Skip this step: {quest:5263} then waits for another run."] = "Sortir par {object:175461} sur {object:175440} (ou par où le groupe est venu) et revenir à la chapelle de l'Espoir de Lumière. Le duc Nicholas prend la tête et envoie tuer {npc:10440}, le dernier boss du côté mort-vivant : la troisième visite, dans la même instance. Pas envie de refaire la route ? Passer cette étape : {quest:5263} attend alors une autre visite.",

	-- Step 126: Stratholme, third visit: before going in
	["Stratholme, third visit: before going in"] = "Stratholme, troisième visite : avant d'entrer",
	-- {object:175461} Service Entrance · {item:12382} Key to the City · {object:175440} Elders' Square · {npc:10440} Baron Rivendare · {npc:16031} Ysida Harmon
	["Third visit, the dead side: the {object:175461}, the gate east of the main one, opens with the {item:12382} onto {object:175440}. Bosses 59 to 62: 60 advised. Opening the gate of the Gauntlet starts {npc:10440}'s 45-minute countdown: it only matters for {npc:16031} (Dead Man's Plea, a dungeon set quest), no quest of this guide depends on it."] = "Troisième visite, le côté mort-vivant : {object:175461}, la porte à l'est de la grande porte, s'ouvre avec la {item:12382} sur {object:175440}. Boss de 59 à 62 : niveau 60 conseillé. Ouvrir la porte du Défilé (Gauntlet) lance le compte à rebours de 45 minutes de {npc:10440} : il ne compte que pour {npc:16031} (Dead Man's Plea, une quête d'ensemble de donjon), aucune quête de ce guide n'en dépend.",
	-- {quest:5213} The Active Agent · {npc:11035} Betina Bigglezink · {quest:5263} Above and Beyond · {item:12845} Medallion of Faith · {npc:10917} Aurius
	["In the quest log: {quest:5213} ({npc:11035}), {quest:5263} (Duke Nicholas). Whoever carries the {item:12845}: {npc:10917}, just inside."] = "Dans le journal de quêtes : {quest:5213} ({npc:11035}), {quest:5263} (le duc Nicholas). Qui porte le {item:12845} : {npc:10917}, juste après l'entrée.",

	-- Step 127: Elders' Square: Aurius
	-- {npc:10917} Aurius · {object:175440} Elders' Square · {item:12845} Medallion of Faith · {quest:5125} Aurius' Reckoning · {npc:10440} Baron Rivendare
	["{npc:10917} waits in Alonsus Chapel, on {object:175440}: the player with the {item:12845} hands it in, then takes {quest:5125}. With the medallion handed in during this instance, {npc:10917} joins the fight against {npc:10440}. Whether he offers {quest:5125} to the others of the group too: to check in game."] = "{npc:10917} attend dans la chapelle d'Alonsus, sur {object:175440} : le joueur qui a le {item:12845} le lui rend, puis prend {quest:5125}. Le médaillon rendu dans cette instance, {npc:10917} rejoint le combat contre {npc:10440}. Propose-t-il aussi {quest:5125} aux autres membres du groupe ? À vérifier en jeu.",
	-- {npc:10917} Aurius · {item:12845} Medallion of Faith
	["{npc:10917}: with the {item:12845}"] = "{npc:10917} : avec le {item:12845}",

	-- Step 128: The Gauntlet and the ziggurats
	-- {object:175462} The Gauntlet
	["{object:175462} and the ziggurats"] = "{object:175462} et les ziggourats",
	-- {item:12382} Key to the City · {npc:10437} Nerub'enkan · {npc:10436} Baroness Anastari · {npc:10438} Maleki the Pallid · {npc:10399} Thuzadin Acolyte · {item:13176} Scourge Data · {npc:11035} Betina Bigglezink
	["The {item:12382} opens the gate of the Gauntlet. Three ziggurats stand on the dead side, each with a guardian at its door: {npc:10437} (the first, on the left), {npc:10436} (the second: she possesses a player, bring them to half health), {npc:10438} (the third). Kill each guardian, then every {npc:10399} inside: the {item:13176} for {npc:11035} lies in a small box in one of the three. Stonespine (rare) may walk between the first two."] = "La {item:12382} ouvre la porte du Défilé (Gauntlet). Trois ziggourats se dressent du côté mort-vivant, chacune avec un gardien à sa porte : {npc:10437} (la première, sur la gauche), {npc:10436} (la deuxième : elle possède un joueur, l'amener à la moitié de sa vie), {npc:10438} (la troisième). Tuer chaque gardien, puis chaque {npc:10399} à l'intérieur : les {item:13176} pour {npc:11035} sont dans une petite boîte, dans l'une des trois. Stonespine (rare) peut passer entre les deux premières.",
	-- {item:13176} Scourge Data
	["{item:13176}: a small box in one of the ziggurats"] = "{item:13176} : une petite boîte dans l'une des ziggourats",

	-- Step 129: Slaughter Square: Ramstein the Gorger
	-- {object:175449} Slaughter Square · {npc:10416} Bile Spewer · {npc:10417} Venom Belcher · {npc:10439} Ramstein the Gorger · {npc:11030} Mindless Undead
	["With the three ziggurats cleared, the gates of {object:175449} open. Kill every {npc:10416} and {npc:10417} in the square: {npc:10439} (elite 61) comes out; he hits hard and knocks his target away. Then a horde of {npc:11030}, then three Black Guard Sentries at the door of the Slaughterhouse."] = "Les trois ziggourats nettoyées, les grilles de {object:175449} s'ouvrent. Tuer chaque {npc:10416} et chaque {npc:10417} de la place : {npc:10439} (élite 61) sort ; il frappe fort et repousse sa cible. Puis une horde de {npc:11030}, puis trois sentinelles de la Garde noire (Black Guard Sentry) à la porte de l'Abattoir (Slaughterhouse).",

	-- Step 130: The Slaughterhouse: Baron Rivendare
	-- {npc:10440} Baron Rivendare
	["The Slaughterhouse: {npc:10440}"] = "L'Abattoir : {npc:10440}",
	-- {npc:10440} Baron Rivendare · {npc:10917} Aurius · {quest:5125} Aurius' Reckoning · {object:176631} Menethil's Gift · {npc:10508} Ras Frostwhisper
	["{npc:10440} (elite 62) raises skeletons and his Unholy Aura hurts everyone near him; his Mortal Strike cuts the tank's healing. His head is for Duke Nicholas. Then speak with {npc:10917} for {quest:5125}. The glowing symbol in front of the Baron, {object:176631}, belongs to {npc:10508}'s chain: not in this guide."] = "{npc:10440} (élite 62) relève des squelettes et son Aura impie blesse tous ceux qui l'approchent ; sa Frappe mortelle réduit les soins reçus par le tank. Sa tête est pour le duc Nicholas. Parler ensuite à {npc:10917} pour {quest:5125}. Le symbole lumineux devant le baron, {object:176631}, appartient à la chaîne de {npc:10508} : pas dans ce guide.",
	-- {npc:10917} Aurius
	["{npc:10917}, after the fight"] = "{npc:10917}, après le combat",

	-- Step 131: Light's Hope Chapel: Betina Bigglezink
	["Out of Stratholme, back east to Light's Hope Chapel."] = "Sortir de Stratholme et revenir vers l'est jusqu'à la chapelle de l'Espoir de Lumière.",

	-- Step 132: Light's Hope Chapel: Duke Nicholas Zverenhoff
	-- {quest:5263} Above and Beyond · {quest:5264} Lord Maxwell Tyrosus · {object:176317} Argent Hold
	["{quest:5263}: Duke Nicholas sends you to {quest:5264}, inside the chapel, who opens the {object:176317}, the chest beside him, for your reward."] = "{quest:5263} : le duc Nicholas envoie voir {quest:5264}, dans la chapelle, qui ouvre {object:176317}, le coffre à côté de lui, pour la récompense.",

	-- Step 133: Light's Hope Chapel: what is left to hand in
	["Light's Hope Chapel: what is left to hand in"] = "Chapelle de l'Espoir de Lumière : ce qui reste à rendre",
	-- {npc:10813} Balnazzar
	["Finished in the second or third visit only, or {npc:10813}'s head kept without the ride: hand them in now."] = "Finies seulement à la deuxième ou à la troisième visite, ou la tête de {npc:10813} gardée sans faire la route : les rendre maintenant.",
	-- {npc:11039} Duke Nicholas Zverenhoff · {npc:10813} Balnazzar
	["{npc:11039}: the head of {npc:10813}"] = "{npc:11039} : la tête de {npc:10813}",

	-- Step 134: Terrordale: Egan
	-- {npc:11140} Egan
	["Ride west across the zone to {npc:11140}'s house in Terrordale."] = "Traverser la zone vers l'ouest jusqu'à la maison de {npc:11140}, à Val-Terreur.",

	-- Step 135: Tirion Fordring: Of Love and Family
	-- {npc:1855} Tirion Fordring
	["West of Terrordale, {npc:1855}'s hut on the bank of the border river. His next quest, Find Myranda, leads to Hearthglen: not in this guide."] = "À l'ouest de Val-Terreur, la cabane de {npc:1855} sur la rive de la rivière frontière. Sa quête suivante, Find Myranda, mène à Âtreval : pas dans ce guide.",

	-- Step 136: Stratholme: quests not done
	["Stratholme: quests not done"] = "Stratholme : quêtes non finies",
	["What is left of Stratholme in the quest log is for another run: keep it for one, or drop it to free the log."] = "Ce qui reste de Stratholme dans le journal de quêtes est pour une autre fois : le garder pour une autre visite, ou l'abandonner pour libérer le journal.",

	-- Step 137: Of Love and Family: not done
	-- {quest:5848} Of Love and Family
	["{quest:5848}: not done"] = "{quest:5848} : pas finie",
	-- {quest:5848} Of Love and Family
	["{quest:5848} is not done and the guide does not go back to Stratholme: abandon it, or keep it for a run of your own."] = "{quest:5848} n'est pas finie et le guide ne retourne pas à Stratholme : l'abandonner, ou la garder pour une visite à part.",

	-- Step 138: The Skeleton Key (optional)
	-- {item:13704} Skeleton Key
	["The {item:13704} (optional)"] = "La {item:13704} (facultative)",
	-- {item:13704} Skeleton Key · {npc:11056} Alchemist Arbington · {npc:5411} Krinkle Goodsteel · {zone:1449} Un'Goro Crater · {npc:1852} Araj the Summoner
	-- plural, as words: Thorium Bars = {item:12359} Thorium Bar
	["The {item:13704} opens Scholomance: one player of the group with it is enough, and a rogue can pick the lock instead. Its chain is long: {npc:11056} at Chillwind Camp, {npc:5411} in Gadgetzan (15 gold), Fire Plume Ridge in {zone:1449} with two Thorium Bars, then {npc:1852} (elite 61) in Andorhal. Somebody in the group already has the key? Skip it."] = "La {item:13704} ouvre Scholomance : un joueur du groupe qui l'a suffit, et un voleur peut crocheter la serrure à la place. Sa suite est longue : {npc:11056} au camp du Noroît, {npc:5411} à Gadgetzan (15 pièces d'or), la Crête de la Fournaise dans le {zone:1449} avec deux barres de thorium, puis {npc:1852} (élite 61) à Andorhal. Quelqu'un du groupe a déjà la clé ? La passer.",
	-- {npc:1855} Tirion Fordring · {npc:11056} Alchemist Arbington
	["To Chillwind Camp: the flight from Light's Hope Chapel, or the road south from {npc:1855}'s hut. {npc:11056} stands in the camp."] = "Vers le camp du Noroît : le vol depuis la chapelle de l'Espoir de Lumière, ou la route vers le sud depuis la cabane de {npc:1855}. {npc:11056} se tient dans le camp.",
	-- {npc:11056} Alchemist Arbington · {npc:5411} Krinkle Goodsteel
	["{npc:11056}: for {npc:5411} in Gadgetzan"] = "{npc:11056} : pour {npc:5411} à Gadgetzan",

	-- Step 139: Gadgetzan: Krinkle Goodsteel
	-- {npc:5411} Krinkle Goodsteel
	["Gadgetzan: {npc:5411}"] = "Gadgetzan : {npc:5411}",
	-- {zone:1455} Ironforge · {object:1162} Menethil Harbor · {npc:5411} Krinkle Goodsteel · {item:14628} Imbued Skeletal Fragments
	["The long way to Gadgetzan: from Chillwind Camp, the flight to {zone:1455}, then {object:1162}, the boat to Theramore and the flight to Gadgetzan. {npc:5411} stands at his forge in town; he wants the {item:14628} and 15 gold."] = "Le long trajet vers Gadgetzan : depuis le camp du Noroît, le vol pour {zone:1455}, puis {object:1162}, le bateau pour Theramore et le vol pour Gadgetzan. {npc:5411} se tient à sa forge en ville ; il veut les {item:14628} et 15 pièces d'or.",

	-- Step 140: Fire Plume Ridge
	["Fire Plume Ridge"] = "Crête de la Fournaise",
	-- {zone:1449} Un'Goro Crater · {item:14644} Skeleton Key Mold
	-- plural, as words: Thorium Bars = {item:12359} Thorium Bar · Living Blazes = {npc:6521} Living Blaze
	["Two Thorium Bars in the bags (a miner, or the auction house). Ride west from Gadgetzan into {zone:1449} and climb Fire Plume Ridge in its middle: use the {item:14644} by the lava lake at the top. The Living Blazes up there are 54-55."] = "Deux barres de thorium dans les sacs (un mineur, ou l'hôtel des ventes). Partir à l'ouest de Gadgetzan vers le {zone:1449} et grimper sur la Crête de la Fournaise en son centre : utiliser le {item:14644} près du lac de lave au sommet. Les Brasiers vivants là-haut sont de niveau 54-55.",

	-- Step 141: Chillwind Camp: Alchemist Arbington
	-- {npc:11056} Alchemist Arbington
	["Chillwind Camp: {npc:11056}"] = "Camp du Noroît : {npc:11056}",
	-- {npc:1852} Araj the Summoner
	["Back to Chillwind Camp the long way. {npc:1852}, the next task, is a level 61 elite in Andorhal: the whole group goes."] = "Retour au camp du Noroît par le long trajet. {npc:1852}, la tâche suivante, est un élite de niveau 61 à Andorhal : tout le groupe y va.",

	-- Step 142: Andorhal: Araj the Summoner
	-- {npc:1852} Araj the Summoner
	["Andorhal: {npc:1852}"] = "Andorhal : {npc:1852}",
	-- {npc:1852} Araj the Summoner
	["Andorhal, the ruined city north of the camp: {npc:1852} (elite 61) stands in the middle of the town with his skeletons. Kill him, then click his phylactery for the scarab."] = "Andorhal, la ville en ruine au nord du camp : {npc:1852} (élite 61) se tient au milieu de la ville avec ses squelettes. Le tuer, puis cliquer sur son phylactère pour le scarabée.",

	-- Step 143: Chillwind Camp: the Skeleton Key
	-- {item:13704} Skeleton Key
	["Chillwind Camp: the {item:13704}"] = "Camp du Noroît : la {item:13704}",
	-- {item:13704} Skeleton Key
	["The {item:13704}"] = "La {item:13704}",

	-- Step 144: Chillwind Camp: Weldon Barov
	-- {npc:11023} Weldon Barov
	["Chillwind Camp: {npc:11023}"] = "Camp du Noroît : {npc:11023}",
	-- {npc:1855} Tirion Fordring · {npc:11023} Weldon Barov
	["To Chillwind Camp: the flight from Light's Hope Chapel, or the road south from {npc:1855}'s hut. {npc:11023} stands in the camp: his family's fortune is four deeds, all in Scholomance."] = "Jusqu'au Camp du Noroît : le vol depuis la chapelle de l'Espoir de Lumière, ou la route vers le sud depuis la cabane de {npc:1855}. {npc:11023} se tient dans le camp : la fortune de sa famille, ce sont quatre titres de propriété, tous dans la Scholomance.",

	-- Step 145: Caer Darrow: Eva Sarkhoff
	-- {npc:11216} Eva Sarkhoff
	["Caer Darrow: {npc:11216}"] = "Caer Darrow : {npc:11216}",
	-- {npc:11216} Eva Sarkhoff
	["Ride east to the lake and onto Caer Darrow. {npc:11216}, a ghost, stands with Lucien before the door of Scholomance."] = "Partir vers l'est jusqu'au lac et à Caer Darrow. {npc:11216}, un fantôme, se tient avec Lucien devant la porte de la Scholomance.",

	-- Step 146: Scholomance: before going in
	["Scholomance: before going in"] = "Scholomance : avant d'entrer",
	-- {item:13704} Skeleton Key · {object:179746} Great Ossuary · {npc:11622} Rattlegore · {item:13873} Viewing Room Key · {npc:10508} Ras Frostwhisper · {npc:1853} Darkmaster Gandling · {npc:10503} Jandice Barov · {object:175564} Brazier of the Herald
	["The {item:13704} opens the door: the player who has it goes first. Inside: the Reliquary, the Chamber of Summoning, the {object:179746} ({npc:11622} and the {item:13873}), the Viewing Room, the Laboratory ({npc:10508}), then the six chambers round the Barov Family Vault and {npc:1853}. Leave {npc:10503} and the {object:175564} alone: Eva's chain sends you to them once Krastinov is dead, in the same instance."] = "La {item:13704} ouvre la porte : le joueur qui l'a passe le premier. À l'intérieur : le Reliquaire (Reliquary), la Chambre d'invocation (Chamber of Summoning), {object:179746} ({npc:11622} et la {item:13873}), la Salle d'observation (Viewing Room), le Laboratoire ({npc:10508}), puis les six salles autour du caveau de la famille Barov (Barov Family Vault) et {npc:1853}. Laisser {npc:10503} et {object:175564} de côté : la chaîne d'Eva y envoie une fois Krastinov mort, dans la même instance.",
	-- {quest:5343} Barov Family Fortune · {npc:11023} Weldon Barov · {quest:5382} Doctor Theolen Krastinov, the Butcher · {npc:11216} Eva Sarkhoff · {quest:5529} Plagued Hatchlings · {npc:11035} Betina Bigglezink · {item:12368} Dawn's Gambit
	["In the quest log: {quest:5343} ({npc:11023}), {quest:5382} ({npc:11216}), {quest:5529} ({npc:11035}). Share the three with your group: click each in the quest log, then Share. Not on this route: {item:12368}, the dungeon set quests, the class quests."] = "Dans le journal de quêtes : {quest:5343} ({npc:11023}), {quest:5382} ({npc:11216}), {quest:5529} ({npc:11035}). Partager les trois avec le groupe : cliquer sur chacune dans le journal de quêtes, puis sur Partager. Pas sur ce parcours : {item:12368}, les quêtes d'ensembles de donjon, les quêtes de classe.",
	["Scholomance"] = "Scholomance",

	-- Step 147: The Reliquary and the Chamber of Summoning
	["The Reliquary and the Chamber of Summoning"] = "Le Reliquaire et la Chambre d'invocation",
	-- {object:176486} Deed to Southshore · {object:176487} Deed to Tarren Mill
	["The Reliquary, the first great hall: the {object:176486} lies on a table in its back left corner, seen from the entrance. Then the Chamber of Summoning, and the great room after it: the {object:176487} lies on a table in its far corner, opposite the way in. Each player clicks the deeds for their own quest (to check in game)."] = "Le Reliquaire (Reliquary), la première grande salle : {object:176486} est posé sur une table dans son coin du fond à gauche, vu de l'entrée. Puis la Chambre d'invocation (Chamber of Summoning) et la grande salle qui la suit : {object:176487} est posé sur une table dans son coin opposé à l'entrée. Chaque joueur clique sur les titres pour sa propre quête (à vérifier en jeu).",
	-- {item:13450} The Deed to Southshore
	["{item:13450}: the Reliquary"] = "{item:13450} : le Reliquaire",
	-- {item:13451} The Deed to Tarren Mill
	["{item:13451}: past the Chamber of Summoning"] = "{item:13451} : après la Chambre d'invocation",

	-- Step 148: Great Ossuary: the hatchlings and Rattlegore
	-- {object:179746} Great Ossuary · {npc:11622} Rattlegore
	["{object:179746}: the hatchlings and {npc:11622}"] = "{object:179746} : les dragonnets et {npc:11622}",
	-- {object:179746} Great Ossuary · {item:13920} Healthy Dragon Scale · {npc:11035} Betina Bigglezink · {npc:10503} Jandice Barov · {npc:11622} Rattlegore · {item:13873} Viewing Room Key
	["The plagued hatchlings, dragon whelps, fill a room of the {object:179746}: a little more than twenty. A rare one drops a {item:13920}: keep it for {npc:11035}. {npc:10503} waits below their room, behind a torch on the south wall: leave her for now. {npc:11622} (elite 61), in the basement of the Ossuary, drops the {item:13873}, which opens the rest of the school."] = "Les dragonnets pestiférés (Plagued Hatchling) remplissent une salle de {object:179746} : un peu plus de vingt. Un rare donne une {item:13920} : la garder pour {npc:11035}. {npc:10503} attend sous leur salle, derrière une torche du mur sud : la laisser pour l'instant. {npc:11622} (élite 61), au sous-sol de l'ossuaire, donne la {item:13873}, qui ouvre le reste de l'école.",
	-- {item:13920} Healthy Dragon Scale
	["{item:13920}: keep it"] = "{item:13920} : la garder",

	-- Step 149: The Viewing Room and the Laboratory
	["The Viewing Room and the Laboratory"] = "La Salle d'observation et le Laboratoire",
	-- {npc:10433} Marduk Blackpool · {item:12368} Dawn's Gambit · {npc:10508} Ras Frostwhisper · {item:13471} The Deed to Brill
	["The Viewing Room: Vectus and {npc:10433} stand among neutral students and fight only for {item:12368}: leave them. Then the Laboratory: {npc:10508} (elite 62), a lich who fears and knocks back. {item:13471} lies by the west wall of the Laboratory, at the back, past the alchemy lab."] = "La Salle d'observation (Viewing Room) : Vectus et {npc:10433} se tiennent parmi des élèves neutres et ne se battent que pour {item:12368} : les laisser. Puis le Laboratoire (Laboratory) : {npc:10508} (élite 62), une liche qui effraie et repousse. {item:13471} est près du mur ouest du Laboratoire, au fond, après le laboratoire d'alchimie.",
	-- {item:13471} The Deed to Brill
	["{item:13471}: the Laboratory"] = "{item:13471} : le Laboratoire",

	-- Step 150: The Barov Family Vault: the six chambers
	["The Barov Family Vault: the six chambers"] = "Le caveau des Barov : les six salles",
	-- {npc:10502} Lady Illucia Barov · {npc:10504} Lord Alexei Barov · {object:176485} Deed to Caer Darrow · {npc:10507} The Ravenian · {npc:10901} Lorekeeper Polkelt · {npc:11261} Doctor Theolen Krastinov · {npc:10505} Instructor Malicia · {object:176544} Remains of Eva Sarkhoff · {npc:11217} Lucien Sarkhoff · {npc:1853} Darkmaster Gandling
	["The last hall: six chambers round the Barov Family Vault. Below, from the left: {npc:10502}, {npc:10504} (the {object:176485} lies on a slab beside him), {npc:10507}. Above, from the left: {npc:10901}, {npc:11261} (he enrages at half health: burn him fast), {npc:10505}. In Krastinov's chamber, burn the {object:176544} and of {npc:11217}, one on each side. {npc:1853} comes into the vault once the six are dead; he sends players into the side chambers."] = "La dernière salle : six chambres autour du caveau de la famille Barov (Barov Family Vault). En bas, depuis la gauche : {npc:10502}, {npc:10504} ({object:176485} est posé sur une dalle à côté de lui), {npc:10507}. En haut, depuis la gauche : {npc:10901}, {npc:11261} (il s'enrage à la moitié de sa vie : le tuer vite), {npc:10505}. Dans la salle de Krastinov, brûler {object:176544} et les restes de {npc:11217}, un de chaque côté. {npc:1853} entre dans le caveau une fois les six morts ; il envoie des joueurs dans les salles du tour.",
	-- {item:13448} The Deed to Caer Darrow · {npc:10504} Lord Alexei Barov
	["{item:13448}: beside {npc:10504}"] = "{item:13448} : à côté de {npc:10504}",

	-- Step 151: Caer Darrow: Eva Sarkhoff
	-- {npc:10503} Jandice Barov
	["Walk back out of Scholomance, without resetting the instance: Eva stands at the door. Her next quest is {npc:10503}'s, near the entrance."] = "Ressortir de la Scholomance à pied, sans réinitialiser l'instance : Eva se tient à la porte. Sa quête suivante est celle de {npc:10503}, près de l'entrée.",

	-- Step 152: Scholomance: Jandice Barov
	-- {npc:10503} Jandice Barov
	["Scholomance: {npc:10503}"] = "Scholomance : {npc:10503}",
	-- {npc:10503} Jandice Barov · {quest:5515} Krastinov's Bag of Horrors
	["Back into the same instance, through the cleared halls to the hatchlings' room: the torch on its south wall opens the way down to {npc:10503} (elite 61). She splits into illusions: mark her. Her corpse holds {quest:5515}."] = "Retour dans la même instance, par les salles déjà nettoyées, jusqu'à la salle des dragonnets : la torche de son mur sud ouvre le passage vers {npc:10503} (élite 61). Elle se dédouble en illusions : la marquer. Son corps porte {quest:5515}.",

	-- Step 153: Caer Darrow: Eva Sarkhoff
	-- {quest:5384} Kirtonos the Herald · {item:13523} Blood of Innocents · {npc:14861} Blood Steward of Kirtonos
	["Out to Eva again. {quest:5384}: she hands over the {item:13523} (Warcraft Tavern also has the {npc:14861} drop it: to check in game)."] = "Ressortir voir Eva. {quest:5384} : elle donne le {item:13523} (d'après Warcraft Tavern, le {npc:14861} le donne aussi : à vérifier en jeu).",

	-- Step 154: Scholomance: Kirtonos the Herald
	-- {quest:5384} Kirtonos the Herald
	["Scholomance: {quest:5384}"] = "Scholomance : {quest:5384}",
	-- {object:175564} Brazier of the Herald · {item:13523} Blood of Innocents · {quest:5384} Kirtonos the Herald
	["Back in, to the balcony on the north side of the Chamber of Summoning: use the {object:175564} by the railing, with the {item:13523} in your bags. {quest:5384} (elite 60) flies in, and turns from gargoyle to man during the fight, cursing in that form."] = "Retour à l'intérieur, jusqu'au balcon du côté nord de la Chambre d'invocation : utiliser {object:175564}, près de la rambarde, avec le {item:13523} dans les sacs. {quest:5384} (élite 60) arrive en volant, et passe de gargouille à homme pendant le combat, avec des malédictions sous cette forme.",

	-- Step 155: Caer Darrow: Eva Sarkhoff
	-- {item:13544} Spectral Essence · {npc:11286} Magistrate Marduke · {npc:10508} Ras Frostwhisper · {zone:1417} Arathi Highlands · {object:176631} Menethil's Gift
	["The rewards include the {item:13544}: worn, it shows {npc:11286}, beside Eva. His chain against {npc:10508} goes to Stromgarde in the {zone:1417}, then Light's Hope Chapel, Stratholme ({object:176631}, before the Baron) and back to Scholomance: not in this guide."] = "Les récompenses comprennent l'{item:13544} : portée, elle fait voir {npc:11286}, à côté d'Eva. Sa chaîne contre {npc:10508} passe par Stromgarde dans les {zone:1417}, puis la chapelle de l'Espoir de Lumière, Stratholme ({object:176631}, devant le baron) et revient à la Scholomance : pas dans ce guide.",

	-- Step 156: Chillwind Camp: Weldon Barov
	-- {npc:11023} Weldon Barov
	["Ride back west to Chillwind Camp. {npc:11023}'s next quest, The Last Barov, is in Horde lands: not in this guide."] = "Revenir vers l'ouest jusqu'au Camp du Noroît. La quête suivante de {npc:11023}, The Last Barov, est en terres de la Horde : pas dans ce guide.",

	-- Step 157: Light's Hope Chapel: Betina Bigglezink
	-- {quest:5529} Plagued Hatchlings · {quest:5582} Healthy Dragon Scale · {npc:11035} Betina Bigglezink
	["{quest:5529}: the flight from Chillwind Camp to Light's Hope Chapel. A {quest:5582} in the bags? Once {quest:5529} is handed in, right-click it: its quest goes back to {npc:11035} at once."] = "{quest:5529} : le vol du Camp du Noroît jusqu'à la chapelle de l'Espoir de Lumière. Une {quest:5582} dans les sacs ? Une fois {quest:5529} rendue, clic droit dessus : sa quête se rend à {npc:11035} tout de suite.",
	-- {quest:5582} Healthy Dragon Scale
	["{quest:5582}, if one dropped"] = "{quest:5582}, si elle est tombée",

	-- Step 158: Scholomance: quests not done
	["Scholomance: quests not done"] = "Scholomance : quêtes non finies",
	["What is left of Scholomance in the quest log is for another run: keep it for one, or drop it to free the log."] = "Ce qui reste de la Scholomance dans le journal de quêtes est pour une autre fois : le garder pour une autre visite, ou l'abandonner pour libérer le journal.",
}
