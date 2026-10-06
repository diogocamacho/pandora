---
type: paper-analysis
title: "A kinetic-aware approach to infer metabolic variations and flux using transcriptomics and metabolomics data"
doi: "10.64898/2026.09.27.754711"
source: "https://www.biorxiv.org/content/10.64898/2026.09.27.754711v1"
authors: ["X. Zhu", "et al.", "C. Zhang", "M. Fishel", "S. Cao"]
year: 2026
venue: "bioRxiv"
peer_reviewed: false
clip: "[[A kinetic-aware approach to infer metabolic variations and flux using transcriptomics and metabolomics data]]"
pdf: "[[Kinetic-aware flux.pdf]]"
analyzed_on: 2026-10-06
verdict: mixed
tldr: "A mechanistically reasonable, unusually honest Michaelis-Menten-based multi-omics flux-change estimator (mmFEA) whose real-data validation rests on a single n=9 functional proxy with self-tuned hyperparameters and no isotope ground truth; 'kinetic-aware' may be near-inert where most reactions are far from saturation."
reviewer_divergence: minor
tags: [paper, metabolic-flux, multi-omics, systems-biology, michaelis-menten, ml-evaluation]
---

# mmFEA: Kinetic-Aware Multi-Omics Flux Inference

> Batch note: independent-reviewer step folded into the analyst's data-only pass for this 8-paper run. Main text Figs 1–2 only; pan-cancer/spatial applications referenced but their figures were not in the main-text pages read.

## TL;DR & verdict
- mmFEA decomposes each reaction's flux fold-change into an enzyme term (from transcriptomics/proteomics) and a Michaelis-Menten substrate term (from metabolomics), scaled by a "Baseline Saturation Ratio" (BSR=[S]/Km) so the same substrate change scales differently with saturation. Genuinely sensible wrinkle on expression-weighted flux methods.
- **Verdict: mixed.** The only quantitative "flux" validation is rank concordance vs a **mitochondrial substrate-utilization assay (MitoPlate) over 9 compounds** (Spearman ρ=0.717, exact P=0.037). A functional proxy, not flux, n=9, with hyperparameters tuned on that same benchmark — the authors call it "internally calibrated rather than external."
- **No 13C-MFA / true flux ground truth anywhere.** The flux layer is parasitic on an external reference flux F0 (scFEA/MPO); mmFEA mostly reweights someone else's flux cone. Identifiability is acknowledged as under-determined (samples a feasible set, doesn't identify a unique flux).
- Commendably honest: retained MCMC states are explicitly **not a calibrated posterior** and **not biological replicates**.

## Main idea
Connect static transcriptomic/proteomic + metabolomic measurements to *changes* in reaction rates via Michaelis-Menten. Taking a perturbed/reference fold-change ratio cancels kcat, factoring the rate change into a separable enzyme term (from expression) and a substrate term (from metabolomics) weighted by BSR=[S]/Km. Missing Km imputed with an ESM1b/GNN predictor (vs BRENDA); baseline concentrations from HMDB. Because the two terms are disjoint, paired and unpaired omics cohorts can be integrated probabilistically. Marginal fold-changes are combined with an external reference flux F0 and sampled via network-aware MCMC under a soft (non-steady-state) balance loss.

## Key findings — claims ledger
| Claim | Evidence | Grade | Confidence |
|---|---|---|---|
| Predictions concord with measured mitochondrial function | Fig 2h (ρ=0.717, P=0.037, n=9) | indirect (proxy, tiny n, self-tuned) | high (that the number exists) |
| Outperforms all baselines | Fig 2i (one value each; competitors shown as mean of top-3 of 25 inits) | asserted (asymmetric comparison) | high |
| Both modalities + kinetics beat either alone | Fig 2f/g, 2i | indirect (qualitative coherence) | medium |
| Km predictor accurate | Fig 1h (r=0.645 log10, 735 pairs) | direct (moderate; order-of-magnitude errors common) | high |
| Robust to cohort/baseline swap | Fig 2j (ρ=0.862; non-independent modules) | indirect (stability, not accuracy) | medium |
| Improves over imperfect F0 | Fig 2k (25 inits improved — but inits deliberately degraded) | indirect | medium |
| Provides uncertainty/CIs | Eqs 5–8 | honest caveat: NOT a calibrated posterior | high |

