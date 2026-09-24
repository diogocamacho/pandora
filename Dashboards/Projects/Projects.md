> [!tip] 📁 Projects
> Active, time-bound work with a defined outcome. Each project has ONE Home page (roles are sections inside it). Notes live in `Notes/`, surfaced via tag. This index is auto-generated — a new project appears here once its Home has `type: project-home` frontmatter.

---

## Active projects
```dataview
TABLE WITHOUT ID file.link AS "Home", project AS "Backing tag"
FROM "Dashboards/Projects"
WHERE type = "project-home"
SORT file.name ASC
```

---

## Recent notes across all projects
```dataview
LIST WITHOUT ID file.link
FROM #abiologics OR #x2 OR #agenticnutrition OR #fl110 OR #fl111
SORT file.mtime DESC
LIMIT 15
```
