#!/usr/bin/env bash
# Life Pulse — autonomous Sunday relationship scan
#
# Reads personal + network CRM, generates a weekly life pulse note via claude.
# Writes to ~/Documents/pandora/Notes/Logs/YYYY-Wnn life pulse.md
#
# Scheduled via: ~/Library/LaunchAgents/com.dcamacho.life-pulse.plist (Sunday 6pm)
# Run manually: bash ~/Documents/pandora/.scripts/life_pulse.sh

set -uo pipefail

VAULT="/Users/dcamacho/Documents/pandora"
CRM_PERSONAL="$VAULT/CRM/Personal"
CRM_NETWORK="$VAULT/CRM/Network"
NOTES="$VAULT/Notes"
LOG="$VAULT/.scripts/life_pulse.log"
TODAY=$(date '+%Y-%m-%d')
WEEK=$(date '+%Y-W%V')
OUTPUT="$NOTES/Logs/$WEEK life pulse.md"

log() { echo "[$(date '+%Y-%m-%d %H:%M')] $*" | tee -a "$LOG"; }

log "life_pulse.sh starting ($TODAY)"

if [[ -f "$OUTPUT" ]]; then
  log "Life pulse already exists for $WEEK, skipping."
  exit 0
fi

# Collect personal CRM data
PERSONAL_DATA=""
if ls "$CRM_PERSONAL"/*.md &>/dev/null; then
  while IFS= read -r f; do
    [[ "$(basename "$f")" == _* ]] && continue
    PERSONAL_DATA+="=== $(basename "$f" .md) ===
$(head -60 "$f")

"
  done < <(find "$CRM_PERSONAL" -name "*.md" ! -name "_*")
fi

if [[ -z "$PERSONAL_DATA" ]]; then
  PERSONAL_DATA="(no personal CRM notes yet)"
fi

# Collect network CRM data
NETWORK_DATA=""
if ls "$CRM_NETWORK"/*.md &>/dev/null; then
  while IFS= read -r f; do
    [[ "$(basename "$f")" == _* ]] && continue
    NETWORK_DATA+="=== $(basename "$f" .md) ===
$(head -40 "$f")

"
  done < <(find "$CRM_NETWORK" -name "*.md" ! -name "_*")
fi

if [[ -z "$NETWORK_DATA" ]]; then
  NETWORK_DATA="(no network CRM notes yet)"
fi

# Generate life pulse note
PULSE=$(claude -p "Generate a weekly Life Pulse note for a personal Obsidian vault.

Today's date: $TODAY (a Sunday)

Personal CRM notes:
$PERSONAL_DATA

Network CRM notes:
$NETWORK_DATA

Return ONLY the note body in this EXACT structure — no preamble, no fences:

SYNTHESIS:
(3-5 bullets summarizing the relationship landscape this week. Bold the person's name.)

OCCASIONS:
(List any birthdays or anniversaries within the next 30 days. Calculate from $TODAY. Format: - 🎂 [Name] — [Month Day] ([N] days). If none: '- No occasions in the next 30 days.')

GIFT_WINDOWS:
(Any occasion within 15 days with gift ideas from the CRM. If none: 'None this week.')

FAMILY_QUALITY_TIME:
(For wife and sons: check last-quality-time field. If empty or >14 days ago, flag it. Format: - [Name]: last logged [date or 'not logged'] — [nudge]. If all current: 'All good.')

NETWORK_NUDGES:
(Warm contacts >60 days, neutral >90 days since last contact. Format: - [Name] ([Company]) — [N] days. Topic: [from CRM]. If none: 'No nudges this week.')

LIFE_IDEAS:
(1-2 concrete suggestions: a gift idea, vacation idea, experience idea, or memory to capture. Pull from CRM notes.)

ACTIONS:
(Exactly 2-3 concrete actions for this week. Short, specific, achievable.)" \
  --output-format text 2>/dev/null || echo "")

if [[ -z "$PULSE" ]]; then
  log "WARN: life pulse generation failed."
  exit 1
fi

TMPFILE=$(mktemp)
printf '%s' "$PULSE" > "$TMPFILE"

python3 - "$OUTPUT" "$TODAY" "$WEEK" "$TMPFILE" <<'PYEOF'
import sys, re
fp, today, week, tmpfile = sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4]
text = open(tmpfile).read()

def extract(label, text):
    m = re.search(rf'{label}:\s*\n(.+?)(?:\n[A-Z_]+:|\Z)', text, re.DOTALL)
    return m.group(1).strip() if m else ''

synthesis      = extract('SYNTHESIS', text)
occasions      = extract('OCCASIONS', text)
gift_windows   = extract('GIFT_WINDOWS', text)
quality_time   = extract('FAMILY_QUALITY_TIME', text)
network        = extract('NETWORK_NUDGES', text)
life_ideas     = extract('LIFE_IDEAS', text)
actions        = extract('ACTIONS', text)

body = f"""---
date: {today}
week: {week}
type: life-pulse
tags: [life-pulse, relationships]
---

# {week} — Life Pulse

## 🌐 Relationship landscape
{synthesis}

## 🎂 Upcoming occasions
{occasions}

## 🎁 Gift windows
{gift_windows}

## 👨‍👩‍👦 Family quality time
{quality_time}

## 🤝 Network nudges
{network}

## 🌴 Life ideas
{life_ideas}

## ✅ Actions this week
{actions}
"""

open(fp, 'w').write(body)
PYEOF

rm -f "$TMPFILE"
log "Life pulse written: $OUTPUT"
