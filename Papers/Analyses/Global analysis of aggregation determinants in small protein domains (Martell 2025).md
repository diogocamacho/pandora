---
type: paper-analysis
title: "Global Analysis of Aggregation Determinants in Small Protein Domains"
doi: "10.1101/2025.11.11.687847"
source: "https://www.biorxiv.org/content/10.1101/2025.11.11.687847v1"
authors: ["Cydney M. Martell", "Kamil K. Gebis", "Jeffrey N. Savas", "Gabriel J. Rocklin"]
year: 2025
venue: "bioRxiv"
peer_reviewed: false
clip: "[[Global Analysis of Aggregation Determinants in Small Protein Domains]]"
analyzed_on: 2026-10-14
verdict: solid
tldr: "A TMT-MS assay measures stress-induced aggregation for 18,987 small protein domains, and a structure-aware fine-tuned SaProt explains 43-55% of held-out variance — a landmark dataset that also honestly shows aggregation is largely unpredictable from current features and that existing predictors barely work."
reviewer_divergence: minor
tags: [paper, protein-aggregation, protein-language-model, high-throughput, mass-spectrometry, protein-design, saprot]
idea-supports:
  - "[[2026-10-03 scoring-function-oracle]]"
  - "[[2026-10-03 plm-novelty-oracle]]"
idea-challenges:
  - "[[2025-09-09 2click]]"
---

# Global Analysis of Aggregation Determinants in Small Protein Domains

## TL;DR & verdict
- A high-throughput, in-vitro, TMT-multiplexed mass-spec assay quantifies insoluble aggregation after thermal (50/75 °C) and acidic (pH 4) stress for 18,987 small domains (40–72 aa), spanning natural Pfam families, metagenomic sequences, and de novo designs.
- **Verdict: solid** — a genuinely large, well-replicated resource (triplicate, r>0.9 within-condition, HT-vs-purified r=0.66–0.78) with a correctly cluster-split ML benchmark; the structure-aware fine-tuned SaProt reaches R²=0.55 (75 °C), 0.43 (50 °C), 0.45 (pH 4). Not "strong" because the model explains under half the variance, external-dataset transfer is weak (r≈0.1–0.3), and it is an unreviewed preprint.
- Author/reviewer divergence is **minor**: the quietly important finding is negative — existing aggregation predictors (TANGO, AGGRESCAN, CamSol, SAP, etc.) correlate essentially zero-to-0.26, and single features never explain the majority of variance.
- Biggest weakness / most useful honesty: aggregation of globular domains is only partly a function of the features the field has been using; even hydrophobicity and pI leave most variation unexplained, and the model does not transfer well off-distribution.
- Matters directly for protein/therapeutic engineering and for any de novo design pipeline that must avoid aggregation — the dataset is the contribution as much as the model.

## Main idea
What actually determines whether a small folded domain aggregates under stress, and can we predict it? Prior predictors were built largely on amyloid/peptide data and perform poorly on globular proteins. The authors build a pooled expression + SEC-monomerization + stress + centrifugation + TMT-MS pipeline that reads out the soluble (non-aggregated) fraction as a log2 fold-change for ~19k domains at once, validate it against individually purified proteins, correlate ~1,600 sequence/structure features (plus measured folding stability) with aggregation, and fine-tune the structure-aware PLM SaProt on a cluster-split benchmark. It matters because aggregation is a core failure mode in biologics and de novo design, and the field lacked a large, controlled, globular-protein dataset.

