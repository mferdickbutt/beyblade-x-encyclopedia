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

## Coverage (slice 5 — later Custom Line packs / CX CUP metal and over-blade letters)

Adds **later Custom Line packs CX-11–CX-16**, remaining **CX CUP metal blades / main blades / lock chips / over-blade letters / assist letters**, and still-missing CX random-booster Custom Line parts after slices 1–4. Existing rows are kept; new rows use new `id`s.

- **Main blades** — Might (CX-11), Flare (CX-12), Reaper (CX-05 Hells Reaper), Flame (CX-08 Cerberus Flame), Bolt (CX-00 Valkyrie Bolt), Fang (CX-00 Leon Fang)
- **Metal blades** — Blitz (CX-13), Fortress (CX-14), Rage (CX-15); CX CUP Expand Blade letters listed as 3月28日発売予定
- **Lock chips** — `Emperor` (CX-11), `Phoenix` (CX-12), `Bahamut` (CX-13), `Knight` (CX-14), `Ragna` (CX-15), `Rhino` (CX-05), `Whale` (CX-08), `Valkyrie` (CX-00), `Leon` (CX-00)
- **Other (over-blades)** — `B` (Break), `F` (Flow), `G` (Guard) from CX-13 / CX-15 / CX-14
- **Other (assist blades)** — `H` (Heavy), `Z` (Zillion), `K` (Knuckle), `V` (Vertical), `E` (Erase), `C` (Charge), `M` (Massive), `W` (Wheel)
- **Ratchets** — `1-50`, `8-70` as printed in those CX combos
- **Bits** — `Op` Operate (CX-11 ratchet-integrated; official height correction 防御80/攻撃85), `WW` Wall Wedge (CX-12), `I` Ignition (CX-13), `UN` Under Needle (first listed UX-13; expanded on CX-14 manual), `Y` Yielding (CX-15)
- **CX-16** — Start Dash Set C is a special-color バハムートブリッツBK (same CX-13 Expand Blade letters); no extra unique Custom Line letters beyond CX-13

Sources: Takara Tomy Custom Line / Expand Blade product pages and manuals, the CX CUP parts list, and official news for CX-00 Valkyrie Bolt. Bit letters without an official Japanese expansion printed on those pages (e.g. K, D, O, WB, HT on CX-05 / CX-08) are **not** added. No wiki-invented stats.

## Coverage (slice 6 — remaining Random Booster prize parts)

Adds **still-missing Random Booster / Select / Vol. prize parts** after slices 2–5. Existing rows are kept; new rows use new `id`s. The remaining numbered volume after Vol.5/11 coverage is **BX-48 Vol.9**; later Select/Vol. packs already had their featured blades, but several prize **ratchets** and **bits** were never catalogued because Japanese expansions were not yet cited.

- **Blades** — Mammoth Tusk (first BX-00 app/event マンモスタスク2-80E; reprinted in BX-48 Vol.9)
- **Ratchets** — `7-80` (BX-39 Shelter Drake 7-80GP), `2-80` (first BX-00 Mammoth Tusk 2-80E; also BX-48 Vol.9)
- **Bits** — official Japanese expansions printed on Takara Tomy parts-detail sheets and/or Plus One Bit campaigns, first listed on those booster prize combos: `LF` Low Flat (BX-14), `O` Orb (BX-16), `Q` Quake (BX-31), `D` Dot (BX-35), `E` Elevate (BX-36), `MN` Metal Needle (UX-05), `GN` Gear Needle (BX-27; also CX-19), `GP` Gear Point (first BX-26; also BX-39 7-80GP), `K` Kick (CX-05), `WB` Wall Ball (CX-08), `Nr` Narrow (CX-18), `DS` Disk Spike (BX-50)

Sources: Takara Tomy Random Booster product pages, parts-detail sheets (`detail_*.png` on those pages), manuals, and Plus One Bit campaign pages. Hasbro shop URLs only as English-name cross-refs when the slug matches. Bit letters still without an official Japanese expansion (e.g. HT, GR, GU, LO, TP, LR) are **not** added. No wiki-invented stats.

## Coverage (slice 7 — BX-00 collab remakes)

Adds **BX-00 previous-generation collab blades** named on official Takara Tomy product pages after Lightning L-Drago / Mammoth Tusk (already in slices 2 and 6). Existing rows are kept; new rows use new `id`s.

- **Blades** — Bakuten Shoot / Metal Fight / Burst remakes printed as BX-00 packs: Dranzer Spiral (BX-00 3-80T), Driger Slash (BX-00 4-80P), Draciel Shield (BX-00 7-60D), Xeno Excalibur (BX-00 3-60GF), Rock Leone (BX-00 6-80GN), Dragoon Storm (BX-00 4-60RA), Storm Spriggan (BX-00 2-70M), Storm Pegasus (BX-00 3-70RA)
- **Ratchets / bits** — stock letters on those packs (`3-80`/`T`, `4-80`/`P`, `7-60`/`D`, `3-60`, `6-80`/`GN`, `4-60`, `2-70`, `3-70`) are already in the catalog and are **not** duplicated. Bit letters printed in those product names without an official Japanese expansion on the cited pages (`GF`, `RA`, `M`) are **not** added.

