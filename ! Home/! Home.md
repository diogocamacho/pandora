> [!tip] Pandora — launchpad
> Daily note · projects · areas · capture. All in one place.

---

## 📅 Today's daily

```dataview
LIST WITHOUT ID file.link
FROM "Notes"
WHERE file.name = dateformat(date(today), "yyyy-MM-dd")
LIMIT 1
```

---

## 🚀 Quick actions

> [!button-row]
> ```button
> name 📝 Quick note
> type note(stub, false)
> action quick-note-button
> templater true
> ```
> ```button
> name ⚗️ New work project
> type note(stub, false)
> action create-work-project
> templater true
> ```
> ```button
> name 💡 New idea
> type note(stub, false)
> action create-idea
> templater true
> ```
> ```button
> name 🤝 New 1:1
> type note(stub, false)
> action 1v1-meeting-button
> templater true
> ```

---

## ✅ Today

> [!attention] 🚨 Overdue
> ```tasks
> not done
> due before today
> short mode
> hide edit button
> hide backlink
> ```

> [!next] ✅ Due today
> ```tasks
> not done
> due today
> short mode
> hide edit button
> hide backlink
> ```

> [!todo] 🔥 High priority (any date)
> ```tasks
> not done
> (priority is highest) OR (priority is high)
> limit 5
> short mode
> hide edit button
> hide backlink
> ```

---

## 📁 Active projects

```dataview
LIST
FROM "Dashboards/Projects"
WHERE endswith(file.name, "Home") OR file.name = "💡 X2"
SORT file.name ASC
```

---

## 🎯 Areas

- [[💰 Finance]]
- [[💪 Fitness]]
- [[👔 Style]]
- [[Flagship Pioneering]]

---

## ⏳ Waiting on

```dataview
LIST file.link
FROM "Notes"
WHERE contains(file.tags, "waiting-for") OR follow-up = true
SORT file.mtime DESC
LIMIT 10
```

---

## 📥 Inbox (unprocessed)

```dataview
LIST
FROM "! Inbox"
WHERE file.name != "! Inbox"
SORT file.mtime DESC
```

---

## 🔗 Pinned

- [[Abiologics Home|🧬 Abiologics]]
- [[💡 X2|🥗 Agentic Nutrition (X2)]]
- [[FL110 Home|FL110]] · [[FL111 Home|FL111]]
- [[💰 Finance]] · [[💪 Fitness]] · [[👔 Style]]
- [[Idea Collector|💡 Ideas inbox]]

---

## 📊 Weekly review

- [ ] Process `! Inbox/` → file into Notes/ or appropriate dashboard
- [ ] Review overdue + reschedule
- [ ] Update each project Home with this week's progress
- [ ] Update Waiting on
- [ ] Update Finance / Fitness / Style dashboards
- [ ] Plan next week's top 3
