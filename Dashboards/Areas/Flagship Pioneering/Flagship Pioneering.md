---
type: area-home
area: flagship-pioneering
tags: [area, flagship]
---

# ⚓️ Flagship Pioneering — Home

The role itself: 1:1s, PBU work, PILOT, career trajectory, internal projects that don't belong to a specific ProtoCo.

---

## 📝 Recent notes
```dataview
LIST
FROM #flagship OR #pbu OR #pilot
SORT file.mtime DESC
LIMIT 20
```

## ☑️ To dos
```dataview
task
FROM #flagship OR #pbu OR #pilot
WHERE !completed
SORT
	choice(contains(text, "🔺"), 1,
	choice(contains(text, "⏫"), 2,
	choice(contains(text, "🔼"), 3,
	4))) asc
```

## 👁️ Follow ups
```dataview
LIST
FROM #flagship OR #pbu OR #pilot
WHERE follow-up = true
```

## 🧭 PBU
```dataview
LIST file.link
FROM #pbu
SORT file.mtime DESC
LIMIT 10
```

## 🚀 PILOT
```dataview
LIST file.link
FROM #pilot
SORT file.mtime DESC
LIMIT 10
```

## 🤝 1:1s (recent)
```dataview
LIST file.link
FROM "Notes"
WHERE contains(file.name, "<>") AND (contains(file.tags, "flagship") OR contains(file.tags, "1-on-1"))
SORT file.mtime DESC
LIMIT 10
```
