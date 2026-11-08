"""Prépare les fichiers d'une release GitHub (utilisé par .github/workflows/release.yml).

    python tools/release.py package --version 0.5.0 --out dist   # dist/GuideWoWForever-addons.zip
    python tools/release.py sums dist                              # dist/SHA256SUMS.txt
    python tools/release.py notes --version 0.5.0 --out notes.md   # notes tirées de CHANGELOG.md

Le ZIP contient seulement les dossiers de addons/, à la racine : il se dézippe tel quel
dans World of Warcraft/_forever_/Interface/AddOns.
"""
import argparse
import hashlib
import pathlib
import re
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


def notes(version):
    text = (ROOT / "CHANGELOG.md").read_text(encoding="utf-8-sig")
    m = re.search(rf"^## v{re.escape(version)}\b.*?$(.*?)(?=^## v|\Z)", text, re.M | re.S)
    if not m:
        fail(f"pas de section « ## v{version} » dans CHANGELOG.md")
    body = m.group(1).strip()
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
    a = ap.parse_args()
    if a.cmd == "package":
        package(a.version.lstrip("v"), a.out)
    elif a.cmd == "sums":
        sums(a.folder)
    elif a.cmd == "version":
        print(toc_version())
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
