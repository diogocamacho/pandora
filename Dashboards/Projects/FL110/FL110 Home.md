---
type: project-home
project: fl110
tags: [project, fl110]
---

# FL110

> [!info] Backing tags
> `#FL110` + role sub-tags: `#compbio` · `#LT` · `#interviews`. Notes live in `Notes/`; surfaced here by tag.

## ☑️ To dos — all
```dataview
task
FROM #FL110
WHERE !completed
SORT
	choice(contains(text, "🔺"), 1,
	choice(contains(text, "⏫"), 2,
	choice(contains(text, "🔼"), 3,
	4))) asc
```

## 👁️ Follow ups — all
```dataview
LIST
FROM #FL110
WHERE follow-up = true
SORT file.name DESC
```

---

## 👨🏻‍💻 Comp Bio
```dataview
task
FROM #FL110 & #compbio
WHERE !completed
```
```dataview
LIST
FROM #FL110 & #compbio
WHERE follow-up = true
```

## 💼 LT
```dataview
task
FROM #FL110 & #LT
WHERE !completed
```
```dataview
LIST
FROM #FL110 & #LT
WHERE follow-up = true
SORT file.name DESC
```

## 🪧 Talent
```dataview
task
FROM #FL110 & #interviews
WHERE !completed
```
```dataview
LIST
FROM #FL110 & #interviews
WHERE follow-up = true
```

---

## 📝 Recent notes
```dataview
LIST
FROM #FL110
SORT file.mtime DESC
LIMIT 15
```
