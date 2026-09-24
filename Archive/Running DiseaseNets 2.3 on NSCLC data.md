---
tags:
  - gpt
---
# NSCLC Prompt

You are working inside an R package repository. I want to generate a new example analysis that showcases the full capabilities of this package.


## Tasks

1. **Create a new folder**:  
   `examples/2025-08-22_nsclc_example_analysis`

2. **Seeds (NSCLC-related genes):**  
EGFR, KRAS, ALK, ROS1, RET, BRAF, MET, ERBB2, NTRK1, PIK3CA, STK11, KEAP1,
TP53, RB1, NF1, PTEN, SMARCA4, NFE2L2, FGFR1, FGFR3, DDR2, MAP2K1, ERBB3,
AKT1, NRAS, HRAS, CDKN2A, SOX2, CCND1, MDM2, TERT, NOTCH1, ARID1A, PBRM1, EPHA3

3. **Dataset:**  
Use the bundled data file:  
`data/lung_cancer_gse19804.RData`

1. Use all of the networks in data/raw_networks to build the integrated graph

5. **Generate a new Markdown vignette** inside the new folder:  
`examples/2025-08-22_nsclc_example_analysis/showcase_gse19804.Rmd`

---

## Vignette Specification

YAML header:

```yaml
---
title: "Showcase: Network Targeting with GSE19804"
output:
html_vignette:
 toc: true
 number_sections: false
vignette: >
%\VignetteIndexEntry{Showcase: Network Targeting with GSE19804}
%\VignetteEngine{knitr::rmarkdown}
%\VignetteEncoding{UTF-8}
---

The report must contain:
- Overview: One paragraph explaining what the package does (network-based target scoring from transcriptomics).
- Data: Brief description of GSE19804 (platform, number of cases/controls) using metadata shipped with the package. No internet calls.
- QC preview: PCA or dimensionality reduction on expression data, colored by condition, plus a small sample table (n, batches if present).
- Differential expression:
	- Use the package’s helper to produce logFC-based evidence and seeds; apply LFC shrinkage.
	- Show a volcano or MA plot (≤10k points).
- Graph construction:
	- Build priors and the graph.
	- Print edge-type counts (PPI, TF–target, etc.).
	- Restrict to genes present in GSE19804 + neighbors to keep runtime low.
- Scoring:
	- Run diffusion/propagation or the default scorer.
	- Print runtime and number of nodes scored.
- Evaluation & calibration:
	- Use evaluation helper to compute AUPRC (primary), Brier, and ECE.
	- Plot PR curve (with bootstrap ribbon if available) and reliability plot.
	- Print top-k precision tables (k = 10, 25, 50).
	- Include a degree-only baseline if available.
- Interpretation:
	- List top-50 ranked genes with provenance (which priors/edges contributed).
	- Run quick gene-set enrichment on top-N genes (e.g. fgsea or built-in) and report leading pathways.
- Reproducibility & runtime:
	- Cache heavy chunks.
	- Set set.seed(42).
	- End with sessionInfo().

Style constraints:
Each plot labeled and legible.
No custom fonts or complex themes.
No external downloads; use only bundled data.
Match actual package API by inspecting exported functions and objects.

Deliverable
Implement these steps and write the complete vignette file:
examples/2025-08-22_nsclc_example_analysis/showcase_gse19804.Rmd