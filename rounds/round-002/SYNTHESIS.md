# Round 2 — Synthesis

**Panel recommendation:** needs revision
**Seats:** accuracy needs revision · clarity needs revision · pedagogy needs revision · visual needs revision

## Since last round

The team took all seven docket items, not only the three under *Do next*. Six
are done. One is partly done, and it is the one three seats raise again.

1. **Correct the `--add-dir` claim** — done. The prose, the 03 spine and
   `topic.md` § Scope agree, `claudecode-permissions` is in `references.bib`,
   and accuracy verified both halves at source this round.
2. **Say what the demo measured** — done as written. The observables are
   numbered, the substrate is described, the control is defined, the column
   reads "Tool calls to first edit", and "the index slide" is gone. Two parts
   of the fix are findings this round. The wording "expected to fail in every
   arm" came from the round 1 docket, and accuracy finds it contradicted by
   `demo/PROTOCOL.md`. The forward pointer in § How a window fails went into a
   notes block, so the slide still argues from a demo nobody has described.
3. **Settle the proposal** — partly done, by one line. The notes decision is
   recorded under House conventions, token counts are settled in all three
   registers, § Shape describes the copies actually used, and the spine
   corrections were made. `topic.md` § Open questions still lists "what else is
   loaded in both arms", which the spine records as decided (pedagogy).
4. **Make the demo claims match the record** — done. The post-hoc counts are
   stated, "Why" is limited to observables 1 to 4, the 1,854-word explanation
   is marked as inference, and "every run was correct" is replaced. The two
   post-hoc counts are in the logs and not in `demo/RESULTS.md` (accuracy).
5. **Read the figure, and confront the scale** — partly done. Done: the
   reading the caption quoted is on record at
   `demo/runs/context-at-launch-full.png`, and the scale question has an
   answer in the prose. Not done: no sentence in any prose file reads the
   figure or refers to it, "draws current usage as a grid" still sits beside a
   bar and a table, the caption still says "before any prompt" over a
   "Messages 10" row, and the figure was not re-captured. The answer to the
   scale question is itself item 1 on this round's docket.
6. **State the lesson of the null result, and put the three arms in one
   table** — done. Visual calls the resulting frame the best in the deck.
7. **Show the index** — done. The excerpt is on the slide, "Formally" is "By
   analogy", the fused sentence is split, and the 240-line template is named.

**Recurrence.** "The figure is shown and never read" was raised by three seats
in round 1 and is raised by three seats in round 2. It survived for two
reasons. The round 1 item bundled a few sentences with a re-capture, and the
team did the parts that were filing and left the parts that were writing. And
the reading was written: used at launch 32.3k, the largest rows, Memory files
decomposed. It was written as claims in `03-content.concepts.md`, where the
reader never sees it. The work was done in the wrong register.

**Deferred items that came back.** Twelve of the fourteen items round 1
deferred are raised again this round: the worked diagnosis, instances for
§ Layers and § On demand, the run command and `demo/` pointers, the timeline
figure, dating the length evidence, "A repository usually exceeds the window",
the origin paragraph, the compaction sentence, citation density, the `#`
headings, the cross-references, and "The bound". The team did not decline
these; the round 1 docket did not carry them. One is overtaken: the overflow
estimates, now that the visual seat reads the deck and finds none.

## Consensus

All four seats gave the same tier. No seat found a slide that overflows, and
no seat found a citation or quotation that fails at source.

- **The marginal-value sentence is in the wrong place, and it is wrong as
  worded.** (accuracy, clarity, pedagogy, visual) "In our demo the manual
  changed none of the six behaviours we scored, so every token it cost bought
  no change in what the agent did; that holds on any window" opens
  `03-content.prose.md` two units before the demo and four before the index.
  "The manual", "an index" and "the six behaviours" are undefined there, and
  the objection it answers has not been put. Accuracy finds the second clause
  contradicted by the table in the same section: arm B made 18.6 tool calls to
  arm A's 25.2, and the ranges do not overlap. "That holds on any window"
  extends one prompt on one model to a general claim. Three seats name the
  same destination, § CLAUDE.md as an index, where the spine already files
  the argument.