## Key findings — claims ledger
| # | Claim | Evidence (fig/panel) | Grade | Reviewer | Confidence |
|---|---|---|---|---|---|
| 1 | HT MS assay quantifies aggregation for 18,987 domains, reproducibly | Fig 1C,E; r>0.9, SD 0.19–0.27 | direct | agrees — triplicate, high internal r | high |
| 2 | Pooled HT data matches individually purified proteins | Fig 2C; r=0.66–0.78 | direct | agrees — the key validity anchor | high |
| 3 | Sequence identity tracks aggregation similarity | Fig 2A; binned pair counts | indirect | agrees but weak at low identity; huge N inflates significance | medium |
| 4 | Hydrophobicity/pI correlate but never explain majority of variance | Fig 3B,C | direct | agrees — the honest core result | high |
| 5 | Existing predictors barely work (|ρ|=0–0.26) | Fig 3D | direct | agrees — important negative result | high |
| 6 | Structure-aware SaProt explains 43–55% held-out variance | Fig 4A,B | direct | agrees — proper cluster split (23% mean identity) | medium-high |
| 7 | Structure info improves prediction; AA composition alone 29–35% | Fig 4A,D | indirect | agrees; margin over sequence-only models modest | medium |
| 8 | Performance not yet saturated with data | Fig 4C (subsampling) | indirect | plausible extrapolation | medium |
| 9 | Model transfers poorly to external datasets | Fig S14; r≈0.1–0.3 | direct | agrees — bounds the model's reach | high |

## Methods audit
- Assay: pooled expression → SEC monomer isolation → 10 mg/ml → stress (50 °C/75 °C 20 min; pH 4 10 min; RT/pH7 controls) → centrifuge → TMT bottom-up MS on soluble fraction. Aggregation = log2(stressed/control normalized intensity). Clean, interpretable readout.
- Scale and QC: 18,987 domains (~82% of DNA library), ≥2 unique tryptic peptides (7–35 aa) required for MS detection; cysteines excluded to prevent disulfide crosslinking (sensible, but removes a biologically relevant aggregation channel).
- Replication: 3 technical replicates/condition, within-condition r>0.9; two independent metagenomic libraries with 1,050 overlapping domains (cross-library r=0.8–0.89).
- External validity: HT-vs-individually-purified r=0.66–0.78 (BCA soluble-loss as orthogonal method) — this is the load-bearing validation and it holds up moderately well.
- Limitations: a single concentration (10 mg/ml), only two stress axes, in-vitro only, small domains only; Cys exclusion; aggregation quantified as a scalar (no amyloid vs amorphous distinction, no kinetics).

## ML/computational audit
- **Train/test split is done right**: MMseqs2 clustering at 30% identity, clusters partitioned into train/test/validation, mean pairwise identity between sets ~23%, with matched phenotype/feature distributions. This is the correct way to avoid homology leakage in a PLM benchmark and is the main reason the 43–55% numbers are credible.
- Baselines are strong and fair: ridge regression (29–35%), XGBoost, and — critically — a head-to-head against published aggregation/solubility predictors (Fig 3D) where the best external tool reaches |ρ|=0.26. SaProt fine-tuned on an unrelated Meltome task is included to show task-specificity.
- Structure dependence probed with AlphaFold2 vs Boltz-2 (similar), and SHAP feature importance (Fig 4D) identifies hydrophobicity + folding stability for thermal, net charge for acidic — mechanistically coherent.
- No evidence of test-set tuning. The honest subsampling curve (Fig 4C) and the weak external transfer (Fig S14) both argue against over-claiming.
- Caveat: R²=0.43–0.55 is "explained variance on a held-out but same-distribution test set"; the external-dataset r≈0.1–0.3 is the more sobering generalization figure.

## Independent reviewer
### Reviewer's conclusions (data only)
From Figs 1–4, S14, Methods, blind to the abstract framing:
1. The MS assay produces internally consistent aggregation measurements across 18,987 domains (Fig 1E, r>0.9 triplicate) and agrees with individually purified controls (Fig 2C, r=0.66–0.78). **Strong — the dataset is real and validated.**
2. No single sequence/structure feature explains most of the variance; hydrophobicity and pI correlate but weakly, and effect sizes for topology/secondary-structure are small (<0.2) (Fig 3B,C). **Strong negative result.**
3. Published predictors perform near-randomly on this globular-domain data (|ρ|≤0.26, Fig 3D). **Strong — bounds the prior state of the art.**
4. A structure-aware fine-tuned PLM explains 43–55% of held-out variance under a strict 30%-identity cluster split (Fig 4A,B); structural input helps modestly over sequence-only (29–35%). **Medium-strong.**
5. The model does not transfer to external solubility/thermostability/amyloid datasets (r≈0.1–0.3, Fig S14). **Strong caution — reach is dataset-bounded.**
6. Thermal aggregation is driven by hydrophobicity + folding stability (counterintuitively, more stable sometimes aggregates more under thermal stress); acidic aggregation by net charge/pI (Fig 4D, SHAP). **Medium — mechanistically plausible, correlational.**
Cannot determine: in-vivo relevance; behavior of Cys-containing or larger multidomain proteins; amyloid-vs-amorphous nature of the aggregates.

