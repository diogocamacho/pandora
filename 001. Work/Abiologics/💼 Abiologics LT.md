
## To Do
```dataview
task
FROM #abiologics & #LT
WHERE !completed
```


## Follow Up
```dataview
LIST
FROM #abiologics & #LT
WHERE follow-up = true
SORT file.name DESC
```




## All notes
```dataview
LIST
FROM #abiologics & #LT 
SORT file.name DESC
```
