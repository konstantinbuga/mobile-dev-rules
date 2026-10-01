# <Project> — how the work is organised

**Product:** <one paragraph>. **Stack:** <…>. **Design:** <tool>. **Owner:** <name, expertise>.

## 1. Documents and reading order

| File | Contents | Who reads |
|---|---|---|
| `CLAUDE.md` | Short rules for every session | everyone (auto) |
| rulebook `mobile-dev-rules` | General roles, workflow, acceptance, QA, lessons | everyone |
| `docs/00_README.md` | Project roles and specifics | everyone |
| `docs/01_CONTRACT.md` | IDs, files, tokens, mandatory rules | everyone |
| `docs/02_<REFERENCE>.md` | Domain sources, parameters, traps, assumptions, MVP scope | PO, Developer, QA |
| `docs/03_GUIDELINES.md` | Stack guidelines (or link to the profile) | Developer, QA |
| `docs/MECHANICS.md` | Mechanics in plain language | owner, PO |
| `docs/roles/*.md` | Project role pages | each role |
| `docs/decisions/ADR-*.md` | Owner decisions | everyone |
| `docs/backlog/T-*.md` | Tasks | everyone |

## 2. Roles
Table: role, model, owns, never does, writes to, MCP (see the rulebook `docs/01-roles.md`).

## 3. Milestones
M1 … · M2 … · release criteria.

## 4. Session rules
Max parallel sessions, limits, kick-off prompt, one role per session, open questions → owner → ADR.
