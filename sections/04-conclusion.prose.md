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
changed, § The follow-up, § CLAUDE.md as an index; 3, § Layers; 4, § On
demand.
:::

## Open edges, and where they lead

- The evidence on length and position: retrieval-style benchmarks; agentic
  coding untested in our sources.
- Our demo: one prompt, one model, five runs per arm, one rule tested;
  silent on correctness.
- Conflicting instruction files have no documented winner: Claude "may pick
  one arbitrarily" [@claudecode-memory].
- Tool behaviour: as documented on 28–29 September 2026; it changes by
  version [@claudecode-memory; @claudecode-context].
- Next: compaction (Tutorial 08); retrieval, the same question at scale (09);
  persistent memory (16).

::: notes
- Every run of the demo met observables 1 to 5 and built, on a repository
  that describes itself. The follow-up on a rule only `CLAUDE.md` states is
  five runs per arm, one rule, and one arrangement of four contrary examples;
  3 of 5 against 0 of 5 gives a one-sided Fisher exact p of about 0.083, post
  hoc, and no significance claim is made.
- The demo is an ablation on one task, not on a held-out task set
  [@coursenotes2026, § 4.5].
- The demo runs used Claude Code 2.1.281; the figure was captured on 29
  September 2026.

### Connections

- Spine 2, the progression from prompting to context to an environment the
  agent searches [@coursenotes2026, §§ 2.3.2, 4.2 and 4.4.5], which the
  brief calls this tutorial's centre: the window is the middle step, and
  the repository the agent reads is the environment.
- C1, the reproducible repository: a committed `CLAUDE.md` and folder
  layout are context infrastructure, written once, loaded every session.
- The capstone: constraints and prior expressions are context that steers
  the search space; the same question of what to load, and when. The
  course notes' Figure 10.2 has Spine 2 driving the mutation node of the
  evolutionary loop [@coursenotes2026, Figure 10.2].
- C3, retrieval and grounding: Tutorial 09 automates the just-in-time
  context that § On demand handles by hand.

### Further reading

- @rajasekaran2025 — the vendor's framing: context as a finite resource,
  and "just in time" loading.
- @claudecode-memory — what loads at launch, the load order, the absence of
  precedence, and what survives compaction.
- @claudecode-context — `/context`, what fills the window, and compaction.
- @hong2025 — the length effect across 18 models; a vendor report.
- @liu2024 — the position effect, on models of 2023; read with @tian2025
  for the 2024 picture.
:::
