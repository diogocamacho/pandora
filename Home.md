---
cssclasses: [home-page]
---

# 🏠 Pandora

`$= "📅 " + dv.date('today').toFormat('EEEE, MMMM d, yyyy')` · `$= "[[Notes/Daily/" + dv.date('today').toFormat('yyyy-MM-dd') + "|📓 Today]]"` · `$= "[[Notes/Daily/" + dv.date('today').minus({days: 1}).toFormat('yyyy-MM-dd') + "|⬅ Yesterday]]"`

> [!note]- 🧭 Navigate
> **Work** — [[Dashboards/Projects/Abiologics/Abiologics Home|Abiologics]] · [[Dashboards/Projects/FL110/FL110 Home|FL110]] · [[Dashboards/Projects/FL111/FL111 Home|FL111]] · [[Dashboards/Areas/Flagship Pioneering/Flagship Pioneering|Flagship]]
>
> **X2** — [[Dashboards/Projects/Agentic Nutrition (X2)/💡 X2|Agentic Nutrition]]
>
> **People** — [[Notes/People/Andrew Croneberger|Andrew]] · [[Notes/People/Beth Kartchner|Beth]] · [[Notes/People/Jeremy Amon|Jeremy]] · [[Notes/People/Nitya Talasila|Nitya]] · [[Notes/People/Alex Toomey|Alex]]
>
> **Ideas** — [[Dashboards/Ideas/Ideas|All ideas]]
>
> **Reference** — [[Notes/Reference/Reference Hub|Reference Hub]] · [[Notes/Reference/Leadership Principles|Leadership]] · [[Notes/Reference/Flagship Academy Synthesis|Flagship Academy]] · [[Notes/Reference/Computational Index|Computational]]
>
> **Life** — [[Dashboards/Areas/💰 Finance/💰 Finance|Finance]] · [[Dashboards/Areas/💪 Fitness/💪 Fitness|Fitness]] · [[Dashboards/Areas/👔 Style/👔 Style|Style]]

> [!note]- ✏️ Create
> ```button
> name 📅 Daily note
> type note(stub, false)
> action daily
> templater true
> ```
> ```button
> name 💡 Idea
> type note(stub, false)
> action create-idea
> templater true
> ```
> ```button
> name 🗒️ Quick note
> type note(stub, false)
> action quick-note-button
> templater true
> ```

---

## ✅ Tasks

```todoist
name: Today & Overdue
filter: "today | overdue"
sorting:
  - priority
  - date
```

---

## 📅 Today's meetings

> [!button-row]
> ```button
> name 🤝 1:1
> type note(stub, false)
> action 1v1-meeting-button
> templater true
> ```
> ```button
> name 📝 Meeting
> type note(stub, false)
> action meeting-button
> templater true
> ```

```dataview
LIST WITHOUT ID file.link
FROM "Notes/Meetings"
WHERE file.ctime >= date(today) AND file.ctime < date(tomorrow)
SORT file.ctime ASC
```

---

## ⬅ Yesterday

```dataview
LIST WITHOUT ID file.link
FROM "Notes"
WHERE file.mtime >= date(yesterday) AND file.mtime < date(today)
SORT file.mtime DESC
LIMIT 8
```

---

## ⏳ Waiting on

```dataview
LIST WITHOUT ID file.link
FROM "Notes"
WHERE follow-up = true
SORT file.mtime DESC
LIMIT 8
```


