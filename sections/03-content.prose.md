# Content

## The window is a budget you can read

The window is finite, and everything loaded spends it whether or not it is
used. Anthropic's guidance calls context "a finite resource with diminishing
marginal returns" [@rajasekaran2025]; that is advice, not evidence.

`/context` draws current usage as a grid and breaks it down by category,
including which instruction and memory files loaded [@claudecode-commands;
@claudecode-context]. Run it in a fresh session: part of the budget is already
spent, because instruction files, auto memory and skill descriptions load
before you type anything [@claudecode-context].

When the budget runs out, the conversation is summarised. This is *compaction*.
The project-root `CLAUDE.md` is re-read from disk afterwards; an instruction
given only in conversation may not survive [@claudecode-memory].

## What `/context` shows at launch

![`/context` in a fresh session in this repository, before any prompt. Memory files is this repository's `CLAUDE.md` (4.2k) and the auto-memory index (163); the full readout is `demo/runs/context-at-launch-full.png`.](figures/context-at-launch.png){width=70%}

## The demo: one prompt, two windows

- **Question.** Does a project `CLAUDE.md` change what the agent does on a
  fixed task?
- **Substrate.** Single-commit copies of this repository's template commit,
  `b9f2176`, differing only in `CLAUDE.md`.
- **Arms.** A: the file absent. B: the shipped 240-line manual. Arm C, a
  32-line index, is reported on the index slide.
- **Task.** One fixed prompt: add an "Examples" section before the
  conclusion, following the project's conventions, with the build passing.
- **Runs.** Five per arm, headless; Claude Code 2.1.281, `claude-fable-5-1`.
- **Observables, numbered and fixed before any run.** 1 both files of the
  section created; 2 the sidecar in note form; 3 numeric order; 4 `just build`
  passing; 5 no commit; 6, the control: a convention stated nowhere in the
  substrate (nothing between `#` and the first `##`), expected to fail in
  every arm; 7 cost to the first edit.

## What changed, and what did not

- **Behaviour: a null result.** Observables 1 to 5 held in 5 of 5 runs in both
  arms; the control failed in 5 of 5 in both. Our prediction that the arms
  would separate failed.
- **Why.** Every convention the task touches is also in the README, the
  `justfile` or the existing sections, and the agent read those.
- **Tool calls before the first edit**, mean (range) over five runs: 25.2 (24–27)
  without the file, 18.6 (17–21) with the manual. The ranges separate.
- **Tokens at the first edit.** 47.2k (44.9–50.3) against 46.6k (44.7–49.1):
  overlapping. The manual spent its saving on its own 1,854 words.
- **Post hoc, not pre-registered.** B cited `CLAUDE.md` for its choices; A
  reached the same choices from the README and the existing files.

## CLAUDE.md as an index, not a manual

- `CLAUDE.md` loads in full at every launch and again after compaction: every
  line is paid for in every session [@claudecode-memory].
- An index holds commands, conventions that cannot be inferred from the files,
  and pointers. Detail stays in files read on demand.
- Formally, an index aims to be a *sufficient statistic* for the repository: a
  summary that keeps what a decision needs, here what to read next, and
  discards the rest.
- The documentation's target is "under 200 lines", as advice, not
  enforcement: the file arrives "as a user message after the system prompt"
  [@claudecode-memory]. This template ships a 240-line manual.
- **Arm C.** A 32-line index matched the manual on observables 1 to 5 and
  reached the first edit at 41.3k tokens (39.9–43.1), its worst run below the
  best of either other arm.

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
