#!/usr/bin/env python3
"""Pull Todoist tasks into the vault so the crew (Max/Sarah) can read them.

Todoist is the single source of truth for tasks. Vault `- [ ]` checkboxes are
scratch, never tasks. This script is the pipe: it fetches live task state via the
Todoist API and both prints it (for a live crew read at brief/EOD time) and writes
a snapshot note the crew can read if it can't run the script itself.

Token resolution (first that exists wins):
  1. env  TODOIST_API_TOKEN
  2. file ~/.claude/todoist_token        (recommended — outside the vault, never pushed)
  3. file <vault>/.scripts/todoist_token (gitignored fallback)
Get the token from Todoist → Settings → Integrations → Developer → API token.

Usage:
  todoist_pull.py                 # write today's snapshot note + print to stdout
  todoist_pull.py --stdout-only   # print only, don't write the note (live crew read)
  todoist_pull.py --completed-since YYYY-MM-DD   # tasks completed since a date (Sarah's weekly review)

Uses the Todoist unified API v1 (https://api.todoist.com/api/v1). Responses are
paginated: list endpoints return {"results": [...], "next_cursor": ...}; completed
tasks return {"items": [...]}.
"""

import json
import os
import sys
import urllib.error
import urllib.parse
import urllib.request
from datetime import date, datetime
from pathlib import Path

API = "https://api.todoist.com/api/v1"
VAULT = Path(os.environ.get("PANDORA_VAULT", str(Path.home() / "Documents" / "pandora")))
# UI priority labels: API priority 4 = P1 (urgent) … 1 = P4 (normal)
PRI = {4: "P1", 3: "P2", 2: "P3", 1: "P4"}


def resolve_token():
    tok = os.environ.get("TODOIST_API_TOKEN", "").strip()
    if tok:
        return tok
    for p in (Path.home() / ".claude" / "todoist_token",
              VAULT / ".scripts" / "todoist_token"):
        if p.exists():
            t = p.read_text(encoding="utf-8").strip()
            if t:
                return t
    return None


def api_get(path, token, params=None):
    url = f"{API}{path}"
    if params:
        url += "?" + urllib.parse.urlencode(params)
    req = urllib.request.Request(url, headers={"Authorization": f"Bearer {token}"})
    with urllib.request.urlopen(req, timeout=30) as r:
        return json.loads(r.read().decode("utf-8"))


def get_all(path, token, params=None):
    """Follow next_cursor pagination, collecting every item under 'results'."""
    params = dict(params or {})
    out = []
    while True:
        data = api_get(path, token, params)
        out.extend(data.get("results", []))
        cursor = data.get("next_cursor")
        if not cursor:
            return out
        params["cursor"] = cursor


def fetch_filter(token, query):
    return get_all("/tasks/filter", token, {"query": query})


def project_map(token):
    try:
        return {p["id"]: p["name"] for p in get_all("/projects", token)}
    except Exception:
        return {}


def fmt_task(t, projects):
    bits = []
    due = (t.get("due") or {}).get("date")
    if due:
        bits.append(f"due {due[:10]}")
    bits.append(PRI.get(t.get("priority", 1), "P4"))
    proj = projects.get(t.get("project_id"))
    if proj and proj != "Inbox":
        bits.append(proj)
    for lab in t.get("labels", []):
        bits.append(f"@{lab}")
    return f"- {t.get('content', '').strip()}  ·  " + " · ".join(bits)


def section(title, tasks, projects):
    lines = [f"## {title} ({len(tasks)})"]
    if not tasks:
        lines.append("_none_")
    else:
        lines.extend(fmt_task(t, projects) for t in tasks)
    return "\n".join(lines)


def completed_since(token, since):
    until = date.today().isoformat() + "T23:59:59"
    try:
        data = api_get("/tasks/completed/by_completion_date", token,
                       {"since": since + "T00:00:00", "until": until})
    except Exception as e:
        return f"_completed-items fetch failed: {e}_"
    items = data.get("items", [])
    if not items:
        return f"_no tasks completed since {since}_"
    out = [f"## ✅ Completed since {since} ({len(items)})"]
    for it in items:
        when = (it.get("completed_at") or "")[:10]
        out.append(f"- {it.get('content', '').strip()}  ·  done {when}")
    return "\n".join(out)


def main():
    args = sys.argv[1:]
    token = resolve_token()
    if not token:
        print("_Todoist unavailable — no API token found._\n"
              "Set env TODOIST_API_TOKEN, or create ~/.claude/todoist_token with your\n"
              "token from Todoist → Settings → Integrations → Developer → API token.",
              file=sys.stderr)
        sys.exit(2)

    if "--completed-since" in args:
        i = args.index("--completed-since")
        try:
            since = args[i + 1]
            datetime.strptime(since, "%Y-%m-%d")
        except (IndexError, ValueError):
            print("--completed-since needs a YYYY-MM-DD date", file=sys.stderr)
            sys.exit(1)
        print(completed_since(token, since))
        return

    try:
        projects = project_map(token)
        overdue = fetch_filter(token, "overdue")
        today = fetch_filter(token, "today")
        tomorrow = fetch_filter(token, "tomorrow")
        p1 = fetch_filter(token, "p1 & !today & !overdue")
    except urllib.error.HTTPError as e:
        print(f"_Todoist unavailable — HTTP {e.code} ({e.reason}). Check the API token._",
              file=sys.stderr)
        sys.exit(2)
    except Exception as e:
        print(f"_Todoist unavailable — {e}_", file=sys.stderr)
        sys.exit(2)

    today_str = date.today().isoformat()
    now = datetime.now().isoformat(timespec="seconds")
    body = "\n\n".join([
        section("🚨 Overdue", overdue, projects),
        section("✅ Due today", today, projects),
        section("📆 Due tomorrow", tomorrow, projects),
        section("🔥 Priority 1 (not today/overdue)", p1, projects),
    ])
    note = (f"---\ntype: todoist-snapshot\ndate: {today_str}\n"
            f"generated: {now}\nsource: todoist-api-v1\ntags: [tasks, todoist]\n---\n\n"
            f"# {today_str} — Todoist snapshot\n\n"
            f"_Live task state. Source of truth is Todoist; vault checkboxes are scratch._\n\n"
            f"{body}\n")

    print(note)

    if "--stdout-only" not in args:
        out = VAULT / "Notes" / "Logs" / f"{today_str} tasks.md"
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(note, encoding="utf-8")
        print(f"\n_wrote {out}_", file=sys.stderr)


if __name__ == "__main__":
    main()
