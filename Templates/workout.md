<%*
const d = tp.date.now("YYYY-MM-DD")
await tp.file.rename(`${d} workout`)
await tp.file.move(`/Notes/${d} workout`)
%>---
type: workout
date: <% tp.date.now("YYYY-MM-DD") %>
workout:
duration_min:
intensity:
feel:
tags: [fitness, workout]
---

# <% tp.date.now("YYYY-MM-DD") %> — Workout

## Session
- Type: 
- Duration (min): 
- Intensity (1-10): 
- Feel (1-5): 

## Detail
- 

## Notes
- 
