// Trouve le dossier de WoW Forever (_forever_) et repère le jeu ouvert.
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using Microsoft.Win32;

namespace GuideWoWForever
{
	static class GameFinder
	{
		// Forever s'installe dans _forever_ ; la bêta utilisait _classic_beta_.
		static readonly string[] Flavors = { "_forever_", "_classic_beta_" };

		/// <summary>Le dossier de jeu Forever pour un dossier donné (World of Warcraft ou _forever_), sinon null.</summary>
		public static string GameDir(string path)
		{
			if (string.IsNullOrWhiteSpace(path)) return null;
			try
			{
				path = path.Trim().Trim('"').Replace('/', '\\').TrimEnd('\\');
				if (path.Length == 2 && path[1] == ':') path += "\\";
				if (!Directory.Exists(path)) return null;
				string leaf = Path.GetFileName(path);
				if (Flavors.Any(f => string.Equals(f, leaf, StringComparison.OrdinalIgnoreCase))) return path;
				// Le dossier d'un exe du jeu (Wow.exe est dans _forever_).
				foreach (string f in Flavors)
				{
					string p = Path.Combine(path, f);
					if (Directory.Exists(p)) return p;
				}
			}
			catch { }
			return null;
		}

		public static string Find(State st, Action<string> log)
		{
			foreach (var c in Candidates(st))
			{
				string g = GameDir(c.Value);
				if (g != null) { log(c.Key + " -> " + g); return g; }
			}
			return null;
		}

		static IEnumerable<KeyValuePair<string, string>> Candidates(State st)
		{
			if (!string.IsNullOrEmpty(st.Game)) yield return Pair("mémorisé", st.Game);

			foreach (var p in RunningGame())
			{
				string exe = null;
				try { exe = p.MainModule.FileName; } catch { }
				if (exe != null) yield return Pair("jeu ouvert", Path.GetDirectoryName(exe));
			}

			foreach (string v in RegistryPaths()) yield return Pair("registre", v);
			foreach (string v in ProductDbPaths()) yield return Pair("Battle.net product.db", v);
			string def = BattleNetDefault();
			if (def != null) yield return Pair("Battle.net.config", Path.Combine(def, "World of Warcraft"));

			string[] rel = {
				@"Program Files (x86)\World of Warcraft", @"Program Files\World of Warcraft", @"World of Warcraft",
				@"Games\World of Warcraft", @"Jeux\World of Warcraft", @"Battle.net\World of Warcraft",
				@"Blizzard\World of Warcraft", @"Program Files (x86)\Battle.net\World of Warcraft",
				@"Games\Battle.net\World of Warcraft", @"Jeux\Battle.net\World of Warcraft",
			};
			foreach (var d in FixedDrives())
				foreach (string r in rel) yield return Pair("emplacement courant", Path.Combine(d, r));
		}

		static KeyValuePair<string, string> Pair(string k, string v) { return new KeyValuePair<string, string>(k, v); }

		static IEnumerable<string> FixedDrives()
		{
			DriveInfo[] all = null;
			try { all = DriveInfo.GetDrives(); } catch { }
			if (all == null) yield break;
			foreach (var d in all)
			{
				bool ok = false;
				try { ok = d.IsReady && (d.DriveType == DriveType.Fixed || d.DriveType == DriveType.Removable); } catch { }
				if (ok) yield return d.RootDirectory.FullName;
			}
		}

		static IEnumerable<string> RegistryPaths()
		{
			var found = new List<string>();
			var views = new[] { RegistryView.Registry64, RegistryView.Registry32 };
			foreach (var hive in new[] { RegistryHive.LocalMachine, RegistryHive.CurrentUser })
				foreach (var view in views)
				{
					try
					{
						using (var root = RegistryKey.OpenBaseKey(hive, view))
						{
							Read(root, @"SOFTWARE\Blizzard Entertainment\World of Warcraft", "InstallPath", found);
							using (var un = root.OpenSubKey(@"SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"))
							{
								if (un == null) continue;
								foreach (string name in un.GetSubKeyNames())
									if (name.IndexOf("Warcraft", StringComparison.OrdinalIgnoreCase) >= 0)
										Read(un, name, "InstallLocation", found);
							}
						}
					}
					catch { }
				}
			foreach (string v in found.Distinct(StringComparer.OrdinalIgnoreCase))
			{
				string t = v.TrimEnd('\\', '/');
				yield return t;
				string parent = null;
				try { parent = Path.GetDirectoryName(t); } catch { }
				if (!string.IsNullOrEmpty(parent)) yield return parent;
			}
		}

		static void Read(RegistryKey root, string sub, string value, List<string> into)
		{
			try
			{
				using (var k = root.OpenSubKey(sub))
				{
					var v = k == null ? null : k.GetValue(value) as string;
					if (!string.IsNullOrWhiteSpace(v)) into.Add(v);
				}
			}
			catch { }
		}

		// product.db (format binaire de Battle.net) contient les dossiers d'installation en clair.
		static IEnumerable<string> ProductDbPaths()
		{
			string db = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData), @"Battle.net\Agent\product.db");
			string text = null;
			try { if (File.Exists(db)) text = Encoding.UTF8.GetString(File.ReadAllBytes(db)); } catch { }
			if (text == null) return Enumerable.Empty<string>();
			return Regex.Matches(text, @"[A-Za-z]:[\\/][^\x00-\x1f""<>|*?]{0,240}?World of Warcraft")
				.Cast<Match>().Select(m => m.Value).Distinct(StringComparer.OrdinalIgnoreCase).ToList();
		}

		static string BattleNetDefault()
		{
			try
			{
				string cfg = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), @"Battle.net\Battle.net.config");
				if (!File.Exists(cfg)) return null;
				var m = Regex.Match(File.ReadAllText(cfg), "\"DefaultInstallPath\"\\s*:\\s*\"((?:[^\"\\\\]|\\\\.)*)\"");
				if (!m.Success) return null;
				return m.Groups[1].Value.Replace("\\/", "/").Replace("\\\\", "\\");
			}
			catch { return null; }
		}

		// Wow.exe, WowClassic.exe, WowT.exe... mais pas WowVoiceProxy.exe ni WowError.exe.
		static readonly Regex GameProcess = new Regex(@"^wow(classic)?[tb]?(-64)?$", RegexOptions.IgnoreCase);

		/// <summary>Les processus du jeu ouverts ; avec game, seulement ceux de ce dossier (ou de dossier inconnu).</summary>
		public static List<Process> RunningGame(string game = null)
		{
			try
			{
				return Process.GetProcesses().Where(p => GameProcess.IsMatch(p.ProcessName) && (game == null || Inside(p, game))).ToList();
			}
			catch { return new List<Process>(); }
		}

		static bool Inside(Process p, string game)
		{
			string exe;
			try { exe = p.MainModule.FileName; } catch { return true; }
			string dir = Path.GetFullPath(game).TrimEnd('\\') + "\\";
			return exe.StartsWith(dir, StringComparison.OrdinalIgnoreCase);
		}
	}
}
