---
tags: [dashboard]
---

# 📰 Clippings

> Browser clips land here from the Web Clipper → enriched nightly with tags, topics, and vault links.

---

## 🔴 Needs enrichment
```dataview
TABLE WITHOUT ID file.link AS "Title", created AS "Clipped", description AS "Description"
FROM "Clippings"
WHERE !processed
SORT created DESC
```

---

## 📅 This week
```dataview
TABLE WITHOUT ID file.link AS "Title", author AS "Author", tags AS "Tags"
FROM "Clippings"
WHERE date(created) >= date(today) - dur(7 days)
SORT created DESC
```

---

## 🏷️ Browse by tag
```dataview
TABLE WITHOUT ID file.link AS "Title", tags AS "Tags", published AS "Published"
FROM "Clippings"
WHERE processed = true
SORT created DESC
```

---

## 🔗 Has connections
```dataview
TABLE WITHOUT ID file.link AS "Title", related AS "Notes", idea-supports AS "Supports ideas", idea-challenges AS "Challenges ideas"
FROM "Clippings"
WHERE related OR idea-supports OR idea-challenges
SORT created DESC
```

---

## 📚 All clippings
```dataview
TABLE WITHOUT ID file.link AS "Title", published AS "Published", author AS "Author"
FROM "Clippings"
SORT published DESC
```
