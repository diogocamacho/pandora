#!/bin/bash
# Vault enrichment pipeline — launchd wrapper.
# Loads the enrich-clippings skill and runs the full pipeline via Claude.
# The skill handles: clipping enrichment, idea linking, paper analysis,
# daily synthesis, and Saturday deep synthesis.

LOG=~/Documents/pandora/.scripts/enrich_clippings.log

start_ts=$(date "+%Y-%m-%d %H:%M:%S")
echo "" >> "$LOG"
echo "===== run start: $start_ts =====" >> "$LOG"

PROMPT="Read /Users/dcamacho/.claude/skills/enrich-clippings/SKILL.md and execute the full vault enrichment pipeline exactly as specified. This is running on an automated schedule — do not wait for input, do not ask questions, execute every step in sequence and write all outputs to disk."

TIMEOUT_BIN=""
if command -v gtimeout >/dev/null 2>&1; then
  TIMEOUT_BIN="gtimeout"
elif command -v timeout >/dev/null 2>&1; then
  TIMEOUT_BIN="timeout"
fi

if [ -n "$TIMEOUT_BIN" ]; then
  "$TIMEOUT_BIN" --kill-after=60s 1800s /opt/homebrew/bin/claude --print --dangerously-skip-permissions "$PROMPT" >> "$LOG" 2>&1
  rc=$?
else
  perl -e '
    use strict; use warnings;
    my $timeout = 1800;
    my $pid = fork();
    if ($pid == 0) { exec(@ARGV); exit 127; }
    eval {
      local $SIG{ALRM} = sub { kill "TERM", $pid; sleep 5; kill "KILL", $pid; die "timeout\n"; };
      alarm $timeout;
      waitpid $pid, 0;
      alarm 0;
    };
    if ($@ eq "timeout\n") { exit 124; }
    exit ($? >> 8);
  ' /opt/homebrew/bin/claude --print --dangerously-skip-permissions "$PROMPT" >> "$LOG" 2>&1
  rc=$?
fi

end_ts=$(date "+%Y-%m-%d %H:%M:%S")
echo "" >> "$LOG"
echo "===== run end:   $end_ts | exit=$rc =====" >> "$LOG"

[ "$rc" -eq 124 ] && echo "[$end_ts] TIMEOUT after 30 minutes" >> "$LOG"

exit $rc
