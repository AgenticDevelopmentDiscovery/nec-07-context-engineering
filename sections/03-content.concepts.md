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
    bar and a table. The figure is cropped to the table, and the prose says
    so: "the figure shows the table".
  - Not "in the terminal": neither page names a surface for the grid.
- Part of the budget is spent at launch, before any prompt. `[DOCS:
  context-window page]`
  - Run: 32.5k tokens used at launch in this repository,
    `demo/runs/context-at-launch-full.png`.
  - The prose refers to "the figure", not to its heading. One figure in the
    document, on the next slide.
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
- Slide cut (2026-09-30), 39 words, three sentences each with its key: the
  finite budget; "Run `/context` in a fresh session: part of the budget is
  already spent"; compaction summarises the conversation and the
  project-root `CLAUDE.md` is re-read. Three `::: notes` blocks, one after
  each sentence, so the document keeps each elaboration beside its claim:
  the Anthropic quotation; what `/context` shows, the grid and the
  breakdown with their keys, the VS Code panel, and the launch cost named
  (instruction files, auto memory, skill descriptions); the compaction
  trigger ("as the window approaches its limit") and the instruction that
  may not survive it. The word *compaction* is on the slide, its trigger in
  the notes.

### Open questions

- Resolved (2026-09-30): three sentences on the slide, the frame holds with
  room. The fallback (compaction lines to § Pitfalls) is not needed.

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
- Self-containment pass: caption now "`/context`: 32.5k spent; 33.0k held
  back for compaction (the autocompact buffer)", defining the buffer. The
  presenter's wording had "at launch" after `/context`; with it the caption
  wrapped and the frame was 6.6pt over, so "at launch" was dropped from the
  caption, since the frame title carries it. One line, frame holds.
- Hinge line under the figure (2026-09-30, later): "Memory files is this
  repository's `CLAUDE.md` — the row you write." The notes keep the fuller
  statement, with the auto-memory index. Slide: 21 words.
- Figure attribute is now `{height=63%}`, not `{width=70%}`. With the line
  added the frame was 14.4pt over at the filter's 70%; the frame's text
  height is 228pt, so 1% is 2.28pt, and 63% is the largest whole percentage
  that fits (64% is 0.7pt over). Cost, as for the SVG figures: the document
  renders the PNG at full text width instead of 70%, and the site at column
  width.
- Notes, the four largest rows counted in the 32.5k: System tools 17.4k,
  Skills 4.7k, System prompt 4.5k, Memory files 4.4k.
- Notes: Memory files = this repository's `CLAUDE.md` plus the auto-memory
  index. No per-file numbers in the prose. In the full readout: `CLAUDE.md`
  4.3k, auto-memory index 163.
- Notes: Skills = skill descriptions; the panel gives one row, no breakdown
  by source. `[DOCS: context-window page]`
- Notes: the demo logs list 28 skills in the init event of every run, 15 of
  15; one, `round`, is this repository's (`demo/runs/*/log.jsonl`).
  - "28 skills", not "28 skill descriptions": the init event lists names.
  - The logs are the headless demo runs. The capture is a VS Code session in
    this repository, a day later; its skill count is not recorded. So the 28
    is attributed to the demo runs, not to the figure.
  - Not "from this repository and the user level": 27 of the 28 are not this
    repository's. Their sources are not named in the prose; the skills page
    is not in `references.bib`.
- Notes: the harness controls System tools and System prompt.
- Notes: pointer to the full readout.

### Decisions

- Figure on its own slide. Not shared with § The window is a budget you can
  read.
- Token counts, not percentages.
- Scale ("5k tokens on a 1.0M window, why bother?") posed and answered by
  marginal value, under § What changed, and what did not. Not answered here.
- Per-file numbers (4.3k, 163) are not in the notes. They are in the full
  readout, which the notes point to.
- Source is the light-theme capture. Supersedes the dark capture: 32.3k used,
  Memory files 4.3k, `CLAUDE.md` 4.2k, Free space 934.7k.
- "This repository controls Memory files and Skills" dropped. One skill of
  the 28 in the demo logs is this repository's.

### Open questions

