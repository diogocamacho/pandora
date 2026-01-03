
## To Do
```dataview
task
FROM #abiologics & (#bkartchner | #beth)
WHERE !completed
```


## Follow Up
```dataview
LIST
FROM #abiologics & (#bkartchner | #beth)
WHERE follow-up = true
```

---
### All Notes
```dataview
LIST
FROM #abiologics & (#beth | #bkartchner)
SORT file.name DESC
```
