"""Check the Groupe Alliance module without the game (Lua 5.1 through lupa: pip install lupa).

  python tools/check-lua.py

1. Syntax: every .lua file of addons-src and of the built pack (addons/PolestarPack_GroupeAlliance*)
   loads under Lua 5.1, the game's Lua.
2. Smoke test: Reliability.lua, Tips.lua and GroupeAlliance.lua run against small stubs of
   Polestar (ns) and of the game: the calm defaults are registered, the tip mark is added to a
   line whose quest has a tip (and only then), the tooltip gets the tip line, /ga answers.
It cannot replace a test in game: it only catches typos and broken calls.
"""
import pathlib, sys
from lupa import lua51

repo = pathlib.Path(__file__).resolve().parent.parent
L = lua51.LuaRuntime()
load = L.eval("function(src, name) local f, err = loadstring(src, name) return err end")
bad = 0
files = sorted((repo / "addons-src").rglob("*.lua"))
for d in (repo / "addons").glob("PolestarPack_GroupeAlliance*"):
    files += sorted(d.rglob("*.lua"))
for p in files:
    src = p.read_bytes().decode("utf-8-sig")
    err = load(src, "@" + p.name)
    if err:
        bad += 1
        print("ERROR", p.relative_to(repo), err)
print(f"syntax: {len(files)} files, {bad} errors")

L.execute(r'''
local function obj()
  local o = { _shown = true, _scripts = {} }
  return setmetatable(o, { __index = function(t, k)
    return function(self, ...)
      local a = {...}
      if k == "SetScript" then self._scripts[a[1]] = a[2]
      elseif k == "IsShown" then return self._shown
      elseif k == "CreateFontString" or k == "CreateTexture" then return obj()
      elseif k == "IsOwned" then return true
      elseif k == "AddLine" then table.insert(TIPLINES, a[1])
      end
    end
  end })
end
TIPLINES, PRINTED = {}, {}
function CreateFrame() return obj() end
UIParent, GameTooltip = obj(), obj()
function GetLocale() return "frFR" end
HOOKS = {}
function hooksecurefunc(t, name, fn) HOOKS[name] = fn end
function IsControlKeyDown() return false end
function print(s) table.insert(PRINTED, s) end
SlashCmdList = {}
DEFAULTS = {}
local db = { settings = {} }
NS = {
  RegisterDefaults = function(section, t) DEFAULTS[section] = DEFAULTS[section] or {}; for k, v in pairs(t) do DEFAULTS[section][k] = v end end,
  DB = function() return db end, CharState = function() return {} end,
  OnInit = function(fn) INIT = fn end, OnLogin = function() end, On = function() end,
  IsLoggedIn = function() return false end, Get = function() return nil end, Set = function() end, Fire = function() end,
  UI = { GoalLine = function(goal) return "line " .. tostring(goal.quest) end },
  Widgets = { Tooltip = function() end, HideTooltip = function() end },
}
''')
run = L.eval("function(src, name) local f, err = loadstring(src, name); if not f then error(err) end; f('Polestar', NS) end")
for name in ("Reliability.lua", "Tips.lua", "GroupeAlliance.lua"):
    run((repo / "addons-src" / "GroupeAlliance" / name).read_text(encoding="utf-8"), "@" + name)
result = L.execute(r'''
INIT()
local out = {}
local function check(ok, what) if not ok then table.insert(out, what) end end
check(DEFAULTS.behavior.skipGrey == true, "skipGrey default")
check(DEFAULTS.qol.mapObjectives == true and DEFAULTS.qol.guideDim == true, "quest marks defaults")
local tipQuest
for q in pairs(NS.GA.Tips) do tipQuest = q break end
local withTip = NS.UI.GoalLine({ quest = tipQuest, status = "active" })
check(withTip:find("star", 1, true) ~= nil, "tip mark on a quest with a tip")
check(NS.UI.GoalLine({ quest = tipQuest, status = "done" }):find("star", 1, true) == nil, "no tip mark once done")
check(NS.UI.GoalLine({ quest = 1, status = "active" }):find("star", 1, true) == nil, "no tip mark without a tip")
HOOKS.Tooltip({ psGoal = { quest = tipQuest }, HookScript = function() end })
check(#TIPLINES >= 2 and TIPLINES[1]:find("Astuce", 1, true) ~= nil, "tooltip tip line")
SlashCmdList.GROUPEALLIANCE("")
check(#PRINTED > 0, "/ga prints its help")
local n = 0 for _ in pairs(NS.GA.Tips) do n = n + 1 end
for q, t in pairs(NS.GA.Tips) do check(type(t.frFR) == "string" and type(t.enUS) == "string", "tip " .. q .. " in both languages") end
return table.concat(out, ", "), n
''')
failed, ntips = result
print(f"smoke test: {ntips} tips, " + ("ok" if not failed else "FAILED: " + failed))
sys.exit(1 if bad or failed else 0)
