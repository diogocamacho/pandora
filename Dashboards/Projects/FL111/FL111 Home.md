---
type: project-home
project: fl111
tags: [project, fl111]
---

# FL111 Home

## 🔗 Quick links
- (add role pages as project matures: Comp Bio, Talent, External, etc.)

---

## ☑️ To dos
```dataview
task
FROM #fl111
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
FROM #fl111
WHERE follow-up = true
```

## 📝 Recent notes
```dataview
LIST
FROM #fl111
SORT file.mtime DESC
LIMIT 15
```
