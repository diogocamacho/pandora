
## People


---
## Quick Link
[[🎯 FL108 TargetID]]

---
## Notes to Follow Up
```dataview
TABLE
FROM #fl108 & #compbio 
WHERE follow-up = true
```


## To Do
```dataview
task
FROM #fl108 & #compbio 
WHERE !completed
```
---
## External
```dataview
TABLE
FROM #fl108 & #compbio & #pi 
SORT file.name DESC
```


## All notes
```dataview
TABLE
FROM #fl108 & #compbio 
```
