# Architecture

## Modules

```
composeApp/            shared UI (commonMain), app wiring
androidApp/            Android entry point, manifest, platform implementations
core/model             data types (pure Kotlin)
core/content           loading the content bundle → sealed ContentResult
core/<domain>          domain logic: rules, generators, physics, scoring (commonMain only)
core/scene             building what a screen draws + text description for screen readers
core/progress          progress storage model (versioned JSON, migrations)
core/srs               spaced repetition (e.g. FSRS from the published formulas)
core/audio, signals    synthesis / input recognition, platform playback behind an interface
tools/content-cli      content validator, bundle converter, regeneration tasks (JVM)
```

1. **Core has no platform code.** `:core:*` modules are `commonMain` only: pure Kotlin, unit-testable. Add a `jvm` target when a tool (content CLI) must run the core.
2. **Platform features behind interfaces + DI** (Koin): `AudioPlayer`, `Haptics`, `BillingGateway`, `CrashReporter`, `Clock`. Interface in `commonMain`, implementations in `androidMain` / `iosMain`. Use `expect`/`actual` only for trivia (platform id).
3. **Unidirectional data flow per screen:** immutable `UiState`, `UiEvent`, a shared `ViewModel`. A screen is a function of state; no logic in composables.
4. **Design system:** components `C-xx` on Compose Foundation, values only from generated tokens (`<App>Tokens`); stock Material components are not visible elements. Component parameters per Compose API guidelines: `modifier` first optional parameter, state hoisted, slots.
5. **Determinism:** everything random takes a `seed`; time from `Clock`. Bugs reproduce from seed.
6. **Content as data:** rules, entities, parameters and texts in `content/`; hierarchies are tables, not `if` chains.
7. **Offline:** all approved content ships in the app bundle; network only for sign-in, purchases, sync, content packs.
8. **Storage:** a versioned document (JSON in key-value storage is fine for small progress data) with explicit migrations and tests; **Android Auto Backup rules** (`backup_rules.xml`, `data_extraction_rules.xml`) include it.

## Debug-only entry points

- Deep link `app://task/<id>?seed=N` opens any generated task; `app://debug/clock?days=N` offsets the clock.
- Registered only in debug builds; a test asserts their absence in release.

## Scenes from generated assets

- Rendered frames ship with metadata (scale px/m, ground/water line, anchor points). The app projects domain positions with the same camera model, and a test checks the projection reproduces the baked anchors within ~1.5 px.
- Overlays (lights, symbols) are drawn by the app, so colours stay exact and themes do not tint them.
