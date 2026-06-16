<%*
const d = tp.date.now("YYYY-MM-DD")
await tp.file.rename(`${d} daily brief`)
await tp.file.move(`Notes/${d} daily brief`)
%>---
type: daily-brief
date: <% tp.date.now("YYYY-MM-DD") %>
tags: [brief, daily-brief]
---

# Daily brief — <% tp.date.now("YYYY-MM-DD") %> <% tp.date.now("dddd") %>

← [[<% tp.date.now("YYYY-MM-DD") %>|back to daily]]

---

## 🎯 Max — Today's focus
- 

## 📋 Sarah — Ops
- 

## 📧 Comms — Email & Slack
- 

## 💰 Kevin — Market brief & portfolio
- 

## 🧬 John — Biotech intel
- 

## 💪 Candy — Body
- 

## 📅 Meeting prep
- 
