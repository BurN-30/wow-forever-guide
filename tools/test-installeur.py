"""Installe pour de vrai le paquet avec GuideWoWForever.exe, sans Internet ni vrai jeu.

    python tools/test-installeur.py <GuideWoWForever.exe> <dossier dist> [--version 0.12.1]

Le dossier dist contient GuideWoWForever-addons.zip et SHA256SUMS.txt (tools/release.py
package puis sums). Le test lance un petit serveur HTTP local qui imite l'API des releases de
GitHub (dernière release, liste des releases, fichiers à télécharger), fabrique un faux dossier
de jeu temporaire (World of Warcraft\\_forever_\\Interface\\AddOns) et lance le programme sans
fenêtre (--headless --no-self-update --no-shortcut --ignore-running), trois fois :

1. première installation : code de retour 0, chaque dossier du ZIP installé avec exactement
   ses fichiers, version lue dans le .toc du paquet et retenue dans etat.txt ;
2. relance : « déjà à jour », rien de téléchargé, rien de touché ;
3. par-dessus une ancienne installation simulée (paquet v0.0.1, ancien dossier GroupeAlliance) :
   les anciens dossiers partent dans Interface\\_guide-sauvegarde avec leur contenu, les
   nouveautés des versions sautées sont listées ;
4. par-dessus le paquet 0.13.1 (Polestar 0.4.2.2 : 44 dossiers Polestar*), avec etat.txt qui les liste :
   les 21 dossiers que Polestar 0.4.3 a fondus dans d'autres partent dans la sauvegarde ;
5. le même, sans etat.txt (installation par le ZIP, autre PC) : ces noms connus partent aussi.
   Polestar_Recorder, que le paquet ne livre pas, n'est jamais touché.

Un autre addon et le dossier WTF ne doivent jamais être touchés. Code de sortie 1 au premier
contrôle qui échoue (avec la fin du journal du programme), 0 si tout passe. Le dossier
temporaire est supprimé à la fin et le serveur arrêté.
"""
import argparse
import hashlib
import http.server
import json
import pathlib
import re
import subprocess
import sys
import tempfile
import threading
import urllib.parse
import zipfile
import zlib

ZIP_NAME = "GuideWoWForever-addons.zip"
SUMS_NAME = "SHA256SUMS.txt"
PACK = "PolestarPack_GroupeAlliance"
REPO_PATH = "/repos/test/wow-forever-guide"
OLD_VERSION, SKIPPED_VERSION = "0.0.1", "0.0.2"
TIMEOUT = 600  # secondes par lancement
# Le paquet 0.13.1 : Polestar 0.4.2.2 en 42 dossiers (plus les deux du paquet), dont 21 que
# Polestar 0.4.3 a fondus dans d'autres (Polestar_Skins, Polestar_Guides_Alliance et _Horde, Polestar).
OLD_0131 = "0.13.1"
OLD_0131_POLESTAR = [
    "Polestar", "Polestar_Arcade", "Polestar_Codex", "Polestar_deDE", "Polestar_esES", "Polestar_esMX",
    "Polestar_Experimental", "Polestar_frFR", "Polestar_Guides", "Polestar_Guides_Alliance", "Polestar_Guides_Dwarf",
    "Polestar_Guides_Gnome", "Polestar_Guides_Horde", "Polestar_Guides_Human", "Polestar_Guides_NightElf",
    "Polestar_Guides_Orc", "Polestar_Guides_Scourge", "Polestar_Guides_Skyborne", "Polestar_Guides_Tauren",
    "Polestar_Guides_Troll", "Polestar_ItemDB", "Polestar_koKR", "Polestar_Looks", "Polestar_Nav", "Polestar_Nav_EK",
    "Polestar_Nav_Kalimdor", "Polestar_Options", "Polestar_ptBR", "Polestar_QuestDB", "Polestar_ruRU",
    "Polestar_SkinAPI", "Polestar_Skin_Aurora", "Polestar_Skin_Beacon", "Polestar_Skin_Hairline",
    "Polestar_Skin_Lanterns", "Polestar_Skin_Lumen", "Polestar_Skin_Sheen", "Polestar_Skin_Umbra",
    "Polestar_Skin_Vellum", "Polestar_Skin_Waymark", "Polestar_zhCN", "Polestar_zhTW",
]


