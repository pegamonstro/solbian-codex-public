# PLAN — solbian-codex-pu-chief-of-staff-674f30

**Goal:** Update README (and any “PRIVATE until JD” banners) so they state this public edition is **PUBLIC as of 2026-11-05** after JD review. Do **not** change page content.  
**Role:** Cursor = architect/planner (this file + banner/README wording). DSH on vega-2 = verify (`make check`, secret scan). JD = merge / Pages gates.  
**As-of plan:** 2026-11-05 (Lisbon) · **Edition status:** PUBLIC after JD review (2026-11-05 Lisbon)

## Context read (planner)

| Artefact | Result |
|----------|--------|
| `.cursor/rules/duo.mdc` | Present — Cursor planner + DSH builder; agents never merge/Pages/flip visibility themselves |
| `agents/PLAN.md` | Prior goal `…-a4f6bf` (CWC-16 private fill) — superseded by this plan |
| `agents/STATE.json` | **Absent** — planner must not create/edit/commit it |
| `agents/DECISIONS.md` | **Absent** — planner must not create/edit it; JD items → OPEN QUESTIONS in PR |
| Open issues (`solbian-codex-public`) | None |
| Open PRs (`solbian-codex-public`) | None at plan start (this PR is the deliverable) |
| GitHub visibility (read-only check) | Already `PUBLIC` / `isPrivate: false`; description notes PUBLIC 2026-11-05 after JD review |
| Source pin (unchanged) | `pegamonstro/solbian-codex@ec1fee1e9ba08dac3332e765885f8cd4cd2a0883` |
| Page set | 16 CWC pages + `MANIFEST.md` already in-tree from prior fill — **do not alter page bodies** |

## Non-goals

- No edits under `CURRENT_WORKING_CODEX/**` (no page-set / doctrine changes).
- No new page copies; no source-pin change; no mutations to `pegamonstro/solbian-codex`.
- No merge to `main`, no enabling GitHub Pages, no agent-driven visibility API flips (repo already PUBLIC via JD).
- No rpi4 / LAN / flash (`gate:hardware`: **not required**).

## Banner / wording policy (this goal)

**Replace** any “stay PRIVATE / do not publish until JD” language with a clear public-edition notice:

- Edition is **PUBLIC** after JD review on **2026-11-05** (Lisbon).
- README must **not** say stay PRIVATE, do not publish, or withhold visibility pending review.
- Portable check (`scripts/check.sh`) must assert the PUBLIC-after-JD wording (not the old PRIVATE reminder).

**In scope paths:** `README.md`, root status banners (e.g. `MANIFEST.md` edition line), `scripts/check.sh`, `agents/PLAN.md`, `agents/TASKS.md`.  
**Out of scope:** CWC page prose (even if a page mentions “visibility” in doctrine tables).

## Concrete implementation steps

### Cursor (this PR)

1. Rewrite `agents/PLAN.md` / `agents/TASKS.md` for task `…-674f30` (owner + verify per row).
2. Update `README.md`: remove PRIVATE / do-not-publish banner; state PUBLIC after JD review on 2026-11-05 Lisbon.
3. Update any non-page “private edition / PRIVATE until JD” banners (e.g. `MANIFEST.md` title/policy line only).
4. Align `scripts/check.sh` README assertion with PUBLIC-after-JD wording.
5. Run **`make check`** in the planner VM; paste transcript in the PR description.
6. Open/update **one** `cursor/**` PR. Do not merge.

### DSH (vega-2)

1. Pull the `cursor/**` branch; confirm diff does **not** change `CURRENT_WORKING_CODEX/**` page bodies.
2. Run **`make check`** (must PASS).
3. Run secret scan (gitleaks or site equivalent) — **0 findings**.
4. Paste transcripts in the PR description (do not commit STATE/RUN).
5. Leave merge and GitHub Pages to JD.

## Exact check DSH must run

```bash
make check
```

Optional evidence (paste into PR description only):

```bash
make check
# Secret scan (example; use site tooling if different):
gitleaks detect --source . --no-git -v
# Confirm no page-set drift in this PR:
git diff origin/main...HEAD --name-only | rg 'CURRENT_WORKING_CODEX/' || echo 'OK: no CWC path changes'
# Read-only visibility evidence (do not flip):
gh repo view pegamonstro/solbian-codex-public --json visibility,isPrivate -q .
```

**Hardware:** none. Do **not** add `gate:hardware` for this goal.

## OPEN QUESTIONS / gates for JD (not decided by agents)

1. **Merge this PR?** Agents will not merge to `main`.
2. **GitHub Pages?** Repo description/visibility already reflect PUBLIC after JD review; enabling Pages remains a JD-only gate (agents must not enable Pages).
3. **Carry-over from prior fill (still open unless JD already answered elsewhere):** companion glossary include? link policy for excluded trees? keep `12_OPEN_QUESTIONS.md`?

## Planner deliverables in this PR

- `agents/PLAN.md` (this file)
- `agents/TASKS.md` (owner + verify per row)
- `README.md` PUBLIC-after-JD banner
- Non-page private-edition banner cleanup (`MANIFEST.md` header only)
- `scripts/check.sh` assertion aligned with PUBLIC wording
