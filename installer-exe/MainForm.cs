// La fenêtre : ce que fait le programme, en clair, avec une barre de progression. Thème sombre.
using System;
using System.Diagnostics;
using System.Drawing;
using System.Threading;
using System.Windows.Forms;

namespace GuideWoWForever
{
	sealed class MainForm : Form, IUi
	{
		readonly Options o;
		readonly RichTextBox box;
		readonly DarkProgressBar bar;
		readonly Button close, log;
		readonly Label banner;
		volatile bool working = true;
		IntPtr hwnd; // lisible depuis le fil de travail (Handle ne l'est pas)
		public int ExitCode = 1;

		public MainForm(Options o)
		{
			this.o = o;
			Text = L.T("Guide WoW Forever : installer ou mettre à jour", "WoW Forever guide: install or update");
			Font = new Font("Segoe UI", 10f);
			AutoScaleMode = AutoScaleMode.Font;
			ClientSize = new Size(700, 430);
			MinimumSize = new Size(480, 300);
			StartPosition = FormStartPosition.CenterScreen;
			BackColor = Theme.Back;
			ForeColor = Theme.Text;
			try { Icon = Icon.ExtractAssociatedIcon(Application.ExecutablePath); } catch { }

			box = new RichTextBox
			{
				Dock = DockStyle.Fill, ReadOnly = true, BorderStyle = BorderStyle.None,
				BackColor = Theme.Surface, ForeColor = Theme.Text, DetectUrls = false, ScrollBars = RichTextBoxScrollBars.Vertical,
			};
			box.HandleCreated += (s, e) => Theme.DarkScrollBars(box.Handle);
			var bottom = new TableLayoutPanel { Dock = DockStyle.Bottom, Height = 52, ColumnCount = 3, Padding = new Padding(8, 10, 8, 10), BackColor = Theme.Back };
			bottom.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100));
			bottom.ColumnStyles.Add(new ColumnStyle(SizeType.AutoSize));
			bottom.ColumnStyles.Add(new ColumnStyle(SizeType.AutoSize));
			bar = new DarkProgressBar { Dock = DockStyle.Fill, Margin = new Padding(4, 6, 12, 6) };
			log = new DarkButton { Text = L.T("Ouvrir le journal", "Open the log"), AutoSize = true, Enabled = false, Margin = new Padding(3, 0, 6, 0) };
			close = new DarkButton { Text = L.T("Fermer", "Close"), AutoSize = true, Enabled = false, Margin = new Padding(3, 0, 4, 0) };
			log.Click += (s, e) => { try { Process.Start("notepad.exe", "\"" + Journal.FilePath + "\""); } catch { } };
			close.Click += (s, e) => Close();
			bottom.Controls.Add(bar, 0, 0);
			bottom.Controls.Add(log, 1, 0);
			bottom.Controls.Add(close, 2, 0);
			var pad = new Panel { Dock = DockStyle.Fill, Padding = new Padding(14, 12, 6, 8), BackColor = Theme.Surface };
			pad.Controls.Add(box);
			// Le message de fin, en gros en haut de la fenêtre (Banner).
			banner = new Label
			{
				Dock = DockStyle.Top, Visible = false, AutoSize = false, Height = 92,
				Font = new Font("Segoe UI", 14f, FontStyle.Bold), TextAlign = ContentAlignment.MiddleCenter,
				Padding = new Padding(16, 8, 16, 8), ForeColor = Color.White, BackColor = Theme.BannerOk,
			};
			Controls.Add(pad);
			Controls.Add(banner);
			Controls.Add(bottom);
			AcceptButton = close;

