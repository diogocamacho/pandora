<%*
const d = tp.date.now("YYYY-MM-DD")
if (tp.file.title !== d) await tp.file.rename(d)
if (tp.file.folder(true) !== "Notes/Daily") await tp.file.move("Notes/Daily/" + d)
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

# <% tp.date.now("YYYY-MM-DD") %>, <% tp.date.now("dddd") %>

## 🧘 Stoic quote
> [!quote]
> 

## ☀️ Morning brief

📄 Full brief: [[<% tp.date.now("YYYY-MM-DD") %> daily brief]]

**Top 3**
1. 
2. 
3. 

**One thing I'd skip if the day collapses:**
- 

## 🧠 Learning thread
```dataviewjs
const today = dv.date("today").toISODate();
const note = dv.pages('"Notes/Logs"')
  .where(p => p.type === "learning" && p.date && p.date.toISODate && p.date.toISODate() === today)
  .first();
if (note) {
  dv.paragraph("📖 " + dv.fileLink(note.file.path, false, "Today's synthesis"));
  const ch = note.challenges;
  if (ch && ch.length) {
    dv.paragraph("**🤔 Think about today:**");
    dv.list(Array.isArray(ch) ? ch : [ch]);
  }
} else {
  dv.paragraph("_Synthesis and challenges generate at 9:30am._");
}
```

## 📰 Clipped today
```dataview
LIST WITHOUT ID file.link
FROM "Clippings"
WHERE date(created) = date(today)
SORT created DESC
```

## 📅 Calendar
- 

## 🚨 Overdue
```todoist
name: Overdue
filter: "overdue"
sorting:
  - priority
  - date
```

## ✅ Due today
```todoist
name: Today
filter: "today"
sorting:
  - priority
```

## 🔥 High priority
```todoist
name: Priority 1
filter: "p1 & !today & !overdue"
sorting:
  - date
```

## ⏳ Waiting on
```dataview
LIST WITHOUT ID file.link
FROM "Notes"
WHERE follow-up = true
SORT file.mtime DESC
LIMIT 10
```

## 🧠 Capture (inbox)
_Scratch space — anything that comes up during the day. **Tasks go to Todoist, not here:** if a line is a real task, add it with the button below (or ⌘⇧A) and clear it. By end of day each remaining line either becomes a real note in `Notes/` or gets dropped. Checkboxes here are scratch, never the task list._

> [!button-row]
> ```button
> name ➕ Add task to Todoist
> type command
> action Todoist Sync: Add task
> ```
> ```button
> name ➕ Task + link to this note
> type command
> action Todoist Sync: Add task with current page in task content
> ```

- 

## 📝 Meetings

> [!button-row]
> ```button
> name 1:1
> type note(stub, false)
> action 1v1-meeting-button
> templater true
> ```
> ```button
> name Meeting
> type note(stub, false)
> action meeting-button
> templater true
> ```

- [[]]

## 🌙 Evening shutdown
- Wins:
- Stuck on / blockers:
- Tomorrow's top 3:
  1. 
  2. 
  3. 
- Journaled? · Worked out? · Read?
