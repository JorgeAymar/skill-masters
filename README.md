# Skill Masters

Colección de personas de coaching basadas en emprendedores y metodologías de alto impacto. Cada skill activa un advisor especializado con frameworks reales, estilo auténtico y respuestas accionables.

---

## Skills disponibles

| Slug | Persona | Área principal |
|------|---------|----------------|
| `alex-hormozi` | Alex Hormozi | Grand Slam Offers, $100M Leads, pricing, scaling |
| `dan-martel` | Dan Martel | Buy Back Your Time, SaaS, AI tools |
| `iman-gadzhi` | Iman Gadzhi | SMMA, agency building, Gen Z wealth |
| `jaime-higuera` | Jaime Higuera | Negocios online en español, libertad financiera |
| `russell-brunson` | Russell Brunson | Funnels, Value Ladder, ClickFunnels |
| `ycombinator` | YC Partner | Startup validation, PMF, fundraising |

---

## Estructura del proyecto

```
skill-masters/
├── skills/                          ← definiciones maestras de cada skill
│   ├── alex-hormozi/SKILL.md
│   ├── dan-martel/SKILL.md
│   ├── iman-gadzhi/SKILL.md
│   ├── jaime-higuera/SKILL.md
│   ├── russell-brunson/SKILL.md
│   └── ycombinator/SKILL.md
├── integrations/
│   ├── antigravity/                 ← Antigravity / Gemini (prefijo agency-)
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
│       │   ├── instructions.md      ← pegar en GPT Builder → Instructions
│       │   └── config.json          ← nombre, descripción, conversation starters
│       ├── dan-martel/
│       ├── iman-gadzhi/
│       ├── jaime-higuera/
│       ├── russell-brunson/
│       └── ycombinator/
├── scripts/
│   ├── install.sh                   ← instala Antigravity en ~/.gemini/antigravity/skills/
│   ├── convert.sh                   ← regenera integrations/antigravity/ desde skills/
│   └── convert-gpts.sh              ← regenera integrations/openai-gpts/ desde skills/
└── .claude/
    └── commands/                    ← slash commands para Claude Code
        ├── alex-hormozi.md
        ├── dan-martel.md
        ├── iman-gadzhi.md
        ├── jaime-higuera.md
        ├── russell-brunson.md
        └── ycombinator.md
```

---

## Instalación

### Claude Code

Los slash commands están en `.claude/commands/` y funcionan automáticamente dentro del proyecto. Para instalar los skills globalmente en `~/.claude/skills/`:

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

Copia todos los archivos a `~/.gemini/antigravity/skills/`.

Después de modificar un skill:

```bash
./scripts/convert.sh   # regenera integrations/antigravity/
./scripts/install.sh   # despliega a ~/.gemini/antigravity/skills/
```

### OpenAI GPTs

1. Ir a `https://chatgpt.com/gpts/editor` → modo **Configure**
2. Copiar `name` y `description` de `config.json`
3. Pegar el contenido de `instructions.md` en el campo **Instructions**
4. Agregar los `conversation_starters` del `config.json`
5. Desactivar Web Browsing, DALL·E y Code Interpreter
6. Guardar

Después de modificar un skill:

```bash
./scripts/convert-gpts.sh   # regenera integrations/openai-gpts/
```

Ver detalles en [integrations/openai-gpts/README.md](integrations/openai-gpts/README.md).

---

## Uso

### Claude Code — slash commands

```
/alex-hormozi mi close rate es del 10%, qué hago?
/dan-martel estoy trabajando 70 horas a la semana
/iman-gadzhi cómo consigo mi primer cliente de agencia
/jaime-higuera quiero generar ingresos con IA desde cero
/russell-brunson diseña un funnel para mi curso de $997
/ycombinator tengo una idea de SaaS, cómo la valido?
```

### Antigravity

```
Use the agency-alex-hormozi skill to review my offer.
Use the agency-ycombinator skill to evaluate my startup idea.
Use the agency-russell-brunson skill to design my sales funnel.
```

---

## Formato de respuesta

Todos los skills siguen el mismo patrón:

```
1. Pregunta diagnóstica — calibra el contexto antes de dar consejo
   ↓
2. [Tema]: El Take del Advisor
   - El problema real en 1 línea
   - Qué haría (3 pasos específicos + herramientas + timeline)
   - La trampa más común a evitar
   - El único número a trackear
```

---

## Agregar un nuevo skill

1. Crear la definición maestra:

```bash
mkdir -p skills/nuevo-advisor
```

Escribir `skills/nuevo-advisor/SKILL.md`:

```yaml
---
name: nuevo-advisor
description: Descripción breve. Activa cuando...
metadata:
  version: 1.0.0
---

# Nuevo Advisor
...
```

2. Crear el slash command en `.claude/commands/nuevo-advisor.md`:

```
Activa el skill de Nuevo Advisor. [descripción del estilo y áreas]

$ARGUMENTS
```

3. Regenerar todas las integraciones:

```bash
./scripts/convert.sh       # Antigravity
./scripts/convert-gpts.sh  # OpenAI GPTs
./scripts/install.sh       # instalar localmente
```

4. Subir al repo:

```bash
git add . && git commit -m "Add nuevo-advisor skill" && git push
```
