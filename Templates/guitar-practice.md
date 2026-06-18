<%*
const d = tp.date.now("YYYY-MM-DD")
await tp.file.rename(`${d} guitar`)
await tp.file.move(`Notes/${d} guitar`)
%>---
type: guitar-practice
date: <% tp.date.now("YYYY-MM-DD") %>
focus:
piece:
duration_min:
tags: [guitar, practice]
---

# <% tp.date.now("YYYY-MM-DD") %> — Guitar

## Focus tonight
- **Piece / etude / technique:** 
- **Duration (min):** 

## Drilled
- Bars / passages worked:
- Tempo (BPM) / progression:
- Tools (metronome, looper, backing track, none):

## Wins
- 

## Still stuck on
- 

## Specific technique question
*(the one Max pushed on tonight)*
- 

## Next session focus
- 
