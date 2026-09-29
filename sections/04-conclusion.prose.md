# Conclusion

## What you can do now

1. Read the window with `/context`, and say what each part costs.
   (§ The window is a budget you can read)
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
  and every run was correct. It says nothing about correctness, or about
  conventions that live only in `CLAUDE.md`.
- How conflicting instruction files resolve is undocumented
  [@claudecode-memory].
- Tool behaviour is as documented on 28 September 2026, and changes by version
  [@claudecode-memory; @claudecode-context].
- These edges lead on: compaction (Tutorial 08); retrieval, the same question
  at scale (09); persistent memory (16).
