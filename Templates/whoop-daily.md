<%*
const d = tp.date.now("YYYY-MM-DD")
await tp.file.rename(`${d} whoop`)
await tp.file.move(`/Notes/${d} whoop`)
%>---
type: whoop-daily
date: <% tp.date.now("YYYY-MM-DD") %>
recovery:
hrv:
rhr:
sleep_score:
sleep_hours:
strain:
note:
tags: [fitness, whoop]
---

# <% tp.date.now("YYYY-MM-DD") %> — Whoop

## Pull
- Recovery: __ %
- HRV: __ ms
- RHR: __ bpm
- Sleep score: __ %
- Sleep duration: __ h
- Strain (yesterday):

## Candy's read
> 

## Plan for today
- Workout: yes/no — type:
- Adjustments based on recovery:
