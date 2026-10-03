# 14. Independent code review

Code written by agent sessions looks clean and plausible; the risk is "plausibly wrong" code that nobody involved will question. Before each milestone (closed test, public release, a new platform) run an independent review:

1. **A clean clone** in a separate folder, outside the working repository.
2. **A new session with no project history** — a reviewer that did not take the decisions and does not defend them. Read-only; its only output is `REVIEW.md`.
3. **A concrete checklist**, not "review the code" (`templates/INDEPENDENT_REVIEW_PROMPT.md`): build from scratch; architecture boundaries; **user data survival across app updates** first; correctness of the domain logic; content pipeline; offline and errors; secrets; UI state and lifecycle; performance; next-platform readiness; test gaps; build maintainability; accessibility and localisation.
4. **Evidence or nothing:** every finding with file:line or a reproducing command, severity S1–S4, how it shows to a user, effort. Uncertain findings are marked as hypotheses.
5. **The PO triages** the report into tasks; the owner sets priorities. General findings become rules in this repository.

Also add free static analysis to the regular check (Detekt + ktlint for Kotlin) so part of what a reviewer finds is caught on every merge.

An outside opinion that sees only a few files will over- and under-estimate (it may claim there is no validation when a validator runs in the check). Weigh such opinions against the whole repository before acting.
