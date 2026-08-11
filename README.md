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
  - picker closed: open **Specialist Management**
- **Ctrl+Alt+1 ... 9** — jump to the corresponding numbered report entry when supported
- **Ctrl+Alt+R** — force a new scan of the current province

## Relevant Specialists

With a specialist picker open, Ctrl+Alt+I leaves relevant candidates enabled and disables mapped candidates whose target buildings are not within the selected host's effect radius.

Host radii:
- Guest House / Officium: 24
- Governor Villa: 36

The current target table contains **356 radius-specialist mappings** generated from the base game `assets.xml`. Unknown or newly added specialists stay enabled rather than being incorrectly disabled.

## Provinces

Latium and Albion are scanned and cached separately. Most reports concern the current province. **Empire Overview** summarizes both province caches.

## Installation

Extract the mod folder into an Anno 117 mods folder, for example:

`<Documents>/Anno 117 - Pax Romana/mods/`

Keep the folder containing `modinfo.json` intact.

## Compatibility and limitations

- Anno 117 PC.
- No new game required.
- Multiplayer and Campaign are not declared supported because they have not been release-tested.
- The supplied mod UI text is English.
- The parchment report uses the native TextPopup control; inline bold/italic/color formatting is not currently available.
- After a major game update, new specialists may require regenerating the embedded target mapping from the updated `assets.xml`. Until then, unmapped specialists remain enabled for safety.

## Version

Release: **1.0.0**