- **The figure is shown and never read.** (clarity, pedagogy, visual; accuracy
  on the mismatch) § What `/context` shows at launch is a figure and one notes
  sentence about one row. The number the figure exists to show, 32.3k, appears
  nowhere in rendered text. System tools, the largest row at 17.4k, MCP tools
  and the Autocompact buffer are named nowhere. The rows sum to 65.3k against
  a headline of 32.3k because the 33.0k buffer is reserved and not counted; a
  reader asked to "say what each part costs" will add the column. Capability 1
  rests on this unit alone. The spine promises an "annotated" reading and an
  unannotated crop shipped (clarity, visual).
- **In the document, the figure has left its section.** (clarity, pedagogy,
  visual) Heading 3.2 is followed only by the notes sentence. The figure
  floats to page 4, and heading 3.4 is stranded as the last line of page 3.
- **The demo is argued from before it is introduced.** (clarity, pedagogy;
  visual on the notes sentence) § How a window fails cites "our demo", "the
  template", "the sections" and "0 of 15 runs" two units early. The forward
  pointer is in a notes block, which also uses "the demo's control" before
  § The demo defines it, and prints four bullets away from the bullet it
  supports.
- **The demo slide does not say what it asks, and miscounts its arms.**
  (clarity, pedagogy, visual) The heading says "two windows" over three arms
  and a three-row table. The question is in a notes block, so the frame opens
  on "Substrate". The observables are seven items in one sentence, in private
  vocabulary: "the sidecar in note form", "numeric order". The 03 spine
  defends the heading with "This unit compares A with B. C is reported under
  § CLAUDE.md as an index", which is no longer true of the prose, and its
  observables list omits the control.
- **"Index" is defined late, in the document only, and never on a slide.**
  (clarity, visual) Capability 2 uses the term bare. The definition is in a
  notes block six units later. The frame shows six lines of an index and
  leaves the rule that chose them to inference. "The auto-memory index" uses
  the word in a second sense first.
- **Vocabulary is used without a gloss.** (clarity, pedagogy) "Headless",
  "sidecar", "a superseded run", "a dry run" and the `/round` skill; pedagogy
  adds auto memory, skill description and body, hook, MCP, subagent, managed
  policy, path-scoped rules and `CLAUDE.local.md`. The declared audience
  covers none of them.
- **The cross-references in § What you can do now do not resolve.** (clarity,
  visual) Capability 1 points to § The window is a budget you can read and not
  to the unit that shows the reading. The names do not match the headings, and
  the references are plain text in all three outputs.
- **The spines and the proposal trail the prose again.** (accuracy, clarity,
  pedagogy, visual) Beyond the demo heading: the 01 spine counts a seven-step
  roadmap where the prose has six; the 02 spine calls tool calls "reads" and
  says "venue unchecked" of two entries whose venues are in `references.bib`;
  "Overflow candidate" stands open under four units with no decision recorded;
  `topic.md` § Shape promises a "recorded diff" and the prose has counts and
  no output.

## Conflicts

- **Where the reading of the figure goes.** Clarity asks for two or three
  sentences in the unit. Pedagogy asks for a notes block. Visual asks for
  callouts composed into the figure and a caption that states the reading. The
  team is choosing between body text, notes and pixels. **Recommend the
  caption and a notes block now, and the callouts with the re-capture:** the
  text costs a few sentences and no frame, and it fixes the words the callouts
  will carry.
- **The demo example under "Too little".** Pedagogy lists it as a strength: a
  real case from the team's own runs. Clarity finds it an odd fit, a control
  contradicted by every example in the repository, which is not the agent
  guessing, re-deriving or inventing. Pedagogy asks for a clause more, saying
  what the template is; clarity asks for the example cut to one clause.
  **Recommend clarity's position:** visual counts that frame at 11 body lines,
  and the case is told in full two units later.
