#!/usr/bin/env bash
# Build a self-contained encyclopedia.html from data/parts.json (openable via file://).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PARTS="$ROOT/data/parts.json"
OUT="$ROOT/encyclopedia.html"
TEMPLATE="$ROOT/scripts/encyclopedia.template.html"

if [[ ! -f "$PARTS" ]]; then
  echo "FAIL: missing $PARTS" >&2
  exit 1
fi
if [[ ! -f "$TEMPLATE" ]]; then
  echo "FAIL: missing $TEMPLATE" >&2
  exit 1
fi
if ! command -v python3 >/dev/null 2>&1; then
  echo "FAIL: python3 is required" >&2
  exit 1
fi

python3 - "$PARTS" "$TEMPLATE" "$OUT" <<'PY'
import json
import pathlib
import sys

parts_path, template_path, out_path = map(pathlib.Path, sys.argv[1:4])
parts = json.loads(parts_path.read_text(encoding="utf-8"))
if not isinstance(parts, list):
    raise SystemExit("FAIL: parts.json root must be a JSON array")
payload = json.dumps(parts, ensure_ascii=False, separators=(",", ":"))
template = template_path.read_text(encoding="utf-8")
marker = "/*__PARTS_JSON__*/"
if marker not in template:
    raise SystemExit(f"FAIL: template missing marker {marker}")
# Embed as a JS string literal assigned later via JSON.parse of a script tag is safer;
# replace the marker with the raw JSON expression.
out = template.replace(marker, payload)
out_path.write_text(out, encoding="utf-8")
print(f"Wrote {out_path} ({len(parts)} parts, {out_path.stat().st_size} bytes)")
PY
