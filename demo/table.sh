#!/usr/bin/env bash
# Usage: demo/table.sh   — one line per recorded run, pre-registered observables scored.
# reads = Read tool calls before the first Edit or Write (observable 7 as registered).
# calls = tool calls of every kind before it (post hoc, not registered).
cd ~/Sandbox/nec-07-context-engineering/demo/runs
python3 - <<'EOF'
import json, os, re, glob
print(f"{'run':6} {'o1':3} {'o2':3} {'o3':3} {'o4':3} {'o5':3} {'o6':3} {'reads':5} {'calls':5} {'tok@edit':9} {'turns':5} {'secs':5}")
for d in sorted(p for p in glob.glob('[abc]-*') if os.path.isdir(p)):
    ls = open(f'{d}/sections-ls.txt').read()
    o1 = '04-examples.prose.md' in ls and '04-examples.concepts.md' in ls
    o3 = '05-conclusion.prose.md' in ls and '04-examples.prose.md' in ls
    unt = open(f'{d}/untracked-section-files.txt').read()
    m = re.search(r'=== sections/04-examples\.concepts\.md\n(.*?)(?=\n=== |\Z)', unt, re.S)
    c = m.group(1) if m else ''
    o2 = all(h in c for h in ('## Claims', '## Decisions', '## Open questions', '## Not doing'))
    m = re.search(r'=== sections/04-examples\.prose\.md\n(.*?)(?=\n=== |\Z)', unt, re.S)
    p = m.group(1) if m else ''
    between = re.search(r'^# [^\n]*\n(.*?)^## ', p, re.S | re.M)
    o6 = between is not None and between.group(1).strip() == ''
    log = open(f'{d}/log.jsonl').read()
    o4 = 'just build' in log and open(f'{d}/postrun-build.txt').read().strip() == 'PASS'
    o5 = len(open(f'{d}/git-log.txt').read().splitlines()) == 1
    reads = calls = tok = turns = secs = None; n = n_reads = n_calls = 0
    for line in log.splitlines():
        try: e = json.loads(line)
        except Exception: continue
        if e.get('type') == 'assistant':
            n += 1; msg = e.get('message', {}); u = msg.get('usage', {})
            for blk in msg.get('content', []):
                if blk.get('type') != 'tool_use' or reads is not None: continue
                if blk['name'] in ('Edit', 'Write'):
                    reads, calls = n_reads, n_calls; tok = (u.get('cache_read_input_tokens', 0) or 0) + (u.get('cache_creation_input_tokens', 0) or 0) + (u.get('input_tokens', 0) or 0)
                else:
                    n_calls += 1; n_reads += blk['name'] == 'Read'
        if e.get('type') == 'result':
            secs = round((e.get('duration_ms') or 0) / 1000)
    turns = n
    y = lambda b: 'y' if b else 'n'
    print(f"{d:6} {y(o1):3} {y(o2):3} {y(o3):3} {y(o4):3} {y(o5):3} {y(o6):3} {str(reads):5} {str(calls):5} {str(tok):9} {turns:5} {str(secs):5}")
EOF