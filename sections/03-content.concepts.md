# Content — spine

> Note form only; never rendered. Every `##` below is one `##` of the prose, so
> one slide. Tags and the writing constraint are defined in
> `01-context.concepts.md`.

**Purpose.** HOW. Readable budget, the `/context` reading, the demo, the index,
layers, on-demand loading, pitfalls. Eight slides.

## The window is a budget you can read

### Claims

- Finite, and spent by everything loaded whether or not it is used. `[CITE:
  Anthropic 2025, "finite resource with diminishing marginal returns" — vendor
  guidance, not evidence]`
- `/context` shows what occupies the window and what each category costs.
  `[DOCS: commands page]`
  - Prose names both, each with its source. Commands page: "Visualize
    current context usage as a colored grid." Context-window page: "a live
    breakdown by category with optimization suggestions, including which
    CLAUDE.md and auto memory files loaded". The recorded VS Code panel: a
    bar and a table.
  - Not "in the terminal": neither page names a surface for the grid.
- Part of the budget is spent at launch, before any prompt. `[DOCS:
  context-window page]`
  - Run: 32.5k tokens used at launch in this repository,
    `demo/runs/context-at-launch-full.png`.
  - "Run it in a fresh session" refers to the figure by its heading, § What
    `/context` shows at launch.
- Compaction is the boundary: the conversation is summarised automatically as
  the window approaches its limit, not when it runs out. `[DOCS:
  context-window page]` Named, not explained.
- Project-root `CLAUDE.md` is re-read from disk after compaction. Instructions
  given only in chat are not guaranteed to survive. `[DOCS: memory page]`

### Decisions

- Figure = `/context` reading of this repository at launch, an unannotated
  capture. The reading is in the caption and the notes, not drawn on the
  image. Model and instrument on one slide. Rejected: an abstract stacked
  bar — a second figure restating the first. Superseded in part: the figure
  has its own slide, § What `/context` shows at launch.
- Marginal-value sentence removed from this unit (round 002, item 1). It used
  "the manual", "an index" and "the six behaviours" before the demo defined
  them. Now under § What changed, and what did not, after the table.
- "Budget", not "position-weighted budget".
- Token counts, not percentages. Supersedes "percentages, not token counts".

### Open questions

- Model, instrument and boundary under one heading. Overflow candidate.
  Fallback: the compaction lines move to § Pitfalls.

### Not doing

- How compaction summarises (T08).
- Formal framing as a unit of its own. One sentence, under § CLAUDE.md as an
  index, not a manual.

## What `/context` shows at launch

### Claims

- All from the recorded reading, `demo/runs/context-at-launch-full.png`:
  VS Code extension, light theme, 880 × 998 px, saved 2026-09-29
  (`demo/RESULTS.md` § `/context` reading at launch).
- The figure, `figures/context-at-launch.png`, is the same capture cropped to
  the category table, CATEGORY header row to Free space: 840 × 565 px. The
  header with the total, the bar and the per-file block are outside the crop.
- Used at launch: 32.5k of 1.0M tokens, from the header of the full readout.
  Not in the figure.
- Rows, as displayed: System prompt 4.5k, System tools 17.4k, MCP tools 671,
  MCP server instructions 717, Memory files 4.4k, Skills 4.7k, Messages 10.
  The rounded rows sum to 32.4k against a header of 32.5k.
- Autocompact buffer 33.0k: reserved, not counted in the 32.5k. Free space
  934.5k. 32.5k + 33.0k + 934.5k = 1.0M.
- Caption carries both: 32.5k spent, 33.0k buffer reserved and not counted.
  Cut to fit one line on the slide; "a fresh session in this repository,
  before any prompt" is in the notes.
- Notes, the four largest rows counted in the 32.5k: System tools 17.4k,
  Skills 4.7k, System prompt 4.5k, Memory files 4.4k.
