<%*
const d = tp.date.now("YYYY-MM-DD")
await tp.file.rename(`${d} net worth snapshot`)
await tp.file.move(`Notes/${d} net worth snapshot`)
%>---
type: net-worth-snapshot
date: <% tp.date.now("YYYY-MM-DD") %>
assets:
liabilities:
net_worth:
liquidity_months:
note:
tags: [finance, net-worth]
---

# <% tp.date.now("YYYY-MM-DD") %> — Net worth snapshot

## Breakdown
| Bucket | $ | Note |
|---|---|---|
| Cash & equivalents |  |  |
| Brokerage |  |  |
| 401(k) / IRA |  |  |
| Real estate (net of mortgage) |  |  |
| Other |  |  |
| **Total assets** |  |  |
| Mortgage |  |  |
| Credit card / consumer debt |  |  |
| Other liabilities |  |  |
| **Total liabilities** |  |  |
| **Net worth** |  |  |

## Notes / changes from last snapshot
- 

## Action items
- [ ] 
