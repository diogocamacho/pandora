---
title: "Fifteen challenges for generative AI applications to cell biology"
source: "https://www.cell.com/cell/fulltext/S0092-8674(26)00802-0"
author:
  - "[[Leo Dupire]]"
  - "[[Aly A. Khan]]"
  - "[[Theofanis Karaletsos]]"
  - "[[Shana Kelley]]"
  - "[[Emma Lundberg]]"
  - "[[Jian Ma]]"
  - "[[Evan Paull]]"
  - "[[Stephen R. Quake]]"
  - "[[Raul Rabadan]]"
  - "[[Rowan Cassius]]"
  - "[[Peter Sims]]"
  - "[[Sohail Tavazoie]]"
  - "[[John S. Tsang]]"
  - "[[Mingxuan Zhang]]"
  - "[[Andrea Califano]]"
published:
created: 2026-10-01
description: "Drawing inspiration from Hilbert’s list of 23 mathematical problems that have focusedthe mathematical community’s attention for more than a century, we propose fifteengrand AI challenges to focus the biomedical community’s attention on critically relevantquestions, most of which still lack effective predictive methodologies."
tags:
  - "clippings"
---
## Summary

Generative AI (Gen-AI) has shown a remarkable impact in several biological research areas, from protein folding and *de novo* design to pathogenic mutation prediction. However, it remains unclear whether these molecular-level successes can translate to cellular and multicellular insights relevant to fields ranging from immunology to cancer and neurodegeneration. This arises from the intricate nature of the molecular mechanisms that determine cellular and organismal behavior, the lack of sufficient training data, and the multicellular nature of most pathophysiologic phenotypes. Novel Gen-AI frameworks are likely needed to integrate prior biological knowledge, such as molecular interaction networks, as well as guiding principles focusing the community’s attention on solving biologically and translationally relevant problems. Drawing inspiration from Hilbert’s list of 23 mathematical problems that have focused the mathematical community’s attention for more than a century, we propose fifteen grand AI challenges to focus the biomedical community’s attention on critically relevant questions, most of which still lack effective predictive methodologies.

## Introduction

The ability to predict and control the behavior of individual cell types and multicellular systems has emerged as a central, yet largely unmet, goal of modern biology and medicine. For instance, novel methodologies to accurately predict the effects of genetic, pharmacologic, and naturally occurring perturbations would be transformational in achieving better experimental designs, from investigating fundamental biology questions to planning clinical studies. In contrast, our current paradigm, characterized by incremental hypothesis formulation and experimental testing—often in model organisms that only partially recapitulate human biology—is becoming increasingly ineffective at addressing these complex challenges. For instance, between 2006 and 2022, only 14.6% of clinical trials led to drug approval,

1.

Schuhmacher, A. ∙ Hinder, M. ∙ Brief, E....

**Benchmarking R&D success rates of leading pharmaceutical companies: an empirical analysis of FDA approvals (2006–2022)**

*Drug Discov. Today.* 2025; **30**, 104291

with an even more disappointing decrease to only 6.7% between 2014 and 2023,

2.

Mullin, K.

**Why are clinical development success rates falling?**

Norstella, 2024

