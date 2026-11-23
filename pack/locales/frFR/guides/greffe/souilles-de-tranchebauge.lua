-- French (frFR): the guide groupe-alliance/greffe/souilles-de-tranchebauge (guides/greffe/souilles-de-tranchebauge.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	["Dungeon · Razorfen Downs (39-45)"] = "Donjon · Souilles de Tranchebauge (39-45)",

	-- Step 1: Stormwind: Archbishop Benedictus
	-- {zone:1413} Barrens · {npc:1284} Archbishop Benedictus · {quest:3636} Bring the Light
	["Razorfen Downs: the quilboar and Scourge barrows at the southern edge of the {zone:1413}, for a group of 5, levels 37 to 46: at 41 it fits. {npc:1284} stands in the Cathedral of Light. {quest:3636} cannot be shared: every player takes it here."] = "Les Souilles de Tranchebauge : les terriers des huranes et du Fléau au sud des {zone:1413}, pour un groupe de 5, niveaux 37 à 46 : à 41, c'est le bon moment. {npc:1284} se tient dans la Cathédrale de la Lumière. {quest:3636} ne se partage pas : chaque joueur la prend ici.",
	-- {object:3204} Booty Bay · {zone:1413} Barrens · {zone:1453} Stormwind
	["The trip: the flight to {object:3204}, the boat to Ratchet, then the road south through the {zone:1413}; the same way back to {zone:1453} at the end. Keep 4 free quest log slots."] = "Le trajet : le vol pour {object:3204}, le bateau pour Cabestan, puis la route vers le sud à travers les {zone:1413} ; le même chemin au retour vers {zone:1453} à la fin. Garder 4 places libres dans le journal.",

	-- Step 2: Fly to Booty Bay
	-- {object:3204} Booty Bay
	["Fly to {object:3204}"] = "Envolez-vous pour {object:3204}",
	-- {zone:1453} Stormwind
	["{zone:1453} flight master"] = "Maître de vol de {zone:1453}",

	-- Step 3: Boat to Ratchet
	["Boat to Ratchet"] = "Bateau pour Cabestan",
	-- {object:3204} Booty Bay · {npc:4631} Wharfmaster Lozgil
	["The boat to Ratchet leaves from {object:3204}'s dock, by {npc:4631}."] = "Le bateau pour Cabestan part du quai de {object:3204}, près de {npc:4631}.",

	-- Step 4: The road south
	["The road south"] = "La route du sud",
	-- {zone:1413} Barrens · {object:19844} Great Lift
	["From Ratchet, ride west to the road, then south down the {zone:1413} past Camp Taurajo (Horde: keep east of it and away from its guards) to the top of the {object:19844}. Razorfen Downs is a few hundred yards north-east of the lift, among thorny hills."] = "Depuis Cabestan, rejoindre la route à l'ouest, puis descendre les {zone:1413} vers le sud en passant le Camp Taurajo (Horde : rester à l'est, loin de ses gardes) jusqu'au haut de {object:19844}. Les Souilles de Tranchebauge sont à quelques centaines de mètres au nord-est de l'élévateur, parmi des collines d'épines.",
	["Razorfen Downs"] = "Souilles de Tranchebauge",

	-- Step 5: Razorfen Downs: Myriam Moonsinger
	-- {npc:12866} Myriam Moonsinger
	["Razorfen Downs: {npc:12866}"] = "Souilles de Tranchebauge : {npc:12866}",
	-- {npc:12866} Myriam Moonsinger
	["{npc:12866} waits on a hill outside the dungeon. Her quest is the one the route offered at 32: whoever did it then has nothing to take. The three targets live outside the portal, among the barrows and thorns (elites, 33)."] = "{npc:12866} attend sur une colline devant le donjon. Sa quête est celle que le parcours a proposée vers 32 : qui l'a faite alors n'a rien à prendre. Les trois cibles vivent devant le portail, parmi les terriers et les épines (élites, 33).",
	-- {npc:12866} Myriam Moonsinger
	["{npc:12866}, on a hill outside"] = "{npc:12866}, sur une colline devant le donjon",

	-- Step 6: Razorfen Downs: Belnistrasz
	-- {npc:8516} Belnistrasz
	["Razorfen Downs: {npc:8516}"] = "Souilles de Tranchebauge : {npc:8516}",
	-- {npc:8516} Belnistrasz · {quest:3523} Scourge of the Downs · {quest:3525} Extinguishing the Idol
	["{npc:8516} waits in a prison cell inside. His quests cannot be shared: every player takes {quest:3523} and hands it in to him (he wants his Oathstone back) BEFORE anyone starts {quest:3525}. Then he walks to the idol and casts while waves of enemies come: stay close and keep them off him; it ends at his brazier."] = "{npc:8516} attend dans une cellule à l'intérieur. Ses quêtes ne se partagent pas : chaque joueur prend {quest:3523} et la lui rend (il veut récupérer sa pierre de serment) AVANT que quiconque lance {quest:3525}. Il marche alors jusqu'à l'idole et incante pendant que des vagues d'ennemis arrivent : rester près de lui et les tenir loin ; cela finit à son brasero.",
	-- {npc:8516} Belnistrasz
	["Share nothing here: each player talks to {npc:8516}."] = "Rien à partager ici : chaque joueur parle à {npc:8516}.",
	["Protect him at the idol"] = "Le protéger à l'idole",

	-- Step 7: Razorfen Downs: Amnennar the Coldbringer
	-- {npc:7358} Amnennar the Coldbringer
	["Razorfen Downs: {npc:7358}"] = "Souilles de Tranchebauge : {npc:7358}",
	["The last boss (elite 41), at the far end: he casts frost novas and calls frozen spectres; keep the healer out of his reach."] = "Le dernier boss (élite 41), tout au fond : il lance des novas de givre et appelle des spectres gelés ; garder le soigneur hors de sa portée.",

	-- Step 8: Back to Ratchet
	["Back to Ratchet"] = "Retour à Cabestan",
	-- {object:3204} Booty Bay · {zone:1453} Stormwind
	["The same way back: north along the road past Camp Taurajo to Ratchet, the boat to {object:3204}, then the flight to {zone:1453}. A hearthstone bound in {zone:1453} saves the whole trip."] = "Le même chemin au retour : vers le nord par la route en passant le Camp Taurajo jusqu'à Cabestan, le bateau pour {object:3204}, puis le vol pour {zone:1453}. Une pierre de foyer liée à {zone:1453} évite tout le trajet.",
	-- {object:3204} Booty Bay
	["Boat to {object:3204}"] = "Bateau pour {object:3204}",

	-- Step 9: Fly to Stormwind
	-- {zone:1453} Stormwind
	["Fly to {zone:1453}"] = "Prendre un vol pour {zone:1453}",
	-- {object:3204} Booty Bay
	["{object:3204} flight master"] = "Maître de vol de {object:3204}",

	-- Step 10: Stormwind: Bring the Light
	["Last stop of the chapter: the route's own guide comes back once this is handed in."] = "Dernier arrêt du chapitre : le guide du parcours revient une fois cette quête rendue.",
	-- {npc:1284} Archbishop Benedictus
	["{npc:1284}, in the Cathedral of Light"] = "{npc:1284}, dans la Cathédrale de la Lumière",

	-- No longer in the guide (its English changed or it went away): reuse or delete.
	-- ["{npc:12866} waits on a hill outside the dungeon. Her quest is the one Polestar's route asked about at 32: already done, nothing to take. The three targets live outside the portal, among the barrows and thorns (elites, 33)."] = "{npc:12866} attend sur une colline devant le donjon. Sa quête est celle dont le parcours de Polestar a parlé vers 32 : déjà faite, rien à prendre. Les trois cibles vivent devant le portail, parmi les terriers et les épines (élites, 33).",
}
