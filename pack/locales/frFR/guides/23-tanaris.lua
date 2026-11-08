-- French (frFR): the guide groupe-alliance/23-tanaris (guides/23-tanaris.guide).
-- Written by `forge i18n guides sync frFR`, which keeps every translation (docs/TRANSLATING.md, "Guide texts").
-- Translate the right-hand sides; "" shows the English. Keep each {kind:id} as it is: the game shows its
-- name there in French (the English is listed above the line). A name the English has in the plural, as words,
-- may be written with the singular's token from its "plural, as words" line: "Bandidos ({npc:251918})", "{npc:251918} ×8".
-- A token marked "no name in this language" would show in English: write that name in French words instead.
-- The comments are rewritten by sync.
return {
	-- Guide
	-- {zone:1446} Tanaris
	["Group 21 · {zone:1446}"] = "Groupe 21 · {zone:1446}",

	-- Step 1: Thousand Needles
	["Everyone at their own pace: what you already did ticks itself, the guide picks up where you are. Playing together? Group XP is best within 4 levels."] = "Chacun à son rythme : ce qui est déjà fait se coche tout seul, le guide reprend où vous en êtes. En groupe ? L'XP de groupe est meilleure à 4 niveaux d'écart ou moins.",

	-- Step 2: Mirage Raceway
	["Mirage Raceway"] = "Circuit des Mirages",
	-- {object:151976} Shimmering Flats · {zone:1441} Thousand Needles · {npc:4454} Fizzle Brassbolts · {npc:4630} Pozzik · {npc:4709} Zamek
	["The Mirage Raceway lies on the {object:151976} in south-east {zone:1441}. {npc:4454} and {npc:4630} are in the camps beside the track.\n{npc:4709} stands by the goblin camp.\nWhile {npc:4709} keeps Rizzle talking, his plans lie unguarded in the gnome camp across the track."] = "Le circuit de Mirage se trouve sur les {object:151976} au sud-est des {zone:1441}. {npc:4454} et {npc:4630} sont dans les camps près de la piste.\n{npc:4709} se tient près du camp gobelin.\nPendant que {npc:4709} occupe Rizzle, ses plans sont sans surveillance dans le camp gnome de l'autre côté de la piste.",
	-- {npc:4630} Pozzik · {quest:1137} News for Fizzle
	["{npc:4630}: only after {quest:1137}"] = "{npc:4630} : seulement après {quest:1137}",
	["He runs off to keep Rizzle busy"] = "Il s'éloigne pour occuper Rizzle Brassbolts",
	-- {object:20805} Rizzle's Unguarded Plans
	["{object:20805}, inside"] = "{object:20805}, à l'intérieur",

	-- Step 4: Gadgetzan
	["Gadgetzan"] = "Gadgetzan",
	-- {object:151976} Shimmering Flats · {zone:1446} Tanaris
	["Ride south-east off the {object:151976} into {zone:1446}. Gadgetzan is just inside the border."] = "Prenez la route au sud-est depuis {object:151976} vers {zone:1446}. Gadgetzan se trouve juste à la frontière.",
	-- {quest:2864} Tran'rek
	["{quest:2864}, north side of town"] = "{quest:2864}, au nord de la ville",
	-- {npc:7407} Chief Engineer Bilgewhizzle
	["{npc:7407}, by the water tower"] = "{npc:7407}, près du château d'eau",
	-- {npc:7408} Spigot Operator Luglunket
	["{npc:7408}, next to him"] = "{npc:7408}, à côté de lui",
	-- {npc:7763} Curgle Cranklehop
	["{npc:7763}: his crate goes to Rut'theran Village, later"] = "{npc:7763} : sa caisse va à Rut'theran Village, plus tard",

	-- Step 5: Steamwheedle Port
	["Ride east across the dunes to the goblin harbour on the north-east coast."] = "Chevauchez vers l'est à travers les dunes jusqu'au Port Gentepression sur la côte nord-est.",
	["The Wanted poster beside him"] = "L'affiche Avis de recherche à côté de lui",
	-- {npc:7847} Caliph Scorpidsting
	["The same poster: {npc:7847} comes much later, after Gadgetzan"] = "La même affiche : {npc:7847} arrive bien plus tard, après Gadgetzan",
	-- {npc:7882} Security Chief Bilgewhizzle
	["{npc:7882}, inside"] = "{npc:7882}, à l'intérieur",
	-- {npc:7881} Stoley
	["{npc:7881}, in the port's tavern; inside"] = "{npc:7881}, dans la taverne du port ; à l'intérieur",

	-- Step 6: Noonshade Ruins: kill these as you meet them
	["Noonshade Ruins: kill these as you meet them"] = "Ruines de Noonshade : tuez-les au fur et à mesure",
	-- plural, as words: Wastewander Rogues = {npc:5615} Wastewander Rogue
	["Ride back west toward Gadgetzan. The Wastewander bandits and thieves hold the dunes on the way; any of them can carry a water pouch.\nCareful: Wastewander Rogues (level 43-44) move stealthed, so they can approach unseen."] = "Revenez vers l'ouest en direction de Gadgetzan. Les bandits et voleurs Errante-guerre tiennent les dunes sur le chemin ; chacun peut porter une poche d'eau.\nAttention : les Voleurs Errante-guerre (niveau 43-44) se déplacent camouflés, ils peuvent donc approcher sans être vus.",

	-- Step 8: Waterspring Field
	["Waterspring Field"] = "Waterspring Field",
	-- {npc:7847} Caliph Scorpidsting
	-- plural, as words: Wastewander Rogues = {npc:5615} Wastewander Rogue
	["The tougher Wastewander rogues, shadow mages and assassins camp south-east of Gadgetzan, south of the bandits. Leave {npc:7847} in the middle of the southern camp for later.\nCareful: Wastewander Rogues keep Sneak up while out of combat, so hidden rogues can join a fight you start at a camp."] = "Les voleurs Errante-guerre plus coriaces, mages de l'ombre et assassins campent au sud-est de Gadgetzan, au sud des bandits. Laissez {npc:7847} au milieu du camp sud pour plus tard.\nAttention : les Voleurs Errante-guerre gardent Camouflage actif hors combat, donc des voleurs cachés peuvent se joindre à un combat que vous lancez dans un camp.",

	-- Step 9: Lost Rigger Cove: kill these as you meet them
	["Lost Rigger Cove: kill these as you meet them"] = "Crique du Gréement Perdu : tuez-les au fur et à mesure",
	-- {npc:7883} Andre Firebeard · {npc:7881} Stoley
	["Follow the coast south to the pirate cove. Southsea pirates crowd the beach and the boats: work along the edge and pull one at a time. {npc:7883} stands on the far side; {npc:7881}'s stolen cargo lies in the camp.\nCareful: Two or three pirates stand with {npc:7883}, and many more pirates from the town join the fight once it starts."] = "Suivez la côte vers le sud jusqu'à la crique des pirates. Les pirates des Mers du Sud envahissent la plage et les bateaux : progressez par le bord et attirez-les un par un. {npc:7883} se tient de l'autre côté ; la cargaison volée de {npc:7881} se trouve dans le camp.\nAttention : deux ou trois pirates se tiennent avec {npc:7883}, et beaucoup d'autres pirates de la ville se joignent au combat dès qu'il commence.",
	-- {quest:2873} Stoley's Shipment
	["{quest:2873}; upstairs"] = "{quest:2873} ; à l'étage",

	-- Step 10: Steamwheedle Port
	-- {npc:7881} Stoley
	["{npc:7881}, inside"] = "{npc:7881}, à l'intérieur",
	-- {npc:7881} Stoley · {object:3204} Booty Bay
	["{npc:7881}'s next delivery goes back to {object:3204}: skip it."] = "La prochaine livraison de {npc:7881} retourne à {object:3204} : ignorez-la.",

	-- Step 11: Noonshade Ruins
	["Noonshade Ruins"] = "Ruines de Noonshade",
	["Careful: Thieves cast Disarm. Rogues stay hidden with Sneak. Assassins use Execute when your health is at 20% or lower."] = "Attention : les Larrons lancent Désarmement. Les Voleurs restent cachés grâce à Camouflage. Les Assassins utilisent Exécution quand votre vie est à 20 % ou moins.",

	-- Step 13: The pool by Sandsorrow Watch
	["The pool by Sandsorrow Watch"] = "Le bassin près de Guet-des-Sables",
	-- {item:8584} Untapped Dowsing Widget
	["Ride north-west to the Sandfury troll camp at Sandsorrow Watch. Use the {item:8584} at the edge of its pool; the trolls stand close, so pull the nearest first."] = "Allez au nord-ouest au camp de trolls Sandfury à Guet-des-Sables. Utilisez {item:8584} au bord de son bassin ; les trolls sont proches, attirez d'abord le plus proche.",
	-- {item:8585} Tapped Dowsing Widget
	["Gives the {item:8585}"] = "Donne le {item:8585}",
	["Pool by Sandsorrow Watch"] = "Bassin près de Guet-des-Sables",

	-- Step 15: The Broken Pillar
	["The Broken Pillar"] = "Le Pilier Brisé",
	-- {npc:7771} Marvon Rivetseeker · {quest:3161} Gahz'ridian
	["Ride south to the dig camp at the Broken Pillar. {npc:7771} hands you a detector helm: wear it to see the {quest:3161} mounds, which lie thick in the sand around the camp and south-west toward the ogres."] = "Allez au sud jusqu'au camp de fouille au Broken Pillar. {npc:7771} vous remet un casque détecteur : équipez-le pour voir les monticules {quest:3161}, qui parsèment le sable autour du camp et au sud-ouest en direction des ogres.",

	-- Step 17: The Noxious Lair
	["The Noxious Lair"] = "The Noxious Lair",
	-- {npc:4196} Silithid Swarm
	-- plural, as words: Centipaar Swarmers = {npc:5457} Centipaar Swarmer
	["Ride north-west to the Centipaar hive in the dunes. Any Centipaar can drop insect parts.\nCareful: Centipaar Swarmers cast {npc:4196} both in and out of combat, which brings small adds that interrupt you."] = "Chevauchez vers le nord-ouest jusqu'à la ruche Centipaar dans les dunes. N'importe quel Centipaar peut lâcher des morceaux d'insecte.\nAttention : les Traînards Centipaar lancent {npc:4196} en combat comme hors combat, ce qui fait venir de petits renforts qui vous interrompent.",

	-- Step 18: Dunemaul Compound
	["Dunemaul Compound"] = "Dunemaul Compound",
	-- {npc:12046} Gor'marok the Ravager
	["Ride south-west to the ogre compound. Brutes and Enforcers (46-48) fill it; {npc:12046} (49) stands in the middle with guards around him: clear them first."] = "Chevauchez au sud-ouest jusqu'à la Base des Cognedunes. Des Brutes Cognedune et des Massacreurs Cognedune (46-48) la remplissent ; {npc:12046} (49) se tient au centre entouré de gardes : éliminez-les d'abord.",
	-- {npc:12046} Gor'marok the Ravager
	["{npc:12046}, below ground"] = "{npc:12046}, sous terre",
	-- {npc:5474} Dunemaul Brute
	["grind on {npc:5474}"] = "tuez en boucle : {npc:5474}",

	-- Step 19: Thistleshrub Valley: kill these as you meet them
	-- {quest:3362} Thistleshrub Valley
	["{quest:3362}: kill these as you meet them"] = "{quest:3362} : tuez-les au passage",
	-- {quest:3362} Thistleshrub Valley
	-- plural, as words: Gnarled Thistleshrubs = {npc:5490} Gnarled Thistleshrub
	["Ride south into {quest:3362}. The Dew Collectors drop the glands; only some are full, so keep the Laden one. Gnarled Thistleshrubs and Rootshapers share the valley. The Thistleshrubs are 48-50, above you: pull one at a time.\nCareful: The other thistleshrub mobs in the area are level 49-50 and wander a lot, so you can easily pull extra mobs."] = "Chevauchez vers le sud jusqu'à {quest:3362}. Les Chardonniers collecteurs de rosée lâchent les glandes ; seules certaines sont remplies, gardez donc celles-là. Les Chardonniers noueux et les Chardonniers taille-racines partagent la vallée. Les Chardonniers noueux sont de niveau 48-50, au-dessus du vôtre : attirez-les un par un.\nAttention : les autres chardonniers du secteur sont de niveau 49-50 et errent beaucoup : vous pouvez facilement en attirer d'autres.",

	-- Step 20: Tooga's escort
	-- {npc:5955} Tooga
	["{npc:5955}'s escort"] = "L'escorte de {npc:5955}",
	-- {npc:5955} Tooga · {npc:6015} Torta · {object:151975} Steamwheedle Port
	["The little turtle {npc:5955} hides at the north end of the valley. Lead him home to his wife {npc:6015}, by the water just east of {object:151975}: he walks slowly and the desert's beasts go for him, so keep him alive."] = "La petite tortue {npc:5955} se cache à l'extrémité nord de la vallée. Ramenez-le chez sa femme {npc:6015}, au bord de l'eau juste à l'est de {object:151975} : il marche lentement et les bêtes du désert l'attaquent, alors gardez-le en vie.",

	-- Step 21: Gadgetzan
	["Ride back west to Gadgetzan."] = "Retournez à l'ouest jusqu'à Gadgetzan.",
	-- {npc:5594} Alchemist Pestlezugg
	["{npc:5594}, inside"] = "{npc:5594}, à l'intérieur",
	-- {npc:7583} Sprinkle · {zone:1425} Hinterlands
	["{npc:7583}'s next ingredient grows in the {zone:1425}, and the route never brings it back: skip it."] = "L'ingrédient suivant de {npc:7583} pousse dans les {zone:1425}, et la route ne le ramène jamais : ignorez-le.",
	-- {npc:11758} Andi Lynn
	["{npc:11758}, on the east side of town"] = "{npc:11758}, à l'est de la ville",

	-- Step 22: Caliph Scorpidsting
	-- {npc:7847} Caliph Scorpidsting
	-- plural, as words: Wastewander Rogues = {npc:5615} Wastewander Rogue
	["Ride south-east to Waterspring Field. {npc:7847} stands in the middle of the southern Wastewander camp: clear around him first.\nCareful: Two stealthed Wastewander Rogues travel with him wherever he goes. At his spawn camp, two shadowmages and their minions are close enough to join a fight with him. Out by the towers you can fight him without them."] = "Allez au sud-est jusqu'au Waterspring Field. {npc:7847} se tient au milieu du camp des Marcheurs du désert du sud : nettoyez les alentours d'abord.\nAttention : Deux voleurs Marcheurs du désert camouflés l'accompagnent où qu'il aille. À son camp de réapparition, deux mages de l'ombre et leurs serviteurs sont assez proches pour rejoindre le combat contre lui. Près des tours, vous pouvez le combattre sans eux.",

	-- Step 23: The Gaping Chasm
	["The Gaping Chasm"] = "The Gaping Chasm",
	["Ride south past the Broken Pillar to the Gaping Chasm, the Hazzali tunnels; Scrimshank's gear lies deep inside.\nCareful: One bug guards the gear. Many bugs patrol the tunnels, some of them level 50, so fights often pull extra adds."] = "Allez au sud en passant le Broken Pillar jusqu'au Gaping Chasm, les tunnels Hazzali ; l'équipement de Scrimshank se trouve au fond.\nAttention : Un insecte garde l'équipement. De nombreux insectes patrouillent dans les tunnels, certains de niveau 50, donc les combats attirent souvent des adds supplémentaires.",
	-- {item:8593} Scrimshank's Surveying Gear
	["{item:8593}; below ground"] = "{item:8593} ; sous terre",

	-- Step 24: Gadgetzan
	-- {zone:1457} Darnassus
	["for {zone:1457}: the route takes you there at 47"] = "pour {zone:1457} : l'itinéraire vous y mène au niveau 47",

	-- Step 25: Fly to Theramore
	["Fly to Theramore"] = "Volez jusqu'à Theramore",
	["Gadgetzan flight master"] = "Maître de vol de Gadgetzan",

	-- Step 26: Boat to Menethil Harbor
	-- {object:1162} Menethil Harbor
	["Boat to {object:1162}"] = "Bateau pour {object:1162}",

	-- Step 27: Fly to Aerie Peak
	["Fly to Aerie Peak"] = "Envolez-vous vers Nid-de-l'Aigle",
	-- {object:1162} Menethil Harbor
	["{object:1162} flight master"] = "Maître de vol de {object:1162}",

	-- Step 30: Sprinkle's Secret Ingredient
	["Underwater"] = "Sous l'eau",
}
