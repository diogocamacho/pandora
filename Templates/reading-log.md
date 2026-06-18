<%*
const d = tp.date.now("YYYY-MM-DD")
await tp.file.rename(`${d} reading`)
await tp.file.move(`Notes/${d} reading`)
%>---
type: reading-log
date: <% tp.date.now("YYYY-MM-DD") %>
book:
author:
pages_read:
percent_complete:
tags: [reading]
---

# <% tp.date.now("YYYY-MM-DD") %> — Reading

## Book
- **Title:** 
- **Author:** 
- **Where I am:** 

## Tonight's read
- Pages / chapters:
- Time spent (min):

## What stuck
- 

## My pushback / questions
- 

## Connection to my work / life
- 

## Next time I open this book
- 
