---
type: idea
date: 2026-10-08
mode: challenge
status: open
scope: founder-thesis-only
tags: [idea, network-biology, target-discovery, small-molecules, platform, agents, founder-thesis]
related_ideas: ["[[2026-06-18 biotech-of-one]]", "[[2026-06-18 founder thesis — RWE-driven better-in-class biotech]]", "[[💡 Network Target Foundry]]", "[[💡 2025-01-22 Patient population data]]", "[[💡 Conditional invariants]]", "[[Building DiseaseNets]]", "[[2025-09-09 2click]]", "[[2025-09-21 causalab]]"]
---

# A molecular-first network-biology platform for small-molecule target discovery, run as a "biotech of one"

## The idea
A founder-thesis venture, Diogo as CEO/CSO/CTO, run as a lean company where agents and outsourced vendors fill most functions. Small molecules. The differentiator is a network-biology platform for drug discovery, built on **molecular data only** for now; real-world evidence (RWE) is deferred to a later phase. It is a **platform play**, not a single-asset company. Building blocks from the vault: Network Target Foundry, patient stratification, DiseaseNets, CausaLab. Founder thesis only; no FSP/Abio angle.

## Relationship to the earlier note
This is a branch, not an edit. [[2026-06-18 biotech-of-one]] and its companion memo describe an RWE-driven, indication-first, better-in-class **asset** company ("not a platform play"). This note is molecular-first, RWE-deferred, and a platform. The earlier notes are left as they were, as the record of that thinking.

## What's load-bearing
1. **The network layer beats a simpler baseline, prospectively.** Not yet shown anywhere in the vault.
2. **Stratum-level network targets can become single-agent small-molecule programs.** Network control tends to output multi-node sets; small molecules need a tractable single mechanism or a defensible combination.
3. **A CRO-run perturbation loop can turn association into cause** at acceptable cost and cycle time (weeks, not days).
4. **A molecular-only platform has a moat.** With RWE deferred it must come from a better method, proprietary perturbation data, or both. Public-data network analysis is replicable by anyone.

## Direction as committed by Diogo (2026-10-08)
- Differentiation: network biology + RWE evidence, then narrowed: **platform play, molecular data only, RWE later.**
- Pull in: Network Target Foundry, stratification, DiseaseNets, CausaLab.
- Function list given: CFO; COO; head of strategy and ops; target ID team; comp bio / ML / comp chem; biology; pharmacology; assay dev; CMO org incl. regulatory; BD.

## Design constraints (committed by Diogo, 2026-10-08, in answer to the falsifier question)
- **Avoid crowded targets.** The platform must not converge on the targets everyone else is pursuing.
- **No transcription-factor modulation.** TFs are excluded as targets.
- **Multi-node targeting is intentional.** Premise: targets are chosen network-first, for the biggest biological correction, not one target per disease.
- **Correction metric (committed):** biological correction = distance between network topologies (disease/post-intervention vs. healthy).
- **Modeling approach (committed):** ODE modeling of the network. Observed transcription profiles and assay data are tied to modeled expected behavior; additional data is expected to continuously improve predictability against target outcomes.
- **Kill criterion offered:** untractability of targets. Assessed as a feasibility gate, not a falsifier: it can pass while the network layer adds nothing over a simpler baseline.

## Vault grounding (what exists, no embellishment)
- **Network Target Foundry** — concept only. Control-theory driver nodes / minimal control sets, indication- and modality-agnostic, three business models (internal engine, partner platform, data/analytics). Market-size figures are idea-note estimates, unsourced.
- **DiseaseNets** — R pipeline spec captured as Cursor prompts: Spearman coexpression restricted to prior (BioGRID/STRING/ENCODE/TRRUST) + ANN-halo edges, Fisher-z rewiring with flip-aware weights, ΔPersonalized PageRank, node2vec displacement (Procrustes-aligned), rank fusion (0.40/0.35/0.25). Worked example: lung, GSE19804. **No results recorded.** Validation hooks (CGC recall, GSEA, independent-dataset stability) are optional; CGC recall is retrodiction of known cancer genes.
- **2click POC** — differential-edge (Δz) cliques on a BioGRID scaffold, BH FDR, donor-level replication, ship gate Jaccard ≥ 0.7 on resampled top-K.
- **CausaLab** — causal GRN stack (NetDecoder, SIGNET, MUUMI, CORNETO). Own TRL estimate: causal GRN tools 3–4, multi-omics fusion 4–5. The 85–90% and >95% accuracy figures are **targets, not measurements.** Synthetic-circuit layer is another modality; out of scope here.
- **Stratification** — no dedicated note found. Treated as seeded by [[💡 2025-01-22 Patient population data]] (consensus signature across patients → disease subnetwork overlaid with perturbation data) and [[💡 Conditional invariants]] (drivers that do not change in expression), plus Diogo's prior patient-stratification platform work per his professional profile. To be corrected if a specific note was intended.

