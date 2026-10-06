---
type: paper-analysis
title: "GRASP: Graph Representation Learning with Assay Supervision for Molecular Properties"
doi: "10.64898/2026.09.28.755019"
source: "https://www.biorxiv.org/content/10.64898/2026.09.28.755019v1"
authors: ["S. P. Srivastava", "R. Gorantla", "S. K. Chundru", "H. Singh", "A. S. J. S. Mey", "R. K. Singh"]
year: 2026
venue: "bioRxiv"
peer_reviewed: false
clip: "[[GRASP Graph Representation Learning with Assay Supervision for Molecular Properties]]"
pdf: "[[GRASP assay supervision.pdf]]"
analyzed_on: 2026-10-06
verdict: mixed
tldr: "A carefully-benchmarked staged graph Transformer (ELECTRA-style pretraining + ChEMBL assay adaptation) that modestly beats weak baselines and roughly ties the one strong modern baseline (CheMeleon), while its central 'assay supervision helps' claim is admittedly confounded and not cleanly isolated."
reviewer_divergence: minor
tags: [paper, molecular-property-prediction, graph-neural-networks, pretraining, admet, ml-evaluation]
---

# GRASP: Graph Representation Learning with Assay Supervision

> Batch note: independent-reviewer step folded into the analyst's data-only pass for this 8-paper run.

## TL;DR & verdict
- 93.5M-param graph Transformer, two stages: (1) ELECTRA-style replaced-token detection on 1.54B ZINC20 presentations, (2) adaptation on ~512k ChEMBL molecules across 642 sparse binary assays. On a custom "OpenADMET-23" regression benchmark with cluster-held-out splits, full fine-tuning reaches mean MAE 0.374 vs CheMeleon 0.383, ECFP4-LightGBM 0.408, Chemprop 0.440.
- **Verdict: mixed.** Unusually careful stats/leakage work (cluster splits, bootstrap CIs, Holm-corrected tests, a dedicated structural-overlap leakage audit, stage-isolating ablations) — the real strength.
- **The headline "assay supervision helps" is confounded by the authors' own admission:** the GRASP-S1-vs-GRASP comparison (Table 4, +8.0%) mixes assay labels with extra training + exposure to the ChEMBL molecular distribution. Not a clean causal test.
- Against the one strong, relevant baseline (CheMeleon, 2025), the margin is 2.4% / 12-of-23 wins — a coin flip with overlapping stds. Significant wins are only over weaker baselines (Chemprop/GBM/RF).

## Main idea
Structure data is abundant but bioactivity is sparse and assay-incompatible, so most pipelines jump from self-supervision straight to endpoint fine-tuning and waste the large incomplete bioactivity matrices in ChEMBL. GRASP: learn structure at scale via replaced-token detection (RTD, ELECTRA-style discriminator over radius-0 atom tokens), then adapt on ChEMBL's 642 binary assays as intermediate supervision, then adapt per endpoint (full FT / LoRA / frozen mixing). Encoder = 12-layer graph Transformer with shortest-path relative attention. Two controlled questions: does RTD beat masked-token pretraining, and does sparse multi-assay adaptation improve the representation.

## Key findings — claims ledger
| Claim | Evidence | Grade | Confidence |
|---|---|---|---|
| Lowest mean MAE on OpenADMET-23 (0.374) | Table 1, A2 | supported (for methods shown) | high |
| Meaningfully beats strongest baseline (CheMeleon) | Table 1 (2.4%, 12/23, overlapping std) | weak / within noise | high |
| Beats weak baselines (Chemprop/GBM/RF) with significance | Table A3 (p=0.006–3e-5) | supported | high |
| Assay (bioactivity) supervision improves downstream | Table 4 (+8.0%, 21/23) | overstated/confounded (authors concede) | high |
| RTD > MLM pretraining | Table 3 (OpenADMET p=0.097 n.s.); Table A12 (TDC Holm p=0.034) | partial | medium |
| Full FT > LoRA > frozen | Table 2 (only FT-vs-frozen significant) | partial | high |
| Beats Mol-JEPA under matched protocol | Table A8 (ΔMAE −0.025, CI excludes 0) | supported | high |
| No ChEMBL→test molecular leakage | Tables A9/A10 (remove ≥0.70 Tanimoto; advantage retained) | supported (structural only) | high |

