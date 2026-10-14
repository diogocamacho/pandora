---
type: paper-analysis
title: "Simulation and the reality gap: Moments in a prehistory of synthetic data"
doi: "10.1177/20539517241309884"
source: "https://journals.sagepub.com/doi/10.1177/20539517241309884"
authors: ["James Steinhoff", "Sam Hind"]
year: 2025
venue: "Big Data & Society"
peer_reviewed: true
clip: "[[Simulation and the reality gap Moments in a prehistory of synthetic data - James Steinhoff, Sam Hind, 2025]]"
analyzed_on: 2026-10-14
verdict: solid
tldr: "A historically-grounded STS argument that the 'reality gap' in synthetic data is not a solvable bug but a permanent structural feature of all simulation — because any simulation requires real-world data to set its parameters — traced through three regimes (Monte Carlo, discrete-event, visual-interactive); persuasive as conceptual history, necessarily non-empirical as prediction."
reviewer_divergence: minor
tags: [paper, synthetic-data, simulation, history-of-computing, political-economy-of-ai, sts]
idea-supports:
idea-challenges:
  - "[[2026-10-03 scoring-function-oracle]]"
---

# Simulation and the reality gap: Moments in a prehistory of synthetic data

## TL;DR & verdict
- **Main result (thesis):** The "reality gap" — the gap between synthetic training data and the real-world data a model is deployed on — is not a novel problem synthetic data introduces and will eventually fix, but an ancient, structural feature of simulation itself: every simulation is a *selection* from reality and requires real-world data to parameterize, so synthetic data can never fully "dispense with" the real data it purports to replace. Demonstrated through three historical regimes: statistical (Monte Carlo, 1940s–50s), discrete-event (General Simulation Program, UK steel, 1960s), and visual-interactive (FORSSIGHT, 1980s).
- **Verdict — solid:** As a work of conceptual history / science-and-technology studies, the argument is well-sourced (archival work at two collections + practitioner interviews) and the central structural claim is genuinely illuminating. It is not — and does not claim to be — an empirical ML result; the forward-looking prediction ("the reality gap will only grow") is argued, not measured.
- **Biggest author/reviewer divergence (minor):** A reader restricted to the evidence (the three historical case studies) can confirm the historical claim robustly, but notes the normative/predictive conclusions (political-economy forecasts about NVIDIA, "so-so simulation," an "alternative stack") are interpretive extrapolations, not entailments of the archival record.
- **Biggest weakness:** The strong claim "the reality gap is not something synthetic data can solve" is argued by historical analogy, not demonstrated against modern techniques — domain randomization and GAN-based domain adaptation are described but treated as confirming the thesis rather than tested as potential counterexamples.
- **Why it matters:** For anyone building on synthetic/simulated data in biology (virtual cells, in-silico assays, simulator-trained models), this is the sharpest available articulation of *why* "train on simulation, deploy on reality" is epistemically load-bearing and never free: the simulation's fidelity is bounded by the real-world data used to build it, which relocates rather than removes the data problem.

## Main idea
Synthetic data (data produced by a computational process rather than recorded from events) is marketed as the cure for machine learning's data problems — labeling cost, privacy, bias, scarcity. Its central obstacle is the "reality gap": will a model trained on synthetic data work on real data? The authors argue this gap is intrinsic to simulation, not specific to synthetic data, and trace it through three "regimes of simulation" to show that each new, more ambitious simulation technology *generated new demands for real-world data* even as it promised to escape them. The conclusion is epistemological (simulation is always a selection, hence non-neutral and incomplete) and political-economic (synthesizing data adds new layers of labor — domain experts, 3D artists — and may reconfigure the AI industry's "stack," with chip/simulation firms like NVIDIA ascendant).

