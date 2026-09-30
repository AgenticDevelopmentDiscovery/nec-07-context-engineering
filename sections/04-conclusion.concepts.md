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
  `/context` shows at launch; index and test → § The demo, § What changed, § CLAUDE.md
  as an index; place an instruction → § Layers; front-load or on demand → § On
  demand. The mapping is in this unit's notes, off the slide.
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
  § Observable 7).

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
  figure has a date, 29 September 2026; the panel shows no version.
- Edges map to later tutorials: compaction T08, retrieval T09, persistent
  memory T16.
- On the slide (66 words): five bullets of at most 14 words, keys kept. In
  the notes: "every run met observables 1 to 5"; "conventions that live only
  in `CLAUDE.md`"; the run version, 2.1.281, and the capture date; the
  course connections (C1, capstone), unchanged.

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

### Open questions

- Subagents as context isolation: name as an edge, or stay silent?
- Team list, not for the reader: the symbolic-regression substrate. Document
  length is decided (`topic.md` § Open questions).

### Not doing

- Predictions about window sizes.
- A reading list longer than three.