[https://www.norstella.com/why-clinical-development-success-rates-falling/](https://www.norstella.com/why-clinical-development-success-rates-falling/)

[Google Scholar](https://scholar.google.com/scholar?q=K.MullinWhy+are+clinical+development+success+rates+falling%3F2024Norstellahttps%3A%2F%2Fwww.norstella.com%2Fwhy-clinical-development-success-rates-falling%2F)

due to either lack of efficacy or unexpected toxicity (note: these figures are drawn from different sources and time windows and should be interpreted as indicative rather than directly comparable trends). This imposes an exceptional burden on both industrial and academic research. These issues also plague academic research labs, where students and postdocs may labor for years on hypotheses that ultimately fail to be validated.

3.

Freedman, L.P. ∙ Cockburn, I.M. ∙ Simcoe, T.S.

**The Economics of Reproducibility in Preclinical Research**

*PLoS Biol.* 2015; **13**, e1002165

Computational approaches have shown significant predictive power in key areas of biological discovery, from the elucidation of immunogenic neoantigens in cancer—driven by advances in modeling major histocompatibility complex (MHC) binding and T cell recognition

4.

Łuksza, M. ∙ Riaz, N. ∙ Makarov, V....

**A neoantigen fitness model predicts tumour response to checkpoint blockade immunotherapy**

*Nature.* 2017; **551**:517-520

—and the neoantigen repertoire in long-term cancer survival,

5.

Balachandran, V.P. ∙ Łuksza, M. ∙ Zhao, J.N....

**Identification of unique neoantigen qualities in long-term survivors of pancreatic cancer**

*Nature.* 2017; **551**:512-516

to the development of novel therapeutic targets and associated inhibitors validated in preclinical studies

6.

Ma, J. ∙ Fong, S.H. ∙ Luo, Y....

**Few-shot learning creates predictive models of drug response that translate from high-throughput screens to individual patients**

*Nat. Cancer.* 2021; **2**:233-244

<sup>,</sup>

7.

Mundi, P.S. ∙ Dela Cruz, F.S. ∙ Grunn, A....

**A Transcriptome-Based Precision Oncology Platform for Patient-Therapy Alignment in a Diverse Set of Treatment-Resistant Malignancies**

*Cancer Discov.* 2023; **13**:1386-1407

and clinical trials,<sup>,</sup>

9.

Jamison, J.K. ∙ Zhou, M. ∙ Gelmann, E.P....

**Entinostat in patients with relapsed or refractory abdominal neuroendocrine tumors**

*Oncologist.* 2024; **29**:817-e1213

and to disease biomarkers and companion diagnostics now entering clinical use.<sup>,</sup>

11.

van ’t Veer, L.J. ∙ Dai, H. ∙ van de Vijver, M.J....

**Gene expression profiling predicts clinical outcome of breast cancer**

*Nature.* 2002; **415**:530-536

Similarly, progress in generative AI (Gen-AI) models over the last 5 years has led to remarkable success in protein structure prediction, *de novo* protein design, and medical image analysis. These successes share a common feature: they arise from addressing frontier biological questions that are poorly suited to more traditional experimental approaches. In contrast, recent advances aimed at predicting cell state, function, or behavior have not yet achieved the same level of biological impact and have leveraged statistical rather than biology-driven benchmarks to showcase relative superiority—largely via retrospective rather than prospective benchmarks. Here, we use Gen-AI to indicate models that learn a generalizable probability distribution over biological data to generate, score, or prioritize novel, biologically plausible outputs in previously unseen contexts. The emphasis is on foundation-model-style architectures—especially transformer-based models—because they currently dominate large-scale biological modeling. We distinguish these from (1) models that are purely discriminative and aimed at mapping inputs to labels, (2) task-specific predictive models that do not aim to produce generalizable biological data distributions, and (3) classical machine learning (ML), network-based, or statistical models. The latter provide the comparative benchmarks against which Gen-AI progress may be measured. Although related to our definition, other generative architectures, such as generative adversarial networks (GANs), diffusion models, and variational autoencoders (VAEs), are also not the central focus of this perspective.

Given the profound impact of more traditional computational approaches, as well as the new wave of Gen-AI methodologies, it is not surprising that many researchers now envision a future in which experimental failures in complex biological settings may be largely avoided by leveraging increasingly accurate predictive models. Consistent with this perception, the last few years have seen a dramatic increase in publications hailing the emergence of virtual cell models,

12.

Bunne, C. ∙ Roohani, Y. ∙ Rosen, Y....

**How to build the virtual cell with artificial intelligence: Priorities and opportunities**

*Cell.* 2024; **187**:7045-7063

virtual clinical trials,

13.

Pappalardo, F. ∙ Russo, G. ∙ Tshinanu, F.M....

**In silico clinical trials: concepts and early adoptions**

*Brief. Bioinform.* 2019; **20**:1699-1708

digital immune twins,

14.

Björnsson, B. ∙ Borrebaeck, C. ∙ Elander, N....

**Digital twins to personalize medicine**

*Genome Med.* 2019; **12**:4

and even virtual brains,

15.

Jirsa, V. ∙ Wang, H. ∙ Triebkorn, P....

**Personalised virtual brain models in epilepsy**

*Lancet Neurol.* 2023; **22**:443-454

all aimed at predicting the outcome of biological and clinical experiments. Some of these efforts have already been remarkably successful, such as the prediction and *de novo* design of protein structures

16.

Jumper, J. ∙ Evans, R. ∙ Pritzel, A....

**Highly accurate protein structure prediction with AlphaFold**

*Nature.* 2021; **596**:583-589

—including function-based design

17.

Watson, J.L. ∙ Juergens, D. ∙ Bennett, N.R....

**De novo design of protein structure and function with RFdiffusion**

*Nature.* 2023; **620**:1089-1100

for novel antibodies

18.

Saka, K. ∙ Kakuzaki, T. ∙ Metsugi, S....

**Antibody design using LSTM based deep generative model from phage display library for affinity maturation**

*Sci. Rep.* 2021; **11**, 5852

and epitopes

19.

Jespersen, M.C. ∙ Peters, B. ∙ Nielsen, M....

**BepiPred-2.0: improving sequence-based B-cell epitope prediction using conformational epitopes**

*Nucleic Acids Res.* 2017; **45**:W24-W29

—or T cell receptor (TCR)-peptide binding prediction.

20.

Li, F. ∙ Qian, X. ∙ Zhu, X....

**TCRcost: a deep learning model utilizing TCR 3D structure for enhanced of TCR-peptide binding**

*Front. Genet.* 2024; **15**, 1346784

A shared commonality is that their underlying biology is implemented by relatively ordered, linear structures, such as nucleic acid sequences—thus optimally leveraging the local attention mechanisms of large language models (LLMs)—and supported by very large, high-quality databases, such as the PDB.

21.

Sussman, J.L. ∙ Lin, D. ∙ Jiang, J....

**Protein Data Bank (PDB): database of three-dimensional structural information of biological macromolecules**

*Acta Crystallogr. D Biol. Crystallogr.* 1998; **54**:1078-1084

In contrast, the application of Gen-AI models to predicting cell behavior and function determinants has “provided us with valuable means for maintaining our modesty”—to paraphrase the words used to mitigate unwarranted optimism in protein folding prediction in the 1990s

22.

Honig, B. ∙ Cohen, F.E.

**Adding backbone to protein folding: why proteins are polypeptides**

*Fold. Des.* 1996; **1**:R17-R20

—suggesting that novel frameworks and larger datasets may be required to predict cells, tissues, organs, and eventually organismal behavior. Consistent with these limitations, performance evaluation of most Gen-AI systems applied to cell biology has been based on statistical criteria using retrospective datasets rather than on the ability to make novel, prospectively validated discoveries.

## From virtual cells to complex physiological systems

Most biomedical challenges related to human health require predictive and mechanistic insights into function implementation at a cellular and organismal, rather than molecular level. Indeed, designing proteins with novel functions or novel therapeutic molecules does not directly inform us of the macroscopic phenotypic effects they may produce, which are often mediated by multiple cell types. To illustrate, neurodegenerative diseases can emerge from complex interactions between neurons, astrocytes, glia, and immune cells; similarly, studying cardiovascular disease requires modeling the interactions among endothelial, smooth muscle, and immune cells with cardiomyocytes; finally, tumors are critically dependent on the complex cellular composition of the tumor microenvironment (TME). Thus, despite the rising expectation that virtual cell models may be just around the corner, predicting complex systems behavior—from individual cells to organisms—may not necessarily be a direct byproduct of Gen-AI’s remarkable success in modeling protein structure or human language.

An exemplary context that perhaps uniquely captures the complexity and potential of modeling multiple cell types working together, while being potentially amenable to Gen-AI modeling, is represented by the immune system. This is for several reasons, which include the following: (1) Longitudinal accessibility: unlike other tissues requiring invasive sampling procedures, most immune cells can be sampled from blood—including longitudinally—a feat ranging from challenging to impossible in other contexts; (2) Natural trafficking: most immune cells can naturally access virtually all of our organs, encountering and responding to disease states, thus effectively providing ready-made mobile biosensors of organismal health

22.

Honig, B. ∙ Cohen, F.E.

**Adding backbone to protein folding: why proteins are polypeptides**

*Fold. Des.* 1996; **1**:R17-R20

<sup>,</sup>

23.

Peña, O.A. ∙ Martin, P.

**Cellular and molecular mechanisms of skin wound healing**

*Nat. Rev. Mol. Cell Biol.* 2024; **25**:599-616

<sup>,</sup>

24.

Janeway, C.A. ∙ Medzhitov, R.

**Innate immune recognition**

*Annu. Rev. Immunol.* 2002; **20**:197-216

<sup>,</sup>

25.

Ribas, A. ∙ Wolchok, J.D.

**Cancer immunotherapy using checkpoint blockade**

*Science.* 2018; **359**:1350-1355

<sup>,</sup>

26.

Rosenblum, M.D. ∙ Remedios, K.A. ∙ Abbas, A.K.

**Mechanisms of human autoimmunity**

*J. Clin. Invest.* 2015; **125**:2228-2233

<sup>,</sup>

27.

Galli, S.J. ∙ Tsai, M.

**IgE and mast cells in allergic disease**

*Nat. Med.* 2012; **18**:693-704

<sup>,</sup>

28.

Heneka, M.T. ∙ Carson, M.J. ∙ El Khoury, J....

**Neuroinflammation in Alzheimer’s disease**

*Lancet Neurol.* 2015; **14**:388-405

<sup>,</sup>

29.

López-Otín, C. ∙ Blasco, M.A. ∙ Partridge, L....

**Hallmarks of aging: An expanding universe**

*Cell.* 2023; **186**:243-278

; (3) Effective bioengineering: critically, as shown by chimeric antigen receptor (CAR) T therapy, the surveillance and disease fighting abilities of immune cells can be customized and potentiated via cell-engineering approaches to introduce entirely new functions; (4) *I* *n vivo* modeling: immune cells can be harvested, manipulated *ex vivo*, and reintroduced into laboratory animals—and, increasingly, given appropriate regulatory approvals, even into human subjects—thus enabling iterative cycles of prediction, engineering, and validation; and finally, (5) Clinical impact: the immune system is implicated in myriad human diseases, and its health-preserving abilities have helped address existential threats to our species, from wound healing

23.

Peña, O.A. ∙ Martin, P.

**Cellular and molecular mechanisms of skin wound healing**

*Nat. Rev. Mol. Cell Biol.* 2024; **25**:599-616

to infectious agents

24.

Janeway, C.A. ∙ Medzhitov, R.

**Innate immune recognition**

*Annu. Rev. Immunol.* 2002; **20**:197-216

and cancer.

25.

Ribas, A. ∙ Wolchok, J.D.

**Cancer immunotherapy using checkpoint blockade**

*Science.* 2018; **359**:1350-1355

Yet, when it has gone awry, it can also trigger disease—from autoimmunity

26.

Rosenblum, M.D. ∙ Remedios, K.A. ∙ Abbas, A.K.

**Mechanisms of human autoimmunity**

*J. Clin. Invest.* 2015; **125**:2228-2233

and allergy

27.

Galli, S.J. ∙ Tsai, M.

**IgE and mast cells in allergic disease**

*Nat. Med.* 2012; **18**:693-704

to neurodegeneration

28.

Heneka, M.T. ∙ Carson, M.J. ∙ El Khoury, J....

**Neuroinflammation in Alzheimer’s disease**

*Lancet Neurol.* 2015; **14**:388-405

and aging.

29.

López-Otín, C. ∙ Blasco, M.A. ∙ Partridge, L....

**Hallmarks of aging: An expanding universe**

*Cell.* 2023; **186**:243-278

It is also reasonable to assume that any methodological framework for the successful modeling of the immune system may generalize to other multicellular contexts. For instance, the ability to predict determinants of immune cell state reprogramming will likely generalize to identify drivers of cardiac regeneration, neuronal fate specification, and pancreatic beta cell restoration. Similarly, modeling immune cell interactions will likely generalize to elucidating TME dependencies, neuron-glia interactions, and paracrine signaling in endocrinology.

Modeling the immune system may appear to be a harder—and potentially more daunting—task compared with building a virtual cell. Not only does it operate across multiple spatiotemporal scales—involving complex coordination and interactions among distinct cell states—but it also exhibits critical inter-individual variation driven by genetics, age, sex, prior exposures, microbiome composition, and environmental factors.

30.

Lei, Y. ∙ Tsang, J.S.

**Systems Human Immunology and AI: Immune Setpoint and Immune Health**

*Annu. Rev. Immunol.* 2025; **43**:693-722

Recent efforts, such as the Human Immunome Project (HIP),

31.

Human Immunome Project. (2026). A New Model for Human Health (Human Immunome Project). [https://www.humanimmunomeproject.org/](https://www.humanimmunomeproject.org/).

[Google Scholar](https://scholar.google.com/scholar?q=Human+Immunome+Project.+%282026%29.+A+New+Model+for+Human+Health+%28Human+Immunome+Project%29.+https%3A%2F%2Fwww.humanimmunomeproject.org%2F.)

have been devoted to systematically mapping this variation across globally diverse populations, recognizing that predictive models trained on narrow demographic slices will fail to generalize. And yet, perhaps counterintuitively, modeling such a complex multicellular system may also prove simpler. This is because most of the cell’s machinery—which virtual cell models would have to directly represent—is devoted to supporting basic mechanisms that, although critical for cell survival and replication, may require only a coarse-grained representation to model their contribution to immune functions. For instance, with some notable exceptions—e.g., metabolic switching to aerobic glycolysis in T cell expansion and B cell germinal center formation—processes related to cell division and growth, DNA repair, basal metabolism, and cell homeostasis may not require full-scale representation.

An example in which using different modeling criteria led to a massive simplification is provided by molecular dynamics, where representing light atoms such as hydrogen and heavy atoms such as carbon on different timescales has led to a 20-fold improvement in performance.

32.

Tuckerman, M. ∙ Berne, B.J. ∙ Martyna, G.J.

**Reversible multiple time scale molecular dynamics**

*J. Chem. Phys.* 1992; **97**:1990-2001

Identifying similar, problem-specific layers of abstraction—leading to coarse vs. fine-grained modeling of specific functions—could dramatically simplify the task. Interestingly, Gen-AI is ideally suited to dimensionality reduction tasks,

33.

Svensson, V. ∙ Gayoso, A. ∙ Yosef, N....

**Interpretable factor models of single-cell RNA-seq via variational autoencoders**

*Bioinformatics.* 2020; **36**:3418-3421

which would critically help produce effective immune cell embeddings.

30.

Lei, Y. ∙ Tsang, J.S.

**Systems Human Immunology and AI: Immune Setpoint and Immune Health**

*Annu. Rev. Immunol.* 2025; **43**:693-722

## The challenge of current Gen-AI models

An interesting question is whether existing Gen-AI models—currently dominated by LLMs—may be optimally suited to addressing problems where complex multi-dimensional dependencies exist within an unrestricted attention context. For complex systems regulating multicellular behavior, unlike in language or protein-folding applications, the problem cannot be effectively represented as a linear string of tokens. We and others have shown that large repertoires of N-way interactions must be explicitly modeled in these contexts, as their multi-information cannot be assessed from their marginals.

34.

Wang, K. ∙ Saito, M. ∙ Bisikirska, B.C....

**Genome-wide identification of post-translational modulators of transcription factor activity in human B cells**

*Nat. Biotechnol.* 2009; **27**:829-839

For example, the ability of a protein kinase to modulate the activity of a transcription factor (TF) on its targets may require bona fide three-way interaction modeling. Even higher-order interactions exist. For instance, assembling a functional 60S ribosomal subunit requires coordinated binding of up to 47 proteins,

35.

Ban, N. ∙ Beckmann, R. ∙ Cate, J.H.D....

**A new system for naming ribosomal proteins**

*Curr. Opin. Struct. Biol.* 2014; **24**:165-169

and its function cannot be recapitulated by any individual protein or pairwise protein-protein interaction in isolation. Similarly, formation of large transcriptional regulation complexes on chromatin—critical for genetic program control during development,

36.

Allis, C.D. ∙ Jenuwein, T.

**The molecular hallmarks of epigenetic control**

*Nat. Rev. Genet.* 2016; **17**:487-500

for instance—is determined by the still elusive combinatorial code of DNA-binding motifs, chromatin/histone organization, and regulatory protein interactions determined by intrinsically disordered regions (IDRs) that fail to be modeled even by the most advanced Gen-AIs.

37.

Spitz, F. ∙ Furlong, E.E.M.

**Transcription factors: from enhancer binding to developmental control**

*Nat. Rev. Genet.* 2012; **13**:613-626

*De novo* learning in such a combinatorially vast space, using current LLM-based models, is likely to vastly exceed any foreseeable data and computational power availability. Modeling the millions of gene regulatory motifs and protein isoforms encoded by our genomes, in combinations of up to 47 elements (i.e., the size of the 60S ribosomal subunit), would produce ∼3.48 × 10 <sup>150</sup> possibilities, a space much larger than the 10 <sup>80</sup> estimated atoms in the universe. Even restricting the analysis to pairwise protein-protein and protein-DNA interactions for 20,000 genes—a dramatic oversimplification—would require modeling more than a billion interactions. When more realistic models are considered—incorporating over a million potential protein isoforms, metabolites, and other chemical moieties— *de novo* learning in such a combinatorially vast space using current LLM-based models becomes computationally intractable.

To address this challenge, we propose that effective Gen-AI implementations—capable of modeling multicellular behaviors such as those critical to generating novel insights in immunology, cancer, or neurobiology—may require entirely novel computational architectures. One approach could be to “pre-wire” biological knowledge in the model, for instance, by leveraging graph-based attention mechanisms that represent established or inferred molecular interaction networks as priors for search-space dimensionality reduction. This could be achieved by representing transcriptional, signaling, and cell-cell communication networks as probabilistic graphs that restrict the model’s attention via diffusion kernels, and/or by incorporating curated knowledge bases—for instance, on subcellular localization, different protein isoforms, or complex formation—or by including basic physical and mechanism-based constraints into the model’s architecture. Such an approach would critically require dynamic prior reassessment, based on evaluating its contribution to correct vs. erroneous inference. The use of biology-anchored models, generated by integrating computational inferences and experimental knowledge, may also help to address the critical limitation associated with the suboptimal representation of causality in probabilistic models based on transformer architectures. Incorporating this knowledge—either directly in the attention model during model training or post-training, in the fine-tuning step—will likely improve the ability to make biologically and even translationally meaningful predictions.

The initial attention model graphs—which could then be dynamically refined—could be created by integrating high-throughput experimental methods and validated computational algorithms. For instance, protein-protein interactions (pairwise and higher-order) are explicitly provided by multiple databases and algorithms, such as the Search Tool for the Retrieval of Interacting Genes/Proteins (STRING)

38.

Franceschini, A. ∙ Szklarczyk, D. ∙ Frankild, S....

**STRING v9.1: protein-protein interaction networks, with increased coverage and integration**

*Nucleic Acids Res.* 2013; **41**:D808-D815

or Predicting Protein-Protein Interactions (PrePPI),

39.

Zhang, Q.C. ∙ Petrey, D. ∙ Deng, L....

**Structure-based prediction of protein-protein interactions on a genome-wide scale**

*Nature.* 2012; **490**:556-560

respectively; their regulatory counterparts may be provided by the Encyclopedia of DNA Elements (ENCODE)

40.

ENCODE Project Consortium

**An integrated encyclopedia of DNA elements in the human genome**

*Nature.* 2012; **489**:57-74

or the Algorithm for the Reconstruction of Accurate Cellular Networks (ARACNe)

41.

Basso, K. ∙ Margolin, A.A. ∙ Stolovitzky, G....

**Reverse engineering of regulatory networks in human B cells**

*Nat. Genet.* 2005; **37**:382-390

; and even higher-order interactions may be inferred by conditional information-based methods.

34.

Wang, K. ∙ Saito, M. ∙ Bisikirska, B.C....

**Genome-wide identification of post-translational modulators of transcription factor activity in human B cells**

*Nat. Biotechnol.* 2009; **27**:829-839

Existing network-based methods have already proven highly predictive in diverse areas, ranging from stem cell differentiation

42.

Morris, S.A. ∙ Cahan, P. ∙ Li, H....

**Dissecting engineered cell types and enhancing cell fate conversion via CellNet**

*Cell.* 2014; **158**:889-902

and the discovery of molecular determinants of human disease,

43.

Califano, A. ∙ Butte, A.J. ∙ Friend, S....

**Leveraging models of cell regulation and GWAS data in integrative network-based association studies**

*Nat. Genet.* 2012; **44**:841-847

<sup>,</sup>

44.

Califano, A. ∙ Alvarez, M.J.

**The recurrent architecture of tumour initiation, progression and drug sensitivity**

*Nat. Rev. Cancer.* 2017; **17**:116-130

to predicting drug mechanisms of action and synergy.

45.

Bansal, M. ∙ Yang, J. ∙ Karan, C....

**A community computational challenge to predict the activity of pairs of compounds**

*Nat. Biotechnol.* 2014; **32**:1213-1222

<sup>,</sup>

46.

Woo, J.H. ∙ Shimoni, Y. ∙ Yang, W.S....

**Elucidating Compound Mechanism of Action by Network Perturbation Analysis**

*Cell.* 2015; **162**:441-451

Furthermore, network-based predictions for cancer therapy have been extensively validated in both preclinical studies

6.

Ma, J. ∙ Fong, S.H. ∙ Luo, Y....

**Few-shot learning creates predictive models of drug response that translate from high-throughput screens to individual patients**

*Nat. Cancer.* 2021; **2**:233-244

<sup>,</sup>

7.

Mundi, P.S. ∙ Dela Cruz, F.S. ∙ Grunn, A....

**A Transcriptome-Based Precision Oncology Platform for Patient-Therapy Alignment in a Diverse Set of Treatment-Resistant Malignancies**

*Cancer Discov.* 2023; **13**:1386-1407

and clinical trials.<sup>,</sup>

9.

Jamison, J.K. ∙ Zhou, M. ∙ Gelmann, E.P....

**Entinostat in patients with relapsed or refractory abdominal neuroendocrine tumors**

*Oncologist.* 2024; **29**:817-e1213

Consistent with these observations, initial incorporation of graph-based diffusion kernels in Gen-AI models significantly improved performance while reducing data and parameter requirements, especially for “hard” biological questions, such as inferring which gene perturbation would produce a specific transcriptional cell state.

47.

Zhang, M. ∙ Swamy, V. ∙ Cassius, R....

**GREmLN: A Cellular Graph Structure Aware Transcriptomics Foundation Model**

Preprint at *bioRxiv.* 2026;

A possible criticism of implementing a biology-based AI architecture could be its potential failure to generalize. Although this is a fair criticism, it would also apply to other “specialized” Gen-AI systems, such as AlphaFold, which would not generalize to other areas, such as those supported by ChatGPT or Claude. Moreover, biology-specific generalization would still be possible. For instance, while regulatory networks are remarkably distinct in different cell types, this largely results from their different epigenetic architecture. Thus, by including networks representing multiple cell lineages and epigenetic states, a Gen-AI model should be able to learn a generalized network architecture that will effectively represent any cell context of interest.

### The bitter lesson

Our emphasis on incorporating biological priors may appear to contradict a dominant AI perspective, articulated by Rich Sutton as “The Bitter Lesson.”

48.

Sutton, R. (2019). The Bitter Lesson. [http://www.incompleteideas.net/IncIdeas/BitterLesson.html](http://www.incompleteideas.net/IncIdeas/BitterLesson.html).

[Google Scholar](https://scholar.google.com/scholar?q=Sutton%2C+R.+%282019%29.+The+Bitter+Lesson.+http%3A%2F%2Fwww.incompleteideas.net%2FIncIdeas%2FBitterLesson.html.)

This states that general computational methods will ultimately always outperform approaches incorporating human domain knowledge. This observation has led many to conclude that the path forward in biological AI is simply to generate more data and apply larger models. However, several factors distinguish the creation of models that are predictive of cell behavior from other domains where this principle may clearly apply.

First, there is a fundamental data scarcity. Natural language models train on trillions of tokens accumulated over centuries. In contrast, the largest datasets contain measurements representing 10 <sup>10</sup> to 10 <sup>11</sup> tokens. Even the ambitious HIP, profiling 3 to 5 × 10 <sup>5</sup> individuals with 10 <sup>4</sup> to 10 <sup>5</sup> measurements each, or large-scale resources with up to a billion single cells, such as CellxGene,

49.

CZI Cell Science Program ∙ Abdulla, S. ∙ Aevermann, B....

**CZ CELLxGENE Discover: a single-cell data platform for scalable exploration, analysis and modeling of aggregated data**

*Nucleic Acids Res.* 2025; **53**:D886-D900

would still provide approximately a thousand-fold fewer tokens than used to train natural language models. These data-related limitations are further exacerbated by the combinatorial complexity of multi-gene and protein interactions, a challenge that even token-rich datasets may be insufficient to address. Recent work in predicting immune-related diseases demonstrates that the predictive advantage of complex, non-linear models over simpler linear ones only emerges when sample sizes exceed one million individuals.

50.

Dibaeinia, P. ∙ German, C. ∙ Shringarpure, S....

**PRSformer: Disease Prediction from Million-Scale Individual Genotypes**

Preprint at *bioRxiv.* 2025;

Data scarcity is not merely a theoretical issue. Rather, it manifests empirically in the systematic out-of-distribution failures of current single-cell foundation models. Several recent benchmarking studies have shown that models trained on large single-cell RNA sequencing (RNA-seq) atlases—including single-cell Generative Pre-trained Transformer (scGPT), Geneformer, and related architectures—fail to consistently outperform simple linear baselines when evaluated on held-out cell types, perturbation conditions, or tissue contexts not represented in training data.

51.

Ahlmann-Eltze, C. ∙ Huber, W. ∙ Anders, S.

**Deep-learning-based gene perturbation effect prediction does not yet outperform simple linear baselines**

*Nat. Methods.* 2025; **22**:1657-1661

We propose that these failures may not be incidental but rather structural, i.e., arising from the inherent combinatorial complexity of modeling cell behavior.

Second, biological priors encode physical laws, not human knowledge. Sutton’s lesson applies to domains where human “knowledge” often reflects intuitions, heuristics, or cultural conventions that may not generalize. Protein-protein interactions, however, are governed by objective rules arising from thermodynamics, electrostatics, and structural properties. Encoding such objective, physical constraints is not hand-coding but rather restricting hypotheses to physically plausible mechanisms. AlphaFold—arguably the most celebrated AI success in biology—relies precisely on an architecture that incorporates explicit priors about protein geometry, evolution, chemical bond constraints, and physical plausibility,

16.

Jumper, J. ∙ Evans, R. ∙ Pritzel, A....

**Highly accurate protein structure prediction with AlphaFold**

*Nature.* 2021; **596**:583-589

as informed by decades of crystallography.

Finally, the cost of waiting is unacceptable. In game-playing or language modeling, one can afford to wait for data and compute power to scale up to the need. In medicine, every year of delay represents additional clinical trial failures, failed life-saving early diagnoses, preventable adverse events, and denial of effective therapy. If prior knowledge may accelerate progress, even modestly, human benefit would justify the approach.

## Fifteen challenges to shape the future of Gen-AI models in biology

The effective implementation of a new discovery paradigm for cellular and multicellular biology cannot be successful without clearly stating the basic science and translationally relevant challenges that it may help address. In contrast, many Gen-AI models for biology have focused on showcasing superior statistical significance on relatively abstract challenges, often lacking biological rationale or relevance, many of which are already eminently addressable based on experimental assays or computational methods. For instance, an almost mandatory benchmark for manuscript acceptance is the ability to classify cells based on their gene expression profile (e.g., distinguishing CD8+ from CD4+ T cells). This problem is trivial and biologically irrelevant because a variety of surface markers already exist to recapitulate developmental taxonomies and also because task-specific linear regression analysis does essentially as well as the best published Gen-AI algorithms. Significant differences between models often emerge only when benchmarked on tens of thousands of cells, where even minute classification power differences may produce significant *p* values.

52.

Cohen, J.

**The earth is round (p <.05)**

*Am. Psychol.* 1994; **49**:997-1003

Even more importantly, some of the most established metrics may be inherently inappropriate for assessing the value of a methodology in providing novel biological insight. For instance, most of the area under the precision/recall curve (AUC)—a standard metric for comparative performance analysis—is associated with false discovery rates (FDRs) that are too large for experimental design. The only region of the precision/recall curve that is practically useful to a biologist or clinician is that corresponding to an FDR ≤ 5%, making 95% of the AUC curve essentially irrelevant for experimental design. In addition, most published models have been benchmarked using retrospective rather than prospective data. On October 1, 1995, the Washington Post published an article titled “Deciphering the message of life’s assembly,” which hinted that scientists had successfully solved the protein-folding problem based on the correct prediction of six out of seven proteins, whose structure had been previously elucidated.

53.

Brown, D.

**DECIPHERING THE MESSAGE OF LIFE’S ASSEMBLY**

The Washington Post, 1995

[https://www.washingtonpost.com/archive/politics/1995/10/01/deciphering-the-message-of-lifes-assembly/77b12f3e-5652-4f08-af3e-1733b4a0ae6b/](https://www.washingtonpost.com/archive/politics/1995/10/01/deciphering-the-message-of-lifes-assembly/77b12f3e-5652-4f08-af3e-1733b4a0ae6b/)

[Google Scholar](https://scholar.google.com/scholar?q=D.BrownDECIPHERING+THE+MESSAGE+OF+LIFE%E2%80%99S+ASSEMBLY1995The+Washington+Posthttps%3A%2F%2Fwww.washingtonpost.com%2Farchive%2Fpolitics%2F1995%2F10%2F01%2Fdeciphering-the-message-of-lifes-assembly%2F77b12f3e-5652-4f08-af3e-1733b4a0ae6b%2F)

The recent Nobel Prize awarded to Demis Hassabis and John Jumper shows that it only took 40 more years to actually achieve accurate predictions by computational means, as assessed by prospective validation.

16.

Jumper, J. ∙ Evans, R. ∙ Pritzel, A....

**Highly accurate protein structure prediction with AlphaFold**

*Nature.* 2021; **596**:583-589

This suggests that prospective, or at least blind, validation should be the standard in assessing algorithm performance, as demonstrated by community-based challenges such as the Critical Assessment of protein Structure Prediction (CASP)

54.

Moult, J. ∙ Pedersen, J.T. ∙ Judson, R....

**A large-scale experiment to assess protein structure prediction methods**

*Proteins.* 1995; **23**

ii-v

and the Dialog on Reverse Engineering Assessments and Methods (DREAM).

55.

Stolovitzky, G. ∙ Monroe, D. ∙ Califano, A.

**Dialogue on reverse-engineering assessment and methods: the DREAM of high-throughput pathway inference**

*Ann. N. Y. Acad. Sci.* 2007; **1115**:1-22

Taken together, these points suggest that we may need a significant reassessment of biologically relevant Gen-AI performance metrics, including the fact that they should not be limited to other AI-based methods but rather include other relevant computational and experimental approaches.

Focusing the research community efforts on hard biological challenges—i.e., those aimed at addressing critically relevant, unsolved biological and translational questions—will improve Gen-AI value and recognition in biology and foster additional methodological development. We should, however, address the potential criticism that abstract benchmarks still serve essential roles in methods development. We agree. Cell type classification, for instance, provides standardized tasks enabling rapid comparison of architectural choices and training strategies. Our proposal is not to do away with such benchmarks but rather to start introducing additional, harder and more biologically relevant ones. This suggests explicitly labeling challenges as either tier 1 (*relative performance assessment*)—aimed at assessing technical improvements via retrospective benchmarks—or tier 2 (*biological discovery*), requiring prospective experimental validation. However, the fifteen proposed biological challenges for Gen-AI deliberately straddle both categories. Indeed, as appropriate datasets and prospective validation benchmark become available, they will become directly leverageable to assess methodological superiority.

In the spirit of the original 23 problems in mathematics—published by Hilbert at the beginning of the last century,

56.

Hilbert, D.

**Mathematical Problems**

DigiCat, 2022

[Google Scholar](https://scholar.google.com/scholar?q=D.HilbertMathematical+Problems2022DigiCat)

only 9 of which have been conclusively solved and which have motivated additional grand challenges in mathematics, such as the Clay Millennium Prize

57.

Carlson, J. ∙ Jaffe, A. ∙ Wiles, A.

**The Millennium Prize Problems**

American Mathematical Society, Clay Mathematics Institute, 2023

[Google Scholar](https://scholar.google.com/scholar?q=J.CarlsonA.JaffeA.WilesThe+Millennium+Prize+Problems2023American+Mathematical+Society%2C+Clay+Mathematics+Institute)

—we propose that the explicit listing of 15 grand challenges for Gen-AI researchers in both cellular and multicellular biology could establish a rigorous foundation for assessing our community’s progress in this space. This will be especially effective if each challenge is coupled with large-scale datasets for model training and prospective benchmarks or blind datasets to objectively validate method performance. We articulate these challenges at four distinct levels, ranging from molecular interaction and molecular function levels to cell/system function and clinical translation ([Figure 1](#fig1)). To ground these broad goals in actionable tasks, we provide concrete proof-of-concept benchmarking examples and prospective validation designs for each challenge ([Table 1](#tbl1)). Furthermore, we detail explicit metrics for success, current dataset availability, and the non-Gen-AI computational and experimental baselines against which progress should be measured ([Table 2](#tbl2)). These templates mirror the logic of CASP and DREAM challenges and are designed to anchor community-based benchmark efforts.

![](https://www.cell.com/cms/10.1016/j.cell.2026.07.004/asset/60431762-2a23-44da-977b-7a02b3a0ba54/main.assets/gr1_lrg.jpg)

Figure 1 Fifteen Gen-AI biological challenges: From molecular interactions to clinical translation

| Challenge | Description | Potential challenge design | Validation benchmark design |
| --- | --- | --- | --- |
| 1 | Regulatory and signaling interactions | Complex regulatory logic: elucidating the transfer function that allows complex regulatory regions (e.g., a set of >10 super-enhancers) to regulate gene expression, including the formation of TF and cofactor condensates on chromatin | Validation by targeted single and pairwise TF/co-TF silencing, site-directed mutagenesis, chromatin cross-linking, pull-down and mass spectrometry, and complex structure elucidation via cryo-electron microscopy |
| 2 | Epigenetic interactions | Epigenetic logic: elucidating the chromatin architecture that determines the implementation of specific gene expression programs, including chromatin methylation state and histone marks based on genomic sequence and baseline transcriptomic and proteomic profiles | Validation via Cleavage Under Targets and Release Using Nuclease (CUT&RUN) assays for histone marks (acetylation/methylation) and DNA methylation profiling across at least 10 independent cell lineages |
| 3 | Cell-cell interactions | Ligand/receptor determinants of cell state: elucidating the molecular interactions between a ligand-secreting (source) and a receptor-expressing (sink) subpopulation, which determine the transcriptional state of the latter, e.g., identifying cancer-cell-secreted ligands that polarize macrophages toward an M2-like immunosuppressive state | CRISPR-mediated silencing of predicted ligands and/or receptors coupled to rescue assays based on ligand overexpression, as well as by Multiplexed Error-Robust Fluorescence *In* *Situ* Hybridization (MERFISH) or sequential Fluorescence *In* *Situ* Hybridization (seqFISH) spatial tissue co-localization |
| 4 | Synthetic mechanisms | Plasmid design: predicting the optimal/minimal plasmid architecture and genomic insertion loci for both constitutive and inducible promoters that would prevent (1) epigenetic or functional promoter silencing following iPSC differentiation into specific lineages and (2) inducible promoter leakiness before induction | Validation in ≥10 endoderm and mesoderm iPSC-derived lineages to assess (1) pre-induction leakage, (2) epigenetic silencing, and (3) functional integrity using reporter genes encoding different functions (e.g., blue fluorescent protein, TFs, secreted ligand, etc.) |
| 5 | Genome to function | Mutation functionalization:predicting the functional effects of specific *de novo* mutations, e.g., variants of unknown functional significance (VUFSs) in cancer and other human diseases, as identified by genetic profiles | Validation of predicted functional effects for ≥100 mutations/variants in at least three lineage-distinct cellular contexts as gain-of-function, loss-of-function, neomorphic function, or neutral function via reporter gene assays and pull-down/mass spectrometry assays for neomorphic events |
| 6 | Drug mechanism (MoA) | Drug-mediated proteome modulation: elucidating the proteome-wide drug mechanism of action and polypharmacology, including high-affinity, off-target, and indirect effector proteins | High-affinity binding targets confirmed via thermal shift profiling, proximity ligation, and indirect targets, as assessed by western blot assays, across multiple cellular contexts |
| 7 | Genome to phenotype | Minimal organism design: predicting the smallest genome sufficient to implement an independently living organism, with a desired function (e.g., synthesis of a specific enzyme or metabolite), based on multi-omics data from thousands of different micro-organisms | Validation is based on the minimal organism’s ability to survive and replicate while successfully implementing a desired metabolic function, such as enzyme synthesis |
| 8 | Cell state reprogramming | Cell state transition determinants: predicting genetic or pharmacologic perturbations driving cell state transition, e.g., from an exhausted to a non-exhausted effector CD8+ T cell state, based on existing Perturb and Sequencing (Perturb-seq) assays, or multiome baseline profiles, and drug perturbation profiles | Prospective CRISPR screens, both *in vitro* (e.g., Perturb-seq) for state transitions and *in vivo**,* e.g., Chimeric Immune Editing (CHIME) assay, for functional behavior assessment |
| 9 | Logic biocircuit design | Boolean biocircuit design: predicting the minimal noise-tolerant genetic circuitry to implement a specific function, e.g., integrating signals from three distinct chimeric receptors, A, B, and C, according to arbitrary Boolean logic design to generate a reporter signal (e.g., expression of a fluorescent reporter, guide RNA \[gRNA\], or secretion of a specific peptide) following arbitrary ligand combination detection | Performance is assessed by the noise-tolerant output of circuits integrating signals from chimeric receptors, combined with testing for host-graft immune recognition in humanized mice |
| 10 | Co-culture and microenvironment | Co-culture design: predicting the minimum number of cell types and reagents (e.g., nutrients, metabolites, etc.) to be included in an *in vitro* co-culture assay to support the viability of cell types that would otherwise not survive in isolation (e.g., neutrophils or macrophages) | Validation based on prospective, high-throughput implementation of co-culture assays to measure longitudinal (e.g., 6 to 192 h) target cell viability |
| 11 | Biomarker identification | Drug response biomarker: identifying multi-omics biomarkers that predict response to an investigational agent based on multi-omics data, including single-cell and spatial transcriptomic profiles, e.g., reversal of neuroinflammation and cell demise in Amyotrophic Lateral Sclerosis (ALS) motor neurons or drug sensitivity as a function of tumor multi-omics data, including at the single-cell level | Piggyback approach based on funded investigator-initiated clinical trials that support acquisition of relevant correlative data, e.g., RNA-seq profiles (bulk or single cells), proteomics, spatial transcriptomics, pathology-based imaging, etc. (potentially with funding by the public-private consortium); predictions of specific efficacy biomarkers would be made before the trial is closed and assessed prospectively after trial completion; responder identity would not be disclosed, such that the same data could be used in additional prospective validation challenges |
| 12 | Drug toxicity | Multi-organ and systemic toxicity: predicting dosage-dependent toxicity either in a specific organ (e.g., liver, kidney, heart, brain, blood, skin, etc.) or associated with systemic events (e.g., cytokine storm); toxicity would be predicted prospectively, based on pre-treatment multi-omics data, drug perturbation profiles, and drug structure, in each tissue and validated based on phenotype observations (e.g., loss of the gut lining, etc.) | This would follow the same approach as challenge 11 in a preclinical context (mouse or rat); a sufficiently large (as assessed by a power-of-the-study analysis) repertoire of drugs from diversity libraries would be selected and tested *in vivo* across multiple tissues (liver, kidney, skin, gut, and brain) based on a dose-escalation schedule; existing Gen-AI-based models, such as that of Prioleau et al.,  58.  Prioleau, H. ∙ Aryal, S.K. ∙ Blackstone, J.  **Leveraging Large Language Models for Adverse Drug Event Detection: A Comparative Study of Token and Span-Based Named Entity Recognition**  *Pacific Symposium on Biocomputing.* 2026; **31**:205-218  [https://doi.org/10.1142/9789819824755\_0015](https://doi.org/10.1142/9789819824755_0015)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/41758143/)  [Google Scholar](https://scholar.google.com/scholar_lookup?pmid=41758143)  could help leverage this as a tier 1 challenge |
| 13 | Drug efficacy | Cell-state-specific drug sensitivity: predicting cell-specific drug sensitivity based on drug perturbation profiles, drug structure, and multi-omics data from the specific *in vivo* disease models; the study design would mimic previous prospective cancer-specific preclinical studies in Patient-Derived Xenograft (PDX), Genetically Engineered Mouse Model (GEMM), or organoid models—see Mundi et al.  7.  Mundi, P.S. ∙ Dela Cruz, F.S. ∙ Grunn, A....  **A Transcriptome-Based Precision Oncology Platform for Patient-Therapy Alignment in a Diverse Set of Treatment-Resistant Malignancies**  *Cancer Discov.* 2023; **13**:1386-1407  [Crossref](https://doi.org/10.1158/2159-8290.CD-22-1020)  [Scopus (33)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_7_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85159553678)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/37061969/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1158%2F2159-8290.CD-22-1020&pmid=37061969)  , for instance—but could be developed across any disease model | Efficacy predictions prospectively validated in PDX, GEMM, or organoid models, focusing on identifying and experimentally confirming the specific mechanism of response |
| 14 | Organismal responses | Vaccination response prediction: vaccination cohort studies, in which pre-immunization high-dimensional immune profiles are linked to longitudinal antibody and cellular response data, represent the most immediately available benchmark for challenge 14; baseline immune state—including cell subset frequencies, transcriptional signatures, and epigenetic marks—has been shown to predict vaccine response magnitude and durability across influenza and SARS-CoV-2 cohorts, validating the setpoint concept prospectively and establishing a reproducible benchmark design that Gen-AI models should be required to match or exceed; for example, predicting the quantity and quality of antibody and T cell response based on pre-vaccination multi-omics data (transcriptomics, proteomics, immune cell phenotyping, TCR repertoire profiling), e.g., from the Human Immunology Project Consortium (HIPC) data portal capturing diverse published vaccination datasets, as well as specific molecular-level data for the specific vaccine antigen | Predicted vs. experimentally assessed magnitude and quality of antibody and T cell response at 28–70 days post-vaccination would be assessed; predictions would be sealed prior to vaccination; success criteria would include an AUC > 0.80 for distinguishing high vs. low responders, and a Pearson r > 0.70 between predicted and measured antibody titers and T cell responses; when human infection challenge studies are available after vaccination, protection from infection or disease can be used as the efficacy endpoint; this closely follows the benchmarks defined by existing systems immunology studies of vaccination, including the recent immune health metric study (Sparks et al.  59.  Sparks, R. ∙ Rachmaninoff, N. ∙ Lau, W.W....  **A unified metric of human immune health**  *Nat. Med.* 2024; **30**:2461-2472  [Crossref](https://doi.org/10.1038/s41591-024-03092-6)  [Scopus (45)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_59_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85197854794)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/38961223/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41591-024-03092-6&pmid=38961223)  ; Kotliarov et al.  60.  Kotliarov, Y. ∙ Sparks, R. ∙ Martins, A.J....  **Broad immune activation underlies shared set point signatures for vaccine responsiveness in healthy individuals and disease activity in patients with lupus**  *Nat. Med.* 2020; **26**:618-629  [Crossref](https://doi.org/10.1038/s41591-020-0769-8)  [Scopus (146)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_60_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85079792918)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/32094927/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41591-020-0769-8&pmid=32094927)  ; Tsang et al.  61.  Tsang, J.S. ∙ Schwartzberg, P.L. ∙ Kotliarov, Y....  **Global analyses of human immune variation reveal baseline predictors of postvaccination responses**  *Cell.* 2014; **157**:499-513  [Full Text](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_61_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.cell.2014.03.031&cf=fulltext&site=cell-site)  [Full Text (PDF)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_61_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.cell.2014.03.031&cf=pdf&site=cell-site)  [Scopus (387)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_61_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84898653725)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/24725414/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1016%2Fj.cell.2014.03.031&pmid=24725414)  ) |
| 15 | Clinical trial outcome | Responder/non-responder prediction: this would follow the structure of challenge 11; however, rather than assessing a biomarker, the aim would be to predict the fraction of responders vs. non-responders as well as the mechanism of response | Standard metrics, such as Kaplan-Meier curves assessed by log-rank test, Cox proportional hazard ratio, and chi-squared tests in drug vs. placebo control or retrospective cohorts as controls would be leveraged to assess algorithm performance; mechanism validation in model organisms/organoids |

Table 1

Proof-of-concept benchmarking examples for the 15 challenges

This table describes, for each proposed challenge, a possible proof-of-concept test case to validate the relative (tier 1) and absolute (tier 2) performance of Gen-AI algorithms, as well as the structure of potential validation approaches. All challenges straddle both tier 1 and tier 2 tests, as the generation of blind, prospective ground-truth datasets could first be used to assess the ability to produce novel biological discoveries and then to generate comparative metrics for future assessment of performance improvements.

- [Open table in a new tab](https://www.cell.com/action/showFullTableHTML?isHtml=true&tableId=tbl1&pii=S0092-8674%2826%2900802-0)

| # | Challenge | Metrics for success | Data availability | Non-Gen-AI baselines, both experimental and computational |
| --- | --- | --- | --- | --- |
| 1 | Regulatory and signaling interactions | Time-dependent correlation of predicted vs. actual transfer function, based on mean squared error, Pearson r/R <sup>2</sup>, or Hill coefficient/sigmoidal dose-response curve fitting to quantify nonlinear TF input-output relationships; for complex formation on chromatin, false positives and negatives may be assessed using standard AUC metrics derived from CUT&RUN assays, cryo-electron tomography analysis of chromatin condensates, and single-molecule live-cell imaging; cryo-electron microscopy may be appropriate if condensates adopt a non-disordered structure when chromatin bound | Partially available: sequencing data from super-enhancers in cancer, ENCODE database, available CUT&RUN datasets, combinatorial Perturb-seq profiles at the single-cell level | Computational: still largely underdeveloped. Models such as Enformer (Avsec et al.  62.  Avsec, Ž. ∙ Agarwal, V. ∙ Visentin, D....  **Effective gene expression prediction from sequence by integrating long-range interactions**  *Nature Methods.* 2021; **18**:1196-1203  [https://doi.org/10.1038/s41592-021-01252-x](https://doi.org/10.1038/s41592-021-01252-x)  [Scopus (865)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_62_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85116317450)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/34608324/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41592-021-01252-x&pmid=34608324)  ) and EPInformer (Lin et al.  63.  Lin, J. ∙ Li, Z. ∙ Zhao, Y....  **EPInformer: scalable and integrative prediction of gene expression from promoter-enhancer sequences with multimodal epigenomic profiles**  *Nature Communications.* 2026; **17** (1):3975  [https://doi.org/10.1038/s41467-026-70535-8](https://doi.org/10.1038/s41467-026-70535-8)  [Scopus (1)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_63_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-105037794704)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/41832145/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41467-026-70535-8&pmid=41832145)  ) predict gene expression, histone modifications, and TF binding from relatively large input DNA sequence; however, they do not model the actual combinatorial TF input-output logic in a mechanistic sense; ChromBPNet (Pampari et al.  64.  Pampari, A. ∙ Shcherbina, A. ∙ Kvon, E.Z....  **ChromBPNet: bias factorized, base-resolution deep learning models of chromatin accessibility reveal cis-regulatory sequence syntax, transcription factor footprints and regulatory variants**  *bioRxiv.* 2025;  [https://doi.org/10.1101/2024.12.25.630221](https://doi.org/10.1101/2024.12.25.630221)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/39829783/)  [Google Scholar](https://scholar.google.com/scholar_lookup?pmid=39829783)  ) predicts with near-experimental accuracy how the concentration of dosage-sensitive TFs affects chromatin accessibility at individual regulatory elements; MINDy (Wang et al.  34.  Wang, K. ∙ Saito, M. ∙ Bisikirska, B.C....  **Genome-wide identification of post-translational modulators of transcription factor activity in human B cells**  *Nat. Biotechnol.* 2009; **27**:829-839  [Crossref](https://doi.org/10.1038/nbt.1563)  [Scopus (211)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_34_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-70249108504)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/19741643/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fnbt.1563&pmid=19741643)  ) helps dissect three-way TF interactions. Experimental: CUT&TAG assays (Skene and Henikoff  65.  Skene, P.J. ∙ Henikoff, S.  **An efficient targeted nuclease strategy for high-resolution mapping of DNA binding sites**  *eLife.* 2017; **6**, e21856  [https://doi.org/10.7554/eLife.21856](https://doi.org/10.7554/eLife.21856)  [Scopus (886)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_65_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85013174100)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/28893375/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.7554%2FeLife.21856&pmid=28893375)  ) |
| 2 | Epigenetic interactions | Area Under the Receiver Operating Curve (AUROC) of predicted chromatin architecture based on prospective methylation and histone modification profiles, as assessed by CUT&RUN in ≥10 independent lineages | Partially available: ENCODE, Roadmap Epigenomics, 4D Nucleome available; combinatorial histone code perturbation data sparse | Computational: DeepSEA (Zhou et al.  66.  Zhou, J. ∙ Troyanskaya, O.G.  **Predicting effects of noncoding variants with deep learning-based sequence model**  *Nature Methods.* 2015; **12** (10):931-934  [https://doi.org/10.1038/nmeth.3547](https://doi.org/10.1038/nmeth.3547)  [Scopus (1803)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_66_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84958257565)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/26301843/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fnmeth.3547&pmid=26301843)  ); Enformer (Avsec et al.  62.  Avsec, Ž. ∙ Agarwal, V. ∙ Visentin, D....  **Effective gene expression prediction from sequence by integrating long-range interactions**  *Nature Methods.* 2021; **18**:1196-1203  [https://doi.org/10.1038/s41592-021-01252-x](https://doi.org/10.1038/s41592-021-01252-x)  [Scopus (865)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_62_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85116317450)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/34608324/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41592-021-01252-x&pmid=34608324)  ); Sei (Chen et al.  67.  Chen, K.M. ∙ Wong, A.K. ∙ Troyanskaya, O.G....  **A sequence-based global map of regulatory activity for deciphering human genetics**  *Nature Genetics.* 2022; **54** (7):940-949  [https://doi.org/10.1038/s41588-022-01102-2](https://doi.org/10.1038/s41588-022-01102-2)  [Scopus (166)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_67_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85133848044)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/35817977/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41588-022-01102-2&pmid=35817977)  ). Experimental: genome-wide histone modification profiles and targeted CUT&RUN assays (Skene and Henikoff  65.  Skene, P.J. ∙ Henikoff, S.  **An efficient targeted nuclease strategy for high-resolution mapping of DNA binding sites**  *eLife.* 2017; **6**, e21856  [https://doi.org/10.7554/eLife.21856](https://doi.org/10.7554/eLife.21856)  [Scopus (886)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_65_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85013174100)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/28893375/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.7554%2FeLife.21856&pmid=28893375)  ) |
| 3 | Cell-cell interactions | AUROC ≥ 0.85 based on co-culture perturbation assays, combined with spatial co-localization assays (e.g., by MERFISH/seqFISH) in ≥3 tissue contexts | Partially available: CellChat DB, NicheNet prior network, TISCH2 atlas, Visium spatial data available; systematic co-culture perturbation datasets are still largely unavailable | Computational: NicheNet (Browaeys et al.  68.  Browaeys, R. ∙ Saelens, W. ∙ Saeys, Y.  **NicheNet: modeling intercellular communication by linking ligands to target genes**  *Nature Methods.* 2020; **17** (2):159-162  [https://doi.org/10.1038/s41592-019-0667-5](https://doi.org/10.1038/s41592-019-0667-5)  [Scopus (1498)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_68_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85072988420)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/31819264/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41592-019-0667-5&pmid=31819264)  ); CellChat (Jin et al.  69.  Jin, S. ∙ Guerrero-Juarez, C.F. ∙ Zhang, L....  **Inference and analysis of cell-cell communication using CellChat**  *Nature Communications.* 2021; **12** (1):1088  [https://doi.org/10.1038/s41467-021-21246-9](https://doi.org/10.1038/s41467-021-21246-9)  [Scopus (2221)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_69_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85101173884)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/33597522/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41467-021-21246-9&pmid=33597522)  ); COMMOT (Cang et al.  70.  Cang, Z. ∙ Zhao, Y. ∙ Almet, A.A....  **Screening cell-cell communication in spatial transcriptomics via collective optimal transport**  *Nature Methods.* 2023; **20** (2):218-228  [https://doi.org/10.1038/s41592-022-01728-4](https://doi.org/10.1038/s41592-022-01728-4)  [Scopus (329)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_70_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85146721550)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/36690742/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41592-022-01728-4&pmid=36690742)  ); SEARCHIN (Mishra et al.  71.  Mishra, V. ∙ Re, D.B. ∙ Le Verche, V....  **Systematic elucidation of neuron-astrocyte interaction in models of amyotrophic lateral sclerosis using multi-modal integrated bioinformatics workflow**  *Nature Communications.* 2020; **11** (1):5579  [https://doi.org/10.1038/s41467-020-19177-y](https://doi.org/10.1038/s41467-020-19177-y)  [Scopus (39)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_71_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85094965228)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/33149111/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41467-020-19177-y&pmid=33149111)  ); LIANA (Dimitrov et al.  72.  Dimitrov, D. ∙ Türei, D. ∙ Garrido-Rodriguez, M....  **Comparison of methods and resources for cell-cell communication inference from single-cell RNA-Seq data**  *Nature Communications.* 2022; **13** (1):3224  [https://doi.org/10.1038/s41467-022-30755-0](https://doi.org/10.1038/s41467-022-30755-0)  [Scopus (400)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_72_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85131709677)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/35680885/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41467-022-30755-0&pmid=35680885)  ). Experimental: CRISPR ligand/receptor knockout (KO) in co-culture screens |
| 4 | Synthetic mechanisms | Fraction of synthetic circuits that are functional in a target cell on first-pass design, minimal number of iterations to achieve a functional design, as well as minimal design complexity; assessment in ≥5 distinct iPSC-derived lineages | Largely new needed: DNA Typewriter (Choi et al.  73.  Choi, J. ∙ Chen, W. ∙ Minkina, A....  **A time-resolved, multi-symbol molecular recorder via sequential genome editing**  *Nature.* 2022; **608**:98-107  [Crossref](https://doi.org/10.1038/s41586-022-04922-8)  [Scopus (141)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_73_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85133631291)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/35794474/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41586-022-04922-8&pmid=35794474)  ) and AddGene provide partial resources; iPSC-specific inducibility and promoter silencing data are largely absent | Computational: BLADE (Weinberg et al.  74.  Weinberg, B.H. ∙ Pham, N.T.H. ∙ Caraballo, L.D....  **Large-scale design of robust genetic circuits with multiple inputs and outputs for mammalian cells**  *Nature Biotechnology.* 2017; **35** (5):453-462  [https://doi.org/10.1038/nbt.3805](https://doi.org/10.1038/nbt.3805)  [Scopus (214)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_74_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85019107155)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fnbt.3805)  ); Cello (Nielsen et al.  75.  Nielsen, A.A. ∙ Der, B.S. ∙ Shin, J....  **Genetic circuit design automation**  *Science.* 2016; **352** (6281):aac7341  [https://doi.org/10.1126/science.aac7341](https://doi.org/10.1126/science.aac7341)  [Scopus (50)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_75_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84963568291)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/27034378/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1126%2Fscience.aac7341&pmid=27034378)  ); iBioSim (Watanabe et al.  76.  Watanabe, L. ∙ Nguyen, T. ∙ Zhang, M....  **iBioSim 3: A Tool for Model-Based Genetic Circuit Design**  *ACS Synthetic Biology.* 2019; **8** (7):1560-1563  [https://doi.org/10.1021/acssynbio.8b00078](https://doi.org/10.1021/acssynbio.8b00078)  [Scopus (65)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_76_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85049190799)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/29944839/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1021%2Facssynbio.8b00078&pmid=29944839)  ). Experimental: DNA Typewriter (Choi et al.  73.  Choi, J. ∙ Chen, W. ∙ Minkina, A....  **A time-resolved, multi-symbol molecular recorder via sequential genome editing**  *Nature.* 2022; **608**:98-107  [Crossref](https://doi.org/10.1038/s41586-022-04922-8)  [Scopus (141)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_73_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85133631291)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/35794474/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41586-022-04922-8&pmid=35794474)  ) as design benchmark |
| 5 | Genome to function | Pathogenicity prediction using the MCC metric on ClinVar held-out variants; deep mutational scanning: correlation r ≥ 0.80 across ProteinGym benchmarks; prospective assessment: e.g., loss- or gain-of-function discrimination in a cancer and immune cell context | Partially available: ClinVar, gnomAD, ProteinGym (Notin et al.  77.  Notin, P. ∙ Kollasch, A.W. ∙ Ritter, D....  **ProteinGym: Large-Scale Benchmarks for Protein Design and Fitness Prediction**  *bioRxiv.* 2023;  [https://doi.org/10.1101/2023.12.07.570727](https://doi.org/10.1101/2023.12.07.570727)  [Google Scholar](https://scholar.google.com/scholar?q=P.NotinA.W.KollaschD.RitterL.van+NiekerkS.PaulH.SpinnerN.RollinsA.ShawR.WeitzmanJ.FrazerProteinGym%3A+Large-Scale+Benchmarks+for+Protein+Design+and+Fitness+PredictionbioRxiv2023https%3A%2F%2Fdoi.org%2F10.1101%2F2023.12.07.570727)  ), DMS datasets, immune-cell-context saturation mutagenesis | Computational: CADD (Kircher et al.  78.  Kircher, M. ∙ Witten, D.M. ∙ Jain, P....  **A general framework for estimating the relative pathogenicity of human genetic variants**  *Nature Genetics.* 2014; **46** (3):310-315  [https://doi.org/10.1038/ng.2892](https://doi.org/10.1038/ng.2892)  [Scopus (5053)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_78_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84895858942)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/24487276/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fng.2892&pmid=24487276)  ); EVE (Frazer et al.  79.  Frazer, J. ∙ Notin, P. ∙ Dias, M....  **Disease variant prediction with deep generative models of evolutionary data**  *Nature.* 2021; **599** (7883):91-95  [https://doi.org/10.1038/s41586-021-04043-8](https://doi.org/10.1038/s41586-021-04043-8)  [Scopus (265)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_79_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85117959945)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/34707284/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41586-021-04043-8&pmid=34707284)  ); ESM1v (Meier et al.  80.  Meier, J. ∙ Rao, R. ∙ Verkuil, R....  **Language models enable zero-shot prediction of the effects of mutations on protein function**  *Advances in Neural Information Processing Systems.* 2021; **34**  [Crossref](https://doi.org/10.5555/3540261.3542504)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.5555%2F3540261.3542504)  ); PHNToM (Tagore et al.  81.  Tagore, S. ∙ Tsang, S. ∙ Tangermann, C....  **Pan-cancer inference and validation of hypermorphic, hypomorphic and neomorphic mutations**  *Nature Genetics.* 2026; **58** (2):329-340  [https://doi.org/10.1038/s41588-025-02482-x](https://doi.org/10.1038/s41588-025-02482-x)  [Scopus (0)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_81_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-105029986379)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/41673304/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41588-025-02482-x&pmid=41673304)  ); AlphaMissense (Cheng et al.  82.  Cheng, J. ∙ Novati, G. ∙ Pan, J....  **Accurate proteome-wide missense variant effect prediction with AlphaMissense**  *Science.* 2023; **381** (6664):eadg7492  [https://doi.org/10.1126/science.adg7492](https://doi.org/10.1126/science.adg7492)  [Scopus (582)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_82_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85171957321)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/37733863/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1126%2Fscience.adg7492&pmid=37733863)  ). Experimental: targeted mutation knockin and genome-wide saturation mutagenesis screens |
| 6 | Drug mechanism (MoA) | Validation by prospective MOA determination in ≥3 independent cell lines, e.g., by thermal shift, mass spectrometry, or systematic western blot assays, with standard metrics for false-positive or false-negative assessment | Partially available: CMAP/L1000, PRISM, DepMap, NCI60, PanACEA datasets are available | Computational: VIPER/OncoTreat (Alvarez et al.  83.  Alvarez, M.J. ∙ Shen, Y. ∙ Giorgi, F.M....  **Functional characterization of somatic mutations in cancer using network-based inference of protein activity**  *Nature Genetics.* 2016; **48**:838-847  [https://doi.org/10.1038/ng.3593](https://doi.org/10.1038/ng.3593)  [Scopus (675)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_83_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84975246805)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/27322546/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fng.3593&pmid=27322546)  ; Mundi et al.  7.  Mundi, P.S. ∙ Dela Cruz, F.S. ∙ Grunn, A....  **A Transcriptome-Based Precision Oncology Platform for Patient-Therapy Alignment in a Diverse Set of Treatment-Resistant Malignancies**  *Cancer Discov.* 2023; **13**:1386-1407  [Crossref](https://doi.org/10.1158/2159-8290.CD-22-1020)  [Scopus (33)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_7_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85159553678)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/37061969/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1158%2F2159-8290.CD-22-1020&pmid=37061969)  ); L1000 CDS <sup>2</sup> (Duan et al.  84.  Duan, Q. ∙ Reid, S.P. ∙ Clark, N.R....  **L1000CDS <sup>2</sup>: LINCS L1000 characteristic direction signatures search engine**  *NPJ Systems Biology and Applications.* 2016; **2**:16015  [https://doi.org/10.1038/npjsba.2016.15](https://doi.org/10.1038/npjsba.2016.15)  [Scopus (295)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_84_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85020403526)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/28413689/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fnpjsba.2016.15&pmid=28413689)  ); PanACEA (Hu et al.  85.  Hu, L.Z. ∙ Hirschhorn, T. ∙ Douglass, E....  **Elucidating Compound Mechanism of Action and Polypharmacology with a Large-scale Perturbational Profile Compendium**  Preprint at *bioRxiv.* 2025;  [Crossref](https://doi.org/10.1101/2023.10.08.561457)  [Scopus (0)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_85_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85200424315)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1101%2F2023.10.08.561457)  ). Experimental: high-throughput drug-target affinity assays (Klaeger et al.  86.  Klaeger, S. ∙ Heinzlmeir, S. ∙ Wilhelm, M....  **The target landscape of clinical kinase drugs**  *Science.* 2017; **358** (6367):eaan4368  [https://doi.org/10.1126/science.aan4368](https://doi.org/10.1126/science.aan4368)  [Scopus (680)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_86_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85036597195)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/29191878/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1126%2Fscience.aan4368&pmid=29191878)  ); mass spectrometry (Reinecke et al.  87.  Reinecke, M. ∙ Brear, P. ∙ Vornholz, L....  **Chemical proteomics reveals the target landscape of 1,000 kinase inhibitors**  *Nature Chemical Biology.* 2024; **20** (5):577-585  [https://doi.org/10.1038/s41589-023-01459-3](https://doi.org/10.1038/s41589-023-01459-3)  [Scopus (61)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_87_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85175266077)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/37904048/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41589-023-01459-3&pmid=37904048)  ); thermal shift profiling (Savitski et al.  88.  Savitski, M.M. ∙ Reinhard, F.B. ∙ Franken, H....  **Tracking cancer drugs in living cells by thermal profiling of the proteome**  *Science.* 2014; **346** (6205):1255784  [https://doi.org/10.1126/science.1255784](https://doi.org/10.1126/science.1255784)  [Scopus (983)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_88_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84907485591)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/25278616/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1126%2Fscience.1255784&pmid=25278616)  ) |
| 7 | Genome to phenotype | Predicted essential gene set overlap with JCVI-syn3A ≥ 90% (Hutchison et al.  89.  Hutchison, 3rd, C.A. ∙ Chuang, R.Y. ∙ Noskov, V.N....  **Design and synthesis of a minimal bacterial genome**  *Science.* 2016; **351** (6280):aad6253  [https://doi.org/10.1126/science.aad6253](https://doi.org/10.1126/science.aad6253)  [Scopus (1169)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_89_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84962227074)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/27013737/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1126%2Fscience.aad6253&pmid=27013737)  ) showing minimal organism survival in a defined medium; fitness score prediction r ≥ 0.75 on held-out gene KOs. Prediction of gene knockin/KO function in model organisms, based on standard functional validation assays | Largely new needed: JCVI-syn3A as ground truth; multi-organism multi-omics available, e.g., see Kyoto Encyclopedia of Genes and Genomes (KEGG) and Biochemical Genetic and Genomic (BiGG). D *e novo* synthesis perturbation datasets largely absent. Datasets representing large-scale gene knockin/KO datasets with phenotype assessment in multiple organisms are largely missing | Computational: EPath (Kong et al.  90.  Kong, X. ∙ Zhu, B. ∙ Stone, V.N....  **ePath: an online database towards comprehensive essential gene annotation for prokaryotes**  *Scientific Reports.* 2019; **9** (1):12949  [https://doi.org/10.1038/s41598-019-49098-w](https://doi.org/10.1038/s41598-019-49098-w)  [Scopus (10)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_90_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85072032545)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/31506471/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41598-019-49098-w&pmid=31506471)  ); DeepHE (Zhang et al.  91.  Zhang, X. ∙ Xiao, W. ∙ Xiao, W.  **DeepHE: Accurately predicting human essential genes based on deep learning**  *PLoS Computational Biology.* 2020; **16** (9), e1008229  [https://doi.org/10.1371/journal.pcbi.1008229](https://doi.org/10.1371/journal.pcbi.1008229)  [Scopus (52)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_91_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85092120019)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1371%2Fjournal.pcbi.1008229)  ). Experimental: JCVI rational minimal genome design (Hutchison et al.  89.  Hutchison, 3rd, C.A. ∙ Chuang, R.Y. ∙ Noskov, V.N....  **Design and synthesis of a minimal bacterial genome**  *Science.* 2016; **351** (6280):aad6253  [https://doi.org/10.1126/science.aad6253](https://doi.org/10.1126/science.aad6253)  [Scopus (1169)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_89_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84962227074)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/27013737/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1126%2Fscience.aad6253&pmid=27013737)  ); genome-wide CRISPR essential gene screens (Hart et al.  92.  Hart, T. ∙ Chandrashekhar, M. ∙ Aregger, M....  **High-Resolution CRISPR Screens Reveal Fitness Genes and Genotype-Specific Cancer Liabilities**  *Cell.* 2015; **163** (6):1515-1526  [https://doi.org/10.1016/j.cell.2015.11.015](https://doi.org/10.1016/j.cell.2015.11.015)  [Full Text](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_92_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.cell.2015.11.015&cf=fulltext&site=cell-site)  [Full Text (PDF)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_92_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.cell.2015.11.015&cf=pdf&site=cell-site)  [Scopus (1201)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_92_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84949233942)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/26627737/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1016%2Fj.cell.2015.11.015&pmid=26627737)  ); KEGG essentiality predictions |
| 8 | Cell state reprogramming | Reprogramming accuracy: fraction of targeted cell fate transitions validated *in vitro* by both phenotypic assays (e.g., morphology) and molecular assays (e.g., Perturb-seq, flow cytometry), using standard false-positive/false-negative prediction metrics, e.g., Pearson r ≥ 0.8 | Partially available: LARRY fate atlas (Weinreb et al.  93.  Weinreb, C. ∙ Rodriguez-Fraticelli, A. ∙ Camargo, F.D....  **Lineage tracing on transcriptional landscapes links state to fate during differentiation**  *Science.* 2020; **367** (6479):eaaw3381  [https://doi.org/10.1126/science.aaw3381](https://doi.org/10.1126/science.aaw3381)  [Scopus (341)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_93_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85079353905)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/31974159/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1126%2Fscience.aaw3381&pmid=31974159)  ), RECON dataset, Mogrify predictions partially available; targeted Perturb-seq data in primary cells contexts are largely absent | Computational: VIPER (Calvo Fernández et al.  94.  Calvo Fernández, E. ∙ Tomassoni, L. ∙ Zhang, X....  **Systematic design of combination therapy by targeting master regulators of coexisting diffuse midline glioma cell states**  *Nat Genet.* 2026; **58** (5):1112-1125  [Crossref](https://doi.org/10.1038/s41588-026-02550-w)  [Scopus (2)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_94_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-105036712624)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/42020604/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41588-026-02550-w&pmid=42020604)  ; Arumugam et al.  95.  Arumugam, K. ∙ Shin, W. ∙ Schiavone, V....  **The Master Regulator Protein BAZ2B Can Reprogram Human Hematopoietic Lineage-Committed Progenitors into a Multipotent State**  *Cell Rep.* 2020; **33**, 108474  [Full Text](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_95_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.celrep.2020.108474&cf=fulltext&site=cell-site)  [Full Text (PDF)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_95_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.celrep.2020.108474&cf=pdf&site=cell-site)  [Scopus (28)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_95_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85097481047)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/33296649/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1016%2Fj.celrep.2020.108474&pmid=33296649)  ); Mogrify (Rackham et al.  96.  Rackham, O.J. ∙ Firas, J. ∙ Fang, H....  **A predictive computational framework for direct reprogramming between human cell types**  *Nature Genetics.* 2016; **48** (3):331-335  [https://doi.org/10.1038/ng.3487](https://doi.org/10.1038/ng.3487)  [Scopus (227)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_96_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84959344588)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/26780608/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fng.3487&pmid=26780608)  ); CellNet (Morris et al.  42.  Morris, S.A. ∙ Cahan, P. ∙ Li, H....  **Dissecting engineered cell types and enhancing cell fate conversion via CellNet**  *Cell.* 2014; **158**:889-902  [Full Text](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_42_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.cell.2014.07.021&cf=fulltext&site=cell-site)  [Full Text (PDF)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_42_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.cell.2014.07.021&cf=pdf&site=cell-site)  [Scopus (222)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_42_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84908431507)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/25126792/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1016%2Fj.cell.2014.07.021&pmid=25126792)  ); PRESCIENT (Yeo et al.  97.  Yeo, G.H.T. ∙ Saksena, S.D. ∙ Gifford, D.K.  **Generative modeling of single-cell time series with PRESCIENT enables prediction of cell trajectories with interventions**  *Nature Communications.* 2021; **12** (1):3222  [https://doi.org/10.1038/s41467-021-23518-w](https://doi.org/10.1038/s41467-021-23518-w)  [Scopus (71)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_97_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85107017134)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/34050150/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41467-021-23518-w&pmid=34050150)  ). Experimental: genome-wide CRISPR fate screens; Perturb-seq datasets (Replogle et al.  98.  Replogle, J.M. ∙ Saunders, R.A. ∙ Pogson, A.N....  **Mapping information-rich genotype-phenotype landscapes with genome-scale Perturb-seq**  *Cell.* 2022; **185** (14):2559-2575.e28  [https://doi.org/10.1016/j.cell.2022.05.013](https://doi.org/10.1016/j.cell.2022.05.013)  [Full Text](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_98_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.cell.2022.05.013&cf=fulltext&site=cell-site)  [Full Text (PDF)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_98_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.cell.2022.05.013&cf=pdf&site=cell-site)  [Scopus (0)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_98_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85132828588)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/35688146/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1016%2Fj.cell.2022.05.013&pmid=35688146)  ); LARRY (Weinreb et al.  93.  Weinreb, C. ∙ Rodriguez-Fraticelli, A. ∙ Camargo, F.D....  **Lineage tracing on transcriptional landscapes links state to fate during differentiation**  *Science.* 2020; **367** (6479):eaaw3381  [https://doi.org/10.1126/science.aaw3381](https://doi.org/10.1126/science.aaw3381)  [Scopus (341)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_93_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85079353905)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/31974159/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1126%2Fscience.aaw3381&pmid=31974159)  ) |
| 9 | Logic biocircuit design | Circuit fidelity and noise-tolerance score in target iPSC-derived cells; minimal gene-part count for robust AND/NOT logic implementation; experimental assessment of immune recognition in a humanized mouse model | Largely new needed: systematic logic-gate perturbation screens in iPSC-derived cells as well as large-scale data on biological circuit design are largely absent; the SynBioHub parts registry is a possible source | Computational: Boolean network modeling; OptCircuit (Dasika and Maranas  99.  Dasika, M.S. ∙ Maranas, C.D.  **OptCircuit: An optimization based method for computational design of genetic circuits**  *BMC Systems Biology.* 2008; **2**  [https://doi.org/10.1186/1752-0509-2-24](https://doi.org/10.1186/1752-0509-2-24)  [Scopus (82)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_99_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-42549159572)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/18315885/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1186%2F1752-0509-2-24&pmid=18315885)  ). Experimental: requires ad hoc implementation of bio-logic design, e.g., via SynNotch or transcriptional logic (Morsut et al.  100.  Morsut, L. ∙ Roybal, K.T. ∙ Xiong, X....  **Engineering Customized Cell Sensing and Response Behaviors Using Synthetic Notch Receptors**  *Cell.* 2016; **164** (4):780-791  [https://doi.org/10.1016/j.cell.2016.01.012](https://doi.org/10.1016/j.cell.2016.01.012)  [Full Text](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_100_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.cell.2016.01.012&cf=fulltext&site=cell-site)  [Full Text (PDF)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_100_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.cell.2016.01.012&cf=pdf&site=cell-site)  [Scopus (628)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_100_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84958230998)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/26830878/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1016%2Fj.cell.2016.01.012&pmid=26830878)  ) |
| 10 | Co-culture and microenvironment | Viability assays in co-culture assays to determine (1) survival extension over baseline under previously published optimal culture conditions and (2) complexity of microenvironment and reagent composition (e.g., optimal cytokine/nutrients cocktail) | Partially available: published culture conditions for cell lines, organoids, and acute slice tissue; however, this literature is very sparse and would require some effort to be compiled into a useful resource | Computational: algorithmic media optimization (Zhou et al.  101.  Zhou, T. ∙ Reji, R. ∙ Kairon, R.S....  **A review of algorithmic approaches for cell culture media optimization**  *Frontiers in Bioengineering and Biotechnology.* 2023; **11**:1195294  [https://doi.org/10.3389/fbioe.2023.1195294](https://doi.org/10.3389/fbioe.2023.1195294)  [Scopus (52)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_101_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85159964535)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/37251567/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.3389%2Ffbioe.2023.1195294&pmid=37251567)  ). Experimental: high throughput cell culture optimization (Ryoo et al.  102.  Ryoo, H. ∙ Kimmel, H. ∙ Rondo, E....  **Advances in high throughput cell culture technologies for therapeutic screening and biological discovery applications**  *Bioengineering & Translational Medicine.* 2023; **9** (3), e10627  [https://doi.org/10.1002/btm2.10627](https://doi.org/10.1002/btm2.10627)  [Scopus (50)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_102_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85178404170)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/38818120/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1002%2Fbtm2.10627&pmid=38818120)  ); droplet-based microfluidics (Tiemeijer et al.  103.  Tiemeijer, B.M. ∙ Sweep, M.W.D. ∙ Sleeboom, J.J.F....  **Probing Single-Cell Macrophage Polarization and Heterogeneity Using Thermo-Reversible Hydrogels in Droplet-Based Microfluidics**  *Frontiers in Bioengineering and Biotechnology.* 2021; **9**:715408  [https://doi.org/10.3389/fbioe.2021.715408](https://doi.org/10.3389/fbioe.2021.715408)  [Scopus (25)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_103_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85118289899)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/34722475/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.3389%2Ffbioe.2021.715408&pmid=34722475)  ) |
| 11 | Biomarker identification | Clinical AUC ≥ 0.90 in blinded prospective cohort; biomarker panel ≤ 20 features; validated in ≥ 2 independent cohorts across different demographic groups; additional metrics may include Kaplan-Meier curves assessed by log-rank test, Cox proportional hazard ratio, and chi-squared tests | Partially available: TCGA, UK Biobank, cell-free DNA (cfDNA) atlases partially available; longitudinal multi-modal immune biomarker cohorts sparse | Computational: CancerSEEK (Cohen et al.  104.  Cohen, J.D. ∙ Li, L. ∙ Wang, Y....  **Detection and localization of surgically resectable cancers with a multi-analyte blood test**  *Science.* 2018; **359** (6378):926-930  [https://doi.org/10.1126/science.aar3247](https://doi.org/10.1126/science.aar3247)  [Scopus (2478)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_104_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85040865768)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/29348365/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1126%2Fscience.aar3247&pmid=29348365)  ); Protein Atlas Panel Classifiers (Uhlen et al.  105.  Uhlen, M. ∙ Zhang, C. ∙ Lee, S....  **A pathology atlas of the human cancer transcriptome**  *Science.* 2017; **357** (6352):eaan2507  [https://doi.org/10.1126/science.aan2507](https://doi.org/10.1126/science.aan2507)  [Scopus (2246)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_105_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85028362951)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/28818916/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1126%2Fscience.aan2507&pmid=28818916)  ). Experimental: prospective clinical trials or large-scale preclinical tests |
| 12 | Drug toxicity | Prediction of grade ≥ 3 adverse events (e.g., cytokine storm, Stevens-Johnson, etc.) with sensitivity ≥ 80% at 90% specificity; possible use of held-out trial cohort via an honest broker mechanism; standard quantitative metrics tests, including AUROC, F1, and chi-squared | Largely new needed: FAERS adverse event reports partially useful; trial-level molecular safety data largely unavailable or proprietary; prospective biobanking rare; preclinical data are available from NCI Multi-Species Acute Toxicity Database (Jain et al.  106.  Jain, S. ∙ Siramshetty, V.B. ∙ Alves, V.M....  **Large-Scale Modeling of Multispecies Acute Toxicity End Points Using Consensus of Multitask Deep Learning Methods**  *Journal of Chemical Information and Modeling.* 2021; **61** (2):653-663  [https://doi.org/10.1021/acs.jcim.0c01164](https://doi.org/10.1021/acs.jcim.0c01164)  [Scopus (87)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_106_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85101906501)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/33533614/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1021%2Facs.jcim.0c01164&pmid=33533614)  ) and ToxRefDB (Feshuk et al.  107.  Feshuk, M. ∙ Kolaczkowski, L. ∙ Watford, S....  **ToxRefDB v2.1: update to curated *in vivo* study data in the Toxicity Reference Database**  *Frontiers in Toxicology.* 2023; **5**:1260305  [https://doi.org/10.3389/ftox.2023.1260305](https://doi.org/10.3389/ftox.2023.1260305)  [Scopus (30)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_107_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85172007100)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/37753522/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.3389%2Fftox.2023.1260305&pmid=37753522)  ), among others | Computational: DILIrank liver toxicity benchmark (Chen et al.  108.  Chen, M. ∙ Suzuki, A. ∙ Thakkar, S....  **DILIrank: the largest reference drug list ranked by the risk for developing drug-induced liver injury in humans**  *Drug Discovery Today.* 2016; **21** (4):648-653  [https://doi.org/10.1016/j.drudis.2016.02.015](https://doi.org/10.1016/j.drudis.2016.02.015)  [Scopus (354)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_108_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84960323993)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/26948801/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1016%2Fj.drudis.2016.02.015&pmid=26948801)  ); ToxCast (EPA); DILIsym (Watkins  109.  Watkins, P.B.  **The DILI-sim Initiative: Insights into Hepatotoxicity Mechanisms and Biomarker Interpretation**  *Clinical and Translational Science.* 2019; **12** (2):122-129  [https://doi.org/10.1111/cts.12629](https://doi.org/10.1111/cts.12629)  [Scopus (63)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_109_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85063634196)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/30762301/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1111%2Fcts.12629&pmid=30762301)  ); ProTox-3.0 (Banerjee et al.  110.  Banerjee, P. ∙ Kemmler, E. ∙ Dunkel, M....  **ProTox 3.0: a webserver for the prediction of toxicity of chemicals**  *Nucleic Acids Research.* 2024; **52** (W1):W513-W520  [https://doi.org/10.1093/nar/gkae303](https://doi.org/10.1093/nar/gkae303)  [Scopus (1218)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_110_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85194357074)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/38647086/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1093%2Fnar%2Fgkae303&pmid=38647086)  ). Experimental: immune response screens in humanized mouse models; standard preclinical regulatory toxicology studies based on the Organisation for Economic Co-operation and Development (OECD) guidelines; humanized mouse immune response models |
| 13 | Drug efficacy | Disease control rate (DCR), as assessed prospectively in the treatment arms of preclinical and clinical studies vs. negative control arms; metrics would be based on receiver operating curves, Kaplan-Meier curves assessed by log-rank test, Cox proportional hazards ratio, and chi-squared tests; associated drug mechanism-of-action prediction would be validated as discussed in challenge 6 | Largely new needed: Beat Acute Myeloid Leukemia (BEAT-AML), Cancer Dependency Map (DepMap), PDX pharmacogenomics available, N of 1 study are available for retrospective studies. However, prospective data needs to be generated ad hoc or held out by a trusted third party (e.g., DREAM conference). | Computational: OncoTreat/OncoTarget in N of 1 study (Mundi et al.  7.  Mundi, P.S. ∙ Dela Cruz, F.S. ∙ Grunn, A....  **A Transcriptome-Based Precision Oncology Platform for Patient-Therapy Alignment in a Diverse Set of Treatment-Resistant Malignancies**  *Cancer Discov.* 2023; **13**:1386-1407  [Crossref](https://doi.org/10.1158/2159-8290.CD-22-1020)  [Scopus (33)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_7_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85159553678)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/37061969/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1158%2F2159-8290.CD-22-1020&pmid=37061969)  ); few shot learning (Ma et al.  6.  Ma, J. ∙ Fong, S.H. ∙ Luo, Y....  **Few-shot learning creates predictive models of drug response that translate from high-throughput screens to individual patients**  *Nat. Cancer.* 2021; **2**:233-244  [Crossref](https://doi.org/10.1038/s43018-020-00169-2)  [Scopus (159)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_6_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85099938332)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/34223192/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs43018-020-00169-2&pmid=34223192)  ); genomics of drug sensitivity in cancer (Yang et al.  111.  Yang, W. ∙ Soares, J. ∙ Greninger, P....  **Genomics of Drug Sensitivity in Cancer (GDSC): a resource for therapeutic biomarker discovery in cancer cells**  *Nucleic Acids Research.* 2013; **41**:D955-D961  [https://doi.org/10.1093/nar/gks1111](https://doi.org/10.1093/nar/gks1111)  [Scopus (3331)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_111_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84876563391)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/23180760/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1093%2Fnar%2Fgks1111&pmid=23180760)  ). Experimental: CRISPR drug-resistance screens (Shalem et al.  112.  Shalem, O. ∙ Sanjana, N.E. ∙ Hartenian, E....  **Genome-scale CRISPR-Cas9 knockout screening in human cells**  *Science.* 2014; **343** (6166):84-87  [https://doi.org/10.1126/science.1247005](https://doi.org/10.1126/science.1247005)  [Scopus (3742)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_112_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84892765883)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/24336571/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1126%2Fscience.1247005&pmid=24336571)  ); PDX cohort benchmarks (Gao et al.  113.  Gao, H. ∙ Korn, J.M. ∙ Ferretti, S....  **High-throughput screening using patient-derived tumor xenografts to predict clinical trial drug response**  *Nature Medicine.* 2015; **21** (11):1318-1325  [https://doi.org/10.1038/nm.3954](https://doi.org/10.1038/nm.3954)  [Scopus (1157)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_113_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84946209341)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/26479923/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fnm.3954&pmid=26479923)  ) |
| 14 | Organismal responses | Vaccination response prediction r ≥ 0.70 in diverse prospective cohort; immune health metric to assess disease susceptibility; mostly retrospective validation from large Electronic Health Record (EHR) databases or prospectively, based on held-out data from vaccination data resources in the Human Immune Project Consortium (HIPC) data portal; note that the current state of the art for immune response prediction without Gen-AI involves targeted ML approaches—such as linear regression, Least Absolute Shrinkage and Selection Operator (LASSO), or random forest models trained on high-dimensional profiling data—predicting post-vaccination antibody titers at day 28; this should be the minimum performance bar that any Gen-AI model must exceed to claim biological discovery value in this challenge | Partially available: examples include the HIPC Immune Signatures Data Resource (Diray-Arce et al.  114.  Diray-Arce, J. ∙ Miller, H.E.R. ∙ Henrich, E....  **The Immune Signatures data resource, a compendium of systems vaccinology datasets**  *Sci Data.* 2022; **9** (1):635  [Crossref](https://doi.org/10.1038/s41597-022-01714-7)  [Scopus (26)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_114_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85140214296)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/36266291/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41597-022-01714-7&pmid=36266291)  ); globally diverse, longitudinal immune challenge data with molecular readout are largely unavailable. but that is the key mission of the HIP | Computational: immune health metric (Sparks et al.  59.  Sparks, R. ∙ Rachmaninoff, N. ∙ Lau, W.W....  **A unified metric of human immune health**  *Nat. Med.* 2024; **30**:2461-2472  [Crossref](https://doi.org/10.1038/s41591-024-03092-6)  [Scopus (45)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_59_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85197854794)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/38961223/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41591-024-03092-6&pmid=38961223)  , Lei and Tsang  30.  Lei, Y. ∙ Tsang, J.S.  **Systems Human Immunology and AI: Immune Setpoint and Immune Health**  *Annu. Rev. Immunol.* 2025; **43**:693-722  [Crossref](https://doi.org/10.1146/annurev-immunol-090122-042631)  [Scopus (18)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_30_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-105004080202)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/40279304/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1146%2Fannurev-immunol-090122-042631&pmid=40279304)  ); PRSFormer (Dibaeinia et al.  50.  Dibaeinia, P. ∙ German, C. ∙ Shringarpure, S....  **PRSformer: Disease Prediction from Million-Scale Individual Genotypes**  Preprint at *bioRxiv.* 2025;  [Crossref](https://doi.org/10.1101/2025.10.26.684578)  [Scopus (0)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_50_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-105024333545)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1101%2F2025.10.26.684578)  ); LDpred2 (Privé et al.  115.  Privé, F. ∙ Aschard, H. ∙ Carmi, S....  **Portability of 245 polygenic scores when derived from the UK Biobank and applied to 9 ancestry groups from the same cohort**  *American Journal of Human Genetics.* 2022; **109**:12-23  [https://doi.org/10.1016/j.ajhg.2021.11.008](https://doi.org/10.1016/j.ajhg.2021.11.008)  [Full Text](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_115_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.ajhg.2021.11.008&cf=fulltext&site=cell-site)  [Full Text (PDF)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_115_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.ajhg.2021.11.008&cf=pdf&site=cell-site)  [Scopus (0)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_115_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85122002030)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/34995502/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1016%2Fj.ajhg.2021.11.008&pmid=34995502)  ); systems vaccinology classifiers based on response profiles (Querec et al.  116.  Querec, T.D. ∙ Akondy, R.S. ∙ Lee, E.K....  **Systems biology approach predicts immunogenicity of the yellow fever vaccine in humans**  *Nature Immunology.* 2009; **10** (1):116-125  [https://doi.org/10.1038/ni.1688](https://doi.org/10.1038/ni.1688)  [Scopus (1006)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_116_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-57849085182)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/19029902/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fni.1688&pmid=19029902)  ; Hagan et al.  117.  Hagan, T. ∙ Gerritsen, B. ∙ Tomalin, L.E....  **Transcriptional atlas of the human immune response to 13 vaccines reveals a common predictor of vaccine-induced antibody responses**  *Nature Immunology.* 2022; **23** (12):1788-1798  [https://doi.org/10.1038/s41590-022-01328-6](https://doi.org/10.1038/s41590-022-01328-6)  [Scopus (108)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_117_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85141100284)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/36316475/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41590-022-01328-6&pmid=36316475)  ); systems immunology baseline setpoint predictors of vaccine responses (Tsang et al.  61.  Tsang, J.S. ∙ Schwartzberg, P.L. ∙ Kotliarov, Y....  **Global analyses of human immune variation reveal baseline predictors of postvaccination responses**  *Cell.* 2014; **157**:499-513  [Full Text](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_61_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.cell.2014.03.031&cf=fulltext&site=cell-site)  [Full Text (PDF)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_61_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.cell.2014.03.031&cf=pdf&site=cell-site)  [Scopus (387)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_61_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84898653725)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/24725414/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1016%2Fj.cell.2014.03.031&pmid=24725414)  ; Kotliarov et al.  60.  Kotliarov, Y. ∙ Sparks, R. ∙ Martins, A.J....  **Broad immune activation underlies shared set point signatures for vaccine responsiveness in healthy individuals and disease activity in patients with lupus**  *Nat. Med.* 2020; **26**:618-629  [Crossref](https://doi.org/10.1038/s41591-020-0769-8)  [Scopus (146)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_60_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85079792918)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/32094927/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41591-020-0769-8&pmid=32094927)  ; Fourati et al.  118.  Fourati, S. ∙ Tomalin, L.E. ∙ Mulè, M.P....  **Pan-vaccine analysis reveals innate immune endotypes predictive of antibody responses to vaccination**  *Nature Immunology.* 2022; **23** (12):1777-1787  [https://doi.org/10.1038/s41590-022-01329-5](https://doi.org/10.1038/s41590-022-01329-5)  [Scopus (109)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_118_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85141085346)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/36316476/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs41590-022-01329-5&pmid=36316476)  ). Experimental: longitudinal response to immunologic challenges (vaccine or autoimmune trigger) (Nakaya et al.  119.  Nakaya, H.I. ∙ Wrammert, J. ∙ Lee, E.K....  **Systems biology of vaccination for seasonal influenza in humans**  *Nature Immunology.* 2011; **12** (8):786-795  [https://doi.org/10.1038/ni.2067](https://doi.org/10.1038/ni.2067)  [Scopus (715)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_119_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-80051989398)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/21743478/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fni.2067&pmid=21743478)  ; Banchereau et al.  120.  Banchereau, R. ∙ Hong, S. ∙ Cantarel, B....  **Personalized Immunomonitoring Uncovers Molecular Networks that Stratify Lupus Patients**  *Cell.* 2016; **165** (6):1548-1550  [https://doi.org/10.1016/j.cell.2016.05.057](https://doi.org/10.1016/j.cell.2016.05.057)  [Full Text](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_120_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.cell.2016.05.057&cf=fulltext&site=cell-site)  [Full Text (PDF)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_120_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.cell.2016.05.057&cf=pdf&site=cell-site)  [Scopus (87)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_120_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84971578594)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/27259156/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1016%2Fj.cell.2016.05.057&pmid=27259156)  ; Tsang et al.  61.  Tsang, J.S. ∙ Schwartzberg, P.L. ∙ Kotliarov, Y....  **Global analyses of human immune variation reveal baseline predictors of postvaccination responses**  *Cell.* 2014; **157**:499-513  [Full Text](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_61_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.cell.2014.03.031&cf=fulltext&site=cell-site)  [Full Text (PDF)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_61_2&dbid=4&doi=10.1016%2Fj.cell.2026.07.004&key=10.1016%2Fj.cell.2014.03.031&cf=pdf&site=cell-site)  [Scopus (387)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_61_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-84898653725)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/24725414/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1016%2Fj.cell.2014.03.031&pmid=24725414)  ) |
| 15 | Clinical trial outcome | Responder vs. non-responder AUC ≥ 0.80 in prospective phase 2/3 trials; mechanisms of sensitivity/resistance validated in patient-derived organoids or via CRISPR-based functional screens | Largely new needed: public-private consortium data largely unavailable; TCGA outcome data are insufficient and not amenable to prospective validation; prospective trial with biobanking and held out data are virtually non-existent (see expanded consortium proposal in text) | Computational: OncoTreat (Jamison et al.  9.  Jamison, J.K. ∙ Zhou, M. ∙ Gelmann, E.P....  **Entinostat in patients with relapsed or refractory abdominal neuroendocrine tumors**  *Oncologist.* 2024; **29**:817-e1213  [Crossref](https://doi.org/10.1093/oncolo/oyae118)  [Scopus (16)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_9_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85203474862)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/38886159/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1093%2Foncolo%2Foyae118&pmid=38886159)  ); OncoTarget (Zeleke et al.  8.  Zeleke, T.Z. ∙ Pan, Q. ∙ Chiuzan, C....  **Network-based assessment of HDAC6 activity predicts preclinical and clinical responses to the HDAC6 inhibitor ricolinostat in breast cancer**  *Nat. Cancer.* 2023; **4**:257-275  [Crossref](https://doi.org/10.1038/s43018-022-00489-5)  [Scopus (75)](https://www.cell.com/servlet/linkout?suffix=e_1_5_1_2_8_2&dbid=137438953472&doi=10.1016%2Fj.cell.2026.07.004&key=2-s2.0-85145169966)  [PubMed](https://pubmed.ncbi.nlm.nih.gov/36585452/)  [Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1038%2Fs43018-022-00489-5&pmid=36585452)  ). Experimental: prospective clinical trials using the Genomic Evidence Neoplasia Information Exchange (GENIE); Investigation of Serial studies to Predict Your therapeutic response (I-SPY) study design; CRISPR-based validation of resistance mechanisms |

Table 2

Metrics for success, data availability, and comparative benchmark baselines

This table describes, for each proposed challenge, the specific metrics of success, dataset availability vs. the need to create new datasets, and, critically, existing methodologies, both computational and experimental, against which relative performance should be assessed. Data availability: available = suitable datasets largely exist; partially available = some datasets exist but key modalities are absent; largely new datasets are needed = purposeful, context-specific data generation required. Non-Gen-AI baselines include both large-scale experimental assays and validated computational methods. All challenges straddle both tier 1 and tier 2 tests, as the generation of blind, prospective ground-truth datasets could first be used to assess the ability to produce novel biological discoveries and then to generate comparative metrics for future assessment of performance improvements.

Abbreviations are as follows: CMAP, Connectivity Map; DMS, deep mutational scanning; FDR, false discovery rate; Immune Epitope Database; KO, knockout; MCC, Matthews correlation coefficient; MoA, mechanism of action; iPSCs, induced pluripotent stem cells; TF/co-TF, transcription factor/cofactor; TME, tumor microenvironment; VUFS, variants of unknown functional significance; HIPC, Human Immunology Project Consortium.

- [Open table in a new tab](https://www.cell.com/action/showFullTableHTML?isHtml=true&tableId=tbl2&pii=S0092-8674%2826%2900802-0)

### Level 1: Molecular-level interactions

#### Challenge 1: Regulatory and signaling interactions

Although the biological community has made remarkable progress in predicting protein structure, the ability to effectively predict cell-context-specific interactions between proteins and other molecules—from DNA and RNA to proteins, metabolites, and small molecules—remains underrepresented. Although canonical pathways and motif-based regulatory interactions partially address this problem, they represent an oversimplified version of the molecular logic that underlies cell behavior. We frame this as a foundational problem because further advances in creating effective models for the remaining challenges are likely to depend on whether we can improve our ability to map these complex, distinct molecular interaction layers.

This is perhaps the area where LLMs may have the most immediate impact, as already suggested by systems such as AlphaFold and OpenFold

16.

Jumper, J. ∙ Evans, R. ∙ Pritzel, A....

**Highly accurate protein structure prediction with AlphaFold**

*Nature.* 2021; **596**:583-589

<sup>,</sup>

121.

Ahdritz, G. ∙ Bouatta, N. ∙ Floristean, C....

**OpenFold: retraining AlphaFold2 yields new insights into its learning mechanisms and capacity for generalization**

*Nat. Methods.* 2024; **21**:1514-1524

in the context of protein-protein and protein-DNA interactions. However, tuning these models to study additional molecular interaction layers, e.g., cell-context-specific transcriptional or signaling interactions, would provide critical support to both generating better, biologically anchored Gen-AI models and supporting some of the additional challenges discussed here.

#### Challenge 2: Epigenetic interactions

Many of the differences in the distinct logic that determines the behavior of different cell types are determined by the cells’ epigenetic machinery. Open vs. closed chromatin—as well as the activity of regulatory regions in our genomes—represents a critical determinant of the differential abundance and differential regulation of gene products and, ultimately, of the implementation of functional cell states. Yet the logic of the epigenetic layer is still poorly understood, and its complex effects on gene regulation are still elusive. For instance, the combinatorial code by which histone modifications or methylation patterns induce chromatin opening or closing—and ultimately its organization in the nucleus—is far from being fully understood. Tackling this class of problem using Gen-AI models provides the potential to generalize our understanding of gene regulation and signal transduction to virtually any cellular lineage/epigenetic state.

#### Challenge 3: Cell-cell interactions

One of the most critical challenges in biology, with important translational applications, is the understanding of cell-cell communication mechanisms that induce desired or undesired behavior. This is exemplified by the discovery of actionable mechanisms that prevent immune cells from recognizing mutated cancer cells as non-self, spurring the development of immune checkpoint inhibitors—such as those targeting CTLA4

122.

Hodi, F.S. ∙ O’Day, S.J. ∙ McDermott, D.F....

**Improved survival with ipilimumab in patients with metastatic melanoma**

*N. Engl. J. Med.* 2010; **363**:711-723

and the programmed cell death 1 (PD-1)/programmed cell death ligand 1 (PD-L1)

123.

Topalian, S.L. ∙ Hodi, F.S. ∙ Brahmer, J.R....

**Safety, activity, and immune correlates of anti-PD-1 antibody in cancer**

*N. Engl. J. Med.* 2012; **366**:2443-2454

axis—which have dramatically changed the cancer treatment landscape.

124.

Sharma, P. ∙ Allison, J.P.

**The future of immune checkpoint therapy**

*Science.* 2015; **348**:56-61

Although these approaches—originating from biological ingenuity and, at times, serendipitous discoveries—have been transformational, we simply lack systematic methodologies for the dissection of disease-related cell-cell communication mechanisms. Their knowledge would help to “tune” the biology of both disease and normal cells to cure, prevent, and manage disease, as well as to prevent the naturally occurring degradation of human cell function in aging.

### Level 2: Molecular function

#### Challenge 4: Synthetic mechanisms

A key question in synthetic biology concerns the optimal design of synthetic, DNA-based mechanisms aimed at implementing simple functions, such as writing events to a safe locus of the genome. Many such approaches have been designed ad hoc, such as the DNA typewriter.

73.

Choi, J. ∙ Chen, W. ∙ Minkina, A....

**A time-resolved, multi-symbol molecular recorder via sequential genome editing**

*Nature.* 2022; **608**:98-107

However, these are generally based on experimental design that proceeds via complex trial-and-error approaches. A “biomechanisms designer” Gen-AI would be extremely valuable and potentially applicable to address a large number of biologically relevant questions. For instance, a key challenge for the design of CRISPR screens in induced pluripotent stem cell (iPSC)-derived lineages is the rapid silencing of the promoters that control Cas9 or dCas9 expression, as well as the design of optimal inducible promoters that do not suffer from leakage and/or epigenetic silencing, especially following differentiation to individual lineages.

#### Challenge 5: Genome to biochemical function

Although significant progress in this domain has been achieved in the last few years, the prediction of the function of a protein or RNA from the sequence of its encoding gene is still only partially addressed. This is especially true when trying to assess whether changes in one or more nucleic acids would cause loss of function (hypomorph), including due to misfolding, gain of function (hypermorph), novel function (neomorph), or no change in protein functional activity. Such a problem has a critical impact not only on the *de novo* design of protein variants that may increase or decrease functional activity in an organism but also on assessing whether somatic or germline variants in the genome may be pathogenic.

#### Challenge 6: Drug mechanism of action

One of the most critical open issues in translating results from the bench to the clinic is the design of small molecules that target specific disease-related mechanisms. For the past 50 years, the community has embraced the concept of one disease/one target/one drug. However, with the potential exception of antibodies, the mechanism of action of most drugs is both highly cell-context-specific and best modeled as a “field effect” implemented through a large repertoire of high-affinity (on-target), lower affinity (off-target), and context-mediated (indirect) drug targets, responsible for implementing both desired and undesired pharmacologic effects. Predicting context-specific drug mechanisms of action

46.

Woo, J.H. ∙ Shimoni, Y. ∙ Yang, W.S....

**Elucidating Compound Mechanism of Action by Network Perturbation Analysis**

*Cell.* 2015; **162**:441-451

<sup>,</sup>

85.

Hu, L.Z. ∙ Hirschhorn, T. ∙ Douglass, E....

**Elucidating Compound Mechanism of Action and Polypharmacology with a Large-scale Perturbational Profile Compendium**

Preprint at *bioRxiv.* 2025;

as well as potential mechanism-based synergy

45.

Bansal, M. ∙ Yang, J. ∙ Karan, C....

**A community computational challenge to predict the activity of pairs of compounds**

*Nat. Biotechnol.* 2014; **32**:1213-1222

is thus one of the most critical and challenging issues in biology, especially as we attempt to accelerate the discovery of small molecules and antibodies that can reprogram immune cell function without requiring cell-based therapy approaches.

### Level 3: Cellular/systems function

#### Challenge 7: Genome to phenotype

*De novo* design of a living organism with the smallest possible genome remains an unsolved yet scientifically relevant question. The smallest free-living cell’s genome (*Mycoplasma genitalium*), for instance, contains only 482 protein-coding genes. However, we are still unable to create a “designer cell” *de novo* with an equivalently sized genome capable of surviving independently.

#### Challenge 8: Cell state reprogramming

This is likely one of the largest and most differentiated challenges, aimed at discovering actionable mechanisms that can help reprogram the functional state of a cell—often associated with specific transcriptional states—to a different, potentially novel state. The target state would either (1) support a novel, beneficial function (e.g., reprogramming a differentiated hematopoietic cell to the hematopoietic stem cell state

95.

Arumugam, K. ∙ Shin, W. ∙ Schiavone, V....

**The Master Regulator Protein BAZ2B Can Reprogram Human Hematopoietic Lineage-Committed Progenitors into a Multipotent State**

*Cell Rep.* 2020; **33**, 108474

), (2) abrogate a deleterious cell state (e.g., depleting a population of memory B cells in autoimmunity), (3) prevent the transition to an undesired state (e.g., preventing the transition of CD8+ T cells to an exhausted state

126.

McLane, L.M. ∙ Abdel-Hakeem, M.S. ∙ Wherry, E.J.

**CD8 T Cell Exhaustion During Chronic Viral Infection and Cancer**

*Annu. Rev. Immunol.* 2019; **37**:457-495

), or (4) prevent trafficking of immune cells to specific organs or tissues (e.g*.*, recruitment of immunosuppressive HELIOS+ regulatory T cells by a tumor to its microenvironment

127.

Obradovic, A. ∙ Ager, C. ∙ Turunen, M....

**Systematic elucidation and pharmacological targeting of tumor-infiltrating regulatory T cell master regulators**

*Cancer Cell.* 2023; **41**:933-949.e11

). This would provide actionable reprogramming strategies that could be experimentally implemented and tested. This challenge can be broken down into two sub-challenges:
- Genetic-based reprogramming: This challenge encompasses two distinct reprogramming modalities. First, genetic-based reprogramming aims to identify specific genes whose ectopic expression or silencing—either individually or in combination—can induce a desired state transition.
	128.
	Takahashi, K. ∙ Yamanaka, S.
	**Induction of pluripotent stem cells from mouse embryonic and adult fibroblast cultures by defined factors**
	*Cell.* 2006; **126**:663-676
	This is particularly critical in immunology, where manipulating pro- and anti-inflammatory cells can dictate disease outcomes. In cancer, for example, CRISPR-mediated reprogramming of regulatory T cells from a tumor-infiltrating to a non-infiltrating state can induce spontaneous regression of highly aggressive tumors.
	127.
	Obradovic, A. ∙ Ager, C. ∙ Turunen, M....
	**Systematic elucidation and pharmacological targeting of tumor-infiltrating regulatory T cell master regulators**
	*Cancer Cell.* 2023; **41**:933-949.e11
- Drug-based reprogramming: This seeks to use small molecules or designer antibodies to phenocopy the effects of genetic perturbations. Although genetic manipulation—e.g., Chimeric Antigen Receptor T cells (CAR T cells)
	129.
	Porter, D.L. ∙ Levine, B.L. ∙ Kalos, M....
	**Chimeric antigen receptor-modified T cells in chronic lymphoid leukemia**
	*N. Engl. J. Med.* 2011; **365**:725-733
	or exagamglogene autotemcel (CASGEVY)
	130.
	Frangoul, H. ∙ Locatelli, F. ∙ Sharma, A....
	**Exagamglogene Autotemcel for Severe Sickle Cell Disease**
	*N. Engl. J. Med.* 2024; **390**:1649-1662
	—has seen clinical success, safe delivery and avoidance of host-graft rejection remain challenging.
	131.
	Marks, P.W. ∙ Witten, C.M. ∙ Califf, R.M.
	**Clarifying Stem-Cell Therapy’s Benefits and Risks**
	*N. Engl. J. Med.* 2017; **376**:1007-1009
	Therefore, predicting which drugs or antibodies can implement a desired immune cell state transition provides a highly translationally relevant, nearer-term alternative.

#### Challenge 9: Synthetic circuit design

Over the last 50 years, clinical research has been driven by the “silver bullet” concept—the idea that targeting one protein with one drug would treat or prevent a specific disease (the one-disease/one-target/one-drug paradigm). Unfortunately, due to 3 billion years of evolution, the biology of mammalian cells comprises mechanisms capable of maintaining an extraordinary hold on homeostasis. As a result, individual perturbations are often buffered over time by complex cell-adaptive mechanisms, leading to the rapid re-establishment of disease-related cell states. This has been perhaps the most critical obstacle to the development of targeted therapies, for instance, in cancer, because cell-adaptation-based resistance almost unequivocally arises even after an initially dramatic response.

132.

Holohan, C. ∙ Van Schaeybroeck, S. ∙ Longley, D.B....

**Cancer drug resistance: an evolving paradigm**

*Nat. Rev. Cancer.* 2013; **13**:714-726

A promising direction is the design of synthetic circuitry that implements multi-gene detection and action logic, aimed at bypassing the normal homeostatic control of human cells. This will require the systematic implementation of complex logical circuitry into engineered immune cells that can come into direct contact with disease-related cells. A relevant Gen-AI challenge would then be to predict the simplest and most robust bio-circuits that could (1) implement a novel stated function, (2) prevent cell adaptation leading to the re-establishment of a disease state, (3) address the inherently noisy nature of genetic circuits, and (4) avoid triggering a host vs. graft response, i.e., an immune response due to the presence of non-self proteins in the grafted cells.

#### Challenge 10: Systems-level mechanisms

No cell can fully implement its function and, often, even survive in isolation. This is especially obvious in the context of the immune system. For instance, cytotoxic CD8+ T cells have a finite life cycle, requiring complex activation mechanisms via antigen presentation by dendritic and helper CD4+ T cells and proceeding to an exhausted state upon exposure to high-affinity antigens. As a result, predicting systems-level behavior—as determined by complex cell-cell communication mechanisms—is going to be increasingly critical for developing more predictive Gen-AI models. For instance, in the context of many aggressive cancers that fail to respond to immunotherapy, we already know that multiple cell lineages contribute to creating a highly immunosuppressive microenvironment. These include M2-like and TREM2+/C1Q+ tumor-associated macrophages (TAMs), myofibroblastic cancer-associated fibroblasts (myCAFs), N2 tumor-infiltrating neutrophils (TANs), HELIOS+ regulatory T cells (Tregs), and many additional immune and non-immune subpopulations. Modeling the specific mechanisms that allow these populations to perform specific functions in concert will be a critical requirement for designing better immunotherapies and to understand mechanisms of immunotherapy failure or relapse.

### Level 4: Translation

#### Challenge 11: Complex biomarker identification

A critical issue in clinical translation is the lack of molecular-level biomarkers for the early, minimally invasive detection of disease, from cancer to neurodegeneration to inflammation. Indeed, with some exceptions, biomarker development efforts are still struggling to achieve sufficient specificity in clinical studies.

133.

Goossens, N. ∙ Nakagawa, S. ∙ Sun, X....

**Cancer biomarker discovery and validation**

*Transl. Cancer Res.* 2015; **4**:256-269

More critically, protein-based blood biomarkers are present in extremely small concentrations, compared with abundant proteins such as albumin or immunoglobulin, thus making their detection extremely challenging and non-reproducible. An increasingly relevant area of investigation is thus the identification of biomarkers based on alternative modalities, such as cell-free nucleic acids, lipid vesicle content, and polysaccharides. Individually or in combination, these modalities may achieve the accuracy and specificity required for complex diagnostic challenges. Critical steps in this direction are already being made, for instance, in areas as diverse as cancer, neurodegeneration,

134.

Toden, S. ∙ Zhuang, J. ∙ Acosta, A.D....

**Noninvasive characterization of Alzheimer’s disease by circulating, cell-free messenger RNA next-generation sequencing**

*Sci. Adv.* 2020; **6**, eabb1654

and maternal health,

135.

Ngo, T.T.M. ∙ Moufarrej, M.N. ∙ Rasmussen, M.H....

**Noninvasive blood tests for fetal development predict gestational age and preterm delivery**

*Science.* 2018; **360**:1133-1136

including through the development of comprehensive blood-borne protein atlases.

136.

Álvez, M.B. ∙ Bergström, S. ∙ Kenrick, J....

**A human pan-disease blood atlas of the circulating proteome**

*Science.* 2025; **390**, eadx2678

Some of these diagnostics have already been translated into the clinic, yet their ultimate utility remains to be fully assessed. This is especially relevant in the context of immune-cell-based diagnostics, where innovative approaches to develop synthetically bioengineered immune cells capable of naturally or artificially trafficking to disease related tissues could allow for *in situ* health monitoring by allowing these biosensors to come into direct contact with pathogens or disease-related cells.

#### Challenge 12: Drug toxicity

The lack of computational frameworks for the accurate prediction of therapeutic toxicity represents a major impediment to the efficient and cost-effective design of clinical trials. Thus, effective prediction of clinical trial success cannot be achieved without addressing this challenge. For instance, the same class of drugs (topoisomerase inhibitors inducing DNA damage during cell replication in cancer) can either present cardiac toxicity (e.g., doxorubicin or idarubicin) or be very well tolerated (etoposide or mitoxantrone). Although these drugs’ primary target is the same protein, differences in their off-target effects may mean the difference between clinical success or failure. This is especially the case for immune-based therapies, where failure to predict deleterious effects from antibody or cell-based therapies has often resulted in catastrophic failures, including multiple patient deaths, resulting in clinical trial termination. The catastrophic failure of the TGN1412 trial, where all six healthy volunteers developed a cytokine storm within hours despite the drug performing safely in preclinical models, represents a hallmark illustration of this pervasive challenge.

137.

Suntharalingam, G. ∙ Perry, M.R. ∙ Ward, S....

**Cytokine storm in a phase 1 trial of the anti-CD28 monoclonal antibody TGN1412**

*N. Engl. J. Med.* 2006; **355**:1018-1028

Standard toxicology tests and animal models failed to predict this life-threatening reaction. Computational approaches must account for species-specific immune differences, individual variation in immune responses, and the cascade effects by which initial perturbations trigger self-amplifying inflammatory responses. This requires modeling not just drug-target interactions but also systems-level immune dynamics.

#### Challenge 13: Drug efficacy

Similarly, the lack of computational frameworks for the accurate prediction of disease-specific efficacy represents an additional and equally critical impediment to the efficient, cost-effective design of clinical trials. Indeed, most clinical trials fail due to a lack of detectable activity. The reason is twofold: first, the drug may be effective only in a subset of the disease population. For instance, the very effective HER2 inhibitor Herceptin would have failed a clinical trial open to the general breast cancer population because only about 15% of these patients carry mutations that sensitize their tumors to this drug. Equally problematic is the assumption that inhibition of a single target under carefully controlled conditions *in vitro* or in animal models will be recapitulated in the full context of the human immune system. This has led to failures, such as the underwhelming effect of LAG3 antibodies targeting highly immunosuppressive regulatory T cells in cancer.

138.

Tawbi, H.A. ∙ Schadendorf, D. ∙ Lipson, E.J....

**Relatlimab and Nivolumab versus Nivolumab in Untreated Advanced Melanoma**

*N. Engl. J. Med.* 2022; **386**:24-34

This suggests that successful therapies must truly account for systems-level rather than individual cellular subpopulation behavior and that they may increasingly need to target complex mechanisms that are not fully recapitulated by a single receptor or ligand.

139.

Laise, P. ∙ Bosker, G. ∙ Babor, M....

**Systematic identification and targeting of master regulator checkpoints (MRC) governing tumor microenvironment-mediated immune evasion**

*J. Immunother. Cancer.* 2025; **13**, e011355

#### Challenge 14: Organismal responses

Our ongoing health, future health trajectory, and even longevity are dependent on the capacity of our immune system to detect and fight disease while avoiding targeting our own cells and tissues that drive autoimmunity and chronic inflammation. Indeed, most diseases have been linked to the dysregulation of our immune system. Thus, predicting the immune health of an individual

30.

Lei, Y. ∙ Tsang, J.S.

**Systems Human Immunology and AI: Immune Setpoint and Immune Health**

*Annu. Rev. Immunol.* 2025; **43**:693-722

<sup>,</sup>

59.

Sparks, R. ∙ Rachmaninoff, N. ∙ Lau, W.W....

**A unified metric of human immune health**

*Nat. Med.* 2024; **30**:2461-2472

and how different individuals respond to perturbations—from immunization to cancer to infections—represents a major challenge. A key measurable target for challenge 14 is the individual immune setpoint

60.

Kotliarov, Y. ∙ Sparks, R. ∙ Martins, A.J....

**Broad immune activation underlies shared set point signatures for vaccine responsiveness in healthy individuals and disease activity in patients with lupus**

*Nat. Med.* 2020; **26**:618-629

<sup>,</sup>

61.

Tsang, J.S. ∙ Schwartzberg, P.L. ∙ Kotliarov, Y....

*Cell.* 2014; **157**:499-513

—the characteristic baseline immune state that predicts downstream responses to vaccination, infection, disease, therapies, and aging. Because setpoints are shaped by both heritable and non-heritable factors,

140.

Brodin, P. ∙ Davis, M.M.

**Human immune system variation**

*Nat. Rev. Immunol.* 2017; **17**:21-29

including genetics, age, sex, and cumulative environmental exposures, they represent a tractable yet high-dimensional phenotype for prospective Gen-AI benchmarking: a model that accurately predicts an individual’s setpoint and future responses from multi-omics and prior-exposure data would constitute evidence of organismal-level predictive capability. Efforts such as the recently announced HIP

141.

Duncan, D.E.

**How healthy am I? My immunome knows the score**

MIT Technology Review, 2025

[https://www.technologyreview.com/2025/10/09/1125376/how-healthy-am-i-my-immunome-knows-the-score/](https://www.technologyreview.com/2025/10/09/1125376/how-healthy-am-i-my-immunome-knows-the-score/)

[Google Scholar](https://scholar.google.com/scholar?q=D.E.DuncanHow+healthy+am+I%3F+My+immunome+knows+the+score2025MIT+Technology+Reviewhttps%3A%2F%2Fwww.technologyreview.com%2F2025%2F10%2F09%2F1125376%2Fhow-healthy-am-i-my-immunome-knows-the-score%2F)

and the design of AI-based, unified human immune health metrics

59.

Sparks, R. ∙ Rachmaninoff, N. ∙ Lau, W.W....

**A unified metric of human immune health**

*Nat. Med.* 2024; **30**:2461-2472

represent a critical step in generating data to train Gen-AI methods to uncover critical determinants contributing to the healthy or dysfunctional operation of our immune system. Indeed, maintaining health, rather than treating disease, should become a key priority in predictive biology. The COVID-19 pandemic starkly illustrated both the importance and difficulty of this challenge.

142.

Pereira, N.L. ∙ Ahmad, F. ∙ Byku, M....

**COVID-19: Understanding Inter-Individual Variability and Implications for Precision Medicine**

*Mayo Clin. Proc.* 2021; **96**:446-463

Individual responses to SARS-CoV-2 infection ranged from asymptomatic to fatal, with age, sex, genetics, and prior immune exposures all playing roles. Similarly, vaccine responses varied widely—some individuals generated robust neutralizing antibodies after a single dose, while others required multiple boosts. Furthermore, having baseline setpoint predictors of infection outcomes could reveal correlates of protection (CoPs) beyond antibodies, which often explain only a small fraction of outcome variance. CoPs could help significantly speed up the efficacy assessment of new vaccines, especially under the tight timeline of a pandemic response.

143.

King, D.F. ∙ Groves, H. ∙ Weller, C....

**Realising the potential of correlates of protection for vaccine development, licensure and use: short summary**

*NPJ Vaccin.* 2024; **9**:82

The development of baseline setpoint predictors and immune health metrics represents an initial step in the right direction, showing that baseline immune states predict vaccination responses and disease susceptibility. However, current predictive capacity was developed using relatively small cohorts and it remains to be determined whether these models and metrics have clinical utility. Moreover, extending these approaches to diverse populations and challenges remains an open problem.

#### Challenge 15: Clinical trial outcomes

On average, over the last 10 years, more than nine out of ten clinical trials—especially in the context of small-molecule and cell-based therapies targeting the immune system—have failed to reject the null hypothesis or have induced critical toxicity. This represents a remarkable financial burden and time sink on the path to developing novel therapies. In cancer and immunotherapy, success rates are even more dismal, at less than 3%.

144.

Minhas, A.

**Clinical trial success rates by therapeutic area 2020**

Statista, 2026

[https://www.statista.com/statistics/1201162/clinical-trial-success-rates-by-therapeutic-area/](https://www.statista.com/statistics/1201162/clinical-trial-success-rates-by-therapeutic-area/)

[Google Scholar](https://scholar.google.com/scholar?q=A.MinhasClinical+trial+success+rates+by+therapeutic+area+20202026Statistahttps%3A%2F%2Fwww.statista.com%2Fstatistics%2F1201162%2Fclinical-trial-success-rates-by-therapeutic-area%2F)

Although addressing challenge 6 would definitely contribute to increasing the success of clinical trials, drug mechanism of action is a molecular-level question, while predicting the effect of a drug in a patient population involves much more complex organism-level interactions, a problem that still eludes most predictive methodologies, thus representing a hallmark challenge for predictive Gen-AI models.

These fifteen challenges are deliberately ambitious, intentionally difficult, and broadly formulated. Although biological challenges inherently resist the strict axiomatic formalization of Hilbert’s mathematical problems, they demand an equivalent level of rigorous, prospective benchmarking. Consequently, we frame them as open-ended programmatic goals, supported by concrete proof-of-concept validation templates ([Table 1](#tbl1)) and explicit success metrics ([Table 2](#tbl2)), rather than as entirely unambiguous criteria for resolution. We propose that successfully addressing even a subset may require sustained effort over decades, not years. This timeline may seem discouraging, but transformative scientific capabilities rarely emerge overnight. AlphaFold represented 4 years of focused work building on 50 years of structural biology, data sharing, and prospective, blinded benchmarking. Even if effective AI models to represent the complexity of cellular and systems behavior were available today, we would still lack critical challenge-specific data. For instance, despite thousands of clinical trials, publicly available trial data are limited to success rates, while molecular-level correlative data are rarely, if ever, made publicly available by pharmaceutical and biotechnology companies or cannot even be generated because pathology samples have not been centrally collected and characterized.

What matters is starting now, creating sustainable infrastructure, and measuring progress honestly. The discussion that follows addresses practical considerations for organizing community efforts around these challenges.

### Data generation requirements

Addressing these challenges will require the generation of large-scale perturbational assays with multi-omics readouts. These datasets need to be generated *de novo* from humans and human-relevant models specifically selected as relevant to each challenge rather than from haphazardly collected experiments already available in the public domain. For instance, the generation of Gen-AI models capable of predicting the effect of specific perturbations on determining cell state or cell fate will depend critically on the generation of large-scale perturbation datasets in models that are related to the specific cell states and fates of interest. Although Gen-AI models will become increasingly universal over time, at least for the foreseeable future, learning the response of a CD4 T cell to a specific cytokine combination is unlikely to arise from training the model using baseline atlases representing thousands of cell types in steady-state conditions. Most critically, the ability to predict clinical trial outcomes will require datasets representing the molecular-level properties of patients who have responded or failed to respond to specific treatments. Unfortunately, the number of such datasets in the public domain is exceptionally small, with most studies providing, at best, the fraction of responders and non-responders. We propose creating a public-private consortium that will make such data available, initially starting with trials that have failed to achieve their objective but also involving pharmaceutical and biotech companies in activities that will at least help preserve samples from trials, with the objective of generating critical correlative, molecular-level data for training Gen-AI models.

A critical and underappreciated dimension of the data generation challenge is demographic and geographic diversity. For example, immune setpoints, response trajectories, and disease susceptibility vary substantially across ancestries, geographic regions, and early-life exposure histories. Models trained on narrow, predominantly European-ancestry cohorts are expected to fail to generalize—not incidentally but structurally—echoing the out-of-distribution failures documented for single-cell foundation models. The HIP and the Human Cell Atlas’s commitment to profiling globally diverse populations is thus not merely an equity consideration but a scientific prerequisite for empowering Gen-AI models to predict human biology and responses broadly.

We propose a public-private consortium modeled on existing precedents, such as the Biomarkers Consortium (managed by the Foundation for the NIH), the Innovative Medicines Initiative (IMI) in Europe, and the Critical Path Institute’s Coalition Against Major Diseases (CAMD), which has already successfully pooled Alzheimer’s disease clinical trial data from competing pharmaceutical companies. The proposed consortium would operate under the following principles: (1) data standards, under which all contributed datasets would conform to CDISC (Clinical Data Interchange Standards Consortium) standards for clinical data and to community-agreed multi-omics data standards (e.g., those developed by the GA4GH), enabling cross-trial integration; (2) incentive structures, wherein participating companies would receive early access to consortium-derived predictive models, co-authorship on benchmark publications, and regulatory credit for contributing to FDA-recognized qualification of biomarkers; (3) phased access, with an initial focus on trials that have already failed—where competitive sensitivity is lower—would allow rapid data accumulation while building trust for eventual inclusion of ongoing trials; (4) governance, comprising an independent scientific advisory board, analogous to those governing The Cancer Genome Atlas (TCGA) or the Human Cell Atlas, which would oversee data access, model evaluation, and publication rights; and (5) data distribution and blinded prediction assessment, controlled by an honest broker, such as the DREAM committee. The goal would be to generate, within 5 years, a corpus of at least 500 trials with matched molecular-level baseline and on-treatment data, sufficient to begin training and prospectively validating Gen-AI models for clinical trial outcome prediction. A complementary approach would create an initiative to mandate and fund the generation of correlative data from investigator-initiated trials, conditional on the data being released to the community.

Competitive blinded benchmarking activities, such as CASP, the Critical Assessment of Protein Interactions (CAPRI), and DREAM, have played a critical role in fostering rapid improvements in the ability to create computational models that can accurately address biologically relevant questions, from protein folding and interaction to cellular network generation. A similar effort, AI-DREAM, dedicated to generating blinded data for the validation of Gen-AI models or, even better, a commitment to prospectively validate computational predictions in a community-based challenge, would likely be transformational in terms of moving from retrospective benchmarks, which may provide relative performance guidelines to benchmarks that will assess the ability of Gen-AI models to predict novel biology.

## Discussion

It is important to situate the proposed challenges within the growing ecosystem of focused research organizations (FROs) and large-scale collaborative initiatives that are already making significant progress on overlapping problems. Biohub, the Arc Institute, the Wellcome Sanger Institute, and programs like the Human Cell Atlas are generating multi-omics datasets from baseline and perturbation-based atlases at a scale that will be essential for training models aimed at addressing challenges 1–3 and 8–10. Similarly, datasets generated by the ENCODE

40.

ENCODE Project Consortium

**An integrated encyclopedia of DNA elements in the human genome**

*Nature.* 2012; **489**:57-74

and Roadmap Epigenomics

145.

Roadmap Epigenomics Consortium ∙ Kundaje, A. ∙ Meuleman, W....

**Integrative analysis of 111 reference human epigenomes**

*Nature.* 2015; **518**:317-330

projects will be critical to address challenge 2. The HIP directly addresses the data generation needs for challenges 14 and 15. Finally, the Cancer Dependency Map (DepMap),

146.

Boehm, J.S. ∙ Garnett, M.J. ∙ Adams, D.J....

**Cancer research needs a better map**

*Nature.* 2021; **589**:514-516

the Library of Integrated Network-based Cellular Signatures (LINCS),

147.

Subramanian, A. ∙ Narayan, R. ∙ Corsello, S.M....

**A Next Generation Connectivity Map: L1000 Platform and the First 1,000,000 Profiles**

*Cell.* 2017; **171**:1437-1452.e17

Tahoe,

148.

Zhang, J. ∙ Ubas, A.A. ∙ de Borja, R....

**Tahoe-100M: A Giga-Scale Single-Cell Perturbation Atlas for Context-Dependent Gene Function and Cellular Modeling**

Preprint at *bioRxiv.* 2025;

and the Pan-cancer Assessment of Compound Effectors and Activity (PanACEA)

85.

Hu, L.Z. ∙ Hirschhorn, T. ∙ Douglass, E....

**Elucidating Compound Mechanism of Action and Polypharmacology with a Large-scale Perturbational Profile Compendium**

Preprint at *bioRxiv.* 2025;

datasets provide essential resources for challenges 6, 12, and 13. These efforts are not competitors to the proposed challenge framework but rather critical pillars of the data infrastructure upon which it depends. The fifteen challenges proposed here are intended to provide the community with a shared vocabulary of success criteria and benchmarks that can be applied to evaluate progress across all of these initiatives and identify critical unaddressed gaps, especially in prospective, blinded validation.

The past decade has witnessed remarkable advances in the design of Gen-AI models—from LLMs for text-based reasoning to AlphaFold- and Evolution Scale Modeling 2 (ESM2)-based protein structure prediction. Here, we argue that the path to predicting the behavior of multicellular systems, as would be necessary, for instance, for the study and modulation of human immune functions, requires more than applying existing Gen-AI model architectures to biological data. Rather, it demands rethinking the use of biological priors in Gen-AI models, what challenges we prioritize to measure ourselves against, and how we benchmark performance. One must also acknowledge some of the objective accomplishments of “pre-AI” computational and systems immunologists. Network-based approaches, for instance, have predicted drug mechanisms and identified disease master regulators validated in clinical trials. Single-cell multimodal profiling has dissected immune responses with unprecedented resolution. Similarly, the immune health metric recently developed by Tsang and colleagues

59.

Sparks, R. ∙ Rachmaninoff, N. ∙ Lau, W.W....

**A unified metric of human immune health**

*Nat. Med.* 2024; **30**:2461-2472

exemplifies success through biological grounding by integrating multi-omics data from diverse subjects with monogenic immune disorders to derive a measure generalizable to aging, polygenic diseases, and vaccination responses. These successes share common features: they leverage biological priors, integrate multiple data modalities, and address specific biological questions rather than showcase algorithmic superiority. The next challenge for Gen-AI is building upon these foundations rather than ignoring them.

Yet the single greatest barrier to our ambitious goals is empirical: insufficient high-quality training data. AlphaFold and ESM2 succeeded because decades of structural biology generated hundreds of thousands of protein structures. In contrast, the largest immune profiling datasets contain measurements from perhaps millions of cells across hundreds of individuals—insufficient to capture human immune diversity across age, sex, ancestry, exposures, and disease states. The HIP tries to address this gap, aiming to profile hundreds of thousands of globally diverse individuals. Yet there are sound reasons why even the largest datasets may be insufficient to learn how cells implement behavior, and additional types of data will also be needed, such as genetic and drug perturbational data, spatial profiling, as well as outcome and on-treatment clinical data. Each challenge implies specific data generation strategies requiring close coordination between experimentalists, clinicians, and computational scientists. Indeed, a key issue with existing models is that they leverage data generated for disparate purposes, across cell types as different as a T cell and a neuron. The complexity of multicellular modeling suggests that data generation will have to be much more purposeful, with specific datasets capturing the effect of perturbations that may help elucidate the underlying regulatory, signaling, and cell-cell communication logic of specific cell types using methodologies such as Perturb-seq—and even its multiome evolutions—to generate hundreds of millions of single-cell profiles. Indeed, generalization to predicting the behavior of arbitrary cell types can only come from first learning to accurately predict the behavior of individual cell types.

We acknowledge that our critique of current benchmarking may, at first, appear unduly dismissive. This is not our intention. Simplified problems such as cell type classification serve important purposes in algorithm development, providing rapid feedback for methodological innovation. The issue arises when performance on abstract benchmarks is mistaken for progress on real biological problems.

To address this dichotomy, we propose a two-tiered framework. Tier 1 “methods development” benchmarks allow rapid algorithmic iteration; tier 2 benchmarks—the proposed fifteen challenges—use prospective validation judged by actionability. Can predictions be validated experimentally? Do they yield novel insights? Do they inform therapeutics? This framework maintains methodological progress while measuring ultimate success against problems that matter. Indeed, the analogy to Hilbert’s problems is deliberate. Many appeared impossibly difficult in 1900; only nine have been completely solved. Yet pursuing these challenges catalyzed entirely new mathematical fields. We hope the same trajectory may be spurred by the proposed challenges, serving as organizing principles to focus the research community’s efforts, justify data generation, and provide meaningful progress metrics over the next decades.

Our emphasis on biological priors also deserves further elaboration. Transformer success in natural language processing stems from learning arbitrary relationships given sufficient data. This flexibility becomes a liability where data are limited but substantial prior knowledge exists. A generic transformer predicting drug-induced cell state changes would require trillions of training examples, whereas we do not even have millions. However, we already have critical mechanistic clues about how drugs bind to proteins to modulate their function. Encoding this knowledge into attention mechanisms to restrict attention flow along established mechanisms could dramatically reduce the search space and improve interpretability. Such an approach would address more than just technical concerns. Models predicting immune behavior based on prior, molecular-level knowledge can explain why predictions were made. This interpretability is essential for mechanistic validation and translation. For instance, clinicians need to know which immune populations may be affected and why, not just whether a patient may respond.

Predictive immune models raise critical ethical considerations. Privacy concerns emerge from detailed immune profiles coupled with genetic and health data; immune repertoires reveal past pathogen exposures and could infer medical history without consent. Robust governance frameworks, including federated learning approaches, will be essential for addressing these concerns and will potentially amplify similar concerns arising from genetic privacy.

149.

Buchanan, A. ∙ Califano, A. ∙ Kahn, J....

**Pharmacogenetics: ethical issues and policy options**

*Kennedy Inst. Ethics J.* 2002; **12**:1-15

Equity concerns also loom large. Models trained predominantly on European ancestry populations may perform poorly in underrepresented groups, exacerbating health disparities. The HIP’s global diversity emphasis is crucial, but benefits must flow back to data-contributing communities through novel intellectual property frameworks prioritizing access over profit.

The proposed fifteen challenges are only a representative sample of the discovery landscape that could be affected by novel Gen-AI models. However, we hope they provide a relevant sample of the cutting edge separating our current understanding from what we need to meaningfully achieve to introduce predictive methods that can systematically improve human health. Every adverse drug reaction, every immunotherapy failure, every failed clinical trial unable to predict patient response or even which drug should be used, represents human suffering that better predictive models could alleviate. Immune checkpoint inhibitors have shown that “getting immunology right” can produce transformative impact, with response rates approaching 40%–50% in selected patients. Yet these successes emerged from biological insight and clinical experimentation rather than computational prediction. Can we accelerate discovery, reduce experimental failure rates, and extend successes to broader diseases through truly predictive models? We believe the answer is yes, but only if deliberate choices about benchmarking progress, prioritizing problems, and integrating biological knowledge into AI architectures are made. This path will require humility about current capabilities, ambitious goals, commitment to experimental validation, and, more than anything else, patience. It will also require unprecedented collaboration across computational immunology, experimental biology, synthetic biology, clinical medicine, ethics, and data science. Most importantly, it will require community consensus on meaningful progress.

In the spirit of Hilbert’s problems, which were intended to motivate an entire community for years to come, the proposed challenges may prove generative and generalizable, even if some remain unsolved for decades. What matters is confronting problems that, once solved, will transform human health rather than measuring progress against problems that have already been solved.

## Acknowledgments

This work was funded in part by a Biohub gift to Columbia University and by the NCI (CZ CU24-2184 to P.S., R35 CA197745 to A.C., and R35 CA253126 to R.R.).

## Declaration of interests

E.L. was an advisor to the Chan-Zuckerberg Initiative Foundation at the time this manuscript was initially edited; she is also an advisor to Element Biosciences, Cartography Biosciences, GenBio.AI, and Pixelgen Technologies AB. The terms of these arrangements have been reviewed and approved by KTH and Stanford University in accordance with their conflict-of-interest policies. M.Z. and L.D. are partially funded by a gift from Biohub. J.S.T. is partially funded by Biohub and CZI; he serves or has served on the Scientific Advisory Board of CytoReason Inc, ImmunoScape Inc, and Snow Medical (Australia), and as the (non-compensated) co-CSO of the Human Immunome Project. A.C. and M.Z. have filed a patent on the GREmLN foundation model, which incorporates molecular interaction networks into the attention model.

## Declaration of generative AI and AI-assisted technologies in the writing process

We used Claude Sonnet 4.6 to ensure that references were correct, that relevant references were not missing, and to advise on any redundancy or grammar/syntax errors in the text. None of the concepts expressed in this manuscript were generated by AI.

## References

[1.](#body-ref-sref1 "View in article")

Schuhmacher, A. ∙ Hinder, M. ∙ Brief, E....

**Benchmarking R&D success rates of leading pharmaceutical companies: an empirical analysis of FDA approvals (2006–2022)**

*Drug Discov. Today.* 2025; **30**, 104291

[2.](#body-ref-sref2 "View in article")

Mullin, K.

**Why are clinical development success rates falling?**

Norstella, 2024

[https://www.norstella.com/why-clinical-development-success-rates-falling/](https://www.norstella.com/why-clinical-development-success-rates-falling/)

[Google Scholar](https://scholar.google.com/scholar?q=K.MullinWhy+are+clinical+development+success+rates+falling%3F2024Norstellahttps%3A%2F%2Fwww.norstella.com%2Fwhy-clinical-development-success-rates-falling%2F)

[3.](#body-ref-sref3 "View in article")

Freedman, L.P. ∙ Cockburn, I.M. ∙ Simcoe, T.S.

**The Economics of Reproducibility in Preclinical Research**

*PLoS Biol.* 2015; **13**, e1002165

[4.](#body-ref-sref4 "View in article")

Łuksza, M. ∙ Riaz, N. ∙ Makarov, V....

**A neoantigen fitness model predicts tumour response to checkpoint blockade immunotherapy**

*Nature.* 2017; **551**:517-520

[5.](#body-ref-sref5 "View in article")

Balachandran, V.P. ∙ Łuksza, M. ∙ Zhao, J.N....

**Identification of unique neoantigen qualities in long-term survivors of pancreatic cancer**

*Nature.* 2017; **551**:512-516

[6.](#body-ref-sref6-1 "View in article")

Ma, J. ∙ Fong, S.H. ∙ Luo, Y....

**Few-shot learning creates predictive models of drug response that translate from high-throughput screens to individual patients**

*Nat. Cancer.* 2021; **2**:233-244

[7.](#body-ref-sref7-1 "View in article")

Mundi, P.S. ∙ Dela Cruz, F.S. ∙ Grunn, A....

**A Transcriptome-Based Precision Oncology Platform for Patient-Therapy Alignment in a Diverse Set of Treatment-Resistant Malignancies**

*Cancer Discov.* 2023; **13**:1386-1407

[9.](#body-ref-sref9-1 "View in article")

Jamison, J.K. ∙ Zhou, M. ∙ Gelmann, E.P....

**Entinostat in patients with relapsed or refractory abdominal neuroendocrine tumors**

*Oncologist.* 2024; **29**:817-e1213

[11.](#body-ref-sref11 "View in article")

van ’t Veer, L.J. ∙ Dai, H. ∙ van de Vijver, M.J....

**Gene expression profiling predicts clinical outcome of breast cancer**

*Nature.* 2002; **415**:530-536

[12.](#body-ref-sref12 "View in article")

Bunne, C. ∙ Roohani, Y. ∙ Rosen, Y....

**How to build the virtual cell with artificial intelligence: Priorities and opportunities**

*Cell.* 2024; **187**:7045-7063

[13.](#body-ref-sref13 "View in article")

Pappalardo, F. ∙ Russo, G. ∙ Tshinanu, F.M....

**In silico clinical trials: concepts and early adoptions**

*Brief. Bioinform.* 2019; **20**:1699-1708

[14.](#body-ref-sref14 "View in article")

Björnsson, B. ∙ Borrebaeck, C. ∙ Elander, N....

**Digital twins to personalize medicine**

*Genome Med.* 2019; **12**:4

[15.](#body-ref-sref15 "View in article")

Jirsa, V. ∙ Wang, H. ∙ Triebkorn, P....

**Personalised virtual brain models in epilepsy**

*Lancet Neurol.* 2023; **22**:443-454

[16.](#body-ref-sref16-1 "View in article")

Jumper, J. ∙ Evans, R. ∙ Pritzel, A....

**Highly accurate protein structure prediction with AlphaFold**

*Nature.* 2021; **596**:583-589

[17.](#body-ref-sref17 "View in article")

Watson, J.L. ∙ Juergens, D. ∙ Bennett, N.R....

**De novo design of protein structure and function with RFdiffusion**

*Nature.* 2023; **620**:1089-1100

[18.](#body-ref-sref18 "View in article")

Saka, K. ∙ Kakuzaki, T. ∙ Metsugi, S....

**Antibody design using LSTM based deep generative model from phage display library for affinity maturation**

*Sci. Rep.* 2021; **11**, 5852

[19.](#body-ref-sref19 "View in article")

Jespersen, M.C. ∙ Peters, B. ∙ Nielsen, M....

**BepiPred-2.0: improving sequence-based B-cell epitope prediction using conformational epitopes**

*Nucleic Acids Res.* 2017; **45**:W24-W29

[20.](#body-ref-sref20 "View in article")

Li, F. ∙ Qian, X. ∙ Zhu, X....

**TCRcost: a deep learning model utilizing TCR 3D structure for enhanced of TCR-peptide binding**

*Front. Genet.* 2024; **15**, 1346784

[21.](#body-ref-sref21 "View in article")

Sussman, J.L. ∙ Lin, D. ∙ Jiang, J....

**Protein Data Bank (PDB): database of three-dimensional structural information of biological macromolecules**

*Acta Crystallogr. D Biol. Crystallogr.* 1998; **54**:1078-1084

[22.](#body-ref-sref22-1 "View in article")

Honig, B. ∙ Cohen, F.E.

**Adding backbone to protein folding: why proteins are polypeptides**

*Fold. Des.* 1996; **1**:R17-R20

[23.](#body-ref-sref23-1 "View in article")

Peña, O.A. ∙ Martin, P.

**Cellular and molecular mechanisms of skin wound healing**

*Nat. Rev. Mol. Cell Biol.* 2024; **25**:599-616

[24.](#body-ref-sref24-1 "View in article")

Janeway, C.A. ∙ Medzhitov, R.

**Innate immune recognition**

*Annu. Rev. Immunol.* 2002; **20**:197-216

[25.](#body-ref-sref25-1 "View in article")

Ribas, A. ∙ Wolchok, J.D.

**Cancer immunotherapy using checkpoint blockade**

*Science.* 2018; **359**:1350-1355

[26.](#body-ref-sref26-1 "View in article")

Rosenblum, M.D. ∙ Remedios, K.A. ∙ Abbas, A.K.

**Mechanisms of human autoimmunity**

*J. Clin. Invest.* 2015; **125**:2228-2233

[27.](#body-ref-sref27-1 "View in article")

Galli, S.J. ∙ Tsai, M.

**IgE and mast cells in allergic disease**

*Nat. Med.* 2012; **18**:693-704

[28.](#body-ref-sref28-1 "View in article")

Heneka, M.T. ∙ Carson, M.J. ∙ El Khoury, J....

**Neuroinflammation in Alzheimer’s disease**

*Lancet Neurol.* 2015; **14**:388-405

[29.](#body-ref-sref29-1 "View in article")

López-Otín, C. ∙ Blasco, M.A. ∙ Partridge, L....

**Hallmarks of aging: An expanding universe**

*Cell.* 2023; **186**:243-278

[30.](#body-ref-sref30-1 "View in article")

Lei, Y. ∙ Tsang, J.S.

**Systems Human Immunology and AI: Immune Setpoint and Immune Health**

*Annu. Rev. Immunol.* 2025; **43**:693-722

[31.](#body-ref-sref31 "View in article")

Human Immunome Project. (2026). A New Model for Human Health (Human Immunome Project). [https://www.humanimmunomeproject.org/](https://www.humanimmunomeproject.org/).

[Google Scholar](https://scholar.google.com/scholar?q=Human+Immunome+Project.+%282026%29.+A+New+Model+for+Human+Health+%28Human+Immunome+Project%29.+https%3A%2F%2Fwww.humanimmunomeproject.org%2F.)

[32.](#body-ref-sref32 "View in article")

Tuckerman, M. ∙ Berne, B.J. ∙ Martyna, G.J.

**Reversible multiple time scale molecular dynamics**

*J. Chem. Phys.* 1992; **97**:1990-2001

[33.](#body-ref-sref33 "View in article")

Svensson, V. ∙ Gayoso, A. ∙ Yosef, N....

**Interpretable factor models of single-cell RNA-seq via variational autoencoders**

*Bioinformatics.* 2020; **36**:3418-3421

[34.](#body-ref-sref34-1 "View in article")

Wang, K. ∙ Saito, M. ∙ Bisikirska, B.C....

**Genome-wide identification of post-translational modulators of transcription factor activity in human B cells**

*Nat. Biotechnol.* 2009; **27**:829-839

[35.](#body-ref-sref35 "View in article")

Ban, N. ∙ Beckmann, R. ∙ Cate, J.H.D....

**A new system for naming ribosomal proteins**

*Curr. Opin. Struct. Biol.* 2014; **24**:165-169

[36.](#body-ref-sref36 "View in article")

Allis, C.D. ∙ Jenuwein, T.

**The molecular hallmarks of epigenetic control**

*Nat. Rev. Genet.* 2016; **17**:487-500

[37.](#body-ref-sref37 "View in article")

Spitz, F. ∙ Furlong, E.E.M.

**Transcription factors: from enhancer binding to developmental control**

*Nat. Rev. Genet.* 2012; **13**:613-626

[38.](#body-ref-sref38 "View in article")

Franceschini, A. ∙ Szklarczyk, D. ∙ Frankild, S....

**STRING v9.1: protein-protein interaction networks, with increased coverage and integration**

*Nucleic Acids Res.* 2013; **41**:D808-D815

[39.](#body-ref-sref39 "View in article")

Zhang, Q.C. ∙ Petrey, D. ∙ Deng, L....

**Structure-based prediction of protein-protein interactions on a genome-wide scale**

*Nature.* 2012; **490**:556-560

[40.](#body-ref-sref40-1 "View in article")

ENCODE Project Consortium

**An integrated encyclopedia of DNA elements in the human genome**

*Nature.* 2012; **489**:57-74

[41.](#body-ref-sref41 "View in article")

Basso, K. ∙ Margolin, A.A. ∙ Stolovitzky, G....

**Reverse engineering of regulatory networks in human B cells**

*Nat. Genet.* 2005; **37**:382-390

[42.](#body-ref-sref42-1 "View in article")

Morris, S.A. ∙ Cahan, P. ∙ Li, H....

**Dissecting engineered cell types and enhancing cell fate conversion via CellNet**

*Cell.* 2014; **158**:889-902

[43.](#body-ref-sref43 "View in article")

Califano, A. ∙ Butte, A.J. ∙ Friend, S....

**Leveraging models of cell regulation and GWAS data in integrative network-based association studies**

*Nat. Genet.* 2012; **44**:841-847

[44.](#body-ref-sref44 "View in article")

Califano, A. ∙ Alvarez, M.J.

**The recurrent architecture of tumour initiation, progression and drug sensitivity**

*Nat. Rev. Cancer.* 2017; **17**:116-130

[45.](#body-ref-sref45-1 "View in article")

Bansal, M. ∙ Yang, J. ∙ Karan, C....

**A community computational challenge to predict the activity of pairs of compounds**

*Nat. Biotechnol.* 2014; **32**:1213-1222

[46.](#body-ref-sref46-1 "View in article")

Woo, J.H. ∙ Shimoni, Y. ∙ Yang, W.S....

**Elucidating Compound Mechanism of Action by Network Perturbation Analysis**

*Cell.* 2015; **162**:441-451

[47.](#body-ref-sref47 "View in article")

Zhang, M. ∙ Swamy, V. ∙ Cassius, R....

**GREmLN: A Cellular Graph Structure Aware Transcriptomics Foundation Model**

Preprint at *bioRxiv.* 2026;

[48.](#body-ref-sref48 "View in article")

Sutton, R. (2019). The Bitter Lesson. [http://www.incompleteideas.net/IncIdeas/BitterLesson.html](http://www.incompleteideas.net/IncIdeas/BitterLesson.html).

[Google Scholar](https://scholar.google.com/scholar?q=Sutton%2C+R.+%282019%29.+The+Bitter+Lesson.+http%3A%2F%2Fwww.incompleteideas.net%2FIncIdeas%2FBitterLesson.html.)

[49.](#body-ref-sref49 "View in article")

CZI Cell Science Program ∙ Abdulla, S. ∙ Aevermann, B....

**CZ CELLxGENE Discover: a single-cell data platform for scalable exploration, analysis and modeling of aggregated data**

*Nucleic Acids Res.* 2025; **53**:D886-D900

[50.](#body-ref-sref50-1 "View in article")

Dibaeinia, P. ∙ German, C. ∙ Shringarpure, S....

**PRSformer: Disease Prediction from Million-Scale Individual Genotypes**

Preprint at *bioRxiv.* 2025;

[51.](#body-ref-sref51 "View in article")

Ahlmann-Eltze, C. ∙ Huber, W. ∙ Anders, S.

**Deep-learning-based gene perturbation effect prediction does not yet outperform simple linear baselines**

*Nat. Methods.* 2025; **22**:1657-1661

[52.](#body-ref-sref52 "View in article")

Cohen, J.

**The earth is round (p <.05)**

*Am. Psychol.* 1994; **49**:997-1003

[53.](#body-ref-sref53 "View in article")

Brown, D.

**DECIPHERING THE MESSAGE OF LIFE’S ASSEMBLY**

The Washington Post, 1995

[https://www.washingtonpost.com/archive/politics/1995/10/01/deciphering-the-message-of-lifes-assembly/77b12f3e-5652-4f08-af3e-1733b4a0ae6b/](https://www.washingtonpost.com/archive/politics/1995/10/01/deciphering-the-message-of-lifes-assembly/77b12f3e-5652-4f08-af3e-1733b4a0ae6b/)

[Google Scholar](https://scholar.google.com/scholar?q=D.BrownDECIPHERING+THE+MESSAGE+OF+LIFE%E2%80%99S+ASSEMBLY1995The+Washington+Posthttps%3A%2F%2Fwww.washingtonpost.com%2Farchive%2Fpolitics%2F1995%2F10%2F01%2Fdeciphering-the-message-of-lifes-assembly%2F77b12f3e-5652-4f08-af3e-1733b4a0ae6b%2F)

[54.](#body-ref-sref54 "View in article")

Moult, J. ∙ Pedersen, J.T. ∙ Judson, R....

**A large-scale experiment to assess protein structure prediction methods**

*Proteins.* 1995; **23**

ii-v

[55.](#body-ref-sref55 "View in article")

Stolovitzky, G. ∙ Monroe, D. ∙ Califano, A.

**Dialogue on reverse-engineering assessment and methods: the DREAM of high-throughput pathway inference**

*Ann. N. Y. Acad. Sci.* 2007; **1115**:1-22

[56.](#body-ref-sref56 "View in article")

Hilbert, D.

**Mathematical Problems**

DigiCat, 2022

[Google Scholar](https://scholar.google.com/scholar?q=D.HilbertMathematical+Problems2022DigiCat)

[57.](#body-ref-sref57 "View in article")

Carlson, J. ∙ Jaffe, A. ∙ Wiles, A.

**The Millennium Prize Problems**

American Mathematical Society, Clay Mathematics Institute, 2023

[Google Scholar](https://scholar.google.com/scholar?q=J.CarlsonA.JaffeA.WilesThe+Millennium+Prize+Problems2023American+Mathematical+Society%2C+Clay+Mathematics+Institute)

[58.](#body-ref-optGGz1q4lWF5 "View in article")

Prioleau, H. ∙ Aryal, S.K. ∙ Blackstone, J.

**Leveraging Large Language Models for Adverse Drug Event Detection: A Comparative Study of Token and Span-Based Named Entity Recognition**

*Pacific Symposium on Biocomputing.* 2026; **31**:205-218

[https://doi.org/10.1142/9789819824755\_0015](https://doi.org/10.1142/9789819824755_0015)

[PubMed](https://pubmed.ncbi.nlm.nih.gov/41758143/)

[Google Scholar](https://scholar.google.com/scholar_lookup?pmid=41758143)

[59.](#body-ref-sref58-1 "View in article")

Sparks, R. ∙ Rachmaninoff, N. ∙ Lau, W.W....

**A unified metric of human immune health**

*Nat. Med.* 2024; **30**:2461-2472

[60.](#body-ref-sref59-1 "View in article")

Kotliarov, Y. ∙ Sparks, R. ∙ Martins, A.J....

**Broad immune activation underlies shared set point signatures for vaccine responsiveness in healthy individuals and disease activity in patients with lupus**

*Nat. Med.* 2020; **26**:618-629

[61.](#body-ref-sref60-1 "View in article")

Tsang, J.S. ∙ Schwartzberg, P.L. ∙ Kotliarov, Y....

*Cell.* 2014; **157**:499-513

[62.](#body-ref-opthjaWfKPYYF-1 "View in article")

Avsec, Ž. ∙ Agarwal, V. ∙ Visentin, D....

**Effective gene expression prediction from sequence by integrating long-range interactions**

*Nature Methods.* 2021; **18**:1196-1203

[https://doi.org/10.1038/s41592-021-01252-x](https://doi.org/10.1038/s41592-021-01252-x)

[63.](#body-ref-optgtjt5lM2IX "View in article")

Lin, J. ∙ Li, Z. ∙ Zhao, Y....

**EPInformer: scalable and integrative prediction of gene expression from promoter-enhancer sequences with multimodal epigenomic profiles**

*Nature Communications.* 2026; **17** (1):3975

[https://doi.org/10.1038/s41467-026-70535-8](https://doi.org/10.1038/s41467-026-70535-8)

[64.](#body-ref-optkW0TrCyfNh "View in article")

Pampari, A. ∙ Shcherbina, A. ∙ Kvon, E.Z....

**ChromBPNet: bias factorized, base-resolution deep learning models of chromatin accessibility reveal cis-regulatory sequence syntax, transcription factor footprints and regulatory variants**

*bioRxiv.* 2025;

[https://doi.org/10.1101/2024.12.25.630221](https://doi.org/10.1101/2024.12.25.630221)

[PubMed](https://pubmed.ncbi.nlm.nih.gov/39829783/)

[Google Scholar](https://scholar.google.com/scholar_lookup?pmid=39829783)

[65.](#body-ref-opt7D3mwa72sZ-1 "View in article")

Skene, P.J. ∙ Henikoff, S.

**An efficient targeted nuclease strategy for high-resolution mapping of DNA binding sites**

*eLife.* 2017; **6**, e21856

[https://doi.org/10.7554/eLife.21856](https://doi.org/10.7554/eLife.21856)

[66.](#body-ref-optXcRXBNdbYv "View in article")

Zhou, J. ∙ Troyanskaya, O.G.

**Predicting effects of noncoding variants with deep learning-based sequence model**

*Nature Methods.* 2015; **12** (10):931-934

[https://doi.org/10.1038/nmeth.3547](https://doi.org/10.1038/nmeth.3547)

[67.](#body-ref-optQEZkTxJBEj "View in article")

Chen, K.M. ∙ Wong, A.K. ∙ Troyanskaya, O.G....

**A sequence-based global map of regulatory activity for deciphering human genetics**

*Nature Genetics.* 2022; **54** (7):940-949

[https://doi.org/10.1038/s41588-022-01102-2](https://doi.org/10.1038/s41588-022-01102-2)

[68.](#body-ref-optC2ZbxlsJWj "View in article")

Browaeys, R. ∙ Saelens, W. ∙ Saeys, Y.

**NicheNet: modeling intercellular communication by linking ligands to target genes**

*Nature Methods.* 2020; **17** (2):159-162

[https://doi.org/10.1038/s41592-019-0667-5](https://doi.org/10.1038/s41592-019-0667-5)

[69.](#body-ref-opty0bNvHByZC "View in article")

Jin, S. ∙ Guerrero-Juarez, C.F. ∙ Zhang, L....

**Inference and analysis of cell-cell communication using CellChat**

*Nature Communications.* 2021; **12** (1):1088

[https://doi.org/10.1038/s41467-021-21246-9](https://doi.org/10.1038/s41467-021-21246-9)

[70.](#body-ref-optBokgIrYufU "View in article")

Cang, Z. ∙ Zhao, Y. ∙ Almet, A.A....

**Screening cell-cell communication in spatial transcriptomics via collective optimal transport**

*Nature Methods.* 2023; **20** (2):218-228

[https://doi.org/10.1038/s41592-022-01728-4](https://doi.org/10.1038/s41592-022-01728-4)

[71.](#body-ref-opt82epmRAQBW "View in article")

Mishra, V. ∙ Re, D.B. ∙ Le Verche, V....

**Systematic elucidation of neuron-astrocyte interaction in models of amyotrophic lateral sclerosis using multi-modal integrated bioinformatics workflow**

*Nature Communications.* 2020; **11** (1):5579

[https://doi.org/10.1038/s41467-020-19177-y](https://doi.org/10.1038/s41467-020-19177-y)

[72.](#body-ref-optr3ip61reo5 "View in article")

Dimitrov, D. ∙ Türei, D. ∙ Garrido-Rodriguez, M....

**Comparison of methods and resources for cell-cell communication inference from single-cell RNA-Seq data**

*Nature Communications.* 2022; **13** (1):3224

[https://doi.org/10.1038/s41467-022-30755-0](https://doi.org/10.1038/s41467-022-30755-0)

[73.](#body-ref-sref61-1 "View in article")

Choi, J. ∙ Chen, W. ∙ Minkina, A....

**A time-resolved, multi-symbol molecular recorder via sequential genome editing**

*Nature.* 2022; **608**:98-107

[74.](#body-ref-optXOCbKV3JsB "View in article")

Weinberg, B.H. ∙ Pham, N.T.H. ∙ Caraballo, L.D....

**Large-scale design of robust genetic circuits with multiple inputs and outputs for mammalian cells**

*Nature Biotechnology.* 2017; **35** (5):453-462

[https://doi.org/10.1038/nbt.3805](https://doi.org/10.1038/nbt.3805)

[75.](#body-ref-optv0lOVMSAwP "View in article")

Nielsen, A.A. ∙ Der, B.S. ∙ Shin, J....

**Genetic circuit design automation**

*Science.* 2016; **352** (6281):aac7341

[https://doi.org/10.1126/science.aac7341](https://doi.org/10.1126/science.aac7341)

[76.](#body-ref-optk3ab3IOxvL "View in article")

Watanabe, L. ∙ Nguyen, T. ∙ Zhang, M....

**iBioSim 3: A Tool for Model-Based Genetic Circuit Design**

*ACS Synthetic Biology.* 2019; **8** (7):1560-1563

[https://doi.org/10.1021/acssynbio.8b00078](https://doi.org/10.1021/acssynbio.8b00078)

[77.](#body-ref-optIQmi5KBSWt "View in article")

Notin, P. ∙ Kollasch, A.W. ∙ Ritter, D....

**ProteinGym: Large-Scale Benchmarks for Protein Design and Fitness Prediction**

*bioRxiv.* 2023;

[https://doi.org/10.1101/2023.12.07.570727](https://doi.org/10.1101/2023.12.07.570727)

[Google Scholar](https://scholar.google.com/scholar?q=P.NotinA.W.KollaschD.RitterL.van+NiekerkS.PaulH.SpinnerN.RollinsA.ShawR.WeitzmanJ.FrazerProteinGym%3A+Large-Scale+Benchmarks+for+Protein+Design+and+Fitness+PredictionbioRxiv2023https%3A%2F%2Fdoi.org%2F10.1101%2F2023.12.07.570727)

[78.](#body-ref-optNYodYNDJsR "View in article")

Kircher, M. ∙ Witten, D.M. ∙ Jain, P....

**A general framework for estimating the relative pathogenicity of human genetic variants**

*Nature Genetics.* 2014; **46** (3):310-315

[https://doi.org/10.1038/ng.2892](https://doi.org/10.1038/ng.2892)

[79.](#body-ref-optzEoQUVA1vX "View in article")

Frazer, J. ∙ Notin, P. ∙ Dias, M....

**Disease variant prediction with deep generative models of evolutionary data**

*Nature.* 2021; **599** (7883):91-95

[https://doi.org/10.1038/s41586-021-04043-8](https://doi.org/10.1038/s41586-021-04043-8)

[80.](#body-ref-opt2Hcb9yHGWL "View in article")

Meier, J. ∙ Rao, R. ∙ Verkuil, R....

**Language models enable zero-shot prediction of the effects of mutations on protein function**

*Advances in Neural Information Processing Systems.* 2021; **34**

[Crossref](https://doi.org/10.5555/3540261.3542504)

[Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.5555%2F3540261.3542504)

[81.](#body-ref-optoCjvfQeCMJ "View in article")

Tagore, S. ∙ Tsang, S. ∙ Tangermann, C....

**Pan-cancer inference and validation of hypermorphic, hypomorphic and neomorphic mutations**

*Nature Genetics.* 2026; **58** (2):329-340

[https://doi.org/10.1038/s41588-025-02482-x](https://doi.org/10.1038/s41588-025-02482-x)

[82.](#body-ref-optkVMRLAnCkr "View in article")

Cheng, J. ∙ Novati, G. ∙ Pan, J....

**Accurate proteome-wide missense variant effect prediction with AlphaMissense**

*Science.* 2023; **381** (6664):eadg7492

[https://doi.org/10.1126/science.adg7492](https://doi.org/10.1126/science.adg7492)

[83.](#body-ref-optez9BdqkjbK "View in article")

Alvarez, M.J. ∙ Shen, Y. ∙ Giorgi, F.M....

**Functional characterization of somatic mutations in cancer using network-based inference of protein activity**

*Nature Genetics.* 2016; **48**:838-847

[https://doi.org/10.1038/ng.3593](https://doi.org/10.1038/ng.3593)

[84.](#body-ref-optqrtx8TrYbn "View in article")

Duan, Q. ∙ Reid, S.P. ∙ Clark, N.R....

**L1000CDS <sup>2</sup>: LINCS L1000 characteristic direction signatures search engine**

*NPJ Systems Biology and Applications.* 2016; **2**:16015

[https://doi.org/10.1038/npjsba.2016.15](https://doi.org/10.1038/npjsba.2016.15)

[85.](#body-ref-sref62-1 "View in article")

Hu, L.Z. ∙ Hirschhorn, T. ∙ Douglass, E....

**Elucidating Compound Mechanism of Action and Polypharmacology with a Large-scale Perturbational Profile Compendium**

Preprint at *bioRxiv.* 2025;

[86.](#body-ref-opt3s4ZOFEhW1 "View in article")

Klaeger, S. ∙ Heinzlmeir, S. ∙ Wilhelm, M....

**The target landscape of clinical kinase drugs**

*Science.* 2017; **358** (6367):eaan4368

[https://doi.org/10.1126/science.aan4368](https://doi.org/10.1126/science.aan4368)

[87.](#body-ref-optY9TmBwW6XR "View in article")

Reinecke, M. ∙ Brear, P. ∙ Vornholz, L....

**Chemical proteomics reveals the target landscape of 1,000 kinase inhibitors**

*Nature Chemical Biology.* 2024; **20** (5):577-585

[https://doi.org/10.1038/s41589-023-01459-3](https://doi.org/10.1038/s41589-023-01459-3)

[88.](#body-ref-optJZv15rzBfp "View in article")

Savitski, M.M. ∙ Reinhard, F.B. ∙ Franken, H....

**Tracking cancer drugs in living cells by thermal profiling of the proteome**

*Science.* 2014; **346** (6205):1255784

[https://doi.org/10.1126/science.1255784](https://doi.org/10.1126/science.1255784)

[89.](#body-ref-opt3QNmowkMRb-1 "View in article")

Hutchison, 3rd, C.A. ∙ Chuang, R.Y. ∙ Noskov, V.N....

**Design and synthesis of a minimal bacterial genome**

*Science.* 2016; **351** (6280):aad6253

[https://doi.org/10.1126/science.aad6253](https://doi.org/10.1126/science.aad6253)

[90.](#body-ref-optkcArEeNLfa "View in article")

Kong, X. ∙ Zhu, B. ∙ Stone, V.N....

**ePath: an online database towards comprehensive essential gene annotation for prokaryotes**

*Scientific Reports.* 2019; **9** (1):12949

[https://doi.org/10.1038/s41598-019-49098-w](https://doi.org/10.1038/s41598-019-49098-w)

[91.](#body-ref-optDd8Ms5AbbB "View in article")

Zhang, X. ∙ Xiao, W. ∙ Xiao, W.

**DeepHE: Accurately predicting human essential genes based on deep learning**

*PLoS Computational Biology.* 2020; **16** (9), e1008229

[https://doi.org/10.1371/journal.pcbi.1008229](https://doi.org/10.1371/journal.pcbi.1008229)

[92.](#body-ref-opthtbk81VWYY "View in article")

Hart, T. ∙ Chandrashekhar, M. ∙ Aregger, M....

**High-Resolution CRISPR Screens Reveal Fitness Genes and Genotype-Specific Cancer Liabilities**

*Cell.* 2015; **163** (6):1515-1526

[https://doi.org/10.1016/j.cell.2015.11.015](https://doi.org/10.1016/j.cell.2015.11.015)

[93.](#body-ref-optTb8bAfQQuN-1 "View in article")

Weinreb, C. ∙ Rodriguez-Fraticelli, A. ∙ Camargo, F.D....

**Lineage tracing on transcriptional landscapes links state to fate during differentiation**

*Science.* 2020; **367** (6479):eaaw3381

[https://doi.org/10.1126/science.aaw3381](https://doi.org/10.1126/science.aaw3381)

[94.](#body-ref-optm6DCt7mwDz "View in article")

Calvo Fernández, E. ∙ Tomassoni, L. ∙ Zhang, X....

**Systematic design of combination therapy by targeting master regulators of coexisting diffuse midline glioma cell states**

*Nat Genet.* 2026; **58** (5):1112-1125

[95.](#body-ref-sref63-1 "View in article")

Arumugam, K. ∙ Shin, W. ∙ Schiavone, V....

**The Master Regulator Protein BAZ2B Can Reprogram Human Hematopoietic Lineage-Committed Progenitors into a Multipotent State**

*Cell Rep.* 2020; **33**, 108474

[96.](#body-ref-optdPY5pVieeM "View in article")

Rackham, O.J. ∙ Firas, J. ∙ Fang, H....

**A predictive computational framework for direct reprogramming between human cell types**

*Nature Genetics.* 2016; **48** (3):331-335

[https://doi.org/10.1038/ng.3487](https://doi.org/10.1038/ng.3487)

[97.](#body-ref-optWqmppqDExy "View in article")

Yeo, G.H.T. ∙ Saksena, S.D. ∙ Gifford, D.K.

**Generative modeling of single-cell time series with PRESCIENT enables prediction of cell trajectories with interventions**

*Nature Communications.* 2021; **12** (1):3222

[https://doi.org/10.1038/s41467-021-23518-w](https://doi.org/10.1038/s41467-021-23518-w)

[98.](#body-ref-opt72rG0fzONo "View in article")

Replogle, J.M. ∙ Saunders, R.A. ∙ Pogson, A.N....

**Mapping information-rich genotype-phenotype landscapes with genome-scale Perturb-seq**

*Cell.* 2022; **185** (14):2559-2575.e28

[https://doi.org/10.1016/j.cell.2022.05.013](https://doi.org/10.1016/j.cell.2022.05.013)

[99.](#body-ref-optTzB67PNHi8 "View in article")

Dasika, M.S. ∙ Maranas, C.D.

**OptCircuit: An optimization based method for computational design of genetic circuits**

*BMC Systems Biology.* 2008; **2**

[https://doi.org/10.1186/1752-0509-2-24](https://doi.org/10.1186/1752-0509-2-24)

[100.](#body-ref-optipYI6b6k7t "View in article")

Morsut, L. ∙ Roybal, K.T. ∙ Xiong, X....

**Engineering Customized Cell Sensing and Response Behaviors Using Synthetic Notch Receptors**

*Cell.* 2016; **164** (4):780-791

[https://doi.org/10.1016/j.cell.2016.01.012](https://doi.org/10.1016/j.cell.2016.01.012)

[101.](#body-ref-optRpsr2vMV2a "View in article")

Zhou, T. ∙ Reji, R. ∙ Kairon, R.S....

**A review of algorithmic approaches for cell culture media optimization**

*Frontiers in Bioengineering and Biotechnology.* 2023; **11**:1195294

[https://doi.org/10.3389/fbioe.2023.1195294](https://doi.org/10.3389/fbioe.2023.1195294)

[102.](#body-ref-optPeKBZ3CzsA "View in article")

Ryoo, H. ∙ Kimmel, H. ∙ Rondo, E....

**Advances in high throughput cell culture technologies for therapeutic screening and biological discovery applications**

*Bioengineering & Translational Medicine.* 2023; **9** (3), e10627

[https://doi.org/10.1002/btm2.10627](https://doi.org/10.1002/btm2.10627)

[103.](#body-ref-optxuaBZR4TAf "View in article")

Tiemeijer, B.M. ∙ Sweep, M.W.D. ∙ Sleeboom, J.J.F....

**Probing Single-Cell Macrophage Polarization and Heterogeneity Using Thermo-Reversible Hydrogels in Droplet-Based Microfluidics**

*Frontiers in Bioengineering and Biotechnology.* 2021; **9**:715408

[https://doi.org/10.3389/fbioe.2021.715408](https://doi.org/10.3389/fbioe.2021.715408)

[104.](#body-ref-optq5OHAh2v1E "View in article")

Cohen, J.D. ∙ Li, L. ∙ Wang, Y....

**Detection and localization of surgically resectable cancers with a multi-analyte blood test**

*Science.* 2018; **359** (6378):926-930

[https://doi.org/10.1126/science.aar3247](https://doi.org/10.1126/science.aar3247)

[105.](#body-ref-optVEnXwR2CJV "View in article")

Uhlen, M. ∙ Zhang, C. ∙ Lee, S....

**A pathology atlas of the human cancer transcriptome**

*Science.* 2017; **357** (6352):eaan2507

[https://doi.org/10.1126/science.aan2507](https://doi.org/10.1126/science.aan2507)

[106.](#body-ref-optkOvD09H7Yc "View in article")

Jain, S. ∙ Siramshetty, V.B. ∙ Alves, V.M....

**Large-Scale Modeling of Multispecies Acute Toxicity End Points Using Consensus of Multitask Deep Learning Methods**

*Journal of Chemical Information and Modeling.* 2021; **61** (2):653-663

[https://doi.org/10.1021/acs.jcim.0c01164](https://doi.org/10.1021/acs.jcim.0c01164)

[107.](#body-ref-opt4FDUoATAYE "View in article")

Feshuk, M. ∙ Kolaczkowski, L. ∙ Watford, S....

**ToxRefDB v2.1: update to curated *in vivo* study data in the Toxicity Reference Database**

*Frontiers in Toxicology.* 2023; **5**:1260305

[https://doi.org/10.3389/ftox.2023.1260305](https://doi.org/10.3389/ftox.2023.1260305)

[108.](#body-ref-optvLqFs1x7Jz "View in article")

Chen, M. ∙ Suzuki, A. ∙ Thakkar, S....

**DILIrank: the largest reference drug list ranked by the risk for developing drug-induced liver injury in humans**

*Drug Discovery Today.* 2016; **21** (4):648-653

[https://doi.org/10.1016/j.drudis.2016.02.015](https://doi.org/10.1016/j.drudis.2016.02.015)

[109.](#body-ref-opttLgHXyhjno "View in article")

Watkins, P.B.

**The DILI-sim Initiative: Insights into Hepatotoxicity Mechanisms and Biomarker Interpretation**

*Clinical and Translational Science.* 2019; **12** (2):122-129

[https://doi.org/10.1111/cts.12629](https://doi.org/10.1111/cts.12629)

[110.](#body-ref-optcvAn6AqzJz "View in article")

Banerjee, P. ∙ Kemmler, E. ∙ Dunkel, M....

**ProTox 3.0: a webserver for the prediction of toxicity of chemicals**

*Nucleic Acids Research.* 2024; **52** (W1):W513-W520

[https://doi.org/10.1093/nar/gkae303](https://doi.org/10.1093/nar/gkae303)

[111.](#body-ref-optukWCRzxslN "View in article")

Yang, W. ∙ Soares, J. ∙ Greninger, P....

**Genomics of Drug Sensitivity in Cancer (GDSC): a resource for therapeutic biomarker discovery in cancer cells**

*Nucleic Acids Research.* 2013; **41**:D955-D961

[https://doi.org/10.1093/nar/gks1111](https://doi.org/10.1093/nar/gks1111)

[112.](#body-ref-optn79ptyn35G "View in article")

Shalem, O. ∙ Sanjana, N.E. ∙ Hartenian, E....

**Genome-scale CRISPR-Cas9 knockout screening in human cells**

*Science.* 2014; **343** (6166):84-87

[https://doi.org/10.1126/science.1247005](https://doi.org/10.1126/science.1247005)

[113.](#body-ref-optSMLydXszUn "View in article")

Gao, H. ∙ Korn, J.M. ∙ Ferretti, S....

**High-throughput screening using patient-derived tumor xenografts to predict clinical trial drug response**

*Nature Medicine.* 2015; **21** (11):1318-1325

[https://doi.org/10.1038/nm.3954](https://doi.org/10.1038/nm.3954)

[114.](#body-ref-optNYjS8jVtQJ "View in article")

Diray-Arce, J. ∙ Miller, H.E.R. ∙ Henrich, E....

**The Immune Signatures data resource, a compendium of systems vaccinology datasets**

*Sci Data.* 2022; **9** (1):635

[115.](#body-ref-optzLFMyqyvJM "View in article")

Privé, F. ∙ Aschard, H. ∙ Carmi, S....

**Portability of 245 polygenic scores when derived from the UK Biobank and applied to 9 ancestry groups from the same cohort**

*American Journal of Human Genetics.* 2022; **109**:12-23

[https://doi.org/10.1016/j.ajhg.2021.11.008](https://doi.org/10.1016/j.ajhg.2021.11.008)

[116.](#body-ref-optj7vBI9cOHY "View in article")

Querec, T.D. ∙ Akondy, R.S. ∙ Lee, E.K....

**Systems biology approach predicts immunogenicity of the yellow fever vaccine in humans**

*Nature Immunology.* 2009; **10** (1):116-125

[https://doi.org/10.1038/ni.1688](https://doi.org/10.1038/ni.1688)

[117.](#body-ref-optr5ZXOC0xgZ "View in article")

Hagan, T. ∙ Gerritsen, B. ∙ Tomalin, L.E....

*Nature Immunology.* 2022; **23** (12):1788-1798

[https://doi.org/10.1038/s41590-022-01328-6](https://doi.org/10.1038/s41590-022-01328-6)

[119.](#body-ref-optApJS7D1rKr "View in article")

Nakaya, H.I. ∙ Wrammert, J. ∙ Lee, E.K....

**Systems biology of vaccination for seasonal influenza in humans**

*Nature Immunology.* 2011; **12** (8):786-795

[https://doi.org/10.1038/ni.2067](https://doi.org/10.1038/ni.2067)

[120.](#body-ref-optDn8vjgkrB6 "View in article")

Banchereau, R. ∙ Hong, S. ∙ Cantarel, B....

**Personalized Immunomonitoring Uncovers Molecular Networks that Stratify Lupus Patients**

*Cell.* 2016; **165** (6):1548-1550

[https://doi.org/10.1016/j.cell.2016.05.057](https://doi.org/10.1016/j.cell.2016.05.057)

[121.](#body-ref-sref64 "View in article")

Ahdritz, G. ∙ Bouatta, N. ∙ Floristean, C....

**OpenFold: retraining AlphaFold2 yields new insights into its learning mechanisms and capacity for generalization**

*Nat. Methods.* 2024; **21**:1514-1524

[122.](#body-ref-sref65 "View in article")

Hodi, F.S. ∙ O’Day, S.J. ∙ McDermott, D.F....

**Improved survival with ipilimumab in patients with metastatic melanoma**

*N. Engl. J. Med.* 2010; **363**:711-723

[123.](#body-ref-sref66 "View in article")

Topalian, S.L. ∙ Hodi, F.S. ∙ Brahmer, J.R....

**Safety, activity, and immune correlates of anti-PD-1 antibody in cancer**

*N. Engl. J. Med.* 2012; **366**:2443-2454

[124.](#body-ref-sref67 "View in article")

Sharma, P. ∙ Allison, J.P.

**The future of immune checkpoint therapy**

*Science.* 2015; **348**:56-61

[126.](#body-ref-sref69 "View in article")

McLane, L.M. ∙ Abdel-Hakeem, M.S. ∙ Wherry, E.J.

**CD8 T Cell Exhaustion During Chronic Viral Infection and Cancer**

*Annu. Rev. Immunol.* 2019; **37**:457-495

[127.](#body-ref-sref70-1 "View in article")

Obradovic, A. ∙ Ager, C. ∙ Turunen, M....

**Systematic elucidation and pharmacological targeting of tumor-infiltrating regulatory T cell master regulators**

*Cancer Cell.* 2023; **41**:933-949.e11

[128.](#body-ref-sref71 "View in article")

Takahashi, K. ∙ Yamanaka, S.

**Induction of pluripotent stem cells from mouse embryonic and adult fibroblast cultures by defined factors**

*Cell.* 2006; **126**:663-676

[129.](#body-ref-sref72 "View in article")

Porter, D.L. ∙ Levine, B.L. ∙ Kalos, M....

**Chimeric antigen receptor-modified T cells in chronic lymphoid leukemia**

*N. Engl. J. Med.* 2011; **365**:725-733

[130.](#body-ref-sref73 "View in article")

Frangoul, H. ∙ Locatelli, F. ∙ Sharma, A....

**Exagamglogene Autotemcel for Severe Sickle Cell Disease**

*N. Engl. J. Med.* 2024; **390**:1649-1662

[131.](#body-ref-sref74 "View in article")

Marks, P.W. ∙ Witten, C.M. ∙ Califf, R.M.

**Clarifying Stem-Cell Therapy’s Benefits and Risks**

*N. Engl. J. Med.* 2017; **376**:1007-1009

[132.](#body-ref-sref75 "View in article")

Holohan, C. ∙ Van Schaeybroeck, S. ∙ Longley, D.B....

**Cancer drug resistance: an evolving paradigm**

*Nat. Rev. Cancer.* 2013; **13**:714-726

[133.](#body-ref-sref76 "View in article")

Goossens, N. ∙ Nakagawa, S. ∙ Sun, X....

**Cancer biomarker discovery and validation**

*Transl. Cancer Res.* 2015; **4**:256-269

[134.](#body-ref-sref77 "View in article")

Toden, S. ∙ Zhuang, J. ∙ Acosta, A.D....

**Noninvasive characterization of Alzheimer’s disease by circulating, cell-free messenger RNA next-generation sequencing**

*Sci. Adv.* 2020; **6**, eabb1654

[135.](#body-ref-sref78 "View in article")

Ngo, T.T.M. ∙ Moufarrej, M.N. ∙ Rasmussen, M.H....

**Noninvasive blood tests for fetal development predict gestational age and preterm delivery**

*Science.* 2018; **360**:1133-1136

[136.](#body-ref-sref79 "View in article")

Álvez, M.B. ∙ Bergström, S. ∙ Kenrick, J....

**A human pan-disease blood atlas of the circulating proteome**

*Science.* 2025; **390**, eadx2678

[137.](#body-ref-sref80 "View in article")

Suntharalingam, G. ∙ Perry, M.R. ∙ Ward, S....

**Cytokine storm in a phase 1 trial of the anti-CD28 monoclonal antibody TGN1412**

*N. Engl. J. Med.* 2006; **355**:1018-1028

[138.](#body-ref-sref81 "View in article")

Tawbi, H.A. ∙ Schadendorf, D. ∙ Lipson, E.J....

**Relatlimab and Nivolumab versus Nivolumab in Untreated Advanced Melanoma**

*N. Engl. J. Med.* 2022; **386**:24-34

[139.](#body-ref-sref82 "View in article")

Laise, P. ∙ Bosker, G. ∙ Babor, M....

**Systematic identification and targeting of master regulator checkpoints (MRC) governing tumor microenvironment-mediated immune evasion**

*J. Immunother. Cancer.* 2025; **13**, e011355

[140.](#body-ref-sref83 "View in article")

Brodin, P. ∙ Davis, M.M.

**Human immune system variation**

*Nat. Rev. Immunol.* 2017; **17**:21-29

[141.](#body-ref-sref84 "View in article")

Duncan, D.E.

**How healthy am I? My immunome knows the score**

MIT Technology Review, 2025

[https://www.technologyreview.com/2025/10/09/1125376/how-healthy-am-i-my-immunome-knows-the-score/](https://www.technologyreview.com/2025/10/09/1125376/how-healthy-am-i-my-immunome-knows-the-score/)

[Google Scholar](https://scholar.google.com/scholar?q=D.E.DuncanHow+healthy+am+I%3F+My+immunome+knows+the+score2025MIT+Technology+Reviewhttps%3A%2F%2Fwww.technologyreview.com%2F2025%2F10%2F09%2F1125376%2Fhow-healthy-am-i-my-immunome-knows-the-score%2F)

[142.](#body-ref-sref85 "View in article")

Pereira, N.L. ∙ Ahmad, F. ∙ Byku, M....

**COVID-19: Understanding Inter-Individual Variability and Implications for Precision Medicine**

*Mayo Clin. Proc.* 2021; **96**:446-463

[143.](#body-ref-sref86 "View in article")

King, D.F. ∙ Groves, H. ∙ Weller, C....

**Realising the potential of correlates of protection for vaccine development, licensure and use: short summary**

*NPJ Vaccin.* 2024; **9**:82

[144.](#body-ref-sref87 "View in article")

Minhas, A.

**Clinical trial success rates by therapeutic area 2020**

Statista, 2026

[https://www.statista.com/statistics/1201162/clinical-trial-success-rates-by-therapeutic-area/](https://www.statista.com/statistics/1201162/clinical-trial-success-rates-by-therapeutic-area/)

[Google Scholar](https://scholar.google.com/scholar?q=A.MinhasClinical+trial+success+rates+by+therapeutic+area+20202026Statistahttps%3A%2F%2Fwww.statista.com%2Fstatistics%2F1201162%2Fclinical-trial-success-rates-by-therapeutic-area%2F)

[145.](#body-ref-sref88 "View in article")

Roadmap Epigenomics Consortium ∙ Kundaje, A. ∙ Meuleman, W....

**Integrative analysis of 111 reference human epigenomes**

*Nature.* 2015; **518**:317-330

[146.](#body-ref-sref89 "View in article")

Boehm, J.S. ∙ Garnett, M.J. ∙ Adams, D.J....

**Cancer research needs a better map**

*Nature.* 2021; **589**:514-516

[147.](#body-ref-sref90 "View in article")

Subramanian, A. ∙ Narayan, R. ∙ Corsello, S.M....

**A Next Generation Connectivity Map: L1000 Platform and the First 1,000,000 Profiles**

*Cell.* 2017; **171**:1437-1452.e17

[148.](#body-ref-sref91 "View in article")

Zhang, J. ∙ Ubas, A.A. ∙ de Borja, R....

**Tahoe-100M: A Giga-Scale Single-Cell Perturbation Atlas for Context-Dependent Gene Function and Cellular Modeling**

Preprint at *bioRxiv.* 2025;

[149.](#body-ref-sref92 "View in article")

Buchanan, A. ∙ Califano, A. ∙ Kahn, J....

**Pharmacogenetics: ethical issues and policy options**

*Kennedy Inst. Ethics J.* 2002; **12**:1-15