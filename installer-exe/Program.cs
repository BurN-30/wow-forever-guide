// Point d'entrée, options, langue, journal et mémoire du programme.
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;

namespace GuideWoWForever
{
	static class Program
	{
		public const string Repo = "BurN-30/wow-forever-guide";
		public const string ExeAsset = "GuideWoWForever.exe";
		public const string ZipAsset = "GuideWoWForever-addons.zip";
		public const string SumsAsset = "SHA256SUMS.txt";
		public const string DefaultApi = "https://api.github.com/repos/" + Repo + "/releases/latest";
		public const string ReleasesPage = "https://github.com/" + Repo + "/releases/latest";

		[DllImport("kernel32.dll")]
		static extern bool AttachConsole(int pid);

		/// <summary>Environment.TickCount au lancement.</summary>
		public static int StartTick;

		[STAThread]
		static int Main(string[] args)
		{
			StartTick = Environment.TickCount;
			Options o;
			try { o = Options.Parse(args); }
			catch (ArgumentException e) { MessageBox.Show(e.Message, "GuideWoWForever"); return 64; }

			L.Fr = o.Lang != null ? o.Lang == "fr"
				: CultureInfo.CurrentUICulture.TwoLetterISOLanguageName == "fr";
			Paths.Init(o.DataDir);
			Journal.Open(Path.Combine(Paths.Data, "journal.txt"));

			// Windows 10 et 11 choisissent déjà TLS 1.2 ou 1.3 ; on force TLS 1.2 seulement
			// si une ancienne configuration impose autre chose.
			if (ServicePointManager.SecurityProtocol != SecurityProtocolType.SystemDefault)
				ServicePointManager.SecurityProtocol |= SecurityProtocolType.Tls12;

			if (o.Headless)
			{
				AttachConsole(-1);
				return new Updater(o, new HeadlessUi(o)).Run();
			}
			Application.EnableVisualStyles();
			Application.SetCompatibleTextRenderingDefault(false);
			var form = new MainForm(o);
			Application.Run(form);
			return form.ExitCode;
		}

		public static Version OwnVersion
		{
			get { return Norm(Assembly.GetExecutingAssembly().GetName().Version); }
		}

		public static Version Norm(Version v)
		{
			if (v == null) return new Version(0, 0, 0);
			return new Version(v.Major, v.Minor, Math.Max(v.Build, 0));
		}

		public static Version ParseVersion(string s)
		{
			if (string.IsNullOrEmpty(s)) return null;
			s = s.Trim().TrimStart('v', 'V');
			int dash = s.IndexOfAny(new[] { '-', '+', ' ' });
			if (dash > 0) s = s.Substring(0, dash);
			Version v;
			return Version.TryParse(s, out v) ? Norm(v) : null;
		}
	}

	/// <summary>Textes en français ou en anglais selon la langue de Windows.</summary>
	static class L
	{
		public static bool Fr;
		public static string T(string fr, string en) { return Fr ? fr : en; }

		public static string Size(long bytes)
		{
			double mb = bytes / 1048576.0;
			return mb.ToString("0.0", Fr ? CultureInfo.GetCultureInfo("fr-FR") : CultureInfo.InvariantCulture)
				+ (Fr ? " Mo" : " MB");
		}
	}

	sealed class Options
	{
		public string Wow, Api, DataDir, Lang;
		public bool Headless, Detect, NoSelfUpdate, NoShortcut, IgnoreRunning, Force, AfterSelfUpdate;
		/// <summary>Après la mise à jour du programme : l'ancienne fenêtre était au premier plan et l'a
		/// cédé (true), ne l'était pas (false), ou relance par une version qui ne le dit pas (null).</summary>
		public bool? ForegroundHandoff;
		public List<string> Raw = new List<string>();

		public static Options Parse(string[] args)
		{
			var o = new Options();
			for (int i = 0; i < args.Length; i++)
			{
				string a = args[i];
				Func<string> next = () =>
				{
					if (i + 1 >= args.Length) throw new ArgumentException("Valeur manquante après " + a);
					return args[++i];
				};
				switch (a.ToLowerInvariant())
				{
					case "--wow": o.Wow = next(); o.Raw.Add(a); o.Raw.Add(o.Wow); break;
					case "--api": o.Api = next(); o.Raw.Add(a); o.Raw.Add(o.Api); break;
					case "--data": o.DataDir = next(); o.Raw.Add(a); o.Raw.Add(o.DataDir); break;
					case "--lang": o.Lang = next().ToLowerInvariant(); o.Raw.Add(a); o.Raw.Add(o.Lang); break;
					case "--headless": o.Headless = true; o.Raw.Add(a); break;
					case "--detect": o.Detect = true; o.Raw.Add(a); break;
					case "--no-self-update": o.NoSelfUpdate = true; o.Raw.Add(a); break;
					case "--no-shortcut": o.NoShortcut = true; o.Raw.Add(a); break;
					case "--ignore-running": o.IgnoreRunning = true; o.Raw.Add(a); break;
					case "--force": o.Force = true; o.Raw.Add(a); break;
					case "--apres-maj": o.AfterSelfUpdate = true; break;
					case "--relance-devant": o.ForegroundHandoff = true; break;
					case "--relance-derriere": o.ForegroundHandoff = false; break;
					case "--help": case "-h": case "/?":
						throw new ArgumentException(
							"GuideWoWForever.exe [--wow <dossier>] [--force] [--lang fr|en]\n" +
							"Tests : --headless --detect --api <url> --data <dossier> --no-self-update --no-shortcut --ignore-running");
					default: throw new ArgumentException("Option inconnue : " + a);
				}
			}
			if (o.Api == null) o.Api = Program.DefaultApi;
			return o;
		}

