---
cssclasses: [home-page]
---

# 🏠 Pandora

`$= "📅 " + dv.date('today').toFormat('EEEE, MMMM d, yyyy')` · `$= "[[Notes/Daily/" + dv.date('today').toFormat('yyyy-MM-dd') + "|📓 Today]]"` · `$= "[[Notes/Daily/" + dv.date('today').minus({days: 1}).toFormat('yyyy-MM-dd') + "|⬅ Yesterday]]"`

```dataviewjs
const t = dv.date('today').toFormat('yyyy-MM-dd');
const p = dv.page('Notes/Daily/' + t);
if (p && p.stoic) {
  dv.paragraph(`> [!quote] 🧘 Today's Stoic reflection\n> ${p.stoic}` + (p.stoic_by ? `\n> — *${p.stoic_by}*` : ``) + `\n>\n> _Sit with it today. You'll meet it again tonight._`);
} else {
  dv.paragraph("> [!quote] 🧘 Today's Stoic reflection\n> _Lands with the morning brief._");
}
```

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
>
> **Relationships** — [[CRM/Personal/|Personal CRM]] · [[CRM/Network/|Network CRM]]

> [!note]- ✏️ Create
> ```button
> name 📅 Daily note
> type command
> action Templater: Create daily
> ```
> ```button
> name 💡 Idea
> type command
> action Templater: Create create-idea
> ```
> ```button
> name 🗒️ Quick note
> type command
> action Templater: Create quick-note-button
> ```

---

## 🧠 Weekly Synthesis

```dataview
LIST WITHOUT ID "📖 " + file.link + " — " + dateformat(date, "MMMM d")
FROM "Notes/Reviews"
WHERE type = "deep-synthesis"
SORT date DESC
LIMIT 1
```
[[Dashboards/Learning|Archive →]] · [[Dashboards/Clippings|All clippings →]]

**Life pulse** · [[CRM/Personal/|Personal CRM →]] · [[CRM/Network/|Network →]]
```dataview
LIST WITHOUT ID file.link + " — " + dateformat(date, "EEE MMM d")
FROM "Notes/Logs"
WHERE type = "life-pulse"
SORT date DESC
LIMIT 3
```

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

## 📅 Today

> [!button-row]
> ```button
> name 🤝 1:1
> type command
> action Templater: Create 1v1-meeting-button
> ```
> ```button
> name 📝 Meeting
> type command
> action Templater: Create meeting-button
> ```

```dataview
LIST WITHOUT ID file.link
FROM "Notes"
WHERE startswith(file.name, dateformat(date(today), "yyyy-MM-dd"))
AND file.name != dateformat(date(today), "yyyy-MM-dd")
SORT file.mtime ASC
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

## ⏳ Follow Up

```dataview
LIST WITHOUT ID file.link
FROM "Notes"
WHERE follow-up = true
SORT file.mtime DESC
LIMIT 8
```



