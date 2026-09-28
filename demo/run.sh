#!/usr/bin/env bash
# Usage: demo/run.sh <a|b|c> <n>   — one pre-registered demo run, fully recorded.
set -euo pipefail
ARM=$1; N=$2
WT=~/Sandbox/nec07-demo-$ARM
REPO=~/Sandbox/nec-07-context-engineering
MEM=~/.claude/projects/-Users-abhishek-jai-Sandbox-nec07-demo-$ARM/memory
MAINMEM=~/.claude/projects/-Users-abhishek-jai-Sandbox-nec-07-context-engineering/memory
OUT="$REPO/demo/runs/$ARM-$N"

[ -n "$(ls -A "$MEM" 2>/dev/null)" ] && { echo "ABORT: auto memory present at $MEM"; exit 1; }
[ -n "$(ls -A "$MAINMEM" 2>/dev/null)" ] && { echo "ABORT: main-repo memory restored at $MAINMEM"; exit 1; }
[ -e "$OUT" ] && { echo "ABORT: $OUT already exists"; exit 1; }
mkdir -p "$OUT"

cd "$WT"
git reset -q --hard && git clean -fdxq
git rev-parse --short HEAD > "$OUT/start-commit.txt"
git log --oneline | wc -l > "$OUT/history-depth.txt"
claude --version > "$OUT/claude-version.txt"
date -u +%Y-%m-%dT%H:%M:%SZ > "$OUT/started.txt"

claude -p "$(cat "$REPO/demo/prompt.txt")" --model claude-fable-5-1 \
  --output-format stream-json --verbose --max-turns 25 \
  --allowedTools "Read" "Edit" "Write" "Glob" "Grep" "Bash(just *)" "Bash(ls *)" \
  "Bash(git status)" "Bash(git add *)" "Bash(git commit *)" \
  > "$OUT/log.jsonl" || echo "claude exited non-zero" >> "$OUT/notes.txt"

date -u +%Y-%m-%dT%H:%M:%SZ > "$OUT/finished.txt"
git status --short > "$OUT/git-status.txt"
git log --oneline -3 > "$OUT/git-log.txt"
git diff main -- . > "$OUT/diff-vs-arm.patch"
ls sections > "$OUT/sections-ls.txt"
for f in sections/*.md; do
  git ls-files --error-unmatch "$f" >/dev/null 2>&1 || { echo "=== $f"; cat "$f"; echo; }
done > "$OUT/untracked-section-files.txt"
( just build > "$OUT/postrun-build.log" 2>&1 && echo PASS || echo FAIL ) > "$OUT/postrun-build.txt"
if [ -n "$(ls -A "$MEM" 2>/dev/null)" ]; then mv "$MEM" "$OUT/memory-written-by-this-run"; echo "memory written; moved into record" >> "$OUT/notes.txt"; else rm -rf "$MEM"; fi
echo "recorded: $OUT"