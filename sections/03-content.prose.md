# Content

## The window is a budget you can read

The window is finite, and everything loaded spends it whether or not it is
used.

::: notes
Anthropic's guidance calls context "a finite resource with diminishing
marginal returns" [@rajasekaran2025]; that is advice, not evidence.
:::

Run `/context` in a fresh session: part of the budget is already spent
[@claudecode-context].

::: notes
`/context` shows what is filling the window. The documentation describes "a
colored grid" [@claudecode-commands] and a breakdown by category, with the
instruction and memory files that loaded [@claudecode-context]. The VS Code
panel draws a bar and a table; the figure shows the table. The launch cost is
instruction files, auto memory and skill descriptions, which load before you
type anything [@claudecode-context].
:::

*Compaction* summarises the conversation [@claudecode-context], and the
project-root `CLAUDE.md` is re-read afterwards [@claudecode-memory].

::: notes
Compaction happens automatically as the window approaches its limit
[@claudecode-context]. An instruction given only in conversation may not
survive it [@claudecode-memory].
:::

## What `/context` shows at launch

![`/context`: 32.5k spent; 33.0k held back for compaction (the autocompact buffer).](figures/context-at-launch.png){height=63%}

Memory files is this repository's `CLAUDE.md` — the row you write.

::: notes
The figure is the category table from a fresh session in this repository,
before any prompt. The four largest rows counted in the 32.5k are System tools
(17.4k), Skills (4.7k), System prompt (4.5k) and Memory files (4.4k). The
autocompact buffer is reserved on top of them. Memory files is this
repository's `CLAUDE.md` plus the auto-memory index. Skills is skill
descriptions, and the panel does not break the row down by source. In our
demo runs the logs list 28 skills at launch; one of them, `/round`, is this
repository's. The harness controls System tools and System prompt. The full
readout, with the total in its header and Memory files listed per file, is
`demo/runs/context-at-launch-full.png`.
:::

## The demo: does a project CLAUDE.md change what the agent does?

::: notes
- **Question.** Does a project `CLAUDE.md` change what the agent does on a
  fixed task?
- **Substrate.** Single-commit copies of this repository's template commit,
  `b9f2176`, a tutorial template whose sections are pairs of files. The
  copies differ only in `CLAUDE.md`.
- **Arms.** A, no file. B, the manual: the shipped 240-line `CLAUDE.md`. C,
  the index: 33 lines, reported in the table under § What changed, and what
  did not. D, added later: C's index plus one line stating the control rule,
  reported under § The follow-up.
:::

![One prompt, three windows: the three arms of 2026-09-28, copies of this template at commit `b9f2176` differing only in `CLAUDE.md`. Arm D is under § The follow-up.](figures/three-windows.svg){height=36%}

- **Task.** One fixed prompt: add an "Examples" section before the
  conclusion, following the project's conventions, with the build passing.
- **Observables, fixed before any run.** Five conventions (1–5); a control
  (6), stated nowhere, expected not to differ; cost to the first edit (7).

::: notes
- **Observables 1 to 5.** 1, both files of the new section created: its
  prose, and its notes file, `.concepts.md`. 2, the notes file in note form
  under four headings: Claims, Decisions, Open questions, Not doing. 3, the
  section placed by the numeric prefix of its filename, with the conclusion
  renumbered. 4, `just build` run and passing. 5, no commit made.
- **The control, 6.** Nothing between the new `#` heading and its first `##`.
  Stated nowhere in arms A to C; in arm D, stated in `CLAUDE.md`.
- **Observable 7.** Files read before the first edit, and tokens consumed at
  it.
- **Runs.** Five per arm, headless; Claude Code 2.1.281, `claude-fable-5-1`.
  Arms A to C ran on 2026-09-28. Arm D was pre-registered, with its
  prediction, and run on 2026-10-05, interleaved with five fresh arm-C runs
  (`demo/PROTOCOL.md`, items 9 to 16).
:::

## What changed, and what did not

