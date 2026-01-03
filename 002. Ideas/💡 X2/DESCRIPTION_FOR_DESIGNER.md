# X2 Product Maker: Workflow Description for Visual Design

## System Overview (Visual Concept)

**X2 Product Maker** is a 3-phase agentic formulation discovery engine that transforms a disease indication into a complete product specification through parallel AI agent orchestration.

## Visual Flow Structure

### High-Level Flow

```
INPUT (Disease Indication)
    ↓
PHASE A: Understand & Gather
    ↓
PHASE B: Generate & Score
    ↓
PHASE C: Govern & Finalize
    ↓
MARKET ANALYSIS & LAUNCH
    ↓
OUTPUT (Complete Product Specification)
```

## Phase A: Understand & Gather

### Visual Layout

```
┌─────────────────────────────────────────┐
│  A1: Indication Ingestor                │
│  (Normalize disease with ontologies)    │
└──────────────┬──────────────────────────┘
               │
    ┌──────────┴──────────┐
    │                     │
┌───▼────┐          ┌─────▼─────┐
│  A2    │          │   A14     │
│ Metabolic│  ⚡    │  Dose     │
│ Profiler │ PARALLEL│  Priors   │
└───┬────┘          └───────────┘
    │
┌───▼────┐
│  A3    │
│ Mechanism│
│  Mapper │
└───┬────┘
    │
┌───▼──────────────────────┐
│  EvidenceIndex           │
│  (Unified Evidence Artifact)│
└──────────────────────────┘
```

**Key Visual Elements**:
- **A1** at the top (single node)
- **A2 and A14** side-by-side with ⚡ parallel indicator
- **A3** below A2 (dependency arrow)
- **EvidenceIndex** as synthesis box at bottom

**Color Coding Suggestion**:
- Phase A: Blue tones
- Parallel execution: Yellow/Orange highlight
- Synthesis artifacts: Green boxes

## Phase B: Generate & Score

### Visual Layout

```
┌─────────────────────────────────────────┐
│  A4: Formulation Designer               │
│  (Design with mechanism coverage)      │
└──────────────┬──────────────────────────┘
               │
    ┌──────────┼──────────┐
    │          │          │
┌───▼────┐ ┌───▼────┐ ┌───▼────┐
│Validation│ │  A17  │ │ A4     │
│Against   │ │Competition│ │Critique│
│Priors    │ │& Synergy│ │& Debate│
└───┬────┘ └───┬────┘ └───┬────┘
    │          │          │
    └──────────┼──────────┘
               │
    ┌──────────▼──────────┐
    │  Refinement Loop?   │
    │  (if needed)        │
    └──────────┬──────────┘
               │
┌──────────────▼──────────────┐
│  A10: Variant Generator     │
└──────────────┬──────────────┘
               │
┌──────────────▼──────────────┐
│  A15: Feasibility Analyzer  │
│  (Runs on all candidates)   │
└──────────────┬──────────────┘
               │
┌──────────────▼──────────────┐
│  Gate #1: Shortlist         │
│  (Top-K + diversity)        │
└─────────────────────────────┘
```

**Key Visual Elements**:
- **A4** at the top
- **Three parallel boxes** (Validation, A17, A4 Critique) with ⚡ indicators
- **Refinement Loop** as optional feedback path (dashed line)
- **A10** and **A15** in sequence
- **Gate #1** as decision diamond or gate icon

**Color Coding Suggestion**:
- Phase B: Green tones
- Parallel execution: Yellow/Orange highlight
- Gates: Red/Orange decision points
- Feedback loops: Dashed lines in contrasting color

## Phase C: Govern & Finalize

### Visual Layout

```
┌─────────────────────────────────────────┐
│  Shortlisted Candidates                  │
└──────────────┬──────────────────────────┘
               │
    ┌──────────┼──────────┐
    │          │          │
┌───▼────┐ ┌───▼────┐ ┌───▼────┐
│  A13   │ │  A15   │ │  A7    │
│  Dose  │ │Feasibility│ │Dosing│
│ Policy │ │(Parallel)│ │Safety │
└───┬────┘ └───┬────┘ └───┬────┘
    │          │          │
    └──────────┼──────────┘
               │
    ┌──────────┼──────────┐
    │          │          │
┌───▼────┐ ┌───▼────┐ ┌───▼────┐
│  A16   │ │  A11   │ │  A4    │
│Supplement│ │  BOM  │ │Summary │
│  Facts  │ │Costing │ │        │
└───┬────┘ └───┬────┘ └───┬────┘
    │          │          │
    └──────────┼──────────┘
               │
    ┌──────────┼──────────┐
    │          │          │
┌───▼────┐ ┌───▼────┐ ┌───▼────┐
│  A5    │ │ SPRD   │ │  A9    │
│Scientific│ │Writer │ │Red-team│
│  Memo  │ │        │ │ Audit  │
└───┬────┘ └───┬────┘ └───┬────┘
    │          │          │
    └──────────┼──────────┘
               │
┌──────────────▼──────────────┐
│  Gate #2: Safety/Claims      │
│  (block|revise|advise|clear) │
└──────────────┬──────────────┘
               │
┌──────────────▼──────────────┐
│  DecisionPacket              │
│  (Complete Product Spec)     │
└──────────────────────────────┘
```

**Key Visual Elements**:
- **Multiple parallel execution groups** with ⚡ indicators
- **Gate #2** as decision point
- **DecisionPacket** as final output box