- Moved from § The window is a budget you can read: does the `/context` panel
  survive projection and PDF, or must it be redrawn as SVG
  (`figures/README.md` prefers vector)?
- Moved from the same unit: auto memory belongs to T16 but is loaded at
  launch, so it appears in the figure. Label it, or crop it?

### Not doing

- Window sizes as a subject (`topic.md` § Scope). The 1.0M in the figure is
  the reading, not a claim.

## The demo: does a project CLAUDE.md change what the agent does?

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
- On the slide: the figure, then Task and Observables. Question, Substrate
  and Arms are in the notes block above the figure, wording unchanged.
- Figure, `figures/three-windows.svg`, 1600 × 380, title inside "One prompt,
  three windows". Every label is a claim already in this unit: one box "same
  template commit b9f2176, same prompt"; three arm boxes "A — no CLAUDE.md",
  "B — the manual, 240 lines", "C — the index, 33 lines"; "5 headless runs"
  under each; "7 observables, fixed before any run" under all three. No
  number on the figure that is not on the slide or in its notes. Caption:
  "Three single-commit copies of the template, differing only in
  `CLAUDE.md`." No citation key: the arms rest on `demo/`, not on the docs.

### Decisions

- Figure attribute is `{height=32%}`, not `{width=70%}`. The slides filter
  (`filters/slide-figure-height.lua`) drops any `width` and sets height 70%
  of the frame; at that size the frame was 42.5pt overfull with the caption
  and the two bullets (TeX log, `pandoc --verbose`). A `height` attribute
  passes the filter untouched. Rejected: cutting Task or Observables text;
  editing the filter, outside the edit's scope. Cost: the document renders
  the figure at full text width, since pandoc caps it at `\linewidth`; the
  site ignores a percentage height and shows it at column width.
- Canvas widened to 1600 × 380 (was 1600 × 500) so that at 32% of the frame
  height the figure still spans about two thirds of the slide width and its
  30 px labels stay readable. Frame holds: no overfull box, p. 11, the
  Observables bullet's third line on the page.
- Self-containment pass: labels now "A — no CLAUDE.md", "B — the shipped
  CLAUDE.md, a 240-line manual", "C — a 33-line index we wrote"; top box
  "same starting repository, same prompt"; "5 unattended runs" under each;
  drawn title removed; canvas 1600 × 372, arm boxes two lines. Caption:
  "Three copies of this template at commit `b9f2176`, differing only in
  `CLAUDE.md`; runs unattended (headless)." Two lines on the slide, which
  put the frame 4.7pt over at 32%; height lowered to 27%, frame holds.
  "substrate" → "repository" in the Observables bullet. Slide: 67 words.
- Hinge pass (2026-09-30, later): the Question is the first line of the
  slide, as a paragraph above the figure, and no longer a notes bullet;
  caption cut to one line, "Three copies of this template at commit
  `b9f2176`, differing only in `CLAUDE.md`." Slide: 78 words, over the
  70-word budget by the Question line; the presenter chose the line.
- Height: asked for 34%, landed at 24%. Measured with the frame's 228pt
  text height (1% = 2.28pt): at 34% the frame was 34.7pt over with the
  Question as a one-item list, 21.2pt over as a paragraph, so the paragraph
  form was kept and the height stepped down by 2% to the first that fits,
  24% (26% is 3.0pt over). The Question line costs about 19pt, a line plus
  spacing; the one-line caption saved about 11pt, so the figure ends
  smaller than the 27% it had. The fallback, shortening the Task bullet to
  "One fixed prompt: add an "Examples" section, following the project's
  conventions, build passing.", was measured and recovers nothing: it
  still wraps to two lines. Not applied, since it would drop "before the
  conclusion" for no room. Open: at 24% the figure's labels are about 4pt
  on the slide; the room is in the three-line Observables bullet, or in
  moving the Question back to the notes.