		public static string Quote(IEnumerable<string> args)
		{
			return string.Join(" ", args.Select(QuoteOne));
		}

		// Règles de découpage de la ligne de commande Windows (CommandLineToArgvW).
		static string QuoteOne(string a)
		{
			if (a.Length > 0 && a.IndexOfAny(new[] { ' ', '\t', '"' }) < 0) return a;
			var sb = new StringBuilder("\"");
			int bs = 0;
			foreach (char c in a)
			{
				if (c == '\\') { bs++; continue; }
				if (c == '"') { sb.Append('\\', bs * 2 + 1); sb.Append('"'); }
				else { sb.Append('\\', bs); sb.Append(c); }
				bs = 0;
			}
			sb.Append('\\', bs * 2);
			sb.Append('"');
			return sb.ToString();
		}
	}

	static class Paths
	{
		public static string Data;
		public static string SelfExe;

		public static void Init(string dataDir)
		{
			Data = dataDir != null ? Path.GetFullPath(dataDir) : Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "GuideWoWForever");
			Directory.CreateDirectory(Data);
			SelfExe = Process.GetCurrentProcess().MainModule.FileName;
		}

		/// <summary>Copie fixe du programme, celle que vise le raccourci.</summary>
		public static string InstalledExe { get { return Path.Combine(Data, Program.ExeAsset); } }

		public static bool Same(string a, string b)
		{
			try { return string.Equals(Path.GetFullPath(a).TrimEnd('\\'), Path.GetFullPath(b).TrimEnd('\\'), StringComparison.OrdinalIgnoreCase); }
			catch { return false; }
		}
	}

	/// <summary>Journal lisible : %LOCALAPPDATA%\GuideWoWForever\journal.txt</summary>
	static class Journal
	{
		static readonly object Gate = new object();
		public static string FilePath;

		public static void Open(string path)
		{
			FilePath = path;
			try
			{
				var fi = new FileInfo(path);
				if (fi.Exists && fi.Length > 512 * 1024)
				{
					// Garde la fin du journal seulement.
					string[] lines = File.ReadAllLines(path, Encoding.UTF8);
					File.WriteAllLines(path, lines.Skip(Math.Max(0, lines.Length - 400)), new UTF8Encoding(true));
				}
			}
			catch { }
		}

		public static void Write(string text)
		{
			lock (Gate)
			{
				try
				{
					File.AppendAllText(FilePath, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss ") + text + "\r\n", new UTF8Encoding(true));
				}
				catch { }
			}
		}
	}

	/// <summary>Ce que le programme retient d'une fois sur l'autre (etat.txt, clé=valeur).</summary>
	sealed class State
	{
		public string Game;
		public string Version;
		public List<string> Folders = new List<string>();
		public bool ShortcutDone;

		static string FilePath { get { return Path.Combine(Paths.Data, "etat.txt"); } }

		public static State Load()
		{
			var s = new State();
			try
			{
				if (!File.Exists(FilePath)) return s;
				foreach (string line in File.ReadAllLines(FilePath, Encoding.UTF8))
				{
					int eq = line.IndexOf('=');
					if (eq <= 0) continue;
					string k = line.Substring(0, eq).Trim(), v = line.Substring(eq + 1).Trim();
					if (k == "jeu") s.Game = v;
					else if (k == "version") s.Version = v;
					else if (k == "dossiers") s.Folders = v.Split(new[] { ';' }, StringSplitOptions.RemoveEmptyEntries).ToList();
					else if (k == "raccourci") s.ShortcutDone = v == "1";
				}
			}
			catch (Exception e) { Journal.Write("etat.txt illisible : " + e.Message); }
			return s;
		}

		public void Save()
		{
			try
			{
				File.WriteAllLines(FilePath, new[]
				{
					"jeu=" + (Game ?? ""),
					"version=" + (Version ?? ""),
					"dossiers=" + string.Join(";", Folders),
					"raccourci=" + (ShortcutDone ? "1" : "0"),
				}, new UTF8Encoding(false));
			}
			catch (Exception e) { Journal.Write("etat.txt non enregistré : " + e.Message); }
		}
	}
}
