# Hard rules: safety, git, environment

These are non-negotiable for every role.

## Never

- `git push --force`, `git reset --hard` on shared branches, deleting `main`.
- Committing secrets: API keys, MCP keys, tokens, keystore passwords. Keys live in environment variables or user settings, never in the repo. Do not paste them into messages or PRs.
- Killing processes by name (Gradle daemons, emulator, IDE). **Only by PID**, after identifying the exact process.
- Changing files outside the project folder (except the agent's own scratchpad and memory).
- Bare `git stash` / `stash pop` in a repository shared with other sessions' worktrees — another session's stash may be popped. Prefer a temporary WIP commit.
- Copying text or illustrations from copyrighted sources into the product. Retell; quote only short attributed passages through the quote component.

## Always

- **Current library docs before using an API** (Context7 MCP or the official docs). Model knowledge may be outdated. Pin versions in the version catalogue.
- Check a library's licence and platform support before adding it.
- Each session works in its **own git worktree** (`.worktrees/<role>`), branches from fresh `origin/main`.
- **Merge from outside the repository** with `--repo`; `--delete-branch` inside a repo can remove another session's worktree.
- Commands that validate, commit and merge are separate steps — a failed validation must not let a commit land on the wrong branch.
- Large changes start with a short plan and approval.

## Publishing and outward actions

- Anything public (repositories, store listings, posts) needs the owner's explicit request.
- Store submissions, purchases, account changes: the owner does them or explicitly authorises each one.