- Notes: Memory files = this repository's `CLAUDE.md` plus the auto-memory
  index. No per-file numbers in the prose. In the full readout: `CLAUDE.md`
  4.3k, auto-memory index 163.
- Notes: Skills = skill descriptions loaded from this repository and the user
  level. Not confirmed that all 4.7k comes from this repository, so not
  claimed.
- Notes: the harness controls System tools and System prompt.
- Notes: pointer to the full readout.

### Decisions

- Figure on its own slide. Not shared with § The window is a budget you can
  read.
- Token counts, not percentages.
- Scale ("5k tokens on a 1.0M window, why bother?") answered by marginal
  value, under § What changed, and what did not. Not answered here.
- Per-file numbers (4.3k, 163) are not in the notes. They are in the full
  readout, which the notes point to.
- Source is the light-theme capture. Supersedes the dark capture: 32.3k used,
  Memory files 4.3k, `CLAUDE.md` 4.2k, Free space 934.7k.
- "This repository controls Memory files and Skills" dropped. Skills includes
  user-level skills.

### Open questions

- Moved from § The window is a budget you can read: does the `/context` panel
  survive projection and PDF, or must it be redrawn as SVG
  (`figures/README.md` prefers vector)?
- Moved from the same unit: auto memory belongs to T16 but is loaded at
  launch, so it appears in the figure. Label it, or crop it?

### Not doing

- Window sizes as a subject (`topic.md` § Scope). The 1.0M in the figure is
  the reading, not a claim.

## The demo: one prompt, three windows

### Claims

- Three independent single-commit copies of the template commit `b9f2176`.
  Same prompt, same model, headless, fresh session per run
  (`demo/PROTOCOL.md` Amendment 5).
- Arms: A, project `CLAUDE.md` moved out. B, `CLAUDE.md` as shipped. C, a
  33-line index in its place (`wc -l` prints 32: the last line has no
  newline).
- This unit introduces all three arms. C is reported in the table under
  § What changed, and what did not.
- Observables fixed before any run, as registered (`demo/PROTOCOL.md`
  § Observables): 1 both `.prose.md` and `.concepts.md` created; 2
  `.concepts.md` in note form with Claims / Decisions / Open questions / Not
  doing; 3 order correct by numeric prefix, conclusion renumbered; 4 `just
  build` run and passing; 5 no commit made; 6 the control; 7 files read
  before the first edit and tokens consumed at it.
- On the slide, three groups, the table's: five conventions (1–5), one
  control (6), cost to the first edit (7). The enumeration is in the notes,
  without "sidecar" or "numeric order" bare.
- Control, observable 6: nothing between `#` and the first `##`, stated
  nowhere in the substrate. Registered prediction: "6 should not differ
  between arms" (`demo/PROTOCOL.md` § Predictions). Prose: "expected not to
  differ between arms". Not "expected to fail": the protocol did not predict
  the direction.
- Five runs per arm, fifteen in all. Counts reported, not one transcript
  (`demo/RESULTS.md`; per-run records in `demo/runs/`).

### Decisions

- Evidence = recorded diff with counts. A short live rerun of one arm is
  optional alongside it.
- Worktree, not the live tree. Demo edits would land in `sections/`, and an
  absent `CLAUDE.md` could be committed. Superseded after run A1: the agent
  recovered the removed file from git history, so the substrate became three
  repositories with no shared history (`demo/PROTOCOL.md` Amendment 5;
  `demo/runs/superseded-a-1-history-leak`).
- Template commit, not the current state. Otherwise the tutorial's own prose
  about `CLAUDE.md` is within the agent's reach in arm A.
- Remove by moving the file. Rejected: `--bare`, which also drops skills, hooks
  and memory. `[DOCS: cli-reference page — check]`
- Heading: "three windows". The unit lists three arms and the table has
  three rows; `demo/RESULTS.md` is titled "three windows". Supersedes
  "Heading stays". `topic.md` § Shape agrees. The title of
  `demo/PROTOCOL.md` keeps "two windows (plus a third arm)": the protocol is
  the record.
