# Changelog

## 3.11.4
- Campfire alert now recognizes the WoW Forever buff "Camp Benefits".

## 3.11.3
- Campfire alert: the campfire buff is now also recognized by partial name ("Cozy", "Campfire", "Warm"...).
- New `/balert buffs` command lists your current buffs with IDs, to help report unrecognized ones.

## 3.11.2
- Party indicators now sit on the same layer as the party frames, so the world map and other windows cover them.

## 3.11.1
- Seal tracker: the icon now follows the seal that is actually active. Seal of Vengeance and Seal of Blood removed; Seal of Fury (tanking seal) added, recommended for Protection. The Auto/Fixed choice was removed from seals.
- Options window: sections are laid out in aligned rows; each row takes the height of its tallest section.

## 3.11.0
- **Paladin:** Seal tracker. Shows the active seal with its remaining time, alerts when no seal is up (in combat by default), and treats the seal as consumed when you cast Judgement. Spec recommendation: Retribution → Seal of Command, otherwise Seal of Righteousness.
- New "Show timer while active" option (used by the Seal tracker; available on it only for now).

## 3.10.3
- Countdown text is much larger, centered on the icon with a thick outline, and scales with the icon size.

## 3.10.2
- Battle Shout default duration updated to 3 minutes (used for in-combat tracking before the buff has been read).

## 3.10.1
- Proc countdowns now start from the dodge/parry/block event itself, so they work even when the game hides the ability state in combat, and restart on a new trigger.

## 3.10.0
- **Warrior:** Victory Rush alert (when usable, 20 s countdown).
- Reactive abilities (Overpower, Revenge, Riposte, Mongoose Bite, Counterattack, Victory Rush) show a countdown of their usable window.
- Short buffs can warn before they expire, with a countdown on the icon. "Warn before expiry" option on every buff and weapon alert; default 5 s for Battle Shout, Lightning Shield, Inner Fire, Blessings and Shaman weapon enchants, off for the rest.

## 3.9.3
- Options window: sections now flow into columns by their real height, so the position controls of every alert are visible and nothing overlaps the bottom buttons. Solid background added.
- "Require recommended" no longer appears on utility alerts (Missing Weapon, Durability, etc.).

## 3.9.2
- Inner Fire alert now shows out of combat too by default.

## 3.9.1
- Lightning Shield and Inner Fire: the addon now counts physical hits taken in combat and brings the alert back when the charges are used up, so you can rebuff mid-fight.

## 3.9.0
- Spells you have never learned no longer produce a permanent alert. The "Train" badge only appears on top of a normal alert.
- New "Only in combat" option on every alert. Default on for Battle Shout, Lightning Shield, Inner Fire, Trueshot Aura, Righteous Fury and the Shaman weapon enchant; off for everything else.
- Righteous Fury: new "Show for all specs" option (off by default, so it still shows only for Protection).

## 3.8.1
- Sliders now have a typed value box and + / - buttons for precise size and position.
- The options window no longer closes together with the Blizzard Options window (Escape still closes it).

## 3.8.0
- New small top-of-screen alerts: Missing Weapon and low Durability (all classes), low Soul Shards (Warlock), low Ammo and Pet Happiness (Hunter). Thresholds are adjustable.
- Optional sound per alert ("Play sound", off by default).
- "Hide all alerts" checkbox in the options, also `/balert toggle`.

## 3.7.0
- New small alerts at the top of the screen for all classes: missing food buff (Well Fed) and missing campfire buff. Hidden in combat; each can be disabled, resized and moved.

## 3.6.0
- Party indicators can be shown on the left side of the party frames (new option per indicator).

## 3.5.5
- Weapon enchant detection now also checks the weapon tooltip, as a fallback when the enchant API reports nothing.
- `/balert debug` prints the raw weapon enchant data to help diagnose reports.

## 3.5.4
- Level 1 characters now get alerts for spells they already know (e.g. Warlock Demon Skin); reminders to train unlearned spells start at level 2.

## 3.5.3
- Added an icon to the AddOn List.

## 3.5.2
- No alerts or party indicators are shown on level 1 characters.

## 3.5.1
- **Druid:** Thorns alert (shown in and out of combat when Thorns is missing).

## 3.5.0
- **Warrior:** Revenge and Execute alerts (Execute shows when the target is below 20% health, even if rage is short).
- **Rogue:** Riposte alert.
- **Hunter:** Counterattack and Mongoose Bite alerts, Trueshot Aura alert (in combat), in-combat warning for Aspect of the Cheetah, and a Missing Pet alert.
- **Warlock:** Missing Pet alert.
- **Paladin:** Aura alert with a spec recommendation (any aura turns it off), and a Righteous Fury alert in combat for Protection paladins.
- **Druid:** Omen of Clarity alert.
- **Priest:** Divine Spirit and Shadow Protection alerts, with party indicators for all classes.
- Party indicators for the same class now sit side by side instead of on top of each other.
- The options window wraps into rows and scrolls when a class has many alerts.
- New default positions so a class's alerts no longer overlap.
- Added the MIT license.

## 3.4.0
- Renamed to **BuffAlerts Forever** for the public release.
- Chat commands are now `/balert` and `/buffalerts`.
- All code comments translated to English.
- Added this changelog.

## 3.3.0
- **Priest:** Power Word: Fortitude alert (Prayer of Fortitude also counts) and party indicator for all classes.
- **Priest:** Inner Fire alert, shown in combat only.
- **Hunter:** Aspect alert when no aspect is active (recommends Aspect of the Hawk, or Monkey before level 10).
- **Hunter:** in-combat warning when Aspect of the Pack is active.

## 3.2.1
- Weapon Enchant and Poisons alerts now show the icon of the weapon that is missing the enchant.

## 3.2.0
- **Shaman:** Lightning Shield alert (combat only) and Weapon Enchant alert (any imbue counts).
- **Rogue:** Poisons alert from level 20 (any temporary enchant counts).
- Fixed the "Train" badge appearing when a higher rank was already known.

## 3.1.0
- The "Train" badge now follows the alert and disappears once the buff is applied.
- Any valid buff of the right type turns an alert off; "Require recommended" is now off by default.
- All in-game texts are in English.

## 3.0.2
- Spell IDs that belong to a different spell on the Forever client are now detected and ignored.
- Added the "Train" badge when the trainer offers a better rank for your level.

## 3.0.0
- **Druid:** Mark of the Wild alert (Gift of the Wild also counts) and party indicator.

## 2.0.0
- **Warlock:** Armor alert.
- **Mage:** Armor alert by talent spec, Arcane Intellect alert and party indicator for mana users.
- **Paladin:** Blessing alert by talent spec and party indicator.
- Added "Require recommended" and Auto/Fixed buff choice.
- Options window shows only the alerts for your class.

## 1.0.0
- First version: Warrior Battle Shout (combat only) and Overpower alerts, with options for enable, size and position.
