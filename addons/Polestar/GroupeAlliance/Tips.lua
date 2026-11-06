-- Quest tips shown in the guide's tooltips (GroupeAlliance.lua): one short sentence per
-- quest. "wowhead": what several Wowhead Forever comments agree on ("classic": Wowhead
-- Classic, "?": not confirmed), "route": a pitfall the free RestedXP Forever guides point
-- out (their method only). Every tip is rewritten in our own words: no text is copied.
local _, ns = ...
ns.GA = ns.GA or {}

ns.GA.Tips = {
	[12] = { -- The People's Militia (route)
		frFR = "Les Trappeurs et Contrebandiers devant la mine de Jango réapparaissent plus vite quand on en tue beaucoup : rester sur place suffit à finir.",
		enUS = "The Trappers and Smugglers outside Jangolode Mine respawn faster the more you kill: staying put is enough to finish.",
	},
	[22] = { -- Goretusk Liver Pie (wowhead forever)
		frFR = "Le foie tombe rarement des sangliers : le faire en même temps que les autres quêtes de la zone qui demandent de les tuer.",
		enUS = "Livers drop rarely from the boars, so do it alongside the other zone quests that have you killing them.",
	},
	[34] = { -- An Unwelcome Guest (wowhead forever)
		frFR = "Le sanglier de niveau 24 se trouve en contrebas, à l'ouest du jardin de la donneuse ; il frappe fort, mieux vaut venir à deux.",
		enUS = "The level 24 boar roams downhill just west of the quest giver's garden; it hits hard, so bring a friend.",
	},
	[37] = { -- Find the Lost Guards (wowhead forever)
		frFR = "Remonter la rivière vers le nord jusqu'à sa fourche : le premier corps repose sur un minuscule îlot, pas sur la grande île.",
		enUS = "Follow the river north to where it forks; the first body lies on a tiny islet, not on the big island.",
	},
	[38] = { -- Westfall Stew (route)
		frFR = "La viande de vautour, les yeux de murloc, les groins, le gombo s'achètent à l'hôtel des ventes et ne sont pas des objets de quête : ne pas les vendre au marchand avant le rendu.",
		enUS = "The vulture meat, murloc eyes, snouts and okra sell at the Auction House and are not quest items: don't sell them to a vendor before the hand-in.",
	},
	[45] = { -- Discover Rolf's Fate (route)
		frFR = "Les murlocs du village boivent une potion pour se soigner en combat : attirer les deux qui gardent les huttes, s'éloigner et tuer l'un après l'autre.",
		enUS = "The village murlocs drink a potion to heal mid-fight: pull the two guarding the huts, step away and kill them one at a time.",
	},
	[47] = { -- Gold Dust Exchange (route)
		frFR = "Ne pas vendre le Sac de billes reçu en récompense : lancé sur un ennemi, il l'étourdit, et il reste utile jusqu'au niveau 60.",
		enUS = "Do not sell the Bag of Marbles it rewards: thrown at an enemy it stuns it, and it stays useful up to level 60.",
	},
	[60] = { -- Kobold Candles (wowhead forever)
		frFR = "Les bougies tombent peu souvent : prendre en même temps la quête de la poudre d'or et celle de la mine de Fargodeep pour tout faire d'un coup.",
		enUS = "Candles drop fairly rarely, so take the Gold Dust and Fargodeep Mine quests too and clear all three in one trip.",
	},
	[61] = { -- Shipment to Stormwind (route)
		frFR = "Prendre les Fusées explosives en récompense : elles font de bons dégâts et servent à séparer un ennemi d'un groupe.",
		enUS = "Pick the Explosive Rockets as the reward: they hit hard and help split one enemy off a pack.",
	},
	[64] = { -- The Forgotten Heirloom (wowhead forever)
		frFR = "La montre se ramasse depuis l'extérieur de la maison gardée, en longeant le mur du côté gauche, sans combattre les gardes.",
		enUS = "The watch can be looted from outside the guarded house by hugging its left wall, without fighting the guards.",
	},
	[66] = { -- The Legend of Stalvan (wowhead forever)
		frFR = "Le coffret est au rez-de-chaussée du grand bâtiment de Ruisselune, près de l'escalier ; l'ouvrir fait apparaître un ennemi de niveau 26.",
		enUS = "The footlocker is by the stairs in the big Moonbrook town hall; opening it spawns a level 26 enemy.",
	},
	[83] = { -- Red Linen Goods (wowhead forever)
		frFR = "Les bandanas tombent surtout sur les défias du champ de citrouilles de Brackwell ; ailleurs dans Elwynn le taux est bien plus faible.",
		enUS = "The bandanas drop best from the Defias at the Brackwell Pumpkin Patch; elsewhere in Elwynn the rate is much worse.",
	},
	[87] = { -- Goldtooth (wowhead forever)
		frFR = "Dent-d'or est au premier niveau de la mine de Fargodeep : si le chemin monte vers une plateforme en bois, ce n'est pas le bon.",
		enUS = "Goldtooth is on the lower floor of Fargodeep Mine; if the path climbs to a wooden platform, it is the wrong level.",
	},
	[88] = { -- Princess Must Die! (wowhead forever)
		frFR = "Princesse est une truie de niveau 9 dans le champ de citrouilles de Brackwell, escortée de deux gardes : la tirer seule ou venir en groupe.",
		enUS = "Princess is a level 9 sow in the Brackwell Pumpkin Patch with two bodyguards; pull carefully or bring a group.",
	},
	[92] = { -- Redridge Goulash (wowhead forever)
		frFR = "La viande de condor tombe très rarement : commencer cette quête tôt et la finir au fil des autres combats de la zone.",
		enUS = "Condor meat drops very rarely, so start this early and finish it while doing the zone's other quests.",
	},
	[95] = { -- Sven's Revenge (wowhead forever)
		frFR = "La terre meuble est à la ferme des Yorgen au sud-est, pas à la ferme isolée du sud-ouest : chercher entre les deux bâtiments.",
		enUS = "The loose dirt is at the Yorgen Farmstead to the south-east, not the far south-west farm; look between its two buildings.",
	},
	[101] = { -- The Totem of Infliction (wowhead forever)
		frFR = "Les crocs de goule tombent mal : les goules du cimetière à l'ouest de la zone sont de plus bas niveau que celles de l'est.",
		enUS = "Ghoul fangs drop poorly; the ghouls in the western cemetery are lower level than the ones in the east.",
	},
	[125] = { -- The Lost Tools (wowhead forever)
		frFR = "La caisse repose au fond du lac Placide, sous le « L » de Lake sur la carte ; l'atteindre par la rive sud près du pont évite les murlocs.",
		enUS = "The toolbox lies at the bottom of Lake Everstill under the 'L' of Lake on the map; come from the south shore by the bridge to avoid murlocs.",
	},
	[133] = { -- Ghoulish Effigy (wowhead forever)
		frFR = "Les morts-vivants autour de la crypte du cimetière lâchent mal les objets : faire la quête seul plutôt qu'en groupe.",
		enUS = "Undead around the cemetery crypt drop the items poorly, so do this solo rather than in a group.",
	},
	[134] = { -- Ogre Thieves (wowhead forever)
		frFR = "La caisse est juste à droite de l'entrée de la grotte des ogres ; entrer dans le vallon par l'ouest permet d'y aller sans combattre.",
		enUS = "The crate sits just right of the ogre cave entrance; entering the vale from the west end lets you reach it without fighting.",
	},
	[150] = { -- Murloc Poachers (wowhead forever)
		frFR = "La rive sud du lac est plus calme : les murlocs y sont plus faciles à tirer un par un qu'autour de l'île.",
		enUS = "The southern shore of the lake is calmer: murlocs there are easier to pull one at a time than around the island.",
	},
	[151] = { -- Poor Old Blanchy (wowhead forever)
		frFR = "Les sacs d'avoine réapparaissent lentement : passer d'une ferme à l'autre plutôt que d'attendre au même endroit.",
		enUS = "Oat sacks respawn slowly, so rotate between the farms instead of waiting in one spot.",
	},
	[153] = { -- Red Leather Bandanas (wowhead forever)
		frFR = "Prendre cette quête avant celles de la milice : les bandanas tombent pendant qu'on tue les défias pour la milice.",
		enUS = "Pick this up before the People's Militia quests, since bandanas drop while killing Defias for the militia.",
	},
	[174] = { -- Look To The Stars (wowhead forever)
		frFR = "Le tube en bronze s'achète au marchand voisin, en stock limité ; s'il est épuisé, essayer les fournisseurs d'ingénierie ou l'hôtel des ventes.",
		enUS = "The Bronze Tube is sold by the vendor next door in limited stock; if he is out, try engineering suppliers or the auction house.",
	},
	[184] = { -- Furlbrow's Deed (wowhead forever)
		frFR = "La quête démarre avec un acte de propriété que lâchent rarement les défias de la forêt d'Elwynn : prévoir de nombreux combats.",
		enUS = "The quest starts from a deed that Defias in Elwynn Forest drop only rarely, so expect many kills before it shows up.",
	},
	[218] = { -- The Stolen Journal (route)
		frFR = "Grik'nir the Cold se tient au fond de la grotte des trolls, et non sur la colline au-dessus : entrer par l'ouverture et suivre le tunnel.",
		enUS = "Grik'nir the Cold waits at the back of the troll cave, not on the hill above it: enter at the mouth and follow the tunnel.",
	},
	[219] = { -- Missing In Action (wowhead forever)
		frFR = "Keeshan attend au fond de la grande salle de la grotte, par un passage du niveau inférieur ; c'est lui qui mène, à faire avec la quête de primes Rochenoire.",
		enUS = "Keeshan waits at the back of the big cave room via a lower-level passage; he leads the way, so pair it with the Blackrock Bounty quest.",
	},
	[225] = { -- The Weathered Grave (wowhead forever)
		frFR = "La tombe n'est pas dans le cimetière : c'est un petit monticule avec une épée plantée, juste au nord de la maison de Morbent Fel.",
		enUS = "The grave is not in the cemetery: it is a small mound with a sword stuck in it, just north of Morbent Fel's house.",
	},
	[239] = { -- Westbrook Garrison Needs Help! (wowhead forever)
		frFR = "Cette quête n'apparaît qu'après avoir rendu la quête de la mine de Jasperlode, à l'est de Comté-de-l'Or : la terminer d'abord.",
		enUS = "This quest only shows up after turning in The Jasperlode Mine, so finish that mine quest east of Goldshire first.",
	},
	[245] = { -- Eight-Legged Menaces (wowhead forever)
		frFR = "Les araignées sont rares et éparpillées le long de la frontière ouest, vers le camp de Sven ; elles réapparaissent lentement.",
		enUS = "The spiders are few and scattered along the western border near Sven's camp, and they respawn slowly.",
	},
	[287] = { -- Frostmane Hold (wowhead forever)
		frFR = "La bonne caverne est au sud-ouest du village de Brewnall, pas celle de la crête au nord-est ; l'exploration se valide au fond.",
		enUS = "The right cave is south-west of Brewnall Village, not the one on the ridge to the north-east; exploration triggers deep inside.",
	},
	[299] = { -- Uncovering the Past (wowhead forever)
		frFR = "Les reliques apparaissent à des endroits variables du site : vérifier la corniche du raptor nommé au sud et sous les ponts de bois.",
		enUS = "Relics spawn in varying spots around the dig: check the named raptor's ledge to the south and under the wooden bridges.",
	},
	[312] = { -- Tundra MacGrann's Stolen Stash (wowhead forever)
		frFR = "Inutile de tuer le yéti élite : attendre qu'il sorte en patrouille, piller le coffre et filer ; MacGrann est sur la crête au-dessus.",
		enUS = "No need to kill the elite yeti: wait for him to patrol out, loot the chest and leave; MacGrann stands on the ridge above.",
	},
	[314] = { -- Protecting the Herd (wowhead forever)
		frFR = "Vagash vit dans une grotte sur la colline derrière la ferme ; le sentier part à l'ouest du ranch, il frappe fort pour son niveau.",
		enUS = "Vagash lives in a cave on the hill behind the farm; the trail starts west of the ranch, and he hits hard.",
	},
	[317] = { -- Stocking Jetsteam (route)
		frFR = "Les Ours de la griffe de glace donnent aussi l'Épaisse fourrure d'ours, pas seulement les jeunes ours noirs.",
		enUS = "Ice Claw Bears drop the Thick Bear Fur too, not only the Young Black Bears.",
	},
	[337] = { -- An Old History Book (wowhead forever)
		frFR = "Le livre qui lance la quête tombe au hasard de n'importe quel monstre du Bois de la Pénombre, et pour un seul membre du groupe.",
		enUS = "The book that starts this quest is a random drop from any Duskwood mob, and only one group member gets it.",
	},
	[384] = { -- Beer Basted Boar Ribs (wowhead forever)
		frFR = "Le malt Rhapsodie s'achète auprès de l'aubergiste de Kharanos : le prendre avant de partir chasser les sangliers.",
		enUS = "Rhapsody Malt is sold by the Kharanos innkeeper; buy it before heading out for the boars.",
	},
	[413] = { -- Shimmer Stout (wowhead forever)
		frFR = "Le destinataire est au dernier poste de Dun Morogh avant la Loch Modan, près d'un chariot, pas dans la Loch Modan.",
		enUS = "The recipient is at the last Dun Morogh outpost before Loch Modan, by a wagon, not inside Loch Modan itself.",
	},
	[464] = { -- War Banners (wowhead forever)
		frFR = "Les bannières tombent rarement des orcs Gueule-de-dragon, nombreux, qui enracinent avec leurs filets : avancer prudemment dans le camp.",
		enUS = "Banners drop rarely from the Dragonmaw orcs, who are numerous and root you with nets, so advance carefully through the camp.",
	},
	[470] = { -- Digging Through the Ooze (wowhead forever)
		frFR = "Le sac tombe au hasard des limons, noirs surtout, et pas des créatures gluantes qui leur ressemblent ; la chance compte beaucoup.",
		enUS = "The bag is a random drop from oozes, mostly black ones, not the look-alike slimes; luck matters a lot.",
	},
	[471] = { -- Apprentice's Duties (wowhead forever)
		frFR = "Seuls les crocilisques géants comptent, pas les jeunes : les chercher sur la côte et au lac à l'est de Menethil.",
		enUS = "Only giant crocolisks count, not young ones; look along the coast and in the lake east of Menethil.",
	},
	[483] = { -- The Relics of Wakening (wowhead forever)
		frFR = "Le tertre se remplit vite de furbolgs qui réapparaissent : avancer sans traîner, combattre avec du recul, ou venir en groupe sous le niveau 12.",
		enUS = "The barrow refills quickly with respawning furbolgs: keep moving, fight with room to back off, or group up below level 12.",
	},
	[486] = { -- Ursal the Mauler (wowhead forever)
		frFR = "Ursal attend tout au sud-ouest, près du lac, au pied d'un arbre couvert de fleurs violettes ; des patrouilles passent sur le chemin.",
		enUS = "Ursal waits in the far south-west near the lake, by a tree covered in purple blossoms; patrols cross the way there.",
	},
	[487] = { -- The Road to Darnassus (route)
		frFR = "La prêtresse lunaire Amara peut être occupée à repousser une embuscade de furbolgs : attendre la fin du combat pour lui parler.",
		enUS = "Moon Priestess Amara can be busy fighting off a furbolg ambush: wait for the fight to end to talk to her.",
	},
	[488] = { -- Zenn's Bidding (wowhead forever)
		frFR = "Aider Zenn ne coûte aucune réputation auprès des elfes de la nuit : la suite de l'histoire n'est que du récit.",
		enUS = "Helping Zenn costs no Night Elf reputation at all; the 'enemy' part is just storyline.",
	},
	[489] = { -- Seek Redemption! (wowhead forever)
		frFR = "Les cônes gangrenés poussent au pied des grands arbres près de Zenn et réapparaissent en une demi-minute environ : attendre sur place.",
		enUS = "Fel Cones grow at the base of the big trees around Zenn and respawn within about half a minute, so waiting nearby works.",
	},
	[731] = { -- The Absent Minded Prospector (route)
		frFR = "Remtravel peut être déjà en escorte avec un autre groupe ; il faut alors attendre son retour au camp avant de lancer l'escorte.",
		enUS = "Remtravel may already be on an escort with another group; wait for him to come back to camp before starting it.",
	},
	[917] = { -- Webwood Egg (wowhead forever)
		frFR = "Les œufs se trouvent tout au fond de la grotte des araignées, sur une corniche en hauteur, gardés par une araignée nommée de niveau 5.",
		enUS = "The eggs sit on a high ledge at the very back of the spider cave, guarded by a named level 5 spider.",
	},
	[930] = { -- The Glowing Fruit (wowhead forever)
		frFR = "Le fruit luisant ne donne la quête qu'après les deux quêtes de graines et de pousses de Denalan : les finir d'abord.",
		enUS = "The glowing fruit only offers its quest once Denalan's seeds and sprouts quests are done, so finish those two first.",
	},
	[932] = { -- Twisted Hatred (wowhead forever)
		frFR = "La grotte grouille de grells et Melenas a plusieurs points d'apparition : explorer toute la grotte et venir en groupe au niveau 6-8.",
		enUS = "The cave is packed with grells and Melenas has several spawn spots: search the whole cave and bring a group around level 6-8.",
	},
	[937] = { -- The Enchanted Glade (route)
		frFR = "Les matriarches Plumesang lancent Vague de soins et Éclair, qui frappe fort : les abattre en priorité et vite.",
		enUS = "Bloodfeather Matriarchs cast Healing Wave and a hard-hitting Lightning Bolt: kill them first and fast.",
	},
	[945] = { -- Therylune's Escape (wowhead forever)
		frFR = "Therylune se camoufle et peut avoir besoin de réapparaître ; pendant l'escorte elle attire tout sur son passage, garder de quoi la soigner.",
		enUS = "Therylune is stealthed and may need time to respawn; during the escort she pulls everything nearby, so keep heals or crowd control ready.",
	},
	[947] = { -- Cave Mushrooms (wowhead forever)
		frFR = "En solo, prendre à droite juste après l'entrée de la grotte des nagas : deux champignons mortels s'y trouvent avec peu de gardes.",
		enUS = "Solo players should go right just inside the naga cave: two Death Caps wait there with only a couple of guards.",
	},
	[951] = { -- Mathystra Relics (wowhead forever)
		frFR = "Les reliques sont des objets au sol en forme de coupe ou de sphère de pierre, pas un butin ; éviter de mourir, le cimetière est loin.",
		enUS = "The relics are not drops: they are ground objects shaped like stone goblets or spheres; avoid dying, the graveyard is very far.",
	},
	[956] = { -- Bashal'Aran (route)
		frFR = "Les satyres Deth'ryll reviennent lentement : si le camp est vide, il faut attendre leur retour ou les partager avec les autres joueurs.",
		enUS = "The Deth'ryll Satyrs respawn slowly: if the camp is empty, wait for them or share them with other players.",
	},
	[963] = { -- For Love Eternal (wowhead forever)
		frFR = "Anaya est presque transparente : activer l'affichage des noms de PNJ ou une macro /target pour la repérer dans les ruines.",
		enUS = "Anaya is nearly transparent: turn on NPC names or use a /target macro to spot her in the ruins.",
	},
	[968] = { -- The Powers Below (wowhead forever)
		frFR = "Le livre qui lance la quête tombe très rarement des cultistes du Crépuscule : compter des dizaines de victimes, la faire seulement si elle tombe en passant.",
		enUS = "The book that starts the quest drops very rarely from Twilight cultists; expect dozens of kills, so only do it if it drops along the way.",
	},
	[982] = { -- Deep Ocean, Vast Sea (wowhead forever)
		frFR = "Chaque coffre est à l'arrière de son épave, côté large, et s'ouvre depuis l'extérieur ; attention aux murlocs qui traversent la coque.",
		enUS = "Each lockbox sits at the stern end of its wreck, seaward side, and opens from outside; watch for murlocs clipping through the hull.",
	},
	[986] = { -- A Lost Master (wowhead forever)
		frFR = "Seuls les mâles et les matriarches comptent et ils lâchent peu ; tuer aussi les grands oiseaux du coin, qui partagent leurs points d'apparition, en fait revenir.",
		enUS = "Only sires and matriarchs count and drops are poor; killing the local foreststriders, which share their spawns, brings more of them.",
	},
	[994] = { -- Escape Through Force (wowhead forever)
		frFR = "Escorte très difficile en solo : nettoyer les camps sur le trajet avant de la lancer, ou venir avec un soigneur.",
		enUS = "A very hard escort solo: clear the camps along the route before starting it, or bring a healer.",
	},
	[997] = { -- Denalan's Earth (route)
		frFR = "La quête remet un objet : garder une place libre dans les sacs avant de l'accepter.",
		enUS = "The quest hands over an item: keep a free bag slot before accepting it.",
	},
	[1001] = { -- Buzzbox 411 (wowhead forever)
		frFR = "La boîte est sur la plage juste au nord d'Auberdine ; les monstres marins demandés nagent plus au large.",
		enUS = "The buzzbox is on the beach just north of Auberdine; the thrashers you need swim further out in deeper water.",
	},
	[1009] = { -- Ruuzel (wowhead forever)
		frFR = "Dame Vespia, qui patrouille seule sur la rive face à l'île, lâche aussi l'anneau ; Ruuzel est toujours accompagné de deux nagas.",
		enUS = "Lady Vespia, patrolling alone on the shore by the island, also drops the ring; Ruuzel always walks with two naga.",
	},
	[1010] = { -- Bathran's Hair (wowhead forever)
		frFR = "Les cheveux sont dans de petits fagots de plantes au sol près du repaire de Bathran ; baisser la densité de l'herbe les rend visibles.",
		enUS = "The hair is in small plant bundles on the ground near Bathran's Haunt; lowering ground clutter makes them visible.",
	},
	[1022] = { -- The Howling Vale (wowhead forever)
		frFR = "Le sentier monte à l'ouest de la route vers Gangrebois jusqu'à une grotte ; le livre est sur une table de l'autre côté.",
		enUS = "The trail climbs west of the road toward Felwood up to a cave; the book is on a table on the far side.",
	},
	[1104] = { -- Salt Flat Venom (wowhead forever)
		frFR = "Le venin tombe surtout des scorpides ravageurs, regroupés autour d'un chariot cassé et d'une tente au bord des plaines.",
		enUS = "Venom drops best from the scorpid reavers grouped around a broken wagon and tent at the edge of the flats.",
	},
	[1105] = { -- Hardened Shells (wowhead forever)
		frFR = "Les tortues sont très nombreuses autour du bateau à moitié ensablé, droit au nord du quartier général de la course.",
		enUS = "Turtles cluster in large numbers around the half-buried ship lying straight north of the racing headquarters on the flats.",
	},
	[1106] = { -- Martek the Exiled (wowhead forever)
		frFR = "Cette quête n'apparaît qu'après avoir rendu les quêtes du venin et des carapaces.",
		enUS = "This quest only appears after turning in both Salt Flat Venom and Hardened Shells.",
	},
	[2098] = { -- Gyromast's Retrieval (wowhead forever)
		frFR = "Chaque morceau de clé vient d'un type précis : les grands oiseaux coureurs du sud, les murlocs de la côte et les crabes de récif.",
		enUS = "Each key piece comes from one specific mob type: the giant foreststriders down south, the coastal murlocs and the reef crawlers.",
	},
	[2118] = { -- Plagued Lands (wowhead forever)
		frFR = "Seuls les ours enragés (pas les ours ordinaires) comptent : en attirer un, poser le piège à ses pieds puis reculer.",
		enUS = "Only Rabid Thistle Bears count: pull one, drop the trap at your feet and step back.",
	},
	[2138] = { -- Cleansing of the Infected (route)
		frFR = "Dans les combats qui traînent, les Ours chardons enragés transmettent la rage, qui divise par deux la régénération de vie pendant dix minutes : mieux vaut les tuer vite.",
		enUS = "Rabid Thistle Bears give Rabies in long fights, halving health regeneration for ten minutes: kill them fast.",
	},
	[2399] = { -- The Sprouted Fronds (route)
		frFR = "Les frondes germées soignent instantanément sans partager le temps de recharge des potions : les garder pour les combats difficiles.",
		enUS = "The Sprouted Fronds heal at once without sharing the potion cooldown: keep them for hard fights.",
	},
	[2438] = { -- The Emerald Dreamcatcher (wowhead forever)
		frFR = "L'objet est rangé dans une commode de la dernière maison du village, toujours au même endroit : survoler les meubles à la souris.",
		enUS = "The dreamcatcher is in a dresser in the last house of the village, always the same spot; hover the furniture to find it.",
	},
	[2459] = { -- Ferocitas the Dream Eater (wowhead forever)
		frFR = "Le joyau demandé est caché dans le collier que laisse Ferocitas : clic droit sur le collier dans les sacs pour l'ouvrir.",
		enUS = "The jewel is inside the necklace Ferocitas drops: right-click the necklace in your bags to open it and get the jewel.",
	},
	[2541] = { -- The Sleeping Druid (wowhead forever)
		frFR = "Le charme tombe rarement des chamans furbolgs du repaire ; il est lootable par tout le groupe, donc mieux vaut venir à plusieurs.",
		enUS = "The charm is a rare drop from the furbolg shamans in the den; it is group loot, so bringing friends saves a lot of time.",
	},
	[2561] = { -- Druid of the Claw (wowhead forever)
		frFR = "Il faut d'abord tuer le druide transformé en ours dans le repaire, puis utiliser le charme sur son cadavre.",
		enUS = "Kill the druid in bear form inside the den first, then use the charm on his corpse.",
	},
	[3361] = { -- A Refugee's Quandary (wowhead forever)
		frFR = "Les trois affaires de Felix sont posées au sol près des feux de camp des trois camps trolls, au sud et à l'ouest d'Anvilmar.",
		enUS = "Felix's three items lie on the ground by the campfires of the three troll camps south and west of Anvilmar.",
	},
	[3364] = { -- Scalding Mornbrew Delivery (route)
		frFR = "Le minuteur de cinq minutes démarre à l'acceptation : la prendre juste avant de rentrer à Anvilmar, sans s'arrêter en route ; en cas d'échec, Nori Pridedrift la redonne.",
		enUS = "The five-minute timer starts on accepting: take it just before heading back to Anvilmar and do not stop on the way; if it fails, Nori Pridedrift offers it again.",
	},
	[3521] = { -- Iverron's Antidote (wowhead forever)
		frFR = "Les champignons tombent des grellkins au sud-ouest de la donneuse de quête, pas dans la grotte ; l'ichor vient des araignées de la grotte.",
		enUS = "The mushrooms drop from the grellkin south-west of the quest giver, not inside the cave; the ichor comes from the cave spiders.",
	},
	[3905] = { -- Grape Manifest (wowhead forever)
		frFR = "Frère Neals est tout en haut du clocher de l'abbaye : l'escalier en colimaçon part à gauche de l'entrée de la salle d'armes.",
		enUS = "Brother Neals is at the very top of the abbey tower; the spiral stairs start left of the Hall of Arms entrance.",
	},
	[4733] = { -- Beached Sea Creature (route)
		frFR = "Les oracles des brumes grises lancent des éclairs et se soignent : les attirer un par un et les interrompre si possible.",
		enUS = "Greymist Oracles cast lightning and heal themselves: pull them one at a time and interrupt them when possible.",
	},
	[4740] = { -- WANTED: Murkdeep! (wowhead forever)
		frFR = "Vider le camp murloc aux huttes puis rester près du feu : plusieurs vagues arrivent avant que Murkdeep apparaisse.",
		enUS = "Clear the murloc hut camp then stand by the fire: several waves arrive before Murkdeep finally shows up.",
	},
	[4763] = { -- The Blackwood Corrupted (wowhead forever)
		frFR = "Remplir d'abord la coupe au puits d'Auberdine ; à la mort du démon, le talisman tombe au sol à côté de lui, pas dans son butin.",
		enUS = "Fill the bowl at the Auberdine well first; when the demon dies, the talisman lies on the ground beside him rather than in his loot.",
	},
	[5321] = { -- The Sleeper Has Awakened (wowhead forever)
		frFR = "Le druide suit le joueur : passer par les bois ou la plage à l'ouest de la route évite les furbolgs ; le cor du coffre voisin le réveille.",
		enUS = "The druid simply follows you: cut through the woods or beach west of the road to dodge furbolgs; the horn in the nearby chest wakes him.",
	},
	[5541] = { -- Ammo for Rumbleshot (wowhead forever)
		frFR = "La caisse de munitions est dans un camp abandonné juste au sud de la Tanière Grisonnante ; rester un instant après la remise vaut le spectacle.",
		enUS = "The ammo crate is in an abandoned camp just south of the Grizzled Den; stick around after turning in for a fun scene.",
	},
	[5545] = { -- A Bundle of Trouble (wowhead forever)
		frFR = "Baisser la densité de l'herbe dans les options graphiques rend les fagots bien plus visibles ; à faire en même temps que la quête des loups et ours voisine.",
		enUS = "Turning ground clutter down in graphics settings makes the bundles much easier to spot; combine with the nearby wolves and bears quest.",
	},
	[91741] = { -- Nibbled-On Book (route)
		frFR = "Rendre le livre à Frère Paxton dès qu'il tombe : la suite fait ramasser des livres volés sur les mêmes kobolds, autant l'avoir avant de finir le camp.",
		enUS = "Hand the book to Brother Paxton as soon as it drops: the follow-up has the same kobolds drop stolen books, so get it before the camp is cleared.",
	},
	[91772] = { -- Shhh! We're Hunting Kobolds (route)
		frFR = "Utiliser le kit de pistage pour afficher les traces de kobold sur la minicarte, puis les cliquer en descendant la route vers Comté-de-l'Or.",
		enUS = "Use the Kobold Tracking Kit to show the tracks on the minimap, then click them on the road down to Goldshire.",
	},
	[91775] = { -- Book Return (route)
		frFR = "Les kobolds de la mine réapparaissent vite et Nimsy appelle un élémentaire en renfort : y aller en groupe et ne pas traîner.",
		enUS = "The kobolds in the mine respawn quickly and Nimsy calls an elemental to help: go as a group and do not linger.",
	},
	[92909] = { -- Harvesting the Harvesters (route)
		frFR = "Les pièces tombent très rarement des golems : ne pas les farmer, rendre la quête seulement si elles sont tombées en route.",
		enUS = "The parts drop very rarely from the golems: don't farm them, hand it in only if they dropped on the way.",
	},
	[95213] = { -- Stolen Blasting Powder (route)
		frFR = "Le Baril de poudre vide tombe rarement des troggs Rockjaw : inutile de le farmer, il viendra ou non pendant les autres quêtes de la carrière.",
		enUS = "The Empty Powder Keg is a rare drop from the Rockjaw troggs: do not farm it, it comes or not during the other quarry quests.",
	},
	[96392] = { -- Farsen's Watch (route)
		frFR = "Choisir l'option de vision lointaine dans le dialogue de Farsen, puis appuyer sur Échap pour la quitter dès que l'objectif est rempli.",
		enUS = "Pick the farsight option in Farsen's dialogue, then press Escape to leave it as soon as the objective completes.",
	},
	[96606] = { -- The Great Outdoors (route)
		frFR = "Si s'asseoir près du feu de camp ne valide pas l'objectif, abandonner la quête puis la reprendre règle le problème.",
		enUS = "If sitting by the campfire gives no credit, abandoning the quest and taking it again fixes it.",
	},
	[99127] = { -- A Net Disaster (route)
		frFR = "Les pièges à poissons sont petits et se voient mal dans l'eau : longer la rive lentement en les cherchant.",
		enUS = "The fishing traps are small and hard to spot in the water: walk the shore slowly and look for them.",
	},
	[99143] = { -- Bottles and Baubles (route)
		frFR = "Les tas de bric-à-brac sont au milieu du camp murloc : si les murlocs sont trop nombreux autour, mieux vaut laisser cet objectif.",
		enUS = "The junk piles sit in the middle of the murloc camp: if too many murlocs crowd them, leave this objective.",
	},
}
