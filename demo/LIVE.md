# Live demo — five short switches, LIVE A to LIVE E

Two terminal tabs: **T1** at `~/Sandbox/nec-07-context-engineering`, **T2** for
the live run. Paste each command exactly; nothing is typed. Each step is named
in the speaker notes of the slide it follows. These commands were written on
2026-10-06 and must be dry-run once before the talk.

| Step | After slide | Where | Shows |
| --- | --- | --- | --- |
| A | 5 | Claude Code panel | The window at launch |
| B | 7 | T1 | The three copies |
| C | 8 | T1 | Why arm A matched |
| D1–D4 | 9 | T1, T2, T1, T1 | The rule; start the live run; what d-4 said and wrote |
| E1–E2 | 14 | T2 | What the live run said and wrote |

## 0. Before the talk (T2) — reset the live copy

```
cd ~ && rm -rf ~/Sandbox/nec07-live-d ~/.claude/projects/-Users-abhishek-jai-Sandbox-nec07-live-d/memory && git clone ~/Sandbox/nec07-demo-d ~/Sandbox/nec07-live-d && cd ~/Sandbox/nec07-live-d
```

Then check the clone is clean and has the rule:

```
git -C ~/Sandbox/nec07-live-d status --short; git -C ~/Sandbox/nec07-live-d rev-list --count HEAD; grep -c "Put nothing between" ~/Sandbox/nec07-live-d/CLAUDE.md
```

Expected: no status lines, then `1`, then `1`.

Also: T1 at the repository (`cd ~/Sandbox/nec-07-context-engineering`), both
tabs cleared (Cmd+K), Claude Code panel open on a fresh session, PowerPoint in
presenter view.

## A. Read the window (Claude Code panel) — after slide 5

```
/context
```

Point at: the header total, System tools, Memory files, the file list.

## B. The three copies (T1) — after slide 7

```
for d in a b c; do r=~/Sandbox/nec07-demo-$d; printf "%s: " "$d"; git -C "$r" cat-file -e HEAD:CLAUDE.md 2>/dev/null && git -C "$r" show HEAD:CLAUDE.md | awk 'END{print NR " lines"}' || echo "no CLAUDE.md"; done
```

Expected: `a: no CLAUDE.md`, `b: 240 lines`, `c: 33 lines`.

## C. Why arm A matched (T1) — after slide 8

```
jq -r 'select(.type=="result") | .result' demo/runs/a-1/log.jsonl | grep -i "missing"
```

## D. The follow-up — after slide 9

D1 (T1) — the one line arm D adds:

```
git -C ~/Sandbox/nec07-demo-d show HEAD:CLAUDE.md | grep -A1 "Put nothing"
```

D2 (T2) — start the live arm-D run, then leave T2 alone:

```
cd ~/Sandbox/nec07-live-d && claude -p "$(cat ~/Sandbox/nec-07-context-engineering/demo/prompt.txt)" --model claude-fable-5-1 --output-format stream-json --verbose --max-turns 25 --allowedTools "Read" "Edit" "Write" "Glob" "Grep" "Bash(just *)" "Bash(ls *)" "Bash(git status)" "Bash(git add *)" "Bash(git commit *)" > /tmp/nec07-live-d.jsonl
```

D3 (T1) — what run d-4 said:

```
jq -r 'select(.type=="result") | .result' demo/runs/d-4/log.jsonl | grep "Kept the leading"
```

D4 (T1) — what run d-4 wrote:

```
sed -n '40,49p' demo/runs/d-4/untracked-section-files.txt
```

## E. The live run — after slide 14 (T2)

E1 — finished? and what it said (prints `success` first if the run is done):

```
jq -r 'select(.type=="result") | .subtype, .result' /tmp/nec07-live-d.jsonl | grep -i -E '^success|comment|between|extra'
```

E2 — what it wrote:

```
sed -n '1,9p' ~/Sandbox/nec07-live-d/sections/04-examples.prose.md
```

Read what follows `# Examples`: a `##` line means the rule was followed; a
`<!--` comment means it was not. Compare with E1.

If E1 prints nothing, the run has not finished: go back to the slides and
run step E after the last slide, before questions.
