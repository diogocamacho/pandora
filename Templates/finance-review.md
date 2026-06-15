<%*
const d = tp.date.now("YYYY-MM-DD")
await tp.file.rename(`${d} finance monthly review`)
await tp.file.move(`/Notes/${d} finance monthly review`)
%>---
type: finance-review
date: <% tp.date.now("YYYY-MM-DD") %>
tags: [finance, review, monthly]
---

# <% tp.date.now("YYYY-MM") %> — Finance monthly review

## YNAB checkpoint
- All accounts reconciled? Y / N
- Categories overspent:
- Categories underspent (sweep where?):
- Budget changes for next month:

## Net worth delta vs last month
- $:
- Drivers:

## Debt
- Balance now: 
- Paydown this month: 
- On track for target payoff? Y / N

## Investments
- Contributions this month:
- Rebalances:
- Thesis updates:

## Cash / runway
- Liquidity (months):
- Top concerns:

## Decisions for next month
- [ ] 
- [ ] 

## Wins / lessons
- 
