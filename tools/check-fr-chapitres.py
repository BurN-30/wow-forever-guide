"""Every French text of the chapters (pack/locales/frFR) reaches the shipped addon.

  python tools/check-fr-chapitres.py

0.14.0: the forge (0.2.0) compiles pack/locales/frFR into addons/PolestarPack_GroupeAlliance_frFR/Texts.lua
and leaves out, with only a warning, a translation whose {kind:id} tokens differ from the English
(88 texts of 0.13.1, each with a place written in words instead of its {object:N}): the French
client then shows the English. Each non-empty, non-commented translation of the source files must be
in the built file, with the same French; the missing ones are listed with the tokens they lack, and
the check fails. Run by tools/build.py after the compilation.
"""
import pathlib, re, sys
from collections import Counter

REPO = pathlib.Path(__file__).resolve().parent.parent
KEY = re.compile(r'^\t+\["(.*)"\] = "(.*)",$')
HEAD = re.compile(r"^-- French \(frFR\): the guide (\S+) ")
TOK = re.compile(r"\{[a-z]+:\d+\}")


def main():
    sys.stdout.reconfigure(encoding="utf-8")
    src = {}
    for p in sorted((REPO / "pack" / "locales" / "frFR" / "guides").glob("*.lua")):
        gid = None
        for line in p.read_text(encoding="utf-8").split("\n"):
            m = HEAD.match(line)
            if m and not gid:
                gid = m.group(1)
            if line.lstrip().startswith("--"):
                continue
            m = KEY.match(line)
            if m and m.group(2):
                src[(gid, m.group(1))] = (p.name, m.group(2))
    built, gid = {}, None
    texts = REPO / "addons" / "PolestarPack_GroupeAlliance_frFR" / "Texts.lua"
    for line in texts.read_text(encoding="utf-8").split("\n"):
        m = re.match(r'^t\.guides\["([^"]+)"\]', line)
        if m:
            gid = m.group(1)
            continue
        m = KEY.match(line)
        if m and gid:
            built[(gid, m.group(1))] = m.group(2)
    bad = []
    for (g, en), (name, fr) in src.items():
        if built.get((g, en)) != fr:
            lack = sorted((Counter(TOK.findall(en)) - Counter(TOK.findall(fr))).elements())
            more = sorted((Counter(TOK.findall(fr)) - Counter(TOK.findall(en))).elements())
            why = ("lacks " + ", ".join(lack) if lack else "") + ("; adds " + ", ".join(more) if more else "")
            bad.append(f"{name}: {why or 'other French in the build'}: {en[:90]}")
    for b in bad:
        print("NOT SHIPPED", b)
    print(f"Chapter French: {len(src)} texts, {len(src) - len(bad)} shipped, {len(bad)} left out")
    sys.exit(1 if bad else 0)


if __name__ == "__main__":
    main()
