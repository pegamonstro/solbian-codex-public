#!/usr/bin/env bash
# Portable check for solbian-codex-public (planner + builder modes).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

fail() { echo "FAIL: $*" >&2; exit 1; }
pass() { echo "OK: $*"; }

echo "== solbian-codex-public check =="
echo "cwd=$ROOT"

# --- Always: planner scaffolding ---
test -f agents/PLAN.md || fail "agents/PLAN.md missing"
test -f agents/TASKS.md || fail "agents/TASKS.md missing"
test -f .cursor/rules/duo.mdc || fail ".cursor/rules/duo.mdc missing"
test -f README.md || fail "README.md missing"
pass "planner scaffolding present"

rg -q 'owner:cursor' agents/TASKS.md || fail "TASKS.md missing owner:cursor"
rg -q 'owner:dsh' agents/TASKS.md || fail "TASKS.md missing owner:dsh"
rg -q 'make check' agents/PLAN.md agents/TASKS.md || fail "PLAN/TASKS must reference make check"
rg -q 'ec1fee1e9ba08dac3332e765885f8cd4cd2a0883' agents/PLAN.md || fail "PLAN.md missing source pin SHA"
pass "TASKS owners + PLAN pin + make check references"

# Forbidden committed artefacts (duo hard rule). RUN.md / STATE files may live
# in the working tree as local evidence; they must never be tracked/committed.
for banned in RUN.md agents/STATE.json STATE.json; do
  if git ls-files --error-unmatch -- "$banned" >/dev/null 2>&1; then
    fail "banned path is tracked in git: $banned (do not commit)"
  fi
done
pass "no banned STATE/RUN files committed"

# Public-edition notice in README (after JD review 2026-11-05 Lisbon)
rg -qi 'PUBLIC' README.md || fail "README.md must state edition is PUBLIC"
rg -q '2026-11-05' README.md || fail "README.md must cite PUBLIC-as-of 2026-11-05"
if rg -qi 'do \*\*not\*\* publish|PRIVATE\*\* until|stay PRIVATE' README.md; then
  fail "README.md must not tell readers to stay PRIVATE / not publish"
fi
pass "README PUBLIC-after-JD notice"

# --- Builder mode when MANIFEST exists ---
if [[ -f MANIFEST.md ]]; then
  echo "-- builder mode (MANIFEST.md present) --"
  rg -q 'ec1fee1e9ba08dac3332e765885f8cd4cd2a0883' MANIFEST.md || fail "MANIFEST.md missing source commit pin"
  # Every non-header, non-empty line that looks like a path entry should exist
  # Manifest format: markdown table or "path | source | commit | sha256"
  # NOTE: no bash-4 builtins here (macOS /bin/bash 3.2 has no `mapfile`).
  dests="$(rg -oN 'CURRENT_WORKING_CODEX/[A-Za-z0-9_./-]+\.md' MANIFEST.md | sort -u)"
  [[ -n "$dests" ]] || fail "MANIFEST.md lists no CURRENT_WORKING_CODEX pages"
  while IFS= read -r p; do
    [[ -f "$p" ]] || fail "MANIFEST lists missing file: $p"
  done <<< "$dests"
  pass "MANIFEST pages exist ($(printf '%s\n' "$dests" | wc -l | tr -d ' ') unique CWC paths)"

  # Hard excludes must not appear
  for bad in \
    CURRENT_WORKING_CODEX/01_WHAT_IS.stub.md \
    CURRENT_WORKING_CODEX/01_WHAT_IS.md \
    AUDIT \
    DIALOGUE \
    meta
  do
    if [[ -e "$bad" ]]; then
      fail "excluded path must not be present: $bad"
    fi
  done
  # stub glob
  if compgen -G 'CURRENT_WORKING_CODEX/*.stub.md' > /dev/null; then
    fail "stub pages must not be copied: CURRENT_WORKING_CODEX/*.stub.md"
  fi
  pass "excluded draft/private trees absent"

  # Optional companion: if present, must be listed in MANIFEST
  if [[ -f GLOSSARY/GLOSSARY_TERMS_2026-09-20.md ]]; then
    rg -q 'GLOSSARY/GLOSSARY_TERMS_2026-09-20.md' MANIFEST.md || fail "companion glossary present but not in MANIFEST.md"
    pass "companion glossary listed in MANIFEST"
  fi
else
  echo "-- planner mode (no MANIFEST.md yet; DSH copy pending) --"
  pass "planner-only tree accepted"
fi

echo
echo "ALL CHECKS PASSED"
