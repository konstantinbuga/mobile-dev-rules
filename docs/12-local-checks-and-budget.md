# 12. Local checks and the $0 budget

Hosted CI is convenient until its free minutes run out. For a private repository on a free plan they ran out in three days of four agent sessions (two parallel jobs per PR). From then on, the full check runs on the owner's computer before every merge — it costs only electricity and a few minutes of a busy CPU.

## Budget rules

- **$0 unless the owner says otherwise.** Before adopting any service, the PO states its free tier, what happens at the limit (stops, throttles, charges) and whether a card is needed. Only free tiers without a card by default.
- If a hosted CI is kept for public repositories or later, set its spending limit to zero so it stops instead of charging.
- Typical unavoidable costs to name early: store developer accounts (Google Play one-time fee, Apple yearly fee). Everything else at MVP stage can be free (Supabase, Firebase Crashlytics, PostHog, RevenueCat, Cloudflare Pages, Codemagic free macOS minutes).

## The local merge pipeline

One script, run by the PO from outside any repository (so `--delete-branch` never touches a local worktree), with a dedicated worktree for checks (`templates/merge_local.sh`):

1. `gh pr update-branch N` — merge fresh `main` into the PR branch on the host.
2. Fetch `main`, then fetch the PR head **separately** into its own ref (`pull/N/head:refs/ci/pr-N`). Never rely on `FETCH_HEAD` after fetching two refs — it points at the first one (`main`).
3. Check out that ref and **assert the commit equals the PR head** reported by `gh pr view N --json headRefOid`.
4. Skip if the branch does not contain `main` (conflict) and report it.
5. Run the full check (build, unit tests, screenshot tests, lint, content validator, tool self-tests). On failure keep the names of failed tests and changed screenshots in the log (the build directory is reused by the next PR).
6. On success: comment "Local check: green at <sha> merged with main" on the PR and squash-merge.

Rules around it:

- **One queue at a time** (a lock directory). Two queues in one worktree produce false failures from locked files; a killed run can leave a build daemon holding files — retry before blaming the code.
- **Do not edit the script while it runs** (the shell reads it incrementally).
- **Take the PR number from the `gh pr create` output**, never guess the next number.
- **Code before strings.** Any string or translation change makes the localized screenshot baselines of every open PR red. While the Developer's queue is long, hold string PRs, or merge them right after a batch and tell the Developer once.
- **Integration branch for overlapping PRs.** When several accepted PRs touch the same files (app shell, home screen, strings drafts), merging one by one makes each next one conflict. The Developer merges them into one `integration-<date>` branch, resolves conflicts once, re-records baselines, opens one PR; the PO merges it and closes the originals with a link.
- Roles run the same check locally before saying "ready" and state the commit; QA builds the APK locally from the PR branch merged with fresh `main`.

## What the owner should know

What runs (compile, tests, screenshot rendering, lint, validators), what it loads (all CPU cores, several GB of RAM for a few minutes, a few GB of build cache), what it costs (electricity; agent usage only for starting the script and reading its result), and that it can be throttled (fewer Gradle workers) or batched when the owner is away.
