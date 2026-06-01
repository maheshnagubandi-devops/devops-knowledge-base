#!/usr/bin/env bash
set -euo pipefail

# Script: generate_cheatsheets.sh
# Converts markdown cheatsheets into templated HTML using pandoc + template.
# Usage: ./scripts/generate_cheatsheets.sh [source_dir] [output_dir]

SRC_DIR=${1:-.}
OUT_DIR=${2:-site}
TEMPLATE="docs/cheatsheet-template.html"

if ! command -v pandoc >/dev/null 2>&1; then
  echo "pandoc is required. Install it or ensure it's on PATH." >&2
  exit 1
fi

mkdir -p "$OUT_DIR"

for md in $(find "$SRC_DIR" -maxdepth 2 -name "cheat-sheet.md" -o -name "*-cheatsheet.md" -o -name "cheat-sheet*.md" 2>/dev/null); do
  rel_dir=$(dirname "$md")
  out_subdir="$OUT_DIR/$rel_dir"
  mkdir -p "$out_subdir"

  title=$(head -n1 "$md" | sed 's/^#* //')
  subtitle="Cheatsheet"

  # Convert markdown to HTML fragment
  content=$(pandoc "$md" -f markdown -t html)

  # Inject into template
  out_file="$out_subdir/$(basename "$md" .md).html"
  # NEVER overwrite existing HTML: skip generation if output already exists (preserve handcrafted files)
  if [ -f "$out_file" ]; then
    echo "Skipping (exists): $out_file"
    continue
  fi

  awk -v t="$title" -v s="$subtitle" -v c="$content" '{gsub("{TITLE}",t); gsub("{SUBTITLE}",s); gsub("{CONTENT}",c); print}' "$TEMPLATE" > "$out_file"
  echo "Generated: $out_file"
done

echo "All cheatsheets generated under $OUT_DIR"
