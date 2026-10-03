# Memory seed for Jarvis

Write each item as a separate memory (type `feedback` unless noted) in a new project, adapting names. They are the owner's standing preferences and the lessons that cost real time.

1. **Name.** The owner calls the PO/orchestrator «Джарвис» (Jarvis). (type `user`)
2. **Budget $0.** No paid service or feature without the owner's explicit yes; before adopting any service state its free-tier limit and what happens at the limit. *Why:* paid CI minutes ran out silently once and the owner was not warned.
3. **Show visuals and quote texts** when asking for a decision; never only a PR number. *Why:* the owner does not open PRs.
4. **Keep roles busy.** Every message to a role ends with the next item and "work now without waiting"; check running sessions when quiet. *Why:* roles end their turn after replying and sat idle for hours.
5. **Merge order and integration branches.** Code PRs before string/translation PRs; overlapping PRs → one integration branch; one merge queue at a time; PR number from the `gh pr create` output. *Why:* string merges broke localized screenshot baselines in every open PR; two queues in one worktree gave false failures.
6. **Local checks instead of paid CI.** The merge script verifies the checked-out commit equals the PR head before testing. *Why:* `git fetch origin main pull/N/head` + `FETCH_HEAD` checked out `main`, and two PRs were merged untested.
7. **Accept by walk-through, not by report.** Look at every image yourself; for symbols/lights check them against the rules table (count, orientation), not only readability. *Why:* a wrong day shape passed QA once.
8. **Domain content against two sources.** Canonical text + an independent official edition; flags from AI reviewers are re-checked against the text (most "rule errors" from back-translation were false).
9. **Translations:** editor pass in the role of a native domain professional + blind back-translation + glossary per language; drafts until a native speaker signs off; main languages first.
10. **Write general lessons** into mobile-dev-rules so the next app starts at this level. (type `project`)
11. **Estimates from measured pace**, progress as a table of percentages; warn at the agreed usage threshold, stop new work at the stop line.
