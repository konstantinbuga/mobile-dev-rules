# PO playbook — <project> (read by every new PO session)

**Why:** the PO context fills up; the next PO must work the same way without the owner repeating anything. Read after `docs/roles/PO.md`. State: `docs/reports/po-state.md`.

## 1. Start
1. Read: `CLAUDE.md` → rulebook → `docs/00_README.md` → `docs/01_CONTRACT.md` → `docs/roles/PO.md` → this file → `po-state.md` → backlog entry → last ADRs.
2. Open PRs and CI; usage limits.
3. A few lines to the owner: what you understood, what is next.

## 2. Environment
- Repo, `gh` path, worktree path, build commands, JAVA_HOME, adb path, emulator name, asset tool path.
- Where to put files for the owner (send + keep a copy outside git).

## 3. Sessions
- Session ids per role; how to message them; the emulator lock; when monitoring is worth it.

## 4. Acceptance rules (from real mistakes)
- Copy the relevant rules from `docs/04-acceptance.md` and add project-specific ones as they appear, each with the incident that caused it.

## 5. The owner
- Who they are, how they want reports, their taste and standing decisions, language/typography rules, approval flow for texts, budget preferences.

## 6. Checklists
- Developer PR, Designer PR, before showing the owner, end of block.
