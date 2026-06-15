> [!tip] 📓 Notes
> Flat bucket. Every note — meetings, dailies, journal, ideas, learning, references — lives here. Folder location carries no meaning; **tags** carry meaning. Search via Quick Switcher (`Cmd+O`) or tag pane.

---

## Recent (last 20)

```dataview
LIST file.link
FROM "Notes"
WHERE file.name != "Notes"
SORT file.mtime DESC
LIMIT 20
```

## Today's notes

```dataview
LIST file.link
FROM "Notes"
WHERE file.cday = date(today)
SORT file.ctime DESC
```

## By common tag

- [[Idea Collector]] · `#idea`
- `#daily`
- `#abiologics` · `#fl108` · `#fl110` · `#fl111` · `#fl115` · `#x2`
- `#finance` · `#fitness` · `#style`
- `#flagship` · `#pbu` · `#pilot`
- `#reference` · `#paper` · `#book`
