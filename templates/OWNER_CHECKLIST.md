# Owner checklist — accounts, keys and data before the server/payments milestone

Give this to the owner a few days before it is needed. Only the store accounts cost money; everything else is a free tier without a card.

**Keys never go into chat or git.** One file `<repo>/.env` and a folder `<repo>/secrets/`, both in `.gitignore`.

## 1. Stores (start first — verification takes days)
- **Google Play Console** — one-time fee; identity, phone, address and device verification; payments profile (bank account, tax) before subscriptions; create the app (name, default language, free with in-app purchases, ads yes/no); check the package name is free — it cannot change after the first upload.
- **Closed test** — 12+ testers' Gmail addresses who keep the app installed 14 days in a row (Google Group works).
- **Apple Developer Program** — yearly fee; only when iOS starts. Building for iOS needs a recent Mac with a current Xcode (or a free cloud macOS tier such as Codemagic) and at least one iPhone.

## 2. Free services (typical MVP stack)
| Service | Purpose | Owner creates | Into `.env` / `secrets/` |
|---|---|---|---|
| Supabase | server, database, auth | project (region close to users / EU) | URL, anon key |
| Google Cloud | Google sign-in, Play ↔ purchases | OAuth clients (Android + Web), service account | web client id; service-account JSON |
| RevenueCat | purchases and subscriptions | project, Android app, link the JSON | public SDK key |
| PostHog | usage statistics (with consent) | EU project | project key |
| Firebase | crash reports | project + Android app | `google-services.json` |
| Cloudflare Pages | landing, privacy policy, account-deletion page | account | — |

Notes: free Supabase projects pause after a week without requests; a custom domain is optional (the free subdomain is enough at first).

## 3. Data for the privacy policy and the store
Developer name/company and country; support email (a dedicated one); hosting region; account-deletion URL; whether statistics are asked at first launch (recommended; GDPR).

## 4. Done by the Developer once keys exist
Upload keystore (the owner keeps two backups — losing it blocks updates), SDK wiring, Data safety form, content rating, first internal-testing upload.
