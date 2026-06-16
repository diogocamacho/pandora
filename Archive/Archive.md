> [!tip] 🗄️ Archive
> Dead projects, retired dashboards, junk that didn't earn deletion. **Read-only by convention.** If you find yourself opening Archive often, the item probably belongs back in active.

---

## Archived projects

```dataview
LIST WITHOUT ID file.link
FROM "Archive"
WHERE type = "project-home"
SORT file.mtime DESC
```

## Loose meeting notes (pre-restructure)

```dataview
LIST WITHOUT ID file.link
FROM "Archive/Loose meetings"
SORT file.mtime DESC
```

## Root junk

```dataview
LIST WITHOUT ID file.link
FROM "Archive/_root junk"
SORT file.mtime DESC
```

## Everything else in Archive (root)

```dataview
LIST WITHOUT ID file.link
FROM "Archive"
WHERE file.folder = "Archive" AND file.name != "Archive"
SORT file.mtime DESC
```