## Methods audit
- **Ground truth:** none in the isotope sense. Sole flux-adjacent validation = MitoPlate (explicitly "not direct flux"). Everything else is internal coherence / cross-cohort stability / concordance.
- **Identifiability:** honestly addressed — omics give partial observation; multiple metabolic states fit the same abundances; mmFEA samples a feasible ensemble, doesn't identify a unique flux.
- **What "kinetic-aware" adds:** the BSR/MM substrate term (the real novelty vs E-Flux/iMAT/GIMME/COMPASS/scFEA). **But Fig 1i shows median log10(BSR)≈−1.71** — most reactions far below saturation, where MM degenerates toward linear in [S], blunting the distinctive contribution for much of the network. The paper never quantifies how often BSR changes a call vs a linear baseline.
- **Baselines:** RNA-only, metabolomics-only, GSEA/GSVA/ssGSEA, scFEA, MPO. Comparison asymmetric (top-3-of-25 for competitors; tuned primary for mmFEA — authors call competitor summaries "optimistic"). No iMAT/GIMME/E-Flux/COMPASS head-to-head.
- **Stats:** Spearman primary, exact permutation P for n=9, bootstrap CIs labeled "descriptive" (non-independent modules); BH within families. Small n (9 compounds; n=2 for one RNA condition).
- **Overfitting:** hyperparameters (T=0.01, consumed-flux rule) selected on the same 9-compound outcome used to report accuracy — the clearest overfitting risk.
- **Availability:** no public repository ("upon reasonable request") — biggest reproducibility gap for a methods paper. Public datasets cited with accessions. Funding/COI not located; note several authors are tied to the APE1/Ref-1 (APX) inhibitors under test — a potential COI worth flagging.

## Independent-skeptic pass — divergences
- **"Accurately predicts flux"** vs n=9, proxy, self-tuned, no isotope ground truth. The verb overreaches the evidence class (authors' own "internally calibrated" admission).
- **"Better than all baselines"** vs an asymmetric comparison (tuned mmFEA vs optimistic top-3-of-25 competitor summaries).
- **"Flux"** throughout vs nothing validated against flux; MitoPlate is substrate-utilization.
- **"Kinetic-aware"** is the selling point, but median BSR≈0.03 means the MM term is near-linear for most reactions — the distinctive mechanism may be near-inert network-wide, and the paper doesn't quantify it.
- **Credit:** uncertainty is explicitly not a posterior; MCMC states not replicates; method positioned as relative and complementary to isotope tracing; CRISPR analysis labeled exploratory. Better discipline than most methods papers.

## Adversarial context
- **Steelman:** the separable enzyme/substrate MM decomposition (kcat cancels in the ratio) is a principled, reusable way to let metabolomics modulate expression-derived flux via saturation state, and to integrate unpaired cohorts. The honesty about identifiability and non-posterior uncertainty is exemplary.
- **Red team:** the flux layer rides on an external F0; the one real-data validation is n=9, proxy, self-tuned; cross-method win is asymmetric; no public code; "kinetic-aware" may be near-inert where BSR≪1.
- **Alternative explanation:** the ρ=0.717 could come mostly from the *expression* component alone (APX inhibition drives big transcriptional shifts); the MM/BSR term may add little beyond RNA-only — only guarded by the n=9 modality ablation.
- **Falsifying experiment:** apply to a system with measured 13C-MFA fluxes, pre-register hyperparameters, test whether mmFEA flux changes match isotope flux changes AND whether BSR/MM beats a linear-[S] ablation and RNA-only. If not, the core claim falls.
- **Novelty:** genuinely distinct from expression-only/steady-state FBA methods (E-Flux/iMAT/GIMME/COMPASS/scFEA/METAFlux) and from REMI/INTEGRATE; the MM-ratio-with-BSR + probabilistic unpaired integration is the novel part; the flux sampling is inherited. Not verified.

## Integrity & reproducibility
Preprint, not peer-reviewed, posted 2026. No repository ("upon request"). Public datasets with accessions; in-house Pa03C multi-omics not stated as deposited. Funding/COI not located; potential APE1/Ref-1-inhibitor COI flagged. Corresponding: Chi Zhang (OHSU), Melissa Fishel (IU), Sha Cao (OHSU).

## Avenues to explore
- The reusable idea: MM flux *fold-change* separability (kcat cancels) for integrating unpaired transcriptomic + metabolomic cohorts.
- The reading lesson it teaches: any "kinetic-aware" or constraint-based flux method must (a) report how often the kinetic term actually changes a call vs a linear/expression-only baseline, and (b) validate against isotope flux before claiming to "predict flux."

## Growing ideas
No forced `ideas/` link. Metabolic-network/causal-inference adjacent, but I did not assert a specific support/challenge (e.g., to causal multi-omics theses) without reading those notes and given this method's correlational, proxy-validated status.

## References
### Verified
- This paper: Zhu et al. (corr. Zhang, Fishel, Cao), 2026, bioRxiv — https://doi.org/10.64898/2026.09.27.754711 (main text + methods read).
### Unverified (do not cite until checked)
- Cited within: Alghamdi 2021 (scFEA); Dang (MPO/MPOCtrL); Huang 2023 (METAFlux); Wagner 2021 (COMPASS); Kroll 2021 / Rives 2021 (Km/ESM1b); BRENDA; HMDB — not independently verified.