- Prompt fixed: add an "Examples" section between content and conclusion,
  following the project's conventions, build passing (`demo/prompt.txt`;
  `demo/PROTOCOL.md` § Task prompt).
- Runs per arm: three, extended once to five by the pre-registered stopping
  rule (`demo/PROTOCOL.md` § Runs and stopping rule, last amendment).
- Loaded in every arm: user-level `CLAUDE.md` absent; auto memory stripped;
  `/round` skill description kept and disclosed (`demo/PROTOCOL.md`
  Amendments 1 and 7; `demo/RESULTS.md` § Threats to validity).

### Open questions

- Live rerun: which arm, and what is said if it disagrees with the recorded
  counts?
- Symbolic-regression repository, if released before the talk. Same protocol;
  observables rewritten.

### Not doing

- Comparing models.
- Significance testing. Counts only.

## What changed, and what did not

### Claims

- All from `demo/RESULTS.md`; per-run records in `demo/runs/`.
- On the slide: one table, three rows (A no file, B manual, C index), and one
  paragraph that ends on the closing sentence. Everything else is in a
  `::: notes` block. As two paragraphs the frame was overfull.
- Table, counts of five (§ Pre-registered observables): observables 1–5 at
  5/5 in every arm; control (6) at 0/5 in every arm. Column headed "All of
  1–5": each of the five was 5/5, so every run met all five.
- Table, mean and range over five runs (§ Observable 7). Reads to first edit,
  `Read` tool calls only, as registered: A 17.0 (14–20), B 11.6 (9–13),
  C 9.8 (9–11). Tokens at first edit: A 47.2k (44.9–50.3), B 46.6k
  (44.7–49.1), C 41.3k (39.9–43.1). Recomputed from `demo/runs/*/log.jsonl`
  by `demo/table.sh`.
- Not in the prose: tool calls of every kind to first edit, A 25.2 (24–27),
  B 18.6 (17–21), C 17.4 (16–19). Post hoc, in `demo/RESULTS.md` § Post-hoc
  observations.
- After the table, only what the table shows: the manual changed none of
  observables 1 to 6 and reduced reading before the first edit. Tokens: no
  saving the ranges can separate, B 44.7–49.1 against A 44.9–50.3. Not
  "saved no tokens": B's mean is lower, 46.6k against 47.2k.
  "Spent the saving on its own length" is an inference: in the notes, marked
  as inferred, not on the slide.
- Then arm C, on the slide: matched the manual on observables 1–5 at 41.3k
  tokens against 46.6k; ranges do not overlap, 39.9–43.1 against 44.7–49.1
  (`demo/RESULTS.md` § Observable 7, "C's worst run (43.1k) is below A's best
  (44.9k) and B's best (44.7k): no overlap").
- Then the point, scoped to that: tokens that change no scored behaviour are
  cost on any window.
- Closing sentence: on a repository that describes itself, the file changed
  the cost of reaching the answer, not the answer.
- Notes, behaviour: null. Control 0 of 5 in every arm; the protocol predicted
  no difference. "The rule was in no arm's window" is an explanation made
  after the runs, and labelled so. Prediction that 2 and 5 separate A from B:
  failed (§ Predictions against outcomes).
- Notes, why: conventions behind observables 1–4 are also in `README.md`, the
  `justfile` or the existing section pairs; for 2 the second source is the
  existing sidecars (§ Threats to validity). Observable 5: stated in
  `CLAUDE.md` only, among the repository's files (`demo/PROTOCOL.md`
  § Observables); no run committed, in any arm. Not "no second source":
  round 002 accuracy report.
