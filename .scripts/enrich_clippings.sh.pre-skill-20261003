#!/usr/bin/env bash
# Obsidian vault enrichment pipeline:
#   1. Enrich unprocessed clippings: tags + vault backlinks
#   2. Idea linking via link_ideas.py (✅/⚡ back-refs + reasons into idea notes; backfills clips without ideas_checked)
#   3. Generate a daily learning synthesis
#   4. On Fridays: generate a weekly learning review
#
# Requires: claude CLI in PATH (ships with Claude Code).
# Run manually: bash /Users/dcamacho/Documents/pandora/.scripts/enrich_clippings.sh
# Scheduled via: ~/Library/LaunchAgents/com.dcamacho.enrich-clippings.plist

set -uo pipefail

VAULT="/Users/dcamacho/Documents/pandora"
CLIPPINGS="$VAULT/Clippings"
NOTES="$VAULT/Notes"
IDEAS="$VAULT/ideas"
PAPER_ANALYSES="$VAULT/Papers/Analyses"
LOG="$VAULT/.scripts/enrich_clippings.log"
TODAY=$(date '+%Y-%m-%d')

log() { echo "[$(date '+%Y-%m-%d %H:%M')] $*" | tee -a "$LOG"; }

# ── Index vault titles ────────────────────────────────────────────────────────

NOTE_TITLES=$(find "$NOTES" -name "*.md" ! -path "*/Daily/*" \
  | sed 's|.*/||;s|\.md$||' | sort | tr '\n' '|')

IDEA_TITLES=$(find "$IDEAS" -name "*.md" \
  | sed 's|.*/||;s|\.md$||' | sort | tr '\n' '|')

# ── Enrich clippings ──────────────────────────────────────────────────────────

TOTAL=$(find "$CLIPPINGS" -name "*.md" | wc -l | tr -d ' ')
log "Starting enrichment — $TOTAL clippings total"

while IFS= read -r FILE; do
  # Skip already processed
  if python3 -c "
