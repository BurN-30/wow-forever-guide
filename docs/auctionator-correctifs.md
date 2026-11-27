# Auctionator 354 : correctifs du pack / pack patches

Français d'abord, [English below](#english).

## Français

Le pack installe Auctionator 354 (plusmouse, Borjamacare, tous droits réservés), à partir du fichier publié sur [CurseForge](https://www.curseforge.com/wow/addons/auctionator) (`Auctionator-354.zip`, SHA-1 `ece0e7fc267c1d9267fc19083e10d0827bbdd723`, SHA-256 `67e3d471abc0fc725db5dfc4a72015c69f469e882717b1efe750a26670bbbb22`). Jusqu'à la 0.13.1, l'addon était livré sans aucune modification. Depuis la 0.14.0, deux défauts dont le mécanisme se lit dans le code sont corrigés, chacun en quelques lignes marquées `[pack patch]`, et une ligne `## X-Pack-Patches:` est ajoutée au `.toc` ; le numéro de version reste 354.

Le diff complet est dans [`auctionator-354.patch`](auctionator-354.patch) : appliqué sur la release décompressée (`git -c core.autocrlf=false apply -p1 docs/auctionator-354.patch` depuis le dossier qui contient `Auctionator`), il redonne le dossier `addons/Auctionator` du dépôt octet pour octet (vérifié le 27/11/2026). Le `.toc` est en CRLF, les fichiers Lua en LF, comme dans la release.

### Correctif 1 : prix des objets à suffixe (`Source/Utilities/DBKeyFromLink.lua`)

- Clients : les deux. Seulement sur WoW Forever (`Auctionator.Constants.IsForever`), pour une pièce d'équipement dont le nom porte un suffixe (« ... de l'Ours »).
- Cause : la voie des vérifications supplémentaires (`SuffixesExtraChecks`, lignes 59 à 72) se sert d'une variable `seen` qui n'est déclarée nulle part : c'est une variable globale. Elle passe à vrai au premier objet reconnu par cette voie et n'est jamais remise à faux. Ensuite, pour tout objet dont aucune vérification ne reconnaît le suffixe, `if not seen` est faux : la fonction ne rappelle jamais `callback`, l'objet n'a pas de clé de prix (pas de prix dans l'infobulle, pas d'enregistrement au scan), et `DBKeysFromMultipleLinks` attend sans fin cet objet. La même boucle de `Source_ModernAH/Utilities/DBKeyFromBrowseResult.lua` (ligne 22) déclare bien `local seen = false`.
- Correction : `local seen = false` juste avant la boucle, comme dans l'autre fichier.
- Banc (Lua 5.1, faux jeu : un objet reconnu par la vérification supplémentaire, puis un objet au suffixe inconnu) : la release donne `gr:100:5` puis aucun rappel, et laisse une globale `seen = true` ; la copie du pack donne `gr:100:5` puis `200` (la clé de base), sans globale. Repris dans `tools/check-lua.py`, partie 8.
- À retirer quand : l'amont déclare `seen` localement.

### Correctif 2 : migration des clés de prix (`Source/Variables/Main.lua`)

- Clients : les deux, WoW Forever, une seule fois par royaume (base de prix sans le drapeau `suffixes`).
- Cause : la migration des lignes 174 à 186 remplace, dans chaque clé `gr:<objet>:<libellé>`, le libellé par son rang dans `Auctionator.Utilities.SuffixLabels` (`tIndexOf`). Pour un libellé absent de cette liste, `tIndexOf` renvoie `nil` et la concaténation lève une erreur Lua : toute l'initialisation de la base de prix s'arrête. D'après la vérification faite le 27/11/2026, nos joueurs n'y sont pas exposés (les versions 343 et 345 n'écrivaient pas de clés `gr:` sur ce jeu, la 351 écrivait des libellés tous connus de la 354) ; la garde supprime le risque pour une base venue d'ailleurs.
- Correction : un libellé inconnu garde sa clé telle quelle ; les autres sont convertis comme dans la release.
- Banc (le bloc de la release, isolé, sur une base avec un libellé connu et un inconnu) : la release lève « attempt to concatenate a nil value » ; la copie du pack convertit la clé connue (`gr:5:1`) et garde l'inconnue. Repris dans `tools/check-lua.py`, partie 8.
- À retirer quand : l'amont teste le résultat de `tIndexOf`.

### Défaut connu, non corrigé

Aucun autre. Le reste de l'addon est celui de la release.

## English

Auctionator 354 (plusmouse, Borjamacare, all rights reserved), installed from the file published on [CurseForge](https://www.curseforge.com/wow/addons/auctionator) (`Auctionator-354.zip`, SHA-1 `ece0e7fc267c1d9267fc19083e10d0827bbdd723`, SHA-256 `67e3d471abc0fc725db5dfc4a72015c69f469e882717b1efe750a26670bbbb22`). Up to 0.13.1 it shipped unchanged. Since 0.14.0 two defects whose mechanism shows in the code are fixed, each in a few lines marked `[pack patch]`, and a `## X-Pack-Patches:` line is added to the `.toc`; the version stays 354. The full diff is [`auctionator-354.patch`](auctionator-354.patch): `git -c core.autocrlf=false apply -p1 docs/auctionator-354.patch`, run from the folder holding the unzipped `Auctionator`, rebuilds the repository's `addons/Auctionator` byte for byte (checked 2026-11-27).

### Patch 1: prices of items with a suffix (`Source/Utilities/DBKeyFromLink.lua`)

- On WoW Forever, for a piece of gear whose name carries a suffix. The extra checks' loop (lines 59-72) uses `seen` without declaring it: a global, set to true by the first item that path recognises and never set back. From then on, an item whose suffix no check recognises never calls back: no price key, no price, and `DBKeysFromMultipleLinks` waits for it forever. The same loop in `Source_ModernAH/Utilities/DBKeyFromBrowseResult.lua` (line 22) declares `local seen = false`.
- Fix: `local seen = false` right before the loop. Bench (Lua 5.1, an item matched by the extra check, then one with an unknown suffix): the release gives `gr:100:5`, then no call back, and leaves a global `seen = true`; the pack's copy gives `gr:100:5`, then `200`. In `tools/check-lua.py`, part 8.

### Patch 2: price key migration (`Source/Variables/Main.lua`)

- On WoW Forever, once per realm. Lines 174-186 replace each `gr:<item>:<label>` key's label with its rank in `SuffixLabels` (`tIndexOf`); a label missing from the list gives `nil` and the concatenation raises a Lua error that stops the whole price database's start. Our players are not exposed (checked 2026-11-27: 343 and 345 wrote no `gr:` keys on this game, 351 only labels 354 knows); the guard removes the risk for a database from elsewhere.
- Fix: an unknown label keeps its key as it is. Bench: the release raises "attempt to concatenate a nil value"; the pack's copy converts the known key (`gr:5:1`) and keeps the other. In `tools/check-lua.py`, part 8.
