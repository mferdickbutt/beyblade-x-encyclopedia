# Beyblade X encyclopedia

Slice repo for structured Beyblade X parts with source links.

This is **slice 1** for verification: a sourced starter set of X-generation parts, **not** a complete catalog of every blade, ratchet, bit, or lock chip.

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
| `product_code` | string | First Takara Tomy product code that includes the part (e.g. `BX-01`), or `"unknown"` |
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

Counts change as the file grows; run `./scripts/verify.sh` for the live total.

This slice mixes:

- **Blades** — launch Basic Line (BX-01–BX-04 and later BX starters/boosters) plus Unique Line UX-01–UX-03
- **Ratchets** — `3-60`, `4-60`, `4-80`, `3-80`, `5-60`, `9-60`, `1-60`
- **Bits** — `F` Flat, `T` Taper, `B` Ball, `N` Needle, `P` Point (official expansions only)
- **Lock chips** — Custom Line `Dran`, `Wizard`, `Perseus` (CX CUP list + CX-01–CX-03)
- **Other** — Custom Line assist blade `S` (Slash)

Not in this slice: later BX/UX/CX waves, most random-booster parts, over-blades, metal blades, launchers, stadiums.

## How to extend

1. Add an object to `data/parts.json` (keep `id` unique).
2. Cite at least one URL. Prefer:
   - [Takara Tomy lineup](https://beyblade.takaratomy.co.jp/beyblade-x/lineup/)
   - [Takara Tomy manuals](https://beyblade.takaratomy.co.jp/beyblade-x/manual/)
   - [Takara Tomy Gear Structure](https://beyblade.takaratomy.co.jp/gear/)
   - [Hasbro shop](https://shop.hasbro.com/)
3. If a Japanese name, product code, or type is not on those pages, store `"unknown"`.
4. Run `./scripts/verify.sh`.
