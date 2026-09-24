---
tags:
  - quick
  - x2
Follow up:
---

---
### 🧠 Note

Updating the agentic system to be fully CLI. These are the steps it does:

# CLI Workflow: Detailed Agent Execution Flow

## Overview

The CLI workflow runs a 3-phase agentic system: Phase A (Understand & Gather), Phase B (Generate & Score), and Phase C (Govern & Finalize). Optimizations are enabled by default (parallel execution, caching, deduplication disabled).

---

## PHASE A: UNDERSTAND & GATHER

### Step 1: A1 - Indication Ingestor

- Purpose: Analyzes the indication and maps to ontologies
- Input: indication, subtype, clinical_context, sex, population, time_horizon
- Output: results["a1"] (IndicationSpec with normalized terms, phenotype, population, constraints)
- Timing: Sequential (must complete before Phase A parallel execution)

### Step 2: Market Research - Dosage Form Recommendation (A20)

- Purpose: Recommends optimal dosage form based on market research
- Agent: A20 (Market Analyzer) - recommend_dosage_form()
- Input: indication (from A1), population_profile, product_line, mechanisms (if available), region
- Output: results["dosage_form_recommendation"] with recommended form and rationale
- Constraints:
	- Pediatric: beverage, gummy, or powder_packet (no capsules)
	- Elderly: favors easy-to-swallow forms
	- Result: Overrides inputs["dosage_form"] with recommended form
- Timing: After A1, before Phase A parallel execution

### Step 3: Phase A Parallel Execution (Optimized Path)

If enable_optimizations=True (default):

#### 3a. A2 & A14 run in parallel

- A2 (Metabolic Profiler) - profile()
- Input: indication_spec (A1), labs (optional)
- Output: results["a2"] (metabolic profile with pathways, analytes, tags)
- A14 (Dose Priors Miner) - mine_priors()
- Input: category, dosage_forms, ingredients_of_interest, data_sources
- Output: results["a14"] (dose priors report with ingredient dose evidence)
- Runs in parallel with A2 (both depend only on A1)

#### 3b. A3 runs after A2 completes

- A3 (Mechanism Mapper) - map_mechanisms()
- Input: metabolic_profile (A2), max_mechanisms
- Output: results["a3"] (mechanism set with mechanism IDs, labels, pathways)
- Sequential dependency: Requires A2 output

#### 3c. Evidence Index Assembly

- Function: build_evidence_index()
- Input: A2, A3, A14 outputs
- Output: results["evidence_index"] (synthesized artifact bundling all Phase A evidence)

If enable_optimizations=False:

- A2 → A3 → A14 (sequential)

Phase A Outputs:

- results["a1"] - Indication spec
- results["a2"] - Metabolic profile
- results["a3"] - Mechanism set
- results["a14"] - Dose priors
- results["evidence_index"] - Synthesized evidence bundle
- results["dosage_form_recommendation"] - Market-driven form recommendation

---

## PHASE B: GENERATE & SCORE

### Step 1: A4 - Formulation Designer

- Purpose: Creates base formulation from mechanisms
- Method: design_formulation()
- Input: indication_spec (A1), mechanism_set (A3), evidence_index, dose_priors (A14), time_horizon, dosage_form
- Output: results["a4"] (FormulationProposal with constituents, doses, regimen, coverage)

- Key features:
	- Maps mechanisms → constituents
	- Ensures mechanism coverage
	- Minimizes redundancy
	- Adapts to time horizon and population

### Step 2: A17 - Competition Assessor

- Purpose: Assesses competitive landscape
- Method: assess_competition()
- Input: formulation (A4), mechanism_set (A3), dosage_form
- Output: results["a17"] (competition report with market positioning, differentiation)
- Timing: After A4, before A10 (so variants can use competition data)

### Step 3: A10 - Variant Generator

- Purpose: Generates formulation variants from base
- Method: generate_variants()
- Input: base_formulation (A4), num_variants, objectives (efficacy/safety/simplicity/cost weights), competition_report (A17)
- Output: results["a10"] (VariantSet with ranked variants, comparison, best_variant)
- Timeout: 300 seconds (5 minutes) by default, configurable via A10_VARIANT_TIMEOUT_SECONDS

- Key features:
	- Produces N distinct variants (default 3)
	- Each variant has different constituents or doses
	- Scores variants on multi-objective criteria
	- Uses competition data for differentiation

### Step 4: Candidate Set Assembly

- Function: build_candidate_set()
- Input: A4 (base formulation), A10 (variants)
- Output: results["candidate_set"] (list of candidates: base + variants)

### Step 5: Gate #1 - Shortlist

