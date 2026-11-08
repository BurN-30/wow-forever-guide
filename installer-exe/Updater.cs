// Le déroulé : dernière release, mise à jour du programme, dossier du jeu, téléchargement vérifié,
// remplacement des dossiers de l'addon avec sauvegarde, raccourci, résumé.
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading;

namespace GuideWoWForever
{
	enum Kind { Info, Ok, Warn, Error }
	enum RunningChoice { Retry, Ignore, Abort }

	interface IUi
	{
		void Line(string text, Kind kind);
		void Progress(int percent);
		string AskFolder(string description);
		RunningChoice AskWowRunning();
		/// <summary>Le message de fin, en gros et bien visible.</summary>
		void Banner(string text, Kind kind);
	}

	sealed class HeadlessUi : IUi
	{
		readonly Options o;
		public HeadlessUi(Options o) { this.o = o; }
		public void Line(string text, Kind kind)
		{
			try { Console.WriteLine((kind == Kind.Error ? "ERREUR " : kind == Kind.Warn ? "ATTENTION " : "") + text); } catch { }
		}
		public void Progress(int percent) { }
		public string AskFolder(string description) { return null; }
		public RunningChoice AskWowRunning() { return o.IgnoreRunning ? RunningChoice.Ignore : RunningChoice.Abort; }
		public void Banner(string text, Kind kind)
		{
			try { Console.WriteLine("\n==== " + text + " ====\n"); } catch { }
		}
	}

	sealed class Updater
	{
		const string PackFolder = "PolestarPack_GroupeAlliance";
		const string StagingName = "_guide-maj-en-cours";
		const string BackupName = "_guide-sauvegarde";

		// Dossiers des anciennes versions (Polestar 0.2.x, paquet 0.1.0) à retirer.
		static readonly Regex Legacy = new Regex(@"^(Polestar_(Guides|Names)_[a-z]{2}[A-Z]{2}|GroupeAlliance)$");

		readonly Options o;
		readonly IUi ui;
		readonly List<string> temp = new List<string>();
		State st;
		Dictionary<string, string> sums;
		public bool Relaunched;

		public Updater(Options o, IUi ui) { this.o = o; this.ui = ui; }

		void Say(string text, Kind kind = Kind.Info)
		{
			Journal.Write((kind == Kind.Info ? "" : kind.ToString().ToUpperInvariant() + " ") + text);
			ui.Line(text, kind);
		}

		public int Run()
		{
			Journal.Write("==== GuideWoWForever " + Program.OwnVersion + " (" + Paths.SelfExe + "), Windows " + Environment.OSVersion.Version
				+ ", langue " + (L.Fr ? "fr" : "en") + ", options : " + Options.Quote(o.Raw) + (o.AfterSelfUpdate ? " --apres-maj" : ""));
			try { return RunCore(); }
			catch (Failure f)
			{
				Journal.Write("Échec : " + f);
				Say(f.Message, Kind.Error);
				if (f.Code == 1) Say(L.T("Détail dans le journal : ", "Details in the log: ") + Journal.FilePath);
				return f.Code;
			}
			catch (Exception e)
			{
				Journal.Write("Erreur inattendue : " + e);
				Say(L.T("Erreur inattendue : ", "Unexpected error: ") + e.Message, Kind.Error);
				Say(L.T("Détail dans le journal : ", "Details in the log: ") + Journal.FilePath);
				return 1;
			}
			finally
			{
				foreach (string t in temp) DeleteFile(t);
			}
		}

