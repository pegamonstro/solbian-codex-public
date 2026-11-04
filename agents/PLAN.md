# PLAN — solbian-codex-pu-chief-of-staff-a4f6bf

**Goal:** Fill private `pegamonstro/solbian-codex-public` with **finished** Codex Solbian pages only, copied from `pegamonstro/solbian-codex`.  
**Role:** Cursor = architect/planner (this file). DSH on vega-2 = build/test. JD = review/gates.  
**As-of plan:** 2026-11-04 · **Repo visibility:** PRIVATE (do not change)

## Context read (planner)

| Artefact | Result |
|----------|--------|
| `.cursor/rules/duo.mdc` | **Absent** at start — bootstrapped in this PR |
| `agents/PLAN.md` | **Absent** — this file |
| `agents/STATE.json` | **Absent** — planner must not create/edit/commit it |
| `agents/DECISIONS.md` | **Absent** — planner must not create/edit it; JD items → OPEN QUESTIONS in PR |
| Open issues (`solbian-codex-public`) | None |
| Open PRs (`solbian-codex-public`) | None (this PR is the first) |
| Source tip | `pegamonstro/solbian-codex@ec1fee1e9ba08dac3332e765885f8cd4cd2a0883` (2026-11-03; includes JD D01–D03 record, CANONICAL: NONE) |

## Non-goals

- No merge to `main`, no Pages, no visibility change, no publish.
- No edits/deletes in `pegamonstro/solbian-codex`.
- No rpi4 / LAN / flash (`gate:hardware`: **not required** for this goal).
- No CANONICAL elevation; copies remain WORKING / SYNTHESIS as marked in source.

## Finished-page policy (proposed — gated by JD)

**Include** a page only if all are true:

1. Lives under `CURRENT_WORKING_CODEX/` (Living Working Codex prose / nav), **or** is an explicitly JD-approved companion listed below.
2. Is **not** a stub (`*.stub.md`), superseded pointer (`01_WHAT_IS.md`), DRAFT, INCOMPLETE, TODO, notes-only, session digest, or personal/private dialogue body.
3. Carries a completion / navigation token in-tree (e.g. `CODEX_WORKING_*_OK` / V2 OK) **or** is nav/outline required to read the set.
4. Contains no private dialogue message bodies, Mac-local secrets, or personal-only process notes.

**Exclude by default (do not copy):**

- `*.stub.md`, `01_WHAT_IS.md` (superseded pointer)
- `AUDIT/**` (forensic / workbook / draft surfaces)
- `meta/**` (session digests / wave status)
- `PROVENANCE/**`, `OPEN_QUESTIONS/**` (working packages outside CWC digest)
- `CONSTITUTION/**` (includes `CONSTITUTION_STUB_INCOMPLETE.md`)
- `DIALOGUE/**` (private-by-default SOURCE; redaction risk)
- `SYNTHESIS/**`, `CONCEPTS/**`, `ANNOTATIONS/**` (process / skeleton / sample)
- Historical inventory trees (`LAWS/`, `SCROLLS/`, `CHAPTERS/`, `PROTOCOLS/`, `ETHICS/`, `CANONS/`, `COVENANTS/`) as bulk dumps — unless JD opens a companion include
- `ARCH_PLACEMENT_README.md`, source `ORGANISATION.md` / source `README.md` (hub policy for the other repo)

### Candidate include set (source SHA `ec1fee1e9ba08dac3332e765885f8cd4cd2a0883`)

| Dest path (same relative) | Source path |
|---------------------------|-------------|
| `CURRENT_WORKING_CODEX/00_README.md` | `CURRENT_WORKING_CODEX/00_README.md` |
| `CURRENT_WORKING_CODEX/NAV.md` | `CURRENT_WORKING_CODEX/NAV.md` |
| `CURRENT_WORKING_CODEX/OUTLINE.md` | `CURRENT_WORKING_CODEX/OUTLINE.md` |
| `CURRENT_WORKING_CODEX/01_WHAT_IS_CODEX_SOLBIAN.md` | `CURRENT_WORKING_CODEX/01_WHAT_IS_CODEX_SOLBIAN.md` |
| `CURRENT_WORKING_CODEX/02_ORIGIN_AND_HISTORY.md` | `CURRENT_WORKING_CODEX/02_ORIGIN_AND_HISTORY.md` |
| `CURRENT_WORKING_CODEX/03_FOUNDATIONAL_CONCEPTS.md` | `CURRENT_WORKING_CODEX/03_FOUNDATIONAL_CONCEPTS.md` |
| `CURRENT_WORKING_CODEX/04_LAWS.md` | `CURRENT_WORKING_CODEX/04_LAWS.md` |
| `CURRENT_WORKING_CODEX/04b_ETHICS.md` | `CURRENT_WORKING_CODEX/04b_ETHICS.md` |
| `CURRENT_WORKING_CODEX/05_CANONS.md` | `CURRENT_WORKING_CODEX/05_CANONS.md` |
| `CURRENT_WORKING_CODEX/06_COVENANTS.md` | `CURRENT_WORKING_CODEX/06_COVENANTS.md` |
| `CURRENT_WORKING_CODEX/07_PROTOCOLS.md` | `CURRENT_WORKING_CODEX/07_PROTOCOLS.md` |
| `CURRENT_WORKING_CODEX/08_SCROLLS.md` | `CURRENT_WORKING_CODEX/08_SCROLLS.md` |
| `CURRENT_WORKING_CODEX/09_CHAPTERS.md` | `CURRENT_WORKING_CODEX/09_CHAPTERS.md` |
| `CURRENT_WORKING_CODEX/10_DIALOGUE_AND_METHOD.md` | `CURRENT_WORKING_CODEX/10_DIALOGUE_AND_METHOD.md` |
| `CURRENT_WORKING_CODEX/11_GLOSSARY.md` | `CURRENT_WORKING_CODEX/11_GLOSSARY.md` |
| `CURRENT_WORKING_CODEX/12_OPEN_QUESTIONS.md` | `CURRENT_WORKING_CODEX/12_OPEN_QUESTIONS.md` |

