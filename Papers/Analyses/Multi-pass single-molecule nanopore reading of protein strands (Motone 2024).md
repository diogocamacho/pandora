---
type: paper-analysis
title: "Multi-pass, single-molecule nanopore reading of long protein strands"
doi: "10.1038/s41586-024-07935-7"
source: "https://www.nature.com/articles/s41586-024-07935-7"
authors: ["Keisuke Motone", "Daphne Kontogiorgos-Heintz", "Jeff Nivala"]
year: 2024
venue: "Nature"
peer_reviewed: true
clip: "[[Multi-pass, single-molecule nanopore reading of long protein strands]]"
analyzed_on: 2026-10-14
verdict: solid
tldr: "A ClpX unfoldase ratchets long protein strands back through a CsgG pore on a commercial MinION in reproducible ~2-residue steps, giving single-amino-acid sensitivity, reread-based accuracy gains, PTM mapping, and folded-domain reads — real proof-of-concept, but de novo sequencing is not achieved."
reviewer_divergence: minor
tags: [paper, nanopore, protein-sequencing, proteoform, clpx, ptm-mapping, single-molecule]
idea-supports:
  - "[[💡 Immune USB]]"
  - "[[Protein Design Meets Single-Molecule Detection Towards Programmable Nanopore Sensors]]"
---

# Multi-pass, single-molecule nanopore reading of long protein strands

## TL;DR & verdict
- Threads a protein into a CsgG pore electrophoretically, then uses cis-side ClpX+ATP to pull it back out slowly, producing reproducible ionic signatures on an unmodified commercial MinION — a genuine engineering advance over prior trans-motor setups.
- **Verdict: solid** — single-amino-acid sensitivity, ~2-residue ClpX stepping (1.96 and 1.89 aa by two independent algorithms), reread-driven accuracy gains, site-specific PTM mapping, and folded-domain reads are all demonstrated with real data, large n, and proper statistics. Not "strong" only because sequencing is substitution-in-known-context classification, not de novo, and the biggest accuracy numbers are simulated rereads.
- Author/reviewer divergence is **minor**: the one thing to watch is that 20-way single-read accuracy is only 28%, and the headline reread accuracies (61%, 99%) come from a resampling *simulation*, not multiplexed physical rereads.
- Biggest weakness: PASTOR substrates are synthetic designed scaffolds with spaced single mutations; natural proteins require appended synthetic termini and will unfold less cleanly — the gap to real proteoforms is explicitly unclosed.
- Matters a lot: this is among the most credible routes to single-molecule, full-length proteoform readout, with immediate protein-barcoding and PTM-monitoring applications.

## Main idea
Can intact, full-length protein strands be read on a commercial nanopore array? The team pairs a CsgG pore with the ClpX unfoldase as a cis-side molecular motor: electrophoresis threads the strand in, ClpX pulls it back out in slow, processive steps that generate interpretable current. On designed "PASTOR" substrates (repeating blocks with single central mutations flanked by double-tyrosine markers) they resolve single amino acids, measure ClpX step size, build a volume+charge sequence-to-signal biophysical model, reread single molecules via a proline "slip" sequence, map kinase PTMs, and translocate a folded titin domain. It matters because mass spec and Edman degradation struggle with full-length single-molecule proteoforms, and this is a label-free alternative on existing hardware.

## Key findings — claims ledger
| # | Claim | Evidence (fig/panel) | Grade | Reviewer | Confidence |
|---|---|---|---|---|---|
| 1 | ClpX pulls captured protein out; ATP-dependent | Fig 1b,c; ED Fig 1 | direct | agrees — ATP/ATPγS controls | high |
| 2 | Signal differences track mutation positions; sequences form distinct clusters | Fig 1c; PERMANOVA P<1e-6 | direct | agrees | high |
| 3 | ClpX steps ~2 residues (1.96±0.25; 1.89±0.28) | Fig 2d; ED Fig 3 | direct | agrees — two independent algorithms, n=776/456 | high |
| 4 | Single-AA sensitivity via volume-exclusion + charge effects | Fig 2f; ED Fig 4 | direct | agrees, mechanism partly inferred | medium-high |
| 5 | Biophysical model matches real traces (top 0.3% of random) | ED Fig 5f | direct | agrees — DTW-ranked vs random controls | high |
| 6 | 20-way single-read AA classification 28% (vs 5.5% dummy) | ED Fig 6; Table 2 | direct | agrees — modest but >>chance | high |
| 7 | Rereading lifts 20-way accuracy 28%→61%, 7-way 66%→99% | ED Fig 7d | indirect | weaker — from resampling simulation, not physical rereads | medium |
| 8 | >1B decodable protein barcodes feasible | ED Fig 7e; Supp Table 1 | asserted/projection | weaker — simulation-based projection | low-medium |
| 9 | Site-specific PKA vs CKII phosphorylation mapped; >100 proteoforms quantified | Fig 5; ED Fig 8 | direct | agrees — strong statistics (Mann-Whitney, Bonferroni) | high |
| 10 | Folded titin domain unfolded and read end-to-end | Fig 6; ED Fig 9 | direct | agrees — dTitin control supports unfolding interpretation | medium-high |

## Methods audit
- Platform: commercial MinION R9.4.1, CsgG pore variant, ClpX-ΔN6 covalent hexamer. Real experimental data throughout.
- Stepping: two independent segmentation algorithms (Bayesian n=776; t-test n=456) converge on ~2 aa — this is the paper's cleanest, most mechanistically important result and it resolves a prior literature disagreement (tweezers said 5–8 aa).
- Classification: hyperparameter-tuned random forest, 5-fold CV on train, evaluated on a **fixed out-of-sample test set** selected by linear programming for class balance (79.6/20.4 split). Proper held-out evaluation, no test-set tuning. Good.
- PTM stats: Mann-Whitney with Bonferroni correction, PERMANOVA with 1e6 permutations; large per-condition n. Rigorous.
- Deamidation handled explicitly (N→D relabeling above a threshold) — a potential confound surfaced and controlled, not hidden.

