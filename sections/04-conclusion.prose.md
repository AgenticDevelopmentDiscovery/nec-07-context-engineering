# Conclusion

## What you can do now

1. Read the window with `/context`, and say what each part costs.
   (§ What `/context` shows at launch)
2. Write a `CLAUDE.md` that works as an index, and test on a fixed prompt, over
   repeated runs, whether it changed the agent's behaviour.
   (§ The demo; § What changed; § CLAUDE.md as an index)
3. Place an instruction in the right layer by stability and audience, know the
   load order, and remove a conflict rather than rely on precedence.
   (§ Layers)
4. Decide, for a given file, whether to front-load it or load it on demand, and
   know which mechanisms do which. (§ On demand)

Diagnosis is these four applied: when the agent errs, ask what it could see,
and when.

## Open edges, and where they lead

- The evidence on length and position comes from retrieval-style benchmarks.
  Agentic coding sessions are untested in the sources we found.
- Our demo is one prompt and one model, on a repository that describes itself,
  and every run met observables 1 to 5 and built. It says nothing about
  correctness, or about conventions that live only in `CLAUDE.md`.
- Conflicting instruction files have no documented winner: the documentation
  says Claude "may pick one arbitrarily" [@claudecode-memory].
- Tool behaviour is as documented on 28 and 29 September 2026, and changes by
  version [@claudecode-memory; @claudecode-context]. The demo runs used Claude
  Code 2.1.281; the figure was captured on 29 September 2026.
- These edges lead on: compaction (Tutorial 08); retrieval, the same question
  at scale (09); persistent memory (16).
