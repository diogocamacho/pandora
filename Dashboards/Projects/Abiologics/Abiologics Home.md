---
tags:
  - abiologics
---

> [!info] 🔗 **Quick Links**
> [[💼 Abiologics LT]]
> [[👨🏻‍💻 Abiologics Comp Bio]]
> [[🤝 Abiologics External]]
> [[🎯 Abiologics TargetID]]
> [[🪧 Abiologics Talent]]

---
### ☑️ To Dos
```dataview
task 
FROM #abiologics
WHERE contains(text, "abiologics") & !completed
SORT 
	choice(contains(text, "🔺"), 1, 
	choice(contains(text, "⏫"), 2, 
	choice(contains(text, "🔼"), 3, 
	4))) asc
```


### 👁️ Follow ups
```dataview
LIST
FROM #abiologics 
WHERE follow-up = true
SORT file.name DESC
```

