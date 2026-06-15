> [!tip] 💡 Ideas
> Pre-project sparks. Things worth capturing but not yet earning a project folder. Promote to `Dashboards/Projects/` when an idea crosses into active work.

---

## All idea notes

```dataview
LIST file.link
FROM "Notes"
WHERE startswith(file.name, "💡") OR contains(file.tags, "idea")
SORT file.mtime DESC
```

---

## Quick capture

```button
name 💡 New idea
type note(stub, false)
action create-idea
templater true
```

## Idea inbox

→ [[Idea Collector]]
