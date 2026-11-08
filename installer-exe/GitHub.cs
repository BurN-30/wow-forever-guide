// Lecture de la dernière release GitHub (API publique, sans jeton) et téléchargements vérifiés.
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web.Script.Serialization;

namespace GuideWoWForever
{
	sealed class Asset
	{
		public string Name, Url, Digest;
		public long Size;
	}

	sealed class Release
	{
		public string Tag, Body;
		public Version Version;
		public List<Asset> Assets = new List<Asset>();

		public Asset Find(string name)
		{
			return Assets.FirstOrDefault(a => string.Equals(a.Name, name, StringComparison.OrdinalIgnoreCase));
		}
	}

	/// <summary>Erreur expliquée en clair à l'utilisateur.</summary>
	sealed class Failure : Exception
	{
		public readonly int Code;
		public Failure(string message, int code = 1, Exception inner = null) : base(message, inner) { Code = code; }
	}

	static class GitHub
	{
		static HttpWebRequest Request(string url, string accept)
		{
			var r = (HttpWebRequest)WebRequest.Create(url);
			r.UserAgent = "GuideWoWForever/" + Program.OwnVersion;
			r.Accept = accept;
			r.Timeout = 30000;
			r.ReadWriteTimeout = 60000;
			r.AllowAutoRedirect = true;
			r.AutomaticDecompression = DecompressionMethods.GZip | DecompressionMethods.Deflate;
			if (url.StartsWith("https://api.github.com", StringComparison.OrdinalIgnoreCase))
				r.Headers["X-GitHub-Api-Version"] = "2022-11-28";
			return r;
		}

		public static string GetString(string url, string accept = "*/*")
		{
			try
			{
				using (var resp = (HttpWebResponse)Request(url, accept).GetResponse())
				using (var s = resp.GetResponseStream())
				using (var rd = new StreamReader(s, Encoding.UTF8))
					return rd.ReadToEnd();
			}
			catch (WebException e) { throw Explain(e, url); }
		}

		public static Release Latest(string apiUrl)
		{
			string json = GetString(apiUrl, "application/vnd.github+json");
			Dictionary<string, object> d;
			try { d = new JavaScriptSerializer { MaxJsonLength = 16 * 1024 * 1024 }.Deserialize<Dictionary<string, object>>(json); }
			catch (Exception e) { throw new Failure(L.T("Réponse de GitHub illisible.", "Unreadable answer from GitHub."), 1, e); }

			var r = new Release { Tag = Str(d, "tag_name"), Body = Str(d, "body") ?? "" };
			r.Version = Program.ParseVersion(r.Tag);
			if (r.Version == null)
				throw new Failure(L.T("Numéro de version inattendu sur GitHub : ", "Unexpected version number on GitHub: ") + r.Tag);
			var list = d.ContainsKey("assets") ? d["assets"] as IEnumerable : null;
			if (list != null)
				foreach (var o in list)
				{
					var a = o as Dictionary<string, object>;
					if (a == null) continue;
					long size = 0;
					if (a.ContainsKey("size") && a["size"] != null) long.TryParse(Convert.ToString(a["size"]), out size);
					r.Assets.Add(new Asset { Name = Str(a, "name"), Url = Str(a, "browser_download_url"), Digest = Str(a, "digest"), Size = size });
				}
			return r;
		}

		static string Str(Dictionary<string, object> d, string k)
		{
			object v;
			return d.TryGetValue(k, out v) && v != null ? Convert.ToString(v) : null;
		}

		/// <summary>Empreintes publiées dans SHA256SUMS.txt : nom → sha256 (minuscules).</summary>
		public static Dictionary<string, string> Sums(Release r)
		{
			var a = r.Find(Program.SumsAsset);
			if (a == null) throw Incomplete(Program.SumsAsset);
			var map = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
			foreach (string raw in GetString(a.Url).Split('\n'))
			{
				string line = raw.Trim();
				if (line.Length < 66) continue;
				string hash = line.Substring(0, 64).ToLowerInvariant();
				string name = line.Substring(64).Trim().TrimStart('*');
				if (hash.All(Uri.IsHexDigit)) map[name] = hash;
			}
			return map;
		}

		public static Failure Incomplete(string name)
		{
			return new Failure(L.T("La version publiée sur GitHub est incomplète (fichier manquant : ",
				"The release published on GitHub is incomplete (missing file: ") + name + L.T("). Réessayez dans quelques minutes.", "). Try again in a few minutes."));
		}

