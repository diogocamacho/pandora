> [!tip] 🧭 Command Center
> One screen: today, what's coming in, what's due, and every project/area hub. The MOC layer over the flat `Notes/` bucket. Pinned as the front door.

## 📆 Today
```dataview
LIST WITHOUT ID file.link
FROM "Notes/Daily"
WHERE file.name = dateformat(date(today), "yyyy-MM-dd")
```

## 🚨 Overdue & due today
```tasks
not done
due before tomorrow
sort by due
short mode
hide edit button
hide backlink
```

---

## 📥 Inbox
_Capture in the daily note's 🧠 Capture section. Anything that outlives the day gets `#inbox`. Clear to zero at weekly review._

**Tagged `#inbox`**
```dataview
LIST WITHOUT ID file.link
FROM #inbox
SORT file.mtime DESC
```

**Unfiled — sitting in `Notes/` root**
```dataview
LIST WITHOUT ID file.link
FROM "Notes"
WHERE file.folder = "Notes"
SORT file.mtime DESC
```

---

## 📁 Projects
```dataview
TABLE WITHOUT ID file.link AS "Project", project AS "Tag"
FROM "Dashboards/Projects"
WHERE type = "project-home"
SORT file.name ASC
```
→ [[Projects|All projects]]

## 🎯 Areas
```dataview
TABLE WITHOUT ID file.link AS "Area", area AS "Focus"
FROM "Dashboards/Areas"
WHERE type = "area-home"
SORT file.name ASC
```
→ [[Areas|All areas]]

## 💡 Ideas
```dataview
LIST WITHOUT ID file.link
FROM "Dashboards/Ideas"
WHERE file.name != "Ideas"
SORT file.mtime DESC
LIMIT 10
```
→ [[Ideas|All ideas]]

---

## 🔗 Recent across everything
```dataview
LIST WITHOUT ID file.link
FROM #abiologics OR #x2 OR #agenticnutrition OR #fl110 OR #fl111 OR #finance OR #fitness OR #style OR #flagship
SORT file.mtime DESC
LIMIT 15
```

→ 🧹 [[🧹 Maintenance|Vault maintenance]]
