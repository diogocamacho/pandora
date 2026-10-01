#!/usr/bin/env python3
"""Link Pandora clippings to idea notes (supports / challenges), with a reason per link.

Runs as its own pass after clipping enrichment. Processes every clip in Clippings/
without `ideas_checked: true` (so it backfills old clips once), writes:
  - clip frontmatter: idea-supports / idea-challenges (block lists of [[wikilinks]]), ideas_checked
  - clip body: `## Growing ideas` with ✅/⚡ lines + reasons
  - idea notes: ✅ line under `## Supporting evidence`, ⚡ under `## Challenges & counterpoints`
  - idea frontmatter: evidence_supporting, evidence_challenging, evidence_last (recounted every run,
    so entries written by paper-summary are counted too)

Usage: link_ideas.py <vault> [--dry-run] [--limit N] [--mock results.json] [--only "<clip title>"]
"""
import argparse, datetime, json, os, re, subprocess, sys

FM_RE = re.compile(r'^---\n(.*?)\n---\n?', re.DOTALL)
ERR_RE = re.compile(r'API Error|Failed to authenticate|OAuth|not enabled in this environment|rate.?limit|overloaded', re.I)
SUP, CHA = 'Supporting evidence', 'Challenges & counterpoints'


def log(msg):
    print(f"[{datetime.datetime.now():%Y-%m-%d %H:%M}] {msg}", flush=True)


def read(p):
    with open(p, encoding='utf-8') as f:
        return f.read()


def write(p, s, dry):
    if not dry:
        with open(p, 'w', encoding='utf-8') as f:
            f.write(s)


def split_fm(text):
    m = FM_RE.match(text)
    return (m.group(1), text[m.end():]) if m else (None, text)


def join_fm(fm, body):
    return f"---\n{fm.strip(chr(10))}\n---\n{body}" if fm is not None else body


def _key_block(key):
    # key line plus any indented continuation lines (block lists)
    return re.compile(r'^' + re.escape(key) + r':[^\n]*(?:\n[ \t]+[^\n]*)*', re.M)


def fm_get(fm, key):
    m = re.search(r'^' + re.escape(key) + r':[ \t]*(.*)$', fm or '', re.M)
    return m.group(1).strip().strip('"\'') if m else None


def fm_list(fm, key):
    m = _key_block(key).search(fm or '')
    if not m:
        return []
    block = m.group(0)
    inline = re.match(re.escape(key) + r':[ \t]*\[(.*)\]', block)
    raw = inline.group(1).split(',') if inline else re.findall(r'^[ \t]+-[ \t]*(.*)$', block, re.M)
    out = []
    for item in raw:
        item = item.strip().strip('"\'').replace('[[', '').replace(']]', '').strip()
        if item:
            out.append(item)
    return out


def fm_set(fm, key, value_block):
    """value_block: full text after 'key:' (e.g. ' true' or '\n  - "[[x]]"')."""
    new = f"{key}:{value_block}"
    pat = _key_block(key)
    if pat.search(fm):
        return pat.sub(lambda _: new, fm, count=1)
    return fm.rstrip('\n') + '\n' + new


def fm_del(fm, key):
    return _key_block(key).sub('', fm, count=1).replace('\n\n', '\n')


def fm_set_links(fm, key, names):
    if not names:
        return fm_del(fm, key) if _key_block(key).search(fm) else fm
    return fm_set(fm, key, ''.join(f'\n  - "[[{n}]]"' for n in names))


# ── ideas ─────────────────────────────────────────────────────────────────────

def load_ideas(ideas_dir):
    ideas = {}
    for root, _, files in os.walk(ideas_dir):
        for f in sorted(files):
            if not f.endswith('.md'):
                continue
            p = os.path.join(root, f)
            _, body = split_fm(read(p))
            body = re.sub(r'<%.*?%>', ' ', body, flags=re.S)
            body = re.split(r'\n## (?:Supporting evidence|Challenges & counterpoints|Evidence & reinforcement)', body)[0]
            body = re.sub(r'!\[[^\]]*\]\([^)]*\)', ' ', body)
            ideas[f[:-3]] = {
                'path': p,
                'folder': os.path.relpath(root, ideas_dir),
                'summary': ' '.join(body.split())[:450],
            }
    return ideas


