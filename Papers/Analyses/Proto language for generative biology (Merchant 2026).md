---
type: paper-analysis
title: "A high-level programming language for generative biology with Proto"
doi: "10.64898/2026.06.22.733870"
source: "https://www.biorxiv.org/content/10.64898/2026.06.22.733870v1"
authors: ["Aditi T. Merchant", "Daniel Guo", "Ben Viggiano", "Euan A. Ashley", "Brian L. Hie"]
year: 2026
venue: "bioRxiv"
peer_reviewed: false
clip: "[[A high-level programming language for generative biology with Proto]]"
analyzed_on: 2026-10-14
verdict: abstract-only
tldr: "Proto is a composable programming language for generative biology (four primitives — sequences, generators, constraints, optimizers — compiled into a unified energy function) that plugs existing predictive models into multi-objective design; secondary sources report alternatively-spliced introns designed and validated in human cell lines and promoter-repressor pairs built by composing off-the-shelf models, but the primary full text (Methods/Results/figures) could not be retrieved for verification."
reviewer_divergence: none
tags: [paper, generative-biology, protein-design, synthetic-biology, programming-language, multi-objective, abstract-only]
idea-supports:
  - "[[2026-10-03 scoring-function-oracle]]"
  - "[[2026-10-08 agentic-function-map]]"
  - "[[2026-10-08 network-biology-platform]]"
idea-challenges: []
---

# A high-level programming language for generative biology with Proto

> [!warning] Abstract-only stub — primary full text not retrieved
> The bioRxiv full text (Methods, Results, figures, legends) was **not reachable** at analysis time: biorxiv.org returned persistent HTTP 429 / Cloudflare rate-limiting to both WebFetch and curl across the `v1.full`, JATS-XML, and PDF endpoints over multiple spaced retries. Per the enrich-clippings spec ("Never write a full analysis from an abstract"), this is an **abstract-only stub**, enriched below with detail from two **secondary** sources — the Arc Institute's own writeup (arcinstitute.org/news/proto) and a Decoding Bio summary — which are **not peer-reviewed-primary and have not been verified against the paper's figures or Methods**. The independent data-only reviewer pass (step 3d) could **not** be performed because primary data sections were unavailable. Re-run when biorxiv is reachable to upgrade to a full analysis.

## What the abstract claims
Proto is a high-level programming language for generative biology. A small set of abstract primitives composes into structured programs that encode generative design campaigns across DNA, RNA, proteins, ligands, and their interactions. Proto incorporates predictive models into generative workflows; the authors use it to design alternatively spliced introns with experimental validation in human cell lines, and — being natively multi-objective — to design promoter-repressor pairs with "leading experimental success rates for synthetic protein-DNA design." Alongside AI agents, Proto supports specification of pathways and regulatory logic via natural language. Software and interfaces are openly released. (Stanford / Arc Institute; corresponding author Brian L. Hie.)

## Detail from secondary sources (UNVERIFIED against primary figures/Methods)
- **Architecture (Arc Institute + Decoding Bio):** four primitives — **sequences** (DNA/RNA/protein/ligand strings), **generators** (propose candidates: autoregressive, diffusion, or mutation), **constraints** (scoring functions — e.g., AlphaFold confidence, GC content, splice-site usage), **optimizers** (MCMC / gradient descent). Proto compiles user-specified constraints into a **single unified energy function** minimized by the optimizer, enabling simultaneous multi-objective, multi-modal design. Models run in isolated managed environments; it is model-agnostic.
- **Splicing experiment (reported):** cell-type-specific alternative splicing designed using intronic sequences across cell-line pairs (e.g., brain vs blood, liver vs blood); composed **AlphaGenome** and/or **SpliceTransformer** as constraints with a mutation generator and MCMC. Decoding Bio reports **>30% of designed sequences showed the specified alternate splicing vs <7% for prior efforts that tested ~1,000 sequences**; functional designs obtained after testing **only tens** of designs. Reported discovery of cryptic/alternative splice sites (unanticipated mechanism).
- **Promoter-repressor / protein-DNA codesign (reported):** simultaneous optimization of DNA + protein with constraints for protein-DNA specificity, orthogonality, and dimerization-before-binding, **without training a task-specific protein-DNA codesign model** (composed existing structure/interface predictors). Decoding Bio reports **~50% of designed promoters showed significant expression vs no-promoter controls** and **46% of repressors active across 12 targets** despite low similarity to natural proteins; achieved by testing **tens** of candidates, not high-throughput screening.
- **Interfaces:** drag-and-drop GUI for experimentalists + Python API; deliberately designed for use by **AI coding agents** as well as humans; natural-language specification of pathways/regulatory logic.
- **Stated limitations (reported):** cannot design for an objective with no good predictive model ("end of the road"); inference-time search can take ≥30 min per run; positioned as generating optimized starting candidates, not replacing wet-lab validation.

## Why it matters (if the reported results hold)
If accurate, Proto reframes generative biology as *composition of existing models under a shared optimizer* rather than bespoke task-specific model training — the same abstraction shift that high-level languages brought to software. The order-of-magnitude reduction in designs-to-test (tens vs thousands) and the protein-DNA codesign *without* a dedicated codesign model are the two claims that would matter most, and are exactly what needs verification against the primary figures and Methods (success-rate denominators, controls, replicates, baselines).

## Open questions to resolve on re-fetch
- Exact denominators and controls for the splicing (>30% of how many; validation assay; n cell-line pairs) and promoter/repressor (50%/46% of how many; expression-assay thresholds; replicates) claims.
- What "leading success rates for synthetic protein-DNA design" is benchmarked against, and whether the comparison is prospective or cited.
- How the unified energy function weights/normalizes heterogeneous constraints, and whether multi-objective trade-offs are principled or hand-tuned.
- Robustness of the AI-agent natural-language-to-program path (success rate, failure modes) — this is the claim most prone to cherry-picking.

## Growing ideas (based on abstract + secondary detail; tentative)
- ✅ [[2026-10-03 scoring-function-oracle]] — Proto's core abstraction is composing predictive models as *constraints* in a unified scoring/energy function to steer generation, the operational embodiment of a scoring-function oracle for design.
- ✅ [[2026-10-08 agentic-function-map]] — explicitly designed for AI agents to program biological design via natural language, with primitives as callable, composable modules — a concrete substrate for an agentic design/function platform.
- ✅ [[2026-10-08 network-biology-platform]] — natural-language specification of pathways and regulatory logic, and multi-objective protein-DNA/regulatory design, align with a programmable network-biology design layer.
