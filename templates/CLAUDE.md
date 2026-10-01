# <Project name> — rules for every Claude Code session

<One line: what the app is, stack (e.g. Kotlin Multiplatform + Compose Multiplatform, Android now, iOS later), design tool.> Owner: <name, domain expertise> — makes every product decision and approves content.

General rulebook: https://github.com/konstantinbuga/mobile-dev-rules — read `README.md`, `docs/01-roles.md` and `roles/<your role>.md` there first. Project-specific rules below and in `docs/` win over the general rulebook.

## Session role
- **The role is named in the first message:** PO, Designer, Developer or QA. If it is not, ask and do nothing until answered.
- **Read:** `docs/00_README.md` → `docs/01_CONTRACT.md` → `docs/roles/<ROLE>.md`, then references from the role page.
- **Work only within your role** (roles table: `docs/00_README.md`).

## Hard rules
1. The **contract** `docs/01_CONTRACT.md` is binding; on conflict the contract wins; disputes go to the owner.
2. **Domain parameters** only from `docs/02_<REFERENCE>.md`. Content ships only with status `approved`, set by the owner.
3. **Never:** `git push --force`, `git reset --hard` on shared branches, deleting `main`; committing keys or tokens; killing processes by name (only by PID); changing files outside the project folder.
4. **Current library docs** (Context7 MCP) before using any API.
5. **Acceptance** = fresh install on the emulator + green tests. A report is not acceptance.
6. **Small steps.** A short plan and approval before any large change.
7. **The design file** is edited only by the Designer; others read.
8. **At most <2> working sessions at once.** At 80 % of the weekly limit no new tasks start.
9. **Language:** communication and documents — <owner's language>; code, identifiers, commits, branches — English.
10. **No copying** of text or illustrations from sources in `docs/sources/` into the product.

## Commands
- `<build/check commands>`
- `gh pr create`, `gh pr view`, `gh pr merge --squash` (the PO merges).

## MCP in this project
- context7 — library docs; <device MCP> — emulator and phone; <design tool MCP> — Designer writes, others read; <asset tool MCP>.
