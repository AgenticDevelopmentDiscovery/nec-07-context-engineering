# Conclusion — spine

> Note form only; never rendered. Every `##` below is one `##` of the prose, so
> one slide. Tags and the writing constraint are defined in
> `01-context.concepts.md`.

**Purpose.** WHAT ELSE. Capability delivered, and what is open. Two slides.

## What you can do now

### Claims

- Same four capabilities as § What this tutorial covers, word for word.
- Each maps to the unit that delivered it: read the window → § The window is a
  budget you can read; index and test → § The demo, § What changed, § CLAUDE.md
  as an index; place an instruction → § Layers; front-load or on demand → § On
  demand.
- A capability without a unit is removed from both lists.

### Decisions

- Capability form. No recap of topics.
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
- Conflict resolution between instruction files is undocumented behaviour.
- Tool behaviour is as of the documentation on its access date. `[DOCS]`
- Edges map to later tutorials: compaction T08, retrieval T09, persistent
  memory T16.

### Decisions

- "Where to go next" merged in. The out-of-scope items are the pointers.
  Rejected: a separate slide.
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
