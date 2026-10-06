---
type: paper-analysis
title: "Towards Generalizable Protein-ligand Co-folding with ACER"
doi: "10.64898/2026.06.02.728568"
source: "https://www.biorxiv.org/content/10.64898/2026.06.02.728568v2"
authors: ["Nopsinth Vithayapalert", "Francesca Grisoni"]
year: 2026
venue: "bioRxiv (v2; NeurIPS 2026 format)"
peer_reviewed: false
clip: "[[Towards Generalizable Protein-ligand Co-folding with ACER]]"
pdf: "[[ACER co-folding.pdf]]"
analyzed_on: 2026-10-06
verdict: mixed
tldr: "A clever training-free sampling-and-reranking wrapper around Boltz-2/Protenix that genuinely rescues some wrong-pocket cases on hard targets at ~5x compute, but the 'generalizable co-folding' headline overstates small-n, high-variance, pose-accuracy-limited results that stay near zero in the hardest out-of-distribution bin."
reviewer_divergence: minor
tags: [paper, co-folding, protein-ligand, structure-prediction, diffusion, ml-evaluation]
---

# ACER: Towards Generalizable Protein-Ligand Co-folding

> Batch note: independent-reviewer step folded into the analyst's data-only pass for this 8-paper run.

## TL;DR & verdict
- ACER is a **training-free, inference-time wrapper** around co-folding models (Boltz-2, Protenix-v1): (a) **pocket exploration** via "decoy ligand conditioning" (duplicate the ligand to occlude the dominant pocket) + "iterative pocket repulsion" (FK-steering away from sampled sites); (b) **ensemble re-ranking** by consistency-weighted pair-ipTM.
- **Verdict: mixed.** The headline claim is pocket-finding, not pose accuracy. On wrong-pocket subsets, ACER raises DCC (center-to-center) success ~+8 to +14 points. But **pose quality lags**: it rarely improves Top-1 L-RMSD and sometimes hurts it (Table 4: baseline 23.9% vs ACER 15.2% @2Å Top-1); gains concentrate at Top-5 and are PoseBusters-validity-gated (good practice).
- In the hardest generalization regime (0–20% train similarity) **all methods are near zero** (ACER Top-1 2Å = 7.1% vs 0% baselines, n=14). Gains actually *grow with train similarity* — the opposite of generalization.
- **Best feature:** rigorous equal-compute controls (Boltz-2 ×150 reaches only its ×30 level; ACER ×30 = 66.6%), so the edge is exploration, not budget. **Worst:** code/weights not released; AlphaFold3 is led with in the abstract but never benchmarked.

## Main idea
Co-folding models memorize training templates and misplace ligands into the dominant/orthosteric pocket for allosteric/novel targets. ACER treats this as a *sampling* pathology, not a capacity gap: occlude the default pocket with decoy ligand copies (shifting distogram + denoiser attention), steer diffusion away from visited pockets via repulsion inside Boltz-2's Feynman-Kac/SMC steering, generate local conformational ensembles per candidate pocket, and re-rank poses by ensemble-consistency-weighted pair-ipTM instead of a single confidence score.

## Key findings — claims ledger
| Claim | Evidence | Grade | Confidence |
|---|---|---|---|
| Improves allosteric pocket recovery vs base + pocket tools | Table 1 (DCC<2Å 66.6% vs 55.0% Boltz×30, 25% P2Rank/FPocket; n=20) | direct | high |
| Rescues wrong-pocket failures | Table 2 (44.5% vs 30.7%, +8–14 pts; n=46) | direct | high |
| Gains are exploration, not compute | Table C1 (Boltz×150 = 50% = its ×30; ACER×30 = 66.6%) | direct | high |
| Ensemble ranking improves pose selection | Tables 3–4 (Top-5 gains; **Top-1 flat or worse**) | mixed | high |
| ACER is "generalizable" to novel interfaces | Fig 2a/Table B5 (0–20 bin 7.1% vs 0%; n=14) | indirect | low |
| Decoy conditioning occludes the dominant pocket (mechanism) | Table B1 (allo attn ratio 0.381→1.931; n=9) | direct | medium |
| Poses physically valid, not just RMSD-close | all pose tables PoseBusters-gated | direct | high |
| Statistical significance | text repeatedly: "not reaching significance"; CIs overlap | — (honest) | high |