		int RunCore()
		{
			CleanOldExe();
			st = State.Load();

			if (o.Detect)
			{
				string g = Detect();
				Say(g != null ? L.T("Dossier du jeu trouvé : ", "Game folder found: ") + g
					: L.T("Dossier du jeu non trouvé.", "Game folder not found."), g != null ? Kind.Ok : Kind.Warn);
				return g != null ? 0 : 1;
			}

			Say(L.T("Recherche de la dernière version du guide sur GitHub...", "Looking for the latest guide version on GitHub..."));
			var release = GitHub.Latest(o.Api);
			LastRelease = release;
			Say(L.T("Dernière version publiée : ", "Latest published version: ") + "v" + release.Version);

			if (!o.NoSelfUpdate && !o.AfterSelfUpdate && release.Version > Program.OwnVersion && SelfUpdate(release))
				return 0;

			string game = Detect();
			if (game == null)
			{
				Say(L.T("Dossier du jeu non trouvé automatiquement : choisissez-le dans la fenêtre.",
					"Game folder not found automatically: pick it in the window."), Kind.Warn);
				game = AskGame();
			}
			if (game == null)
				throw new Failure(L.T("Aucun dossier WoW Forever choisi : rien n'a été installé.", "No WoW Forever folder chosen: nothing was installed."), 2);
			if (o.Wow == null && !Paths.Same(game, st.Game ?? "")) { st.Game = game; st.Save(); }
			Say(L.T("Dossier du jeu : ", "Game folder: ") + game);

			string addons = Path.Combine(game, "Interface", "AddOns");
			Directory.CreateDirectory(addons);
			Version installed = TocVersion(addons, PackFolder);
			Version polestar = TocVersion(addons, "Polestar");
			bool restartMarked = RestartMarked(release.Body);
			if (installed != null)
			{
				if (installed == release.Version)
					Say(L.T("Guide déjà installé : v", "Guide already installed: v") + installed);
				else
					Say(L.T("Mise à jour de v", "Update from v") + installed + L.T(" vers v", " to v") + release.Version, Kind.Ok);
			}
			else if (polestar != null)
				Say(L.T("Première installation du guide (Polestar v", "First install of the guide (Polestar v") + polestar
					+ L.T(" est déjà là : il sera remplacé par celui du guide).", " is already there: it will be replaced by the guide's)."), Kind.Ok);
			else
				Say(L.T("Première installation : v", "First install: v") + release.Version, Kind.Ok);

			if (!o.Force && installed != null && installed == release.Version && FoldersPresent(addons))
			{
				Say(L.T("Le guide est déjà à jour (v", "The guide is already up to date (v") + release.Version + L.T("). Rien à faire.", "). Nothing to do."), Kind.Ok);
				InstallCopyAndShortcut();
				return 0;
			}

			// Un /reload relit les fichiers Lua déjà listés dans les .toc ; un nouveau dossier
			// d'addon ou un .toc qui change de liste ne sont lus qu'au lancement du jeu. Les notes
			// de la release le disent (puce « Relancer le jeu », tools/release.py).
			bool restart = installed == null || restartMarked;
			if (restartMarked) Journal.Write("Notes de la release : relancer le jeu.");
			CheckGameClosed(game, restart);

			var zipAsset = release.Find(Program.ZipAsset);
			if (zipAsset == null) throw GitHub.Incomplete(Program.ZipAsset);
			string zip = Path.Combine(Path.GetTempPath(), "GuideWoWForever-" + Guid.NewGuid().ToString("N") + ".zip");
			temp.Add(zip);
			Say(L.T("Téléchargement du guide (", "Downloading the guide (") + L.Size(zipAsset.Size) + ")...");
			GitHub.Download(zipAsset, Sha(zipAsset.Name), zip, Progress);
			ui.Progress(-1);
			Say(L.T("Fichier vérifié (taille et empreinte SHA-256).", "File checked (size and SHA-256)."), Kind.Ok);

			var result = Install(zip, addons);
			st.Version = release.Version.ToString();
			st.Folders = result.Folders;
			st.Save();

			if (installed == null)
				Say(L.T("Guide installé : v", "Guide installed: v") + release.Version, Kind.Ok);
			else if (installed == release.Version)
				Say(L.T("Guide réinstallé : v", "Guide reinstalled: v") + release.Version, Kind.Ok);
			else
				Say(L.T("Guide mis à jour : v", "Guide updated: v") + installed + " -> v" + release.Version, Kind.Ok);
			Say(result.Folders.Count + L.T(" dossiers d'addon copiés dans ", " addon folders copied to ") + addons);
			if (result.Removed.Count > 0)
				Say(L.T("Anciens dossiers retirés : ", "Old folders removed: ") + string.Join(", ", result.Removed));
			if (result.Backup != null)
				Say(L.T("Ancienne version sauvegardée dans ", "Previous version backed up in ") + result.Backup);
			Say(L.T("Vos autres addons et vos réglages (dossier WTF) n'ont pas été touchés.",
				"Your other addons and your settings (WTF folder) were not touched."));
			if (result.Added.Count > 0)
			{
				Journal.Write("Nouveaux dossiers d'addon : " + string.Join(";", result.Added));
				restart = true;
			}

			InstallCopyAndShortcut();
			ShowNotes(release);
			string end;
			if (installed == null)
				end = L.T("Relancez WoW : le guide s'ouvre tout seul, rien à cocher.", "Restart WoW: the guide opens by itself, nothing to tick.");
			else if (restart)
				end = L.T("Mise à jour faite. Quittez complètement le jeu puis relancez-le (un /reload ne suffit pas pour cette version).",
					"Update done. Quit the game completely, then start it again (a /reload is not enough for this version).");
			else
				end = L.T("Mise à jour faite. En jeu, tapez /reload dans le chat : pas besoin de relancer le jeu.",
					"Update done. In game, type /reload in the chat: no need to restart the game.");
			Say(end, Kind.Ok);
			ui.Banner(end, restart && installed != null ? Kind.Warn : Kind.Ok);
			return 0;
		}