- Heading pass (2026-09-30, later): Question back in the notes; heading is
  the question; caption "One prompt, three windows: copies of this template
  at commit `b9f2176`, differing only in `CLAUDE.md`." (two lines on the
  slide); Observables bullet at the presenter's wording, "Five conventions
  (1–5); one control (6), a convention stated nowhere, expected not to
  differ between arms; cost to the first edit (7)." It renders as three
  lines, not two: "edit (7)." spills. Slide: 61 words. Height: the largest
  whole percentage that fits, up to 40%, is 29%: 22.97pt over at 40%, and
  1% is 2.28pt, so 30% is 0.17pt over. Each line of the Observables bullet
  is about 13pt, so a two-line wording would allow about 35%.
- Observables reworded (2026-09-30, later): "Five conventions (1–5); a
  control (6), stated nowhere, expected not to differ; cost to the first
  edit (7)." Two lines on the slide, confirmed in the rendered text. Height
  raised to 36%, the cap asked for; 36% fits with no overfull box (33–36%
  all measured clean). Slide: 57 words.
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
- Superseded (2026-09-30, later): the heading is the question, "The demo:
  does a project CLAUDE.md change what the agent does?", and the Question
  bullet is back in the notes. "One prompt, three windows" opens the
  caption instead. `topic.md` § Shape updated to the new heading; "§ The
  demo" short references unchanged. `demo/RESULTS.md` keeps its title.
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
  paragraph of three sentences, at the presenter's wording: "The manual
  changed no scored behaviour; the index matched it at lower cost, with no
  overlap of ranges." then the scale question and its answer. Everything
  else is in a `::: notes` block after the paragraph. As two paragraphs the
  frame was overfull. Slide: 50 words, table cells not counted.
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
  observables 1 to 6. Prose: "changed no scored behaviour".
- The paragraph is four lines, and the frame has no overfull box in the TeX
  log. Wording tightened to fit; no sentence dropped from the unit.
- In the notes, under Cost, not on the slide: the manual reduced reading
  before the first edit. Tokens: no saving the ranges can separate, B
  44.7–49.1 against A 44.9–50.3. Not "saved no tokens": B's mean is lower,
  46.6k against 47.2k.
  "Spent the saving on its own length" is an inference: in the notes, marked
  as inferred, not on the slide.
