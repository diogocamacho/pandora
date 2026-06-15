<%*
const d = tp.date.now("YYYY-MM-DD")
await tp.file.rename(`${d} weigh-in`)
await tp.file.move(`/Notes/${d} weigh-in`)
%>---
type: body-recomp
date: <% tp.date.now("YYYY-MM-DD") %>
weight_lb:
body_fat_pct:
waist_in:
chest_in:
hip_in:
note:
tags: [fitness, body-recomp]
---

# <% tp.date.now("YYYY-MM-DD") %> — Weigh-in

- Weight (lb): 
- Body fat %: 
- Waist (in): 
- Chest (in): 
- Hip (in): 

## Trend vs last
- Δ weight: 
- Δ BF%: 

## Note
- 