		/// <summary>Les notes de la release demandent de relancer le jeu : une puce qui commence par
		/// « Relancer le jeu » ou « Restart the game » (ajoutée par tools/release.py quand un .toc
		/// change de liste de fichiers ou qu'un dossier d'addon apparaît ou disparaît).</summary>
		public static bool RestartMarked(string body)
		{
			foreach (string raw in (body ?? "").Replace("\r", "").Split('\n'))
			{
				string l = raw.Trim().TrimStart('-', '*', ' ').Replace("**", "").Trim();
				if (l.StartsWith("Relancer le jeu", StringComparison.OrdinalIgnoreCase)
					|| l.StartsWith("Restart the game", StringComparison.OrdinalIgnoreCase)) return true;
			}
			return false;
		}

		void Progress(long done, long total)
		{
			ui.Progress(total > 0 ? (int)Math.Min(100, done * 100 / total) : -1);
		}

		string Sha(string name)
		{
			if (sums == null) sums = GitHub.Sums(LastRelease);
			string h;
			return sums.TryGetValue(name, out h) ? h : null;
		}

		Release LastRelease;

		// ---- Dossier du jeu --------------------------------------------------------------

		string Detect()
		{
			if (o.Wow != null)
			{
				string g = GameFinder.GameDir(o.Wow);
				if (g == null) throw new Failure(L.T("Ce dossier ne contient pas _forever_ : ", "This folder does not contain _forever_: ") + o.Wow);
				return g;
			}
			return GameFinder.Find(st, m => Journal.Write("Dossier trouvé (" + m + ")"));
		}

		string AskGame()
		{
			while (true)
			{
				string picked = ui.AskFolder(L.T("Choisissez le dossier World of Warcraft (celui qui contient _forever_).",
					"Pick the World of Warcraft folder (the one that contains _forever_)."));
				if (picked == null) return null;
				string g = GameFinder.GameDir(picked);
				if (g != null) return g;
				Say(L.T("Ce dossier ne contient pas _forever_ : ", "This folder does not contain _forever_: ") + picked, Kind.Warn);
			}
		}

