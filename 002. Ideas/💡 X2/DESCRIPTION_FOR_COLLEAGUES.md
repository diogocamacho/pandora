# X2 Product Maker: Technical System Description

## Executive Summary

X2 Product Maker is an **agentic formulation discovery engine** that transforms disease indications into evidence-backed nutraceutical formulations through a 3-phase DAG orchestration powered by 23 specialized AI agents. The system uses OpenAI's GPT-5 models to coordinate parallel agent execution, enabling rapid hypothesis generation, mechanism exploration, and formulation optimization for internal R&D workflows.

## System Architecture

### Core Components

1. **Orchestration Layer** (`orchestration/workflow.py`)
   - Standalone 3-phase DAG executor with zero external UI dependencies
   - Parallel execution engine using `TaskGraph` for concurrent agent calls
   - Intelligent caching and request deduplication to minimize API costs
   - State persistence for workflow resumption and batch processing

2. **Agent Registry** (`agents/registry.py`)
   - Centralized agent management with factory pattern
   - Support for both legacy (A1-A23) and descriptive names
   - Backward-compatible aliasing system

3. **CLI Workflow Runner** (`cli/workflow_runner.py`)
   - Primary execution interface for batch discovery workflows
   - Batch processing with automatic archiving
   - Single-file execution mode
   - SQLite-based run store for artifact persistence and historical analysis

4. **Evidence & Data Layer**
   - PubMed/ClinicalTrials.gov integration for evidence retrieval
   - DSLD/DSID dose priors database mining
   - Curated ingredient vocabularies and taste coefficients
   - Supplier catalog integration for BOM costing

## 3-Phase Discovery Workflow

### Phase A: Understand & Gather

**Objective**: Build comprehensive understanding of the disease, metabolic profile, mechanisms, and dose priors to inform formulation discovery.

**Agents & Parallelization**:
- **Indication Ingestor**: Normalizes the user-provided indication into an ExecContext artifact by querying biomedical ontologies (MONDO, SNOMED CT, UMLS, HPO), aligning the condition with recognized IDs, population descriptors, and clinical context so downstream agents can reason against standardized disease semantics. ⚡ Runs in parallel with Dose Priors Miner.
- **Metabolic Profiler**: Synthesizes disease-specific metabolic dysregulation by fusing literature derived from PubMed and ClinicalTrials.gov with internal metabolomics heuristics, producing pathway, analyte, and biomarker summaries that anchor the EvidenceIndex. ⚡ Runs in parallel with Dose Priors Miner.
- **Mechanism Mapper**: Consumes the metabolic profile and extends it into an explicit mechanism set, mapping pathways to tractable levers, associating analytes, and annotating clinical evidence so later steps know which biological processes must be covered. Depends on Metabolic Profiler output.
- **Dose Priors Miner**: Aggregates dose priors from the NIH Dietary Supplement Label Database (DSLD), Dietary Supplement Ingredient Database (DSID), ClinicalTrials.gov intervention arms, and curated ingredient vocabularies, pre-fetching 40+ canonical ingredients per run. ⚡ Runs in parallel with Metabolic Profiler.

**Output**: `EvidenceIndex` - Unified artifact combining metabolic profile, mechanisms, and dose priors with quality metrics

**Key Features**:
- Ontology-based indication normalization ensures consistent disease semantics
- PubMed and ClinicalTrials.gov evidence integration for biomarker validation
- Expanded ingredient query (40+ ingredients) for comprehensive priors coverage
- Parallel execution reduces Phase A time by ~30-40%

### Phase B: Generate & Score

**Objective**: Discover formulation candidates, validate against priors, assess competition, critique formulations, and score variants to identify optimal formulations.

