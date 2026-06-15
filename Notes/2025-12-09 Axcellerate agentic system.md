---
tags:
  - quick
  - x2
Follow up:
---

---
### 🧠 Note


[[2025-12-10 Updated agentic workflow]]

## X2 Agentic System Overview

### System Architecture: 3-Phase DAG with Parallel Execution

The system uses a 3-phase DAG with async parallel execution (TaskGraph) and two governance gates. Launch/marketing agents (A20-A23) run separately after Phase C.

---

## PHASE A: Understand & Gather

Purpose: Normalize the indication and build an evidence foundation.

### A1 — Indication Ingestor

- Input: User indication (free text), subtype, clinical context, population, sex, time horizon

- Output: ExecContext artifact

- Normalized disease IDs (MONDO, SNOMED CT, UMLS, HPO)

- Population descriptors (pediatric/teen/adult/elderly)

- Clinical context tags

- Time horizon classification

- Ontology mappings for reproducibility

- Dependencies: None (entry point)

- Execution: Sequential (must complete before Phase A parallel fan-out)

### A2 — Metabolic Profiler (runs in parallel with A3, A14)

- Input: ExecContext from A1

- Output: MetabolicProfile (part of EvidenceIndex)

- Disease-specific metabolic dysregulation

- Pathway analysis (altered pathways, directionality)

- Analyte/biomarker summaries

- PubMed citations (cached via cache/pubmed/)

- ClinicalTrials.gov biomarker evidence

- Optional MetaboLights enrichment (if ENABLE_METABOLIGHTS set)

- Quality scores and confidence bands

- Dependencies: A1

- Execution: Parallel (Phase A fan-out)

### A3 — Mechanism Mapper (runs in parallel with A2, A14)

- Input: MetabolicProfile from A2, ExecContext from A1

- Output: MechanismSet (part of EvidenceIndex)

- Biological mechanisms mapped from pathways

- Mechanism-to-pathway associations

- Clinical evidence annotations

- Confidence scores per mechanism

- Mechanism weights (commonality vs uniqueness)

- ClinicalTrials.gov mechanism validation

- Dependencies: A1, A2

- Execution: Parallel (Phase A fan-out)

### A14 — Priors Miner (runs in parallel with A2, A3)

- Input: ExecContext from A1, ingredient vocabulary

- Output: DosePriors (part of EvidenceIndex)

- Dose priors from DSLD/DSID (40+ ingredients)

- ClinicalTrials.gov intervention doses

- Percentile envelopes (p10, p50, p90) per ingredient

- Evidence packages with PubMed citations

- Cached under cache/dsld/ (30-day TTL)

- Dependencies: A1

- Execution: Parallel (Phase A fan-out)

### A6 — Evidence Linker (optional, runs in parallel)

- Input: A2, A3, A14 outputs

- Output: EvidenceMap (GraphBundle)

- Links citations → mechanisms → analytes → constituents

- Claims coverage statistics

- Evidence provenance graph

- Dependencies: A2, A3, A14

- Execution: Parallel (Phase A fan-out)

### Phase A Synthesis: EvidenceIndex

- Function: build_evidence_index(a2_output, a3_output, a14_output, evidence_sources, evidence_map)
- Output: Unified EvidenceIndex artifact
- metabolic_profile: A2 output
- mechanisms: A3 output
- dose_priors: A14 output
- evidence_sources: Bundled PubMed/ClinicalTrials.gov packages
- evidence_map: A6 linking (if available)
- summary: Counts (pathways, mechanisms, priors)
- quality: Completeness flags
- external_sources: MetaboLights (if enabled)

---

## PHASE B: Generate & Score

Purpose: Design formulations and generate variants with scoring.

### A4 — Formulation Designer

- Input: EvidenceIndex, ExecContext, max_constituents, dosage_form, population_profile
- Output: FormulationBlueprint (base candidate)
- formulation_components: Constituents with dose bands (min/recommended/max g/day)
- formulation_clusters: Grouped by mechanistic role
- subsystem_coverage: Mechanism coverage metrics
- design_logic: Inclusion rationale per constituent
- Mechanism coverage prioritized using A3 weights
- Per-mechanism load caps (prevents pathway overload)
- Time-horizon-aware selection (acute vs chronic)
- Population-aware dosage forms (pediatric/elderly → beverages/powders)
- Dependencies: Phase A complete (EvidenceIndex)
- Execution: Sequential (after Phase A)

