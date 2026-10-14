---
type: paper-analysis
title: "Identification of amino acids with sensitive nanoporous MoS2: towards machine learning-based prediction"
doi: "10.1038/s41699-018-0060-8"
source: "https://www.nature.com/articles/s41699-018-0060-8"
authors: ["Amir Barati Farimani", "Mohammad Heiranian", "Narayana R. Aluru"]
year: 2018
venue: "npj 2D Materials and Applications"
peer_reviewed: true
clip: "[[Identification of amino acids with sensitive nanoporous MoS2 towards machine learning-based prediction - npj 2D Materials and Applications]]"
analyzed_on: 2026-10-14
verdict: mixed
tldr: "MD simulations show a single-layer MoS2 nanopore separates the 20 amino acids by ionic current + residence time, and ML classifies them at up to 99.6% — but the 99.6% is an in-distribution grid fit, while the realistic heterogeneous-chain test drops to 62.5%."
reviewer_divergence: minor
tags: [paper, nanopore, molecular-dynamics, amino-acid-sensing, machine-learning, mos2]
idea-supports:
  - "[[💡 Immune USB]]"
idea-challenges:
  - "[[Next-generation deep learning based on simulators and synthetic data]]"
---

# Identification of amino acids with sensitive nanoporous MoS2 towards machine learning-based prediction

## TL;DR & verdict
- Extensive all-atom MD (~66 µs aggregate, >4,000 trajectories) characterizes ionic current and residence time for all 20 amino acids translocating a 1.85 nm MoS2 pore; the two observables separate the residues into interpretable physicochemical classes.
- **Verdict: mixed** — the biophysics and the separability are convincing and well-sampled, but the 99.6% random-forest accuracy is measured on an in-distribution labeled grid; the only realistic test (a mixed 16-residue chain) gives 62.5%.
- Author/reviewer divergence is **minor**: both read the clean per-residue separation as the real result and the 99.6% as optimistic.
- Biggest weakness: homopeptide training vs. heterogeneous-chain reality — the generalization gap (99.6% → 62.5%) is the honest headline, and it is driven by neighbor/context noise the training data never sees.
- Matters as a foundational feasibility argument for protein identification on atomically thin solid-state pores; purely computational, no experiment.

## Main idea
Could an atomically thin MoS2 nanopore identify individual amino acids well enough to support protein sequencing? Using LAMMPS MD, the authors translocate 16-residue homopeptides of each amino acid through a MoS2 pore under 200 mV bias, measure ionic current (blockade) and per-residue residence time, and cluster the 20 residues. They then train logistic regression, k-NN, and random forest to classify residue identity from the current/time pair. It matters because solid-state 2D pores are thin enough (3-atom lattice) to in principle resolve single residues, unlike thick Si3N4 membranes.

## Key findings — claims ledger
| # | Claim | Evidence (fig/panel) | Grade | Reviewer | Confidence |
|---|---|---|---|---|---|
| 1 | Current + residence time separate 20 AAs into physicochemical classes | Fig 3a,b | direct | agrees — well-sampled, interpretable | high |
| 2 | Residence time scales as power law with mass (T_R ∝ M^5.34) | Fig 3c + SI | indirect | plausible; 5.34 exponent over-fit to few points | medium |
| 3 | Random forest classifies AA at 99.6% | Fig 4c | asserted/in-distribution | weaker — grid fit on labeled means, not held-out molecules | low-medium |
| 4 | Smaller (1.85 nm) pore ~20× more sensitive than 2.52 nm | Fig 6 | direct | agrees for W vs Y case | medium |
| 5 | Heterogeneous chain classified at 62.5% (RF) | Table 1 | direct | agrees — the realistic number | medium |
| 6 | 2.8M hypothetical readings predictable | Fig 4 grid | asserted | overstated — grid squares, not validated predictions | low |

## Methods audit
- MD: CHARMM27, TIP3P water, ~1 M NaCl, 200 mV bias, external pulling force (0.42–1.18 pN) needed because 16/20 AAs are neutral. ~32,000 atoms/box, 40 ns production.
- Sampling is a strength: ≥200 replica trajectories per amino acid, 100 simulations per residue for residence-time statistics, ~66 µs aggregate — genuinely extensive for 2018 MD.
- Validation of pore conductance against experimental MoS2 values (2.69/4.96/10.64 nS) — good sanity check.
- Weakness: training data is homopeptide translocations at one force regime; the heterogeneous chain uses a *different, smaller* per-residue force (0.45 pN), forcing a normalization hack (divide by max current/time) to reuse the homopeptide-trained model. This is an uncontrolled domain shift.
- MCCV 80/20 split for classifier accuracy — but the "data points" are 100 current/time samples per residue, not independent molecules, so splits leak within-residue correlation.

