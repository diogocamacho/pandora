---
tags:
  - x2
  - ai
  - explorations
Follow up:
---


---
## 🧠 Note

The next step in the process is defining how many agents we want to build the memos ([[2025-10-31 Understanding a memo]]). I again asked #gpt to help me with this:

Here’s a crisp way to think about it: design the system in tiers so you can ship fast, then “snap on” depth without rewiring everything. I’ll give you three options—each with clear inputs/outputs, where they sit in Shiny, and what they optimize.

# Tier 1 — Minimal Viable Intelligence (5 agents)

Purpose: generate a coherent Axcella-style memo end-to-end with human-in-the-loop edits.

1. Indication Ingestor
	- Input: disease, subtype, constraints, uploaded notes.
	- Output: normalized spec (JSON), ontology tags.
	- Shiny: Home/Templates page.
	- KPI: coverage of required fields; ontology match rate.

2. Metabolic Profiler
	- Input: spec + any lab/marker entries.
	- Output: dysregulated pathways + concise “why it matters” bullets.
	- Shiny: Biology page.
	- KPI: number of distinct, non-overlapping mechanisms suggested.

3. Mechanism Mapper
	- Input: profile summary.
	- Output: ≤3 ranked biological levers (each with 1-line rationale).
	- Shiny: Biology page (mechanism cards).
	- KPI: redundancy score (lower is better).

4. Formulation Designer
	- Input: mechanisms.
	- Output: constituents with dose bands (min/rec/max), regimen, rationale.
	- Shiny: Formulation page (editable table + sliders).
	- KPI: dose sanity checks passed; formulation simplicity index.    

5. Memo Composer
	- Input: full spec + evidence links.
	- Output: Markdown/DOCX memo; exportable JSON.
	- Shiny: Export page.
	- KPI: completeness vs required memo sections.

Why 5? It cleanly mirrors how the memos are built (biology → mechanisms → constituents → write-up) and is small enough to be reliable on day one.

# 🚀 Tier 2 — Production-Grade (8 agents)

Adds evidence discipline, clinical planning, and automated QA. This is the sweet spot for most teams.

6. Evidence Linker
	- Input: all claims from 2–5.
	- Output: claim→citation map with provenance.
	- Shiny: Evidence page (data table, “bind to paragraph”).
	- KPI: citation coverage %, uniqueness of sources.

7. Dosing & Safety Planner
	- Input: constituents + constraints (renal, hepatic, pediatrics).
	- Output: regimen by schedule (QD/BID/TID), special-day logic, safety notes.
	- Shiny: Formulation page (safety banner).
	- KPI: safety rule violations (should be zero); adherence feasibility score.

8. Biomarker & Study Designer
	- Input: mechanisms + indication norms.
	- Output: short/medium/long biomarkers, study duration, target population.
	- Shiny: Clinical Plan page (drag-and-drop lanes).
	- KPI: readout timing alignment score.

# Tier 3 — Research-Grade (12 agents)

For teams who want auto-critique, scenario planning, and procurement outputs.

9. QA & Conflicts Auditor
	- Input: entire draft spec.
	- Output: flagged issues (dose caps, mechanism conflicts, PK clashes), fixes.
	- Shiny: QA page (checklist with “apply fix”).
	- KPI: open issues count; auto-resolution rate.

10. Variant Generator
	- Input: locked mechanisms or constraints (e.g., sugar-free, dialysis-day).
	- Output: N alternative formulations ranked by expected utility.
	- Shiny: Formulation page (“Generate variants”).
	- KPI: pareto diversity (dose/rationale diversity without safety hits).

11. Costing & BOM Builder
	- Input: final constituents + suppliers.
	- Output: bill of materials, COGS estimate, sensitivity table.
	- Shiny: Export page (download CSV).
	- KPI: COGS within target band.

12. Study Synopsis Formatter
	- Input: Biomarker & Study outputs.
	- Output: one-page protocol synopsis (objectives, endpoints, schedule).
	- Shiny: Export page (separate PDF/DOCX).
	- KPI: protocol completeness score.

# Orchestration (how the pieces talk)

- Default DAG: Ingestor → Profiler → Mapper → Formulation → (Dosing/Safety) → (Biomarkers/Study) → Evidence → QA → Composer → Exporters.
- Controller: one “Conductor” R6 object (or plumber API) that exposes `run(stage, spec)`; each agent is a pure function over JSON.
- Caching: memoized agent outputs keyed by `hash(spec_subset)` to keep the app snappy.
- Failure strategy: every agent returns `{result, warnings, errors, trace}`; UI surfaces warnings inline and never blocks edits.

# Choosing a number

- Ship fast? **Tier 1 (5 agents)** gets you live memo generation and editable outputs.
- Balanced depth? **Tier 2 (8 agents)** is the pragmatic default for serious users.
- Heavy-duty R&D? **Tier 3 (12 agents)** adds critique, alternatives, and procurement/readiness.

# Where this fits in Shiny

- Each agent has a matching module; each module writes to a single reactive `rv$spec` and a `rv$citations` table.
- Long-running agents execute via `future` + progress toasts; outputs replace placeholders in the UI.
- Exports (DOCX/JSON/CSV) come from `rv$spec` so the document and the machine-readable spec stay in lockstep.

# Guardrails and KPIs that actually matter

- Safety first: a hard ruleset the Formulation and Dosing agents must satisfy; they can propose, but cannot violate.
- Redundancy control: Mechanism Mapper penalizes overlapping mechanisms to keep formulations lean.
- Evidence hygiene: no claim in the memo can render without at least one bound citation; Composer refuses to compile missing references.
- Observability: log every agent call with input hash + output summary so you can compare variants quickly.

If you want a single answer: target **8 agents** for v1 production. It’s the smallest system that still behaves like a disciplined scientist and a practical product manager. Ready to lock a tier and I’ll sketch the exact R module interfaces and a stubbed repo layout next.



---
## ✅ Action Items
