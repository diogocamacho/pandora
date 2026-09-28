---
tags: [dashboard]
---

# 🧠 Continuous Learning

> What you're reading, what it connects to, what's compounding.
> Clippings → enriched at 9:30am daily → synthesis written → ideas updated.

---

## 📖 This week's clips and what they touched

```dataview
TABLE WITHOUT ID
  file.link AS "Clipping",
  related AS "Vault notes",
  idea-connections AS "Ideas"
FROM "Clippings"
WHERE date(created) >= date(today) - dur(7 days)
SORT created DESC
```

---

## 🌱 Growing Ideas

> Ideas accumulate both supporting evidence (✅) and challenges (⚡) from clippings. The more entries, the more the idea is being actively tested.

```dataview
TABLE WITHOUT ID
  file.link AS "Idea",
  length(filter(file.outlinks, (l) => contains(string(l), "✅"))) AS "Supporting",
  length(filter(file.outlinks, (l) => contains(string(l), "⚡"))) AS "Challenges"
FROM "ideas"
WHERE (contains(file.content, "Supporting evidence")
    OR contains(file.content, "Challenges & counterpoints")
    OR contains(file.content, "Evidence & reinforcement"))
SORT file.mtime DESC
LIMIT 15
```

---

## 🗓️ Daily synthesis — this week

```dataview
LIST WITHOUT ID file.link + " — " + dateformat(date, "EEE MMM d")
FROM "Notes/Logs"
WHERE type = "learning"
  AND date >= date(today) - dur(7 days)
SORT date DESC
```

---

## 📋 Weekly reviews

```dataview
TABLE WITHOUT ID file.link AS "Week", date AS "Date"
FROM "Notes/Logs"
WHERE type = "weekly-learning"
SORT date DESC
LIMIT 8
```

---

## 🗺️ All-time connections (enriched clippings)

```dataview
TABLE WITHOUT ID
  file.link AS "Clipping",
  published AS "Published",
  tags AS "Tags"
FROM "Clippings"
WHERE processed = true
SORT created DESC
LIMIT 30
```

---

## 🏷️ Tag cloud — what you've been reading about

```dataview
TABLE WITHOUT ID rows.file.link AS "Clippings", count AS "Count"
FROM "Clippings"
WHERE processed = true
FLATTEN tags as tag
WHERE tag != "clippings"
GROUP BY tag
SORT count DESC
LIMIT 20
```