class Echec(Exception):
    pass


def check(cond, msg):
    if not cond:
        raise Echec(msg)


def toc_version(text):
    m = re.search(r"^##\s*Version\s*:\s*(\S+)", text, re.M)
    return m.group(1) if m else None


def vkey(v):
    return tuple(int(x) for x in v.split("."))


# ---- Faux GitHub ---------------------------------------------------------------------

class FakeGitHub:
    """L'API des releases de GitHub, réduite à ce que lit le programme (GitHub.cs)."""

    def __init__(self, dist, version):
        self.files = {f.name: f for f in dist.iterdir() if f.is_file()}
        self.version = version
        self.downloads = {}
        handler = self._handler()
        self.server = http.server.ThreadingHTTPServer(("127.0.0.1", 0), handler)
        self.base = f"http://127.0.0.1:{self.server.server_address[1]}"
        self.thread = threading.Thread(target=self.server.serve_forever, daemon=True)

    @property
    def latest_url(self):
        return self.base + REPO_PATH + "/releases/latest"

    def release(self, version, with_assets):
        r = {
            "tag_name": "v" + version,
            "draft": False,
            "body": f"### Français\n- Nouveauté de test v{version}.\n\n### English\n- Test news v{version}.\n",
        }
        if with_assets:
            r["assets"] = [{
                "name": name,
                "size": f.stat().st_size,
                "digest": "sha256:" + hashlib.sha256(f.read_bytes()).hexdigest(),
                "browser_download_url": f"{self.base}/download/{urllib.parse.quote(name)}",
            } for name, f in sorted(self.files.items())]
        return r

    def _handler(self):
        gh = self

        class Handler(http.server.BaseHTTPRequestHandler):
            def log_message(self, *args):
                pass

            def send(self, code, body, kind="application/json"):
                self.send_response(code)
                self.send_header("Content-Type", kind)
                self.send_header("Content-Length", str(len(body)))
                self.end_headers()
                self.wfile.write(body)

            def do_GET(self):
                path = urllib.parse.urlsplit(self.path).path
                if path == REPO_PATH + "/releases/latest":
                    return self.send(200, json.dumps(gh.release(gh.version, True)).encode())
                if path == REPO_PATH + "/releases":
                    rel = [gh.release(gh.version, True), gh.release(SKIPPED_VERSION, False), gh.release(OLD_VERSION, False)]
                    return self.send(200, json.dumps(rel).encode())
                if path.startswith("/download/"):
                    name = urllib.parse.unquote(path[len("/download/"):])
                    f = gh.files.get(name)
                    if f:
                        gh.downloads[name] = gh.downloads.get(name, 0) + 1
                        return self.send(200, f.read_bytes(), "application/octet-stream")
                self.send(404, b'{"message": "Not Found"}')

        return Handler

    def __enter__(self):
        self.thread.start()
        return self

    def __exit__(self, *exc):
        self.server.shutdown()
        self.server.server_close()
        self.thread.join(10)


# ---- Faux jeu et lancements ----------------------------------------------------------

def fake_game(root):
    """Un dossier World of Warcraft avec _forever_, un autre addon et un dossier WTF."""
    wow = root / "World of Warcraft"
    addons = wow / "_forever_" / "Interface" / "AddOns"
    (addons / "AutreAddon").mkdir(parents=True)
    (addons / "AutreAddon" / "AutreAddon.toc").write_text("## Interface: 11508\n## Version: 9.9\nAutre.lua\n", encoding="utf-8")
    (addons / "AutreAddon" / "Autre.lua").write_text("-- un addon qui n'est pas du guide\n", encoding="utf-8")
    wtf = wow / "_forever_" / "WTF"
    wtf.mkdir(parents=True)
    (wtf / "Config.wtf").write_text('SET locale "frFR"\n', encoding="utf-8")
    return wow, addons