- **What is put on a frame must be paid for.** Clarity asks for the demo's
  question and the index definition to move from notes to the slide, and names
  nothing to remove. Visual asks for the same two moves and names the payment:
  the observables compressed to one line, the provenance bullet to notes.
  Visual counts five frames within about two lines of full. **Recommend
  visual's swaps as stated:** they are the only version of these moves
  confirmed against the rendered page.
- **Whether the document reads as a document.** Pedagogy: the notes blocks "do
  their job". Visual: from § 3.5 the document is the deck with notes attached,
  with no sentence leading from one unit to the next. In round 1 these two
  seats agreed. The team is choosing whether notes carry detail only, or
  transitions as well. **Recommend visual's position:** one sentence of notes
  per unit costs no frame, and pedagogy's own additions go in the same blocks.
- **Citation density, again.** Visual finds § Layers spends about a line and a
  half on citation marks that render as "n.d.-a" to "n.d.-f" and resolve to
  nothing on a slide. Accuracy notes that the `/round` sentence carries no
  citation of its own. Round 1 recommended citing once per slide where the
  page repeats, and nothing changed. **The recommendation stands.**

## Docket

1. **Move the marginal-value sentence, and claim only what the table shows** —
   `sections/03-content.prose.md` § The window is a budget you can read,
   § CLAUDE.md as an index, not a manual
   *Raised by:* accuracy, clarity, pedagogy, visual · *Effort:* small
   Cut the sentence beginning "In our demo the manual changed none of the six
   behaviours" from the opening unit. Place it under § CLAUDE.md as an index,
   after the table has been seen, with the objection in front of it: the
   saving is small against a 1.0M window. Replace "bought no change in what
   the agent did" with a claim about the scored observables, by number; the
   manual did cut exploration by about seven tool calls. Hedge or cut "that
   holds on any window". The opening unit is left with the instrument and the
   boundary, and its frame stops being tight.

2. **Make the pre-registration claims match the protocol** —
   `sections/03-content.prose.md` § The demo, § What changed, § CLAUDE.md as
   an index; `sections/04-conclusion.prose.md` § Open edges;
   `demo/RESULTS.md`
   *Raised by:* accuracy · *Effort:* small
   State the control's prediction as registered: observable 6 should not
   differ between arms. Label "expected to fail" as an explanation made after
   the runs. State observable 7 as registered, files read and tokens at the
   first edit, and say the table counts all tool calls. Change "Observable 5
   had no second source" to "no second source in the repository", and disclose
   the built-in commit instructions as present in every arm; the settings
   reference page needs an entry in `references.bib`. The index is 33 lines,
   stated as 32 twice. The documentation was read on 28 and 29 September.
   Compaction runs as the limit approaches, not when the budget runs out. Add
   the two post-hoc counts to `demo/RESULTS.md`, so the prose has its
   permitted source.

3. **Read the figure in words** — `sections/03-content.prose.md` § What
   `/context` shows at launch, § The window is a budget you can read;
   `sections/04-conclusion.prose.md` § What you can do now
   *Raised by:* clarity, pedagogy, visual; accuracy on the mismatch ·
   *Effort:* small
   **Second round on the docket.** Move the reading from the spine to the
   page. 32.3k tokens are spent before the reader types. The rows from System
   prompt to Messages sum to that figure. The Autocompact buffer, 33.0k, is
   reserved on top and not counted in it. Memory files and Skills, 9.0k, are
   the rows the reader's own files put there; say which rows belong to the
   harness. Put the headline in the caption and the rest in the notes block,
   and open the notes with a sentence that refers to the figure. Write "163
   tokens", and rename "the auto-memory index". Check each statement against
   the context-window page first. Refer to the figure from "Run it in a fresh
   session", and reconcile "draws current usage as a grid" with the panel
   shown. Re-point capability 1 to this unit. Correct "annotated" in the
   spine, or make it true with the re-capture.

