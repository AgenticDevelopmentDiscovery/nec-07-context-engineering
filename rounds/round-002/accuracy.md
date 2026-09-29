# Factual Accuracy & Sourcing — Round 2

**Recommendation:** needs revision
two demo claims in the shipped prose are contradicted by the repository's own record, though every external citation and every quotation checked out at source

**Sources reached:** All read on 2026-09-29. Claude Code documentation, as the
pages' Markdown source: `memory`, `context-window`, `commands`, `settings`,
`common-workflows`, `permissions`, and, outside `references.bib`,
`cli-reference`, `skills` and `settings-reference`. Anthropic engineering post
(Rajasekaran et al.). Chroma "Context Rot" report page. arXiv abstract pages
2502.05167 and 2410.14641. ACL Anthology record 2024.tacl-1.9. Cognition blog
post (Yan). Willison's post. In the repository: `demo/RESULTS.md`,
`demo/PROTOCOL.md` (and its first version at commit `273faf9`), all fifteen run
folders, the superseded run, the dry run, both `/context` captures, and
`output/document.pdf` for the rendered reference list.
Not reached: the two X posts by Lütke and Karpathy (the pages return a script
shell with no post text); the full text of Liu et al., Modarressi et al. and
Tian et al. (abstract and record pages only); the three demo substrate
repositories `~/Sandbox/nec07-demo-{a,b,c}`, which sit outside this repository.

## Tag audit

The spines no longer carry a literal `[RUN]` tag. Each was replaced by "Run:",
"Result:", "Observed" or "Not run:" with a pointer into `demo/`. They are
audited below as `[RUN]`.

- `01-context.concepts.md` § What context engineering is — `[DOCS]` window is a
  bounded budget; what the model knows about the session is what is in it —
  source: named (context-window page) · in `references.bib`: yes ·
  verdict: verified
- `01-context.concepts.md` § What context engineering is — `[DOCS]` contents of
  the window in a session — source: missing in the tag (no page named; the prose
  cites `claudecode-context`) · in `references.bib`: yes · verdict: verified
- `01-context.concepts.md` § What context engineering is — `[RUN]` `/context`
  reading at launch — prose states a result: yes (the figure) · record exists:
  yes, `demo/runs/context-at-launch-full.png` · verdict: verified
- `01-context.concepts.md` § What context engineering is — `[CITE]` Anthropic
  definition, "optimal set of tokens" — source: named · in `references.bib`:
  yes · verdict: verified
- `02-motivation.concepts.md` § Why agents make the window the bottleneck —
  `[CITE]` term gained currency in June 2025 (Lütke, Karpathy, Yan) — source:
  named · in `references.bib`: Yan yes; Lütke and Karpathy no, only through
  `willison2025` · verdict: Yan verified (dated 2025-06-12, uses the term);
  Lütke and Karpathy posts not checked, the pages returned no post text. The
  dates in the spine, 19 and 25 June, are not in Willison's post.
- `02-motivation.concepts.md` § Why agents make the window the bottleneck —
  `[RUN]` share of the window typed by the person, marked not run — prose states
  a result: no · record exists: n/a · verdict: verified as an honest gap. The
  spine calls 25.2 / 18.6 / 17.4 "reads"; the logs count tool calls of every
  kind (a-1: 16 Read, 7 Bash, 1 Glob, 1 Grep).
- `02-motivation.concepts.md` § How a window fails — `[RUN]` arm A held
  observables 1–5 in 5/5; control followed in 0/15 — prose states a result:
  yes · record exists: yes · verdict: verified by rescoring all fifteen runs
- `02-motivation.concepts.md` § How a window fails — `[CITE]` Hong et al.,
  degradation with input length — source: named · in `references.bib`: yes ·
  verdict: verified
- `02-motivation.concepts.md` § How a window fails — `[CITE]` Modarressi et
  al., NoLiMa — source: named · in `references.bib`: yes · verdict: verified
  for degradation with length. The spine still says "venue unchecked";
  `references.bib` gives ICML 2025 from the arXiv comments field, which the
  arXiv record confirms.
- `02-motivation.concepts.md` § How a window fails — `[CITE]` Liu et al.,
  mid-context retrieval — source: named · in `references.bib`: yes · verdict:
  verified for the finding and both tasks. "2023-era models" not checked: the
  abstract names no models and the full text was not read.
- `02-motivation.concepts.md` § How a window fails — `[CITE]` Tian et al.,
  LongPiBench — source: named · in `references.bib`: yes · verdict: verified.
  The "venue unchecked" note is stale in the same way.
- `03-content.concepts.md` § The window is a budget you can read — `[CITE]`
  "finite resource with diminishing marginal returns" — source: named · in
  `references.bib`: yes · verdict: verified