**Companion (OPEN QUESTION for JD — default OFF until answered):**

| Dest path | Source path | Why gated |
|-----------|-------------|-----------|
| `GLOSSARY/GLOSSARY_TERMS_2026-09-20.md` | `GLOSSARY/GLOSSARY_TERMS_2026-09-20.md` | Linked from CWC §11; titles inventory only — JD confirm include vs leave broken relative links |

### Generated / local (not from source corpus)

| Path | Owner | Notes |
|------|-------|-------|
| `MANIFEST.md` | DSH | Every copied page: dest path, source path, source commit SHA, content sha256 |
| `README.md` | Cursor (seed) / DSH (may refresh after copy) | States PRIVATE until JD review; points to NAV |

## Concrete implementation steps (DSH)

1. On vega-2, fetch `pegamonstro/solbian-codex` **read-only** at pin `ec1fee1e9ba08dac3332e765885f8cd4cd2a0883` (shallow clone or `git fetch` + checkout detached). **Do not push, delete, or mutate** that repo.
2. Confirm JD answers to OPEN QUESTIONS in the planner PR (or treat defaults: companion glossary OFF; include CWC candidate set as listed).
3. From a `cursor/**` working tree of `solbian-codex-public` (same feature branch unless JD directs otherwise), copy each approved page preserving relative paths (`mkdir -p` + `cp -a` or equivalent). No rewrite of doctrine; optional link-note only if JD requires.
4. Write root `MANIFEST.md` with one row per copied file: `dest`, `source_repo`, `source_path`, `source_commit`, `sha256`.
5. Ensure `.gitignore` excludes `RUN.md`, `agents/STATE.json`, `STATE.json`, secrets.
6. Run **`make check`** (must PASS).
7. Run secret scan (gitleaks or project equivalent) — **0 findings**.
8. Request / wait for Cursor review — **BLOCKING = 0**.
9. Put command transcripts in the PR description (not committed STATE/RUN). Leave merge, Pages, and visibility to JD.

## Exact check DSH must run

```bash
make check
```

Optional evidence (also paste into PR description):

```bash
# After pages + MANIFEST exist:
make check
# Secret scan (example; use site tooling if different):
gitleaks detect --source . --no-git -v
# Confirm still private (must remain private):
gh repo view pegamonstro/solbian-codex-public --json visibility -q .visibility
# Confirm source untouched:
# (no push to pegamonstro/solbian-codex; no local destructive ops)
```

**Hardware:** none. Do **not** add `gate:hardware` for this goal.

## OPEN QUESTIONS / gates for JD (not decided by agents)

1. **Finished set:** Approve the 16 CWC candidate pages above as the finished edition for this private fill? Add/remove any?
2. **Companion glossary:** Include `GLOSSARY/GLOSSARY_TERMS_2026-09-20.md` (default: omit until yes)?
3. **`12_OPEN_QUESTIONS.md`:** Keep (finished digest) or omit because the title is “open questions”?
4. **Broken relative links** to excluded AUDIT/PROVENANCE/etc.: leave as-is (provenance pointers), strip, or rewrite to absolute GitHub URLs on `solbian-codex`?
5. **Merge / Pages / visibility:** remain gated — do not merge to `main`, do not enable Pages, do not make public until JD explicitly says so.

## Planner deliverables in this PR

- `.cursor/rules/duo.mdc`
- `agents/PLAN.md` (this file)
- `agents/TASKS.md` (owner + verify per row)
- `Makefile` + `scripts/check.sh` (portable `make check`)
- Seed `README.md` / `.gitignore` updates as needed for the private edition workflow
