-- French (frFR): the guide groupe-alliance/07b-mortemines (guides/07b-mortemines.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["Group 6b · The Deadmines (dungeon 18-23, optional)"] = "Groupe 6b · Les Mortemines (donjon 18-23, facultatif)",

	-- Step 1: Lakeshire: Wiley the Black
	-- {npc:266} Wiley the Black
	["Lakeshire: {npc:266}"] = "Comté-du-Lac : {npc:266}",
	-- {zone:1436} Westfall · {zone:1431} Duskwood
	["The Deadmines: a 5-player dungeon under Moonbrook, in {zone:1436}, best at 18 to 23. This chapter takes its quests on the way, then the dungeon boss by boss. Alone? Skip it: the guide goes on to {zone:1431}."] = "Les Mortemines : un donjon pour 5 joueurs sous Ruisselune, en {zone:1436}, idéal de 18 à 23. Ce chapitre prend ses quêtes en chemin, puis fait le donjon boss par boss. Seul ? Le passer : le guide continue au {zone:1431}.",
	["Keep 8 free quest log slots. Everyone takes the quests at their own pace; meet at the Moonbrook entrance for the run."] = "Garder 8 places libres dans le journal. Chacun prend les quêtes à son rythme ; rendez-vous à l'entrée de Ruisselune pour le donjon.",
	-- {npc:266} Wiley the Black
	["{npc:266}, upstairs in the inn"] = "{npc:266}, à l'étage de l'auberge",

	-- Step 3: Stormwind
	-- {zone:1453} Stormwind · {object:2100} Old Town · {npc:1325} Jasper Fel · {npc:656} Wilder Thistlenettle · {npc:6579} Shoni the Shilent · {npc:11026} Sprite Jumpsprocket · {object:28027} Dwarven District
	["Fly to {zone:1453}. Mathias Shaw is upstairs at SI:7 in {object:2100}, {npc:1325} in the same building; {npc:656} (tavern), {npc:6579} and {npc:11026} are in the {object:28027}. Train while you are here."] = "Voler vers {zone:1453}. Mathias Shaw est à l'étage du SI:7 dans {object:2100}, {npc:1325} dans le même bâtiment ; {npc:656} (taverne), {npc:6579} et {npc:11026} sont dans {object:28027}. S'entraîner au passage.",
	-- {npc:11026} Sprite Jumpsprocket · {quest:92748} Explosive Consultation · {zone:1436} Westfall
	["{npc:11026}: only after {quest:92748}, from Alba in {zone:1436}"] = "{npc:11026} : seulement après {quest:92748}, d'Alba en {zone:1436}",
	-- {npc:1325} Jasper Fel
	["{npc:1325}, SI:7"] = "{npc:1325}, SI:7",
	-- {item:4358} Rough Dynamite
	["{item:4358} (not Coarse, whatever the text says): Auction House or an engineer friend"] = "{item:4358} (pas la grossière, quoi qu'en dise le texte) : hôtel des ventes ou un ami ingénieur",
	-- {npc:253092} Alba Fairmoon · {zone:1436} Westfall
	["For {npc:253092} in {zone:1436}"] = "Pour {npc:253092} en {zone:1436}",

	-- Step 5: The Defias Messenger
	-- {npc:550} Defias Messenger
	["The {npc:550}"] = "{npc:550}",
	-- {object:83} Jangolode Mine
	["He walks the road from the Moonbrook smithy to the Gold Coast Quarry and the {object:83}, and back: wait for him by the smithy. He runs at low health and can drag Moonbrook's Defias along: root or slow him and finish him fast."] = "Il suit la route de la forge de Ruisselune à la carrière de la Côte d'or et à {object:83}, puis revient : l'attendre devant la forge. Il fuit à faible vie et peut attirer les Défias de Ruisselune : l'immobiliser ou le ralentir et l'achever vite.",

	-- Step 6: Sentinel Hill
	-- {npc:467} The Defias Traitor
	["{npc:467}, at the foot of the tower ramp"] = "{npc:467}, au pied de la rampe de la tour",

	-- Step 7: Escort the The Defias Traitor
	-- {npc:467} The Defias Traitor
	["Escort the {npc:467}"] = "Escorter {npc:467}",
	["He walks to Moonbrook. The hard spot is the fountain: a Defias by the cart and the caster at the fountain join in, so deal with the caster first (Polymorph, Fear). Clearing Moonbrook beforehand makes it easy alone at 18."] = "Il marche jusqu'à Ruisselune. Le passage dur est la fontaine : un Défias près de la charrette et le lanceur de sorts de la fontaine s'en mêlent, neutraliser d'abord le lanceur (Métamorphose, Peur). Nettoyer Ruisselune avant la rend facile seul au niveau 18.",
	["Not there? Someone is escorting him: wait for him to come back, or group up with them. Since 05/11 he can vanish when crossing a zone border (a known bug, fix on the way): abandon and take the quest again."] = "Absent ? Quelqu'un l'escorte : attendre son retour, ou grouper avec ce joueur. Depuis le 05/11, il peut disparaître en franchissant une limite de zone (bug connu, correction en cours) : abandonner et reprendre la quête.",
	["Escort him to Moonbrook"] = "L'escorter jusqu'à Ruisselune",

	-- Step 8: Sentinel Hill
	-- {npc:820} Scout Riell
	["{npc:820}, at the top of the tower"] = "{npc:820}, en haut de la tour",

	-- Step 9: The mine outside the portal
	["The mine outside the portal"] = "La mine avant le portail",
	-- {npc:626} Foreman Thistlenettle
	-- plural, as words: Miners' Union Cards = {item:1894} Miners' Union Card
	["Moonbrook's smithy hides the mine. Before the portal, the purple area of the minimap holds elite undead miners in pairs: the Miners' Union Cards drop there, not inside, and {npc:626} stands at the far end with a linked add."] = "La forge de Ruisselune cache la mine. Avant le portail, la zone violette de la minicarte abrite des mineurs morts-vivants élites, par paires : les cartes du syndicat tombent là, pas dans l'instance, et {npc:626} se tient au bout avec un mob lié.",
	["Alone: around 20-21 for the cards, 23 for the Foreman. Two players: fine at 19-20. The cards drop rarely and each player loots their own: skip them if time runs short."] = "Seul : vers 20-21 pour les cartes, 23 pour le contremaître. À deux : faisable vers 19-20. Les cartes tombent rarement et chacun ramasse les siennes : les laisser si le temps manque.",
	-- {item:1894} Miners' Union Card
	-- plural, as words: Undead Excavators = {npc:624} Undead Excavator
	["{item:1894}: Undead Excavators and Dynamiters, elite"] = "{item:1894} : excavateurs et dynamiteurs morts-vivants, élites",
	-- {item:1875} Thistlenettle's Badge · {npc:626} Foreman Thistlenettle
	["{item:1875}: {npc:626}, elite"] = "{item:1875} : {npc:626}, élite",
	["The Deadmines"] = "Les Mortemines",

	-- Step 10: Rhahk'Zor
	-- {npc:644} Rhahk'Zor · {npc:3586} Miner Johnson
	["Group of 5, level 18 or more. Pull the two Watchmen away from {npc:644} first, and turn around after every boss: patrols come from behind. {npc:3586}, a rare, may stand in the small tunnel on the left after him: kill his miners first."] = "Groupe de 5, niveau 18 ou plus. Éloigner d'abord les deux guetteurs de {npc:644}, et se retourner après chaque boss : des patrouilles arrivent par derrière. {npc:3586}, un rare, peut se tenir dans le petit tunnel à gauche après lui : tuer ses mineurs d'abord.",
	-- {quest:214} Red Silk Bandanas
	["Share each quest with your group: click it in the quest log, then Share. {quest:214} drop from Defias all through the dungeon."] = "Partager chaque quête avec le groupe : la cliquer dans le journal, puis Partager. Les bandanas de {quest:214} tombent sur les Défias de tout le donjon.",
	-- {item:915} Red Silk Bandana
	["{item:915}: any Defias"] = "{item:915} : n'importe quel Défias",

	-- Step 11: Sneed's Shredder and Sneed
	-- {npc:642} Sneed's Shredder · {npc:643} Sneed
	["{npc:642} and {npc:643}"] = "{npc:642} et {npc:643}",
	-- {npc:641} Goblin Woodcarver · {npc:643} Sneed
	["Clear every {npc:641} of the lumber room first, pulling them back to the previous room: the Shredder's Terrify sends you running into them. {npc:643} jumps out when it breaks; he disarms."] = "Vider d'abord chaque {npc:641} de la scierie, en les tirant dans la salle précédente : la peur du broyeur vous jette sur eux. {npc:643} saute dehors quand la machine casse ; il désarme.",

	-- Step 12: Gilnid's foundry
	-- {npc:1763} Gilnid
	["{npc:1763}'s foundry"] = "La fonderie de {npc:1763}",
	-- {npc:1763} Gilnid
	-- plural, as words: Goblin Engineers = {npc:622} Goblin Engineer
	["Goblin Engineers and Craftsmen summon golems: kill or stun the goblin, the golem goes with it. {npc:1763} has an Engineer at his side. Plant the explosives near the middle of the room before pulling him."] = "Les ingénieurs et artisans gobelins invoquent des golems : tuer ou étourdir le gobelin, le golem disparaît avec lui. {npc:1763} a un ingénieur à ses côtés. Poser les explosifs vers le milieu de la salle avant de l'engager.",
	["Place the explosives, near the middle of the foundry"] = "Poser les explosifs, vers le milieu de la fonderie",

	-- Step 13: The cannon door
	["The cannon door"] = "La porte du canon",
	-- {item:5397} Defias Gunpowder
	["The {item:5397} barrel sits in the alcove on the right just before the cannon. Fire the cannon, then step back: a patrol of elites comes out through the broken door. A Rogue can pick the lock instead."] = "Le tonneau de {item:5397} est dans l'alcôve à droite juste avant le canon. Tirer, puis reculer : une patrouille d'élites sort par la porte brisée. Un voleur peut crocheter la serrure à la place.",
	["The cannon door is open"] = "La porte du canon est ouverte",

	-- Step 14: Mr. Smite
	-- plural, as words: Defias Blackguards = {npc:636} Defias Blackguard
	["In the cove: two stealthed Defias Blackguards join him by the walkway, kill them before he reaches 66%. At 66% and 33% he stuns the whole group for a few seconds and changes weapons: keep the tank's health up before each."] = "Dans la crique : deux Défias camouflés le rejoignent près de la passerelle, les tuer avant qu'il arrive à 66 %. À 66 % et 33 %, il étourdit tout le groupe quelques secondes et change d'arme : garder le tank plein de vie avant chaque fois.",

	-- Step 15: Captain Greenskin
	["On the ship. Crowd-control the Squallshaper, kill the Companion, then the Pirate, then Greenskin facing away from the group (Cleave)."] = "Sur le bateau. Neutraliser le façonneur de grains, tuer le compagnon, puis le pirate, puis Peau-Verte tourné dos au groupe (Enchaînement).",

	-- Step 16: Edwin VanCleef
	["Captain's cabin, top of the ship. Two Blackguards join at the pull, two more at half health: a stun at 51 to 55% skips the second pair. Everyone on the quest loots their own head and their own letter."] = "Cabine du capitaine, en haut du bateau. Deux gardes noirs le rejoignent au début, deux autres à mi-vie : un étourdissement vers 51 à 55 % évite la seconde paire. Chaque joueur qui a la quête ramasse sa tête et sa lettre.",
	-- {item:2874} An Unsent Letter
	["{item:2874}, on VanCleef: right-click it, it opens the Stockade chain"] = "{item:2874}, sur VanCleef : clic droit dessus, elle ouvre la suite vers la Prison",
	["Cookie, on the lower deck, is optional: interrupt his healing cast. Do not hearth: leave by the back, along the coast."] = "Macaron, sur le pont inférieur, est facultatif : interrompre son soin. Pas de pierre de foyer : sortir par l'arrière, le long de la côte.",

	-- Step 17: The cove exit: Alba Fairmoon
	-- {npc:253279} Alba Fairmoon
	["The cove exit: {npc:253279}"] = "La sortie de la crique : {npc:253279}",
	-- {npc:253279} Alba Fairmoon · {object:581792} Detonator
	["Out by the back of the cove; {npc:253279} waits right outside with the {object:581792}. No item reward on this chain: XP and reputation."] = "Sortie par l'arrière de la crique ; {npc:253279} attend juste dehors avec {object:581792}. Pas d'objet en récompense sur cette suite : XP et réputation.",
	-- {object:581792} Detonator
	["The {object:581792}, beside her"] = "{object:581792}, à côté d'elle",

	-- Step 18: Sentinel Hill rewards
	-- {object:81} Sentinel Hill
	["{object:81} rewards"] = "Récompenses à {object:81}",
	-- {npc:820} Scout Riell
	["{npc:820}, top of the tower"] = "{npc:820}, en haut de la tour",

	-- Step 19: Stormwind rewards
	-- {zone:1453} Stormwind
	["{zone:1453} rewards"] = "Récompenses à {zone:1453}",
	-- {npc:1719} Warden Thelwater · {zone:1431} Duskwood
	["For {npc:1719}: the Stockade, after {zone:1431}"] = "Pour {npc:1719} : la Prison, après le {zone:1431}",
	-- {zone:1431} Duskwood
	["{zone:1431} next: fly to Darkshire if you know its flight path, else ride south through Elwynn."] = "Ensuite le {zone:1431} : voler vers Sombre-Comté si son point de vol est connu, sinon descendre au sud par Elwynn.",
}
