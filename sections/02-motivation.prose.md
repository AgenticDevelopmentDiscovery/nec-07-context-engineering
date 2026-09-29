# Motivation

## Why agents make the window the bottleneck

In an agentic loop the window fills from tool calls and file reads, not only
from what the person types: each file the agent reads and each command it runs
adds to the context [@claudecode-context].

A repository usually exceeds the window, so something always decides what is
left out. Rewording the request cannot supply information the model cannot see.
A prompt that names a file is different: it changes the window.

The name is recent. "Context engineering" gained currency in June 2025, in
writing about how to build on language models [@yan2025; @willison2025].

## Two ways a window fails

- **Too little.** The agent guesses a convention, re-derives what the
  repository records, or invents. In our demo, a convention written nowhere
  was followed in 0 of 15 runs.
- **Too much.** On retrieval-style benchmarks, performance degrades as input
  grows, even on simple tasks [@hong2025, a vendor report; @modarressi2025].
- **Position.** An earlier study found its models used mid-input information
  worse than information at either end [@liu2024]. A later benchmark reports
  most current models robust to this, with spacing biases remaining
  [@tian2025].
- **Caveat.** No source we found tests either effect in agentic coding.
- **The bound.** If the agent had the information and still erred, it is not
  a context problem.
