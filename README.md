# Skill Masters

Colección de personas de coaching basadas en emprendedores y metodologías de alto impacto. Cada skill activa un advisor especializado con frameworks reales, estilo auténtico y respuestas accionables.

---

## Skills disponibles

| Slug | Persona | Área principal | Fuente |
|------|---------|---------------|--------|
| `alex-hormozi` | Alex Hormozi | Grand Slam Offers, $100M Leads, scaling | 4,880 videos YT |
| `dan-martel` | Dan Martel | Buy Back Your Time, SaaS, AI tools | 724 videos YT |
| `iman-gadzhi` | Iman Gadzhi | SMMA, agency building, Gen Z wealth | videos YT |
| `jaime-higuera` | Jaime Higuera | Negocios online en español, libertad financiera | videos YT |
| `russell-brunson` | Russell Brunson | Funnels, Value Ladder, ClickFunnels | videos YT |
| `ycombinator` | YC Partner | Startup validation, PMF, fundraising | 594 videos YT |

---

## Estructura del proyecto

```
skill-masters/
├── skills/                        ← definiciones de cada skill
│   ├── alex-hormozi/SKILL.md
│   ├── dan-martel/SKILL.md
│   ├── iman-gadzhi/SKILL.md
│   ├── jaime-higuera/SKILL.md
│   ├── russell-brunson/SKILL.md
│   └── ycombinator/SKILL.md
├── integrations/
│   └── antigravity/               ← versiones compatibles con Antigravity
│       ├── README.md
│       ├── agency-alex-hormozi/SKILL.md
│       ├── agency-dan-martel/SKILL.md
│       ├── agency-iman-gadzhi/SKILL.md
│       ├── agency-jaime-higuera/SKILL.md
│       ├── agency-russell-brunson/SKILL.md
│       └── agency-ycombinator/SKILL.md
├── scripts/
│   ├── install.sh                 ← instala en ~/.gemini/antigravity/skills/
│   └── convert.sh                 ← regenera integrations/ desde skills/
├── .claude/commands/              ← slash commands para Claude Code
└── *.txt                          ← fuentes de video por persona
```

---

## Instalación

### Claude Code (slash commands)

Los skills funcionan automáticamente en Claude Code. Los slash commands del proyecto están en `.claude/commands/`:

```
/dan-martel
/russell-brunson
/iman-gadzhi
/jaime-higuera
```

Para instalar los skills globalmente en `~/.claude/skills/`:

```bash
for dir in skills/*/; do
  skill=$(basename "$dir")
  mkdir -p ~/.claude/skills/$skill
  cp "$dir/SKILL.md" ~/.claude/skills/$skill/SKILL.md
done
```

### Antigravity (Gemini)

Los skills están adaptados con frontmatter compatible con Antigravity en `integrations/antigravity/`.

**Instalación rápida:**

```bash
./scripts/install.sh
```

Esto copia todos los archivos a `~/.gemini/antigravity/skills/`.

**Reinstalar después de cambios:**

```bash
./scripts/convert.sh   # regenera integrations/ desde skills/
./scripts/install.sh   # copia a ~/.gemini/antigravity/skills/
```

---

## Uso

### En Claude Code

Activa cualquier skill con su slash command:

```
/alex-hormozi mi close rate es del 10%, qué hago?
/ycombinator tengo una idea de SaaS, ¿cómo la valido?
```

O simplemente describe tu problema — Claude detecta el contexto:

```
"quiero hacer una grand slam offer para mi agencia"
"cómo consigo mis primeros 10 usuarios"
"necesito buy back my time, trabajo 70 horas a la semana"
```

### En Antigravity

Activa por slug con prefijo `agency-`:

```
Use the agency-alex-hormozi skill to review my offer.
Use the agency-ycombinator skill to evaluate my startup idea.
Use the agency-russell-brunson skill to design my sales funnel.
```

---

## Formato de respuesta de cada skill

Todos los skills siguen el mismo patrón:

```
1. Pregunta diagnóstica (calibra el contexto antes de dar consejo)
   ↓
2. [Tema]: El Take del Advisor
   - El problema real en 1 línea
   - Qué haría (3 pasos específicos + herramientas + timeline)
   - La trampa más común a evitar
   - El único número a trackear
```

---

## Agregar un nuevo skill

1. Crea la carpeta y el archivo:

```bash
mkdir -p skills/nuevo-advisor
```

2. Escribe `skills/nuevo-advisor/SKILL.md` con el frontmatter:

```yaml
---
name: nuevo-advisor
description: Descripción breve. Activa cuando...
metadata:
  version: 1.0.0
---
```

3. Regenera la versión antigravity e instala:

```bash
./scripts/convert.sh
./scripts/install.sh
```

4. Sube al repo:

```bash
git add . && git commit -m "Add nuevo-advisor skill"
git push
```
