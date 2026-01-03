
# Quick Links
[[👨🏻‍💻 FL108 Comp Bio]]
[[🤝 FL108 External]]
[[🎯 FL108 TargetID]]
[[🪧 FL108 Talent]]



---
### ☑️ To Dos
```dataview
task 
FROM #fl108 
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
FROM #fl108 
WHERE follow-up = true
```