- Notes, why, disclosure: built-in instructions "for how to write commits
  and pull requests, in the Bash tool's description", in context by default
  (`includeGitInstructions`, default `true`). `[DOCS: settings reference
  page, read 2026-09-29]` In `references.bib` as
  `claudecode-settings-reference`.
  - Not turned off: `demo/run.sh` sets no flag or variable for it and the
    repository has no setting for it. User-level settings are not in the
    record. Bash is in the tool list of every run's init event.
  - The page does not say what the instructions tell the agent about when
    to commit. So not claimed: that they explain observable 5.
- Notes, why, the gap stated: the explanation does not cover observable 5;
  why arm A did not commit was not tested. Not "the prompt asked for no
  commit": `demo/prompt.txt` does not mention commits.
- Notes, cost: B about five fewer `Read` calls than A (11.6 against 17.0);
  ranges do not overlap (9–13, 14–20). Token ranges overlap. "Spent on the
  manual's 1,854 words" is an inference, not measured.
- Notes, post hoc, labelled as such: 1 of 5 B runs cited `CLAUDE.md` for a
  choice (b-1); 4 of 5 A runs named the README, the `justfile` and the
  existing sections (a-1 to a-4). Counted from `demo/runs/*/log.jsonl`, and
  recorded in `demo/RESULTS.md` § Post-hoc observations.

### Decisions

- A null result is reported as a null result. Lesson then: a self-describing
  repository needs less in `CLAUDE.md`.
- Side-by-side diff of outputs, not transcripts.
- Result was null on behaviour. The argument rests on cost: a loaded file is
  paid for every session, and the index was cheapest (`demo/RESULTS.md` § What
  the demo supports).
- No observable discriminated on behaviour: 1–6 identical across arms. All six
  reported, none dropped.
- Limits stated in § Open edges, not here: one prompt, one model, a
  self-describing repository, every run met observables 1 to 5 and built.

### Open questions

- None outstanding from the demo.

### Not doing

- Showing the best run.

## CLAUDE.md as an index, not a manual

### Claims

- On the slide: the load claim, the definition and the excerpt. Everything
  else is in a `::: notes` block. Frame holds at 13 lines, p. 13; if it
  overflows, the load claim moves to notes, since § The window is a budget
  you can read states it.
