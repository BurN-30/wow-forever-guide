"""Prépare les fichiers d'une release GitHub (utilisé par .github/workflows/release.yml).

    python tools/release.py package --version 0.5.0 --out dist   # dist/GuideWoWForever-addons.zip
    python tools/release.py sums dist                              # dist/SHA256SUMS.txt
    python tools/release.py notes --version 0.5.0 --out notes.md   # notes tirées de CHANGELOG.md
    python tools/release.py restart --version 0.7.0                # faut-il relancer le jeu ?

Relancer le jeu : un /reload relit les fichiers Lua déjà listés dans les .toc, mais un dossier
d'addon nouveau ou retiré, ou un .toc qui gagne ou perd des fichiers, ne sont lus qu'au lancement
du jeu. `notes` compare donc les .toc de addons/ à ceux du tag précédent et, s'ils diffèrent,
ajoute en tête de chaque langue une puce « Relancer le jeu » / « Restart the game » (sauf si
CHANGELOG.md l'écrit déjà). GuideWoWForever.exe lit cette puce dans les notes de la release.

Le ZIP contient seulement les dossiers de addons/, à la racine : il se dézippe tel quel
dans World of Warcraft/_forever_/Interface/AddOns.
"""
import argparse
import hashlib
import pathlib
import re
import subprocess
import sys
import zipfile

ROOT = pathlib.Path(__file__).resolve().parent.parent
ADDONS = ROOT / "addons"
PACK_TOC = ADDONS / "PolestarPack_GroupeAlliance" / "PolestarPack_GroupeAlliance.toc"
ZIP_NAME = "GuideWoWForever-addons.zip"
EXE_NAME = "GuideWoWForever.exe"
SUMS_NAME = "SHA256SUMS.txt"
REPO = "BurN-30/wow-forever-guide"
SKIP = {"Thumbs.db", "desktop.ini", ".DS_Store"}
# Date fixe dans le ZIP : deux constructions du même commit donnent le même fichier.
ZIP_DATE = (2026, 1, 1, 0, 0, 0)


def fail(msg):
    print("ERREUR : " + msg, file=sys.stderr)
    sys.exit(1)


def toc_version():
    m = re.search(r"^## Version:\s*(\S+)", PACK_TOC.read_text(encoding="utf-8-sig"), re.M)
    if not m:
        fail(f"pas de ligne ## Version dans {PACK_TOC.relative_to(ROOT)}")
    return m.group(1)


def package(version, out):
    found = toc_version()
    if found != version:
        fail(f"le tag annonce {version} mais {PACK_TOC.relative_to(ROOT)} dit {found} : aligner les deux")
    folders = sorted((p for p in ADDONS.iterdir() if p.is_dir()), key=lambda p: p.name.lower())
    for f in folders:
        if not (f / f"{f.name}.toc").is_file():
            fail(f"addons/{f.name} n'a pas de {f.name}.toc")
    if any(p.is_file() for p in ADDONS.iterdir()):
        fail("fichier à la racine de addons/ : seuls des dossiers d'addon sont attendus")
    out.mkdir(parents=True, exist_ok=True)
    dest = out / ZIP_NAME
    count = 0
    with zipfile.ZipFile(dest, "w", zipfile.ZIP_DEFLATED, compresslevel=9) as z:
        for folder in folders:
            for f in sorted(folder.rglob("*"), key=lambda p: p.as_posix().lower()):
                if not f.is_file() or f.name in SKIP or f.suffix == ".pyc":
                    continue
                info = zipfile.ZipInfo(f.relative_to(ADDONS).as_posix(), date_time=ZIP_DATE)
                info.compress_type = zipfile.ZIP_DEFLATED
                info.external_attr = 0o644 << 16
                z.writestr(info, f.read_bytes(), compresslevel=9)
                count += 1
    print(f"{dest.name} : {len(folders)} dossiers, {count} fichiers, {dest.stat().st_size:,} octets")


def sums(folder):
    lines = []
    for f in sorted(folder.iterdir()):
        if f.is_file() and f.name != SUMS_NAME:
            lines.append(f"{hashlib.sha256(f.read_bytes()).hexdigest()}  {f.name}\n")
    if not any(l.endswith(f"  {ZIP_NAME}\n") for l in lines):
        fail(f"{ZIP_NAME} absent de {folder}")
    (folder / SUMS_NAME).write_text("".join(lines), encoding="utf-8", newline="\n")
    print("".join(lines), end="")


RESTART_FR = ("Relancer le jeu : quittez complètement WoW puis relancez-le, un /reload ne suffit pas "
              "pour cette version (fichiers d'addon ajoutés ou retirés).")
RESTART_EN = ("Restart the game: quit WoW completely, then start it again; a /reload is not enough "
              "for this version (addon files added or removed).")


def git(*args):
    r = subprocess.run(["git", *args], cwd=ROOT, capture_output=True, text=True, encoding="utf-8")
    if r.returncode:
        raise RuntimeError(r.stderr.strip())
    return r.stdout


def vkey(tag):
    return tuple(int(x) for x in tag.lstrip("v").split("."))


