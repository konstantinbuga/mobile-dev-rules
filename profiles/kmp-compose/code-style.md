# Code style

- Kotlin coding conventions; ktlint or detekt in CI; warnings are errors.
- A lint check forbids hard-coded visual values (colours, dp, sp, durations) outside the tokens module.
- **Names in English and in domain terms** (`masthead`, `giveWay`, `standOn`). Cite the rule/spec a function implements in KDoc (`// Rule 21(a)`).
- **Core functions short and pure;** side effects only in data and platform layers.
- **Coroutines:** structured, no `GlobalScope`; dispatchers injected; `Flow` for state streams.
- **Errors:** sealed results in the core (`ContentResult`, `Result`), no exceptions for expected situations.
- **Comments explain why**, not what. Match the comment density of the surrounding code.
- **Commits:** Conventional Commits in English; branches `t-xxx-short`.
- **PRs:** one task, small, with screenshots for UI.
- **Do not:** add a library without checking klibs.io and current docs; write Android-specific code in `commonMain`; copy code without checking its licence; kill processes by name.
