<%*
const d = tp.date.now("YYYY-MM-DD")
await tp.file.rename(d)
await tp.file.move("/Notes/" + d)
%>---
tags: [daily]
date: <% tp.date.now("YYYY-MM-DD") %>
weekday: <% tp.date.now("dddd") %>
energy:
recovery:
follow-up:
journal:
stoic:
workout:
---

# <% tp.date.now("YYYY-MM-DD") %> — <% tp.date.now("dddd") %>

> [!tip] Daily intent
> One sentence: what would make today a win?
>
> 

## ☀️ Morning brief (from Max)
- Top 3:
  1. 
  2. 
  3. 
- One thing I'd skip if the day collapses: 

## 📅 Calendar
- 

## 🚨 Overdue
```tasks
not done
due before <% tp.date.now("YYYY-MM-DD") %>
short mode
hide edit button
hide backlink
```

## ✅ Due today
```tasks
not done
due on <% tp.date.now("YYYY-MM-DD") %>
short mode
hide edit button
hide backlink
```

## 🔥 High priority (any date)
```tasks
not done
priority is high
limit 5
short mode
hide edit button
hide backlink
```

## ⏳ Waiting on
```dataview
LIST file.link
FROM "Notes"
WHERE follow-up = true
SORT file.mtime DESC
LIMIT 10
```

## 🧠 Capture (inbox)
_Anything that comes up. Processed in weekly review._
- 

## 📝 Meetings
```button
name 1:1
type command
action Templater: Create new note from template
param 1v1-meeting-button
```
```button
name Meeting
type command
action Templater: Create new note from template
param meeting-button
```

- [[]]

## 🧘 Stoic quote
> [!quote]
> 
>

## 🌙 Evening shutdown
- Wins:
- Stuck on / blockers:
- Tomorrow's top 3:
  1. 
  2. 
  3. 
- Journaled? · Worked out? · Read?