## External reference: Stanford "Virtual Biotech"
Zhang, Eckmann, Miao, Mahon, Zou; bioRxiv 2026-02-23, not peer reviewed; plus Zou's VB Transform talk. Stanford Medicine article body not retrievable; preprint full text not read.
- CSO agent orchestrating domain-specialist agents and 37,000+ clinical-trial agents over 55,984 trial outcomes. Supports the orchestrator-over-specialists shape.
- Headline stat (cell-type-specific targets ~48% more likely to reach market) is a trial-level association; no baselines or CIs in the abstract.
- The Merck "independent validation" of the B7-H3 ADC design looks like retrodiction of a target already in the clinic. **Unconfirmed.**

## Platform architecture v0 (Claude synthesis; unvalidated)
0. **Molecular data spine** — public/consortium cohorts, perturbation resources, genetics; pinned versions and provenance.
1. **Condition-specific networks** — DiseaseNets / 2click: priors + data-derived edges, differential rewiring, edge types kept separate.
2. **Stratification** — per-patient / per-subcohort subnetworks; consensus signature per stratum; strata as the unit of target ID. RWE attaches here later.
3. **Causal + control layer** — CausaLab-style causal GRNs and Foundry controllability → minimal driver sets per stratum; conditional invariants as an explicit class.
4. **Tractability filter** — small-molecule druggability, ligandability, ChEMBL / Open Targets evidence.
5. **CRO perturbation loop** — CRISPRi / Perturb-seq in disease-relevant cells; where association becomes cause.

## Org design v0 (Claude's first pass; not pressure-tested)
Each function split three ways: accountable human / agent layer / outsourced.

| Function | Human (accountable) | Agent layer | Outsourced / fractional |
|---|---|---|---|
| CEO/CSO/CTO | Diogo | Orchestrator "CSO agent," platform ops | Platform engineer |
| CFO | Fractional CFO | Runway and scenario modeling, non-dilutive scouting | Accounting, audit |
| COO + Strategy | One person early | Portfolio and vendor management, landscape | CRO contract management |
| Target ID (network bio) | 1 senior network biologist / statistical geneticist | KG reasoning, MR/GWAS, perturbation mining, evidence scoring | Perturb-seq / CRISPR screens at CROs |
| Comp bio / ML / comp chem | 2–3 leads | Generative chemistry, FEP, docking, ADMET models | Cloud compute |
| Biology | Head of biology (study director) | Experiment design, analysis, QC | Cell biology and in vivo at CROs |
| Pharmacology | 1 pharmacologist | PK/PD modeling | In vivo studies |
| Assay dev | 1 assay scientist as scientific buyer | Protocol/SOP drafting, data QC | Assay build and run at CROs |
| CMO + Reg | Fractional CMO + regulatory consultant | TPP, protocol, IND drafting | Clinical ops CRO |
| BD | Diogo + 1 BD lead | Landscape and asset scouting | Banker / counsel |

- **Gaps in the stated list:** medicinal chemistry (human lead to own design-make-test and arbitrate generative output), DMPK/ADME, toxicology/safety, CMC/formulation, clinical ops/biostat/clin pharm, QA/GxP, IP/legal.
- **Under a platform play:** BD becomes revenue-critical; data/compute and validation (assay dev, pharmacology) move forward; CMO/regulatory can stay fractional until an asset exists.
- Agents compress analysis and drafting, not wet-lab cycle time. CFO and BD are the least agent-able (relationship-gated). Three founder hats is a single point of failure; decide which to delegate first.

## Strongest case for
Best version so far, not yet earned: the field's target ID leans on association and known biology, while the vault already holds a working differential-network pipeline, a stratification seed, and a causal-GRN design. Stratum-level, causally supported network targets, validated through a perturbation loop that competitors do not run on disease-matched cells, is a plausible differentiated platform. Nothing in the vault yet tests it.

