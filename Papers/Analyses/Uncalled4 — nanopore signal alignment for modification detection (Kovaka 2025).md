---
type: paper-analysis
title: "Uncalled4 improves nanopore DNA and RNA modification detection via fast and accurate signal alignment"
doi: "10.1038/s41592-025-02631-4"
source: "https://www.nature.com/articles/s41592-025-02631-4"
authors: ["Sam Kovaka", "Paul W. Hook", "Winston Timp", "Michael C. Schatz"]
year: 2025
venue: "Nature Methods"
peer_reviewed: true
clip: "[[Uncalled4 improves nanopore DNA and RNA modification detection via fast and accurate signal alignment]]"
analyzed_on: 2026-10-14
verdict: solid
tldr: "A faster, better-engineered nanopore signal-alignment toolkit (banded basecaller-guided DTW + compact BAM format + reproducible de novo pore-model training) that yields modestly but consistently higher RNA m6A detection sensitivity than Nanopolish — a well-executed infrastructure/methods advance whose headline '26% more m6A' rests on an imperfect reference catalog."
reviewer_divergence: minor
tags: [paper, nanopore, signal-alignment, epitranscriptomics, m6a, rna-modification, bioinformatics-tooling]
idea-supports:
idea-challenges:
---

# Uncalled4 improves nanopore DNA and RNA modification detection via fast and accurate signal alignment

