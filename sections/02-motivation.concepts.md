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
    `Read` calls before the first edit, not a share: 17.0 / 11.6 / 9.8 reads
    in arms A / B / C (`demo/RESULTS.md` § Observable 7).
- A working repository can exceed the window. Either way, something decides
  what is loaded.
  - Not "usually exceeds": no source, and this repository's own reading shows
    934.5k of 1.0M free at launch.
  - "This one does not, its run logs aside": measured on the working tree,
    2026-09-29. Text without the logs: 567k characters, 90k words. The
    `demo/runs/*.jsonl` logs: 5.1 MB, more than a 1.0M window by any plausible
    characters-per-token ratio. Characters counted, not tokens.
- Rewording the request cannot supply information the model cannot see.
- Origin, one line: the term gained currency in June 2025. `[CITE: Lütke, post
  of 19 Jun 2025; Karpathy, post of 25 Jun 2025; earlier use in Yan, "Don't
  Build Multi-Agents", Cognition blog, 12 Jun 2025]` Posts read through a
  mirror, not on X directly.
- Figure, `figures/window-fills.svg`, 1600 × 520, title inside "The window
  fills as the agent works". Five steps joined by arrows: prompt → read a
  file → run a command → output returns → next step. Under each, the window
  as a bar filled from beneath, higher at each step, with the larger rises
  after the file read and after the output returns. The levels illustrate
  the claim above; no share was measured, and the figure's description says
  so. Caption: "Each step of the loop adds to the window", with the
  context-window key. `[DOCS: context-window page]`
- On the slide (34 words): the caption; "The window fills from tool calls
  and file reads, not only from what you type", with its key; "Rewording the
  request cannot supply information the model cannot see." In the notes:
  "each file the agent reads and each command it runs adds to the context"
  with its key; the repository-size sentences; "A prompt that names a file
  is different"; the origin line with its keys.

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
- Slide cut (2026-09-30). "what you type" replaces "what the person types"
  on the slide, at the presenter's wording. Figure attribute `{height=40%}`.
- Self-containment pass: the drawn title "The window fills as the agent
  works" removed from the figure; canvas 1600 × 460, so at 40% the figure
  is wider than before. Frame holds.

### Open questions

- Is there a measured figure for the human-typed share of an agentic window?
  None found. Do not state one. The figure's fill levels are not one either:
  they are drawn to show that reads and output add to the window, not by how
  much.
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
    the repository, followed in 0/15 runs (same table; `demo/runs/`). In the
    notes, not on the slide: the slide keeps the generic description and a
    pointer to § The demo.
- Too much: performance degrades as input grows. Dated by study.
  - 2025, 18 models, "even on simple tasks": Hong et al. only. Names GPT-4.1,
    Claude 4, Gemini 2.5, Qwen3. `[CITE: Hong, Troynikov, Huber, "Context
    Rot", Chroma technical report, 14 Jul 2025 — not peer reviewed]`
  - 2025, 13 models: GPT-4o, GPT-4o mini, Gemini 1.5 and 2.0, Claude 3.5
    Sonnet, and open-weight models. Not "simple tasks": built to be harder
    than literal matching. `[CITE: Modarressi et al., "NoLiMa", arXiv
    2502.05167, submitted 7 Feb 2025 — ICML 2025 per the arXiv record]`
- Position, dated: models of 2023 (GPT-3.5-Turbo, Claude-1.3,
  MPT-30B-Instruct, LongChat-13B) often used mid-context information worse
  than information at the edges, on multi-document QA and key-value
  retrieval. `[CITE: Liu et al., "Lost in the Middle", TACL 12:157–173, 2024,
  DOI 10.1162/tacl_a_00638; arXiv 2307.03172, submitted 6 Jul 2023]`
- Position, hedged: a 2024 benchmark reports most models it tested more
  robust to that effect, with biases from the spacing of relevant information
  remaining. Tested Gemini-1.5-Flash, Claude-3-Haiku, GPT-4o-mini and six
  open-source models; some open-source models still affected. "More robust"
  is the body's wording; the abstract says "robust". Not "current": the
  paper's word, about models of 2024. `[CITE: Tian et al., LongPiBench, arXiv
  2410.14641, submitted 18 Oct 2024 — Findings of ACL 2025 per the arXiv
  record]`
- Bound: if the window held the information, alone and unconflicted, and the
  agent still erred, it is not a context problem. "Alone and unconflicted"
  keeps the first pitfall inside context problems: a rule in a file that is
  too long, or in conflict, is loaded and still a context problem.
- Absence of evidence from agentic coding: in the notes here, on the slide
  under § Open edges.
- On the slide (60 words), four bullets of at most 16 words each, citation
  keys not counted, hedges kept: "a 2025 vendor report", "a 2023 study",
  "most models more robust". Too little: no pointer; the worked case in the
  notes points to § The demo. Too much: the two sources, without the model
  counts and without "even on simple tasks". Position: "mid-input
  information often used worse" without the comparison. The bound, since
  the self-containment pass: "If the window held it, alone and
  unconflicted, and the agent still erred, the problem is elsewhere." The
  test reads as a sentence again; "not a context problem" became "the
  problem is elsewhere". Slide: 63 words.
- In the notes, one bullet, "The sources, and what each tested": that all
  four are retrieval-style benchmarks; 18 and 13 models; "even on simple
  tasks" with the vendor report only; "than information at either end";
  publication years; "with biases from the spacing of relevant information
  remaining"; the model names; "some of those still affected". Each with its
  key.

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
- Resolved (2026-09-30): four one-line bullets, 60 words; the frame holds
  with room.
- The Position bullet reads "mid-input information often used worse" with no
  "than". Clear enough on a slide, with the full sentence in the notes?

### Not doing

- Why attention degrades.
- Re-ranking and calibration fixes (T09).
