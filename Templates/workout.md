<%*
const d = tp.date.now("YYYY-MM-DD")
const dow = parseInt(tp.date.now("d")) // 0=Sun, 1=Mon, ..., 6=Sat
const dayTypes = ["rest","strength","run","strength","run","strength","hiit"]
const dayType = dayTypes[dow]
await tp.file.rename(`${d} workout`)
await tp.file.move(`Notes/Logs/${d} workout`)
%>---
type: workout
date: <% tp.date.now("YYYY-MM-DD") %>
session_type: <% dayType %>
workout_name: 
trainer: 
duration_min: 
weight_lbs: 
target_weight_lbs: 170
calories_total: 
calories_target: 2200
protein_g: 
protein_target_g: 195
hrv_ms: 
recovery_pct: 
sleep_pct: 
rhr_bpm: 
strain: 
feel: 
tags: [fitness, workout]
---

# <% tp.date.now("YYYY-MM-DD") %> — <% dayType.charAt(0).toUpperCase() + dayType.slice(1) %>

## Body
- **Weight:** ___ lbs (target: 170)
- **Feel:** ___/5

## Session
- **Type:** <% dayType %>
- **Workout name:** 
- **Trainer / Program:** 
- **Duration:** ___ min
- **Strain (Whoop):** ___

## Nutrition
- **Calories:** ___ / 2,200
- **Protein:** ___g / 195g

## Recovery (Whoop)
- **Recovery:** ___%
- **HRV:** ___ ms
- **RHR:** ___ bpm
- **Sleep:** ___%

## Notes
- 
