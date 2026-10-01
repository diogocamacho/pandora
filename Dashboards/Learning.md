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
  idea-supports AS "✅ Supports",
  idea-challenges AS "⚡ Challenges"
FROM "Clippings"
WHERE date(created) >= date(today) - dur(7 days)
SORT created DESC
```

---

## 📄 Papers I clipped

> Deep-read papers: verdict, one-line take, and where the independent reviewer disagreed.

```dataview
TABLE WITHOUT ID
  file.link AS "Paper",
  verdict AS "Verdict",
  reviewer_divergence AS "Reviewer Δ",
  tldr AS "TL;DR",
  analyzed_on AS "Read"
FROM "Papers/Analyses"
WHERE type = "paper-analysis"
SORT analyzed_on DESC
LIMIT 25
```

**📥 Waiting to be read**
```dataview
LIST WITHOUT ID file.link + " — clipped " + string(created)
FROM "Papers" AND -"Papers/Analyses"
WHERE !analyzed
SORT created DESC
```

---

## 🌱 Growing Ideas

> Ideas accumulate both supporting evidence (✅) and challenges (⚡) from clippings. The more entries, the more the idea is being actively tested.

```dataview
TABLE WITHOUT ID
  file.link AS "Idea",
  evidence_supporting AS "✅ Supporting",
  evidence_challenging AS "⚡ Challenges",
  evidence_last AS "Last evidence"
FROM "ideas"
WHERE evidence_supporting > 0 OR evidence_challenging > 0
SORT evidence_last DESC
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
FROM "Notes/Reviews"
WHERE type = "deep-synthesis"
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
