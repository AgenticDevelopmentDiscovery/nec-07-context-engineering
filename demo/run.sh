#!/usr/bin/env bash
# Usage: demo/run.sh <a|b|c> <n>   — one pre-registered demo run, fully recorded.
set -euo pipefail
ARM=$1; N=$2
WT=~/Sandbox/nec07-demo
REPO=~/Sandbox/nec-07-context-engineering
MEM=~/.claude/projects/-Users-abhishek-jai-Sandbox-nec-07-context-engineering/memory
OUT="$REPO/demo/runs/$ARM-$N"

[ -d "$MEM" ] && { echo "ABORT: auto memory present at $MEM"; exit 1; }
[ -e "$OUT" ] && { echo "ABORT: $OUT already exists"; exit 1; }
mkdir -p "$OUT"

cd "$WT"
git reset -q --hard && git clean -fdxq && git checkout -q "demo/arm-$ARM"
git rev-parse --short HEAD > "$OUT/start-commit.txt"
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
git diff "demo/arm-$ARM" -- . > "$OUT/diff-vs-arm.patch"
ls sections > "$OUT/sections-ls.txt"
for f in sections/*.md; do
  git ls-files --error-unmatch "$f" >/dev/null 2>&1 || { echo "=== $f"; cat "$f"; echo; }
done > "$OUT/untracked-section-files.txt"
( just build > "$OUT/postrun-build.log" 2>&1 && echo PASS || echo FAIL ) > "$OUT/postrun-build.txt"
echo "recorded: $OUT"