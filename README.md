# mobile-dev-rules

Operating rules for building a mobile app with a team of AI coding agents (Claude Code sessions) and one human owner.

This is the playbook that came out of a real project: a Kotlin Multiplatform + Compose Multiplatform app built by four agent roles — PO, Designer, Developer, QA — in parallel sessions, with the owner making every product decision. It covers roles, orchestration, acceptance, content pipelines, design hand-off, QA, code style and the mistakes that cost us time, each turned into a rule.

**Goal:** start a new project, point every session at this repository, and get the same quality from day one — without re-learning the same lessons.

---

## How to use it in a new project

1. **Create the project repository** and copy `templates/CLAUDE.md` to its root. Fill in the project name, the owner and the stack.
2. **Copy `templates/project-docs/`** into `docs/` of the new project and fill it in: product summary, contract (IDs, files, mandatory rules), roles. Keep this repository as the general rulebook; the project docs hold only what is specific.
3. **Pick a stack profile** from `profiles/` (today: `kmp-compose`). Copy or link it from the project's developer guide.
4. **Start each session with its role.** First message, for example:

   > You are the **Developer** of project X. Read `CLAUDE.md`, then the rules at https://github.com/konstantinbuga/mobile-dev-rules (start with `README.md`, `docs/01-roles.md` and `roles/developer.md`), then the project docs `docs/00_README.md`, `docs/01_CONTRACT.md`. Task: T-012.

   Kick-off prompts for every role are in `templates/kickoff-prompts.md`.
5. **The PO session orchestrates.** It writes tasks, routes work between sessions, merges PRs and reports to the owner. See `docs/03-orchestration.md`.
6. **Start the PO as Jarvis** with `jarvis/BOOTSTRAP.md` — the complete, portable operating system of the PO/orchestrator (identity, standards, day one of a new app, daily loop, pipelines, memory seed).

---

## Map

| File | What it covers |
|---|---|
| `docs/01-roles.md` | Owner, PO, Designer, Developer, QA: responsibilities, boundaries, models, what each writes |
| `docs/02-workflow.md` | Task life cycle, branches, PRs, one PR at a time, merge rules |
| `docs/03-orchestration.md` | Running several sessions: messaging, shared emulator lock, limits and pacing, state snapshots, surviving context resets |
| `docs/04-acceptance.md` | How work is accepted: fresh install, CI checked by the PO, screenshots looked at, readability, mutation tests, independent recalculation |
| `docs/05-contract.md` | What every project contract must define: IDs, file hand-off, design tokens, mandatory UI rules |
| `docs/06-content-pipeline.md` | Content as data, draft → approved, validators in CI, generated content with a single source of truth |
| `docs/07-design.md` | Design source of truth, exports, component specs, density, scene readability |
| `docs/08-qa.md` | QA process, regression list, severity, debug entry points, accessibility audit, release checklist |
| `docs/09-owner.md` | Working with the owner: reports, decisions with options, estimates, approvals |
| `docs/10-lessons-learned.md` | Real mistakes and the rule each one produced |
| `docs/11-safety-and-git.md` | Hard rules: git, secrets, processes, files, licences, library docs |
| `docs/12-local-checks-and-budget.md` | $0 budget, free tiers, local merge pipeline instead of paid CI, merge order, integration branches |
| `docs/13-translation.md` | AI editor pass + blind back-translation + glossary; verifying reviewer flags |
| `docs/14-independent-review.md` | Context-free code review on a clean clone before milestones; static analysis |
| `jarvis/` | Jarvis — the PO/orchestrator: `JARVIS.md` (operating system), `BOOTSTRAP.md` (first message), `MEMORY_SEED.md` (rules to write into memory) |
| `roles/*.md` | One page per role, read by that role's session |
| `profiles/kmp-compose/` | Kotlin Multiplatform + Compose: architecture, code style, testing, accessibility, localisation, tooling, emulator recipes |
| `templates/` | `CLAUDE.md`, task, bug, ADR, PR, PO state snapshot, mechanics doc, kick-off prompts, project docs skeleton, `merge_local.sh`, `INDEPENDENT_REVIEW_PROMPT.md`, `OWNER_CHECKLIST.md` |

---

## Principles in one screen

1. **The owner decides; agents prepare decisions.** Every question goes to the owner with a recommendation and options. Decisions become ADRs.
2. **One role per session.** Roles do not mix: the Developer does not write content, the Designer does not write code, QA does not fix app code.
3. **Accept only what you have seen working.** A fresh install on an emulator plus green CI. A report, an API check or "done" in a message is not acceptance.
4. **Small steps.** One task → one branch → one small PR from fresh `main`. A plan before any large change.
5. **Data over code.** Rules, parameters and texts live in versioned content files with a status (`draft` / `approved`) and a validator in CI.
6. **Readability over literal realism.** A training picture must be readable first; every deliberate deviation from reality is a labelled assumption.
7. **Write it down.** Decisions → ADR. State → snapshot file. Lessons → playbook. A new session must reach the same quality without asking.
8. **Protect the budget.** Money: $0 unless the owner says otherwise — name every service's free tier before using it. Agent usage limits are the real bottleneck: keep sessions busy, but keep a reserve.
9. **Show, don't reference.** Decisions for the owner come with the images and exact texts in the chat, a recommendation and numbered options.
10. **Verify domain facts twice.** The canonical text plus an independent official edition; AI reviewers' flags are re-checked against the text.

---

## Licence

MIT — see `LICENSE`.
