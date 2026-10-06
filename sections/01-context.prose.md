# Context

## What context engineering is

::: notes
A language model draws on two stores. Its *weights* hold what it was trained
on. Its *context window* holds everything else it can use now: the system
prompt, instruction files such as `CLAUDE.md`, auto memory, skill
descriptions, the conversation, file reads and tool output
[@claudecode-context]. The window is a bounded budget of tokens. What the
model knows about this session and this repository is what is in it.
:::

![Two stores: what the model was trained on, and what it can use now.](figures/two-stores.svg){height=45%}

*Context engineering* is deciding what occupies the window at each step: what
goes in, when, and in how much detail. You control selection and timing; the
harness (here, Claude Code) controls most of the ordering.

::: notes
Anthropic's guidance defines it likewise, as curating "the optimal set of
tokens" [@rajasekaran2025]. It acts on what the model can see, not on the
wording of the request.
:::

## What this tutorial covers

By the end you can:

1. Read the window and its costs with `/context`.
2. Write `CLAUDE.md` as an index; test what changed.
3. Place instructions in the right layer; remove conflicts.
4. Front-load or defer a file; know the mechanisms.

Citations like (Anthropic, n.d.-f) are undated Claude Code documentation
pages; the letter tells them apart. Full list in the document.

::: notes
The four in full. Read the window with `/context`, and say what each part
costs. Write a `CLAUDE.md` that works as an index, and test on a fixed
prompt, over repeated runs, whether it changed the agent's behaviour. Place
an instruction in the right layer by stability and audience, know the load
order, and remove a conflict rather than rely on precedence. Decide, for a
given file, whether to front-load it or load it on demand, and know which
mechanisms do which.

The route: a readable budget, a demo on this repository, the index, layers,
on-demand loading, pitfalls. Against the rubric's shape — what it is, why it
matters, key ideas, demo, connections, further reading — § Context is what it
is, § Motivation why it matters, § Content the key ideas and the demo, and
§ Conclusion the connections and the further reading.

Out of scope: prompt wording (Tutorial 06), compaction internals (08),
retrieval (09), persistent memory (16), window sizes and pricing.
:::
