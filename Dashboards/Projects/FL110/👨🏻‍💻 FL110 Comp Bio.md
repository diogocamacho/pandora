
## People


---
## Quick Link


---
## Notes to Follow Up
```dataview
TABLE
FROM #FL110 & #compbio 
WHERE follow-up = true
```


## To Do
```dataview
task
FROM #FL110 & #compbio 
WHERE !completed
```
---
## External
```dataview
TABLE
FROM #FL110 & #compbio & #pi 
SORT file.name DESC
```


## All notes
```dataview
TABLE
FROM #FL110 & #compbio 
```
