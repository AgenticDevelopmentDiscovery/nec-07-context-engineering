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
  - Not run: no `/context` reading is recorded in `demo/`. Categories rest on
    the documentation alone.
- Context engineering = deciding what occupies the window at each step: what,
  when, at what level of detail.
- Acts on what the model can see, not on the wording of the request.
- Reader controls selection and timing. Harness controls most of the ordering.
- Candidate definition to quote: "the set of strategies for curating and
  maintaining the optimal set of tokens (information) during LLM inference".
  `[CITE: Anthropic Applied AI team, "Effective context engineering for AI
  agents", 29 Sep 2025]`

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

### Open questions

- Does the subtitle's unqualified form survive Q&A once slide one has qualified
  it?
- Quote the Anthropic definition, or state our own and cite theirs as agreeing?

### Not doing

- Tokenisation and attention mechanics. Audience knows tokens and a finite
  budget (`metadata.yaml`).
- Window sizes and pricing. Percentages only.

## What this tutorial covers

### Claims

- Four capabilities, same words as § What you can do now:
  1. Read the window with `/context`; say what each part costs.
  2. Write a `CLAUDE.md` that works as an index; test on a fixed prompt, over
     repeated runs, whether it changed the agent's behaviour.
  3. Place an instruction in the right layer by stability and audience; know
     the load order; remove a conflict rather than rely on precedence.
  4. Decide, for a given file, front-load or on demand; know which mechanisms
     do which.
- Roadmap: readable budget → demo → what changed → index → layers → on demand →
  pitfalls.
- Out of scope, each with its home: wording T06; compaction internals T08;
  embeddings and RAG T09; persistent memory T16.
- Also out: provenance labelling; window sizes and pricing.
- Demo substrate named: this repository.

### Decisions

- Capability list taken from `topic.md` as revised. Four, not five.
- Diagnosis (the outcome in `metadata.yaml` `audience`) is not a fifth
  capability. It is the four applied, delivered in § Pitfalls.

### Open questions

- Document length. Thirteen slide-sized units ≈ a thousand words. Choice is
  between `::: notes` blocks (document only; a departure to record under House
  conventions) and a lean document. Deferred until prose exists. Not decided.
- Four capabilities, a seven-step roadmap and the scope line on one slide.
  Overflow candidate.

### Not doing

- Section-by-section abstract.
