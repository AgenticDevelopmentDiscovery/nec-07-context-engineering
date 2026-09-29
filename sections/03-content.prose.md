# Content

## The window is a budget you can read

The window is finite, and everything loaded spends it whether or not it is
used.

::: notes
Anthropic's guidance calls context "a finite resource with diminishing
marginal returns" [@rajasekaran2025]; that is advice, not evidence.
:::

`/context` shows what is filling the window. The documentation describes "a
colored grid" [@claudecode-commands] and a breakdown by category, with the
instruction and memory files that loaded [@claudecode-context]. The VS Code
panel draws a bar and a table; the figure shows the table. Run it in a fresh
session: part of the budget is already spent, because instruction files, auto
memory and skill descriptions load before you type anything
[@claudecode-context].

As the window approaches its limit, the conversation is summarised
automatically [@claudecode-context]. This is *compaction*. The project-root
`CLAUDE.md` is re-read from disk afterwards; an instruction given only in
conversation may not survive [@claudecode-memory].

## What `/context` shows at launch

![`/context` at launch: 32.5k spent; 33.0k autocompact buffer reserved, not counted.](figures/context-at-launch.png){width=70%}

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

## The demo: one prompt, three windows

::: notes
- **Question.** Does a project `CLAUDE.md` change what the agent does on a
  fixed task?
:::

- **Substrate.** Single-commit copies of this repository's template commit,
  `b9f2176`, a tutorial template whose sections are pairs of files. The
  copies differ only in `CLAUDE.md`.
- **Arms.** A, no file. B, the manual: the shipped 240-line `CLAUDE.md`. C,
  the index: 33 lines, reported in the table under § What changed, and what
  did not.
- **Task.** One fixed prompt: add an "Examples" section before the
  conclusion, following the project's conventions, with the build passing.
- **Observables, fixed before any run.** Five conventions scored per run
  (1–5). One control (6): a convention stated nowhere in the substrate,
  expected not to differ between arms. Cost to the first edit (7).

::: notes
- **Observables 1 to 5.** 1, both files of the new section created: its
  prose, and its notes file, `.concepts.md`. 2, the notes file in note form
  under four headings: Claims, Decisions, Open questions, Not doing. 3, the
  section placed by the numeric prefix of its filename, with the conclusion
  renumbered. 4, `just build` run and passing. 5, no commit made.
- **The control, 6.** Nothing between the new `#` heading and its first `##`.
- **Observable 7.** Files read before the first edit, and tokens consumed at
  it.
- **Runs.** Five per arm, headless; Claude Code 2.1.281, `claude-fable-5-1`.
:::

## What changed, and what did not

| Arm | All of 1–5 | Control | Reads to first edit | Tokens at first edit |
| -------- | ------------ | ------ | ------------- | -------------- |
| A, no file | 5 of 5 | 0 of 5 | 17.0 (14–20) | 47.2k (44.9–50.3) |
| B, manual | 5 of 5 | 0 of 5 | 11.6 (9–13) | 46.6k (44.7–49.1) |
| C, index | 5 of 5 | 0 of 5 | 9.8 (9–11) | 41.3k (39.9–43.1) |

: Runs of five meeting all of 1–5, and the control; then mean (range).

::: notes
- **Behaviour: a null result.** Observables 1 to 6 do not differ between
  arms. The control was met in 0 of 5 in every arm; the protocol predicted no
  difference. After the runs, we explain the zero by the rule being in no
  arm's window. Our prediction that observables 2 and 5 would separate A from
  B failed.
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
  saving on its own 1,854 words.
- **Post hoc, not pre-registered.** One B run of five cited `CLAUDE.md` for a
  choice. Four A runs of five named the README, the `justfile` and the
  existing sections as their source.
:::

The manual changed no scored behaviour. The index matched it on 1–5 at 41.3k
tokens against 46.6k, with no overlap of ranges. Why cut 5k tokens on a 1.0M
window? Tokens that change no scored behaviour are cost on any window. On a
repository that describes itself, the file changed the cost of reaching the
answer, not the answer.

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
- In an index, detail stays in files read on demand.
- By analogy, an index is a *sufficient statistic*: enough to decide what to
  read next.
- The documentation's advice is a target of "under 200 lines"
  [@claudecode-memory]; this template ships a 240-line manual.
- The file arrives "as a user message after the system prompt", so its
  contents are advice to the model [@claudecode-memory].
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

::: notes
- **Where each layer lives.** User: `~/.claude/CLAUDE.md`. Project:
  `./CLAUDE.md` or `./.claude/CLAUDE.md`, shared through version control.
  Local: `./CLAUDE.local.md`, kept out of version control. Managed policy is
  a file your organisation installs for every user; you do not edit it
  [@claudecode-memory].
- **A conflict, as an illustration; not an observed case.** Your user file
  says "commit after every change". This project's file says "Do not commit
  unless asked". Both load, and neither overrides the other. The project rule
  is the team's, so remove the line from the user file.
:::

## On demand: reachable is not loaded

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
- **Rule.** Front-load what every task needs and is short and stable. Defer
  the rest, which Anthropic's post calls "just in time" [@rajasekaran2025].
- **Here.** The `/round` skill's description loads at launch; its body loads
  only on use.

::: notes
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
