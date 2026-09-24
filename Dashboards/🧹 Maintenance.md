---
tags: [dashboard, maintenance]
---

# 🧹 Vault Maintenance

Keeps the flat `Notes/` store honest. Work top to bottom: file the unfiled, adopt the orphans, review or archive the stale, tag the untagged.

## 📦 Folder counts
```dataview
TABLE length(rows) AS Notes
FROM "Notes"
GROUP BY file.folder AS Folder
SORT Folder ASC
```

## 🗂️ Unfiled — sitting in `Notes/` root
_Quick-captures and anything that never got a home. Move each into Daily / Meetings / Logs / Reviews / People / Reference, or delete._
```dataview
LIST file.link
FROM "Notes"
WHERE file.folder = "Notes"
SORT file.mtime DESC
```

## 🔗 Orphans — no inbound links
_Nothing links here. Either link it from a dashboard/note, or it's dead weight. (Daily/Logs are expected here — focus on Reference & Meetings.)_
```dataview
TABLE file.folder AS Folder, dateformat(file.mtime, "yyyy-MM-dd") AS Modified
FROM "Notes"
WHERE length(file.inlinks) = 0
  AND file.folder != "Notes/Daily"
  AND file.folder != "Notes/Logs"
SORT file.mtime DESC
LIMIT 40
```

## 🕸️ Stale — untouched 90+ days
```dataview
TABLE file.folder AS Folder, dateformat(file.mtime, "yyyy-MM-dd") AS Modified
FROM "Notes"
WHERE file.mtime < date(today) - dur(90 days)
  AND file.folder != "Notes/Daily"
SORT file.mtime ASC
LIMIT 40
```

## 🏷️ Untagged
_No `tags` frontmatter — won't surface on any tag-driven dashboard._
```dataview
LIST file.link
FROM "Notes"
WHERE !file.tags OR length(file.tags) = 0
  AND file.folder != "Notes/Daily"
SORT file.folder ASC, file.mtime DESC
LIMIT 50
```

## 👤 People needing frontmatter
_Person hub pages missing `type: person` — invisible to the People dashboard until fixed._
```dataview
LIST file.link
FROM "Notes/People"
WHERE type != "person"
```
