---
type: project-home
project: fl115
tags: [project, fl115]
---

# FL115 Home

## 🔗 Quick links
- (add role pages as project matures)

---

## ☑️ To dos
```dataview
task
FROM #fl115
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
FROM #fl115
WHERE follow-up = true
```

## 📝 Recent notes
```dataview
LIST
FROM #fl115
SORT file.mtime DESC
LIMIT 15
```
