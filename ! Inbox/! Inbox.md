> [!tip] 📥 Inbox — capture zone
> Scratch space. Anything that comes up and isn't worth filing yet lands here. **Empty during weekly review.**

```button
name 📝 Quick note → Inbox
type note
action quick-note-button
templater true
```

---

## Items in Inbox

```dataview
LIST file.link
FROM "! Inbox"
WHERE file.name != "! Inbox"
SORT file.mtime DESC
```

## Anywhere tagged #inbox

```dataview
LIST file.link
FROM #inbox
SORT file.mtime DESC
```

---

## Weekly review checklist

For each item above:

- [ ] **Trash** — junk
- [ ] **File** — move to `Notes/`, add tags
- [ ] **Promote** — becomes a project (`Dashboards/Projects/`) or idea
- [ ] **Action** — convert into a task with due date
- [ ] **Reference** — link from a dashboard, then file

Goal: Inbox is empty by end of weekly review.
