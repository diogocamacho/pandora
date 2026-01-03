---
tags:
  - project
  - work-project
  - <% tp.file.title.replace(/ Home$/, "").toLowerCase().replace(/[^a-z0-9]/g, "") %>
---

> [!info] Project Overview
> **My Role**: [PLACEHOLDER: Describe your involvement, responsibilities, role]
> 
> **Status**: [PLACEHOLDER: Active/On Hold/Planning/etc.]
> **Start Date**: [PLACEHOLDER: Date]
> **Key Contacts**: [PLACEHOLDER: List key people/teams]

> [!info] 🔗 **Quick Links**
> [Add area notes here as needed, e.g., "💼 [Project] LT", "👨🏻‍💻 [Project] Comp Bio"]

---

### ☑️ To Dos
```dataview
task 
FROM #<% tp.file.title.replace(/ Home$/, "").toLowerCase().replace(/[^a-z0-9]/g, "") %>
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
FROM #<% tp.file.title.replace(/ Home$/, "").toLowerCase().replace(/[^a-z0-9]/g, "") %> 
WHERE follow-up = true
SORT file.name DESC
```

### 📝 All Notes
```dataview
LIST
FROM #<% tp.file.title.replace(/ Home$/, "").toLowerCase().replace(/[^a-z0-9]/g, "") %>
SORT file.name DESC
```