- Function: gate1_shortlist()
- Input: candidate_set, scorecards, k (number to shortlist), diversity_constraint
- Output: results["gate1"] (shortlist result with shortlisted_ids)
- Result: results["shortlisted_candidates"] (filtered candidate list)

Phase B Outputs:
- results["a4"] - Base formulation
- results["a17"] - Competition assessment
- results["a10"] - Variant set
- results["candidate_set"] - All candidates
- results["gate1"] - Shortlist gate result
- results["shortlisted_candidates"] - Top candidates

---

## PHASE C: GOVERN & FINALIZE

### Step 1: A15 - Feasibility Assessment (on all shortlisted candidates)

- Purpose: Assesses manufacturing, cost, and taste feasibility
- Method: assess_feasibility()
- Execution: Parallel across all shortlisted candidates

- For each candidate:
	1. A13 (Dose Policy Enforcer) - enforce_policy()
		- Input: candidate_formulation, policy (non_rx, dose_policy), dosage_form
		- Output: a13_result with adjusted_formulation (doses adjusted to policy limits)
	2. A15 (Form Feasibility Assessor) - assess_feasibility()
		- Input: adjusted_formulation (from A13), dosage_form, target_cogs, taste_preferences, competition_report
		- Output: a15_result (feasibility report with manufacturing, cost, taste analysis)

- Output:
	- feasibility_reports[candidate_id] - Feasibility per candidate
	- candidate_phase_c_results[candidate_id] - A13 + A15 results per candidate
	- results["a13"] - Primary candidate's A13 result
	- results["a15"] - Primary candidate's A15 result
	- finalized_formulation - Primary candidate's A13-adjusted formulation

### Step 2: A4 - Finalize Formulation (Plausibility Validation)

- Purpose: Cleans and validates formulation for plausibility
- Method: finalize_formulation()

- Input: indication_spec (A1), mechanism_set (A3), evidence_index, dose_priors (A14), formulation (A13-adjusted), time_horizon, dosage_form, optional: critic, validation_report, population_profile

- Output: results["formulation_finalization"] with:
	- plausibility_score (1-10, target 7-10)
	- final_formulation (cleaned formulation with pruned ingredients)
	- justification (3-5 sentence rationale)
	- risk_rationale (1-paragraph risk assessment)

- Filters applied:
	1. Mechanistic Coherence - Removes ingredients without clear causal pathways
	2. Human Evidence Priority - Prefers RCT data over animal/mechanism-only
	3. Dose & Form-Factor Reality - Ensures doses are physically deliverable
	4. Adaptation Safety - Avoids interventions that blunt beneficial adaptation

- Result: finalized_formulation updated to cleaned version (if available)

### Step 3: Phase C Parallel Execution (A7, A16)

If enable_optimizations=True:

#### 3a. A7 & A16 run in parallel

- A7 (Dosing & Safety Planner) - plan_dosing()

- Input: formulation_proposal (finalized_formulation), population

- Output: results["a7"] (dosing plan with schedule, safety analysis)

- A16 (Supplement Facts Synthesizer) - synthesize_label()

- Input: formulation (finalized_formulation), dosage_form, servings_per_container

- Output: results["a16"] (supplement facts label with claims, warnings)

If enable_optimizations=False:

- A7 → A16 (sequential)

### Step 4: A11 - BOM/Costing

- Purpose: Generates bill of materials and cost estimates

- Method: build_bom()

- Input: from_formulation (finalized_formulation), batch_size_kg, sourcing_region

- Output: results["a11"] (BOM report with cost breakdown, unit costs, sensitivity analysis)

- Timing: After A7, A16 (uses finalized formulation)

### Step 5: Gate #2 - Safety & Claims

- Function: gate2_safety_claims()

- Input: candidates, safety_reports (A7 + A13 + A15), claims_bundles (A16)

- Output: results["gate2"] (gate result with status: block|revise|advise|clear)

- Purpose: Evaluates safety compliance and claims validity

### Step 6: A4 - Formulation Rationale (Summary)

- Purpose: Explains why this formulation was selected

- Method: summarize_preferred_formulation()

- Input: condition, dosage_form, primary_candidate (finalized_formulation), scorecard, feasibility (A15), mechanisms

- Output: results["preferred_formulation_view"] with:

- summary (1-2 sentence rationale)

- angle (positioning label, e.g., "mitochondrial-forward", "low-pill-burden")

- Timing: Right after Gate #2, before Decision Packet

### Step 7: Gate #3 - Red-team Audit (A9)

- Purpose: Cross-agent audit and risk assessment

