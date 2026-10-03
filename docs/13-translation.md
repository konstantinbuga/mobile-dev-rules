# 13. Translation with AI passes

A single translation pass by the PO reads "correct but not native" and occasionally inverts meaning. Native speakers are the final step, but they should receive a reviewed text, not a raw one. The pipeline below caught a meaning inversion (an interval "not more than 2 minutes" read as "every 2 minutes or more"), generic words used for a domain term, and leftovers of renamed product terms.

## 1. Order

1. **Main languages first** (the owner names them, e.g. the primary market language, English, the owner's language). Others stay hidden behind a flag until reviewed.
2. **Interface strings before content.** Content (explanations, rule retellings, FAQ, store listing) follows once strings are stable.

## 2. Editor pass (one agent per language)

Prompt the agent as **a native editor who is also a domain professional and an Android/iOS UI localizer**. It:

- translates missing keys from the source language, cross-checking an approved parallel language for meaning;
- reviews every existing string for naturalness (as the platform's own apps phrase buttons), the domain's standard terms in that language (the national text of the regulation), platform terms (store, subscriptions, settings), consistency (one source term → one target term), placeholders and plural categories, product decisions (renamed concepts);
- writes a JSON result `{glossary, additions, changes[{key, old, new, why, severity}]}` — the PO applies it with a script, so nothing is edited blindly.

## 3. Blind back-translation (separate agent)

Give a different agent **only the translated file** and ask for a literal English back-translation, marking `UNCLEAR:` anything ambiguous, ungrammatical, mixing languages or misreadable by a professional. For content, also ask it to flag `RULE?:` statements that look factually wrong.

## 4. Verify the flags

The PO checks every `RULE?` flag against the canonical text before changing anything. In practice most were false (the reviewer remembered an older edition); the real ones were imprecisions present in the source language too — fix them in all languages at once.

## 5. Keep

- A glossary per language in the repository; new strings are translated with it.
- Content files keep a note that a language is an AI-reviewed draft until a native speaker signs off.
- Screenshot baselines for the changed locales are re-recorded locally after the merge — and only after the code queue is empty (see `docs/12`).
