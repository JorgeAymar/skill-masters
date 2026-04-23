#!/bin/bash
# Regenerate antigravity SKILL.md files from skills/

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SKILLS_DIR="$SCRIPT_DIR/skills"
OUT_DIR="$SCRIPT_DIR/integrations/antigravity"
DATE=$(date +%Y-%m-%d)

echo "Converting skills to antigravity format..."

for skill_dir in "$SKILLS_DIR"/*/; do
  [ -d "$skill_dir" ] || continue
  skill_name=$(basename "$skill_dir")
  src="$skill_dir/SKILL.md"
  [ -f "$src" ] || continue

  desc=$(grep '^description:' "$src" | head -1 | sed 's/^description: //')
  body=$(awk '/^---/{n++; if(n==2){found=1; next}} found{print}' "$src" | sed '/./,$!d')

  ag_dir="$OUT_DIR/agency-${skill_name}"
  mkdir -p "$ag_dir"

  printf -- "---\nname: agency-%s\ndescription: %s\nrisk: low\nsource: community\ndate_added: '%s'\n---\n\n%s\n" \
    "$skill_name" "$desc" "$DATE" "$body" > "$ag_dir/SKILL.md"

  echo "  ✓ agency-${skill_name}"
done

echo "Done. Run scripts/install.sh to deploy."
