# <Project> — contract

**Version:** 1.0 · <date>. Binding for all roles. On conflict with role documents the contract wins; disputes go to the owner. Changes: `docs/CHANGELOG_CONTRACT.md` with "approved by the owner".

## 1. Identifiers
| Entity | Format | Example |
|---|---|---|
| Screen / state | `S-xx` / `S-xx_<state>` | |
| Component | `C-xx` | |
| Tokens | groups | |
| Icon | `I-<name>` | |
| UI string | `ui.<screen>.<element>` | |
| Domain assets | <format> | |

## 2. Files and hand-off
Design file pages; Designer → repo; Developer; QA → Designer; owner → Designer (references).

## 3. Tokens schema
<merged tokens.json schema>

## 4. Mandatory rules
1. Text is never truncated (200 % font, longest language).
2. Touch targets ≥ 48 dp; WCAG AA contrast.
3. Nothing by colour alone.
4. Domain colours untouched by themes; accent never collides with them.
5. Assumptions labelled in the UI; values in params with sources.
6. No third-party logos / "official" claims; disclaimer where needed.
7. Quotes only via the quote component with attribution.
8. Own components, modern style approved by the owner.
9. Seeds for all randomness.
10. Offline core use.
<project-specific additions>

## 5. Changes
CHANGELOG_CONTRACT and ADRs.
