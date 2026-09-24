---
tags:
  - x2
  - explorations
  - ai
  - compbio
Follow up:
---

---
### 🧠 Note

#mhamill shared some papers with #rafeyan #lmaiorino and I that I tried to incorporate into the agentic system. I did it with the help of ChatGPT, which recommended a new orchestration for the AI:

# Orchestration Plan – Clean Parallel DAG (v1.0)

> A simple, fast, bias-aware orchestration for the updated agentic system. Designed for Streamlit. A5 and A12 are removed.

---

## TL;DR

Three phases with three gates. Parallelize everything before gates. Prune early and cheaply. Keep outputs audit-ready and Streamlit-friendly.

- **Phase A. Understand & Gather.** Intake → Retrieval → Mapping. Parallel.
    
- **Phase B. Generate & Score.** Create candidates → Build evidence graph → Score. Parallel. Gate #1: Shortlist.
    
- **Phase C. Govern & Finalize.** Safety → Claims → Study design → Packet. Parallel where possible. Gate #2: Safety/Claims. Gate #3: Final.
    

---

## Minimal Agent Set (A5, A12 removed)

- **A1** Intake & Normalization
    
- **1A** Evidence Retrieval (sharded)
    
- **1B** Biomarker Prioritizer
    
- **1C** Mechanism Mapper
    
- **2A** Ingredient Retriever
    
- **2B** Formulation Designer (includes dose logic that A5 used to do)
    
- **2C** Feasibility Pre‑Filter
    
- **A6** Evidence Graph Builder
    
- **Scorer** Evidence Scorer (with bias/contradiction checks)
    
- **A9** Safety & Interaction Gate (extended)
    
- **Claims** Regulatory & Claims Gate
    
- **A11** Study Designer (extended)
    
- **Packager** Memo/Decision Packet & Costing/BOM
    

---

## High‑Level DAG (ASCII)

```
A1 ───────────────────────────────────────────────────────────────┐
                                                                  │
1A ─┐                                                             │
1B ─┼──► reduce → Evidence Index/Cache ───────────────────────────┤
1C ─┘                                                             │
                                                                  │
2A ─┐                                                             │
2B ─┼──► Candidate Set ─► A6 Graph ─► Scorer ─► Gate #1 Shortlist ├─► survivors
2C ─┘                                                             │
                                                                  │
A9 ─┐                                                             │
Claims ─┘ ─► Gate #2 Safety/Claims ────────────────────────────────┤
                                                                  │
A11 (challenge + steady‑state) ─► Packager ─► Gate #3 Final ──────┘
```

---

## Phase A. Understand & Gather (parallel)

**A1 Intake & Normalization**

- Resolve indication → ontology. Capture population, jurisdiction, allergens, cost, form factor. Emit `ExecContext`.
    

**1A Evidence Retrieval (map)**

- Shard by biomarker, mechanism, ingredient class. Normalize trials. Write to `EvidenceIndex` cache.
    

**1B Biomarker Prioritizer (map)**

- Rank modifiable biomarkers using domain presets for endpoint proximity.
    

**1C Mechanism Mapper (map)**

- Map biomarkers → mechanisms/pathways. Deduplicate across shards.
    

**Reduce** merges shards into one `EvidenceIndex` keyed by endpoint class, design, population.

---

## Phase B. Generate & Score (parallel → Gate #1)

**2A Ingredient Retriever (map)**

- Pull actives per mechanism. Normalize names/forms.
    

**2B Formulation Designer**

- Compose stacks with compatibility checks and practical dose logic (absorbing old A5).
    

**2C Feasibility Pre‑Filter**

- Quick COGS, supply, stability, sensory filters. Drop weak stacks.
    

**A6 Evidence Graph Builder**

- Build typed edges: ingredient → mechanism → biomarker → outcome with citations.
    

**Evidence Scorer (with bias checks)**

- Compute composite score and factor contributions. Apply penalties for:
    
    - Negative/null RCTs or conflicting meta‑analyses.
        
    - Publication bias signals and missing registrations.
        
    - Weak surrogates, dose/form mismatches, population mismatch.
        
- Emit `Scorecard` with drivers, gaps, diversity report.
    

**Gate #1: Shortlist**

- Select top‑K candidates by score with diversity constraint across mechanisms/populations. Allow one wildcard.
    