## Key findings — claims ledger
*(This is a humanities argument; "evidence" is archival sources and historical cases, "grade" reflects how directly the cited material supports each claim.)*
| # | Claim | Evidence (source/case) | Grade | Reviewer | Confidence |
|---|-------|------------------------|-------|----------|------------|
| 1 | The reality gap predates synthetic data and recurs across simulation history | Three regimes; Monte Carlo (Metropolis & Ulam 1949), GSP (Tocher 1960–61), VIS (Hurrion 1976, Hollocks 1983) | direct (historical) | agrees | High |
| 2 | Every simulation requires selecting/parameterizing from real-world data | Monte Carlo "must assume probabilities"; GSP "accuracy depends on sampling distributions" | direct (quoted primary sources) | agrees | High |
| 3 | More ambitious/higher-fidelity simulation increases, not decreases, real-data demand | GSP edge-case problem; VIS "added data requirements"; NVIDIA–dSPACE vehicle physics | direct (historical) + contemporary example | agrees | Medium-High |
| 4 | Therefore synthetic data cannot solve the reality gap | Synthesis of 1–3 + CVEDIA's unfulfilled 2021 "solved it" claim | indirect / argued by analogy | weaker — analogy, not demonstration | Medium |
| 5 | Synthetic data signals an emerging "alternative stack" + return of domain expertise ("expert systems") | NVIDIA Omniverse framing; dSPACE partnership; Jensen Huang keynote | asserted / interpretive | not entailed — plausible reading | Low-Medium |

## Methods audit
*(Appropriate to the discipline — this is "technography" / historical method, not experiment.)*
- **Method:** Technography (close reading of publicly available technical documents) plus archival research at the Ferranti Collection (Manchester, 1948–79) and the Brian W. Hollocks Collection (NC State, 1961–82), supplemented by interviews with data scientists, 3D artists, and synthetic-data company CEOs/CTOs in Europe/North America.
- **Source quality:** Strong — primary sources (Metropolis & Ulam 1949; GSP Handbook / Tocher 1960–61; Hollocks 1983) are quoted directly and used well; the historical regimes are concrete and specific, not hand-wavy.
- **Transparency / limits:** The interview corpus is described only generally (roles, regions), with no detail on N, selection, or how interview data feeds specific claims — a soft spot by social-science reporting standards, though typical for this genre.
- **Argumentative structure:** The historical claim (reality gap recurs) is solidly evidenced. The leap to "synthetic data *cannot* solve it" is a universal claim supported by induction over three cases plus one deflated industry boast (CVEDIA); it is persuasive but not logically forced — a sufficiently different future technique is not ruled out, only rendered historically improbable.
- **No empirical ML content:** No models trained, no reality-gap magnitudes measured; the paper's purchase is conceptual, and the predictive political-economy section is explicitly speculative ("it remains to be seen," "it is more likely").

## Independent reviewer
### Reviewer's conclusions (evidence-only pass — the three case studies and quoted primary sources, blind to the framing/discussion)
1. The three historical cases robustly establish that simulation has always required real-world data to parameterize and has always been a deliberate *selection* from reality — Monte Carlo needs assumed probability distributions, GSP needed plant-structure analysis and failed on hard-to-observe edge cases, VIS needed scanned photographs for "adequate realism." This recurrence is well-documented. (Strong.)
2. The cases also support that increasing simulation fidelity/ambition increases real-data demand (GSP breakdowns, VIS "added data requirements," NVIDIA–dSPACE). (Supported.)
3. The universal claim — synthetic data *cannot* solve the reality gap — does not strictly follow from three historical cases plus one unfulfilled corporate claim; it is a strong inductive generalization. The evidence supports "has never solved it and structurally requires real data," not a proof of impossibility against all future methods. (Argued, not demonstrated.)
4. The political-economy forecasts (alternative stack, NVIDIA ascendance, "so-so simulation," domain-expert resurgence) are interpretive readings of contemporary signals, not conclusions entailed by the archival evidence. (Interpretive.)
- **Most serious weaknesses:** universal claim rests on analogy; modern bridging techniques (domain randomization, GAN domain adaptation) are described as confirming the thesis rather than stress-tested as possible counterexamples; interview method underspecified.
- **Missing analysis that would strengthen it:** engagement with cases where synthetic data *did* largely close the gap (e.g. AlphaFold-style self-distillation, RL-from-simulation robotics successes, protein-structure data augmentation) to show the thesis survives its hardest counterexamples rather than only confirming instances.

