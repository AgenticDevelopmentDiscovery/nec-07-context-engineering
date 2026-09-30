# Motivation

## Why agents make the window the bottleneck

![Each step of the loop adds to the window.](figures/window-fills.svg){height=40%}

The window fills from tool calls and file reads, not only from what you type
[@claudecode-context]. Rewording the request cannot supply information the
model cannot see.

::: notes
In an agentic loop, each file the agent reads and each command it runs adds
to the context [@claudecode-context]. A working repository can exceed the
window; this one does not, its run logs aside. Either way, something decides
what is loaded. A prompt that names a file is different: it changes the
window.

The name is recent. "Context engineering" gained currency in June 2025, in
writing about how to build on language models [@yan2025; @willison2025].
:::

## How a window fails

- **Too little.** The agent guesses a convention, re-derives what the
  repository records, or invents.
- **Too much.** Performance degrades as input grows: a 2025 vendor report
  [@hong2025]; a 2025 benchmark [@modarressi2025].
- **Position.** A 2023 study: mid-input information often used worse
  [@liu2024]; a 2024 benchmark: most models more robust [@tian2025].
- **The bound.** If the window held it, alone and unconflicted, and the agent
  still erred, the problem is elsewhere.

::: notes
- **Our case of too little, worked.** The rule: nothing between a section's
  `#` heading and its first `##`. No file in the demo's copies stated it, and
  all four existing sections broke it with a comment in that position; it was
  written in an auto memory, removed before the runs (`demo/PROTOCOL.md`,
  amendments 1 and 4). Every run read those four sections and wrote the same
  comment into its own: 0 of 15 followed the rule. Reading the window would
  have shown no loaded file that stated the rule, and four files read that
  modelled the opposite (§ The demo).
- **The sources, and what each tested.** All four are retrieval-style
  benchmarks. The 2025 vendor report, on 18 models, found degradation "even
  on simple tasks"; it names GPT-4.1, Claude 4, Gemini 2.5 and Qwen3 among
  them [@hong2025]. The 2025 benchmark tested 13 models: GPT-4o, Gemini 1.5
  and 2.0, Claude 3.5 Sonnet and open-weight models [@modarressi2025]. The
  2023 study, published in 2024, found its models often used mid-input
  information worse than information at either end; it tested GPT-3.5-Turbo,
  Claude-1.3, MPT-30B-Instruct and LongChat-13B [@liu2024]. The 2024
  benchmark, published in 2025, reports most models it tested more robust to
  this, with biases from the spacing of relevant information remaining; it
  tested Gemini-1.5-Flash, Claude-3-Haiku and GPT-4o-mini, with six
  open-source models, and found some of those still affected [@tian2025].
- None of these effects is tested in agentic coding in any source we found.
:::