		void CheckGameClosed(string game, bool restart)
		{
			if (!restart && GameFinder.RunningGame(game).Count > 0)
			{
				// Le jeu lit les fichiers d'addon au lancement et à chaque /reload, sans les garder
				// ouverts : ils se remplacent jeu ouvert. Un fichier bloqué quand même ? Install
				// remet l'ancienne version et le dit (Locked).
				Say(L.T("World of Warcraft est ouvert : pas besoin de le fermer pour cette mise à jour, un /reload suffira.",
					"World of Warcraft is running: no need to close it for this update, a /reload will do."));
				return;
			}
			while (GameFinder.RunningGame(game).Count > 0)
			{
				Say(L.T("World of Warcraft est ouvert.", "World of Warcraft is running."), Kind.Warn);
				var c = o.IgnoreRunning ? RunningChoice.Ignore : ui.AskWowRunning();
				if (c == RunningChoice.Retry) continue;
				if (c == RunningChoice.Ignore)
				{
					Say(L.T("Installation quand même : le jeu ne verra le nouveau guide qu'après avoir été relancé.",
						"Installing anyway: the game will only see the new guide after a restart."), Kind.Warn);
					return;
				}
				throw new Failure(L.T("Annulé : fermez WoW puis relancez ce programme. Rien n'a été modifié.",
					"Cancelled: close WoW, then run this program again. Nothing was changed."), 3);
			}
		}

		static Version TocVersion(string addons, string folder)
		{
			string toc = Path.Combine(addons, folder, folder + ".toc");
			try
			{
				if (!File.Exists(toc)) return null;
				foreach (string line in File.ReadLines(toc))
				{
					var m = Regex.Match(line, @"^##\s*Version\s*:\s*(\S+)");
					if (m.Success) return Program.ParseVersion(m.Groups[1].Value);
				}
			}
			catch { }
			return null;
		}

		bool FoldersPresent(string addons)
		{
			var need = st.Folders.Count > 0 ? st.Folders : new List<string> { "Polestar", PackFolder };
			return need.All(f => Directory.Exists(Path.Combine(addons, f)));
		}

		// ---- Installation ----------------------------------------------------------------

		sealed class InstallResult
		{
			public List<string> Folders = new List<string>();
			public List<string> Removed = new List<string>();
			public List<string> Added = new List<string>();
			public string Backup;
		}

