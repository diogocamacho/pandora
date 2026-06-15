> [!tip] 📊 Dashboards
> Map-of-Content layer over the flat `Notes/` bucket. Three groups: **Areas** (ongoing), **Projects** (time-bound), **Ideas** (pre-project).

---

## Areas

```dataview
LIST file.link
FROM "Dashboards/Areas"
WHERE file.name = file.folder OR file.name = "Areas"
SORT file.name ASC
```

→ [[Areas|All areas]]

## Projects

```dataview
LIST file.link
FROM "Dashboards/Projects"
WHERE endswith(file.name, "Home") OR file.name = "💡 X2"
SORT file.name ASC
```

→ [[Projects|All projects]]

## Ideas

```dataview
LIST file.link
FROM "Dashboards/Ideas"
SORT file.mtime DESC
```

→ [[Ideas|All ideas]]
