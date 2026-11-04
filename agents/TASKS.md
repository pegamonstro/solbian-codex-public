# TASKS — solbian-codex-pu-chief-of-staff-a4f6bf

Status legend: `todo` · `doing` · `blocked` · `done`  
Every row: **owner** + **verify** command. Hardware gate: none for this goal.

| id | status | owner | task | verify |
|----|--------|-------|------|--------|
| T0 | done | owner:cursor | Bootstrap duo rules + PLAN for finished-page private fill; pin source SHA `ec1fee1e9ba08dac3332e765885f8cd4cd2a0883` | `test -f agents/PLAN.md && test -f .cursor/rules/duo.mdc && rg -n 'ec1fee1e9ba08dac3332e765885f8cd4cd2a0883' agents/PLAN.md` |
| T1 | done | owner:cursor | Write task breakdown with owners + verify commands; document DSH copy steps and `make check` | `rg -n 'owner:dsh' agents/TASKS.md && rg -n 'make check' agents/PLAN.md agents/TASKS.md` |
| T2 | done | owner:cursor | Add portable `Makefile` / `scripts/check.sh` (planner mode PASS without pages; builder mode requires MANIFEST + pages) | `make check` |
| T3 | todo | owner:dsh | Fetch `pegamonstro/solbian-codex` read-only at pin SHA; do not mutate source | `git -C /path/to/solbian-codex rev-parse HEAD \| grep -q '^ec1fee1e9ba08dac3332e765885f8cd4cd2a0883$'` |
| T4 | blocked | owner:dsh | Confirm JD OPEN QUESTIONS (finished set / companion glossary / §12 / link policy) before copy; default = CWC-16 only, companion OFF | `rg -n 'OPEN QUESTIONS / gates for JD' agents/PLAN.md` |
| T5 | todo | owner:dsh | Copy approved finished pages into this repo preserving relative paths; exclude stubs, drafts, AUDIT/meta/DIALOGUE/etc. per PLAN | `test -f CURRENT_WORKING_CODEX/NAV.md && ! test -f CURRENT_WORKING_CODEX/01_WHAT_IS.stub.md && ! test -d AUDIT` |
| T6 | todo | owner:dsh | Write `MANIFEST.md` listing every copied page with source path + source commit + sha256 | `test -f MANIFEST.md && rg -n 'ec1fee1e9ba08dac3332e765885f8cd4cd2a0883' MANIFEST.md && rg -c 'CURRENT_WORKING_CODEX/' MANIFEST.md` |
| T7 | todo | owner:dsh | Run portable check after copy | `make check` |
| T8 | todo | owner:dsh | Secret scan = 0 findings; paste transcript in PR description (do not commit STATE/RUN) | `gitleaks detect --source . --no-git \|\| true`  # replace with site scanner; require exit 0 / 0 leaks |
| T9 | todo | owner:dsh | Confirm repo still PRIVATE; Pages not enabled; no push to `main`; Cursor review BLOCKING=0 | `gh repo view pegamonstro/solbian-codex-public --json visibility,hasPages -q '{visibility,hasPages}'` |
| T10 | todo | owner:cursor | After DSH evidence lands: refresh PLAN/TASKS status notes if needed; keep single `cursor/**` PR; do not merge | `gh pr view --json isDraft,mergeable,url` |

## Notes for DSH

- Prefer implementing on the existing `cursor/**` branch / PR so the goal stays **one** PR.
- Never commit `RUN.md`, `agents/STATE.json`, or `STATE.json`.
- Never enable Pages or change visibility.
- No `gate:hardware` step for this goal.
