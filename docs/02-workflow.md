# Workflow

## Life cycle of a task

1. **PO** writes `docs/backlog/T-xxx.md` from `templates/TASK.md`: goal, screen and component IDs, acceptance criteria, how QA checks it, what is out of scope.
2. **Designer** (UI tasks) prepares or updates the frames and exports PNGs to `design/`. A UI task is *ready* only when its design exists.
3. **Developer** (or Designer for design PRs):
   - sends the PO a **short plan** before any large task and waits for approval;
   - branch `t-xxx-short-name` from **fresh `main`**;
   - code + tests; all checks green locally;
   - PR with a link to the task, what changed, how to check, screenshots for UI;
   - says "ready" only when **CI is green on the latest commit**.
4. **QA** checks the PR on a **fresh install** (see `docs/04-acceptance.md`) and comments the verdict in the PR with a checklist.
5. **PO** checks CI itself, looks at screenshots, updates the branch if `main` moved, waits for green CI again, merges with squash.
6. **Owner** plays the build at milestones from a fresh install and accepts or returns it.

## Branches and PRs

- **One task → one branch → one small PR.** Never stack PRs on each other; stacked and overlapping PRs conflict after squash merges and force rebuilds.
- **Rebuild = new branch.** Never force-push a shared branch. Resolve conflicts by merging `main` into the branch.
- **Before merging, CI must be green on the merged state.** If `main` moved after the PR's last green run, `gh pr update-branch N` and wait for a new green run.
- **"Ready" means finished.** If a role keeps pushing to a branch after saying ready, it must say "do not merge, still pushing". Commits pushed after a merge are lost with the deleted branch and must be cherry-picked to a new PR.
- **Conventional commits** (`feat:`, `fix:`, `test:`, `docs:`, `chore:`), English. Branch names and identifiers in English even when the team communicates in another language.
- PR description: task link, what was done, what is reused / replaced / added, how to check, screenshots, known limitations.

## Plans and small steps

- Any large change — a new module, a migration, a schema change, a re-render of assets — starts with a short plan to the PO: what files, what risks, what is out of scope. The PO approves with concrete corrections.
- The PO itself proposes plans to the owner for product-level changes.

## Definition of done (every PR)

- [ ] Acceptance criteria met and checked as written.
- [ ] Tests added; mutation check for validators and tables ("break the data — the test must fail").
- [ ] No hard-coded visual values or rule parameters; values come from tokens and content.
- [ ] Text never truncated at the largest font scale in the longest language.
- [ ] CI green on the latest commit and on the merged state.
- [ ] UI: verified on a fresh install (by QA or the PO), screenshots looked at.
