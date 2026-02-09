#!/usr/bin/env bash
# Renders all .mmd (Mermaid) files in assets/diagrams/ to PNG.
# Requires: npm install -g @mermaid-js/mermaid-cli
#
# Usage: ./bin/render_mermaid.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
DIAGRAMS_DIR="$PROJECT_ROOT/assets/diagrams"

# Check for mmdc
if ! command -v mmdc &>/dev/null; then
  echo "Error: mmdc (mermaid-cli) not found."
  echo "Install it with: npm install -g @mermaid-js/mermaid-cli"
  exit 1
fi

# Render each .mmd file to PNG
found=0
for mmd_file in "$DIAGRAMS_DIR"/*.mmd; do
  [ -f "$mmd_file" ] || continue
  found=1
  png_file="${mmd_file%.mmd}.png"
  echo "Rendering: $(basename "$mmd_file") -> $(basename "$png_file")"
  mmdc -i "$mmd_file" -o "$png_file" -b white -s 3
done

if [ "$found" -eq 0 ]; then
  echo "No .mmd files found in $DIAGRAMS_DIR"
  exit 1
fi

echo "Done."
