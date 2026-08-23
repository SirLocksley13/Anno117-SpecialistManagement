# Specialist Management

Specialist decision-support for **Anno 117: Pax Romana**.

Created by **Dr. Enrico Handrick / SirLocksley13**.

## What it does

Specialist Management helps answer: **What should I do with the specialists I own?**

It combines specialists stored in island warehouses with specialists equipped in Guest Houses, Governor Villas, Albion Officia, and ships.

Reports include:
- Best Opportunities
- Unused Specialists
- Improve Equipped Specialists
- Find by Purpose
- Empty Slot Opportunities
- Scan Again / What Changed?
- Ship Recommendations
- Empire Overview
- All Specialists

The mod is **read-only**. It does not equip, unequip, move, transfer, create, or delete specialists.

## Controls

- **Ctrl+Alt+I**
  - specialist picker open: toggle **Relevant Specialists**
  - Guest House / Officium / Governor Villa open but picker closed: arm/disarm **Relevant Specialists** for the next specialist slot you open
  - outside a supported specialist host: open **Specialist Management**
- **Ctrl+Alt+1 ... 9** — jump to the corresponding numbered report entry when supported
- **Ctrl+Alt+0** — from a Specialist Management parchment, close it and return to the Specialist Management menu

## Relevant Specialists

With a specialist picker open, Ctrl+Alt+I leaves relevant candidates enabled and disables mapped candidates whose target buildings are not within the selected host's effect radius. If the supported host screen is open but no slot picker is visible yet, Ctrl+Alt+I arms the filter and applies it automatically when the next specialist slot picker opens.

Host radii:
- Guest House / Officium: 24
- Governor Villa: 36

The current target table contains **402 ordinary radius-specialist mappings** updated from Patch 2.0 game data. Island-wide Heroic effects remain separate from this local-radius filter. Unknown or newly added specialists stay enabled rather than being incorrectly disabled.

## Provinces

Latium and Albion are scanned and cached separately. Most reports concern the current province. **Empire Overview** summarizes both province caches.

## Languages

Version 1.1.0 includes localization files for all 12 Anno 117 interface languages so the UI does not become blank on non-English installations.

- **English:** fully supported
- **German:** fully supported, including dynamic report text and Anno-localized specialist names
- **Other interface languages:** English fallback text is currently supplied for compatibility

Specialist names are resolved from Anno by GUID where supported, allowing the game localization to provide the appropriate displayed name.

## Installation

Extract the mod folder into your Anno 117 mods folder, for example:

`<Documents>/Anno 117 - Pax Romana/mods/`

Keep the folder containing `modinfo.json` intact.

## Compatibility and limitations

- Anno 117 PC
- No new game required
- Multiplayer and Campaign are not declared supported because they have not been release-tested
- The parchment report uses the native TextPopup control; inline bold/italic/color formatting is not currently available
- After a major game update, new specialists may require regenerating the embedded target mapping from the updated `assets.xml`; unmapped specialists remain enabled for safety

## Version 1.1.0

Highlights:
- Patch 2.0 Heroic rarity support (internal `Mythic`, displayed as `Heroic`)
- Structured metadata for all 30 Patch 2.0 Heroic specialists, including Prestige requirements and separate island-wide effects
- Patch 2.0 ordinary-radius target mappings for Relevant Specialists
- Removed the obsolete separate global rescan shortcut; use New Scan from Specialist Management
- English and German Specialist Management UI/report support
- German specialist names resolved from Anno localization by GUID
- Language-neutral GUID-based warehouse jumps
- Reliable Ctrl+Alt+1 ... 9 report navigation
- Province-aware scans for Latium and Albion
- Read-only specialist management and recommendation workflow

### Test4 runtime fixes

- Fixed Best Opportunities / Unused Specialists report rendering by attaching Heroic metadata to the authoritative SpecialistFinder runtime table.
- Added state-gated Ctrl+Alt+0 return from Specialist Management parchments, using deferred close-and-return behavior compatible with the same shortcut used by Ship Finder and Rename Manager.
- Ctrl+Alt+I on a supported specialist host no longer opens the management menu just because the slot picker is still closed; it arms/disarms Relevant Specialists for the next picker.


## v1.1.0 Test6 parchment behavior
- Ctrl+Alt+0 closes every Specialist Management report parchment and returns to the main Specialist Management menu after the parchment is closed.
- Reports no longer create hidden Governor/Decision return helpers. This prevents return icons from accumulating.
- Ctrl+Alt+1..9 report jumps close the parchment and jump directly to the selected target.
- Relevant Specialists uses the proven picker-only behavior: open a specialist slot selection first, then press Ctrl+Alt+I to toggle relevant specialists.


### Patch 2 Test7
Every Specialist Management report displays `CTRL+ALT+0` at the top as the universal Back to Specialist Management shortcut. In a Governor Villa, Guest House, or Officium, pressing `Ctrl+Alt+I` before opening a specialist slot arms Relevant Specialists; when the slot candidate list appears, the filter applies automatically. Press `Ctrl+Alt+I` again to restore all candidates.


## Test8 compatibility note
Relevant Specialists / Governor Villa specialist selection behavior is restored to the proven v1.0.8 implementation. Open a specialist slot selection, then press Ctrl+Alt+I to toggle Relevant Specialists. No host-arm or expanded popup-discovery experiment remains.