### A17 — Competition & Synergy Checker (runs in parallel with A4)

- Input: A4 formulation, data/ingredient_competition.csv
- Output: CompetitionReport
- Transporter/cofactor competition analysis
- Effective activity penalties per ingredient group
- Scheduling recommendations (temporal separation)
- Adjunct tweak suggestions
- NSF certification banned-substance flags (sport/pediatric)
- Dependencies: A4
- Execution: Parallel (Phase B fan-out)

### A10 — Variant Generator
- Input: A4 base formulation, objectives (efficacy/safety/simplicity/cost), variation policy
- Output: VariantSet
- variants: Array of alternative formulations (default: 10)
- Each variant includes:
- constituents: Modified ingredient list
- differences_from_base: Change log (added/removed/dose_modified)
- objective_scores: Per-variant scores (efficacy, safety, simplicity, cost, composite)
- comparison: Ranked variant comparison
- summary: Diversity score, average composite
- Dependencies: A4
- Execution: Sequential (after A4)

### A15 — Form Feasibility Analyzer (pre-filter, runs on all candidates)

- Input: Candidate formulations, dosage_form, population_profile
- Output: FeasibilityReport (per candidate)
- Taste/palatability scores (using data/taste_coeffs.csv)
- Manufacturability assessment
- Cost per unit estimates
- NSF certification warnings (sweetener limits, contaminant testing)
- overall_status: pass/warn/fail
- Dependencies: Candidates (A4 + A10)
- Execution: Parallel (per candidate, Phase B fan-out)

### Phase B Synthesis: CandidateSet + Scorecards

- Function: build_candidate_set(a4_output, a10_output)
- Output: CandidateSet (list of candidates)
- Base formulation (index 0, is_base: true)
- All variants from A10
- Each candidate has: id, label, constituents, metadata
- Scoring: score_candidate() function
- Composite score: efficacy × 0.4 + safety × 0.3 + simplicity × 0.2 + cost × 0.1
- Mechanism alignment (coverage ratio)
- Evidence stats (Monte Carlo robustness)
- Feasibility penalties from A15
- Output: Scorecards (parallel array to candidates)

### Gate #1: Shortlist

- Function: gate1_shortlist(candidates, scorecards, k=6, diversity_constraint=True)
- Logic:
- Rank by: coverage_weight × mechanism_coverage + (1 - coverage_weight) × composite_score - critic_penalty
- Diversity constraint: Novelty ratio (new constituents not yet covered)
- Keep top-K (default: 6) with diversity enforcement
- Output: Gate1Result
- shortlisted_ids: Top-K candidate IDs
- dropped_ids: Remaining candidates
- drop_reasons: Per-candidate drop rationale
- diagnostics: Ranking table, coverage stats, diversity metrics

---

---
## PHASE C: Govern & Finalize

Purpose: Safety validation, regulatory compliance, packaging, final export.

### A13 — Dose Policy Enforcer (runs in parallel with A7, A15)

- Input: Shortlisted candidates, config/dose_policies/ (non_rx_subtherapeutic.json, nsf_sport_229.json, nsf_pediatric_306.json)
- Output: PolicyReport (part of SafetyReport)
- Violations: Constituents exceeding ULs or policy limits
- Adjusted formulations: Dose reductions applied
- violations: Array with reduction_percent per constituent
- NSF certification checks (banned substances, contaminants, excipients)
- Dependencies: Shortlisted candidates
- Execution: Parallel (Phase C fan-out, per candidate)

### A7 — Dosing & Safety Planner (runs in parallel with A13, A15)

- Input: Shortlisted candidates, ExecContext (population), adjusted formulations from A13

- Output: DosingPlan (part of SafetyReport)

- Individualized dosing plan (splitting regimens over day)

- Age/sex/population adjustments

- Contraindication flags