| Arm | All of 1–5 | Control | Reads to first edit | Tokens at first edit |
| -------- | ------------ | ------ | ------------- | -------------- |
| A, no file | 5 of 5 | 0 of 5 | 17.0 (14–20) | 47.2k (44.9–50.3) |
| B, manual | 5 of 5 | 0 of 5 | 11.6 (9–13) | 46.6k (44.7–49.1) |
| C, index | 5 of 5 | 0 of 5 | 9.8 (9–11) | 41.3k (39.9–43.1) |

: Runs of five meeting all of 1–5, and the control; then mean (range).

The manual changed no scored behaviour; the index matched it at lower cost,
with no overlap of ranges. Why cut 5k tokens on a 1.0M window? Tokens that
change no scored behaviour are cost on any window.

::: notes
- **Behaviour: a null result.** Observables 1 to 6 do not differ between
  arms. The control was met in 0 of 5 in every arm; the protocol predicted no
  difference. After the runs, we explain the zero by the rule being in no
  arm's window; arm D, under § The follow-up, puts it there. Our prediction
  that observables 2 and 5 would separate A from B failed.
- **Why.** The conventions behind observables 1 to 4 are also in the README,
  the `justfile` or the existing sections, and the agent read those.
  Observable 5 is stated in `CLAUDE.md` and, for the end of a critique round,
  in the `/round` skill's file, `.claude/skills/round/SKILL.md`, which every
  arm-A run read or searched before its first edit. No run committed, in any
  arm, and we did not test why arm A did not. By default Claude Code also
  puts its own instructions for writing commits in the window, in the Bash
  tool's description [@claudecode-settings-reference]; the demo's command did
  not turn them off, and the page does not say what they tell the agent about
  when to commit.
- **Cost.** The manual reduced reading before the first edit, with no token
  saving the ranges can separate. Reads are `Read` tool calls. B made about
  five fewer than A, and the two ranges do not overlap; its token range
  overlaps A's. We infer, and did not measure, that the manual spent the
  saving on its own 1,854 words. The index matched the manual on 1–5 at
  41.3k tokens against 46.6k.
- **Post hoc, not pre-registered.** One B run of five cited `CLAUDE.md` for a
  choice. Four A runs of five named the README, the `justfile` and the
  existing sections as their source.
:::

## The follow-up: a rule only the file states

Arm D: arm C's index plus one line stating the control rule; pre-registered.

| Arm | All of 1–5 | Observable 6 | Reads to first edit | Tokens at first edit |
| ---------------- | ----------- | ------------- | ------------------ | ------------------- |
| D, index + rule | 5 of 5 | 3 of 5 | 9.2 (8–11) | 40.2k (38.2–42.1) |
| C, index, fresh | 5 of 5 | 0 of 5 | 9.6 (8–11) | 39.8k (39.0–40.8) |

: Runs of 2026-10-05, D interleaved with five fresh arm-C runs; mean (range).

We predicted at least 4 of 5 for arm D; it failed: 3 of 5. Where the
repository already states a convention, the file changed cost, not behaviour.
Where only the file states it, behaviour changed in 3 of 5 runs against 0 of
5.

::: notes
- **The line.** Arm D's `CLAUDE.md` is `demo/index-d.CLAUDE.md`: arm C's
  index with one bullet added under its conventions, "Put nothing between a
  section's `#` heading and its first `##` (no comment, no text); pandoc turns
  it into an extra slide." Nothing else differs. The four existing sections
  of the template all break the rule, each with a comment in that position,
  so arm D tests one written rule against four contrary examples
  (`demo/PROTOCOL.md`, items 9 and 13).
- **Why fresh arm-C runs.** A user-level settings file and plugin directory
  were modified on 2026-10-05 and their state on 2026-09-28 is not recorded,
  so arm D is compared with five arm-C runs made the same day, c-6 to c-10,
  interleaved with d-1 to d-5, and not with the runs of 2026-09-28. Same
  version, Claude Code 2.1.281, and model (`demo/PROTOCOL.md`, items 14 to
  18).
