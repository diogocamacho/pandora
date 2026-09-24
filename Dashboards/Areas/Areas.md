> [!tip] 🎯 Areas
> Ongoing responsibilities, no end date. Each has a dashboard pulling from tagged notes. Auto-generated — a dashboard appears here once it has `type: area-home` frontmatter.

---

## Areas
```dataview
TABLE WITHOUT ID file.link AS "Dashboard", area AS "Focus"
FROM "Dashboards/Areas"
WHERE type = "area-home"
SORT file.name ASC
```

_Also: [[Workout plan]] (iFit weekly calendar, `#workout`) — content, linked from [[💪 Fitness]]._

---

## Recent notes across all areas
```dataview
LIST WITHOUT ID file.link
FROM #finance OR #fitness OR #style OR #flagship OR #pbu OR #pilot OR #workout
SORT file.mtime DESC
LIMIT 15
```
