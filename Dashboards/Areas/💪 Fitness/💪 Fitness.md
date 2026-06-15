---
type: area
area: fitness
tags: [area, fitness]
---

> [!tip] 💪 Fitness — area dashboard
> Body recomposition + iFIT + Whoop recovery. Pulled from Whoop manually (paste Candy's morning summary). Source-of-truth for body comp + workouts + recovery is here.

---

## 📊 At a glance

> [!note] Latest Whoop snapshot
> ```dataview
> TABLE WITHOUT ID
>   file.link as "Day",
>   date as "Date",
>   recovery as "Recovery",
>   hrv as "HRV (ms)",
>   sleep_score as "Sleep",
>   strain as "Strain"
> FROM "Notes"
> WHERE type = "whoop-daily"
> SORT date DESC
> LIMIT 1
> ```

---

## 🌅 Whoop daily log

```dataview
TABLE WITHOUT ID
  date as "Date",
  recovery as "Recovery",
  hrv as "HRV",
  sleep_score as "Sleep",
  strain as "Strain",
  note as "Note"
FROM "Notes"
WHERE type = "whoop-daily"
SORT date DESC
LIMIT 14
```

```button
name ➕ New Whoop entry
type note(stub, false)
action whoop-daily
templater true
```

---

## 🏋️ Workouts

```dataview
TABLE WITHOUT ID
  date as "Date",
  workout as "Workout",
  duration_min as "Min",
  feel as "Feel"
FROM "Notes"
WHERE type = "workout"
SORT date DESC
LIMIT 14
```

```button
name ➕ Log workout
type note(stub, false)
action workout
templater true
```

---

## 📉 Body recomposition

```dataview
TABLE WITHOUT ID
  date as "Date",
  weight_lb as "Weight (lb)",
  body_fat_pct as "BF%",
  waist_in as "Waist (in)",
  note as "Note"
FROM "Notes"
WHERE type = "body-recomp"
SORT date DESC
LIMIT 12
```

```button
name ➕ Weekly weigh-in
type note(stub, false)
action body-recomp
templater true
```

---

## 🥗 Nutrition targets

- Daily calorie target:
- Protein target (g):
- Carbs target (g):
- Fats target (g):
- Cadence:

> Update from Candy's programming. Reflect any changes in LoseIt.

---

## 🎯 Active goals

- [ ] Goal 1:
- [ ] Goal 2:
- [ ] Goal 3:

---

## 🔗 External

- Whoop app — source of HRV/sleep/strain
- iFIT app — workouts
- LoseIt — nutrition logging
- [[Home|↩ back to Home]]
