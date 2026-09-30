# Context — spine

> Note form only; never rendered. Every `##` below is one `##` of the prose, so
> one slide. Claims, decisions, open questions and not-doing sit under the
> heading they belong to.

**Purpose.** WHAT. Define the thing, state the promise. Two slides.

**Tags, used in all four spines.**

- `[CITE]` — needs a primary source. Candidate named only where one was found.
  Those verified at source are in `references.bib`.
- `[DOCS]` — rests on Claude Code documentation. Cite with access date; changes
  by version.
- `[RUN]` — must come from a run on this repository. Not written as a result
  before the run. After the demo: each is replaced by the recorded result with
  a pointer into `demo/`, or marked *not run*.
- Quotations re-read at source on 2026-09-28.
- Exception: `coursenotes2026`, the course notes (Fall 2026, no URL), added
  on the presenter's instruction for two passages, Principle 4.1 and
  "reference, not inclusion" (§ 4.3.3). Not read by the agent; the presenter
  verifies both against their copy.

**Slide budget, all four prose files (2026-09-30).** Every content slide holds
one visual at most and at most 70 words of slide text. Counted: words of the
rendered slide text with the frame title, citation keys, list numbers, figure
labels and table cells excluded; captions counted. Everything cut from a slide
is in that unit's `::: notes`, sentence and citation intact, once. Slides left
as they were: § What `/context` shows at launch, § The demo, § CLAUDE.md as
an index, § On demand. After the cut the slides TeX log reports two overfull
frames, both outside the edit: the title page, 44.7pt, from the subtitle in
`metadata.yaml`; and § CLAUDE.md as an index, 0.1pt, as recorded in its
spine before the cut. Every content slide the edit touched is within the
frame.

**Self-containment pass (2026-09-30, later).** Each term defined or replaced
where it first appears, nothing else changed; recorded under the unit it
touches. Subtitle in `metadata.yaml` is now "The model only knows what is in
the window; context engineering is deciding what that is, and when." The
title page was 44.7pt over in the TeX log before and after: the overflow is
Metropolis's title layout, not the subtitle's length. The rendered title
text was removed from all five SVG figures and each canvas shortened to
match; the `<title>` element in each file is metadata, not drawn, and stays.

**Writing constraint, all four prose files.**

- Nothing between the `#` heading and the first `##`. Pandoc makes a slide of
  anything there.
- `section-titles: false` is set. Metropolis's own section page remains: one
  divider per section, not two.

## What context engineering is

### Claims

- Two stores. Weights: what the model was trained on. Window: everything else
  it can use now.
- Window = bounded token budget. What the model knows about this session and
  this repository is what is in it. `[DOCS: context-window page]`
- In a Claude Code session the window holds: system prompt, tool definitions,
  instruction files, skill descriptions, memory index, conversation, tool
  output, file reads. `[DOCS]`
  - Run: `/context` reading of this repository at launch,
    `demo/runs/context-at-launch-full.png`.
- Context engineering = deciding what occupies the window at each step: what,
  when, at what level of detail.
- Acts on what the model can see, not on the wording of the request.
- Reader controls selection and timing. Harness controls most of the ordering.
- Candidate definition to quote: "the set of strategies for curating and
  maintaining the optimal set of tokens (information) during LLM inference".
  `[CITE: Anthropic Applied AI team, "Effective context engineering for AI
  agents", 29 Sep 2025]`
- Figure, `figures/two-stores.svg`, 1600 × 470, title inside "Two stores".
  Two boxes side by side: "weights — what it was trained on"; "window — what
  it can use now", holding seven items: system prompt, instruction files
  (CLAUDE.md), auto memory, skill descriptions, conversation, file reads,
  tool output. Every label is a claim in this unit's notes. Caption: "Two
  stores: what the model was trained on, and what it can use now", with the
  context-window key. `[DOCS: context-window page]`
- On the slide (49 words): the caption, the definition, and "You control
  selection and timing; the harness (here, Claude Code) controls most of
  the ordering." In the notes: the two-stores paragraph with its key; the
  Anthropic quotation with its key; "acts on what the model can see".
  "The harness is Claude Code." left the notes when the name moved onto
  the slide, so the document says it once. Figure canvas now 1600 × 400,
  no drawn title.

