# Acceptance

**Rule zero: accept only what you have seen working.** A report of parameters, an API check of a prototype, or "done" in a message is not acceptance.

## What acceptance is

1. **Fresh install** on the emulator (uninstall, install the PR build) and a walk-through of the acceptance criteria and the neighbouring screens.
2. **CI green**, checked by the PO itself on the latest commit (`gh pr view N --json statusCheckRollup` / `gh pr checks N`) — roles report "ready" while CI is still running or red.
3. **CI green on the merged state** — update the branch if `main` moved, wait again.
4. **Screenshots and exports looked at by the PO** before anything is shown to the owner. Show the owner only what passed the PO.

## Visual acceptance: readability first

A position check is not a readability check. For any scene, chart or illustration:

- every meaningful element (signal, shape, light, label) is **readable at 100 %**: its silhouette is against a plain background (sky, empty area), not over other detail;
- it overlaps nothing except its own support;
- forms are distinguishable; groups do not merge;
- when real proportions make things unreadable (tiny distant objects), **magnify deliberately**, keep the true geometry where it matters (positions, bearings), and label the magnification as an assumption.

Write the criterion into the QA checklist the moment it is discovered; a reviewer checks exactly what the criterion says.

## Proving tests and data

- **Mutation check.** For validators, truth tables and generators: break the data on purpose; the test must fail. A test that never fails proves nothing.
- **Independent recalculation.** For computed content (physics, geometry, scoring), QA or a second role recomputes a sample independently. In our project this caught a mislabelled field that every automated test had accepted.
- **Single source of truth.** If content is computed, the app's own core computes it (a tool task that regenerates the file), and a test asserts the file equals the tool's output. Never maintain a parallel script that can drift.
- **Owner's tables are the reference.** Code is never adjusted to "fit" an owner-approved table; a mismatch is a question to the owner.

## Debug entry points

Make acceptance cheap and deterministic:

- a **debug-only deep link** that opens any task or screen state by id and seed (`app://task/<id>?seed=N`);
- a **debug clock offset** (`app://debug/clock?days=N`) to check spaced repetition, streaks and time-of-day UI without root;
- a test that these entries do not exist in release builds.

Without them QA ends up waiting for a rare case to appear by chance and accepts on luck.

## What is not acceptance

- "The API shows all links exist" (for a clickable prototype) — walk it in the real viewer.
- "Tests are green" for UI — look at it.
- "It worked on my branch" — check the merged state.
- "QA accepted the previous commit" — check the commit that will be merged.
