# nel-course — index

One Markdown source in `sections/`, three outputs, improved one critique round
at a time. Toolchain and setup: README.md.

## Commands

- `just build` — all three outputs. Run it before finishing. Also `just doc`,
  `just slides`, `just site`, `just serve`.
- `/round` — reviewer panel; writes `rounds/round-NNN/SYNTHESIS.md` and stops.

## Layout

- `sections/NN-name.prose.md` ships; `sections/NN-name.concepts.md` is its
  spine. Every section is this pair. Order is the numeric prefix.
- `personas/` reviewer panel · `rounds/` critique history · `topic.md` the
  proposal · `metadata.yaml` title, authors, audience · `figures/` figures.

## Conventions

- `.concepts.md` is note form only: Claims, Decisions, Open questions, Not
  doing. Prose there is the wrong register.
- Every `##` in prose is one slide (`--slide-level=2`). One idea per `##`;
  split rather than shrink.
- Put nothing between a section's `#` heading and its first `##` (no comment,
  no text); pandoc turns it into an extra slide.
- Default arc: 01-context (WHAT), 02-motivation (WHY), 03-content (HOW,
  longest), 04-conclusion (WHAT ELSE). Renumber the pairs to change it.

## Rules

- Do not commit unless asked.
- Never edit `sections/` during a round; never edit a past round.
- The `scaffold:*` skills (`md2tex`, `tex2md`, `progression`) do not apply
  here.