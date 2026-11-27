"""Build the `addons` folder the installer copies.

  python tools/build.py <forge.exe> <polestar checkout with data/forever> <Polestar release folder>

1. forge guide lint, then forge guide compile of pack/ (Polestar's guides as context);
2. the Polestar* folders of addons/ = the Polestar release (unzipped Polestar-<version>.zip)
   and the compiled pack (PolestarPack_GroupeAlliance and its _frFR texts addon); the other
   folders (Auctionator 354 as released plus the pack patches of docs/auctionator-354.patch,
   PrettyTooltip 1.5.0 as released plus docs/prettytooltip-1.5.0.patch, BuffAlertsForever 3.14.1
   as released plus PackPatches.lua, see docs/buffalerts-3.14.1.patch, !BugGrabber as released,
   BugSack as released plus PackPatches.lua, see docs/bugsack-12.1.9.patch) are committed and left alone;
3. the Groupe Alliance module (addons-src/GroupeAlliance) goes inside Polestar's own
   folder, so there is no extra addon to tick: its files are added to Polestar.toc,
   UI/GuideFrame.lua gets the gear, "?" help and "_" reduce buttons at the tab strip's
   right end (UI/GuideFrameTabs.lua leaves them the room, Polestar 0.4.x) and the
   module's entry in a guide line's right-click menu, and
   Core/Automation.lua asks the module before it accepts or turns in a quest, and
   Quests/PartyChat.lua says only an objective's plain words in party chat (0.9.7);
   ItemUseData.lua is made by tools/item-uses.py from the client's tables (0.10.0);
   0.13.0: GreffeData.lua and Greffe.lua (this pack's chapters offered on Polestar's own
   route) and Notes.lua (written here by tools/notes-jeu.py from CHANGELOG.md, the pack version's
   "### En jeu" / "### In game"), shown in UI/WhatsNew.lua's window, which takes WN.Extra
   (0.14.0: without Polestar 0.4.3's layout section under them);
   0.14.0: Core/Engine.lua's migration "skipGreyOn" leaves the module's default (grey quests left
   out) to the profiles that never chose;
   Polestar_frFR/Texts.lua gets addons-src/Polestar_frFR/Complement.lua (made by
   tools/fr-polestar.py: French for the texts Polestar leaves in English, only where its table
   has none) right before its RegisterGuideTexts call, with a warning when the release is another
   Polestar version than the one the complement was read from
   (POLESTAR_CHANGES below, each applied exactly once or the build stops). Polestar is GPL-3.0: the changed files say so.
4. Polestar's inner functions, messages and fields the module calls (POLESTAR_USES: the dungeon
   heads-up's candidates and the shape of what they return, its card, the tabs and their fields, the
   live step and its goals, the messages the module listens to, the "What's new" window, the welcome,
   the Codex, the retired guides, the quest log) are still there, word for word, or the build stops:
   another Polestar version that renamed one would leave a chapter unoffered, or two offers for one
   dungeon, without any error in game. Then every Polestar file this build changed, and the module's
   Notes.lua it writes, go through Lua 5.1 (the game's) for their syntax (loadstring): a change that
   breaks a file stops the build here, not at the player's login.
5. The quick checks; the build stops on the first that fails: tools/check-lua.py (the module and the
   pack under Lua 5.1), tools/check-fr-polestar.py (our French for Polestar's guides),
   tools/check-fr-chapitres.py (0.14.0: every French text of the chapters is in the built addon),
   tools/check-accroches.py (each chapter's hook still on Polestar's route, in range) and
   tools/check-chapitres.py (each chapter against the route up to its hook). The bench
   (tools/check-greffe.py, about a minute) needs the game's interface files: run it by hand.
"""
import importlib.util, json, pathlib, re, shutil, subprocess, sys

sys.stdout.reconfigure(encoding="utf-8")

forge, root, release = sys.argv[1], sys.argv[2], pathlib.Path(sys.argv[3])
repo = pathlib.Path(__file__).resolve().parent.parent
pack = repo / "pack"
addons = repo / "addons"
MODULE = ["Reliability.lua", "Tips.lua", "Danger.lua", "GroupeAlliance.lua", "ItemUseData.lua", "ItemUse.lua",
          "GreffeData.lua", "Notes.lua", "Greffe.lua"]