def snapshot(folder):
    return {p.relative_to(folder).as_posix(): p.read_bytes() for p in folder.rglob("*") if p.is_file()}


class Runner:
    def __init__(self, exe, api, data):
        self.exe, self.api, self.data = exe, api, data
        self.journal = data / "journal.txt"

    def journal_text(self):
        if not self.journal.exists():
            return ""
        return self.journal.read_bytes().decode("utf-8", "replace").replace("﻿", "")

    def run(self, wow, extra=()):
        before = len(self.journal_text())
        cmd = [str(self.exe), "--headless", "--no-self-update", "--no-shortcut", "--ignore-running",
               "--lang", "fr", "--api", self.api, "--data", str(self.data), "--wow", str(wow), *extra]
        try:
            p = subprocess.run(cmd, capture_output=True, timeout=TIMEOUT)
        except subprocess.TimeoutExpired:
            raise Echec(f"le programme n'a pas fini en {TIMEOUT} s")
        log = self.journal_text()[before:]
        return p.returncode, log

    def tail(self, n=25):
        lines = self.journal_text().splitlines()
        return "\n".join("    " + l for l in lines[-n:])


def check_installed(addons, z, version):
    """Chaque dossier du ZIP est dans AddOns avec exactement ses fichiers, octet pour octet."""
    entries = [e for e in z.infolist() if not e.is_dir()]
    roots = sorted({e.filename.split("/")[0] for e in entries})
    for r in roots:
        check((addons / r).is_dir(), f"dossier {r} absent de AddOns")
        on_disk = {p.relative_to(addons).as_posix() for p in (addons / r).rglob("*") if p.is_file()}
        in_zip = {e.filename for e in entries if e.filename.split("/")[0] == r}
        check(on_disk == in_zip, f"{r} : fichiers différents du ZIP (en trop : {sorted(on_disk - in_zip)[:5]}, "
                                 f"manquants : {sorted(in_zip - on_disk)[:5]})")
    for e in entries:
        f = addons / e.filename
        data = f.read_bytes()
        check(len(data) == e.file_size and zlib.crc32(data) == e.CRC, f"{e.filename} : contenu différent du ZIP")
    toc = (addons / PACK / f"{PACK}.toc").read_text(encoding="utf-8-sig")
    check(toc_version(toc) == version, f"{PACK}.toc installé : version {toc_version(toc)} au lieu de {version}")
    return roots, len(entries)


def state(data):
    f = data / "etat.txt"
    check(f.exists(), "etat.txt absent du dossier --data")
    return dict(l.split("=", 1) for l in f.read_text(encoding="utf-8-sig").splitlines() if "=" in l)