- Agent: A9 (QA & Conflicts) - audit()

- Input: indication_spec (A1), evidence_index, candidate, safety_report (A13 + A15), market_analysis (A20)

- Output: results["a9_redteam"] (red-team reports per candidate)

- Function: gate3_red_team()

- Output: results["gate3"] (gate result with severity_score, status, risk_band, blocking_issues)

- Timing: After Gate #2 and formulation summary

### Step 8: Decision Packet Assembly

- Function: build_decision_packet()

- Input: exec_context (A1), evidence_index, candidate, scorecard, safety_report, claims_bundle (A16), study_blueprints (A8 - None), bom (A11), feasibility (A15)

- Output: results["decision_packet"] (synthesized decision packet with all artifacts)

### Step 9: A5 - Scientific Memo Composer

- Purpose: Composes scientific memo from all artifacts

- Method: compose()

- Input: indication_spec (A1), metabolic_profile (A2), mechanism_set (A3), formulation_proposal (A4), dosing_safety (A7), biomarker_study (A8 - None), template, policy

- Output: results["a5"] and results["a5_memo"] (scientific memo document)

- Status: Best-effort, non-blocking (won't fail workflow if it errors)

- Timing: After Decision Packet, before SPRD

### Step 10: SPRDWriter - Supplement Product Requirements Document

- Purpose: Generates comprehensive SPRD document
- Method: write_sprd()
- Input: All artifacts (A1-A16, A20, A15, A11, dosage_form_recommendation)
- Output: results["sprd_document"] (complete SPRD)
- Status: Critical (errors logged but don't fail workflow)
- Timing: Final step of Phase C

Phase C Outputs:
- results["a13"] - Dose policy enforcement (per candidate)
- results["a15"] - Feasibility assessment (per candidate)
- results["formulation_finalization"] - Plausibility validation
- results["a7"] - Dosing plan
- results["a16"] - Supplement facts label
- results["a11"] - BOM and costing
- results["gate2"] - Safety & claims gate
- results["preferred_formulation_view"] - Formulation rationale
- results["gate3"] - Red-team audit gate
- results["a9_redteam"] - Red-team reports
- results["decision_packet"] - Complete decision packet
- results["a5"] / results["a5_memo"] - Scientific memo
- results["sprd_document"] - SPRD document

---

## Complete Agent Execution Summary

### Phase A (Understand & Gather)

1. A1 - Indication Ingestor
2. A20 - Market Analyzer (dosage form recommendation)
3. A2 - Metabolic Profiler (parallel with A14)
4. A14 - Dose Priors Miner (parallel with A2)
5. A3 - Mechanism Mapper (after A2)
6. Evidence Index Assembly

### Phase B (Generate & Score)

1. A4 - Formulation Designer (design_formulation)
2. A17 - Competition Assessor
3. A10 - Variant Generator
4. Candidate Set Assembly
5. Gate #1 - Shortlist

### Phase C (Govern & Finalize)

1. A15 - Feasibility Assessor (on all shortlisted, includes A13)
	- A13 - Dose Policy Enforcer (within A15 processing)
2. A4 - Formulation Finalizer (finalize_formulation - plausibility check)
3. A7 - Dosing Planner (parallel with A16)
4. A16 - Supplement Facts Synthesizer (parallel with A7)
5. A11 - BOM/Costing Builder
6. Gate #2 - Safety & Claims
7. A4 - Formulation Rationale (summarize_preferred_formulation)
8. Gate #3 - Red-team Audit (A9)
9. Decision Packet Assembly
10. A5 - Scientific Memo Composer
11. SPRDWriter - SPRD Document Generator

---

## Optimizations Enabled by Default

1. Parallel execution:
	- Phase A: A2 and A14 in parallel
	- Phase C: A7 and A16 in parallel
	- A15: All shortlisted candidates processed in parallel
	- A9: Red-team audits in parallel
2. Caching:
	- All agent calls use call_agent_with_cache() with namespace-based caching
	- Cache hits reduce redundant LLM calls
3. Deduplication:
	- Currently disabled by default (requires async/threading for proper implementation)
	- Framework in place for future enhancement

---

## Total Agents Executed: 12 Core + 1 Writer

Core Agents: A1, A2, A3, A4 (3 methods), A5, A7, A9, A10, A11, A13, A14, A15, A16, A17, A20

Writer: SPRDWriter

Note: A4 is used 3 times:

1. design_formulation (Phase B)

2. finalize_formulation (Phase C - plausibility check)

3. summarize_preferred_formulation (Phase C - rationale)

This workflow produces a validated, documented formulation ready for manufacturing and regulatory review.