def toc_lists(read):
    """{dossier: fichiers listés dans son .toc} ; read(None) liste les chemins, read(chemin) lit un .toc."""
    out = {}
    for rel in read(None):
        m = re.fullmatch(r"addons/([^/]+)/\1\.toc", rel)
        if m:
            text = read(rel) or ""
            out[m.group(1)] = sorted(l.strip().replace("/", "\\").lower() for l in text.splitlines()
                                     if l.strip() and not l.lstrip().startswith("#"))
    return out


def restart_needed(version):
    """Vrai si les .toc de addons/ diffèrent de ceux du tag précédent (ou si on ne peut pas le savoir)."""
    try:
        tags = [t for t in git("tag", "--list", "v*").split() if re.fullmatch(r"v\d+\.\d+\.\d+", t)]
    except (RuntimeError, OSError) as e:
        print(f"ATTENTION : git illisible ({e}) : « Relancer le jeu » par prudence", file=sys.stderr)
        return True
    older = sorted((t for t in tags if vkey(t) < vkey(version)), key=vkey)
    if not older:
        print(f"aucun tag avant v{version} : « Relancer le jeu »", file=sys.stderr)
        return True
    prev = older[-1]

    def at_tag(rel):
        if rel is None:
            return git("ls-tree", "-r", "--name-only", prev, "--", "addons").splitlines()
        return git("show", f"{prev}:{rel}")

    def now(rel):
        if rel is None:
            return [p.relative_to(ROOT).as_posix() for p in ADDONS.glob("*/*.toc")]
        return (ROOT / rel).read_text(encoding="utf-8-sig")

    before, after = toc_lists(at_tag), toc_lists(now)
    changed = sorted(set(before) ^ set(after)) + sorted(k for k in set(before) & set(after) if before[k] != after[k])
    print(f"{prev} -> v{version} : " + (".toc changés : " + ", ".join(changed) if changed else "aucun .toc changé, /reload suffit"),
          file=sys.stderr)
    return bool(changed)


def add_restart(body):
    """La puce « Relancer le jeu » en tête des listes ### Français et ### English, si absente."""
    if re.search(r"^\s*[-*]\s*(\*\*)?(Relancer le jeu|Restart the game)", body, re.M | re.I):
        return body
    for head, line in (("### Français", RESTART_FR), ("### English", RESTART_EN)):
        body = re.sub(rf"^({re.escape(head)}[ \t]*\n)", lambda m: m.group(1) + f"- {line}\n", body, count=1, flags=re.M)
    return body


def notes(version):
    text = (ROOT / "CHANGELOG.md").read_text(encoding="utf-8-sig")
    m = re.search(rf"^## v{re.escape(version)}\b.*?$(.*?)(?=^## v|\Z)", text, re.M | re.S)
    if not m:
        fail(f"pas de section « ## v{version} » dans CHANGELOG.md")
    body = m.group(1).strip()
    if restart_needed(version):
        body = add_restart(body)
    exe = f"https://github.com/{REPO}/releases/latest/download/{EXE_NAME}"
    footer = f"""
---

**Installer ou mettre à jour en 1 clic** : télécharger [`{EXE_NAME}`]({exe}) et double-cliquer dessus. Windows affiche « Windows a protégé votre ordinateur » : **Informations complémentaires**, puis **Exécuter quand même**. Ensuite, le raccourci « Mettre à jour le guide WoW » du Bureau suffit.
Sans le programme : `{ZIP_NAME}` à dézipper dans `World of Warcraft\\_forever_\\Interface\\AddOns` (remplacer les dossiers existants).

**Install or update in 1 click**: download [`{EXE_NAME}`]({exe}) and double-click it. If Windows shows "Windows protected your PC": **More info**, then **Run anyway**. Afterwards, the "Update the WoW guide" desktop shortcut is enough.
Without the program: unzip `{ZIP_NAME}` into `World of Warcraft\\_forever_\\Interface\\AddOns` (replace the existing folders).

Empreintes SHA-256 / checksums: `{SUMS_NAME}`.
"""
    return body + "\n" + footer


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    p = sub.add_parser("package")
    p.add_argument("--version", required=True)
    p.add_argument("--out", type=pathlib.Path, required=True)
    s = sub.add_parser("sums")
    s.add_argument("folder", type=pathlib.Path)
    n = sub.add_parser("notes")
    n.add_argument("--version", required=True)
    n.add_argument("--out", type=pathlib.Path)
    sub.add_parser("version")
    rs = sub.add_parser("restart")
    rs.add_argument("--version", required=True)
    a = ap.parse_args()
    if a.cmd == "package":
        package(a.version.lstrip("v"), a.out)
    elif a.cmd == "sums":
        sums(a.folder)
    elif a.cmd == "version":
        print(toc_version())
    elif a.cmd == "restart":
        print("oui" if restart_needed(a.version.lstrip("v")) else "non")
    else:
        text = notes(a.version.lstrip("v"))
        if a.out:
            a.out.parent.mkdir(parents=True, exist_ok=True)
            a.out.write_text(text, encoding="utf-8", newline="\n")
        else:
            sys.stdout.reconfigure(encoding="utf-8")
            print(text)


if __name__ == "__main__":
    main()
