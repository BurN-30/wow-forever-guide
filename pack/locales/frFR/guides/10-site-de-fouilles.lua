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
	["Group 10 · Excavation Site: {zone:1437} (dungeon 28-32)"] = "Groupe 10 · Site de fouilles : {zone:1437} (donjon 28-32)",

	-- Step 1: Back to Menethil Harbor
	-- {object:1162} Menethil Harbor
	["Back to {object:1162}"] = "Retour à {object:1162}",
	-- {zone:1441} Thousand Needles · {object:1162} Menethil Harbor
	["From {zone:1441}: use your hearthstone, bound in Menethil's Deepwater Tavern. On cooldown? Fly to Theramore and take the boat to {object:1162}."] = "Depuis {zone:1441} : utilisez votre pierre de foyer, liée à la taverne de l'Eau-profonde de Menethil. En recharge ? Prenez le griffon jusqu'à Theramore, puis le bateau pour {object:1162}.",
	["Deepwater Tavern"] = "Taverne de l'Eau-profonde",

	-- Step 2: Menethil Harbor: dungeon quests
	-- {object:1162} Menethil Harbor
	["{object:1162}: dungeon quests"] = "{object:1162} : quêtes du donjon",
	-- {zone:1437} Wetlands
	["Excavation Site: a 5-player Forever dungeon up the hill in the middle of the {zone:1437}, best at 28 to 31, with 5 players (4 with a real tank or healer). Everything inside is elite and the last boss is 31: about 39,000 XP of quests and blue rewards. Alone? Skip it: the guide goes on to Dalaran."] = "Site de fouilles : un donjon de Forever pour 5 joueurs en haut de la colline, au milieu des {zone:1437}, idéal de 28 à 31, à 5 (à 4 avec un vrai tank ou soigneur). Tout est élite à l'intérieur et le dernier boss est niveau 31 : environ 39 000 XP de quêtes et des récompenses bleues. Seul ? Le passer : le guide continue vers Dalaran.",
	-- {npc:1480} Caitlin Grassman · {npc:2094} James Halloran · {quest:95737} Seeking Caitlin
	["Keep 6 free quest log slots. {npc:1480} is in her house, {npc:2094} by the north gate. {quest:95737}, from Llana in Astranaar, can no longer be taken once you hold {npc:1480}'s quest."] = "Garder 6 places libres dans le journal. {npc:1480} est dans sa maison, {npc:2094} près de la porte nord. {quest:95737}, de Llana à Astranaar, ne se prend plus une fois la quête de {npc:1480} dans le journal.",
	-- {npc:1480} Caitlin Grassman · {quest:95737} Seeking Caitlin
	["{npc:1480}: {quest:95737}, if you took it in Astranaar"] = "{npc:1480} : {quest:95737}, si elle a été prise à Astranaar",
	-- {quest:484} Young Crocolisk Skins
	["Needs {quest:484} done"] = "Demande {quest:484} finie",

	-- Step 3: Rethiel the Greenwarden
	["On the Green Belt, east of the road. He gives it once his three earlier quests are done (The Greenwarden, Tramping Paws, Fire Taboo, then Blisters on the Land)."] = "Sur la Ceinture verte, à l'est de la route. Il la donne une fois ses trois quêtes précédentes terminées (Le Gouverneur vert, Piétinements de pattes, Feu interdit, puis Fièvre sur le pays).",

	-- Step 4: Excavation Site entrance
	["Excavation Site entrance"] = "Entrée du site de fouilles",
	["From the meeting stone near Thelgen Rock, follow the mountain path up to the portal. A single graveyard serves the area: a wipe means a long walk back."] = "Depuis la pierre de rencontre près du rocher de Thelgen, suivre le sentier de montagne jusqu'au portail. Un seul cimetière dans le secteur : après un échec collectif, le retour à pied est long.",
	["Excavation Site"] = "Site de fouilles",

	-- Step 5: Saltspine
	["Saltspine"] = "Seléchine",
	["Clear around him first. Tendon Rip slows the tank hard and his Dust Storm makes everyone within 10 yards miss: casters stay out of it."] = "Nettoyer autour de lui d'abord. Il ralentit fortement le tank et sa tempête de poussière fait rater tout le monde à 10 mètres : les lanceurs de sorts restent en dehors.",
	-- {npc:262681} Ardin Grassman
	["Share each quest with your group: click it in the quest log, then Share. Talk to {npc:262681} and Daewyn as soon as you find them inside: their follow-ups start with them."] = "Partager chaque quête avec le groupe : la cliquer dans le journal, puis Partager. Parler à {npc:262681} et à Daewyn dès qu'on les trouve à l'intérieur : leurs suites commencent avec eux.",

	-- Step 6: The tall grass and Shadetooth
	["The tall grass and Shadetooth"] = "Les hautes herbes et Dent-Sombre",
	-- plural, as words: Thicket Lurkers = {npc:260800} Thicket Lurker · Thicket Hunters = {npc:260801} Thicket Hunter
	["The most dangerous stretch: Thicket Lurkers leap out of the tall grass, and Matriarchs call more of them at low health. Keep to the narrow path, fight in the open, kill the others before a Matriarch. Shadetooth comes with two Thicket Hunters (dispel Infected Wound): crowd-control one, kill the other, and fight him in the crocodile cove on the left so his fear cannot throw anyone into the grass."] = "Le passage le plus dangereux : des raptors surgissent des hautes herbes, et les matriarches en appellent d'autres à faible vie. Rester sur le chemin étroit, combattre à découvert, tuer les autres avant une matriarche. Dent-Sombre vient avec deux chasseurs des fourrés (dissiper la blessure infectée) : en neutraliser un, tuer l'autre, et le combattre dans l'anse aux crocodiles à gauche pour que sa peur n'envoie personne dans les herbes.",
	-- {item:284845} Thicket Raptor Hide
	["{item:284845}: Shadetooth and the Thicket raptors"] = "{item:284845} : Dent-Sombre et les raptors des fourrés",

	-- Step 7: Daewyn and the Highland Horror
	-- {npc:260808} Highland Horror
	["Daewyn and the {npc:260808}"] = "Daewyn et {npc:260808}",
	-- {npc:260808} Highland Horror
	["The {npc:260808} (elite 28) stands right of the Dragonmaw and the burned dig camp; only this one inside drops the rootcore, not the one outside the dungeon."] = "{npc:260808} (élite 28) se tient à droite des Gueules-de-dragon et du camp de fouilles brûlé ; seul celui de l'intérieur donne le cœur de racine, pas celui du dehors.",
	-- {quest:95772} Songblade Search · {npc:956} Dorin Songblade
	["Daewyn: {quest:95772}, from {npc:956} in Lakeshire"] = "Daewyn : {quest:95772}, de {npc:956} à Comté-du-Lac",
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

	-- Step 10: Prospector Whelgar
	["In the small cave of the outdoor dig, west of the road."] = "Dans la petite grotte du chantier extérieur, à l'ouest de la route.",

	-- Step 11: Menethil rewards
	["Menethil rewards"] = "Récompenses à Menethil",
	-- {npc:2094} James Halloran
	["{npc:2094}: the reward may be missing (bug reported on 07/11)"] = "{npc:2094} : la récompense peut manquer (bug signalé le 07/11)",
	-- {npc:1480} Caitlin Grassman
	["{npc:1480}: pick mana potions for casters"] = "{npc:1480} : potions de mana pour les lanceurs de sorts",

	-- Step 12: Ironforge: High Explorer Magellas
	-- {object:32356} Hall of Explorers · {item:270865} Titan Relic
	["{object:32356}. He says you lack the {item:270865}? Abandon the quest and take it again from Whelgar for a new relic."] = "{object:32356}. Il dit qu'il manque {item:270865} ? Abandonner la quête et la reprendre chez Whelgar pour une nouvelle relique.",

	-- Step 13: Lakeshire: Dorin Songblade
	-- {npc:956} Dorin Songblade
	["Lakeshire: {npc:956}"] = "Comté-du-Lac : {npc:956}",
	-- {zone:1453} Stormwind · {npc:956} Dorin Songblade
	["Fly to Lakeshire on your way to {zone:1453}: {npc:956} is in the stables past the bridge."] = "Passer par Comté-du-Lac en vol sur la route de {zone:1453} : {npc:956} est dans les écuries après le pont.",

	-- No longer in the guide (its English changed or it went away): reuse or delete.
	-- ["From the meeting stone near Thelgen Rock, follow the mountain path up to the portal."] = "Depuis la pierre de rencontre près du rocher de Thelgen, suivre le sentier de montagne jusqu'au portail.",
	-- ["From {zone:1441}: use your hearthstone, bound in Menethil's Deepwater Tavern."] = "Depuis {zone:1441} : utiliser la pierre de foyer, liée à la taverne de l'Eau-profonde de Menethil.",
	-- ["Group 9 · Excavation Site: {zone:1437} (dungeon 26-29)"] = "Groupe 9 · Site de fouilles : {zone:1437} (donjon 26-29)",
	-- ["Group 9 · Excavation Site: {zone:1437} (dungeon 26-31)"] = "Groupe 9 · Site de fouilles : {zone:1437} (donjon 26-31)",
	-- ["Inside the dungeon"] = "Dans le donjon",
	-- ["On the Green Belt, east of the road. Needs his Blisters on the Land done."] = "Sur la Ceinture verte, à l'est de la route. Demande d'avoir fini sa quête des cloques.",
	-- ["Share each quest with your group: click it in the quest log, then Share."] = "Partagez chaque quête au groupe : clic sur la quête dans le journal, puis Partager.",
	-- ["Thicket Raptor Hides drop in the raptor area. {npc:262681} waits on the wooden scaffold by the last arena."] = "Les peaux de raptor tombent dans la zone des raptors. {npc:262681} attend sur l'échafaudage en bois près de la dernière arène.",
	-- ["{item:270865}, from the last boss"] = "{item:270865}, sur le dernier boss",
	-- ["{npc:1480} is in her house, {npc:2094} by the north gate. Keep 6 free quest log slots."] = "{npc:1480} est dans sa maison, {npc:2094} près de la porte nord. Garder 6 places libres dans le journal.",
}
