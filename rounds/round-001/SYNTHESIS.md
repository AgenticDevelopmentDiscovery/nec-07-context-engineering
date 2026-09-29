# Round 1 — Synthesis

**Panel recommendation:** needs revision
**Seats:** accuracy needs revision · clarity needs revision · pedagogy needs revision · visual needs revision

## Since last round

First round — no prior docket.

## Consensus

All four seats gave the same tier, each for a different reason. The findings
below were raised by two or more seats independently.

- **The demo cannot be read from the prose.** (accuracy, clarity, pedagogy,
  visual) The observables in `03-content.prose.md` § The demo are one unnumbered
  sentence of seven items, while § What changed refers to "Observables 1 to 5".
  "One control" is never defined, so "the control failed in 5 of 5" reads as a
  defect and not as the expected outcome. The only gloss, "a convention written
  nowhere was followed in 0 of 15 runs" in `02-motivation.prose.md` § How a
  window fails, arrives before the demo is introduced and does not say what the
  convention was. Accuracy adds that the template's own sections placed a
  comment in that position, so the runs copied a visible pattern; it is not an
  instance of guessing.
- **The figure is shown and never read, and it undercuts the argument beside
  it.** (clarity, pedagogy, visual; accuracy on the mismatches) The figure shows
  3% used and 93.5% free. The index argument rests on 41.3k against 46.6k
  tokens, about half a percent of that window. The prose says "every line is
  paid for in every session" and never says why a saving of that size matters.
  The two largest rows, "System tools" (17.4k) and "Autocompact buffer"
  (33.0k), are named nowhere. The prose says `/context` "draws current usage as
  a grid"; the figure is a bar and a table.
- **The lesson of the null result is in the spine, not the prose.** (clarity,
  pedagogy) § What changed ends on a post-hoc observation. "A self-describing
  repository needs less in `CLAUDE.md`" exists only in
  `03-content.concepts.md`.
- **The three arms are never compared in one place.** (clarity, visual) A and B
  are on one slide as inline numbers, C two slides later as "its worst run
  below the best of either other arm". "Reported on the index slide" names a
  slide in text that also ships as a document and a website.
- **The proposal and the spines have fallen behind the prose.** (clarity,
  pedagogy, visual; accuracy on the spine notes) `topic.md` § Scope says
  "percentages, not token counts" and the prose reports only token counts. Its
  open questions list things the prose has answered. § Shape describes a
  worktree and a "~30-line index". The 02 spine heading is still "Two ways a
  window fails". The 01 and 03 spines say no `/context` reading is recorded,
  and the 03 spine has no unit for the figure slide.
- **"Formally, an index aims to be a sufficient statistic" claims more than the
  spine intends.** (accuracy, clarity) The spine calls it an analogy.
- **The "under 200 lines" sentence fuses two claims.** (clarity, visual) As
  written, "advice, not enforcement" attaches to the line target; the clause
  after the colon shows it was meant for the file's contents.
- **Capabilities 3 and 4 are asserted, not illustrated, and the vocabulary is
  not introduced.** (clarity, pedagogy) § Layers and § On demand have no
  instance. "Managed policy", "path-scoped rules", "headless", "a hook or a
  permission setting", "a superseded run" and "a dry run" are used without a
  gloss.
- **The document is the deck printed.** (pedagogy, visual) From § The demo
  onward the section is bullets only, with nothing carrying the reader between
  units. `topic.md` leaves the document-length question open.

## Conflicts

- **`--add-dir` "loads nothing".** Accuracy found the first half of the claim
  contradicted by the permissions and skills pages: an added directory's
  skills, commands and subagents are loaded. Pedagogy lists the same sentence
  as a strength. Clarity asks for `topic.md` to be changed to agree with the
  prose. The team is choosing between the prose as written and the
  documentation. **Recommend accuracy's position:** it is the only seat that
  read the source, and the quotation is in its report. `topic.md` then needs a
  different correction from the one clarity proposed.
- **The caption's "4.2k" and "163".** Visual lists the caption as a strength
  because it decodes the "Memory files" row. Accuracy finds both numbers
  unsupported, because neither appears in the image and no record of the
  reading exists in the repository. **Recommend accuracy's position:** a
  caption that teaches is worth keeping only if a reader can check it, so
  record the reading or drop the numbers.
- **Add material, or cut to fit.** Pedagogy asks for an index excerpt, a run
  command, a worked diagnosis, a reading of the figure and an instance each for
  § Layers and § On demand. Visual estimates that most units are at or near
  what a slide holds and counts 14 content slides against a house budget of 13,
  and also asks for a new figure. The team is choosing between teaching detail
  and the slide constraint. Both seats name the same way out, `::: notes`
  blocks that print in the document and stay off the frame. **Recommend
  deciding that question first** (docket item 3): every additive item below
  depends on the answer.
