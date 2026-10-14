---
type: paper-analysis
title: "Advancing nanopore technology toward protein identification and sequencing"
doi: "10.1016/j.tibs.2025.04.004"
source: "https://www.cell.com/trends/biochemical-sciences/fulltext/S0968-0004(25)00109-4"
authors: ["Verena Rukes", "Chan Cao"]
year: 2025
venue: "Trends in Biochemical Sciences"
peer_reviewed: true
clip: "[[Advancing nanopore technology toward protein identification and sequencing]]"
analyzed_on: 2026-10-14
verdict: solid
tldr: "A clear, well-organized review of nanopore strategies for protein fingerprinting and sequencing that honestly separates what is demonstrated (identification/fingerprinting) from what is still aspirational (de novo single-amino-acid sequencing)."
reviewer_divergence: minor
tags: [paper, nanopore, proteomics, single-molecule, protein-sequencing, electroosmotic-flow, review]
---

# Advancing nanopore technology toward protein identification and sequencing

## TL;DR & verdict
- A review, not primary research: it maps the design space for nanopore protein analysis into four problems — full-length identification, fragmentation-to-sequencing, controlled translocation, and PTM detection — and the matching engineering levers (EOF optimization, pore functionalization, analyte modification).
- **Verdict: solid.** It is accurate, current, and unusually disciplined about the gap between protein *fingerprinting/identification* (conceptually proven, near commercialization) and true *de novo* sequencing (still open). As a secondary source it carries no new data, so it cannot rate higher than solid on this rubric.
- Author/reviewer divergence is **minor**: the authors' own "Concluding remarks" and "Outstanding questions" already foreground the same caveats a skeptical reader would raise, so there is little daylight between the framing and the evidence they cite.
- Biggest weakness: like most reviews in a hot field, it presents single-demonstration results (specific pores, specific analytes) as generalizable strategies without a quantitative cross-method comparison of accuracy, throughput, or proteome coverage.
- Why it matters: it is a well-curated entry point to the nanopore-proteomics landscape and names the exact bottlenecks (per-residue sensitivity, controlled motion, tagging, dynamic range) that any venture in single-molecule proteomics must clear.

## Main idea
Proteomics lags genomics because proteoforms are vastly more complex than the 4-letter nucleic-acid alphabet and cannot be amplified. Nanopore sensing — mature for DNA — is being adapted to proteins, reading the ionic-current signature left as an analyte transits the pore. The review's organizing claim is that "protein analysis" is not one problem but several, each at a different maturity: full-length fingerprinting (closest to application), fragmentation into identifiable peptides, motion-controlled translocation (the only route the authors see to true *de novo* sequencing), and PTM detection. It then surveys the engineering strategies — electroosmotic flow (EOF) tuning, pore functionalization, analyte modifiers — that could close the gap to single-amino-acid resolution.

