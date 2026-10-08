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

**Sharpened by Diogo:** the question is not which pieces suit agents but, if an entire biotech were built only of agents, what jobs the agents would hold. The roster below answers that; the suitability map above did not.

## Suitability criteria (Claude's framing; to be pressure-tested)
1. **Verifiability:** can the output be checked quickly against a source or deterministic test?
2. **Feedback speed:** how fast does reality grade the work (minutes, weeks, years)?
3. **Error cost and reversibility.**
4. **Signature / accountability:** does a named human or a validated system have to own the record (regulatory, GxP, legal)?
5. **Data availability:** is the input already digital and structured?
6. **Judgment vs. execution:** Diogo's own axis.

## First-pass suitability map (Claude's judgment, not evidence; answers a different question: which parts of a human-staffed biotech suit agents)

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

## All-agent roster: the jobs agents would hold (Claude's first pass)

Assumes no human staff beyond a legal shell (see boundary below). Jobs are named by what they do and what they hand off.

### A. Governance and strategy
| Job | What it does | Output / gate |
|---|---|---|
| Orchestrator (CSO agent) | Decomposes company goals into workstreams, assigns agents, arbitrates conflicts, owns the integrated thesis | Quarterly plan, gate decisions |
| Strategy and portfolio agent | Maps diseases, mechanisms, competitors and TPPs; ranks the portfolio against gate criteria; scenario analysis | Portfolio memo, kill/continue recommendation |
| Red-team agents | Independent adversaries on every gate memo, with different model, prompt and data access from the authors | Objections log attached to each decision |
| Decision archivist | Records every decision with rationale, evidence and predictions; later scores outcomes and calibration | Decision ledger, calibration reports |
| Program manager | Timelines, dependencies, critical path, CRO status, escalation | Integrated schedule, weekly status |
| Spend governor | Budgets, commitments, anomaly detection, approval thresholds for any money-moving or irreversible action | Spend ledger, holds |

### B. Discovery science (the platform)
| Job | What it does | Output / gate |
|---|---|---|
| Evidence synthesizer | Literature, patents, databases and trial registries into cited syntheses | Evidence briefs |
| Data curator | Ingests, harmonizes and QCs perturbation, omics and genetics data; provenance and versioning | Versioned data spine |
| Network builder | Prior and data-derived networks with typed edges | Scaffold per disease context |
| Dynamics modeler | ODE fitting, simulation, identifiability checks, held-out benchmarking | Calibrated models, benchmark reports |
| Perturbation optimizer | Searches subnetworks and nodes under constraints, with uncertainty | Ranked intervention sets |
| Genetics agent | GWAS, rare variants, MR, locus-to-gene, direction of effect | Genetic support scores |
| Stratification agent | Assigns patients or cells to states or basins from molecular data | Strata definitions |
| Tractability agent | Druggability, ligandability, structure, tool compounds, essentiality and toxicity flags | Tractability cards |
| Target dossier compiler | Assembles evidence, model output, genetics, tractability and red-team objections | Target dossier (gate 1) |
| Experiment designer | Perturbation screens, controls, power, pre-registration | Experiment specs sent to CROs |

### C. Chemistry
| Job | What it does | Output / gate |
|---|---|---|
| Hit finder | Virtual screening, docking, generative design, library selection | Hit lists |
| Med-chem designer | Design-make-test-analyze planning, SAR analysis, multiparameter optimization | Compound proposals |
| Synthesis planner | Retrosynthesis, route scoring, building-block sourcing, order specs to CRO | Synthesis orders |
| Property predictor | ADMET, solubility, permeability, hERG, CYP, with uncertainty | Property profiles |
| Chemical critic | Independent review of proposed compounds: liabilities, synthesizability, novelty, IP space | Accept/reject with reasons |
| Compound registry steward | Structures, batches, assay results, lineage | Registry |

### D. Biology, pharmacology, assay development (wet lab through CROs)
| Job | What it does | Output / gate |
|---|---|---|
| Assay developer | Assay designs, DOE, validation plans, SOP drafts, acceptance criteria | Assay package |
| CRO sourcing agent | Scans the CRO market, RFPs, bid comparison, reference and audit checks, SOW drafting, negotiation within limits | Contracted vendor |
| Study director agent (one per study) | Owns protocol, sample logistics, CRO communication, deviations log, data receipt | Study report |
| Data QC and analysis agent | Checks CRO data against spec, curve fitting, statistics, outlier and deviation flags | Accepted datasets |
| Pharmacology modeler | PK/PD, exposure-response, human dose projection | Dose rationale |
| In vivo design agent | Species, models, power, endpoints, welfare documentation prep | Study design |
| Biomarker and translational agent | Biomarker panels, patient-selection hypotheses, ties stratification to the clinic | Biomarker plan |

