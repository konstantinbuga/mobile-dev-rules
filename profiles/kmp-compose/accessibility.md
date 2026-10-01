# Accessibility

## Per-screen checklist

- [ ] Every interactive element has semantics / `contentDescription`.
- [ ] Touch targets ≥ 48 dp.
- [ ] Text scales to 200 % without truncation; check points 100, 125, 150, 175, 200 %.
- [ ] Nothing conveyed by colour alone (colour labels for colour-blind users where colours carry meaning).
- [ ] Scenes have a text description generated from what is visible — and it never gives away the answer (list colours/shapes and positions, not names).
- [ ] Gesture instruments (dials, levers, hold-to-act) have button alternatives.
- [ ] "Reduce motion" turns off flicker, swell, sweeps; animations get a static alternative.
- [ ] Keyboard / switch access: visible focus indication on every focusable element (custom buttons often have `indication = null` — add a focus ring), logical Tab order, no focus traps.
- [ ] Disabled-but-informative items (e.g. "Soon") stay focusable and announced, with an explanation on tap.
- [ ] Live regions for messages that appear after an action.

## Font scaling rules

- Follow the system font size; no separate in-app text size switch.
- Rearrange layouts at large scales (side-by-side → column), cap some styles if the design rules say so, allow hyphenation where the language needs it.
- Numbers, prices, percentages and short labels never break across lines.

## Audit

Run a per-release accessibility audit (screen reader, keyboard, font scale, contrast) and file findings with severity; screen-reader binding may not work on some emulator images — verify on a phone and say so.
