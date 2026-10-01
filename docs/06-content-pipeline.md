# Content pipeline

Treat product knowledge — rules, parameters, explanations, UI copy, scenarios — as **versioned data**, not code.

## Content as data

- `content/` holds YAML (or JSON) files per domain: entities, parameters, fixtures (truth tables, scenarios), explanations, UI strings per language.
- Every element carries: `id`, `rule_refs` / sources, `tier` (free/paid), and `review: {by, date, status}` with status `draft` or `approved`.
- A build step converts content into an app bundle; the app loads it at start (offline).
- Domain hierarchies and thresholds are **tables in data**, not `if` chains in code.
- Parameters the domain does not define live in a `params/pedagogic.yaml` (or similar) with `kind: pedagogic` and a `source` (an ADR). The UI labels them.

## Draft → approved

1. The PO writes drafts: new UI strings go to `strings_draft.yaml`, content elements get `status: draft`.
2. The PO shows the owner the exact texts (in the owner's language, compact list) and asks for "approved".
3. On approval the PO moves strings from the draft file to `strings.yaml` (or flips the status), in a PR.
4. Release builds fail if anything shipped is not `approved` (validator with `--release`).
5. Translations beyond the base languages are PO drafts until a native speaker with domain knowledge reviews them.

## Validator in CI

A content CLI (`tools/content-cli`) runs on every PR and fails the build on: schema errors, broken references, missing required fields, unknown IDs, forbidden words (e.g. "official"), unapproved items in release mode, missing translations for required languages, wrong numbering. Warnings: long strings vs the base language (wrapping risk), missing optional translations, missing generated assets.

## Generated content: one source of truth

When content is computed (scores, physics, allowed answers, rendered asset metadata):

- the **app's own core** computes it through a tool task (e.g. `:tools:content-cli:regenX`) that rewrites the file in place, keeping the header and field order;
- a test asserts the committed file equals the tool's output and that a second run changes nothing;
- after any change to parameters or rules, the PO runs the task and reviews the diff; **changed answers go to the owner before merge**.

Never keep a private script that computes the same thing — it drifts from the app and the replay shows one number while scoring uses another.

## Generated tasks: the uniqueness principle

For quizzes generated from data (e.g. "what is this?" from a picture):

- a task is generated only if **the visible picture uniquely determines the answer**;
- the picture is what the user can actually see (colours and arrangement), not hidden attributes (internal types the eye cannot distinguish);
- a single, information-poor stimulus (one dot, one sound) is never asked as an identification question;
- optional variants are part of the picture set; equivalent answers are merged into a general answer;
- no task is generated without an approved explanation text;
- distractors never show the same picture as the correct answer;
- a **task catalogue** (generated markdown: every task, its answer, distractors, and the list of "never asked" with reasons) is committed and reviewed by the PO and QA.
