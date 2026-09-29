# Motivation

## Why agents make the window the bottleneck

In an agentic loop the window fills from tool calls and file reads, not only
from what the person types: each file the agent reads and each command it runs
adds to the context [@claudecode-context].

A working repository can exceed the window; this one does not, its run logs
aside. Either way, something decides what is loaded. Rewording the request
cannot supply information the model cannot see.
A prompt that names a file is different: it changes the window.

The name is recent. "Context engineering" gained currency in June 2025, in
writing about how to build on language models [@yan2025; @willison2025].

## How a window fails

- **Too little.** The agent guesses a convention, re-derives what the
  repository records, or invents (§ The demo).
- **Too much.** On retrieval-style benchmarks, performance degrades as input
  grows: in a 2025 vendor report on 18 models, "even on simple tasks"
  [@hong2025]; in a 2025 benchmark on 13 models [@modarressi2025].
- **Position.** A 2023 study found its models often used mid-input
  information worse than information at either end [@liu2024]. A 2024
  benchmark reports most models it tested more robust to this, with biases
  from the spacing of relevant information remaining [@tian2025].
- **The bound.** If the window held the information, alone and unconflicted,
  and the agent still erred, it is not a context problem.

::: notes
- **Our case of too little.** In our demo one convention, nothing between a
  `#` heading and its first `##`, was written nowhere, and the template's own
  sections modelled the opposite. It was followed in 0 of 15 runs: every run
  copied the sections (§ The demo).
- **Models tested.** The vendor report names GPT-4.1, Claude 4, Gemini 2.5 and
  Qwen3 among its 18 [@hong2025]. The 2025 benchmark tested GPT-4o, Gemini
  1.5 and 2.0, Claude 3.5 Sonnet and open-weight models [@modarressi2025].
  The 2023 study, published in 2024, tested GPT-3.5-Turbo, Claude-1.3,
  MPT-30B-Instruct and LongChat-13B [@liu2024]. The 2024 benchmark, published
  in 2025, tested Gemini-1.5-Flash, Claude-3-Haiku and GPT-4o-mini, with six
  open-source models, and found some of those still affected [@tian2025].
- None of these effects is tested in agentic coding in any source we found.
:::
