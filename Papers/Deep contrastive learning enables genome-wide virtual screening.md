---
title: "Deep contrastive learning enables genome-wide virtual screening"
source: "https://www.science.org/doi/10.1126/science.ads9530?utm_campaign=ScienceMagazine&utm_medium=ownedSocial&utm_source=twitter&referrer=https%3A%2F%2Fwww.science.org%2Fdoi%2F10.1126%2Fscience.ads9530%3Futm_campaign%3DScienceMagazine%26utm_medium%3DownedSocial%26utm_source%3Dtwitter"
author:
  - "[[Yinjun Jia]]"
  - "[[Bowen Gao]]"
  - "[[Jiaxin Tan]]"
  - "[[Jiqing Zheng]]"
  - "[[Xin Hong]]"
  - "[[Wenyu Zhu]]"
  - "[[Haichuan Tan]]"
  - "[[Yuan Xiao]]"
  - "[[Liping Tan]]"
  - "[[Hongyi Cai]]"
published: 2026-01-08
created: 2026-10-02
description: "Recent breakthroughs in protein structure prediction have opened new avenues for genome-wide drug discovery, yet existing virtual screening methods remain computationally prohibitive. We present Dr..."
tags:
  - "clippings"
---
## Editor’s summary

Despite progress in drug discovery, approximately 90% of druggable disease targets still lack small-molecule therapies. Although virtual screening can accelerate hit identification, traditional methods such as molecular docking remain too slow for genome-scale applications. Jia *et al*. introduce DrugCLIP, a contrastive learning framework that embeds protein pockets and small molecules into a shared latent space, enabling virtual screening up to 10 million times faster than docking. Wet-lab validation confirmed DrugCLIP’s effectiveness, identifying potent agonists or inhibitors for targeted proteins, in some cases using only AlphaFold2-predicted structures. An open-source database screening of about 10,000 human proteins against 500 million molecules highlights the transformative potential of such approaches for genome-wide drug discovery in the post-AlphaFold era. —Di Jiang

## Structured Abstract

### INTRODUCTION

A substantial portion of the human druggable genome remains untargeted by small-molecule therapeutics. With the advance of protein structure prediction technologies such as AlphaFold, genome-wide drug discovery has become a more achievable goal. However, virtual screening tools that are in use now are far from meeting this need. Present approaches, either classic molecular docking or deep-learning methods, are too computationally expensive to cover genome-wide targets. To address this, our goal was to develop an effective method for genome-wide virtual screening that can rapidly identify small-molecule ligands for every druggable target in the human genome.

### RATIONALE

We developed DrugCLIP, a contrastive learning framework for fast and accurate virtual screening. DrugCLIP encodes protein pockets and small molecules into a shared latent space, trained using both large-scale synthetic data and experimentally determined protein-ligand complex structures. Large compound libraries can then be rapidly queried with protein targets with dense retrieval techniques, similar to modern search engines. To facilitate its applicability to AlphaFold structures, we developed GenPack, a generative pocket refinement module that improves pocket-detection precision. We validated DrugCLIP using benchmark datasets and wet-lab experiments. To further demonstrate its potential, we conducted a genome-wide virtual screening campaign, with all results made publicly accessible.

### RESULTS

On the DUD-E and LIT-PCBA benchmarks, two widely used virtual screening datasets, DrugCLIP outperformed both traditional docking and state-of-the-art deep-learning baselines in terms of speed and accuracy. It also demonstrated strong generalization across chemical scaffolds and protein families and robustness to structural perturbations.

In experimental validation, DrugCLIP identified potent ligands for the serotonin 2A receptor (5HT <sub>2A</sub> R) and norepinephrine transporter (NET), two key targets in psychiatric diseases. Two 5HT <sub>2A</sub> R agonists had median effective concentration values less than 100 nM, and two NET inhibitors were structurally validated by cryo–electron microscopy.

When combined with GenPack, DrugCLIP substantially outperformed docking and induced-fit docking on challenging apo and AlphaFold-predicted structures. DrugCLIP and GenPack enabled the successful identification of small-molecule inhibitors for a less explored target thyroid hormone receptor interactor 12 (TRIP12), which has no reported holo structure or ligand. The model achieved a 17.5% hit rate in surface plasmon resonance assays, with two inhibitors further confirmed for enzymatic inhibition.

Finally, we applied DrugCLIP to a genome-wide virtual screening on ~10,000 human proteins against 500 million compounds, scoring more than 10 trillion protein-ligand pairs in under 24 hours using only eight graphics processing units (GPUs). This screen yielded more than 2 million candidate molecules covering ~20,000 pockets, representing around half of the human genome. All screening data have been made publicly available to support broad applications in drug discovery.

### CONCLUSION

DrugCLIP is an ultrafast virtual screening method that we rigorously validated through in silico benchmark evaluation and wet-lab experiments. Its speed enables trillion-scale screening covering the human druggable proteome, providing an open-access resource that forms a foundation for next-generation drug discovery, particularly for less understood targets.

![](https://www.science.org/cms/10.1126/science.ads9530/asset/f6b145be-6cad-461b-8b53-c9247a4ecd21/assets/images/large/science.ads9530-fa.jpg)

Ultrafast genome-wide virtual screening with DrugCLIP. DrugCLIP enabled a genome-wide virtual screening across ~10,000 AlphaFold-predicted human protein structures using a library of 500 million compounds, completed within 1 day on eight GPUs. The resulting database, GenomeScreenDB, surpasses the ChEMBL database in target coverage. Screening results for TRIP12 were experimentally validated, identifying functional small-molecule binders. K d, dissociation constant; RU, response units.

## Abstract

Recent breakthroughs in protein structure prediction have opened new avenues for genome-wide drug discovery, yet existing virtual screening methods remain computationally prohibitive. We present DrugCLIP, a contrastive learning framework that achieves ultrafast and accurate virtual screening, up to 10 million times faster than docking, while consistently outperforming various baselines on in silico benchmarks. In wet-lab validations, DrugCLIP achieved a 15% hit rate for norepinephrine transporter, and structures of two identified inhibitors were determined in complex with the target protein. For thyroid hormone receptor interactor 12, a target that lacks holo structures and small-molecule binders, DrugCLIP achieved a 17.5% hit rate using only AlphaFold2-predicted structures. Finally, we released GenomeScreenDB, an open-access database providing precomputed results for ~10,000 human proteins screened against 500 million compounds, pioneering a drug discovery paradigm in the post-AlphaFold era.

## Access the full article

View all access options to continue reading this article.

## Supplementary Materials

### The PDF file includes:

Supplementary Text

Figs. S1 to S13

Tables S1 to S14

References ([^6] – [^7])

### Other Supplementary Material for this manuscript includes the following:

MDAR Reproducibility Checklist

Data S1 to S5