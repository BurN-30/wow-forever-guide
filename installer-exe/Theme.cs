// Thème sombre de la fenêtre (couleurs, barre de titre, barre de progression, boutons) et
// appels Windows pour garder la fenêtre au premier plan après la mise à jour du programme.
using System;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace GuideWoWForever
{
	/// <summary>Couleurs du thème sombre. Contraste du texte sur son fond (WCAG) : 5,2:1 au moins.</summary>
	static class Theme
	{
		public static readonly Color Back = Hex(0x1E1F22);      // fond de la fenêtre
		public static readonly Color Surface = Hex(0x2B2D31);   // journal, boutons, barre
		public static readonly Color Hover = Hex(0x3A3D44);
		public static readonly Color Pressed = Hex(0x45484F);
		public static readonly Color Border = Hex(0x4E5058);
		public static readonly Color Text = Hex(0xE6E6E6);      // 11:1 sur Surface
		public static readonly Color Muted = Hex(0xA0A0A0);     // 5,3:1 sur Surface
		public static readonly Color Accent = Hex(0x4F8FE8);    // barre de progression, bouton par défaut
		public static readonly Color Ok = Hex(0x6BCB8B);        // 6,9:1 sur Surface
		public static readonly Color Warn = Hex(0xF0A050);      // 6,5:1
		public static readonly Color Error = Hex(0xF47C7C);     // 5,3:1
		public static readonly Color BannerOk = Hex(0x1E6B3E);  // texte blanc : 6,5:1
		public static readonly Color BannerWarn = Hex(0x9A520F); // texte blanc : 5,9:1

		static Color Hex(int rgb) { return Color.FromArgb((rgb >> 16) & 0xFF, (rgb >> 8) & 0xFF, rgb & 0xFF); }

		/// <summary>Barre de titre sombre (Windows 10 1809 et plus, Windows 11). Sans effet ailleurs.</summary>
		public static void DarkTitleBar(IntPtr hwnd)
		{
			try
			{
				int on = 1;
				// 20 : Windows 10 20H1 et plus ; 19 : Windows 10 1809 à 1909.
				if (Native.DwmSetWindowAttribute(hwnd, 20, ref on, sizeof(int)) != 0)
					Native.DwmSetWindowAttribute(hwnd, 19, ref on, sizeof(int));
			}
			catch { }
		}

		/// <summary>Barres de défilement sombres d'une zone de texte (Windows 10 1809 et plus).</summary>
		public static void DarkScrollBars(IntPtr hwnd)
		{
			try { Native.SetWindowTheme(hwnd, "DarkMode_Explorer", null); } catch { }
		}

		/// <summary>Une fenêtre de dialogue du programme, déjà en sombre.</summary>
		public static void Apply(Form f)
		{
			f.BackColor = Back;
			f.ForeColor = Text;
			f.HandleCreated += (s, e) => DarkTitleBar(f.Handle);
		}
	}

	/// <summary>Barre de progression dessinée par le programme : celle de Windows ignore les couleurs.</summary>
	sealed class DarkProgressBar : Control
	{
		readonly Timer timer = new Timer { Interval = 30 };
		int value, offset;
		bool marquee = true;

		public Color FillColor = Theme.Accent;

		public DarkProgressBar()
		{
			SetStyle(ControlStyles.AllPaintingInWmPaint | ControlStyles.OptimizedDoubleBuffer | ControlStyles.UserPaint
				| ControlStyles.ResizeRedraw, true);
			SetStyle(ControlStyles.Selectable, false);
			TabStop = false;
			timer.Tick += (s, e) => { offset = (offset + Math.Max(2, Width / 90)) % (Width + Width / 4); Invalidate(); };
			timer.Start();
		}

		/// <summary>Défilement continu quand la durée est inconnue.</summary>
		public bool Marquee
		{
			get { return marquee; }
			set
			{
				if (marquee == value) return;
				marquee = value;
				offset = 0;
				if (value) timer.Start(); else timer.Stop();
				Invalidate();
			}
		}

		public int Value
		{
			get { return value; }
			set { this.value = Math.Max(0, Math.Min(100, value)); Invalidate(); }
		}

		protected override void OnPaint(PaintEventArgs e)
		{
			var g = e.Graphics;
			var r = ClientRectangle;
			g.Clear(Theme.Surface);
			using (var fill = new SolidBrush(FillColor))
			{
				var inner = Rectangle.Inflate(r, -2, -2);
				if (marquee)
				{
					int chunk = Math.Max(24, inner.Width / 4);
					var c = new Rectangle(inner.Left + offset - chunk, inner.Top, chunk, inner.Height);
					c.Intersect(inner);
					if (c.Width > 0) g.FillRectangle(fill, c);
				}
				else if (value > 0)
					g.FillRectangle(fill, new Rectangle(inner.Left, inner.Top, inner.Width * value / 100, inner.Height));
			}
			using (var pen = new Pen(Theme.Border))
				g.DrawRectangle(pen, r.X, r.Y, r.Width - 1, r.Height - 1);
		}

		protected override void Dispose(bool disposing)
		{
			if (disposing) timer.Dispose();
			base.Dispose(disposing);
		}
	}

	/// <summary>Bouton plat sombre : bordure discrète, couleur au survol, texte grisé lisible quand il est inactif.</summary>
	sealed class DarkButton : Button
	{
		bool hover, down;

		public DarkButton()
		{
			FlatStyle = FlatStyle.Flat;
			FlatAppearance.BorderSize = 1;
			BackColor = Theme.Surface;
			ForeColor = Theme.Text;
			Padding = new Padding(10, 2, 10, 2);
			UseVisualStyleBackColor = false;
		}

		protected override void OnMouseEnter(EventArgs e) { hover = true; Invalidate(); base.OnMouseEnter(e); }
		protected override void OnMouseLeave(EventArgs e) { hover = down = false; Invalidate(); base.OnMouseLeave(e); }
		protected override void OnMouseDown(MouseEventArgs e) { if (e.Button == MouseButtons.Left) down = true; Invalidate(); base.OnMouseDown(e); }
		protected override void OnMouseUp(MouseEventArgs e) { down = false; Invalidate(); base.OnMouseUp(e); }
		protected override void OnEnabledChanged(EventArgs e) { hover = down = false; Invalidate(); base.OnEnabledChanged(e); }

		protected override void OnPaint(PaintEventArgs e)
		{
			var g = e.Graphics;
			var r = ClientRectangle;
			Color back = !Enabled ? Theme.Back : down ? Theme.Pressed : hover ? Theme.Hover : Theme.Surface;
			Color border = !Enabled ? Theme.Surface : Focused || IsDefault ? Theme.Accent : Theme.Border;
			g.Clear(Parent != null ? Parent.BackColor : Theme.Back);
			using (var b = new SolidBrush(back)) g.FillRectangle(b, r);
			using (var p = new Pen(border)) g.DrawRectangle(p, r.X, r.Y, r.Width - 1, r.Height - 1);
			TextRenderer.DrawText(g, Text, Font, r, Enabled ? Theme.Text : Theme.Muted,
				TextFormatFlags.HorizontalCenter | TextFormatFlags.VerticalCenter | TextFormatFlags.SingleLine);
		}
	}

	static class Native
	{
		[DllImport("dwmapi.dll")]
		public static extern int DwmSetWindowAttribute(IntPtr hwnd, int attr, ref int value, int size);

		[DllImport("uxtheme.dll", CharSet = CharSet.Unicode)]
		public static extern int SetWindowTheme(IntPtr hwnd, string appName, string idList);

		[DllImport("user32.dll")]
		public static extern IntPtr GetForegroundWindow();

		[DllImport("user32.dll")]
		[return: MarshalAs(UnmanagedType.Bool)]
		public static extern bool SetForegroundWindow(IntPtr hwnd);

		[DllImport("user32.dll")]
		[return: MarshalAs(UnmanagedType.Bool)]
		public static extern bool AllowSetForegroundWindow(int processId);

		[StructLayout(LayoutKind.Sequential)]
		struct LASTINPUTINFO { public int cbSize; public uint dwTime; }

		[DllImport("user32.dll")]
		[return: MarshalAs(UnmanagedType.Bool)]
		static extern bool GetLastInputInfo(ref LASTINPUTINFO info);

		/// <summary>Aucun clic ni touche (ni mouvement de souris) depuis ce moment (Environment.TickCount).</summary>
		public static bool NoInputSince(int tick)
		{
			var i = new LASTINPUTINFO { cbSize = Marshal.SizeOf(typeof(LASTINPUTINFO)) };
			if (!GetLastInputInfo(ref i)) return false;
			return unchecked((int)i.dwTime - tick) <= 0;
		}
	}
}
