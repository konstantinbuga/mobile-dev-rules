# Design

## Source of truth and hand-off

- One design file; only the Designer edits it. Others read it through its MCP or exports.
- Frames are named by contract IDs; exports land in `design/exports/` with theme, font scale and language in the name.
- Every component has a spec `design/components/C-xx.md`: sizes, states, gestures, haptics, accessibility alternative, behaviour with long text and at 200 % font.
- UI text in mockups comes only from the strings files; missing strings are listed by the Designer and drafted by the PO. Mockups mark unapproved text as "draft".

## Review by the PO

- The PO looks at every export (a contact sheet helps) before merging a design PR and before showing anything to the owner.
- Check domain correctness of the picture (in a domain app — lights, signals, geometry) against the content, not against the Designer's assumptions.
- Questions marked "for decision" in a design PR get an explicit answer.

## What owners usually reject (and we learned)

- **Generic "themed" UI** (navy and brass for a nautical app, etc.). Owners want a modern, non-literal style; collect references from the owner early.
- **Sprawling, text-heavy screens.** Make screens compact: one hero element, minimal text, details on demand.
- **A quiz or task inside onboarding.** Onboarding is clean: splash → language → short intro → role/goal → optional sign-in → home.
- **Toy-like 3D assets.** If assets are procedural, invest in a realism probe first and get a "canon" approval before rendering everything.
- **Unreadable scenes.** See readability in `docs/04-acceptance.md`.

## Design tool quirks to plan for

- Browser-based design tools can go to sleep in a background tab; the MCP stops responding. The Designer asks the owner to click the tab and meanwhile works on specs. Suggest the owner keeps the tab in its own window or excludes the site from tab sleeping.
- Prototype viewers may reorder frames or ignore group visibility; verify the prototype by clicking through it in the real viewer (for mobile: in a browser on the emulator).

## Scenes and generated assets

- Procedural pipelines (e.g. Blender via script) write metadata (anchor points, scale, waterline/ground line) next to each frame so the app can place overlays exactly.
- Validate assets against domain rules automatically (positions, minimum distances) and keep preview sheets for review.
- Deliberate exaggerations (bigger symbols, magnified distant objects) are parameters with `kind: pedagogic` and a visible label, never silent.
