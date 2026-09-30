# Conclusion

## What you can do now

1. Read the window and its costs with `/context`.
2. Write `CLAUDE.md` as an index; test what changed.
3. Place instructions in the right layer; remove conflicts.
4. Front-load or defer a file; know the mechanisms.

Diagnosis is these four applied: when the agent errs, ask what it could see,
and when. Look first to the context: something present that should not be, or
absent that should [@coursenotes2026, Principle 4.1].

::: notes
Delivered in: 1, § What `/context` shows at launch; 2, § The demo, § What
changed, § CLAUDE.md as an index; 3, § Layers; 4, § On demand.
:::

## Open edges, and where they lead

- The evidence on length and position: retrieval-style benchmarks; agentic
  coding untested in our sources.
- Our demo: one prompt, one model, self-describing repository, every run
  built; silent on correctness.
- Conflicting instruction files have no documented winner: Claude "may pick
  one arbitrarily" [@claudecode-memory].
- Tool behaviour: as documented on 28–29 September 2026; it changes by
  version [@claudecode-memory; @claudecode-context].
- Next: compaction (Tutorial 08); retrieval, the same question at scale (09);
  persistent memory (16).

::: notes
- Every run of the demo also met observables 1 to 5. It says nothing about
  conventions that live only in `CLAUDE.md`.
- The demo runs used Claude Code 2.1.281; the figure was captured on 29
  September 2026.
- A committed `CLAUDE.md` and folder layout are context infrastructure:
  written once, loaded every session (C1, the reproducible repository).
- In the capstone, constraints and prior expressions are context that steers
  the search space; the same question of what to load, and when.
:::
