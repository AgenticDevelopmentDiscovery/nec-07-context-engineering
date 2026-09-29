# Visual & Multi-Register Exposition — Round 4

**Recommendation:** needs revision
no frame overflows, but the one figure is an unannotated crop that lands in the wrong section of the document PDF, and the idea the subtitle promises ("and when") has no figure at all

## Slide overflow
- none

Read against `output/slides.pdf`, all 19 pages (1 title, 4 section dividers, 14
content frames). Pages below are PDF pages; the number printed on the frame is
three to four lower (PDF p. 12 prints "9"). Every frame holds its text clear of
the frame number. Tight, not overflowing:

- `sections/03-content.prose.md` § What changed, and what did not — p. 12 —
  tight: caption, table and a five-line paragraph fill the frame top to bottom;
  no spare line. Genuinely dense.
- `sections/03-content.prose.md` § CLAUDE.md as an index, not a manual — p. 13 —
  tight: 14 lines, the closing "…" of the excerpt is the last line the frame
  can take. Genuinely dense.
- `sections/03-content.prose.md` § On demand: reachable is not loaded — p. 15 —
  tight: 14 lines, 144 words, five bullets. Too many ideas for the room left:
  two lists, an exception, a rule and an example.
- `sections/03-content.prose.md` § The window is a budget you can read — p. 9 —
  tight: 13 lines of running prose. Too many ideas: model, instrument and
  boundary, as the spine itself records.
- `sections/04-conclusion.prose.md` § Open edges, and where they lead — p. 19 —
  tight: 14 lines, at most one spare.

## Strengths
- Presentation: the `::: notes` mechanism does its job. All 14 content frames
  hold; the deck is 14 against a cap of 15; each section has exactly one
  divider (pp. 2, 5, 8, 17), so nothing sits between a `#` and its first `##`.
- Presentation and website: the `##` headings in `03-content` are claims, not
  labels. "Layers: order is documented, conflict is not" and "On demand:
  reachable is not loaded" work as a slide title, a sidebar entry and a search
  hit without rewording.
- All three registers: the table under § What changed (slides p. 12, document
  p. 4) makes the null result visible as two constant columns beside two that
  move. It is the best piece of exposition in the document.
- All three registers: the index excerpt (slides p. 13, document p. 5) shows
  the artifact instead of describing it, and says what was cut from it.
- Figure legibility: the 840 × 565 px crop is sharp at slide size (p. 10) and
  at 70% text width in the document (p. 4). This answers the spine's open
  question under § What `/context` shows at launch: it survives both PDFs and
  does not need redrawing for sharpness. It has alt text on the site.
- Document and website: § What you can do now names, for each capability, the
  heading that delivered it, which is navigation a reader can use.

## Weaknesses
- `sections/03-content.prose.md` — no figure shows timing. The definition is
  "what goes in, when"; the only figure shows one instant (launch). "When" is
  carried by two bullet lists on the tightest bullet frame in the deck (p. 15)
  and by one sentence on compaction (p. 9). The spine has held "Figure: a
  timeline of what enters when" as an open question; the prose has not moved.
- `sections/03-content.prose.md` § What `/context` shows at launch — in
  `output/document.pdf` the figure is not under its heading. § 3.2 on p. 3
  holds only the notes paragraph, which begins "The figure is the category
  table"; Figure 1 floats to the top of p. 4 and lands inside § 3.3, between
  the "Arms" and "Task" bullets of the demo list. The cross-reference in
  § The window is a budget you can read, "the figure under § What `/context`
  shows at launch", is therefore false in the document.
- `figures/context-at-launch.png` — an unannotated crop with no relational
  content drawn on it. The caption's lead number, 32.5k, appears nowhere in the
  image (the header is outside the crop). The colour swatches key a bar that
  is also outside the crop. The one distinction the reader needs, which rows
  the harness sets and which the reader's files set, is in the notes only, so
  the slide (p. 10) shows a table and no reading of it. The row the eye lands
  on is "Free space 934.5k 93.5%", which argues against the section title
  "Why agents make the window the bottleneck"; the USAGE column is percentages
  of a window size, both of which the spine rules out elsewhere.
- `sections/03-content.prose.md` § The demo / § What changed — the five scored
  conventions are never named on any slide. Page 11 says "Five conventions
  scored per run (1–5)"; p. 12 heads a column "All of 1–5" and its caption
  reads "Runs of five meeting all of 1–5"; p. 19 says "observables 1 to 5".
  The enumeration is in a notes block. The deck's central result is about five
  things the audience is not shown. Page 12 does not stand alone.
- `sections/*.prose.md` — notes blocks are indistinguishable from the body in
  the document and the site (`site/style.css` has no rule for `.notes`). Where
  a notes block is a bullet list with bold lead-ins it reads as a continuation
  of the slide's list: under § How a window fails the four failure modes are
  followed by "Our case of too little" and "Models tested" in the same style
  (document pp. 2–3); under § The demo, "Observables, fixed before any run" is
  followed by "Observables 1 to 5" (p. 4); the same under § Layers and § On
  demand (p. 6).