- **Predictions, fixed before any run.** Arm D meets observable 6 in at
  least 4 of 5 runs: failed, 3 of 5 (d-1, d-2, d-3). Arm D meets 1 to 5 in 5
  of 5: held. The fresh arm-C runs meet 1 to 5 in 5 of 5 and 6 in 0 of 5:
  held (`demo/RESULTS.md` § Arm D: predictions against outcomes).
- **Cost.** Reads and tokens are in the table, defined as in the table
  before. No claim is made about the difference between D and fresh C.
- **Post hoc, not pre-registered.** Three of 5 against 0 of 5, the same day:
  a one-sided Fisher exact test gives p = 10/120, about 0.083. No
  significance claim is made. The three runs that met the rule kept a
  guidance comment in the new file, below its first `##`, and their final
  messages cite the `CLAUDE.md` rule; d-1 wrote it there from the start, d-2
  and d-3 first wrote it between the `#` and the `##` and moved it in a later
  edit. d-4 and d-5 wrote it between and did not edit the file again; what
  their final messages say is under § Pitfalls.
:::

## CLAUDE.md as an index, not a manual

- The project-root `CLAUDE.md` loads in full at every launch and again after
  compaction: every line is paid for in every session [@claudecode-memory].
- An index holds commands, conventions the files cannot supply, and pointers.
- Arm C's index, six of its 33 lines; subheadings omitted
  (`demo/index.CLAUDE.md`):

```markdown
# nel-course — index
One Markdown source in `sections/`, three outputs, improved one
critique round at a time. Toolchain and setup: README.md.
- `just build` — all three outputs. Run it before finishing. Also
  `just doc`, `just slides`, `just site`, `just serve`.
…
- Do not commit unless asked.
…
```

::: notes
- In an index, detail stays in files read on demand. The course notes state
  the same rule as "reference, not inclusion" [@coursenotes2026, § 4.3.3].
- By analogy, an index is a *sufficient statistic*: enough to decide what to
  read next.
- The documentation's advice is a target of "under 200 lines"
  [@claudecode-memory]; this template ships a 240-line manual.
- The file arrives "as a user message after the system prompt", so its
  contents are advice to the model [@claudecode-memory].
:::

## Layers: order is documented, conflict is not

![The four instruction-file layers and their load order [@claudecode-memory].](figures/layers.svg){height=45%}

Place by stability and audience: personal habit → user; team convention →
project; per-machine → local; this task only → the conversation. Remove a
conflict; do not predict the winner.

::: notes
- Instruction files load at launch in a documented order: managed policy,
  user, project, local. They are concatenated, not overriding
  [@claudecode-memory].
- Across directories the order runs from the filesystem root down to the
  working directory, with `CLAUDE.local.md` after `CLAUDE.md` at each level
  [@claudecode-memory].
- Conflict has no documented winner: "if two rules contradict each other,
  Claude may pick one arbitrarily" [@claudecode-memory]. `settings.json`, by
  contrast, has a fixed precedence [@claudecode-settings].
- **Where each layer lives.** User: `~/.claude/CLAUDE.md`. Project:
  `./CLAUDE.md` or `./.claude/CLAUDE.md`, shared through version control.
  Local: `./CLAUDE.local.md`, kept out of version control, for what is
  private as well as per-machine. Managed policy is a file your organisation
  installs for every user; you do not edit it [@claudecode-memory].
- **A conflict, as an illustration; not an observed case.** Your user file
  says "commit after every change". This project's file says "Do not commit
  unless asked". Both load, and neither overrides the other. The project rule
  is the team's, so remove the line from the user file.
:::

## On demand: reachable is not loaded

![What enters the window, and when. Sources: memory, context-window and permissions pages.](figures/window-timeline.svg){height=49%}

- **Rule.** Front-load what every task needs and is short and stable. Defer
  the rest, which Anthropic's post calls "just in time" [@rajasekaran2025].

::: notes
- **Front-loaded.** `CLAUDE.md` at and above the working directory, plus its
  `@path` imports, "expanded and loaded into context at launch"
  [@claudecode-memory]; skill descriptions and auto memory
  [@claudecode-context]. Moving text into imports saves nothing.
