# TASKS — solbian-codex-pu-chief-of-staff-674f30

Status legend: `todo` · `doing` · `done` · `blocked`  
Every row: **owner** + **verify** command. Hardware gate: none for this goal.

Prior fill (`…-a4f6bf`, CWC-16 + MANIFEST) is complete on `main`. This goal is banner/README PUBLIC status only.

| id | status | owner | task | verify |
|----|--------|-------|------|--------|
| T0 | done | owner:cursor | Rewrite PLAN for PUBLIC-after-JD (2026-11-05 Lisbon); keep source pin; no page-set changes | `rg -n 'solbian-codex-pu-chief-of-staff-674f30' agents/PLAN.md && rg -n 'PUBLIC as of 2026-11-05' agents/PLAN.md && rg -n 'ec1fee1e9ba08dac3332e765885f8cd4cd2a0883' agents/PLAN.md` |
| T1 | done | owner:cursor | Write task breakdown with owner:cursor / owner:dsh + verify; document DSH `make check` + secret scan | `rg -n 'owner:dsh' agents/TASKS.md && rg -n 'make check' agents/PLAN.md agents/TASKS.md` |
| T2 | done | owner:cursor | Update README: remove stay-PRIVATE / do-not-publish; state PUBLIC after JD review on 2026-11-05 Lisbon | `rg -n 'PUBLIC' README.md && rg -n '2026-11-05' README.md && ! rg -qi 'stay PRIVATE\|do \*\*not\*\* publish\|PRIVATE\*\* until' README.md` |
| T3 | done | owner:cursor | Align `scripts/check.sh` README assertion with PUBLIC-after-JD wording (drop PRIVATE-required check) | `rg -n 'PUBLIC' scripts/check.sh && ! rg -n 'must state repo is PRIVATE' scripts/check.sh` |
| T4 | done | owner:cursor | Update non-page “private edition” banner in `MANIFEST.md` header only; do not touch CWC page bodies | `rg -n 'public edition' MANIFEST.md && ! rg -qi 'private edition' MANIFEST.md` |
| T5 | done | owner:cursor | Run portable check in planner VM; evidence in PR description only | `make check` |
| T6 | todo | owner:dsh | On vega-2: re-run portable check on this `cursor/**` branch | `make check` |
| T7 | todo | owner:dsh | Secret scan = 0 findings; paste transcript in PR description (do not commit STATE/RUN) | `gitleaks detect --source . --no-git \|\| true`  # replace with site scanner; require exit 0 / 0 leaks |
| T8 | todo | owner:dsh | Confirm this PR does not change page set (`CURRENT_WORKING_CODEX/**` bodies untouched) | `git diff origin/main...HEAD --name-only \| rg 'CURRENT_WORKING_CODEX/' \|\| echo 'OK: no CWC path changes'` |
| T9 | todo | owner:dsh | Read-only evidence: GitHub visibility already PUBLIC; do not enable Pages; do not merge; Cursor review BLOCKING=0 | `gh repo view pegamonstro/solbian-codex-public --json visibility,isPrivate -q '{visibility,isPrivate}'` |

## Notes for DSH

- Prefer verifying on this existing `cursor/**` branch / single PR.
- Never commit `RUN.md`, `agents/STATE.json`, or `STATE.json`.
- Never enable Pages, never merge to `main`, never flip visibility via API (already PUBLIC per JD).
- No `gate:hardware` step for this goal.
- Do not rewrite CWC pages or expand the page set.