			FormClosing += (s, e) =>
			{
				if (working && e.CloseReason == CloseReason.UserClosing)
				{
					e.Cancel = true;
					Ask(L.T("Patientez quelques secondes : l'installation est en cours.", "Please wait a few seconds: installing."),
						new[] { new Choice("OK", DialogResult.OK) });
				}
			};
			Shown += (s, e) =>
			{
				if (o.AfterSelfUpdate) ComeForward();
				new Thread(Work) { IsBackground = true, Name = "travail" }.Start();
			};
		}

		protected override void OnHandleCreated(EventArgs e)
		{
			base.OnHandleCreated(e);
			hwnd = Handle;
			Theme.DarkTitleBar(Handle);
		}

		/// <summary>Nouvelle fenêtre après la mise à jour du programme : l'ancienne vient de céder sa
		/// place, celle-ci passe devant, une seule fois. Rien si l'utilisateur est allé ailleurs.</summary>
		void ComeForward()
		{
			if (WindowState == FormWindowState.Minimized) WindowState = FormWindowState.Normal;
			if (Native.GetForegroundWindow() == Handle) { Journal.Write("Relance : fenêtre au premier plan."); return; }
			// Relancé par la 0.9.5 ou plus : l'ancienne fenêtre était devant et a cédé le premier
			// plan (AllowSetForegroundWindow). Relancé par une version plus ancienne, qui fermait sa
			// fenêtre avant que celle-ci n'existe : Windows a donné le premier plan à une autre
			// application ; on passe devant si l'utilisateur n'a rien fait depuis la relance.
			bool handedOver = o.ForegroundHandoff == true;
			bool fromOldVersion = o.ForegroundHandoff == null && Native.NoInputSince(Program.StartTick);
			Journal.Write("Relance : fenêtre pas au premier plan (passage " + (o.ForegroundHandoff == null ? "inconnu" : o.ForegroundHandoff.Value ? "donné" : "non")
				+ (fromOldVersion ? ", aucune action depuis" : "") + ").");
			if (!handedOver && !fromOldVersion) return;
			if (fromOldVersion)
			{
				// Devant les autres fenêtres une fois, sans rester « toujours au-dessus ».
				TopMost = true;
				TopMost = false;
			}
			Activate();
		}

		public bool InFront
		{
			get { return hwnd != IntPtr.Zero && Native.GetForegroundWindow() == hwnd; }
		}

		public void HandOver(Process child, bool front)
		{
			// Appelé par le fil de travail juste après le lancement de la nouvelle version. Windows
			// ne laisse passer devant que l'application qui est au premier plan : cette fenêtre
			// donne ce droit au nouveau processus et reste ouverte jusqu'à ce que la nouvelle
			// fenêtre existe (fermée avant, Windows donnait le premier plan à une autre application
			// et la nouvelle fenêtre s'ouvrait derrière).
			if (front) Native.AllowSetForegroundWindow(child.Id);
			IntPtr next = IntPtr.Zero;
			var sw = Stopwatch.StartNew();
			while (sw.ElapsedMilliseconds < 10000)
			{
				try
				{
					child.Refresh();
					if (child.HasExited) break;
					next = child.MainWindowHandle;
				}
				catch { break; }
				if (next != IntPtr.Zero) break;
				Thread.Sleep(100);
			}
			bool given = next != IntPtr.Zero && (Native.GetForegroundWindow() == next
				|| (front && InFront && Native.SetForegroundWindow(next)));
			Journal.Write("Nouvelle fenêtre " + (next != IntPtr.Zero ? "ouverte en " + sw.ElapsedMilliseconds + " ms" : "non vue")
				+ (front ? ", premier plan " + (given ? "donné" : "non donné") : ", fenêtre pas au premier plan : rien à donner") + ".");
		}

		void Work()
		{
			var u = new Updater(o, this);
			int code = u.Run();
			BeginInvoke((Action)(() =>
			{
				working = false;
				ExitCode = code;
				if (u.Relaunched) { Close(); return; }
				bar.Marquee = false;
				bar.FillColor = code == 0 ? Theme.Ok : Theme.Error;
				bar.Value = code == 0 ? 100 : 0;
				close.Enabled = true;
				log.Enabled = true;
				close.Focus();
				if (code != 0) { log.Font = new Font(log.Font, FontStyle.Bold); }
			}));
		}

		public void Line(string text, Kind kind)
		{
			BeginInvoke((Action)(() =>
			{
				box.SelectionStart = box.TextLength;
				box.SelectionLength = 0;
				box.SelectionColor = kind == Kind.Error ? Theme.Error : kind == Kind.Warn ? Theme.Warn
					: kind == Kind.Ok ? Theme.Ok : Theme.Text;
				box.SelectionFont = kind == Kind.Info ? box.Font : new Font(box.Font, FontStyle.Bold);
				box.AppendText(text + "\n");
				box.ScrollToCaret();
			}));
		}

		public void Banner(string text, Kind kind)
		{
			BeginInvoke((Action)(() =>
			{
				banner.Text = text;
				banner.BackColor = kind == Kind.Warn ? Theme.BannerWarn : Theme.BannerOk;
				banner.Visible = true;
				box.ScrollToCaret();
			}));
		}

		public void Progress(int percent)
		{
			BeginInvoke((Action)(() =>
			{
				if (percent < 0) { bar.Marquee = true; return; }
				bar.Marquee = false;
				bar.Value = percent;
			}));
		}

		public string AskFolder(string description)
		{
			return (string)Invoke((Func<string>)(() =>
			{
				// Fenêtre de Windows (choix d'un dossier) : elle suit le thème de Windows.
				using (var d = new FolderBrowserDialog { Description = description, ShowNewFolderButton = false })
					return d.ShowDialog(this) == DialogResult.OK ? d.SelectedPath : null;
			}));
		}

		public RunningChoice AskWowRunning()
		{
			return (RunningChoice)Invoke((Func<RunningChoice>)(() =>
			{
				// Fenêtre maison plutôt qu'une MessageBox : les boutons disent ce qu'ils font,
				// dans la langue du programme.
				var r = Ask(L.T("World of Warcraft est ouvert.\n\nFermez complètement le jeu, puis cliquez sur « Le jeu est fermé ».\n" +
						"Installer quand même marche aussi, mais le guide ne change qu'après avoir relancé le jeu.",
						"World of Warcraft is running.\n\nClose the game completely, then click \"The game is closed\".\n" +
						"Installing anyway also works, but the guide only changes after restarting the game."),
					new[]
					{
						new Choice(L.T("Le jeu est fermé", "The game is closed"), DialogResult.Retry),
						new Choice(L.T("Installer quand même", "Install anyway"), DialogResult.Ignore),
						new Choice(L.T("Annuler", "Cancel"), DialogResult.Cancel),
					});
				return r == DialogResult.Retry ? RunningChoice.Retry : r == DialogResult.Ignore ? RunningChoice.Ignore : RunningChoice.Abort;
			}));
		}

		sealed class Choice
		{
			public readonly string Text;
			public readonly DialogResult Result;
			public Choice(string text, DialogResult result) { Text = text; Result = result; }
		}

		/// <summary>Petite fenêtre de question, sombre comme la principale. Le premier bouton est
		/// celui par défaut, le dernier celui d'Échap.</summary>
		DialogResult Ask(string message, Choice[] choices)
		{
			using (var d = new Form())
			{
				Theme.Apply(d);
				d.Text = Text;
				d.Font = Font;
				d.AutoScaleMode = AutoScaleMode.Font;
				d.FormBorderStyle = FormBorderStyle.FixedDialog;
				d.MinimizeBox = d.MaximizeBox = false;
				d.ShowInTaskbar = false;
				d.StartPosition = FormStartPosition.CenterParent;
				d.AutoSize = true;
				d.AutoSizeMode = AutoSizeMode.GrowAndShrink;
				d.Padding = new Padding(16);
				var text = new Label
				{
					AutoSize = true, MaximumSize = new Size(460, 0), Margin = new Padding(0, 0, 0, 16),
					ForeColor = Theme.Text, Text = message,
				};
				var buttons = new FlowLayoutPanel { AutoSize = true, FlowDirection = FlowDirection.LeftToRight, Margin = new Padding(0), WrapContents = false };
				Button first = null, last = null;
				foreach (var c in choices)
				{
					var b = new DarkButton { Text = c.Text, AutoSize = true, DialogResult = c.Result, Margin = new Padding(0, 0, 8, 0) };
					buttons.Controls.Add(b);
					if (first == null) first = b;
					last = b;
				}
				var layout = new TableLayoutPanel { AutoSize = true, ColumnCount = 1, Dock = DockStyle.Fill };
				layout.Controls.Add(text);
				layout.Controls.Add(buttons);
				d.Controls.Add(layout);
				d.AcceptButton = first;
				d.CancelButton = last;
				return d.ShowDialog(this);
			}
		}
	}
}
