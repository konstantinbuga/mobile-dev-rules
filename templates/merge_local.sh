#!/bin/bash
# Merge PRs one by one with LOCAL checks instead of paid CI (docs/12-local-checks-and-budget.md):
# update the PR branch from main, check out its head in a dedicated worktree, run
# `./gradlew check` + content checks, squash-merge only if green.
# Run it from a folder outside any repository so --delete-branch never touches local worktrees.
# Usage: REPO=owner/repo MAIN_REPO=/path/repo CHECK_WORKTREE=/path/repo/.worktrees/ci CHECK_CMD="./gradlew -q check" ./merge_local.sh 12 13 14
cd "$(dirname "$0")"
G="${GH:-gh}"; R="${REPO:?set REPO=owner/repo}"
WT="${CHECK_WORKTREE:?set CHECK_WORKTREE=/path/to/repo/.worktrees/ci}"; MAIN_REPO="${MAIN_REPO:?set MAIN_REPO=/path/to/repo}"
# export JAVA_HOME=... (Android Studio JBR) if needed
# one queue at a time: a second run waits for the first (both use the same worktree)
until mkdir merge_local.lock 2>/dev/null; do sleep 20; done
trap 'rmdir merge_local.lock' EXIT
[ -d "$WT" ] || git -C "$MAIN_REPO" worktree add --detach "$WT" origin/main
for N in "$@"; do
  echo "== #$N $(date +%H:%M)"
  "$G" pr update-branch "$N" --repo $R 2>&1 | tail -1
  sleep 5
  git -C "$WT" fetch -q origin main || { echo "fetch main failed — stop"; exit 1; }
  # fetch the PR head on its own: with two refs FETCH_HEAD points at the first one (main)
  git -C "$WT" fetch -q origin "pull/$N/head:refs/ci/pr-$N" -f || { echo "#$N fetch failed — stop"; exit 1; }
  git -C "$WT" checkout -q -- . && git -C "$WT" checkout -q --detach "refs/ci/pr-$N"
  [ "$(git -C "$WT" rev-parse HEAD)" = "$("$G" pr view "$N" --repo $R --json headRefOid -q .headRefOid)" ] || { echo "#$N checked-out sha != PR head — stop"; exit 1; }
  head=$(git -C "$WT" rev-parse --short HEAD)
  if ! git -C "$WT" merge-base --is-ancestor origin/main HEAD; then echo "#$N not up to date with main (conflict?) — skip"; continue; fi
  # CHECK_CMD: the project's full check (build, tests, screenshot tests, lint, content validator, tool self-tests)
  if (cd "$WT" && eval "${CHECK_CMD:-./gradlew -q check}" > "../ci-$N.log" 2>&1); then
    "$G" pr comment "$N" --repo $R --body "Local check: green at $head merged with main." >/dev/null
    "$G" pr merge "$N" --repo $R --squash --delete-branch 2>&1 | tail -1
    echo "#$N $("$G" pr view "$N" --repo $R --json state -q .state)"
  else
    echo "#$N LOCAL CHECK FAILED at $head — see .worktrees/ci-$N.log"; tail -25 "$WT/../ci-$N.log"
    # keep the names of failed tests and changed screenshots (the build dir is reused by the next PR)
    grep -h -o 'testcase name="[^"]*" classname="[^"]*"[^>]*>[[:space:]]*<failure message="[^"]\{0,160\}' -r --include=*.xml "$WT"/composeApp/build/test-results "$WT"/core/*/build/test-results 2>/dev/null \
      | sed 's/&#10;.*//' | tee -a "$WT/../ci-$N.log" | head -12
  fi
done