		InstallResult Install(string zip, string addons)
		{
			string iface = Path.GetDirectoryName(addons);
			string staging = Path.Combine(iface, StagingName);
			string backup = Path.Combine(iface, BackupName);
			var res = new InstallResult();

			Say(L.T("Décompression...", "Unpacking..."));
			DeleteDir(staging);
			Directory.CreateDirectory(staging);
			var roots = new SortedSet<string>(StringComparer.OrdinalIgnoreCase);
			try
			{
				string stagingFull = Path.GetFullPath(staging) + "\\";
				using (var z = ZipFile.OpenRead(zip))
					foreach (var e in z.Entries)
					{
						string name = e.FullName.Replace('\\', '/');
						string[] parts = name.Split('/');
						if (name.StartsWith("/") || name.Contains(":") || parts.Any(p => p == ".." || p == "."))
							throw BadZip(name);
						if (parts.Length < 2) throw BadZip(name); // fichier à la racine du paquet
						if (!Regex.IsMatch(parts[0], "^[A-Za-z0-9_]+$")) throw BadZip(name);
						roots.Add(parts[0]);
						string dest = Path.GetFullPath(Path.Combine(staging, name.Replace('/', '\\')));
						if (!dest.StartsWith(stagingFull, StringComparison.OrdinalIgnoreCase)) throw BadZip(name);
						if (name.EndsWith("/")) { Directory.CreateDirectory(dest); continue; }
						Directory.CreateDirectory(Path.GetDirectoryName(dest));
						e.ExtractToFile(dest, true);
					}
				foreach (string r in roots)
					if (!File.Exists(Path.Combine(staging, r, r + ".toc"))) throw BadZip(r + "/" + r + ".toc");
				if (!roots.Contains("Polestar") || !roots.Contains(PackFolder)) throw BadZip("Polestar, " + PackFolder);
			}
			catch (Failure) { DeleteDir(staging); throw; }
			catch (InvalidDataException e) { DeleteDir(staging); throw new Failure(L.T("Paquet téléchargé illisible : rien n'a été modifié.", "Downloaded package unreadable: nothing was changed."), 1, e); }
			catch (Exception e) when (e is IOException || e is UnauthorizedAccessException)
			{
				DeleteDir(staging);
				throw new Failure(L.T("Impossible d'écrire dans le dossier du jeu (", "Cannot write to the game folder (") + e.Message
					+ L.T(") : rien n'a été modifié.", "): nothing was changed."), 1, e);
			}

			// Dossiers venant d'une version précédente et absents de la nouvelle : seulement
			// ceux que ce programme a installés ou les anciens noms connus, jamais un autre addon.
			var obsolete = st.Folders.Where(n => n.StartsWith("Polestar", StringComparison.OrdinalIgnoreCase))
				.Concat(SafeDirs(addons).Where(n => Legacy.IsMatch(n)))
				.Where(n => !roots.Contains(n) && Directory.Exists(Path.Combine(addons, n)))
				.Distinct(StringComparer.OrdinalIgnoreCase).ToList();

			Say(L.T("Remplacement des dossiers de l'addon...", "Replacing the addon folders..."));
			DeleteDir(backup);
			Directory.CreateDirectory(backup);
			var moved = new List<string>();
			try
			{
				foreach (string n in roots.Concat(obsolete))
				{
					string cur = Path.Combine(addons, n);
					if (!Directory.Exists(cur)) continue;
					Directory.Move(cur, Path.Combine(backup, n));
					moved.Add(n);
				}
			}
			catch (Exception e)
			{
				Journal.Write("Sauvegarde impossible : " + e);
				Restore(moved, backup, addons, new List<string>());
				DeleteDir(staging);
				throw Locked(e);
			}

			var placed = new List<string>();
			try
			{
				foreach (string r in roots)
				{
					Directory.Move(Path.Combine(staging, r), Path.Combine(addons, r));
					placed.Add(r);
				}
			}
			catch (Exception e)
			{
				Journal.Write("Remplacement impossible : " + e);
				Restore(moved, backup, addons, placed);
				DeleteDir(staging);
				throw Locked(e);
			}

			DeleteDir(staging);
			res.Folders = roots.ToList();
			res.Removed = obsolete;
			res.Added = roots.Where(r => !moved.Contains(r, StringComparer.OrdinalIgnoreCase)).ToList();
			if (moved.Count > 0)
			{
				File.WriteAllText(Path.Combine(backup, "LISEZMOI.txt"), L.T(
					"Ancienne version du guide, sauvegardée le " + DateTime.Now.ToString("dd/MM/yyyy HH:mm") + ".\r\n" +
					"Pour revenir en arrière : supprimer les dossiers du même nom dans ..\\AddOns, puis y déplacer ceux-ci.\r\n",
					"Previous version of the guide, backed up on " + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + ".\r\n" +
					"To go back: delete the folders with the same names in ..\\AddOns, then move these ones there.\r\n"));
				res.Backup = backup;
			}
			else DeleteDir(backup);
			Journal.Write("Installé : " + string.Join(";", res.Folders) + " ; retirés : " + string.Join(";", obsolete));
			return res;
		}