### E. Nonclinical safety and CMC
| Job | What it does | Output / gate |
|---|---|---|
| DMPK agent | ADME study design and interpretation, interspecies scaling | DMPK package |
| Toxicology agent | Study design, interpretation, safety margins, risk assessment | Safety assessment |
| CMC agent | Process route, specifications, CDMO sourcing, tech transfer documents, batch record review, stability | CMC section inputs |
| Formulation agent | Dosage form, excipient compatibility, bioavailability strategy | Formulation plan |

### F. Clinical, regulatory, quality
| Job | What it does | Output / gate |
|---|---|---|
| Clinical strategist (CMO agent) | Indication, comparators, endpoints, trial design, benchmarks against registries | Clinical development plan |
| Protocol and SAP writer | Protocols, IB, SAP, TLF specifications | Clinical documents |
| Biostatistics agent | Sample size, simulations, interim plans; analysis programs independently double-programmed by a second agent | Statistical package |
| Regulatory strategist | Pathway, designations, pre-IND package, meeting briefing documents, questions to FDA | Regulatory strategy |
| Regulatory intelligence | Guidance tracking, precedents, review divisions, advisory committee records | Intelligence briefs |
| Regulatory writer and publisher | IND/CTA modules, cross-referencing, eCTD assembly and validation | Submission-ready dossier |
| Clinical operations agent | CRO and site selection, feasibility, monitoring oversight, TMF completeness checks, enrollment tracking | Trial operations |
| Pharmacovigilance agent (clinical stage) | Case intake, coding, narratives, aggregate reports, signal detection | Safety reports |
| Quality agent (QA/GxP) | SOPs, document control, vendor qualification, deviation and CAPA triage, data-integrity review, inspection readiness | Quality system |

### G. Business
| Job | What it does | Output / gate |
|---|---|---|
| Finance agent | Bookkeeping, runway and forecast models, tax and compliance calendars, audit support | Financial statements |
| Fundraising agent | Investor mapping, narrative, deck, data room, diligence Q&A drafting | Raise materials |
| BD agent | Scouting, partner mapping, outreach, CDAs, term-sheet and deal modeling, alliance management | Deal pipeline |
| Contracts and legal agent | NDAs, MSAs, SOWs, licenses, corporate housekeeping, compliance filings | Executed-ready contracts |
| IP agent | Invention disclosures, prior-art search, patent drafting and docketing, FTO analysis | Patent portfolio |
| Scientific communications agent | Publications, abstracts, website, investor updates | External communications |
| Advisor and KOL agent | KOL mapping, outreach, scheduling, briefing packs | Advisory network |

### H. Infrastructure and meta (jobs human biotechs rarely staff explicitly)
| Job | What it does | Output / gate |
|---|---|---|
| Verifier agents (per domain) | Independent checkers with test suites, golden datasets and adversarial cases: unit tests for science | Pass/fail on every artifact |
| Agent operations lead | Evaluates agents, versions skills and prompts, retires and replaces them, tracks cost and error rates | Agent performance reports |
| Integration engineer | Builds and repairs connectors to CRO portals, LIMS/ELN, eCTD tools, data sources | Working integrations |
| Security and access controller | Permissions, secrets, audit trails, anomaly detection | Access log |
| Systems validation agent | Documents validation and change control for agentic systems touching regulated records | Validation packages |
| Escalation router | Determines when an action needs a named human attestation and prepares the package | Attestation requests |

### Design rules implied by the roster (Claude's hypotheses)
- **Maker and checker are different agents with different data, prompts, and ideally model families.** Correlated errors across agents built on the same model are the main structural risk, not individual agent error.
- **Gates and artifacts are the interfaces, not titles:** target dossier, candidate selection memo, IND-enabling plan, IND. Each gate carries its red-team log and verifier results.
- **Irreversible or money-moving actions** (synthesis orders, contracts, submissions, payments) pass the spend governor and escalation router.
- **The external-world interface agents** (CRO sourcing, study directors, integration engineer) set the company's real speed, because CRO cycle time is not agentic.

### Boundary of an all-agent company
Agents plus a thin legal shell plus rented hands. Legal personhood, bank accounts, and regulations that name individuals (study director in GLP work, IND sponsor signatory, medical monitor, investigators, IRB) require accountable humans; physical work runs at CROs and CDMOs. How thin the shell can be is not settled here.

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
- **Load-bearing for the all-agent design: what is the source of independence between maker and checker agents, so that checks are not correlated errors?**
- Which roles on the roster are missing or should merge?
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