## ML/computational audit
- **Leakage/benchmark**: the 99.6% comes from predicting the amino-acid class of grid squares in current/time space, with class means marked from the same labeled data. k=3 k-NN and RF memorize the labeled cloud; accuracy measures in-distribution recall, not out-of-molecule generalization.
- **Baseline strength**: three classical models compared (LR 72.45%, k-NN 94.55%, RF 99.6%); the LR number is a useful floor showing the classes are not linearly separable — fine.
- **Hyperparameters**: RF n_estimators=9 (very small), k-NN k=3; little tuning reported — so 99.6% is not even an optimized ceiling, which makes its in-distribution nature more obvious.
- The realistic 62.5% on the mixed chain is the number that generalizes; the authors correctly attribute the drop to noise and neighbor effects.

## Independent reviewer
### Reviewer's conclusions (data only)
Blind to abstract framing, from Figs 2–6, Table 1, Methods:
1. Ionic current and residence time, averaged over hundreds of trajectories, cleanly separate the 20 residues into size/charge/hydrophobicity classes (Fig 3a,b). **Strong — this is the real, well-sampled result.**
2. Residence time rises with residue volume/mass and current falls (volume-exclusion); the power-law exponent 5.34 (Fig 3c) is fit to ~20 points and should not be over-interpreted. **Medium.**
3. Classifier "99.6%" (Fig 4c) is an in-distribution fit over a labeled grid, not a held-out-molecule test; it overstates practical accuracy. **Weak as a sequencing claim.**
4. Pore size matters: 1.85 nm resolves W vs Y where 2.52 nm does not (Fig 6). **Medium; demonstrated for one pair.**
5. On a realistic mixed 16-residue chain, best accuracy is 62.5% (Table 1), with current renormalization needed to bridge force regimes. **Medium — the honest generalization number.**
Cannot determine: any experimental validity; all results are simulation. Methionine's anomalous negative current (anion binding) hints the model may not be robust for reactive side chains.

### Authors vs reviewer
| Claim | Authors | Reviewer | Agreement |
|---|---|---|---|
| 20-AA separation by I/T | demonstrated | confirmed, strongest result | agrees |
| 99.6% accuracy | headline | in-distribution grid fit | weaker than claimed |
| Heterogeneous chain | 62.5%, noise-limited | the realistic number | agrees |
| Pore-size sensitivity | 20× | shown for W/Y only | agrees (scoped) |
| 2.8M predictions | "theoretically predict" | grid squares, not validations | weaker than claimed |

Divergence: **minor** — authors flag the noise/generalization issue themselves; disagreement is only about how much weight the 99.6% deserves.

## Adversarial context
### Steelman
This is a careful, heavily-sampled MD study that establishes the core physics: a single MoS2 layer carries enough current contrast + residence-time contrast to separate all 20 residues, and the separation is physicochemically interpretable (size → residence time, charge/hydrophobicity → current). That feasibility argument is the durable contribution, and it is well-supported.
### Red team
The sequencing framing rests on a 99.6% that is a labeled-grid fit; the realistic chain test collapses to 62.5% and required an ad-hoc cross-force-regime renormalization. No experiment, controlled translocation speed, or secondary/tertiary structure is addressed — real proteins do not translocate as stretched homopeptides under constant force.
### Alternative explanations
The clean separation partly reflects the controlled constant-force, homopeptide setup; in experiment, uncontrolled translocation velocity (the dominant noise source in real nanopores) would blur the residence-time axis that drives most of the discrimination.
### Falsifying experiment
Experimental MoS2 nanopore translocation of a defined heteropeptide with single-residue ground truth. If per-residue current/time clusters overlap as badly as the 62.5% chain result predicts, the single-residue sequencing promise fails under real translocation kinetics.

## Avenues to explore
- Velocity control (enzymatic ratcheting, as in ClpX work) to remove the residence-time noise that limits the heterogeneous chain.
- Modeling neighbor/context effects explicitly rather than treating residues as independent.
- Whether learned features on the raw current trace beat the two scalar summaries.

## Growing ideas
- ✅ [[💡 Immune USB]] — supports the feasibility substrate: a solid-state 2D pore plus ML can in principle read amino-acid identity from ionic signatures, the molecular-readout layer such a concept needs.
- ⚡ [[Next-generation deep learning based on simulators and synthetic data]] — another reality-gap exemplar: ML trained/evaluated on controlled MD gives 99.6% in-distribution but 62.5% on the more realistic chain, with a cross-condition normalization hack papering over domain shift.
