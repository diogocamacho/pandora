---
type: area
area: finance
tags: [area, finance]
---

> [!tip] 💰 Finance — area dashboard
> Sits on top of YNAB (source of truth for accounts, transactions, budget). This is the higher-level view: net worth trend, debt plan, investment thesis, runway, monthly review.

---

## 📊 At a glance

> [!note] Latest snapshot
> Pull from the most recent `type: net-worth-snapshot` note.

```dataview
TABLE WITHOUT ID
  file.link as "Snapshot",
  date as "Date",
  net_worth as "Net worth",
  liquidity_months as "Runway (mo)"
FROM "Notes"
WHERE type = "net-worth-snapshot"
SORT date DESC
LIMIT 1
```

---

## 📈 Net worth over time

```dataview
TABLE WITHOUT ID
  date as "Date",
  assets as "Assets",
  liabilities as "Liabilities",
  net_worth as "Net worth",
  liquidity_months as "Runway (mo)",
  note as "Note"
FROM "Notes"
WHERE type = "net-worth-snapshot"
SORT date DESC
```

```button
name ➕ Add net worth snapshot
type note(stub, false)
action net-worth-snapshot
templater true
```

---

## 💳 Debt

- [[💳 Debt consolidation|Active debt plan]]
- Target payoff date:
- Strategy: snowball / avalanche?

```dataview
LIST file.link
FROM "Notes"
WHERE contains(file.tags, "debt") OR contains(file.name, "Debt")
SORT file.mtime DESC
```

---

## 📈 Investments

- [[2025-11-28 ETF only portfolio|ETF-only portfolio plan]]
- [[2025-11-28 Next 6 weeks investment|Next 6 weeks rotation]]
- Current allocation: stocks __ % / bonds __ % / cash __ %
- Rebalance cadence:

```dataview
LIST file.link
FROM "Notes"
WHERE contains(file.tags, "investing") OR contains(file.name, "portfolio") OR contains(file.name, "investment")
SORT file.mtime DESC
LIMIT 10
```

---

## 🎁 Bonus & comp planning

- Next bonus expected:
- Allocation plan (debt / invest / cash):

```dataview
LIST file.link
FROM "Notes"
WHERE contains(file.tags, "bonus") OR contains(file.tags, "comp")
SORT file.mtime DESC
```

---

## 🗓️ Reviews

```dataview
LIST file.link
FROM "Notes"
WHERE type = "finance-review"
SORT date DESC
LIMIT 12
```

```button
name ➕ Monthly review
type note(stub, false)
action finance-review
templater true
```

---

## 🔗 External

- YNAB — source of truth for transactions and budget
- Brokerage dashboards (link in 1Password)
- [[Home|↩ back to Home]]