GENERATED = {"Notes.lua"}  # written by this build into the module, not in addons-src
NOTICE = "Modified by BurN-30 on 2026-11-08 (github.com/BurN-30/wow-forever-guide)"
GREFFE_NOTICE = "Modified by BurN-30 on 2026-11-23 (github.com/BurN-30/wow-forever-guide)"
POLESTAR_0431_NOTICE = "Modified by BurN-30 on 2026-11-27 (github.com/BurN-30/wow-forever-guide)"

POLESTAR_CHANGES = [
    ("Polestar.toc", "Alts\\Alts.xml\n",
     "Alts\\Alts.xml\n# " + NOTICE + ": the Groupe Alliance module.\n"
     + "".join(f"GroupeAlliance\\{f}\n" for f in MODULE)),
    # Polestar 0.4.x lays the tabs out in UI/GuideFrameTabs.lua: the tabs leave STRIP_W
    # free at the right end, and in the slim strip New tab (anchored to that end) moves
    # left of the module's buttons.
    ("UI/GuideFrameTabs.lua", "\t\tlocal avail = F:GetWidth() - 2 - addW - (thin and 4 or 6)\n",
     "\t\tlocal avail = F:GetWidth() - 2 - addW - (thin and 4 or 6) - (ns.GA and ns.GA.STRIP_W or 0) -- " + NOTICE
     + ": room for the Groupe Alliance buttons\n"),
    ("UI/GuideFrameTabs.lua", "\t\t\tstrip.Add:SetPoint(\"RIGHT\", strip, \"BOTTOMRIGHT\", -3, tabH / 2)\n",
     "\t\t\tstrip.Add:SetPoint(\"RIGHT\", strip, \"BOTTOMRIGHT\", -3 - (ns.GA and ns.GA.STRIP_W or 0), tabH / 2) -- " + NOTICE
     + ": left of the Groupe Alliance buttons\n"),
    ("UI/GuideFrame.lua", "\thoverable(strip.Add)\n",
     "\thoverable(strip.Add)\n"
     "\t-- " + NOTICE + ": the Groupe Alliance buttons (gear, \"?\" help,\n"
     "\t-- \"_\" reduce) at the strip's right end, placed by the module.\n"
     "\tif ns.GA and ns.GA.StripButtons then\n"
     "\t\tfor _, b in ipairs(ns.GA.StripButtons(strip)) do hoverable(b) end\n"
     "\tend\n"),
    # 0.7.3: the guide line's right-click menu gets the module's entry
    # (no automation for this quest).
    ("UI/GuideFrame.lua", "\tW.ShowMenu(row, items)\n",
     "\t-- " + NOTICE + ": the Groupe Alliance entry\n"
     "\t-- (\"Don't accept or turn in automatically\" for this quest).\n"
     "\tif ns.GA and ns.GA.RowMenu then ns.GA.RowMenu(goal, items) end\n"
     "\tW.ShowMenu(row, items)\n"),
    # 0.7.3: the automation asks the module before it acts (GA.HoldsQuest: the
    # player's exceptions, group quests not answered "do"), and looks a few
    # steps ahead for a quest a party member shares (GA.AcceptSpan).
    ("Core/Automation.lua", "local function wantsAccept(q)\n\treturn q and q ~= 0 and ns.Engine.WantsQuest(\"accept\", q)\nend\n",
     "-- " + NOTICE + ": the Groupe Alliance module\n"
     "-- holds some quests back (GA.HoldsQuest: the player's exceptions, group quests\n"
     "-- not answered \"do\") and lets a quest a party member shares come from the\n"
     "-- next steps too (GA.AcceptSpan); without the module, as released.\n"
     "local function held(q)\n"
     "\tlocal GA = ns.GA\n"
     "\treturn GA and GA.HoldsQuest and GA.HoldsQuest(q) or false\n"
     "end\n\n"
     "local function wantsAccept(q, span)\n"
     "\treturn q and q ~= 0 and not held(q) and ns.Engine.WantsQuest(\"accept\", q, span)\n"
     "end\n"),
    ("Core/Automation.lua", "\treturn q and q ~= 0 and ns.Engine.WantsQuest(\"direct\", q)\n",
     "\treturn q and q ~= 0 and not held(q) and ns.Engine.WantsQuest(\"direct\", q)\n"),
    ("Core/Automation.lua", "\tif ns.Compat.IsOnQuest(q) then return ns.Engine.WantsQuest(\"turnin\", q) end\n",
     "\tif ns.Compat.IsOnQuest(q) then return not held(q) and ns.Engine.WantsQuest(\"turnin\", q) end\n"),
    ("Core/Automation.lua", "\tif not (canAccept() and wantsAccept(q)) then\n",
     "\tif not (canAccept() and wantsAccept(q, ns.GA and ns.GA.AcceptSpan and ns.GA.AcceptSpan() or 0)) then\n"),
    # 0.9.7: party chat refuses a line with an escape code it does not know ("Invalid
    # escape code in chat message"): only the objective's plain words are said, and a
    # line chat still refuses is dropped instead of raising an error.
    ("Quests/PartyChat.lua", "\t\tsend(line.text, chatType())\n",
     "\t\tpcall(send, line.text, chatType()) -- a line chat refuses is dropped, never an error\n"),
    # Polestar 0.4.x cleans an objective's label itself (plain(), square brackets only);
    # ours (0.9.7) also drops colours, textures, links and grammar codes. Both kept: the
    # released function gets our cleaning before its own.
    ("Quests/PartyChat.lua", "local function plain(s)\n\treturn (s:gsub(\"[%[%]]\", \"\"))\nend\n",
     "-- " + NOTICE + ": chat refuses a line with an escape code\n"
     "-- it does not know (\"Invalid escape code in chat message\"): an objective's text can\n"
     "-- carry colours, textures or grammar codes, so only its plain words are said.\n"
     "local function plain(s)\n"
     "\tif type(s) ~= \"string\" then return \"\" end\n"
     "\ts = s:gsub(\"|c%x%x%x%x%x%x%x%x\", \"\"):gsub(\"|[rR]\", \"\")\n"
     "\ts = s:gsub(\"|T.-|t\", \"\"):gsub(\"|A.-|a\", \"\"):gsub(\"|H.-|h(.-)|h\", \"%1\")\n"
     "\ts = s:gsub(\"|%d+\", \"\"):gsub(\"|\", \"\")\n"
     "\ts = s:gsub(\"%s+\", \" \"):gsub(\"^ \", \"\"):gsub(\" $\", \"\")\n"
     "\treturn (s:gsub(\"[%[%]]\", \"\"))\n"
     "end\n"),
    ("README.txt", "Leveling guides for World of Warcraft: Forever.\r\n",
     "Leveling guides for World of Warcraft: Forever.\r\n\r\n"
     + POLESTAR_0431_NOTICE + ": the GroupeAlliance folder (Wowhead links,\r\n"
     "quest tips, calm defaults, quest automation exceptions, the Groupe Alliance pack's\r\n"
     "dungeon chapters offered on the route, which then stand in for the dungeon heads-up\r\n"
     "of the same dungeons) is loaded by Polestar.toc,\r\n"
     "UI/GuideFrame.lua has gear, \"?\" help and \"_\" reduce buttons and a line menu entry,\r\n"
     "UI/GuideFrameTabs.lua leaves room for those buttons,\r\n"
     "Core/Automation.lua asks the module before it accepts or turns in a quest,\r\n"
     "Core/Engine.lua keeps the module's default for leaving out grey quests,\r\n"
     "Quests/PartyChat.lua says only an objective's plain words in party chat,\r\n"
     "UI/WhatsNew.lua can show the Groupe Alliance notes under their own title\r\n"
     "(without the layout choice under them),\r\n"
     "and Polestar_frFR/Texts.lua has French for guide texts Polestar leaves in English\r\n"
     "(and ours before Polestar's for Mount Hyjal and a few texts, while Polestar's is the one judged).\r\n"
     "Everything else is Polestar 0.4.3.1 as released.\r\n"),
    # 0.14.0: Polestar 0.4.3 turns "leave out grey quests" (behavior.skipGrey) on by default and
    # its migration "skipGreyOn" stores it off in every profile saved before, as it was off by
    # default there. With this module it was on by default (GroupeAlliance.lua's RegisterDefaults,
    # since 0.6): a profile without a value had it on, so the migration would turn it off for every
    # player of the pack. It runs once and keeps what the player chose (a stored value).
    ("Core/Engine.lua", "\tif s.behavior.skipGrey == nil then s.behavior.skipGrey = false end\n",
     "\t-- " + POLESTAR_0431_NOTICE + ": with the Groupe Alliance module,\n"
     "\t-- grey quests were already left out by default (no value: on), so nothing changes here.\n"
     "\tif s.behavior.skipGrey == nil and not ns.GA then s.behavior.skipGrey = false end\n"),
    # 0.13.0: Polestar's "What's new" window shows this pack's notes (Greffe.lua sets
    # WN.Extra, an entry like Polestar's own with its own title and footer line): the window
    # renders WN.Extra when set, under its title, and opening it then leaves Polestar's own
    # "seen" flag alone, so Polestar's notes still open when Polestar changes version.
    ("UI/WhatsNew.lua", "\tlocal entry = NOTES[1]\n",
     "\t-- " + GREFFE_NOTICE + ": another addon's notes\n"
     "\t-- (WN.Extra, the Groupe Alliance's) under their own title and footer line.\n"
     "\tlocal entry = WN.Extra or NOTES[1]\n"),
    ("UI/WhatsNew.lua", "\th.Title:SetText(L[\"What's new in Polestar %s\"]:format(entry.version))\n",
     "\th.Title:SetText(entry.title or L[\"What's new in Polestar %s\"]:format(entry.version))\n"),
    ("UI/WhatsNew.lua", "\tF.Site:SetText(L[\"Full notes: %s\"]:format(SITE))\n",
     "\tF.Site:SetText(entry.site or L[\"Full notes: %s\"]:format(SITE))\n"),
    ("UI/WhatsNew.lua", "\tns.DB().whatsNewSeen = WN.LATEST -- shown: a reload or logout from here does not repeat it\n",
     "\tif not WN.Extra then ns.DB().whatsNewSeen = WN.LATEST end -- shown: a reload or logout from here does not repeat it (" + GREFFE_NOTICE + ": not for WN.Extra)\n"),
    # 0.14.0: Polestar 0.4.3's window adds its layout section (Atlas or Standard, the tab styles:
    # UI/LayoutCard.lua) under its own notes; not under the Groupe Alliance's (WN.Extra).
    ("UI/WhatsNew.lua", "\t\tsection, kept = lc ~= nil and lc.Offered(), nil\n",
     "\t\tsection, kept = not WN.Extra and lc ~= nil and lc.Offered(), nil -- " + POLESTAR_0431_NOTICE + ": not under WN.Extra\n"),
    # 0.12.2 to 0.13.1 changed the flight game (Polestar_Arcade/src/main.lua) for AZERTY keyboards.
    # Polestar 0.4.3 does it itself (/doom keys azerty, or /doom keys wow for the keys the character
    # moves with, and a hint on a keyboard whose forward key is not W): no change of ours there since 0.14.0.
]