## ML/computational audit
- No train/test leakage in the core classifier: out-of-sample experiments form the test set, minority classes upsampled only in training.
- **Caveat on headline accuracy**: the reread accuracy gains (ED Fig 7d) and the barcode capacity (ED Fig 7e, >1B) come from a *reread simulation* using 100 random 80/20 splits "necessary to estimate the accuracy with a large number of rereads, given the data limitation." So the strong multi-read numbers are modeled, not from physically rereading the same molecule 10×.
- Biophysical model constants (Vc, Nc, Pc) fit empirically to minimize DTW distance on a training subset, then validated against random-sequence null — appropriate.
- Baseline: dummy classifier included (5.5% for 20-way); several classical + CNN models compared, random forest won.

## Independent reviewer
### Reviewer's conclusions (data only)
Blind to abstract/discussion, from Methods, Results, figures, Extended Data:
1. ClpX extracts captured proteins ATP-dependently and the resulting traces cluster by sequence (Fig 1; PERMANOVA P<1e-6). **Strong.**
2. ClpX translocates in ~2-aa steps — 1.96±0.25 (n=776) confirmed by 1.89±0.28 (n=456) via a different algorithm (Fig 2d, ED Fig 3). **Strong; the standout mechanistic result.**
3. Current depends on residue volume (exclusion) and charge, enabling single-AA discrimination with a validated volume+charge model ranking true sequence in top 0.3% (Fig 2f, ED Fig 5f). **Strong.**
4. Single-read discrimination is real but limited: 100% for dissimilar pairs (Y vs D), only 28% for 20-way (vs 5.5% dummy), L/I and high-variance C hard (ED Fig 6). **Medium-strong; honestly modest.**
5. Reread improvements to 61%/99% and >1B barcodes are *simulation-derived* (ED Fig 7d,e), not from physical multi-pass reads; treat as projections. **Medium/weak as demonstrated capability.**
6. Kinase PTM mapping is strongly supported — PKA RRXS vs CKII SXXD/E specificity with large n and corrected p-values (Fig 5, ED Fig 8); folded titin reads supported by the destabilized dTitin control (Fig 6, ED Fig 9). **Strong.**
Cannot determine: de novo sequencing capability (not attempted) and performance on natural, non-designed proteins (only synthetic PASTORs + one titin domain + Aβ).

### Authors vs reviewer
| Claim | Authors | Reviewer | Agreement |
|---|---|---|---|
| ClpX 2-residue stepping | demonstrated, resolves literature | confirmed by two algorithms | agrees |
| Single-AA sensitivity | demonstrated | confirmed via model + classification | agrees |
| Reread → high accuracy | "99% for 7-way" | simulation-derived projection | weaker than claimed |
| >1B barcodes | "feasible" | projection, not built | weaker than claimed |
| PTM mapping | site-specific, >100 proteoforms | strongly supported | agrees |
| Folded-domain reading | end-to-end | supported; refolds in trans, slow | agrees (scoped) |
| De novo sequencing | explicitly future work | not demonstrated | agrees |

Divergence: **minor** — the authors are careful and label simulations as such; the only thing a reader could over-extrapolate is treating the reread/barcode numbers as achieved rather than projected.

## Adversarial context
### Steelman
This is the credible blueprint for single-molecule proteoform analysis on hardware people already own. It solves the cis-side motor problem that blocked commercial-array compatibility, nails the ClpX step size with converging independent methods, validates an a-priori signal model, and demonstrates a real application (single-molecule kinase PTM mapping) that mass spec cannot do at single-molecule resolution. The reread concept is a genuine route to accuracy.
### Red team
"Sequencing" here is classifying a single known-position substitution within a designed scaffold — not reading an unknown sequence. 20-way single-read accuracy is 28%; everything better is simulated. Natural proteins need appended synthetic N/C termini, and some domains will resist ClpX unfolding (titin already shows repeated failed attempts and back-slipping). Throughput is limited by a two-step flow-cell loading protocol.
### Alternative explanations
The distinct per-sequence clusters are driven heavily by the double-tyrosine markers and spaced single mutations engineered to not co-occupy the pore; without that design, overlapping residue contributions (the ~20-aa sensing window) would entangle signals — so the clean separation is partly a property of PASTOR design, not of general protein reading.
### Falsifying experiment
De novo read an undesigned natural protein (no spaced markers, native sequence) and recover its sequence/PTMs above a context-model baseline. If accuracy collapses because overlapping residues in the 20-aa window cannot be deconvolved, the generality claim fails.

## Avenues to explore
- Continuous single-step loading (ClpX prebound, activity gated by capture) to fix throughput — the authors' own next step.
- De novo aminocaller training on large real datasets; combining the biophysical forward model with learned inverse models.
- Programmable/engineered pores (links to the programmable-nanopore-sensor idea) to widen residue contrast and shrink the sensing window.
- Protein barcoding as a near-term commercial wedge independent of full sequencing.

## Growing ideas
- ✅ [[💡 Immune USB]] — strongly supports the core premise that single molecules of protein can be read and PTM-decoded at single-amino-acid resolution on commodity nanopore hardware, the enabling readout for a molecular-information "USB" concept.
- ✅ [[Protein Design Meets Single-Molecule Detection Towards Programmable Nanopore Sensors]] — direct reinforcement: designed protein substrates (PASTORs) plus a motor and a biophysical signal model deliver programmable, interpretable single-molecule readout, exactly the design-meets-detection thesis.
