-- French (frFR): the guide groupe-alliance/33-donjons-fin (guides/33-donjons-fin.guide).
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
	["Chillwind Camp flight master"] = "Maître de vol du Camp du Noroît",

	-- Step 2: Ironforge: King Magni Bronzebeard
	-- {object:171709} High Seat · {npc:8879} Royal Historian Archesonus · {quest:3701} The Smoldering Ruins of Thaurissan · {npc:9021} Kharan Mighthammer
	["Magni stands in the {object:171709}, beside {npc:8879}, who took {quest:3701} in Group 29. {npc:9021} is a prisoner in Blackrock Depths."] = "Magni est dans {object:171709}, à côté de {npc:8879}, qui a pris {quest:3701} au Groupe 29. {npc:9021} est prisonnier dans les Profondeurs de Rochenoire.",

	-- Step 3: Kharanos: Ragnar Thunderbrew
	-- {npc:1267} Ragnar Thunderbrew
	["Kharanos: {npc:1267}"] = "Kharanos : {npc:1267}",
	-- {zone:1455} Ironforge · {npc:1267} Ragnar Thunderbrew
	["Ride out of {zone:1455} down to Kharanos: {npc:1267} is in the Thunderbrew Distillery. His lost recipe is in the Grim Guzzler, the tavern of Blackrock Depths (third visit)."] = "Sortir de {zone:1455} et descendre jusqu'à Kharanos : {npc:1267} est dans la distillerie Tonnebière (Thunderbrew Distillery). Sa recette perdue est dans la taverne des Profondeurs de Rochenoire (Grim Guzzler, troisième visite).",

	-- Step 4: Fly to Morgan's Vigil
	["Fly to Morgan's Vigil"] = "Voler jusqu'à la Veille de Morgan",
	-- {zone:1455} Ironforge
	["{zone:1455} flight master"] = "Maître de vol de {zone:1455}",

	-- Step 5: Morgan's Vigil
	["Morgan's Vigil"] = "Veille de Morgan",
	-- {npc:9177} Oralius · {npc:9561} Jalinda Sprig · {npc:9562} Helendis Riverhorn · {npc:9560} Marshal Maxwell · {quest:4262} Overmaster Pyron
	["{npc:9177}, {npc:9561}, {npc:9562} and {npc:9560} stand in the camp. {quest:4262} is outside the dungeon, on the way in; Incendius, inside, comes after him."] = "{npc:9177}, {npc:9561}, {npc:9562} et {npc:9560} se tiennent dans le camp. {quest:4262} se fait hors du donjon, sur le chemin ; Incendius, dedans, vient après.",
	-- {npc:9177} Oralius
	["{npc:9177}: the fanny packs drop all through the dungeon"] = "{npc:9177} : les sacoches tombent dans tout le donjon",

	-- Step 6: Morgan's Vigil: Helendis Riverhorn
	-- {npc:9562} Helendis Riverhorn
	["Morgan's Vigil: {npc:9562}"] = "Veille de Morgan : {npc:9562}",
	-- {npc:9562} Helendis Riverhorn · {quest:4182} Dragonkin Menace · {quest:4241} Marshal Windsor · {zone:1453} Stormwind
	["{npc:9562}'s chain ({quest:4182} done in Group 25) leads to {quest:4241}, a prisoner in Blackrock Depths: first a round trip to Lakeshire and {zone:1453}, by flight."] = "La chaîne de {npc:9562} ({quest:4182} faite au Groupe 25) mène à {quest:4241}, prisonnier dans les Profondeurs de Rochenoire : d'abord un aller-retour à Comté-du-Lac et à {zone:1453}, en vol.",

	-- Step 7: Morgan's Vigil: Dragonkin Menace
	-- {quest:4182} Dragonkin Menace
	["Morgan's Vigil: {quest:4182}"] = "Veille de Morgan : {quest:4182}",
	-- {quest:4241} Marshal Windsor · {npc:9562} Helendis Riverhorn · {quest:4182} Dragonkin Menace
	["{quest:4241}'s chain starts with {npc:9562}'s {quest:4182} (offered in Group 25): the black dragonkin of the hills east of Flame Crest and of the eastern edge of the Steppes, elite at around 52."] = "La chaîne de {quest:4241} commence par {quest:4182}, de {npc:9562} (proposée au Groupe 25) : les draconiens noirs des collines à l'est de la Corniche des flammes et du bord est des Steppes, élites vers le niveau 52.",

	-- Step 8: The black dragonkin
	["The black dragonkin"] = "Les draconiens noirs",
	-- plural, as words: Black Drakes = {npc:7044} Black Drake
	["Ride north-east from the Vigil into the hills: Broodlings, Dragonspawn and Wyrmkin in packs, the three Black Drakes apart, one in the northern hills and two further south."] = "Partir au nord-est de la Veille, dans les collines : Broodlings, Dragonspawn et Wyrmkin en groupes, les trois Black Drakes à part, l'un dans les collines du nord, les deux autres plus au sud.",

	-- Step 10: Fly to Lakeshire
	["Fly to Lakeshire"] = "Envolez-vous vers Comté-du-Lac",
	["Morgan's Vigil flight master"] = "Maître de vol de la Veille de Morgan",

	-- Step 11: Lakeshire: Magistrate Solomon
	-- {npc:344} Magistrate Solomon
	["Lakeshire: {npc:344}"] = "Comté-du-Lac : {npc:344}",
	["Solomon is in the town hall of Lakeshire."] = "Solomon est dans l'hôtel de ville de Comté-du-Lac.",

	-- Step 12: Fly to Stormwind
	-- {zone:1453} Stormwind
	["Fly to {zone:1453}"] = "Volez jusqu'à {zone:1453}",
	["Lakeshire flight master"] = "Maître de vol de Comté-du-Lac",

	-- Step 13: Stormwind Keep: Bolvar and Lady Prestor
	-- {object:2117} Stormwind Keep
	["{object:2117}: Bolvar and Lady Prestor"] = "{object:2117} : Bolvar et Lady Prestor",
	-- {npc:1748} Highlord Bolvar Fordragon · {object:2117} Stormwind Keep · {npc:1749} Lady Katrana Prestor
	["{npc:1748} is in the throne room at the back of {object:2117}, {npc:1749} at his side: speak with her, then with him again."] = "{npc:1748} est dans la salle du trône, au fond de {object:2117}, {npc:1749} à ses côtés : lui parler, puis reparler à Bolvar.",
	-- {npc:1749} Lady Katrana Prestor
	["{npc:1749}: speak with her"] = "{npc:1749} : lui parler",

	-- Step 14: Fly to Lakeshire
	-- {zone:1453} Stormwind
	["{zone:1453} flight master"] = "Maître de vol de {zone:1453}",

	-- Step 17: Morgan's Vigil: Marshal Maxwell
	-- {npc:9560} Marshal Maxwell
	["Morgan's Vigil: {npc:9560}"] = "Veille de Morgan : {npc:9560}",
	-- {npc:9563} Ragged John
	["Maxwell sends you to {npc:9563}, at Flame Crest: the guide goes there next."] = "Maxwell envoie voir {npc:9563}, à la Corniche des flammes : le guide y va ensuite.",

	-- Step 18: Flame Crest
	["Flame Crest"] = "Corniche des flammes",
	-- {npc:9563} Ragged John · {npc:9536} Maxwort Uberglint · {npc:9544} Yuka Screwspigot
	["Ride north along the road, then climb to the goblin camp on Flame Crest. {npc:9563} tells his story in the camp; {npc:9536} and {npc:9544} give one quest each for the dungeon."] = "Suivre la route vers le nord, puis monter jusqu'au camp gobelin de la Corniche des flammes. {npc:9563} raconte son histoire dans le camp ; {npc:9536} et {npc:9544} donnent chacun une quête pour le donjon.",
	-- {npc:9563} Ragged John
	["{npc:9563}: speak with him, to the end of his story"] = "{npc:9563} : lui parler, jusqu'au bout de son histoire",

	-- Step 19: Cyrus Therepentous: the Frenzied Black Drake
	-- {npc:9459} Cyrus Therepentous · {npc:9461} Frenzied Black Drake
	["{npc:9459}: the {npc:9461}"] = "{npc:9459} : le {npc:9461}",
	-- {quest:4022} A Taste of Flame · {npc:9459} Cyrus Therepentous · {npc:9461} Frenzied Black Drake
	["{quest:4022}, first part (offered in Group 25): {npc:9459} hides in a cave in the far east of the Steppes. The {npc:9461} (elite 54) appears outside it and drops the molt."] = "{quest:4022}, première partie (proposée au Groupe 25) : {npc:9459} se cache dans une grotte à l'extrême est des Steppes. Le {npc:9461} (élite 54) apparaît devant et donne la mue.",

	-- Step 20: Cyrus Therepentous
	-- {npc:9459} Cyrus Therepentous · {item:11231} Altered Black Dragonflight Molt · {npc:9016} Bael'Gar
	["{npc:9459} hands over an {item:11231} with the quest: it goes on {npc:9016}'s remains, in the dungeon (second visit)."] = "{npc:9459} remet un {item:11231} avec la quête : il sert sur les restes de {npc:9016}, dans le donjon (deuxième visite).",

	-- Step 21: Morgan's Vigil: Marshal Maxwell
	-- {quest:4241} Marshal Windsor
	["Ride back south to the Vigil: Maxwell now sends you after {quest:4241}, in the dungeon's prison."] = "Revenir au sud jusqu'à la Veille : Maxwell envoie maintenant chercher {quest:4241}, dans la prison du donjon.",

	-- Step 22: Blackrock Mountain: Overmaster Pyron
	-- {quest:4262} Overmaster Pyron
	["Blackrock Mountain: {quest:4262}"] = "Mont Rochenoire : {quest:4262}",
	-- {quest:4262} Overmaster Pyron
	["Ride west along the road, past Blackrock Stronghold, into Blackrock Mountain. Inside, cross the great chain to the hanging building in the middle (Forgewright's Tomb), go down through it, then down the next chain to the Grinding Quarry: {quest:4262} (elite 52) walks there. The dungeon's door is past the quarry, on the left, at the far end of the Masonry."] = "Suivre la route vers l'ouest, passer le bastion de Rochenoire et entrer dans le Mont Rochenoire. Dedans, traverser la grande chaîne jusqu'au bâtiment suspendu du milieu (Forgewright's Tomb), descendre à travers, puis descendre la chaîne suivante jusqu'à la carrière (Grinding Quarry) : {quest:4262} (élite 52) y circule. La porte du donjon est après la carrière, sur la gauche, au fond de la maçonnerie (Masonry).",
	["Blackrock Mountain"] = "Mont Rochenoire",
	-- {quest:4262} Overmaster Pyron
	["{quest:4262}: the Grinding Quarry, before the dungeon's door"] = "{quest:4262} : la carrière (Grinding Quarry), avant la porte du donjon",

	-- Step 23: Franclorn Forgewright (one player is enough)
	-- {npc:8888} Franclorn Forgewright
	["{npc:8888} (one player is enough)"] = "{npc:8888} (un joueur suffit)",
	-- {item:11000} Shadowforge Key · {object:161460} Shadowforge Lock · {npc:8888} Franclorn Forgewright
	-- plural, as words: Shadowforge Gates = {object:170559} Shadowforge Gate
	["The {item:11000} opens the doors of the second and third visits (the Shadowforge Gates of the prison and the {object:161460}): one key in the group is enough. {npc:8888}'s ghost stands on his tomb in the hanging building, and only the dead see him. Whoever will carry the key: take off your gear (no repair bill), die in the lava under the chains, release, run back as a ghost from the graveyard and speak with {npc:8888}, then come back to life at your body or by a group mate's spell. To check in game."] = "La {item:11000} ouvre les portes des deuxième et troisième visites (les portes d'Ombreforge de la prison et {object:161460}) : une clé dans le groupe suffit. Le fantôme de {npc:8888} se tient sur son tombeau, dans le bâtiment suspendu, et seuls les morts le voient. Celui qui portera la clé : retirer son équipement (pas de frais de réparation), mourir dans la lave sous les chaînes, libérer son esprit, revenir en fantôme depuis le cimetière et parler à {npc:8888}, puis revenir à la vie près de son corps ou par le sort d'un équipier. À vérifier en jeu.",
	-- {npc:8888} Franclorn Forgewright
	["{npc:8888}, as a ghost"] = "{npc:8888}, en fantôme",

	-- Step 24: Blackrock Depths: along the way
	["Blackrock Depths: along the way"] = "Profondeurs de Rochenoire : en chemin",
	-- {quest:4123} The Heart of the Mountain
	-- plural, as words: Dark Iron Fanny Packs = {item:11468} Dark Iron Fanny Pack · Relic Coffer Keys = {item:11078} Relic Coffer Key
	["Collected all through the dungeon: the Dark Iron Fanny Packs, on the Anvilrage and Shadowforge dwarves (most of them carry one). The Relic Coffer Keys drop from the same dwarves, about one in eight, only for those on {quest:4123}: 12 keys open the 12 doors of the Black Vault (first visit), whoever carries them."] = "À ramasser dans tout le donjon : les sacoches Sombrefer (Dark Iron Fanny Packs), sur les nains Anvilrage et Shadowforge (la plupart en portent une). Les clés de coffre à reliques (Relic Coffer Keys) tombent des mêmes nains, environ une sur huit, seulement pour qui a {quest:4123} : 12 clés ouvrent les 12 portes de la chambre forte (Black Vault, première visite), quel que soit le joueur qui les porte.",
	-- {quest:4286} The Good Stuff · {quest:4123} The Heart of the Mountain · {quest:4126} Hurley Blackbreath
	["Share {quest:4286}, {quest:4123} and {quest:4126} with your group: click each in the quest log, then Share. The others cannot be shared."] = "Partager {quest:4286}, {quest:4123} et {quest:4126} avec le groupe : cliquer sur chacune dans le journal de quêtes, puis sur Partager. Les autres ne se partagent pas.",

	-- Step 25: Blackrock Depths, first visit: before going in
	["Blackrock Depths, first visit: before going in"] = "Profondeurs de Rochenoire, première visite : avant d'entrer",
	["First visit, no key needed: the Detention Block (the prison), the Ring of the Law, the Shrine of Thaurissan, the Black Vault and the Hall of Crafting. Bosses 51 to 56: 54 or more advised."] = "Première visite, sans clé : la prison (Detention Block), l'arène (Ring of the Law), le sanctuaire de Thaurissan (Shrine of Thaurissan), la chambre forte (Black Vault) et la salle des artisans (Hall of Crafting). Boss 51 à 56 : niveau 54 ou plus conseillé.",
	-- {quest:4341} Kharan Mighthammer · {quest:4241} Marshal Windsor · {quest:4286} The Good Stuff · {npc:9177} Oralius · {quest:4123} The Heart of the Mountain · {npc:9536} Maxwort Uberglint · {quest:3801} Dark Iron Legacy · {npc:8888} Franclorn Forgewright · {quest:4022} A Taste of Flame · {npc:9459} Cyrus Therepentous · {quest:4136} Ribbly Screwspigot · {npc:9544} Yuka Screwspigot · {quest:4126} Hurley Blackbreath · {npc:1267} Ragnar Thunderbrew · {npc:9500} Mistress Nagmara · {object:164869} Spectral Chalice · {npc:14387} Lothos Riftwaker
	["In the quest log: {quest:4341} (King Magni), {quest:4241} (Maxwell), {quest:4286} ({npc:9177}), {quest:4123} ({npc:9536}), {quest:3801} ({npc:8888}, if taken). For the next visits: {quest:4022} ({npc:9459}), {quest:4136} ({npc:9544}), {quest:4126} ({npc:1267}). Not on this route: {npc:9500}'s quest in the tavern (its herbs and silver are gathered outside), the {object:164869}'s (miners), {npc:14387}'s Attunement to the Core (raid)."] = "Dans le journal de quêtes : {quest:4341} (le roi Magni), {quest:4241} (Maxwell), {quest:4286} ({npc:9177}), {quest:4123} ({npc:9536}), {quest:3801} ({npc:8888}, si prise). Pour les visites suivantes : {quest:4022} ({npc:9459}), {quest:4136} ({npc:9544}), {quest:4126} ({npc:1267}). Pas sur ce parcours : la quête de {npc:9500} dans la taverne (ses herbes et son argent se récoltent dehors), celle de {object:164869} (mineurs), Attunement to the Core de {npc:14387} (raid).",
	["Blackrock Depths"] = "Profondeurs de Rochenoire",

	-- Step 26: Detention Block: Kharan Mighthammer and Windsor
	-- {npc:9021} Kharan Mighthammer
	["Detention Block: {npc:9021} and Windsor"] = "Prison : {npc:9021} et Windsor",
	-- {npc:9018} High Interrogator Gerstahn · {item:11140} Prison Cell Key · {quest:4341} Kharan Mighthammer · {quest:4241} Marshal Windsor · {npc:9021} Kharan Mighthammer · {npc:9025} Lord Roccor · {npc:9319} Houndmaster Grebmar
	["The Detention Block opens past the entrance. {npc:9018}, in the southernmost room, drops the {item:11140}, which opens the cells (a rogue can pick them instead). {quest:4341} and {quest:4241} are locked in the cells of the south-east corridor: listen to {npc:9021}'s whole story; Windsor has given up, and his news goes back to Maxwell. {npc:9025} patrols the northern ring, {npc:9319} waits at its lowest point. To check in game: which cell holds whom."] = "La prison (Detention Block) s'ouvre après l'entrée. {npc:9018}, dans la salle la plus au sud, donne la {item:11140}, qui ouvre les cellules (un voleur peut les crocheter). {quest:4341} et {quest:4241} sont enfermés dans les cellules du couloir sud-est : écouter toute l'histoire de {npc:9021} ; Windsor a perdu espoir, et ses nouvelles repartent chez Maxwell. {npc:9025} patrouille dans l'anneau nord, {npc:9319} attend à son point le plus bas. À vérifier en jeu : quelle cellule pour qui.",
	-- {quest:4341} Kharan Mighthammer
	["{quest:4341}: listen to his whole story"] = "{quest:4341} : écouter toute son histoire",
	["For King Magni"] = "Pour le roi Magni",
	-- {npc:9560} Marshal Maxwell
	["For {npc:9560}"] = "Pour {npc:9560}",

	-- Step 27: Ring of the Law and the Shrine of Thaurissan
	["Ring of the Law and the Shrine of Thaurissan"] = "L'arène et le sanctuaire de Thaurissan",
	-- {npc:9024} Pyromancer Loregrain · {object:164689} Monument of Franclorn Forgewright
	-- plural, as words: Arena Spectators = {npc:8916} Arena Spectator
	["The open gate on the east side of the Detention Block leads into the Ring of the Law: the gate closes behind you, two waves of beasts come, then a random boss. Once it is down, a second gate opens into the East Garrison. From there, climb the stairs beside the arena gate and walk round the stands, close to the inner railing (the Arena Spectators come at you when you pass too near), to the Shrine of Thaurissan: {npc:9024} kneels before the {object:164689}."] = "La grille ouverte du côté est de la prison mène dans l'arène (Ring of the Law) : la grille se ferme derrière le groupe, deux vagues de bêtes arrivent, puis un boss au hasard. Une fois celui-ci tombé, une deuxième grille s'ouvre sur la garnison est (East Garrison). De là, monter l'escalier à côté de la grille de l'arène et faire le tour des gradins, au ras de la rambarde intérieure (les spectateurs, Arena Spectators, attaquent quand on passe trop près), jusqu'au sanctuaire de Thaurissan (Shrine of Thaurissan) : {npc:9024} est agenouillé devant {object:164689}.",

	-- Step 28: The Domicile and the Black Vault
	["The Domicile and the Black Vault"] = "Les logis et la chambre forte",
	-- {npc:9041} Warder Stilgiss · {object:160836} Relic Coffer · {npc:9476} Watchman Doomgrip · {object:161495} Secret Safe · {object:160845} Dark Coffer · {object:165554} Heart of the Mountain
	-- plural, as words: Relic Coffer Keys = {item:11078} Relic Coffer Key · Warbringer Constructs = {npc:8905} Warbringer Construct
	["From the Shrine, the bridge leads into the Domicile, then to the upper balcony of the Hall of Crafting, which opens on the Black Vault: {npc:9041} and Verek (elite 56 and 55). With 12 Relic Coffer Keys, open the 12 {object:160836} doors; after the last one, the Warbringer Constructs wake, then {npc:9476} comes. The {object:161495} under the {object:160845} then holds the {object:165554}. Fewer than 12 keys? Leave it: the guide does not come back to the vault."] = "Depuis le sanctuaire, le pont mène aux logis (The Domicile), puis au balcon du haut de la salle des artisans (Hall of Crafting), qui donne sur la chambre forte (Black Vault) : {npc:9041} et Verek (élites 56 et 55). Avec 12 clés de coffre à reliques, ouvrir les 12 portes de {object:160836} ; après la dernière, les Warbringer Constructs se réveillent, puis {npc:9476} arrive. {object:161495}, sous {object:160845}, contient alors {object:165554}. Moins de 12 clés ? Laisser tomber : le guide ne revient pas à la chambre forte.",
	-- {quest:4123} The Heart of the Mountain · {object:161495} Secret Safe
	["{quest:4123}: the {object:161495}"] = "{quest:4123} : {object:161495}",

	-- Step 29: Hall of Crafting: Fineous Darkvire
	-- {npc:9056} Fineous Darkvire
	["Hall of Crafting: {npc:9056}"] = "Salle des artisans : {npc:9056}",
	-- {npc:9056} Fineous Darkvire · {item:10999} Ironfel · {quest:3802} Dark Iron Legacy
	["{npc:9056} (elite 54) walks up and down the winding ramp of the Hall of Crafting: clear the ramp first, interrupt his Holy Light. He drops {item:10999} for every player on {quest:3802}."] = "{npc:9056} (élite 54) monte et descend la rampe en spirale de la salle des artisans (Hall of Crafting) : nettoyer la rampe d'abord, interrompre sa Lumière sacrée. Il donne {item:10999} à chaque joueur qui a {quest:3802}.",

	-- Step 30: Shrine of Thaurissan: the monument
	["Shrine of Thaurissan: the monument"] = "Sanctuaire de Thaurissan : le monument",
	-- {item:10999} Ironfel · {object:164689} Monument of Franclorn Forgewright · {item:11000} Shadowforge Key
	["Back up through the Domicile to the Shrine: place {item:10999} on the {object:164689}. The {item:11000} is the reward. Then walk out the way you came: round the stands, through the Ring of the Law (its gates stay open) and the Detention Block."] = "Remonter par les logis jusqu'au sanctuaire : poser {item:10999} sur {object:164689}. La {item:11000} est la récompense. Puis ressortir par où le groupe est venu : le tour des gradins, l'arène (ses grilles restent ouvertes) et la prison.",

	-- Step 31: Flame Crest: Maxwort Uberglint
	-- {npc:9536} Maxwort Uberglint
	["Flame Crest: {npc:9536}"] = "Corniche des flammes : {npc:9536}",
	-- {zone:1428} Burning Steppes
	["Out of Blackrock Mountain on the {zone:1428} side, then north-east to Flame Crest."] = "Sortir du Mont Rochenoire du côté de {zone:1428}, puis aller au nord-est jusqu'à la Corniche des flammes.",

	-- Step 32: Morgan's Vigil: Marshal Maxwell
	-- {quest:4242} Abandoned Hope · {quest:4264} A Crumpled Up Note
	["Ride back to Morgan's Vigil. {quest:4242}: Maxwell takes the bad news; pick your reward. From now on, the Anvilrage dwarves of the Detention Block drop {quest:4264} for you (second visit)."] = "Revenir à la Veille de Morgan. {quest:4242} : Maxwell reçoit la mauvaise nouvelle ; choisir sa récompense. Désormais, les nains Anvilrage de la prison peuvent donner {quest:4264} (deuxième visite).",

	-- Step 33: Morgan's Vigil: Jalinda Sprig
	-- {npc:9561} Jalinda Sprig
	["Morgan's Vigil: {npc:9561}"] = "Veille de Morgan : {npc:9561}",
	-- {npc:9017} Lord Incendius
	["{npc:9017}, in the dungeon: second visit"] = "{npc:9017}, dans le donjon : deuxième visite",

	-- Step 34: Morgan's Vigil: Oralius
	-- {npc:9177} Oralius
	["Morgan's Vigil: {npc:9177}"] = "Veille de Morgan : {npc:9177}",

	-- Step 35: Fly to Ironforge
	-- {zone:1455} Ironforge
	["Fly to {zone:1455}"] = "Envolez-vous vers {zone:1455}",

	-- Step 36: Ironforge: King Magni Bronzebeard
	-- {quest:4361} The Bearer of Bad News
	["{quest:4361}: Magni then asks you to save Princess Moira, the Emperor's prisoner at the bottom of the dungeon (third visit)."] = "{quest:4361} : Magni demande ensuite de sauver la princesse Moira, prisonnière de l'empereur au fond du donjon (troisième visite).",

	-- Step 37: Fly to Thorium Point
	["Fly to Thorium Point"] = "Voler jusqu'à la Halte du Thorium",

	-- Step 38: Blackrock Depths, second visit: before going in
	["Blackrock Depths, second visit: before going in"] = "Profondeurs de Rochenoire, deuxième visite : avant d'entrer",
	-- {item:11000} Shadowforge Key · {npc:9016} Bael'Gar · {quest:4322} Jail Break! · {zone:1427} Searing Gorge
	["Second visit, with the {item:11000}: Windsor's note, the Dark Iron Highway ({npc:9016}), Shadowforge City (Incendius), the West Garrison (Angerforge), the Manufactory (Argelmach), then {quest:4322} from Windsor's cell. Bosses 52 to 57: 56 or more advised. From Thorium Point, ride south across the {zone:1427} into Blackrock Mountain."] = "Deuxième visite, avec la {item:11000} : le billet pour Windsor, la grand-route (Dark Iron Highway, {npc:9016}), la ville d'Ombreforge (Shadowforge City, Incendius), la garnison ouest (West Garrison, Angerforge), la manufacture (Manufactory, Argelmach), puis {quest:4322} depuis la cellule de Windsor. Boss 52 à 57 : niveau 56 ou plus conseillé. Depuis la Halte du Thorium, traverser {zone:1427} vers le sud jusqu'au Mont Rochenoire.",
	-- {quest:4022} A Taste of Flame · {npc:9459} Cyrus Therepentous · {quest:4263} Incendius! · {npc:9561} Jalinda Sprig · {quest:4322} Jail Break! · {quest:4362} The Fate of the Kingdom · {quest:4136} Ribbly Screwspigot · {quest:4126} Hurley Blackbreath
	["In the quest log: {quest:4022} ({npc:9459}), {quest:4263} ({npc:9561}). Keep one free quest log slot for {quest:4322}. For the third visit: {quest:4362} (Magni), {quest:4136}, {quest:4126}."] = "Dans le journal de quêtes : {quest:4022} ({npc:9459}), {quest:4263} ({npc:9561}). Garder une place libre dans le journal pour {quest:4322}. Pour la troisième visite : {quest:4362} (Magni), {quest:4136}, {quest:4126}.",

	-- Step 39: Detention Block: A Crumpled Up Note
	-- {quest:4264} A Crumpled Up Note
	["Detention Block: {quest:4264}"] = "Prison : {quest:4264}",
	-- {quest:4264} A Crumpled Up Note · {quest:4242} Abandoned Hope · {item:11140} Prison Cell Key
	["The Anvilrage dwarves of the Detention Block drop {quest:4264} (about one in four) to those who handed in {quest:4242}: right-click it. Kill Gerstahn again for the {item:11140} and bring the note to Windsor."] = "Les nains Anvilrage de la prison donnent {quest:4264} (environ une fois sur quatre) à qui a rendu {quest:4242} : clic droit dessus. Tuer de nouveau Gerstahn pour la {item:11140} et apporter le billet à Windsor.",
	-- {quest:4264} A Crumpled Up Note
	["{quest:4264}: Anvilrage dwarves"] = "{quest:4264} : nains Anvilrage",

	-- Step 40: Dark Iron Highway: Bael'Gar
	-- {npc:9016} Bael'Gar
	["Dark Iron Highway: {npc:9016}"] = "Grand-route : {npc:9016}",
	-- {object:170559} Shadowforge Gate · {npc:9016} Bael'Gar · {item:11231} Altered Black Dragonflight Molt
	["The {object:170559} on the north side of the Detention Block opens with the key onto the Dark Iron Highway: large packs of dwarves. {npc:9016} (elite 54) stands at its west end; once he is down, use the {item:11231} on his remains."] = "{object:170559}, du côté nord de la prison, s'ouvre avec la clé sur la grand-route (Dark Iron Highway) : gros groupes de nains. {npc:9016} (élite 54) se tient à son extrémité ouest ; une fois tombé, utiliser le {item:11231} sur ses restes.",
	-- {item:11230} Encased Fiery Essence · {npc:9016} Bael'Gar
	["{item:11230}: the molt on {npc:9016}'s remains"] = "{item:11230} : le cuir altéré sur les restes de {npc:9016}",

	-- Step 41: Shadowforge City: Lord Incendius
	-- {npc:9017} Lord Incendius
	["Shadowforge City: {npc:9017}"] = "Ville d'Ombreforge : {npc:9017}",
	-- {npc:9017} Lord Incendius · {object:174825} Black Anvil
	["The great doors at the east end of the Highway open on Shadowforge City, above a lava lake. {npc:9017} (elite 55) guards the {object:174825} on the central bridge: tank him in the middle, his Mighty Blow knocks you into the lava, with no way back up."] = "Les grandes portes à l'extrémité est de la grand-route donnent sur la ville d'Ombreforge (Shadowforge City), au-dessus d'un lac de lave. {npc:9017} (élite 55) garde {object:174825} sur le pont central : le tanker au milieu, son Coup puissant projette dans la lave, sans moyen de remonter.",

	-- Step 42: West Garrison and the Manufactory
	["West Garrison and the Manufactory"] = "Garnison ouest et manufacture",
	-- {object:170570} East Garrison Door · {object:161460} Shadowforge Lock · {npc:9033} General Angerforge · {npc:8983} Golem Lord Argelmach · {item:11464} Marshal Windsor's Lost Information
	["Back along the Highway to the Detention Block, then through the {object:170570} (the key) into the East Garrison. Go down the stairs to the {object:161460}, the great wheel, and open it with the key: the giant door over the Highway turns, and its passage leads across to the West Garrison. Down the left-hand stairs: {npc:9033} (elite 57, calls adds at low health). Down the right-hand stairs, across the Manufactory: {npc:8983} and his two golems (kill the golems first). Each drops part of {item:11464}."] = "Revenir par la grand-route jusqu'à la prison, puis passer {object:170570} (la clé) jusqu'à la garnison est (East Garrison). Descendre l'escalier jusqu'à {object:161460}, la grande roue, et l'ouvrir avec la clé : la porte géante au-dessus de la grand-route tourne, et son passage mène de l'autre côté, à la garnison ouest (West Garrison). Par l'escalier de gauche : {npc:9033} (élite 57, appelle des renforts quand sa vie baisse). Par l'escalier de droite, à travers la manufacture (Manufactory) : {npc:8983} et ses deux golems (tuer les golems d'abord). Chacun donne une partie de {item:11464}.",

	-- Step 43: Detention Block: Jail Break!
	-- {quest:4322} Jail Break!
	["Detention Block: {quest:4322}"] = "Prison : {quest:4322}",
	-- {quest:4282} A Shred of Hope · {quest:4322} Jail Break!
	["Back to Windsor's cell. Everyone hands in {quest:4282} before anyone starts {quest:4322}, with a free quest log slot. Windsor gets his gear back in the supply room clockwise from his cell, then frees his friends from the cells of the corridor round the Ring of the Law: open each cell when he asks, not before. Stay near him; he must not die. At the end he runs to the entrance and the quest is done. Failed? Abandon it, leave and reset the dungeon, then try again."] = "Retour à la cellule de Windsor. Tout le monde rend {quest:4282} avant que quiconque lance {quest:4322}, avec une place libre dans le journal. Windsor récupère son équipement dans la réserve, dans le sens des aiguilles d'une montre depuis sa cellule, puis libère ses amis des cellules du couloir qui fait le tour de l'arène : ouvrir chaque cellule quand il le demande, pas avant. Rester près de lui ; il ne doit pas mourir. À la fin, il court jusqu'à l'entrée et la quête est faite. Échec ? L'abandonner, sortir, réinitialiser le donjon et recommencer.",
	-- {npc:9023} Marshal Windsor
	["Escort {npc:9023}"] = "Escorter {npc:9023}",

	-- Step 44: Blackrock Depths, third visit: the Grim Guzzler
	["Blackrock Depths, third visit: the Grim Guzzler"] = "Profondeurs de Rochenoire, troisième visite : la taverne",
	-- {object:170570} East Garrison Door · {object:161460} Shadowforge Lock · {quest:4136} Ribbly Screwspigot · {quest:4126} Hurley Blackbreath · {object:170571} Bar Door · {npc:9499} Plugger Spazzring · {npc:9503} Private Rocknot
	-- plural, as words: Thunderbrew Lager Kegs = {object:164911} Thunderbrew Lager Keg · Dark Iron Ale Mugs = {item:11325} Dark Iron Ale Mug
	["Third visit: the bottom of the dungeon, bosses 55 to 59, 58 or more advised. With the time, go on in the same run; or come back later: through the {object:170570}, the {object:161460} and the West Garrison again. Past Argelmach, the bridge leads to the Grim Guzzler: its patrons are neutral, so no area spells. {quest:4136} is friendly until threatened (his talk option): he fights with his cronies. Smash the three Thunderbrew Lager Kegs of the storage room near him: {quest:4126} comes with his cronies. To open the {object:170571}, buy Dark Iron Ale Mugs from {npc:9499} and give them to {npc:9503} until he loses his temper: Phalanx then breaks the door and attacks."] = "Troisième visite : le fond du donjon, boss 55 à 59, niveau 58 ou plus conseillé. Avec le temps, continuer dans la même instance ; sinon revenir plus tard, en repassant par {object:170570}, {object:161460} et la garnison ouest. Après Argelmach, le pont mène à la taverne (Grim Guzzler) : ses clients sont neutres, donc pas de sorts de zone. {quest:4136} reste amical jusqu'à ce qu'on le menace (son option de dialogue) : il se bat alors avec ses acolytes. Briser les trois tonneaux de bière Tonnebière (Thunderbrew Lager Kegs) de la réserve près de lui : {quest:4126} arrive avec ses acolytes. Pour ouvrir {object:170571}, acheter des chopes de bière Sombrefer (Dark Iron Ale Mugs) à {npc:9499} et les donner à {npc:9503} jusqu'à ce qu'il s'énerve : Phalanx enfonce alors la porte et attaque.",

	-- Step 45: Ambassador Flamelash and the Seven
	-- {npc:9156} Ambassador Flamelash
	["{npc:9156} and the Seven"] = "{npc:9156} et les Sept",
	-- {object:170571} Bar Door · {npc:9156} Ambassador Flamelash · {npc:9039} Doom'rel
	["Through the {object:170571}, left into the Chamber of Enchantment: {npc:9156} (elite 57) calls adds from the corners, kill them before they reach him. Then the Mold Foundry and the Summoners' Tomb: speak with {npc:9039} to start the Seven, who come one after the other; the door opens after the last. To the right on the way out: the Molten Bridge and the Molten Core's portal (raid)."] = "Passé {object:170571}, à gauche dans la salle des enchantements (Chamber of Enchantment) : {npc:9156} (élite 57) appelle des renforts depuis les coins, les tuer avant qu'ils l'atteignent. Puis la fonderie (Mold Foundry) et le tombeau des invocateurs (Summoners' Tomb) : parler à {npc:9039} pour lancer les Sept, qui arrivent l'un après l'autre ; la porte s'ouvre après le dernier. À droite en sortant : le pont de lave (Molten Bridge) et le portail du Cœur du Magma (raid).",

	-- Step 46: The Lyceum and Magmus
	-- {object:170558} The Lyceum · {npc:9938} Magmus
	["{object:170558} and {npc:9938}"] = "{object:170558} et {npc:9938}",
	-- {npc:9938} Magmus
	-- plural, as words: Shadowforge Flame Keepers = {npc:9956} Shadowforge Flame Keeper
	["In the Lyceum, the Shadowforge Flame Keepers (red armour) drop two Shadowforge Torches: light the two braziers at the back, the doors open on the Iron Hall. {npc:9938} (elite 57) waits at the far end: keep out of the fire jets of the side alcoves."] = "Dans le lycée (Lyceum), les Shadowforge Flame Keepers (armure rouge) donnent deux torches d'Ombreforge : allumer les deux braseros du fond, les portes s'ouvrent sur la salle de fer (Iron Hall). {npc:9938} (élite 57) attend au bout : rester hors des jets de feu des alcôves latérales.",

	-- Step 47: The Imperial Seat: Emperor Dagran Thaurissan
	-- {npc:9019} Emperor Dagran Thaurissan
	["The Imperial Seat: {npc:9019}"] = "Le siège impérial : {npc:9019}",
	-- {npc:9019} Emperor Dagran Thaurissan · {npc:8929} Princess Moira Bronzebeard · {quest:4362} The Fate of the Kingdom
	["{npc:9019} (elite 59) and {npc:8929}. {quest:4362}: kill the Emperor WITHOUT killing Moira, who heals him: one player keeps her busy and interrupts her, everyone else on the Emperor. She then stops fighting: speak with her."] = "{npc:9019} (élite 59) et {npc:8929}. {quest:4362} : tuer l'empereur SANS tuer Moira, qui le soigne : un joueur l'occupe et l'interrompt, tous les autres sur l'empereur. Elle cesse alors de combattre : lui parler.",

	-- Step 48: Flame Crest: Yuka Screwspigot
	-- {npc:9544} Yuka Screwspigot
	["Flame Crest: {npc:9544}"] = "Corniche des flammes : {npc:9544}",
	-- {zone:1428} Burning Steppes
	["Out of the dungeon (the way back or your hearthstone), then out of Blackrock Mountain on the {zone:1428} side, north-east to Flame Crest."] = "Sortir du donjon (à pied ou avec la pierre de foyer), puis du Mont Rochenoire du côté de {zone:1428}, et aller au nord-est jusqu'à la Corniche des flammes.",

	-- Step 49: Cyrus Therepentous
	-- {npc:9459} Cyrus Therepentous
	["East along the hills to {npc:9459}'s cave."] = "Vers l'est par les collines jusqu'à la grotte de {npc:9459}.",

	-- Step 50: Morgan's Vigil: Marshal Maxwell
	["Ride back south to Morgan's Vigil. Maxwell's next quest, Stormwind Rendezvous, starts the long chain to Onyxia's Lair, through Upper Blackrock Spire: not in this guide."] = "Revenir au sud jusqu'à la Veille de Morgan. La quête suivante de Maxwell, Stormwind Rendezvous, ouvre la longue chaîne du repaire d'Onyxia, par le pic Rochenoire supérieur : pas dans ce guide.",

	-- Step 56: Blackrock Depths: quests not done
	["Blackrock Depths: quests not done"] = "Profondeurs de Rochenoire : quêtes non finies",
	["What is left of Blackrock Depths in the quest log is for another run: keep it for one, or drop it to free the log."] = "Ce qui reste des Profondeurs de Rochenoire dans le journal de quêtes est pour une autre fois : le garder pour une autre visite, ou l'abandonner pour libérer le journal.",
}