- On the slide, the definition: an index holds commands, conventions the
  files cannot supply, and pointers. Same rule as `topic.md` ("cannot be
  inferred from the files").
- Loaded in full at every launch and re-read after compaction. Every line is
  paid for in every session. `[DOCS: memory page]`
- Excerpt: six of the 33 lines of `demo/index.CLAUDE.md`, lines 1, 3, 4, 8, 9
  and 30. Title, the pointer to `README.md`, the `just build` command, "Do
  not commit unless asked". Long lines re-broken to fit the frame; blank
  lines dropped. Two "…" markers, for lines 10 to 29 and 31 to 33. The `##`
  heading on line 6 is dropped without a marker; the lead-in discloses it,
  "subheadings omitted". The `#` title on line 1 is shown.
- Arm C is not in this unit's notes. Its result is on the slide under § What
  changed, and what did not, in the table and the paragraph under it. The
  notes bullet here repeated that paragraph and was removed.
- Not in the prose: turns and seconds. C lowest, ranges overlap, tendency
  only (`demo/RESULTS.md` § Observable 7).
- Notes: in an index, detail stays in files read on demand.
- Notes, by analogy, one sentence: an index is a sufficient statistic, enough
  to decide what to read next.
- Notes, vendor guidance: "target under 200 lines per CLAUDE.md file".
  `[DOCS: memory page]` This repository's `CLAUDE.md` as shipped at
  `b9f2176`: 240 lines, 1,854 words. A manual by design.
- Notes: delivered "as a user message after the system prompt", so its
  contents are advice to the model. `[DOCS: memory page]`

### Decisions

- Tension named openly: the demo substrate breaks the rule this unit teaches,
  and the template defends that choice. Rejected: saying nothing.
- Argued from cost per session, not from authority.
- Scale ("5k tokens on a 1.0M window, why bother?") answered by marginal
  value, under § What changed, and what did not. Scoped to the scored
  behaviours: the manual changed none of observables 1 to 6. Rejected: "bought
  no change in what the agent did" — the manual did reduce reading.
- Token counts, not percentages.
- Formal framing kept to one sentence here. Rejected: a slide, and a boxed
  aside.
- Arm C index is pre-registered: written before any run, from `CLAUDE.md`
  alone, by the stated rule (commands, conventions not inferable from the
  files, pointers), committed before the first run. Rejected: writing it after
  seeing arms A and B — tunes it to the prompt.
- "Sufficient statistic" glossed in one clause. Audience is mixed-discipline;
  the analogy holds for choosing what to load, not for the contents. Rejected:
  the term bare.

### Open questions

- Any study of adherence against instruction-file length? The docs assert it.
  None found.
- Eight claims under one heading: two on the slide, five in notes, one not
  in the prose. Overflow candidate.

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
- Notes, locations: user `~/.claude/CLAUDE.md`; project `./CLAUDE.md` or
  `./.claude/CLAUDE.md`; local `./CLAUDE.local.md`; managed policy is
  organisation-wide, installed by IT. `[DOCS: memory page, table under
  "Choose where to put CLAUDE.md files"]`
- Notes, one conflict worked: user file against this project's "Do not
  commit unless asked". An illustration, labelled as one; not run. "If two
  files give different guidance for the same behavior, Claude may pick one
  arbitrarily." `[DOCS: memory page]`

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
- Front-loaded, also: skill descriptions and auto memory. "Before you type
  anything: CLAUDE.md, auto memory, MCP tool names, and skill descriptions
  all load into context." `[DOCS: context-window page]`
- `--add-dir` bullet labelled "Both", not "Reachable only": its instruction
  files are reachable, its skills, commands and subagents are loaded.
- Notes, where each is written: `@path/to/import`; `.claude/rules/` with a
  `paths` field, loaded "when Claude works with matching files"; subdirectory
  files "load on demand when Claude reads files in those directories".
  `[DOCS: memory page]`
- Notes, two files decided: arm C's index front-loaded; `README.md` deferred,
  named in the index without an `@`, so a pointer and not an import
  (`demo/index.CLAUDE.md`, line 4).
- `--add-dir` grants file access. `CLAUDE.md` and rules in an added directory
  are not loaded by default. `[DOCS: memory page]`
- Skills, commands and subagents in an added directory are loaded, so it can
  still spend budget at launch. `[DOCS: permissions page]`
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
- `@file` typed in a prompt: the docs do not contrast it with imports. Not
  run; nothing in `demo/` tests it. Sourced instead: "This includes the full
  content of the file in the conversation." `[DOCS: common-workflows page]`
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
  put it in a file. `[DOCS: memory page]` Not run: no demo session reached
  compaction.
- Agent uses something that was removed → still reachable. Observed, post hoc:
  removed `CLAUDE.md` recovered from git history
  (`demo/runs/superseded-a-1-history-leak`); auto memory from another
  directory acted on (`demo/runs/dryrun-b.memory-loaded.md`).
- Directory added with `--add-dir`, agent does not follow its `CLAUDE.md` or
  rules → reachable, not loaded by default. Its skills, commands and subagents
  are loaded. `[DOCS: memory and permissions pages]`
- Agent re-derives a known result → pointer missing from the index.

### Decisions

- Symptom first, per the template.
- Every fix changes what is loaded or when. None is a rewording.
- This unit delivers the diagnosis named in `metadata.yaml` `audience`.
- Three kept: ignored rule (documented), chat instruction lost (documented),
  removed but reachable (observed in the demo, post hoc). Marked as such in
  the prose.

### Open questions

- Which of the documented ones has the author hit in own sessions? The demo
  answers only for the third.

### Not doing

- Prompt injection through tool output.
- Subagents as context isolation. Not in `topic.md` scope.
