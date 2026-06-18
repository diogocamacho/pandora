<%*
const d = tp.date.now("YYYY-MM-DD")
await tp.file.rename(`${d} reading`)
await tp.file.move(`Notes/${d} reading`)
%>---
type: reading-log
date: <% tp.date.now("YYYY-MM-DD") %>
book:
author:
genre:  # fiction | nonfiction
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

## Resonance
*(for fiction: what hit, what I'd steal, what I'd argue with. for nonfiction: connection to my work / life, what I'd push back on)*
- 

## Next time I open this book
- 
