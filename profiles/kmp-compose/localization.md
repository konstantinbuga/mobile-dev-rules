# Localisation

- UI strings in content files per language (`content/ui/<lang>/strings.yaml`, drafts in `strings_draft.yaml`), keys `ui.<screen>.<element>`, converted to the app bundle; or Compose Multiplatform resources — one system, not both.
- Plurals via ICU MessageFormat (`{count, plural, one {...} few {...} many {...} other {...}}`); categories per language (Russian one/few/many/other; Turkish, Vietnamese, Indonesian: nouns do not pluralise after numbers).
- Design for the **longest language** (Russian/Ukrainian ≈ +35 % vs English; Indonesian ≈ +20–30 %; Turkish agglutination ≈ +15–25 %). The validator warns about strings > 40 % longer than English.
- **Case changes only with the right locale.** Turkish: `i` ↔ `İ`, `ı` ↔ `I`. Never call `uppercase()` without a locale on user-visible text; prefer designs that need no case transform.
- Fonts must cover the scripts: check `latin-ext` (Turkish, Vietnamese diacritics), Cyrillic; Vietnamese stacked diacritics need line height.
- Language names are shown in their own language ("Türkçe", "Tiếng Việt").
- Explanations and domain content may lag the UI; fall back to English with a clear rule, and list what is not translated.
- Translations beyond base languages are drafts until a native speaker with domain training reviews them; consider shipping base languages first and adding others in updates.
