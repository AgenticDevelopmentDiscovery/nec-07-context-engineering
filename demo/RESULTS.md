# Demo results — one prompt, three windows

Fifteen headless runs of one fixed prompt on three single-commit copies of
the template commit `b9f2176`, differing only in the project `CLAUDE.md`:
absent (A), the shipped 240-line manual (B), or a pre-registered 33-line
index (C). Protocol, amendments, and every run's log are in this folder.
Claude Code 2.1.281, model `claude-fable-5-1`, 2026-09-28.

## Pre-registered observables: 15/15 identical

| # | Observable | A | B | C |
| --- | --- | --- | --- | --- |
| 1 | Both `.prose.md` and `.concepts.md` created | 5/5 | 5/5 | 5/5 |
| 2 | Sidecar in note form with the four headings | 5/5 | 5/5 | 5/5 |
| 3 | Numeric order; conclusion renumbered | 5/5 | 5/5 | 5/5 |
| 4 | `just build` run and passing | 5/5 | 5/5 | 5/5 |
| 5 | No commit made | 5/5 | 5/5 | 5/5 |
| 6 | Nothing between `#` and first `##` (control) | 0/5 | 0/5 | 0/5 |

The manual changed nothing the agent did. Every convention the task touches
is also stated in `README.md`, the `justfile`, or the four existing section
pairs, and the agent read those. In arm A it said so: "Missing `CLAUDE.md`
… I followed the conventions from the README, `justfile` and the existing
sections instead." (a-1, final message.)

## Observable 7: cost to the first edit

| Arm | `Read` calls before first edit | Tokens at first edit | Turns | Seconds |
| --- | --- | --- | --- | --- |
| A — absent | 17.0 (14–20) | 47.2k (44.9–50.3) | 49 (44–56) | 147 (125–165) |
| B — manual | 11.6 (9–13) | 46.6k (44.7–49.1) | 51 (42–64) | 181 (137–261) |
| C — index | 9.8 (9–11) | 41.3k (39.9–43.1) | 42 (37–50) | 129 (110–156) |

Means with ranges over five runs. Reads = `Read` tool calls before the first
`Edit` or `Write`, the observable as registered. Tokens = cache-read +
cache-creation + input tokens on the assistant turn that made the first
`Edit` or `Write`. Per-run values: `table.sh`.

- **Tokens.** C's worst run (43.1k) is below A's best (44.9k) and B's best
  (44.7k): no overlap. A and B overlap almost entirely. The manual saved
  about five `Read` calls per run; that it spent the saving on its own 1,854
  words is inferred, not measured.
- **Reads.** B and C both separate from A (B's worst, 13, is below A's best,
  14). B and C overlap. The manual did reduce reading; it did not reduce cost.
- **Turns and seconds.** C lowest on both; ranges overlap. Tendency only.
  b-4 (261 s) is the one outlier.

No significance testing, per protocol. Counts and ranges only.

## Predictions against outcomes

| Prediction | Outcome |
| --- | --- |
| 2 and 5 separate A from B | **Failed.** Both 5/5 in every arm. |
| 1, 3, 4 may not separate (README restates them) | Held. |
| 6 does not differ between arms | Held: 0/5 everywhere. |
| C matches B on 1–5 and reads fewer tokens | Held, and C also beats A. |

## What the demo supports, and what it does not

Supports: on a repository that already describes itself, a manual-length
`CLAUDE.md` buys no behaviour and does not reduce cost against no file at all; a
short index matches the manual's behaviour at the lowest cost of the three.
Every line of a loaded instruction file is paid for every session.

Does not support: any claim about repositories that do *not* describe
themselves, about tasks whose conventions live only in `CLAUDE.md`, about
other models, or about correctness — every run was correct.

## Post-hoc observations (not pre-registered; labelled as such)

- **Tool calls of every kind before the first edit** (post hoc; the
  registered measure is reads): A 25.2 (24–27), B 18.6 (17–21), C 17.4
  (16–19). Per-run values: the `calls` column of `table.sh`.
- **Provenance of the same action differs.** Arm B justified choices by
  citing `CLAUDE.md` ("names renumbering as the way to change the arc");
  arm A reached identical choices from the README and existing files.
- **Run-to-run variation is real.** The new section got 3 `##` units in 12
  runs and 4 in two (c-1, c-5). Three runs (a-3, b-1, b-3) renumbered with
  `mv` rather than `git mv`, leaving the rename unstaged.
- **Every run edited `topic.md`** (and `CLAUDE.md` where present) to fix the
  stale section numbering — unasked, and correct.
- **Reachable is loaded, if the agent wants it.** The superseded first A1
  recovered the removed `CLAUDE.md` from git history
  (`runs/superseded-a-1-history-leak`). The dry run acted on an auto-memory
  saved in a different directory (`runs/dryrun-b.memory-loaded.md`). Both
  are inputs to the window that no file in the repository states.

## Threats to validity, disclosed

- The task is one prompt on one template. Conventions with no second source
  in the repository were not tested; observable 2 turned out to have one
  (the existing sidecars).
- Bash was not gated by `--allowedTools` (sandbox auto-allow); equal across
  arms.
- The `/round` skill description was in the window in every arm.
- The index was written by the presenter, before any run, from the manual
  alone (`index.CLAUDE.md`, committed at `273faf9`).

## `/context` reading at launch (not a demo run)

- 2026-09-29, `runs/context-at-launch-full.png`: `/context` in a fresh
  session in this repository, before any prompt. Claude Code VS Code
  extension, light theme, model `claude-fable-5-1`. Installed that day:
  extension 2.1.284, CLI 2.1.281; the panel shows neither, and the date is
  the file's. 32.5k of 1.0M tokens used, autocompact buffer 33.0k;
  `CLAUDE.md` 4.3k, auto-memory index 163.
  `figures/context-at-launch.png` is its category table, 840 × 565 px.