## Methods & ML audit
- **Benchmark:** custom OpenADMET-23 (not the known-flawed MoleculeNet — a plus), but author-reconstructed, so all baseline numbers are the authors' own reruns and cross-paper comparability is limited. Secondary: TDC ADMET (22 tasks, standard).
- **Splits:** cluster-held-out (scaffold-like) for OpenADMET (3 outer splits); scaffold splits for TDC. Good — avoids random-split optimism.
- **Baselines:** strong+recent (CheMeleon 2025, Mol-JEPA, Chemprop) + tuned ECFP4/RDKit LightGBM/RF. **Gap:** despite citing Uni-Mol, MolFormer, GROVER, MolCLR, MolE, none are benchmarked on OpenADMET; the one strong comparator (CheMeleon) is beaten only 2.4%.
- **Seeds/CIs:** strong — 100k-sample bootstrap CIs, Holm-adjusted Wilcoxon/sign, Friedman for adaptation modes. Caveat: OpenADMET ±std is split-to-split, not within-split seed noise.
- **Ablations:** RTD-vs-MLM and ChEMBL-adaptation-vs-not, but run at GRASP-Small (415M), not the 1.54B headline model (disclosed).
- **Tuning-on-test:** avoided (val-only HPO, test membership fixed).
- **Leakage:** molecule-level audit survives removing overlapping molecules (A9/A10); but this tests structural exposure, not whether a ChEMBL assay is the *same property* as a downstream endpoint — assay-level label leakage not fully excluded.
- **Availability:** code at github.com/caithmac/GRASP (not verified real vs stub). Data public. Step-1 compute accounting "unavailable" (honest gap). Funding/COI not reported.

## Independent-skeptic pass — divergences
- **"Value of intermediate bioactivity supervision"** rests only on a confounded Table 4 (authors say so). The +8% could be extra steps + in-distribution exposure, not assay labels.
- **"Improves property prediction"** vs CheMeleon = near coin flip (12/23, 2.4%, overlapping std). Real significant wins are over weak baselines.
- **RTD>MLM** fails significance on the primary benchmark (p=0.097); only TDC clears correction. Tested at 415M only.
- **TDC 13/22** has no significance test and overlapping stds — statistically indistinguishable from parity. "Competitive" fair; stronger reading not.
- Solid where narrow: the leakage audit and Mol-JEPA matched comparison genuinely support their claims.

## Adversarial context
- **Steelman:** methodologically honest — scaffold/cluster splits, bootstrap CIs, multiplicity correction, leakage audit that survives molecule removal, stage-isolating ablations, discloses the key confound. The staged recipe is a sensible, useful direction.
- **Red team:** confounded headline; strong-baseline tie; no Uni-Mol/MolFormer/GROVER comparison; author-reconstructed benchmark with author reruns; ablations at 415M not 1.54B; RTD>MLM not significant on primary.
- **Alternative explanation:** the modest edge may be a capacity/architecture effect (tuned 93.5M graph Transformer), not assay supervision — consistent with the near-tie vs CheMeleon and the confounded stage gap.
- **Falsifying experiment:** add a GRASP-Step-1 control trained the same extra steps on the same ChEMBL molecules with labels removed/shuffled. If it matches full GRASP, assay supervision contributes nothing.
- **Novelty:** components prior art (ELECTRA/RTD, shortest-path relative attention, bioactivity supervision à la MolE); the staged sparse-assay recipe is the novel combination. Not verified.

## Integrity & reproducibility
Preprint, not peer-reviewed, CC-BY-NC, posted 2026-10-02. Repo named (not inspected). Data public (ZINC20/ChEMBL/TDC). Early-pretraining compute accounting unavailable (honest). Funding/COI not reported. Affiliations: Shiv Nadar University; University of Edinburgh.

## Avenues to explore
- The clean ablation GRASP omits (labels-removed continued pretraining control) is the reusable test for any "intermediate supervision helps" claim — hold extra-training and in-distribution exposure fixed.
- Reading lesson: "beats weak baseline by a lot, strong baseline by a little on a coin-flip of endpoints" = "competitive with SOTA," not "improves prediction."

## Growing ideas
No forced `ideas/` link. A data point on molecular-property foundation models; not a specific support/challenge to a venture note.

## References
### Verified
- This paper: Srivastava et al., 2026, bioRxiv — https://doi.org/10.64898/2026.09.28.755019 (read in full incl. appendix).
### Unverified (do not cite until checked)
- Cited within: Clark 2020 (ELECTRA); Ying 2021 (Graphormer); Burns 2025 (CheMeleon); Méndez-Lucio 2024 (MolE); Irwin 2020 (ZINC20); Huang 2021 (TDC) — not independently verified.
