-- Quest tips shown in the guide's tooltips (GroupeAlliance.lua): one short sentence per
-- quest. "wowhead": what several Wowhead Forever comments agree on ("classic": Wowhead
-- Classic, "?": not confirmed), "route": a pitfall the free RestedXP Forever guides point
-- out (their method only). Every tip is rewritten in our own words: no text is copied.
local _, ns = ...
ns.GA = ns.GA or {}

ns.GA.Tips = {
	[12] = { -- The People's Militia (route)
		frFR = "Les trappeurs et contrebandiers devant la Mine Veine-de-Jango réapparaissent plus vite quand on en tue beaucoup : rester sur place suffit à finir.",
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
		frFR = "Les bougies tombent peu souvent : prendre en même temps la quête L'échange de poussière d'or et celle de la Mine de Fargodeep pour tout faire d'un coup.",
		enUS = "Candles drop fairly rarely, so take the Gold Dust and Fargodeep Mine quests too and clear all three in one trip.",
	},
	[61] = { -- Shipment to Stormwind (route)
		frFR = "Prendre les roquettes explosives en récompense : elles font de bons dégâts et servent à séparer un ennemi d'un groupe.",
		enUS = "Pick the Explosive Rockets as the reward: they hit hard and help split one enemy off a pack.",
	},
	[64] = { -- The Forgotten Heirloom (wowhead forever)
		frFR = "La montre se ramasse depuis l'extérieur de la maison gardée, en longeant le mur du côté gauche, sans combattre les gardes.",
		enUS = "The watch can be looted from outside the guarded house by hugging its left wall, without fighting the guards.",
	},
	[65] = { -- The Defias Brotherhood (wowhead forever)
		frFR = "Le contact à Comté-du-Lac est à l'étage de l'auberge, invisible sur la minicarte.",
		enUS = "The contact in Lakeshire is upstairs in the inn, not shown on the minimap.",
	},
	[66] = { -- The Legend of Stalvan (wowhead forever)
		frFR = "Le coffret est au rez-de-chaussée du grand bâtiment de Ruisselune, près de l'escalier ; l'ouvrir fait apparaître un ennemi de niveau 26.",
		enUS = "The footlocker is by the stairs in the big Moonbrook town hall; opening it spawns a level 26 enemy.",
	},
	[83] = { -- Red Linen Goods (wowhead forever)
		frFR = "Les bandanas tombent surtout sur les Défias du Champ de potirons des Brackwell ; ailleurs dans Elwynn le taux est bien plus faible.",
		enUS = "The bandanas drop best from the Defias at the Brackwell Pumpkin Patch; elsewhere in Elwynn the rate is much worse.",
	},
	[87] = { -- Goldtooth (wowhead forever)
		frFR = "Dent-d'or est au premier niveau de la mine de Fargodeep : si le chemin monte vers une plateforme en bois, ce n'est pas le bon.",
		enUS = "Goldtooth is on the lower floor of Fargodeep Mine; if the path climbs to a wooden platform, it is the wrong level.",
	},
	[88] = { -- Princess Must Die! (wowhead forever)
		frFR = "Princesse est une truie de niveau 9 dans le Champ de potirons des Brackwell, escortée de deux gardes : la tirer seule ou venir en groupe.",
		enUS = "Princess is a level 9 sow in the Brackwell Pumpkin Patch with two bodyguards; pull carefully or bring a group.",
	},
	[92] = { -- Redridge Goulash (wowhead forever)
		frFR = "La viande de condor tombe très rarement : commencer cette quête tôt et la finir au fil des autres combats de la zone.",
		enUS = "Condor meat drops very rarely, so start this early and finish it while doing the zone's other quests.",
	},
	[93] = { -- Dusky Crab Cakes (wowhead forever)
		frFR = "Les pattes tombent sur toutes les araignées, le plus souvent sur les jeunes veuves noires à l'est de la Colline-aux-Corbeaux : les faire en même temps que les autres quêtes d'araignées.",
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
		frFR = "Les pattes tombent environ une fois sur quatre ; bon coin de gnolls au nord de la Mine Veine-de-Jango (43,14), ils viennent souvent à plusieurs.",
		enUS = "The paws drop about one in four; a good gnoll camp lies north of Jangolode Mine (43,14), they often come in pairs.",
	},
	[115] = { -- Shadow Magic (wowhead forever)
		frFR = "Seuls les exhalombres Blackrock donnent les orbes ; en solo, la grotte au nord de Comté-du-Lac, un par un.",
		enUS = "Only Blackrock Shadowcasters drop the orbs; alone, the cave north of Lakeshire, one at a time.",
	},
	[125] = { -- The Lost Tools (wowhead forever)
		frFR = "La caisse repose au fond du lac Placide, sous le « L » de Lake sur la carte ; l'atteindre par la rive sud près du pont évite les murlocs.",
		enUS = "The toolbox lies at the bottom of Lake Everstill under the 'L' of Lake on the map; come from the south shore by the bridge to avoid murlocs.",
	},
	[132] = { -- The Defias Brotherhood (wowhead forever)
		frFR = "Wiley le noir attend à l'étage de l'auberge de Comté-du-Lac.",
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
		frFR = "Le messager part de la forge de Ruisselune vers la Carrière de la côte de l'Or et revient ; il fuit à faible vie : l'immobiliser (Sarments, Nova de givre) et l'achever vite.",
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
		frFR = "La Tremblotte tourne autour du puits au sud du cimetière. Pas d'attaque de zone dans les maisons de la Colline-aux-Corbeaux : des fantômes invisibles ripostent.",
		enUS = "Jitters circles the well south of the cemetery. No area attacks inside the Raven Hill houses: invisible ghosts strike back.",
	},
	[166] = { -- The Defias Brotherhood (wowhead forever)
		frFR = "La tête de VanCleef tombe pour chaque membre du groupe qui a la quête : la prendre avant d'entrer.",
		enUS = "VanCleef's head drops for every group member on the quest: take it before going in.",
	},
	[167] = { -- Oh Brother. . . (wowhead forever)
		frFR = "Le contremaître Crispechardon est dehors, au bout de la zone violette des morts-vivants avant le portail, avec un monstre lié.",
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
		frFR = "L'éclaireur Riell est en haut de la tour de la Colline des sentinelles, une fois l'escorte du traître faite ; les bandanas tombent sur tous les Défias du donjon.",
		enUS = "Scout Riell is at the top of the Sentinel Hill tower, once the Traitor's escort is done; the bandanas drop from every Defias in the dungeon.",
	},
	[218] = { -- The Stolen Journal (route)
		frFR = "Grik'nir le Froid se tient au fond de la grotte des trolls, et non sur la colline au-dessus : entrer par l'ouverture et suivre le tunnel.",
		enUS = "Grik'nir the Cold waits at the back of the troll cave, not on the hill above it: enter at the mouth and follow the tunnel.",
	},
	[219] = { -- Missing In Action (wowhead forever)
		frFR = "Keeshan attend au fond de la grande salle de la grotte, par un passage du niveau inférieur ; c'est lui qui mène, à faire avec la quête La prime Blackrock.",
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
		frFR = "La rendre en repassant à la Colline-aux-Corbeaux pour Sven ou le cimetière, pas pour un aller exprès.",
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
		frFR = "Demi-pendentifs : Sombrivage au large de l'embouchure de la Bondissante, sous l'eau (48,11) ; Marche de l'Ouest dans la caisse près de la fissure bouillonnante (17,33).",
		enUS = "Half pendants: Darkshore off the mouth of the Cliffspring River, underwater (48,11); Westfall in the box by the bubbling fissure (17,33).",
	},
	[287] = { -- Frostmane Hold (wowhead forever)
		frFR = "La bonne caverne est au sud-ouest de Brassetout, pas celle de la crête au nord-est ; l'exploration se valide au fond.",
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
		frFR = "Les ours Griffeglace donnent aussi la fourrure d'ours épaisse, pas seulement les jeunes ours noirs.",
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
		frFR = "La bière au malt Rhapsody s'achète auprès de l'aubergiste de Kharanos : la prendre avant de partir chasser les sangliers.",
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
		frFR = "Le gardien Thelwater est en haut des marches, devant la porte de la Prison.",
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
		frFR = "La prêtresse de la lune Amara peut être occupée à repousser une embuscade de furbolgs : attendre la fin du combat pour lui parler.",
		enUS = "Moon Priestess Amara can be busy fighting off a furbolg ambush: wait for the fight to end to talk to her.",
	},
	[488] = { -- Zenn's Bidding (wowhead forever)
		frFR = "Aider Zenn ne coûte aucune réputation auprès des elfes de la nuit : la suite de l'histoire n'est que du récit.",
		enUS = "Helping Zenn costs no Night Elf reputation at all; the 'enemy' part is just storyline.",
	},
	[489] = { -- Seek Redemption! (wowhead forever)
		frFR = "Les gangrenoix poussent au pied des grands arbres près de Zenn et réapparaissent en une demi-minute environ : attendre sur place.",
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
		frFR = "Les matriarches Plumesang lancent Vague de soins et un Éclair qui frappe fort : les abattre en priorité et vite.",
		enUS = "Bloodfeather Matriarchs cast Healing Wave and a hard-hitting Lightning Bolt: kill them first and fast.",
	},
	[945] = { -- Therylune's Escape (wowhead forever)
		frFR = "Therylune se camoufle et peut avoir besoin de réapparaître ; pendant l'escorte elle attire tout sur son passage, garder de quoi la soigner.",
		enUS = "Therylune is stealthed and may need time to respawn; during the escort she pulls everything nearby, so keep heals or crowd control ready.",
	},
	[947] = { -- Cave Mushrooms (wowhead forever)
		frFR = "En solo, prendre à droite juste après l'entrée de la grotte des nagas : deux amanites phalloïdes s'y trouvent avec peu de gardes.",
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
		frFR = "Les boucles d'oreilles tombent des grells sauvages et des fées viles (environ une sur quatre) : tuer les deux.",
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
	[983] = { -- Buzzbox 827 (guide)
		frFR = "« Bigobox 827 » est le vrai nom de la quête : une Bigobox est une petite boîte-robot posée dans la nature. On y rend la quête et elle donne la suivante, jusqu'à Bigobox 525.",
		enUS = "\"Buzzbox 827\" is the quest's real name: a buzzbox is a small robot box standing out in the wild. You hand the quest in to it and it gives the next one, up to Buzzbox 525.",
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
		frFR = "La sortie discrète, faisable seul, donne la même suite que la version par la force : Voyage vers Ashenvale.",
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
		frFR = "Cette quête n'apparaît qu'après avoir rendu Le venin acide des salines et Les carapaces durcies.",
		enUS = "This quest only appears after turning in both Salt Flat Venom and Hardened Shells.",
	},
	[1138] = { -- Fruit of the Sea (wowhead forever)
		frFR = "Les chairs de crabe tombent mal : les crabes sont nombreux sous le pont vers les ruines de Mathystra, à faire en passant.",
		enUS = "The crab chunks drop poorly: crabs are plentiful under the bridge to the Ruins of Mathystra, do it on the way.",
	},
	[2040] = { -- Underground Assault (wowhead forever)
		frFR = "L'indicateur Gnoam tombe sur le déchiqueteur de Sneed ; vider d'abord tous les sculpteurs gobelins, car la peur que lance le déchiqueteur fait fuir vers eux.",
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
		frFR = "Seuls les ours des chardons enragés comptent : en attirer un, poser le piège à ses pieds puis reculer.",
		enUS = "Only Rabid Thistle Bears count: pull one, drop the trap at your feet and step back.",
	},
	[2138] = { -- Cleansing of the Infected (route)
		frFR = "Dans les combats qui traînent, les ours des chardons enragés transmettent la rage, qui divise par deux la régénération de vie pendant dix minutes : mieux vaut les tuer vite.",
		enUS = "Rabid Thistle Bears give Rabies in long fights, halving health regeneration for ten minutes: kill them fast.",
	},
	[2139] = { -- Tharnariun's Hope (wowhead forever)
		frFR = "La tanière se trouve par un sentier qui monte à l'est vers 52,35, juste au sud de la grotte des nagas : la mère (19) dort au milieu de quatre oursons.",
		enUS = "The den is up a path heading east near 52,35, just south of the naga cave: the mother (19) sleeps among four cubs.",
	},
	[2399] = { -- The Sprouted Fronds (route)
		frFR = "Les racines écloses soignent instantanément sans partager le temps de recharge des potions : les garder pour les combats difficiles.",
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
		frFR = "Les trois affaires de Felix sont posées au sol près des feux de camp des trois camps trolls, au sud et à l'ouest de Courbenclume.",
		enUS = "Felix's three items lie on the ground by the campfires of the three troll camps south and west of Anvilmar.",
	},
	[3364] = { -- Scalding Mornbrew Delivery (route)
		frFR = "Le minuteur de cinq minutes démarre à l'acceptation : la prendre juste avant de rentrer à Courbenclume, sans s'arrêter en route ; en cas d'échec, Nori Pridedrift la redonne.",
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
		frFR = "Trois carcasses rapprochées au sud-ouest ; les murlocs autour réapparaissent vite : cliquer et repartir. Elles comptent pour Plongeur sacré.",
		enUS = "Three carcasses close together in the south-west; the murlocs around respawn fast: click and move on. They count for Holy Diver.",
	},
	[4732] = { -- Beached Sea Turtle (wowhead forever)
		frFR = "Elle se prend de plus loin qu'avant : pas besoin de vider les murlocs autour.",
		enUS = "It can be taken from further away than it used to: no need to clear the murlocs around it.",
	},
	[4733] = { -- Beached Sea Creature (route)
		frFR = "Les oracles Grisebrume lancent des éclairs et se soignent : les attirer un par un et les interrompre si possible.",
		enUS = "Greymist Oracles cast lightning and heal themselves: pull them one at a time and interrupt them when possible.",
	},
	[4740] = { -- WANTED: Murkdeep! (wowhead forever)
		frFR = "Vider le camp murloc aux huttes puis rester près du feu : plusieurs vagues arrivent avant que Fondeboue apparaisse.",
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
		frFR = "Le cristal est sur une hauteur à l'est d'Auberdine, contre les montagnes (47,48) : y monter par le nord, des séléniens enragés rôdent autour.",
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
		frFR = "La boîte à outils n'est pas toujours au même endroit : nager au fond du lac en surveillant la minicarte, loin des jeunes battrodons de niveau 19-20.",
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
		frFR = "Utiliser le Kit de pistage des Kobolds pour afficher les traces sur la minicarte, puis cliquer dessus en descendant la route vers Comté-de-l'Or.",
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
		frFR = "La faire avec La milice du peuple : la mine Veine-de-Jango d'abord, rendre, puis la carrière de la côte de l'Or avec la suite.",
		enUS = "Do it with The People's Militia: Jangolode Mine first, hand in, then the Gold Coast Quarry with the next part.",
	},
	[92747] = { -- Moonbrook Espionage (wowhead forever)
		frFR = "Les caisses sont dans les bâtiments de Ruisselune, grande école comprise : inutile d'affronter des élites.",
		enUS = "The crates sit inside Moonbrook's buildings, the big schoolhouse included: no elite to fight.",
	},
	[92749] = { -- A Dynamite Plan (wowhead forever)
		frFR = "Il faut 10 Dynamite basique (peu chère), pas de la Dynamite grossière malgré le texte : hôtel des ventes ou un ami ingénieur.",
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
		frFR = "À garder pour le Bois de la Pénombre : Avette Fellwood, à Sombre-Comté, donne le Médaillon terni, un bon collier.",
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
		frFR = "Le capitaine Truman est à gauche dès l'entrée ; la tête du baron tombe pour chaque membre du groupe.",
		enUS = "Captain Truman is on the left at the entrance; the Baron's head drops for every group member.",
	},
	[95646] = { -- Horrors in the Highland (wowhead forever)
		frFR = "Rethiel la donne après ses trois quêtes précédentes ; tuer l'Horreur des hautes-terres du donjon, celle du dehors ne donne pas le cœur-racine.",
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
		frFR = "L'Œil sans pareil tombe rarement (8 à 20 membres du crépuscule tués selon les joueurs) ; les disciples se soignent, les interrompre. Le livre ne se prend qu'après Le Glaive du Maître.",
		enUS = "The Peerless Eye drops rarely (8 to 20 Twilight kills per player reports); the Disciples heal, interrupt them. The book can only be taken after The Master's Glaive.",
	},
	[98387] = { -- Blackrock Blockade (wowhead forever)
		frFR = "Armes, râteliers, sacs de grain, viande et tonneaux d'eau se cliquent au sol dans les camps sous Guet-de-pierre ; ils réapparaissent lentement.",
		enUS = "Weapons, racks, grain sacks, meat and water barrels are clicked on the ground in the camps below Stonewatch; they come back slowly.",
	},
	[98396] = { -- The Great Cat Spirit (wowhead forever)
		frFR = "À l'entrée des Barrow Dens, la statue donne un camouflage pour passer les élites de niveau 23 (pas en forme d'ours) ; c'est presque obligatoire au niveau 20.",
		enUS = "At the Barrow Dens entrance, the statue gives stealth to slip past the level 23 elites (not in Bear Form); at level 20 it is nearly a must.",
	},
	[98461] = { -- Unrequited Love (wowhead forever)
		frFR = "Courte quête de passage vers Menethil : Tarrel se tient sur le pont à la sortie du port.",
		enUS = "A short breadcrumb to Menethil: Tarrel stands on the bridge leaving the harbor.",
	},
	[98815] = { -- Highland Hides (wowhead forever)
		frFR = "Il faut d'abord Les peaux de jeune crocilisque ; les peaux tombent sur Dent-Sombre et les raptors des fourrés du donjon.",
		enUS = "Young Crocolisk Skins comes first; the hides drop from Shadetooth and the Thicket raptors inside.",
	},
	[98824] = { -- Prehistoric Prism (wowhead forever)
		frFR = "Magellas réclame une Relique des Titans que vous n'avez plus ? Abandonner et reprendre la quête chez Whelgar en redonne une.",
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
		frFR = "Les pommes sont dans un bol sur la table de la ferme juste devant la porte de Hurlevent, côté Comté-de-l'Or ; l'étoffe de soie tombe souvent sur les humanoïdes de la Prison.",
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
		frFR = "Le Médaillon de Gni'kiv (coffre près de Baelog) et la Hampe de Tsol (Revelosh) forment le Bâton de la préhistoire : le planter dans la salle des cartes, tuer Ironaya, puis entrer jusqu'au fond.",
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
		frFR = "Les chevalières tombent souvent sur les espions (camouflés) et les sorciers (Métamorphose) du Syndicat à Strahnbrande, vers 60,45 dans les montagnes d'Alterac.",
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
		frFR = "Le pommeau n'est pas un butin normal : tuer les gelées pourrissantes vers 67,77 fait parfois apparaître un coffre sur le corps, c'est lui qu'il faut ouvrir.",
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
		frFR = "Taux très faible, aux ruines de Ziata'jai (vers 44,37) ; patrouilles de trois ou quatre trolls : à faire avec Sorcellerie troll.",
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
	-- 0.5.0: guides 37-43 (18 to 21), from Wowhead comments (mostly from the original game,
	-- three or more agreeing), rewritten.
	[212] = { -- A Meal Served Cold (classic)
		frFR = "Trente minutes dès l'acceptation : basilics Oeil-de-glace le long de la route au centre de Strangleronce (vers 34,40). Échouée ? La reprendre sans l'abandonner garde le jarret.",
		enUS = "Thirty minutes from the moment you accept: Cold Eye Basilisks along the road in central Stranglethorn (around 34,40). Failed? Take it again without abandoning, the haunch stays.",
	},
	[500] = { -- Crushridge Bounty (classic)
		frFR = "Pas besoin des ogres élites : les ogres normaux de niveau 35 vers 50,58 en Alterac lâchent les dents environ une fois sur trois.",
		enUS = "No need for the elite ogres: the normal level 35 ogres around 50,58 in Alterac drop them about one kill in three.",
	},
	[523] = { -- Baron's Demise (classic)
		frFR = "Le baron Vardus change de camp : au nord de Strahnbrande (vers 49,17 ou 53,20) ou dans la cave de l'auberge (59,43). Pas au premier ? Faire le tour.",
		enUS = "Baron Vardus moves between camps: north of Strahnbrad (near 49,17 or 53,20) or in the inn's cellar (59,43). Not at the first one? Check the others.",
	},
	[537] = { -- Dark Council (classic)
		frFR = "Nagaz (40) est dans la maison au bord du lac au nord de Dalaran (39,14), avec des assassins ; les mages de l'ombre sont à Strahnbrande.",
		enUS = "Nagaz (40) is in the lakeside house north of Dalaran (39,14), with assassins; the shadow mages are in Strahnbrad.",
	},
	[540] = { -- Preserving Knowledge (classic)
		frFR = "La bibliothèque au livre est dans l'école vers 39,46, gardée par un élite 40 ; les tomes tombent sur les ogres normaux dehors.",
		enUS = "The bookcase with the book is in the schoolhouse near 39,46, guarded by a level 40 elite; the tomes drop from the normal ogres outside.",
	},
	[543] = { -- The Perenolde Tiara (classic)
		frFR = "Grel'borg l'Avare, ogre mage élite 39 à deux têtes, erre vers 41,46 dans les ruines d'Alterac. Rendu au donjon de Hurlevent (74,30).",
		enUS = "Grel'borg the Miser, a two-headed level 39 elite ogre mage, roams near 41,46 in the Ruins of Alterac. Handed in at Stormwind Keep (74,30).",
	},
	[551] = { -- The Ensorcelled Parchment (classic)
		frFR = "Le coffre est dans la maison de Nagaz (39,14), avec des hommes de main camouflés : avancer prudemment.",
		enUS = "The chest is in Nagaz's house (39,14), with hidden henchmen: move in carefully.",
	},
	[642] = { -- The Princess Trapped (classic)
		frFR = "Le chemin de la grotte part vers 80,40, la grotte est vers 81,36 ; des lanceurs de sorts kobolds. Après les 12 éclats, cliquer le grand cristal.",
		enUS = "The path to the cave starts near 80,40, the cave is near 81,36; kobold casters inside. After the 12 shards, click the large crystal.",
	},
	[651] = { -- Stones of Binding (classic)
		frFR = "Les trois clés : Tonnerre vers 52,50, Feu vers 25,30, Crête vers 66,29 (monter la colline, pas le premier cercle). Le combat final fait venir des élémentaires.",
		enUS = "The three keys: Thundering near 52,50, Burning near 25,30, Cresting near 66,29 (climb the hill, not the first circle). The last fight brings elemental adds.",
	},
	[660] = { -- Hints of a New Plague? (classic)
		frFR = "Avant de lancer Kinelory (vers 60,55), nettoyer les orcs en contrebas : elle fonce dans les groupes.",
		enUS = "Before starting Kinelory (near 60,55), clear the orcs below: she runs straight into packs.",
	},
	[662] = { -- Deep Sea Salvage (classic)
		frFR = "Le journal du Maiden's Folly (épave est, vers 23,85, près du chaudron d'angle) est le plus dur ; les nagas passent à travers les cloisons.",
		enUS = "The Maiden's Folly log (east wreck, near 23,85, by the corner cauldron) is the hardest; the naga come through the walls.",
	},
	[665] = { -- Sunken Treasure (classic)
		frFR = "Rester à l'entrée de la grotte pendant que le gnome travaille : se battre au fond fait réapparaître sans fin. Deux élémentaires d'eau (40) insensibles au Givre.",
		enUS = "Stay at the cave mouth while the gnome works: fighting deeper in makes things respawn endlessly. Two level 40 water elementals, immune to Frost.",
	},
	[666] = { -- Sunken Treasure (classic)
		frFR = "Les lunettes montrent les gemmes, qui reviennent en une minute environ ; vers 21,90, deux apparaissent ensemble.",
		enUS = "The goggles show the gems, which come back in about a minute; around 21,90, two appear together.",
	},
	[691] = { -- Worth Its Weight in Gold (classic)
		frFR = "La grotte des trolls est vers 68,75 (en bas à droite) : défenses sur tous les trolls, sacoche sur ceux qui ont du mana. L'autre grotte, ce sont des ogres.",
		enUS = "The troll cave is near 68,75 (lower right): tusks from any troll, the pouch from those with mana. The other cave holds ogres.",
	},
	[738] = { -- Find Agmond (classic)
		frFR = "Le squelette de nain est vers 51,62, facile à manquer : clic droit dessus.",
		enUS = "The dwarven skeleton lies near 51,62, easy to miss: right-click it.",
	},
	[739] = { -- Murdaloc (classic)
		frFR = "Murdaloc apparaît vers 49,66 derrière le camp, toutes les 3 à 4 minutes : /cible Murdaloc pour le repérer, tirer ses gardes un par un.",
		enUS = "Murdaloc appears near 49,66 behind the camp, every 3 to 4 minutes: /target Murdaloc to spot him, pull his guards one at a time.",
	},
	[1389] = { -- Draenethyst Crystals (classic)
		frFR = "Ce ne sont pas des butins : des cristaux à ramasser au sol, vers 53,29 et 55,27 près du Sanctuaire des Friches.",
		enUS = "Not drops: crystals to pick up from the ground, near 53,29 and 55,27 by Fallow Sanctuary.",
	},
	[1393] = { -- Galen's Escape (classic)
		frFR = "Tout nettoyer avant : Galen, presque sans armure, attire tout sur son passage. Le coffre est vers 47,39.",
		enUS = "Clear everything first: Galen, with almost no armor, pulls everything on his way. The chest is near 47,39.",
	},
	[2500] = { -- Badlands Reagent Run (classic)
		frFR = "Élémentaires vers 13,36 près de Kargath, vautours surtout vers 16,57 ; les coyotes sont partout.",
		enUS = "Elementals near 13,36 by Kargath, buzzards mostly near 16,57; the coyotes are everywhere.",
	},
	[703] = { -- Barbecued Buzzard Wings (classic)
		frFR = "Les ailes tombent peu : les busards géants tournent en nombre autour de 16,57 et 14,60 ; sinon l'hôtel des ventes.",
		enUS = "The wings drop rarely: the Giant Buzzards circle in numbers around 16,57 and 14,60; otherwise the Auction House.",
	},
	[710] = { -- Study of the Elements: Rock (classic)
		frFR = "Seuls les PETITS élémentaires de roche (37-39) lâchent l'éclat, pas ceux de niveau 40 ; taux faible, le meilleur coin vers 23,43.",
		enUS = "Only the LESSER Rock Elementals (37-39) drop the shard, not the level 40 ones; low rate, best spot near 23,43.",
	},
	[716] = { -- Stone Is Better than Cloth (classic)
		frFR = "Les Brassards guillochés en bronze ne tombent pas : un forgeron les fabrique, ou l'hôtel des ventes (environ 50 pa).",
		enUS = "The Patterned Bronze Bracers do not drop: a blacksmith crafts them, or the Auction House (about 50 silver).",
	},
	[718] = { -- Mirages (classic)
		frFR = "La caisse est au camp Kosh (vers 65,24), à plusieurs places possibles (sous l'appentis, près du chariot, du chaudron) : longer le mur nord.",
		enUS = "The crate is at Camp Kosh (near 65,24), in one of several spots (under the lean-to, by the wagon, by the cauldron): hug the north wall.",
	},
	[719] = { -- A Dwarf and His Tools (classic)
		frFR = "La pioche tombe sur les nains Ombreforge du site de fouilles d'Hammertoe (vers 52,33) et peut demander 20 à 30 victimes ; la carte froissée est sur place, au sol près d'une table (53,34).",
		enUS = "The pick drops from the Shadowforge dwarves at Hammertoe's Digsite (near 52,33) and can take 20 to 30 kills; the crumpled map is right there, on the ground by a table (53,34).",
	},
	[197] = { -- Raptor Mastery (classic)
		frFR = "Tethis rôde près d'un chariot cassé au nord-ouest de l'arène (vers 28,43), avec Déchirure de tendon qui ralentit : nettoyer les camps de raptors autour d'abord.",
		enUS = "Tethis prowls by a broken wagon north-west of the arena (near 28,43), with a slowing Tendon Rip: clear the raptor camps around first.",
	},
	[208] = { -- Big Game Hunter (classic)
		frFR = "Le roi Bangalash, sur sa colline vers 38,34, appelle deux panthères en cours de combat qui ne repartent pas : le tuer du premier coup.",
		enUS = "King Bangalash, on his hill near 38,34, calls two panthers mid-fight that do not leave: kill him on the first try.",
	},
	[348] = { -- Stranglethorn Fever (classic)
		frFR = "Le Coeur de Mokk tombe sur le gorille blanc de la troisième vague : se concentrer sur lui ; la quête compte même si on meurt après l'avoir ramassé.",
		enUS = "The Heart of Mokk drops from the white gorilla of the third wave: focus him; the quest counts even if you die after looting it.",
	},
	[1252] = { -- Lieutenant Paval Reethe (classic)
		frFR = "Dans l'auberge du Repos ombragé brûlée (vers 29,48), l'insigne est minuscule, sur une planche à part : prendre aussi le bouclier et les empreintes en passant.",
		enUS = "In the burned Shady Rest Inn (near 29,48) the badge is tiny, on a single loose plank: also take the shield and the hoofprints while there.",
	},
	[1452] = { -- Rhapsody's Kalimdor Kocktail (classic)
		frFR = "Les gésiers de roc tombent peu (environ 8 %) près de Gadgetzan ; les foies sur les ours de Féralas au sud de Hache-Tripes (vers 58,58).",
		enUS = "The roc gizzards drop rarely (about 8%) near Gadgetzan; the livers from the Feralas bears south of Dire Maul (near 58,58).",
	},
	[93176] = { -- My Little Friends (wowhead forever)
		frFR = "Trois zones à visiter : Arbor Tarantula vers 45.5,19.6, Charançon des foins vers 32.4,28.5, Pique-chair vers 53.3,58.3 : beaucoup de trajet, la faire en passant.",
		enUS = "Three zones to visit: Arbor Tarantula near 45.5,19.6, Hay Weevil near 32.4,28.5, Flesh Picker near 53.3,58.3: lots of travel, do it on the way.",
	},
	-- 0.6.0: levels 30-43, Wowhead comments read on 2026-11-08
	[187] = { -- Tiger Mastery (classic)
		frFR = "Les tigres sont à l'ouest de la route, entre le premier et le deuxième pont, entre les Ruines de Kal'ai et de Bal'lal (vers 31,16 à 35,20).",
		enUS = "The tigers are west of the road between the first and second bridge, between the Kal'ai and Bal'lal Ruins (around 31,16 to 35,20).",
	},
	[191] = { -- Panther Mastery (classic)
		frFR = "Les panthères sont au nord-nord-ouest des Ruines de Bal'lal, vers 29,16, avec une réapparition rapide ; les raptors de Strangleronce sont juste à côté.",
		enUS = "The panthers are north-north-west of the Bal'lal Ruins, around 29,16, with fast respawns; the Stranglethorn Raptors are right next to them.",
	},
	[192] = { -- Panther Mastery (classic)
		frFR = "Les panthères Ombregueule sont camouflées et éparpillées près des routes, par exemple vers 47,23 ; une macro /target Ombregueule aide à les repérer.",
		enUS = "The Shadowmaw Panthers are stealthed and spread near the roads, for example around 47,23; a /target Shadowmaw macro helps spot them.",
	},
	[193] = { -- Panther Mastery (classic)
		frFR = "Bhag'thera apparaît soit vers 48,20, soit vers 48,28 : vérifier les deux endroits, avec une macro /target Bhag'thera.",
		enUS = "Bhag'thera spawns either around 48,20 or around 48,28: check both spots, with a /target Bhag'thera macro.",
	},
	[194] = { -- Raptor Mastery (classic)
		frFR = "Les raptors sont sur le plateau au sud-est des Ruines de Zul'Kunda, vers 27,16 ; les petits attaquent avec leurs mères.",
		enUS = "The raptors are on the plateau south-east of the Ruins of Zul'Kunda, around 27,16; the young ones attack along with their mothers.",
	},
	[198] = { -- Supplies to Private Thorsen (classic)
		frFR = "Le Soldat Thorsen part en patrouille et ne prend la quête qu'une fois revenu au Camp rebelle (37,3) : l'attendre là.",
		enUS = "Private Thorsen goes on patrol and only takes the quest once he is back at the Rebel Camp (37,3): wait for him there.",
	},
	[200] = { -- Bookie Herod (classic)
		frFR = "Les registres sont à l'étage du seul bâtiment à deux niveaux de la Base de Kurzen (43,10) ; ils peuvent aussi se ramasser de dehors, sous les poutres à l'arrière.",
		enUS = "The records are upstairs in the only two-storey building of Kurzen's Compound (43,10); they can also be looted from outside, under the beams at the back.",
	},
	[204] = { -- Bad Medicine (classic)
		frFR = "Le Remède tropical tombe peu des guérisseurs de Kurzen, qui se soignent : les interrompre. Les réducteurs de tête de Kurzen dans la grotte du camp le lâchent bien plus souvent.",
		enUS = "Jungle Remedy drops rarely from the Kurzen Medicine Men, who heal themselves: interrupt them. The Kurzen Headshrinkers in the camp's cave drop it far more often.",
	},
	[205] = { -- Troll Witchery (classic)
		frFR = "Le Fétiche Skullsplitter ne tombe que des sorciers-docteurs et mystiques Skullsplitter ; guerriers et lanceurs de haches partagent leurs points de réapparition, les tuer aussi.",
		enUS = "The Skullsplitter Fetish only drops from Skullsplitter Witch Doctors and Mystics; the warriors and axe throwers share their spawn points, so kill them too.",
	},
	[207] = { -- Kurzen's Mystery (classic)
		frFR = "Les quatre tablettes sont au sol dans les ruines trolls : 29,19, 25,23, 22,13 et 24,8 ; celle de Zul'Kunda (22,13) est la plus entourée, y aller par le sud.",
		enUS = "The four tablets lie on the ground in the troll ruins: 29,19, 25,23, 22,13 and 24,8; the Zul'Kunda one (22,13) is the most guarded, approach from the south.",
	},
	[321] = { -- Lightforge Iron (classic)
		frFR = "Un lingot est dans le coffre de l'épave juste au sud de l'auberge de Menethil (12,64) ; les autres tombent des murlocs autour.",
		enUS = "One ingot is in the chest on the wreck just south of the Menethil inn (12,64); the rest drop from the murlocs around it.",
	},
	[324] = { -- The Lost Ingots (classic)
		frFR = "Butin très rare et murlocs qui lancent des filets et fuient pour ramener des renforts ; un autre camp plus au sud sur la côte est souvent moins fréquenté.",
		enUS = "Very rare drop, and the murlocs throw nets and flee to bring friends; another camp further south along the coast is usually less crowded.",
	},
	[338] = { -- The Green Hills of Stranglethorn (classic)
		frFR = "Seules existent les pages 1, 4, 6, 8, 10, 11, 14, 16, 18, 20, 21, 24, 25, 26 et 27 : inutile de chercher les autres. Elles tombent de tout monstre de la zone ou s'achètent.",
		enUS = "Only pages 1, 4, 6, 8, 10, 11, 14, 16, 18, 20, 21, 24, 25, 26 and 27 exist: don't look for others. Any mob in the zone can drop them, or buy them.",
	},
	[339] = { -- Chapter I (classic)
		frFR = "Chapitre I : pages 1, 4, 6 et 8. Elles tombent de tout monstre de Strangleronce ; les manquantes se trouvent souvent pas chères à l'hôtel des ventes.",
		enUS = "Chapter I: pages 1, 4, 6 and 8. Any Stranglethorn mob can drop them; missing ones are often cheap at the Auction House.",
	},
	[340] = { -- Chapter II (classic)
		frFR = "Chapitre II : pages 10, 11, 14 et 16. Elles tombent de tout monstre de Strangleronce ; les manquantes se trouvent souvent pas chères à l'hôtel des ventes.",
		enUS = "Chapter II: pages 10, 11, 14 and 16. Any Stranglethorn mob can drop them; missing ones are often cheap at the Auction House.",
	},
	[341] = { -- Chapter III (classic)
		frFR = "Chapitre III : pages 18, 20, 21 et 24. Elles tombent de tout monstre de Strangleronce ; les manquantes se trouvent souvent pas chères à l'hôtel des ventes.",
		enUS = "Chapter III: pages 18, 20, 21 and 24. Any Stranglethorn mob can drop them; missing ones are often cheap at the Auction House.",
	},
	[342] = { -- Chapter IV (classic)
		frFR = "Chapitre IV : pages 25, 26 et 27. Elles tombent de tout monstre de Strangleronce ; les manquantes se trouvent souvent pas chères à l'hôtel des ventes.",
		enUS = "Chapter IV: pages 25, 26 and 27. Any Stranglethorn mob can drop them; missing ones are often cheap at the Auction House.",
	},
	[349] = { -- Stranglethorn Fever (classic)
		frFR = "Le Coeur de Mokk tombe du gorille blanc de la troisième vague ; prendre Effrayer Philippe le Chancelant avant, ses abats viennent des gorilles du même vallon.",
		enUS = "The Heart of Mokk drops from the white gorilla in the third wave; take Scaring Shaky first, its giblets come from the gorillas in the same valley.",
	},
	[465] = { -- Nek'rosh's Gambit (classic)
		frFR = "La catapulte est vers 47,47, entourée de nombreux orcs : les attirer un par un, puis cliquer sur l'engrenage actif avec le bois en sac pour lancer la suite.",
		enUS = "The catapult is around 47,47, surrounded by many orcs: pull them one at a time, then click the active cog with the timber in your bags to get the next step.",
	},
	[505] = { -- Syndicate Assassins (classic)
		frFR = "Au centre du camp du Promontoire de Sofera, lire les documents posés sur la table : ils lancent Lettre codée et Documents d'annonce d'attaque.",
		enUS = "In the middle of the Sofera's Naze camp, read the papers on the table: they start Encrypted Letter and Foreboding Plans.",
	},
	[522] = { -- Assassin's Contract (classic)
		frFR = "Le contrat vient d'un événement : attendre au centre d'Austrivage, entre l'auberge et la mairie, que le crieur donne l'alerte ; deux Assassin des ténèbres attaquent alors.",
		enUS = "The contract comes from an event: wait in the middle of Southshore, between the inn and the town hall, until the crier raises the alarm; two Shadowy Assassins then attack.",
	},
	[555] = { -- Soothing Turtle Bisque (classic)
		frFR = "Les tortues longent la rivière à l'est d'Austrivage jusqu'au Moulin-de-Tarren, la viande tombe environ une fois sur trois ; les Épices apaisantes s'achètent à Austrivage (48,55).",
		enUS = "The turtles line the river east of Southshore up to Tarren Mill, meat drops about one kill in three; the Soothing Spices are sold in Southshore (48,55).",
	},
	[559] = { -- Farren's Proof (classic)
		frFR = "La Tête de murloc tombe peu souvent ; les marche-boue et cours-la-côte plus à l'ouest (vers 33,70) la lâchent mieux et sont de plus bas niveau que les oracles.",
		enUS = "Murloc Heads drop rarely; the muckdwellers and coastrunners further west (around 33,70) drop them more often and are lower level than the oracles.",
	},
	[564] = { -- Costly Menace (classic)
		frFR = "Les deux sortes de lions sont nombreuses sur L'Avancée (Alterac 38,90) avec une réapparition rapide ; prendre Syndicat d'assassins avant, ses cibles sont tout près.",
		enUS = "Both lion types are plentiful on The Headland (Alterac 38,90) and respawn fast; grab Syndicate Assassins first, its targets are close by.",
	},
	[565] = { -- Bartolo's Yeti Fur Cloak (classic)
		frFR = "Il faut aussi un Rouleau d'étoffe de laine et une Cape d'homme des collines (artisans ou hôtel des ventes) ; tout garder dans les sacs, pas en banque, sinon le rendu reste grisé.",
		enUS = "You also need a Bolt of Woolen Cloth and a Hillman's Cloak (crafters or Auction House); keep everything in your bags, not the bank, or the hand-in stays greyed out.",
	},
	[574] = { -- Special Forces (classic)
		frFR = "Demande Mauvaise médecine et La seconde rébellion rendues ; les commandos sont dans la grotte du camp et autour de son entrée (45,8).",
		enUS = "Requires Bad Medicine and The Second Rebellion turned in; the commandos are in the camp's cave and around its entrance (45,8).",
	},
	[575] = { -- Supply and Demand (classic)
		frFR = "La grande peau tombe des crocilisques des rivières ordinaires, le long de la rivière près de l'Expédition de Nesingwary (35,10) : inutile de chercher des « grands » crocilisques.",
		enUS = "The large skin drops from ordinary River Crocolisks along the river by Nesingwary's Expedition (35,10): no need to hunt for \"large\" ones.",
	},
	[577] = { -- Some Assembly Required (classic)
		frFR = "Les Crocilisque Gueule d'acier de la rive sud-est du Lac Nazfériti (vers 40,29) lâchent bien les peaux, contrairement à ceux près de Grom'gol ; les bêtes autour sont plus fortes.",
		enUS = "The Snapjaw Crocolisks on the south-east shore of Lake Nazferiti (around 40,29) drop the skins well, unlike those near Grom'gol; the beasts around them are tougher.",
	},
	[578] = { -- The Stone of the Tides (classic)
		frFR = "L'île est en face de la côte, directement à l'ouest de l'Expédition de Nesingwary (21,21) ; le passage à la bibliothèque de Hurlevent est facultatif.",
		enUS = "The island is offshore, due west of Nesingwary's Expedition (21,21); the Stormwind library visit is optional.",
	},
	[587] = { -- Up to Snuff (classic)
		frFR = "Tous les pirates de la Voile sanglante lâchent le tabac, souvent : à faire en même temps que Les boucaniers de la Voile sanglante sur Le Rivage cruel, au sud de Baie-du-Butin.",
		enUS = "Every Bloodsail pirate drops snuff, often: do it alongside The Bloodsail Buccaneers on the Wild Shore south of Booty Bay.",
	},
	[595] = { -- The Bloodsail Buccaneers (classic)
		frFR = "Le papier n'est pas dans la barque : il est posé sur un tonneau du camp juste avant, à gauche en sortant de Baie-du-Butin (vers 27,69).",
		enUS = "The paper is not in the boat: it lies on a barrel in the camp just before it, left out of Booty Bay (around 27,69).",
	},
	[600] = { -- Venture Company Mining (classic)
		frFR = "Les gobelins visés sont au sud des Ruines de Balia'mah, vers 40,44, pas au nord de la vallée ; ils réapparaissent vite et des contremaîtres patrouillent, éviter la grotte du fond.",
		enUS = "The goblins you want are south of the Balia'mah Ruins, around 40,44, not in the north of the zone; they respawn fast and foremen patrol, so avoid the back cave.",
	},
	[604] = { -- The Bloodsail Buccaneers (classic)
		frFR = "Les ordres et les cartes apparaissent au hasard en trois endroits : grand camp (26,82), petite tente (29,80) et barque (27,83) ; faire le tour, et Faire un tabac au passage.",
		enUS = "The orders and charts spawn at random in three spots: the big camp (26,82), the small tent (29,80) and the rowboat (27,83); check them all and do Up to Snuff along the way.",
	},
	[605] = { -- Singing Blue Shards (classic)
		frFR = "Les Basilic de cristal sont sur les falaises de la côte ouest, au sud de Zul'Kunda (vers 24,16 à 26,18), avec un bon taux de butin.",
		enUS = "The Crystal Spine Basilisks are on the west coast cliffs south of Zul'Kunda (around 24,16 to 26,18), with a good drop rate.",
	},
	[627] = { -- Favor for Krazek (classic)
		frFR = "Il faut miner le minerai dans la grotte (85,34, montée à partir de 80,40, derrière un rocher) ou l'acheter à l'hôtel des ventes ; kobolds serrés qui fuient à mi-vie.",
		enUS = "You must mine the ore in the cave (85,34, climb from 80,40, hidden behind a rock) or buy it at the Auction House; the kobolds stand close and flee at low health.",
	},
	[631] = { -- The Thandol Span (classic)
		frFR = "Au milieu du pont vers Arathi, prendre la porte côté est et descendre trois niveaux : le corps est au sol. Des nains Sombrefer apparaissent dès qu'on le fouille, filer aussitôt.",
		enUS = "Halfway across the bridge to Arathi, take the east door and go down three levels: the body lies on the floor. Dark Iron dwarves spawn as soon as you loot it, so leave right away.",
	},
	[637] = { -- Sully Balloo's Letter (classic)
		frFR = "La Lettre détrempée est dans la main d'un nain mort, sous l'eau au pied du pont effondré (Arathi 44,93), à côté d'une catapulte ; le chemin pour sortir de l'eau est vers 53,91.",
		enUS = "The Waterlogged Letter is in a dead dwarf's hand, underwater below the broken bridge (Arathi 44,93) by a catapult; the way out of the water is near 53,91.",
	},
	[647] = { -- MacKreel's Moonshine (classic)
		frFR = "Le donneur est sur un pan isolé du pont effondré : sauter depuis la pointe côté nord-ouest du grand pont (Arathi 42,90). Nager jusqu'à Dun Garok évite la route de la Horde.",
		enUS = "The quest giver stands on a cut-off piece of the broken bridge: jump from the jagged tip on the north-west side of the main bridge (Arathi 42,90). Swimming to Dun Garok avoids the Horde road.",
	},
	[657] = { -- Hints of a New Plague? (classic)
		frFR = "Tuer d'avance les péons de la grange, qui ne réapparaissent pas ; les grunts près des silos réapparaissent au passage de Kinelory, inutile de les nettoyer.",
		enUS = "Kill the peons in the barn beforehand, they don't respawn; the grunts by the silos respawn as Kinelory arrives, so don't bother clearing them.",
	},
	[658] = { -- Hints of a New Plague? (classic)
		frFR = "Le courrier part de la Ferme de Go'Shek avec quatre gardes et suit la route vers Moulin-de-Tarren ; des gardes montés de l'Alliance l'attaquent en chemin, les suivre aide.",
		enUS = "The courier leaves Go'shek Farm with four guards and follows the road toward Tarren Mill; mounted Alliance guards attack him on the way, following them helps.",
	},
	[659] = { -- Hints of a New Plague? (classic)
		frFR = "Quae est dans les Hautes-terres Arathies (60,54), près du moulin qui domine la ferme, et non dans les Contreforts de Hautebrande.",
		enUS = "Quae is in the Arathi Highlands (60,54), by the windmill overlooking the farm, not in Hillsbrad Foothills.",
	},
	[693] = { -- Wand over Fist (classic)
		frFR = "Demande Valoir son poids en or ; grotte de droite à 54,77, puis la branche gauche : Kor'gresh Coldrage attend au bout (55,82).",
		enUS = "Requires Worth Its Weight in Gold; take the right-hand cave at 54,77, then the left fork: Kor'gresh Coldrage waits at the end (55,82).",
	},
	[705] = { -- Pearl Diving (classic)
		frFR = "Les Perle bleue se ramassent dans les palourdes de Strangleronce même sans la quête : en prendre neuf avant de quitter la vallée.",
		enUS = "Blue Pearls can be looted from Stranglethorn clams even without the quest: grab nine before leaving the zone.",
	},
	[709] = { -- Solution to Doom (classic)
		frFR = "Dans Uldaman, ne pas sauter vers l'entrée du donjon : rester sur le chemin haut et prendre à droite à la fourche ; la tablette est au centre de la salle scellée, au sud.",
		enUS = "In Uldaman, don't drop down to the dungeon entrance: stay on the upper path and keep right at the fork; the tablet is in the middle of the sealed hall to the south.",
	},
	[711] = { -- Study of the Elements: Rock (classic)
		frFR = "Seuls les élémentaires de roche simples lâchent les plaques, pas les inférieurs, supérieurs ou enragés ; ils sont nombreux au sud de Lotwil, vers 44,80.",
		enUS = "Only plain Rock Elementals drop the slabs, not the lesser, greater or enraged ones; there are many south of Lotwil, around 44,80.",
	},
	[720] = { -- A Sign of Hope (classic)
		frFR = "La Carte chiffonnée est au sol près d'une table du camp nain sur la crête (53,34), à l'ouest de la fosse ; les nains ont des attaques à distance et viennent en groupe.",
		enUS = "The Crumpled Map lies on the ground by a table in the dwarf camp on the ridge (53,34), west of the pit; the dwarves have ranged attacks and come in groups.",
	},
	[1026] = { -- Raene's Cleansing (classic)
		frFR = "La clé tombe des Anciens fous et Anciens flétris autour du coffre, posé sur une petite colonne de marbre (54,35) ; Shael'dryn attend ensuite au puits de lune (53,46).",
		enUS = "The key drops from the Crazed and Withered Ancients around the chest, which sits on a short marble column (54,35); Shael'dryn then waits at the moonwell (53,46).",
	},
	[1035] = { -- Fallen Sky Lake (classic)
		frFR = "La pierre tombe de l'unique oracle (niveau 30), sur le petit îlot du Lac Tombeciel (66,82) ; l'attirer à l'écart des autres monstres.",
		enUS = "The stone drops from the lone oracle (level 30) on the small islet of Fallen Sky Lake (66,82); pull him away from the other mobs.",
	},
	[1045] = { -- Raene's Cleansing (classic)
		frFR = "Ran Dent-rouge est vers 55,80, au sud du sentier de Krolg, avec un garde collé ; nettoyer d'abord les gardes de Dent-rouge et les bêtes autour, qui réapparaissent vite.",
		enUS = "Ran Bloodtooth is near 55,80, south of the path to Krolg, with one guard attached; clear the Bloodtooth Guards and nearby beasts first, they respawn fast.",
	},
	[1046] = { -- Raene's Cleansing (wowhead forever)
		frFR = "Sur Forever, le bâton de transformation en furbolg reste après le rendu : inutile de sauter la fin de la chaîne pour le garder.",
		enUS = "On Forever the furbolg disguise rod stays after the hand-in: no need to skip the end of the chain to keep it.",
	},
	[1055] = { -- Raene's Cleansing (classic)
		frFR = "L'Autel caché est une grosse pierre lumineuse au nord-ouest de la Retraite de Raynebois, vers 56,49 ; le sentier qui y monte part de 55,51.",
		enUS = "The Hidden Shrine is a large glowing stone north-west of Raynewood Retreat, near 56,49; the path up starts at 55,51.",
	},
	[1078] = { -- Retrieval for Mauren (classic)
		frFR = "Les Ecailles de cristal tombent rarement de tous les basilics du Val calciné : tuer aussi harpies et élémentaires du coin, ils partagent les points de réapparition.",
		enUS = "Crystalized Scales drop rarely from any basilisk in The Charred Vale: kill the local harpies and elementals too, they share the spawn points.",
	},
	[1246] = { -- The Missing Diplomat (classic)
		frFR = "Dashel attend dans une ruelle cachée de la Vieille ville (70,45), dont l'entrée fait face à la Taverne du Cochon siffleur.",
		enUS = "Dashel waits in a hidden alley in Old Town (70,45), whose entrance faces the Pig and Whistle Tavern.",
	},
	[1249] = { -- The Missing Diplomat (classic)
		frFR = "Une fois la quête acceptée, Slim se camoufle et file vers la sortie : courir à la porte de l'auberge pour l'intercepter, il n'est attaquable qu'une fois un peu dehors.",
		enUS = "Once you accept, Slim stealths and heads for the exit: run to the inn door to catch him, he can only be attacked once he is a little outside.",
	},
	[1265] = { -- The Missing Diplomat (classic)
		frFR = "Entrer dans la tour de la Halte de la Vigie suffit à valider ; si l'Archimage Tervosh n'y est pas, ressortir et revenir, ou attendre qu'un autre joueur ait fini.",
		enUS = "Walking into the Sentry Point tower completes it; if Archmage Tervosh isn't there, step out and come back, or wait for another player to finish.",
	},
	[1302] = { -- James Hyal (classic)
		frFR = "À l'Auberge du Repos ombragé (29,48), l'insigne est sur la planche seule (pas les deux croisées) au milieu de l'auberge ; le Bouclier noir et les traces de sabots lancent d'autres quêtes.",
		enUS = "At Shady Rest Inn (29,48) the badge is on the single plank (not the two crossed ones) inside; the Black Shield and the hoofprints start other quests.",
	},
	[1392] = { -- Noboru the Cudgel (classic)
		frFR = "Le Gourdin de Noboru est gris et ne tombe qu'une fois : ne pas le vendre (attention aux addons de vente auto) et faire un clic droit dessus pour lancer la quête.",
		enUS = "Noboru's Cudgel is grey and drops only once: don't sell it (beware of auto-sell addons) and right-click it to start the quest.",
	},
	[1439] = { -- Search for Tyranis (classic)
		frFR = "Tyranis (niveau 36) est dans le bâtiment à gauche du principal (52,28), à la même place que Dalinda dans le sien ; après lui, retourner voir Dalinda pour l'escorter.",
		enUS = "Tyranis (level 36) is in the building left of the main one (52,28), in the same spot as Dalinda in hers; afterwards go back to Dalinda to escort her out.",
	},
	[1440] = { -- Return to Vahlarriel (classic)
		frFR = "Les monstres devant le bâtiment réapparaissent vite : lancer l'escorte dès le bâtiment nettoyé et sortir sans traîner.",
		enUS = "The mobs outside the building respawn quickly: start the escort as soon as the building is cleared and get out without lingering.",
	},
	[1447] = { -- The Missing Diplomat (classic)
		frFR = "Dashel arrive avec deux acolytes : frapper Dashel lui-même, il rappelle ses hommes et redevient amical vers la moitié de sa vie ; lui reparler ensuite.",
		enUS = "Dashel brings two helpers: hit Dashel himself, he calls them off and turns friendly around half health; talk to him again afterwards.",
	},
	[1454] = { -- The Karnitol Shipwreck (classic)
		frFR = "Le Coffre de Karnitol est sur la plage à l'ouest de Hache-Tonnerre (36,30), près de débris flottants ; ramasser aussi le journal posé à côté, il lance une autre quête.",
		enUS = "Karnitol's Chest is on the beach west of Thunder Axe (36,30) near floating debris; also pick up the journal beside it, it starts another quest.",
	},
	[1458] = { -- Reagents for Reclaimers Inc. (classic)
		frFR = "Proposée seulement après Les affaires de Récupérateurs SA en Désolace ; les satyres sont autour de Sargeron (vers 75,21).",
		enUS = "Only offered after Reclaimers' Business in Desolace; the satyrs are around Sargeron (near 75,21).",
	},
	[1459] = { -- Reagents for Reclaimers Inc. (classic)
		frFR = "Scorpions, basilics, vautours et élémentaires partagent les points de réapparition : rester au même endroit (41,51 ou 72,32) et tout tuer fait revenir des scorpions.",
		enUS = "Scorpions, basilisks, vultures and elementals share spawn points: stay in one spot (41,51 or 72,32) and kill everything so scorpions come back.",
	},
	[1465] = { -- Vahlarriel's Search (classic)
		frFR = "Dalinda Malem est au centre du grand bâtiment de la Forteresse de Hache-Tonnerre (54,26) ; avancer en tirant les gardes un par un.",
		enUS = "Dalinda Malem is in the middle of the main building of Thunder Axe Fortress (54,26); work in by pulling the guards one at a time.",
	},
	[1466] = { -- Reagents for Reclaimers Inc. (classic)
		frFR = "Tout tombe presque à coup sûr au Convent de Mannoroc : chasseurs de mages et seigneur vers 56,75, sœurs vers 54,76, capitaines et ensorceleuses vers 51,82.",
		enUS = "Everything drops almost every time at Mannoroc Coven: mage hunters and the lord near 56,75, sisters near 54,76, captains and sorceresses near 51,82.",
	},
	[1718] = { -- The Islander (classic)
		frFR = "L'île est vers 68,48 : suivre le haut-fond qui part de 66,48 pour l'atteindre sans tomber dans la zone de fatigue.",
		enUS = "The island is near 68,48: follow the shallows starting at 66,48 to reach it without hitting the fatigue zone.",
	},
	[2279] = { -- The Platinum Discs (classic)
		frFR = "Après avoir parlé au PNJ qui apparaît, réutiliser les disques pour obtenir les Disques de platine miniature avant de quitter Uldaman.",
		enUS = "After talking to the NPC that appears, use the discs again to get the Miniature Platinum Discs before leaving Uldaman.",
	},
	[2398] = { -- The Lost Dwarves (classic)
		frFR = "Quête d'introduction : elle ne peut plus être rendue si La Chambre secrète a déjà été acceptée ou rendue.",
		enUS = "Breadcrumb quest: it can no longer be turned in once The Hidden Chamber has been accepted or completed.",
	},
	[5501] = { -- Bone Collector (classic)
		frFR = "Ne pas tuer de kodos : faire un clic droit sur les crânes isolés au sol du Cimetière des kodos. Une apparition de kodo surgit souvent, être prêt à combattre.",
		enUS = "Don't kill kodos: right-click the lone skulls on the ground of the Kodo Graveyard. A kodo apparition often appears, so be ready to fight.",
	},
	[5561] = { -- Kodo Roundup (classic)
		frFR = "Après avoir apprivoisé un kodo au Cimetière des kodos, l'amener près de Smeed puis faire un clic droit sur le kodo pour qu'il compte ; répéter pour chacun.",
		enUS = "After taming a kodo at the Kodo Graveyard, bring it next to Smeed, then right-click the kodo itself to get credit; repeat for each one.",
	},
	[5741] = { -- Sceptre of Light (classic)
		frFR = "Le Prophète de la Lame ardente est en haut de la tour de guet juste à gauche en passant la porte de la Forteresse de Hache-Tonnerre (55,30) ; attendre sa réapparition s'il manque.",
		enUS = "The Burning Blade Seer is at the top of the watchtower just left of Thunder Axe Fortress's gate (55,30); wait for his respawn if he is missing.",
	},
	[65602] = { -- What Is Love? (wowhead forever)
		frFR = "La figurine est à l'étage de la maison (26,22) ; prendre la Torche éteinte sur la table dehors et l'allumer à un feu de camp, à poser avec la cuisine ou près d'un PNJ voisin.",
		enUS = "The figurine is upstairs in the house (26,22); take the Unlit Torch from the table outside and light it at a campfire, placed with Cooking or found by a nearby NPC.",
	},
	[79536] = { -- Greater Friend of the Library (wowhead forever)
		frFR = "Les livres se ramassent dans le monde (souvent aux emplacements de la rune Barrage des arcanes de SoD), par personnage ; rendu au sommet de la tour des mages de Hurlevent.",
		enUS = "The books are picked up around the world (often at the Season of Discovery Arcane Barrage rune spots), per character; turn in at the top of the Stormwind mage tower.",
	},
	[87318] = { -- Hearts of the Lost (wowhead forever)
		frFR = "Sur Forever, le donneur ne propose plus cette quête, même avec toute la zone faite : ne pas perdre de temps à la chercher.",
		enUS = "On Forever the quest giver no longer offers this quest, even with the whole zone done: don't waste time looking for it.",
	},
	[87491] = { -- Spark of Freedom (wowhead forever)
		frFR = "À mi-chemin de la sortie du camp, une embuscade attaque ; le PNJ escorté se défend bien, mais garder ses soins et ses temps de recharge pour ce moment.",
		enUS = "About halfway out of the camp an ambush attacks; the escorted NPC holds up well, but save heals and cooldowns for that moment.",
	},
	[98027] = { -- Gleaming Crescent Necklace (wowhead forever)
		frFR = "Petit objet blanc dans la rivière vers 63,71, signalé par un point d'exclamation sur la mini-carte ; il faut un niveau minimum (refusé au 19, accepté au 23).",
		enUS = "Small white object in the river around 63,71, marked by an exclamation point on the minimap; it has a minimum level (refused at 19, accepted at 23).",
	},
	[98059] = { -- Hillsbrad's Hoard (wowhead forever)
		frFR = "Le PNJ qui se tient près de la table doit être vivant pour que l'objet fonctionne : s'il a été tué, attendre qu'il réapparaisse. Un gnome peut devoir monter sur la chaise.",
		enUS = "The NPC standing by the table must be alive for it to work: if he was killed, wait for his respawn. A gnome may need to stand on the chair.",
	},
	[98245] = { -- Razormaw Needling (wowhead forever)
		frFR = "Prise sans les quêtes préalables indiquées. Les œufs se ramassent facilement à l'ouest de la zone ; pour les raptors, mieux vaut aller à l'est vers 69,31.",
		enUS = "Can be taken without the listed prerequisites. Eggs are easy to loot in the west of the zone; for the raptors, head east around 69,31.",
	},
	[98283] = { -- Carnage (wowhead forever)
		frFR = "La Chair de griffe pourrie malveillante tombe rarement des monstres Griffe pourrie affolée ; la poser à l'entrée de la grotte (69,35) fait venir Carnage.",
		enUS = "The Malignant Rotclaw Flesh is a rare drop from Maddened Rotclaws; placing it at the cave entrance (69,35) brings out Carnage.",
	},
	[98310] = { -- Gleaning Our Future (wowhead forever)
		frFR = "Le golem proche des orcs élites a aussi un voleur élite camouflé à côté : dégager un chemin jusqu'à lui avant d'utiliser la Pierre de Goaz, ce qui laisse aussi une sortie.",
		enUS = "The golem near the elite orcs also has a stealthed elite rogue beside it: clear a path to it before using the Goaz Stone, which also leaves you a way out.",
	},
	-- 0.6.0: levels 40-50, Wowhead comments read on 2026-11-08 (most pages blocked)
	[17] = { -- Uldaman Reagent Run (classic)
		frFR = "Les champignons magenta poussent dans la grotte devant Uldaman, hors de l'instance, surtout près des feux et dans les coins à l'écart des monstres.",
		enUS = "The Magenta Fungus Caps grow in the cave in front of Uldaman, outside the instance, mostly by the fires and in corners away from the mobs.",
	},
	[704] = { -- Agmond's Fate (classic)
		frFR = "Les urnes sont dans le tunnel qui mène à Uldaman, hors de l'instance : près des tentes et de part et d'autre du portail, une seule gardée.",
		enUS = "The urns are in the tunnel leading to Uldaman, outside the instance: by the tents and on both sides of the portal, only one guarded.",
	},
	[1052] = { -- Down the Scarlet Path (classic)
		frFR = "Raleigh le Dévot attend à l'étage de l'auberge d'Austrivage (vers 51,59).",
		enUS = "Raleigh the Devout waits upstairs in the Southshore inn (near 51,59).",
	},
	[1108] = { -- Indurium (classic)
		frFR = "Les flocons d'Indurium tombent très rarement des troggs Cavepierre de Fin d'Agmond (vers 51,66) : la faire en même temps que les autres quêtes de troggs, ou la passer.",
		enUS = "The Indurium Flakes drop very rarely from the Stonevault troggs at Agmond's End (near 51,66): do it alongside the other trogg quests, or skip it.",
	},
	[1451] = { -- Rhapsody Shindigger (classic)
		frFR = "Le camp de Rhapsody est en haut d'une colline : le sentier part vers 20,48, près d'un griffon dressé amical.",
		enUS = "Rhapsody's camp sits on a hilltop: the path starts near 20,48, by a friendly trained gryphon.",
	},
}
