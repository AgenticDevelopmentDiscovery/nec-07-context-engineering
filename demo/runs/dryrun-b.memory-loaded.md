---
name: no-content-between-h1-and-first-h2
description: "In the nel-course tutorial repo, prose files must have nothing between the `#` heading and the first `##`, because pandoc turns it into an extra slide."
metadata:
  node_type: memory
  pinned: false
  originSessionId: ee9ef175-eb38-41da-8d09-2d6d56deec0e
  modified: 2026-09-28T19:55:14.043Z
---

In the `nec-07-context-engineering` repository (a clone of the nel-course template), the slides are built by pandoc as beamer output at `--slide-level=2`. The user established, by testing, that pandoc makes a slide out of anything placed between a section's `#` heading and its first `##` heading. In the template, the placeholder HTML comments sat in that position and produced empty extra frames in the deck.

The rule the user set is: when writing any `sections/*.prose.md` file, put nothing between the `#` heading and the first `##`. That includes comments, introductory sentences and guidance blockquotes.

The reason is the slide budget. The talk is ten minutes and the deck is planned at 13 content slides, so every stray frame costs time the presenter does not have.

A related finding from the same test: setting `section-titles: false` in `metadata.yaml` removes pandoc's own section frame, but the Metropolis theme still adds its own section page. So one divider per section is expected, and a second one signals content in the forbidden position.
