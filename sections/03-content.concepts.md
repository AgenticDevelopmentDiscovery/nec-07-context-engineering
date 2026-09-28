# Content — spine

> Note form only; never rendered. Every `##` below is one `##` of the prose, so
> one slide. Tags and the writing constraint are defined in
> `01-context.concepts.md`.

**Purpose.** HOW. Readable budget, the demo, the index, layers, on-demand
loading, pitfalls. Seven slides.

## The window is a budget you can read

### Claims

- Finite, and spent by everything loaded whether or not it is used. `[CITE:
  Anthropic 2025, "finite resource with diminishing marginal returns" — vendor
  guidance, not evidence]`
- `/context` shows what occupies the window and what each category costs.
  `[DOCS: commands page]`
- Part of the budget is spent at launch, before any prompt. `[RUN: /context in
  a fresh session here]`
- Compaction is the boundary: when the budget runs out the conversation is
  summarised. Named, not explained.
- Project-root `CLAUDE.md` is re-read from disk after compaction. Instructions
  given only in chat are not guaranteed to survive. `[DOCS: memory page]`

### Decisions

- Figure = annotated `/context` reading of this repository at launch. Model and
  instrument on one slide. Rejected: an abstract stacked bar — a second figure
  restating the first.
- "Budget", not "position-weighted budget".
- Percentages, not token counts.

### Open questions

- Does the `/context` grid survive projection and PDF, or must it be redrawn as
  SVG (`figures/README.md` prefers vector)?
- Model, instrument and boundary under one heading. Overflow candidate.
  Fallback: the compaction lines move to § Pitfalls.
- Auto memory belongs to T16 but is loaded at launch, so it appears in the
  figure. Label it, or crop it?

### Not doing

- How compaction summarises (T08).
- Formal framing as a unit of its own. One sentence, on the index slide.

## The demo: one prompt, two windows

### Claims

- Throwaway git worktree at the template commit `b9f2176`. Same prompt, same
  model, fresh session per run.
- Arms: A, project `CLAUDE.md` moved out. B, `CLAUDE.md` as shipped. C, a
  ~30-line index in its place.
- This unit compares A with B. C is reported under § CLAUDE.md as an index.
- Observables fixed before any run: both files of the pair created; spine in
  note form; order by numeric prefix; `just build` run; nothing committed;
  files read and percentage of window used before the first edit.
- Several runs per arm. Counts reported, not one transcript.

### Decisions

- Evidence = recorded diff with counts. A short live rerun of one arm is
  optional alongside it.
- Worktree, not the live tree. Demo edits would land in `sections/`, and an
  absent `CLAUDE.md` could be committed.
- Template commit, not the current state. Otherwise the tutorial's own prose
  about `CLAUDE.md` is within the agent's reach in arm A.
- Remove by moving the file. Rejected: `--bare`, which also drops skills, hooks
  and memory. `[DOCS: cli-reference page — check]`

### Open questions

- Exact prompt. Candidate: "Add a section on X between 03-content and
  04-conclusion", which forces the numbering decision.
- Runs per arm.
- Still loaded in every arm: user-level `CLAUDE.md`, auto memory, the `/round`
  skill description. Disclose or strip?
- Live rerun: which arm, and what is said if it disagrees with the recorded
  counts?
- Heading says two windows; protocol has three arms. Keep the heading?
- Symbolic-regression repository, if released before the talk. Same protocol;
  observables rewritten.

### Not doing

- Comparing models.
- Significance testing. Counts only.

## What changed, and what did not

### Claims

- All `[RUN]`. None written until the demo has been run.
- Expectation, not a claim: the gap may be in exploration cost more than in
  correctness. `README.md`, `justfile` and the placeholder comments restate
  most conventions.
- Conventions stated only in `CLAUDE.md` are where behaviour should differ, for
  example "Do not commit unless asked". `[RUN: confirm which are unique]`

### Decisions

- A null result is reported as a null result. Lesson then: a self-describing
  repository needs less in `CLAUDE.md`.
- Side-by-side diff of outputs, not transcripts.

### Open questions

- If the result is null, what does the talk's argument rest on? Decide before
  the prose is written.
- Which observables turned out not to discriminate. Report them; do not drop
  them silently.

### Not doing

- Showing the best run.

## CLAUDE.md as an index, not a manual

### Claims

- Loaded in full at every launch and re-read after compaction. Every line is
  paid for in every session. `[DOCS: memory page]`
- An index holds commands, conventions that cannot be inferred from the files,
  and pointers. Detail stays in files read on demand.
- Formal framing, one sentence: an index is a sufficient statistic for the
  repository — enough to decide what to read next, without holding the
  contents.
- Vendor guidance: "target under 200 lines per CLAUDE.md file". `[DOCS: memory
  page]`
