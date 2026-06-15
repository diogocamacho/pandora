> [!tip] 📎 Attachments
> Images, PDFs, presentations, raw exports. Linked from notes via `![[filename]]` (embed) or `[[filename]]` (link). Auto-target for new attachments per `attachmentFolderPath` setting.

---

## Recent additions

```dataview
TABLE WITHOUT ID
  file.link as "File",
  file.size as "Size",
  file.mtime as "Modified"
FROM "Attachments"
WHERE file.name != "Attachments"
SORT file.mtime DESC
LIMIT 20
```

## Count by type

| Type | Count |
|---|---|
| Images (`.png`, `.jpg`, `.tiff`) | use search |
| PDFs | use search |
| Spreadsheets / docs | use search |

> Use `Cmd+P` → "Search: Search in all files" with `path:Attachments ext:pdf` for filtered views.