## Methods & ML audit
- **Leakage control — a strength.** Primary test = Runs N' Poses, systems deposited after Boltz-2's 2023-06-01 cutoff (temporal control for the base model), plus clustered distinct-ligand subset and train-similarity stratification. **Caveat:** the n=20 allosteric headline set's proteins ARE in training (stated §4.1.1), so that benchmark is not leakage-free.
- **Metrics — done right.** DCC for pocket recovery; symmetry-corrected L-RMSD for pose; **every pose metric co-gated on PoseBusters v0.6.5** (fraction <2Å AND physically valid), not bare RMSD.
- **Baselines — mostly fair.** Co-folding baselines run the same protocol minus decoy/repulsion (same samples, same validity potentials); pocket tools (P2Rank/FPocket) separate. **AF3 and Chai-1 cited but never benchmarked** — and the abstract leads with AF3.
- **Equal-compute controls — real strength** (Appendix C: ×150/×110/×200, per-cluster re-rank, P2Rank-conditioned Boltz).
- **Ablations — thorough** (decoy-only/repulsion-only/combined; decoy count 1–4; decoy type; repulsion radius/d_min/λ_c; budget sweeps). Repulsion alone is near-useless at 2Å; the combination works.
- **Seed/variance — partial.** Pocket numbers use 5 seeds; **main ensemble-ranking tables (3,4) are single-seed (738291)**. Uncertainty via 1000-bootstrap CIs that frequently overlap; authors concede non-significance.
- **Availability:** code "upon acceptance," data "plan to upload to Zenodo" — nothing released at preprint. Compute ~5× wall-clock, disclosed. Funding/COI not reported.

## Independent-skeptic pass — divergences
- **"Generalizable" is doing heavy lifting the data don't carry.** In the only genuinely OOD, leakage-controlled bin (0–20%), ACER rescues ~one system (7.1%, n=14). Measurable gains grow *with* train similarity — opposite of generalization.
- **Pocket-finding ≠ pose-solving.** Strong numbers are coarse DCC; demand a correct pose (L-RMSD<2Å & PB-valid) and Top-1 gains vanish/reverse. ACER's own failure analysis: ~85% of failed cases still unsolved.
- **Allosteric headline = n=20 with in-training proteins.** Impressive-looking, not a generalization test.
- **What's genuinely supported:** decoy+repulsion sampling finds alternative/cryptic pockets unsteered sampling at equal compute cannot; when the pocket is findable and the base model can model the interface, ensemble ranking promotes a better Top-5 pose. A real, narrow, honestly-scoped contribution — just not "generalizable co-folding."

## Adversarial context
- **Steelman:** one of the cleaner inference-time papers — controls for compute (the hardest confound), PoseBusters-gates everything, controls temporal leakage, gives a mechanistic account, and is candid about failure modes and non-significance.
- **Red team:** the "generalizable/AF3" framing is unsupported (AF3 never run; OOD near-zero; gains rise with similarity; Top-1 flat-to-negative; headline set small and in-distribution; key tables single-seed; nothing released).
- **Alternative explanation (memorization):** decoy occlusion may un-suppress a memorized-but-down-weighted pocket mode rather than generalize to novel physics — consistent with gains rising with training similarity.
- **Falsifying experiment:** held-out targets with <20% pocket+sequence similarity to training, never co-crystallized in any DB the base model saw, n≥100, report Top-1 L-RMSD<2Å & PB-valid. If ACER doesn't beat equal-compute baseline with non-overlapping CIs, "generalizable" falls.
- **Novelty:** no architectural novelty — a pure inference-time wrapper; novelty is decoy *occlusion* conditioning + coupling FK/SMC steering to iterative pocket repulsion + ensemble re-ranking. Complementary to AF3/Boltz/Chai, not competitive.

## Integrity & reproducibility
Preprint v2, posted 2026-10-01, CC-BY 4.0, NeurIPS 2026 format. No code/weights released. Training-free (uses public base checkpoints). Allosteric PDB IDs listed (Table A1) so that subset is reconstructable. Funding/COI not reported. Authors: Vithayapalert & Grisoni, TU Eindhoven.

## Avenues to explore
- The reusable idea: **co-folding memorization is a sampling bias, not a knowledge gap** — occluding the dominant mode and repelling the trajectory can surface suppressed correct sites at equal compute. Directly relevant to any internal docking/co-folding pipeline (cheap inference-time recall of cryptic/allosteric pockets).
- The reading lesson: coarse pocket metrics (DCC) vs strict pose+validity is exactly where co-folding results get oversold.

## Growing ideas
No forced `ideas/` link. The "sampling-not-capacity" reframing is a useful generative-modeling heuristic but not a specific support/challenge to a current venture note.

## References
### Verified
- This paper: Vithayapalert & Grisoni, 2026, bioRxiv v2 — https://doi.org/10.64898/2026.06.02.728568 (read in full incl. appendices).
### Unverified (do not cite until checked)
- Cited within: Abramson 2024 (AF3); Passaro 2025 (Boltz-2); Zhang 2026 (Protenix); Škrinjar 2025 (Runs N' Poses); Buttenschoen 2024 (PoseBusters); Singhal 2025 (FK steering); Krivák & Hoksza 2018 (P2Rank) — not independently verified.
