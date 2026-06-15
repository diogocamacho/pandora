> [!tip] Landing spot
> My notes, my calendar, my todos. In one place. Because that seems like the thing to do.

---

## 🚀 Quick Actions

**Daily & Notes:**
```button
name 📅 Daily Note
id daily-button
type note
action daily
templater true
```

```button
name 📝 Quick Note
type note
action quick-note-button
templater true
```

**Projects & Ideas:**
```button
name ⚗️ New Engagement
type note
action create-work-project
templater true
```

```button
name 💡 New Idea
type note
action create-idea
templater true
```

---

## 📅 Today's Focus

### Today's Daily Note
```dataview
LIST
FROM #daily
WHERE file.day = date(today)
LIMIT 1
```

### Today's Tasks
> [!warning] 🚨 Overdue
> ```tasks
> not done 
> due before today
> ```

> [!next] High Priority
> ```tasks
> not done
> priority is high
> ```

> [!todo] Due Today
> ```tasks
> due today
> not done
> ```

### Today's Trackers
- **Journaling**: Check today's daily note
- **Workout**: Check today's daily note
- [[Trackers|View All Trackers]]

---

## 📥 Inbox

> [!tip] Quick Capture
> Unprocessed items that need to be organized

```dataview
LIST
FROM ""
WHERE contains(file.tags, "#inbox") OR follow-up = true
SORT file.mtime DESC
LIMIT 10
```

---

## ➡️ Next Actions

### Work
```dataview
TASK
FROM ""
WHERE contains(file.tags, "#next-action") AND contains(file.tags, "#work") AND !completed
SORT 
	choice(contains(text, "🔺"), 1, 
	choice(contains(text, "⏫"), 2, 
	choice(contains(text, "🔼"), 3, 
	4))) asc
```

### Personal
```dataview
TASK
FROM ""
WHERE contains(file.tags, "#next-action") AND contains(file.tags, "#personal") AND !completed
SORT 
	choice(contains(text, "🔺"), 1, 
	choice(contains(text, "⏫"), 2, 
	choice(contains(text, "🔼"), 3, 
	4))) asc
```

### Ideas
```dataview
TASK
FROM ""
WHERE contains(file.tags, "#next-action") AND contains(file.tags, "#ideas") AND !completed
SORT 
	choice(contains(text, "🔺"), 1, 
	choice(contains(text, "⏫"), 2, 
	choice(contains(text, "🔼"), 3, 
	4))) asc
```

### Learning
```dataview
TASK
FROM ""
WHERE contains(file.tags, "#next-action") AND contains(file.tags, "#learning") AND !completed
SORT 
	choice(contains(text, "🔺"), 1, 
	choice(contains(text, "⏫"), 2, 
	choice(contains(text, "🔼"), 3, 
	4))) asc
```

---

## ⏳ Waiting For

> [!note] Items blocked on others or pending responses

```dataview
LIST
FROM ""
WHERE contains(file.tags, "#waiting-for")
SORT file.mtime DESC
```

---

## 📁 Projects

### Work Projects
```dataview
LIST
FROM "001. Work"
WHERE contains(file.tags, "#project") AND contains(file.tags, "#work")
SORT file.mtime DESC
```

### Personal Projects
```dataview
LIST
FROM "000. Personal"
WHERE contains(file.tags, "#project") AND contains(file.tags, "#personal")
SORT file.mtime DESC
```

### Ideas
```dataview
LIST
FROM "002. Ideas"
WHERE contains(file.tags, "#project") OR contains(file.tags, "#ideas")
SORT file.mtime DESC
```

### Learning Projects
```dataview
LIST
FROM "003. Learning"
WHERE contains(file.tags, "#project") AND contains(file.tags, "#learning")
SORT file.mtime DESC
```

---

## 🎯 Areas of Responsibility

### Work Areas
```dataview
LIST
FROM ""
WHERE contains(file.tags, "#area") AND contains(file.tags, "#work")
SORT file.name ASC
```

### Personal Areas
```dataview
LIST
FROM ""
WHERE contains(file.tags, "#area") AND contains(file.tags, "#personal")
SORT file.name ASC
```

---

## 💭 Someday/Maybe

> [!tip] Deferred ideas and future projects

```dataview
LIST
FROM ""
WHERE contains(file.tags, "#someday-maybe")
SORT file.mtime DESC
```

---

## 📆 Calendar & Upcoming

### This Week's Tasks
> [!upcoming]
> ```tasks
> not done
> due after today
> due before in one week
> short mode
> hide edit button
> hide backlink
> ```


### Upcoming Deadlines
```dataview
TASK
FROM ""
WHERE !completed AND due != null AND due <= date(today) + dur(7 days)
SORT due ASC
```

---

## 👁️ Follow Up Notes

```dataview
LIST
WHERE follow-up = true
SORT file.mtime DESC
LIMIT 20
```

---

## 🔗 Quick Links

### Key Areas
- [[001. Work|Work]]
- [[002. Ideas|Ideas]]
- [[003. Learning|Learning]]
- [[000. Personal|Personal]]

### Frequently Accessed
- [[Trackers]]
- [[002. Ideas/💡 X2/💡 X2|X2]]
- [[001. Work/Abiologics/Abiologics Home|Abiologics]]

---

## 📊 Weekly Review

> [!check] Last Review: [Update this date after each review]

### Review Checklist
- [ ] Process Inbox
- [ ] Review Next Actions
- [ ] Update Waiting For
- [ ] Review Projects
- [ ] Update Someday/Maybe
- [ ] Plan Next Week

---

## 🏷️ Tag Navigation

### Major Tags
- [[#x2]]
- [[#compbio]]
- [[#abiologics]]
- [[#ideas]]
- [[#work]]