def migrate_old_heading(path, dry):
    """Old pipeline wrote '## Evidence & reinforcement' with unmarked lines; normalize to ✅ format."""
    t = read(path)
    if '## Evidence & reinforcement' not in t:
        return False
    def fix(m):
        lines = [re.sub(r'^- (?![✅⚡])', '- ✅ ', l) for l in m.group(1).splitlines()]
        return f'## {SUP}\n' + '\n'.join(lines) + ('\n' if m.group(1).endswith('\n') else '')
    t = re.sub(r'## Evidence & reinforcement\n((?:- [^\n]*\n?)*)', fix, t)
    write(path, t, dry)
    return True


def add_backref(path, section, entry, link_title, dry):
    t = read(path)
    if f'[[{link_title}]]' in t:
        return False
    heading = f'## {section}'
    if heading in t:
        start = t.index(heading)
        rest = t[start + len(heading):]
        m = re.search(r'\n(?=---\n|## )', rest)
        end = start + len(heading) + (m.start() if m else len(rest))
        t = t[:end].rstrip('\n') + '\n' + entry + '\n' + ('\n' if end < len(t) else '') + t[end:].lstrip('\n')
    else:
        t = t.rstrip('\n') + f'\n\n---\n\n{heading}\n{entry}\n'
    write(path, t, dry)
    return True


def recount(path, dry):
    t = read(path)
    sup = len(re.findall(r'^- ✅', t, re.M))
    cha = len(re.findall(r'^- ⚡', t, re.M))
    dates = re.findall(r'^- [✅⚡].*?\((\d{4}-\d{2}-\d{2})', t, re.M)
    fm, body = split_fm(t)
    if fm is None:
        if sup == cha == 0:
            return
        fm = ''
    if sup == cha == 0 and fm_get(fm, 'evidence_supporting') is None:
        return
    new = fm_set(fm, 'evidence_supporting', f' {sup}')
    new = fm_set(new, 'evidence_challenging', f' {cha}')
    if dates:
        new = fm_set(new, 'evidence_last', f' {max(dates)}')
    if new != fm:
        write(path, join_fm(new, body), dry)


# ── model ─────────────────────────────────────────────────────────────────────

PROMPT = """You are linking a web clipping in Diogo Camacho's Obsidian vault to his idea notes.
Diogo is a computational biologist and biotech executive; his ideas are venture / research theses.

IDEA CATALOG (exact title [folder]: summary):
{catalog}

CLIPPING: "{title}"
{body}

Decide which ideas this clipping SUPPORTS or CHALLENGES.
- Support = specific evidence, data, mechanism, market signal, or argument that strengthens the idea's core thesis or a key assumption.
- Challenge = evidence against, a failure mode, a competing approach that undercuts it, or a broken assumption.
- Topical overlap alone is NOT a link. Most clippings link to 0-2 ideas; empty arrays are a normal answer.
- Never list the same idea under both. Use idea titles EXACTLY as written in the catalog.
- reason: <=25 words, concrete (name the finding or argument), no hype.

Return ONLY JSON, no prose, no fences:
{{"supports": [{{"idea": "<exact title>", "reason": "<why>"}}], "challenges": [{{"idea": "<exact title>", "reason": "<why>"}}]}}"""


def ask_model(prompt):
    r = subprocess.run(['claude', '-p', prompt, '--output-format', 'text'],
                       capture_output=True, text=True, timeout=300)
    out = (r.stdout or '').strip()
    if r.returncode != 0 or not out or ERR_RE.search(out[:400]):
        raise RuntimeError(f"claude failed (rc={r.returncode}): {((r.stderr or '') + out)[:300]!r}")
    m = re.search(r'\{.*\}', out, re.S)
    if not m:
        raise RuntimeError(f"no JSON in response: {out[:200]!r}")
    return json.loads(m.group(0))