import sys; c = open(sys.argv[1]).read(); sys.exit(0 if 'processed: true' in c else 1)
" "$FILE" 2>/dev/null; then
    continue
  fi

  TITLE=$(basename "$FILE" .md)
  log "Processing: $TITLE"
  CONTENT=$(head -c 4000 "$FILE")

  RESULT=$(claude -p "You are enriching an Obsidian clipping with tags and vault backlinks.

Vault note titles (pipe-separated):
$NOTE_TITLES

Clipping content:
$CONTENT

Return ONLY valid JSON — no explanation, no markdown fences:
{
  \"tags\": [\"kebab-case-tag\"],
  \"related\": [\"Exact Vault Note Title\"]
}

Rules:
- tags: 3-6 thematic kebab-case tags. Do NOT include 'clippings'.
- related: vault note titles with a genuine thematic connection. Empty array if nothing fits." \
    --output-format text 2>/dev/null || echo "")

  if [[ -z "$RESULT" ]]; then
    log "  WARN: no response for '$TITLE', skipping"
    continue
  fi

  # Validate and extract JSON
  JSON=$(echo "$RESULT" | python3 -c "
import sys, re, json
raw = sys.stdin.read()
m = re.search(r'\{.*\}', raw, re.DOTALL)
if m:
    try: json.loads(m.group()); print(m.group())
    except Exception: pass
" 2>/dev/null || echo "")

  if [[ -z "$JSON" ]]; then
    log "  WARN: could not parse JSON for '$TITLE', skipping"
    continue
  fi

  # Parse all three fields into newline-separated lists
  NEW_TAGS=$(python3 -c "
import sys, json; d = json.loads(sys.argv[1])
print(' '.join(d.get('tags', [])))" "$JSON" 2>/dev/null || echo "")

  RELATED_LIST=$(python3 -c "
import sys, json; d = json.loads(sys.argv[1])
print('\n'.join(d.get('related', [])))" "$JSON" 2>/dev/null || echo "")

  IDEAS_SUPPORT=$(python3 -c "
import sys, json; d = json.loads(sys.argv[1])
print('\n'.join(d.get('ideas_support', [])))" "$JSON" 2>/dev/null || echo "")

  IDEAS_CHALLENGE=$(python3 -c "
import sys, json; d = json.loads(sys.argv[1])
print('\n'.join(d.get('ideas_challenge', [])))" "$JSON" 2>/dev/null || echo "")

  # 1. Add new tags to frontmatter
  for TAG in $NEW_TAGS; do
    ALREADY=$(python3 -c "
import sys; c = open(sys.argv[1]).read(); t = sys.argv[2]
print('yes' if ('\"'+t+'\"') in c or ('- '+t) in c else 'no')
" "$FILE" "$TAG" 2>/dev/null || echo "no")
    if [[ "$ALREADY" == "no" ]]; then
      python3 - "$FILE" "$TAG" <<'PYEOF'
import sys, re
fp, tag = sys.argv[1], sys.argv[2]
c = open(fp).read()
if re.search(r'^tags:\s*\[', c, re.MULTILINE):
    c = re.sub(r'^(tags:\s*\[.*?)\]',
        lambda m: f'{m.group(1)}, "{tag}"]', c, flags=re.MULTILINE)
elif re.search(r'^tags:', c, re.MULTILINE):
    c = re.sub(r'^(tags:(?:\n  -[^\n]+)+)',
        lambda m: m.group(0) + f'\n  - "{tag}"', c, flags=re.MULTILINE)
open(fp, 'w').write(c)
PYEOF
    fi
  done

  # 2. Add related: frontmatter field
  if [[ -n "$RELATED_LIST" ]]; then
    printf '%s' "$RELATED_LIST" | python3 - "$FILE" <<'PYEOF'
import sys, re
fp = sys.argv[1]
notes = [l.strip() for l in sys.stdin.read().splitlines() if l.strip()]
c = open(fp).read()
if 'related:' not in c:
    lines = '\n'.join(f'  - "[[{n}]]"' for n in notes)
    block = f'related:\n{lines}'
    c = re.sub(r'^(tags:)', block + '\n' + r'\1', c, count=1, flags=re.MULTILINE)
    open(fp, 'w').write(c)
PYEOF
  fi

  # 3. (idea links now handled by link_ideas.py — separate pass below)

  # 4. Mark as processed
  python3 - "$FILE" <<'PYEOF'
import sys, re
fp = sys.argv[1]; c = open(fp).read()
if 'processed: true' not in c:
    c = re.sub(r'\n---\n', '\nprocessed: true\n---\n', c, count=1)
    open(fp, 'w').write(c)
PYEOF

  # 5. Append body sections
  if [[ -n "$RELATED_LIST" ]]; then
    printf '%s' "$RELATED_LIST" | python3 - "$FILE" <<'PYEOF'
import sys
fp = sys.argv[1]; c = open(fp).read()
notes = [l.strip() for l in sys.stdin.read().splitlines() if l.strip()]
if '## Related notes' not in c:
    lines = '\n'.join(f'- [[{n}]]' for n in notes)
    open(fp, 'a').write(f'\n## Related notes\n{lines}')
PYEOF
  fi

  log "  ✓ tags: [$NEW_TAGS]"
done < <(find "$CLIPPINGS" -name "*.md")

log "Enrichment complete."

# ── Idea linking (separate pass; backfills any clip without ideas_checked) ──
# Gives the model a catalog of idea summaries + the clip body, writes ✅/⚡ links with reasons,
# and recounts evidence_* frontmatter on idea notes (also counts paper-summary entries).
python3 "$VAULT/.scripts/link_ideas.py" "$VAULT" 2>&1 | tee -a "$LOG"

# ── Daily synthesis ───────────────────────────────────────────────────────────

LEARNINGS_FILE="$NOTES/Logs/$TODAY learnings.md"
BRIEF_FILE="$NOTES/Daily/$TODAY daily brief.md"

if [[ -f "$LEARNINGS_FILE" ]]; then
  log "Daily synthesis already exists for $TODAY, skipping."
else
  log "Generating daily synthesis..."

  # Previous 4 days of synthesis — feeds thread carry-through
  PREV_SYNTHESES=$(python3 - "$NOTES/Logs" "$TODAY" <<'PYEOF'
import sys, os, re
from datetime import date, timedelta
logs_dir, today = sys.argv[1], sys.argv[2]
cutoff = (date.fromisoformat(today) - timedelta(days=4)).isoformat()
entries = []
for fname in sorted(os.listdir(logs_dir)):
    if "learnings" not in fname or not fname.endswith(".md"):
        continue
    dm = re.match(r'(\d{4}-\d{2}-\d{2})', fname)
    if dm and cutoff <= dm.group(1) < today:
        c = open(os.path.join(logs_dir, fname)).read()
        c = re.sub(r'^---.*?---\s*\n', '', c, flags=re.DOTALL)
        c = re.sub(r'\n## 🤔 Think about today.*$', '', c, flags=re.DOTALL)
        c = c.strip()
        if c:
            entries.append(f"[{dm.group(1)}]\n{c}")
if entries:
    print('\n\n'.join(entries))
else:
    print("(no previous synthesis notes yet — this may be the first day)")
PYEOF
)

  CLIP_CONTEXT=$(python3 - "$CLIPPINGS" <<'PYEOF'
import sys, os, re
from datetime import date, timedelta
clips_dir = sys.argv[1]
cutoff = (date.today() - timedelta(days=7)).isoformat()
lines = []
for fname in sorted(os.listdir(clips_dir)):
    if not fname.endswith(".md"):
        continue
    c = open(os.path.join(clips_dir, fname)).read()
    dm = re.search(r'^created:\s*(\S+)', c, re.MULTILINE)
    if not dm or dm.group(1) < cutoff:
        continue
    title_m = re.search(r'^title:\s*"?(.+?)"?\s*$', c, re.MULTILINE)
    tags_m  = re.search(r'^tags:\s*\[(.+?)\]', c, re.MULTILINE)
    desc_m  = re.search(r'^description:\s*"?(.+?)"?\s*$', c, re.MULTILINE)
    links   = list(dict.fromkeys(re.findall(r'\[\[([^\]]+)\]\]', c)))[:5]
    title   = title_m.group(1) if title_m else fname
    tags    = tags_m.group(1) if tags_m else ""
    lines.append(f'- "{title}"')
    if desc_m:  lines.append(f'  Summary: {desc_m.group(1)[:120]}')
    if tags:    lines.append(f'  Tags: {tags}')
    if links:   lines.append(f'  Links: {", ".join(links)}')
print('\n'.join(lines) if lines else '(no recent clippings)')
PYEOF
)

  PAPER_CONTEXT=$(python3 - "$PAPER_ANALYSES" <<'PYEOF'
import sys, os, re
from datetime import date, timedelta
d = sys.argv[1]
if not os.path.isdir(d):
    print('(no paper analyses yet)'); sys.exit(0)
cutoff = (date.today() - timedelta(days=7)).isoformat()
def fm(c, key):
    m = re.search(r'^' + re.escape(key) + r':\s*"?(.+?)"?\s*$', c, re.MULTILINE)
    return m.group(1) if m else ''
def fm_list(c, key):
    m = re.search(r'^' + re.escape(key) + r':\s*\n((?:[ \t]+-[^\n]*\n?)+)', c, re.MULTILINE)
    if not m: return []
    out = []
    for l in m.group(1).splitlines():
        l = re.sub(r'^\s*-\s*', '', l).strip().strip('"').replace('[[', '').replace(']]', '')
        if l: out.append(l)
    return out
lines = []
for fname in sorted(os.listdir(d)):
    if not fname.endswith('.md'):
        continue
    c = open(os.path.join(d, fname), encoding='utf-8').read()
    if 'type: paper-analysis' not in c:
        continue
    when = fm(c, 'analyzed_on')
    if not when or when < cutoff:
        continue
    title = fname[:-3]
    lines.append(f'- [[{title}]] (paper, read {when}, verdict: {fm(c, "verdict") or "?"}, reviewer divergence: {fm(c, "reviewer_divergence") or "?"})')
    if fm(c, 'tldr'):
        lines.append(f'  TL;DR: {fm(c, "tldr")[:300]}')
    sup, cha = fm_list(c, 'idea-supports'), fm_list(c, 'idea-challenges')
    if sup: lines.append(f'  Supports ideas: {", ".join(sup)}')
    if cha: lines.append(f'  Challenges ideas: {", ".join(cha)}')
print('\n'.join(lines) if lines else '(no papers analyzed in the last 7 days)')
PYEOF
)

  EOD_CONTEXT=$(python3 - "$NOTES/Daily" <<'PYEOF'
import sys, os, re
daily_dir = sys.argv[1]
# Read yesterday's note (index 1) so EOD is complete, not today's empty note
notes = sorted([f for f in os.listdir(daily_dir)
    if re.match(r'\d{4}-\d{2}-\d{2}\.md$', f)], reverse=True)
target = notes[1] if len(notes) > 1 else (notes[0] if notes else None)
if not target:
    print("(no daily notes found)"); sys.exit(0)
c = open(os.path.join(daily_dir, target)).read()
m = re.search(r'## 🌙 Evening shutdown(.+?)(?=\n## |\Z)', c, re.DOTALL)
if not m:
    print(f"(no EOD in {target})"); sys.exit(0)
section = m.group(1).strip()
print(section if re.search(r'- (Wins|Stuck on|Tomorrow):\s*\S', section)
      else f'(EOD in {target} not filled in)')
PYEOF
)

  AI_RESPONSE=$(claude -p "Generate a daily learning synthesis for a personal Obsidian vault.

Previous synthesis notes (last 4 days) — use these to identify threads that are continuing and evolving day-to-day:
$PREV_SYNTHESES

Recent clippings (last 7 days):
$CLIP_CONTEXT

Papers deep-read in the last 7 days (full adversarial analyses with an independent reviewer). Weight them by verdict: 'weak'/'unsupported' papers are cautionary, not evidence. Where a paper bears on a bullet, cite it with its [[wikilink]]:
$PAPER_CONTEXT

EOD notes from yesterday's daily note:
$EOD_CONTEXT

Return output in this EXACT format — no text before 'SYNTHESIS:' or after the last challenge line:

SYNTHESIS:
(3-5 bullets. Bold label per bullet. Prefix continuing themes with '↺'. Use [[wikilinks]] for vault notes. 1-2 sentences each, specific not generic.)

CHALLENGES:
(Exactly 2 questions — one per line, no numbering or bullets. Derived from the most active evolving threads. Questions to sit with and think about during the day, not look-up questions.)" \
    --output-format text 2>/dev/null || echo "")

  if printf '%s' "$AI_RESPONSE" | head -c 400 | grep -qiE 'API Error|Failed to authenticate|OAuth access token|not enabled in this environment'; then
    log "WARN: daily synthesis returned an error message instead of content — not writing it."
    AI_RESPONSE=""
  fi
  if [[ -n "$AI_RESPONSE" ]]; then
    TMPFILE=$(mktemp)
    printf '%s' "$AI_RESPONSE" > "$TMPFILE"

    # Write learnings note with challenges in frontmatter + body
    python3 - "$LEARNINGS_FILE" "$TODAY" "$TMPFILE" <<'PYEOF'
import sys, re
fp, today, tmpfile = sys.argv[1], sys.argv[2], sys.argv[3]
text = open(tmpfile).read()

syn_m = re.search(r'SYNTHESIS:\s*\n(.+?)(?:\n\nCHALLENGES:|\Z)', text, re.DOTALL)
synthesis = syn_m.group(1).strip() if syn_m else text.strip()

ch_m = re.search(r'CHALLENGES:\s*\n(.+?)$', text, re.DOTALL)
challenges_raw = ch_m.group(1).strip() if ch_m else ''
challenges = [l.strip() for l in challenges_raw.splitlines() if l.strip()]

ch_yaml = ''
if challenges:
    ch_yaml = 'challenges:\n' + '\n'.join(
        f'  - "{c.replace(chr(34), chr(39))}"' for c in challenges) + '\n'

body = synthesis
if challenges:
    numbered = '\n'.join(f'{i+1}. {c}' for i, c in enumerate(challenges))
    body += f'\n\n## 🤔 Think about today\n{numbered}'

open(fp, 'w').write(
    f"---\ndate: {today}\ntags: [learning]\ntype: learning\n{ch_yaml}---\n\n{body}\n")
PYEOF

    # Append learning thread to today's brief if it exists
    if [[ -f "$BRIEF_FILE" ]]; then
      python3 - "$BRIEF_FILE" "$TMPFILE" <<'PYEOF'
import sys, re
fp, tmpfile = sys.argv[1], sys.argv[2]
text = open(tmpfile).read()
c = open(fp).read()
if '## 🧠 Learning thread' in c:
    sys.exit(0)

syn_m = re.search(r'SYNTHESIS:\s*\n(.+?)(?:\n\nCHALLENGES:|\Z)', text, re.DOTALL)
synthesis = syn_m.group(1).strip() if syn_m else text.strip()

ch_m = re.search(r'CHALLENGES:\s*\n(.+?)$', text, re.DOTALL)
challenges_raw = ch_m.group(1).strip() if ch_m else ''
challenges = [l.strip() for l in challenges_raw.splitlines() if l.strip()]

ch_block = ''
if challenges:
    numbered = '\n'.join(f'{i+1}. {c}' for i, c in enumerate(challenges))
    ch_block = f'\n\n**🤔 Think about today:**\n{numbered}'

open(fp, 'a').write(
    f'\n\n---\n\n## 🧠 Learning thread\n\n{synthesis}{ch_block}\n')
PYEOF
      log "Learning thread appended to daily brief."
    else
      log "Brief not yet written — thread will appear in daily note via Dataview."
    fi

    rm -f "$TMPFILE"
    log "Daily synthesis written: $TODAY learnings.md"
  else
    log "WARN: daily synthesis generation failed."
  fi
fi

# ── Weekly Deep Synthesis (Saturdays only) ───────────────────────────────────
#
# Generates a long-form prose synthesis of the week's reading — written for
# a Saturday morning read, not a skim. Includes a Plato challenge callout.
# Output: Notes/Reviews/YYYY-Wnn Deep Synthesis.md (type: deep-synthesis)

DAY_OF_WEEK=$(date '+%u')   # 1=Mon … 6=Sat
WEEK_NUM=$(date '+%Y-W%V')
REVIEWS_DIR="$NOTES/Reviews"
DEEP_FILE="$REVIEWS_DIR/$WEEK_NUM Deep Synthesis.md"

if [[ "$DAY_OF_WEEK" != "6" ]]; then
  log "Not Saturday — skipping weekly deep synthesis."
  exit 0
fi

if [[ -f "$DEEP_FILE" ]]; then
  log "Deep synthesis already exists for $WEEK_NUM, skipping."
  exit 0
fi

log "Saturday — generating weekly deep synthesis ($WEEK_NUM)..."

# Full clipping bodies for the past 14 days — more context than the shallow approach
WEEK_CLIPPINGS=$(python3 - "$CLIPPINGS" <<'PYEOF'
import sys, os, re
from datetime import date, timedelta
clips_dir = sys.argv[1]
cutoff = (date.today() - timedelta(days=14)).isoformat()
entries = []
for fname in sorted(os.listdir(clips_dir)):
    if not fname.endswith(".md"):
        continue
    try:
        c = open(os.path.join(clips_dir, fname), encoding='utf-8').read()
    except Exception:
        continue
    dm = re.search(r'^created:\s*(\S+)', c, re.MULTILINE)
    if not dm or dm.group(1) < cutoff:
        continue
    title_m = re.search(r'^title:\s*"?(.+?)"?\s*$', c, re.MULTILINE)
    title = title_m.group(1) if title_m else fname.replace('.md', '')
    body = re.sub(r'^---.*?---\s*\n', '', c, flags=re.DOTALL).strip()
    entries.append(f'### "{title}"\n{body[:3500]}')
print('\n\n'.join(entries) if entries else '(no recent clippings)')
PYEOF
)

# Paper analyses from the past 14 days — TL;DR, claims ledger, reviewer, adversarial sections
WEEK_PAPERS=$(python3 - "$PAPER_ANALYSES" <<'PYEOF'
import sys, os, re
from datetime import date, timedelta
d = sys.argv[1]
if not os.path.isdir(d):
    print('(no paper analyses yet)'); sys.exit(0)
cutoff = (date.today() - timedelta(days=14)).isoformat()
want = ('TL;DR', 'Key findings', 'Independent reviewer', 'Adversarial context', 'Growing ideas')
def fm(c, key):
    m = re.search(r'^' + re.escape(key) + r':\s*"?(.+?)"?\s*$', c, re.MULTILINE)
    return m.group(1) if m else ''
entries = []
for fname in sorted(os.listdir(d)):
    if not fname.endswith('.md'):
        continue
    try:
        c = open(os.path.join(d, fname), encoding='utf-8').read()
    except Exception:
        continue
    if 'type: paper-analysis' not in c:
        continue
    when = fm(c, 'analyzed_on')
    if not when or when < cutoff:
        continue
    body = re.sub(r'^---.*?---\s*\n', '', c, count=1, flags=re.DOTALL)
    parts = re.split(r'\n(?=## )', body)
    keep = [p.strip()[:2500] for p in parts if p.startswith('## ') and p[3:].startswith(want)]
    head = (f'### [[{fname[:-3]}]]\nRead {when} | verdict: {fm(c, "verdict") or "?"} | '
            f'reviewer divergence: {fm(c, "reviewer_divergence") or "?"}\nTL;DR: {fm(c, "tldr")}')
    entries.append(head + '\n\n' + '\n\n'.join(keep))
print('\n\n'.join(entries) if entries else '(no papers deep-read in the past 14 days)')
PYEOF
)

# Daily challenge notes this week — shows what themes were already surfacing
WEEK_CHALLENGES=$(python3 - "$NOTES/Logs" "$TODAY" <<'PYEOF'
import sys, os, re
from datetime import date, timedelta
logs_dir, today = sys.argv[1], sys.argv[2]
cutoff = (date.fromisoformat(today) - timedelta(days=7)).isoformat()
entries = []
for fname in sorted(os.listdir(logs_dir)):
    if 'learnings' not in fname or not fname.endswith('.md'):
        continue
    dm = re.match(r'(\d{4}-\d{2}-\d{2})', fname)
    if dm and cutoff <= dm.group(1) <= today:
        try:
            c = open(os.path.join(logs_dir, fname), encoding='utf-8').read()
        except Exception:
            continue
        entries.append(f'[{dm.group(1)}]\n{c}')
print('\n\n'.join(entries) if entries else '(no daily challenge notes this week)')
PYEOF
)

# Idea notes that received new evidence or challenges from this week's clippings
IDEA_CONTEXT=$(python3 - "$IDEAS" <<'PYEOF'
import sys, os, re
ideas_dir = sys.argv[1]
entries = []
paths = []
for root, _, files in os.walk(ideas_dir):   # ideas live in subfolders
    paths += [os.path.join(root, f) for f in files if f.endswith('.md')]
for path in sorted(paths):
    fname = os.path.basename(path)
    try:
        c = open(path, encoding='utf-8').read()
    except Exception:
        continue
    if '## Supporting evidence' in c or '## Challenges & counterpoints' in c:
        title = fname.replace('.md', '')
        body = re.sub(r'^---.*?---\s*\n', '', c, flags=re.DOTALL).strip()
        # evidence sections are appended at the end of idea notes, so pull them explicitly
        ev = re.findall(r'## (Supporting evidence|Challenges & counterpoints)\n(.*?)(?=\n---|\n## |\Z)', c, re.DOTALL)
        ev_txt = '\n'.join(f'{h}:\n{b.strip()}' for h, b in ev)
        entries.append(f'### Idea: {title}\n{body[:800]}\n\nEvidence log:\n{ev_txt[:2000]}')
print('\n\n'.join(entries) if entries else '(no idea notes with new evidence this week)')
PYEOF
)

DEEP_SYNTHESIS=$(claude -p "You are writing a Saturday deep reading document for a personal knowledge vault. This is not a summary — it is a genuine intellectual synthesis written as prose. The reader will spend 20-30 minutes with this on Saturday morning. Make it worth that time.

Reader profile: Diogo Camacho, computational biologist and AI×biology executive, 50. Deep expertise in protein design, ML/AI, drug discovery, biotech strategy. No need to explain basics. Expert register. No hedging. No filler. He reads this to build durable understanding, not to feel caught up.

Week: $WEEK_NUM

─── CLIPPINGS (past 14 days — full text) ───
$WEEK_CLIPPINGS

─── DAILY CHALLENGE NOTES (this week) ───
$WEEK_CHALLENGES

─── IDEA NOTES WITH NEW EVIDENCE ───
$IDEA_CONTEXT

─── PAPERS DEEP-READ (past 14 days — adversarial analyses with independent-reviewer critique) ───
$WEEK_PAPERS

Papers are primary research that has already been critically analyzed. When you draw on one, use the analysis' verdict, reviewer divergences and red-team points rather than the authors' framing, and cite it as a [[wikilink]].

Write the full document in this EXACT Markdown structure. Output ONLY the Markdown — nothing before the first ## heading, nothing after the Plato callout:

## [Theme 1 — name the precise intellectual theme, not a genre label]

[4-6 paragraphs of genuine prose. Engage the actual argument: what is being claimed, what is the evidence, what mechanism is proposed, what does this require you to believe? Go deep on one source, then show how the others complicate or reinforce it. Where does this thesis hold up and where does it crack? Connect to Diogo's work in computational protein design and AI-driven drug discovery where it genuinely applies — not generically, but specifically. Do not pad.]

## [Theme 2 — only if the material genuinely supports a second distinct thread]

[Same standard. If the week's reading is unified around one theme, write one deeper section rather than splitting artificially.]

## [Theme 3 — only if material supports a third thread; skip if forced]

[Same standard.]

---

## The connective tissue

[2-3 paragraphs of synthesis prose. This is the hardest section: what do these themes share beneath the surface? Where do they contradict each other in ways the individual sources didn't acknowledge? What emerges when you hold them in tension that wasn't visible from any single reading? Trace specific connections through specific material — don't describe connections abstractly.]

---

## What this shifts

[1-2 paragraphs. Honest epistemic accounting. What should Diogo think differently about after this week — even slightly, even provisionally? Not 'here are interesting considerations' but what actually moved and why. If a reading turned out thinner than it appeared, say so. Rigor here is more valuable than enthusiasm.]

---

## Bridges

[2-3 short paragraphs, each bridging this week's ideas to the broader world: a book that this reading argues with or confirms, something currently unfolding in biotech or AI that this reframes, or an observation from ordinary life — with family, through music, at the table, in sport — that makes an abstract idea concrete and memorable. These should feel like genuine intellectual discoveries, not analogies manufactured for effect.]

---

## 📄 Papers this week

[One bullet per paper in the PAPERS block, newest first: [[wikilink]] — verdict — one sentence on what it actually shows after the critique — ideas it supported (✅) or challenged (⚡) as [[wikilinks]]. If the PAPERS block is empty, write '(no papers deep-read this period)'.]

---

> [!question]+ 🏛️ Plato's Challenge
>
> *Read the synthesis above before engaging here. These are not reflection prompts — they are tests of whether you actually understood what you read.*
>
> **[State one specific claim from this week's reading as a sharp thesis]:** [2-3 sentences of Socratic challenge — find the hidden premise, the edge case where the argument collapses, the alternative reading the source ignores, or the implication the author didn't follow through. Force genuine intellectual engagement, not recall.]
>
> **[Second specific claim — different source or angle]:** [Same approach. If the first challenge was empirical, make this one structural or values-based. If the first was about what's true, make this one about what matters.]
>
> **[A third challenge that goes beyond this week's material]:** [Connect the week's specific readings to a larger philosophical or scientific question they are a specific instance of. Or surface a tension between something Diogo probably already believes and what this week's material implies. Make it uncomfortable in a productive way.]
>
> *Which of these three is hardest for you to answer right now? That is the one worth sitting with this weekend.*" \
  --output-format text 2>/dev/null || echo "")

if printf '%s' "$DEEP_SYNTHESIS" | head -c 400 | grep -qiE 'API Error|Failed to authenticate|OAuth access token|not enabled in this environment'; then
  log "WARN: deep synthesis returned an error message instead of content — not writing it."
  DEEP_SYNTHESIS=""
fi
if [[ -n "$DEEP_SYNTHESIS" ]]; then
  TMPFILE=$(mktemp)
  printf '%s' "$DEEP_SYNTHESIS" > "$TMPFILE"

  python3 - "$DEEP_FILE" "$TODAY" "$WEEK_NUM" "$TMPFILE" <<'PYEOF'
import sys
fp, today, week, tmpfile = sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4]
synthesis = open(tmpfile, encoding='utf-8').read()
open(fp, 'w', encoding='utf-8').write(
    f"---\ndate: {today}\nweek: {week}\ntype: deep-synthesis\ntags: [synthesis, deep-synthesis, learning]\n---\n\n# {week} — Deep Synthesis\n\n{synthesis}\n")
PYEOF

  rm -f "$TMPFILE"
  log "Deep synthesis written: $DEEP_FILE"
else
  log "WARN: deep synthesis generation failed."
fi
