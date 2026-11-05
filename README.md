# solbian-codex-public

Codex Solbian **public edition** (finished pages only).

**Visibility: PRIVATE** until JD has reviewed it. Do **not** publish, enable GitHub Pages, or change visibility without an explicit JD decision.

## Status

- Planner bootstrap: agent-duo v1 plan + tasks (`agents/PLAN.md`, `agents/TASKS.md`).
- Finished-page copy from `pegamonstro/solbian-codex@ec1fee1e9ba08dac3332e765885f8cd4cd2a0883` is in-tree (16 CWC pages; companion glossary omitted pending JD).
- Start at [`CURRENT_WORKING_CODEX/NAV.md`](CURRENT_WORKING_CODEX/NAV.md); provenance in [`MANIFEST.md`](MANIFEST.md).

## Check

```bash
make check
```

## Source

Finished pages are copied read-only from `pegamonstro/solbian-codex` at the commit pinned in `agents/PLAN.md`. Nothing is deleted from the source repo.