## Strongest case against
1. **No falsifier.** DiseaseNets' validation hook is known-gene recovery, the same retrodiction standard flagged on the Stanford/Merck claim. Genetic support is the established predictor of target success; the network layer has to beat a genetics-first baseline on held-out, prospective data.
2. **Multi-node vs single-agent.** Foundry output is minimal control sets; development and regulation favor single mechanisms.
3. **Undruggable drivers, now a hard constraint.** With TFs excluded, the control problem is restricted to druggable actuators. How much corrective power survives that restriction is unmeasured.
4. **Commoditization.** Vault clippings ([[Uneven Frontiers]], [[AI Versus Eroom's Law]], 2026-W40 Deep Synthesis) argue discovery AI is commoditizing and durable value sits in clinical development. A molecular-only discovery platform sits on the commoditizing side; deferring RWE moves it further that way.
5. **Moat without RWE.** Public-data network analysis is replicable; moat has to come from method or proprietary perturbation data.
6. **"Biggest biological correction" is undefined.** If correction is measured as distance to a healthy network or transcriptional state, the objective is signature reversion one level up, the abstraction gap named in [[2026-06-18 biotech-of-one]] (chemistry develops against targets, not signatures). A multi-node set also multiplies tox, CMC and clinical burden unless it is a combination of existing mechanisms or a designed-polypharmacology molecule.
7. **Hub and study bias vs. crowded-target avoidance.** An impact-maximizing network ranking drifts toward hubs and well-studied genes, which is where the crowd is (prior networks such as BioGRID/STRING track research effort). DiseaseNets' degree-bin z-scoring only partly corrects this. Crowdedness needs an explicit, measured term in the ranking.
8. **Topology distance is not yet a measurement.** It is edge-level, so it is distinct from expression-level signature reversion, but the state-vs-target unit mismatch remains unless the target-set → post-intervention-topology mapping is credible. Gaps: (a) condition-specific networks are inferred from many samples per condition, so one CRO perturbation does not yield a network; (b) no stated noise floor (the 2click ship gate of Jaccard ≥ 0.7 implies turnover on the order of a third in top-K across resamples), and a distance below between-replicate variation is unmeasurable; (c) coexpression topology is associative, so predicting the post-intervention network needs a causal/dynamical model; (d) a small molecule delivers partial, noisy inhibition, not a knockout; (e) no calibration set links topological distance to phenotype or efficacy.
9. **ODE layer: identifiability, activity, baseline, transfer.** (a) A disease subnetwork of hundreds of nodes has far more parameters than CRO-scale data constrains, and prior- or coexpression-derived topology carries no kinetic structure; steady-state snapshots cannot fix dynamics, so time-resolved perturbation data is required. (b) Small molecules change protein activity, which transcript-level ODEs do not see (an enzyme inhibitor can leave its target's mRNA unchanged); DiseaseNets is transcript-only, so a proteomic/phospho layer is implied. (c) Baseline risk: Ahlmann-Eltze, Huber and Anders (bioRxiv 2024; Nature Methods per the title record) report that deep-learning perturbation-effect predictors did not beat simple linear baselines; a calibrated ODE must beat additive/linear baselines on held-out perturbations or it adds cost without predictive value. (d) "Continuously improves" is a transfer claim: if each disease or cell context needs its own calibration, cost scales linearly and the flywheel does not compound; in vitro to patient-tissue is a further gap. (e) How the ODE output becomes a topology (and a distance) is still undefined.

## Open questions
- **Falsifier (partly answered):** the only kill criterion offered so far is target untractability, a feasibility gate. Still missing: the comparator (genetics-first baseline), the metric, the held-out data, and the threshold.
- **Correction (partly answered):** defined as distance between network topologies. Still missing: which distance, how the post-intervention network is obtained, the noise floor, and a calibration set tying distance to efficacy.
- **Post-intervention network (partly answered):** simulated via ODE model, calibrated to observed transcription/assay data. Still missing: parameter identifiability at the chosen scale, time-resolved data plan, activity-level (proteomic/phospho) layer, and partial-inhibition handling.
- **Load-bearing (open): the held-out test.** Which perturbations are withheld, which baseline (linear/additive) must the calibrated ODE beat, and what error margin makes Diogo drop the ODE layer?
- Parked: what is an RWE-derived edge in the graph, and what makes it causal? Returns when RWE returns.
- Which stratification note was intended, if any?
- Venture home, on founder terms (independent path); timing relative to current role. Not discussed.

## Whitespace check
Network-biology-first and causal-inference players named in Diogo's CausaLab table: Verge Genomics, GNS Healthcare, BenevolentAI, with Recursion and insitro as the large data-first incumbents; Selventa as the historical precedent. Landscape not re-verified for 2026. Not yet established where a molecular-first, stratum-level, perturbation-validated platform sits against them.

## Related ideas
- [[2026-06-18 biotech-of-one]] — origin; RWE-driven asset company, "not a platform." This note branches from it.
- [[2026-06-18 founder thesis — RWE-driven better-in-class biotech]] — companion memo; RWE data-path gap is deferred here.
- [[💡 Network Target Foundry]] — platform concept this note adopts.
- [[Building DiseaseNets]] / [[2025-09-09 2click]] — layer 1 specs.
- [[2025-09-21 causalab]] — causal GRN stack for layer 3.
- [[💡 Conditional invariants]] — explicit driver class for layer 3.
- [[💡 2025-01-22 Patient population data]] — stratification seed.

## Next steps
Specify the held-out perturbation test and the linear/additive baseline the ODE layer must beat, the noise floor of the topology distance, and a calibration set linking distance to efficacy; include a measured crowdedness term. No further design work until those are set.
