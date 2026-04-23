# OpenAI GPTs Integration

Crea un Custom GPT en ChatGPT para cada advisor persona. Cada skill incluye:

- `instructions.md` — El system prompt completo (pegar en el campo **Instructions**)
- `config.json` — Nombre, descripción y conversation starters

## GPTs disponibles

| Carpeta | Nombre del GPT | Área |
|---------|---------------|------|
| `alex-hormozi/` | Alex Hormozi Advisor | Grand Slam Offers, pricing, scaling |
| `dan-martel/` | Dan Martel Advisor | Buy Back Your Time, SaaS, AI tools |
| `iman-gadzhi/` | Iman Gadzhi Advisor | SMMA, agency building, disciplina |
| `jaime-higuera/` | Jaime Higuera Advisor | Negocios online en español, libertad financiera |
| `russell-brunson/` | Russell Brunson Advisor | Funnels, Value Ladder, Perfect Webinar |
| `ycombinator/` | YC Partner Advisor | Startup validation, PMF, fundraising |

---

## Cómo crear un GPT

### 1. Ir al GPT Builder

En ChatGPT (plan Plus o Team): **Explore GPTs → Create → Configure**

O ir directamente a: `https://chatgpt.com/gpts/editor`

### 2. Configurar cada campo

| Campo GPT Builder | Fuente |
|------------------|--------|
| **Name** | Campo `name` en `config.json` |
| **Description** | Campo `description` en `config.json` |
| **Instructions** | Contenido completo de `instructions.md` |
| **Conversation starters** | Array `conversation_starters` en `config.json` |

### 3. Configuración recomendada

- **Web Browsing**: Off (el advisor responde desde su conocimiento, no busca en Google)
- **DALL·E Image Generation**: Off
- **Code Interpreter**: Off
- **Visibility**: Anyone with a link (o Private si es solo para ti)

### 4. Guardar y probar

Prueba con el primer conversation starter. El GPT debe responder con la pregunta diagnóstica del advisor antes de dar consejo.

---

## Ejemplo — Alex Hormozi Advisor

**Name:** `Alex Hormozi Advisor`

**Description:** `Get brutally honest business advice in the style of Alex Hormozi — Grand Slam Offers, $100M Leads, pricing, and scaling. Expect the math, not the fluff.`

**Instructions:** *(pegar el contenido de `alex-hormozi/instructions.md`)*

**Conversation starters:**
```
Review my offer and tell me why it's not converting
How do I build a Grand Slam Offer for my service business?
My close rate is 10% — what's wrong with my pitch?
How do I get from $10K/month to $100K/month?
```

---

## Actualizar un GPT

Cuando el skill base cambia en `skills/`, regenera las instructions:

```bash
./scripts/convert-gpts.sh
```

Luego pega el nuevo `instructions.md` en el GPT Builder → **Update**.
