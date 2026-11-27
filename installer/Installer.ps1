# Installe (ou met à jour) les addons du dossier "addons" dans WoW Forever.
# Lancé par Installer.bat. Aucun droit administrateur, aucun accès réseau.
#  1. Trouve le dossier du jeu : chemin mémorisé, registre, emplacements
#     habituels de Battle.net sur chaque disque ; sinon fenêtre de choix.
#  2. Copie chaque addon dans Interface\AddOns, en remplaçant l'ancienne version.
param(
	[string]$WowPath = "",        # forcer le dossier World of Warcraft (tests)
	[string[]]$Candidates = @(),  # remplacer la liste des dossiers essayés (tests)
	[switch]$NoDialog,            # ne jamais ouvrir de fenêtre (tests)
	[switch]$NoPause,
	[switch]$DetectOnly           # afficher le dossier trouvé sans rien copier (tests)
)
$ErrorActionPreference = "Stop"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$source = Join-Path (Split-Path -Parent $here) "addons"
$memo = Join-Path $here "chemin-wow.txt"

function Say($text, $color = "Gray") { Write-Host $text -ForegroundColor $color }
function Done($code) {
	if (-not $NoPause) { Say ""; Read-Host "Appuyez sur Entrée pour fermer" | Out-Null }
	exit $code
}

# Le dossier de jeu Forever dans un dossier World of Warcraft, ou $null.
# Forever s'installe dans _forever_ ; la bêta utilisait _classic_beta_.
function GameDir($wow) {
	if (-not $wow -or -not (Test-Path -LiteralPath $wow)) { return $null }
	$leaf = Split-Path -Leaf $wow
	if ($leaf -in @("_forever_", "_classic_beta_")) { return $wow }
	foreach ($sub in @("_forever_", "_classic_beta_")) {
		$p = Join-Path $wow $sub
		if (Test-Path -LiteralPath $p) { return $p }
	}
	return $null
}