- Safety rule checks (rules_passed: true/false)

- Serving descriptions

- Dependencies: Shortlisted candidates

- Execution: Parallel (Phase C fan-out, per candidate)

### A15 — Form Feasibility Analyzer (re-run in Phase C, per shortlisted candidate)

- Input: Shortlisted candidates (with A13 adjustments)

- Output: FeasibilityReport (refined, part of SafetyReport)

- Same structure as Phase B, but with policy-adjusted formulations

- Final feasibility status for Gate #2

- Dependencies: Shortlisted candidates, A13 adjustments

- Execution: Parallel (Phase C fan-out, per candidate)

### Phase C Synthesis: SafetyReport

- Function: Bundles A7 + A13 + A15 outputs

- Output: SafetyReport (per candidate)

- a7_dosing: Dosing plan and safety checks

- a13_policy: Policy violations and adjustments

- a15_feasibility: Final feasibility assessment

### A16 — Supplement Facts Synthesizer (runs after SafetyReport)

- Input: Shortlisted candidates, SafetyReport, EvidenceIndex

- Output: ClaimsBundle (per candidate)

- FDA-compliant Supplement Facts label

- Constituent counts matching formulation

- Allergen statements

- Claims/warnings consistent with EvidenceIndex

- compliance: FDA compliance flags, warnings included

- Dependencies: Shortlisted candidates, SafetyReport

- Execution: Sequential (after SafetyReport synthesis)

### A11 — Costing & BOM Builder (runs in parallel with A16)

- Input: Shortlisted candidates, data/suppliers/ catalogs

- Output: BOM (Bill of Materials, per candidate)

- Supplier pricing (cached, 7-day TTL)

- Batch quantities

- Per-dose COGS

- unit_costs: Per-dose, per-serving, per-container

- Dependencies: Shortlisted candidates

- Execution: Parallel (with A16)

### Gate #2: Safety/Claims

- Function: gate2_safety_claims(candidates, safety_reports, claims_bundles)
- Classification (per candidate):
- Clear ✅: No violations, claims compliant → proceed
- Advise ⚠️: Minor issues, non-blocking → proceed with notes
- Revise 🔄: Multiple violations or claims issues → bounded re-spin (1x)
- Block 🚫: Critical safety failure (e.g., A15 feasibility fail) → drop
- Logic:
- Checks A7 safety rules, A13 critical violations (>50% dose reduction), A15 feasibility status
- Checks A16 FDA compliance, missing warnings
- Output: Gate2Result
- results: Per-candidate status (block/revise/advise/clear)
- telemetry: Counts by status category
- respin_budget: Max 1 respin allowed

### A8 — Study Designer (optional, reserved)

- Input: Survivor candidates
- Output: StudyBlueprints
- Biomarker-driven study designs
- Currently not executed in default DAG

### A9 — QA & Conflicts Auditor (Gate #3) (optional, red-team)

- Input: Final candidates, all artifacts

- Output: RedTeamReport

- Severity scores (0.0-1.0)

- Risk classification (high/medium/low)

- Failure modes: biological plausibility, dosing logic, safety edge cases, manufacturing complexity, market positioning

- blocking_issues, major_risks, minor_concerns

- Dependencies: All Phase C artifacts

- Execution: Optional (adversarial audit)

### Final Synthesis: DecisionPacket

- Function: build_decision_packet(exec_context, evidence_index, candidate, scorecard, safety_report, claims_bundle, study_blueprints, bom, feasibility, governance)

- Output: DecisionPacket (per survivor candidate)

- Phase A: exec_context, evidence_index

- Phase B: candidate, scorecard, feasibility

- Phase C: safety_report, claims_bundle, bom, study_blueprints

- Summary: Composite score, safety status, feasibility status, estimated COGS, total constituents

- Stats Validation: Evidence points, confidence band, fragile ingredients, MC summary

- RedTeam: A9 summary (if available)

- Metadata: DAG version, gates passed, timestamps

- Export: One-click JSON download

---

## LAUNCH & MARKETING PHASE (Separate, after Phase C)

Purpose: Commercial strategy, branding, PR/IR, GTM planning.

