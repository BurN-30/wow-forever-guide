Polestar 0.4.2.2
Leveling guides for World of Warcraft: Forever.

Modified by BurN-30 on 2026-11-23 (github.com/BurN-30/wow-forever-guide): the GroupeAlliance folder (Wowhead links,
quest tips, calm defaults, quest automation exceptions, the Groupe Alliance pack's
dungeon chapters offered on the route, which then stand in for the dungeon heads-up
of the same dungeons) is loaded by Polestar.toc,
UI/GuideFrame.lua has gear, "?" help and "_" reduce buttons and a line menu entry,
UI/GuideFrameTabs.lua leaves room for those buttons,
Core/Automation.lua asks the module before it accepts or turns in a quest,
Quests/PartyChat.lua says only an objective's plain words in party chat,
UI/WhatsNew.lua can show the Groupe Alliance notes under their own title,
and Polestar_frFR/Texts.lua has French for guide texts Polestar leaves in English.
The flight game (Polestar_Arcade/src/main.lua) has an AZERTY keyboard layout.
Everything else is Polestar 0.4.2.2 as released.

Install
1. Copy these folders from the zip into
   World of Warcraft/_forever_/Interface/AddOns/
   (_classic_beta_ instead of _forever_ on the beta client):
     Polestar
     Polestar_Guides
     Polestar_Nav
     Polestar_Options
     Polestar_SkinAPI
     Polestar_Looks
     Polestar_Arcade
     Polestar_Nav_EK
     Polestar_Nav_Kalimdor
     Polestar_Guides_Alliance
     Polestar_Guides_Horde
     Polestar_Guides_Human
     Polestar_Guides_Orc
     Polestar_Guides_Dwarf
     Polestar_Guides_NightElf
     Polestar_Guides_Scourge
     Polestar_Guides_Tauren
     Polestar_Guides_Gnome
     Polestar_Guides_Troll
     Polestar_Guides_Skyborne
     Polestar_Experimental
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
     Polestar_Skin_Vellum
     Polestar_Skin_Lumen
     Polestar_Skin_Beacon
     Polestar_Skin_Aurora
     Polestar_Skin_Hairline
     Polestar_Skin_Umbra
     Polestar_Skin_Waymark
     Polestar_Skin_Lanterns
     Polestar_Skin_Sheen
   They are all part of Polestar: Polestar_Codex holds what Lookup,
   Dungeons and Rares show; Polestar_Options the settings window
   (loaded when you open it); Polestar_SkinAPI the checks for skins
   from other addons (loaded when you use one); Polestar_Looks the
   WoW Forever, Blizzard, Classic and Hearth skins (loaded when you
   pick one); Polestar_Nav
   the arrow's walking routes
   (Shortest Path Forever's pathing, by Cillian Berragan, GPL-3.0 or
   later: see its LICENSE and CREDITS.md); the language folders
   (Polestar_deDE, Polestar_frFR, ...) the guide texts and the game's
   quest, NPC, object and item names in each language (the game loads
   only its own). To update, delete the old Polestar folders there
   first, the Polestar_Guides_deDE and Polestar_Names_deDE kind too
   (one of each per language): Polestar no longer uses them.
   The Polestar_Skin_ folders are skins: each shows up under Settings >
   Theme and loads only when you pick it.
   Polestar_Arcade is Freedoom Arcade by petllama: three levels of
   Freedoom to play on a flight, loaded when you press Play (its own
   licence, GPL-2.0 or later: see its LICENSE and CREDITS.md).
   Polestar_Experimental holds experimental guides for Forever's new
   zones (alpha). They are on for everyone: the guide menu lists them
   under Leveling with our own guides, and a route choice offers their
   zones where they fit. Options > Guide > Show experimental guides
   takes them out of the guide menu.
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