**Agents & Parallelization**:
- **Formulation Designer**: Translates mechanisms into a mechanistically balanced formulation, constrained by max constituent counts, dosage form, and critic feedback, generating dose bands, regimen logic, and coverage metrics with mechanism coverage enforcement (75% default threshold). The designer prioritizes mechanism coverage using weights and enforces per-mechanism load caps to prevent pathway overload.
- **Formulation Validation**: Validates all ingredients against dose priors, flagging ingredients without DSLD/DSID/ClinicalTrials.gov evidence and providing actionable recommendations. ⚡ Runs in parallel with Competition & Synergy Checker and Formulation Designer critique.
- **Competition & Synergy Checker**: Models transporter and cofactor competition by loading ingredient competition data and vocab mappings, computing group penalties and scheduling recommendations that inform formulation design and feasibility assessment. ⚡ Runs in parallel with validation and critique.
- **Formulation Critique & Debate**: Two-expert peer review process where Expert 1 critiques the formulation, Expert 2 challenges the critique, and both converge on a consensus set of mechanism gaps, redundancy flags, and suggested changes that can trigger automatic redesign. ⚡ Runs in parallel with validation and competition assessment (depends on Competition & Synergy Checker).
- **Variant Generator**: Diversifies the design space by perturbing the base formulation under explicit objectives (efficacy, safety, simplicity, cost) and variation policies, returning a ranked collection of variants plus diversity telemetry. Generates alternative formulations after refinement.
- **Feasibility Analyzer**: Evaluates taste, manufacturability, and cost using empirical taste coefficients, supplier economics, and optional competition penalties, outputting palatability scores, cost per unit, and feasibility diagnostics. Runs on all shortlisted candidates.

**Discovery Loop**:
1. Initial formulation design with coverage enforcement
2. Parallel validation, competition assessment, and critique
3. Automatic refinement if validation fails or critic suggests changes
4. Re-validation and competition refresh after refinement

**Output**: `CandidateSet` with shortlisted variants ranked by composite score (efficacy, safety, simplicity, cost)

**Key Features**:
- Mechanism coverage enforcement with automatic retry (up to 3 attempts)
- Ingredient validation against Dose Priors Miner dose priors (flags missing evidence)
- Competition modeling for transporter/cofactor load assessment
- Two-expert critique and debate for formulation quality assurance
- Parallel execution of validation, competition, and critique reduces Phase B time by ~40-50%

### Phase C: Govern & Finalize

**Objective**: Ensure safety, compliance, generate labels, build BOM, and finalize product specification for discovered formulations.

**Agents & Parallelization**:
- **Dose Policy Enforcer**: Checks each candidate against non-Rx policies, referencing DSLD/DSID priors for ULs and returning adjusted formulations if necessary, with outputs feeding the SafetyReport and triggering automatic refinements if overages persist. Runs as part of Feasibility Analyzer assessment.
- **Feasibility Analyzer**: Evaluates taste, manufacturability, and cost using empirical taste coefficients, supplier economics, and optional competition penalties, outputting palatability scores, cost per unit, and feasibility diagnostics. ⚡ Runs in parallel for all shortlisted candidates.
- **Dosing & Safety Planner**: Generates an individualized dosing plan, splitting regimens over the day, flagging contraindications, and ensuring age/sex/population adjustments obey non-Rx boundaries, producing a SafetyReport component. ⚡ Runs in parallel with Supplement Facts Synthesizer.
- **Supplement Facts Synthesizer**: Converts the adjusted formulation into FDA-style Supplement Facts, ensuring constituent counts match the formulation table, generating allergen statements, and populating claims/warnings consistent with the EvidenceIndex. ⚡ Runs in parallel with Dosing & Safety Planner.
- **Costing & BOM Builder**: Converts the selected formulation into a bill of materials with supplier pricing, batch quantities, and per-dose COGS, drawing from curated supplier catalogs plus cached market quotes.
- **Formulation Summary** ⚡: Summarizes the preferred formulation with rationale and key features. Runs in parallel with Scientific Memo Composer and SPRDWriter.
- **Scientific Memo Composer**: Performs additional literature research (PubMed, guidelines, review articles) and produces publication-grade scientific memos linking mechanisms, doses, and evidence into a narrative artifact for regulators or scientific leadership. ⚡ Runs in parallel with Formulation Summary and SPRDWriter.
- **SPRDWriter**: Generates the Supplement Product Requirements Document, a comprehensive specification document for product development and regulatory submission. ⚡ Runs in parallel with Formulation Summary and Scientific Memo Composer.

