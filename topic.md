# Topic

## In one sentence

Context engineering is deciding what occupies a model's finite context window at
each step — what goes in, in what order, at what detail, and when — because at
any moment the model knows only what is in the window.

## What it is

A language model has no memory beyond its context window: a bounded token budget
holding the system prompt, standing instructions, retrieved files, prior turns,
tool outputs, and the current message. Context engineering is the practice of
curating that budget. It operates on the environment an instruction runs inside,
not on the wording of the instruction, and it has two levers: what enters the
window (selection and timing) and how it is arranged (ordering, precedence, and
labelling of origin). In Claude Code the concrete instruments are `CLAUDE.md` and
its layers, on-demand file reads, `@file` and `--add-dir`, `/context`, and
`/compact`.

## Why it belongs in this course

An agent's competence at each step is largely a function of its window contents;
repositories are large and windows are not. Two failure modes bound the problem:
with too little context the agent guesses at conventions, re-derives known
results, or hallucinates; with too much, the relevant signal is buried, cost
rises, and attention degrades with position — the "lost in the middle" effect.
Prompting (Tutorial 06) cannot fix either, because the fault is in what the model
can see, not in what it was told. This is the center of Spine 2: retrieval,
memory, and automated context management are all answers to the question of what
goes in the window.

## What the reader will be able to do

- Enumerate what is in the window at a given moment of a Claude Code session,
  and read `/context` to see what it costs.
- Write a `CLAUDE.md` that works as an index — pointers, conventions, commands —
  rather than a manual, and verify on a fixed prompt that it changed the agent's
  behavior.
- Layer instructions by stability and precedence (global → project → local →
  task) and predict which layer wins when they conflict.
- Decide, for a given file, whether to front-load it or pull it in just-in-time,
  and know the mechanism for each.
- Recognize the two failure modes from their symptoms and name the structural
  fix rather than a rewording.

## Scope

**In scope**

- Window anatomy and the token budget
- Position effects on attention
- Instruction layers and precedence
- `CLAUDE.md` as an index
- Just-in-time loading (`@file`, `--add-dir`, subdirectory `CLAUDE.md`)
- Provenance labelling
- Compaction as the boundary of the budget

**Out of scope**

- Prompt wording and patterns — Tutorial 06
- Internals of automated compaction and summarization — Tutorial 08
- Embeddings and RAG — Tutorial 09; retrieval is context engineering at scale,
  named here but not taught
- Persistent agent memory — Tutorial 16
- Model-specific window sizes and pricing — change too often to be tutorial
  content

## Shape

- Default four-section arc kept.
- `03-content` carries the weight: mental model (the window as a
  position-weighted budget) → basic case (the `CLAUDE.md` contrast demo) →
  going further (layers and just-in-time loading) → pitfalls.
- Talk is 10 minutes, 15 max, so the deck stays near 13 content slides; the
  document may run fuller.

## Open questions

- Demo substrate. Default: this repository itself — remove `CLAUDE.md`, ask the
  agent to add a section, restore it, repeat. Switch to the course
  symbolic-regression repo (as the topic brief prescribes) if it is available
  before the talk; the demo shape is identical either way.
- Whether one `##` unit of formal framing (`CLAUDE.md` as a compressed index,
  demand paging, the closed-loop view) earns its place in the prose or belongs
  as a boxed aside — risk of losing the cross-disciplinary reader.
- Whether the "lost in the middle" claim can be cited from the primary study
  (Liu et al., 2023) — to be verified in `references.bib` before it appears in
  prose.
- Whether to add a skeptic persona to the panel for Q&A preparation.