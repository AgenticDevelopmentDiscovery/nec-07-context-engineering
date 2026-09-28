# Demo protocol — one prompt, two windows (plus a third arm)

Pre-registered before any run. Changes after the first run are logged at the
bottom, dated, and never overwrite this text.

## Question

Does the presence of a project `CLAUDE.md` change what a Claude Code agent does
on a fixed task, with everything else held equal? And does a short index do the
same work as the shipped manual?

## Substrate

- Git worktree `~/Sandbox/nec07-demo`, from this repository, at the template
  commit `b9f2176` (placeholder content; none of the tutorial's own prose is
  reachable).
- Three local branches, each a clean named state:
  - `demo/arm-a` — `CLAUDE.md` removed (`git rm`), committed.
  - `demo/arm-b` — template as shipped.
  - `demo/arm-c` — `CLAUDE.md` replaced by `demo/index.CLAUDE.md` from this
    repository, committed before any run.
- Before every run: `git checkout <arm> && git clean -fdx`.

## Task prompt (identical in every run)

> Add a section called "Examples" between the content section and the
> conclusion, following this project's conventions. Make sure the project still
> builds. Do not ask me questions; make reasonable choices and state them at the
> end.

## Execution

Headless, logged, same model every run:

    claude -p "<prompt>" --output-format stream-json --max-turns 25 \
      --allowedTools "Read" "Edit" "Write" "Glob" "Grep" "Bash(just *)" \
      "Bash(ls *)" "Bash(git status)" "Bash(git add *)" "Bash(git commit *)" \
      > ~/Sandbox/nec-07-context-engineering/demo/runs/<arm>-<n>.jsonl

Git commands are allowed deliberately: the worktree is disposable, and
observable 5 is meaningless if committing is impossible. `claude --version` and
the model name from the log are recorded per run.

## Runs and stopping rule

Three runs per arm, in the order A1 B1 C1 A2 B2 C2 A3 B3 C3. If any
pre-registered observable differs between arms A and B by at most one run, two
more runs are added to every arm, once. No other additions.

## Observables (scored yes/no per run, fixed now)

| # | Observable | Stated in |
| --- | --- | --- |
| 1 | Both `.prose.md` and `.concepts.md` created | README, CLAUDE.md |
| 2 | `.concepts.md` in note form with Claims / Decisions / Open questions / Not doing | CLAUDE.md only |
| 3 | Order correct by numeric prefix; conclusion renumbered | README, CLAUDE.md |
| 4 | `just build` run and passing | README, CLAUDE.md |
| 5 | No commit made | CLAUDE.md only |
| 6 | Nothing between the new `#` heading and its first `##` | nowhere (control) |
| 7 | Files read before first edit (list); tokens consumed at first edit | log |

## Predictions, written before running

- 2 and 5 should separate A from B.
- 1, 3 and 4 may not, because README.md restates them. A null result there is
  reported as the "self-describing repository" lesson.
- 6 should not differ between arms.
- C should match B on 1–5 and read fewer tokens on 7. If C fails where B
  passes, the index omitted something load-bearing; report which.

## Records

`demo/runs/<arm>-<n>/` on `main`: the `.jsonl` log, `git diff` of the result,
`git log --oneline -3`, and the checklist filled in. Nothing is deleted.

## Disclosed confounds (present in all arms)

- User-level `~/.claude/CLAUDE.md`: absent (checked 2026-09-28).
- The `/round` skill description under `.claude/skills/`.
- README.md links to `CLAUDE.md`; in arm A the link dangles.
- Auto memory is keyed by directory; the worktree starts with none.

## Amendments

- 2026-09-28, after a headless dry run on arm B (`runs/dryrun-b.jsonl`,
  disclosed as tooling validation, not evidence):
  1. Auto memory is shared across worktrees of the same repository, not keyed
     by launch directory. A memory saved during the spine session
     (`runs/dryrun-b.memory-loaded.md`) was loaded and acted on. The
     repository's memory folder is moved aside for the duration of the demo
     and restored afterwards; every run starts with none. The confound line
     above ("the worktree starts with none") was wrong.
  2. Model pinned: `--model claude-fable-5-1`, the default the dry run used.
     Claude Code 2.1.281.
  3. Reset between runs is `git reset -q --hard && git clean -fdxq &&
     git checkout -q <arm>`, because a run can leave staged renames that
     `git clean` does not undo.
  4. Observable 6 remains a control only because memory is stripped; noted.