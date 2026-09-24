---
tags:
  - compbio
  - ai
  - reference
last-synthesized: 2026-09-23
---

# 🧬 Computational Index

> Organized from: [[Computational Resources]] · [[Links]] · [[📃 Papers]] · [[👨🏻‍💻 Comp Bio + AI Learning]]
> When "New inputs" below grows, bucket the new items and update the sections above.

---

## Biological Databases & Data Sources

| Resource | What it is |
|---|---|
| [OpenCell](https://opencell.sf.czbiohub.org/download) | Protein localization atlas (CZ Biohub) |
| [Human Protein Atlas](http://proteinatlas.org/about/help/dataaccess) | Protein expression across tissues/cells |
| [GTEx](https://www.gtexportal.org/home/downloads/adult-gtex/bulk_tissue_expression) | Bulk tissue gene expression, 53 tissues |
| [Therapeutic Target Database](https://db.idrblab.net/ttd/full-data-download) | Drug targets and clinical annotations |
| [CancerRxGene](http://cancerrxgene.org/about) | Drug sensitivity in cancer cell lines |
| [CZI Virtual Cells](https://virtualcellmodels.cziscience.com) | AI-powered cell models platform |
| [Plasma Proteome Atlas](https://www.cell.com/cell/fulltext/S0092-8674(24)01268-6) | 53,026 adults, health + disease (Cell 2024) |
| [NDEx](https://www.ndexbio.org) | Network data exchange — signaling pathways |

---

## ML/AI for Biology — Methods & Tools

**Single-cell & transcriptomics**
- [DRUG-seq](https://github.com/Novartis/DRUG-seq) — high-throughput transcriptomic profiling for drug screening
- [CellChat](https://github.com/sqjin/CellChat) — cell-cell communication inference
- [CellPhoneDB](https://www.cellphonedb.org) — ligand-receptor interaction database
- [scLAMBDA](https://www.biorxiv.org/content/10.1101/2024.12.04.626878v1.abstract) — single-cell multi-gene perturbation response prediction
- [Explainable deep NNs for phenotype prediction from scRNA-seq](https://www.biorxiv.org/content/10.1101/2024.12.03.626549v1.abstract)
- [Explainable GNN for multimodal single-cell integration](https://www.biorxiv.org/content/10.1101/2024.12.06.627151v1.abstract)

**Protein & sequence modeling**
- [[ProteinMPNN — sequence design]] — deep learning protein sequence design (in Concepts)
- [Evo](https://www.science.org/doi/10.1126/science.ado9336) — sequence modeling from molecular to genome scale (Science 2024)
- [Binding affinity via protein + ligand LMs](https://www.biorxiv.org/content/10.1101/2024.11.01.621495v2.abstract) — fine-tuning approach
- [Protein Language Visualizer](https://www.biorxiv.org/content/10.1101/2024.11.19.624229v2.abstract) — sequence similarity networks
- [TransFun / TAWFN](https://pmc.ncbi.nlm.nih.gov/articles/PMC11639667/) — protein function prediction (deep learning)
- [Mapping targetable sites on the surfaceome](https://www.biorxiv.org/content/10.1101/2024.12.16.628626v1) — binder design

**Network & pathway methods**
- [Pinferna](https://github.com/JanesLab/Pinferna/blob/main/Pinferna.R) — protein inference from network analysis
- [NDEx Monster](https://netzoo.github.io/zooanimals/monster/) — regulatory network inference
- [RaCInG](https://github.com/SysBioOncology/RaCInG) — cancer cell-cell interaction

**Perturbation & causal**
- [PDGrapher](https://zitniklab.hms.harvard.edu/projects/PDGrapher/) — combinatorial perturbation prediction (causal NNs)
- [Engineering synthetic phosphorylation networks](https://www.science.org/doi/epdf/10.1126/science.adm8485) — synthetic signaling (Science 2024)

---

## Drug Discovery & Cheminformatics

**ADC / Affimixer**
- [Payload diversification in ADCs](https://jhoonline.biomedcentral.com/articles/10.1186/s13045-022-01397-y) — review
- [Multi-payload ADCs](https://www.biointron.com/blog/multi-payload-antibody-drug-conjugates.html) — advancing targeted cancer therapies
- [Homogeneous multi-payload ADCs](https://www.nature.com/articles/s41557-024-01507-y) — Nature Chemistry 2024

**Molecular design**
- [Algorithmic synthetic cost-aware molecular design](https://www.nature.com/articles/s43588-024-00639-y) — Nature Comp Sci 2024
- [chemprop](https://github.com/chemprop/chemprop) — message-passing NNs for molecular property prediction
- [lightweight-registration](https://github.com/rinikerlab/lightweight-registration) — compound registration
- [Structure-aware generative molecular design](https://cheminformantics.blogspot.com/2024/12/structure-aware-generative-molecular.html)
- [How to drug a novel target in 500 molecules](https://variationalai.substack.com/p/how-to-drug-a-novel-target-in-500) — VariationalAI
- [Chemical dataset splitting](https://practicalcheminformatics.blogspot.com/2024/11/some-thoughts-on-splitting-chemical.html)

**Proximity / Interactions**
- [Inferring interaction partners from protein sequences](https://www.pnas.org/doi/full/10.1073/pnas.1606762113) — PNAS
- [Induced proximity — lab and clinic](https://www.science.org/content/blog-post/induced-proximity-lab-and-clinic) — Science blog

---

## Biotech Strategy

- [Building a biotech startup](http://linkedin.com/pulse/how-build-biotech-startup-krzysztof-potempa/) — Potempa on LinkedIn
- [The Practical Guide to Biotech Partnerships](https://lucas-harrington.com/2025/02/13/the-practical-guide-to-biotech-partnerships/)
- [Balancing innovation and operational excellence](https://www.linkedin.com/advice/1/how-can-you-balance-innovation-operational-excellence) — LinkedIn
- [The eight essentials of innovation](https://www.mckinsey.com/capabilities/strategy-and-corporate-finance/our-insights/the-eight-essentials-of-innovation#/) — McKinsey
- [Data strategy — HBR](https://hbr.org/2017/05/whats-your-data-strategy)
- [Data strategy — AWS primer](https://aws.amazon.com/what-is/data-strategy/)

---

## Learning Resources

**Technical**
- [Kaggle Python](https://www.kaggle.com/learn/python) · [Kaggle Pandas](https://www.kaggle.com/learn/pandas)
- [Crash course: confounding bias + deconfounding in R](https://www.biostatistics.ca/crash-course-on-confounding-bias-and-deconfounding-remedies-using-r/)
- [Graph Neural Networks crash course](https://www.dailydoseofds.com/a-crash-course-on-graph-neural-networks-implementation-included/)
- [Gaussian Mixture Models](https://www.dailydoseofds.com/gaussian-mixture-models-gmm/)

**Courses (Coursera)**
- [Basics of Entrepreneurship](https://www.coursera.org/learn/basics-of-entrepreneurship-thinking-and-doing)
- [Corporate Strategy](https://www.coursera.org/learn/corporatestrategy)
- [AI + Business / Future of Work](https://www.coursera.org/learn/ai-business-future-of-work)

**Blogs to follow**
- [Cheminformantics](https://cheminformantics.blogspot.com/) — cheminformatics practice
- [Practical Cheminformatics](https://practicalcheminformatics.blogspot.com/)
- [Eric Topol / Ground Truths](https://erictopol.substack.com/) — AI in medicine
- [Variational AI](https://variationalai.substack.com/) — drug discovery ML
- [Genes Minds Machines](https://blog.genesmindsmachines.com/)
- [Daily Dose of DS](https://www.dailydoseofds.com/)

---

## New inputs — integrate these

> Papers and notes tagged `#papers #compbio` or `#ai` that aren't yet reflected above.

```dataview
LIST WITHOUT ID file.link + " *(modified " + dateformat(file.mtime, "MMM d") + ")*"
FROM #papers & (#compbio | #ai)
SORT file.mtime DESC
LIMIT 10
```

```dataview
LIST WITHOUT ID file.link + " *(modified " + dateformat(file.mtime, "MMM d") + ")*"
FROM "Notes/Concepts"
WHERE file.mtime >= date(today) - dur(30 days)
SORT file.mtime DESC
LIMIT 8
```