# Polestar's inner functions and messages the Groupe Alliance module relies on (Greffe.lua), each
# a line that must be in the release exactly as written. UI.DungeonToast.Candidates is called
# through its table by DT.Check, so the module's wrapper (GA.HeldCandidates) is the one Polestar calls.
POLESTAR_USES = [
    ("UI/DungeonToast.lua", "UI.DungeonToast = DT\n"),
    ("UI/DungeonToast.lua", "function DT.Candidates(level, mode, questId)\n"),
    ("UI/DungeonToast.lua", "\tlocal c = DT.Candidates(level, mode, questId)[1]\n"),
    # the candidates' shape the module reads (c.key; 0.4.3 counts `take` from the pick-up guide's plan)
    ("UI/DungeonToast.lua", "\t\t\t\t\tout[#out + 1] = { key = d.key, name = d.name, zoneName = d.zoneName, minLevel = min, maxLevel = max, best = best, take = #guide.take, level = level,\n"),
    # 0.4.3: a check works its candidates out a few route plans a frame through DT.Candidates (the
    # module's wrapper, which passes ns.TravelCost's answers through untouched), then DT.Check.
    ("UI/DungeonToast.lua", "\tlocal ok, err = pcall(DT.Candidates, level, mode, questId)\n"),
    # Polestar 0.4.3's layout section under its "What's new" notes (UI/LayoutCard.lua), kept off our notes
    ("UI/LayoutCard.lua", "function LC.Offered() return atlasInstalled() end\n"),
    ("UI/ClassToast.lua", "function CT.ShowCard(m)\n"),
    ("UI/ClassToast.lua", "function CT.Hide()\n"),
    ("UI/ClassToast.lua", "\tCT.current = m\n"),
    ("UI/ClassToast.lua", "\tif was and ns.Fire then ns.Fire(\"HEADS_UP_HIDDEN\", was) end\n"),
    ("Core/Engine.lua", "function Engine.OpenTab(id, activate, auto)\n"),
    ("Core/Engine.lua", "function Engine.SelectTab(index)\n"),
    ("Core/Engine.lua", "function Engine.CloseTab(index, quiet)\n"),
    ("Core/Engine.lua", "function Engine.GetTabs(counts)\n"),
    # the tabs' fields the module reads (guideId, title)
    ("Core/Engine.lua", "\t\t\tguideId = g.id, title = g.title, category = g.category or \"Leveling\",\n"),
    ("Core/Engine.lua", "function Engine.TabIds()\n"),
    ("Core/Engine.lua", "function Engine.StartGuide()\n"),
    ("Core/Engine.lua", "function Engine.GetGuide() return guide end\n"),
    ("Core/Engine.lua", "function Engine.GetLiveStep() return computed end\n"),
    ("Core/Engine.lua", "function Engine.Applies(i, g)\n"),
    ("Core/Engine.lua", "function Engine.GoalDone(stepIndex, goalIndex)\n"),
    ("Core/Engine.lua", "\tif not quiet then ns.Fire(\"TAB_CLOSED\", tab.guide.id) end\n"),
    # the messages the module listens to
    ("Core/Engine.lua", "\t\t\t\tns.Fire(\"GUIDE_COMPLETED\", id)\n"),
    ("Core/Engine.lua", "\t\tif active and opened then ns.Fire(\"GUIDE_PLACED\", guide.id, computed, chain) end\n"),
    ("Core/Engine.lua", "\t\tif active then ns.Fire(\"STEP_CHANGED\", current) end\n"),
    ("Core/Engine.lua", "\tns.Fire(\"GUIDE_CHANGED\", guide and guide.id or nil)\n"),
    # a guide played to its end, as the save keeps it (a chapter of 0.12.x finished: not offered again)
    ("Core/Engine.lua", "\t\t\t\tns.CharState().guideDone[id] = true\n"),
    ("Core/Compat.lua", "function Compat.GetPlayerInfo()\n"),
    ("Core/Compat.lua", "function Compat.IsQuestCompleted(questID)\n"),
    ("Core/Compat.lua", "function Compat.IsOnQuest(questID)\n"),
    ("Core/Compat.lua", "function Compat.IsQuestReadyForTurnIn(questID)\n"),
    ("Core/Guides.lua", "Guides.GuideMatches = guideMatches\n"),
    ("Core/Guides.lua", "function ns.RetireGuides(packId, list)\n"),
    ("Lookup/Codex.lua", "function Codex.IsLoaded()\n"),
    # the "What's new" window and the welcome
    ("UI/WhatsNew.lua", "WN.LATEST = NOTES[1].version\n"),
    ("UI/WhatsNew.lua", "\tWN.frame = F\n"),
    ("UI/WhatsNew.lua", "function WN.Show()\n"),
    ("UI/WhatsNew.lua", "function WN.IsShown()\n"),
    ("UI/WhatsNew.lua", "function WN.Hide()\n"),
    ("UI/Welcome.lua", "UI.Welcome = WEL\n"),
    ("UI/Welcome.lua", "function WEL.Busy()\n"),
]


