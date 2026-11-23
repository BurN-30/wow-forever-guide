-- French (frFR): the guide groupe-alliance/uldaman (guides/uldaman.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["Dungeon · Uldaman (42-48)"] = "Donjon · Uldaman (42-48)",

	-- Step 1: Stormwind: the Uldaman chapter
	-- {zone:1453} Stormwind
	["{zone:1453}: the Uldaman chapter"] = "{zone:1453} : le chapitre d'Uldaman",
	-- {zone:1418} Badlands · {zone:1455} Ironforge · {object:28027} Dwarven District
	["Uldaman: a dwarf and titan dungeon at the north end of the {zone:1418}, for a group of 5, levels 41 to 51 in the group finder: best at 43 or more. Its quests start in {zone:1455}: the Deeprun Tram from the {object:28027}, then the flight to Thelsamar and south into the {zone:1418}. The rewards are handed in in {zone:1455} at the end; the flight back to Thelsamar then joins the route's {zone:1418} guide."] = "Uldaman : un donjon nain et titan au nord des {zone:1418}, pour un groupe de 5, niveaux 41 à 51 dans la recherche de groupe : idéal à 43 ou plus. Ses quêtes commencent à {zone:1455} : le Tram des profondeurs depuis {object:28027}, puis le vol pour Thelsamar et la descente au sud dans les {zone:1418}. Les récompenses se rendent à {zone:1455} à la fin ; le vol de retour vers Thelsamar rejoint ensuite le guide {zone:1418} du parcours.",
	["Keep 6 free quest log slots. Everyone takes the quests at their own pace; meet at the dungeon's door for the run."] = "Garder 6 places libres dans le journal. Chacun prend les quêtes à son rythme ; rendez-vous à la porte du donjon pour la partie.",
	-- {zone:1455} Ironforge
	["Tram to {zone:1455}"] = "Tram pour {zone:1455}",

	-- Step 2: Ironforge: Hall of Explorers
	-- {npc:1356} Prospector Stormpike · {npc:6294} Krom Stoutarm · {npc:3979} Librarian Mae Paledust · {object:32356} Hall of Explorers · {npc:3980} Raleigh the Devout
	["{npc:1356}, {npc:6294} and {npc:3979} all stand in the {object:32356}. Mae Paledust's quest is for the Scarlet Monastery ({npc:3980}, Southshore): take it only if your group has not run it yet and still plans to."] = "{npc:1356}, {npc:6294} et {npc:3979} se tiennent tous dans {object:32356}. La quête de Mae Paledust est pour le Monastère écarlate ({npc:3980}, Austrivage) : la prendre seulement si le groupe ne l'a pas encore fait et compte le faire.",
	-- {npc:3979} Librarian Mae Paledust
	["{npc:3979}: for the Scarlet Monastery"] = "{npc:3979} : pour le Monastère écarlate",

	-- Step 3: Fly to Thelsamar
	["Fly to Thelsamar"] = "Volez vers Thelsamar",
	-- {zone:1455} Ironforge
	["{zone:1455} flight master"] = "Maître de vol de {zone:1455}",

	-- Step 4: Badlands: Prospector Ryedol
	-- {zone:1418} Badlands · {quest:720} A Sign of Hope · {npc:2909} Hammertoe Grez
	["Ride south through the pass into the {zone:1418}. Ryedol's errand left at the start of the route's {zone:1418} visit, {quest:720}, now serves Uldaman: it sends you to {npc:2909}, just outside the dungeon."] = "Descendre au sud par le col dans les {zone:1418}. La mission de Ryedol laissée au début du passage du parcours dans les {zone:1418}, {quest:720}, sert maintenant Uldaman : elle envoie vers {npc:2909}, juste devant le donjon.",
	-- {npc:2910} Prospector Ryedol · {npc:2909} Hammertoe Grez
	["{npc:2910}: for {npc:2909}, outside Uldaman"] = "{npc:2910} : pour {npc:2909}, devant Uldaman",

	-- Step 5: Valley of Fangs: Rigglefuzz
	-- {npc:2817} Rigglefuzz
	["Valley of Fangs: {npc:2817}"] = "Vallée des Crocs : {npc:2817}",
	-- {npc:2817} Rigglefuzz · {quest:2418} Power Stones
	["{npc:2817}'s {quest:2418} drop from the Shadowforge dwarves at Uldaman's door, not often: take it only if your group means to farm them a little."] = "Les pierres de {quest:2418} de {npc:2817} tombent des nains Ombreforge à la porte d'Uldaman, pas souvent : ne la prendre que si le groupe compte en chercher un peu.",
	-- {npc:2817} Rigglefuzz
	["{npc:2817}, Valley of Fangs"] = "{npc:2817}, Vallée des Crocs",

	-- Step 6: Uldaman: Hammertoe Grez
	-- {npc:2909} Hammertoe Grez
	["Uldaman: {npc:2909}"] = "Uldaman : {npc:2909}",
	-- {npc:2909} Hammertoe Grez · {npc:2932} Magregan Deepshadow
	["{npc:2909} waits just outside Uldaman, west of the cave. His amulet is on {npc:2932}, a Shadowforge dwarf (elite 38) outside the dungeon portal, south of {npc:2909}."] = "{npc:2909} attend juste devant Uldaman, à l'ouest de la grotte. Son amulette est sur {npc:2932}, un nain Ombreforge (élite 38) devant le portail du donjon, au sud de {npc:2909}.",
	-- {item:4635} Hammertoe's Amulet · {npc:2932} Magregan Deepshadow
	["{item:4635}: {npc:2932}, elite 38"] = "{item:4635} : {npc:2932}, élite 38",
	-- {npc:2910} Prospector Ryedol · {zone:1418} Badlands
	["For {npc:2910}, on the way out of the {zone:1418}"] = "Pour {npc:2910}, en sortant des {zone:1418}",

	-- Step 7: The digsite and the outer cave
	["The digsite and the outer cave"] = "Le site de fouilles et la grotte extérieure",
	-- {npc:6294} Krom Stoutarm
	["The Shadowforge dwarves of the digsite in front of the cave and of the outer cave drop both power stones, not often: no need to enter the instance for them. {npc:6294}'s chest is in the outer cave, at the back of the left-hand hall, behind a pillar, with two guards."] = "Les nains Ombreforge du site de fouilles devant la grotte et de la grotte extérieure lâchent les deux pierres de pouvoir, rarement : pas besoin d'entrer dans l'instance pour elles. Le coffre de {npc:6294} est dans la grotte extérieure, au fond du couloir de gauche, derrière un pilier, avec deux gardes.",
	-- {item:8009} Dentrium Power Stone
	["{item:8009}: Shadowforge dwarves"] = "{item:8009} : nains Ombreforge",
	-- {item:8052} An'Alleum Power Stone
	["{item:8052}: Shadowforge dwarves"] = "{item:8052} : nains Ombreforge",
	-- {item:8027} Krom Stoutarm's Treasure
	["{item:8027}, from his chest"] = "{item:8027}, dans son coffre",
	["Uldaman"] = "Uldaman",

	-- Step 8: Baelog and the hidden chamber
	-- {npc:6906} Baelog
	["{npc:6906} and the hidden chamber"] = "{npc:6906} et la chambre cachée",
	-- {npc:6906} Baelog · {item:7740} Gni'kiv Medallion · {item:7733} Staff of Prehistoria
	["{npc:6906}, Eric and Olaf wait in the first halls, at the top of a ramp. The chest beside {npc:6906} holds the {item:7740}, Revelosh drops the Shaft of Tsol: together they make the {item:7733}. Plant it in the Map Room, kill Ironaya (elite), then walk all the way into the chamber."] = "{npc:6906}, Eric et Olaf attendent dans les premiers couloirs, en haut d'une rampe. Le coffre près de {npc:6906} contient le {item:7740}, Revelosh lâche la hampe : ensemble ils forment le {item:7733}. Le planter dans la Salle des Cartes, tuer Ironaya (élite), puis avancer jusqu'au fond de la chambre.",
	-- {item:7666} Shattered Necklace · {npc:6826} Talvash del Kissel · {zone:1455} Ironforge
	["Share each quest with your group: click it in the quest log, then Share. A {item:7666} may drop on the way: its chain goes on with {npc:6826} in {zone:1455}."] = "Partager chaque quête avec votre groupe : cliquer dessus dans le journal, puis Partager. Un {item:7666} peut tomber en route : sa suite continue avec {npc:6826} à {zone:1455}.",
	["Explore the hidden chamber"] = "Explorer la chambre cachée",
	-- {item:7666} Shattered Necklace · {npc:6826} Talvash del Kissel · {zone:1455} Ironforge
	["{item:7666}, a drop: for {npc:6826} in {zone:1455}"] = "{item:7666}, un butin : pour {npc:6826} à {zone:1455}",

	-- Step 9: Mages: Power in Uldaman
	-- {quest:1956} Power in Uldaman
	["Mages: {quest:1956}"] = "Mages : {quest:1956}",
	-- {npc:7023} Obsidian Sentinel · {item:8053} Obsidian Power Source · {zone:1445} Dustwallow Marsh
	["The {npc:7023}, one of the bosses on the way to Archaedas, drops the {item:8053} for Tabetha in {zone:1445}."] = "La {npc:7023}, l'un des boss sur le chemin d'Archaedas, lâche la {item:8053} pour Tabetha au {zone:1445}.",

	-- Step 10: Archaedas and the Discs of Norgannon
	-- {object:131474} Discs of Norgannon
	["Archaedas and the {object:131474}"] = "Archaédas et les {object:131474}",
	-- {object:131474} Discs of Norgannon
	["Archaedas, the last boss, wakes the stone guardians around his room during the fight. Behind him, the {object:131474}: click them, talk to the spirit on the left, then click the Discs again for the miniature copy before you leave."] = "Archaédas, le dernier boss, réveille les gardiens de pierre autour de sa salle pendant le combat. Derrière lui, les {object:131474} : les cliquer, parler à l'esprit à gauche, puis cliquer à nouveau sur les Disques pour la copie miniature avant de partir.",

	-- Step 11: Rigglefuzz
	["Leave by the front, south to the Valley of Fangs."] = "Sortir par l'entrée, au sud vers la Vallée des Crocs.",

	-- Step 12: Prospector Ryedol
	-- {zone:1432} Loch Modan
	["On the way back north to the pass into {zone:1432} and the Thelsamar flight."] = "Sur le chemin du retour vers le nord, vers le col du {zone:1432} et le vol de Thelsamar.",
	-- {npc:2916} Historian Karnik · {zone:1455} Ironforge
	["For {npc:2916} in {zone:1455}"] = "Pour {npc:2916} à {zone:1455}",

	-- Step 13: Fly to Ironforge
	-- {zone:1455} Ironforge
	["Fly to {zone:1455}"] = "Envolez-vous vers {zone:1455}",
	["Thelsamar flight master"] = "Maître de vol de Thelsamar",

	-- Step 14: Ironforge rewards
	-- {zone:1455} Ironforge
	["{zone:1455} rewards"] = "Récompenses à {zone:1455}",
	-- {npc:1356} Prospector Stormpike · {npc:6294} Krom Stoutarm · {npc:5387} High Explorer Magellas · {object:32356} Hall of Explorers · {npc:6826} Talvash del Kissel · {object:32362} Mystic Ward
	["{npc:1356}, {npc:6294} and {npc:5387} are all in the {object:32356}; {npc:6826} in the {object:32362}."] = "{npc:1356}, {npc:6294} et {npc:5387} sont tous dans {object:32356} ; {npc:6826} dans {object:32362}.",
	-- {npc:6826} Talvash del Kissel
	["{npc:6826}: his follow-ups need another Uldaman run, not in this guide"] = "{npc:6826} : ses suites nécessitent un autre passage à Uldaman, pas dans ce guide",

	-- Step 15: The Vault of Ironforge: the Platinum Discs reward
	-- {object:32377} Vault of Ironforge
	["The {object:32377}: the Platinum Discs reward"] = "{object:32377} : la récompense des disques de platine",
	-- {npc:5387} High Explorer Magellas · {object:131474} Discs of Norgannon · {npc:7292} Dinita Stonemantle · {object:32377} Vault of Ironforge
	["{npc:5387} hands a voucher for the {object:131474}: {npc:7292} pays it in the {object:32377}."] = "{npc:5387} remet un bon pour {object:131474} : {npc:7292} le paie dans {object:32377}.",
	-- {npc:7292} Dinita Stonemantle
	["{npc:7292}, in the Vault"] = "{npc:7292}, dans la Chambre forte",

	-- Step 16: Hall of Explorers: Historian Karnik and Advisor Belgrum
	-- {object:32356} Hall of Explorers · {npc:2916} Historian Karnik · {npc:2918} Advisor Belgrum
	["{object:32356}: {npc:2916} and {npc:2918}"] = "{object:32356} : {npc:2916} et {npc:2918}",
	-- {object:32356} Hall of Explorers · {zone:1418} Badlands
	["Both stand in the {object:32356}. Karnik's last task, An Ambassador of Evil, leads to a second Uldaman run, not in this guide: do not take it. Last stop of the chapter: the route's own guide comes back; its {zone:1418} guide starts at Thelsamar, a flight from here."] = "Tous deux se tiennent dans {object:32356}. La dernière tâche de Karnik, An Ambassador of Evil, mène à un second passage à Uldaman, hors de ce guide : ne pas la prendre. Dernier arrêt du chapitre : le guide du parcours revient ; son guide {zone:1418} commence à Thelsamar, à un vol d'ici.",

	-- No longer in the guide (its English changed or it went away): reuse or delete.
	-- ["Both stand in the {object:32356}. Karnik's last task, An Ambassador of Evil, is in Angor Fortress in the {zone:1418}, which the route has left: do not take it. Last stop of the chapter: the route's own guide comes back, with its flight to Southshore."] = "Tous deux se tiennent dans {object:32356}. La dernière tâche de Karnik, An Ambassador of Evil, est dans la forteresse d'Angor, dans les {zone:1418}, que le parcours a quittées : ne pas la prendre. Dernier arrêt du chapitre : le guide du parcours revient, avec son vol pour Austrivage.",
	-- ["Thelsamar: the Uldaman chapter"] = "Thelsamar : le chapitre d'Uldaman",
	-- ["Uldaman: a dwarf and titan dungeon at the north end of the {zone:1418}, for a group of 5, levels 41 to 51 in the group finder: best at 43 or more. Its quests start in {zone:1455}: fly there, then back to Thelsamar and south into the {zone:1418}. The rewards are handed in in {zone:1455} at the end, where the flight to Southshore goes on with the route."] = "Uldaman : un donjon nain et titan au nord des {zone:1418}, pour un groupe de 5, niveaux 41 à 51 dans la recherche de groupe : idéal à 43 ou plus. Ses quêtes commencent à {zone:1455} : y voler, puis revenir à Thelsamar et descendre au sud dans les {zone:1418}. Les récompenses se rendent à {zone:1455} à la fin, d'où le vol pour Austrivage reprend le parcours.",
	-- ["{npc:1356}, {npc:6294} and {npc:3979} all stand in the {object:32356}. Mae Paledust's quest is for the Scarlet Monastery, the next chapter, offered at Southshore: take it if your group plans that run too."] = "{npc:1356}, {npc:6294} et {npc:3979} se tiennent tous dans {object:32356}. La quête de Mae Paledust est pour le Monastère écarlate, le chapitre suivant, proposé à Austrivage : la prendre si le groupe prévoit aussi ce donjon.",
}