- `03-content.concepts.md` § The window is a budget you can read — `[DOCS]`
  `/context` shows what occupies the window — source: named (commands page) ·
  in `references.bib`: yes · verdict: verified
- `03-content.concepts.md` § The window is a budget you can read — `[DOCS]`
  part of the budget spent before any prompt — source: named · in
  `references.bib`: yes · verdict: verified
- `03-content.concepts.md` § The window is a budget you can read — `[RUN]`
  32.3k tokens at launch — prose states a result: yes (figure) · record exists:
  yes · verdict: verified; the rows sum to 32.3k
- `03-content.concepts.md` § The window is a budget you can read — `[DOCS]`
  project-root `CLAUDE.md` re-read after compaction — source: named · in
  `references.bib`: yes · verdict: verified
- `03-content.concepts.md` § What `/context` shows at launch — `[RUN]` row
  values; Memory files 4.2k and 163 — prose states a result: yes · record
  exists: yes · verdict: verified
- `03-content.concepts.md` § The demo — `[RUN]` substrate, arms, five runs per
  arm, version and model — prose states a result: yes · record exists: yes ·
  verdict: verified for run count, single-commit history, Claude Code 2.1.281
  and `claude-fable-5-1`; "the copies differ only in `CLAUDE.md`" not checked,
  the copies are outside this repository
- `03-content.concepts.md` § The demo — `[DOCS]` `--bare` also drops skills,
  hooks and memory — source: named (cli-reference page) · in `references.bib`:
  no; n/a, the claim is not in the prose · verdict: verified
- `03-content.concepts.md` § What changed, and what did not — `[RUN]` the
  table, counts and means with ranges — prose states a result: yes · record
  exists: yes · verdict: verified by recomputation from `demo/runs/*/log.jsonl`
- `03-content.concepts.md` § What changed, and what did not — `[RUN]` post-hoc
  counts, 1 of 5 B runs and 4 of 5 A runs — prose states a result: yes · record
  exists: in the logs (b-1; a-1 to a-4), not in `demo/RESULTS.md` · verdict:
  verified against the logs; the permitted source does not carry the numbers
- `03-content.concepts.md` § CLAUDE.md as an index, not a manual — `[DOCS]`
  loaded in full at launch, re-read after compaction — source: named · in
  `references.bib`: yes · verdict: verified
- `03-content.concepts.md` § CLAUDE.md as an index, not a manual — `[DOCS]`
  "target under 200 lines" — source: named · in `references.bib`: yes ·
  verdict: verified
- `03-content.concepts.md` § CLAUDE.md as an index, not a manual — `[DOCS]` "as
  a user message after the system prompt" — source: named · in
  `references.bib`: yes · verdict: verified
- `03-content.concepts.md` § CLAUDE.md as an index, not a manual — `[RUN]`
  manual is 240 lines and 1,854 words; index is 32 lines — prose states a
  result: yes · record exists: yes · verdict: 240 and 1,854 verified; 32
  contradicted, the file has 33 lines
- `03-content.concepts.md` § Layers — `[DOCS]` load order; concatenated, not
  overriding — source: named · in `references.bib`: yes · verdict: verified
- `03-content.concepts.md` § Layers — `[DOCS]` root to working directory, local
  after project — source: named · in `references.bib`: yes · verdict: verified
- `03-content.concepts.md` § Layers — `[DOCS]` "may pick one arbitrarily" —
  source: named · in `references.bib`: yes · verdict: verified
- `03-content.concepts.md` § Layers — `[DOCS]` `settings.json` has a
  deterministic winner — source: named · in `references.bib`: yes · verdict:
  verified; the page lists exceptions for a few security keys and merged arrays
- `03-content.concepts.md` § On demand — `[DOCS]` the on-demand list — source:
  named · in `references.bib`: yes · verdict: verified
- `03-content.concepts.md` § On demand — `[DOCS]` `@path` imports "expanded and
  loaded into context at launch" — source: named · in `references.bib`: yes ·
  verdict: verified
- `03-content.concepts.md` § On demand — `[DOCS]` `--add-dir`: `CLAUDE.md` and
  rules not loaded by default — source: named · in `references.bib`: yes ·
  verdict: verified
- `03-content.concepts.md` § On demand — `[DOCS]` `--add-dir`: skills, commands
  and subagents loaded — source: named · in `references.bib`: yes · verdict:
  verified
- `03-content.concepts.md` § On demand — `[DOCS]` `/round` description at
  launch, body on invocation — source: named · in `references.bib`: yes ·
  verdict: verified; the skill does not set `disable-model-invocation`. The
  prose sentence carries no citation of its own.
- `03-content.concepts.md` § On demand — `[CITE]` "just in time" — source:
  named · in `references.bib`: yes · verdict: verified
- `03-content.concepts.md` § On demand — `[DOCS]` typed `@file`, "This includes
  the full content of the file in the conversation." — source: named · in
  `references.bib`: yes · verdict: verified
