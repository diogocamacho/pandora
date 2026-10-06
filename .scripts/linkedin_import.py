#!/usr/bin/env python3
"""One-time backfill: turn a LinkedIn connections export into Network CRM stubs.

Export from LinkedIn → Settings → Data privacy → Get a copy of your data →
"Connections" → download the CSV when it arrives (usually minutes to a day).

Usage:
  linkedin_import.py [path/to/Connections.csv]     # default: ~/Downloads/Connections.csv
  linkedin_import.py --dry-run [csv]               # report only, write nothing

Behavior:
  - Creates CRM/Network/<First Last>.md from the Network schema, marked
    relationship-strength: dormant (a backfill is not a live relationship).
  - NEVER overwrites an existing note (skips it). Safe to re-run.
  - Records the LinkedIn URL, company, title, and connection date in the body.
LinkedIn exports prepend a few "Notes:" lines before the real header row; this
skips them. Columns expected: First Name, Last Name, URL, Email Address,
Company, Position, Connected On.
"""

import csv
import os
import sys
from pathlib import Path

VAULT = Path(os.environ.get("PANDORA_VAULT", str(Path.home() / "Documents" / "pandora")))
NET = VAULT / "CRM" / "Network"


def safe_name(first, last):
    name = f"{first} {last}".strip()
    # Obsidian-illegal filename chars → space
    for ch in '\\/:*?"<>|':
        name = name.replace(ch, " ")
    return " ".join(name.split())


def find_header(path):
    """Return (file_object_positioned_at_header, fieldnames). Skips LinkedIn's preamble."""
    f = open(path, newline="", encoding="utf-8-sig")
    pos = f.tell()
    for line in f:
        if line.lower().startswith("first name,"):
            f.seek(pos)
            return f
        pos = f.tell()
    f.seek(0)
    return f


def stub(row):
    first = (row.get("First Name") or "").strip()
    last = (row.get("Last Name") or "").strip()
    name = safe_name(first, last)
    company = (row.get("Company") or "").strip()
    role = (row.get("Position") or "").strip()
    url = (row.get("URL") or "").strip()
    connected = (row.get("Connected On") or "").strip()
    fm = (
        "---\n"
        "type: person-network\n"
        f"name: {name}\n"
        f"company: {company}\n"
        f"role: {role}\n"
        "last-contact: # YYYY-MM-DD\n"
        "relationship-strength: dormant\n"
        "topics:\n  - \n"
        "follow-up-intent: \n"
        "tags: [network-crm]\n"
        "---\n\n"
        "## Background\n"
        f"Imported from LinkedIn (connected {connected or 'unknown'}).\n"
        + (f"{url}\n" if url else "")
        + "\n## What to talk about\n- \n\n"
        "## Connection history\n"
        "| Date | Medium | Notes |\n|------|--------|-------|\n"
        f"| {connected} | LinkedIn | Connected on LinkedIn |\n\n"
        "## Notes\n\n"
    )
    return name, fm


def main():
    args = [a for a in sys.argv[1:] if a != "--dry-run"]
    dry = "--dry-run" in sys.argv
    src = Path(args[0]) if args else Path.home() / "Downloads" / "Connections.csv"
    if not src.exists():
        print(f"CSV not found: {src}\nExport it from LinkedIn (Settings → Data privacy → "
              f"Get a copy of your data → Connections), then pass its path.", file=sys.stderr)
        sys.exit(1)

    NET.mkdir(parents=True, exist_ok=True)
    created = skipped = blank = 0
    f = find_header(src)
    with f:
        for row in csv.DictReader(f):
            first = (row.get("First Name") or "").strip()
            last = (row.get("Last Name") or "").strip()
            if not (first or last):
                blank += 1
                continue
            name, body = stub(row)
            out = NET / f"{name}.md"
            if out.exists():
                skipped += 1
                continue
            if dry:
                created += 1
                continue
            out.write_text(body, encoding="utf-8")
            created += 1

    verb = "would create" if dry else "created"
    print(f"{verb} {created} stub(s); skipped {skipped} existing; {blank} rows with no name.")
    if not dry and created:
        print(f"All marked relationship-strength: dormant in {NET}.\n"
              "Activate the ones you actually engage (set strength warm/neutral) so Lily nudges you on them.")


if __name__ == "__main__":
    main()
