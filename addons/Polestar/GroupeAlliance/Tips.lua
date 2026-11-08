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
	[13] = { -- The People's Militia (wowhead forever)
		frFR = "Pilleurs et maraudeurs autour de 44,65 près de Ruisselune ; les mages ont une armure de givre qui ralentit : les prendre un par un.",
		enUS = "Pillagers and Looters around 44,65 near Moonbrook; the mages wear frost armor that slows you: take them one at a time.",
	},
	[14] = { -- The People's Militia (wowhead forever)
		frFR = "Les Défias sont dans les Collines de la Dague au sud-est de Ruisselune (52,71) : ils viennent un par un, réapparition rapide.",
		enUS = "The Defias are in the Dagger Hills south-east of Moonbrook (52,71): they come one at a time and respawn fast.",
	},
	[19] = { -- Tharil'zun (wowhead forever)
		frFR = "Il n'est pas dans le donjon : derrière le portail cassé à droite de l'entrée, près d'un feu, avec deux gardes.",
		enUS = "He is not inside the keep: behind the broken gate right of its entrance, by a camp fire, with two guards.",
	},
	[22] = { -- Goretusk Liver Pie (wowhead forever)
		frFR = "Le foie tombe rarement des sangliers : le faire en même temps que les autres quêtes de la zone qui demandent de les tuer.",
		enUS = "Livers drop rarely from the boars, so do it alongside the other zone quests that have you killing them.",
	},
	[29] = { -- Trial of the Lake (wowhead forever)
		frFR = "Quête chronométrée et bibelot limité à quatre minutes : repérer le sanctuaire de Remulos avant de plonger (bibelot vers 54,46 au fond du lac).",
		enUS = "Timed quest and a bauble that lasts four minutes: find the Shrine of Remulos before diving (bauble near 54,46 on the lake floor).",
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
	[65] = { -- The Defias Brotherhood (wowhead forever)
		frFR = "Le contact à Lakeshire est à l'étage de l'auberge, invisible sur la minicarte.",
		enUS = "The contact in Lakeshire is upstairs in the inn, not shown on the minimap.",
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
	[93] = { -- Dusky Crab Cakes (wowhead forever)
		frFR = "Les pattes tombent sur toutes les araignées, le plus souvent sur les Black Widow Hatchlings à l'est de Raven Hill : les faire en même temps que les autres quêtes d'araignées.",
		enUS = "The legs drop from every spider, most often from the Black Widow Hatchlings east of Raven Hill: do it along with the other spider quests.",
	},
	[95] = { -- Sven's Revenge (wowhead forever)
		frFR = "La terre meuble est à la ferme des Yorgen au sud-est, pas à la ferme isolée du sud-ouest : chercher entre les deux bâtiments.",
		enUS = "The loose dirt is at the Yorgen Farmstead to the south-east, not the far south-west farm; look between its two buildings.",
	},
	[101] = { -- The Totem of Infliction (wowhead forever)
		frFR = "Les crocs de goule tombent mal : les goules du cimetière à l'ouest de la zone sont de plus bas niveau que celles de l'est.",
		enUS = "Ghoul fangs drop poorly; the ghouls in the western cemetery are lower level than the ones in the east.",
	},
	[102] = { -- Patrolling Westfall (wowhead forever)
		frFR = "Les pattes tombent environ une fois sur quatre ; bon coin de gnolls au nord de la mine de Jango (43,14), ils viennent souvent à plusieurs.",
		enUS = "The paws drop about one in four; a good gnoll camp lies north of Jangolode Mine (43,14), they often come in pairs.",
	},
	[115] = { -- Shadow Magic (wowhead forever)
		frFR = "Seuls les Blackrock Shadowcaster donnent les orbes ; seul, la grotte au nord de Comté-du-Lac, un par un.",
		enUS = "Only Blackrock Shadowcasters drop the orbs; alone, the cave north of Lakeshire, one at a time.",
	},
	[125] = { -- The Lost Tools (wowhead forever)
		frFR = "La caisse repose au fond du lac Placide, sous le « L » de Lake sur la carte ; l'atteindre par la rive sud près du pont évite les murlocs.",
		enUS = "The toolbox lies at the bottom of Lake Everstill under the 'L' of Lake on the map; come from the south shore by the bridge to avoid murlocs.",
	},
	[132] = { -- The Defias Brotherhood (wowhead forever)
		frFR = "Wiley the Black attend à l'étage de l'auberge de Comté-du-Lac.",
		enUS = "Wiley the Black waits upstairs in the Lakeshire inn.",
	},
	[133] = { -- Ghoulish Effigy (wowhead forever)
		frFR = "Les morts-vivants autour de la crypte du cimetière lâchent mal les objets : faire la quête seul plutôt qu'en groupe.",
		enUS = "Undead around the cemetery crypt drop the items poorly, so do this solo rather than in a group.",
	},
	[134] = { -- Ogre Thieves (wowhead forever)
		frFR = "La caisse est juste à droite de l'entrée de la grotte des ogres ; entrer dans le vallon par l'ouest permet d'y aller sans combattre.",
		enUS = "The crate sits just right of the ogre cave entrance; entering the vale from the west end lets you reach it without fighting.",
	},
	[135] = { -- The Defias Brotherhood (wowhead forever)
		frFR = "Mathias Shaw est à l'étage du bâtiment du SI:7, dans la Vieille ville : faire coïncider le voyage avec un passage chez l'entraîneur.",
		enUS = "Mathias Shaw is upstairs in the SI:7 building in Old Town: time the trip with a visit to your trainer.",
	},
	[142] = { -- The Defias Brotherhood (wowhead forever)
		frFR = "Le messager part de la forge de Ruisselune vers la carrière de la Côte d'or et revient ; il fuit à faible vie : l'immobiliser (Sarments, Nova de givre) et l'achever vite.",
		enUS = "The Messenger walks from the Moonbrook smithy to the Gold Coast Quarry and back; he flees at low health: root him (Entangling Roots, Frost Nova) and finish him fast.",
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
	[155] = { -- The Defias Brotherhood (wowhead forever)
		frFR = "À la fontaine de Ruisselune, neutraliser tout de suite le lanceur de sorts. Le traître absent ? Quelqu'un l'escorte : attendre son retour ou grouper avec lui.",
		enUS = "At the Moonbrook fountain, crowd-control the caster at once. Traitor not there? Someone is escorting him: wait for him or group up with them.",
	},
	[163] = { -- Raven Hill (wowhead forever)
		frFR = "Jitters tourne autour du puits au sud du cimetière. Pas d'attaque de zone dans les maisons de Raven Hill : des fantômes invisibles ripostent.",
		enUS = "Jitters circles the well south of the cemetery. No area attacks inside the Raven Hill houses: invisible ghosts strike back.",
	},
	[166] = { -- The Defias Brotherhood (wowhead forever)
		frFR = "La tête de VanCleef tombe pour chaque membre du groupe qui a la quête : la prendre avant d'entrer.",
		enUS = "VanCleef's head drops for every group member on the quest: take it before going in.",
	},
	[167] = { -- Oh Brother. . . (wowhead forever)
		frFR = "Foreman Thistlenettle est dehors, au bout de la zone violette des morts-vivants avant le portail, avec un mob lié.",
		enUS = "Foreman Thistlenettle is outside, at the far end of the purple undead area before the portal, with a linked add.",
	},
	[168] = { -- Collecting Memories (wowhead forever)
		frFR = "Les cartes tombent sur les morts-vivants de la zone violette avant le portail, pas dans l'instance ; taux faible et chacun loote les siennes : à laisser si le temps manque.",
		enUS = "The cards drop from the undead in the purple area before the portal, not inside; the rate is low and each player loots their own: leave it if time runs short.",
	},
	[169] = { -- WANTED: Gath'Ilzogg (wowhead forever)
		frFR = "Groupe complet seulement : monter étage par étage sans traîner (réapparitions rapides), neutraliser un garde et tuer le dragonnet tôt.",
		enUS = "Full group only: climb floor by floor without stopping (fast respawns), crowd-control a guard and kill the whelp early.",
	},
	[174] = { -- Look To The Stars (wowhead forever)
		frFR = "Le tube en bronze s'achète au marchand voisin, en stock limité ; s'il est épuisé, essayer les fournisseurs d'ingénierie ou l'hôtel des ventes.",
		enUS = "The Bronze Tube is sold by the vendor next door in limited stock; if he is out, try engineering suppliers or the auction house.",
	},
	[184] = { -- Furlbrow's Deed (wowhead forever)
		frFR = "La quête démarre avec un acte de propriété que lâchent rarement les défias de la forêt d'Elwynn : prévoir de nombreux combats.",
		enUS = "The quest starts from a deed that Defias in Elwynn Forest drop only rarely, so expect many kills before it shows up.",
	},
	[214] = { -- Red Silk Bandanas (wowhead forever)
		frFR = "Scout Riell est en haut de la tour de la Colline des Sentinelles, une fois l'escorte du traître faite ; les bandanas tombent sur tous les Défias du donjon.",
		enUS = "Scout Riell is at the top of the Sentinel Hill tower, once the Traitor's escort is done; the bandanas drop from every Defias in the dungeon.",
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
	[240] = { -- Return to Jitters (wowhead forever)
		frFR = "La rendre en repassant à Raven Hill pour Sven ou le cimetière, pas pour un aller exprès.",
		enUS = "Hand it in when you pass Raven Hill for Sven or the cemetery, not on a trip of its own.",
	},
	[245] = { -- Eight-Legged Menaces (wowhead forever)
		frFR = "Les araignées sont rares et éparpillées le long de la frontière ouest, vers le camp de Sven ; elles réapparaissent lentement.",
		enUS = "The spiders are few and scattered along the western border near Sven's camp, and they respawn slowly.",
	},
	[257] = { -- A Hunter's Boast (route)
		frFR = "Quête chronométrée (15 minutes) : la prendre seulement une fois prêt, sacs et vie pleins, puis aller droit aux buses.",
		enUS = "Timed quest (15 minutes): take it only when ready, bags and health full, then head straight for the buzzards.",
	},
	[258] = { -- A Hunter's Challenge (route)
		frFR = "Encore chronométrée, 12 minutes : les vieux sangliers sont de niveau 16-17, ne pas la prendre trop bas ou fatigué.",
		enUS = "Timed again, 12 minutes: the elder boars are level 16-17, don't take it under-levelled or low on health.",
	},
	[272] = { -- Trial of the Sea Lion (wowhead forever)
		frFR = "Demi-pendentifs : Sombrivage au large de l'embouchure de la Cascade, sous l'eau (48,11) ; Marche de l'Ouest dans la caisse près de la fissure bouillonnante (17,33).",
		enUS = "Half pendants: Darkshore off the mouth of the Cliffspring River, underwater (48,11); Westfall in the box by the bubbling fissure (17,33).",
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
	[373] = { -- The Unsent Letter (wowhead forever)
		frFR = "Chacun loote sa propre lettre sur VanCleef ; elle ouvre la chaîne de la Prison, la garder.",
		enUS = "Everyone loots their own letter from VanCleef; it opens the Stockade chain, so keep it.",
	},
	[377] = { -- Crime and Punishment (wowhead forever)
		frFR = "Vider les salles autour du bout de l'aile ouest avant Dextren : sa peur jette le groupe dans des groupes frais. L'arrêter quand il fuit.",
		enUS = "Clear the rooms around the end of the west wing before Dextren: his fear throws the group into fresh packs. Stop him when he flees.",
	},
	[384] = { -- Beer Basted Boar Ribs (wowhead forever)
		frFR = "Le malt Rhapsodie s'achète auprès de l'aubergiste de Kharanos : le prendre avant de partir chasser les sangliers.",
		enUS = "Rhapsody Malt is sold by the Kharanos innkeeper; buy it before heading out for the boars.",
	},
	[386] = { -- What Comes Around... (wowhead forever)
		frFR = "Targorr se cache dans une cellule du premier couloir (souvent la 1re à droite ou la 2e à gauche) ; le Pistage des humanoïdes du druide le trouve vite.",
		enUS = "Targorr hides in a side cell of the first corridor (often first right or second left); a Druid's Track Humanoids finds him fast.",
	},
	[387] = { -- Quell The Uprising (wowhead forever)
		frFR = "Un tour complet peut laisser un forçat manquant : attendre quelques minutes la réapparition près de l'entrée.",
		enUS = "A full clear can leave you one Convict short: wait a few minutes by the entrance for the respawn.",
	},
	[388] = { -- The Color of Blood (wowhead forever)
		frFR = "Nikova Raskol se promène dans la Vieille ville : si elle n'est pas au repère, faire le tour du quartier.",
		enUS = "Nikova Raskol wanders Old Town: if she is not at the marker, walk round the district.",
	},
	[389] = { -- Bazil Thredd (wowhead forever)
		frFR = "Warden Thelwater est en haut des marches, devant la porte de la Prison.",
		enUS = "Warden Thelwater stands at the top of the stairs, by the Stockade gate.",
	},
	[391] = { -- The Stockade Riots (wowhead forever)
		frFR = "Bazil Thredd (élite 29) frappe fort et sa bombe fumigène étourdit : garder le tank plein de vie. Abandonnée par erreur ? Thelwater la redonne.",
		enUS = "Bazil Thredd (elite 29) hits hard and his Smoke Bomb stuns: keep the tank topped up. Abandoned by mistake? Thelwater offers it again.",
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
	[729] = { -- The Absent Minded Prospector (wowhead forever)
		frFR = "Remtravel attend à l'entrée de son site de fouilles (35,84), à l'ouest de la glaive : contourner le cratère, plein de monstres de niveau 18.",
		enUS = "Remtravel waits at the entrance of his dig site (35,84), west of the glaive: walk around the crater, it is full of level 18 mobs.",
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
	[953] = { -- The Fall of Ameth'Aran (wowhead forever)
		frFR = "Les deux tablettes : l'une couchée au nord-est du camp (43.3,58.7), l'autre debout au sud (42.7,63.2) ; on peut les lire sans entrer au centre.",
		enUS = "The two tablets: one lying at the north-east of the camp (43.3,58.7), one standing at the south (42.7,63.2); both can be read without entering the middle.",
	},
	[955] = { -- Bashal'Aran (wowhead forever)
		frFR = "Les boucles d'oreilles tombent des grells sauvages et des esprits malfaisants (environ une sur quatre) : tuer les deux.",
		enUS = "The earrings drop from both Wild Grells and Vile Sprites (about one in four): kill both.",
	},
	[956] = { -- Bashal'Aran (route)
		frFR = "Les satyres Deth'ryll reviennent lentement : si le camp est vide, il faut attendre leur retour ou les partager avec les autres joueurs.",
		enUS = "The Deth'ryll Satyrs respawn slowly: if the camp is empty, wait for them or share them with other players.",
	},
	[957] = { -- Bashal'Aran (wowhead forever)
		frFR = "La flamme antique est verte, pas bleue : dans un petit kiosque à piliers au sud d'Ameth'Aran (42,61), utiliser le sceau devant.",
		enUS = "The Ancient Flame is green, not blue: in a small pillared gazebo at the south of Ameth'Aran (42,61), use the seal in front of it.",
	},
	[958] = { -- Tools of the Highborne (wowhead forever)
		frFR = "Les reliques tombent souvent des hauts-elfes maudits à l'ouest d'Ameth'Aran (42,57).",
		enUS = "The relics drop often from the cursed Highborne on the west side of Ameth'Aran (42,57).",
	},
	[963] = { -- For Love Eternal (wowhead forever)
		frFR = "Anaya est presque transparente : activer l'affichage des noms de PNJ ou une macro /target pour la repérer dans les ruines.",
		enUS = "Anaya is nearly transparent: turn on NPC names or use a /target macro to spot her in the ruins.",
	},
	[966] = { -- The Tower of Althalaxx (wowhead forever)
		frFR = "Seuls les fanatiques autour de la tour lâchent les parchemins : ne pas entrer, l'intérieur est de niveau bien plus élevé.",
		enUS = "Only the Fanatics around the tower drop the parchments: do not go in, the inside is much higher level.",
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
	[990] = { -- Trek to Ashenvale (wowhead forever)
		frFR = "Après le rendu de l'évasion de Volcor, attendre un peu : la sentinelle Selarin arrive en courant et la propose.",
		enUS = "After handing in Volcor's escape, wait a moment: Sentinel Selarin runs in and offers it.",
	},
	[993] = { -- A Lost Master (wowhead forever)
		frFR = "Lier sa pierre de foyer à Auberdine avant ; dans la grotte, choisir la fuite discrète avec la cape : moins de combats qu'en force.",
		enUS = "Bind your hearthstone to Auberdine first; in the cave, pick the stealthy escape with the cloak: fewer fights than by force.",
	},
	[994] = { -- Escape Through Force (wowhead forever)
		frFR = "Escorte très difficile en solo : nettoyer les camps sur le trajet avant de la lancer, ou venir avec un soigneur.",
		enUS = "A very hard escort solo: clear the camps along the route before starting it, or bring a healer.",
	},
	[995] = { -- Escape Through Stealth (wowhead forever)
		frFR = "La sortie discrète, faisable seul, donne la même suite que la version Force : Trek to Ashenvale.",
		enUS = "The quiet way out, fine alone, leads to the same next quest as the Force way: Trek to Ashenvale.",
	},
	[997] = { -- Denalan's Earth (route)
		frFR = "La quête remet un objet : garder une place libre dans les sacs avant de l'accepter.",
		enUS = "The quest hands over an item: keep a free bag slot before accepting it.",
	},
	[1001] = { -- Buzzbox 411 (wowhead forever)
		frFR = "La boîte est sur la plage juste au nord d'Auberdine ; les monstres marins demandés nagent plus au large.",
		enUS = "The buzzbox is on the beach just north of Auberdine; the thrashers you need swim further out in deeper water.",
	},
	[1003] = { -- Buzzbox 525 (wowhead forever)
		frFR = "Les scalps tombent mal sur les ours grisonnants : il en faut souvent une douzaine ; la boîte est au bord de la route vers 41,80.",
		enUS = "The scalps drop poorly from the Grizzled bears: a dozen kills is common; the box is by the road near 41,80.",
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
	[1138] = { -- Fruit of the Sea (wowhead forever)
		frFR = "Les chairs de crabe tombent mal : les crabes sont nombreux sous le pont vers les ruines de Mathystra, à faire en passant.",
		enUS = "The crab chunks drop poorly: crabs are plentiful under the bridge to the Ruins of Mathystra, do it on the way.",
	},
	[2040] = { -- Underground Assault (wowhead forever)
		frFR = "Gnoam tombe sur Sneed's Shredder ; vider d'abord tous les Goblin Woodcarver, car le broyeur fait fuir de peur vers eux.",
		enUS = "Gnoam drops from Sneed's Shredder; clear every Goblin Woodcarver first, the Shredder's fear sends you running into them.",
	},
	[2078] = { -- Gyromast's Revenge (wowhead forever)
		frFR = "Le robot se réinitialise dans l'eau : l'eau sert à fuir, pas à le tirer de loin. Il craint la peur (Cri psychique, Peur).",
		enUS = "The robot resets in the water: water is an escape, not a way to shoot it from afar. Fear works on it (Psychic Scream, Fear).",
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
	[2139] = { -- Tharnariun's Hope (wowhead forever)
		frFR = "La tanière se trouve par un sentier qui monte à l'est vers 52,35, juste au sud de la grotte des nagas : la mère (19) dort au milieu de quatre oursons.",
		enUS = "The den is up a path heading east near 52,35, just south of the naga cave: the mother (19) sleeps among four cubs.",
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
	[3524] = { -- Washed Ashore (wowhead forever)
		frFR = "La grande créature échouée est sur la plage juste au sud du village (36,50), gardée par quelques murlocs.",
		enUS = "The big beached creature lies on the shore just south of the village (36,50), guarded by a few murlocs.",
	},
	[3905] = { -- Grape Manifest (wowhead forever)
		frFR = "Frère Neals est tout en haut du clocher de l'abbaye : l'escalier en colimaçon part à gauche de l'entrée de la salle d'armes.",
		enUS = "Brother Neals is at the very top of the abbey tower; the spiral stairs start left of the Hall of Arms entrance.",
	},
	[4681] = { -- Washed Ashore (wowhead forever)
		frFR = "La bonne tortue n'est pas celle de la plage au sud : elle est sous l'eau à l'ouest du ponton d'Auberdine (31,46), près d'une épave.",
		enUS = "The right turtle is not the one on the beach to the south: it is underwater west of the Auberdine pier (31,46), near a wreck.",
	},
	[4731] = { -- Beached Sea Turtle (wowhead forever)
		frFR = "Trois carcasses rapprochées au sud-ouest ; les murlocs autour réapparaissent vite : cliquer et repartir. Elles comptent pour Holy Diver.",
		enUS = "Three carcasses close together in the south-west; the murlocs around respawn fast: click and move on. They count for Holy Diver.",
	},
	[4732] = { -- Beached Sea Turtle (wowhead forever)
		frFR = "Elle se prend de plus loin qu'avant : pas besoin de vider les murlocs autour.",
		enUS = "It can be taken from further away than it used to: no need to clear the murlocs around it.",
	},
	[4733] = { -- Beached Sea Creature (route)
		frFR = "Les oracles des brumes grises lancent des éclairs et se soignent : les attirer un par un et les interrompre si possible.",
		enUS = "Greymist Oracles cast lightning and heal themselves: pull them one at a time and interrupt them when possible.",
	},
	[4740] = { -- WANTED: Murkdeep! (wowhead forever)
		frFR = "Vider le camp murloc aux huttes puis rester près du feu : plusieurs vagues arrivent avant que Murkdeep apparaisse.",
		enUS = "Clear the murloc hut camp then stand by the fire: several waves arrive before Murkdeep finally shows up.",
	},
	[4762] = { -- The Cliffspring River (wowhead forever)
		frFR = "Prendre l'échantillon à la cascade près de la mer, sous le pont de la route (50,25), pas à celle de l'intérieur des terres.",
		enUS = "Take the sample at the waterfall by the sea, under the road bridge (50,25), not at the inland one.",
	},
	[4763] = { -- The Blackwood Corrupted (wowhead forever)
		frFR = "Remplir d'abord la coupe au puits d'Auberdine ; à la mort du démon, le talisman tombe au sol à côté de lui, pas dans son butin.",
		enUS = "Fill the bowl at the Auberdine well first; when the demon dies, the talisman lies on the ground beside him rather than in his loot.",
	},
	[4811] = { -- The Red Crystal (wowhead forever)
		frFR = "Le cristal est sur une hauteur à l'est d'Auberdine, contre les montagnes (47,48) : y monter par le nord, des sélénides enragés rôdent autour.",
		enUS = "The crystal sits on a rise east of Auberdine against the mountains (47,48): climb up from the north, Raging Moonkin roam around it.",
	},
	[4812] = { -- As Water Cascades (wowhead forever)
		frFR = "Remplir le tube au puits de lune d'Auberdine, juste à côté de la donneuse : sans tube rempli, le cristal ne se clique pas.",
		enUS = "Fill the tube at the Auberdine moonwell, right next to the quest giver: without a filled tube the crystal cannot be clicked.",
	},
	[4813] = { -- The Fragments Within (wowhead forever)
		frFR = "Nettoyer les sélénides autour du cristal avant de le toucher, puis revenir à Auberdine : la suite se rend sans combat.",
		enUS = "Clear the moonkin around the crystal before touching it, then go back to Auberdine: the rest is handed in without a fight.",
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
	[6123] = { -- Gathering the Cure (wowhead forever)
		frFR = "Les champignons lunaires sont de tout petits champignons tachetés dans les grottes des sélénides à l'est d'Auberdine (cinq grottes) : passer la souris dessus.",
		enUS = "The Lunar Fungi are tiny spotted mushrooms in the moonkin caves east of Auberdine (five caves): sweep the mouse over them.",
	},
	[86614] = { -- Silver of the Waves (route)
		frFR = "La boîte n'est pas toujours au même endroit : nager au fond du lac en surveillant la minicarte, loin des monstres marins de niveau 19-20.",
		enUS = "The toolbox is not always in the same spot: swim along the lake floor watching the minimap, away from the level 19-20 Young Threshadons.",
	},
	[87760] = { -- Holy Diver (wowhead forever)
		frFR = "Gwennyth ne la propose qu'une fois les neuf quêtes de créatures et tortues échouées rendues ; garder les potions reçues pour les quêtes sous l'eau suivantes.",
		enUS = "Gwennyth offers it only once all nine beached creature and turtle quests are handed in; keep the potions it gives for the underwater quests to come.",
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
	[92415] = { -- Remember That I Love You (wowhead forever)
		frFR = "La lettre tachée de sang est près de Rath'mael, dans le cimetière du fond ; chaque joueur clique la sienne.",
		enUS = "The blood-stained letter lies by Rath'mael in the graveyard at the back; each player clicks their own.",
	},
	[92742] = { -- Testing the Wells (wowhead forever)
		frFR = "Les deux puits : ferme des Molsen (46.2,38.3) et ferme des Jansen (56.7,18.7) ; utiliser le kit près de chacun.",
		enUS = "The two wells: Molsen Farm (46.2,38.3) and the Jansen Stead (56.7,18.7); use the kit near each.",
	},
	[92744] = { -- Murloc Gills (wowhead forever)
		frFR = "Taux de butin bas (souvent 30 à 40 murlocs) : la faire avec les autres quêtes de murlocs de la côte ; garder aussi les yeux de murloc pour le ragoût.",
		enUS = "Low drop rate (often 30 to 40 murlocs): do it with the coast's other murloc quests; keep the murloc eyes for the stew too.",
	},
	[92745] = { -- The State of the Mines (wowhead forever)
		frFR = "La faire avec La milice du peuple : mine de Jango d'abord, rendre, puis la carrière de la Côte d'or avec la suite.",
		enUS = "Do it with The People's Militia: Jangolode Mine first, hand in, then the Gold Coast Quarry with the next part.",
	},
	[92747] = { -- Moonbrook Espionage (wowhead forever)
		frFR = "Les caisses sont dans les bâtiments de Ruisselune, grande école comprise : inutile d'affronter des élites.",
		enUS = "The crates sit inside Moonbrook's buildings, the big schoolhouse included: no elite to fight.",
	},
	[92749] = { -- A Dynamite Plan (wowhead forever)
		frFR = "Il faut 10 Rough Dynamite (peu chère), pas de la Coarse malgré le texte : hôtel des ventes ou un ami ingénieur.",
		enUS = "It needs 10 Rough Dynamite (cheap), not Coarse whatever the text says: Auction House or an engineer friend.",
	},
	[92753] = { -- Destruction in Deadmines (wowhead forever)
		frFR = "Poser les explosifs près du centre de la fonderie de Gilnid, puis sortir par l'arrière après VanCleef : pas de pierre de foyer, Alba attend dehors.",
		enUS = "Plant the explosives near the middle of Gilnid's foundry, then leave by the back after VanCleef: no hearthstone, Alba waits outside.",
	},
	[92909] = { -- Harvesting the Harvesters (route)
		frFR = "Les pièces tombent très rarement des golems : ne pas les farmer, rendre la quête seulement si elles sont tombées en route.",
		enUS = "The parts drop very rarely from the golems: don't farm them, hand it in only if they dropped on the way.",
	},
	[92910] = { -- Harvesting the Harvesters (wowhead forever)
		frFR = "L'assemblage tombe très rarement des golems de toute la zone : ne pas le farmer, le rendre s'il tombe.",
		enUS = "The assembly is a very rare drop from golems all over the zone: do not farm it, hand it in if it drops.",
	},
	[95161] = { -- Remember That I Love You (wowhead forever)
		frFR = "À garder pour le Bois de la Pénombre : Avette Fellwood, à Sombre-Comté, donne le Tarnished Locket, un bon collier.",
		enUS = "Keep it for Duskwood: Avette Fellwood in Darkshire gives the Tarnished Locket, a good necklace.",
	},
	[95189] = { -- Crest of Lordaeron (wowhead forever)
		frFR = "Un seul écusson par instance, au hasard : haut des deux tours, porte de crypte à banshee devant le Baron, pied de la tour nord-ouest, mur du kiosque de Bjork (presque invisible).",
		enUS = "One crest per run, at random: the top of either tower, the banshee crypt door before the Baron, the foot of the north-west tower, the wall of Bjork's gazebo (nearly invisible).",
	},
	[95195] = { -- Bloodied Insignia (wowhead forever)
		frFR = "N'importe quel mort-vivant peut lâcher l'insigne de départ : clic droit, puis continuer à ramasser, il y en a pour tout le groupe.",
		enUS = "Any undead can drop the starting insignia: right-click it, then keep looting, there are enough for the whole group.",
	},
	[95213] = { -- Stolen Blasting Powder (route)
		frFR = "Le Baril de poudre vide tombe rarement des troggs Rockjaw : inutile de le farmer, il viendra ou non pendant les autres quêtes de la carrière.",
		enUS = "The Empty Powder Keg is a rare drop from the Rockjaw troggs: do not farm it, it comes or not during the other quarry quests.",
	},
	[95250] = { -- Abominable Creatures (wowhead forever)
		frFR = "Captain Truman est à gauche dès l'entrée ; la tête du Baron tombe pour chaque membre du groupe.",
		enUS = "Captain Truman is on the left at the entrance; the Baron's head drops for every group member.",
	},
	[95646] = { -- Horrors in the Highland (wowhead forever)
		frFR = "Rethiel la donne après ses trois quêtes précédentes ; tuer le Highland Horror du donjon, celui du dehors ne donne pas le cœur de racine.",
		enUS = "Rethiel gives it after his three earlier quests; kill the Highland Horror inside, the one outside does not drop the rootcore.",
	},
	[95647] = { -- Lost in the Thicket Things (wowhead forever)
		frFR = "La partager au groupe à Menethil ; sa suite démarre dans le donjon et ne se partage pas : chacun parle à Ardin.",
		enUS = "Share it with the group in Menethil; its follow-up starts inside and cannot be shared: everyone talks to Ardin.",
	},
	[95737] = { -- Seeking Caitlin (wowhead forever)
		frFR = "Prendre cette quête chez Llana avant celle de Caitlin : une fois Lost in the Thicket Things dans le journal, elle ne se prend plus (1250 XP pour une conversation).",
		enUS = "Take it from Llana before Caitlin's quest: once Lost in the Thicket Things is in your log, it can no longer be taken (1250 XP for a chat).",
	},
	[95772] = { -- Songblade Search (wowhead forever)
		frFR = "Dorin Songblade est dans les écuries de Comté-du-Lac, après le pont ; sa suite se rend aussi à Comté-du-Lac.",
		enUS = "Dorin Songblade is in the Lakeshire stables past the bridge; its follow-up is handed in at Lakeshire too.",
	},
	[95809] = { -- Heartwoven (wowhead forever)
		frFR = "Chacun parle à Ardin dans le donjon pour l'obtenir ; mage et démoniste prennent les potions de mana.",
		enUS = "Each player talks to Ardin inside to get it; Mages and Warlocks pick the mana potions.",
	},
	[95810] = { -- Lost Relic Carry (wowhead forever)
		frFR = "C'est la relique du dernier boss du donjon qui compte ; celle d'un élite du site de fouilles extérieur sert à une autre quête.",
		enUS = "The relic of the dungeon's last boss is the one that counts; the one from an elite at the outdoor dig is for another quest.",
	},
	[95999] = { -- WANTED: Incinerator Gar'im (wowhead forever)
		frFR = "Garder une interruption pour son sort de feu de 2,5 s et tuer ses aides d'abord ; rendre la quête à Solomon même si le journal ne la dit pas finie.",
		enUS = "Save an interrupt for his 2.5 s fire cast and kill his helpers first; hand it in to Solomon even if the log does not show it complete.",
	},
	[96392] = { -- Farsen's Watch (route)
		frFR = "Choisir l'option de vision lointaine dans le dialogue de Farsen, puis appuyer sur Échap pour la quitter dès que l'objectif est rempli.",
		enUS = "Pick the farsight option in Farsen's dialogue, then press Escape to leave it as soon as the objective completes.",
	},
	[96606] = { -- The Great Outdoors (route)
		frFR = "Si s'asseoir près du feu de camp ne valide pas l'objectif, abandonner la quête puis la reprendre règle le problème.",
		enUS = "If sitting by the campfire gives no credit, abandoning the quest and taking it again fixes it.",
	},
	[98013] = { -- Swelling Forces (wowhead forever)
		frFR = "Les guerriers nagas sont plus loin dans les ruines : avancer au lieu de rester au bord ; la faire avec la quête d'Onu pour les reliques des mêmes ruines.",
		enUS = "The naga warriors are deeper in the ruins: push in instead of staying at the edge; do it with Onu's quest for the relics of the same ruins.",
	},
	[98025] = { -- WANTED: Jai'vhanel (wowhead forever)
		frFR = "Le hibou vole vers 45,58, en contournant Ameth'Aran ; aucun renfort, et la plume compte pour tout le groupe.",
		enUS = "The owl flies around 45,58, reached by skirting Ameth'Aran; no adds, and the feather counts for the whole group.",
	},
	[98028] = { -- Baron Marinous (wowhead forever)
		frFR = "Un naga sur onze environ lâche un fragment : les regrouper (échangeables, aussi à l'hôtel des ventes) sur un seul joueur et invoquer une fois, chacun reçoit son globe. Immunisé au Givre.",
		enUS = "About one naga in eleven drops a fragment: pool them (tradeable, also on the Auction House) on one player and summon once, everyone gets a globe. Immune to Frost.",
	},
	[98042] = { -- It's All Fun and Games Until... (wowhead forever)
		frFR = "L'Œil sans pareil tombe rarement (8 à 20 crépusculaires selon les joueurs) ; les disciples se soignent, les interrompre. Le livre ne se prend qu'après La glaive du Maître.",
		enUS = "The Peerless Eye drops rarely (8 to 20 Twilight kills per player reports); the Disciples heal, interrupt them. The book can only be taken after The Master's Glaive.",
	},
	[98387] = { -- Blackrock Blockade (wowhead forever)
		frFR = "Armes, râteliers, sacs de grain, viande et tonneaux se cliquent au sol dans les camps sous Stonewatch ; ils réapparaissent lentement.",
		enUS = "Weapons, racks, grain sacks, meat and water barrels are clicked on the ground in the camps below Stonewatch; they come back slowly.",
	},
	[98396] = { -- The Great Cat Spirit (wowhead forever)
		frFR = "À l'entrée des Tertres, la statue donne un camouflage pour passer les élites de niveau 23 (pas en forme d'ours) ; c'est presque obligatoire au niveau 20.",
		enUS = "At the Barrow Dens entrance, the statue gives stealth to slip past the level 23 elites (not in Bear Form); at level 20 it is nearly a must.",
	},
	[98461] = { -- Unrequited Love (wowhead forever)
		frFR = "Courte quête de passage vers Menethil : Tarrel se tient sur le pont à la sortie du port.",
		enUS = "A short breadcrumb to Menethil: Tarrel stands on the bridge leaving the harbor.",
	},
	[98815] = { -- Highland Hides (wowhead forever)
		frFR = "Il faut d'abord Young Crocolisk Skins ; les peaux tombent sur Shadetooth et les raptors Thicket du donjon.",
		enUS = "Young Crocolisk Skins comes first; the hides drop from Shadetooth and the Thicket raptors inside.",
	},
	[98824] = { -- Prehistoric Prism (wowhead forever)
		frFR = "Magellas réclame une Titan Relic que vous n'avez plus ? Abandonner et reprendre la quête chez Whelgar en redonne une.",
		enUS = "Magellas asks for a Titan Relic you no longer have? Abandon and take the quest again from Whelgar for a new one.",
	},
	[99127] = { -- A Net Disaster (route)
		frFR = "Les pièges à poissons sont petits et se voient mal dans l'eau : longer la rive lentement en les cherchant.",
		enUS = "The fishing traps are small and hard to spot in the water: walk the shore slowly and look for them.",
	},
	[99143] = { -- Bottles and Baubles (route)
		frFR = "Les tas de bric-à-brac sont au milieu du camp murloc : si les murlocs sont trop nombreux autour, mieux vaut laisser cet objectif.",
		enUS = "The junk piles sit in the middle of the murloc camp: if too many murlocs crowd them, leave this objective.",
	},
	[2746] = { -- Items of Some Consequence (wowhead)
		frFR = "Les pommes sont dans un bol sur la table de la ferme juste devant la porte de Hurlevent, côté Comté-de-l'Or ; la soie tombe souvent sur les humanoïdes de la Prison.",
		enUS = "The apples sit in a bowl on the table of the farmhouse just outside the Stormwind gate, on the Goldshire side; Silk Cloth drops often from the Stockade's humanoids.",
	},
	[434] = { -- The Attack! (wowhead forever)
		frFR = "Sur Forever, ce n'est plus une escorte : prendre la quête, puis parler à Tyrion pour lancer l'événement. Toucher Lescovar avant qu'il rentre au donjon, sinon tout recommencer ; en groupe, tout le monde est crédité.",
		enUS = "On Forever it is no longer an escort: take the quest, then talk to Tyrion to start the event. Hit Lescovar before he walks back inside, or start over; in a group everyone gets the credit.",
	},
	[1050] = { -- Mythology of the Titans (wowhead)
		frFR = "Le livre est dans les couloirs étroits de la Bibliothèque, sur un banc ou au sol à gauche en entrant dans la salle ; il réapparaît en une vingtaine de secondes pour le suivant. 8 900 XP sur Forever.",
		enUS = "The book lies in the Library's narrow corridors, on a bench or the floor to the left as you enter the room; it comes back in about 20 seconds for the next player. 8,900 XP on Forever.",
	},
	[1360] = { -- Reclaimed Treasures (wowhead)
		frFR = "Le coffre de Krom est hors de l'instance, dans la grotte extérieure : salle de gauche, au fond derrière un pilier, deux gardes. Celle de droite est celle de la Horde.",
		enUS = "Krom's chest is outside the instance, in the outer cave: the left-hand hall, at the back behind a pillar, two guards. The right-hand one is the Horde's.",
	},
	[2418] = { -- Power Stones (wowhead)
		frFR = "Tous les nains Ombreforge de la fouille et de la grotte extérieure les lâchent, sans entrer dans l'instance ; taux faible, à faire en même temps que le reste.",
		enUS = "Every Shadowforge dwarf of the digsite and the outer cave drops them, no need to enter the instance; the rate is low, do it alongside the rest.",
	},
	[2240] = { -- The Hidden Chamber (wowhead)
		frFR = "Le médaillon du coffre près de Baelog et la hampe que lâche Revelosh forment un bâton (Prehistoria) : le planter dans la salle des cartes, tuer Ironaya, puis entrer jusqu'au fond.",
		enUS = "The Gni'kiv Medallion (chest by Baelog) and the Shaft of Tsol (Revelosh) make the Staff of Prehistoria: plant it in the Map Room, kill Ironaya, then walk all the way in.",
	},
	[2278] = { -- The Platinum Discs (wowhead)
		frFR = "Cliquer les disques, parler à l'esprit à gauche, puis recliquer les disques pour la copie miniature avant de partir.",
		enUS = "Click the Discs, talk to the spirit on the left, then click the Discs again for the miniature copy before leaving.",
	},
	[96800] = { -- Past Due (wowhead forever)
		frFR = "Quête propre à Forever : le livre rouge est posé sur une table, à droite dans la salle de l'arcaniste Doan, au fond de la Bibliothèque du Monastère écarlate. 6 750 XP.",
		enUS = "A Forever-only quest: the red book lies on a table on the right of Arcanist Doan's room, at the far end of the Scarlet Monastery Library. 6,750 XP.",
	},
	-- 0.5.0: guides 30-40 (14 to 17), from Wowhead comments (mostly from the original game,
	-- several agreeing), rewritten.
	[474] = { -- Defeat Nek'rosh (classic)
		frFR = "Nek'rosh est vers 54,56 : grimper la crête depuis la route vers 55,56 pour arriver dans son dos sans nettoyer le camp ; un garde lié vient avec lui.",
		enUS = "Nek'rosh stands near 54,56: climb the ridge from the road around 55,56 to reach his back without clearing the camp; one linked guard comes with him.",
	},
	[510] = { -- Foreboding Plans (classic)
		frFR = "Ce n'est pas un butin : les plans sont posés sur la table du camp du Syndicat (vers 58,68 en Alterac), à côté de la lettre chiffrée de la quête suivante.",
		enUS = "Not a drop: the plans lie on the table of the Syndicate camp (near 58,68 in Alterac), next to the encrypted letter of the other quest.",
	},
	[511] = { -- Encrypted Letter (classic)
		frFR = "La lettre est sur la même table que les plans, dans le camp du Syndicat vers 58,68 en Alterac : les deux se prennent d'un coup.",
		enUS = "The letter lies on the same table as the plans, in the Syndicate camp near 58,68 in Alterac: take both in one go.",
	},
	[512] = { -- Noble Deaths (classic)
		frFR = "Les chevalières tombent souvent sur les espions (camouflés) et les sorciers (Métamorphose) du Syndicat à Strahnbrad, vers 60,45 en Alterac.",
		enUS = "The signet rings drop often from the Syndicate Spies (stealthed) and Wizards (Polymorph) at Strahnbrad, around 60,45 in Alterac.",
	},
	[1387] = { -- Centaur Bounty (classic)
		frFR = "Les oreilles tombent mal (environ une fois sur trois) au village kolkar, vers 70,43 : à faire en même temps que les autres quêtes de centaures.",
		enUS = "The ears drop poorly (about one kill in three) at the Kolkar village, around 70,43: do it alongside the other centaur quests.",
	},
	[1438] = { -- Vahlarriel's Search (classic)
		frFR = "Dalinda est dans le grand bâtiment central de la forteresse de Hache-Tonnerre, vers 55,27 : nettoyer l'étage avant de lancer l'escorte.",
		enUS = "Dalinda is in the big central building of Thunder Axe Fortress, near 55,27: clear the floor before starting the escort.",
	},
	[1012] = { -- Insane Druids (classic)
		frFR = "Entrée du tertre vers 75,75 ; Taneel (77,74, se soigne), Uthil (78,72) et Mavoris (74,74). Patrouilles camouflées et réapparitions rapides : régler sa pierre de foyer avant.",
		enUS = "Barrow entrance near 75,75; Taneel (77,74, heals herself), Uthil (78,72) and Mavoris (74,74). Stealthed patrols and fast respawns: set your hearthstone first.",
	},
	[1027] = { -- Raene's Cleansing (classic)
		frFR = "Le pommeau n'est pas un butin normal : tuer les vases putrides vers 67,77 fait parfois apparaître un coffre sur le corps, c'est lui qu'il faut ouvrir.",
		enUS = "The pommel is not a normal drop: killing the Rotting Slimes near 67,77 sometimes spawns a chest on the corpse, open that.",
	},
	[1028] = { -- Raene's Cleansing (classic)
		frFR = "Le sanctuaire caché est vers 56,49 : le sentier monte depuis 55,51, au-dessus du puits de lune.",
		enUS = "The hidden shrine is near 56,49: the path climbs from 55,51, above the moonwell.",
	},
	[1030] = { -- Raene's Cleansing (wowhead forever)
		frFR = "Prendre la forme de furbolg avec le bâton AVANT d'approcher Krolg, au-dessus de la cascade vers 51,75. Sur Forever, le bâton reste dans les Collections (Maj+P).",
		enUS = "Take furbolg form with the rod BEFORE you get close to Krolg, above the waterfall near 51,75. On Forever the rod stays in Collections (Shift+P).",
	},
	[1031] = { -- The Branch of Cenarius (classic)
		frFR = "Le prince Raze (32, pas élite) se tient vers 78,43, au nord derrière la seule arche : arriver par le camp au sud.",
		enUS = "Prince Raze (32, not elite) stands near 78,43, north past the only archway: come in through the camp to the south.",
	},
	[185] = { -- Tiger Mastery (classic)
		frFR = "Parler d'abord au nain du camp, qui envoie vers Hemet Nesingwary : sans lui, aucune quête de chasse ne s'affiche.",
		enUS = "Talk to the dwarf in camp first, who sends you to Hemet Nesingwary: without him, no hunting quest shows up.",
	},
	[188] = { -- Tiger Mastery (classic)
		frFR = "Sin'Dall rôde sur une petite colline vers 32,17 ; il peut mettre jusqu'à un quart d'heure à réapparaître.",
		enUS = "Sin'Dall prowls a small hill near 32,17; he can take up to a quarter of an hour to come back.",
	},
	[189] = { -- Bloodscalp Ears (classic)
		frFR = "Environ une oreille pour trois ou quatre trolls : la faire avec les autres quêtes des ruines de Bal'lal (29,19), sans entrer au centre des ruines où les chamans attirent tout.",
		enUS = "About one ear per three or four trolls: do it with the other Bal'lal Ruins quests (29,19), without going into the middle where the shamans pull everything.",
	},
	[209] = { -- Skullsplitter Tusks (classic)
		frFR = "Taux très faible, aux ruines de Ziata'jai (vers 44,37) ; patrouilles de trois ou quatre trolls : à faire avec Troll Witchery.",
		enUS = "Very low drop rate, at the Ziata'jai Ruins (around 44,37); patrols of three or four trolls: do it with Troll Witchery.",
	},
	[213] = { -- Hostile Takeover (classic)
		frFR = "Les gobelins du lac (vers 45,19) se fondent dans le décor et attaquent de loin : avancer doucement, ils bougent sans arrêt.",
		enUS = "The lake goblins (around 45,19) blend into the scenery and aggro from far: move slowly, they never stop wandering.",
	},
	[215] = { -- Jungle Secrets (classic)
		frFR = "Le soldat Thorsen ne la donne que si on le sauve : en patrouille, il est pris en embuscade vers 40,8 par deux agents Kurzen. Les tuer, puis accepter tout de suite avant qu'il reparte.",
		enUS = "Private Thorsen only offers it if you save him: on patrol he is ambushed near 40,8 by two Kurzen agents. Kill them, then accept at once before he walks back.",
	},
	[328] = { -- The Hidden Key (classic)
		frFR = "Grotte vers 45,8 : suivre le mur de droite, à la première fourche descendre à droite ; le coffret est parmi les caisses, gardé par 4 ou 5 élites Kurzen.",
		enUS = "Cave near 45,8: follow the right-hand wall, at the first fork go down to the right; the strongbox sits among the crates, guarded by 4 or 5 Kurzen elites.",
	},
}