## Key findings — claims ledger
| # | Claim | Evidence (fig/panel) | Grade | Reviewer | Confidence |
|---|-------|----------------------|-------|----------|------------|
| 1 | Nanopore protein *fingerprinting/identification* is conceptually proven and near a commercializable, portable, low-cost format | Cites multiple primary demonstrations (full-length ID sections) | indirect (review of others' primary work) | agrees | High |
| 2 | True *de novo* protein sequencing with nanopores is not yet achieved; motion-controlled translocation is the most promising route | Concluding remarks; controlled-motion section | asserted/indirect | agrees | High |
| 3 | Weakly/heterogeneously charged proteins cannot be captured by electrophoresis alone; EOF is the key enabling lever | EOF engineering section citing FraC/PlyAB mutant work | indirect | agrees | High |
| 4 | Per-residue sensitivity remains the crucial unsolved problem in motion-controlled systems | Concluding remarks + Outstanding questions | asserted | agrees | High |
| 5 | PTM detection is feasible in principle but adds signal-interpretation complexity | PTM section | indirect | weaker than claimed (demonstrations are narrow) | Medium |

## Methods audit
Not applicable in the usual sense — this is a narrative review with no primary experiments, sample sizes, or statistics. The relevant methodological question for a review is *selection and balance*. On that axis it is strong: it covers competing pore scaffolds and strategies, cites primary literature for each claim, and explicitly lists open questions rather than overselling. What it lacks is any quantitative head-to-head (accuracy, read length, throughput, proteome fraction addressable) that would let a reader rank the strategies on evidence rather than narrative. No benchmark table is offered.

## Independent reviewer
### Reviewer's conclusions (data only)
Working only from the figures, schematics, and the mechanistic/engineering sections (setting aside abstract, intro, and concluding framing): the document is a taxonomy of mechanisms, not a dataset. From the mechanistic content alone one can conclude: (a) the physical argument that EOF, not electrophoresis, governs capture of weakly charged protein analytes is sound and well-supported by the cited mutant studies; (b) the schemes for controlled motion (enzyme ratcheting, DNA-tag threading) are presented as concepts with isolated proofs rather than as validated sequencing pipelines; (c) nothing in the figures demonstrates single-amino-acid discrimination at proteome scale — the strongest shown results are discrimination among a small defined set of analytes or PTMs. "Cannot determine" from this material: actual error rates, throughput, or how many of the ~20,000 human proteins (let alone millions of proteoforms) are distinguishable. The reviewer's independent read matches the authors' own hedging closely.

### Authors vs reviewer
| Claim | Authors | Reviewer | Agreement |
|-------|---------|----------|-----------|
| Fingerprinting is near application | Yes, with commercialization optimism | Plausible but no quantitative coverage/accuracy data shown | weaker than claimed |
| De novo sequencing is unsolved | Explicitly stated | Confirmed by absence of any single-residue, proteome-scale demonstration | agrees |
| EOF is the capture lever | Central engineering thesis | Mechanistically sound, well-cited | agrees |
| PTM detection feasible | Presented as a capability | Only narrow proofs visible | weaker than claimed |

## Adversarial context
### Steelman
This is exactly the review a strategist wants: it refuses to collapse "nanopore proteomics" into a single hype narrative, separates the near-term win (identification) from the moonshot (sequencing), and names the precise physical bottleneck (per-residue sensitivity under controlled motion). The EOF framing is the most useful contribution — it reframes the capture problem in a way that points directly at designable pore surfaces.

### Red team
Reviews in fast-moving fields systematically overweight the most recent flashy demonstration. Several "strategies" rest on one or two proof-of-concept papers from a small set of labs (often including the authors' network), and the absence of a quantitative comparison means a reader cannot tell whether any approach scales beyond a toy analyte panel. The commercialization optimism for fingerprinting is asserted, not evidenced by throughput or cost numbers.

### Alternative explanations
The persistent gap to *de novo* sequencing may not be an engineering problem that EOF/functionalization will solve but a fundamental signal-to-noise limit: 20 amino acids (plus PTMs) produce overlapping current-blockade distributions that no single-pass measurement can resolve. If so, the field's real future is multi-pass consensus or fingerprint-plus-database matching, not direct sequencing — which would reframe the whole roadmap.

### Falsifying experiment
A single demonstration of accurate, single-pass, single-amino-acid read-out across a full-length protein of unknown sequence (true de novo) in a motion-controlled pore would validate the review's optimistic throughline. Its continued absence over several more years would confirm the skeptical reading that fingerprint-plus-database is the real endpoint.

## Avenues to explore
- The EOF-as-capture-lever framing connects directly to the companion nanopore-engineering review in this batch, which quantifies how much *computational* tools (APBS, pKa prediction, MD) disagree about the very surface charges EOF depends on — a designability bottleneck.
- Protein-designed pores (RFdiffusion/Rosetta β-barrels) as the substrate for programmable fingerprinting: the identification problem may be more tractable via designed recognition than via better signal processing.
- Fingerprint-plus-database as the near-term commercial wedge for a lean proteomics venture, deferring de novo sequencing.

## Growing ideas
(No idea note in the vault has a genuine, specific connection — the nanopore-proteomics topic sits apart from the current protein-design, network-biology, and agentic-platform ideas. No forced links added.)