**Color Coding Suggestion**:
- Phase C: Purple/Indigo tones
- Multiple parallel groups: Different shades
- Final output: Gold/Highlight color

## Market Analysis & Launch

### Visual Layout

```
┌─────────────────────────────────────────┐
│  A20: Market Analyzer                   │
│  ┌──────────┐  ┌──────────┐  ┌────────┐│
│  │Analyze   │→ │Debate    │→ │Form×   ││
│  │Market    │  │Strategists│ │Market  ││
│  └──────────┘  └──────────┘  └────────┘│
└──────────────┬──────────────────────────┘
               │
    ┌──────────┼──────────┐
    │          │          │
┌───▼────┐ ┌───▼────┐ ┌───▼────┐
│  A21   │ │  A22   │ │  A23   │
│Branding│ │ PR/IR  │ │  GTM   │
│& Pack  │ │Campaign│ │Roadmap │
└───┬────┘ └───┬────┘ └───┬────┘
    │          │          │
    └──────────┼──────────┘
               │
┌──────────────▼──────────────┐
│  Product Launch Plan         │
│  (Brand + PR + GTM)          │
└──────────────────────────────┘
```

**Key Visual Elements**:
- **A20** with sequential sub-steps (arrows between boxes)
- **A21/A22/A23** in parallel with ⚡ indicator
- **Launch Plan** as synthesis box

**Color Coding Suggestion**:
- Market Analysis: Orange/Red tones
- Launch agents: Bright colors (different for each)
- Final synthesis: Gold

## Complete System Flow (Single Page)

### Suggested Layout for Infographic

**Top Section**: Title "X2 Product Maker: Agentic Formulation Discovery Engine"

**Main Flow (Left to Right or Top to Bottom)**:

1. **INPUT BOX** (Left/Top)
   - Disease indication
   - Population profile
   - Time horizon

2. **PHASE A** (Blue section)
   - A1 → A2/A14 (parallel) → A3 → EvidenceIndex
   - Vertical or horizontal flow

3. **PHASE B** (Green section)
   - A4 → [Validation | A17 | Critique] (parallel) → Refinement Loop → A10 → A15 → Gate #1
   - Show parallel execution clearly

4. **PHASE C** (Purple section)
   - [A13 | A15 | A7] (parallel) → [A16 | A11 | A4 Summary] (parallel) → [A5 | SPRD | A9] (parallel) → Gate #2 → DecisionPacket
   - Multiple parallel groups

5. **MARKET & LAUNCH** (Orange section)
   - A20 (with sub-steps) → [A21 | A22 | A23] (parallel) → Launch Plan

6. **OUTPUT BOX** (Right/Bottom)
   - Complete product specification
   - DecisionPacket
   - Launch assets

### Visual Design Elements

**Icons/Shapes**:
- **Agents**: Rounded rectangles or hexagons
- **Gates**: Diamond shapes or gate icons
- **Synthesis Artifacts**: Cylinders or document icons
- **Parallel Execution**: ⚡ lightning bolt or parallel lines indicator
- **Data Flow**: Arrows (solid for sequential, dashed for optional/feedback)

**Color Palette**:
- Phase A: Blues (#4A90E2, #7BB3F0)
- Phase B: Greens (#52C41A, #95DE64)
- Phase C: Purples (#722ED1, #B37FEB)
- Market/Launch: Oranges (#FA8C16, #FFC069)
- Gates: Red/Orange (#FF4D4F, #FF7875)
- Parallel indicators: Yellow/Gold (#FADB14, #FFD666)
- Final output: Gold (#FAAD14)

**Typography**:
- **Phase Headers**: Bold, large (24-32pt)
- **Agent Names**: Medium, readable (14-16pt)
- **Descriptions**: Smaller, lighter (10-12pt)

**Layout Options**:

1. **Horizontal Flow** (Poster/Infographic):
   - Left to right progression
   - Phases as vertical sections
   - Parallel execution shown as stacked boxes

2. **Vertical Flow** (Slide Deck):
   - Top to bottom progression
   - Phases as horizontal sections
   - Parallel execution shown side-by-side

3. **Circular/Radial** (Alternative):
   - Central "DecisionPacket" output
   - Phases radiating outward
   - Agents arranged around phase centers

## Key Metrics to Highlight

**Performance**:
- ~25-35% faster with parallel execution
- Phase A: 30-40% faster
- Phase B: 40-50% faster
- Phase C: 2-3x faster (document generation)
- Launch: 2-3x faster

**Scale**:
- 23 specialized AI agents
- 3 governance gates
- 11 artifact types
- 40+ ingredients queried
- Parallel execution groups: 5+

**Discovery Capabilities**:
- 75% minimum mechanism coverage
- Evidence-backed (PubMed, ClinicalTrials.gov)
- FDA-compliant labeling
- NSF certification targeting
- Rapid hypothesis generation

## Slide Deck Structure (Suggested)

**Slide 1**: Title + System Overview
**Slide 2**: Phase A (detailed)
**Slide 3**: Phase B (detailed)
**Slide 4**: Phase C (detailed)
**Slide 5**: Market Analysis & Launch
**Slide 6**: Discovery Capabilities
**Slide 7**: Key Features & Performance

Each slide should show:
- Visual flow diagram
- Key agents highlighted
- Parallel execution indicators
- Output artifacts
