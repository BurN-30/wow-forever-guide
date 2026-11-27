Polestar 0.4.3.1
Leveling guides for World of Warcraft: Forever.

Modified by BurN-30 on 2026-11-27 (github.com/BurN-30/wow-forever-guide): the GroupeAlliance folder (Wowhead links,
quest tips, calm defaults, quest automation exceptions, the Groupe Alliance pack's
dungeon chapters offered on the route, which then stand in for the dungeon heads-up
of the same dungeons) is loaded by Polestar.toc,
UI/GuideFrame.lua has gear, "?" help and "_" reduce buttons and a line menu entry,
UI/GuideFrameTabs.lua leaves room for those buttons,
Core/Automation.lua asks the module before it accepts or turns in a quest,
Core/Engine.lua keeps the module's default for leaving out grey quests,
Quests/PartyChat.lua says only an objective's plain words in party chat,
UI/WhatsNew.lua can show the Groupe Alliance notes under their own title
(without the layout choice under them),
and Polestar_frFR/Texts.lua has French for guide texts Polestar leaves in English
(and ours before Polestar's for Mount Hyjal and a few texts, while Polestar's is the one judged).
Everything else is Polestar 0.4.3.1 as released.

Install
1. Copy these folders from the zip into
   World of Warcraft/_forever_/Interface/AddOns/
   (_classic_beta_ instead of _forever_ on the beta client):
     Polestar
     Polestar_Guides
     Polestar_Nav
     Polestar_Options
     Polestar_Skins
     Polestar_Arcade
     Polestar_Nav_EK
     Polestar_Nav_Kalimdor
     Polestar_Guides_Alliance
     Polestar_Guides_Horde
     Polestar_QuestDB
     Polestar_ItemDB
     Polestar_Codex
     Polestar_deDE
     Polestar_esES
     Polestar_esMX
     Polestar_frFR
     Polestar_koKR
     Polestar_ptBR
     Polestar_ruRU
     Polestar_zhCN
     Polestar_zhTW
   They are all part of Polestar: Polestar_Codex holds what Lookup,
   Dungeons and Rares show; Polestar_Options the settings window
   (loaded when you open it); Polestar_Skins Polestar's skins and
   guide window layouts (loaded when you use one); Polestar_Nav
   the arrow's walking routes
   (Shortest Path Forever's pathing, by Cillian Berragan, GPL-3.0 or
   later: see its LICENSE and CREDITS.md); the language folders
   (Polestar_deDE, Polestar_frFR, ...) the guide texts and the game's
   quest, NPC, object and item names in each language (the game loads
   only its own). To update, delete the old Polestar folders there
   first: every Polestar and Polestar_ folder but Polestar_Recorder.
   Since 0.4.3 Polestar has fewer folders (the skins, looks and race
   parts are inside the others), and the old ones are not used.
   Polestar_Arcade is Freedoom Arcade by petllama: three levels of
   Freedoom to play on a flight, loaded when you press Play (its own
   licence, GPL-2.0 or later: see its LICENSE and CREDITS.md).
2. Quit the game completely and start it again. A /reload does not
   load new addon folders.

Polestar_Recorder (a separate zip) is optional: it records your sessions
to improve the routes and stays off until you turn it on.

Source, issues and documentation: https://github.com/fitzforge/polestar
Polestar is free software under the GNU General Public License, version 3
only (LICENSE). The data folders carry their own notices (LICENSE-DATA.txt).
Portions Copyright (C) 2026 Cillian Berragan (Shortest Path Forever),
GPL-3.0 or later, adapted with his permission: the route lines, journey
panel, transit times, travel prompts and alerts in Polestar/ (LICENSE
names the files) and the walking routes in Polestar_Nav/.
Polestar_Arcade/ is a program of its own: Freedoom Arcade, Copyright
(C) 2026 petllama, from id Software's DOOM source, GPL-2.0 or later;
Freedoom's levels and art (C) the Freedoom project, BSD licence
(FREEDOOM-COPYING.txt).
