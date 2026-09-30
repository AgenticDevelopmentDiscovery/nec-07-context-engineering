# Topic

## In one sentence

Context engineering is deciding what occupies a model's finite context window at
each step — what goes in, when, and at what level of detail — because what the
model knows about this session and this repository is what is in the window.

## What it is

A language model carries what it was trained on in its weights; everything else
it can use right now — the system prompt, standing instructions, files it has
read, prior turns, tool outputs, the current message — sits in a bounded token
budget called the context window. Context engineering is the practice of
curating that budget. It acts on what the model can see, not on the wording of
the request. The reader controls selection and timing; the harness controls most
of the ordering. In Claude Code the concrete instruments are `CLAUDE.md` and its
layers, on-demand file reads, `@file` typed in a prompt, `--add-dir`, `/context`,
and `/compact`.

## Why it belongs in this course

In an agentic loop the window fills from tool calls and file reads, not only
from what the person types; repositories exceed windows, so something always
decides what is left out. Two failure modes bound the problem: with too little
context the agent guesses at conventions, re-derives what the repository already
records, or invents; with too much, performance degrades as input grows, and
older models retrieved mid-context information worse than information at the
edges. Rewording the request cannot fix either, because the fault is in what the
model can see. This is the center of the course's second thread (context
engineering): retrieval, memory, and automated context management are all
answers to the question of what goes in the window.

## What the reader will be able to do

- Read what is in the window at a given moment of a Claude Code session with
  `/context`, and say what each part costs.
- Write a `CLAUDE.md` that works as an index — commands, conventions that cannot
  be inferred from the files, pointers — and test on a fixed prompt, over
  repeated runs, whether it changed the agent's behavior.
- Place an instruction in the right layer (user, project, local, or the
  conversation) by stability and audience, know the order in which the layers
  load, and remove a conflict rather than rely on precedence.
- Decide, for a given file, whether to front-load it or let it be pulled in on
  demand, and know which mechanisms do which.

## Scope

**In scope**

- Window anatomy and the token budget, read with `/context`
- Degradation with input length; position effects, dated and hedged
- Instruction layers: load order, placement by stability, conflict removal
- `CLAUDE.md` as an index rather than a manual
- Front-loaded versus on-demand: `@path` imports versus typed `@file`,
  subdirectory `CLAUDE.md`, path-scoped rules, and skill bodies
- `--add-dir`, which belongs to neither group: an added directory's
  `CLAUDE.md` and rules are not loaded; its skills, commands and subagents are
- Compaction as the boundary of the budget, named but not explained

**Out of scope**

- Prompt wording and patterns — Tutorial 06
- Internals of automated compaction and summarization — Tutorial 08
- Embeddings and RAG — Tutorial 09; retrieval is context engineering at scale,
  named here but not taught
- Persistent agent memory — Tutorial 16
- Provenance labelling — no capability above depends on it
- Model-specific window sizes and pricing — change too often to be tutorial
  content; the tutorial reports token counts, not percentages

## Shape

- Default four-section arc kept, rebalanced: 01-context 2 units, 02-motivation
  2, 03-content 8, 04-conclusion 2, for 14 content slides in a 10-minute talk
  (15 max). Origin history and "when to reach for it" fold into motivation
  rather than taking slides of their own.
- `03-content`: the window as a readable budget → what `/context` shows at
  launch → the demo (does a project `CLAUDE.md` change what the agent does?)
  → what changed and what did not → `CLAUDE.md` as index → layers →
  on-demand loading → pitfalls.
- The demo runs on three independent single-commit copies of the template
  commit `b9f2176`, differing only in the project `CLAUDE.md`: absent, the
  shipped manual, or a 33-line index. Five runs per arm, and observables
  fixed before any run. The arm with the 33-line index is the one that tests
  the index-versus-manual claim. Results are presented as a recorded diff with
  counts; a short live rerun of one arm is optional. A null result is reported
  as a null result.
- The formal framing (an index as a sufficient statistic for the repository)
  gets one sentence under § CLAUDE.md as an index, not a manual. It does not
  get a slide of its own.
- The subtitle keeps the course brief's phrasing; the precise claim (weights
  versus window) is made on the first slide.

## Open questions

- Resolved: document length. The document carries `::: notes` blocks: teaching
  detail that prints in the document and the site and stays off the slides.
  Recorded under House conventions in `CLAUDE.md`.
- Resolved: `section-titles: false` removes pandoc's section frame; Metropolis's
  own section page remains. Empty extra frames come from content placed between
  a `#` heading and its first `##` (the placeholder comments); write nothing
  there.
- Resolved: what else is loaded in every arm. User-level `CLAUDE.md` was
  absent, auto memory was stripped, and the `/round` skill description was
  kept and disclosed (`demo/PROTOCOL.md` § Disclosed confounds, Amendments 1
  and 7; `demo/RESULTS.md` § Threats to validity).
- Whether the course symbolic-regression repository, if released before the
  talk, replaces this one as the demo substrate; observables would have to be
  rewritten for it.