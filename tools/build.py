"""Build the `addons` folder the installer copies.

  python tools/build.py <forge.exe> <polestar checkout with data/forever> <Polestar release folder>

1. forge guide lint, then forge guide compile of pack/ (Polestar's guides as context);
2. the Polestar* folders of addons/ = the Polestar release (unzipped Polestar-<version>.zip)
   and the compiled pack (PolestarPack_GroupeAlliance and its _frFR texts addon); the other
   folders (Auctionator as released, PrettyTooltip as released plus the pack patches of
   docs/prettytooltip-1.4.2.patch, BuffAlertsForever as released plus PackPatches.lua, see
   docs/buffalerts-3.13.0.patch, !BugGrabber as released, BugSack as released plus
   PackPatches.lua, see docs/bugsack-12.1.9.patch) are committed and left alone;
3. the Groupe Alliance module (addons-src/GroupeAlliance) goes inside Polestar's own
   folder, so there is no extra addon to tick: its files are added to Polestar.toc,
   UI/GuideFrame.lua gets the gear, "?" help and "_" reduce buttons at the tab strip's
   right end (UI/GuideFrameTabs.lua leaves them the room, Polestar 0.4.x) and the
   module's entry in a guide line's right-click menu, and
   Core/Automation.lua asks the module before it accepts or turns in a quest, and
   Quests/PartyChat.lua says only an objective's plain words in party chat (0.9.7);
   ItemUseData.lua is made by tools/item-uses.py from the client's tables (0.10.0)
   (POLESTAR_CHANGES below, each applied exactly once or the build stops). Polestar is GPL-3.0: the changed files say so.
"""
import pathlib, shutil, subprocess, sys