		static void Restore(List<string> moved, string backup, string addons, List<string> placed)
		{
			foreach (string p in placed) DeleteDir(Path.Combine(addons, p));
			foreach (string m in moved)
			{
				try { Directory.Move(Path.Combine(backup, m), Path.Combine(addons, m)); }
				catch (Exception e) { Journal.Write("Remise en place impossible de " + m + " : " + e); }
			}
			try { Directory.Delete(backup); } catch { } // seulement s'il est vide
		}

		static Failure Locked(Exception e)
		{
			return new Failure(L.T("Un fichier de l'addon est bloqué (", "An addon file is locked (") + e.Message +
				L.T("). Fermez WoW et réessayez. L'ancienne version a été remise en place.", "). Close WoW and try again. The previous version was put back."), 1, e);
		}

		static Failure BadZip(string what)
		{
			return new Failure(L.T("Paquet téléchargé inattendu (", "Unexpected downloaded package (") + what + L.T(") : rien n'a été modifié.", "): nothing was changed."));
		}

		static IEnumerable<string> SafeDirs(string dir)
		{
			try { return Directory.GetDirectories(dir).Select(Path.GetFileName).ToList(); }
			catch { return Enumerable.Empty<string>(); }
		}

		static void DeleteDir(string dir)
		{
			if (!Directory.Exists(dir)) return;
			for (int attempt = 0; ; attempt++)
			{
				try
				{
					foreach (string f in Directory.GetFiles(dir, "*", SearchOption.AllDirectories))
						File.SetAttributes(f, FileAttributes.Normal);
					Directory.Delete(dir, true);
					return;
				}
				catch (Exception e)
				{
					if (attempt >= 4) { Journal.Write("Suppression impossible de " + dir + " : " + e.Message); throw; }
					Thread.Sleep(300);
				}
			}
		}

		static void DeleteFile(string f) { try { if (File.Exists(f)) File.Delete(f); } catch { } }

		// ---- Mise à jour du programme lui-même --------------------------------------------

		bool SelfUpdate(Release r)
		{
			var a = r.Find(Program.ExeAsset);
			if (a == null) return false;
			string self = Paths.SelfExe, fresh = self + ".new", old = self + ".old";
			bool swapped = false;
			try
			{
				Say(L.T("Nouvelle version du programme (v", "New version of this program (v") + r.Version + L.T("), mise à jour...", "), updating..."));
				GitHub.Download(a, Sha(a.Name), fresh, Progress);
				ui.Progress(-1);
				DeleteFile(old);
				File.Move(self, old); // Windows permet de renommer un exe en cours d'exécution.
				swapped = true;
				File.Move(fresh, self);
				var args = new List<string>(o.Raw) { "--apres-maj" };
				Process.Start(new ProcessStartInfo(self, Options.Quote(args)) { UseShellExecute = false, WorkingDirectory = Path.GetDirectoryName(self) });
				Journal.Write("Programme remplacé par la v" + r.Version + ", relancé.");
				Relaunched = true;
				return true;
			}
			catch (Exception e)
			{
				Journal.Write("Mise à jour du programme impossible : " + e);
				if (swapped && !File.Exists(self)) { try { File.Move(old, self); } catch { } }
				DeleteFile(fresh);
				Say(L.T("Mise à jour du programme impossible, on continue avec cette version.",
					"Could not update this program, carrying on with this version."), Kind.Warn);
				return false;
			}
		}

		void CleanOldExe()
		{
			string old = Paths.SelfExe + ".old";
			for (int i = 0; i < 20 && File.Exists(old); i++)
			{
				try { File.Delete(old); }
				catch { if (!o.AfterSelfUpdate) break; Thread.Sleep(250); }
			}
		}

		// ---- Copie fixe et raccourci -----------------------------------------------------

