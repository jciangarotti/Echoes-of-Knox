# Echoes of Knox

A Project Zomboid (Build 42) mod about the seven lives that, quietly and
without anyone noticing, led to the Knox apocalypse.

Seven people went missing in Knox County in the year before the outbreak.
Seven **dog tags** have been scattered across the map. Find them with the
**Compass Watch** — a wrist-mounted tracker that beeps faster the closer
you get — recover the journals they left behind, and piece together what
was really happening in the months before everything fell apart.

Who they were, what was done to them, and how their stories connect —
that's the mod. You'll find out in the game.

![poster](poster.png)

## How it works

1. When your character first loads the save, a **Mysterious Note** is
   placed in a drawer, nightstand or on the floor of the starting house.
   Right-click → **Read Note** to learn what's going on and what to look
   for.
2. Find a **Compass Watch** (spawns in bedroom nightstands, dressers, office
   drawers, and — with higher weight — military storage crates and Army
   surplus).
3. Right-click the watch → **Toggle Compass Watch**.
4. Walk. The compass emits a beep whose frequency depends on the distance to
   the nearest un-recovered dog tag:
   - Very far (> 1000 tiles): one beep every 8 seconds.
   - Far (300–1000): every 4 seconds.
   - Medium (100–300): every 1.5 seconds.
   - Close (20–100): every 0.5 seconds.
   - Right next to it (< 20): nearly continuous beeping.
5. **⚠ Subject Bosses** — Each dog tag is carried by one of the missing
   people, now reanimated. Each wears the clothing they had in life — use
   that as your first clue about who you're fighting. They're faster
   (sprinter) and tougher (2× health) than normal zombies. Kill them and
   loot the corpse to recover the tag. Come prepared.
6. **Journals.** Scattered across Knox County are additional readable
   journal pages — fragments of the seven lives, out of order, waiting
   to be pieced together. Most are stashed where each person used to
   spend their days; some ended up in ordinary houses, cars and offices.
   Right-click → **Read Journal Entry**.
7. Repeat until you've recovered all 7 tags. The watch drains its
   internal battery while the compass is on.

## Installation

### Manual
1. Copy the `EchoesOfKnox/` folder into `C:\Users\<user>\Zomboid\mods\`.
2. In Project Zomboid → **Mods** → enable **Echoes of Knox**.

### Steam Workshop
*(coming soon)*

## Current status

**v0.1.0 — single-player.** Multiplayer is planned for v0.2.

- [x] Mysterious Note spawns in the starting building on first load —
      sets up the mystery and points at the Compass Watch.
- [x] 7 dog tags with unique icons.
- [x] Compass Watch spawnable in civilian and military loot.
- [x] **Subject bosses (v0.2):** each dog tag is guarded by a civilian-
      dressed boss zombie with 2× health and forced sprinter. Drops the
      tag when killed.
- [x] **Journal entries (v0.3):** 70 additional readable journal pages
      scattered across Knox County. Predominantly stashed where each
      person used to spend their days, and partly in ordinary loot
      (houses, cars, offices). Right-click → **Read Journal Entry**.
      The stories cross and overlap: finding them out of order is part
      of the experience.
- [x] **Bilingual (v0.4):** full English + Chilean Spanish, auto-detected
      from the game language (Options → Language).
- [x] **Collection window (v0.5):** press **J** to open a dedicated
      window that shows every subject and your progress (dog tag +
      10 journal entries per subject). Names stay hidden as "Subject
      NN — ???" until you recover the dog tag. Clicking a discovered
      entry reopens it for re-reading.
- [x] Right-click context menu with on/off toggle.
- [x] Beep frequency scales with distance.
- [x] Random dog-tag placement within a 2000-tile radius around spawn,
      persistent per character.
- [x] Watch battery drains while the compass is on.
- [x] Notification when you've recovered all 7.
- [ ] Multiplayer / shared server state.

## Known limitations

- The beep is a synthesized placeholder shared with Dragon Ball Zomboid
  (its sibling mod). Feel free to swap in your own
  `42/media/sound/compass_beep.wav`.
- Dog tags spawn within a 2000-tile radius from the character's starting
  location. If you moved far away before installing the mod, some tags
  may end up in areas you've already cleared.
- The compass does not distinguish floors — if a dog tag is stashed in a
  basement directly beneath you, the beep will be fast even though you
  can't physically reach it from the current tile.

## Plays well with

Echoes of Knox and **Dragon Ball Zomboid** use disjoint ItemIDs, namespaces,
and ModData keys, so both can run in the same save without interfering.

## License

MIT — see [LICENSE](LICENSE).

## Credits

- Built for *Project Zomboid* (The Indie Stone).
- Sibling mod: [Dragon Ball Zomboid](../DragonBallZomboid) — same beep-search
  mechanic, different flavor.
