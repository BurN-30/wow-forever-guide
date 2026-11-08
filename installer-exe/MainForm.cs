// La fenêtre : ce que fait le programme, en clair, avec une barre de progression.
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
		readonly ProgressBar bar;
		readonly Button close, log;
		volatile bool working = true;
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
			try { Icon = Icon.ExtractAssociatedIcon(Application.ExecutablePath); } catch { }

			box = new RichTextBox
			{
				Dock = DockStyle.Fill, ReadOnly = true, BorderStyle = BorderStyle.None,
				BackColor = SystemColors.Window, DetectUrls = false, ScrollBars = RichTextBoxScrollBars.Vertical,
			};
			var bottom = new TableLayoutPanel { Dock = DockStyle.Bottom, Height = 48, ColumnCount = 3, Padding = new Padding(8, 8, 8, 8) };
			bottom.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100));
			bottom.ColumnStyles.Add(new ColumnStyle(SizeType.AutoSize));
			bottom.ColumnStyles.Add(new ColumnStyle(SizeType.AutoSize));
			bar = new ProgressBar { Dock = DockStyle.Fill, Style = ProgressBarStyle.Marquee, MarqueeAnimationSpeed = 30, Margin = new Padding(0, 4, 12, 4) };
			log = new Button { Text = L.T("Ouvrir le journal", "Open the log"), AutoSize = true, Enabled = false };
			close = new Button { Text = L.T("Fermer", "Close"), AutoSize = true, Enabled = false };
			log.Click += (s, e) => { try { Process.Start("notepad.exe", "\"" + Journal.FilePath + "\""); } catch { } };
			close.Click += (s, e) => Close();
			bottom.Controls.Add(bar, 0, 0);
			bottom.Controls.Add(log, 1, 0);
			bottom.Controls.Add(close, 2, 0);
			var pad = new Panel { Dock = DockStyle.Fill, Padding = new Padding(12, 12, 12, 4), BackColor = SystemColors.Window };
			pad.Controls.Add(box);
			Controls.Add(pad);
			Controls.Add(bottom);
			AcceptButton = close;

			FormClosing += (s, e) =>
			{
				if (working && e.CloseReason == CloseReason.UserClosing)
				{
					e.Cancel = true;
					MessageBox.Show(this, L.T("Patientez quelques secondes : l'installation est en cours.", "Please wait a few seconds: installing."),
						Text, MessageBoxButtons.OK, MessageBoxIcon.Information);
				}
			};
			Shown += (s, e) => new Thread(Work) { IsBackground = true, Name = "travail" }.Start();
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
				bar.Style = ProgressBarStyle.Continuous;
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
				box.SelectionColor = kind == Kind.Error ? Color.Firebrick : kind == Kind.Warn ? Color.DarkOrange
					: kind == Kind.Ok ? Color.ForestGreen : SystemColors.WindowText;
				box.SelectionFont = kind == Kind.Info ? box.Font : new Font(box.Font, FontStyle.Bold);
				box.AppendText(text + "\n");
				box.ScrollToCaret();
			}));
		}

		public void Progress(int percent)
		{
			BeginInvoke((Action)(() =>
			{
				if (percent < 0) { bar.Style = ProgressBarStyle.Marquee; return; }
				bar.Style = ProgressBarStyle.Continuous;
				bar.Value = Math.Max(0, Math.Min(100, percent));
			}));
		}

		public string AskFolder(string description)
		{
			return (string)Invoke((Func<string>)(() =>
			{
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
				using (var d = new Form())
				{
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
						Text = L.T("World of Warcraft est ouvert.\n\nFermez complètement le jeu, puis cliquez sur « Le jeu est fermé ».\n" +
							"Installer quand même marche aussi, mais le guide ne change qu'après avoir relancé le jeu.",
							"World of Warcraft is running.\n\nClose the game completely, then click \"The game is closed\".\n" +
							"Installing anyway also works, but the guide only changes after restarting the game."),
					};
					var retry = new Button { Text = L.T("Le jeu est fermé", "The game is closed"), AutoSize = true, DialogResult = DialogResult.Retry };
					var anyway = new Button { Text = L.T("Installer quand même", "Install anyway"), AutoSize = true, DialogResult = DialogResult.Ignore };
					var cancel = new Button { Text = L.T("Annuler", "Cancel"), AutoSize = true, DialogResult = DialogResult.Cancel };
					var buttons = new FlowLayoutPanel { AutoSize = true, FlowDirection = FlowDirection.LeftToRight, Margin = new Padding(0), WrapContents = false };
					buttons.Controls.AddRange(new Control[] { retry, anyway, cancel });
					var layout = new TableLayoutPanel { AutoSize = true, ColumnCount = 1, Dock = DockStyle.Fill };
					layout.Controls.Add(text);
					layout.Controls.Add(buttons);
					d.Controls.Add(layout);
					d.AcceptButton = retry;
					d.CancelButton = cancel;
					var r = d.ShowDialog(this);
					return r == DialogResult.Retry ? RunningChoice.Retry : r == DialogResult.Ignore ? RunningChoice.Ignore : RunningChoice.Abort;
				}
			}));
		}
	}
}