### Authors vs reviewer
| Claim | Authors | Reviewer | Agreement |
|---|---|---|---|
| Large validated dataset | 18,987 domains, resource | confirmed, well-replicated | agrees |
| HT matches purified | r=0.65–0.79 | r=0.66–0.78 confirmed | agrees |
| Model explains variation | "43–55%" | correct on same-distribution test | agrees |
| Utility for engineering | "promising utility" | real but bounded; external r≈0.1–0.3 | weaker than claimed |
| Existing tools inadequate | implied | explicit: |ρ|≤0.26 | reviewer emphasizes more |
| Aggregation determinants | "identified features" | mostly still unexplained | reviewer found the negative result more central |

Divergence: **minor** — the authors largely report the limitations themselves; the reviewer simply weights the unexplained >45% of variance and weak external transfer as the headline rather than the 0.55 R².

## Adversarial context
### Steelman
This is the kind of dataset the aggregation field has lacked: large, controlled, globular (not amyloid-peptide), multi-stress, validated against purified proteins, and released with a correctly homology-split ML benchmark that exposes how poorly legacy predictors generalize. Even at R²=0.55 it is the best available model for small-domain thermal aggregation, and the data will outlive the model.
### Red team
Under half the variance is explained even in-distribution, and off-distribution transfer is weak — so the "utility for engineering aggregation-resistant proteins" claim is aspirational for anything outside the training manifold. Everything is in-vitro, single-concentration, Cys-excluded, scalar readout; whether these stress-aggregation scores predict real biologic developability or in-vivo behavior is untested. Preprint, not peer-reviewed.
### Alternative explanations
The 43–55% explained variance may partly reflect that aggregation under a fixed artificial stress is dominated by a few bulk properties (hydrophobicity, charge, stability) the model captures, while the unexplained majority is genuine stochastic/kinetic/structural nucleation that no static feature set can reach — i.e., the ceiling may be intrinsic, not a data problem (though Fig 4C argues more data still helps).
### Falsifying experiment
Prospectively design N aggregation-resistant variants using the 75 °C model and test them, plus test the model on an independent lab's globular-domain aggregation data generated by a different method. If predicted-resistant designs do not aggregate less than matched controls, or external accuracy stays at r≈0.1–0.3, the engineering-utility claim fails.

## Avenues to explore
- Can the aggregation readout become a selectable property in a de novo design scoring stack (filter designs by predicted aggregation before synthesis)?
- Is the unexplained variance reducible with kinetic/aggregation-pathway features, or is it an intrinsic ceiling?
- Extending to Cys-containing and multidomain proteins, and to in-vivo/developability correlates.
- Using the dataset to benchmark/critique PLM "developability" claims generally.

## Growing ideas
- ✅ [[2026-10-03 scoring-function-oracle]] — supports the premise: a large experimental phenotype dataset plus a fine-tuned PLM yields a better-than-biophysics scoring function for a design-relevant property (aggregation), exactly the oracle-over-hand-crafted-energies thesis; it also shows the realistic ceiling (R²~0.5) such oracles currently hit.
- ✅ [[2026-10-03 plm-novelty-oracle]] — reinforces that structure-aware PLMs fine-tuned on targeted assays extract signal legacy biophysical tools miss (existing predictors |ρ|≤0.26 vs SaProt R²=0.55), supporting PLM-based oracles for properties beyond function/novelty.
- ⚡ [[2025-09-09 2click]] — a caution for any "design-and-it-works" platform: aggregation of even small globular domains is still mostly unpredictable (>45% variance unexplained, weak external transfer), so pipelines that assume computationally-filtered designs are developability-safe will be wrong a large fraction of the time.