### Authors vs reviewer
| Claim | Authors | Reviewer | Agreement |
|-------|---------|----------|-----------|
| Reality gap predates and recurs through simulation history | Core thesis | Robustly supported by cases | agrees |
| All simulation is selection requiring real data | Core thesis | Well-evidenced | agrees |
| Synthetic data cannot solve the reality gap | Strong universal claim | "Has not and structurally relocates it" supported; impossibility is argued, not proven | weaker than claimed |
| Emerging alternative stack / NVIDIA / return of domain expertise | Political-economy forecast | Plausible interpretation, not entailed | reviewer flags as interpretive |

**Reviewer divergence summary: minor.** Full agreement on the historical and structural claims; divergence only on the strength of the universal ("cannot solve") claim and the status of the forward-looking political-economy section as interpretation rather than finding.

## Adversarial context
### Steelman
The core insight is genuinely clarifying and resistant to AI-hype: by relocating the debate from "will synthetic data replace real data?" to "every simulation is a parameterized selection from reality, so real-world data is a permanent input," the authors dissolve a category error that pervades industry marketing. The historical grounding is specific and well-sourced, and the "fidelity increases data demand" dynamic is a sharp, falsifiable-in-principle observation that maps directly onto modern digital-twin / world-model ambitions.

### Red team
The headline claim is stated as a near-impossibility result but earned only by analogy over three hand-picked, pre-deep-learning cases plus one deflated press release. The paper does not engage the strongest modern counterexamples — domains where simulation-to-real transfer has worked impressively (sim-to-real robotics, self-distillation in structure prediction, procedurally generated vision data that measurably helps). Describing domain randomization and GAN adaptation and then asserting they "too rely on real data" risks being unfalsifiable: any success is re-described as still depending on some real data, so the thesis can never lose.

### Alternative explanations / readings
"Requires some real data to parameterize" is weaker and almost trivially true; "cannot solve the reality gap" is strong and contestable. Much of the apparent force comes from sliding between the two. A critic could accept the former entirely while rejecting the latter: the gap can be made *operationally negligible* for many tasks even if never literally zero, which for engineering purposes is "solved."

### Falsifying evidence
A domain where a model trained purely (or overwhelmingly) on synthetic data matches or beats a real-data-trained model on held-out real data, with the synthetic generator itself not requiring task-specific real data to build (only general priors) — e.g. certain physics-simulated or self-play regimes. Robust, repeated instances of this would falsify the strong "cannot solve" claim while leaving the historical observation intact.

## Avenues to explore
- The thesis is a useful critical lens on the vault's biology-simulation threads (virtual cells, in-silico assays, simulator-trained models): it predicts that every such platform's ceiling is set by the real experimental data used to parameterize the simulator — i.e. "simulation does not escape the wet lab, it relocates the dependency."
- Worth testing the thesis against the strongest biology counterexamples (AlphaFold self-distillation; RL-designed binders validated in silico then wet-lab-confirmed) to see where "selection from reality" is the binding constraint vs. where it is negligible.
- The "fidelity increases data demand" dynamic is a concrete design heuristic for synthetic-data strategy: higher-fidelity simulators are not a free lunch; they trade data-labeling cost for simulator-construction/domain-expert cost.

## Growing ideas
- ⚡ [[2026-10-03 scoring-function-oracle]] — Challenges the idea's implicit optimism about model-based oracles/simulators: Steinhoff & Hind argue any simulator (or scoring oracle standing in for reality) is a parameterized selection whose fidelity is bounded by, and dependent on, the real-world (e.g. wet-lab) data used to build it — a reality-gap caution for any platform that optimizes against an in-silico oracle rather than ground truth. (Cf. the RosettaSearch Chai-1 cross-oracle check, which guards against oracle-specific artifacts but still never touches wet-lab reality.)
