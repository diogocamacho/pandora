---
type: paper-analysis
title: "One-shot design of functional protein binders with BindCraft"
doi: "10.1038/s41586-025-09429-6"
source: "https://www.nature.com/articles/s41586-025-09429-6"
authors: ["Martin Pacesa", "Lennart Nickel", "Christian Schellhaas", "Sergey Ovchinnikov", "Bruno E. Correia"]
year: 2025
venue: "Nature"
peer_reviewed: true
clip: "[[One-shot design of functional protein binders with BindCraft]]"
analyzed_on: 2026-10-14
verdict: strong
tldr: "Backpropagation through AlphaFold2 (BindCraft) designs de novo protein binders at 10–100% experimental success across 12 hard targets, with crystal/cryo-EM structures confirming designed binding modes — a genuine, well-validated advance, though framed 'success rates' conflate binding detection with affinity."
reviewer_divergence: minor
tags: [paper, protein-design, de-novo-binders, alphafold2, hallucination, therapeutics]
idea-supports:
  - "[[2026-10-03 scoring-function-oracle]]"
  - "[[2026-10-03 tf-network-aging-minibinders]]"
  - "[[2026-10-08 agentic-function-map]]"
idea-challenges:
  - "[[2026-10-03 plm-novelty-oracle]]"
---

# One-shot design of functional protein binders with BindCraft

