# Echoes of Knox

A Project Zomboid (Build 42) mod that digs into the lore of the Knox Infection.
Somewhere in Knox County, seven military **dog tags** are buried — the
experimental subjects of **Dr. Thomas McGrew**, a US Army scientist who was
researching the origin of the outbreak. Find them all with the **Compass
Watch** — a wrist-mounted compass that beeps faster the closer you get — and
piece together what really happened.

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
   people, now reanimated. Each wears the clothing of their civilian
   profession (doctor, nurse, store clerk, priest, mechanic, P.E. teacher,
   biologist) — use that to recognize who you're fighting before you read
   the tag. They're faster (sprinter) and tougher (2× health) than normal
   zombies. You have to kill them and loot the corpse to recover the tag.
   Come prepared.
6. Repeat until you've recovered all 7. The watch drains its internal
   battery while the compass is on.

## Subjects

| # | Profession | Name |
|---|-----------|------|
| 01 | Physician | Elliot James Hargreaves |
| 02 | Registered Nurse | Claire Elizabeth Vance |
| 03 | Supermarket Clerk | Marcus Raymond Delaney |
| 04 | Catholic Priest | Tobias Matthew Cross |
| 05 | Auto Mechanic | Rhett Alan Malone |
| 06 | P.E. Teacher | Daniel Antonio Orozco |
| 07 | Biologist / ex-Agroindustrial researcher | Isaac Mikhail Volkov |

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
      dressed boss zombie (doctor, nurse, clerk, priest, mechanic, P.E.
      teacher, biologist) with 2× health and forced sprinter. Drops the
      tag when killed.
- [x] **Journal entries (v0.3):** 70 additional readable journal entries
      (10 per subject) scattered across Knox County. Each entry reveals
      part of the character's story — from mundane daily life before the
      outbreak, through the moment they were marked, to their last
      words. Predominantly stashed in thematic locations (physician's
      journals in clinics, mechanic's in garages, priest's in churches,
      etc.) and partly in generic civilian loot. Right-click → **Read
      Journal Entry** to read. The seven stories cross and overlap:
      finding them out of order is part of the experience.
- [x] Right-click context menu with on/off toggle.
- [x] Beep frequency scales with distance.
- [x] Random dog-tag placement within a 2000-tile radius around spawn,
      persistent per character.
- [x] Watch battery drains while the compass is on.
- [x] Notification when you've recovered all 7.
- [ ] Multiplayer / shared server state.
- [ ] Richer pickup lore (McGrew's journal entries as full tooltips).

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
