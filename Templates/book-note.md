<%*
const t = await tp.system.prompt("Book title")
await tp.file.rename(`${t}`)
await tp.file.move(`Notes/Reading/${t}`)
%>---
type: book-note
status: reading   # reading | finished | abandoned | shelved
title: 
author: 
genre:   # fiction | nonfiction
started: <% tp.date.now("YYYY-MM-DD") %>
finished: 
rating:   # 1–5, on finish (optional)
tags: [reading, book]
---

# <% tp.file.title %>

> [!info] Why I picked it up
> 

## 📍 Where I am
- Current: <page / % / chapter> · updated <% tp.date.now("YYYY-MM-DD") %>

## 🧵 Threads & themes
*(ideas, arguments, open questions carried across sessions — Harold appends here)*
- 

## 💬 Discussion
*(dated book-club exchanges — prompt + my take, newest at the bottom)*
- 

## ✨ Quotes worth keeping
- 

## 🔗 Session logs
```dataview
LIST
FROM "Notes/Logs"
WHERE type = "reading-log" AND book = this.title
SORT file.name ASC
```

---

## 🏁 Verdict  *(on finish)*
- **Rating:** 
- **In one line:** 
- **What holds up / what I'd steal:** 
- **What I'd argue with:** 
- **Who I'd hand it to:** 
- **Threads to chase next:** 