## TL;DR & verdict
- **Main result:** An automated pipeline that backpropagates through frozen AF2-multimer weights to hallucinate binder sequence, structure, and interface jointly, then filters with AF2-monomer + Rosetta. Across 12 diverse targets it reports 10–100% experimental success (mean 46.3%), with binders mostly in the nM range.
- **Verdict: strong** — the central claim is corroborated by orthogonal biophysics (SPR/BLI/SEC-MALS/MST) *and* four X-ray structures plus two cryo-EM reconstructions showing designed binding modes recapitulated to 1.7–3.1 Å Cα RMSD. This is the rare design paper where the structural ground truth is actually shown.
- **Biggest author/reviewer divergence (minor):** "Success rate" mixes two things — the fraction of tested designs that show *any* binding signal and the achievement of high *affinity*. Several "successful" targets have best binders in the high-nM to low-µM range (PD-L1 615 nM, IFNAR2 260 nM, SAS-6 4–6 µM), so the headline 10–100% is a binding-detection rate, not an affinity-success rate.
- **Biggest weakness:** The i_pTM ranking metric predicts binding (binary) but does **not** correlate with affinity (authors' own Supplementary Fig. 6), so the pipeline cannot rank-order for potency — a real limit for therapeutic lead selection. No prospective head-to-head run of RFdiffusion and BindCraft on identical targets with identical wet-lab readout; comparisons are largely in silico.
- **Why it matters:** Removes the high-throughput screening bottleneck from binder generation and puts nM binders within reach of non-specialist labs. It is open-source (MIT), already won a community EGFR-binder competition, and directly enables downstream functional work (allergen neutralisation, Cas9/Argonaute inhibition, AAV retargeting).

## Main idea
Designing de novo protein–protein interfaces is the hard, unsolved core of protein design because molecular recognition is poorly understood from first principles. Prior deep-learning SOTA (RFdiffusion backbone → ProteinMPNN sequence → AF2 filter) treats the target as rigid and separates backbone generation from interface design. BindCraft instead uses the ColabDesign AF2 implementation to run gradient descent *through* the AF2-multimer network, optimising a composite loss (pLDDT, i_pTM, intra/inter pAE, contact losses, radius of gyration, helicity, optional N/C-termini proximity) so that binder sequence, fold, and interface emerge together while the target is allowed to flex. Designs are solubility-optimised with ProteinMPNN (soluble weights), re-predicted with AF2-monomer, Rosetta-relaxed, and filtered on nine confidence/physics criteria. The claim is that this yields functional binders at experimental success rates one to three orders of magnitude above physics-based methods, with little or no screening.

## Key findings — claims ledger
| # | Claim | Evidence (fig/panel) | Grade | Reviewer | Confidence |
|---|-------|----------------------|-------|----------|------------|
| 1 | Generalisable binder design across 12 hard targets, 10–100% success (mean 46.3%) | Fig. 1b; per-target text | direct (binding) / indirect (as "success") | agrees that most targets yield binders; disputes framing | High |
| 2 | Sub-nM to nM affinities achievable (PD-1 <1 nM, CD45 14.7 nM, CbAgo 5 nM, Der f7 12.8 nM) | Fig. 2a–h, 3a, 4; SPR/BLI | direct | agrees for specific targets | High |
| 3 | Designed binding modes are structurally accurate | Extended Data Fig. 3–4 (X-ray, 1.7–3.1 Å RMSD); Fig. 4b,c (cryo-EM docking) | direct | strongest-supported claim | High |
| 4 | Target flexibility (repredicted each iteration) is a mechanistic advantage over rigid-target methods | Ext. Data Fig. 1a (target RMSD 0.5–5.5 Å) | indirect | not supported as causal — shows flexibility exists, not that it causes higher success | Medium |
| 5 | Functional modulation: blocks IgE binding to Bet v1 (~50%, 2/3 donors); reduces Cas9 editing; 40–80× CbAgo k_cat reduction | Fig. 3i, 4d, 4g | direct | agrees; Bet v1 effect modest vs antibody cocktail (90%) | High |
| 6 | Comparable to / better than RFdiffusion and AlphaProteo | Ext. Data Fig. 1c (in silico time); text | asserted / indirect | not supported — no prospective wet-lab head-to-head | Low |
| 7 | AAV retargeting to HER2/PD-L1 via capsid-inserted binders | Fig. 5c–g | direct | agrees; small number of working variants, in cellulo only | Medium |

## Methods audit
- **Targets:** 12 (PD-1, PD-L1, IFNAR2, CD45, sCLDN1, BBF-14, SAS-6, Der f7/f21, Bet v1, SpCas9, CbAgo). Designs tested per target are small (7–53), consistent with the "low-screening" thesis.
- **Biophysics:** SPR (Biacore 8K, 1:1 Langmuir), BLI (Octet/Gator), SEC-MALS, circular dichroism, MST. Kd fits use standard models; several Kd* are *apparent* (avidity from Fc-fusion, slow off-rates) and explicitly flagged as such — good discipline.
- **Structural validation:** 4 X-ray structures (2.2–3.0 Å), 2 cryo-EM maps (docked, not atomic — poor local resolution at Cas9 REC1, honestly reported). PDB/EMDB depositions listed.
- **Functional assays:** HEK293T Cas9 editing by amplicon NGS (CRISPResso2); CbAgo cleavage in triplicate with double-exponential k_cat fits; cell cytotoxicity (Sf9/claudin); patient-serum IgE blocking ELISA (3 donors).
- **Controls:** competition assays (pembrolizumab, REGN antibodies, natural Acrs, native cytokines) establish epitope specificity; off-target panels against Ig-fold receptors show no cross-reactivity. Controls are a strength.
- **Gaps:** n for ELISA donors = 3; no statistics reported on per-target success-rate CIs (small denominators make 10–100% range noisy); "success" denominator is designs *tested*, which were pre-filtered and top-20-i_pTM-selected — the real end-to-end yield (trajectories → tested) is buried in Supplementary Fig. 1e (0.6–65.9% pass filters).

## ML/computational audit
- **No train/test leakage in the usual sense** — AF2 weights are frozen and pretrained; BindCraft is inference-time optimisation, not model training. The relevant concern is *filtering bias*: designs are both generated and selected by AF2 confidence, so filters favour what AF2 finds plausible, potentially excluding real binders (authors acknowledge; Ext. Data Fig. 7a,b).
- **Metric honesty:** i_pTM works as a binary binding predictor but does not correlate with affinity (Supplementary Fig. 6) — a clean, self-reported negative result. AF3 filtering gave high false-positive rates (Ext. Data Fig. 7c).
- **Baseline strength:** RFdiffusion reproduced from its original protocol, but compared mostly on in silico generation time and amino-acid interface composition — not a prospective experimental bake-off. AlphaProteo is closed-source and only cited.
- **Known AF2 failure modes acknowledged:** insensitivity to point mutations; occasional physically improbable outputs (mitigated by Rosetta).

## Independent reviewer
### Reviewer's conclusions (data only)
Reading only Results, figures/legends, and Methods (blind to abstract/intro/discussion framing):
1. **For a subset of targets, the pipeline produces genuine, structurally validated binders.** The 4 crystal structures and 2 cryo-EM maps (Ext. Data Fig. 3–5) are the load-bearing evidence: designed and observed backbones agree to 1.7–3.1 Å. This cannot be faked by a prediction artifact. *Strong.*
2. **Affinities span sub-nM to low-µM and are target-dependent.** PD-1 <1 nM, CD45 14.7 nM, Der f7 12.8 nM, CbAgo 5 nM are strong; PD-L1 615 nM, IFNAR2 260 nM, SAS-6 µM are weak. The data do not support a uniform "nanomolar" claim. *Moderate.*
3. **Functional activity is real but variable in magnitude.** CbAgo k_cat drops 40–80× (Fig. 4g) and Cas9 editing is reduced (Fig. 4d) — convincing. Bet v1 IgE blocking is ~50% in 2/3 donors vs 90% for a 3-antibody cocktail (Fig. 3i) — modest. *Moderate.*
4. **Specificity is well-supported.** Off-target panels and competition assays (Ext. Data Fig. 2) are the right controls and are clean. *Strong.*
5. **The "success rate" number is a reported fraction of tested designs that bind, with small denominators (n=7–53) and top-ranked pre-selection — not an end-to-end yield.** *Weak as a headline statistic.*

Missing experiments that would change the assessment: a prospective, identical-readout comparison vs RFdiffusion on the same targets; affinity for all "successful" binders (many only have apparent Kd or binding-signal-only); more ELISA donors; demonstration that target flexibility *causally* improves success (ablation of flexibility at matched compute).

### Authors vs reviewer
| Claim | Authors | Reviewer | Agreement |
|-------|---------|----------|-----------|
| Binders are structurally accurate | Central | Strongly confirmed by X-ray/cryo-EM | agrees |
| 10–100% success, mean 46.3% | Headline | A binding-detection rate on small, pre-filtered sets | weaker than claimed |
| Nanomolar affinity | Emphasised | True for some targets, high-nM/µM for others | weaker than claimed |
| Flexibility is the key advantage | Mechanistic claim | Shown to exist, not shown to cause success | not supported (as causal) |
| Better than RFdiffusion/AlphaProteo | Implied | No prospective wet-lab head-to-head | not supported |
| Functional modulation (Cas9/CbAgo) | Demonstrated | Confirmed, large effect sizes | agrees |
| i_pTM does not predict affinity | Stated as limitation | Reviewer found same; important caveat the abstract omits | reviewer found something authors de-emphasised |

**Reviewer divergence summary: minor.** The structural and functional core is solid and agreed. Divergence is about *framing* (the success-rate and affinity headlines) and about unsupported comparative claims, not about whether the method works.

## Adversarial context
### Steelman
This is the strongest form of the AF2-hallucination idea: by optimising through a network that already encodes the physics of folding and complex formation, you get sequence, fold, and interface co-designed and self-consistent, with the target free to adapt. The structural validation is unusually rigorous for a design paper, and the breadth (receptors, allergens, de novo folds, nucleic-acid-binding grooves, AAV capsids) argues for genuine generality rather than target cherry-picking. Open-source + competition win = external validity.

### Red team
The headline "10–100%, mean 46.3%" is a fraction of a small, i_pTM-top-ranked, pre-filtered set — not trajectories-in to binders-out. With n=7–9 for several targets, a single extra hit swings the rate by >10 points. "Nanomolar" quietly includes 615 nM and µM binders. The one metric you'd use to pick a lead (i_pTM) is explicitly uncorrelated with affinity, so lead *ranking* is unsolved. Comparisons to RFdiffusion/AlphaProteo are in silico or citational, so "state of the art" is asserted, not shown.

### Alternative explanations
Could success reflect AF2's memorisation of PDB-like interfaces rather than true de novo design? Partly mitigated: designed interfaces have TM 0.15 to known PPIs (PPIRef) and 14.4% sequence identity to closest PDB — genuinely novel. Could filtering select for AF2-self-consistent-but-nonbinding designs that happen to bind? The structures rule that out for the validated subset.

### Falsifying experiment
Run BindCraft and RFdiffusion on 5 unseen, hard targets at matched compute, test the same number of top designs by the same SPR protocol, blinded. If BindCraft's end-to-end binder yield and affinity distribution are not meaningfully better, the comparative-superiority claim falls. Separately: ablate target flexibility (rigid-target BindCraft) at matched compute; if success is unchanged, the mechanistic claim fails.

## Avenues to explore
- i_pTM predicts binding but not affinity — a learned or physics-based *affinity oracle* downstream of BindCraft would close the lead-ranking gap. (Directly relevant to the scoring-function-oracle idea.)
- The soluble-analogue strategy (sCLDN1) to design against membrane proteins lacking extracellular domains is underexploited and generalises to GPCRs/ion channels.
- Beta-sheet / mixed α-β interface design (BBF-14) without backbone H-bonding is a capability most pipelines lack; worth probing for aggregation-resistant binders.
- Binder-insertion into AAV VR-V (res 497–498) as a modular retargeting chassis is a platform idea in itself.

## Growing ideas
- ✅ [[2026-10-03 scoring-function-oracle]] — BindCraft's own admission that i_pTM predicts binding but not affinity is a concrete, high-value need for a dedicated scoring/affinity oracle to rank designs.
- ✅ [[2026-10-03 tf-network-aging-minibinders]] — demonstrates nM mini-binders against intracellular/structurally hard targets (Cas9 REC1, Argonaute grooves, de novo folds), supporting the feasibility of designing mini-binders against TF-like surfaces.
- ✅ [[2026-10-08 agentic-function-map]] — a fully automated, JSON-configured, open-source generate→filter→rank pipeline requiring minimal human expertise is exactly the kind of callable design module an agentic platform would orchestrate.
- ⚡ [[2026-10-03 plm-novelty-oracle]] — BindCraft succeeds using a frozen *structure* network (AF2) with no PLM and explicitly novel interfaces (low PDB identity), suggesting structure-space optimisation, not PLM-derived novelty scoring, is the operative lever for binder design.