**Output**: `DecisionPacket` - Complete audit-ready export with full provenance

**Key Features**:
- Parallel feasibility assessment across all shortlisted candidates
- Preferred dosage form assessment (compares feasibility across forms)
- Market branding alignment with consensus strategy
- Parallel document generation (Formulation Summary, Scientific Memo Composer, SPRD) reduces Phase C time by ~2-3x
- Gate #2 governance (block|revise|advise|clear classification)

### Market Analysis & Product Launch

**Objective**: Analyze market opportunity, generate consensus strategy, and create launch assets for discovered formulations.

**Agents & Parallelization**:
- **Market Analyzer**: Analyzes the competitive landscape (pricing corridors, TAM/CAGR, competitor positioning) using internal heuristics plus any available BOM-derived COGS, producing market summaries, segmentation, pricing, and branding scaffolds. Also orchestrates downstream debates:
  - `analyze_market`: Market opportunity analysis
  - `debate_market_strategists`: Two-analyst consensus strategy where two senior strategists argue over segment, pricing, and channel choices before emitting a single consensus strategy
  - `debate_with_formulator`: Formulation × market-fit debate that surfaces adoption or adherence trade-offs (dosage form, pack, price, messaging), resolving them into a joint recommendation
- **Label & Packaging Designer**: Takes the consensus market strategy and produces concrete branding, packaging concepts, front/back copy, and image prompts consistent with the target demographic, dosage form, and consensus positioning. ⚡ Runs in parallel with PR/IR Campaign Designer and GTM Roadmap Planner.
- **PR/IR Campaign Designer**: Builds an external narrative—tagline, messaging pillars, phased campaign plan, expected spend bands, KPIs, and archetypal endorsers—aligned with the consensus segment and scientific claims, ensuring compliance with supplement-language constraints. ⚡ Runs in parallel with Label & Packaging Designer and GTM Roadmap Planner.
- **GTM Roadmap Planner**: Proposes a pragmatic 3/6/12-month go-to-market roadmap with channel mix rationale (DTC vs retail), key actions, and metrics, grounded in the same consensus strategy and regional assumptions as Market Analyzer. ⚡ Runs in parallel with Label & Packaging Designer and PR/IR Campaign Designer.

**Output**: Complete product launch plan with branding, PR/IR strategy, and GTM roadmap

**Key Features**:
- Market-research-driven dosage form recommendation (runs early in workflow)
- Consensus strategy generation through two-analyst debate
- Formulation × market-fit debate ensures product-market alignment
- Parallel launch agent execution (Label & Packaging Designer/PR/IR Campaign Designer/GTM Roadmap Planner) reduces launch time by ~2-3x

## Performance Optimizations

### Parallel Execution

The system uses `TaskGraph` with `asyncio.to_thread()` for concurrent agent execution:

1. **Phase A**: Metabolic Profiler and Dose Priors Miner run in parallel (~30-40% faster)
2. **Phase B**: Validation, Competition & Synergy Checker, and Formulation Designer critique run in parallel (~40-50% faster)
3. **Phase C**: Dosing & Safety Planner and Supplement Facts Synthesizer run in parallel; Feasibility Analyzer runs in parallel for all candidates
4. **Document Generation**: Formulation Summary, Scientific Memo Composer, and SPRDWriter run in parallel (~2-3x faster)
5. **Product Launch**: Label & Packaging Designer, PR/IR Campaign Designer, and GTM Roadmap Planner run in parallel (~2-3x faster)

**Overall Performance**: ~25-35% faster total execution time with optimizations enabled

### Caching & Deduplication

