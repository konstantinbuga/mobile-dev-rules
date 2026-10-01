# The project contract

Every project has `docs/01_CONTRACT.md`, binding for all roles. If anything conflicts with it, the contract wins; disputes go to the owner. Changes are logged in `docs/CHANGELOG_CONTRACT.md` with date and "approved by the owner". A skeleton is in `templates/project-docs/01_CONTRACT.md`.

## 1. Identifiers

Stable IDs make hand-off between design, code, QA and content unambiguous.

| Entity | Format | Example |
|---|---|---|
| Screen | `S-xx` | `S-07` |
| Screen state | `S-xx_<state>` | `S-07_replay` |
| Component | `C-xx` | `C-19 HoldButton` |
| Design token | `font.*`, `type.*`, `color.*`, `space.*`, `shape.*`, `motion.*`, `haptic.*` (+ domain groups) | `color.night.accent` |
| Icon | `I-<name>` | `I-module-sound` |
| UI string key | `ui.<screen>.<element>` | `ui.s07.execute` |
| Task / bug / decision | `T-xxx` / `B-xxx` / `ADR-xxx` | `T-062` |

Design frame names equal these IDs. Exports are named `S-xx_<state>_<theme>_<fontscale>_<lang>.png`.

## 2. Files and hand-off

- **Design source of truth** — one design file (Penpot, Figma). Pages: cover, foundations & tokens, components, screens, prototype, scene/assets, store.
- **Designer → repo:** exported tokens JSON, component specs `design/components/C-xx.md` (sizes, states, gestures, long-text behaviour), screen exports, icons (SVG), guides.
- **Developer:** merges token files into one `tokens.json`, generates a typed tokens object; reads the design file read-only.
- **QA / Developer → Designer:** screenshots, motion recordings, asset preview sheets.

## 3. Tokens

One merged `tokens.json` (units dp/sp, colours `#RRGGBB(AA)`, durations ms) with groups for fonts (three roles: display, text, mono), type styles, colours per theme, spacing, shapes, motion (springs, durations), haptics, minimum touch target. No visual value is hard-coded in code — a lint check enforces it.

## 4. Mandatory rules (adapt per project)

1. **Text is never truncated.** No ellipsis on questions, answers or buttons. At 200 % font and in the longest language, text wraps and the screen scrolls.
2. **Touch targets ≥ 48×48 dp; contrast WCAG AA** (4.5:1 body, 3:1 large).
3. **Nothing is conveyed by colour alone** (labels, icons, patterns).
4. **Domain colours are sacred.** Colours with meaning (signal lights, statuses) are not tinted by themes or covered by translucent layers; the accent colour never collides with them.
5. **Assumptions are labelled.** Wherever the app uses a number the domain rules do not give (a threshold, a safe distance, a magnification), the UI marks it "training assumption" (or the project's equivalent) and the value lives in a params file with its source.
6. **No third-party logos or "official" claims** unless licensed; disclaimers where the domain requires them.
7. **Quotes from copyrighted sources** only through a quote component with attribution; everything else is retold in our own words.
8. **Modern look, own components.** Visible components are the project's own (`C-xx`), not stock widgets; the owner approves the style.
9. **Deterministic randomness.** Everything random takes a `seed`, so any bug can be reproduced.
10. **Offline first** where the product allows: learning/core use works without network; only sign-in, purchase and sync need it.
