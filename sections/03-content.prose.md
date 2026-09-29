# Content

## The window is a budget you can read

The window is finite, and everything loaded spends it whether or not it is
used. In our demo the manual changed none of the six behaviours we scored, so
every token it cost bought no change in what the agent did; that holds on any
window, which is why the argument for an index does not depend on window size.

::: notes
Anthropic's guidance calls context "a finite resource with diminishing
marginal returns" [@rajasekaran2025]; that is advice, not evidence.
:::

`/context` draws current usage as a grid and breaks it down by category,
including which instruction and memory files loaded [@claudecode-commands;
@claudecode-context]. Run it in a fresh session: part of the budget is already
spent, because instruction files, auto memory and skill descriptions load
before you type anything [@claudecode-context].

When the budget runs out, the conversation is summarised. This is *compaction*.
The project-root `CLAUDE.md` is re-read from disk afterwards; an instruction
given only in conversation may not survive [@claudecode-memory].

## What `/context` shows at launch

![`/context` in a fresh session in this repository, before any prompt.](figures/context-at-launch.png){width=70%}

::: notes
Memory files is this repository's `CLAUDE.md` (4.2k) and the auto-memory index
(163); the full readout is `demo/runs/context-at-launch-full.png`.
:::

## The demo: one prompt, two windows

::: notes
- **Question.** Does a project `CLAUDE.md` change what the agent does on a
  fixed task?
:::

- **Substrate.** Single-commit copies of this repository's template commit,
  `b9f2176`, a tutorial template whose sections are pairs of files. The
  copies differ only in `CLAUDE.md`.
- **Arms.** A, no file. B, the manual: the shipped 240-line `CLAUDE.md`. C,
  the index: 32 lines, reported in the table under § What changed, and what
  did not.
- **Task.** One fixed prompt: add an "Examples" section before the
  conclusion, following the project's conventions, with the build passing.
- **Observables, numbered and fixed before any run.** 1 both files of the
  section created; 2 the sidecar in note form; 3 numeric order; 4 `just build`
  passing; 5 no commit; 6, the control: a convention stated nowhere in the
  substrate (nothing between `#` and the first `##`), expected to fail in
  every arm; 7 cost to the first edit.

::: notes
- **Runs.** Five per arm, headless; Claude Code 2.1.281, `claude-fable-5-1`.
:::

## What changed, and what did not

| Arm | Observables 1–5 | Control | Tool calls to first edit | Tokens at first edit |
| ------- | --------- | ----- | -------------- | -------------- |
| A, no file | 5 of 5 | 0 of 5 | 25.2 (24–27) | 47.2k (44.9–50.3) |
| B, manual | 5 of 5 | 0 of 5 | 18.6 (17–21) | 46.6k (44.7–49.1) |
| C, index | 5 of 5 | 0 of 5 | 17.4 (16–19) | 41.3k (39.9–43.1) |

: Runs meeting each observable, of five; then mean (range) over five runs.

::: notes
- **Behaviour: a null result.** Observables 1 to 6 do not differ between
  arms. The control failed in every run, as expected for a convention stated
  nowhere: the rule was in no arm's window. Our prediction that observables 2
  and 5 would separate A from B failed.
- **Why.** The conventions behind observables 1 to 4 are also in the README,
  the `justfile` or the existing sections, and the agent read those.
  Observable 5 had no second source: no run committed unprompted.
- **Cost.** B made about seven fewer tool calls than A, and its token range
  overlaps A's. We infer, and did not measure, that the manual spent the
  saving on its own 1,854 words.
- **Post hoc, not pre-registered.** One B run of five cited `CLAUDE.md` for a
  choice. Four A runs of five named the README, the `justfile` and the
  existing sections as their source.
:::

On a repository that describes itself, the file changed the cost of reaching
the answer, not the answer.

## CLAUDE.md as an index, not a manual

- `CLAUDE.md` loads in full at every launch and again after compaction: every
  line is paid for in every session [@claudecode-memory].
- Arm C's index, six of its 32 lines; subheadings omitted
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
- An index holds commands, conventions that cannot be inferred from the files,
  and pointers. Detail stays in files read on demand.
- By analogy, an index is a *sufficient statistic*: enough to decide what to
  read next.
- The documentation's advice is a target of "under 200 lines"
  [@claudecode-memory]; this template ships a 240-line manual.
- The file arrives "as a user message after the system prompt", so its
  contents are advice to the model [@claudecode-memory].
- **Arm C.** The index matched the manual at the lowest cost of the three
  (table under § What changed, and what did not).
:::

## Layers: order is documented, conflict is not

- Instruction files load at launch in a documented order: managed policy,
  user, project, local. They are concatenated, not overriding
  [@claudecode-memory].
- Across directories the order runs from the filesystem root down to the
  working directory, with `CLAUDE.local.md` after `CLAUDE.md` at each level
  [@claudecode-memory].
- Conflict has no documented winner: "if two rules contradict each other,
  Claude may pick one arbitrarily" [@claudecode-memory]. `settings.json`, by
  contrast, has a fixed precedence [@claudecode-settings].
- **Place by stability and audience.** Personal habit: user. Team convention:
  project. Private or per-machine: local. This task only: the conversation.
- **The fix for a conflict** is to remove it, not to predict the winner.

## On demand: reachable is not loaded

- **Front-loaded.** `CLAUDE.md` at and above the working directory, plus its
  `@path` imports, "expanded and loaded into context at launch"
  [@claudecode-memory]. Moving text into imports saves nothing.
- **On demand.** The agent's own file reads, `@file` typed in a prompt, a
  subdirectory `CLAUDE.md`, path-scoped rules, a skill's body
  [@claudecode-memory; @claudecode-context; @claudecode-workflows].
- **Reachable only.** `--add-dir` grants file access. By default the added
  directory's `CLAUDE.md` and rules are not loaded [@claudecode-memory], but
  its skills, commands and subagents are [@claudecode-permissions], so it can
  still spend budget at launch.
- **Rule.** Front-load what every task needs and is short and stable. Defer
  the rest, which Anthropic's post calls "just in time" [@rajasekaran2025].
- **Here.** The `/round` skill's description loads at launch; its body loads
  only on use.

## Pitfalls: symptom, then the structural fix

- **A rule in `CLAUDE.md` is ignored.** The file is too long, or the rule
  conflicts with another. Cut or resolve. If the rule must hold, enforce it
  with a hook or a permission setting [@claudecode-memory].
- **An instruction given in chat is obeyed, then lost late in a long
  session.** It was summarised away at compaction. Put it in a file
  [@claudecode-memory].
- **The agent uses something you removed.** Observed in our demo, post hoc:
  a superseded run recovered a deleted `CLAUDE.md` from git history, and a
  dry run acted on an auto memory saved in another directory. Check what is
  reachable, not only what is loaded.

Every fix changes what is loaded, or when. None is a rewording.
