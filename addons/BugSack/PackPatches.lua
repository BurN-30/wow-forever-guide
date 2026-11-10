-- BugSack: patches of the wow-forever-guide pack (BurN-30, https://github.com/BurN-30/wow-forever-guide).
-- The release files are left untouched; this file is listed last in BugSack.toc, so it runs after
-- ldb.lua has registered the minimap icon, but before PLAYER_LOGIN, when LibDBIcon places it.
-- Reasons and in-game checks: docs/bugsack-correctifs.md
local addonName, addon = ...
if not addon.healthCheck then return end -- !BugGrabber missing: core.lua already stopped BugSack

------------------------------------------------------------
-- [pack patch #1] Minimap icon away from Polestar's minimap button
-- LibDBIcon puts an icon that was never dragged (minimapPos nil) at 225 degrees, 5 px past the
-- minimap's edge. The guide turns Polestar's own minimap button on, and its default is 225 degrees,
-- 5 px past the edge too (Polestar Maps/MinimapButton.lua, maps.minimapButtonAngle): the two buttons
-- sit exactly on top of each other. First-time position: 160 degrees (left, a little above the
-- middle). An icon the player dragged keeps its place (minimapPos is then saved).
------------------------------------------------------------
local iconDB = BugSackLDBIconDB
if type(iconDB) == "table" and iconDB.minimapPos == nil then
	iconDB.minimapPos = 160
end

------------------------------------------------------------
-- [pack patch #2] French tooltip of the minimap icon
-- locales.lua (frFR) says "Maj + Clic droit" reloads the interface, but ldb.lua (plugin.OnClick)
-- reloads on Shift + left click and opens the options on any right click. Same text, that word
-- fixed. ldb.lua reads L.minimapHint each time the tooltip opens, so setting it here is enough.
------------------------------------------------------------
if GetLocale() == "frFR" and addon.L then
	addon.L.minimapHint = "|cffeda55fCliquez|r pour ouvrir BugSack avec le dernier bug\n|cffeda55fMaj + Clic|r pour recharger l’interface\n|cffeda55fClic droit|r pour ouvrir les options"
end
