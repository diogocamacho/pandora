
## To Do
```dataview
task
FROM #abiologics & (#jeremy | #jamon)
WHERE !completed
```


## Follow Up
```dataview
LIST
FROM #abiologics & #jamon
WHERE follow-up = true
SORT file.name DESC
```

---
### All Notes
```dataview
LIST
FROM #abiologics & #jeremy | #jamon
SORT file.name DESC
```