- **Agent Output Caching**: Deterministic cache keys based on agent type and input data
- **Request Deduplication**: Prevents duplicate API calls when same request is made concurrently
- **DSLD/DSID Priors Cache**: 30-day TTL for dose priors
- **Supplier Pricing Cache**: 7-day TTL for supplier data
- **Taste Coefficients Cache**: 90-day TTL for taste data

### Concurrency Control

- `MAX_PARALLEL_AGENT_CALLS` environment variable (default: 4)
- TaskGraph enforces concurrency limits to prevent API rate limit issues
- Graceful degradation: falls back to sequential execution if parallel execution fails

## Data Flow & Artifacts

### Artifact Types

1. **ExecContext** (Indication Ingestor): Normalized indication with ontology mappings
2. **EvidenceIndex** (Metabolic Profiler/Mechanism Mapper/Dose Priors Miner): Unified evidence artifact with quality metrics
3. **CandidateSet** (Formulation Designer/Variant Generator): Base formulation + variants
4. **Scorecards**: Composite scores (efficacy, safety, simplicity, cost)
5. **SafetyReport** (Dosing & Safety Planner/Dose Policy Enforcer/Feasibility Analyzer): Dosing plans, policy enforcement, feasibility
6. **ClaimsBundle** (Supplement Facts Synthesizer): FDA-compliant Supplement Facts labels
7. **Packager** (Costing & BOM Builder): Bill of materials with supplier pricing
8. **DecisionPacket**: Complete audit-ready export
9. **SPRDDocument**: Supplement Product Requirements Document
10. **MarketAnalysisReport** (Market Analyzer): Market opportunity, consensus strategy
11. **LaunchPlan** (Label & Packaging Designer/PR/IR Campaign Designer/GTM Roadmap Planner): Branding, PR/IR, GTM roadmap

### Governance Gates

1. **Gate #1 (Shortlist)**: 
   - Ranks candidates by composite score
   - Enforces diversity constraint
   - Keeps top-K + one wildcard for unique mechanism coverage
   - Logs drop reasons for telemetry

2. **Gate #2 (Safety/Claims)**:
   - Classifies as block|revise|advise|clear
   - Evaluates safety violations and claims compliance
   - Provides actionable recommendations

3. **Gate #3 (Red-team Audit)**:
   - QA & Conflicts Auditor (adversarial red-team) audits shortlisted candidates, assuming the formulation is wrong until proven otherwise and stress-testing biological plausibility, dosing logic, safety edge cases, manufacturing complexity, and market positioning conflicts
   - Identifies failure modes and risk bands
   - Generates governed scores with severity penalties

## Key Technical Features

### Mechanism Coverage Enforcement

- Minimum 75% mechanism coverage threshold (configurable)
- Automatic retry logic (up to 3 attempts)
- Explicit feedback about missing/overloaded mechanisms
- Coverage evaluation with mechanism lookup and metadata

### Formulation Validation

- Validates all ingredients against Dose Priors Miner dose priors
- Synonym-aware matching (NAC ↔ N-acetylcysteine, CoQ10 ↔ ubiquinol)
- Flags ingredients without DSLD/DSID/ClinicalTrials.gov evidence
- Provides actionable recommendations for flagged ingredients

### Formulation Refinement Loop

- Automatic refinement when validation fails
- Incorporates critic suggestions and safety caps
- Re-validates and refreshes competition assessment after refinement
- Preserves initial formulation for reference

### Population-Aware Design

- Normalizes age cohorts into `population_profile`
- Steers formulation design toward kid/elder-friendly forms
- Propagates population context through market analysis and launch
- Automatic pediatric → beverage dosage form enforcement

### Time Horizon Awareness

- `time_horizon` parameter (hours/days/weeks/months) steers formulation design
- Acute horizons emphasize rapid-onset ingredients
- Long horizons lean on cumulative/adaptive stacks
- Pack sizes default to appropriate horizon (7-dose acute, 30-dose chronic)

## Discovery Workflow Capabilities

