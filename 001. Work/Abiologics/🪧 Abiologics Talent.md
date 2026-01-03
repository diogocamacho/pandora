
## To Do
```dataview
task
FROM #abiologics & #interviews 
WHERE !completed
```


## Follow Up
```dataview
LIST
FROM #abiologics & #interviews 
WHERE follow-up = true
```




## All notes
```dataview
LIST
FROM #abiologics & #interviews 
SORT file.name DESC
```