		void InstallCopyAndShortcut()
		{
			if (o.NoShortcut) return;
			string target = Paths.InstalledExe;
			try
			{
				if (!Paths.Same(Paths.SelfExe, target))
				{
					Version there = null;
					try { if (File.Exists(target)) there = Program.ParseVersion(FileVersionInfo.GetVersionInfo(target).FileVersion); } catch { }
					if (there == null || there <= Program.OwnVersion)
					{
						// Copie octet par octet : la copie n'hérite pas de la marque « téléchargé
						// d'Internet », donc pas de nouvel avertissement Windows au lancement.
						File.WriteAllBytes(target, File.ReadAllBytes(Paths.SelfExe));
						Journal.Write("Programme copié dans " + target);
					}
				}
				string name = L.T("Mettre à jour le guide WoW", "Update the WoW guide") + ".lnk";
				string desc = L.T("Installe ou met à jour le guide WoW Forever", "Installs or updates the WoW Forever guide");
				if (st.ShortcutDone)
				{
					FixShortcuts(target, desc);
					return;
				}
				string desktop = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory), name);
				Shortcut.Create(desktop, target, desc);
				try
				{
					string menu = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Programs), name);
					Shortcut.Create(menu, target, desc);
				}
				catch (Exception e) { Journal.Write("Raccourci du menu Démarrer non créé : " + e.Message); }
				st.ShortcutDone = true;
				st.Save();
				Say(L.T("Raccourci « Mettre à jour le guide WoW » créé sur le Bureau : un double-clic suffit pour les prochaines mises à jour.",
					"Shortcut \"Update the WoW guide\" created on the desktop: double-click it for the next updates."), Kind.Ok);
			}
			catch (Exception e)
			{
				Journal.Write("Copie ou raccourci impossible : " + e);
				Say(L.T("Raccourci non créé (le guide est bien installé). Pour mettre à jour plus tard, relancez ce programme.",
					"Shortcut not created (the guide is installed). To update later, run this program again."), Kind.Warn);
			}
		}

		/// <summary>Raccourcis déjà créés (nom français ou anglais, Bureau et menu Démarrer) qui
		/// visent un autre fichier que la copie fixe : refaits vers elle.</summary>
		static void FixShortcuts(string target, string desc)
		{
			foreach (var folder in new[] { Environment.SpecialFolder.DesktopDirectory, Environment.SpecialFolder.Programs })
				foreach (string name in new[] { "Mettre à jour le guide WoW.lnk", "Update the WoW guide.lnk" })
				{
					try
					{
						string lnk = Path.Combine(Environment.GetFolderPath(folder), name);
						string cur = Shortcut.Target(lnk);
						if (cur == null || Paths.Same(cur, target)) continue;
						Shortcut.Create(lnk, target, desc);
						Journal.Write("Raccourci " + lnk + " : visait " + cur + ", refait vers " + target);
					}
					catch (Exception e) { Journal.Write("Raccourci non vérifié : " + e.Message); }
				}
		}

		// ---- Notes de version ------------------------------------------------------------

		void ShowNotes(Release r)
		{
			string notes = Notes(r.Body, L.Fr ? "Français" : "English");
			if (string.IsNullOrWhiteSpace(notes)) return;
			Say(L.T("Nouveautés :", "What's new:"));
			foreach (string line in notes.Split('\n').Select(l => l.TrimEnd()).Where(l => l.Length > 0).Take(15))
				Say("  " + line.Replace("**", "").Replace("`", ""));
		}

		/// <summary>La section « ### Français » ou « ### English » des notes, sans titre.</summary>
		public static string Notes(string body, string heading)
		{
			var lines = (body ?? "").Replace("\r", "").Split('\n');
			int start = Array.FindIndex(lines, l => l.StartsWith("#") && l.IndexOf(heading, StringComparison.OrdinalIgnoreCase) >= 0);
			if (start < 0) return null;
			var keep = new List<string>();
			for (int i = start + 1; i < lines.Length; i++)
			{
				if (lines[i].StartsWith("#") || lines[i].Trim() == "---") break;
				keep.Add(lines[i]);
			}
			return string.Join("\n", keep).Trim();
		}
	}
}