4. **Stop arguing from the demo before it exists** —
   `sections/02-motivation.prose.md` § How a window fails
   *Raised by:* clarity, pedagogy, visual, accuracy · *Effort:* small
   Reduce the demo reference in "Too little" to one clause, with the pointer
   to § The demo in the bullet. Delete the notes block, and do not use
   "control" before it is defined. Set "Position" as a qualification under
   "Too much", and relabel "The bound" so that it says what it bounds. Date
   the length evidence as the position evidence is dated: the model generation
   tested, "even on simple tasks" attached to Hong et al. alone, and "current"
   glossed as the models Tian et al. tested. The frame is at 11 body lines, so
   the dating is paid for by the clause removed.

5. **Make the demo slide say what it asks, and count its arms** —
   `sections/03-content.prose.md` § The demo: one prompt, two windows;
   `sections/03-content.concepts.md` § The demo
   *Raised by:* clarity, pedagogy, visual · *Effort:* small
   Move the question out of notes to the first line of the frame. Pay for it
   by compressing the observables to one line naming three kinds: five
   conventions, one control stated nowhere, cost to the first edit. The
   numbered list goes to notes, with "sidecar" and "numeric order" glossed.
   Retitle the unit for three arms; `demo/RESULTS.md` is already titled "three
   windows". Bring the spine into line: "This unit compares A with B", the
   "Heading stays" decision, and the observables list without the control.
   Take it after item 2, which rewords the same bullets.

6. **Define "index" where the reader meets it** —
   `sections/01-context.prose.md` § What this tutorial covers;
   `sections/03-content.prose.md` § CLAUDE.md as an index, not a manual;
   `sections/04-conclusion.prose.md` § What you can do now
   *Raised by:* clarity, visual · *Effort:* small
   Restore the gloss from `topic.md` to capability 2 at first use: commands,
   conventions that cannot be inferred from the files, pointers. Mirror it in
   the conclusion. In § CLAUDE.md as an index, swap the provenance bullet for
   the definition now in notes, with one clause on what a manual is by
   contrast, and move the provenance to notes. Mark each line of the excerpt
   with its kind: "Toolchain and setup: README.md" is a pointer, `just build`
   a command, "Do not commit unless asked" a convention.

7. **Make the demo repeatable from the page** —
   `sections/03-content.prose.md` § The demo, § What changed;
   `sections/01-context.prose.md` § What this tutorial covers
   *Raised by:* pedagogy · *Effort:* small
   In the notes: quote the prompt from `demo/prompt.txt`, give the invocation
   in one code line, gloss "headless", and point to `demo/PROTOCOL.md`,
   `demo/run.sh` and `demo/RESULTS.md`. Give the repository URL once, so that
   a `demo/` path resolves for a reader holding only the PDF. Add three or
   four lines, "To run this on your own repository", from the protocol's
   amendments: fix the observables before the first run, use a copy with no
   shared git history, move auto memory aside, repeat and report counts.
   Pedagogy names this the main item between its tier and the next.

## Deferred

- Re-capture the figure at higher density with three callouts, and pin it
  under heading 3.2 in the document (visual; clarity and pedagogy on the
  float) — medium effort, and item 3 fixes the words the callouts carry and
  changes what sits under the heading; check the float after it.
- Diagnosis as steps in § Pitfalls, and how to tell "too long" from "in
  conflict" (pedagogy) — deferred a second round; it is the outcome
  `metadata.yaml` declares, and pedagogy ranks it fifth in its own list.
- Run one further arm, the index plus the control convention, or say in
  § Open edges that the tutorial shows no fix working (pedagogy) — the only
  item that needs a run; the sentence in § Open edges is the cheap half.
- File paths for the layers and one worked conflict in § Layers; one real
  file taken through the decision in § On demand, with the `@path` and typed
  `@file` contrast stated (pedagogy) — deferred a second round; notes only,
  behind the items that correct what is already on the page.
- Gloss the unintroduced terms at first use, or add them to `audience`
  (pedagogy, clarity) — deferred a second round; cheap per term, and items 5
  and 7 take "sidecar" and "headless".
- Timeline figure for § On demand (visual) — deferred a second round; the
  largest single piece of work on the panel's list.
- An excerpt of one run's output showing the control violated (pedagogy) —
  delivers the "recorded diff" `topic.md` promises; or strike the promise.
