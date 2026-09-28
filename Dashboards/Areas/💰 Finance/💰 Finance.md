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
> - **Emergency fund:** $12,081 / $30,000 target — 40% funded, $17,919 gap (SPAXX $9,501 + lifestyle $2,580)
> - **Total debt:** $15,142 (JetBlue CC $9,801 + Fidelity CC $5,342; both standard APR)
> - **Next 0% expiry:** N/A — no promo debt on books

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

## ⚖️ Allocation vs targets

```dataviewjs
const latest = dv.pages('"Notes"')
  .where(p => p.type === "portfolio-snapshot")
  .sort(p => p.date, 'desc')
  .first();

if (!latest) {
  dv.paragraph("No snapshot yet.");
} else {
  const positions = [
    { ticker: 'QQQ', price: latest.qqq, shares: latest.qqq_shares, low: 35, high: 45 },
    { ticker: 'SMH', price: latest.smh, shares: latest.smh_shares, low: 10, high: 15 },
    { ticker: 'VXUS', price: latest.vxus, shares: latest.vxus_shares, low: 10, high: 15 },
    { ticker: 'XBI', price: latest.xbi, shares: latest.xbi_shares, low: 10, high: 15 },
  ].filter(p => p.price && p.shares);

  const total = positions.reduce((s, p) => s + p.price * p.shares, 0);

  const rows = positions.map(p => {
    const val = p.price * p.shares;
    const pct = +((val / total) * 100).toFixed(1);
    const inRange = pct >= p.low && pct <= p.high;
    const status = pct > p.high ? '🔴 over' : pct < p.low ? '🟡 under' : '✅';
    return [p.ticker, `${pct}%`, `${p.low}-${p.high}%`, status];
  });

  // Concentration check
  const qqq = positions.find(p => p.ticker === 'QQQ');
  const smh = positions.find(p => p.ticker === 'SMH');
  if (qqq && smh) {
    const combined = +((((qqq.price * qqq.shares) + (smh.price * smh.shares)) / total) * 100).toFixed(1);
    if (combined > 50) {
      dv.callout('warning', `QQQ + SMH combined: **${combined}%** — above 50% threshold. Portfolio behaves as leveraged tech bet.`);
    }
  }

  dv.table(['Ticker', 'Current', 'Target range', 'Status'], rows);
}
```

---

## 📆 Recent snapshots (last 14 days)

```dataview
TABLE WITHOUT ID
  file.link AS "Date",
  qqq AS "QQQ",
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
