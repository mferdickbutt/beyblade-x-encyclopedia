#!/usr/bin/env bash
# Verify data/parts.json: >=20 entries and every entry has >=1 http(s) source URL.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
FILE="${1:-$ROOT/data/parts.json}"

if ! command -v jq >/dev/null 2>&1; then
  echo "FAIL: jq is required" >&2
  exit 1
fi

if [[ ! -f "$FILE" ]]; then
  echo "FAIL: missing $FILE" >&2
  exit 1
fi

if ! jq empty "$FILE" 2>/dev/null; then
  echo "FAIL: $FILE is not valid JSON" >&2
  exit 1
fi

if [[ "$(jq -r 'type' "$FILE")" != "array" ]]; then
  echo "FAIL: root must be a JSON array" >&2
  exit 1
fi

count="$(jq 'length' "$FILE")"
echo "entry_count=${count}"

if [[ "$count" -lt 20 ]]; then
  echo "FAIL: need >= 20 entries, found ${count}" >&2
  exit 1
fi

missing_fields="$(jq -r '
  def required: ["id","name","name_ja","part_type","generation","product_code","type","notes","sources"];
  .[]
  | . as $e
  | select(any(required[]; $e[.] == null))
  | $e.id // "<missing id>"
' "$FILE")"
if [[ -n "$missing_fields" ]]; then
  echo "FAIL: entries missing required keys:" >&2
  echo "$missing_fields" >&2
  exit 1
fi

dupes="$(jq -r '.[].id' "$FILE" | sort | uniq -d)"
if [[ -n "$dupes" ]]; then
  echo "FAIL: duplicate ids:" >&2
  echo "$dupes" >&2
  exit 1
fi

missing_urls="$(jq -r '
  .[]
  | select(
      ([.sources[]? | .url | select(type == "string" and test("^https?://"))] | length) < 1
    )
  | .id
' "$FILE")"
if [[ -n "$missing_urls" ]]; then
  echo "FAIL: entries missing >=1 source URL:" >&2
  echo "$missing_urls" >&2
  exit 1
fi

echo "part_type_counts:"
jq -r '[.[].part_type] | group_by(.) | map({(.[0]): length}) | add' "$FILE"

echo "OK: ${count} entries, all have >=1 source URL"
