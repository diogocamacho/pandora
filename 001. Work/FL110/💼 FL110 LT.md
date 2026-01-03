
## To Do
```dataview
task
FROM #FL110 & #LT
WHERE !completed
```


## Follow Up
```dataview
LIST
FROM #FL110 & #LT
WHERE follow-up = true
SORT file.name DESC
```




## All notes
```dataview
LIST
FROM #FL110 & #LT 
SORT file.name DESC
```
