<%*
const d = tp.date.now("YYYY-MM-DD")
await tp.file.rename(`${d} outfit`)
await tp.file.move(`/Notes/${d} outfit`)
%>---
type: outfit
date: <% tp.date.now("YYYY-MM-DD") %>
occasion:
pieces:
rating:
tags: [style, outfit]
---

# <% tp.date.now("YYYY-MM-DD") %> — Outfit

- Occasion: 
- Weather: 
- Rating (1-5): 

## Pieces worn
- [[]]
- [[]]
- [[]]

## What worked / didn't
- 
