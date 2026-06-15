# Pandora

Personal Obsidian vault — notes, dashboards, daily journal, GTD capture, personal trackers (finance, fitness, style).

Open `Home.md` to start. Pin it as the launchpad tab.

---

## Structure

```
Home.md                       Pinned launchpad. Buttons, today's tasks, projects, areas, waiting-on.
Notes/                        Flat bucket — every note (meetings, dailies, journal, ideas, learning, references)
Dashboards/                   Map-of-Content pages — Dataview queries over Notes/
  Projects/                   Active, time-bound work
    Abiologics/                 ProtoCo: ⚽️ meetings, 👨🏻‍💻 comp bio, 🤝 external, 💼 LT, 🪧 talent, 🎯 TargetID
    FL108/  FL110/  FL111/      ProtoCos under development
    FL115/  Agentic Nutrition/
  Areas/                      Ongoing responsibilities, no end date
    Flagship Pioneering/        The role itself (1:1s, PBU, PILOT)
    💰 Finance.md               High-level dashboard on top of YNAB
    💪 Fitness.md               Whoop pulls, workouts, body recomp, nutrition
    👔 Style.md                 Capsule, closet inventory, outfit log, wishlist
  Ideas/                      Idea MOCs (pre-project)
Templates/                    Templater templates (daily, meetings, ideas, projects, tracker schemas)
Attachments/                  Images, PDFs, presentations
Archive/                      Dead projects, retired notes, folder readmes
Inbox/                        GTD capture — cleared during weekly review
```

## How it works

**Flat notes + MOC + tags.** Notes live in `Notes/` regardless of subject. Tags carry meaning (`#abiologics`, `#fl111`, `#daily`, `#finance`). Dashboards aggregate by querying tags via Dataview — they don't own notes.

**Daily flow:**
1. Open Obsidian. `Home.md` is the pinned tab.
2. Click **📅 Today's daily** — creates `Notes/YYYY-MM-DD.md` from `Templates/daily.md`. GTD-style: intent, top 3, overdue, today, high priority, waiting on, capture, meetings, evening shutdown.
3. Click **📝 Quick note** / **🤝 New 1:1** / **⚗️ New work project** / **💡 New idea** to capture.
4. End of day: fill evening shutdown block. Set tomorrow's top 3.

**Weekly review:**
- Process `Inbox/` → file or delete
- Review overdue tasks, reschedule
- Update each project Home with this week's progress
- Update Finance / Fitness / Style dashboards
- Plan next week's top 3

## Conventions

**Tags drive everything.** Every note's frontmatter has `tags: [...]`. Common ones:

| Tag | Use |
|---|---|
| `#daily` | Daily landing page |
| `#abiologics`, `#fl108`, `#fl111`, `#x2` | Project notes |
| `#flagship`, `#pbu`, `#pilot` | Flagship role notes |
| `#finance`, `#fitness`, `#style` | Personal-area notes |
| `#waiting-for` | GTD waiting-on |
| `#next-action` | GTD next-action |
| `#someday-maybe` | GTD deferred |

**Frontmatter schemas** for dashboard-driven trackers (each has a Templates/ file that enforces shape):

| Type | Template | Captured by dashboard |
|---|---|---|
| `net-worth-snapshot` | `Templates/net-worth-snapshot.md` | 💰 Finance |
| `finance-review` | `Templates/finance-review.md` | 💰 Finance |
| `whoop-daily` | `Templates/whoop-daily.md` | 💪 Fitness |
| `workout` | `Templates/workout.md` | 💪 Fitness |
| `body-recomp` | `Templates/body-recomp.md` | 💪 Fitness |
| `closet-piece` | `Templates/closet-piece.md` | 👔 Style |
| `outfit` | `Templates/outfit.md` | 👔 Style |
| `wishlist-item` | `Templates/wishlist-item.md` | 👔 Style |

**Note naming:**
- Dailies: `YYYY-MM-DD.md`
- Meetings: `YYYY-MM-DD <name> <> <name>.md` (1:1s) or `YYYY-MM-DD <topic>.md`
- Tracker entries: `YYYY-MM-DD <tracker-name>` (e.g., `2026-06-15 whoop`, `2026-06-01 net worth snapshot`)
- Ideas: `💡 <name>.md`
- Closet pieces / wishlist items: descriptive name

## Plugins required

- **Templater** — `Templates/` configured as templates folder
- **Dataview** — powers dashboard queries
- **Tasks** — powers tasks blocks in Home + Daily
- **Buttons** — quick-action buttons on Home and dashboards
- **Daily notes** (core) — points to `Templates/daily` + `Notes/` folder

## Git workflow

This vault is a git repo, synced to `github.com/diogocamacho/pandora`.

```bash
cd ~/Documents/pandora
git add -A
git commit -m "<message>"
git push
```

`.DS_Store` and `.obsidian/workspace.json` are gitignored (workspace state is per-machine).

## History

- **2026-06-15** — restructured to Option A (flat-notes + MOC). 555 file reorganization. Replaced parallel `000-003` PARA folders with `Notes/` flat bucket + `Dashboards/` MOC layer. Templates moved to `Templates/`. Personal trackers (Finance, Fitness, Style) added.
- **Pre-2026** — original folder-PARA + flat-notes hybrid; half a restructure left uncommitted from December.