		/// <summary>Télécharge un fichier de la release et vérifie sa taille et son empreinte SHA-256.</summary>
		public static void Download(Asset a, string expectedSha, string dest, Action<long, long> progress)
		{
			if (string.IsNullOrEmpty(expectedSha)) throw Incomplete(Program.SumsAsset + " (" + a.Name + ")");
			// L'API indique aussi l'empreinte (champ digest) : les deux doivent concorder.
			if (!string.IsNullOrEmpty(a.Digest) && a.Digest.StartsWith("sha256:", StringComparison.OrdinalIgnoreCase)
				&& !string.Equals(a.Digest.Substring(7), expectedSha, StringComparison.OrdinalIgnoreCase))
				throw new Failure(L.T("Les empreintes publiées pour ", "The published checksums for ") + a.Name +
					L.T(" ne concordent pas : rien n'a été modifié.", " do not match: nothing was changed."));

			long total = 0;
			string hex;
			try
			{
				using (var resp = (HttpWebResponse)Request(a.Url, "application/octet-stream").GetResponse())
				using (var s = resp.GetResponseStream())
				using (var f = new FileStream(dest, FileMode.Create, FileAccess.Write, FileShare.None))
				using (var sha = SHA256.Create())
				{
					long expected = a.Size > 0 ? a.Size : resp.ContentLength;
					var buf = new byte[81920];
					int n;
					long lastTick = 0;
					while ((n = s.Read(buf, 0, buf.Length)) > 0)
					{
						f.Write(buf, 0, n);
						sha.TransformBlock(buf, 0, n, null, 0);
						total += n;
						if (total - lastTick > 262144) { lastTick = total; progress(total, expected); }
					}
					sha.TransformFinalBlock(buf, 0, 0);
					hex = BitConverter.ToString(sha.Hash).Replace("-", "").ToLowerInvariant();
					progress(total, expected);
				}
			}
			catch (WebException e) { TryDelete(dest); throw Explain(e, a.Url); }
			catch (IOException e)
			{
				TryDelete(dest);
				throw new Failure(L.T("Téléchargement interrompu : ", "Download interrupted: ") + e.Message, 1, e);
			}

			Journal.Write("Téléchargé " + a.Name + " : " + total + " octets, sha256 " + hex);
			if (a.Size > 0 && total != a.Size)
			{
				TryDelete(dest);
				throw new Failure(L.T("Le fichier téléchargé n'a pas la bonne taille (", "The downloaded file has the wrong size (") +
					total + " / " + a.Size + L.T(") : rien n'a été modifié. Réessayez.", "): nothing was changed. Try again."));
			}
			if (hex != expectedSha.ToLowerInvariant())
			{
				TryDelete(dest);
				throw new Failure(L.T("Le fichier téléchargé est abîmé (empreinte SHA-256 différente de celle publiée) : rien n'a été modifié. Réessayez.",
					"The downloaded file is damaged (SHA-256 differs from the published one): nothing was changed. Try again."));
			}
		}

		static void TryDelete(string f) { try { File.Delete(f); } catch { } }

		static Failure Explain(WebException e, string url)
		{
			Journal.Write("Erreur réseau sur " + url + " : " + e);
			var resp = e.Response as HttpWebResponse;
			if (resp != null)
			{
				int code = (int)resp.StatusCode;
				if (code == 404)
					return new Failure(L.T("Aucune version du guide n'est encore publiée sur GitHub.", "No version of the guide is published on GitHub yet."), 1, e);
				if (code == 403 || code == 429)
					return new Failure(L.T("GitHub limite le nombre de demandes depuis votre connexion (60 par heure). Réessayez dans une heure.",
						"GitHub limits the number of requests from your connection (60 per hour). Try again in an hour."), 1, e);
				return new Failure(L.T("GitHub a répondu une erreur ", "GitHub answered with error ") + code + L.T(". Réessayez plus tard.", ". Try again later."), 1, e);
			}
			if (e.Status == WebExceptionStatus.Timeout)
				return new Failure(L.T("GitHub ne répond pas (délai dépassé). Vérifiez la connexion à Internet et réessayez.",
					"GitHub does not answer (timeout). Check the Internet connection and try again."), 1, e);
			return new Failure(L.T("Impossible de joindre GitHub : vérifiez la connexion à Internet (", "Cannot reach GitHub: check the Internet connection (")
				+ e.Message + ").", 1, e);
		}
	}
}
