# Profile: Kotlin Multiplatform + Compose Multiplatform

Android first, iOS later with the same UI. Read with `roles/developer.md`.

| File | Topic |
|---|---|
| `architecture.md` | Modules, platform interfaces, UDF, design system, determinism |
| `code-style.md` | Kotlin conventions, naming, coroutines, errors, comments |
| `testing.md` | Unit, ViewModel, screenshot tests (Roborazzi), content tests, tolerances |
| `accessibility.md` | Per-screen checklist, font scaling 100–200 %, screen reader, keyboard |
| `localization.md` | Strings, plurals, long languages, Turkish casing, fonts |
| `tooling.md` | Gradle tasks, content CLI, version catalogue, CI |
| `emulator.md` | adb / device MCP recipes, Windows + Git Bash quirks |

**Rule zero:** check current documentation (Context7 or official docs) before using any library API. Pin versions in `gradle/libs.versions.toml`.

## Primary sources

- Kotlin Multiplatform docs (JetBrains) — the main reference for project structure, source sets, `expect`/`actual`, Compose Multiplatform resources and navigation.
- klibs.io — KMP library catalogue; check platform support before adding a dependency.
- Android app architecture guide — layers and unidirectional data flow (principles, not Android specifics).
- Kotlin coding conventions; Compose API guidelines (androidx `compose-api-guidelines.md`) for own components.
- Reference apps for ideas: KotlinConf app (KMP + CMP), Now in Android (architecture, modularisation, tests).