### Rapid Hypothesis Generation

- Generate multiple formulation hypotheses in hours instead of weeks
- Explore mechanism combinations systematically
- Test variant formulations with different ingredient ratios
- Compare feasibility across dosage forms

### Evidence-Based Discovery

- Every formulation backed by PubMed/ClinicalTrials.gov citations
- Real-time evidence retrieval during discovery process
- Mechanism validation against clinical trial data
- Dose priors from market data and clinical studies

### Systematic Exploration

- Mechanism coverage enforcement ensures comprehensive pathway targeting
- Competition modeling identifies potential interactions
- Two-expert critique provides quality assurance
- Automatic refinement loop optimizes formulations iteratively

## State Management & Persistence

### Run Store (SQLite)

- Automatic artifact persistence at each phase completion
- Run metadata (indication, population, horizon, status)
- Supports workflow resumption and batch processing
- Gzip compression for JSON payloads (70-90% size reduction)
- Historical analysis of discovery runs

### Caching Strategy

- Multi-level caching (agent outputs, DSLD priors, supplier data, taste coefficients)
- TTL-based expiration with configurable cache policies
- Cache invalidation on data source updates
- Deterministic cache keys for reproducibility

## Error Handling & Resilience

- Graceful degradation: optional agents don't block workflow
- Best-effort execution: Scientific Memo Composer and SPRDWriter failures are logged but don't abort
- Exception handling at each agent call with detailed error messages
- Workflow resumption: can restart from any phase using persisted artifacts

## Extensibility

### Adding New Agents

1. Create agent class inheriting from `BaseAgent`
2. Implement required methods (e.g., `design_formulation`, `assess_feasibility`)
3. Register in `agents/registry.py` with descriptive name and aliases
4. Add contract specification in `agent_contracts/`
5. Integrate into workflow in `orchestration/workflow.py`

### Customizing Workflow

- Modular orchestration layer allows phase boundary modifications
- Custom artifact builders can be added to `orchestration/artifacts.py`
- New gates can be implemented in `orchestration/gates.py`
- Parallel execution paths can be added using `TaskGraph`

## Testing & Quality Assurance

- Unit tests for orchestration helpers (`tests/orchestration/`)
- Agent test templates with fixtures and schema validation
- Integration tests for CLI runner (`tests/integration/`)
- TaskGraph regression tests for parallel execution
- Coverage evaluation tests for mechanism enforcement

## Deployment & Operations

### CLI Execution

```bash
# Batch processing
python -m cli.workflow_runner run-batch <input_dir> [--archive-dir <archive_dir>] [--force] [--api-key <key>]

# Single file
python -m cli.workflow_runner run-single <input_file> [--api-key <key>]
```

### Configuration

- Environment variables for API keys, cache TTLs, concurrency limits
- JSON input files for analysis parameters
- Configurable dose policies (NSF/ANSI 173, 229, 306)
- Optional market form recommendation

### Monitoring

- Phase telemetry (timings, drop reasons, diagnostics)
- Agent call metrics (latency, token usage, cache hits)
- Run store queries for historical analysis
- Performance profiling tools (`scripts/profile_workflow.py`)

## Research Applications

### Formulation Discovery

- Rapid exploration of mechanism combinations
- Systematic testing of ingredient ratios
- Comparison of formulation variants
- Identification of optimal dosage forms

### Evidence Synthesis

- Automated literature review and citation
- Clinical trial data integration
- Market data analysis for dose priors
- Mechanism validation against published studies

### Hypothesis Testing

- Generate multiple formulation hypotheses
- Test feasibility across different populations
- Compare safety profiles
- Evaluate cost-effectiveness

## Future Enhancements

- API server mode for programmatic access
- Advanced scoring algorithms with ML-based predictions
- Multi-region market analysis
- Clinical trial design integration (Study Designer - currently reserved)
- Evidence graph construction (Evidence Linker - currently reserved)
- Enhanced mechanism exploration tools