forge, root, release = sys.argv[1], sys.argv[2], pathlib.Path(sys.argv[3])
repo = pathlib.Path(__file__).resolve().parent.parent
pack = repo / "pack"
addons = repo / "addons"
MODULE = ["Reliability.lua", "Tips.lua", "Danger.lua", "GroupeAlliance.lua", "ItemUseData.lua", "ItemUse.lua"]
NOTICE = "Modified by BurN-30 on 2026-11-08 (github.com/BurN-30/wow-forever-guide)"
ARCADE_NOTICE = "Modified by BurN-30 on 2026-11-23 (github.com/BurN-30/wow-forever-guide)"

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
     + NOTICE + ": the GroupeAlliance folder (Wowhead links,\r\n"
     "quest tips, calm defaults, quest automation exceptions) is loaded by Polestar.toc,\r\n"
     "UI/GuideFrame.lua has gear, \"?\" help and \"_\" reduce buttons and a line menu entry,\r\n"
     "UI/GuideFrameTabs.lua leaves room for those buttons,\r\n"
     "Core/Automation.lua asks the module before it accepts or turns in a quest,\r\n"
     "and Quests/PartyChat.lua says only an objective's plain words in party chat.\r\n"
     "The flight game (Polestar_Arcade/src/main.lua) has an AZERTY keyboard layout.\r\n"
     "Everything else is Polestar 0.4.2.2 as released.\r\n"),
    # 0.12.2: AZERTY keyboards in the flight game (Polestar_Arcade, GPL-2.0-or-later).
    # The game names a key by the letter printed on it, so the W A S D of the original
    # sit far apart on an AZERTY keyboard. `/arcade azerty` or `/arcade qwerty` chooses;
    # with neither, a French client gets AZERTY.
    ("../Polestar_Arcade/src/main.lua",
     "\tLALT = \"strafe\", RALT = \"strafe\",\n}\n",
     "\tLALT = \"strafe\", RALT = \"strafe\",\n}\n"
     "\n-- " + ARCADE_NOTICE + ": AZERTY keyboards.\n"
     "-- A key is named by the letter printed on it: on an AZERTY keyboard the keys under the\n"
     "-- left hand are Z Q S D (move, strafe) and A E (turn), and the number row gives\n"
     "-- & e-acute \" ' ( - e-grave without Shift. /arcade azerty or /arcade qwerty chooses;\n"
     "-- with neither, a French client gets AZERTY.\n"
     "local AZERTY_KEYS = { Z = \"forward\", Q = \"strafeleft\", A = \"left\", W = false }\n"
     "local QWERTY_KEYS = { W = \"forward\", A = \"strafeleft\", Q = \"left\", Z = false }\n"
     "local AZERTY_DIGITS = { [\"&\"] = 1, [\"\\195\\169\"] = 2, ['\"'] = 3, [\"'\"] = 4, [\"(\"] = 5, [\"-\"] = 6, [\"\\195\\168\"] = 7 }\n"
     "local function isAzerty()\n"
     "\tif db and db.azerty ~= nil then return db.azerty end\n"
     "\treturn (GetLocale and GetLocale() == \"frFR\") or false\n"
     "end\n"
     "local function applyKeyboard()\n"
     "\tfor key, action in pairs(isAzerty() and AZERTY_KEYS or QWERTY_KEYS) do\n"
     "\t\tbindings[key] = action or nil\n"
     "\tend\n"
     "end\n"
     "UI.IsAzerty, UI.ApplyKeyboard = isAzerty, applyKeyboard\n"),
    ("../Polestar_Arcade/src/main.lua",
     "local function OnKeyDown(self, key)\n\tif held[key] then return end\n",
     "local function OnKeyDown(self, key)\n\tif held[key] then return end\n"
     "\tapplyKeyboard() -- " + ARCADE_NOTICE + "\n"),
    ("../Polestar_Arcade/src/main.lua",
     "\t\tlocal n = tonumber(key)\n\t\tif n and n >= 1 and n <= 7 then\n",
     "\t\tlocal n = tonumber(key)\n"
     "\t\t-- " + ARCADE_NOTICE + ": the AZERTY number row (\"-\" stays the automap's zoom while the map is open).\n"
     "\t\tif not n and isAzerty() and not (key == \"-\" and D.AM.active) then n = AZERTY_DIGITS[key] end\n"
     "\t\tif n and n >= 1 and n <= 7 then\n"),
    ("../Polestar_Arcade/src/main.lua",
     "\t\tif key == \"UP\" or key == \"W\" then G.MenuKey(\"up\")\n",
     "\t\tif key == \"UP\" or key == \"W\" or key == \"Z\" then G.MenuKey(\"up\") -- " + ARCADE_NOTICE + ": Z on AZERTY\n"),
    ("../Polestar_Arcade/src/main.lua",
     "\tD.Print(\"/doom aggro - toggle auto save + pause when you enter combat\")\n",
     "\tD.Print(\"/doom aggro - toggle auto save + pause when you enter combat\")\n"
     "\tD.Print(\"/doom azerty | qwerty - keyboard layout (AZERTY by default on a French client)\") -- " + ARCADE_NOTICE + "\n"),
    ("../Polestar_Arcade/src/main.lua",
     "\telseif cmd == \"aggro\" then\n\t\tdb.aggroPause = not db.aggroPause\n",
     "\telseif cmd == \"azerty\" or cmd == \"qwerty\" then -- " + ARCADE_NOTICE + "\n"
     "\t\tdb.azerty = (cmd == \"azerty\")\n"
     "\t\tapplyKeyboard()\n"
     "\t\tD.Print(db.azerty and \"AZERTY keys: Z S move, Q D strafe, A E turn\" or \"QWERTY keys: W S move, A D strafe, Q E turn\")\n"
     "\telseif cmd == \"aggro\" then\n\t\tdb.aggroPause = not db.aggroPause\n"),
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
# (Auctionator as released, PrettyTooltip with docs/prettytooltip-1.4.2.patch,
# BuffAlertsForever with docs/buffalerts-3.13.0.patch, !BugGrabber as released, BugSack
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
    shutil.copy2(repo / "addons-src" / "GroupeAlliance" / f, polestar / "GroupeAlliance" / f)
for name, old, new in POLESTAR_CHANGES:
    p = polestar / name
    text = p.read_bytes().decode("utf-8")
    if text.count(old) != 1:
        sys.exit(f"Polestar change not applied: {name}: {old!r} found {text.count(old)} times")
    p.write_bytes(text.replace(old, new).encode("utf-8"))
print("addons:", ", ".join(sorted(p.name for p in addons.iterdir())))
