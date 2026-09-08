# Beyblade X encyclopedia

Slice repo for structured Beyblade X parts with source links.

This is **not** a complete catalog of every blade, ratchet, bit, or lock chip. Entries are added in sourced slices.

## Data

Parts live in [`data/parts.json`](data/parts.json) as a JSON **array**.

Verify locally (requires [`jq`](https://jqlang.github.io/jq/)):

```bash
./scripts/verify.sh
```

The script checks: valid JSON array, **≥20** entries, unique `id`s, required keys, and **≥1 `http(s)` source URL** per entry.

## Schema

Each object:

| Field | Type | Notes |
| --- | --- | --- |
| `id` | string | Unique kebab-case slug |
| `name` | string | English display name (Takara Tomy romanization preferred; Hasbro names go in `notes` when they differ) |
| `name_ja` | string | Japanese name from an official page, or `"unknown"` |
| `part_type` | string | `blade` \| `ratchet` \| `bit` \| `lock_chip` \| `other` |
| `generation` | string | Always `"Beyblade X"` in this slice |
| `product_code` | string | First Takara Tomy product code that includes the part (e.g. `BX-14`), or `"unknown"` |
| `type` | string | `attack` \| `defense` \| `stamina` \| `balance` \| `unknown` |
| `notes` | string | Sourced facts only; no invented stats |
| `sources` | array | At least one `{ "url", "label", "kind" }` |

Source object:

| Field | Type | Notes |
| --- | --- | --- |
| `url` | string | Citation URL |
| `label` | string | Short human label |
| `kind` | string | `official` \| `wiki` \| `other` |

Prefer **primary sources** (Takara Tomy / Bandai / Hasbro). Wikis are secondary and must use `"kind": "wiki"`. Unknown measurements or type badges are `"unknown"` — do not invent specs (weights, ATK/DEF numbers, unofficial bit expansions).

Official reminder: Takara Tomy’s beginner guide states Beyblade **type is determined by the Bit**. Blade `type` in this file is only set when product copy or a Hasbro type line supports it; otherwise `"unknown"`.

## Coverage (slice 1)

Starter set of X-generation parts from Basic / Unique / Custom Line starters and boosters (not Random Boosters).

- **Blades** — launch Basic Line (BX-01–BX-04 and later BX starters/boosters) plus Unique Line UX-01–UX-03
- **Ratchets** — `3-60`, `4-60`, `4-80`, `3-80`, `5-60`, `9-60`, `1-60`
- **Bits** — `F` Flat, `T` Taper, `B` Ball, `N` Needle, `P` Point (official expansions only)
- **Lock chips** — Custom Line `Dran`, `Wizard`, `Perseus` (CX CUP list + CX-01–CX-03)
- **Other** — Custom Line assist blade `S` (Slash)

## Coverage (slice 2 — Random Booster)

Adds **parts that debut on Takara Tomy Random Booster products** (numbered Vol. packs, Select packs, and BX-00 Lightning L-Drago). Existing slice 1 rows are kept; new rows use new `id`s.

- **Blades** — prize / featured blades named on official booster pages: Shark Edge (BX-14 Vol.1), Viper Tail (BX-16 Select), Wyvern Gale (BX-24 Vol.2), Sphinx Cowl (BX-27 Select), Tyranno Beat (BX-31 Vol.3), Shinobi Shadow (UX-05 Select), Black Shell (BX-35 Vol.4), Lightning L-Drago (BX-00), Whale Wave (BX-36 Select), Ghost Circle (UX-12 Vol.5), Shelter Drake (BX-39 Select), Clock Mirage (UX-16 Select), Heavens Ring (BX-50 Vol.11), Unicorn Delta (CX-17 Vol.10 over-blade)
- **Ratchets** — `5-80`, `9-80`, `4-70`, `1-80`, `0-80` as printed in those prize combos
- **Bits** — `GB` Gear Ball (official campaign expansion; first listed on BX-24)
- **Lock chips** — Custom Line `Hells`, `Fox`, `Cerberus` (CX CUP list + CX-05 / CX-06 / CX-08 random boosters)
- **Other** — Custom Line assist blade `T` (Turn) from CX-05 prize naming

Sources: Takara Tomy lineup / product pages and manuals first; Hasbro shop URLs only as English-name cross-refs when the slug matches. Bit letters without an official Japanese expansion are **not** added. No wiki-invented stats.

## Coverage (slice 3 — Unique Line / UX)

Adds **parts that debut or belong on Takara Tomy Unique Line (UX-##) packs** after the UX-01–UX-03 / UX-05 / UX-12 / UX-16 rows already in slices 1–2. Existing rows are kept; new rows use new `id`s.

- **Blades** — Unique Line starters, boosters, sets, and UX random-booster prizes named on official pages: Leon Crest (UX-06), Phoenix Rudder (UX-07), Silver Wolf (UX-08), Samurai Saber (UX-09), Knight Mail and Ptera Swing (UX-10), Impact Drake (UX-11), Golem Rock (UX-13), Scorpio Spear (UX-14), Shark Scale (UX-15), Meteor Dragoon (UX-17), Mummy Curse (UX-18 Vol.8), Bullet Griffon (UX-19 Expand Blade), Glory Valkyrie (UX-20 Expand Blade), Hells Nether (UX-21 Expand Blade), Aero Pegasus (UX-00)
- **Ratchets** — `3-70`, `5-70`, `7-60`, `9-70`, `2-70`, `3-85`, `7-70`, `0-70`, `4-50`, `9-65`, `7-55` as printed in those UX combos / the UX-10 manual
- **Bits** — `W` Wedge (official campaign expansion; first listed on UX-18)

Sources: Takara Tomy Unique Line / Expand Blade lineup, product, and manual pages first; Hasbro shop URLs only as English-name cross-refs when the slug matches. Bit letters without an official Japanese expansion are **not** added. No wiki-invented stats.

## Coverage (slice 4 — Custom Line starters + remaining CX Select-pack blades)

Adds **Custom Line starter/booster main blades and remaining CX Select-pack blades** after the CX lock chips / assist S and T / Unicorn Delta rows already in slices 1–2. Existing rows are kept; new rows use new `id`s.

- **Blades** — Custom Line main blades named on the official CX CUP list and product pages: Brave (CX-01), Arc (CX-02), Dark (CX-03), Blast (CX-07), Eclipse (CX-09), Hunt (CX-10), Brush (CX-06 Fox Brush Select); plus Select-pack featured blades Brachio Whip (CX-18) and Croco Tread (CX-19)
- **Lock chips** — Custom Line `Pegasus`, `Sol`, `Wolf` (CX CUP list + CX-07 / CX-09 / CX-10)
- **Other** — Custom Line assist blades `R` (Round), `B` (Bumper), `J` (Jaggy), `A` (Assault), `D` (Dual), `F` (Free)
- **Ratchets** — `6-60`, `4-55`, `6-80`, `0-60`, `5-50` as printed in those CX combos
- **Bits** — `V` Vortex (official campaign expansion; first listed on CX-01)

Sources: Takara Tomy Custom Line lineup / product pages and the CX CUP parts list first; Plus One Bit campaign pages for official bit-letter expansions. Bit letters without an official Japanese expansion (e.g. LO, Tr, TK, GR, Nr) are **not** added. No wiki-invented stats.

## How to extend

1. Add an object to `data/parts.json` (keep `id` unique; do not overwrite existing rows).
2. Cite at least one URL. Prefer:
   - [Takara Tomy lineup](https://beyblade.takaratomy.co.jp/beyblade-x/lineup/) (filter **カスタムライン** / **ユニークライン** / **ランダムブースター**)
   - [Takara Tomy manuals](https://beyblade.takaratomy.co.jp/beyblade-x/manual/)
   - [Takara Tomy Gear Structure](https://beyblade.takaratomy.co.jp/gear/)
   - [Takara Tomy CX CUP parts list](https://beyblade.takaratomy.co.jp/beyblade-x/event/g2_cxcup2026_list.html) for Custom Line lock / main / assist / over-blade letters
   - [Hasbro shop](https://shop.hasbro.com/)
3. If a Japanese name, product code, or type is not on those pages, store `"unknown"`.
4. Run `./scripts/verify.sh`.

## Next slice

Still out of catalog: later Custom Line packs (CX-11 Emperor Might through CX-16 Start Dash Set C), remaining CX CUP lock chips / main blades / metal blades (Fortress, Blitz, Rage) / over-blade letters (B Break, F Flow, G Guard) / assist letters, later BX starters, launchers, and stadiums. A natural follow-up is **later Custom Line packs (CX-11–CX-16) plus remaining CX CUP metal and over-blade letters** with the same sourced-only rules.
