# Tooling

## Gradle tasks (typical)

```
./gradlew check                                   # all checks
./gradlew :androidApp:assembleDebug               # build
./gradlew :androidApp:installDebug                # install on the running emulator/phone
./gradlew :tools:content-cli:checkContent         # content validator (add --release for release mode)
./gradlew :tools:content-cli:convertContent       # content → app bundle
./gradlew :tools:content-cli:regen<Thing>         # regenerate computed content with the core
./gradlew verifyRoborazzi / recordRoborazzi       # screenshot tests
```

On Windows use `.\gradlew.bat` in PowerShell or `./gradlew` in Git Bash; set `JAVA_HOME` to the IDE's bundled JBR if no JDK is installed.

## Content CLI

A JVM tool in the repo that:
- validates schemas (JSON Schema per content type), references, statuses, forbidden words, numbering, translations, string length;
- converts content into the app bundle;
- regenerates computed content using the core modules (add a `jvm()` target to those modules);
- is covered by tests with corrupted copies of real files.

## CI

- Two jobs: `content` (validator) and `check` (build, unit, screenshot tests, lint).
- If a job "failed to be acquired" (runner problem), re-run it (`gh run rerun <id>`); it is not a code failure.
- The PO merges only on green CI of the merged state.

## Assets via Blender (optional)

- Procedural models built by script (`blender -b -P tools/blender/render_all.py -- --out assets/generated/...`), anchors as empties named by content IDs, orthographic camera, WebP atlases + JSON metadata, validation against domain rules, preview sheets for review.
- Background (sky/sea) rendered separately; the app composes hull frame + overlays.