- **Citation density.** Visual asks for one citation per slide where every
  bullet rests on the same page, and names this itself as a conflict with the
  house convention of a key per tagged claim. Accuracy asks for two more
  citations. **Recommend visual's rule as stated:** cite once where the source
  is the same page repeated, and keep a key per claim where the sources differ.
  Traceability is not lost when the page is the same.

## Docket

1. **Correct the `--add-dir` claim** — `sections/03-content.prose.md` § On demand
   *Raised by:* accuracy · *Effort:* small
   Replace "gives access and loads nothing" with what the documentation says:
   an added directory's `CLAUDE.md` and rules are not loaded by default, but
   its skills, commands and subagents are. Add the permissions page
   (`code.claude.com/docs/en/permissions`, § "Additional directories grant file
   access, not configuration") to `references.bib` with its access date.
   Correct the matching claim in `03-content.concepts.md`, and the `--add-dir`
   grouping in `topic.md` § Scope.

2. **Say what the demo measured** — `sections/03-content.prose.md` § The demo,
   § What changed; `sections/02-motivation.prose.md` § How a window fails
   *Raised by:* accuracy, clarity, pedagogy, visual · *Effort:* small
   Number the observables 1 to 7. Say in one clause what the repository is: a
   tutorial template whose sections are pairs of files. Define the control
   where it is listed: nothing between the `#` heading and the first `##`,
   written nowhere in the template, expected to fail in every arm. Reword "the
   control failed in 5 of 5" so the failure reads as predicted. Relabel "Reads
   before the first edit" as tool calls, which is what `demo/table.sh` counts,
   or report `Read` calls alone: A 17.0 (14–20), B 11.6 (9–13), C 9.8 (9–11).
   In § How a window fails, keep "0 of 15", name the convention, say that the
   template's own sections modelled the opposite, and point forward to the
   demo. Replace "the index slide" with the heading name.

3. **Settle the proposal: document length, and percentages or tokens** —
   `topic.md` § Scope, § Shape, § Open questions; the four spines
   *Raised by:* clarity, pedagogy, visual · *Effort:* small
   **Prerequisite for items 5, 6 and 7.** Decide whether the document carries
   `::: notes` blocks or stays lean, and record the choice under House
   conventions. Decide "percentages, not token counts" one way, in the
   proposal, the 03 spine and the prose together. Strike the open questions the
   prose has answered, and replace the worktree and "~30-line" descriptions
   with the single-commit copies and the 32-line index actually used. In the
   spines: rename the 02 heading and the 04 reference to "How a window fails",
   add a unit for § What `/context` shows at launch, correct "Seven slides",
   and replace the two "Not run: no `/context` reading" notes.

4. **Make the demo claims match the record** — `sections/03-content.prose.md`
   § What changed; `sections/04-conclusion.prose.md` § Open edges
   *Raised by:* accuracy · *Effort:* small
   State the post-hoc observation with its counts: one B run of five cited
   `CLAUDE.md` for a choice, and four A runs of five named the README, the
   `justfile` and the existing sections. Limit "Why" to the observables it
   covers: observable 5 had no second source, and no run committed unprompted.
   Mark "spent its saving on its own 1,854 words" as an inference. Replace
   "every run was correct" with what was scored: every run met observables 1
   to 5 and built.

5. **Read the figure, and confront the scale** — `sections/03-content.prose.md`
   § The window is a budget you can read, § What `/context` shows at launch;
   `figures/context-at-launch.png`
   *Raised by:* accuracy, clarity, pedagogy, visual · *Effort:* medium
   Add two or three lines that read the figure: the largest rows, which rows
   the reader controls, and one sentence on why 0.4% of the window is still
   worth cutting, or an admission that on a 1.0M window it barely is. Refer to
   the figure from "Run it in a fresh session". Reconcile "draws current usage
   as a grid" with the panel shown, and "before any prompt" with the "Messages
   10" row. Record the reading the caption quotes under `demo/`, with its date,
   Claude Code version and surface, or remove "4.2k" and "163" from the
   caption. If the figure is re-captured, take it larger, in a light theme,
   with three rows called out: the used total, "Memory files" and "Autocompact
   buffer".

6. **State the lesson of the null result, and put the three arms in one
   table** — `sections/03-content.prose.md` § What changed, § CLAUDE.md as an
   index
   *Raised by:* clarity, pedagogy, visual · *Effort:* small
   End § What changed with the sentence the spine already holds: on a
   repository that describes itself, the file changed the cost of reaching the
   answer, not the answer. Replace the behaviour, reads and tokens bullets with
   one table of three rows (A no file, B manual, C index). Move the Arm C
   numbers into it, and cite the result in one clause in § CLAUDE.md as an
   index. Use one naming scheme for the arms.

7. **Show the index** — `sections/03-content.prose.md` § CLAUDE.md as an index
   *Raised by:* pedagogy; clarity, visual and accuracy on the bullets it
   replaces · *Effort:* small
   Excerpt six to ten lines of `demo/index.CLAUDE.md`: one command, one
   convention that cannot be inferred, one pointer, with the path to the full
   file. Pay for the room with the "sufficient statistic" bullet: cut it, or
   change "Formally" to "By analogy". Split the fused sentence: the 200-line
   target is the documentation's advice; the file arrives as a user message, so
   its contents are advice to the model. Name the tension over the 240-line
   template in one clause, or cut the sentence.

## Deferred

- Worked diagnosis from the recorded history leak in § Pitfalls (pedagogy) —
  it is the declared audience outcome, and it needs room that item 3 has to
  grant first.
- One instance each for § Layers and § On demand, and a gloss for the
  unintroduced terms (pedagogy, clarity) — waits on item 3 for the same reason.
- Run command and pointers to `demo/run.sh` and `demo/PROTOCOL.md` in § The
  demo (pedagogy) — one line, but the slide is already dense; take it with
  item 3's notes decision.
- Timeline figure of what enters the window and when (visual) — the largest
  single piece of work on the panel's list; it wants the prose it illustrates
  settled first.
- Date the benchmark evidence in § How a window fails (accuracy) — a wording
  change, behind the contradicted claims.
- Hedge "A repository usually exceeds the window" and "The name is recent";
  connect or cut the closing paragraph of § Why agents make the window the
  bottleneck (accuracy, clarity) — small, not tier-determining.
- Cite and reword the compaction sentence for a model that compacts before the
  window fills, and consider moving it to § Pitfalls (accuracy, visual) — the
  move depends on the overflow check below.
- Slide overflow estimates for ten units, and the 14 content slides against
  the budget of 13 (visual) — estimates by the seat's own account; confirm
  against the page before cutting anything.
- One citation per slide where the source repeats (visual) — see Conflicts.
- Retitle the `#` headings "Context" and "Content", and § What changed
  (visual) — affects the sidebar and the dividers, not the argument.
- Shorten the cross-references in § What you can do now, or make them links
  (visual) — polish.
- Relabel "Caveat" and "The bound", and fix "either" after three bullets
  (clarity) — polish.
- State the Claude Code version beside the documentation date in § Open edges
  (accuracy) — small, last in the seat's own ranking.
- Reconcile `demo/RESULTS.md` § What the demo supports with its own table
  (accuracy) — outside `sections/`; the claim does not reach the prose.

## Do next

Take items 1, 2 and 3.

Item 1 is the one contradicted tool claim in shipped prose, and it is a
sentence. Item 2 is the only finding all four seats raised, it carries the
second contradicted label, and without it the tutorial's one piece of
first-hand evidence cannot be followed. Item 3 adds no prose, and until it is
decided the team cannot tell whether items 5 to 7 and most of the deferred list
go on the slide or in the notes.

## Panel health

- **The accuracy seat changed a finding another seat would have passed.**
  Pedagogy praised the `--add-dir` sentence that accuracy found contradicted,
  and visual praised the caption numbers that accuracy found unsupported. The
  seat is earning its place.
- **The caption's numbers have a source the panel could not see.** The
  original capture included a "MEMORY FILES" block listing `CLAUDE.md` at 4.2k
  and the auto-memory index at 163. The figure was cropped above that block
  before this round, and the uncropped image is not in the repository. This is
  known from the editing session, not from any report. It supports accuracy's
  finding as filed: the evidence exists and is not on record.
- **The visual seat's overflow estimates were not confirmed by the rendered
  deck.** Checked after the reports were filed: all 14 content slides render
  with their full text on the frame. The three units the seat called "likely
  overflow" fit. § What this tutorial covers and § What `/context` shows at
  launch are the tightest, with the last line close to the page number. The
  brief forbids the seat from opening the deck, so its estimates run high. The
  team may want the brief to allow reading `output/slides.pdf`.
- **Two briefs set no limit on `Actionable`.** Accuracy filed 13 items and
  visual 12, against clarity's 5 and pedagogy's 7. The docket holds seven, so
  most of both lists went to *Deferred*. A cap in those two briefs would make
  the seats rank harder.
- **`demo/RESULTS.md` changed in the working tree during the round.** One
  sentence, uncommitted, at 13:21, not written by the aggregator. `sections/`
  was not touched. Accuracy checked its findings against both versions.
- Every persona in `personas/` filed a report.
