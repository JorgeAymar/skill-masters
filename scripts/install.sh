#!/bin/bash
# Install Skill Masters personas to ~/.gemini/antigravity/skills/

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="$HOME/.gemini/antigravity/skills"

echo "Installing Skill Masters to $TARGET..."

for dir in "$SCRIPT_DIR/integrations/antigravity/agency-"/*/; do
  [ -d "$dir" ] || continue
  skill=$(basename "$dir")
  mkdir -p "$TARGET/$skill"
  cp "$dir/SKILL.md" "$TARGET/$skill/SKILL.md"
  echo "  ✓ $skill"
done

echo "Done."
