# Live demo — 3 minutes (commands verified 2026-09-30, Claude Code 2.1.281)

Two terminal tabs: **T1** at `~/Sandbox/nec-07-context-engineering`, **T2** for the live run.
Paste each command exactly; nothing is typed.

## 0. Before the talk (T2) — reset the live copy

```
cd ~ && rm -rf ~/Sandbox/nec07-live-c && git clone ~/Sandbox/nec07-demo-c ~/Sandbox/nec07-live-c && cd ~/Sandbox/nec07-live-c
```

Also: T1 at the repository (`cd ~/Sandbox/nec-07-context-engineering`), both tabs cleared (Cmd+K), Claude Code panel visible.

## 1. Start the live run (T2) — first thing, then leave the tab alone

```
cd ~/Sandbox/nec07-live-c && claude -p "$(cat ~/Sandbox/nec-07-context-engineering/demo/prompt.txt)" --model claude-fable-5-1 --output-format stream-json --verbose --max-turns 25 --allowedTools "Read" "Edit" "Write" "Glob" "Grep" "Bash(just *)" "Bash(ls *)" "Bash(git status)" "Bash(git add *)" "Bash(git commit *)" > /tmp/nec07-live-c.jsonl
```

Silent while it runs; the prompt returns when done. Rehearsal: started 07:07, finished 07:08. Recorded arm C: 110–156 s.

## 2. Budget, live (Claude Code panel)

New session, then:

```
/context
```

Point at: the header total; System tools (the harness's, not ours); Memory files (this `CLAUDE.md` plus the auto-memory index, listed per file at the bottom); Skills (28 descriptions, one of them `/round`). Rehearsal: 33.7k, with System prompt 5.7k where it was 4.5k the day before — moved overnight, nothing of ours changed.

## 3. Three windows (T1)

```
for d in a b c; do r=~/Sandbox/nec07-demo-$d; printf "%s: " "$d"; git -C "$r" cat-file -e HEAD:CLAUDE.md 2>/dev/null && git -C "$r" show HEAD:CLAUDE.md | awk 'END{print NR" lines"}' || echo "no CLAUDE.md"; done
```

```
a: no CLAUDE.md
b: 240 lines
c: 33 lines
```

## 4. The null result in the agent's words (T1)

Arm A, run a-1, final message — scroll to "Things to know":

```
jq -r 'select(.type=="result") | .result' demo/runs/a-1/log.jsonl
```

> **Missing `CLAUDE.md`:** The README points to `CLAUDE.md` as "the method", but that file is not in the repository. I followed the conventions from the README, `justfile` and the existing sections instead.

Dry run — the one run that followed the unwritten rule, because a saved memory put it in the window:

```
jq -r 'select(.type=="result") | .result' demo/runs/dryrun-b.jsonl | grep -i "saved memory"
```

> 5. **Left out the HTML comment under the `#` heading.** A saved memory … says nothing should sit between the `#` heading and the first `##` … The build confirms it: the four existing sections each produce an empty frame from their comment, and Examples does not.

## 5. Read the live run (T2) — last, or in Q&A

```
ls -l /tmp/nec07-live-c.jsonl
jq -r 'select(.type=="result") | .result' /tmp/nec07-live-c.jsonl
```

Expect: both files created, three or four ## units (run-to-run variation is real), conclusion renumbered `04-` → `05-`, `just build` passed, nothing committed.

## 6. Fallback

If anything fails: `~/Desktop/demo-backup.mov`. Drag the scrubber past the wait in step 1.