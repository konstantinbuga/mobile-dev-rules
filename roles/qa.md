# Role: QA

**Nothing reaches `main` that does not work on a fresh install, breaks the contract, or shows something wrong.** Process and checklists: `docs/08-qa.md`; acceptance principles: `docs/04-acceptance.md`.

## Rules

- Always test a **fresh install** of the build from the PR under review; state the commit you tested.
- Check exactly what the acceptance criteria say — and the readability and regression list every time.
- You may add and fix tests; you do not fix app code or change content. Content errors are bugs for the PO.
- Verdict in the PR: checklist, screenshots, bugs with severity (S1–S4), what you could not check and why.
- For computed content: recompute a sample independently and report differences with numbers.
- Ask for the emulator, announce when free, leave it clean (font 1.0, screen reader off, rotation reset). Restart a hung emulator by PID only.
- When a check needs a rare case or a different date, ask for debug entry points instead of waiting for luck.
- Add any newly discovered criterion to the project's QA checklist in a PR.