## TL;DR & verdict
- **Main result:** Uncalled4 aligns nanopore current to a reference with a basecaller-guided banded DTW that is 1.3–6.8× faster than Nanopolish/Tombo/f5c, stores alignments in a ~20× smaller indexable BAM, trains pore models de novo (surfacing a likely error in ONT's r10.4.1 model), and — fed into m6Anet — finds ~26% more m6A sites than Nanopolish at comparable precision.
- **Verdict — solid:** The speed, file-format, and reproducible-training claims are directly and convincingly demonstrated; the central sensitivity gain is real but modest and its magnitude is sensitive to the (acknowledged imperfect) m6A-Atlas ground truth. A strong, honest methods/tooling paper rather than a biological discovery.
- **Biggest author/reviewer divergence (minor):** The data-only read agrees Uncalled4 dominates on efficiency and matches-or-beats accuracy, but notes the "26% more sites" headline is precision-threshold- and label-dependent — at a strict 90% precision Uncalled4 finds 0.1% *fewer* sites, and the authors are explicit that m6A-Atlas is unreliable at that threshold.
- **Biggest weakness:** No orthogonal (wet-lab) validation of the extra m6A sites; "ground truth" (m6A-Atlas, GLORI, m6ACE-seq) is itself imperfect and the gain partly reflects less aggressive masking rather than better calls per se.
- **Why it matters:** Signal alignment is the unglamorous but load-bearing first step for most non-basecallable nucleotide-modification detection. A fast, standardized, BAM-based, POD5-compatible, retrainable aligner removes a real bottleneck for scaling epigenomic/epitranscriptomic analysis to pangenome-era data.

## Main idea
Nanopore current encodes more than the four bases — including nucleotide modifications — but extracting modifications requires aligning raw signal to a reference (a "resquiggle"), and the two dominant aligners (Nanopolish, Tombo) are slow, use bespoke formats, and were never updated for current ONT chemistries (r10.4.1, RNA004) or the POD5 format. Uncalled4 provides a modern toolkit: a banded DTW seeded by the basecaller's own low-resolution "moves" (letting it use a narrow band = speed), a compact indexable BAM encoding of per-position current statistics, a reproducible de novo k-mer pore-model training procedure, and comparison/visualization utilities. The applied payoff is demonstrated on RNA m6A detection across seven human cell lines, where better alignment feeds more sensitive downstream calling.

## Key findings — claims ledger
| # | Claim | Evidence (fig/panel) | Grade | Reviewer | Confidence |
|---|-------|---------------------|-------|----------|------------|
| 1 | Faster than Nanopolish (1.7–1.9×), Tombo (2.9–6.8×), f5c (1.3–2.7×) | Table 1 | direct | agrees | High |
| 2 | ~20× smaller than raw eventalign (6× vs gzipped); POD5 support | Table 1, Supp Fig 1 | direct | agrees | High |
| 3 | Alignment accuracy ≥ competitors (lowest/near-lowest MAD; closest to ref-moves) | Table 1, ED Fig 3 | direct | agrees — MAD is a limited metric (authors say so) | Medium-High |
| 4 | De novo pore-model training reproduces ONT models and reveals a likely ONT r10.4.1 error (NNNNTVTTN motif) | ED Fig 5, Supp Note 8 | direct | agrees — convincing triangulation | High |
| 5 | Higher m6A AUPRC/AUROC than Nanopolish/Tombo across KS, xPore, m6Anet | Fig 4, ED Figs 6/8 | direct | agrees | High |
| 6 | ~26% (headline) / 18% (default-threshold) more true-positive m6A sites than Nanopolish | Fig 5, Supp Tables 4–5 | indirect | weaker — label- and threshold-dependent; 0.1% fewer at 90% precision | Medium |
| 7 | Extra sites recover disease-relevant genes (ABL1, JUN, c-MYC, BCR-ABL1 fusion reads) | Fig 5e–g | indirect | agrees as suggestive; anecdotal, not validated | Medium |
| 8 | Finds disproportionately more m6A at low coverage (less masking than Nanopolish) | Fig 5b | direct | agrees — this *is* much of the mechanism of the gain | High |

## Methods audit
- **Datasets:** D. melanogaster DNA (r9.4.1 + r10.4.1, PCR + M.SssI-methylated), S. cerevisiae BrdU DNA, E. coli rRNA (36 annotated mods), HEK293T WT + METTL3-KO RNA, and seven human cell lines (3 normal / 4 cancer; mostly 2 replicates, HMEC 1, HEK293T 3). Realistic breadth across chemistries and molecule types.
- **Ground truth (the crux):** m6A-Atlas v2, GLORI, and m6ACE-seq METTL3-sensitive labels. The authors are commendably explicit that m6A-Atlas is "an imperfect ground truth," demonstrate label errors themselves (the TTC4 / MROH7-TTC4 readthrough mislabeling, Fig 5g), and show relative method ranking is stable across GLORI vs Atlas. But every accuracy number inherits this label noise — there is no orthogonal wet-lab confirmation of the *additional* sites Uncalled4 finds.
- **Controls / fairness:** Competitors run with recommended/required parameters on matched data and hardware (single CPU thread; f5c on GPU). m6Anet and Nanopolish both retrained on re-basecalled HCT116 to isolate the alignment effect from re-basecalling. Train/test/validation split is by gene (good — prevents transcript-level leakage across splits).
- **Precision handling:** Recognizes that tool prefiltering inflates recall by dropping (often modified) sites; compensates by filling probability-zero for covered sites and using average-precision AUPRC. This is a careful, honest correction — and it is also where the headline number becomes threshold-sensitive: +27–28% pTP at 80–85% precision but −0.1% at 90%.
- **Mechanism of the gain:** A substantial part of Uncalled4's extra sensitivity comes from doing *less* masking than Nanopolish (which masks 9–14% of covered sites), especially at low coverage — i.e. more sites survive to be called, rather than fundamentally better per-site discrimination. The authors show this directly (Fig 5b), which is to their credit.
- **Stats:** AUPRC/AUROC with sensible definitions; KS via scipy; no formal significance tests or CIs on the site-count deltas, which are reported as percentages. Benchmarking is single-thread timing (reasonable for comparability).
- **Reproducibility:** De novo training needs no prior k-mer model and is open-source (POD5/SLOW5/FAST5 input), with supplemental data and models released — a genuine strength.

## Independent reviewer
### Reviewer's conclusions (data only — Results/Methods/Extended Data/figure legends, blind to abstract/discussion)
1. Uncalled4 is unambiguously faster and more space-efficient than the three comparator aligners and supports modern chemistries/formats the others don't (Table 1). This is the most robust, cleanly-measured result.
2. Alignment quality is at least as good as competitors by the available proxies (MAD, distance-to-ref-moves), but these are admittedly limited metrics with no absolute ground truth for alignment correctness (Table 1, ED Fig 3) — "better alignment" is supported comparatively, not absolutely.
3. The de novo pore-model training is a real contribution: it reproduces ONT models (high Pearson r) and independently flags a specific ONT r10.4.1 400-bps model anomaly via three converging lines of evidence (substitution profile, 260-bps comparison, mod-detection performance) (ED Fig 5, Supp Note 8). Convincing.
4. On RNA m6A, Uncalled4 beats Nanopolish/Tombo on AUPRC/AUROC across multiple downstream callers and finds more putative true positives (18% default / 27–28% at matched 80–85% precision) — but the magnitude depends on the precision threshold and on an imperfect reference catalog, and at 90% precision the advantage vanishes (−0.1%) (Fig 4, Fig 5, Supp Tables 4–5).
5. Cannot determine whether the *additional* m6A sites are genuinely methylated: no orthogonal validation; the disease-gene examples (ABL1, JUN, c-MYC) are suggestive anecdotes, and the gain is partly explained by reduced masking rather than superior per-site calling.
- **Most serious weaknesses:** no independent validation of extra calls; ground truth is noisy and partly self-corrected; headline % is threshold-dependent; much of the sensitivity gain is a masking policy difference.
- **Missing experiments:** orthogonal confirmation (e.g. GLORI/antibody/ mutagenesis) of a sample of Uncalled4-only sites; a controlled comparison holding masking policy fixed across tools; CIs on the site-count deltas.

### Authors vs reviewer
| Claim | Authors | Reviewer | Agreement |
|-------|---------|----------|-----------|
| Faster + smaller + modern-format | Core claim | Fully supported | agrees |
| More accurate alignment | Stated | Comparatively yes; no absolute ground truth; MAD limited | agrees (with caveat authors also state) |
| Reveals ONT pore-model error | Stated | Well-triangulated, convincing | agrees |
| 26% more m6A than Nanopolish | Headline | Real but 18% at default, 0% at 90% precision; label-dependent | weaker than headline framing |
| Extra sites are biologically meaningful | Disease-gene examples | Suggestive, unvalidated | reviewer more cautious |
| Gain = better detection | Implied | Substantially a less-aggressive-masking effect | reviewer reframes mechanism |

**Reviewer divergence summary: minor.** The authors are themselves unusually candid (they flag m6A-Atlas unreliability, the TTC4 mislabel, the masking mechanism, and the 90%-precision crossover), so the reviewer's caveats largely echo the paper's own disclosures rather than contradict them.

## Adversarial context
### Steelman
This is exactly the kind of infrastructure the field needs and rarely rewards: a fast, standardized, indexable, POD5-ready, retrainable signal aligner that unifies a fragmented tool ecosystem and plugs into existing callers (xPore, m6Anet) via conversion. The de novo pore-model training that independently caught an ONT model error is a standout — it demonstrates the method is sensitive enough to audit the vendor's own model. The authors' candor about ground-truth limits is a model of honest methods reporting.

### Red team
The biological headline ("26% more m6A, including cancer genes") does heavier promotional work than the data license. The gain is modest, threshold-fragile (gone at 90% precision), rests on a catalog the authors themselves show contains labeling errors, and is substantially a consequence of masking fewer low-coverage sites — which could equally mean more false positives that the imperfect reference can't catch. None of the extra sites are orthogonally validated.

### Alternative explanations
Uncalled4's apparent sensitivity advantage may largely be a *recall-for-precision trade* implemented via masking policy: keep more low-coverage sites, call more of them, and score well against a reference that is itself incomplete (so many "false positives" may be unlabeled true sites — or genuine false positives). Without orthogonal validation these are indistinguishable from the AUPRC curves alone.

### Falsifying experiment
Take a set of m6A sites found only by Uncalled4 (especially low-coverage ones) and test them orthogonally — GLORI/antibody-independent chemistry or METTL3-KO sensitivity at single-site resolution. If the Uncalled4-only sites are not enriched for genuine METTL3-dependent methylation relative to Nanopolish-only sites, the "more sensitive detection" claim reduces to "less masking."

## Avenues to explore
- The BAM-tag signal-alignment format is a candidate community standard; worth tracking whether ONT/f5c/Squiguliser converge on it.
- The reproducible de novo pore-model training is the most generative piece — it enables training models for arbitrary/artificial modifications (demonstrated with BrdU), opening a path to systematically profiling the ~150 known RNA modifications that currently lack callers.
- Pan-epitranscriptomic scaling (the paper's own framing) is the strategic hook: fast, indexable signal alignment is the prerequisite for applying modification detection across pangenome-scale long-read datasets.

## Growing ideas
(No specific connection to current idea notes — this is a nanopore signal-alignment / epitranscriptomics tooling advance, orthogonal to the protein-design, network-biology, and nutrition idea threads in the vault.)
