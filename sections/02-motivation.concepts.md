# Motivation — spine

> Note form only; never rendered. Every `##` below is one `##` of the prose, so
> one slide. Tags and the writing constraint are defined in
> `01-context.concepts.md`.

**Purpose.** WHY, and where it stops applying. Two slides.

## Why agents make the window the bottleneck

### Claims

- In an agentic loop the window fills from tool calls and file reads, not only
  from what the person types.
  - Not run: no share was measured. Stated without a number. The logs record
    tool calls before the first edit, not a share: 25.2 / 18.6 / 17.4 reads in
    arms A / B / C (`demo/RESULTS.md` § Observable 7).
- Repositories exceed windows, so something always decides what is left out.
- Rewording the request cannot supply information the model cannot see.
- Origin, one line: the term gained currency in June 2025. `[CITE: Lütke, post
  of 19 Jun 2025; Karpathy, post of 25 Jun 2025; earlier use in Yan, "Don't
  Build Multi-Agents", Cognition blog, 12 Jun 2025]` Posts read through a
  mirror, not on X directly.

### Decisions

- Case tied to the loop. Rejected: the generic "models have limited context",
  which reads the same for any LLM topic.
- "Rewording cannot fix", not "prompting cannot fix". A prompt that names a
  file changes the window.
- "Popularised", never "coined". An earlier use exists.
- Origin folded in here, per `topic.md` Shape. It explains why the problem
  changed when agents became multi-step.
- Not used: "competence is largely a function of window contents". No source
  found; "largely" unquantified.

### Open questions

- Is there a measured figure for the human-typed share of an agentic window?
  None found. Do not state one.
- Earliest use of the term not established. Pre-2025 uses not searched.

### Not doing

- History of prompt engineering.
- Cost in currency. Cost in tokens only.

## How a window fails

### Claims

- Too little: the agent guesses a convention, re-derives what the repository
  already records, or invents.
  - Result: the without-arm did not show it. Arm A held observables 1–5 in 5/5
    runs (`demo/RESULTS.md` § Pre-registered observables).
  - Observed case used instead: the control. Observable 6, stated nowhere in
    the repository, followed in 0/15 runs (same table; `demo/runs/`).
- Too much: performance degrades as input grows, even on simple tasks. `[CITE:
  Hong, Troynikov, Huber, "Context Rot", Chroma technical report, 14 Jul 2025 —
  not peer reviewed]` `[CITE: Modarressi et al., "NoLiMa", arXiv 2502.05167 —
  venue unchecked]`
- Position, dated: 2023-era models retrieved mid-context information worse than
  information at the edges, on multi-document QA and key-value retrieval.
  `[CITE: Liu et al., "Lost in the Middle", TACL 12:157–173, 2024, DOI
  10.1162/tacl_a_00638]`
- Position, hedged: a later benchmark reports most current models robust to
  that effect, with other spacing biases remaining. `[CITE: Tian et al.,
  LongPiBench, arXiv 2410.14641 — venue unchecked]`
- Bound: if the agent had the information and still erred, it is not a context
  problem.

### Decisions

- Length effect leads. Position follows, dated and hedged. Matches `topic.md`
  scope.
- "When to reach for it" folded in as the diagnostic question. Rejected: a
  separate slide. If this unit overflows, the bound moves to § Open edges.
- The too-little failure is shown from a real session, per the template.
- Each source cited only for what it tested. Liu et al. not cited for current
  models or for agents.

### Open questions

- Does any primary source test length or position effects in agentic coding
  sessions? None found. Say so in the prose.
- "Hallucinates" or "invents a convention", for a mixed-discipline reader?
- Five claims under one heading. Overflow candidate.

### Not doing

- Why attention degrades.
- Re-ranking and calibration fixes (T09).
