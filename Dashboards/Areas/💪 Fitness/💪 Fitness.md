---
type: area-home
area: fitness
tags: [area, fitness]
---

> [!tip] 💪 Fitness — area dashboard
> Body recomposition tracker. Workout notes live in `Notes/Logs/YYYY-MM-DD workout.md` — Max pre-creates them daily, Diogo fills them in. Target: 170 lbs.

---

## 🎯 Progress to goal

```dataviewjs
const pages = dv.pages('"Notes/Logs"')
  .where(p => p.type === "workout" && p.weight_lbs)
  .sort(p => p.date, 'asc');

const start = 199.1;
const target = 170;
const latest = pages.last();
const current = latest ? latest.weight_lbs : start;
const lost = +(start - current).toFixed(1);
const toGo = +(current - target).toFixed(1);
const totalToLose = start - target;
const pct = Math.round((lost / totalToLose) * 100);
const weeksElapsed = pages.length > 0 ? Math.round((pages.length) / 6) : 0;
const pace = pages.length > 1
  ? +((start - current) / (pages.length / 7)).toFixed(2)
  : null;
const weeksToGoal = pace && pace > 0 ? Math.round(toGo / pace) : null;

dv.paragraph(
  `**Current:** ${current} lbs | **Lost:** ${lost} lbs | **To go:** ${toGo} lbs\n\n` +
  `**Progress:** ${pct}% of 29.1 lbs to lose` +
  (pace !== null ? ` | **Pace:** ${pace} lbs/wk` : '') +
  (weeksToGoal !== null ? ` | **ETA:** ~${weeksToGoal} weeks` : '')
);
```

---

## 📈 Weight trend

```dataviewjs
const pages = dv.pages('"Notes/Logs"')
  .where(p => p.type === "workout" && p.weight_lbs)
  .sort(p => p.date, 'asc')
  .slice(-42);

if (pages.length < 2) {
  dv.paragraph("Not enough data yet — log a few days first.");
} else {
  const labels = pages.map(p => String(p.date).slice(5)).array();
  const data = pages.map(p => p.weight_lbs).array();
  const target = Array(labels.length).fill(170);

  const chartData = {
    type: 'line',
    data: {
      labels,
      datasets: [
        {
          label: 'Weight (lbs)',
          data,
          borderColor: 'rgba(99, 102, 241, 1)',
          backgroundColor: 'rgba(99, 102, 241, 0.1)',
          borderWidth: 2,
          tension: 0.3,
          fill: true,
          pointRadius: 3,
        },
        {
          label: 'Target (170 lbs)',
          data: target,
          borderColor: 'rgba(239, 68, 68, 0.55)',
          borderDash: [6, 4],
          borderWidth: 1.5,
          pointRadius: 0,
          fill: false,
        }
      ]
    },
    options: {
      scales: {
        y: { min: 165, max: 205, title: { display: true, text: 'lbs' } }
      },
      plugins: { legend: { display: true } }
    }
  };

  window.renderChart(chartData, this.container);
}
```

---

## 💓 HRV trend (last 14 days)

```dataviewjs
const pages = dv.pages('"Notes/Logs"')
  .where(p => p.type === "workout" && p.hrv_ms)
  .sort(p => p.date, 'asc')
  .slice(-14);

if (pages.length < 2) {
  dv.paragraph("Not enough HRV data yet.");
} else {
  const labels = pages.map(p => String(p.date).slice(5)).array();
  const hrv = pages.map(p => p.hrv_ms).array();
  const baseline = Array(labels.length).fill(22);

  const chartData = {
    type: 'line',
    data: {
      labels,
      datasets: [
        {
          label: 'HRV (ms)',
          data: hrv,
          borderColor: 'rgba(16, 185, 129, 1)',
          backgroundColor: 'rgba(16, 185, 129, 0.1)',
          borderWidth: 2,
          tension: 0.3,
          fill: true,
          pointRadius: 3,
        },
        {
          label: 'Baseline (22ms)',
          data: baseline,
          borderColor: 'rgba(239, 68, 68, 0.5)',
          borderDash: [6, 4],
          borderWidth: 1.5,
          pointRadius: 0,
          fill: false,
        }
      ]
    }
  };

  window.renderChart(chartData, this.container);
}
```

---

## 📅 This week

```dataviewjs
const today = dv.date('today');
const weekStart = today.startOf('week').plus({days: 1}); // Monday
const sessions = dv.pages('"Notes/Logs"')
  .where(p => p.type === "workout" && p.date >= weekStart && p.session_type && p.session_type !== "rest");

const planned = 6;
const done = sessions.length;
const byType = { strength: 0, run: 0, hiit: 0 };
sessions.forEach(p => { if (byType[p.session_type] !== undefined) byType[p.session_type]++; });

const calPages = sessions.where(p => p.calories_total);
const avgCal = calPages.length > 0
  ? Math.round(calPages.map(p => p.calories_total).array().reduce((a,b) => a+b,0) / calPages.length)
  : null;
const proPages = sessions.where(p => p.protein_g);
const avgPro = proPages.length > 0
  ? Math.round(proPages.map(p => p.protein_g).array().reduce((a,b) => a+b,0) / proPages.length)
  : null;

dv.paragraph(
  `**Sessions this week:** ${done}/${planned} | Strength: ${byType.strength} | Run: ${byType.run} | HIIT: ${byType.hiit}\n\n` +
  (avgCal !== null ? `**Avg calories:** ${avgCal} / 2,200` : 'Calories: not logged') +
  (avgPro !== null ? ` | **Avg protein:** ${avgPro}g / 195g` : '')
);
```

---

## 🗂 Recent sessions (last 14 days)

```dataview
TABLE WITHOUT ID
  file.link AS "Day",
  session_type AS "Type",
  trainer AS "Trainer",
  duration_min AS "Min",
  weight_lbs AS "Weight",
  calories_total AS "Cal",
  protein_g AS "Pro (g)",
  recovery_pct AS "Rec%",
  hrv_ms AS "HRV",
  strain AS "Strain"
FROM "Notes/Logs"
WHERE type = "workout"
SORT date DESC
LIMIT 14
```

---

## 🥗 Nutrition targets

- **BMR:** 2,002 cal/day
- **Daily target:** 2,200 cal/day
- **Protein target:** ~195g/day (training) / ~189g (rest)
- **Tracker:** LoseIt (manual entry — no live MCP)

---

## 🔗 Apps

- **iFit** — strength (Casey Gilbert, John Peel) + HIIT (F45 series)
- **Whoop** — recovery / HRV / strain
- **LoseIt** — calorie + macro tracking
- [[Home|↩ back to Home]]
