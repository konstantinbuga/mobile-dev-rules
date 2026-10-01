# Testing

| Level | What | Tools |
|---|---|---|
| Core | Truth tables, generators, physics, scoring, recognition, SRS | `kotlin.test`, parameterised tests over `content/fixtures/` |
| Screen state | ViewModel: events → states | `kotlin.test`, Turbine for `Flow` |
| UI | Screenshot of every screen × theme × font scale × language; overflow checks | Roborazzi on Robolectric (Android host tests) |
| Runs | Fresh-install scenarios on the emulator | QA via device MCP / adb |
| Content | Schemas, statuses, references, translations | `:tools:content-cli:checkContent` in CI |

## Screenshot tests

- Matrix: **5 font scales (100, 125, 150, 175, 200 %)** × night/day × base languages for every screen (at least 100 % and 200 % for every language including the longest).
- Automatic layout checks in the same tests: no visual overflow / ellipsis, no mid-word breaks without hyphen, touch targets ≥ 48 dp, screen scrolls only vertically.
- Baselines can differ between Windows and Linux font rendering: use a small tolerance (e.g. 0.2 %) or record on the CI platform.
- The PO and QA **look** at changed baselines; a green diff tool is not a visual review.

## Rules

- A bug report with a seed becomes a failing test with that seed first, then the fix.
- No wall-clock in tests; inject `Clock`.
- Validators and generators get **mutation tests**: corrupted copies of real content must fail with a clear message.
- Generated content: test that the committed file equals the generator's output and that a second run changes nothing.
- Computed physics: compare with reference numbers from sources (tolerances stated), and with regulatory upper bounds where they exist.
