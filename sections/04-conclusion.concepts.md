# Conclusion — spine

> Note form only; never rendered. Every `##` below is one `##` of the prose, so
> one slide. Tags and the writing constraint are defined in
> `01-context.concepts.md`.

**Purpose.** WHAT ELSE. Capability delivered, and what is open. Two slides.

## What you can do now

### Claims

- Same four capabilities as § What this tutorial covers, word for word: the
  four short lines. The full sentences are in that unit's notes.
- Each maps to the unit that delivered it: read the window → § What
  `/context` shows at launch; index and test → § The demo, § What changed,
  § The follow-up, § CLAUDE.md as an index; place an instruction → § Layers;
  front-load or on demand → § On demand. The mapping is in this unit's
  notes, off the slide.
- A capability without a unit is removed from both lists.
- Closing line kept: diagnosis is the four applied. Then, at the presenter's
  instruction: "Principle 4.1 (Course Notes 2026) says the same. Look first
  to the context: something present that should not be, or absent that
  should." `[CITE: course notes, Fall 2026, Principle 4.1 —
  `coursenotes2026`; verified by the presenter against their copy, not by
  the agent]`
- Slide: 68 words, list numbers and the citation key not counted.
- Self-containment pass: the Principle sentence replaced by "Look first to
  the context: something present that should not be, or absent that should
  (Course Notes 2026, Principle 4.1)." The citation is the key with
  "Principle 4.1" as its locator, which citeproc renders as given. Slide:
  63 words.

### Decisions

- Capability form. No recap of topics.
- Slide cut (2026-09-30). The citation carries "course notes", so the
  sentence opens "Principle 4.1 (Course Notes 2026)"; spelling out "the
  course notes'" as well put the slide over 70. The four lines were cut to
  nine words or fewer for the same reason, and § What this tutorial covers
  uses the same lines.
- Test capability claimed only as far as the demo went. Arm C was run, five
  runs, so the index-against-manual half is claimed (`demo/RESULTS.md`
  § Observable 7). Arm D was run, five runs against five fresh arm-C runs,
  so "test what changed" now also covers a rule only the file states
  (`demo/RESULTS.md` § Arm D).

### Open questions

- Diagnosis (`metadata.yaml` `audience`) rests on § How a window fails and
  § Pitfalls. Enough for the reader to do it in their own session?

### Not doing

- Restating the demo.

## Open edges, and where they lead

### Claims

- Evidence on length and position comes from retrieval-style benchmarks.
  Agentic coding sessions are untested in the sources found.
- Conflicting instruction files have no documented winner; the page says
  Claude "may pick one arbitrarily". `[DOCS: memory page]` Not
  "undocumented": the page documents that the choice may be arbitrary.
- Tool behaviour is as of the documentation on its access dates, 28 and 29
  September 2026. `[DOCS]` The pages are living and carry no version.
- 2.1.281 is the version of the demo runs only (`demo/RESULTS.md`). The
  figure has a date, 29 September 2026; the panel shows no version. Still
  true of all twenty-five runs: d-1 to d-5 and c-6 to c-10 recorded 2.1.281
  (`demo/PROTOCOL.md` item 18).
- Edges map to later tutorials: compaction T08, retrieval T09, persistent
  memory T16.
- The demo's limits, as of 2026-10-06, in the notes: every run met
  observables 1 to 5 and built, on a repository that describes itself; the
  follow-up on a rule only `CLAUDE.md` states is five runs per arm, one
  rule, one arrangement of four contrary examples (`demo/PROTOCOL.md` items
  10 and 13); 3 of 5 against 0 of 5 gives a one-sided Fisher exact p of
  about 0.083, post hoc, no significance claim (`demo/RESULTS.md` § Arm D:
  post-hoc observations). Removed: "It says nothing about conventions that
  live only in `CLAUDE.md`" — arm D tested one.
- Course-connections pass (2026-10-06), notes only, slide unchanged:
  - One task, not a held-out task set: the ablation's limit. `[CITE:
    coursenotes2026, § 4.5]`
  - **Connections** block: Spine 2, prompting → context → an environment the
    agent searches, which the brief calls this tutorial's centre `[CITE:
    coursenotes2026, §§ 2.3.2 (Spine 2 defined as context engineering in
    three levels), 4.2 and 4.4.5 — supplied by the presenter]`; C1 and
    the capstone, moved here from loose bullets, wording kept, the capstone
    with one added sentence: Figure 10.2 has Spine 2 driving the mutation
    node of the evolutionary loop `[CITE: coursenotes2026, Figure 10.2 —
    supplied by the presenter]`; C3,
    retrieval and grounding, T09 automating the just-in-time context § On
    demand handles by hand.
  - **Further reading** block, five entries, all keys already in
    `references.bib`: `rajasekaran2025`, `claudecode-memory`,
    `claudecode-context`, `hong2025`, `liu2024` (with `tian2025` in its
    line). One line each on what to read it for. Narrative citations
    (`@key`), rendered author-year by citeproc.
  - Both blocks are `###` headings inside the notes block, after the Open
    edges bullets, each followed by its list at the top level (2026-10-06,
    later). Document: 4.2.1 Connections and 4.2.2 Further reading, both on
    p. 12, numbered. Site: `<h3>` headings. Slides: pandoc turns a heading
    below slide level into a Beamer block inside the speaker note; slide
    text unchanged, 15 content slides. Rejected: a bold lead-in line, the
    fallback, not needed since the headings built cleanly.
  - `--toc-depth` raised from 2 to 3 in the `justfile`'s `doc` and `site`
    recipes, nowhere else (2026-10-06, later). Document: the table of
    contents now lists 4.2.1 and 4.2.2, the only level-3 headings, so the
    only new entries; 13 pages, unchanged. Site: the sidebar does not list
    them. Pandoc's HTML table of contents omits headings inside any Div, and
    the two sit inside the `::: notes` Div; checked with a three-heading
    test file, in and out of a Div. LaTeX builds its own contents from
    `\subsubsection`, so the document is unaffected by the Div. Not changed:
    the template, or the headings' place inside the notes, since a `###`
    outside the notes would render as a block on the slide.
- On the slide (67 words): five bullets of at most 14 words, keys kept. The
  demo bullet reads "one prompt, one model, five runs per arm, one rule
  tested; silent on correctness" since 2026-10-06; "self-describing
  repository, every run built" moved to the notes. In the notes: the limits
  bullet above; the run version, 2.1.281, and the capture date; the course
  connections (C1, capstone), unchanged.

### Decisions

- "Where to go next" merged in. The out-of-scope items are the pointers.
  Rejected: a separate slide.
- Slide cut (2026-09-30). "Self-describing repository" for "a repository
  that describes itself"; "silent on correctness" for "says nothing about
  correctness"; "Next:" for "These edges lead on:". The bullet on tool
  behaviour keeps both keys and the two dates as "28–29 September 2026".
- Ends on the opening, per the template.
- Confounds disclosed: one prompt on one template; Bash not gated by
  `--allowedTools`; `/round` skill description in every arm; index written by
  the presenter before any run (`demo/RESULTS.md` § Threats to validity).
- Limits for the follow-up (2026-10-06) stated as counts, not as "silent on
  X": the runs per arm, the one rule, the one arrangement, and the p with
  its label. Rejected: keeping "says nothing about conventions that live
  only in `CLAUDE.md`" with a qualifier.

### Open questions

- Subagents as context isolation: name as an edge, or stay silent?
- Team list, not for the reader: the symbolic-regression substrate. Document
  length is decided (`topic.md` § Open questions).

### Not doing

- Predictions about window sizes.
- A reading list longer than three.
