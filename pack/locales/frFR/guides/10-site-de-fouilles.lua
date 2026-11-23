-- French (frFR): the guide groupe-alliance/10-site-de-fouilles (guides/10-site-de-fouilles.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1437} Wetlands
	["Dungeon · Excavation Site: {zone:1437} (27-34)"] = "Donjon · Site de fouilles : {zone:1437} (27-34)",

	-- Step 1: Menethil Harbor: dungeon quests
	-- {object:1162} Menethil Harbor
	["{object:1162}: dungeon quests"] = "Port de Menethil : quêtes du donjon",
	-- {zone:1437} Wetlands
	["Excavation Site: a 5-player Forever dungeon up the hill in the middle of the {zone:1437}, levels 26 to 33 in the group finder. Everything inside is elite and the last boss is 31: about 39,000 XP of quests and blue rewards."] = "Site de fouilles : un donjon de Forever pour 5 joueurs en haut de la colline au milieu des {zone:1437}, niveaux 26 à 33 dans la recherche de groupe. Tout est élite à l'intérieur et le dernier boss est de niveau 31 : environ 39 000 XP de quêtes et des récompenses bleues.",
	-- {npc:1480} Caitlin Grassman · {npc:2094} James Halloran
	["Keep 6 free quest log slots. {npc:1480} is next to the inn, {npc:2094} near the docks."] = "Garder 6 places libres dans le journal. {npc:1480} est à côté de l'auberge, {npc:2094} près des quais.",

	-- Step 2: Rethiel the Greenwarden
	["On the Green Belt, east of the road, on the way to the dig. He gives it once Blisters on the Land is done, which the route did."] = "Sur la Ceinture verte, à l'est de la route, sur le chemin des fouilles. Il la donne une fois Cloques sur la terre (Blisters on the Land) faite, ce que le parcours a fait.",

	-- Step 3: Excavation Site entrance
	["Excavation Site entrance"] = "Entrée du site de fouilles",
	["From the meeting stone near Thelgen Rock, follow the mountain path up to the portal. A single graveyard serves the area: a wipe means a long walk back."] = "Depuis la pierre de rencontre près du rocher de Thelgen, suivre le sentier de montagne jusqu'au portail. Un seul cimetière dans le secteur : après un échec collectif, le retour à pied est long.",
	-- {quest:95647} Lost in the Thicket Things · {npc:1480} Caitlin Grassman · {quest:98815} Highland Hides · {npc:2094} James Halloran · {quest:95646} Horrors in the Highland · {npc:1244} Rethiel the Greenwarden · {npc:262681} Ardin Grassman
	["In the log before going in: {quest:95647} ({npc:1480}), {quest:98815} ({npc:2094}), {quest:95646} ({npc:1244}). Share each quest with the group: click it in the quest log, then Share. Talk to {npc:262681} and Daewyn as soon as you find them inside: their follow-ups start with them."] = "Dans le journal avant d'entrer : {quest:95647} ({npc:1480}), {quest:98815} ({npc:2094}), {quest:95646} ({npc:1244}). Partager chaque quête avec le groupe : clic sur la quête dans le journal, puis Partager. Parler à {npc:262681} et à Daewyn dès qu'ils sont trouvés à l'intérieur : leurs suites commencent avec eux.",
	["Excavation Site"] = "Site de fouilles",

	-- Step 4: Saltspine
	["Clear around him first. Tendon Rip slows the tank hard and his Dust Storm makes everyone within 10 yards miss: casters stay out of it."] = "Nettoyer autour de lui d'abord. Il ralentit fortement le tank et sa tempête de poussière fait rater tout le monde à 10 mètres : les lanceurs de sorts restent en dehors.",

	-- Step 5: The tall grass and Shadetooth
	["The tall grass and Shadetooth"] = "Les hautes herbes et Dent-Sombre",
	-- plural, as words: Thicket Lurkers = {npc:260800} Thicket Lurker · Thicket Hunters = {npc:260801} Thicket Hunter
	["The most dangerous stretch: Thicket Lurkers leap out of the tall grass, and Matriarchs call more of them at low health. Keep to the narrow path, fight in the open, kill the others before a Matriarch. Shadetooth comes with two Thicket Hunters (dispel Infected Wound): crowd-control one, kill the other, and fight him in the crocodile cove on the left so his fear cannot throw anyone into the grass."] = "Le passage le plus dangereux : des raptors surgissent des hautes herbes, et les matriarches en appellent d'autres à faible vie. Rester sur le chemin étroit, combattre à découvert, tuer les autres avant une matriarche. Dent-Sombre vient avec deux chasseurs des fourrés (dissiper la blessure infectée) : en neutraliser un, tuer l'autre, et le combattre dans l'anse aux crocodiles à gauche pour que sa peur n'envoie personne dans les herbes.",
	-- {item:284845} Thicket Raptor Hide
	["{item:284845}: Shadetooth and the Thicket raptors"] = "{item:284845} : Dent-Sombre et les raptors des fourrés",

	-- Step 6: Daewyn Songblade
	["Daewyn stands near the burned dig camp, by the Dragonmaw."] = "Daewyn se tient près du camp de fouilles incendié, à côté des Gueule-de-dragon.",
	-- {quest:95772} Songblade Search · {npc:956} Dorin Songblade
	["Daewyn: {quest:95772}, from {npc:956} in Lakeshire"] = "Daewyn : {quest:95772}, de {npc:956} à Comté-du-Lac",

	-- Step 7: The Highland Horror
	-- {npc:260808} Highland Horror
	["The {npc:260808}"] = "{npc:260808}",
	-- {npc:260808} Highland Horror
	["The {npc:260808} (elite 28) stands right of the Dragonmaw and the burned dig camp; only this one inside drops the rootcore, not the one outside the dungeon."] = "{npc:260808} (élite 28) se tient à droite des Gueules-de-dragon et du camp de fouilles brûlé ; seul celui de l'intérieur donne le cœur de racine, pas celui du dehors.",
	-- {item:270180} Horrible Rootcore · {npc:260808} Highland Horror
	["{item:270180}: {npc:260808}, elite 28"] = "{item:270180} : {npc:260808}, élite 28",

	-- Step 8: Relic Guardian
	-- {npc:262681} Ardin Grassman
	["The last boss, level 31, woken by the Archival Panel on its right. Thunderclap slows everyone within 10 yards, and it knocks back and stuns the tank for 5 seconds: rotate stuns and slows, keep healing the tank, kite round the structures if need be. {npc:262681} waits on the wooden scaffold by its arena."] = "Le dernier boss, niveau 31, réveillé par le panneau d'archives à sa droite. Coup de tonnerre ralentit tout le monde à 10 mètres, et il projette et étourdit le tank 5 secondes : enchaîner étourdissements et ralentissements, soigner le tank, tourner autour des structures si besoin. {npc:262681} attend sur l'échafaudage en bois près de son arène.",
	-- {npc:262681} Ardin Grassman
	["{npc:262681}, each player talks to him"] = "{npc:262681}, chaque joueur lui parle",
	-- {item:270865} Titan Relic · {npc:260326} Relic Guardian
	["{item:270865}, from the {npc:260326}: right-click it"] = "{item:270865}, sur {npc:260326} : clic droit dessus",

	-- Step 9: Rethiel the Greenwarden's reward
	-- {npc:1244} Rethiel the Greenwarden
	["{npc:1244}'s reward"] = "Récompense de {npc:1244}",
	-- {npc:1244} Rethiel the Greenwarden
	["Back down the path: {npc:1244} is on the Green Belt."] = "Redescendre le chemin : {npc:1244} est sur la Ceinture verte.",

	-- Step 10: Prospector Whelgar
	["In the small cave of the outdoor dig, west of the road."] = "Dans la petite grotte du chantier extérieur, à l'ouest de la route.",

	-- Step 11: Menethil rewards
	["Menethil rewards"] = "Récompenses à Menethil",
	-- {npc:1480} Caitlin Grassman
	["{npc:1480}: pick mana potions for casters"] = "{npc:1480} : potions de mana pour les lanceurs de sorts",

	-- Step 12: Lakeshire: Dorin Songblade
	-- {npc:956} Dorin Songblade
	["Lakeshire: {npc:956}"] = "Comté-du-Lac : {npc:956}",
	-- {npc:956} Dorin Songblade · {zone:1455} Ironforge
	["Only for whoever took {npc:956}'s quest in Lakeshire: the flight there and back. Otherwise straight on to {zone:1455}."] = "Seulement pour qui a pris la quête de {npc:956} à Comté-du-Lac : le vol aller et retour. Sinon, directement vers {zone:1455}.",

	-- Step 13: Ironforge: High Explorer Magellas
	-- {object:1162} Menethil Harbor · {zone:1455} Ironforge · {object:32356} Hall of Explorers · {item:270865} Titan Relic
	["Fly from {object:1162} to {zone:1455}, as the route does next: Magellas stands in the {object:32356}. He says you lack the {item:270865}? Abandon the quest and take it again from Whelgar for a new relic. Last stop of the chapter: the route's own guide comes back once this is handed in."] = "Vol du port de Menethil à {zone:1455}, comme le fait ensuite le parcours : Magellas se tient dans le {object:32356}. Il dit que la {item:270865} manque ? Abandonner la quête et la reprendre chez Whelgar pour une nouvelle relique. Dernier arrêt du chapitre : le guide du parcours revient une fois la quête rendue.",
}
