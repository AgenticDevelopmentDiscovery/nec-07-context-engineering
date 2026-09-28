#!/usr/bin/env bash
# Usage: demo/inspect.sh <a|b|c|dryrun> <n>   — standard summary of one recorded run.
set -euo pipefail
OUT=~/Sandbox/nec-07-context-engineering/demo/runs/$1-$2
cd "$OUT"
echo "== start commit / version"; cat start-commit.txt claude-version.txt
echo "== git status";  cat git-status.txt
echo "== git log";     cat git-log.txt
echo "== sections";    cat sections-ls.txt
echo "== postrun build"; cat postrun-build.txt
echo "== assistant turns"; grep -c '"type":"assistant"' log.jsonl
echo "== tool calls"; grep -o '"name":"[A-Za-z]*"' log.jsonl | sort | uniq -c
echo "== agent ran 'just build'"; grep -c 'just build' log.jsonl || true
echo "== agent ran 'git commit'"; grep -c '"command":"git commit' log.jsonl || true
echo "== memory mentions"; grep -oi '.\{60\}memory.\{60\}' log.jsonl | head -5 || true
echo "== new prose file, first 8 lines"
awk '/^=== .*prose.md/{p=1;next} /^=== /{p=0} p' untracked-section-files.txt | sed -n '1,8p'
echo "== reads before first edit, tokens at that point"
python3 - log.jsonl <<'EOF'
import json, sys
reads = []
for line in open(sys.argv[1]):
    try: e = json.loads(line)
    except Exception: continue
    if e.get("type") != "assistant": continue
    m = e.get("message", {}); u = m.get("usage", {})
    for c in m.get("content", []):
        if c.get("type") != "tool_use": continue
        n, i = c["name"], c.get("input", {})
        if n in ("Edit", "Write"):
            print(f"first edit: {n} {i.get('file_path')}")
            print(f"reads before first edit: {len(reads)}")
            print("\n".join("  " + r for r in reads))
            print("usage at first edit:", {k: u.get(k) for k in
                  ("input_tokens", "cache_read_input_tokens", "cache_creation_input_tokens", "output_tokens")})
            sys.exit()
        reads.append(f"{n} {i.get('file_path') or i.get('pattern') or str(i.get('command',''))[:80]}")
print("no edit found")
EOF
echo "== final result (tail)"; tail -c 2000 log.jsonl; echo