- `sections/*.prose.md` — the document has no connective tissue between
  units. Ten of fourteen units are bullet lists; none opens with a sentence
  that says why it follows the one before. The "route" sentence under § What
  this tutorial covers is the only transition in eight pages. It reads as the
  deck with its notes appended, not as the long-form read.
- `sections/*.prose.md` and `references.bib` — 24 citations of the form
  "(Anthropic, n.d.-e)" appear on the slides (pp. 3, 6, 9, 13, 14, 15, 16, 19;
  seven on p. 15, five on p. 9). The deck is built with
  `suppress-bibliography=true`, so the letter that distinguishes seven sources
  resolves to nothing when projected. In the document the reader must turn to
  pp. 7–8 to learn which page "-f" is.
- `sections/*.prose.md` — slide density. Every content frame except the figure
  carries 103 to 144 words, about 1,640 in all, for a ten-minute talk. Pages
  3, 6 and 9 are paragraphs of running prose. The text fits; it cannot be read
  while someone speaks over it.
- `sections/*.prose.md` — website orientation. The four `#` headings are the
  template's arc names ("Context", "Content"); a reader landing on `#content`
  learns nothing from the heading. "What changed, and what did not" does not
  name its subject when read alone in the sidebar. Every "§ …" cross-reference
  is plain text, not a link, in all three outputs.
- `sections/01-context.concepts.md`, `sections/02-motivation.concepts.md` —
  stale open questions: "Overflow candidate" is still recorded for § What this
  tutorial covers and § How a window fails; both hold at 12 and 13 lines
  (pp. 4, 7).
- Website, not rendered by this seat: the sandbox blocked a headless browser,
  so the site was read from `_site/index.html` and `site/style.css`. The
  stylesheet has a dark scheme; the figure is a light-theme capture and will
  sit as a light panel on it.

## Actionable
1. `sections/03-content.prose.md` § On demand: reachable is not loaded — add
   the timeline figure the spine has left open. Horizontal axis: session
   time, with three marked events, *launch*, *a trigger*, *compaction*. One
   band for the window. At launch a block enters: system prompt and tools,
   the `CLAUDE.md` chain with `@path` imports expanded, skill descriptions,
   auto memory. Four labelled arrows from trigger to what loads: agent reads
   a file in a directory → that directory's `CLAUDE.md`; agent works with a
   matching file → path-scoped rule; skill invoked → skill body; `@file`
   typed → file contents. At compaction the conversation band shrinks to a
   summary, one arrow from disk back into the window labelled "project-root
   `CLAUDE.md` re-read", and the chat-only instruction marked as gone. Outside
   the band, a dashed box "reachable, not loaded": an `--add-dir` directory's
   `CLAUDE.md`, git history. The relationship it must make visible: each item
   enters on a trigger, and only what is on disk comes back after compaction.
   Pay for it by moving the Front-loaded and On demand lists into the notes
   block. (*why:* presentation, p. 15 is the tightest bullet frame; document,
   it joins §§ 3.1, 3.7 and 3.8, which share no picture)
2. `sections/03-content.prose.md` § What `/context` shows at launch — re-crop
   to include the header line with the 32.5k total, and draw two brackets
   beside the rows: "set by the harness" over System prompt and System tools,
   "set by your files and configuration" over Memory files and Skills. Pin the
   figure to its heading in the document build, and refer to it as Figure 1
   from § The window is a budget you can read. (*why:* document, the figure is
   in § 3.3 on p. 4; presentation, p. 10 shows a table with no reading)
3. `sections/03-content.prose.md` § The demo: one prompt, three windows — name
   the five conventions in the Observables bullet, in one clause: both files
   created, notes in note form, placed by numeric prefix, build run and
   passing, no commit. Page 11 has two spare lines. Then reword the table
   caption so it does not depend on "1–5" alone. (*why:* presentation, p. 12
   and p. 19 rest on numbers the audience never sees defined)
4. `sections/*.prose.md`, every `::: notes` block — open each block with one
   sentence of running prose that says what the detail is for and how the
   unit follows from the last, and drop the bold lead-ins that copy the
   slide's bullet style. Add a `.notes` rule to `site/style.css`. (*why:*
   document and website, pp. 2–6; the transitions cost no slide space)
5. `sections/03-content.prose.md` § The window is a budget you can read — move
   the two sentences on how the documentation describes the panel ("a colored
   grid", "draws a bar and a table") into the notes block; the next frame
   shows the panel. Leave three statements: finite and spent by everything
   loaded, spent before you type, summarised near the limit. (*why:*
   presentation, p. 9 is 136 words of prose with five citations)
6. `references.bib`, the seven Claude Code documentation entries — give each
   a distinguishing author or short title, so a citation reads as the page
   name rather than "n.d.-f". (*why:* presentation, where the bibliography is
   suppressed; document, 24 lookups saved; one phrasing serves all three)
7. `sections/*.prose.md`, headings and cross-references — rename § What
   changed, and what did not to name the demo; write each "§ …" as an internal
   link to the heading's anchor; consider topic names for the four `#`
   headings. (*why:* website, a reader arriving from search; the links also
   work in both PDFs)
