---
Follow up:
tags:
  - 1v1
  - jiangchuan
  - jye
---

# 2026-10-07 [[Jiangchuan Ye]] <> Diogo

← [[Notes/People/Jiangchuan Ye|All notes: Jiangchuan Ye]]

## ✅ Open tasks (Todoist)

> Tag tasks `@jye` in Todoist to surface them here.

```todoist
name: Jiangchuan Ye
filter: "@jye"
sorting:
  - priority
  - date
```

## 📋 Previous notes

```dataview
LIST WITHOUT ID file.link
FROM "Notes/Meetings"
WHERE contains(file.name, "Jiangchuan")
SORT file.name DESC
LIMIT 5
```

---

## 📋 Carryover from prior 1:1

**From [[2026-10-01 Jiangchuan <> Diogo]] (5 days ago):**
### Open items
_No unchecked checkboxes in the prior note._
### Open questions / follow-ups
- Solubility follow-up (ESM fine tuning, other model training): status still outstanding per [[2026-10-05 comp team digest]]
- Caco-2 oral bioavailability data (62 points): are the results available to test models?
- GFRAL second series: no data yet; GFRAL benchmarking is being analyzed
- Cradle: continue model development pending the chargeback negotiation

## 🎯 Goals
-

## 📋 Their agenda items
-

## ✍️ Notes & discussion
- Solubility: organizing meeting with Chem team
	- cycles 472 + 476
	- use public models to do inference to see if we can catch liabilities on solubility
	- use internal model for inference (high confidence on GFRAL but not so much on FOLR1 or IL7RA)
	- want to see if there is sequence liability that is ties to solubility
	- want to use PLM (ESM-c) to see if there are evolutionary correlations between solubility and sequence

- Oral bioavailability
	- sent Martin handpicked candidates
	- experiment takes a long time, but Jiangchuan is keeping engaged
	- team also working in vitro Caco-2 data that could be use to give insights into bioavailability

- MOTS-c
	- doing 2 cycles next week (which corresponds to ~90 compounds)
	- MOTS-c specific solubility model
	- designs will be filtered based on solubility

- DPO
	- Model similar to what Cradle uses? 
	- another approach that Cradle uses is tuning their Evo model

## ❓ Open questions
- DPO model (Cradle-like / Evo tuning) is Jiangchuan's; he will report progress to the team in 1–2 weeks

## 📝 Relationship notes
-
