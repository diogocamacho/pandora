

> [!info] 🔗 **Quick Links**
> [[💼 FL110 LT]]
> [[👨🏻‍💻 FL110 Comp Bio]]
> [[🤝 FL110 External]]
> [[🪧 FL110 Talent]]

---
### ☑️ To Dos
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


### 👁️ Follow ups
```dataview
LIST
FROM #FL110  
WHERE follow-up = true
SORT file.name DESC
```


