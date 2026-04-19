# Changelog

All notable changes to **Echoes of Knox** are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.5.1] - 2026-04-19

### Fixed
- `Echoes.getLang()` now uses `Translator.getLanguage():name()` (the correct
  PZ Build 42 API). The old `getCore():getOptionLanguage()` call threw a
  Kahlua runtime error that escaped `pcall` and crashed the Mysterious
  Note reader, the diary reader, and the Collection window on open.

## [0.5.0] - 2026-04-19

### Added
- **Collection window** — press **J** to open a Pokédex-style overview of
  the seven subjects and your progress.
    - Left sidebar lists the seven subjects with a counter (`X/11`) and
      progress bar per subject (10 diaries + 1 dog tag).
    - Right panel shows the selected subject's dog tag block and a 2×5
      grid of diary cells. Discovered cells show the journal icon and
      an "Entry N" label; undiscovered cells are greyed out with `???`.
    - Clicking a discovered diary cell reopens its read modal.
    - **Names stay hidden** as `Subject NN — ???` until the subject's
      dog tag is recovered. Recovering the tag reveals the full name
      and profession in the window.
    - Global progress bar in the header (`X / 77`).
- `Echoes_Collection_Core.lua` — discovery state under ModData key
  `EchoesCollection`. Dog-tag state is reused from `Echoes.Core` (single
  source of truth).
- `Echoes_Collection_Events.lua` — recursive inventory scan every 500ms
  that auto-marks diaries as discovered and fires a halo text on first
  pickup.
- `Echoes_Collection_UI.lua` — `ISCollapsableWindow` + custom
  `ISScrollingListBox` sidebar + custom grid renderer.
- `Echoes_Collection_Keybind.lua` — registers the `[Echoes of Knox]`
  section in **Options → Key Bindings** with `Open Echoes Collection`
  bound to **J** (configurable).
- Translation strings for the new window (EN + ES): `UI_EOK_CollectionTitle`,
  `UI_EOK_OverallProgress`, `UI_EOK_TagRecovered`, `UI_EOK_TagMissing`,
  `UI_EOK_UnknownSubject`, `UI_EOK_Journals`, `UI_EOK_OpenCollection`.

### Changed
- README description reworked to preserve the mystery: names and
  professions removed from the mod page; players now discover them
  in-game.
- `mod.info` description in both English versions reflects the same
  rewrite.

## [0.4.0] - 2026-04-19

### Added
- **Bilingual support (EN + ES, auto-detected)**. The mod reads the
  game language and serves the matching content for every user-facing
  string: UI messages, item names, the Mysterious Note body, and all
  70 journal entries.
- `Echoes_Diaries_ES.lua` — headers + 70 diary entries in **Chilean
  Spanish** (standard *tú* forms; no *voseo* rioplatense). Literary
  adaptation preserves each subject's voice.
- `ES/UI.json` and `ES/ItemName.json` — full Spanish translations for
  every item and UI string.

### Fixed
- Journal loot distribution is now much sparser. Previously any drawer
  could roll 3-5 diaries at once. Tightened:
    - Thematic categories per subject: 3 (was 7).
    - Generic categories: each entry rotated into 1 category (was 7).
    - Weights uniform at 1 (were 3 thematic / 1 generic).
  Target rate is roughly 3-5% per container roll.

### Changed
- `Echoes_Text.lua` reintroduces `DEFAULTS_ES` and exposes
  `Echoes.getLang()` (`"EN"` or `"ES"`) for other modules.
- `Echoes_Note.lua` now holds `NOTE_TEXT_EN` + `NOTE_TEXT_ES` and picks
  at read time.
- `Echoes_Diaries.lua` exposes `HEADERS_EN/ES` and `TEXTS_EN/ES` tables
  on the `Echoes.Diaries` namespace so `Echoes_Diaries_ES.lua` can
  populate the Spanish side without redefining the module.

## [0.3.0] - 2026-04-19

### Added
- **70 readable journal entries (10 per subject)** scattered across
  Knox County as physical loot items. Each entry is a literary
  fragment that reveals part of the subject's story. The seven
  stories overlap and cross-reference each other — Elliot and Claire
  are lovers; Marcus gives Claire the apple that later comes back as
  a signature in the kidnap boxes; Isaac observes all of them.
- `Echoes_Diaries.lua` — diary reader (reuses `ISModalRichText`) +
  context-menu hook "Read Journal Entry".
- Seven distinct journal icons, color-coded per subject (doctor =
  medical blue, nurse = pink, clerk = tan, priest = black with gold
  trim, mechanic = olive, P.E. teacher = athletic orange, biologist
  = dark forest green).
- Loot injection into thematic PZ categories (medical, garage,
  church, etc.) plus a rotated fallback in generic containers.
- PowerShell helpers in `tools/`: `generate_journal_items.ps1` (bulk
  item definitions + translations), `extract_docx.ps1` (pulled the
  original Spanish source from a .docx), `strip_bom.ps1` (removes
  the UTF-8 BOM that PowerShell 5 adds to JSONs, which PZ rejects).

## [0.2.0] - 2026-04-19

### Added
- **Subject Bosses** — each dog tag is now guarded by a unique boss
  zombie representing the missing person. Each wears the clothing
  of their civilian profession (doctor, nurse, store clerk, priest,
  mechanic, P.E. teacher, biologist). Stats: **2× health, forced
  sprinter** (per-zombie, ignores sandbox global). The boss carries
  the dog tag in its inventory and drops it naturally when killed.
- `Echoes_Bosses.lua` — spawn helper using the native
  `addZombiesInOutfit` function, post-spawn customization via
  `setSprinter` / `setForceToSprint`, ModData marker
  (`EOK_SubjectID`), dog-tag injection.

### Changed
- `Echoes_Spawn.lua` — `tickSpawn` delegates to
  `Echoes.Bosses.spawnBoss` with fallback to ground-drop behavior
  if the boss module is unavailable.
- Subject identities switched from military ranks (Cpl. James
  Morrison, Pvt. Sarah Chen, etc.) to civilian names with specific
  professions — Elliot Hargreaves (Physician), Claire Vance (RN),
  Marcus Delaney (Store Clerk), Tobias Cross (Priest), Rhett Malone
  (Auto Mechanic), Daniel Orozco (P.E. Teacher), Isaac Volkov
  (Biologist). Matches the "missing civilians" framing of the note.

## [0.1.0] - 2026-04-19

### Added
- Initial release. Core mechanic cloned from the sibling mod
  **Dragon Ball Zomboid** (escalating beeps that lead the player to
  scattered collectibles), re-themed with disjoint namespaces so
  both mods coexist in the same save.
- **Compass Watch** — wrist-mounted tracker (right + left variants,
  `base:alarmclockclothing` item type) that beeps at a frequency
  depending on the distance to the nearest unrecovered dog tag.
  Drains an internal battery while active. Spawns in bedroom / living
  room side tables, office drawers, shelves, and at higher weight in
  Army storage and Army surplus crates.
- **7 dog tags** (`Subject 01..07`) randomly placed within a 2000-tile
  radius of the character's spawn point, persistent per character.
- **Mysterious Note** spawned in a container of the starting building
  on first save load, setting up the mystery via a handwritten letter.
- Full client-side Lua architecture: `Core`, `Spawn`, `Compass`,
  `Pickup`, `ContextMenu`, `Events`, `Text`, `Debug`, `Note` modules.
- EN / ES translation scaffolding (later reworked in 0.4.0 for
  automatic bilingual runtime switching).
- MIT license.
