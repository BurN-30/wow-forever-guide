"""Check the Groupe Alliance module without the game (Lua 5.1 through lupa: pip install lupa).

  python tools/check-lua.py

1. Syntax: every .lua file of addons-src and of the built pack (addons/PolestarPack_GroupeAlliance*)
   loads under Lua 5.1, the game's Lua.
2. Smoke test: Reliability.lua, Tips.lua and GroupeAlliance.lua run against small stubs of
   Polestar (ns) and of the game: the calm defaults are registered, the tip mark is added to a
   line whose quest has a tip (and only then), the tooltip gets the tip line, /ga answers.
3. Per-objective tips: each goals["item:<id>"] (npc, object) key of Tips.lua is an objective line
   of that quest in the guides the player follows (since 0.13.0, Polestar's route and this pack's
   chapters: every compiled guide of addons/Polestar_Guides* and the built pack).
4. Escort badge: the lines marked in those guides are exactly Polestar's escorts plus the pack's
   own list (GA.EXTRA_ESCORTS), and each quest of that list is in the guides.
5. Off by default: only the addons of OFF_BY_DEFAULT say `## DefaultState: disabled`.
6. (0.14.0) The module's language follows the language Polestar shows unless /ga lang says, and the
   flight game gets AZERTY on a French client once (a 0.12.2-0.13.1 choice kept, a later one too).
7. (0.14.0) Polestar 0.4.3's migration "skipGreyOn", as built, run by its own Core/Profiles.lua:
   grey quests stay left out for a 0.13.x player who never chose, a "no" stays, a first install
   has the default, it runs once; without the module it behaves as released.
8. (0.14.0) The pack's fixes of Auctionator 354 (suffix price keys, price key migration) and of
   BuffAlerts Forever 3.14.1 (scroll and camp buffs in French), on the shipped files.
Parts 3 and 4 read the side-shelf guides' steps too (Polestar 0.4.3's `stepsSrc`).
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
PLAYER_LEVEL = 18
function UnitLevel() return PLAYER_LEVEL end
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
  -- ItemTip: Polestar's game item tooltip, its `extra` run on the tooltip (Theme/Widgets.lua, setGameTip).
  Widgets = { Tooltip = function() end, HideTooltip = function() end,
    ItemTip = function(owner, item, extra) if extra then extra(GameTooltip) end end },
}
''')
run = L.eval("function(src, name) local f, err = loadstring(src, name); if not f then error(err) end; f('Polestar', NS) end")
for name in ("Reliability.lua", "Tips.lua", "Danger.lua", "GroupeAlliance.lua"):
    run((repo / "addons-src" / "GroupeAlliance" / name).read_text(encoding="utf-8"), "@" + name)
result = L.execute(r'''
INIT()
local out = {}
local function check(ok, what) if not ok then table.insert(out, what) end end
check(DEFAULTS.behavior.skipGrey == true, "skipGrey default")
check(DEFAULTS.behavior.groupQuests == "ask", "group quests asked")
check(DEFAULTS.qol.mapObjectives == true and DEFAULTS.qol.guideDim == true, "quest marks defaults")
check(DEFAULTS.ui.instance == "show", "guide window kept in dungeons (0.13.1)")
local tipQuest
for q, t in pairs(NS.GA.Tips) do if t.enUS then tipQuest = q break end end
local withTip = NS.UI.GoalLine({ quest = tipQuest, status = "active" })
check(withTip:find("star", 1, true) ~= nil, "tip mark on a quest with a tip")
check(NS.UI.GoalLine({ quest = tipQuest, status = "done" }):find("star", 1, true) == nil, "no tip mark once done")
check(NS.UI.GoalLine({ quest = 1, status = "active" }):find("star", 1, true) == nil, "no tip mark without a tip")
HOOKS.Tooltip({ psGoal = { quest = tipQuest }, HookScript = function() end })
check(#TIPLINES >= 2 and TIPLINES[1]:find("Astuce", 1, true) ~= nil, "tooltip tip line")
-- 0.14.1: an item line's tooltip (Widgets.ItemTip, Polestar 0.4.3): our lines after the guide's, in its `extra`;
-- another owner of Widgets.ItemTip (no psGoal) gets nothing of ours.
TIPLINES = {}
NS.Widgets.ItemTip({ psGoal = { quest = tipQuest, item = 1, t = "collect" }, HookScript = function() end }, 1, function(t) t:AddLine("guide line") end)
check(TIPLINES[1] == "guide line" and #TIPLINES >= 3 and TIPLINES[2]:find("Astuce", 1, true) ~= nil, "item line tooltip: our tip after the guide's lines")
TIPLINES = {}
NS.Widgets.ItemTip({}, 1, function(t) t:AddLine("tile") end)
check(#TIPLINES == 1 and TIPLINES[1] == "tile", "Widgets.ItemTip without a guide line: nothing of ours")
TIPLINES = {}
SlashCmdList.GROUPEALLIANCE("")
check(#PRINTED > 0, "/ga prints its help")
-- Difficulty marks: a quest 3 or more levels above the player (from Polestar's data), a
-- curated entry, nothing once the player has the level. 0.14.0: elite work and escorts get no
-- mark of ours below that gap (Polestar 0.4.3 marks those steps itself).
NS.Compat = { GetQuestLevel = function(q) return q == 900001 and 20 or (q == 900002 and 30) or nil end }
local elite = { quest = 900001, t = "complete", status = "active", party = { kind = "elite" } }
check(NS.UI.GoalLine(elite):find("icon-kill", 1, true) == nil, "no mark of ours on elite work 2 levels above (Polestar's own)")
PLAYER_LEVEL = 16
check(NS.UI.GoalLine(elite):find("icon-kill", 1, true) ~= nil, "danger mark on a quest 4 levels above the player, elite or not")
PLAYER_LEVEL = 18
check(NS.UI.GoalLine({ quest = 900001, t = "turnin", status = "active", party = { kind = "elite" } }):find("icon-kill", 1, true) == nil, "no danger mark on a turn-in")
check(NS.UI.GoalLine({ quest = 900002, t = "accept", status = "active" }):find("icon-kill", 1, true) ~= nil, "danger mark on a red quest")
PLAYER_LEVEL = 25
check(NS.UI.GoalLine(elite):find("icon-kill", 1, true) == nil, "no danger mark once strong enough")
PLAYER_LEVEL = 10
for q, e in pairs(NS.GA.Danger) do
  check(type(e.lvl) == "number" and type(e.frFR) == "string" and type(e.enUS) == "string", "danger " .. q .. " in both languages")
  check(NS.UI.GoalLine({ quest = q, t = "complete", status = "active" }):find("icon-kill", 1, true) ~= nil or e.lvl <= 10, "danger mark " .. q)
end
TIPLINES = {}
HOOKS.Tooltip({ psGoal = elite, HookScript = function() end })
check(TIPLINES[1] and TIPLINES[1]:find("Difficile au niveau 10", 1, true) ~= nil, "tooltip danger line")
-- Quest markers: calm defaults, the current step's objectives only while a guide runs,
-- the tracking submenu ticks the settings.
check(DEFAULTS.qol.objectiveAreas == false and DEFAULTS.qol.availableQuests == false and DEFAULTS.qol.turnInMarkers == true
  and DEFAULTS.qol.minimapObjectives == false and DEFAULTS.qol.gaStepObjectives == true, "calm quest marker defaults")
local SET = { ["qol.gaStepObjectives"] = true, ["qol.questDB"] = true }
local getStub = NS.Get
NS.Get = function(k) return SET[k] end
NS.Set = function(k, v) SET[k] = v end
NS.QuestDB = { IsGuideQuest = function(q) return q == 983 end }
local pins = { { refs = { { q = 983 } } }, { refs = { { q = 1001 } } }, { refs = { { q = 1001 }, { q = 983 } } } }
check(#NS.GA.StepObjectives(pins) == 3, "every objective without a guide")
NS.Engine = { GetGuide = function() return { steps = { {} } } end, GetStepIndex = function() return 1 end }
check(#NS.GA.StepObjectives(pins) == 2, "only the step's objectives while a guide runs")
SET["qol.gaStepObjectives"] = false
check(#NS.GA.StepObjectives(pins) == 3, "every objective with the setting off")
local boxes, labels = {}, {}
local menu = { CreateDivider = function() end, CreateCheckbox = function(_, label, get, set)
  labels[#labels + 1] = label; boxes[#boxes + 1] = { get, set } end }
NS.GA.AddMarksMenu(nil, { CreateButton = function(_, label) labels[#labels + 1] = label return menu end })
check(#boxes == 6 and labels[1] == "Polestar : repères de quête", "tracking submenu")
check(boxes[3][1]() == false, "areas box unticked")
boxes[3][2]()
check(SET["qol.objectiveAreas"] == true and boxes[3][1]() == true, "areas box ticks the setting")
NS.Get, NS.Engine, NS.QuestDB = getStub, nil, nil
for q, r in pairs(NS.GA.Reliability) do check(type(r[2].frFR) == "string" and type(r[2].enUS) == "string", "reliability " .. q .. " in both languages") end
local n = 0 for _ in pairs(NS.GA.Tips) do n = n + 1 end
for q, t in pairs(NS.GA.Tips) do
  check(t.goals ~= nil or (type(t.frFR) == "string" and type(t.enUS) == "string"), "tip " .. q .. " in both languages")
  for k, g in pairs(t.goals or {}) do
    check(type(g.frFR) == "string" and type(g.enUS) == "string" and k:match("^%a+:%d+$"), "tip " .. q .. " " .. tostring(k) .. " in both languages")
  end
end
-- Per objective (Gathering the Cure, 6123): each line its own tip, none on the accept line.
local root = NS.GA.TipOf({ t = "collect", quest = 6123, item = 2449, status = "active" })
local fungus = NS.GA.TipOf({ t = "collect", quest = 6123, item = 15851, status = "active" })
check(root and fungus and root ~= fungus and root.enUS:find("Earthroot", 1, true) and fungus.enUS:find("Lunar", 1, true), "tips per objective")
check(NS.GA.TipOf({ t = "accept", quest = 6123, npc = 3702 }) == nil, "no objective tip on the accept line")
check(NS.UI.GoalLine({ t = "collect", quest = 6123, item = 2449, status = "active" }):find("star", 1, true) ~= nil, "tip mark on an objective line")
-- Escort badge (0.7.4): on an open escort line (Polestar's flag or our list), before the
-- difficulty mark, not on a turn-in nor once done, off with ui.gaEscortBadge; its tooltip.
PLAYER_LEVEL = 10
local esc = { t = "accept", quest = 900003, status = "active", escort = true }
NS.Compat = { GetQuestLevel = function(q) return q == 900003 and 20 or nil end }
local line = NS.UI.GoalLine(esc)
check(line:find("Escorte", 1, true) ~= nil, "escort badge on a flagged line")
check(line:find("icon-kill", 1, true) ~= nil and line:find("Escorte", 1, true) < line:find("icon-kill", 1, true), "badge before the difficulty mark")
check(NS.UI.GoalLine({ t = "accept", quest = 900003, status = "done", escort = true }):find("Escorte", 1, true) == nil, "no badge once done")
-- Our list (GA.EXTRA_ESCORTS, empty since 0.13.0) tried with a quest put in it for the test.
NS.GA.EXTRA_ESCORTS[900004] = true
check(NS.UI.GoalLine({ t = "accept", quest = 900004, status = "active" }):find("Escorte", 1, true) ~= nil, "badge from our list (accept)")
check(NS.UI.GoalLine({ t = "kill", quest = 900004, status = "active" }):find("Escorte", 1, true) ~= nil, "badge from our list (objective)")
check(NS.UI.GoalLine({ t = "turnin", quest = 900004, status = "active" }):find("Escorte", 1, true) == nil, "no badge on a turn-in")
NS.GA.EXTRA_ESCORTS[900004] = nil
check(NS.UI.GoalLine({ t = "accept", quest = 1, status = "active" }):find("Escorte", 1, true) == nil, "no badge on a plain quest")
TIPLINES = {}
HOOKS.Tooltip({ psGoal = esc, HookScript = function() end })
local said = table.concat(TIPLINES, "\n")
check(said:find("Escorte : Un PNJ", 1, true) and said:find("AVANT", 1, true) and said:find("éloigner", 1, true), "badge tooltip")
local getBadge = NS.Get
NS.Get = function(k) if k == "ui.gaEscortBadge" then return false end return getBadge(k) end
check(NS.UI.GoalLine(esc):find("Escorte", 1, true) == nil, "badge off with the setting")
TIPLINES = {}
HOOKS.Tooltip({ psGoal = esc, HookScript = function() end })
said = table.concat(TIPLINES, "\n")
check(said:find("AVANT", 1, true) and not said:find("Escorte : Un PNJ", 1, true), "badge off: the group line only")
NS.Get = getBadge
check(DEFAULTS.ui.gaEscortBadge == true, "badge on by default")
NS.Compat = nil
return table.concat(out, ", "), n
''')
failed, ntips = result
print(f"smoke test: {ntips} tips, " + ("ok" if not failed else "FAILED: " + failed))

# 2b. Quest automation (0.7.3): on by default, the per-quest exception (line menu, options
# list), group quests held unless answered "do", escorts taken from the next steps, and
# the built Polestar Core/Automation.lua asking the module before it accepts.
L.execute(r'''
SET, PRINTED2, CONFIRMED, ACCEPTED, SPANS = {}, {}, 0, 0, {}
NS.Get = function(k) local v = SET[k] if v == nil then v = DEFAULTS[k:match("^(%w+)")] and DEFAULTS[k:match("^(%w+)")][k:match("%.(.+)$")] end return v end
NS.Print = function(s) table.insert(PRINTED2, s) end
NS.After = function(_, fn) fn() end
SHIFT, LOGGED = false, {}
NS.Compat = { IsShiftKeyDown = function() return SHIFT end, IsOnQuest = function(q) return LOGGED[q] == true end,
  IsQuestCompleted = function() return false end, GetNpcID = function() return 12345 end, InCombat = function() return false end,
  GetQuestTitle = function(q) return q == 169 and "WANTED: Gath'Ilzogg" or nil end,
  GetLogQuests = function() return {} end, GetLogCap = function() return 40 end }
ANSWERS = {}
STEPS = {
  { when = { { k = "group", q = 19 } }, goals = { { t = "accept", quest = 169, title = "WANTED: Gath'Ilzogg" }, { t = "accept", quest = 95999 } } },
  { when = { { k = "group", q = 91752, neg = true } }, goals = { { t = "accept", quest = 500 } } },
  { goals = { { t = "accept", quest = 983, title = "The Escort" }, { t = "turnin", quest = 984 } } },
}
NS.Engine = { GetGuide = function() return { id = "g", steps = STEPS } end, TabIds = function() return {} end,
  GetLiveStep = function() return 1 end, GroupAnswer = function(q) return ANSWERS[q] end,
  WantsQuest = function(verb, q, span) table.insert(SPANS, span or 0) return verb == "accept" and (q == 169 or q == 983) and (span or 0) >= 1 or (verb == "accept" and q == 984) end }
NS.QoL = { ClosePopup = function(which) CLOSED = which end }
function ConfirmAcceptQuest() CONFIRMED = CONFIRMED + 1 end
local GA, out = NS.GA, {}
local function check(ok, what) if not ok then table.insert(out, what) end end
check(DEFAULTS.behavior.autoAccept == true and DEFAULTS.behavior.autoTurnin == true and DEFAULTS.behavior.gaShared == true, "automation on by default")
-- The exception, from the line's right-click menu.
check(not GA.HoldsQuest(983), "a plain quest is not held")
local items = {}
GA.RowMenu({ quest = 983, title = "The Escort" }, items)
local entry = items[#items]
check(#items == 2 and items[1].separator and entry.checked == false and entry.text:find("automatiquement", 1, true), "line menu entry, unticked")
entry.onClick()
check(GA.HoldsQuest(983) and GA.NoAuto(983), "the entry excepts the quest")
items = {}
GA.RowMenu({ quest = 983 }, items)
check(items[#items].checked == true, "line menu entry ticked once excepted")
check(GA.Listed()[1] == 983, "options list shows the exception")
check(NS.DB().groupeAlliance.noAuto[983] == "The Escort", "kept in the account's settings")
items[#items].onClick()
check(not GA.HoldsQuest(983) and GA.Listed()[1] == 983, "ticked again: back to automation, row kept for the session")
GA.RowMenu({ t = "note" }, items)
check(#items == 2, "no entry on a line without a quest")
-- Group quests: held until answered "do"; a `!group` step is not held.
check(GA.HoldsQuest(169) and GA.HoldsQuest(95999), "unanswered group step: none of its quests")
ANSWERS[19] = "skip"
check(GA.HoldsQuest(169), "skipped group quest held")
ANSWERS[19] = "do"
check(not GA.HoldsQuest(169) and not GA.HoldsQuest(95999), "group quest answered do")
check(not GA.HoldsQuest(500), "solo alternative not held")
-- Escorts (QUEST_ACCEPT_CONFIRM): a quest of the next steps, by title, at once.
SET["behavior.autoAccept"] = true
check(GA.OnEscort(nil, "Ana", "The Escort") == true and CONFIRMED == 1 and CLOSED == "QUEST_ACCEPT", "escort accepted at once")
check(SPANS[#SPANS] == GA.SPAN, "escort looks at the next steps")
check(GA.OnEscort(nil, "Ana", "Wanted: Gath'Ilzogg") == true and CONFIRMED == 2, "escort matched on the client's title")
check(GA.OnEscort(nil, "Ana", "Some other quest") == false and CONFIRMED == 2, "unknown escort left to the player")
GA.SetNoAuto(983, true)
check(GA.OnEscort(nil, "Ana", "The Escort") == false and CONFIRMED == 2, "excepted escort left to the player")
GA.SetNoAuto(983, false)
SHIFT = true
check(GA.OnEscort(nil, "Ana", "The Escort") == false, "Shift: escort left to the player")
SHIFT = false
SET["behavior.gaShared"] = false
check(GA.OnEscort(nil, "Ana", "The Escort") == false, "setting off: escort left to the player")
SET["behavior.gaShared"] = nil
LOGGED[983] = true
check(GA.OnEscort(nil, "Ana", "The Escort") == false, "already in the log")
LOGGED[983] = nil
-- Shared quest window: the giver is a player.
check(GA.AcceptSpan() == 0, "NPC quest window: live step only")
function UnitExists() return true end
function UnitIsPlayer() return true end
function UnitIsUnit() return false end
check(GA.AcceptSpan() == GA.SPAN, "shared quest window: next steps too")
UnitExists, UnitIsPlayer, UnitIsUnit = nil, nil, nil
-- Told once.
NS.DB().groupeAlliance.autoTold = nil
PRINTED2 = {}
LeaPlusDB = { AutomateQuests = "On" }
GA.TellOnce(); GA.TellOnce()
check(#PRINTED2 == 2 and PRINTED2[1]:find("0.7.3", 1, true) and PRINTED2[2]:find("Leatrix", 1, true), "told once: automation on, Leatrix Plus")
LeaPlusDB = nil
OUT = table.concat(out, ", ")
''')
failed2 = L.eval("OUT")
# The built Core/Automation.lua (tools/build.py patch) against the same stubs.
L.execute(r'''
function GetTime() return 0 end
QID = 0
function GetQuestID() return QID end
function AcceptQuest() ACCEPTED = ACCEPTED + 1 end
function QuestGetAutoAccept() return false end
function QuestFlagsPVP() return false end
NS.L = setmetatable({}, { __index = function(_, k) return k end })
NS.Closes = { HoldsOffer = function() return false end }
NS.RegisterEvent = function() end
-- Polestar 0.4.x: the pause ("No quest automation while paused") and the debug log.
NS.PauseHides = function() return false end
NS.Debug = function() end
NS.Engine.AcceptRefusal = function() return "test" end
''')
run((repo / "addons" / "Polestar" / "Core" / "Automation.lua").read_text(encoding="utf-8"), "@Automation.lua")
L.execute(r'''
local A, out = NS.Automation, {}
local function check(ok, what) if not ok then table.insert(out, what) end end
QID = 984
check(A.OnQuestDetail() == true and ACCEPTED == 1, "automation accepts a wanted quest")
GA = NS.GA
GA.SetNoAuto(984, true)
check(A.OnQuestDetail() == false and ACCEPTED == 1, "automation leaves an excepted quest")
GA.SetNoAuto(984, false)
SHIFT = true
check(A.OnQuestDetail() == false, "Shift: automation does nothing")
SHIFT = false
QID = 983
check(A.OnQuestDetail() == false and SPANS[#SPANS] == 0, "NPC window: the next steps' quest waits")
function UnitExists() return true end
function UnitIsPlayer() return true end
check(A.OnQuestDetail() == true and ACCEPTED == 2 and SPANS[#SPANS] == NS.GA.SPAN, "shared by a player: taken from the next steps")
UnitExists, UnitIsPlayer = nil, nil
ANSWERS[19] = nil
QID = 169
function UnitExists() return true end
function UnitIsPlayer() return true end
check(A.OnQuestDetail() == false, "unanswered group quest never taken, even shared")
UnitExists, UnitIsPlayer = nil, nil
OUT = table.concat(out, ", ")
''')
failed3 = L.eval("OUT")
failed = ", ".join(x for x in (failed, failed2, failed3) if x)
print("quest automation: " + ("ok" if not (failed2 or failed3) else "FAILED: " + ", ".join(x for x in (failed2, failed3) if x)))

# 3. Per-objective tips: every goals["kind:id"] key of Tips.lua is an objective line (collect,
# kill, use, interact) of that quest in the guides the player follows: Polestar's (its route since
# 0.13.0) and the built pack's chapters.
import re
guides = "\n".join(f.read_text(encoding="utf-8") for d in sorted((repo / "addons").iterdir())
                   if d.is_dir() and (d.name.startswith("Polestar_Guides") or d.name == "PolestarPack_GroupeAlliance")
                   for f in sorted(d.glob("*.lua")))
# Polestar 0.4.3: a side-shelf guide (class, profession, reputation...) carries its steps as Lua
# source in a string, `stepsSrc = "return { ... }"`: read in, so their lines count as the others.
decode = L.eval("function(lit) local f = assert(loadstring('return ' .. lit)) return f() end")
guides += "\n" + "\n".join(decode(m.group(1)) for m in re.finditer(r'stepsSrc = ("(?:[^"\\]|\\.)*")', guides))
objectives = set()
for m in re.finditer(r'\{ t = "(?:collect|kill|use|interact)", quest = (\d+),([^{}]*)', guides):
    for kind in ("item", "npc", "object"):
        k = re.search(rf"\b{kind} = (\d+)", m.group(2))
        if k:
            objectives.add(f"{m.group(1)}:{kind}:{k.group(1)}")
            break
tips_src = (repo / "addons-src" / "GroupeAlliance" / "Tips.lua").read_text(encoding="utf-8")
missing, nkeys = [], 0
for m in re.finditer(r"^\t\[(\d+)\] = \{[^\n]*\n\t\tgoals = \{\n(.*?)\n\t\t\},", tips_src, re.M | re.S):
    for key in re.findall(r'^\t\t\t\["(\w+:\d+)"\]', m.group(2), re.M):
        nkeys += 1
        if f"{m.group(1)}:{key}" not in objectives:
            missing.append(f"{m.group(1)} {key}")
print(f"objective tips: {nkeys} keys, " + ("ok" if not missing else "NOT IN THE GUIDES: " + ", ".join(missing)))

# 4. Escort badge (0.7.4): the quests whose lines get the badge (GA.IsEscort on each goal:
# Polestar's compiled `escort` plus GA.EXTRA_ESCORTS) are exactly those Polestar flags plus our
# list; each quest of our list is in the guides.
flagged = {int(m.group(1)) for m in re.finditer(r'\{ t = "\w+", quest = (\d+),[^\n]*escort = true', guides)}
is_escort = L.eval("function(t, q, e) return NS.GA.IsEscort({ t = t, quest = q, escort = e or nil }) end")
marked, quests = set(), set()
for m in re.finditer(r'\{ t = "(\w+)", quest = (\d+),([^\n]*)', guides):
    q = int(m.group(2))
    quests.add(q)
    if is_escort(m.group(1), q, "escort = true" in m.group(3)):
        marked.add(q)
extra = {int(q) for q in L.eval("(function() local o = {} for q in pairs(NS.GA.EXTRA_ESCORTS) do o[#o + 1] = q end return table.concat(o, ',') end)()").split(",") if q}
escort_bad = []
if marked != flagged | extra:
    escort_bad.append("marked " + str(sorted(marked - flagged - extra)) + ", missing " + str(sorted((flagged | extra) - marked)))
if extra - quests:
    escort_bad.append("listed but not in the guides " + str(sorted(extra - quests)))
print(f"escort badge: {len(marked)} quests ({len(extra)} from our list), " + ("ok" if not escort_bad else "FAILED: " + "; ".join(escort_bad)))

# 5. Off by default (0.10.0): the addons below are unticked in the AddOn list on a first
# install (`## DefaultState: disabled` in their .toc, read by the client only for an addon it
# has no saved state for); every other folder of addons/ loads as the client's default.
OFF_BY_DEFAULT = {"BuffAlertsForever"}
state_bad = []
for d in sorted(p for p in (repo / "addons").iterdir() if p.is_dir()):
    # The .toc the WoW Forever client reads: <name>_Camelot.toc (or _Forever) when the addon ships
    # one per game, as PrettyTooltip 1.4, else <name>.toc.
    toc_file = next(p for p in (d / f"{d.name}{s}.toc" for s in ("_Forever", "_Camelot", "")) if p.is_file())
    toc = toc_file.read_text(encoding="utf-8-sig")
    states = [m.lower() for m in re.findall(r"^## DefaultState:\s*(\S+)", toc, re.M)]
    if (states == ["disabled"]) != (d.name in OFF_BY_DEFAULT):
        state_bad.append(f"{d.name} {states or 'none'}")
print(f"off by default: {', '.join(sorted(OFF_BY_DEFAULT))}, " + ("ok" if not state_bad else "FAILED: " + "; ".join(state_bad)))

# 6. (0.14.0) The module's language follows Polestar's (ns.Names.Language) unless /ga lang says;
# the flight game's keys on a French client (GA.ArcadeKeys, once per account, a 0.13 choice kept).
L.execute(r'''
local out = {}
local function check(ok, what) if not ok then table.insert(out, what) end end
local GA = NS.GA
NS.DB().groupeAlliance = NS.DB().groupeAlliance or {}
local S = NS.DB().groupeAlliance
S.lang = nil
NS.Names = { Language = function() return "enUS" end }
check(GA.Locale() == "enUS", "Polestar shown in English on a French client: the module in English")
NS.Names = { Language = function() return "frFR" end }
check(GA.Locale() == "frFR", "Polestar shown in French: the module in French")
S.lang = "en"
check(GA.Locale() == "enUS", "/ga lang en wins")
S.lang = nil
NS.Names = nil
check(GA.Locale() == "frFR", "without Polestar's language: the client's")
-- A French player who had typed /ga lang en under 0.13.1 (then: the Wowhead links' language).
NS.DB().groupeAlliance = { lang = "en" }
NS.Names = { Language = function() return "frFR" end }
local S2 = NS.DB().groupeAlliance
check(GA.Locale() == "frFR" and S2.wowheadLang == "en" and S2.lang == nil and S2.langV == 2,
  "a /ga lang en of 0.13.1 stays the links' language only: the module follows Polestar (French)")
S2.lang = "en"
check(GA.Locale() == "enUS", "a /ga lang en typed since 0.14.0 sets the module's language")
NS.DB().groupeAlliance = S
NS.Names = nil
Polestar_ArcadeDB = nil
GA.ArcadeKeys()
check(Polestar_ArcadeDB.keys == "azerty" and Polestar_ArcadeDB.gaKeys == 1, "first game on a French client: AZERTY")
Polestar_ArcadeDB = { keys = "qwerty", azerty = false }
GA.ArcadeKeys()
check(Polestar_ArcadeDB.keys == "qwerty", "a /arcade qwerty of 0.12.2-0.13.1 kept")
Polestar_ArcadeDB = { keys = "qwerty" }
GA.ArcadeKeys()
check(Polestar_ArcadeDB.keys == "azerty", "the game's QWERTY default, from before the pack's 0.14.0: AZERTY")
Polestar_ArcadeDB.keys = "qwerty"
GA.ArcadeKeys()
check(Polestar_ArcadeDB.keys == "qwerty", "a /doom keys qwerty after that is the player's: kept")
local locale = GetLocale
GetLocale = function() return "enUS" end
Polestar_ArcadeDB = { keys = "qwerty" }
GA.ArcadeKeys()
check(Polestar_ArcadeDB.keys == "qwerty", "an English client keeps QWERTY")
GetLocale = locale
Polestar_ArcadeDB = nil
OUT = table.concat(out, ", ")
''')
lang_bad = L.eval("OUT")
print("language and flight game keys: " + ("ok" if not lang_bad else "FAILED: " + lang_bad))

# 7. (0.14.0) Polestar 0.4.3's migration "skipGreyOn" (Core/Engine.lua, as built: tools/build.py keeps
# the module's default) run by Polestar's own Core/Profiles.lua over a saved profile: a 0.13.x
# player who never chose keeps grey quests left out, one who chose "no" keeps it, a first install
# has the default, and it runs once.
SKIP = r'''
local NS2 = setmetatable({}, { __index = function(_, k) if k == "GA" then return nil end return function() end end })
local DB2
NS2.L = setmetatable({}, { __index = function(_, k) return k end })
NS2.DB = function() return DB2 end
NS2.CharState = function() return DB2.char end
NS2.SafeCall = function(fn, ...) return pcall(fn, ...) end
NS2.IsNewAccount = function() return NEW_ACCOUNT end
NS2.GA = WITH_GA and {} or nil
function SKIP_RUN(settings, profiles, migrations)
  DB2 = { settings = settings, profiles = profiles or {}, migrations = migrations, char = {} }
  LOAD_PROFILES("Polestar", NS2)
  LOAD_MIGRATION("Polestar", NS2)
  NS2.Profiles.Load()
  return DB2
end
'''
engine = (repo / "addons" / "Polestar" / "Core" / "Engine.lua").read_text(encoding="utf-8")
m = re.search(r'ns\.RegisterMigration\("skipGreyOn", function\(s\).*?\nend, \{ strings = false \}\)\n', engine, re.S)
skip_bad = []
if not m:
    skip_bad.append("migration skipGreyOn not found in the built Core/Engine.lua")
else:
    L.globals().LOAD_PROFILES = L.eval("function(src) local f = assert(loadstring(src, '@Profiles.lua')) return f end")(
        (repo / "addons" / "Polestar" / "Core" / "Profiles.lua").read_text(encoding="utf-8"))
    L.globals().LOAD_MIGRATION = L.eval("function(src) local f = assert(loadstring('local _, ns = ...\\n' .. src, '@Engine.lua')) return f end")(m.group(0))
    def case(settings, new_account, with_ga=True, migrations=None):
        L.globals().NEW_ACCOUNT, L.globals().WITH_GA = new_account, with_ga
        L.execute(SKIP)
        return L.globals().SKIP_RUN(L.table_from(settings) if settings is not None else L.table(), None,
                                    L.table_from(migrations) if migrations else None)
    def grey(db):
        b = db.settings.behavior
        return None if b is None else b.skipGrey
    db = case({"behavior": L.table()}, False)
    if grey(db) is not None:
        skip_bad.append(f"0.13.x profile without a choice: skipGrey {grey(db)} stored (the module's default, on, is lost)")
    db = case({"behavior": L.table_from({"skipGrey": False})}, False)
    if grey(db) is not False:
        skip_bad.append("0.13.x profile with skipGrey off chosen: not kept")
    db = case(None, True)
    if grey(db) is not None:
        skip_bad.append("first install: skipGrey stored")
    if not (db.migrations and db.migrations.skipGreyOn):
        skip_bad.append("the migration is not marked done")
    db2 = case({"behavior": L.table()}, False, True, {"skipGreyOn": True})
    if grey(db2) is not None:
        skip_bad.append("second login: the migration ran again")
    # The same profile without the module (Polestar as released): the release's behaviour, off stored.
    db3 = case({"behavior": L.table()}, False, False)
    if grey(db3) is not False:
        skip_bad.append("without the module the release's migration should store off (the bench no longer reads it)")
print("grey quests over Polestar 0.4.3's migration: " + ("ok, 5 cases" if not skip_bad else "FAILED: " + "; ".join(skip_bad)))

# 8. (0.14.0) The pack's fixes of Auctionator 354 (docs/auctionator-correctifs.md) and of BuffAlerts
# Forever 3.14.1 (docs/buffalerts-correctifs.md, patch 7), each on the shipped files.
A = lua51.LuaRuntime(unpack_returned_tuples=True)
A.execute(r'''
Auctionator = { Utilities = {}, Constants = { IsForever = true, IsLegacyAH = false, ITEM_LEVEL_THRESHOLD = 1 } }
Auctionator.Utilities.IsEquipment = function() return true end
Auctionator.Utilities.SuffixesToLabel = {}
Auctionator.Utilities.SuffixesExtraChecks = { 777 }
Auctionator.Utilities.SuffixBonusIDs = { [777] = 5 }
Auctionator.Utilities.SuffixLabels = { "of the Bear" }
function strsplit(sep, s) local t = {} for p in (s .. sep):gmatch("(.-)" .. sep) do t[#t + 1] = p end return unpack(t) end
NAMES = { [100] = "Blade", ["item:100:x"] = "Blade of Power", ["item:100" .. string.rep(":", 12) .. "1:777"] = "Blade of Power",
  [200] = "Axe", ["item:200:x"] = "Axe of Mystery" }
C_Item = {
  GetItemInfoInstant = function(link) local id = tonumber(tostring(link):match("item:(%d+)") or link) return id, nil, nil, nil, nil, 2 end,
  GetItemNameByID = function(x) return NAMES[x] or NAMES[tonumber(tostring(x):match("item:(%d+)") or x)] end,
}
Item = { CreateFromItemLink = function() return { IsItemEmpty = function() return false end, ContinueOnItemLoad = function(_, fn) fn() end } end }
function tIndexOf(t, v) for i, x in ipairs(t) do if x == v then return i end end return nil end
''')
auc = repo / "addons" / "Auctionator"
A.execute((auc / "Source" / "Utilities" / "DBKeyFromLink.lua").read_text(encoding="utf-8"))
k1, k2 = A.execute(r'''
local a, b
Auctionator.Utilities.DBKeyFromLink("item:100:x", function(k) a = k[1] end)
Auctionator.Utilities.DBKeyFromLink("item:200:x", function(k) b = k[1] end)
return a, b
''')
auc_bad = []
if k1 != "gr:100:5" or k2 != "200":
    auc_bad.append(f"suffix keys: {k1}, {k2} (expected gr:100:5, then 200 for a suffix nothing matches)")
main = (auc / "Source" / "Variables" / "Main.lua").read_text(encoding="utf-8")
i = main.index("  if Auctionator.Constants.IsForever and AUCTIONATOR_PRICE_DATABASE[realm].suffixes == nil then")
block = main[i:main.index("  assert(AUCTIONATOR_PRICE_DATABASE[realm]", i)]
A.execute('AUCTIONATOR_PRICE_DATABASE = { R = { ["gr:5:of the Bear"] = 1, ["gr:6:of the Unknown"] = 2 } }')
ok, err = A.eval("function(src) local f = assert(loadstring('local realm = ...\\n' .. src)) local ok, e = pcall(f, 'R') return ok, tostring(e) end")(block)
if not ok or A.eval('AUCTIONATOR_PRICE_DATABASE.R["gr:5:1"]') != 1 or A.eval('AUCTIONATOR_PRICE_DATABASE.R["gr:6:of the Unknown"]') != 2:
    auc_bad.append(f"price key migration: {err if not ok else 'keys not as expected'}")
B = lua51.LuaRuntime(unpack_returned_tuples=True)
B.execute(r'''
local function magic() local t t = setmetatable({}, { __index = function() return function() return t end end, __call = function() return t end }) return t end
setmetatable(_G, { __index = function() return magic() end })
function issecretvalue() return false end
FR = { [8099] = "Endurance", [18191] = "Endurance augmentée", [8096] = "Intelligence", [8112] = "Esprit", [18193] = "Esprit augmenté",
  [429959] = "Bien reposé", [1225478] = "Bien reposé" }
C_Spell = { GetSpellName = function(id) return FR[id] end, GetSpellInfo = function() return nil end }
function GetLocale() return "frFR" end
function CreateFrame() return magic() end
function InCombatLockdown() return false end
function GetTime() return 0 end
SlashCmdList = {}
''')
ns_b = B.table()
ba = repo / "addons" / "BuffAlertsForever"
for f in ("Data.lua", "Core.lua", "Party.lua", "Options.lua", "PackPatches.lua"):
    B.eval("function(src, name, ns) local f = assert(loadstring(src, name)) f('BuffAlertsForever', ns) end")(
        (ba / f).read_text(encoding="utf-8"), "@" + f, ns_b)
for fk, name in (("fortitude", "Endurance"), ("fortitude", "Endurance augmentée"), ("arcaneIntellect", "Intelligence"),
                 ("divineSpirit", "Esprit"), ("divineSpirit", "Esprit augmenté"), ("fortitude", "Stamina")):
    if not ns_b.IsEquivalent(fk, name):
        auc_bad.append(f"BuffAlerts: {name!r} does not count as {fk} on a French client")
if ns_b.IsEquivalent("fortitude", "Bien nourri"):
    auc_bad.append("BuffAlerts: food counted as Fortitude")
rested = list(ns_b.FAMILIES.wellRested.names.values())
if "Bien reposé" not in rested:
    auc_bad.append("BuffAlerts: the sleeping bag's buff has no French name")
print("Auctionator 354 and BuffAlerts 3.14.1 fixes: " + ("ok" if not auc_bad else "FAILED: " + "; ".join(auc_bad)))
sys.exit(1 if bad or failed or missing or escort_bad or state_bad or lang_bad or skip_bad or auc_bad else 0)
