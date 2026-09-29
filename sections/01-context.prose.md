# Context

## What context engineering is

A language model draws on two stores. Its *weights* hold what it was trained
on. Its *context window* holds everything else it can use now: the system
prompt, instruction files such as `CLAUDE.md`, auto memory, skill
descriptions, the conversation, file reads and tool output
[@claudecode-context]. The window is a bounded budget of tokens. What the
model knows about this session and this repository is what is in it.

*Context engineering* is deciding what occupies the window at each step: what
goes in, when, and in how much detail. Anthropic's guidance defines it
likewise, as curating "the optimal set of tokens" [@rajasekaran2025]. It acts
on what the model can see, not on the wording of the request. You control
selection and timing; the harness, Claude Code, controls most of the ordering.

## What this tutorial covers

By the end you can:

1. Read the window with `/context`, and say what each part costs.
2. Write a `CLAUDE.md` that works as an index, and test on a fixed prompt, over
   repeated runs, whether it changed the agent's behaviour.
3. Place an instruction in the right layer by stability and audience, know the
   load order, and remove a conflict rather than rely on precedence.
4. Decide, for a given file, whether to front-load it or load it on demand, and
   know which mechanisms do which.

The route: a readable budget, a demo on this repository, the index, layers,
on-demand loading, pitfalls.

::: notes
Out of scope: prompt wording (Tutorial 06), compaction internals (08),
retrieval (09), persistent memory (16), provenance labelling, window sizes and
pricing.
:::