- `03-content.concepts.md` § Pitfalls — `[DOCS]` ignored rule; hook or
  permission — source: named · in `references.bib`: yes · verdict: verified
- `03-content.concepts.md` § Pitfalls — `[DOCS]` imports save nothing — source:
  named · in `references.bib`: yes · verdict: verified
- `03-content.concepts.md` § Pitfalls — `[DOCS]` chat instruction lost at
  compaction; marked not run — source: named · in `references.bib`: yes ·
  verdict: verified; the prose does not present it as observed
- `03-content.concepts.md` § Pitfalls — `[RUN]` removed file recovered from git
  history; auto memory acted on — prose states a result: yes · record exists:
  yes · verdict: verified in both logs
- `03-content.concepts.md` § Pitfalls — `[DOCS]` `--add-dir` symptom — source:
  named · in `references.bib`: yes · verdict: verified
- `04-conclusion.concepts.md` § Open edges — `[DOCS]` tool behaviour as of the
  access date — source: missing in the tag (the prose cites `claudecode-memory`
  and `claudecode-context`) · in `references.bib`: yes · verdict: contradicted
  in part; the prose gives one date and `references.bib` gives two

## Strengths

- Every quotation in the prose matches its source word for word: "the optimal
  set of tokens", "a finite resource with diminishing marginal returns", "just
  in time", "under 200 lines", "as a user message after the system prompt",
  "if two rules contradict each other, Claude may pick one arbitrarily",
  "expanded and loaded into context at launch".
- All thirteen citation keys in the prose resolve in `references.bib`, and all
  thirteen entries are cited. Authors, titles, dates, volume, pages and DOI
  match the sources. The six documentation titles match the pages' headings.
- The demo table reproduces exactly from the logs: all fifteen rows of
  observables, and every mean and range.
- The pre-registration is real. `demo/PROTOCOL.md` and `demo/index.CLAUDE.md`
  were committed at `273faf9`, 20:34 UTC, before the dry run and before run a-1
  started at 21:54 UTC. The index has not changed since.
- The hedges are honest and match the sources: Hong et al. marked as a vendor
  report, the Anthropic line marked "advice, not evidence", the 1,854-word
  explanation marked as inferred and not measured, position effects dated, and
  the statement that no source tests agentic coding.
- The prose is more careful than `demo/RESULTS.md` in two places: it counts one
  B run citing `CLAUDE.md` where the results file says "Arm B justified
  choices", and it marks as inference what the results file states as fact.
- "Gained currency", not "coined". Willison's post of 27 June 2025 says the
  term "has recently started to gain traction".

## Weaknesses

- `03-content.prose.md` — "every token it cost bought no change in what the
  agent did": contradicted by the table in the same section and by
  `demo/RESULTS.md`. Arm B made 18.6 tool calls before its first edit (17–21)
  against 25.2 in arm A (24–27), and the ranges do not overlap.
  `demo/RESULTS.md` § Observable 7: "The manual did reduce exploration; it did
  not reduce cost." What the record supports is no change in the six scored
  behaviours. The sentence that follows, "that holds on any window", extends
  one prompt on one model to a general claim.
- `03-content.prose.md` — the control "expected to fail in every arm", listed
  under "Observables, numbered and fixed before any run", and the note "as
  expected for a convention stated nowhere": contradicted as a pre-registered
  expectation. `demo/PROTOCOL.md` § Predictions says only "6 should not differ
  between arms." Failure in every arm is an outcome, explained afterwards.
- `03-content.prose.md` — the index is "32 lines", stated twice: contradicted
  by the file. `demo/index.CLAUDE.md` has 33 lines; it has 32 newline
  characters because the last line is unterminated. The spine's own excerpt
  note refers to "lines 31 to 33".
- `04-conclusion.prose.md` — "Tool behaviour is as documented on 28 September
  2026": contradicted in part by `references.bib`, which records the
  permissions page as read on 2026-09-29. The `--add-dir` claim rests on that
  page.
- `03-content.prose.md` — observable 7 appears in the list "fixed before any
  run" as "cost to the first edit", and the table reports tool calls:
  unsupported as pre-registered. The protocol fixed "Files read before first
  edit (list); tokens consumed at first edit". The table counts every tool
  call, of which reads are about two thirds.
- `03-content.prose.md` — "Observable 5 had no second source": unsupported as
  worded. The protocol supports "stated in `CLAUDE.md` only" among the files of
  the repository. The documentation says Claude Code puts "its built-in
  instructions for how to write commits and pull requests" in context by
  default (`settings-reference`, `includeGitInstructions`, default `true`). The
  demo did not turn this off and does not list it as a confound. What those
  instructions say about unprompted commits is not checked; the page does not
  print them.
