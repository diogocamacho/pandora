---
type: area-home
area: finance
tags: [area, finance]
---

> [!tip] 💰 Finance — area dashboard
> Portfolio snapshots written daily by Max. Net worth snapshots written monthly. Debt tracker and emergency fund live in Kevin's skill and are reflected manually below.

---

## 📊 At a glance

```dataviewjs
const snapshots = dv.pages('"Notes"')
  .where(p => p.type === "portfolio-snapshot")
  .sort(p => p.date, 'asc');

const latest = snapshots.last();
const prev = snapshots.slice(-2).first();

if (!latest) {
  dv.paragraph("No portfolio snapshots yet — Kevin writes the first one at tomorrow's morning brief.");
} else {
  const total = latest.snapshot_total;
  const change = prev && prev.snapshot_total ? total - prev.snapshot_total : null;
  const changePct = change !== null ? ((change / prev.snapshot_total) * 100).toFixed(2) : null;
  const arrow = change > 0 ? '▲' : change < 0 ? '▼' : '—';
  dv.paragraph(
    `**Portfolio:** $${total?.toLocaleString()} ` +
    (change !== null ? `| ${arrow} $${Math.abs(change).toLocaleString()} (${changePct}%) vs yesterday` : '') +
    `\n\n_As of [[${latest.file.name}]]_`
  );
}
```

> [!note] Emergency fund & debt
> Update these manually from Kevin's Current Financial State block.
> - **Emergency fund:** $___  / $30,000 target
> - **Total debt:** $___
> - **Next 0% expiry:** ___

---

## 📈 Portfolio value trend

```dataviewjs
const pages = dv.pages('"Notes"')
  .where(p => p.type === "portfolio-snapshot" && p.snapshot_total)
  .sort(p => p.date, 'asc')
  .slice(-60);

if (pages.length < 2) {
  dv.paragraph("Not enough data yet — snapshots accumulate daily.");
} else {
  const labels = pages.map(p => String(p.date).slice(5)).array();
  const data = pages.map(p => p.snapshot_total).array();

  const chartData = {
    type: 'line',
    data: {
      labels,
      datasets: [{
        label: 'Portfolio value ($)',
        data,
        borderColor: 'rgba(16, 185, 129, 1)',
        backgroundColor: 'rgba(16, 185, 129, 0.08)',
        borderWidth: 2,
        tension: 0.3,
        fill: true,
        pointRadius: 2,
      }]
    },
    options: {
      scales: {
        y: { title: { display: true, text: 'USD' } }
      }
    }
  };

  window.renderChart(chartData, this.container);
}
```

---

## 🥧 Position breakdown (latest snapshot)

```dataviewjs
const latest = dv.pages('"Notes"')
  .where(p => p.type === "portfolio-snapshot")
  .sort(p => p.date, 'desc')
  .first();

if (!latest) {
  dv.paragraph("No snapshot yet.");
} else {
  const positions = [
    { ticker: 'QQQ', price: latest.qqq, shares: latest.qqq_shares },
    { ticker: 'SCHD', price: latest.schd, shares: latest.schd_shares },
    { ticker: 'SMH', price: latest.smh, shares: latest.smh_shares },
    { ticker: 'VXUS', price: latest.vxus, shares: latest.vxus_shares },
    { ticker: 'XBI', price: latest.xbi, shares: latest.xbi_shares },
  ].filter(p => p.price && p.shares);

  const total = positions.reduce((s, p) => s + p.price * p.shares, 0);

  dv.table(
    ['Ticker', 'Price', 'Shares', 'Value', 'Weight'],
    positions.map(p => {
      const val = p.price * p.shares;
      const pct = ((val / total) * 100).toFixed(1);
      return [p.ticker, `$${p.price}`, p.shares, `$${val.toLocaleString(undefined, {maximumFractionDigits: 0})}`, `${pct}%`];
    })
  );

  // Allocation pie chart
  const chartData = {
    type: 'doughnut',
    data: {
      labels: positions.map(p => p.ticker),
      datasets: [{
        data: positions.map(p => +(p.price * p.shares).toFixed(0)),
        backgroundColor: [
          'rgba(99,102,241,0.8)',
          'rgba(16,185,129,0.8)',
          'rgba(245,158,11,0.8)',
          'rgba(239,68,68,0.8)',
          'rgba(59,130,246,0.8)',
        ]
      }]
    }
  };
  window.renderChart(chartData, this.container);
}
```

---

## 📆 Recent snapshots (last 14 days)

```dataview
TABLE WITHOUT ID
  file.link AS "Date",
  qqq AS "QQQ",
  schd AS "SCHD",
  smh AS "SMH",
  vxus AS "VXUS",
  xbi AS "XBI",
  snapshot_total AS "Total"
FROM "Notes"
WHERE type = "portfolio-snapshot"
SORT date DESC
LIMIT 14
```

---

## 📉 Net worth over time

```dataview
TABLE WITHOUT ID
  file.link AS "Snapshot",
  date AS "Date",
  portfolio_total AS "Portfolio",
  cash_savings AS "Cash",
  debt_total AS "Debt",
  net_worth AS "Net worth"
FROM "Notes"
WHERE type = "net-worth-snapshot"
SORT date DESC
```

---

## 💳 Debt tracker

> Update from Kevin's Current Debt Tracker block when balances change.

| Debt | Balance | Rate | Expiry | Priority |
|------|---------|------|--------|----------|
| _(pending)_ | | | | |

---

## 🔗 External

- YNAB — source of truth for transactions and budget
- Brokerage dashboard (link in 1Password)
- [[Home|↩ back to Home]]