# ── main ──────────────────────────────────────────────────────────────────────

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('vault')
    ap.add_argument('--dry-run', action='store_true')
    ap.add_argument('--limit', type=int, default=25)
    ap.add_argument('--mock', help='JSON file {clip title: {supports:[...], challenges:[...]}} instead of calling claude')
    ap.add_argument('--only', help='process just this clip title (ignores ideas_checked)')
    a = ap.parse_args()
    dry = a.dry_run
    clips_dir, ideas_dir = os.path.join(a.vault, 'Clippings'), os.path.join(a.vault, 'ideas')
    mock = json.load(open(a.mock, encoding='utf-8')) if a.mock else None

    ideas = load_ideas(ideas_dir)
    for meta in ideas.values():
        if migrate_old_heading(meta['path'], dry):
            log(f"  migrated old 'Evidence & reinforcement' heading: {os.path.basename(meta['path'])}")
    catalog = '\n'.join(f"- {t} [{m['folder']}]: {m['summary']}" for t, m in ideas.items())

    todo = []
    for f in sorted(os.listdir(clips_dir)):
        if not f.endswith('.md'):
            continue
        title = f[:-3]
        fm, _ = split_fm(read(os.path.join(clips_dir, f)))
        if a.only:
            if title == a.only:
                todo.append(f)
        elif str(fm_get(fm, 'ideas_checked')).lower() != 'true':
            todo.append(f)
    log(f"Idea linking: {len(todo)} clip(s) to check, {len(ideas)} idea notes" + (" [dry-run]" if dry else ""))

    linked = failed = 0
    for f in todo[:a.limit]:
        path, title = os.path.join(clips_dir, f), f[:-3]
        text = read(path)
        fm, body = split_fm(text)
        fm = fm or ''
        clip_date = fm_get(fm, 'created') or datetime.date.today().isoformat()
        try:
            if mock is not None:
                res = mock.get(title, {'supports': [], 'challenges': []})
            else:
                res = ask_model(PROMPT.format(catalog=catalog, title=title, body=body.strip()[:8000]))
        except Exception as e:  # leave ideas_checked unset so it retries next run
            failed += 1
            log(f"  WARN {title}: {e}")
            continue

        sup = [(x.get('idea', '').strip(), x.get('reason', '').strip()) for x in res.get('supports', [])]
        cha = [(x.get('idea', '').strip(), x.get('reason', '').strip()) for x in res.get('challenges', [])]
        unknown = [i for i, _ in sup + cha if i not in ideas]
        if unknown:
            log(f"  dropped unknown idea titles for {title}: {unknown}")
        sup = [(i, r) for i, r in sup if i in ideas]
        cha = [(i, r) for i, r in cha if i in ideas and i not in {s for s, _ in sup}]

        # clip frontmatter + body
        new_fm = fm
        if fm_get(new_fm, 'idea-connections') == '' and not fm_list(new_fm, 'idea-connections'):
            new_fm = fm_del(new_fm, 'idea-connections')
        s_names = list(dict.fromkeys(fm_list(new_fm, 'idea-supports') + [i for i, _ in sup]))
        c_names = list(dict.fromkeys(fm_list(new_fm, 'idea-challenges') + [i for i, _ in cha]))
        new_fm = fm_set_links(new_fm, 'idea-supports', s_names)
        new_fm = fm_set_links(new_fm, 'idea-challenges', c_names)
        new_fm = fm_set(new_fm, 'ideas_checked', ' true')
        lines = [f"- ✅ [[{i}]] — {r}" for i, r in sup] + [f"- ⚡ [[{i}]] — {r}" for i, r in cha]
        lines = [l for l in lines if l.split(' — ')[0] not in body]
        if lines:
            if '## Growing ideas' in body:
                body = body.replace('## Growing ideas', '## Growing ideas\n' + '\n'.join(lines), 1)
            else:
                body = body.rstrip('\n') + '\n\n## Growing ideas\n' + '\n'.join(lines) + '\n'
        write(path, join_fm(new_fm, body), dry)

        # idea back-references
        for idea, reason in sup:
            add_backref(ideas[idea]['path'], SUP, f"- ✅ [[{title}]] ({clip_date} · clip) — {reason}", title, dry)
        for idea, reason in cha:
            add_backref(ideas[idea]['path'], CHA, f"- ⚡ [[{title}]] ({clip_date} · clip) — {reason}", title, dry)
        if sup or cha:
            linked += 1
            log(f"  {title}: " + ', '.join([f'✅ {i}' for i, _ in sup] + [f'⚡ {i}' for i, _ in cha]))
        else:
            log(f"  {title}: no idea links")

    for meta in ideas.values():
        recount(meta['path'], dry)
    rest = max(0, len(todo) - a.limit)
    log(f"Idea linking done — {linked} clip(s) linked, {failed} failed (will retry), {rest} deferred to next run")


if __name__ == '__main__':
    main()