- `02-motivation.prose.md` — "A repository usually exceeds the window":
  unsupported. No source, and no tag in the spine. The document's own figure
  shows a 1.0M-token window, and the demo substrate is about 61 KB of text.
- `03-content.prose.md` — the post-hoc counts "One B run of five" and "Four A
  runs of five": unsupported by the permitted source. They are correct against
  the logs, but `demo/RESULTS.md` carries neither number, and the house
  convention makes it the only source for demo numbers in the prose.
- `03-content.prose.md` — "a dry run acted on an auto memory saved in another
  directory": verified in the log, but worded more broadly than the record. The
  dry run ran in a git worktree of this repository
  (`demo/PROTOCOL.md` § Substrate, Amendment 1). The documentation states the
  behaviour: "all worktrees and subdirectories within the same repo share one
  auto memory directory." The memory was also never removed, so it is not a
  case of the heading it sits under.
- `03-content.prose.md` — "When the budget runs out, the conversation is
  summarised": worded more strongly than the source. The context-window page
  says Claude Code "compacts automatically as you approach the limit", and the
  figure shows a 33.0k autocompact buffer. The citation given covers the
  re-read, not the trigger.
- `03-content.prose.md` — "every line is paid for in every session": verified
  with one documented exception. The memory page says block-level HTML comments
  "are stripped before the content is injected".
- `03-content.prose.md` — "`/context` draws current usage as a grid": verified
  on the commands page, but the document's own figure shows a bar and a table.
  The surface the capture came from is not stated.
- `02-motivation.prose.md` — "performance degrades as input grows, even on
  simple tasks", in the present tense and undated: outdated framing. Hong et
  al. tested 18 models including GPT-4.1, Claude 4 and Gemini 2.5; Modarressi
  et al. tested 13 models including GPT-4o. The demo model is
  `claude-fable-5-1`. "Even on simple tasks" is Chroma's wording and is not in
  the NoLiMa abstract.
- `02-motivation.prose.md` — "most current models robust to this": "current" is
  the paper's word for the eleven models it tested, first submitted in October
  2024. A reader in 2026 will take it to mean today's models.
- `demo/PROTOCOL.md` — the execution command sets `--max-turns 25`; the logs
  report 31 to 49 turns per run, each ending in success. No prose claim depends
  on it, and the record does not explain it.

## Actionable

1. `03-content.prose.md` § The window is a budget you can read — replace "bought
   no change in what the agent did" with "changed none of the six scored
   behaviours", and hedge or cut "that holds on any window".
   (*why:* a reader would believe the manual left the agent's behaviour
   untouched, when the table two slides later shows it cut exploration by about
   seven tool calls)
2. `03-content.prose.md` § The demo and § What changed, and what did not — state
   the control's pre-registered prediction as written, no difference between
   arms, and label "expected to fail" as an explanation made after the runs.
   State observable 7 as registered, files read and tokens, and say the table
   counts all tool calls.
   (*why:* a reader would believe the failure and the measure were both fixed
   in advance, which is the property the demo's credibility rests on)
3. `03-content.prose.md` § What changed, and what did not — hedge "Observable 5
   had no second source" to "no second source in the repository", and disclose
   the built-in commit instructions as a confound present in every arm.
   Candidate source, not in `references.bib`: the settings reference page,
   `includeGitInstructions`.
   (*why:* a reader would believe the agent refrained from committing with
   nothing in its window about commits)
4. `02-motivation.prose.md` § Why agents make the window the bottleneck — source
   "A repository usually exceeds the window", or cut it to what the argument
   needs: the agent does not load the whole repository, so something decides
   what is left out.
   (*why:* a reader would take as established a claim the document's own
   1.0M-token figure and 61 KB substrate do not bear out)
5. `02-motivation.prose.md` § How a window fails — date the length evidence as
   the position evidence is dated: name the model generation tested in 2025,
   attach "even on simple tasks" to Hong et al. alone, and gloss "current" as
   the models Tian et al. tested.
   (*why:* a reader would believe these effects were measured on the models
   they are using now)
6. `03-content.prose.md` § Pitfalls — say the dry run ran in a worktree of the
   same repository and that the documentation states worktrees share one auto
   memory directory; cite `claudecode-memory`.
   (*why:* a reader would believe auto memory crosses between unrelated
   directories, and that the behaviour was a surprise and not documented)
7. `03-content.prose.md` § The demo, § CLAUDE.md as an index and
   `04-conclusion.prose.md` § Open edges — correct the small figures: the index
   is 33 lines; the documentation was read on 28 and 29 September 2026;
   compaction runs as the limit approaches; add the two post-hoc counts to
   `demo/RESULTS.md` so the prose has its permitted source.
   (*why:* each is a checkable detail a careful reader would find wrong, and
   that costs the verified claims around it their credit)
