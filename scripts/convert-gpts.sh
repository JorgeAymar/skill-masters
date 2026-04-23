#!/bin/bash
# Regenerate OpenAI GPT instructions from skills/

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SKILLS_DIR="$SCRIPT_DIR/skills"
OUT_DIR="$SCRIPT_DIR/integrations/openai-gpts"

echo "Converting skills to OpenAI GPT instructions..."

for skill_dir in "$SKILLS_DIR"/*/; do
  [ -d "$skill_dir" ] || continue
  skill_name=$(basename "$skill_dir")
  src="$skill_dir/SKILL.md"
  [ -f "$src" ] || continue

  out_dir="$OUT_DIR/$skill_name"
  mkdir -p "$out_dir"

  # Extract body after second ---
  awk '/^---/{n++; if(n==2){found=1; next}} found{print}' "$src" \
    | sed '/./,$!d' > "$out_dir/instructions.md"

  echo "  ✓ $skill_name"
done

echo "Done. Paste each instructions.md into the GPT Builder Instructions field."
