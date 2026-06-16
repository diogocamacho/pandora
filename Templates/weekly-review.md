<%*
const d = tp.date.now("YYYY-MM-DD")
await tp.file.rename(`${d} weekly review`)
await tp.file.move(`Notes/${d} weekly review`)
%>---
type: weekly-review
date: <% tp.date.now("YYYY-MM-DD") %>
week_iso: <% tp.date.now("GGGG-[W]WW") %>
tags: [review, weekly]
---

# <% tp.date.now("YYYY-MM-DD") %> — Weekly review (week <% tp.date.now("[W]WW") %>)

## 1. Clear the inboxes
- Email zero: [ ]
- Slack: [ ]
- `! Inbox/` processed to zero: [ ]
- Brain dump → captured: 

## 2. What got done this week
- 

## 3. What didn't get done — and why
- 

## 4. Open loops (from notes, with `follow-up: true`)
- 

## 5. Top 3 priorities next week
1. 
2. 
3. 

## 6. Calendar review (next 2 weeks)
- Conflicts: 
- Prep needed: 
- Big-rock blocks protected: 

## 7. Decision log
- Pending → resolved: 
- New decisions: 

## 8. Follow-ups to send
- 

## 9. Career positioning check
- Did anything this week move toward C-level?
- Strategic-work hours this week (target: ≥5h):
- One thing to do next week for positioning:

## 10. Areas check
- 💰 Finance — on track? 
- 💪 Fitness — on track? 
- 👔 Style — on track? 
- ⚓️ Flagship Pioneering — on track? 

## 11. Notes for next week's review
- 