- Then arm C, on the slide: matched the manual at lower cost; ranges do not
  overlap, 39.9–43.1 against 44.7–49.1 (`demo/RESULTS.md` § Observable 7,
  "C's worst run (43.1k) is below A's best (44.9k) and B's best (44.7k): no
  overlap"). Prose: "matched it at lower cost", "with no overlap of ranges".
  The numbers, "on 1–5 at 41.3k tokens against 46.6k", are in the table and
  in the notes' Cost bullet.
- Then the scale question, posed on the slide before its answer: "Why cut 5k
  tokens on a 1.0M window?" 5k is 46.6k less 41.3k, 5.3k; 1.0M is the header
  of the `/context` reading.
- Then the answer, scoped to the table: tokens that change no scored
  behaviour are cost on any window.
- Closing sentence, back on the slide since the self-containment pass, as
  the paragraph's last sentence, and no longer in the notes: on a
  repository that describes itself, the file changed the cost of reaching
  the answer, not the answer. Slide: 68 words. Frame holds.
- Notes, behaviour: null. Control 0 of 5 in every arm; the protocol predicted
  no difference. "The rule was in no arm's window" is an explanation made
  after the runs, and labelled so. Prediction that 2 and 5 separate A from B:
  failed (§ Predictions against outcomes).
- Notes, why: conventions behind observables 1–4 are also in `README.md`, the
  `justfile` or the existing section pairs; for 2 the second source is the
  existing sidecars (§ Threats to validity).
- Notes, why, observable 5: stated in `CLAUDE.md` and in
  `.claude/skills/round/SKILL.md`, "Do not edit `sections/`, do not commit,
  do not start another round", scoped to the end of a round. No run
  committed, in any arm.
  - Every arm-A run met that line before its first edit: a-2 to a-5 by
    `Read` of the file, a-1 by a `grep` over `.claude/skills/round/` that
    returned it (`demo/runs/a-*/log.jsonl`).
  - Not "stated only in `CLAUDE.md`": contradicted by the substrate.
    Recorded in `demo/PROTOCOL.md`, amendment 8, dated 2026-09-29, with the
    registered table left as written; and in `demo/RESULTS.md` § Post-hoc
    observations and § Threats to validity.
  - Not claimed: that the line explains observable 5 in arm A. Not tested.
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
- Notes, why, the gap stated: why arm A did not commit was not tested. Two
  candidates are named, the skill file and the built-in instructions, and
  neither is claimed. Not "the prompt asked for no commit":
  `demo/prompt.txt` does not mention commits.
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
- Side-by-side diff of outputs, not transcripts. Not in the prose: the prose
  has the table of counts and no diff.
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
- The project-root `CLAUDE.md`: loaded in full at every launch and re-read
  after compaction. Every line is paid for in every session. `[DOCS: memory
  page, "Project-root CLAUDE.md survives compaction"]` Scoped to the
  project-root file: nested files "reload as Claude reads files they apply
  to".
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
- Notes: in an index, detail stays in files read on demand. The course notes
  state the same rule as "reference, not inclusion". `[CITE: course notes,
  Fall 2026, § 4.3.3 — `coursenotes2026`; added on the presenter's
  instruction, verified by the presenter against their copy, not by the
  agent]` The slide is unchanged.
- Notes, by analogy, one sentence: an index is a sufficient statistic, enough
  to decide what to read next.
- Notes, vendor guidance: "target under 200 lines per CLAUDE.md file".
  `[DOCS: memory page]` This repository's `CLAUDE.md` as shipped at
  `b9f2176`: 240 lines, 1,854 words. A manual by design.
- Notes: delivered "as a user message after the system prompt", so its
  contents are advice to the model. `[DOCS: memory page]`

### Decisions

- Tension named openly: the demo substrate breaks the rule this unit teaches,
  and the template defends that choice. Rejected: saying nothing. In the
  prose so far: the notes give the 200-line target beside the 240-line
  manual. The defence is not in the prose.
- Argued from cost per session, not from authority.
- Scale ("5k tokens on a 1.0M window, why bother?") posed and answered by
  marginal value, under § What changed, and what did not. Scoped to the
  scored behaviours: the manual changed none of observables 1 to 6. Rejected:
  "bought no change in what the agent did" — the manual did reduce reading.
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
  in the prose. The TeX log reports the frame 0.1pt overfull; nothing is
  clipped on the page. No line to spare.

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
- Figure, `figures/layers.svg`, 1600 × 440, title inside "Four layers, one
  load order". A stack of four boxes, managed policy / user / project /
  local; an arrow down the stack, "loaded in this order, concatenated"; a
  callout off the stack, "conflict: no documented winner". Every label is a
  claim in this unit's notes. Caption: "The four instruction-file layers
  and their load order", with the memory key. `[DOCS: memory page]`
- On the slide (34 words): the caption; "Place by stability and audience:
  personal habit → user; team convention → project; per-machine → local;
  this task only → the conversation."; "Remove a conflict; do not predict
  the winner." In the notes, keys unchanged: load order and concatenation;
  the cross-directory order; the conflict quotation and the `settings.json`
  contrast; where each layer lives, now also "for what is private as well
  as per-machine", since "Private or" left the slide; the worked conflict.

### Decisions

- Capability is placement, load order and conflict removal. Rejected:
  "predict which layer wins" — the docs contradict it.
- The conversation is the fourth place an instruction can live. It is not a
  file layer.
- Managed policy named in the load order, not taught.
- Slide cut (2026-09-30). The arrow "→" is in the slide text at the
  presenter's wording; it renders in both PDFs (checked in the extracted
  text of each). Figure attribute `{height=45%}` since the enlargement
  pass.
- Self-containment pass: figure labels "managed policy (set by your
  organisation)", on two lines in the top box; arrow label "loaded in this
  order, concatenated: appended, none overrides"; drawn title removed;
  canvas 1600 × 430. Frame holds at 45%.

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
- On the slide: the figure and the Rule bullet. Front-loaded, On demand,
  Both and Here are in the notes block, wording and citation keys unchanged
  (`@claudecode-memory`, `@claudecode-context`, `@claudecode-workflows`,
  `@claudecode-permissions`).
