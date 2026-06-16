---
type: area-home
area: people
tags: [area, people]
---

# 🧑‍🤝‍🧑 People

Everyone Diogo meets with regularly. Each person note has a `person_tag` that links them to their meeting notes (1:1s tagged with the same value via the 1:1 button template).

---

## ➕ Add a person

```button
name New person
type note(_p-stub, false)
action person
templater true
```

---

## Stale (haven't met in cadence_days)

```dataview
TABLE WITHOUT ID
  file.link as "Name",
  org as "Org",
  relationship as "Relationship",
  last_met as "Last met",
  cadence_days as "Cadence",
  choice(last_met != null AND cadence_days != null AND date(last_met) + dur(cadence_days + " days") < date(today), "🔴 overdue", "—") as "Status"
FROM "Notes"
WHERE type = "person"
  AND last_met != null
  AND cadence_days != null
  AND date(last_met) + dur(cadence_days + " days") < date(today)
SORT date(last_met) ASC
```

---

## All people

```dataview
TABLE WITHOUT ID
  file.link as "Name",
  org as "Org",
  role as "Role",
  relationship as "Relationship",
  last_met as "Last met",
  cadence_days as "Cadence (days)"
FROM "Notes"
WHERE type = "person"
SORT relationship ASC, file.name ASC
```

---

## By relationship

### Direct reports
```dataview
LIST WITHOUT ID file.link
FROM "Notes"
WHERE type = "person" AND relationship = "direct-report"
SORT file.name ASC
```

### Manager / coaches
```dataview
LIST WITHOUT ID file.link
FROM "Notes"
WHERE type = "person" AND (relationship = "manager" OR relationship = "coach")
SORT file.name ASC
```

### Peers
```dataview
LIST WITHOUT ID file.link
FROM "Notes"
WHERE type = "person" AND relationship = "peer"
SORT file.name ASC
```

### External
```dataview
LIST WITHOUT ID file.link
FROM "Notes"
WHERE type = "person" AND relationship = "external"
SORT file.name ASC
```

---

## Recent 1:1 notes across all people

```dataview
LIST WITHOUT ID file.link
FROM "Notes"
WHERE contains(file.tags, "1v1")
SORT file.mtime DESC
LIMIT 15
```
