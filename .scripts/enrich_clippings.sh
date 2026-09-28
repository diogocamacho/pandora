#!/usr/bin/env bash
# Obsidian vault enrichment pipeline:
#   1. Enrich unprocessed clippings: tags + vault backlinks + idea connections
#   2. Write "Evidence & reinforcement" back-refs into connected idea notes
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

  RESULT=$(claude -p "You are enriching an Obsidian clipping with tags, vault backlinks, and idea connections.

Vault note titles (pipe-separated):
$NOTE_TITLES

Idea note titles (pipe-separated):
$IDEA_TITLES

Clipping content:
$CONTENT

Return ONLY valid JSON — no explanation, no markdown fences:
{
  \"tags\": [\"kebab-case-tag\"],
  \"related\": [\"Exact Vault Note Title\"],
  \"ideas_support\": [\"Exact Idea Note Title\"],
  \"ideas_challenge\": [\"Exact Idea Note Title\"]
}

Rules:
- tags: 3-6 thematic kebab-case tags. Do NOT include 'clippings'.
- related: vault note titles with a genuine thematic connection. Empty array if nothing fits.
- ideas_support: idea note titles this clipping supports, reinforces, or adds evidence to. Empty array if nothing fits.
- ideas_challenge: idea note titles this clipping complicates, challenges, or creates productive tension with. Empty array if nothing fits." \
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

  # 3. Add idea-supports / idea-challenges frontmatter fields
  if [[ -n "$IDEAS_SUPPORT" ]]; then
    printf '%s' "$IDEAS_SUPPORT" | python3 - "$FILE" <<'PYEOF'
import sys, re
fp = sys.argv[1]
notes = [l.strip() for l in sys.stdin.read().splitlines() if l.strip()]
c = open(fp).read()
if 'idea-supports:' not in c:
    lines = '\n'.join(f'  - "[[{n}]]"' for n in notes)
    block = f'idea-supports:\n{lines}'
    c = re.sub(r'^(tags:)', block + '\n' + r'\1', c, count=1, flags=re.MULTILINE)
    open(fp, 'w').write(c)
PYEOF
  fi

  if [[ -n "$IDEAS_CHALLENGE" ]]; then
    printf '%s' "$IDEAS_CHALLENGE" | python3 - "$FILE" <<'PYEOF'
import sys, re
fp = sys.argv[1]
notes = [l.strip() for l in sys.stdin.read().splitlines() if l.strip()]
c = open(fp).read()
if 'idea-challenges:' not in c:
    lines = '\n'.join(f'  - "[[{n}]]"' for n in notes)
    block = f'idea-challenges:\n{lines}'
    c = re.sub(r'^(tags:)', block + '\n' + r'\1', c, count=1, flags=re.MULTILINE)
    open(fp, 'w').write(c)
PYEOF
  fi

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

  if [[ -n "$IDEAS_SUPPORT" ]] || [[ -n "$IDEAS_CHALLENGE" ]]; then
    printf '%s\n%s' "$IDEAS_SUPPORT" "$IDEAS_CHALLENGE" | python3 - "$FILE" "$IDEAS_SUPPORT" "$IDEAS_CHALLENGE" <<'PYEOF'
import sys
fp = sys.argv[1]
supports  = [l.strip() for l in sys.argv[2].splitlines() if l.strip()]
challenges = [l.strip() for l in sys.argv[3].splitlines() if l.strip()]
c = open(fp).read()
if '## Growing ideas' not in c:
    lines  = [f'- ✅ [[{n}]]' for n in supports]
    lines += [f'- ⚡ [[{n}]]' for n in challenges]
    if lines:
        open(fp, 'a').write('\n## Growing ideas\n' + '\n'.join(lines))
PYEOF
  fi

  # 6. Write back-references into idea notes (supporting / challenging)
  if [[ -n "$IDEAS_SUPPORT" ]] || [[ -n "$IDEAS_CHALLENGE" ]]; then
    CLIP_DATE=$(python3 -c "
import sys, re; c = open(sys.argv[1]).read()
m = re.search(r'^created:\s*(\S+)', c, re.MULTILINE)
print(m.group(1) if m else '$TODAY')" "$FILE" 2>/dev/null || echo "$TODAY")

    _write_idea_ref() {
      local IDEA_NAME="$1" SECTION="$2" MARKER="$3"
      [[ -z "$IDEA_NAME" ]] && return
      local IDEA_FILE=""
      while IFS= read -r f; do
        if [[ "$(basename "$f" .md)" == "$IDEA_NAME" ]]; then
          IDEA_FILE="$f"; break
        fi
      done < <(find "$IDEAS" -name "*.md")
      [[ -z "$IDEA_FILE" ]] && return

      python3 - "$IDEA_FILE" "$TITLE" "$CLIP_DATE" "$SECTION" "$MARKER" <<'PYEOF'
import sys
fp, clip_title, clip_date, section, marker = \
    sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4], sys.argv[5]
c = open(fp).read()
entry = f'\n- {marker} [[{clip_title}]] ({clip_date})'
if clip_title not in c:
    if section in c:
        c = c.rstrip() + entry + '\n'
    else:
        c = c.rstrip() + f'\n\n---\n\n## {section}{entry}\n'
    open(fp, 'w').write(c)
PYEOF
      log "  → $SECTION ← $IDEA_NAME"
    }

    while IFS= read -r NAME; do
      _write_idea_ref "$NAME" "Supporting evidence" "✅"
    done <<< "$IDEAS_SUPPORT"

    while IFS= read -r NAME; do
      _write_idea_ref "$NAME" "Challenges & counterpoints" "⚡"
    done <<< "$IDEAS_CHALLENGE"
  fi

  log "  ✓ tags: [$NEW_TAGS]"
done < <(find "$CLIPPINGS" -name "*.md")

log "Enrichment complete."

# ── Daily synthesis ───────────────────────────────────────────────────────────

LEARNINGS_FILE="$NOTES/Logs/$TODAY learnings.md"
BRIEF_FILE="$NOTES/Logs/$TODAY daily brief.md"

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

EOD notes from yesterday's daily note:
$EOD_CONTEXT

Return output in this EXACT format — no text before 'SYNTHESIS:' or after the last challenge line:

SYNTHESIS:
(3-5 bullets. Bold label per bullet. Prefix continuing themes with '↺'. Use [[wikilinks]] for vault notes. 1-2 sentences each, specific not generic.)

CHALLENGES:
(Exactly 2 questions — one per line, no numbering or bullets. Derived from the most active evolving threads. Questions to sit with and think about during the day, not look-up questions.)" \
    --output-format text 2>/dev/null || echo "")

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

# ── Weekly review (Fridays only) ──────────────────────────────────────────────

DAY_OF_WEEK=$(date '+%u')   # 1=Mon … 5=Fri
WEEK_NUM=$(date '+%Y-W%V')
WEEKLY_FILE="$NOTES/Logs/$WEEK_NUM weekly review.md"

if [[ "$DAY_OF_WEEK" != "5" ]]; then
  log "Not Friday — skipping weekly review."
  exit 0
fi

if [[ -f "$WEEKLY_FILE" ]]; then
  log "Weekly review already exists for $WEEK_NUM, skipping."
  exit 0
fi

log "Friday — generating weekly learning review ($WEEK_NUM)..."

WEEK_CONTEXT=$(python3 - "$NOTES/Logs" "$CLIPPINGS" "$NOTES/Daily" <<'PYEOF'
import sys, os, re
from datetime import date, timedelta
logs_dir, clips_dir, daily_dir = sys.argv[1], sys.argv[2], sys.argv[3]
cutoff = (date.today() - timedelta(days=7)).isoformat()
out = []

out.append("=== Daily synthesis notes this week ===")
for fname in sorted(os.listdir(logs_dir)):
    if "learnings" not in fname or not fname.endswith(".md"):
        continue
    dm = re.match(r'(\d{4}-\d{2}-\d{2})', fname)
    if dm and dm.group(1) >= cutoff:
        c = open(os.path.join(logs_dir, fname)).read()
        c = re.sub(r'^---.*?---\s*\n', '', c, flags=re.DOTALL)
        out.append(f"[{dm.group(1)}]\n{c.strip()}")

out.append("\n=== Clippings this week ===")
for fname in sorted(os.listdir(clips_dir)):
    if not fname.endswith(".md"):
        continue
    c = open(os.path.join(clips_dir, fname)).read()
    dm = re.search(r'^created:\s*(\S+)', c, re.MULTILINE)
    if not dm or dm.group(1) < cutoff:
        continue
    title_m = re.search(r'^title:\s*"?(.+?)"?\s*$', c, re.MULTILINE)
    tags_m  = re.search(r'^tags:\s*\[(.+?)\]', c, re.MULTILINE)
    has_ideas = "has idea connections" if 'idea-connections:' in c else ""
    title = title_m.group(1) if title_m else fname
    tags  = tags_m.group(1) if tags_m else ""
    out.append(f"- {title} [{tags}] {has_ideas}".rstrip())

out.append("\n=== EOD wins & blockers this week ===")
for fname in sorted(os.listdir(daily_dir), reverse=True)[:7]:
    if not re.match(r'\d{4}-\d{2}-\d{2}\.md$', fname):
        continue
    c = open(os.path.join(daily_dir, fname)).read()
    m = re.search(r'## 🌙 Evening shutdown(.+?)(?=\n## |\Z)', c, re.DOTALL)
    if m:
        section = m.group(1).strip()
        if re.search(r'(Wins|Stuck):\s*\S', section):
            out.append(f"[{fname.replace('.md','')}]\n{section}")

print('\n\n'.join(out))
PYEOF
)

WEEKLY_SYNTHESIS=$(claude -p "Generate a weekly learning review for a personal Obsidian knowledge vault.

Context from this week:
$WEEK_CONTEXT

Write in this exact structure — markdown only, nothing before or after:

## 🔥 Emerging themes
(3-5 bullets on big ideas that surfaced repeatedly this week)

## 🔗 Key connections formed
(3-5 specific clipping→note or clipping→idea connections formed this week, with [[wikilinks]])

## 👁️ Pay attention to next week
(2-3 concrete signals or questions to watch for — specific to what surfaced, not generic)

## 🧠 Recall prompts
(3-4 questions answerable from memory that encode this week's key learnings)

## 💡 Ideas gaining momentum
(Ideas — vault or new — that got meaningful new evidence or development this week, with [[wikilinks]])" \
  --output-format text 2>/dev/null || echo "")

if [[ -n "$WEEKLY_SYNTHESIS" ]]; then
  printf '%s' "$WEEKLY_SYNTHESIS" | python3 - "$WEEKLY_FILE" "$TODAY" "$WEEK_NUM" <<'PYEOF'
import sys
fp, today, week = sys.argv[1], sys.argv[2], sys.argv[3]
synthesis = sys.stdin.read()
open(fp, 'w').write(
    f"---\ndate: {today}\nweek: {week}\ntags: [learning, weekly-review]\ntype: weekly-learning\n---\n\n# {week} — Learning Review\n\n{synthesis}\n")
PYEOF
  log "Weekly review written: $WEEK_NUM weekly review.md"
else
  log "WARN: weekly synthesis generation failed."
fi