- Figure, `figures/window-timeline.svg`, 1600 × 610, title inside "What
  enters the window, and when". Three columns, each a stack of boxes:
  - At launch: system prompt, tool definitions, project-root `CLAUDE.md` and
    its `@path` imports, skill descriptions, auto-memory index. The first two
    are the System prompt and System tools rows of the `/context` reading
    under § What `/context` shows at launch; the rest are the Front-loaded
    bullet. `[DOCS: memory and context-window pages]`
  - Each turn: your message, `@file` in a prompt, the agent's file reads and
    tool output, a subdirectory `CLAUDE.md` when files there are read,
    path-scoped rules, a skill's body on use. The On demand bullet and the
    notes bullet "Where each is written". "Tool output" is the figure's word
    for what a file read returns; the prose says "the agent's own file
    reads".
  - At compaction: the conversation summarised, project-root `CLAUDE.md`
    re-read from disk. From § The window is a budget you can read. `[DOCS:
    context-window and memory pages]`
  - Below, one row: `--add-dir`; loaded: skills, commands, subagents; not
    loaded by default: `CLAUDE.md`, rules. The Both bullet. `[DOCS: memory
    and permissions pages]`
  - Caption names the sources in words, "memory, context-window and
    permissions pages", with no citation key; the keys stay on the notes
    bullets.

### Decisions

- Term is "on demand", as in `topic.md`. "Just-in-time" appears once, as the
  source's word. `[CITE: Anthropic 2025]`
- Example taken from this repository, not invented.
- Figure replaces the two lists on the slide; it does not restate them beside
  them. The lists survive in the notes, so the document and the site carry
  both. Resolves the open question below.
- Figure attribute is `{height=47%}`, not `{width=70%}`. The slides filter
  drops any `width` and sets height 70% of the frame; at that size the frame
  was 44.35pt overfull with the two-line caption and the Rule bullet (TeX
  log, `pandoc --verbose`). A `height` attribute passes the filter untouched.
  Rejected: cutting the Rule bullet or the caption; editing the filter,
  outside the edit's scope. Cost: full text width in the document, column
  width on the site.
- Canvas 1600 × 610 (first draft 1600 × 720): box heights cut, fonts kept at
  30 px, so that at 47% of the frame height the figure spans about 60% of
  the slide width. Frame holds: no overfull box, p. 15, both lines of the
  Rule bullet on the page.
- Self-containment pass: labels "project-root CLAUDE.md and its @path
  imports (files it pulls in)", three lines; "rules scoped to file paths";
  "--add-dir (an extra directory)", two lines in the tag; drawn title
  removed; canvas 1600 × 560. Frame holds at 47%.
- Height raised (2026-09-30, later): asked for 55%, which was 10.1pt over;
  stepped down by 2% to 49%, the first that fits (51% is 1.0pt over).
  Slide: 33 words, unchanged.

### Open questions

- Show a subdirectory `CLAUDE.md`? None exists here, and adding one changes the
  demo substrate.
- `@file` typed in a prompt: the docs do not contrast it with imports. Not
  run; nothing in `demo/` tests it. Sourced instead: "This includes the full
  content of the file in the conversation." `[DOCS: common-workflows page]`
- Figure: a timeline of what enters when. Earns its place, or restates the two
  lists? Drawn; the lists moved off the slide. Whether it earns its place is
  the visual seat's call next round.