- One sentence of transition in notes at the head of §§ 3.5 to 3.8 (visual) —
  see Conflicts.
- Cross-references as links whose text matches the heading, and
  `scroll-margin-top` in `site/style.css` (visual, clarity) — deferred a
  second round; item 3 re-points the one that is wrong.
- Source or cut "A repository usually exceeds the window"; tie or cut the
  origin paragraph (accuracy, clarity) — deferred a second round; the
  document's own figure shows a 1.0M window.
- § Pitfalls: the dry run ran in a worktree of this repository, where shared
  auto memory is documented, and the memory was never removed (accuracy) —
  the example does not fit the heading it sits under.
- One citation per slide where the page repeats; dates for the six
  documentation entries (visual) — see Conflicts.
- "5 of 5" under "Observables 1–5" is ambiguous, and the first two table
  columns are constant (clarity, visual) — polish on the best frame in the
  deck.
- Retitle the `#` headings "Context" and "Content" (visual) — deferred a
  second round; sidebar and dividers, not the argument.
- Close the resolved question in `topic.md`; the 01 spine's seven-step
  roadmap; the 02 spine's "reads" and "venue unchecked"; the four open
  "Overflow candidate" notes (pedagogy, clarity, accuracy) — what ships is
  right in each case.
- "every line is paid for in every session" has a documented exception for
  HTML comments (accuracy) — one clause.
- `demo/PROTOCOL.md` sets `--max-turns 25` and the logs report 31 to 49 turns
  (accuracy) — outside `sections/`; no prose claim depends on it.

## Do next

Take items 1, 2 and 3.

Items 1 and 2 are the contradicted claims in shipped prose, which by the
accuracy brief rule out any tier above this one. Item 1 is the only finding
all four seats raised, and it is a sentence moved and reworded. Item 3 is on
the docket for the second round, three seats raise it, and the text is already
written in the spine. None of the three adds a line to a frame that is tight.

## Panel health

- Every persona in `personas/` filed a report.
- **Two claims the panel found wrong this round were put there by the panel
  last round.** "Expected to fail in every arm" was clarity's wording in round
  1, carried into the docket. `demo/PROTOCOL.md` says "6 should not differ
  between arms". "Observable 5 had no second source" was accuracy's own
  wording in round 1, and accuracy finds it unsupported in round 2. The team
  did what the docket said. A docket item that prescribes wording about the
  demo should be checked against `demo/PROTOCOL.md` before it is issued, and
  no seat's brief asks for that.
- **The round 1 fix for § How a window fails treated the symptom.** The docket
  asked for the convention to be named and a pointer added. Both were done,
  and the unit now carries more of the demo, earlier.
- **The visual brief now allows the deck, and it changed the result.** Round 1
  filed ten overflow estimates. Round 2 read all 19 pages and filed none, with
  five frames named as tight.
- **The website was reviewed as source.** The sandbox blocked a browser. The
  sticky-header finding is read from the stylesheet and not confirmed.
- **Accuracy could not reach five sources:** the X posts by Lütke and
  Karpathy, and the full text of Liu et al., Modarressi et al. and Tian et al.
  The three demo substrate copies sit outside this repository, so "the copies
  differ only in `CLAUDE.md`" is not checked.
- **The pedagogy brief sets no limit on `Actionable`.** It filed eleven items
  against a docket of seven. The accuracy and visual briefs gained a cap after
  round 1 and both kept to it.
- **The spines no longer carry a literal `[RUN]` tag.** Accuracy audited
  "Run:", "Result:", "Observed" and "Not run:" in its place. House conventions
  and the accuracy brief still name the tag.
- **No seat raised the caption against the "Messages 10" row.** Round 1 item 5
  asked for "before any prompt" to be reconciled with it. The caption and the
  row are unchanged. It is reported under *Since last round*, not on the
  docket.
- **No seat checked "32" outside the prose.** `topic.md` § Shape and the
  spines give the same count for the index. Accuracy's finding names the prose
  only.