---

## Phase C. Govern & Finalize (parallel where possible)

**A9 Safety & Interaction Gate**

- ULs, cumulative exposure, life‑stage rules, drug–nutrient and nutrient–nutrient interactions, allergens, contaminants, form bioavailability adjustments. Output `block|revise|advise|clear` + label flags.
    

**Claims Gate**

- Classify claim type, block disease terms, generate jurisdiction‑specific structure–function claims. Map each claim to evidence. Output claim tier and required disclaimers.
    

**Gate #2: Safety/Claims**

- Eliminate `block`. For `revise`, trigger a bounded re‑spin to Phase B with explicit constraints. Limit to one re‑spin per candidate.
    

**A11 Study Designer (parallel per candidate)**

- Emit two blueprints per survivor:
    
    - **Challenge‑test** variant for proximal physiology.
        
    - **Steady‑state RCT** variant for real‑world use.
        
- Include endpoints aligned with approved claims, sample‑size BOTE, analysis shells, ops notes.
    

**Packager (Memo/Packet & Costing/BOM)**

- Assemble Scorecard, SafetyReport, ClaimsBundle, StudyBlueprints, and BOM/COGS into a `DecisionPacket`.
    

**Gate #3: Final**

- Go/Revise/Kill. If Revise, loop to Phase B with constraints and log rationale.
    

---

## Parallelization & Caching Cheatsheet

|Stage|Parallel Unit|Cache Key|
|---|---|---|
|1A Retrieval|biomarker/mechanism/ingredient class|(entity, endpoint class, design, population)|
|1B Biomarkers|biomarker|(indication, domain)|
|1C Mechanisms|mechanism|(biomarker, pathway)|
|2A Ingredients|mechanism|(normalized ingredient, form)|
|2B Formulation|mechanism cluster|(stack hash)|
|Scorer|candidate|(stack hash, evidence graph hash)|
|A9 / Claims|candidate|(stack hash, jurisdiction)|
|A11|candidate × study mode|(stack hash, claim set)|

---

## Bias & Quality Controls

- **Scorer**: contradiction and publication‑bias penalties. Surrogate validity weighting. Population‑fit scoring.
    
- **Claims**: jurisdictional lexicons block disease language. Evidence tiering tied to trial strength.
    
- **Diversity at Gate #1**: enforce mechanism/population coverage to avoid monoculture stacks.
    
- **Telemetry**: log drop reasons at each gate for learning.
    

---

## Streamlit UX (pragmatic)

- **Top progress bar**: A, B, C phases with three gates. Badges: pass/advise/revise/block.
    
- **Left sidebar**: live constraints. Changing a field triggers targeted re‑runs only of impacted phases.
    
- **Main grid**: candidate cards with score, key drivers, claim preview, safety badge. Inline actions: swap ingredient, adjust dose, drop.
    
- **Evidence drawer**: click to expand citations, endpoints, effect sizes, and claim substantiation.
    
- **One‑click export**: DecisionPacket JSON/PDF.
    

---

## Data Artifacts (between agents)

- `ExecContext` (A1)
    
- `EvidenceIndex` (Phase A reduce)
    
- `CandidateSet` (2B/2C)
    
- `GraphBundle` (A6)
    
- `Scorecard` (Scorer)
    
- `SafetyReport` (A9)
    
- `ClaimsBundle` (Claims)
    
- `StudyBlueprints` (A11)
    
- `DecisionPacket` (Packager)
    

---

## Error Handling

- All agents validate schema and return structured errors with actionable hints.
    
- Slow shards soft‑fail and return cached results marked `stale=true`.
    
- Bounded re‑spins prevent infinite loops.
    

---

## Defaults & Knobs

- Gate #1 **Top‑K**: 6–8 with ≥2 mechanism clusters.
    
- **Re‑spin budget** after Gate #2: 1 per candidate.
    
- **Fan‑out cap** per mechanism cluster: 20 stacks before scoring.
    

---

## Why this layout

It accelerates ideation through parallel retrieval and generation. It enforces rigor with two governance gates. It keeps Streamlit snappy through shard‑level caching and targeted re‑runs. And it removes A5 and A12 without losing dosing logic (now inside 2B) or red‑team functionality (captured by bias checks in the Scorer and claim substantiation rules).