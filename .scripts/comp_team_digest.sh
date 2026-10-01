#!/usr/bin/env bash
# Computational team weekly digest:
#   Reads the past 7 days of comp team meeting notes and 1:1s from the Pandora vault,
#   generates a structured Monday-morning briefing note.
#
# Scheduled via: ~/Library/LaunchAgents/com.dcamacho.comp-team-digest.plist (Monday 8:00am)
# Run manually:  bash ~/Documents/pandora/.scripts/comp_team_digest.sh

set -uo pipefail

VAULT="/Users/dcamacho/Documents/pandora"
MEETINGS="$VAULT/Notes/Meetings"
LOGS="$VAULT/Notes/Logs"
LOG="$VAULT/.scripts/comp_team_digest.log"
TODAY=$(date '+%Y-%m-%d')
WEEK=$(date '+%Y-W%V')
OUTPUT="$LOGS/$TODAY comp team digest.md"

log() { echo "[$(date '+%Y-%m-%d %H:%M')] $*" | tee -a "$LOG"; }

log "comp_team_digest.sh starting ($TODAY)"

if [[ -f "$OUTPUT" ]]; then
  log "Digest already exists for $TODAY, skipping."
  exit 0
fi

# ── Gather comp team notes from the past 7 days ──────────────────────────────

NOTES_CONTEXT=$(python3 - "$MEETINGS" "$TODAY" <<'PYEOF'
import sys, os, re
from datetime import date, timedelta

meetings_dir, today_str = sys.argv[1], sys.argv[2]
cutoff = (date.fromisoformat(today_str) - timedelta(days=7)).isoformat()

TEAM_NAMES = [
    'Andrew Croneberger', 'Jeremy Amon', 'Nitya Talasila',
    'Jiangchuan Ye', 'Chiara Magnone', 'Beth Kartchner',
]
FILENAME_PATTERNS = [
    'comp team', 'cycle planning', 'weekly kick',
    'abiologics weekly cycle',
]

entries = []
for fname in sorted(os.listdir(meetings_dir)):
    if not fname.endswith('.md'):
        continue
    dm = re.match(r'(\d{4}-\d{2}-\d{2})', fname)
    if not dm:
        continue
    note_date = dm.group(1)
    if not (cutoff < note_date <= today_str):
        continue

    try:
        c = open(os.path.join(meetings_dir, fname), encoding='utf-8').read()
    except Exception:
        continue

    fname_lower = fname.lower()
    is_comp = (
        any(p in fname_lower for p in FILENAME_PATTERNS) or
        any(name in fname for name in TEAM_NAMES) or
        'comp-team' in c or
        ('1v1' in c and 'abiologics' in c)
    )

    if not is_comp:
        continue

    body = re.sub(r'^---.*?---\s*\n', '', c, flags=re.DOTALL).strip()
    title = fname.replace('.md', '')
    entries.append(f'### {title}\n\n{body[:2500]}')

if entries:
    print(f'[{len(entries)} notes, {cutoff} → {today_str}]\n\n' +
          '\n\n---\n\n'.join(entries))
else:
    print('(no comp team notes found in the past 7 days)')
PYEOF
)

log "Context: $(echo "$NOTES_CONTEXT" | head -1)"

# ── Generate digest ───────────────────────────────────────────────────────────

TMPFILE=$(mktemp)

claude -p "You are writing a Monday morning comp team digest for Diogo Camacho, VP of Computational Biology at Abiologics. He reads this before his 10am weekly Comp Team Kickoff.

Team: Andrew Croneberger (design pipeline engineering), Jeremy Amon (computational design, Rosetta/protein modeling), Nitya Talasila (data/infrastructure, organizes huddles), Jiangchuan Ye (ML, ESM/protein models), Beth Kartchner (wet-lab-facing, experimental triage), Chiara Magnone (may appear in cycle planning).

─── COMP TEAM NOTES (past 7 days) ───
$NOTES_CONTEXT

Write the digest in this exact structure. Return ONLY the markdown — no preamble, nothing after the last line:

## Open actions
(All unchecked tasks from the notes. Format: '- [ ] **[Person]** — [verbatim action]'. Use '**[team]**' if owner is unclear.)

## What moved
(3–5 bullets. Specific completed work, decisions, or outputs. Name the person and what they actually did — not that 'work continued'.)

## Where each person is
(One line per person who appeared in these notes. Format: '**[Name]** — [what they are working on or focused on, from 1:1s and huddle notes]'. Only include people who appear in the notes.)

## Blockers / waiting on
(Anything stalled, waiting on external input, or flagged as a concern. Format: '- [description] — waiting on [who/what]'. Write '— none flagged.' if none.)

## Bring into the kickoff
(2–3 pointed questions or themes worth naming in the Monday meeting. Not summaries — things to actually put on the table.)" \
  --output-format text 2>/dev/null > "$TMPFILE" || true

if [[ ! -s "$TMPFILE" ]]; then
  log "WARN: claude returned empty response, aborting."
  rm -f "$TMPFILE"
  exit 1
fi

# ── Write output note ─────────────────────────────────────────────────────────

python3 - "$OUTPUT" "$TODAY" "$WEEK" "$TMPFILE" <<'PYEOF'
import sys
fp, today, week, tmpfile = sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4]
digest = open(tmpfile, encoding='utf-8').read().strip()
open(fp, 'w', encoding='utf-8').write(
    f"---\ndate: {today}\nweek: {week}\ntype: strategy-memo\ntags: [comp-team, abiologics, digest]\n---\n\n"
    f"# Comp Team Digest — {week}\n\n{digest}\n")
PYEOF

rm -f "$TMPFILE"
log "Digest written: $OUTPUT"