Sources: Takara Tomy BX-00 product pages, manuals (`BX-00_manual.pdf`, `BXG-04` / `BXG-11` / `BXG-13` / `BXG-20` / `BXG-21` / `BXG-22`, `bx00-sp_manual.pdf`), parts-detail sheets, the lineup, and the BX-00 25th anniversary set page for Dragoon Storm / Storm Pegasis. Hasbro X-Over shop URLs only as English-name cross-refs when the slug matches (Dranzer Spiral, Driger Slash). No wiki-invented stats.

## Coverage (slice 8 — later BX starters)

Adds **later Basic Line (BX) starters, boosters, and deck/entry-set blades** after slices 1–7. Existing rows are kept; new rows use new `id`s.

Packs covered:

- **BX-20** Dran Dagger Deck Set (ドランダガー4-60R)
- **BX-21** Hells Chain Deck Set (ヘルズチェイン5-60HT)
- **BX-33** Weiss Tiger 3-60U booster
- **BX-38** Crimson Garuda 4-70TP booster
- **BX-00** Cobalt Drake 4-60F Clear Ver. (also in **BX-46** as 9-60R)
- **BX-44** Tricera Press M-85BS booster
- **BX-45** Samurai Calibur 6-70M booster
- **BX-46** Battle Entry Set Infinity (ゴートタックル7-70T; コバルトドレイク9-60R)
- **BX-49** Dran Strike 4-50FF starter (Basic Line Expand Blade)

- **Blades** — Dran Dagger, Hells Chain, Weiss Tiger, Crimson Garuda, Cobalt Drake, Tricera Press, Samurai Calibur, Goat Tackle, Dran Strike
- **Ratchets** — `M-85`, `6-70` as printed in those BX combos (`3-60`, `4-60`, `5-60`, `4-70`, `7-70`, `9-60`, `4-50` were already in the catalog)
- **Bits** — official Japanese expansions printed on Takara Tomy parts-detail sheets and/or Plus One Bit campaigns, first listed on those packs: `R` Rush (BX-20), `HT` High Taper (BX-21), `U` Unite (BX-33), `TP` Trans Point (BX-38), `BS` Bound Spike (BX-44), `M` Merge (BX-45), `FF` Free Flat (BX-49)

Sources: Takara Tomy Basic Line / Expand Blade product pages, manuals, parts-detail sheets (`detail_*.png` on those pages), and the Plus One Bit campaign page for U/ユナイト. Hasbro shop URLs only as English-name cross-refs when the slug matches (Pearl Tiger, Scarlet Garuda, Dagger Dran, Chain Incendio). Bit letters still without an official Japanese expansion on the cited pages (e.g. GF, RA, C, S, HN) are **not** added. No wiki-invented stats.

## How to extend

1. Add an object to `data/parts.json` (keep `id` unique; do not overwrite existing rows).
2. Cite at least one URL. Prefer:
   - [Takara Tomy lineup](https://beyblade.takaratomy.co.jp/beyblade-x/lineup/) (filter **カスタムライン** / **ユニークライン** / **ランダムブースター**)
   - [Takara Tomy manuals](https://beyblade.takaratomy.co.jp/beyblade-x/manual/)
   - [Takara Tomy Gear Structure](https://beyblade.takaratomy.co.jp/gear/)
   - [Takara Tomy CX CUP parts list](https://beyblade.takaratomy.co.jp/beyblade-x/event/g2_cxcup2026_list.html) for Custom Line lock / main / metal / assist / over-blade letters
   - [Hasbro shop](https://shop.hasbro.com/)
3. If a Japanese name, product code, or type is not on those pages, store `"unknown"`.
4. Run `./scripts/verify.sh`.

## Next slice

Still out of catalog: launchers and stadiums (e.g. BX-10 Extreme Stadium, BX-18 String Launcher, BX-32 Wide Extreme Stadium, BX-40 Winder Launcher L), remaining BX-00 IP collabs (Marvel / Star Wars / Transformers / Jurassic World), remaining BX-00 blades that are only named inside sets rather than as standalone packs (e.g. Victory Valkyrie on the 25th anniversary set), remaining CX-00 Custom Line collabs that are not on the current CX CUP list (e.g. Tiga Rage, Eva deck, Drake Brave), and bit letters that still lack an official Japanese expansion (e.g. GF, RA, C, S, HN). A natural follow-up is **launchers / stadiums** or **remaining CX-00 / IP collabs** with the same sourced-only rules.