### A20 — Market Analyst (orchestrates debates)

- Input: DecisionPacket, BOM, region

- Output: MarketAnalysis

- Competitive landscape (pricing corridors, TAM/CAGR)

- Segmentation analysis

- Pricing recommendations (tied to BOM COGS)

- Branding scaffolds

- Debate Mechanism: Two-analyst market debate (3-5 rounds) → consensus_strategy

- Dependencies: Phase C complete

### A21 — Label & Packaging Designer

- Input: Consensus strategy, DecisionPacket, population profile, dosage form, time horizon

- Output: BrandConcept

- Axcellerate-aligned branding

- Product names

- Pack visuals

- Image prompts (optional DALL·E 3 integration)

- Tailored to demographic and time horizon

- Dependencies: A20 consensus strategy

### A22 — PR / IR Campaign Designer

- Input: Consensus strategy, DecisionPacket, population profile

- Output: PRPlan

- Messaging pillars

- Campaign phases

- Endorsers (Boston-area scientific/academic/sports figures)

- Spend bands

- KPIs

- Dependencies: A20 consensus strategy

### A23 — GTM Roadmap Planner

- Input: Consensus strategy, region, population profile

- Output: GTMPlan

- 3/6/12-month roadmap

- Channel mix (DTC vs retail)

- Key actions

- Metrics and risk logging

- Dependencies: A20 consensus strategy

---

## KEY WORKFLOW PATTERNS

### Parallel Execution (TaskGraph)

- Phase A: A2, A3, A14, A6 run in parallel after A1

- Phase B: A17 runs in parallel with A4; A15 runs in parallel per candidate

- Phase C: A13, A7, A15 run in parallel per candidate; A11 runs in parallel with A16

### Debate Mechanisms

1. A4 Peer-Review Debate: Expert 1 critiques → Expert 2 challenges → Consensus (triggers redesign if needed)

2. A20 Market Debate: Two strategists debate (3-5 rounds) → Consensus strategy

3. Formulation × Market-Fit Debate: Consensus strategist + A4 formulator → Joint recommendation

### Caching Strategy

- DSLD Priors: 30-day TTL (cache/dsld/)

- Supplier Prices: 7-day TTL (cache/suppliers/)

- Taste Data: 90-day TTL (cache/taste/)

- PubMed Queries: Cached (cache/pubmed/)

- Agent Outputs: Session-state cached (resume capability)

---

## VISUALIZATION & VIEWER APP OPPORTUNITIES

### Phase A Visualization

- EvidenceIndex Dashboard: Pathway network, mechanism coverage heatmap, dose prior distributions, evidence source provenance

- Metabolic Profile: Pathway alteration directionality, analyte changes, biomarker confidence bands

### Phase B Visualization

- Candidate Comparison Matrix: Side-by-side variants with scores, mechanism coverage, feasibility radar

- Formulation Composition: Ingredient stacks, dose bands, cluster groupings

- Competition Analysis: Transporter competition network, scheduling recommendations

### Phase C Visualization

- Safety Dashboard: Policy violations, dose adjustments, feasibility status per candidate

- Cost Analysis: COGS breakdown, supplier pricing trends, batch economics

- Gate Status: Gate #1/Gate #2 pass/fail with reasons

### DecisionPacket Viewer

- Artifact Navigator: Tabbed view of ExecContext → EvidenceIndex → Candidate → SafetyReport → ClaimsBundle → BOM

- Timeline View: Phase progression with agent execution times

- Export Hub: JSON download, CSV variant table, scientific dossier (Markdown)

### Optimization Opportunities

1. Parallelization: Already async; consider GPU/cloud scaling for large candidate sets

2. Caching: Expand TTLs for stable data; add Redis for multi-session sharing

3. Gate Logic: Pre-compute drop reasons; early exit for blocked candidates

4. Agent Batching: Batch A15 feasibility across candidates in single LLM call

5. Resume Capability: Already implemented via SQLite run storage; enhance with partial phase resume

This system is production-ready with strong separation of concerns, parallel execution, and governance gates. The main optimization targets are LLM call batching and expanded caching for cost/performance.