- Should the slides filter honour a per-figure slide height, so that
  `{width=70%}` can return for the document? The height attribute is a
  workaround for a filter that knows one size.

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
- Notes, one check per pitfall, before the fix.
  - Ignored rule: `/context`, the list under Memory files. "If a `CLAUDE.md`
    file is missing there, Claude can't see it." `[DOCS: memory page,
    "Claude isn't following my CLAUDE.md"]`
  - Lost instruction: look for it in the files `/memory` lists. "If an
    instruction disappeared after compaction, it was given only in
    conversation", or is in a nested file or path-scoped rule not yet
    reloaded. `[DOCS: memory page]` Prose gives the first case only.
  - Removed but used: `git log` for history; `/memory` for the auto-memory
    folder `[DOCS: memory page]`; headless, `memory_paths` in the init event
    (`demo/runs/*/log.jsonl`).
- Notes, the superseded run: first arm-A run, on branch `demo/arm-a`, two
  commits, `c33d022` on `b9f2176` (`git-log.txt`). Agent ran `git show
  HEAD~1:CLAUDE.md` (`log.jsonl`). Void as a measurement, kept as record
  (`demo/PROTOCOL.md`, amendment 5).
- Notes, the dry run: arm B, before the demo; tooling validation, not
  evidence. Read `no-content-between-h1-and-first-h2.md` from this
  repository's memory directory and left the comment out, citing "a saved
  memory" (`demo/runs/dryrun-b.jsonl`; `demo/PROTOCOL.md`, amendment 1).
  "All worktrees and subdirectories within the same repo share one auto
  memory directory." `[DOCS: memory page]`
- On the slide the two runs keep their record names, "a superseded run" and
  "a dry run". The notes say what each was.
- Directory added with `--add-dir`, agent does not follow its `CLAUDE.md` or
  rules → reachable, not loaded by default. Its skills, commands and subagents
  are loaded. `[DOCS: memory and permissions pages]`
- Agent re-derives a known result → pointer missing from the index.
- On the slide (27 words since the self-containment pass, cells not
  counted): a three-column table, symptom
  | check | fix, one row per pitfall, every cell eight words or fewer, the
  checks taken from the notes; a caption carrying the memory key for the
  first two rows and the post-hoc label for the third; the closing line
  "Every fix changes what is loaded, or when." In the notes, one bullet per
  pitfall: cause, fix in full with its key, and the check with its key; the
  two run records unchanged; "None of these fixes is a rewording." last.

### Decisions

- Symptom first, per the template.
- Every fix changes what is loaded or when. None is a rewording.
- This unit delivers the diagnosis named in `metadata.yaml` `audience`.
- Three kept: ignored rule (documented), chat instruction lost (documented),
  removed but reachable (observed in the demo, post hoc). Marked as such in
  the prose.
- Table column widths 9 : 12 : 12 (the dash counts under the header). At
  7 : 5 : 3 the Fix cells wrapped to three lines and the closing line fell
  off the frame (rendered p. 16, first build of 2026-09-30). With the widths
  fixed the frame was still 16.7pt over in the TeX log, then 1.1pt: the
  caption wrapped to two lines. Caption cut to one line, "Rows 1–2: the
  memory page; row 3: our demo, post hoc", with the memory key; the third
  symptom cut to "The agent uses what you removed" so that its cell wraps to
  two lines, not three. The fix cell for the third row, "Check what is
  reachable, not only loaded", is the prose's own prescription, not a
  documented fix; no new fix invented.

### Open questions

- Which of the documented ones has the author hit in own sessions? The demo
  answers only for the third.
- The Fix column is a check for the third row. Is there a documented
  structural fix for "removed but reachable"? None claimed.
- Self-containment pass: "`/memory` (lists loaded files)" in row 2's check
  fits its cell in two lines and costs no height. "a hook (a script the
  tool runs)" in row 1's fix made that row three lines and the frame 2.9pt
  over, so per the fallback the definition is in the caption: "A hook is a
  script the tool runs." The caption is two lines and the frame is 1.1pt
  over in the TeX log: the frame had about 10pt to spare and a caption
  line costs about 11pt. Nothing is clipped on the page. Every row has two
  two-line cells, so no single cell change frees a line; an uncaptioned
  table was tried and is worse (1.7pt).
- Resolved (2026-09-30, later): row 3 cut to one line, "Removed but used |
  `git log`; `/memory` | Reachable, not just loaded". The symptom is the
  notes' own bullet label. Shortening only the check and the fix left the
  symptom holding the row at two lines, and shortening row 1's fix changed
  no line count; both were measured, still 1.1pt. The presenter's example
  fix, "Check reachable, not just loaded", wraps at any column split that
  keeps rows 1–2 at two lines, so one word had to go: the verb, keeping the
  contrast. Also fit: "Check reachable, not loaded" and "Check what is
  reachable too". Row 1's fix is unchanged. Frame holds, no overfull box.

### Not doing

- Prompt injection through tool output.
- Subagents as context isolation. Not in `topic.md` scope.
