---
type: idea
date: 2026-10-08
mode: challenge
status: open
scope: founder-thesis-only
tags: [idea, agents, operating-model, biotech-of-one, drug-discovery, strategy]
related_ideas: ["[[2026-10-08 network-biology-platform]]", "[[2026-06-18 biotech-of-one]]"]
---

# Which parts of a biotech are suited to agentic AI: a function map for the biotech of one

## The idea
Diogo's redirect: stop defining the platform's scientific premises in detail and work out which pieces of the actual biotech suit agentic AI. The platform is one piece. What else, and how does the platform rank among them? Founder thesis only.

## Suitability criteria (Claude's framing; to be pressure-tested)
1. **Verifiability:** can the output be checked quickly against a source or deterministic test?
2. **Feedback speed:** how fast does reality grade the work (minutes, weeks, years)?
3. **Error cost and reversibility.**
4. **Signature / accountability:** does a named human or a validated system have to own the record (regulatory, GxP, legal)?
5. **Data availability:** is the input already digital and structured?
6. **Judgment vs. execution:** Diogo's own axis.

## First-pass map (Claude's judgment, not evidence)

### Tier 1: agents carry most of the work, humans review or sign
| Piece | Agent role | Stays human |
|---|---|---|
| Evidence and landscape synthesis (literature, competitors, ClinicalTrials.gov benchmarking, first-pass patent landscape) | Gather, synthesize, cite to source | Conclusions, FTO opinion (counsel) |
| Regulatory and clinical document drafting (IND modules, protocols, IB, briefing documents, SAP drafts) | Draft with source-linked data tables | Sign-off, FDA interaction |
| Contract and vendor operations (CDA/MSA/SOW review, CRO bid comparison, milestone and invoice reconciliation) | First-pass review, comparison, tracking | Negotiation, counsel final |
| Program management and coordination (timelines, dependencies, status across CROs, decision log) | Run the connective tissue | Priorities |
| Finance operations (runway and scenario models, budget vs. actual, grant scanning, board-pack drafts) | Model, draft, monitor | Fundraising, audit sign-off |
| Analysis of CRO-returned assay data (QC, curve fitting, outlier flags) | Analyze, flag | Acceptance decisions |

### Tier 2: agents propose, humans decide (verified by experiment or expert)
| Piece | Agent role | Bottleneck |
|---|---|---|
| Network-biology target ID platform | Rank subnetworks and targets, design perturbation tests | Perturbation data from CROs (weeks); unvalidated premises |
| Experiment and assay design (DOE, controls, power) | Design, optimize | CRO execution |
| Medicinal chemistry DMTA support (SAR analysis, retrosynthesis, ADMET prediction, prioritization) | Propose, triage | Make/test latency; human chemist arbitrates |
| DMPK, tox and biostat support | Study design, interpretation support | GLP execution; toxicologist sign-off |
| BD (scouting, deal modeling, partner matching, outreach drafts) | Scout, model | Relationships |
| Fundraising prep (investor mapping, data room, Q&A prep) | Prepare | Relationships |

### Tier 3: agents as challengers and auditors only
Indication and disease-area selection, portfolio go/no-go, clinical strategy, deal terms, financing timing. Agent roles: red-team, pre-mortem, assumption audit, calibration tracking. Not deciders.

### Tier 4: not agent territory
Wet-lab, GLP and GMP execution; clinical conduct and patient safety (medical monitor); QA release and Qualified Person-type roles; FDA meetings; fundraising and partnering relationships; hiring decisions.

### Gating constraint
Agent outputs that enter GxP or other regulated records need validated systems and audit trails (21 CFR Part 11 or equivalent); that limits agent use in QA, CMC and clinical records regardless of capability.

## What's load-bearing
1. **Suitability tracks verifiability and feedback speed, not how intellectual the work looks.** Document and coordination work verifies against sources in minutes; discovery science verifies by experiment in weeks to months; strategic judgment verifies in years.
2. **The binding constraints of the company (CRO cycle time, clinical development) are not agentic.**
3. **Accountability stays with named humans** whatever agents do.

## Strongest case for
- For a one-person company, the largest realistic leverage is the coordination and documentation layer (the work normally staffed by many mid-level people), because it is high-volume, source-verifiable and fast-feedback.
- Hypothesis (Claude's, untested): structure agents around **verification loops**, not job titles. The Stanford Virtual Biotech mirrors an org chart (CSO agent, divisions); mirroring titles imports the org chart's coordination costs without the humans who absorb them.
- Hypothesis (Claude's, untested): a **decision-memory layer** (why each decision was made, on what evidence, with what predictions) is something a small company can keep with agents and large organizations lose to turnover.

## Strongest case against
- **The platform is the glamorous piece and not the best-suited one.** It sits in Tier 2, with the slowest verification of the discovery steps.
- **Diogo's stated stance ("agents for judgment, not execution") sits in Tier 3, where evidence is weakest and feedback is years.** The vault's own clippings point the other way: [[Research Why You Shouldn't Treat AI Agents Like Employees]] (accountability fell and escalation rose when AI was framed as an employee, per the clip summary), [[Uneven Frontiers]] and [[AI Versus Eroom's Law]] (clinical development, not discovery, is the binding constraint). The Stanford multi-agent-debate claim comes from a conference talk and is unverified.
- Judgment agents cannot be validated inside a company's runway except on backtests, which are retrodiction on public outcomes.
- Cost and risk of agent errors in regulated documents are high if source linking is weak.

## Open questions
- **Load-bearing: which judgments does Diogo want agents on, and what is the evidence they improve the decision, given that outcome feedback takes years?**
- Which Tier 1 pieces are worth building first, and what is the verification mechanism for each?
- Does structuring agents by verification loop (rather than function) hold up against how a CRO-based company actually works?
- What would a decision-memory layer record, and how would it be audited?

## Whitespace check
Named in vault or session: Stanford Virtual Biotech (org-chart-mirroring multi-agent system, preprint, 2026), Formation Bio (referenced in vault clippings as arguing clinical development is the constraint). Landscape of agent-run biotech operations not researched beyond that.

## Related ideas
- [[2026-10-08 network-biology-platform]] — the platform premises; paused at the topology-object question while this map is worked.
- [[2026-06-18 biotech-of-one]] — origin; "agents for judgment, not execution" stance.

## Next steps
Answer the load-bearing question, then pick the first Tier 1 pieces to specify, each with a source-verification mechanism.
