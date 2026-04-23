# Skill Masters

A collection of coaching personas based on high-impact entrepreneurs and methodologies. Each skill activates a specialized advisor with real frameworks, authentic style, and actionable responses.

---

## Available Skills

| Slug | Persona | Main Area |
|------|---------|-----------|
| `alex-hormozi` | Alex Hormozi | Grand Slam Offers, $100M Leads, pricing, scaling |
| `dan-martel` | Dan Martel | Buy Back Your Time, SaaS, AI tools |
| `iman-gadzhi` | Iman Gadzhi | SMMA, agency building, Gen Z wealth |
| `jaime-higuera` | Jaime Higuera | Online business in Spanish, financial freedom |
| `russell-brunson` | Russell Brunson | Funnels, Value Ladder, ClickFunnels |
| `ycombinator` | YC Partner | Startup validation, PMF, fundraising |

---

## Project Structure

```
skill-masters/
├── skills/                          ← master skill definitions
│   ├── alex-hormozi/SKILL.md
│   ├── dan-martel/SKILL.md
│   ├── iman-gadzhi/SKILL.md
│   ├── jaime-higuera/SKILL.md
│   ├── russell-brunson/SKILL.md
│   └── ycombinator/SKILL.md
├── integrations/
│   ├── antigravity/                 ← Antigravity / Gemini (agency- prefix)
│   │   ├── README.md
│   │   ├── agency-alex-hormozi/SKILL.md
│   │   ├── agency-dan-martel/SKILL.md
│   │   ├── agency-iman-gadzhi/SKILL.md
│   │   ├── agency-jaime-higuera/SKILL.md
│   │   ├── agency-russell-brunson/SKILL.md
│   │   └── agency-ycombinator/SKILL.md
│   └── openai-gpts/                 ← OpenAI Custom GPTs
│       ├── README.md
│       ├── alex-hormozi/
│       │   ├── instructions.md      ← paste into GPT Builder → Instructions
│       │   └── config.json          ← name, description, conversation starters
│       ├── dan-martel/
│       ├── iman-gadzhi/
│       ├── jaime-higuera/
│       ├── russell-brunson/
│       └── ycombinator/
├── scripts/
│   ├── install.sh                   ← installs Antigravity to ~/.gemini/antigravity/skills/
│   ├── convert.sh                   ← regenerates integrations/antigravity/ from skills/
│   └── convert-gpts.sh              ← regenerates integrations/openai-gpts/ from skills/
└── .claude/
    └── commands/                    ← slash commands for Claude Code
        ├── alex-hormozi.md
        ├── dan-martel.md
        ├── iman-gadzhi.md
        ├── jaime-higuera.md
        ├── russell-brunson.md
        └── ycombinator.md
```

---

## Installation

### Claude Code

Slash commands are in `.claude/commands/` and work automatically within the project. To install the skills globally to `~/.claude/skills/`:

```bash
for dir in skills/*/; do
  skill=$(basename "$dir")
  mkdir -p ~/.claude/skills/$skill
  cp "$dir/SKILL.md" ~/.claude/skills/$skill/SKILL.md
done
```

### Antigravity (Gemini)

```bash
./scripts/install.sh
```

Copies all files to `~/.gemini/antigravity/skills/`.

After modifying a skill:

```bash
./scripts/convert.sh   # regenerates integrations/antigravity/
./scripts/install.sh   # deploys to ~/.gemini/antigravity/skills/
```

### OpenAI GPTs

1. Go to `https://chatgpt.com/gpts/editor` → **Configure** mode
2. Copy `name` and `description` from `config.json`
3. Paste the content of `instructions.md` into the **Instructions** field
4. Add the `conversation_starters` from `config.json`
5. Disable Web Browsing, DALL·E, and Code Interpreter
6. Save

After modifying a skill:

```bash
./scripts/convert-gpts.sh   # regenerates integrations/openai-gpts/
```

See details in [integrations/openai-gpts/README.md](integrations/openai-gpts/README.md).

---

## Usage

### Claude Code — slash commands

```
/alex-hormozi my close rate is 10%, what should I do?
/dan-martel I'm working 70 hours a week
/iman-gadzhi how do I get my first agency client?
/jaime-higuera I want to generate income with AI from scratch
/russell-brunson design a funnel for my $997 course
/ycombinator I have a SaaS idea, how do I validate it?
```

### Antigravity

```
Use the agency-alex-hormozi skill to review my offer.
Use the agency-ycombinator skill to evaluate my startup idea.
Use the agency-russell-brunson skill to design my sales funnel.
```

---

## Response Format

All skills follow the same pattern:

```
1. Diagnostic question — calibrates context before giving advice
   ↓
2. [Topic]: The Advisor's Take
   - The real problem in 1 line
   - What they would do (3 specific steps + tools + timeline)
   - The most common trap to avoid
   - The one number to track
```

---

## Adding a New Skill

1. Create the master definition:

```bash
mkdir -p skills/new-advisor
```

Write `skills/new-advisor/SKILL.md`:

```yaml
---
name: new-advisor
description: Brief description. Activates when...
metadata:
  version: 1.0.0
---

# New Advisor
...
```

2. Create the slash command in `.claude/commands/new-advisor.md`:

```
Activates the New Advisor skill. [style and area description]

$ARGUMENTS
```

3. Regenerate all integrations:

```bash
./scripts/convert.sh       # Antigravity
./scripts/convert-gpts.sh  # OpenAI GPTs
./scripts/install.sh       # install locally
```

4. Push to the repo:

```bash
git add . && git commit -m "Add new-advisor skill" && git push
```