# ---- Les trois cas -------------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("exe", type=pathlib.Path)
    ap.add_argument("dist", type=pathlib.Path)
    ap.add_argument("--version", help="version attendue (sinon celle du .toc du paquet dans le ZIP)")
    a = ap.parse_args()
    exe, dist = a.exe.resolve(), a.dist.resolve()
    zpath = dist / ZIP_NAME
    for f in (exe, zpath, dist / SUMS_NAME):
        if not f.is_file():
            print(f"ERREUR : {f} introuvable", file=sys.stderr)
            return 1

    z = zipfile.ZipFile(zpath)
    version = toc_version(z.read(f"{PACK}/{PACK}.toc").decode("utf-8-sig"))
    if a.version and a.version.lstrip("v") != version:
        print(f"ERREUR : le ZIP contient la version {version}, {a.version} attendue", file=sys.stderr)
        return 1
    if not version or vkey(version) <= vkey(SKIPPED_VERSION):
        print(f"ERREUR : version du paquet inattendue : {version}", file=sys.stderr)
        return 1
    print(f"Test de {exe.name} avec {zpath.name} (v{version})")

    with tempfile.TemporaryDirectory(prefix="test-installeur-", ignore_cleanup_errors=True) as tmp, \
            FakeGitHub(dist, version) as gh:
        tmp = pathlib.Path(tmp)
        run = Runner(exe, gh.latest_url, tmp / "donnees")
        step = ""
        try:
            # 1. Première installation.
            step = "1. première installation"
            wow, addons = fake_game(tmp / "jeu1")
            other = snapshot(addons / "AutreAddon"), snapshot(wow / "_forever_" / "WTF")
            code, log = run.run(wow)
            check(code == 0, f"code de retour {code}")
            check(gh.downloads.get(ZIP_NAME) == 1, f"ZIP téléchargé {gh.downloads.get(ZIP_NAME, 0)} fois au lieu d'une")
            check(f"Guide installé : v{version}" in log, "pas de « Guide installé : v" + version + " » dans le journal")
            roots, count = check_installed(addons, z, version)
            check(state(run.data).get("version") == version, "etat.txt ne retient pas la version " + version)
            iface = addons.parent
            check(not (iface / "_guide-maj-en-cours").exists(), "dossier de décompression laissé en place")
            check(not (iface / "_guide-sauvegarde").exists(), "sauvegarde créée alors qu'il n'y avait rien à sauvegarder")
            check((snapshot(addons / "AutreAddon"), snapshot(wow / "_forever_" / "WTF")) == other, "autre addon ou WTF modifié")
            print(f"OK {step} : {len(roots)} dossiers, {count} fichiers identiques au ZIP, v{version}")

            # 2. Relance : déjà à jour.
            step = "2. relance, déjà à jour"
            before = snapshot(addons)
            code, log = run.run(wow)
            check(code == 0, f"code de retour {code}")
            check("déjà à jour" in log, "pas de « déjà à jour » dans le journal")
            check(gh.downloads.get(ZIP_NAME) == 1, "le ZIP a été téléchargé de nouveau")
            check(snapshot(addons) == before, "AddOns modifié alors que le guide était à jour")
            check(not (iface / "_guide-sauvegarde").exists(), "sauvegarde créée alors que le guide était à jour")
            print(f"OK {step} : rien de téléchargé ni de modifié")

            # 3. Par-dessus une ancienne installation (autre jeu, mémoire du programme vide).
            step = "3. mise à jour d'une ancienne installation"
            run = Runner(exe, gh.latest_url, tmp / "donnees3")
            wow, addons = fake_game(tmp / "jeu3")
            iface = addons.parent
            old = {
                PACK: {f"{PACK}.toc": f"## Interface: 11508\n## Version: {OLD_VERSION}\nPack.lua\n",
                       "Pack.lua": "-- ancien paquet\n", "ancien-fichier.lua": "-- retiré depuis\n"},
                "Polestar": {"Polestar.toc": "## Interface: 11508\n## Version: 0.2.0\nPolestar.lua\n",
                             "Polestar.lua": "-- ancien Polestar\n"},
                "GroupeAlliance": {"GroupeAlliance.toc": "## Version: 0.1.0\n"},  # nom d'avant la 0.2
            }
            for folder, files in old.items():
                (addons / folder).mkdir()
                for name, text in files.items():
                    (addons / folder / name).write_text(text, encoding="utf-8")
            other = snapshot(addons / "AutreAddon"), snapshot(wow / "_forever_" / "WTF")
            code, log = run.run(wow)
            check(code == 0, f"code de retour {code}")
            check(f"Mise à jour de v{OLD_VERSION} vers v{version}" in log, "version installée non reconnue (v" + OLD_VERSION + ")")
            check_installed(addons, z, version)
            check(not (addons / "GroupeAlliance").exists(), "ancien dossier GroupeAlliance laissé dans AddOns")
            backup = iface / "_guide-sauvegarde"
            for folder, files in old.items():
                for name, text in files.items():
                    f = backup / folder / name
                    check(f.is_file() and f.read_text(encoding="utf-8") == text, f"sauvegarde : {folder}/{name} perdu")
            check((backup / "LISEZMOI.txt").is_file(), "sauvegarde sans LISEZMOI.txt")
            check(f"v{SKIPPED_VERSION} :" in log and f"Nouveauté de test v{SKIPPED_VERSION}" in log,
                  f"nouveautés de la version sautée v{SKIPPED_VERSION} non affichées")
            check((snapshot(addons / "AutreAddon"), snapshot(wow / "_forever_" / "WTF")) == other, "autre addon ou WTF modifié")
            print(f"OK {step} : anciens dossiers sauvegardés ({', '.join(sorted(old))}), versions sautées listées")

            # 4 et 5. Par-dessus le paquet 0.13.1 (Polestar 0.4.2.2, 44 dossiers Polestar*) : avec la mémoire du
            # programme qui les liste (4), puis sans elle, comme après une installation par le ZIP (5).
            # Les dossiers que Polestar 0.4.3 a fondus dans d'autres partent dans la sauvegarde,
            # Polestar_Recorder (jamais livré par le paquet) et l'autre addon restent.
            for step, with_state in (("4. mise à jour du paquet 0.13.1 (Polestar 0.4.2.2)", True),
                                     ("5. même mise à jour, sans etat.txt", False)):
                data = tmp / ("donnees4" if with_state else "donnees5")
                run = Runner(exe, gh.latest_url, data)
                wow, addons = fake_game(tmp / ("jeu4" if with_state else "jeu5"))
                iface = addons.parent
                folders = OLD_0131_POLESTAR + [PACK, PACK + "_frFR"]
                for folder in folders + ["Polestar_Recorder"]:
                    (addons / folder).mkdir()
                    version_line = f"## Version: {OLD_0131}\n" if folder.startswith(PACK) else "## Version: 0.4.2.2\n"
                    (addons / folder / f"{folder}.toc").write_text("## Interface: 16001\n" + version_line, encoding="utf-8")
                if with_state:
                    data.mkdir()
                    (data / "etat.txt").write_text(f"jeu=\nversion={OLD_0131}\ndossiers={';'.join(folders)}\nraccourci=1\n",
                                                   encoding="utf-8")
                other = snapshot(addons / "AutreAddon"), snapshot(addons / "Polestar_Recorder"), snapshot(wow / "_forever_" / "WTF")
                code, log = run.run(wow)
                check(code == 0, f"code de retour {code}")
                check(f"Mise à jour de v{OLD_0131} vers v{version}" in log, "version installée non reconnue (v" + OLD_0131 + ")")
                roots, _ = check_installed(addons, z, version)
                gone = [f for f in OLD_0131_POLESTAR if f not in roots]
                left = [f for f in gone if (addons / f).exists()]
                check(not left, f"anciens dossiers laissés dans AddOns : {left}")
                missing = [f for f in gone if not (iface / "_guide-sauvegarde" / f / f"{f}.toc").is_file()]
                check(not missing, f"anciens dossiers absents de la sauvegarde : {missing}")
                check((addons / "Polestar_Skins").is_dir() or "Polestar_Skins" not in roots, "Polestar_Skins absent")
                check((snapshot(addons / "AutreAddon"), snapshot(addons / "Polestar_Recorder"),
                       snapshot(wow / "_forever_" / "WTF")) == other, "autre addon, Polestar_Recorder ou WTF modifié")
                kept = sorted(f.name for f in addons.iterdir() if f.is_dir())
                check(kept == sorted(roots + ["AutreAddon", "Polestar_Recorder"]), f"dossiers inattendus dans AddOns : {kept}")
                print(f"OK {step} : {len(gone)} anciens dossiers retirés et sauvegardés, {len(roots)} dossiers en place, "
                      "Polestar_Recorder et l'autre addon intacts")
        except Echec as e:
            print(f"ÉCHEC {step} : {e}", file=sys.stderr)
            print("  Fin du journal du programme :\n" + run.tail(), file=sys.stderr)
            return 1
    print("Installation testée : tout est bon.")
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8")
    sys.stderr.reconfigure(encoding="utf-8")
    sys.exit(main())
