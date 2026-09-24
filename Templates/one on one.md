<%*
const person = await tp.system.prompt("Person name (e.g. Jeremy Amon):")
if (!person) return
const slug = person.toLowerCase().replace(/\s+/g, '-')
const d = tp.date.now("YYYY-MM-DD")
const fname = `${d} ${person} <> Diogo`
await tp.file.rename(fname)
await tp.file.move(`Notes/Meetings/${fname}`)
-%>
---
tags: [1v1, meeting]
person: "[[<% person %>]]"
follow-up: false
date: <% d %>
---

# <% d %> — [[<% person %>]] <> Diogo

← [[Notes/People/<% person %>|All notes: <% person %>]]

---

## ✅ Open tasks (Todoist)

> Add tasks here during the meeting with the **+** button, or tag Todoist tasks `@<% slug %>` to surface them here.

```todoist
name: <% person %>
filter: "@<% slug %>"
sorting:
  - priority
  - date
```

---

## 📋 Previous notes

```dataview
LIST WITHOUT ID file.link
FROM "Notes/Meetings"
WHERE contains(file.name, "<% person %>")
SORT file.name DESC
LIMIT 5
```

---

## 💬 Agenda
-

## ✍️ Notes & decisions
-

## 🔁 Actions from this meeting
- [ ] 

---
*Filed under [[Notes/People/<% person %>]]*
