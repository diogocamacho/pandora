---
type: project-home
project: abiologics
tags: [project, abiologics]
---

# 🧬 Abiologics

> [!info] Backing tags
> `#abiologics` + role sub-tags: `#compbio` · `#team` · `#targetid` · `#LT` · `#pi` · `#interviews`. Notes live in `Notes/`; this page surfaces them by tag.

## ☑️ To dos — all
```dataview
task
FROM #abiologics
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
FROM #abiologics
WHERE follow-up = true
SORT file.name DESC
```

## 👥 People
[[Andrew Croneberger]] · [[Beth Kartchner]] · [[Jeremy Amon]] · [[Nitya Talasila]]

---

## 👨🏻‍💻 Comp Bio
```dataview
task
FROM #abiologics & #compbio
WHERE !completed
```
```dataview
LIST
FROM #abiologics & #compbio
WHERE follow-up = true
SORT file.name DESC
```

### ⚽️ Comp Bio — team meetings
```dataview
LIST
FROM #abiologics & #compbio & #team
WHERE follow-up = true
```

## 🎯 Target ID
```dataview
LIST
FROM #abiologics & #targetid
SORT file.name DESC
```

## 💼 LT
```dataview
task
FROM #abiologics & #LT
WHERE !completed
```
```dataview
LIST
FROM #abiologics & #LT
WHERE follow-up = true
SORT file.name DESC
```

## 🤝 External — Pioneering Intelligence
Abiologics engaged PI to explore the data we've collected — assessing whether PI could do additional modeling to uncover new features/opportunities to improve designability of D-mini binders.
```dataview
task
FROM #abiologics & #pi
WHERE !completed
```
```dataview
LIST
FROM #abiologics & #pi
SORT file.name DESC
```

## 🪧 Talent
```dataview
task
FROM #abiologics & #interviews
WHERE !completed
```
```dataview
LIST
FROM #abiologics & #interviews
WHERE follow-up = true
```

---

## 📝 Recent notes
```dataview
LIST
FROM #abiologics
SORT file.mtime DESC
LIMIT 15
```