def run(*args):
    r = subprocess.run([forge, *args, str(pack), "--root", root, "--quiet"], cwd=pack,
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    print((r.stdout + r.stderr).strip().splitlines()[-1])
    if r.returncode:
        print(r.stdout + r.stderr)
        sys.exit(r.returncode)

run("guide", "lint")
run("guide", "compile")
# Only the Polestar folders are rebuilt; the other addons shipped with the guide
# (Auctionator with docs/auctionator-354.patch, PrettyTooltip with docs/prettytooltip-1.5.0.patch,
# BuffAlertsForever with docs/buffalerts-3.14.1.patch, !BugGrabber as released, BugSack
# with docs/bugsack-12.1.9.patch) are committed and stay as they are.
addons.mkdir(exist_ok=True)
for d in sorted(addons.iterdir()):
    if d.is_dir() and d.name.startswith("Polestar"):
        shutil.rmtree(d)
for d in sorted(release.iterdir()):
    if d.is_dir() and d.name.startswith("Polestar"):
        shutil.copytree(d, addons / d.name)
for d in sorted((pack / "dist").iterdir()):
    if d.is_dir():
        shutil.copytree(d, addons / d.name)

polestar = addons / "Polestar"
(polestar / "GroupeAlliance").mkdir()
for f in MODULE:
    if f not in GENERATED:
        shutil.copy2(repo / "addons-src" / "GroupeAlliance" / f, polestar / "GroupeAlliance" / f)
# Notes.lua: this pack version's in-game notes (tools/notes-jeu.py).
spec = importlib.util.spec_from_file_location("notes_jeu", repo / "tools" / "notes-jeu.py")
notes_jeu = importlib.util.module_from_spec(spec)
spec.loader.exec_module(notes_jeu)
version = json.loads((pack / "pack.json").read_text(encoding="utf-8"))["version"]
(polestar / "GroupeAlliance" / "Notes.lua").write_text(
    notes_jeu.notes_lua(version, (repo / "CHANGELOG.md").read_text(encoding="utf-8-sig")), encoding="utf-8", newline="\n")
# Polestar_frFR/Texts.lua: our French for the texts Polestar leaves in English, only where its
# table has none (tools/fr-polestar.py), right before it registers the table.
complement = (repo / "addons-src" / "Polestar_frFR" / "Complement.lua").read_text(encoding="utf-8")
texts = addons / "Polestar_frFR" / "Texts.lua"
call = '\nPolestar.RegisterGuideTexts("frFR", "guides", t)\n'
body = texts.read_bytes().decode("utf-8")
if body.count(call) != 1:
    sys.exit(f"Polestar change not applied: Polestar_frFR/Texts.lua: {call!r} found {body.count(call)} times")
texts.write_bytes(body.replace(call, "\n" + complement + call).encode("utf-8"))
released = re.search(r"^## Version: (\S+)", (polestar / "Polestar.toc").read_text(encoding="utf-8-sig"), re.M)
made = re.search(r"^-- Polestar version: (\S+)", complement, re.M)
if released and made and released.group(1) != made.group(1):
    print(f"WARNING: Polestar_frFR complement comes from Polestar {made.group(1)}, the release is {released.group(1)}: "
          "run tools/fr-polestar.py on its checkout (its French still applies, only where Polestar has none)")
for name, old, new in POLESTAR_CHANGES:
    p = polestar / name
    text = p.read_bytes().decode("utf-8")
    if text.count(old) != 1:
        sys.exit(f"Polestar change not applied: {name}: {old!r} found {text.count(old)} times")
    p.write_bytes(text.replace(old, new).encode("utf-8"))
missing = [f"{name}: {line.strip()}" for name, line in POLESTAR_USES
           if (polestar / name).read_bytes().decode("utf-8").count(line) < 1]
if missing:
    sys.exit("Polestar changed a function the Groupe Alliance module calls (tools/build.py, POLESTAR_USES): "
             + " | ".join(missing) + ". Read the new Polestar code, adapt GroupeAlliance/Greffe.lua, then this list.")
# Lua 5.1 (the game's) on every file this build changed or wrote: a syntax error stops it here.
from lupa import lua51
lua = lua51.LuaRuntime()
check = lua.eval("function(src, name) local f, err = loadstring(src, name) if f then return nil end return err end")
changed = sorted({name for name, _, _ in POLESTAR_CHANGES} | {"Polestar_frFR_Texts", "GroupeAlliance/Notes.lua"})
bad = []
for name in changed:
    path = addons / "Polestar_frFR" / "Texts.lua" if name == "Polestar_frFR_Texts" else polestar / name
    if path.suffix != ".lua":
        continue
    err = check(path.read_bytes().decode("utf-8"), "@" + path.relative_to(addons).as_posix())
    if err:
        bad.append(str(err))
if bad:
    sys.exit("Lua 5.1 refuses a file the build changed: " + " | ".join(bad))
print("Lua 5.1 syntax: " + ", ".join(n for n in changed if n.endswith(".lua") or n == "Polestar_frFR_Texts") + ": ok")
print("addons:", ", ".join(sorted(p.name for p in addons.iterdir())))
for check in ("check-lua.py", "check-fr-polestar.py", "check-fr-chapitres.py", "check-accroches.py", "check-chapitres.py"):
    r = subprocess.run([sys.executable, str(repo / "tools" / check)], capture_output=True, text=True,
                       encoding="utf-8", errors="replace")
    lines = (r.stdout + r.stderr).strip().splitlines()
    print(f"{check}: " + (lines[-1] if lines else "(nothing)"))
    if r.returncode:
        print(r.stdout + r.stderr)
        sys.exit(f"{check} failed: the addons are built, fix this before committing them")
