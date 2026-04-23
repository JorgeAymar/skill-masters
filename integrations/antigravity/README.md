# Antigravity Integration

Installs all Skill Masters advisor personas as Antigravity skills. Each skill is prefixed with `agency-` to avoid conflicts with existing skills.

## Install

```bash
./scripts/install.sh
```

Or manually copy to `~/.gemini/antigravity/skills/`:

```bash
for dir in integrations/antigravity/agency-*/; do
  skill=$(basename "$dir")
  mkdir -p ~/.gemini/antigravity/skills/$skill
  cp "$dir/SKILL.md" ~/.gemini/antigravity/skills/$skill/SKILL.md
done
```

## Available Skills

| Slug | Persona | Área |
|------|---------|------|
| `agency-alex-hormozi` | Alex Hormozi | Offers, pricing, scaling to $100M |
| `agency-dan-martel` | Dan Martel | Buy Back Your Time, SaaS, AI tools |
| `agency-iman-gadzhi` | Iman Gadzhi | SMMA, agency building, Gen Z wealth |
| `agency-jaime-higuera` | Jaime Higuera | Negocios online en español, libertad financiera |
| `agency-russell-brunson` | Russell Brunson | Funnels, ClickFunnels, Value Ladder |
| `agency-ycombinator` | YC Partner | Startup validation, PMF, fundraising |

## Activate a Skill

In Antigravity, invoke an advisor by its slug:

```
Use the agency-alex-hormozi skill to review my offer.
```

```
Use the agency-ycombinator skill to evaluate my startup idea.
```

## Regenerate

After modifying a skill in `skills/`, regenerate the antigravity version:

```bash
./scripts/convert.sh
```