function Find-Game {
	if ($WowPath) { return GameDir $WowPath }
	$list = New-Object System.Collections.Generic.List[string]
	if ($Candidates.Count -gt 0) {
		$Candidates | ForEach-Object { $list.Add($_) }
	} else {
		if (Test-Path -LiteralPath $memo) { $list.Add((Get-Content -LiteralPath $memo -Raw).Trim()) }
		# Le jeu ouvert donne son dossier directement.
		Get-Process -Name "Wow*" -ErrorAction SilentlyContinue | ForEach-Object {
			if ($_.Path) { $list.Add((Split-Path -Parent $_.Path)) }
		}
		foreach ($key in @("HKLM:\SOFTWARE\WOW6432Node\Blizzard Entertainment\World of Warcraft",
				"HKLM:\SOFTWARE\Blizzard Entertainment\World of Warcraft",
				"HKCU:\SOFTWARE\Blizzard Entertainment\World of Warcraft")) {
			try {
				$v = (Get-ItemProperty -LiteralPath $key -ErrorAction Stop).InstallPath
				if ($v) { $list.Add($v.TrimEnd("\")); $list.Add((Split-Path -Parent $v.TrimEnd("\"))) }
			} catch {}
		}
		$drives = Get-PSDrive -PSProvider FileSystem -ErrorAction SilentlyContinue | ForEach-Object { $_.Root }
		foreach ($d in $drives) {
			foreach ($rel in @("Program Files (x86)\World of Warcraft", "Program Files\World of Warcraft",
					"World of Warcraft", "Games\World of Warcraft", "Jeux\World of Warcraft",
					"Battle.net\World of Warcraft", "Blizzard\World of Warcraft")) {
				$list.Add((Join-Path $d $rel))
			}
		}
	}
	foreach ($c in $list) {
		$g = GameDir $c
		if ($g) { return $g }
	}
	return $null
}

function Ask-Game {
	if ($NoDialog) { return $null }
	Add-Type -AssemblyName System.Windows.Forms
	$dlg = New-Object System.Windows.Forms.FolderBrowserDialog
	$dlg.Description = "Choisissez le dossier World of Warcraft (celui qui contient _forever_)"
	$dlg.ShowNewFolderButton = $false
	if ($dlg.ShowDialog() -ne [System.Windows.Forms.DialogResult]::OK) { return $null }
	$g = GameDir $dlg.SelectedPath
	if (-not $g) { Say "Ce dossier ne contient pas _forever_ : $($dlg.SelectedPath)" "Yellow" }
	return $g
}

Say "Installation des guides WoW Forever (Polestar + Groupe Alliance)" "Cyan"
if (-not (Test-Path -LiteralPath $source)) { Say "Dossier addons introuvable à côté de l'installateur : $source" "Red"; Done 1 }
if (Get-Process -Name "Wow*", "WowClassic*" -ErrorAction SilentlyContinue) {
	Say "World of Warcraft est ouvert : fermez le jeu avant d'installer, sinon les addons ne se chargent pas." "Yellow"
}

$game = Find-Game
if ($DetectOnly) { Say "Dossier trouvé : $game"; exit 0 }
if (-not $game) {
	Say "Dossier du jeu non trouvé automatiquement : une fenêtre va s'ouvrir pour le choisir."
	$game = Ask-Game
}
if (-not $game) { Say "Aucun dossier WoW Forever choisi : rien n'a été installé." "Red"; Done 1 }
if (-not $WowPath -and $Candidates.Count -eq 0) {
	try { Set-Content -LiteralPath $memo -Value (Split-Path -Parent $game) -Encoding UTF8 } catch {}
}

$addons = Join-Path $game "Interface\AddOns"
New-Item -ItemType Directory -Force -Path $addons | Out-Null
Say "Dossier des addons : $addons"

$folders = Get-ChildItem -LiteralPath $source -Directory
# 0.14.0 : comme le programme d'installation (installer-exe/Updater.cs), les dossiers remplacés et les
# anciens dossiers retirés partent dans Interface\_guide-sauvegarde (vidé à chaque installation), avec
# un LISEZMOI.txt pour revenir en arrière.
$backup = Join-Path (Split-Path -Parent $addons) "_guide-sauvegarde"
if (Test-Path -LiteralPath $backup) { Remove-Item -LiteralPath $backup -Recurse -Force }
New-Item -ItemType Directory -Force -Path $backup | Out-Null
$moved = 0
$n = 0
foreach ($f in $folders) {
	$dest = Join-Path $addons $f.Name
	if (Test-Path -LiteralPath $dest) { Move-Item -LiteralPath $dest -Destination (Join-Path $backup $f.Name); $moved++ }
	Copy-Item -LiteralPath $f.FullName -Destination $dest -Recurse -Force
	$n++
}
# Les anciennes versions de Polestar (0.2.x) avaient des dossiers de langue séparés ;
# l'addon GroupeAlliance (paquet 0.1.0) est maintenant dans le dossier Polestar ;
# Polestar 0.4.3 a fondu dans d'autres dossiers ceux de la 0.4.2.2 nommés ici (paquet 0.13.x).
$legacy = '^(Polestar_(Guides|Names)_[a-z]{2}[A-Z]{2}|GroupeAlliance|Polestar_(Experimental|Looks|SkinAPI)' +
	'|Polestar_Skin_(Aurora|Beacon|Hairline|Lanterns|Lumen|Sheen|Umbra|Vellum|Waymark)' +
	'|Polestar_Guides_(Dwarf|Gnome|Human|NightElf|Orc|Scourge|Skyborne|Tauren|Troll))$'
Get-ChildItem -LiteralPath $addons -Directory -ErrorAction SilentlyContinue |
	Where-Object { $_.Name -match $legacy } |
	ForEach-Object {
		Move-Item -LiteralPath $_.FullName -Destination (Join-Path $backup $_.Name)
		$moved++
		Say "Ancien dossier retiré (gardé dans _guide-sauvegarde) : $($_.Name)"
	}
if ($moved -gt 0) {
	Set-Content -LiteralPath (Join-Path $backup "LISEZMOI.txt") -Encoding UTF8 -Value @(
		"Ancienne version du guide, sauvegardée le $(Get-Date -Format 'dd/MM/yyyy HH:mm').",
		"Pour revenir en arrière : supprimer les dossiers du même nom dans ..\AddOns, puis y déplacer ceux-ci.")
	Say "Ancienne version sauvegardée dans $backup"
} else {
	Remove-Item -LiteralPath $backup -Recurse -Force
}

Say "$n addons installés ou mis à jour." "Green"
Say "Relancez WoW : les guides s'ouvrent tout seuls, rien à cocher."
Say "Sinon : écran des personnages, bouton AddOns en bas à gauche, cochez Polestar."
Done 0