- Delivered "as a user message after the system prompt". Advice, not
  enforcement. `[DOCS: memory page]`
- This repository's `CLAUDE.md`: 240 lines, about 1,850 words. A manual by
  design.
- Arm C against arm B: `[RUN]`. Only comparison that tests index against
  manual.

### Decisions

- Tension named openly: the demo substrate breaks the rule this unit teaches,
  and the template defends that choice. Rejected: saying nothing.
- Argued from cost per session, not from authority.
- Formal framing kept to one sentence here. Rejected: a slide, and a boxed
  aside.

### Open questions

- Who writes the ~30-line index, and by what rule? Written after seeing arms A
  and B, it is tuned to the prompt.
- "Sufficient statistic": known to the whole mixed-discipline audience, or
  glossed in one clause? The analogy holds for choosing what to load, not for
  the contents.
- Any study of adherence against instruction-file length? The docs assert it.
  None found.
- Seven claims under one heading. Overflow candidate.

### Not doing

- Rewriting this repository's `CLAUDE.md`.
- `AGENTS.md` and other tools' equivalents.

## Layers: order is documented, conflict is not

### Claims

- Loaded at launch: managed policy, user, project, local. Concatenated, not
  overriding. `[DOCS: memory page]`
- Ordered from filesystem root to working directory; local after project at
  each level. `[DOCS: memory page]`
- "If two rules contradict each other, Claude may pick one arbitrarily."
  `[DOCS: memory page]`
- `settings.json` has a deterministic winner. Instruction files do not. `[DOCS:
  settings page]`
- Placement by stability and audience: personal habit → user; team convention →
  project; private or per-machine → local; this task → the conversation.
- Structural fix for a conflict: remove it.

### Decisions

- Capability is placement, load order and conflict removal. Rejected:
  "predict which layer wins" — the docs contradict it.
- The conversation is the fourth place an instruction can live. It is not a
  file layer.
- Managed policy named in the load order, not taught.

### Open questions

- Does the later instruction win in practice? Testable with the demo protocol.
  Not claimed without runs.

### Not doing

- Provenance labelling. Out of scope in `topic.md`; no capability depends on
  it.
- `settings.json` precedence beyond the one contrast.
- Managed policy deployment.

## On demand: reachable is not loaded

### Claims

- On demand: `@file` typed in a prompt, subdirectory `CLAUDE.md`, path-scoped
  rules, skill bodies, the agent's own file reads. `[DOCS: memory and
  context-window pages]`
- Front-loaded: `@path` imports inside `CLAUDE.md` — "expanded and loaded into
  context at launch". `[DOCS: memory page]`
- `--add-dir` extends access and loads nothing. `CLAUDE.md` in an added
  directory is not loaded by default. `[DOCS: memory page]`
- Rule: front-load what every task needs and is short and stable. Defer what is
  long, volatile, or needed by some tasks only.
- Local example: `/round`. Description in the window from launch; `SKILL.md`
  body only on invocation. `[DOCS: context-window page]`

### Decisions

- Term is "on demand", as in `topic.md`. "Just-in-time" appears once, as the
  source's word. `[CITE: Anthropic 2025]`
- Example taken from this repository, not invented.
- Two lists, front-loaded against on demand. One contrast, one slide.

### Open questions

- Show a subdirectory `CLAUDE.md`? None exists here, and adding one changes the
  demo substrate.
- `@file` typed in a prompt: the docs do not contrast it with imports. `[RUN]`
- Figure: a timeline of what enters when. Earns its place, or restates the two
  lists?

### Not doing

- Embeddings and RAG (T09). One clause naming retrieval as the same question at
  scale.
- MCP resources.

## Pitfalls: symptom, then the structural fix

### Claims

- Candidates. Keep three, preferring ones observed in own sessions.
- Rule is in `CLAUDE.md` and ignored → file too long, or rule in conflict → cut
  or resolve. If it must hold, a hook or permission. `[DOCS: memory page]`
- `CLAUDE.md` slimmed by moving text into imports → nothing saved. `[DOCS:
  memory page]`
- Chat instruction obeyed, then lost late in a long session → summarised away →
  put it in a file. `[DOCS: memory page]` `[RUN]`
- Directory added with `--add-dir`, agent does not know its contents →
  reachable, not loaded. `[DOCS: memory page]`
- Agent re-derives a known result → pointer missing from the index.

### Decisions

- Symptom first, per the template.
- Every fix changes what is loaded or when. None is a rewording.
- This unit delivers the diagnosis named in `metadata.yaml` `audience`.

### Open questions

- Which of these has the author hit? Mark observed against documented.

### Not doing

- Prompt injection through tool output.
- Subagents as context isolation. Not in `topic.md` scope.