- **On demand.** The agent's own file reads, `@file` typed in a prompt, a
  subdirectory `CLAUDE.md`, path-scoped rules, a skill's body
  [@claudecode-memory; @claudecode-context; @claudecode-workflows].
- **Both: `--add-dir`.** It grants file access. By default the added
  directory's `CLAUDE.md` and rules are not loaded [@claudecode-memory], but
  its skills, commands and subagents are [@claudecode-permissions], so it can
  still spend budget at launch.
- **Here.** The `/round` skill's description loads at launch; its body loads
  only on use.
- **Where each is written.** An import is `@path/to/file` inside a
  `CLAUDE.md`. A path-scoped rule is a file in `.claude/rules/` with a
  `paths` field; it loads when the agent works with matching files. A
  subdirectory `CLAUDE.md` loads when the agent reads files in that directory
  [@claudecode-memory].
- **Two files decided.** Arm C's index, as `CLAUDE.md`: front-loaded, because
  every task needs its commands and it is 33 lines. `README.md`: deferred.
  The index names it, "Toolchain and setup: README.md", without an `@`, so it
  is a pointer and not an import.
:::

## Pitfalls: symptom, then the structural fix

| Symptom | Check | Fix |
| --------- | ------------ | ------------ |
| A `CLAUDE.md` rule is ignored | `/context`: loaded? Read the file, not the summary | Cut, resolve, or enforce by a hook or permission |
| A chat instruction is obeyed, then lost | `/memory` (lists loaded files): is it in any listed file? | Put it in a file |
| Removed but used | `git log`; `/memory` | Reachable, not just loaded |

: Rows 1–2: the memory page [@claudecode-memory]; rows 1 and 3: our demo, post hoc. A hook is a script the tool runs.

Every fix changes what is loaded, or when.

::: notes
- **Ignored rule.** The file is too long, or the rule conflicts with another:
  cut or resolve. If the rule must hold, enforce it with a hook or a
  permission setting [@claudecode-memory]. Check: run `/context` and read the
  list under Memory files; a file missing there was never seen
  [@claudecode-memory]. Then read the file the agent wrote, not its summary.
  Our own case, post hoc: in arm D the rule was in `CLAUDE.md`, so in the
  window from launch [@claudecode-memory], and d-4 and d-5 did not follow
  it. d-4's final message says the comment was kept below the first `##`;
  its recorded file has the comment between the `#` heading and the first
  `##`. d-5's says there is no extra slide between the Examples heading and
  its first `##`; its recorded file has the comment between them, and the
  deck built after the run has an extra frame titled "Examples" on page 19
  (`demo/RESULTS.md` § Arm D: post-hoc observations).
- **Lost instruction.** Obeyed, then lost late in a long session: it was
  summarised away at compaction, so put it in a file [@claudecode-memory].
  Check: look for it in the files `/memory` lists; an instruction in no file
  was given only in conversation [@claudecode-memory].
- **Removed but used.** Observed in our demo, post hoc: a superseded run
  recovered a deleted `CLAUDE.md` from git history, and a dry run acted on an
  auto memory saved in another directory. Check what is reachable, not only
  what is loaded: run `git log` to see whether history still holds the file,
  and `/memory` to open the auto-memory folder [@claudecode-memory]. In a
  headless run, read `memory_paths` in the log's first event.
- **The superseded run** was the first arm-A run, on a branch where a commit
  had removed the manual. The agent ran `git show HEAD~1:CLAUDE.md` and read
  it, so the run was voided (`demo/runs/superseded-a-1-history-leak/`).
- **The dry run** was a trial on arm B before the demo. Worktrees of one
  repository share an auto-memory directory [@claudecode-memory], so a memory
  saved in this repository loaded, and the agent followed it
  (`demo/runs/dryrun-b.jsonl`, `demo/runs/dryrun-b.memory-loaded.md`).
- None of these fixes is a rewording.
:::