### Decisions

- Subtitle keeps the course brief's phrasing ("The model only knows what is in
  the window"). The precise claim, weights versus window, is made here on the
  first slide. Rejected: rewording the subtitle.
- Defined by what it does, not by a list of instruments. Instruments arrive in
  03.
- No origin slide. One line of origin sits on the first motivation slide.
  Rejected: the template's "Where it came from" unit — 1 of 13 for history that
  explains no later choice.
- One lever taught: selection and timing. Ordering named as the harness's, in
  one clause.
- Slide cut (2026-09-30). Two `::: notes` blocks: the stores paragraph before
  the figure, the Anthropic quotation after the definition, so the document
  reads stores → figure → definition, the order it had. ", Claude Code,"
  left off the slide sentence at the presenter's wording; the notes name the
  harness in one sentence rather than repeat the slide sentence with the
  appositive.
- Figure attribute `{height=38%}`, about 64% of the slide width. A `width`
  attribute would be turned into height 70% by the slides filter and leave no
  room for the two sentences.

### Open questions

- Does the subtitle's unqualified form survive Q&A once slide one has qualified
  it?
- The figure's labels are 30 px on a 1600 px canvas, the size of the two
  existing figures. Legible from the back of the room? The visual seat's
  call.
- Quote the Anthropic definition, or state our own and cite theirs as agreeing?

### Not doing

- Tokenisation and attention mechanics. Audience knows tokens and a finite
  budget (`metadata.yaml`).
- Window sizes and pricing. Token counts only.

## What this tutorial covers

### Claims

- Four capabilities on the slide, one line each of at most nine words, the
  same words as § What you can do now:
  1. Read the window and its costs with `/context`.
  2. Write `CLAUDE.md` as an index; test what changed.
  3. Place instructions in the right layer; remove conflicts.
  4. Front-load or defer a file; know the mechanisms.
- The four in full, in this unit's notes and nowhere else:
  1. Read the window with `/context`; say what each part costs.
  2. Write a `CLAUDE.md` that works as an index; test on a fixed prompt, over
     repeated runs, whether it changed the agent's behaviour.
  3. Place an instruction in the right layer by stability and audience; know
     the load order; remove a conflict rather than rely on precedence.
  4. Decide, for a given file, front-load or on demand; know which mechanisms
     do which.
- Roadmap: readable budget → demo → what changed → index → layers → on demand →
  pitfalls. In the notes, not on the slide.
- After the list, one line for the citation form: "Citations like
  (Anthropic, n.d.-f) are undated Claude Code documentation pages; the
  letter tells them apart. Full list in the document." Slide: 57 words. The
  letters are assigned by citeproc in reference-list order; the example is
  literal text, not a key, so it does not track the memory page if the list
  changes.
- Out of scope, each with its home: wording T06; compaction internals T08;
  embeddings and RAG T09; persistent memory T16.
- Also out: provenance labelling; window sizes and pricing.
- Demo substrate named: this repository.

### Decisions

- Capability list taken from `topic.md` as revised. Four, not five.
- Diagnosis (the outcome in `metadata.yaml` `audience`) is not a fifth
  capability. It is the four applied, delivered in § Pitfalls.
- Document length: `::: notes` blocks. Teaching detail prints in the document
  and the site, stays off the slides (`CLAUDE.md` § House conventions).
  Rejected: a lean document.
- Slide cut (2026-09-30). Lines shortened to nine words or fewer because
  § What you can do now must hold the same four lines, its closing line and
  the Principle 4.1 line under 70 words; the promise and the delivery stay
  word for word. The full sentences are kept once, in the notes here, with
  the route line. Slide: 37 words, 57 with the citation line added by the
  self-containment pass. Rejected: longer lines here and shorter ones at
  the end, which breaks the word-for-word check.

### Open questions

- Resolved (2026-09-30): the four lines, the roadmap and the scope line no
  longer share a slide; the roadmap and the scope line are notes.

### Not doing

- Section-by-section abstract.
