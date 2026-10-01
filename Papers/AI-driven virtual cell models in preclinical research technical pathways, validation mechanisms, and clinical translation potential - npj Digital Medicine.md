---
title: "AI-driven virtual cell models in preclinical research: technical pathways, validation mechanisms, and clinical translation potential - npj Digital Medicine"
source: "https://www.nature.com/articles/s41746-025-02198-6"
author:
  - "[[Chunyu Ma]]"
  - "[[Han Zhang]]"
  - "[[Yiwei Rao]]"
  - "[[Xinyu Jiang]]"
  - "[[Boheng Liu]]"
  - "[[Zhikang Sun]]"
  - "[[Zhenyu Song]]"
  - "[[Yuan Gao]]"
  - "[[Yuhao Cui]]"
  - "[[Xinyu Liu]]"
  - "[[Zedong Li]]"
published: 2025-12-10
created: 2026-10-01
description: "AI-driven virtual cell models show the potential to transform the paradigm of life sciences research by integrating multimodal omics data (e.g., single-cell transcriptomics and proteomics) with advanced algorithms such as deep generative models and graph neural networks to enable high-precision predictions of drug responses, gene perturbations, and disease progression. These models enable high-precision predictions of drug responses, gene perturbations, and disease progression. This review outlines the technical pathways and validation mechanisms of virtual cells, emphasizing a closed-loop workflow from computational evaluation to experimental verification using CRISPR assays and organoid platforms. The applications of virtual cells in personalized drug screening and disease modeling are highlighted, showcasing their potential to reduce animal testing and optimize therapy. However, challenges in regulatory acceptance, data privacy, and model interpretability remain. Global policy and standardization trends are driving clinical translation, and future advancements will involve cross-disciplinary integration and greater standardization to enhance the impact of virtual cells in precision medicine and drug discovery."
tags:
  - "clippings"
---
## Abstract

AI-driven virtual cell models show the potential to transform the paradigm of life sciences research by integrating multimodal omics data (e.g., single-cell transcriptomics and proteomics) with advanced algorithms such as deep generative models and graph neural networks to enable high-precision predictions of drug responses, gene perturbations, and disease progression. These models enable high-precision predictions of drug responses, gene perturbations, and disease progression. This review outlines the technical pathways and validation mechanisms of virtual cells, emphasizing a closed-loop workflow from computational evaluation to experimental verification using CRISPR assays and organoid platforms. The applications of virtual cells in personalized drug screening and disease modeling are highlighted, showcasing their potential to reduce animal testing and optimize therapy. However, challenges in regulatory acceptance, data privacy, and model interpretability remain. Global policy and standardization trends are driving clinical translation, and future advancements will involve cross-disciplinary integration and greater standardization to enhance the impact of virtual cells in precision medicine and drug discovery.

## Introduction

AI-driven virtual cell models present a paradigm-shifting prospect for life-science research by supporting mechanistic, predictive simulation of functional responses [^1] [^2] [^3]. A “Virtual Cell” is a computational model that simulates cellular functional states, signaling networks, and their dynamics under diverse perturbations [^1] [^4]. Compared with conventional computational cell models, AI-driven virtual cells learn latent patterns from large-scale, multimodal biological data to construct predictive cellular state spaces [^5] [^6]. Terminological fragmentation across the literature—spanning “virtual cell,” “digital cell,” and “digital twin”—drives our decision to foreground “virtual cell” as the field’s integrative label.

The emergence of this concept has been enabled by the rapid advancement of single-cell RNA sequencing (scRNA-seq), spatial transcriptomics (ST), proteomics, and other high-throughput omics, together with the introduction of novel Artificial Intelligence (AI) architectures such as deep generative models, graph neural networks, and physics-constrained neural networks [^7] [^8]. By integrating multi-omics data from diverse sources, virtual cell models can reconstruct functional networks and signaling pathways across multiple scales, including the subcellular, single-cell, and cell-population levels [^1].

In preclinical drug research before Investigational New Drug (IND) submission, virtual cell models already demonstrate diverse applications: by simulating gene knockout, overexpression, or mutation, they predict functional roles in disease progression and, in combination with CRISPR validation, help screen potential drug targets [^9]. In addition, these models can perform high-throughput in silico efficacy predictions across large candidate libraries to assess selectivity and potential adverse effects [^6] [^10]. During lead optimization, simulations of absorption, distribution, and metabolism provide predictions that more closely approximate human physiological contexts [^11] [^12]. Proof-of-concept, a multimodal single-cell virtual-cell model reconstructs mouse pancreatic ontogeny and validates NEUROD2-dependent ε-cell differentiation [^13]; at scale, State—trained on >10^8 cells—yields superior predictions of drug-response perturbations across cell types [^14]. Emerging practical utility of virtual cell models for mechanistic discovery and drug screening.

Virtual cell models also help elucidate tissue-specific differences in drug responses [^15]. For example, integrating multi-omics data from hepatocytes and renal tubular epithelial cells enables prediction of tissue-specific toxicological responses under the same drug exposure [^6]. This not only helps explain interindividual variability in adverse drug reactions but also offers a technical pathway to reduce animal experimentation and advance New Approach Methodologies (NAMs) [^6] [^16].

The advent of virtual cell models is shifting biomedicine from a wet-lab-dependent, “validation-driven” paradigm toward a data- and prediction-driven simulation–validation closed loop [^1] [^6]. In sum, AI-driven virtual cell models are becoming a key bridge between molecular-mechanism research and preclinical drug evaluation, providing data-driven support throughout the pipeline from hypothesis generation to mechanistic verification [^1] [^5]. Driven by an evidence-progression framework, the narrative advances from model construction to evaluation and validation, to virtual-cell use cases, translational barriers, and forward outlook. This translational driver integrates technical capability, testability, utility, and compliance pathways into a preclinical evidence chain (Fig. [1](https://www.nature.com/articles/s41746-025-02198-6#Fig1)).

![Fig. 1: Comprehensive Overview of AI-Driven Virtual Cell Models in Preclinical Research.](https://media.springernature.com/lw685/springer-static/image/art%3A10.1038%2Fs41746-025-02198-6/MediaObjects/41746_2025_2198_Fig1_HTML.png?as=webp)

Fig. 1: Comprehensive Overview of AI-Driven Virtual Cell Models in Preclinical Research.

## Technical Pathways

Precision virtual-cell construction sits at the forefront of the biology–AI nexus. Its core task is to integrate multimodal data, especially single-cell and spatial omics, thereby underpinning model development. Driven by complementary learners, deep generative models sculpt the cellular state space, graph neural networks capture intercellular interactions, and physics-informed neural networks embed biological laws, collectively shaping a virtual-cell model that delivers accurate predictions with defensible mechanistic interpretability.

### Multimodal data integration

A primary challenge in building high-precision virtual cell models is integrating heterogeneous biological modalities, including scRNA-seq, ST, epigenomics, proteomics, and metabolomics [^1] [^2]. Deep generative models and graph neural networks show strong potential for simulating single-cell states and predicting drug responses [^17], while physics-informed neural networks (PINNs) can enhance interpretability and biological plausibility [^16].

scRNA-seq resolves gene expression at single-cell resolution but loses spatial context [^18] [^19]; ST preserves spatial structure yet faces limits in resolution, throughput, and gene coverage [^20] [^21]. High-throughput imaging–driven advances in spatial transcriptomics now enable the simultaneous detection of ~20,000 genes, producing near-whole-transcriptome spatial maps and progressively mitigating the historical gene-coverage bottleneck of imaging-based ST [^22] [^23].

To bridge these gaps, AI-based cross-modal fusion methods have been proposed [^7] [^8] [^24] [^25] [^26] [^27]. For instance, SpatialScope uses deep generative modeling to project high-dimensional scRNA-seq data into ST coordinates, enhancing resolution and imputing missing genes [^7]. VAE (variational autoencoder)-based frameworks such as scVI and totalVI integrate multi-batch single-cell data and fuse transcriptome with proteome for joint denoising and analysis [^8] [^28]. Domain adaptation reduces cross-platform bias: scAdapt employs adversarial training to align distributions between ST and scRNA-seq, improving spatial deconvolution accuracy [^7] [^24]; conditional normalization and attention help detect rare cell types and low-abundance genes [^25] [^29]. On high-dimensional integration, MultiVI maps transcriptomic and epigenomic modalities into a shared latent space to improve cell-type classification, trajectory inference, and lineage analysis [^26]; GraphST couples graph structures with expression and spatial proximity to drive cell-type identification and spatial relationship reconstruction [^27].

Recent advances have led to a new wave of methods for integrating multi-omics data. For example, the GLUE (graph-linked unified embedding) model incorporates prior regulatory networks to project heterogeneous single-cell omics into a shared embedding space, achieving strong cross-species integration across millions of cells [^30]. Driven by optimal-transport–based coupling across modalities, the moscot framework collectively shapes single-cell multi-omics into coherent spatiotemporal developmental trajectories in the mouse, with its model-predicted key regulators validated experimentally [^13]. Moreover, a vision has been articulated for multimodal foundation models: that is, pretrained unified models that integrate genomics, transcriptomics, epigenomics, proteomics, metabolomics, and spatial omics to comprehensively characterize cellular states [^31]. Such models would enable context-specific transfer learning for panoramic single-cell atlasing.

These strategies enable virtual cells to integrate multilayer omics more comprehensively, forming richer, more accurate inputs for downstream drug response prediction, perturbation simulation, and mechanism inference [^1] [^2].

Large public databases provide critical training data [^32] [^33] [^34]: TCGA (The Cancer Genome Atlas) for tumor genomics/transcriptomics [^35] [^36]; the Human Protein Atlas (HPA) for tissue/cell-level protein localization [^37] [^38] [^39]; and GEO (Gene Expression Omnibus) for diverse omics datasets [^40] [^41] [^42]. All harbor inherent biases [^43] [^44] [^45] [^46]. Corrective techniques help: ComBat, Harmony, and related methods attenuate batch effects [^47] [^48] [^49]; domain adaptation (e.g., scAdapt) aligns distributions within models [^50]. Rigorous normalization and correction bolster generalization and reduce misleading predictions driven by data bias [^46] [^51] [^52] [^53] [^54] (see Table [1](https://www.nature.com/articles/s41746-025-02198-6#Tab1)).

**Table 1 Key data sources for virtual-cell modeling and typical uses**

### Omics foundation models and cross-hierarchical transfer

Foundation models for virtual cells trained on tens of millions of single cells deliver strong performance in cell-type annotation and gene-function inference (GeneFormer [^55]; scFoundation [^56]). Meanwhile, models that target complex genetic perturbations: GEARS [^57] and the Arc Institute’s State model [^58], exhibit measurable generalization across cell types. Driven by cross-scale knowledge transfer, the next critical task is to migrate capabilities learned at the gene/cell level to the patient level, where explicit modeling of tissue microenvironments, pharmacokinetics, and other systems constraints becomes indispensable. To this end, several studies use transfer learning to achieve cross-scale prediction: CODE-AE extends drug-response prediction from cell lines to patient tumor transcriptomes [^59], and scDEAL integrates population-level and single-cell data to improve individualized drug-sensitivity prediction [^60]. CSG2A, by leveraging condition-specific gene and gene-to-gene attention, pretrains on LINCS L1000 and fine-tunes on GDSC to transfer perturbation knowledge from the gene level to drug-response prediction in cells and patients, enhancing the interpretability of virtual-cell models [^61]. Together, these advances suggest that elevating gene-level pretraining to organ- and patient-level virtual models is feasible, provided that additional determinants—tissue context, ADME (absorption, distribution, metabolism, and excretion) processes, and related factors—are rigorously incorporated.

### Deep generative models

Deep generative models are central to constructing predictive and generative cellular state spaces [^1] [^17]. Beyond fitting high-dimensional data distributions, they can generate synthetic expression profiles in latent space for virtual experiments under drug perturbations or genetic edits [^5] [^17]. Recent work has simulated disease trajectories and drug responses; for example, the graph-structured VAE-GAN model UNAGI captured single-cell dynamics in idiopathic pulmonary fibrosis and predicted potential anti-fibrotic activity of nifedipine, validated in patient lung tissues and proteomics [^62]. Beyond classic frameworks such as VAEs, flow matching and diffusion models now define a new paradigm in generative modeling. Flow matching directly learns continuous-time transformations between data distributions to enable efficient generation of high-dimensional, structured data [^63]; diffusion models formalize noise injection and denoising inversion with stochastic differential equations, progressively approaching the target distribution, and have achieved notable advances in image generation and single-cell data simulation [^64] 。)Driven by diffusion dynamics coupled with a pretrained foundation model, scDiffusion generates single-cell transcriptomes with high fidelity and strong diversity [^65] [^66]. Pressure for cross–cell-type generalization drives model design: integrating perturbation data across lineages and enforcing priors from biological networks, mechanistically improves transfer to unseen perturbations. Against this backdrop, current deep learning approaches, in aggregate, do not surpass simple linear baselines by a large margin [^67], whereas a knowledge-graph-guided framework (GEARS) reports ~ 40% accuracy improvement for predicting transcriptional responses to multi-gene perturbations [^57]. Mechanism-anchored validation remains sparse; only a few virtual cell predictions have been confirmed via targeted interventions that verify model-nominated key regulators [^13]. Establishing standardized experimental validation pipelines should therefore be elevated as a field-level priority. Thus, generative models provide a powerful in silico experimental platform for hypothesis testing and therapeutic exploration [^1] (see Table [2](https://www.nature.com/articles/s41746-025-02198-6#Tab2)).

**Table 2 Common AI methods for virtual cell: tasks, I/O, and availability**

### Graph neural networks

Cells influence each other through signaling pathways, cell–cell communication networks, and spatial proximity [^2] [^29]. Biologically faithful virtual cells must model such topology and information flow [^1]. Graph neural networks (GNNs) naturally suit cell-relationship modeling in single-cell omics [^29]. Treating each cell as a node, GNNs iteratively aggregate neighborhood information to capture contextual dependencies [^68] [^69] [^70]. scGNN embeds scRNA-seq into a graph and applies multi-layer GCNs for feature aggregation, outperforming t-SNE (t-distributed Stochastic Neighbor Embedding)/UMAP (Uniform Manifold Approximation and Projection) for cell-type identification, imputation, and trajectory inference [^29].

For multimodal fusion, PINNACLE integrates scRNA-seq with protein–protein interaction networks via graph attention to better detect rare subpopulations and regulatory patterns [^71] [^72] [^73], aiding immune-cell subtyping and resistance mechanisms [^6]. GNNs also extend to drug response prediction [^74] [^75] [^76]. DrugCell-GNN unifies cellular transcriptomes, drug molecular graphs, and known target networks to predict sensitivity and synergy, improving accuracy in anticancer screening [^1] [^10]. With the rise of ST, SpaGCN couples spatial adjacency with expression matrices to resolve cell types and tissue organization, excelling in tumor microenvironment heterogeneity analyses [^7].

Overall, GNNs endow virtual cells with multiscale modeling, from single-cell regulatory patterns to population-level coordination [^1] [^2] [^77]. Integrating ST and live-cell imaging will further sharpen tissue-microenvironment realism and empower disease-mechanism and drug-development studies [^6] [^7].

### Physics-informed neural networks

Although deep learning models demonstrate powerful data fitting and generation capabilities in virtual cell simulations, most are “black-box” models that lack explicit expression and constraints of known biological laws. The core idea of Physics-Informed Neural Networks is to incorporate known biophysical laws, dynamic equations, or constraints during the model training process to ensure that the predicted results are biologically plausible [^16] [^78] [^79] [^80] [^81] [^82]. This approach combines theoretical models with data-driven deep networks, balancing flexibility and interpretability [^16].

In drug metabolism and toxicology simulations, the Virtual Cell-Based Assay (VCBA) platform combines organelle-level dynamic models (e.g., mitochondrial membrane potential changes, reactive oxygen species production) with dose-time integral models to simulate dynamic responses of hepatocytes and cardiomyocytes under drug exposure [^9] [^11]. These models have demonstrated high consistency with some in vitro experimental data and clinical adverse event reports in predicting drug-induced liver injury (DILI) and cardiotoxicity [^9] [^12]. Hybrid constraint methods are also a current trend [^83] [^84] [^85]. For example, integrating the Flux Balance Analysis (FBA) model of metabolic pathways with neural networks can improve prediction accuracy for environmental disturbance responses while maintaining metabolic flux conservation [^84]. Similarly, embedding the classic Hodgkin-Huxley equation of ion channel electrophysiology as a prior in cardiomyocyte models can more accurately predict drug-induced action potential changes [^85] [^86].

However, constructing PINNs still presents challenges [^1] [^6] [^16] [^87] [^88]. Predictive improvement in PINNs hinges on the completion of biophysical knowledge and the identification of kinetic parameters, rather than hardware scaling; incomplete laws and parameter gaps impose a hard ceiling. Mathematical descriptions of biological systems are often incomplete, and some dynamic parameters are difficult to obtain [^16]. The introduction of physical constraints increases the complexity of model training and sometimes conflicts with data fitting objectives, resulting in convergence difficulties [^1]. Furthermore, in a multi-scale, multi-modal data environment, selecting and weighting constraints appropriately is a key challenge in model design [^6] [^16]. With the improvement of computational hardware, PINNs are expected to become an important component of virtual cell models in the future [^1] [^6] [^16].

The various technical approaches mentioned above each have their own advantages, and in virtual cell modeling practices, they are not mutually exclusive but can work synergistically [^1]. Currently, the integration of multimodal data ensures comprehensive and high-quality input for the models [^89] [^90]. Next, deep generative models are used to establish baseline predictive capabilities for cell state spaces, such as generating cell transcriptomes under unseen perturbation conditions [^17] [^91]. Furthermore, a graph neural network module is introduced, and previous research has explored combining generative models, graph networks, and physical constraints to build more powerful integrated models [^62] [^92] [^93]. Despite the limitations of different methods, the comprehensive application of multiple techniques is expected to construct a more comprehensive and accurate virtual cell model [^1].

### Platforms and toolboxes at a glance

A compact landscape of virtual-cell and cell-scale modeling platforms now anchors the fourth technical route, spanning molecular networks, multicellular systems, and organ-level physiology (see Table [1](https://www.nature.com/articles/s41746-025-02198-6#Tab1)). These platforms can be broadly grouped by their core modeling targets and methodological foundations, each serving distinct research questions.

Driven by mechanistic representations of intracellular processes, several toolchains target gene regulation, signal transduction, and related pathways. VCell (Virtual Cell) provides a unified cell-biology environment that supports spatially resolved and well-mixed (nonspatial), deterministic and stochastic modeling, and it natively integrates image-analysis workflows [^94] [^95]. For quantitative kinetics, COPASI (Complex Pathway Simulator) specializes in ODE/SDE (stochastic differential equation)-based biochemical network modeling and parameter estimation [^96] [^97] [^98] [^99]. To address combinatorial explosion in rule-based signaling models, BioNetGen (BNG) [^100] [^101] [^102] and PySB [^103] enable compact specification of reaction rules and efficient state-space handling. Logic-network frameworks such as CellNOpt [^104] [^105] [^106] and the Cell Collective [^107] infer apoptosis signaling circuitry from perturbation datasets. Application-oriented platforms like VCBA focus on environmental toxicology and biokinetic simulation [^9] [^108] [^109].

At the multicellular and tissue scale, agent-based modeling (ABM) is widely used to capture population behaviors and tissue repair dynamics. PhysiCell emphasizes 3D, tissue-scale ABM and is particularly suited for simulating the tumor microenvironment [^110] [^111] [^112] [^113]. Guided by cell–cell mechanics and morphodynamics, CompuCell3D [^114] [^115] [^116] [^117] and Morpheus [^118] [^119] implement Cellular Potts/GGH frameworks that couple cell mechanics with reaction–diffusion processes.

Specialized engines and emerging AI tools further extend virtual-cell modeling. At the subcellular scale, Smoldyn [^120] [^121], MCell [^102], and ReaDDy [^122] [^123] perform particle-based stochastic reaction–diffusion, enabling molecular-level transport and interaction studies. For organ-system modeling, Chaste [^124], OpenCOR/CellML (Cell Markup Language) [^125] [^126], and OpenSim/Physiome [^125] [^127] support multiscale cardiac electrophysiology and biomechanics. Recently, AI-driven platforms have gained traction: DeepCell [^128] and CellPose [^129] [^130] [^131] deliver high-accuracy cell image segmentation and analysis, while NVIDIA Modulus [^132] provides a framework for physics-constrained neural networks—directly aligning with the three advanced AI routes discussed above (see Table [3](https://www.nature.com/articles/s41746-025-02198-6#Tab3)) (Fig. [2](https://www.nature.com/articles/s41746-025-02198-6#Fig2)).

![Fig. 2: Schematic workflow of virtual cell models.](https://media.springernature.com/lw685/springer-static/image/art%3A10.1038%2Fs41746-025-02198-6/MediaObjects/41746_2025_2198_Fig2_HTML.png?as=webp)

Fig. 2: Schematic workflow of virtual cell models.

**Table 3 Overview of virtual-cell/cell-level modeling platforms**

## Validation Mechanisms

Collective shaping by a closed-loop validation architecture drives virtual cell models from methodological novelty to actionable biology. At its core is a systematized pipeline coupling computational assessment (fit, stability, uncertainty) with experimental corroboration, iterated in cycles. This mechanism foregrounds interpretability and accelerates translation while accumulating layered evidence for model robustness and portability across contexts.

### Computational Evaluation

The performance validation of virtual cell models can be divided into two major aspects: computational evaluation and experimental validation [^9] [^133]. Computational evaluation primarily focuses on the model’s fitting to existing data and its ability to predict unknown scenarios [^133]. Common quantitative indicators are as follows: (1) Reconstruction error and distribution consistency: This includes measuring the distance between the generated data and the training data in high-dimensional space, statistical distribution differences, and comparing their clustering structures through dimensionality reduction methods such as t-SNE [^5]. (2) Prediction accuracy and stability: For extrapolated scenarios, the model’s prediction is evaluated against real-world results [^134] [^135] [^136]. (3) Model complexity and generalization ability: This involves statistical model parameters, computational time, and evaluating the model’s ability to adapt to new data through methods like cross-validation [^1]. Uncertainty quantification enhances the interpretability and robustness of conclusions. For example, Monte Carlo dropout can approximate the posterior predictive distribution to compute confidence intervals, and model ensembling can evaluate cross-model output consistency, thereby quantifying the reliability of virtual-cell model predictions [^137] [^138]. Driven by the destructive nature of single-cell assays—which precludes repeated measurements on the same cell [^139] —evaluation should pivot to the population-distribution level by comparing the statistical distributions of perturbed simulated cell populations with those observed experimentally [^93]. Accordingly, distributional distances—such as the Wasserstein distance, Kullback–Leibler divergence, and maximum mean discrepancy—serve as summary statistics to quantify agreement between model predictions and experimental data at the overall level. It is important to note that for high-dimensional biological data, “prediction accuracy” itself needs to be carefully defined and interpreted [^140] [^141] [^142]. Therefore, a multi-layered evaluation index system should be designed based on specific tasks to comprehensively quantify the performance of virtual cell models [^143] [^144] [^145].

As virtual cell models become increasingly complex, the computational tools used to assess them are also evolving [^1] [^6] [^146]. Through multi-angle, multi-index computational evaluation, models with superior performance and robust stability can be initially screened for further experimental validation [^146] [^147] [^148].

### Experimental verification

The models, after computational evaluation, need to be validated through biological experiments to confirm whether their predictions reflect real biological phenomena [^9] [^149] [^150] [^151] [^152] [^153]. In terms of gene function prediction, CRISPR/Cas9 and other gene-editing technologies are used to verify the key targets predicted by the models through in vitro or in vivo validation [^154] [^155] [^156]. For example, this process is commonly used in the discovery of new targets to help confirm whether the candidate targets selected by the model are worthy of further development [^9].

New in vitro models comprise organoids and organ-on-chip systems. Organoids are three-dimensional cell aggregates grown in vitro that partially recapitulate the structure and function of native tissues; organ-on-chip platforms culture cells within microfluidic devices using microengineering techniques to emulate organ-level microenvironments and functions. These innovative platforms offer physiologically relevant testbeds to validate predictions generated by virtual-cell models [^79] [^157]. Furthermore, in drug response prediction, the virtual cell model’s predictions are validated through in vitro cell experiments or organoid models [^6] [^28] [^158]. For instance, if the model suggests that a particular candidate compound may induce hepatocyte steatosis or other toxic reactions, its toxicological indicators can be verified in mouse models [^158] [^159] [^160]. For the prediction of drug absorption, distribution, metabolism, and excretion properties, in vivo pharmacokinetic experiments can be conducted to validate the model’s inference about absorption pathways [^6] [^28]. With the development of novel in vitro models, experimental systems that more closely mimic the in vivo environment are also being used to validate the predictions of virtual cells [^6] [^28] [^161]. These 3D models highly replicate the microenvironment of native tissues at multiple levels, including cellular composition, tissue structure, and functional performance [^161]. These models are expected to be deeply integrated with virtual cells to accelerate the transition of drugs from virtual screening to clinical trials [^6] [^161] (Fig. [3](https://www.nature.com/articles/s41746-025-02198-6#Fig3)).

![Fig. 3: Schematic diagram of virtual cell model verification mechanism.](https://media.springernature.com/lw685/springer-static/image/art%3A10.1038%2Fs41746-025-02198-6/MediaObjects/41746_2025_2198_Fig3_HTML.png?as=webp)

Fig. 3: Schematic diagram of virtual cell model verification mechanism.

Virtual-cell–experiment convergence is validating drug-effect predictions. Several concrete studies show that predictions from virtual cell models closely match results from wet-lab experiments. Driven by integrated modules for drug exposure, cardiomyocyte-drug interaction, and system-level response, Wang and colleagues built an in-vitro–in-vivo translation platform based on human iPSC (induced pluripotent stem cell)-derived cardiomyocytes (hiPSC-CMs). Its simulations predicted the incidence of cardiotoxicity for the anthracycline doxorubicin and the anti-HER2 antibody trastuzumab with high concordance to clinical observations [^162]. Feasibility is demonstrated: hiPSC-CM–based virtual cells enable animal-free, quantitative prediction of anticancer-drug-induced cardiac dysfunction. Similarly, the Virtual Cell-Based Assay (VCBA) has been used to simulate intracellular and organellar pharmacokinetics. Driven by mechanistic transport and binding representations, Worth et al. used VCBA to model the distribution of selected compounds in HepaRG hepatocytes and cardiomyocytes and their effects on mitochondrial membrane potential. The simulations accurately recapitulated in-vitro changes in toxicity readouts for the uncoupler FCCP, caffeine, and amiodarone [^9]. VCBA thus maps intracellular and mitochondrial concentrations to membrane potential shifts and cytotoxicity, reinforcing the agreement between virtual predictions and in vitro data.

“Next-generation in-vitro models” include organoids and organs-on-chips: organoids are three-dimensional cell aggregates cultured ex vivo that partially reproduce tissue architecture and function, whereas organs-on-chips culture cells in microfluidic devices to emulate organ microenvironments and functions [^79] [^157]. These systems provide physiologically relevant platforms for validating virtual-cell predictions. Driven by patient-specific epithelium–immune crosstalk, patient-derived intestinal organoids co-cultured with immune cells have been used to assess on- and off-tumor toxicities of T-cell bispecific antibodies. Harter et al. showed that an EpCAM-targeted T-cell-engaging bispecific antibody induced apoptosis in healthy intestinal organoids, aligning with toxicities reported clinically [^163]. Result: faithful reproduction of target-mediated toxicity in complex microenvironments, providing a reliable experimental anchor for validating virtual predictions. Driven by a policy shift toward animal reduction, the FDA (Food and Drug Administration) has recently signaled broader use of organs-on-chips, virtual models, and organoids in preclinical safety assessment [^164].

Collectively, these exemplars substantiate the effectiveness of virtual-cell models for predicting drug toxicity and ADME behavior. Driven by cross-validation against hiPSC-derived cardiomyocytes, organoids, and animal studies, virtual-cell platforms are accelerating drug development and enabling human-physiology-aligned alternatives to traditional animal testing. Regulatory agencies, including the FDA, are encouraging adoption of these integrated computational–biological approaches, steering screening and safety evaluation toward human relevance.

### Closed-loop integration of computational evaluation and experimental validation

Closed-loop architecture—comprising a computational inner loop, an experimental middle loop, and a translational outer loop—links methodological assessment with application-level verification; entry, decision, and exit gates at key nodes operationalize bottom-up continuous improvement. In the computational inner loop, strict data partitioning, batch harmonization, and pre-analysis quality control are prerequisites. We quantify distributional concordance under perturbation scenarios and characterize predictive uncertainty, with primary criteria being a pre-registered concordance threshold and an upper bound on the confidence interval width. If criteria are not met, the workflow reverts to data cleaning, structural-prior specification, and regularization tuning [^165]. Driven by near-physiological systems (e.g., organoids and organ-on-chip platforms), the experimental middle loop subjects model claims to targeted tests under pre-specified functional endpoints and statistical power. When effect direction or magnitude diverges from computational expectations—or power is insufficient to reject the null—the loop feeds back to joint revisions of modeling assumptions, feature selection, and experimental-protocol parameters [^166]. In the translational outer loop, cross-platform replication and prospective datasets constitute the primary settings. Deployment readiness is adjudicated by integrated evidence on generalizability, stability, and interpretability, supplemented by safety review and failure-mode analysis; if out-of-domain performance departs from predefined bands, feedback triggers coordinated optimization of feature engineering and experimental design [^167]. Tri-loop coupling secures distribution-level statistical reproducibility with bounded uncertainty while cross-validating functional evidence and translational feasibility, yielding a unified and transparent operating framework for comparable evaluation and reproducible validation across applications.

## Application Scenarios

Post-validation priority: establishing the model’s real-world and translational value.Applications of virtual cells are steadily expanding to drug screening, mechanistic inference, digital twins, and multi-platform interoperability, opening new avenues for precision medicine.

### Virtual-cell-enabled precise screening and mechanistic inference

The virtual cell model can assist in advancing and refining drug screening processes [^1] [^5] [^6] [^9] [^10]. On one hand, during the target discovery phase, virtual cells can simulate gene knockout or overexpression, predicting downstream molecular networks and phenotypic changes to infer potential therapeutic targets and their mechanisms of action [^1] [^9]. Researchers can prioritize the validation of targets predicted by the model to have significant effects, improving the hit rate of experimental screening [^168]. On the other hand, in lead compound screening, virtual cell models can be used for in silico screening of large numbers of candidate compounds, predicting their ability to correct pathological cell states and assessing their risk of toxic side effects [^6] [^10]. Regarding mechanism inference, virtual cell models can provide in-depth analysis of the dynamic processes of drug-cell interactions [^5] [^6] [^10]. Moreover, virtual cells can also be used for hypothesis testing. Researchers can introduce a new regulatory factor or pathway hypothesis into the model to test whether it can reproduce the observed phenomena [^5]. If the model validation supports the hypothesis, targeted experimental validation can then be designed at the experimental level [^169] [^170] [^171]. This approach is expected to improve the efficiency of mechanistic research, quickly identifying key factors and pathways with the support of virtual cells [^169] [^170] [^171].

It is important to emphasize that the use of virtual cells should always be closely integrated with biological experiments [^172] [^173] [^174]. In the short term, virtual results serve more as supporting evidence [^175] [^176], thus hypotheses generated through model predictions must be experimentally validated, with feedback used to refine the model and continually improve its consistency with reality [^1]. This closed-loop process will drive the true precision of drug screening and mechanism analysis, enabling the efficient translation of vast amounts of data into knowledge discovery [^177] [^178]. An integrative evaluation workflow, distilled from a systematic synthesis of prevailing standards and practices, enables comparable assessment and reproducible validation of virtual cell models across application contexts. We benchmark this workflow against existing methodological frameworks, specifying shared steps—data standardization, identification of bias sources, distribution-level concordance testing, and uncertainty quantification—and modules unique to virtual-cell settings—distributional distance evaluation for perturbation simulations, cross-modal alignment, and mapping of functional endpoints between organoids and organ-on-chip platforms. Driven by cell-state prediction and perturbation-response inference as core tasks, the workflow applies to studies with traceable data provenance and cross-batch calibration of experimental systems. Limitations: cross-species generalization and extrapolation to ultra-rare cell populations warrant particular caution.

### Synergy between digital twins and virtual cells

The introduction of the concept of “Digital Twin” has provided new opportunities for the application of virtual cell models [^6]. A digital twin typically refers to a high-fidelity virtual replica of a specific entity, which can receive real-time data from the physical entity and perform simulations [^179] [^180] [^181]. By integrating virtual cell models into the digital twin framework, a multi-scale, comprehensive simulation from the molecular and cellular level to the whole organism can be achieved [^1] [^6] [^10] [^161] [^182] [^183]. In rare disease research, by combining patient-specific stem cell-derived virtual models with patient phenotype data, the effects of personalized drug interventions can be simulated [^161] [^182]. This strategy allows for large-scale virtual screening of efficient, low-toxicity candidate compounds before clinical trials [^10] and has shown potential to partially replace animal experiments in target discovery and other processes [^6] [^9].

The combination of digital twins and virtual cells also provides a new approach to disease prediction and monitoring [^6] [^181]. By continuously inputting biomarker data from patients, virtual cell models can simulate the cellular evolution of disease progression, offering doctors predictions regarding the disease’s course and outcome [^6]. For instance, in cancer treatment, if the virtual model predicts changes related to drug resistance signals, it can provide an early warning and suggest treatment adjustments [^184] [^185] [^186] [^187] [^188]. These applications rely on high-quality individual data and the model’s ability to sensitively capture individual differences [^187] [^189] [^190] [^191]. With advancements in data collection and modeling techniques, the integration of digital twins and virtual cells will become more seamless, playing a more active role in clinical decision support [^187] [^188] [^192].

### Boundary setting and complementarity

Despite the powerful capabilities of virtual cell models, they cannot fully replace traditional methods in all scenarios. Therefore, it is essential to define their application boundaries and leverage their complementary role [^6]. In the context of complex multicellular behaviors, virtual cells currently focus on molecular and intracellular processes. For phenomena involving tissue morphological changes, traditional multicellular modeling or experimental approaches remain indispensable [^1]. Regarding model interpretability, physical models and rule-based models, which are directly grounded in known human laws, are generally more readily accepted by researchers. In contrast, although deep learning-driven virtual cells provide accurate predictions, they may struggle to offer deductive mechanistic explanations [^16]. Thus, in studies requiring a clear mechanistic understanding, virtual cells serve as an exploratory tool, while the final mechanistic elucidation should be combined with traditional experiments and analytical models [^1]. Additionally, virtual cells complement other emerging technologies [^5] [^6] [^193]. For instance, when combined with single-cell lineage tracing technology, they can provide developmental pathways, which are difficult for models to simulate, serving as ground truth to calibrate model parameters [^5]. Researchers should fully recognize the strengths and limitations of virtual cells and integrate them with other practice methods: capitalizing on their speed and scalability while using traditional methods to ensure reliable results and clear explanations [^194] [^195] [^196] [^197]. Only in this way can virtual cell models find their optimal positioning and achieve maximum benefits in biomedical research and drug development [^198] [^199] [^200].

### Virtual cells and cell-level modeling platforms: status and comparative analysis

Mechanism-driven alignment with the target scenario is the primary determinant of successful application. The selection of a modeling platform is driven by (i) the biological endpoints of the question and (ii) the complexity of implementing the pertinent molecular mechanisms. When the aim is Section 4.1’s precision screening and mechanistic deduction, intracellular network platforms are indicated—e.g., COPASI [^96] [^97] for simulating drug impacts on pathway behavior, or CellNOpt [^104] [^105] for data-driven reconstruction of signaling circuitry under perturbations. For Section 4.2’s digital-twin use cases involving multi-cellular coordination, tissue-level simulators—PhysiCell [^110] [^111] or CompuCell3D [^114] [^115] —are preferable to capture tumor expansion and integrated tissue responses to drugs. Readers may consult Section 2.6’s computational-speed overview and Table [1](https://www.nature.com/articles/s41746-025-02198-6#Tab1) ’s comprehensive comparison (Fig. [4](https://www.nature.com/articles/s41746-025-02198-6#Fig4)) to select the most suitable platform.

![Fig. 4: Applications of AI-Driven Virtual Cell Models in Preclinical Research.](https://media.springernature.com/lw685/springer-static/image/art%3A10.1038%2Fs41746-025-02198-6/MediaObjects/41746_2025_2198_Fig4_HTML.png?as=webp)

Fig. 4: Applications of AI-Driven Virtual Cell Models in Preclinical Research.

## Clinical translation, ethics, and compliance

Driven by collective socio-technical shaping, the safe translation of virtual cell models from theoretical constructs to clinical use has become the decisive inflection point. The trajectory is conditioned not only by technical capability but by regulatory architectures, ethical safeguards, legal accountability, and trust-building mechanisms. We outline how compliance regimes, data privacy security, intellectual property ownership and stewardship, and fairness auditing collectively facilitate clinically acceptable deployment, paving the way for the field’s next phase.

### Regulatory Trends

With the rapid development of non-animal testing methods, AI-driven virtual cell models have gradually entered the discussion within regulatory agencies [^6] [^16] [^201] [^202]. In 2022, the U.S. Congress passed the FDA Modernization Act 2.0, which explicitly stated that animal testing data would no longer be a mandatory requirement for new drug IND submissions. It allowed for the use of humanized cell models, organoids, organ-on-a-chip systems, and artificial intelligence/machine learning (AI/ML) models as alternatives [^6] [^203] [^204]. This legislation opened a potential path for the regulatory and compliant application of virtual cells, particularly in early-stage toxicology and pharmacology evaluations [^6] [^9] [^205]. In 2025, the U.S. FDA released its first draft guidance on the use of AI models in drug development, titled “Considerations for the Use of Artificial Intelligence to Support Regulatory Decision-Making for Drugs and Biologics,” proposing a risk-based framework for model credibility assessment [^206]. In Europe, the European Chemicals Agency (ECHA) and the EU REACH (Registration, Evaluation, Authorization and Restriction of Chemicals) regulations have also strengthened the adoption of non-animal testing methods in recent years, with some toxicology evaluation frameworks incorporating computational modeling and bioinformatics prediction tools [^207] [^208]. Overall, global regulatory trends are cautiously supportive of AI-driven alternative methods: on one hand, they recognize their potential in accelerating drug development and reducing animal use, while on the other hand, they ensure their reliability and transparency through legislation and guidelines when used in decision-making [^6] [^16] [^203] [^204]. For virtual cell model developers, understanding and adhering to these policy guidelines and considering regulatory requirements during the model design phase, will help increase the likelihood of success in subsequent clinical translation submissions [^209] [^210].

### Regulatory and Implementation Challenges

Despite the gradual relaxation of the policy environment, virtual cell models still face significant challenges in fully replacing traditional in vivo and in vitro experiments under the current regulatory system [^6] [^12] [^182]. The U.S. FDA still requires the submission of adequate in vitro and/or in vivo validation data during the IND review process, with AI models currently considered as supplementary evidence rather than the sole basis [^6]. Differences in data sources, model architecture, parameter settings, and validation processes among research teams, along with the lack of a unified third-party benchmark testing platform, limit the comparability and reproducibility of model results [^16] [^211]. At present, regulatory agencies have not established clear review guidelines for AI-based biological models, and projects are often subject to case-by-case review, making it difficult for applicants to predict the required level of validation [^16] [^211] [^212]. For example, there is no unified standard regarding the level of predictive accuracy required to support an IND application, and regulatory demands may vary significantly across different cases [^6]. Moreover, regulatory agencies’ personnel must also address challenges [^213] [^214] [^215]. Reviewing a complex virtual cell model typically requires interdisciplinary experts in computational biology, machine learning, and disease biology. However, many regulatory agencies currently lack sufficient human resources in this area, potentially leading to delays or uncertainty in the review process [^16] [^211]. As a result, agencies like the FDA are improving AI review capabilities through internal training and external consultants, but this cognitive gap remains a significant barrier to model translation in the short term [^216] [^217] [^218] [^219] [^220] [^221] [^222] [^223].

Another challenge arises from data sharing and privacy issues [^224] [^225] [^226] [^227] [^228] [^229] [^230] [^231]. High-quality virtual cell models typically require the integration of patient-derived data for training, which often involves sensitive personal health information [^226] [^232] [^233] [^234]. When submitting regulatory reviews, applicants need to provide sufficient information to demonstrate the reliability of the model while safeguarding patient privacy. This has led to the development of innovative solutions, such as secure multi-party computation and federated learning, which enable multiple institutions to collaborate on model validation without sharing raw data [^232] [^235] [^236]. However, these technologies also add complexity and uncertainty to the review process [^237] [^238] [^239]. Furthermore, legal issues such as model intellectual property ownership and compliance with training data regulations need to be clarified in submission materials, as failure to do so may trigger compliance investigations and delay the review process [^6]. Finally, the application of AI models in regulatory decision-making lacks successful precedents [^240]. To date, there are few cases where new drugs have been approved based solely on AI model results, with AI still predominantly used as an auxiliary tool [^241] [^242]. At the regulatory implementation level, virtual cell models continue to face challenges related to model standards, review capabilities, data compliance, and successful demonstrations, requiring joint efforts from industry and regulators to resolve [^2] [^182] [^243].

Cross-scale coupling still constrains the transition from single-cell models to tissue-level applications.At the single-cell level, virtual models must be embedded within higher-order physiological contexts, encompassing cell–cell interactions, three-dimensional tissue architecture, and whole-body dynamics [^244]. Driven by multiscale integration, existing frameworks (OpenSim, Physiome) can host cell-level models at organ and organism scales [^127] [^245], yet they prioritize macroscopic processes and remain limited in their explicit representation of signaling pathways and gene-regulatory mechanisms. Consequently, after in vitro verification, virtual cells require intermediate testing and parameter calibration in organoids and animal models to progressively approximate real-world patient contexts [^246] [^247]. Clinical translation hinges on parallel progress in cross-scale technical concordance and regulatory–ethical alignment, both of which should be treated as coequal bottlenecks for virtual cells.

### Data privacy and security compliance

Virtual cell models are constructed and trained on large-scale biomedical datasets that often contain sensitive patient information [^7] [^8]. If mishandled, such data can lead to breaches of personal privacy and raise ethical concerns [^6] [^226] [^233] [^234] [^248]. Many countries and regions have enacted laws governing the use of health data; for example, China’s Personal Information Protection Law (PIPL) requires health data to be stored locally and mandates obtaining the data subject’s explicit consent [^248], while the United States’ Health Insurance Portability and Accountability Act (HIPAA) requires encryption and de-identification of protected health information (PHI) [^6] [^248]. European context: mandatory GDPR (generative adversarial network) -compliant protection of patient data privacy [^249]. In parallel, stakeholders should closely follow the forthcoming European Health Data Space (EHDS) initiative, which aims to enable secure sharing and standardized reuse of research data within a defined regulatory framework [^250]. These regulations mean that developers of virtual cell models must ensure legal compliance when collecting and processing data, and that cross-border data transfers may give rise to legal conflicts that affect the use of models in international multicenter studies [^248] [^251]. Beyond regulatory compliance, technical measures are also needed to safeguard data security and privacy [^252] [^253] [^254] [^255] [^256] [^257] [^258] [^259]. Evidence indicates that deep generative models can “memorize” unique features of training samples and, in extreme cases, reproduce portions of the original training data in their outputs [^16]. To mitigate such risks, developers should deploy privacy-preserving mechanisms when releasing and sharing models [^260] [^261] [^262] [^263] [^264] [^265] [^266] For example, differential privacy techniques can inject calibrated noise into model parameters to obscure individual-level features and thereby reduce potential privacy leakage with minimal impact on model performance [^16] [^267] [^268] [^269]. Likewise, federated learning frameworks allow models to be trained on local institutional data while only sharing model weight updates, thereby architecturally avoiding the risk of centralized data exposure [^232] [^270] [^271]. A combined legal and technical approach is therefore required to realize the value of virtual cell models while ensuring data security [^272] [^273]. Cybersecurity is another essential consideration. If virtual cell models are provided to healthcare institutions as cloud services, the databases and computing infrastructure on which they depend may become targets for attack [^274] [^275] [^276]. Consequently, model deployment should be accompanied by strict access controls, vulnerability scanning, and incident-response mechanisms, and model outputs should be subject to anomaly monitoring so that any aberrant behavior triggers timely alerts and intervention [^277] [^278] [^279]. These measures will help ensure that virtual cell models, as digital medical products, meet security standards at least as stringent as those applied to conventional clinical medical software [^6] [^280].

### Intellectual property and liability

The ownership of intellectual property in outputs generated by AI models currently lacks a unified legal definition [^6] [^16]. In the commercialization of virtual cell models, the boundaries of rights and interests among data providers, model developers, and end users remain unclear. Moreover, as a novel digital product, the regulatory and legal status of virtual cell models is still being explored [^6]. When model predictions are used to support critical R&D or clinical decision-making, and an erroneous prediction leads to adverse outcomes, determining which party should bear responsibility—as well as disputes over the allocation of commercial benefits—becomes contentious [^16] [^281]. For example, if a model is trained on large volumes of patient single-cell omics data provided by a hospital, should the intellectual property rights to a drug target predicted by the model belong to the model company or to the data-providing hospital [^282] [^283] [^284]? Similarly, if the algorithm is developed by an AI company but a pharmaceutical firm uses the model to discover a new molecule, how should the related intellectual property be shared [^282] [^283] [^284]? These questions currently have no precedent and must be progressively clarified in practice through contracts and legislation to address real-world problems [^6] [^16]. Model developers, providers, and users may shift liability among themselves, which impedes compensation for harmed parties and undermines healthy industry development.

Therefore, regulatory authorities and the legal community should intervene early to establish liability-determination frameworks and insurance mechanisms tailored to AI model applications, clarify the rights and responsibilities of all parties, and reduce the legal risks associated with adopting new technologies [^285] [^286] [^287]. Overall, clarifying intellectual property and liability allocation is a necessary condition for translating virtual cell technology from the laboratory into industry, requiring coordinated advancement through both legislation and industry self-regulation [^285] [^286] [^287].

### Algorithmic fairness and explainability

The fairness and transparency of virtual cell models directly influence their adoption in clinical settings [^16] [^133]. If the training data contain biases related to race or other factors, models can amplify these injustices and systematically disadvantage certain groups in prediction outcomes [^1] [^16]. For example, if training data are drawn predominantly from Western populations, a model may perform with lower accuracy when predicting drug responses in East Asian populations, thereby reducing those groups’ opportunities to receive effective therapies [^288] [^289] [^290] [^291]. Such AI bias should be mitigated by increasing data diversity and by incorporating fairness constraints during model training [^16] [^292]. Moreover, the “black-box” nature of deep learning models undermines researchers’ and clinicians’ trust in their predictions [^16] [^133]. Therefore, integrating explainable artificial intelligence (XAI) approaches into virtual cell models is essential [^292] [^293] [^294]. Common XAI techniques—such as SHAP (SHapley Additive exPlanations) value analysis and integrated gradients—can quantify the dependence of model outputs on individual input features, thereby illuminating the rationale behind model decisions [^292] [^294]. Through these methods, we can answer critical questions like “Why does the model consider a particular gene mutation pathogenic?” or “On what basis does the model predict that drug A is more effective than drug B?” [^292]. Introducing fairness constraints during model development and augmenting interpretability analyses during deployment will markedly enhance the credibility of virtual cell models and increase their likelihood of broad adoption in both research and clinical practice [^16] [^292] (Fig. [5](https://www.nature.com/articles/s41746-025-02198-6#Fig5)).

![Fig. 5: Clinical translation, ethics, and compliance challenges of virtual cell models.](https://media.springernature.com/lw685/springer-static/image/art%3A10.1038%2Fs41746-025-02198-6/MediaObjects/41746_2025_2198_Fig5_HTML.png?as=webp)

Fig. 5: Clinical translation, ethics, and compliance challenges of virtual cell models.

## Future development and outlook

With regulatory–ethical–compliance alignment achieved, virtual-cell development enters a new phase: foundation in terminology harmonization/standardization; delineation of technical hurdles; prospect of cross-disciplinary, multiscale integration; and establishment of open-science, international-collaboration platforms to expedite innovation.

### Terminology harmonization and standardization

At present, terms such as “Virtual Cell”, “Digital Cell”, and “Digital Twin” are not used consistently across academia and industry [^1] [^182]. This terminological overlap not only complicates cross-disciplinary communication but can also create ambiguities in regulation and review processes [^6]. The International Organization for Standardization (ISO) has already begun promoting the harmonization of terms and definitions in the digital twin domain; however, in the life sciences, there is an urgent need for multinational academic organizations and regulatory authorities to take the lead in developing a standardized vocabulary and classification framework for virtual cells [^6]. Standardization efforts should extend beyond nomenclature to include model description languages, data formats, and validation metrics [^1] [^295]. For example, promoting the adoption of standard model description languages (e.g., SBML, CellML) to represent virtual cell models would facilitate model sharing and reuse across different platforms [^125] [^296]; likewise, establishing public model and data repositories and encouraging researchers to submit validated models would enable model reuse and iterative improvement [^6]. By unifying terminology and standards, the virtual cell research ecosystem will become more standardized, and collaboration among researchers will proceed more smoothly [^297].

### Technical bottlenecks and challenges

The limited interpretability of virtual cell models represents a major bottleneck to their regulatory and clinical adoption [^16]. As black-box models, they often fail to provide explicit biological causal explanations, undermining clinicians’ and regulatory experts’ trust in their predictions [^1]. These issues are particularly pronounced in the preclinical stages of drug development, where the accuracy and reproducibility of model outputs directly affect the design and risk assessment of subsequent clinical trials [^251]. Developing a graded framework for model credibility is therefore a promising avenue, stratifying predictive confidence according to factors such as the volume of training data and the rigor of validation, and aligning each credibility tier with the verification intensity required for different application scenarios [^1]. Only by addressing these bottlenecks in a targeted manner can virtual cell models gain a foothold in more stringent regulatory and clinical environments [^6].

### Cross-disciplinary, multiscale integration

Looking ahead, virtual cells will be deeply integrated with cutting-edge technologies such as organoids, organ-on-chip platforms, and digital twins, enabling multiscale, unified modeling that spans molecules, cells, tissues, organs, and whole organisms [^1] [^6] [^204]. Such multiscale integration is expected to more systematically predict drug responses and disease progression, thereby enhancing the role of virtual cells in precision medicine [^1] [^298]. At the same time, emerging generative artificial intelligence and large multimodal models will furnish virtual cells with stronger generalization and inferential capabilities [^299] [^300]. However, realizing the interdisciplinary, multiscale integration described above requires overcoming the current fragmentation of research: the vast majority of studies remain confined to a single level or domain, and disciplinary barriers impede model interoperability [^1]. Deep cross-domain integration and the consolidation of multiscale data modalities and model types are likely to become essential pathways for the evolution of the virtual cell field [^301].

### International collaboration and open science

To accelerate the iterative development and clinical translation of virtual-cell technologies, international collaborative and open-science platforms should be established [^1] [^302]. Such platforms could enable the sharing of large-scale multimodal omics datasets, the adoption of standardized model formats, and the dissemination of open-source tools, thereby promoting harmonized model performance evaluation criteria and clear pathways for regulatory acceptance [^125] [^207] [^251] [^296] [^303] [^304]. Transnational cooperation would not only expand data diversity and reduce model bias, but also facilitate mutual recognition and coordination among regulatory agencies across countries [^207]. Naturally, open collaboration must also address challenges related to intellectual property and data sovereignty. By exploring innovative cooperation mechanisms, it is possible—while safeguarding the privacy of all parties’ data—to realize the goal of “data sharing and collaborative modeling” [^232] [^270] [^271] [^281]. Open science and benchmarking are advancing rapidly. The 2025 Virtual Cell Challenge tests perturbation-response prediction on unseen cell types via open competition, improving method comparability and iteration [^146]. Therapeutic Data Commons (PyTDC) provides a unified evaluation framework by aggregating drug-discovery and single-cell benchmarks [^305]. The “Open Problems in Single-Cell Analysis” initiative releases benchmark datasets and metrics to coordinate community solutions [^306]. These efforts establish shared standards and reproducible resources, strengthen cross-dataset/platform external validity, and enable rapid, robust optimization of virtual cell models. These measures will cultivate a more open academic environment and accelerate the accumulation and iterative refinement of the underlying technologies [^2] [^307] [^308].

### Outlook

Virtual cell models are poised to evolve from auxiliary tools in preclinical research into a core component of the drug-evaluation framework [^1] [^6] [^12]. Their simulation scope will extend beyond current intracellular processes to higher organizational levels—including tissue morphogenesis and organ-level functional dynamics—thereby enabling a more complete depiction of complex physiological and pathophysiological processes [^309] [^310]. In addition, establishing internationally recognized benchmark datasets and quantitative metrics will allow objective comparisons of different models’ predictive performance and credibility [^1] [^16] [^251] [^311] [^312]. In parallel, explainable-AI approaches will be integrated into the development pipeline of virtual cell models to document and evaluate, end-to-end, the evidentiary basis of model decisions, improving the traceability of predictions and their clinical acceptability; as transparency increases and validation cases accumulate, clinical and regulatory confidence in these models is expected to strengthen progressively [^313] [^314] [^315] [^316]. Looking ahead, virtual cell technologies are expected to play a central role in drug discovery, disease modeling, and personalized medicine, achieving a closed loop from theoretical innovation to clinical translation [^12]. Driven by the explosive growth of biological big data, sustained advances in computing hardware, and broader societal acceptance of experimental alternatives, virtual cell models are likely to transition from frontier exploration to mainstream application in the near future, catalyzing a paradigm shift across the life sciences and the biopharmaceutical industry [^1] [^317] (Fig. [6](https://www.nature.com/articles/s41746-025-02198-6#Fig6)).

![Fig. 6: Schematic diagram of future development and prospects.](https://media.springernature.com/lw685/springer-static/image/art%3A10.1038%2Fs41746-025-02198-6/MediaObjects/41746_2025_2198_Fig6_HTML.png?as=webp)

Fig. 6: Schematic diagram of future development and prospects.

## Data availability

No datasets were generated or analyzed during the current study.

## References

## Acknowledgements

This work was supported by the National Natural Science Foundation of China (No.82503242); the Natural Science Foundation of Hunan Province (2025JJ60596); and the China Postdoctoral Science Foundation (2025M772105).

## Ethics declarations

### Competing interests

The authors declare no competing interests.

### Consent for publication

All authors consent for publication.

### Declaration of generative AI and AI-assisted technologies in the writing process

During the preparation of this work, the authors used ChatGPT-5Auto for language polishing. After using this tool, the authors reviewed and edited the content as needed and take full responsibility for the content of the publication.

## Additional information

**Publisher’s note** Springer Nature remains neutral with regard to jurisdictional claims in published maps and institutional affiliations.

## Rights and permissions

**Open Access** This article is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License, which permits any non-commercial use, sharing, distribution and reproduction in any medium or format, as long as you give appropriate credit to the original author(s) and the source, provide a link to the Creative Commons licence, and indicate if you modified the licensed material. You do not have permission under this licence to share adapted material derived from this article or parts of it. The images or other third party material in this article are included in the article’s Creative Commons licence, unless indicated otherwise in a credit line to the material. If material is not included in the article’s Creative Commons licence and your intended use is not permitted by statutory regulation or exceeds the permitted use, you will need to obtain permission directly from the copyright holder. To view a copy of this licence, visit [http://creativecommons.org/licenses/by-nc-nd/4.0/](http://creativecommons.org/licenses/by-nc-nd/4.0/).

[^1]: Bunne, C. et al. How to build the virtual cell with artificial intelligence: Priorities and opportunities. *Cell* **187**, 7045–7063 (2024).

[Article](https://doi.org/10.1016%2Fj.cell.2024.11.015) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39672099) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC12148494) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=How%20to%20build%20the%20virtual%20cell%20with%20artificial%20intelligence%3A%20Priorities%20and%20opportunities&journal=Cell&doi=10.1016%2Fj.cell.2024.11.015&volume=187&pages=7045-7063&publication_year=2024&author=Bunne%2CC)

[^2]: Johnson, G. T. et al. Building the next generation of virtual cells to understand cellular biology. *Biophys. J.* **122**, 3560–3569 (2023).

[Article](https://doi.org/10.1016%2Fj.bpj.2023.04.006) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37050874) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10541477) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Building%20the%20next%20generation%20of%20virtual%20cells%20to%20understand%20cellular%20biology&journal=Biophys.%20J.&doi=10.1016%2Fj.bpj.2023.04.006&volume=122&pages=3560-3569&publication_year=2023&author=Johnson%2CGT)

[^3]: He, X. et al. Artificial intelligence-based multi-omics analysis fuels cancer precision medicine. *Semin Cancer Biol.* **88**, 187–200 (2023).

[Article](https://doi.org/10.1016%2Fj.semcancer.2022.12.009) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=36596352) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Artificial%20intelligence-based%20multi-omics%20analysis%20fuels%20cancer%20precision%20medicine&journal=Semin%20Cancer%20Biol.&doi=10.1016%2Fj.semcancer.2022.12.009&volume=88&pages=187-200&publication_year=2023&author=He%2CX)

[^4]: Loew, L. M. & Schaff, J. C. The virtual cell: a software environment for computational cell biology. *Trends Biotechnol.* **19**, 401–406 (2001).

[Article](https://doi.org/10.1016%2FS0167-7799%2801%2901740-1) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=11587765) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20virtual%20cell%3A%20a%20software%20environment%20for%20computational%20cell%20biology&journal=Trends%20Biotechnol.&doi=10.1016%2FS0167-7799%2801%2901740-1&volume=19&pages=401-406&publication_year=2001&author=Loew%2CLM&author=Schaff%2CJC)

[^5]: Gupta, R. et al. Artificial intelligence to deep learning: machine intelligence approach for drug discovery. *Mol. Divers* **25**, 1315–1360 (2021).

[Article](https://link.springer.com/doi/10.1007/s11030-021-10217-3) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=33844136) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC8040371) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Artificial%20intelligence%20to%20deep%20learning%3A%20machine%20intelligence%20approach%20for%20drug%20discovery&journal=Mol.%20Divers&doi=10.1007%2Fs11030-021-10217-3&volume=25&pages=1315-1360&publication_year=2021&author=Gupta%2CR)

[^6]: Gangwal, A. & Lavecchia, A. Artificial intelligence in preclinical research: enhancing digital twins and organ-on-chip to reduce animal testing. *Drug Discov. Today* **30**, 104360 (2025).

[Article](https://doi.org/10.1016%2Fj.drudis.2025.104360) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40252989) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Artificial%20intelligence%20in%20preclinical%20research%3A%20enhancing%20digital%20twins%20and%20organ-on-chip%20to%20reduce%20animal%20testing&journal=Drug%20Discov.%20Today&doi=10.1016%2Fj.drudis.2025.104360&volume=30&publication_year=2025&author=Gangwal%2CA&author=Lavecchia%2CA)

[^7]: Wan, X. et al. Integrating spatial and single-cell transcriptomics data using deep generative models with SpatialScope. *Nat. Commun.* **14**, 7848 (2023).

[Article](https://doi.org/10.1038%2Fs41467-023-43629-w) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38030617) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10687049) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Integrating%20spatial%20and%20single-cell%20transcriptomics%20data%20using%20deep%20generative%20models%20with%20SpatialScope&journal=Nat.%20Commun.&doi=10.1038%2Fs41467-023-43629-w&volume=14&publication_year=2023&author=Wan%2CX)

[^8]: Gayoso, A. et al. Joint probabilistic modeling of single-cell multi-omic data with totalVI. *Nat. Methods* **18**, 272–282 (2021).

[Article](https://doi.org/10.1038%2Fs41592-020-01050-x) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=33589839) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7954949) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Joint%20probabilistic%20modeling%20of%20single-cell%20multi-omic%20data%20with%20totalVI&journal=Nat.%20Methods&doi=10.1038%2Fs41592-020-01050-x&volume=18&pages=272-282&publication_year=2021&author=Gayoso%2CA)

[^9]: Worth, A. P. et al. Virtual cell based assay simulations of intra-mitochondrial concentrations in hepatocytes and cardiomyocytes. *Toxicol. Vitr.* **45**, 222–232 (2017).

[Article](https://doi.org/10.1016%2Fj.tiv.2017.09.009) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Virtual%20cell%20based%20assay%20simulations%20of%20intra-mitochondrial%20concentrations%20in%20hepatocytes%20and%20cardiomyocytes&journal=Toxicol.%20Vitr.&doi=10.1016%2Fj.tiv.2017.09.009&volume=45&pages=222-232&publication_year=2017&author=Worth%2CAP)

[^10]: Luo, Q. et al. Status and influential factors of water-borne diseases in bathing beaches in three cities of China from 2019 to 2020. *Wei Sheng Yan Jiu* **50**, 472–475 (2021).

[PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=34074371) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Status%20and%20influential%20factors%20of%20water-borne%20diseases%20in%20bathing%20beaches%20in%20three%20cities%20of%20China%20from%202019%20to%202020&journal=Wei%20Sheng%20Yan%20Jiu&volume=50&pages=472-475&publication_year=2021&author=Luo%2CQ)

[^11]: Paini, A. et al. Practical use of the virtual cell based assay: simulation of repeated exposure experiments in liver cell lines. *Toxicol. Vitr.* **45**, 233–240 (2017).

[Article](https://doi.org/10.1016%2Fj.tiv.2016.10.007) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Practical%20use%20of%20the%20virtual%20cell%20based%20assay%3A%20simulation%20of%20repeated%20exposure%20experiments%20in%20liver%20cell%20lines&journal=Toxicol.%20Vitr.&doi=10.1016%2Fj.tiv.2016.10.007&volume=45&pages=233-240&publication_year=2017&author=Paini%2CA)

[^12]: Graepel, R. et al. The virtual cell based assay: current status and future perspectives. *Toxicol. Vitr.* **45**, 258–267 (2017).

[Article](https://doi.org/10.1016%2Fj.tiv.2017.01.009) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20virtual%20cell%20based%20assay%3A%20current%20status%20and%20future%20perspectives&journal=Toxicol.%20Vitr.&doi=10.1016%2Fj.tiv.2017.01.009&volume=45&pages=258-267&publication_year=2017&author=Graepel%2CR)

[^13]: Klein, D. et al. Mapping cells through time and space with moscot. *Nature* **638**, 1065–1075 (2025).

[Article](https://doi.org/10.1038%2Fs41586-024-08453-2) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39843746) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11864987) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Mapping%20cells%20through%20time%20and%20space%20with%20moscot&journal=Nature&doi=10.1038%2Fs41586-024-08453-2&volume=638&pages=1065-1075&publication_year=2025&author=Klein%2CD)

[^14]: UNION E P C O T E. Regulation (EU) 2016/679 (General Data Protection Regulation) \[Z\]. Official Journal of the European Union. (EU, 2016)

[^15]: Scheuher, B. et al. Towards a platform quantitative systems pharmacology (QSP) model for preclinical to clinical translation of antibody drug conjugates (ADCs). *J. Pharmacokinet. Pharmacodyn.* **51**, 429–447 (2024).

[Article](https://link.springer.com/doi/10.1007/s10928-023-09884-6) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37787918) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Towards%20a%20platform%20quantitative%20systems%20pharmacology%20%28QSP%29%20model%20for%20preclinical%20to%20clinical%20translation%20of%20antibody%20drug%20conjugates%20%28ADCs%29&journal=J.%20Pharmacokinet.%20Pharmacodyn.&doi=10.1007%2Fs10928-023-09884-6&volume=51&pages=429-447&publication_year=2024&author=Scheuher%2CB)

[^16]: Hartung, T., Maertens, A. & Luechtefeld, T. E-validation - Unleashing AI for validation. *Altex* **41**, 567–587 (2024).

[PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39444208) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=E-validation%20-%20Unleashing%20AI%20for%20validation&journal=Altex&volume=41&pages=567-587&publication_year=2024&author=Hartung%2CT&author=Maertens%2CA&author=Luechtefeld%2CT)

[^17]: Lotfollahi, M., Wolf, F. A. & Theis, F. J. scGen predicts single-cell perturbation responses. *Nat. Methods* **16**, 715–721 (2019).

[Article](https://doi.org/10.1038%2Fs41592-019-0494-8) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=31363220) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=scGen%20predicts%20single-cell%20perturbation%20responses&journal=Nat.%20Methods&doi=10.1038%2Fs41592-019-0494-8&volume=16&pages=715-721&publication_year=2019&author=Lotfollahi%2CM&author=Wolf%2CFA&author=Theis%2CFJ)

[^18]: Sidaway, P. Neoadjuvant pembrolizumab shows promise. *Nat. Rev. Clin. Oncol.* **16**, 7 (2019).

[Article](https://doi.org/10.1038%2Fs41571-018-0131-y) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=30478429) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Neoadjuvant%20pembrolizumab%20shows%20promise&journal=Nat.%20Rev.%20Clin.%20Oncol.&doi=10.1038%2Fs41571-018-0131-y&volume=16&publication_year=2019&author=Sidaway%2CP)

[^19]: Schep, A. N. et al. chromVAR: inferring transcription-factor-associated accessibility from single-cell epigenomic data. *Nat. Methods* **14**, 975–978 (2017).

[Article](https://doi.org/10.1038%2Fnmeth.4401) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=28825706) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC5623146) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=chromVAR%3A%20inferring%20transcription-factor-associated%20accessibility%20from%20single-cell%20epigenomic%20data&journal=Nat.%20Methods&doi=10.1038%2Fnmeth.4401&volume=14&pages=975-978&publication_year=2017&author=Schep%2CAN)

[^20]: Asp, M. et al. A spatiotemporal organ-wide gene expression and cell atlas of the developing human heart. *Cell* **179**, 1647–60.e19 (2019).

[Article](https://doi.org/10.1016%2Fj.cell.2019.11.025) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=31835037) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=A%20spatiotemporal%20organ-wide%20gene%20expression%20and%20cell%20atlas%20of%20the%20developing%20human%20heart&journal=Cell&doi=10.1016%2Fj.cell.2019.11.025&volume=179&pages=1647-60.e19&publication_year=2019&author=Asp%2CM)

[^21]: Tian, L. et al. Benchmarking single cell RNA-sequencing analysis pipelines using mixture control experiments. *Nat. Methods* **16**, 479–487 (2019).

[Article](https://doi.org/10.1038%2Fs41592-019-0425-8) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=31133762) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Benchmarking%20single%20cell%20RNA-sequencing%20analysis%20pipelines%20using%20mixture%20control%20experiments&journal=Nat.%20Methods&doi=10.1038%2Fs41592-019-0425-8&volume=16&pages=479-487&publication_year=2019&author=Tian%2CL)

[^22]: Eng, C. L. et al. Transcriptome-scale super-resolved imaging in tissues by RNA seqFISH. *Nature* **568**, 235–239 (2019).

[Article](https://doi.org/10.1038%2Fs41586-019-1049-y) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=30911168) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC6544023) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Transcriptome-scale%20super-resolved%20imaging%20in%20tissues%20by%20RNA%20seqFISH&journal=Nature&doi=10.1038%2Fs41586-019-1049-y&volume=568&pages=235-239&publication_year=2019&author=Eng%2CCL)

[^23]: Xia, C. et al. Spatial transcriptome profiling by MERFISH reveals subcellular RNA compartmentalization and cell cycle-dependent gene expression. *Proc. Natl. Acad. Sci. USA* **116**, 19490–19499 (2019).

[Article](https://doi.org/10.1073%2Fpnas.1912459116) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=31501331) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC6765259) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Spatial%20transcriptome%20profiling%20by%20MERFISH%20reveals%20subcellular%20RNA%20compartmentalization%20and%20cell%20cycle-dependent%20gene%20expression&journal=Proc.%20Natl.%20Acad.%20Sci.%20USA&doi=10.1073%2Fpnas.1912459116&volume=116&pages=19490-19499&publication_year=2019&author=Xia%2CC)

[^24]: Soopairin, S., Patikorn, C. & Taychakhoonavudh, S. Antivenom preclinical efficacy testing against Asian snakes and their availability in Asia: a systematic review. *PLoS One* **18**, e0288723 (2023).

[Article](https://doi.org/10.1371%2Fjournal.pone.0288723) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37467278) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10355433) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Antivenom%20preclinical%20efficacy%20testing%20against%20Asian%20snakes%20and%20their%20availability%20in%20Asia%3A%20a%20systematic%20review&journal=PLoS%20One&doi=10.1371%2Fjournal.pone.0288723&volume=18&publication_year=2023&author=Soopairin%2CS&author=Patikorn%2CC&author=Taychakhoonavudh%2CS)

[^25]: Gordon, D. E. et al. A SARS-CoV-2 protein interaction map reveals targets for drug repurposing. *Nature* **583**, 459–468 (2020).

[Article](https://doi.org/10.1038%2Fs41586-020-2286-9) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32353859) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7431030) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=A%20SARS-CoV-2%20protein%20interaction%20map%20reveals%20targets%20for%20drug%20repurposing&journal=Nature&doi=10.1038%2Fs41586-020-2286-9&volume=583&pages=459-468&publication_year=2020&author=Gordon%2CDE)

[^26]: Ashuach, T. et al. MultiVI: deep generative model for the integration of multimodal data. *Nat. Methods* **20**, 1222–1231 (2023).

[Article](https://doi.org/10.1038%2Fs41592-023-01909-9) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37386189) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10406609) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=MultiVI%3A%20deep%20generative%20model%20for%20the%20integration%20of%20multimodal%20data&journal=Nat.%20Methods&doi=10.1038%2Fs41592-023-01909-9&volume=20&pages=1222-1231&publication_year=2023&author=Ashuach%2CT)

[^27]: Li Y., Zhang S. Statistical batch-aware embedded integration, dimension reduction, and alignment for spatial transcriptomics. *Bioinformatics* **40**, btae611 (2024).

[^28]: Chen, P. C. et al. An augmented reality microscope with real-time artificial intelligence integration for cancer diagnosis. *Nat. Med.* **25**, 1453–1457 (2019).

[Article](https://doi.org/10.1038%2Fs41591-019-0539-7) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=31406351) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=An%20augmented%20reality%20microscope%20with%20real-time%20artificial%20intelligence%20integration%20for%20cancer%20diagnosis&journal=Nat.%20Med.&doi=10.1038%2Fs41591-019-0539-7&volume=25&pages=1453-1457&publication_year=2019&author=Chen%2CPC)

[^29]: Wang, J. et al. scGNN is a novel graph neural network framework for single-cell RNA-Seq analyses. *Nat. Commun.* **12**, 1882 (2021).

[Article](https://doi.org/10.1038%2Fs41467-021-22197-x) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=33767197) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7994447) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=scGNN%20is%20a%20novel%20graph%20neural%20network%20framework%20for%20single-cell%20RNA-Seq%20analyses&journal=Nat.%20Commun.&doi=10.1038%2Fs41467-021-22197-x&volume=12&publication_year=2021&author=Wang%2CJ)

[^30]: Cao, Z. J. & Gao, G. Multi-omics single-cell data integration and regulatory inference with graph-linked embedding \[J\]. *Nat. Biotechnol.* **40**, 1458–1466 (2022).

[Article](https://doi.org/10.1038%2Fs41587-022-01284-4) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35501393) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9546775) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Multi-omics%20single-cell%20data%20integration%20and%20regulatory%20inference%20with%20graph-linked%20embedding%20%5BJ%5D&journal=Nat.%20Biotechnol.&doi=10.1038%2Fs41587-022-01284-4&volume=40&pages=1458-1466&publication_year=2022&author=Cao%2CZJ&author=Gao%2CG)

[^31]: Cui, H. et al. Towards multimodal foundation models in molecular cell biology. *Nature* **640**, 623–633 (2025).

[Article](https://doi.org/10.1038%2Fs41586-025-08710-y) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40240854) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Towards%20multimodal%20foundation%20models%20in%20molecular%20cell%20biology&journal=Nature&doi=10.1038%2Fs41586-025-08710-y&volume=640&pages=623-633&publication_year=2025&author=Cui%2CH)

[^32]: Xie, X. Q. Exploiting PubChem for virtual screening. *Expert Opin. Drug Discov.* **5**, 1205–1220 (2010).

[Article](https://doi.org/10.1517%2F17460441.2010.524924) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=21691435) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3117665) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Exploiting%20PubChem%20for%20virtual%20screening&journal=Expert%20Opin.%20Drug%20Discov.&doi=10.1517%2F17460441.2010.524924&volume=5&pages=1205-1220&publication_year=2010&author=Xie%2CXQ)

[^33]: Antunes, D. A. et al. HLA-Arena: a customizable environment for the structural modeling and analysis of peptide-hla complexes for cancer immunotherapy. *JCO Clin. Cancer Inform*. **4**, 623–636 (2020).

[^34]: Campagne, F. et al. Quantitative information management for the biochemical computation of cellular networks. *Sci. STKE* **2004**, pl11 (2004).

[Article](https://doi.org/10.1126%2Fstke.2482004pl11) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=15340175) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Quantitative%20information%20management%20for%20the%20biochemical%20computation%20of%20cellular%20networks&journal=Sci.%20STKE&doi=10.1126%2Fstke.2482004pl11&volume=2004&publication_year=2004&author=Campagne%2CF)

[^35]: Tomczak, K., Czerwińska, P. & Wiznerowicz, M. The Cancer Genome Atlas (TCGA): an immeasurable source of knowledge. *Contemp. Oncol.* **19**, A68–A77 (2015).

[Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20Cancer%20Genome%20Atlas%20%28TCGA%29%3A%20an%20immeasurable%20source%20of%20knowledge&journal=Contemp.%20Oncol.&volume=19&pages=A68-A77&publication_year=2015&author=Tomczak%2CK&author=Czerwi%C5%84ska%2CP&author=Wiznerowicz%2CM)

[^36]: Weinstein, J. N. et al. The Cancer Genome Atlas pan-cancer analysis project. *Nat. Genet* **45**, 1113–1120 (2013).

[Article](https://doi.org/10.1038%2Fng.2764) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=24071849) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3919969) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20Cancer%20Genome%20Atlas%20pan-cancer%20analysis%20project&journal=Nat.%20Genet&doi=10.1038%2Fng.2764&volume=45&pages=1113-1120&publication_year=2013&author=Weinstein%2CJN)

[^37]: Thul, P. J. & Lindskog, C. The human protein atlas: a spatial map of the human proteome \[J\]. *Protein Sci.* **27**, 233–244 (2018).

[Article](https://doi.org/10.1002%2Fpro.3307) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=28940711) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20human%20protein%20atlas%3A%20a%20spatial%20map%20of%20the%20human%20proteome%20%5BJ%5D&journal=Protein%20Sci.&doi=10.1002%2Fpro.3307&volume=27&pages=233-244&publication_year=2018&author=Thul%2CPJ&author=Lindskog%2CC)

[^38]: Digre, A. & Lindskog, C. The Human Protein Atlas-spatial localization of the human proteome in health and disease. *Protein Sci.* **30**, 218–233 (2021).

[Article](https://doi.org/10.1002%2Fpro.3987) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=33146890) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20Human%20Protein%20Atlas-spatial%20localization%20of%20the%20human%20proteome%20in%20health%20and%20disease&journal=Protein%20Sci.&doi=10.1002%2Fpro.3987&volume=30&pages=218-233&publication_year=2021&author=Digre%2CA&author=Lindskog%2CC)

[^39]: Pontén, F., Jirström, K. & Uhlen, M. The Human Protein Atlas—a tool for pathology. *J. Pathol.* **216**, 387–393 (2008).

[Article](https://doi.org/10.1002%2Fpath.2440) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=18853439) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20Human%20Protein%20Atlas%E2%80%94a%20tool%20for%20pathology&journal=J.%20Pathol.&doi=10.1002%2Fpath.2440&volume=216&pages=387-393&publication_year=2008&author=Pont%C3%A9n%2CF&author=Jirstr%C3%B6m%2CK&author=Uhlen%2CM)

[^40]: Clough, E. & Barrett, T. The Gene Expression Omnibus Database. *Methods Mol. Biol.* **1418**, 93–110 (2016).

[Article](https://link.springer.com/doi/10.1007/978-1-4939-3578-9_5) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=27008011) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4944384) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20Gene%20Expression%20Omnibus%20Database&journal=Methods%20Mol.%20Biol.&doi=10.1007%2F978-1-4939-3578-9_5&volume=1418&pages=93-110&publication_year=2016&author=Clough%2CE&author=Barrett%2CT)

[^41]: Barrett, T. et al. NCBI GEO: archive for functional genomics data sets—update. *Nucleic Acids Res.* **41**, D991–D995 (2013).

[Article](https://doi.org/10.1093%2Fnar%2Fgks1193) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=23193258) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=NCBI%20GEO%3A%20archive%20for%20functional%20genomics%20data%20sets%E2%80%94update&journal=Nucleic%20Acids%20Res.&doi=10.1093%2Fnar%2Fgks1193&volume=41&pages=D991-D995&publication_year=2013&author=Barrett%2CT)

[^42]: Edgar, R., Domrachev, M. & Lash, A. E. Gene expression omnibus: NCBI gene expression and hybridization array data repository. *Nucleic Acids Res.* **30**, 207–210 (2002).

[Article](https://doi.org/10.1093%2Fnar%2F30.1.207) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=11752295) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC99122) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Gene%20expression%20omnibus%3A%20NCBI%20gene%20expression%20and%20hybridization%20array%20data%20repository&journal=Nucleic%20Acids%20Res.&doi=10.1093%2Fnar%2F30.1.207&volume=30&pages=207-210&publication_year=2002&author=Edgar%2CR&author=Domrachev%2CM&author=Lash%2CAE)

[^43]: Rasnic, R. et al. Substantial batch effects in TCGA exome sequences undermine pan-cancer analysis of germline variants. *BMC Cancer* **19**, 783 (2019).

[Article](https://link.springer.com/doi/10.1186/s12885-019-5994-5) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=31391007) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC6686424) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Substantial%20batch%20effects%20in%20TCGA%20exome%20sequences%20undermine%20pan-cancer%20analysis%20of%20germline%20variants&journal=BMC%20Cancer&doi=10.1186%2Fs12885-019-5994-5&volume=19&publication_year=2019&author=Rasnic%2CR)

[^44]: Ghaddar B. C., Blaser M. J., De S. Revisiting the cancer microbiome using PRISM \[J\]. bioRxiv, 2025.

[^45]: Engin, B. & Güner, O. R. Negative evaluation of a pathergy test in hepatitis B surface antigen carriers. *J. Dermatol* **33**, 547–549 (2006).

[Article](https://doi.org/10.1111%2Fj.1346-8138.2006.00129.x) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=16923136) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Negative%20evaluation%20of%20a%20pathergy%20test%20in%20hepatitis%20B%20surface%20antigen%20carriers&journal=J.%20Dermatol&doi=10.1111%2Fj.1346-8138.2006.00129.x&volume=33&pages=547-549&publication_year=2006&author=Engin%2CB&author=G%C3%BCner%2COR)

[^46]: Johnson, W. E., Li, C. & Rabinovic, A. Adjusting batch effects in microarray expression data using empirical Bayes methods. *Biostatistics* **8**, 118–127 (2007).

[Article](https://doi.org/10.1093%2Fbiostatistics%2Fkxj037) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=16632515) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Adjusting%20batch%20effects%20in%20microarray%20expression%20data%20using%20empirical%20Bayes%20methods&journal=Biostatistics&doi=10.1093%2Fbiostatistics%2Fkxj037&volume=8&pages=118-127&publication_year=2007&author=Johnson%2CWE&author=Li%2CC&author=Rabinovic%2CA)

[^47]: Wang, J. ComBat-met: adjusting batch effects in DNA methylation data. *NAR Genom. Bioinform* **7**, lqaf062 (2025).

[Article](https://doi.org/10.1093%2Fnargab%2Flqaf062) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40391088) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC12086544) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=ComBat-met%3A%20adjusting%20batch%20effects%20in%20DNA%20methylation%20data&journal=NAR%20Genom.%20Bioinform&doi=10.1093%2Fnargab%2Flqaf062&volume=7&publication_year=2025&author=Wang%2CJ)

[^48]: Leach, D. T. et al. malbacR: a package for standardized implementation of batch correction methods for omics data. *Anal. Chem.* **95**, 12195–12199 (2023).

[Article](https://doi.org/10.1021%2Facs.analchem.3c01289) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37551970) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=malbacR%3A%20a%20package%20for%20standardized%20implementation%20of%20batch%20correction%20methods%20for%20omics%20data&journal=Anal.%20Chem.&doi=10.1021%2Facs.analchem.3c01289&volume=95&pages=12195-12199&publication_year=2023&author=Leach%2CDT)

[^49]: Antonsson, S. E. & Melsted, P. Batch correction methods used in single-cell RNA sequencing analyses are often poorly calibrated. *Genome Res.* **35**, 1832–1841 (2025).

[Article](https://doi.org/10.1101%2Fgr.279886.124) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40623818) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC12315870) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Batch%20correction%20methods%20used%20in%20single-cell%20RNA%20sequencing%20analyses%20are%20often%20poorly%20calibrated&journal=Genome%20Res.&doi=10.1101%2Fgr.279886.124&volume=35&pages=1832-1841&publication_year=2025&author=Antonsson%2CSE&author=Melsted%2CP)

[^50]: Kepp, O. et al. Consensus guidelines for the detection of immunogenic cell death. *Oncoimmunology* **3**, e955691 (2014).

[Article](https://doi.org/10.4161%2F21624011.2014.955691) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=25941621) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4292729) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Consensus%20guidelines%20for%20the%20detection%20of%20immunogenic%20cell%20death&journal=Oncoimmunology&doi=10.4161%2F21624011.2014.955691&volume=3&publication_year=2014&author=Kepp%2CO)

[^51]: Korsunsky, I. et al. Fast, sensitive and accurate integration of single-cell data with Harmony. *Nat. Methods* **16**, 1289–1296 (2019).

[Article](https://doi.org/10.1038%2Fs41592-019-0619-0) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=31740819) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC6884693) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Fast%2C%20sensitive%20and%20accurate%20integration%20of%20single-cell%20data%20with%20Harmony&journal=Nat.%20Methods&doi=10.1038%2Fs41592-019-0619-0&volume=16&pages=1289-1296&publication_year=2019&author=Korsunsky%2CI)

[^52]: Leek, J. T. et al. Tackling the widespread and critical impact of batch effects in high-throughput data. *Nat. Rev. Genet* **11**, 733–739 (2010).

[Article](https://doi.org/10.1038%2Fnrg2825) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=20838408) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Tackling%20the%20widespread%20and%20critical%20impact%20of%20batch%20effects%20in%20high-throughput%20data&journal=Nat.%20Rev.%20Genet&doi=10.1038%2Fnrg2825&volume=11&pages=733-739&publication_year=2010&author=Leek%2CJT)

[^53]: Chen, C. et al. Removing batch effects in analysis of expression microarray data: an evaluation of six batch adjustment methods. *PLoS One* **6**, e17238 (2011).

[Article](https://doi.org/10.1371%2Fjournal.pone.0017238) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=21386892) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3046121) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Removing%20batch%20effects%20in%20analysis%20of%20expression%20microarray%20data%3A%20an%20evaluation%20of%20six%20batch%20adjustment%20methods&journal=PLoS%20One&doi=10.1371%2Fjournal.pone.0017238&volume=6&publication_year=2011&author=Chen%2CC)

[^54]: Zhou et al. Outlier detection method based on high-density iteration. *Inf. Sci.* **662**, 120268 (2024).

[Article](https://doi.org/10.1016%2Fj.ins.2024.120286) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Outlier%20detection%20method%20based%20on%20high-density%20iteration&journal=Inf.%20Sci.&doi=10.1016%2Fj.ins.2024.120286&volume=662&publication_year=2024&author=Zhou%2C)

[^55]: Theodoris, C. V. et al. Transfer learning enables predictions in network biology. *Nature* **618**, 616–624 (2023).

[Article](https://doi.org/10.1038%2Fs41586-023-06139-9) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37258680) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10949956) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Transfer%20learning%20enables%20predictions%20in%20network%20biology&journal=Nature&doi=10.1038%2Fs41586-023-06139-9&volume=618&pages=616-624&publication_year=2023&author=Theodoris%2CCV)

[^56]: Hao, M. et al. Large-scale foundation model on single-cell transcriptomics. *Nat. Methods* **21**, 1481–1491 (2024).

[Article](https://doi.org/10.1038%2Fs41592-024-02305-7) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38844628) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Large-scale%20foundation%20model%20on%20single-cell%20transcriptomics&journal=Nat.%20Methods&doi=10.1038%2Fs41592-024-02305-7&volume=21&pages=1481-1491&publication_year=2024&author=Hao%2CM)

[^57]: Roohani, Y., Huang, K. & Leskovec, J. Predicting transcriptional outcomes of novel multigene perturbations with GEARS. *Nat. Biotechnol.* **42**, 927–935 (2024).

[Article](https://doi.org/10.1038%2Fs41587-023-01905-6) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37592036) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Predicting%20transcriptional%20outcomes%20of%20novel%20multigene%20perturbations%20with%20GEARS&journal=Nat.%20Biotechnol.&doi=10.1038%2Fs41587-023-01905-6&volume=42&pages=927-935&publication_year=2024&author=Roohani%2CY&author=Huang%2CK&author=Leskovec%2CJ)

[^58]: Adduri et al. Predicting cellular responses to perturbation across diverse contexts with State. bioRxiv, 2025.

[^59]: He, D. et al. A context-aware deconfounding autoencoder for robust prediction of personalized clinical drug response from cell-line compound screening. *Nat. Mach. Intell.* **4**, 879–892 (2022).

[Article](https://doi.org/10.1038%2Fs42256-022-00541-0) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38895093) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11185412) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=A%20context-aware%20deconfounding%20autoencoder%20for%20robust%20prediction%20of%20personalized%20clinical%20drug%20response%20from%20cell-line%20compound%20screening&journal=Nat.%20Mach.%20Intell.&doi=10.1038%2Fs42256-022-00541-0&volume=4&pages=879-892&publication_year=2022&author=He%2CD)

[^60]: Chen, J. et al. Deep transfer learning of cancer drug responses by integrating bulk and single-cell RNA-seq data. *Nat. Commun.* **13**, 6494 (2022).

[Article](https://doi.org/10.1038%2Fs41467-022-34277-7) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=36310235) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9618578) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Deep%20transfer%20learning%20of%20cancer%20drug%20responses%20by%20integrating%20bulk%20and%20single-cell%20RNA-seq%20data&journal=Nat.%20Commun.&doi=10.1038%2Fs41467-022-34277-7&volume=13&publication_year=2022&author=Chen%2CJ)

[^61]: Bang, D., Koo, B. & Kim, S. Transfer learning of condition-specific perturbation in gene interactions improves drug response prediction. *Bioinformatics* **40**, i130–i139 (2024).

[Article](https://doi.org/10.1093%2Fbioinformatics%2Fbtae249) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38940127) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11256952) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Transfer%20learning%20of%20condition-specific%20perturbation%20in%20gene%20interactions%20improves%20drug%20response%20prediction&journal=Bioinformatics&doi=10.1093%2Fbioinformatics%2Fbtae249&volume=40&pages=i130-i139&publication_year=2024&author=Bang%2CD&author=Koo%2CB&author=Kim%2CS)

[^62]: Zheng, Y. et al. A deep generative model for deciphering cellular dynamics and in silico drug discovery in complex diseases. *Nat. Biomed. Eng.* **10**, 1038 (2025).

[^63]: Morehead, A., Cheng, J. FlowDock: geometric flow matching for generative protein-ligand docking and affinity prediction. ArXiv, 2025.

[^64]: Yu Z, Xia, Hao, Yu, Dahui, Cheng, Jiaoyang, Li, Jichun

[^65]: Wang, P. et al. Score-based image-to-image brownian bridge. *Proc. ACM Int Conf. Multimed.* **2024**, 10765–10773 (2024).

[PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40201137) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11977112) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Score-based%20image-to-image%20brownian%20bridge&journal=Proc.%20ACM%20Int%20Conf.%20Multimed.&volume=2024&pages=10765-10773&publication_year=2024&author=Wang%2CP)

[^66]: Luo, E. et al. scDiffusion: conditional generation of high-quality single-cell data using diffusion model. *Bioinformatics* **40**, btae518 (2024).

[^67]: Ahlmann-Eltze, C., Huber, W. & Anders, S. Deep-learning-based gene perturbation effect prediction does not yet outperform simple linear baselines. *Nat. Methods* **22**, 1657–1661 (2025).

[Article](https://doi.org/10.1038%2Fs41592-025-02772-6) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40759747) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC12328236) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Deep-learning-based%20gene%20perturbation%20effect%20prediction%20does%20not%20yet%20outperform%20simple%20linear%20baselines&journal=Nat.%20Methods&doi=10.1038%2Fs41592-025-02772-6&volume=22&pages=1657-1661&publication_year=2025&author=Ahlmann-Eltze%2CC&author=Huber%2CW&author=Anders%2CS)

[^68]: Feng, K. et al. Shared growth of graph neural networks via prompted free-direction knowledge distillation. *IEEE Trans. Pattern Anal. Mach. Intell.* **47**, 4377–4394 (2025).

[Article](https://doi.org/10.1109%2FTPAMI.2025.3543211) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40036451) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Shared%20growth%20of%20graph%20neural%20networks%20via%20prompted%20free-direction%20knowledge%20distillation&journal=IEEE%20Trans.%20Pattern%20Anal.%20Mach.%20Intell.&doi=10.1109%2FTPAMI.2025.3543211&volume=47&pages=4377-4394&publication_year=2025&author=Feng%2CK)

[^69]: Sun J., et al. GNN codon adjacency tunes protein translation. *Int. J. Mol. Sci.* **25**, 5914 (2024).

[^70]: Mccardle, K. Shedding light on GNN affinity predictions. *Nat. Comput Sci.* **3**, 1004 (2023).

[Article](https://doi.org/10.1038%2Fs43588-023-00583-3) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38177733) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Shedding%20light%20on%20GNN%20affinity%20predictions&journal=Nat.%20Comput%20Sci.&doi=10.1038%2Fs43588-023-00583-3&volume=3&publication_year=2023&author=Mccardle%2CK)

[^71]: Réau, M. et al. DeepRank-GNN: a graph neural network. *Bioinformatics* **39**, 759 (2023).

[^72]: Dong, Z., Feng, J. & Ji, Y. et al. SLI-GNN: a self-learning-input graph neural network for predicting crystal and molecular properties. *J. Phys. Chem. A* **127**, 5921–5929 (2023).

[Article](https://doi.org/10.1021%2Facs.jpca.3c01558) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37418164) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=SLI-GNN%3A%20a%20self-learning-input%20graph%20neural%20network%20for%20predicting%20crystal%20and%20molecular%20properties.&journal=J.%20Phys.%20Chem.%20A&doi=10.1021%2Facs.jpca.3c01558&volume=127&pages=5921-5929&publication_year=2023&author=Dong%2CZ&author=Feng%2CJ&author=Ji%2CY)

[^73]: Wang, R.H., Luo, T. & Zhang, H.L. et al. PLA-GNN: computational inference of protein subcellular location alterations under drug treatments with deep graph neural networks. *Comput. Biol. Med.* **157**, 106775 (2023).

[Article](https://doi.org/10.1016%2Fj.compbiomed.2023.106775) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=36921458) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=PLA-GNN%3A%20computational%20inference%20of%20protein%20subcellular%20location%20alterations%20under%20drug%20treatments%20with%20deep%20graph%20neural%20networks.&journal=Comput.%20Biol.%20Med.&doi=10.1016%2Fj.compbiomed.2023.106775&volume=157&publication_year=2023&author=Wang%2CRH&author=Luo%2CT&author=Zhang%2CHL)

[^74]: Chen, S. et al. MD-GNN: a mechanism-data-driven graph neural network for molecular properties prediction and new material discovery. *J. Mol. Graph Model* **123**, 108506 (2023).

[Article](https://doi.org/10.1016%2Fj.jmgm.2023.108506) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37182505) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=MD-GNN%3A%20a%20mechanism-data-driven%20graph%20neural%20network%20for%20molecular%20properties%20prediction%20and%20new%20material%20discovery&journal=J.%20Mol.%20Graph%20Model&doi=10.1016%2Fj.jmgm.2023.108506&volume=123&publication_year=2023&author=Chen%2CS)

[^75]: Wang, H. et al. CCF-GNN: a unified model aggregating appearance, microenvironment, and topology for pathology image classification. *IEEE Trans. Med Imaging* **42**, 3179–3193 (2023).

[Article](https://doi.org/10.1109%2FTMI.2023.3249343) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37027573) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=CCF-GNN%3A%20a%20unified%20model%20aggregating%20appearance%2C%20microenvironment%2C%20and%20topology%20for%20pathology%20image%20classification&journal=IEEE%20Trans.%20Med%20Imaging&doi=10.1109%2FTMI.2023.3249343&volume=42&pages=3179-3193&publication_year=2023&author=Wang%2CH)

[^76]: Li, W. et al. Drug repurposing based on the DTD-GNN graph neural network: revealing the relationships among drugs, targets and diseases. *BMC Genomics* **25**, 584 (2024).

[Article](https://link.springer.com/doi/10.1186/s12864-024-10499-5) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38862928) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11165810) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Drug%20repurposing%20based%20on%20the%20DTD-GNN%20graph%20neural%20network%3A%20revealing%20the%20relationships%20among%20drugs%2C%20targets%20and%20diseases&journal=BMC%20Genomics&doi=10.1186%2Fs12864-024-10499-5&volume=25&publication_year=2024&author=Li%2CW)

[^77]: Li S., Hua H., Chen S. Graph neural networks for single-cell omics data: a review of approaches and applications. *Brief Bioinform.* **26**, 109 (2025).

[^78]: Ning, X. et al. Physics-informed neural networks integrating compartmental model for analyzing COVID-19 transmission dynamics. *Viruses* 15, 1749 (2023).

[^79]: Sharpee T. O., et al. 25th annual computational neuroscience meeting: CNS-2016. *BMC Neurosci*. **17**, 54 (2016).

[^80]: Song, Y. et al. SRS-Net: a universal framework for solving stimulated Raman scattering in nonlinear fiber-optic systems by physics-informed deep learning. *Commun. Eng.* **3**, 109 (2024).

[Article](https://doi.org/10.1038%2Fs44172-024-00253-w) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39107381) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11303545) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=SRS-Net%3A%20a%20universal%20framework%20for%20solving%20stimulated%20Raman%20scattering%20in%20nonlinear%20fiber-optic%20systems%20by%20physics-informed%20deep%20learning&journal=Commun.%20Eng.&doi=10.1038%2Fs44172-024-00253-w&volume=3&publication_year=2024&author=Song%2CY)

[^81]: Lagergren, J. H. et al. Biologically-informed neural networks guide mechanistic modeling from sparse experimental data. *PLoS Comput Biol.* **16**, e1008462 (2020).

[Article](https://doi.org/10.1371%2Fjournal.pcbi.1008462) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=33259472) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7732115) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Biologically-informed%20neural%20networks%20guide%20mechanistic%20modeling%20from%20sparse%20experimental%20data&journal=PLoS%20Comput%20Biol.&doi=10.1371%2Fjournal.pcbi.1008462&volume=16&publication_year=2020&author=Lagergren%2CJH)

[^82]: Sattari, A. Machine learning in biofluid mechanics: a review of recent developments. *Comput. Biol. Med.* **193**, 110410 (2025).

[Article](https://doi.org/10.1016%2Fj.compbiomed.2025.110410) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40413894) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Machine%20learning%20in%20biofluid%20mechanics%3A%20a%20review%20of%20recent%20developments.&journal=Comput.%20Biol.%20Med.&doi=10.1016%2Fj.compbiomed.2025.110410&volume=193&publication_year=2025&author=Sattari%2CA)

[^83]: Colombo, M. et al. HER2 targeting as a two-sided strategy for breast cancer diagnosis and treatment: Outlook and recent implications in nanomedical approaches. *Pharm. Res.* **62**, 150–165 (2010).

[Article](https://doi.org/10.1016%2Fj.phrs.2010.01.013) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=HER2%20targeting%20as%20a%20two-sided%20strategy%20for%20breast%20cancer%20diagnosis%20and%20treatment%3A%20Outlook%20and%20recent%20implications%20in%20nanomedical%20approaches&journal=Pharm.%20Res.&doi=10.1016%2Fj.phrs.2010.01.013&volume=62&pages=150-165&publication_year=2010&author=Colombo%2CM)

[^84]: Yang S., et al. Up-regulation of CXCL8 expression is associated with a poor prognosis and enhances tumor cell malignant behaviors in liver cancer. *Biosci. Rep*. **40**, BSR20201169 (2020).

[^85]: Zhang, Z. & Qu, Z. Bistable nerve conduction. *Biophys. J.* **121**, 3499–3507 (2022).

[Article](https://doi.org/10.1016%2Fj.bpj.2022.08.006) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35962548) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9515125) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Bistable%20nerve%20conduction&journal=Biophys.%20J.&doi=10.1016%2Fj.bpj.2022.08.006&volume=121&pages=3499-3507&publication_year=2022&author=Zhang%2CZ&author=Qu%2CZ)

[^86]: Griffith, B. E. & Peskin, C. S. Electrophysiology. *Commun. Pure Appl Math.* **66**, 1837–1913 (2013).

[Article](https://doi.org/10.1002%2Fcpa.21484) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=36237603) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9555824) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Electrophysiology&journal=Commun.%20Pure%20Appl%20Math.&doi=10.1002%2Fcpa.21484&volume=66&pages=1837-1913&publication_year=2013&author=Griffith%2CBE&author=Peskin%2CCS)

[^87]: Zhang, X. et al. Physics-informed neural networks (PINNs) for 4D hemodynamics prediction: an investigation of optimal framework based on vascular morphology. *Comput Biol. Med.* **164**, 107287 (2023).

[Article](https://doi.org/10.1016%2Fj.compbiomed.2023.107287) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37536096) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Physics-informed%20neural%20networks%20%28PINNs%29%20for%204D%20hemodynamics%20prediction%3A%20an%20investigation%20of%20optimal%20framework%20based%20on%20vascular%20morphology&journal=Comput%20Biol.%20Med.&doi=10.1016%2Fj.compbiomed.2023.107287&volume=164&publication_year=2023&author=Zhang%2CX)

[^88]: Malashin I., et al. Physics-informed neural networks in polymers: a review. *Polymers* **17**, 1108 (2025).

[^89]: Nam, Y. et al. Harnessing artificial intelligence in multimodal omics data integration: paving the path for the next frontier in precision medicine. *Annu. Rev. Biomed. Data Sci.* **7**, 225–250 (2024).

[Article](https://doi.org/10.1146%2Fannurev-biodatasci-102523-103801) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38768397) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11972123) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Harnessing%20artificial%20intelligence%20in%20multimodal%20omics%20data%20integration%3A%20paving%20the%20path%20for%20the%20next%20frontier%20in%20precision%20medicine&journal=Annu.%20Rev.%20Biomed.%20Data%20Sci.&doi=10.1146%2Fannurev-biodatasci-102523-103801&volume=7&pages=225-250&publication_year=2024&author=Nam%2CY)

[^90]: Yang, X. et al. scCross: a deep generative model for unifying single-cell multi-omics with seamless integration, cross-modal generation, and in silico exploration. *Genome Biol.* **25**, 198 (2024).

[Article](https://link.springer.com/doi/10.1186/s13059-024-03338-z) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39075536) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11285326) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=scCross%3A%20a%20deep%20generative%20model%20for%20unifying%20single-cell%20multi-omics%20with%20seamless%20integration%2C%20cross-modal%20generation%2C%20and%20in%20silico%20exploration&journal=Genome%20Biol.&doi=10.1186%2Fs13059-024-03338-z&volume=25&publication_year=2024&author=Yang%2CX)

[^91]: Wang G., et al. Modeling and predicting single-cell multi-gene perturbation responses with scLAMBDA \[J\]. bioRxiv, 2024.

[^92]: Kana, O. et al. Generative modeling of single-cell gene expression for dose-dependent chemical perturbations. *Patterns* **4**, 100817 (2023).

[Article](https://doi.org/10.1016%2Fj.patter.2023.100817) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37602218) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10436058) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Generative%20modeling%20of%20single-cell%20gene%20expression%20for%20dose-dependent%20chemical%20perturbations&journal=Patterns&doi=10.1016%2Fj.patter.2023.100817&volume=4&publication_year=2023&author=Kana%2CO)

[^93]: Bunne, C. et al. Learning single-cell perturbation responses using neural optimal transport. *Nat. Methods* **20**, 1759–1768 (2023).

[Article](https://doi.org/10.1038%2Fs41592-023-01969-x) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37770709) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10630137) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Learning%20single-cell%20perturbation%20responses%20using%20neural%20optimal%20transport&journal=Nat.%20Methods&doi=10.1038%2Fs41592-023-01969-x&volume=20&pages=1759-1768&publication_year=2023&author=Bunne%2CC)

[^94]: Denoeud, A. et al. Dynamic X-ray diffraction observation of shocked solid iron up to 170GPa. *Proc. Natl. Acad. Sci. USA* **113**, 7745–7749 (2016).

[Article](https://doi.org/10.1073%2Fpnas.1512127113) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=27357672) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4948315) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Dynamic%20X-ray%20diffraction%20observation%20of%20shocked%20solid%20iron%20up%20to%20170GPa&journal=Proc.%20Natl.%20Acad.%20Sci.%20USA&doi=10.1073%2Fpnas.1512127113&volume=113&pages=7745-7749&publication_year=2016&author=Denoeud%2CA)

[^95]: Zhu L., et al. Microfluidic-based platforms for cell-to-cell communication studies. *Biofabrication* **16**, 1116 (2023).

[^96]: Hoops, S. et al. COPASI—a complex pathway simulator. *Bioinformatics* **22**, 3067–3074 (2006).

[Article](https://doi.org/10.1093%2Fbioinformatics%2Fbtl485) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=17032683) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=COPASI%E2%80%94a%20complex%20pathway%20simulator&journal=Bioinformatics&doi=10.1093%2Fbioinformatics%2Fbtl485&volume=22&pages=3067-3074&publication_year=2006&author=Hoops%2CS)

[^97]: Red. \[Not Available\]. *MMW Fortschr. Med.* **87**, 158 (2016).

[^98]: Bergmann, F. T. et al. COPASI and its applications in biotechnology. *J. Biotechnol.* **261**, 215–220 (2017).

[Article](https://doi.org/10.1016%2Fj.jbiotec.2017.06.1200) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=28655634) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC5623632) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=COPASI%20and%20its%20applications%20in%20biotechnology&journal=J.%20Biotechnol.&doi=10.1016%2Fj.jbiotec.2017.06.1200&volume=261&pages=215-220&publication_year=2017&author=Bergmann%2CFT)

[^99]: Sütterlin, T. et al. Bridging the scales: semantic integration of quantitative SBML in graphical multi-cellular models and simulations with EPISIM and COPASI. *Bioinformatics* **29**, 223–229 (2013).

[Article](https://doi.org/10.1093%2Fbioinformatics%2Fbts659) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=23162085) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Bridging%20the%20scales%3A%20semantic%20integration%20of%20quantitative%20SBML%20in%20graphical%20multi-cellular%20models%20and%20simulations%20with%20EPISIM%20and%20COPASI&journal=Bioinformatics&doi=10.1093%2Fbioinformatics%2Fbts659&volume=29&pages=223-229&publication_year=2013&author=S%C3%BCtterlin%2CT)

[^100]: Cao, L. et al. Auditory perception modulated by word reading. *Exp. Brain Res* **234**, 3049–3057 (2016).

[Article](https://link.springer.com/doi/10.1007/s00221-016-4706-5) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=27324193) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC5025489) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Auditory%20perception%20modulated%20by%20word%20reading&journal=Exp.%20Brain%20Res&doi=10.1007%2Fs00221-016-4706-5&volume=234&pages=3049-3057&publication_year=2016&author=Cao%2CL)

[^101]: Blinov, M. L. et al. BioNetGen: software for rule-based modeling of signal transduction based on the interactions of molecular domains. *Bioinformatics* **20**, 3289–3291 (2004).

[Article](https://doi.org/10.1093%2Fbioinformatics%2Fbth378) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=15217809) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=BioNetGen%3A%20software%20for%20rule-based%20modeling%20of%20signal%20transduction%20based%20on%20the%20interactions%20of%20molecular%20domains&journal=Bioinformatics&doi=10.1093%2Fbioinformatics%2Fbth378&volume=20&pages=3289-3291&publication_year=2004&author=Blinov%2CML)

[^102]: Husar, A. et al. MCell4 with BioNetGen: a Monte Carlo simulator of rule-based reaction-diffusion systems with Python interface. *PLoS Comput. Biol.* **20**, e1011800 (2024).

[Article](https://doi.org/10.1371%2Fjournal.pcbi.1011800) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38656994) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11073787) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=MCell4%20with%20BioNetGen%3A%20a%20Monte%20Carlo%20simulator%20of%20rule-based%20reaction-diffusion%20systems%20with%20Python%20interface&journal=PLoS%20Comput.%20Biol.&doi=10.1371%2Fjournal.pcbi.1011800&volume=20&publication_year=2024&author=Husar%2CA)

[^103]: Lopez, C. F. et al. Programming biological models in Python using PySB. *Mol. Syst. Biol.* **9**, 646 (2013).

[Article](https://doi.org/10.1038%2Fmsb.2013.1) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=23423320) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3588907) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Programming%20biological%20models%20in%20Python%20using%20PySB&journal=Mol.%20Syst.%20Biol.&doi=10.1038%2Fmsb.2013.1&volume=9&publication_year=2013&author=Lopez%2CCF)

[^104]: Vykoukal, J. V., Fahrmann, J. F. & Thompson, T. C. Caveolin and lipid domains-close companions in managing cellular pathways. *Cancer Metastasis Rev.* **39**, 341–342 (2020).

[Article](https://link.springer.com/doi/10.1007/s10555-020-09891-w) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32417992) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Caveolin%20and%20lipid%20domains-close%20companions%20in%20managing%20cellular%20pathways&journal=Cancer%20Metastasis%20Rev.&doi=10.1007%2Fs10555-020-09891-w&volume=39&pages=341-342&publication_year=2020&author=Vykoukal%2CJV&author=Fahrmann%2CJF&author=Thompson%2CTC)

[^105]: Terfve, C. et al. CellNOptR: a flexible toolkit to train protein signaling networks to data using multiple logic formalisms. *BMC Syst. Biol.* **6**, 133 (2012).

[Article](https://link.springer.com/doi/10.1186/1752-0509-6-133) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=23079107) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3605281) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=CellNOptR%3A%20a%20flexible%20toolkit%20to%20train%20protein%20signaling%20networks%20to%20data%20using%20multiple%20logic%20formalisms&journal=BMC%20Syst.%20Biol.&doi=10.1186%2F1752-0509-6-133&volume=6&publication_year=2012&author=Terfve%2CC)

[^106]: Gjerga, E. et al. Converting networks to predictive logic models from perturbation signalling data with CellNOpt. *Bioinformatics* **36**, 4523–4524 (2020).

[Article](https://doi.org/10.1093%2Fbioinformatics%2Fbtaa561) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32516357) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7575044) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Converting%20networks%20to%20predictive%20logic%20models%20from%20perturbation%20signalling%20data%20with%20CellNOpt&journal=Bioinformatics&doi=10.1093%2Fbioinformatics%2Fbtaa561&volume=36&pages=4523-4524&publication_year=2020&author=Gjerga%2CE)

[^107]: Helikar, T., Kowal, B. & Rogers, J. A. A cell simulator platform: the cell collective. *Clin. Pharm. Ther.* **93**, 393–395 (2013).

[Article](https://doi.org/10.1038%2Fclpt.2013.41) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=A%20cell%20simulator%20platform%3A%20the%20cell%20collective&journal=Clin.%20Pharm.%20Ther.&doi=10.1038%2Fclpt.2013.41&volume=93&pages=393-395&publication_year=2013&author=Helikar%2CT&author=Kowal%2CB&author=Rogers%2CJA)

[^108]: Proença, S. et al. Insights into in vitro biokinetics using virtual cell based assay simulations. *Altex* **36**, 447–461 (2019).

[PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=30924507) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Insights%20into%20in%20vitro%20biokinetics%20using%20virtual%20cell%20based%20assay%20simulations&journal=Altex&volume=36&pages=447-461&publication_year=2019&author=Proen%C3%A7a%2CS)

[^109]: Comenges, J. M. Z. et al. Theoretical and mathematical foundation of the virtual cell based assay - a review. *Toxicol. Vitr.* **45**, 209–221 (2017).

[Article](https://doi.org/10.1016%2Fj.tiv.2016.07.013) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Theoretical%20and%20mathematical%20foundation%20of%20the%20virtual%20cell%20based%20assay%20-%20a%20review&journal=Toxicol.%20Vitr.&doi=10.1016%2Fj.tiv.2016.07.013&volume=45&pages=209-221&publication_year=2017&author=Comenges%2CJMZ)

[^110]: Ghaffarizadeh, A. et al. PhysiCell: an open source physics-based cell simulator for 3-D multicellular systems. *PLoS Comput Biol.* **14**, e1005991 (2018).

[Article](https://doi.org/10.1371%2Fjournal.pcbi.1005991) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=29474446) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC5841829) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=PhysiCell%3A%20an%20open%20source%20physics-based%20cell%20simulator%20for%203-D%20multicellular%20systems&journal=PLoS%20Comput%20Biol.&doi=10.1371%2Fjournal.pcbi.1005991&volume=14&publication_year=2018&author=Ghaffarizadeh%2CA)

[^111]: Heiland R., et al. PhysiCell Studio: a graphical tool to make agent-based modeling more accessible. bioRxiv, 2023.

[^112]: Heiland, R. et al. PhysiCell Studio: a graphical tool to make agent-based modeling more accessible. *GigaByte* **2024**, gigabyte128 (2024).

[Article](https://doi.org/10.46471%2Fgigabyte.128) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38948511) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11211762) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=PhysiCell%20Studio%3A%20a%20graphical%20tool%20to%20make%20agent-based%20modeling%20more%20accessible&journal=GigaByte&doi=10.46471%2Fgigabyte.128&volume=2024&publication_year=2024&author=Heiland%2CR)

[^113]: Smeriglio, R. et al. Start & Stop: a physicell and physiBoSS 2.0 add-on for interactive simulation control. *BMC Bioinforma.* **26**, 158 (2025).

[Article](https://link.springer.com/doi/10.1186/s12859-025-06144-x) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Start%20%26%20Stop%3A%20a%20physicell%20and%20physiBoSS%202.0%20add-on%20for%20interactive%20simulation%20control&journal=BMC%20Bioinforma.&doi=10.1186%2Fs12859-025-06144-x&volume=26&publication_year=2025&author=Smeriglio%2CR)

[^114]: Swat, M. H. et al. Multi-scale modeling of tissues using CompuCell3D. *Methods Cell Biol.* **110**, 325–366 (2012).

[Article](https://doi.org/10.1016%2FB978-0-12-388403-9.00013-8) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=22482955) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3612985) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Multi-scale%20modeling%20of%20tissues%20using%20CompuCell3D&journal=Methods%20Cell%20Biol.&doi=10.1016%2FB978-0-12-388403-9.00013-8&volume=110&pages=325-366&publication_year=2012&author=Swat%2CMH)

[^115]: Fortuna, I. et al. CompuCell3D simulations reproduce mesenchymal cell migration on flat substrates. *Biophys. J.* **118**, 2801–2815 (2020).

[Article](https://doi.org/10.1016%2Fj.bpj.2020.04.024) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32407685) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7264849) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=CompuCell3D%20simulations%20reproduce%20mesenchymal%20cell%20migration%20on%20flat%20substrates&journal=Biophys.%20J.&doi=10.1016%2Fj.bpj.2020.04.024&volume=118&pages=2801-2815&publication_year=2020&author=Fortuna%2CI)

[^116]: Liu, R. et al. Development of a coupled simulation toolkit for computational radiation biology based on Geant4 and CompuCell3D. *Phys. Med Biol.* **66**, 045026 (2021).

[Article](https://doi.org/10.1088%2F1361-6560%2Fabd4f9) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=33339019) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Development%20of%20a%20coupled%20simulation%20toolkit%20for%20computational%20radiation%20biology%20based%20on%20Geant4%20and%20CompuCell3D&journal=Phys.%20Med%20Biol.&doi=10.1088%2F1361-6560%2Fabd4f9&volume=66&publication_year=2021&author=Liu%2CR)

[^117]: Palm, M. M. & Merks, R. M. Large-scale parameter studies of cell-based models of tissue morphogenesis using compucell3D or VirtualLeaf. *Methods Mol. Biol.* **1189**, 301–322 (2015).

[Article](https://link.springer.com/doi/10.1007/978-1-4939-1164-6_20) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=25245702) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Large-scale%20parameter%20studies%20of%20cell-based%20models%20of%20tissue%20morphogenesis%20using%20compucell3D%20or%20VirtualLeaf&journal=Methods%20Mol.%20Biol.&doi=10.1007%2F978-1-4939-1164-6_20&volume=1189&pages=301-322&publication_year=2015&author=Palm%2CMM&author=Merks%2CRM)

[^118]: Starruß, J. et al. Morpheus: a user-friendly modeling environment for multiscale and multicellular systems biology. *Bioinformatics* **30**, 1331–1332 (2014).

[Article](https://doi.org/10.1093%2Fbioinformatics%2Fbtt772) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=24443380) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3998129) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Morpheus%3A%20a%20user-friendly%20modeling%20environment%20for%20multiscale%20and%20multicellular%20systems%20biology&journal=Bioinformatics&doi=10.1093%2Fbioinformatics%2Fbtt772&volume=30&pages=1331-1332&publication_year=2014&author=Starru%C3%9F%2CJ)

[^119]: Ruffinatti, F. A. et al. MORPHEUS: An automated tool for unbiased and reproducible cell morphometry. *J. Cell Physiol.* **235**, 10110–10115 (2020).

[Article](https://doi.org/10.1002%2Fjcp.29768) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32567069) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=MORPHEUS%3A%20An%20automated%20tool%20for%20unbiased%20and%20reproducible%20cell%20morphometry&journal=J.%20Cell%20Physiol.&doi=10.1002%2Fjcp.29768&volume=235&pages=10110-10115&publication_year=2020&author=Ruffinatti%2CFA)

[^120]: Andrews, S. S. et al. Detailed simulations of cell biology with Smoldyn 2.1. *PLoS Comput. Biol.* **6**, e1000705 (2010).

[Article](https://doi.org/10.1371%2Fjournal.pcbi.1000705) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=20300644) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2837389) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Detailed%20simulations%20of%20cell%20biology%20with%20Smoldyn%202.1&journal=PLoS%20Comput.%20Biol.&doi=10.1371%2Fjournal.pcbi.1000705&volume=6&publication_year=2010&author=Andrews%2CSS)

[^121]: Andrews, S. S. Smoldyn: particle-based simulation with rule-based modeling, improved molecular interaction and a library interface. *Bioinformatics* **33**, 710–717 (2017).

[Article](https://doi.org/10.1093%2Fbioinformatics%2Fbtw700) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=28365760) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Smoldyn%3A%20particle-based%20simulation%20with%20rule-based%20modeling%2C%20improved%20molecular%20interaction%20and%20a%20library%20interface&journal=Bioinformatics&doi=10.1093%2Fbioinformatics%2Fbtw700&volume=33&pages=710-717&publication_year=2017&author=Andrews%2CSS)

[^122]: Schöneberg, J. & Noé, F. ReaDDy—a software for particle-based reaction-diffusion dynamics in crowded cellular environments. *PLoS One* **8**, e74261 (2013).

[Article](https://doi.org/10.1371%2Fjournal.pone.0074261) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=24040218) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3770580) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=ReaDDy%E2%80%94a%20software%20for%20particle-based%20reaction-diffusion%20dynamics%20in%20crowded%20cellular%20environments&journal=PLoS%20One&doi=10.1371%2Fjournal.pone.0074261&volume=8&publication_year=2013&author=Sch%C3%B6neberg%2CJ&author=No%C3%A9%2CF)

[^123]: Hoffmann, M., Fröhner, C. & Noé, F. ReaDDy 2: fast and flexible software framework for interacting-particle reaction dynamics. *PLoS Comput. Biol.* **15**, e1006830 (2019).

[Article](https://doi.org/10.1371%2Fjournal.pcbi.1006830) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=30818351) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC6413953) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=ReaDDy%202%3A%20fast%20and%20flexible%20software%20framework%20for%20interacting-particle%20reaction%20dynamics&journal=PLoS%20Comput.%20Biol.&doi=10.1371%2Fjournal.pcbi.1006830&volume=15&publication_year=2019&author=Hoffmann%2CM&author=Fr%C3%B6hner%2CC&author=No%C3%A9%2CF)

[^124]: Mirams, G. R. et al. Chaste: an open source C++ library for computational physiology and biology. *PLoS Comput. Biol.* **9**, e1002970 (2013).

[Article](https://doi.org/10.1371%2Fjournal.pcbi.1002970) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=23516352) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3597547) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Chaste%3A%20an%20open%20source%20C%2B%2B%20library%20for%20computational%20physiology%20and%20biology&journal=PLoS%20Comput.%20Biol.&doi=10.1371%2Fjournal.pcbi.1002970&volume=9&publication_year=2013&author=Mirams%2CGR)

[^125]: Solmi, F. et al. Decomposing socio-economic inequality in colorectal cancer screening uptake in England. *Soc. Sci. Med.* **134**, 76–86 (2015).

[Article](https://doi.org/10.1016%2Fj.socscimed.2015.04.010) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=25917138) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Decomposing%20socio-economic%20inequality%20in%20colorectal%20cancer%20screening%20uptake%20in%20England&journal=Soc.%20Sci.%20Med.&doi=10.1016%2Fj.socscimed.2015.04.010&volume=134&pages=76-86&publication_year=2015&author=Solmi%2CF)

[^126]: Garny, A. & Hunter, P. J. OpenCOR: a modular and interoperable approach to computational biology. *Front Physiol.* **6**, 26 (2015).

[Article](https://doi.org/10.3389%2Ffphys.2015.00026) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=25705192) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4319394) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=OpenCOR%3A%20a%20modular%20and%20interoperable%20approach%20to%20computational%20biology&journal=Front%20Physiol.&doi=10.3389%2Ffphys.2015.00026&volume=6&publication_year=2015&author=Garny%2CA&author=Hunter%2CPJ)

[^127]: Delp, S. L. et al. OpenSim: open-source software to create and analyze dynamic simulations of movement. *IEEE Trans. Biomed. Eng.* **54**, 1940–1950 (2007).

[Article](https://doi.org/10.1109%2FTBME.2007.901024) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=18018689) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=OpenSim%3A%20open-source%20software%20to%20create%20and%20analyze%20dynamic%20simulations%20of%20movement&journal=IEEE%20Trans.%20Biomed.%20Eng.&doi=10.1109%2FTBME.2007.901024&volume=54&pages=1940-1950&publication_year=2007&author=Delp%2CSL)

[^128]: Gautam, A. S. et al. Temporary reduction in air pollution due to anthropogenic activity switch-off during COVID-19 lockdown in Northern parts of India. *Environ. Dev. Sustain.* **23**, 8774–8797 (2021).

[Article](https://link.springer.com/doi/10.1007/s10668-020-00994-6) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32989376) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Temporary%20reduction%20in%20air%20pollution%20due%20to%20anthropogenic%20activity%20switch-off%20during%20COVID-19%20lockdown%20in%20Northern%20parts%20of%20India&journal=Environ.%20Dev.%20Sustain.&doi=10.1007%2Fs10668-020-00994-6&volume=23&pages=8774-8797&publication_year=2021&author=Gautam%2CAS)

[^129]: Obermeier, M. M. et al. Plant resistome profiling in evolutionary old bog vegetation provides new clues to understand emergence of multi-resistance. *ISME J.* **15**, 921–937 (2021).

[Article](https://doi.org/10.1038%2Fs41396-020-00822-9) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=33177608) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Plant%20resistome%20profiling%20in%20evolutionary%20old%20bog%20vegetation%20provides%20new%20clues%20to%20understand%20emergence%20of%20multi-resistance&journal=ISME%20J.&doi=10.1038%2Fs41396-020-00822-9&volume=15&pages=921-937&publication_year=2021&author=Obermeier%2CMM)

[^130]: Stringer, C. et al. Cellpose: a generalist algorithm for cellular segmentation. *Nat. Methods* **18**, 100–106 (2021).

[Article](https://doi.org/10.1038%2Fs41592-020-01018-x) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=33318659) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Cellpose%3A%20a%20generalist%20algorithm%20for%20cellular%20segmentation&journal=Nat.%20Methods&doi=10.1038%2Fs41592-020-01018-x&volume=18&pages=100-106&publication_year=2021&author=Stringer%2CC)

[^131]: Riendeau, J. M. et al. Cellpose as a reliable method for single-cell segmentation of autofluorescence microscopy images. *Sci. Rep.* **15**, 5548 (2025).

[Article](https://doi.org/10.1038%2Fs41598-024-82639-6) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39952935) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11828867) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Cellpose%20as%20a%20reliable%20method%20for%20single-cell%20segmentation%20of%20autofluorescence%20microscopy%20images&journal=Sci.%20Rep.&doi=10.1038%2Fs41598-024-82639-6&volume=15&publication_year=2025&author=Riendeau%2CJM)

[^132]: Etienam C. et al. A Novel A.I Enhanced reservoir characterization with a combined mixture of experts—NVIDIA modulus based physics informed neural operator forward model. arXiv 2404.14447 (2024).

[^133]: Nazer, L. H. et al. Bias in artificial intelligence algorithms and recommendations for mitigation. *PLOS Digit Health* **2**, e0000278 (2023).

[Article](https://doi.org/10.1371%2Fjournal.pdig.0000278) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37347721) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10287014) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Bias%20in%20artificial%20intelligence%20algorithms%20and%20recommendations%20for%20mitigation&journal=PLOS%20Digit%20Health&doi=10.1371%2Fjournal.pdig.0000278&volume=2&publication_year=2023&author=Nazer%2CLH)

[^134]: Mansoor, S. et al. Zero-shot mutation effect prediction on protein stability and function using RoseTTAFold. *Protein Sci.* **32**, e4780 (2023).

[Article](https://doi.org/10.1002%2Fpro.4780) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37695922) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10578109) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Zero-shot%20mutation%20effect%20prediction%20on%20protein%20stability%20and%20function%20using%20RoseTTAFold&journal=Protein%20Sci.&doi=10.1002%2Fpro.4780&volume=32&publication_year=2023&author=Mansoor%2CS)

[^135]: Ahmed, S. et al. Prediction of residue-specific contributions to binding and thermal stability using yeast surface display. *Front. Mol. Biosci.* **8**, 800819 (2021).

[Article](https://doi.org/10.3389%2Ffmolb.2021.800819) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35127820) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Prediction%20of%20residue-specific%20contributions%20to%20binding%20and%20thermal%20stability%20using%20yeast%20surface%20display&journal=Front.%20Mol.%20Biosci.&doi=10.3389%2Ffmolb.2021.800819&volume=8&publication_year=2021&author=Ahmed%2CS)

[^136]: Mao, S. et al. Development and validation of a novel preoperative clinical model for predicting lymph node metastasis in perihilar cholangiocarcinoma. *BMC Cancer* **24**, 297 (2024).

[Article](https://link.springer.com/doi/10.1186/s12885-024-12068-1) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38438912) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10913359) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Development%20and%20validation%20of%20a%20novel%20preoperative%20clinical%20model%20for%20predicting%20lymph%20node%20metastasis%20in%20perihilar%20cholangiocarcinoma&journal=BMC%20Cancer&doi=10.1186%2Fs12885-024-12068-1&volume=24&publication_year=2024&author=Mao%2CS)

[^137]: Corrò, C., Novellasdemunt, L. & Li, V. S. W. A brief history of organoids. *Am. J. Physiol. Cell Physiol.* **319**, C151–c65 (2020).

[Article](https://doi.org/10.1152%2Fajpcell.00120.2020) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32459504) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7468890) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=A%20brief%20history%20of%20organoids&journal=Am.%20J.%20Physiol.%20Cell%20Physiol.&doi=10.1152%2Fajpcell.00120.2020&volume=319&pages=C151-c65&publication_year=2020&author=Corr%C3%B2%2CC&author=Novellasdemunt%2CL&author=Li%2CVSW)

[^138]: Ingber, D. E. Human organs-on-chips for disease modelling, drug development and personalized medicine. *Nat. Rev. Genet* **23**, 467–491 (2022).

[Article](https://doi.org/10.1038%2Fs41576-022-00466-9) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35338360) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC8951665) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Human%20organs-on-chips%20for%20disease%20modelling%2C%20drug%20development%20and%20personalized%20medicine&journal=Nat.%20Rev.%20Genet&doi=10.1038%2Fs41576-022-00466-9&volume=23&pages=467-491&publication_year=2022&author=Ingber%2CDE)

[^139]: Forrow, A. & Schiebinger, G. LineageOT is a unified framework for lineage tracing and trajectory inference. *Nat. Commun.* **12**, 4940 (2021).

[Article](https://doi.org/10.1038%2Fs41467-021-25133-1) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=34400634) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC8367995) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=LineageOT%20is%20a%20unified%20framework%20for%20lineage%20tracing%20and%20trajectory%20inference&journal=Nat.%20Commun.&doi=10.1038%2Fs41467-021-25133-1&volume=12&publication_year=2021&author=Forrow%2CA&author=Schiebinger%2CG)

[^140]: Malepathirana, T. et al. Dimensionality reduction for visualizing high-dimensional biological data. *Biosystems* **220**, 104749 (2022).

[Article](https://doi.org/10.1016%2Fj.biosystems.2022.104749) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35917953) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Dimensionality%20reduction%20for%20visualizing%20high-dimensional%20biological%20data&journal=Biosystems&doi=10.1016%2Fj.biosystems.2022.104749&volume=220&publication_year=2022&author=Malepathirana%2CT)

[^141]: Kim, S. et al. Ensemble of sparse classifiers for high-dimensional biological data. *Int J. Data Min. Bioinform.* **12**, 167–183 (2015).

[Article](https://doi.org/10.1504%2FIJDMB.2015.069416) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=26510301) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Ensemble%20of%20sparse%20classifiers%20for%20high-dimensional%20biological%20data&journal=Int%20J.%20Data%20Min.%20Bioinform.&doi=10.1504%2FIJDMB.2015.069416&volume=12&pages=167-183&publication_year=2015&author=Kim%2CS)

[^142]: Moon, K. R. et al. Visualizing structure and transitions in high-dimensional biological data. *Nat. Biotechnol.* **37**, 1482–1492 (2019).

[Article](https://doi.org/10.1038%2Fs41587-019-0336-3) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=31796933) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7073148) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Visualizing%20structure%20and%20transitions%20in%20high-dimensional%20biological%20data&journal=Nat.%20Biotechnol.&doi=10.1038%2Fs41587-019-0336-3&volume=37&pages=1482-1492&publication_year=2019&author=Moon%2CKR)

[^143]: Yang B., et al. Multi-view multi-level contrastive graph convolutional network for cancer subtyping on multi-omics data. *Brief Bioinform*. **26**, 043 (2024).

[^144]: Zhang, J. et al. Strategic multi-omics data integration via multi-level feature contrasting and matching. *IEEE Trans. Nanobiosci.* **23**, 579–590 (2024).

[Article](https://doi.org/10.1109%2FTNB.2024.3456797) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Strategic%20multi-omics%20data%20integration%20via%20multi-level%20feature%20contrasting%20and%20matching&journal=IEEE%20Trans.%20Nanobiosci.&doi=10.1109%2FTNB.2024.3456797&volume=23&pages=579-590&publication_year=2024&author=Zhang%2CJ)

[^145]: Rabin, A. et al. SRCP: a comprehensive pipeline for accurate annotation and quantification of circRNAs. *Genome Biol.* **22**, 277 (2021).

[Article](https://link.springer.com/doi/10.1186/s13059-021-02497-7) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=34556162) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC8459468) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=SRCP%3A%20a%20comprehensive%20pipeline%20for%20accurate%20annotation%20and%20quantification%20of%20circRNAs&journal=Genome%20Biol.&doi=10.1186%2Fs13059-021-02497-7&volume=22&publication_year=2021&author=Rabin%2CA)

[^146]: Roohani, Y. H. et al. Virtual cell challenge: toward a turing test for the virtual cell. *Cell* **188**, 3370–3374 (2025).

[Article](https://doi.org/10.1016%2Fj.cell.2025.06.008) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40578317) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Virtual%20cell%20challenge%3A%20toward%20a%20turing%20test%20for%20the%20virtual%20cell&journal=Cell&doi=10.1016%2Fj.cell.2025.06.008&volume=188&pages=3370-3374&publication_year=2025&author=Roohani%2CYH)

[^147]: Yin, W., Liu, Y. & Shen, C. Virtual normal: enforcing geometric constraints for accurate and robust depth prediction. *IEEE Trans. Pattern Anal. Mach. Intell.* **44**, 7282–7295 (2022).

[Article](https://doi.org/10.1109%2FTPAMI.2021.3097396) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=34270413) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Virtual%20normal%3A%20enforcing%20geometric%20constraints%20for%20accurate%20and%20robust%20depth%20prediction&journal=IEEE%20Trans.%20Pattern%20Anal.%20Mach.%20Intell.&doi=10.1109%2FTPAMI.2021.3097396&volume=44&pages=7282-7295&publication_year=2022&author=Yin%2CW&author=Liu%2CY&author=Shen%2CC)

[^148]: Xu et al. Virtual microfluidics for digital quantification and single-cell sequencing. *Nat. Methods* **13**, 759–762 (2016).

[Article](https://doi.org/10.1038%2Fnmeth.3955) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=27479330) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC5007149) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Virtual%20microfluidics%20for%20digital%20quantification%20and%20single-cell%20sequencing&journal=Nat.%20Methods&doi=10.1038%2Fnmeth.3955&volume=13&pages=759-762&publication_year=2016&author=Xu%2C)

[^149]: Zhang, Y. K. et al. Identification, experimental validation, and computational evaluation of potential ALK inhibitors through hierarchical virtual screening. *SAR QSAR Environ. Res* **36**, 271–285 (2025).

[Article](https://doi.org/10.1080%2F1062936X.2025.2496155) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40298319) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Identification%2C%20experimental%20validation%2C%20and%20computational%20evaluation%20of%20potential%20ALK%20inhibitors%20through%20hierarchical%20virtual%20screening&journal=SAR%20QSAR%20Environ.%20Res&doi=10.1080%2F1062936X.2025.2496155&volume=36&pages=271-285&publication_year=2025&author=Zhang%2CYK)

[^150]: Carroll, G. T. et al. Experimental validation of convection-diffusion discretisation scheme employed for computational modelling of biological mass transport. *Biomed. Eng. Online* **9**, 34 (2010).

[Article](https://link.springer.com/doi/10.1186/1475-925X-9-34) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=20642816) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2918622) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Experimental%20validation%20of%20convection-diffusion%20discretisation%20scheme%20employed%20for%20computational%20modelling%20of%20biological%20mass%20transport&journal=Biomed.%20Eng.%20Online&doi=10.1186%2F1475-925X-9-34&volume=9&publication_year=2010&author=Carroll%2CGT)

[^151]: Chen, S. et al. Machine learning-driven prediction of eye irritation toxicity: integration of in silico and in vitro study. *Toxicol. Appl Pharm.* **502**, 117457 (2025).

[Article](https://doi.org/10.1016%2Fj.taap.2025.117457) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Machine%20learning-driven%20prediction%20of%20eye%20irritation%20toxicity%3A%20integration%20of%20in%20silico%20and%20in%20vitro%20study&journal=Toxicol.%20Appl%20Pharm.&doi=10.1016%2Fj.taap.2025.117457&volume=502&publication_year=2025&author=Chen%2CS)

[^152]: Tanoli, Z., Schulman, A. & Aittokallio, T. Validation guidelines for drug-target prediction methods. *Expert Opin. Drug Discov.* **20**, 31–45 (2025).

[Article](https://doi.org/10.1080%2F17460441.2024.2430955) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39568436) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Validation%20guidelines%20for%20drug-target%20prediction%20methods&journal=Expert%20Opin.%20Drug%20Discov.&doi=10.1080%2F17460441.2024.2430955&volume=20&pages=31-45&publication_year=2025&author=Tanoli%2CZ&author=Schulman%2CA&author=Aittokallio%2CT)

[^153]: Reker, D. et al. Revealing the macromolecular targets of complex natural products. *Nat. Chem.* **6**, 1072–1078 (2014).

[Article](https://doi.org/10.1038%2Fnchem.2095) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=25411885) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Revealing%20the%20macromolecular%20targets%20of%20complex%20natural%20products&journal=Nat.%20Chem.&doi=10.1038%2Fnchem.2095&volume=6&pages=1072-1078&publication_year=2014&author=Reker%2CD)

[^154]: Wei, J. & Li, Y. CRISPR-based gene editing technology and its application in microbial engineering. *Eng. Microbiol* **3**, 100101 (2023).

[Article](https://doi.org/10.1016%2Fj.engmic.2023.100101) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39628916) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11610974) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=CRISPR-based%20gene%20editing%20technology%20and%20its%20application%20in%20microbial%20engineering&journal=Eng.%20Microbiol&doi=10.1016%2Fj.engmic.2023.100101&volume=3&publication_year=2023&author=Wei%2CJ&author=Li%2CY)

[^155]: Cao et al. Advances in precise regulation of CRISPR/Cas9 gene editing technology. *Yi Chuan* **42**, 1168–1177 (2020).

[PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=33509781) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Advances%20in%20precise%20regulation%20of%20CRISPR%2FCas9%20gene%20editing%20technology&journal=Yi%20Chuan&volume=42&pages=1168-1177&publication_year=2020&author=Cao%2C)

[^156]: Zhang, D. et al. CRISPR/Cas: a powerful tool for gene function study and crop improvement. *J. Adv. Res* **29**, 207–221 (2021).

[Article](https://doi.org/10.1016%2Fj.jare.2020.10.003) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=33842017) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=CRISPR%2FCas%3A%20a%20powerful%20tool%20for%20gene%20function%20study%20and%20crop%20improvement&journal=J.%20Adv.%20Res&doi=10.1016%2Fj.jare.2020.10.003&volume=29&pages=207-221&publication_year=2021&author=Zhang%2CD)

[^157]: Akram, M. et al. Uncertainty-aware diabetic retinopathy detection using deep learning enhanced by Bayesian approaches. *Sci. Rep.* **15**, 1342 (2025).

[Article](https://doi.org/10.1038%2Fs41598-024-84478-x) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39779778) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11711487) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Uncertainty-aware%20diabetic%20retinopathy%20detection%20using%20deep%20learning%20enhanced%20by%20Bayesian%20approaches&journal=Sci.%20Rep.&doi=10.1038%2Fs41598-024-84478-x&volume=15&publication_year=2025&author=Akram%2CM)

[^158]: Mao, H., Martin, R. & Reich, B. J. Valid model-free spatial prediction. *J. Am. Stat. Assoc.* **119**, 904–914 (2024).

[Article](https://doi.org/10.1080%2F01621459.2022.2147531) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39045463) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Valid%20model-free%20spatial%20prediction&journal=J.%20Am.%20Stat.%20Assoc.&doi=10.1080%2F01621459.2022.2147531&volume=119&pages=904-914&publication_year=2024&author=Mao%2CH&author=Martin%2CR&author=Reich%2CBJ)

[^159]: Cabot, J. H. & Ross, E. G. Evaluating prediction model performance. *Surgery* **174**, 723–726 (2023).

[Article](https://doi.org/10.1016%2Fj.surg.2023.05.023) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37419761) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Evaluating%20prediction%20model%20performance&journal=Surgery&doi=10.1016%2Fj.surg.2023.05.023&volume=174&pages=723-726&publication_year=2023&author=Cabot%2CJH&author=Ross%2CEG)

[^160]: Huang, J. et al. Development of two-dimension epidemic prediction model. *Infect. Dis. Model* **10**, 1190–1207 (2025).

[PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40689266) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC12271440) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Development%20of%20two-dimension%20epidemic%20prediction%20model&journal=Infect.%20Dis.%20Model&volume=10&pages=1190-1207&publication_year=2025&author=Huang%2CJ)

[^161]: Ooft S. N., et al. Patient-derived organoids can predict response to chemotherapy in metastatic colorectal cancer patients. *Sci. Transl. Med.* **11**, 2574 (2019).

[^162]: Sang, L. et al. An in silico platform to predict cardiotoxicity risk of anti-tumor drug combination with hiPSC-CMs based in vitro study. *Pharm. Res.* **41**, 247–262 (2024).

[Article](https://link.springer.com/doi/10.1007/s11095-023-03644-4) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38148384) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=An%20in%20silico%20platform%20to%20predict%20cardiotoxicity%20risk%20of%20anti-tumor%20drug%20combination%20with%20hiPSC-CMs%20based%20in%20vitro%20study&journal=Pharm.%20Res.&doi=10.1007%2Fs11095-023-03644-4&volume=41&pages=247-262&publication_year=2024&author=Sang%2CL)

[^163]: Harter, M. F. et al. Analysis of off-tumour toxicities of T-cell-engaging bispecific antibodies via donor-matched intestinal organoids and tumouroids. *Nat. Biomed. Eng.* **8**, 345–360 (2024).

[Article](https://doi.org/10.1038%2Fs41551-023-01156-5) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38114742) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Analysis%20of%20off-tumour%20toxicities%20of%20T-cell-engaging%20bispecific%20antibodies%20via%20donor-matched%20intestinal%20organoids%20and%20tumouroids&journal=Nat.%20Biomed.%20Eng.&doi=10.1038%2Fs41551-023-01156-5&volume=8&pages=345-360&publication_year=2024&author=Harter%2CMF)

[^164]: FDA pushes to replace animal testing. *Nat. Biotechnol.* **43**, 655 (2025).

[^165]: Rosenblatt, M. et al. Data leakage inflates prediction performance in connectome-based machine learning models. *Nat. Commun.* **15**, 1829 (2024).

[Article](https://doi.org/10.1038%2Fs41467-024-46150-w) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38418819) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10901797) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Data%20leakage%20inflates%20prediction%20performance%20in%20connectome-based%20machine%20learning%20models&journal=Nat.%20Commun.&doi=10.1038%2Fs41467-024-46150-w&volume=15&publication_year=2024&author=Rosenblatt%2CM)

[^166]: Ma, C. et al. Organ-on-a-chip: a new paradigm for drug development. *Trends Pharm. Sci.* **42**, 119–133 (2021).

[Article](https://doi.org/10.1016%2Fj.tips.2020.11.009) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=33341248) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Organ-on-a-chip%3A%20a%20new%20paradigm%20for%20drug%20development&journal=Trends%20Pharm.%20Sci.&doi=10.1016%2Fj.tips.2020.11.009&volume=42&pages=119-133&publication_year=2021&author=Ma%2CC)

[^167]: Liu, X. et al. Reporting guidelines for clinical trial reports for interventions involving artificial intelligence: the CONSORT-AI extension. *Nat. Med.* **26**, 1364–1374 (2020).

[Article](https://doi.org/10.1038%2Fs41591-020-1034-x) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32908283) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7598943) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Reporting%20guidelines%20for%20clinical%20trial%20reports%20for%20interventions%20involving%20artificial%20intelligence%3A%20the%20CONSORT-AI%20extension&journal=Nat.%20Med.&doi=10.1038%2Fs41591-020-1034-x&volume=26&pages=1364-1374&publication_year=2020&author=Liu%2CX)

[^168]: Debray, R. et al. Priority effects in microbiome assembly. *Nat. Rev. Microbiol.* **20**, 109–121 (2022).

[Article](https://doi.org/10.1038%2Fs41579-021-00604-w) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=34453137) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Priority%20effects%20in%20microbiome%20assembly&journal=Nat.%20Rev.%20Microbiol.&doi=10.1038%2Fs41579-021-00604-w&volume=20&pages=109-121&publication_year=2022&author=Debray%2CR)

[^169]: Chevalier, V. et al. First steps of experimental validation of a numerical model about mechanical behavior of NiTi endodontic instruments. *Bull. Group Int Rech. Sci. Stomatol Odontol.* **50**, 46–47 (2011).

[PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=22750712) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=First%20steps%20of%20experimental%20validation%20of%20a%20numerical%20model%20about%20mechanical%20behavior%20of%20NiTi%20endodontic%20instruments&journal=Bull.%20Group%20Int%20Rech.%20Sci.%20Stomatol%20Odontol.&volume=50&pages=46-47&publication_year=2011&author=Chevalier%2CV)

[^170]: Albijanic B., et al. Induction time of wetting films between air bubbles and hydrophobic particles in the presence of dodecyl amine hydrochloride: first principles model analysis and experimental validation. *Molecules* **30**, 695 2025.

[^171]: Martin, K. et al. The Me first communication model. *Nurs. Child Young People* **31**, 38–47 (2019).

[Article](https://doi.org/10.7748%2Fncyp.2019.e1064) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=31468770) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20Me%20first%20communication%20model&journal=Nurs.%20Child%20Young%20People&doi=10.7748%2Fncyp.2019.e1064&volume=31&pages=38-47&publication_year=2019&author=Martin%2CK)

[^172]: Chen, L. et al. Discovery of anticancer activity of amentoflavone on esophageal squamous cell carcinoma: bioinformatics, structure-based virtual screening, and biological evaluation. *J. Microbiol. Biotechnol.* **32**, 718–729 (2022).

[Article](https://doi.org/10.4014%2Fjmb.2203.03050) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35484963) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9628896) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Discovery%20of%20anticancer%20activity%20of%20amentoflavone%20on%20esophageal%20squamous%20cell%20carcinoma%3A%20bioinformatics%2C%20structure-based%20virtual%20screening%2C%20and%20biological%20evaluation&journal=J.%20Microbiol.%20Biotechnol.&doi=10.4014%2Fjmb.2203.03050&volume=32&pages=718-729&publication_year=2022&author=Chen%2CL)

[^173]: Li, F. et al. 2-(2-Methylfuran-3-carboxamido)-3-phenylpropanoic acid, a potential CYP26A1 inhibitor to enhance all-trans retinoic acid-induced leukemia cell differentiation based on virtual screening and biological evaluation. *Bioorg. Med Chem.* **21**, 3256–3261 (2013).

[Article](https://doi.org/10.1016%2Fj.bmc.2013.03.044) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=23601821) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=2-%282-Methylfuran-3-carboxamido%29-3-phenylpropanoic%20acid%2C%20a%20potential%20CYP26A1%20inhibitor%20to%20enhance%20all-trans%20retinoic%20acid-induced%20leukemia%20cell%20differentiation%20based%20on%20virtual%20screening%20and%20biological%20evaluation&journal=Bioorg.%20Med%20Chem.&doi=10.1016%2Fj.bmc.2013.03.044&volume=21&pages=3256-3261&publication_year=2013&author=Li%2CF)

[^174]: Sanachai, K. et al. Pharmacophore-based virtual screening and experimental validation of pyrazolone-derived inhibitors toward Janus kinases. *ACS Omega* **7**, 33548–33559 (2022).

[Article](https://doi.org/10.1021%2Facsomega.2c04535) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=36157769) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9494641) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Pharmacophore-based%20virtual%20screening%20and%20experimental%20validation%20of%20pyrazolone-derived%20inhibitors%20toward%20Janus%20kinases&journal=ACS%20Omega&doi=10.1021%2Facsomega.2c04535&volume=7&pages=33548-33559&publication_year=2022&author=Sanachai%2CK)

[^175]: Naryzhny, S. N. et al. Combination of virtual and experimental 2DE together with ESI LC-MS/MS gives a clearer view about proteomes of human cells and plasma. *Electrophoresis* **37**, 302–309 (2016).

[Article](https://doi.org/10.1002%2Felps.201500382) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=26454001) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Combination%20of%20virtual%20and%20experimental%202DE%20together%20with%20ESI%20LC-MS%2FMS%20gives%20a%20clearer%20view%20about%20proteomes%20of%20human%20cells%20and%20plasma&journal=Electrophoresis&doi=10.1002%2Felps.201500382&volume=37&pages=302-309&publication_year=2016&author=Naryzhny%2CSN)

[^176]: Ukimura, O. et al. Real-time virtual ultrasonographic radiofrequency ablation of renal cell carcinoma. *BJU Int.* **101**, 707–711 (2008).

[Article](https://doi.org/10.1111%2Fj.1464-410X.2007.07324.x) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=18205858) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Real-time%20virtual%20ultrasonographic%20radiofrequency%20ablation%20of%20renal%20cell%20carcinoma&journal=BJU%20Int.&doi=10.1111%2Fj.1464-410X.2007.07324.x&volume=101&pages=707-711&publication_year=2008&author=Ukimura%2CO)

[^177]: Oikonomou, E. et al. BRAF(V600E) efficient transformation and induction of microsatellite instability versus KRAS(G12V) induction of senescence markers in human colon cancer cells. *Neoplasia* **11**, 1116–1131 (2009).

[Article](https://doi.org/10.1593%2Fneo.09514) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=19881948) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2767214) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=BRAF%28V600E%29%20efficient%20transformation%20and%20induction%20of%20microsatellite%20instability%20versus%20KRAS%28G12V%29%20induction%20of%20senescence%20markers%20in%20human%20colon%20cancer%20cells&journal=Neoplasia&doi=10.1593%2Fneo.09514&volume=11&pages=1116-1131&publication_year=2009&author=Oikonomou%2CE)

[^178]: Yu, G. et al. Facile dimension transformation strategy for fabrication of efficient and stable CsPbI(3) perovskite solar cells. *ACS Appl Mater. Interfaces* **15**, 17825–17833 (2023).

[Article](https://doi.org/10.1021%2Facsami.2c23289) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=36990658) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Facile%20dimension%20transformation%20strategy%20for%20fabrication%20of%20efficient%20and%20stable%20CsPbI%283%29%20perovskite%20solar%20cells&journal=ACS%20Appl%20Mater.%20Interfaces&doi=10.1021%2Facsami.2c23289&volume=15&pages=17825-17833&publication_year=2023&author=Yu%2CG)

[^179]: Xu, B. et al. Concept and framework of digital twin human geographical environment. *J. Environ. Manag.* **373**, 123866 (2025).

[Article](https://doi.org/10.1016%2Fj.jenvman.2024.123866) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Concept%20and%20framework%20of%20digital%20twin%20human%20geographical%20environment&journal=J.%20Environ.%20Manag.&doi=10.1016%2Fj.jenvman.2024.123866&volume=373&publication_year=2025&author=Xu%2CB)

[^180]: Asciak, L. et al. Digital twin assisted surgery, concept, opportunities, and challenges. *npj Digit. Med.* **8**, 32 (2025).

[Article](https://doi.org/10.1038%2Fs41746-024-01413-0) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39815013) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11736137) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Digital%20twin%20assisted%20surgery%2C%20concept%2C%20opportunities%2C%20and%20challenges&journal=npj%20Digit.%20Med.&doi=10.1038%2Fs41746-024-01413-0&volume=8&publication_year=2025&author=Asciak%2CL)

[^181]: Peshkova, M. et al. Digital twin concept: healthcare, education, research. *J. Pathol. Inf.* **14**, 100313 (2023).

[Article](https://doi.org/10.1016%2Fj.jpi.2023.100313) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Digital%20twin%20concept%3A%20healthcare%2C%20education%2C%20research&journal=J.%20Pathol.%20Inf.&doi=10.1016%2Fj.jpi.2023.100313&volume=14&publication_year=2023&author=Peshkova%2CM)

[^182]: Bordukova, M. et al. Generative artificial intelligence empowers digital twins in drug discovery and clinical trials. *Expert Opin. Drug Discov.* **19**, 33–42 (2024).

[Article](https://doi.org/10.1080%2F17460441.2023.2273839) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37887266) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Generative%20artificial%20intelligence%20empowers%20digital%20twins%20in%20drug%20discovery%20and%20clinical%20trials&journal=Expert%20Opin.%20Drug%20Discov.&doi=10.1080%2F17460441.2023.2273839&volume=19&pages=33-42&publication_year=2024&author=Bordukova%2CM)

[^183]: Guan A Z, Suyang G, Wei W, Zhi G, Mingyang L, Haiquan Z, Xiao-P. Dynamic simulation and parameter calibration-based experimental digital twin platform for heat-electric coupled system. *IEEE Trans. Sustain. Energy* **10**, 3609042 (2025).

[^184]: Camps, J. et al. Digital twinning of the human ventricular activation sequence to Clinical 12-lead ECGs and magnetic resonance imaging using realistic Purkinje networks for in silico clinical trials. *Med. Image Anal.* **94**, 103108 (2024).

[Article](https://doi.org/10.1016%2Fj.media.2024.103108) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38447244) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Digital%20twinning%20of%20the%20human%20ventricular%20activation%20sequence%20to%20Clinical%2012-lead%20ECGs%20and%20magnetic%20resonance%20imaging%20using%20realistic%20Purkinje%20networks%20for%20in%20silico%20clinical%20trials&journal=Med.%20Image%20Anal.&doi=10.1016%2Fj.media.2024.103108&volume=94&publication_year=2024&author=Camps%2CJ)

[^185]: Li, H. et al. Digital quantitative detection for heterogeneous protein and MRNA expression patterns in circulating tumor cells. *Adv. Sci.* **12**, e2410120 (2025).

[Article](https://doi.org/10.1002%2Fadvs.202410120) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Digital%20quantitative%20detection%20for%20heterogeneous%20protein%20and%20MRNA%20expression%20patterns%20in%20circulating%20tumor%20cells&journal=Adv.%20Sci.&doi=10.1002%2Fadvs.202410120&volume=12&publication_year=2025&author=Li%2CH)

[^186]: Baandrup, L. et al. Development of a digital algorithm for assessing tumor-stroma ratio, tumor budding and tumor infiltrating lymphocytes in vulvar squamous cell carcinomas. *Ann. Diagn. Pathol.* **76**, 152462 (2025).

[Article](https://doi.org/10.1016%2Fj.anndiagpath.2025.152462) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40048885) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Development%20of%20a%20digital%20algorithm%20for%20assessing%20tumor-stroma%20ratio%2C%20tumor%20budding%20and%20tumor%20infiltrating%20lymphocytes%20in%20vulvar%20squamous%20cell%20carcinomas&journal=Ann.%20Diagn.%20Pathol.&doi=10.1016%2Fj.anndiagpath.2025.152462&volume=76&publication_year=2025&author=Baandrup%2CL)

[^187]: Ștefănigă S. A., et al. Advancing precision oncology with digital and virtual twins: a scoping review. *Cancers* **16**, 3387 (2024).

[^188]: Wang, H. et al. From virtual patients to digital twins in immuno-oncology: lessons learned from mechanistic quantitative systems pharmacology modeling. *npj Digit. Med.* **7**, 189 (2024).

[Article](https://doi.org/10.1038%2Fs41746-024-01188-4) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39014005) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11252162) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=From%20virtual%20patients%20to%20digital%20twins%20in%20immuno-oncology%3A%20lessons%20learned%20from%20mechanistic%20quantitative%20systems%20pharmacology%20modeling&journal=npj%20Digit.%20Med.&doi=10.1038%2Fs41746-024-01188-4&volume=7&publication_year=2024&author=Wang%2CH)

[^189]: Aghamiri S. S., et al. Digital twin technology in radiology. *J. Imaging Inform. Med*. **11**, 6553 (2025).

[^190]: Belik, M. & Rubanenko, O. Sensitivity analysis of digital twin model for energy community PV system. *Sci. Rep.* **15**, 29097 (2025).

[Article](https://doi.org/10.1038%2Fs41598-025-13707-8) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40781128) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC12334596) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Sensitivity%20analysis%20of%20digital%20twin%20model%20for%20energy%20community%20PV%20system&journal=Sci.%20Rep.&doi=10.1038%2Fs41598-025-13707-8&volume=15&publication_year=2025&author=Belik%2CM&author=Rubanenko%2CO)

[^191]: Shu, H. et al. Twin-S: a digital twin for skull base surgery. *Int J. Comput. Assist. Radio. Surg.* **18**, 1077–1084 (2023).

[Article](https://link.springer.com/doi/10.1007/s11548-023-02863-9) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Twin-S%3A%20a%20digital%20twin%20for%20skull%20base%20surgery&journal=Int%20J.%20Comput.%20Assist.%20Radio.%20Surg.&doi=10.1007%2Fs11548-023-02863-9&volume=18&pages=1077-1084&publication_year=2023&author=Shu%2CH)

[^192]: Scott, A. K. & Oyen, M. L. Virtual pregnancies: predicting and preventing pregnancy complications with digital twins. *Lancet Digit. Health* **6**, e436–e437 (2024).

[Article](https://doi.org/10.1016%2FS2589-7500%2824%2900086-4) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38906606) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Virtual%20pregnancies%3A%20predicting%20and%20preventing%20pregnancy%20complications%20with%20digital%20twins&journal=Lancet%20Digit.%20Health&doi=10.1016%2FS2589-7500%2824%2900086-4&volume=6&pages=e436-e437&publication_year=2024&author=Scott%2CAK&author=Oyen%2CML)

[^193]: Serrano D. R., et al. Artificial intelligence (AI) applications in drug discovery and drug delivery: revolutionizing personalized medicine. *Pharmaceutics* **16**, 1328 (2024).

[^194]: Brydon, N. Advantages and limitations of physical and virtual dose mapping. *Biomed. Instrum. Technol.* **58**, 34–38 (2024).

[Article](https://doi.org/10.2345%2F0899-8205-58.2.34) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38564606) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10987008) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Advantages%20and%20limitations%20of%20physical%20and%20virtual%20dose%20mapping&journal=Biomed.%20Instrum.%20Technol.&doi=10.2345%2F0899-8205-58.2.34&volume=58&pages=34-38&publication_year=2024&author=Brydon%2CN)

[^195]: Morel, M. et al. Advantages and limitations of virtual reality for balance assessment and rehabilitation. *Neurophysiol. Clin.* **45**, 315–326 (2015).

[Article](https://doi.org/10.1016%2Fj.neucli.2015.09.007) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=26527045) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Advantages%20and%20limitations%20of%20virtual%20reality%20for%20balance%20assessment%20and%20rehabilitation&journal=Neurophysiol.%20Clin.&doi=10.1016%2Fj.neucli.2015.09.007&volume=45&pages=315-326&publication_year=2015&author=Morel%2CM)

[^196]: Seemann, M. D., Schaefer, J. F. & Englmeier, K. H. Virtual positron emission tomography/computed tomography-bronchoscopy: possibilities, advantages and limitations of clinical application. *Eur. Radio.* **17**, 709–715 (2007).

[Article](https://link.springer.com/doi/10.1007/s00330-006-0350-y) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Virtual%20positron%20emission%20tomography%2Fcomputed%20tomography-bronchoscopy%3A%20possibilities%2C%20advantages%20and%20limitations%20of%20clinical%20application&journal=Eur.%20Radio.&doi=10.1007%2Fs00330-006-0350-y&volume=17&pages=709-715&publication_year=2007&author=Seemann%2CMD&author=Schaefer%2CJF&author=Englmeier%2CKH)

[^197]: Grasso E., et al. Role of virtual iMRI in glioblastoma surgery: advantages, limitations, and correlation with iCT and brain shift. Brain Sci. **15**, 35 (2024).

[^198]: Kozłowska, E. et al. Mathematical modeling predicts response to chemotherapy and drug combinations in ovarian cancer. *Cancer Res.* **78**, 4036–4044 (2018).

[Article](https://doi.org/10.1158%2F0008-5472.CAN-17-3746) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=29769198) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Mathematical%20modeling%20predicts%20response%20to%20chemotherapy%20and%20drug%20combinations%20in%20ovarian%20cancer&journal=Cancer%20Res.&doi=10.1158%2F0008-5472.CAN-17-3746&volume=78&pages=4036-4044&publication_year=2018&author=Koz%C5%82owska%2CE)

[^199]: Del Rio, E. & Ferreira, L. F. An expression of uncertainty and its application to positioning: a quality-metric and optimal ranges for the identification of cells with RFID. *Springerplus* **4**, 374 (2015).

[Article](https://link.springer.com/doi/10.1186/s40064-015-1084-6) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=26217551) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4513044) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=An%20expression%20of%20uncertainty%20and%20its%20application%20to%20positioning%3A%20a%20quality-metric%20and%20optimal%20ranges%20for%20the%20identification%20of%20cells%20with%20RFID&journal=Springerplus&doi=10.1186%2Fs40064-015-1084-6&volume=4&publication_year=2015&author=Rio%2CE&author=Ferreira%2CLF)

[^200]: Ramaswamy, R. K. et al. Virtual reality-guided left ventricular assist device implantation in pediatric patient: Valuable presurgical tool. *Ann. Pediatr. Cardiol.* **14**, 388–392 (2021).

[Article](https://doi.org/10.4103%2Fapc.apc_81_21) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=34667413) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC8457285) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Virtual%20reality-guided%20left%20ventricular%20assist%20device%20implantation%20in%20pediatric%20patient%3A%20Valuable%20presurgical%20tool&journal=Ann.%20Pediatr.%20Cardiol.&doi=10.4103%2Fapc.apc_81_21&volume=14&pages=388-392&publication_year=2021&author=Ramaswamy%2CRK)

[^201]: Weihe, W. H. Use and misuse of an imprecise concept: alternative methods in animal experiments. *Lab Anim.* **19**, 19–26 (1985).

[Article](https://doi.org/10.1258%2F002367785780890758) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=3974193) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Use%20and%20misuse%20of%20an%20imprecise%20concept%3A%20alternative%20methods%20in%20animal%20experiments&journal=Lab%20Anim.&doi=10.1258%2F002367785780890758&volume=19&pages=19-26&publication_year=1985&author=Weihe%2CWH)

[^202]: Kiani et al. Ethical considerations regarding animal experimentation. *J. Prev. Med Hyg.* **63**, E255–e266 (2022).

[PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=36479489) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9710398) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Ethical%20considerations%20regarding%20animal%20experimentation&journal=J.%20Prev.%20Med%20Hyg.&volume=63&pages=E255-e266&publication_year=2022&author=Kiani%2C)

[^203]: Zhou, L. et al. Organoids and organs-on-chips: recent advances, applications in drug development, and regulatory challenges. *Medicine* **6**, 100667 (2025).

[Article](https://doi.org/10.1016%2Fj.medj.2025.100667) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Organoids%20and%20organs-on-chips%3A%20recent%20advances%2C%20applications%20in%20drug%20development%2C%20and%20regulatory%20challenges&journal=Medicine&doi=10.1016%2Fj.medj.2025.100667&volume=6&publication_year=2025&author=Zhou%2CL)

[^204]: Han, J. J. FDA modernization Act 2.0 allows for alternatives to animal testing. *Artif. Organs* **47**, 449–450 (2023).

[Article](https://doi.org/10.1111%2Faor.14503) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=36762462) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=FDA%20modernization%20Act%202.0%20allows%20for%20alternatives%20to%20animal%20testing&journal=Artif.%20Organs&doi=10.1111%2Faor.14503&volume=47&pages=449-450&publication_year=2023&author=Han%2CJJ)

[^205]: Chen, R. et al. Receptor conversion in metastatic breast cancer: analysis of 390 cases from a single institution. *Mod. Pathol.* **33**, 2499–2506 (2020).

[Article](https://doi.org/10.1038%2Fs41379-020-0615-z) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32620918) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Receptor%20conversion%20in%20metastatic%20breast%20cancer%3A%20analysis%20of%20390%20cases%20from%20a%20single%20institution&journal=Mod.%20Pathol.&doi=10.1038%2Fs41379-020-0615-z&volume=33&pages=2499-2506&publication_year=2020&author=Chen%2CR)

[^206]: Deshmukh, A. D. & Wagner, J. K. FDA draft guidelines for AI and the need for ethical frameworks. *JAMA Pediatr*. **179**, 937–938 (2025).

[^207]: Herron, E. K. & Weeks, K. A. Development of a clinical competency pedagogy with senior nursing students as preparation for transition to practice. *Nurse Educ.* **46**, E137–e138 (2021).

[Article](https://doi.org/10.1097%2FNNE.0000000000001058) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=34261121) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Development%20of%20a%20clinical%20competency%20pedagogy%20with%20senior%20nursing%20students%20as%20preparation%20for%20transition%20to%20practice&journal=Nurse%20Educ.&doi=10.1097%2FNNE.0000000000001058&volume=46&pages=E137-e138&publication_year=2021&author=Herron%2CEK&author=Weeks%2CKA)

[^208]: Yang, N., Dai, R. & Zhang, X. Global prevalence of human pegivirus-1 in healthy volunteer blood donors: a systematic review and meta-analysis. *Vox Sang.* **115**, 107–119 (2020).

[Article](https://doi.org/10.1111%2Fvox.12876) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=31845353) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Global%20prevalence%20of%20human%20pegivirus-1%20in%20healthy%20volunteer%20blood%20donors%3A%20a%20systematic%20review%20and%20meta-analysis&journal=Vox%20Sang.&doi=10.1111%2Fvox.12876&volume=115&pages=107-119&publication_year=2020&author=Yang%2CN&author=Dai%2CR&author=Zhang%2CX)

[^209]: Wu, Y. et al. Beyond success: unveiling the hidden potential of radiotherapy and immunotherapy in solid tumors. *Cancer Commun.* **44**, 739–760 (2024).

[Article](https://doi.org/10.1002%2Fcac2.12576) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Beyond%20success%3A%20unveiling%20the%20hidden%20potential%20of%20radiotherapy%20and%20immunotherapy%20in%20solid%20tumors&journal=Cancer%20Commun.&doi=10.1002%2Fcac2.12576&volume=44&pages=739-760&publication_year=2024&author=Wu%2CY)

[^210]: Zheng W., et al. Tumor-associated neutrophils in colorectal cancer development, progression and immunotherapy. *Cancers* **14**, 4755 (2022).

[^211]: Hartung, T. & Kleinstreuer, N. Challenges and opportunities for validation of AI-based new approach methods. *Altex* **42**, 3–21 (2025).

[PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39815689) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Challenges%20and%20opportunities%20for%20validation%20of%20AI-based%20new%20approach%20methods&journal=Altex&volume=42&pages=3-21&publication_year=2025&author=Hartung%2CT&author=Kleinstreuer%2CN)

[^212]: Deng, Y. et al. Collective motility and mechanical waves in cell clusters. *Eur. Phys. J. E Soft Matter* **44**, 137 (2021).

[Article](https://doi.org/10.1140%2Fepje%2Fs10189-021-00141-7) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=34782959) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Collective%20motility%20and%20mechanical%20waves%20in%20cell%20clusters&journal=Eur.%20Phys.%20J.%20E%20Soft%20Matter&doi=10.1140%2Fepje%2Fs10189-021-00141-7&volume=44&publication_year=2021&author=Deng%2CY)

[^213]: Schaufel, M. A. et al. Stretching oneself too thin and facing ethical challenges: healthcare professionals’ experiences during the COVID-19 pandemic. *Nurs. Ethics* **31**, 1630–1645 (2024).

[Article](https://doi.org/10.1177%2F09697330241230683) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38317594) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11577692) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Stretching%20oneself%20too%20thin%20and%20facing%20ethical%20challenges%3A%20healthcare%20professionals%E2%80%99%20experiences%20during%20the%20COVID-19%20pandemic&journal=Nurs.%20Ethics&doi=10.1177%2F09697330241230683&volume=31&pages=1630-1645&publication_year=2024&author=Schaufel%2CMA)

[^214]: Edwards, C. et al. The role of patient outcomes in shaping moral responsibility in AI-supported decision making. *Radiography* **31**, 102948 (2025).

[Article](https://doi.org/10.1016%2Fj.radi.2025.102948) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40228324) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20role%20of%20patient%20outcomes%20in%20shaping%20moral%20responsibility%20in%20AI-supported%20decision%20making&journal=Radiography&doi=10.1016%2Fj.radi.2025.102948&volume=31&publication_year=2025&author=Edwards%2CC)

[^215]: Boyd, A. et al. How hospital survey teams function. *J. Health Organ Manag* **32**, 206–223 (2018).

[Article](https://doi.org/10.1108%2FJHOM-07-2017-0175) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=29624136) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC5925851) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=How%20hospital%20survey%20teams%20function&journal=J.%20Health%20Organ%20Manag&doi=10.1108%2FJHOM-07-2017-0175&volume=32&pages=206-223&publication_year=2018&author=Boyd%2CA)

[^216]: Zhang, K. et al. FDA review of radiologic AI algorithms: process and challenges. *Radiology* **310**, e230242 (2024).

[Article](https://doi.org/10.1148%2Fradiol.230242) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38165243) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=FDA%20review%20of%20radiologic%20AI%20algorithms%3A%20process%20and%20challenges&journal=Radiology&doi=10.1148%2Fradiol.230242&volume=310&publication_year=2024&author=Zhang%2CK)

[^217]: Harvey, H. B. & Gowda, V. How the FDA Regulates AI. *Acad. Radio.* **27**, 58–61 (2020).

[Article](https://doi.org/10.1016%2Fj.acra.2019.09.017) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=How%20the%20FDA%20Regulates%20AI&journal=Acad.%20Radio.&doi=10.1016%2Fj.acra.2019.09.017&volume=27&pages=58-61&publication_year=2020&author=Harvey%2CHB&author=Gowda%2CV)

[^218]: Ebrahimian, S. et al. FDA-regulated AI algorithms: trends, strengths, and gaps of validation studies. *Acad. Radio.* **29**, 559–566 (2022).

[Article](https://doi.org/10.1016%2Fj.acra.2021.09.002) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=FDA-regulated%20AI%20algorithms%3A%20trends%2C%20strengths%2C%20and%20gaps%20of%20validation%20studies&journal=Acad.%20Radio.&doi=10.1016%2Fj.acra.2021.09.002&volume=29&pages=559-566&publication_year=2022&author=Ebrahimian%2CS)

[^219]: Mcnamara, S. L., Yi, P. H. & Lotter, W. The clinician-AI interface: intended use and explainability in FDA-cleared AI devices for medical image interpretation. *npj Digit. Med.* **7**, 80 (2024).

[Article](https://doi.org/10.1038%2Fs41746-024-01080-1) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38531952) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10966080) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20clinician-AI%20interface%3A%20intended%20use%20and%20explainability%20in%20FDA-cleared%20AI%20devices%20for%20medical%20image%20interpretation&journal=npj%20Digit.%20Med.&doi=10.1038%2Fs41746-024-01080-1&volume=7&publication_year=2024&author=Mcnamara%2CSL&author=Yi%2CPH&author=Lotter%2CW)

[^220]: Windecker, D. et al. Generalizability of FDA-approved AI-enabled medical devices for clinical use. *JAMA Netw. Open* **8**, e258052 (2025).

[Article](https://doi.org/10.1001%2Fjamanetworkopen.2025.8052) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40305017) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC12044510) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Generalizability%20of%20FDA-approved%20AI-enabled%20medical%20devices%20for%20clinical%20use&journal=JAMA%20Netw.%20Open&doi=10.1001%2Fjamanetworkopen.2025.8052&volume=8&publication_year=2025&author=Windecker%2CD)

[^221]: Muralidharan, V. et al. A scoping review of reporting gaps in FDA-approved AI medical devices. *npj Digit. Med.* **7**, 273 (2024).

[Article](https://doi.org/10.1038%2Fs41746-024-01270-x) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39362934) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11450195) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=A%20scoping%20review%20of%20reporting%20gaps%20in%20FDA-approved%20AI%20medical%20devices&journal=npj%20Digit.%20Med.&doi=10.1038%2Fs41746-024-01270-x&volume=7&publication_year=2024&author=Muralidharan%2CV)

[^222]: Benjamens, S., Dhunnoo, P. & Meskó, B. The state of artificial intelligence-based FDA-approved medical devices and algorithms: an online database. *npj Digit. Med.* **3**, 118 (2020).

[Article](https://doi.org/10.1038%2Fs41746-020-00324-0) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32984550) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7486909) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20state%20of%20artificial%20intelligence-based%20FDA-approved%20medical%20devices%20and%20algorithms%3A%20an%20online%20database&journal=npj%20Digit.%20Med.&doi=10.1038%2Fs41746-020-00324-0&volume=3&publication_year=2020&author=Benjamens%2CS&author=Dhunnoo%2CP&author=Mesk%C3%B3%2CB)

[^223]: Lin, M. What’s needed to bridge the gap between US FDA clearance and real-world use of AI algorithms. *Acad. Radio.* **29**, 567–568 (2022).

[Article](https://doi.org/10.1016%2Fj.acra.2021.10.007) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=What%E2%80%99s%20needed%20to%20bridge%20the%20gap%20between%20US%20FDA%20clearance%20and%20real-world%20use%20of%20AI%20algorithms&journal=Acad.%20Radio.&doi=10.1016%2Fj.acra.2021.10.007&volume=29&pages=567-568&publication_year=2022&author=Lin%2CM)

[^224]: Halfpenny, W. & Baxter, S. L. Towards effective data sharing in ophthalmology: data standardization and data privacy. *Curr. Opin. Ophthalmol.* **33**, 418–424 (2022).

[Article](https://doi.org/10.1097%2FICU.0000000000000878) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35819893) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9357189) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Towards%20effective%20data%20sharing%20in%20ophthalmology%3A%20data%20standardization%20and%20data%20privacy&journal=Curr.%20Opin.%20Ophthalmol.&doi=10.1097%2FICU.0000000000000878&volume=33&pages=418-424&publication_year=2022&author=Halfpenny%2CW&author=Baxter%2CSL)

[^225]: Bonomi, L., Huang, Y. & Ohno-Machado, L. Privacy challenges and research opportunities for genomic data sharing. *Nat. Genet.* **52**, 646–654 (2020).

[Article](https://doi.org/10.1038%2Fs41588-020-0651-0) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32601475) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7761157) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Privacy%20challenges%20and%20research%20opportunities%20for%20genomic%20data%20sharing&journal=Nat.%20Genet.&doi=10.1038%2Fs41588-020-0651-0&volume=52&pages=646-654&publication_year=2020&author=Bonomi%2CL&author=Huang%2CY&author=Ohno-Machado%2CL)

[^226]: Malin, B. & Goodman, K. Between access and privacy: challenges in sharing health data. *Yearb. Med Inf.* **27**, 55–59 (2018).

[Article](https://doi.org/10.1055%2Fs-0038-1641216) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Between%20access%20and%20privacy%3A%20challenges%20in%20sharing%20health%20data&journal=Yearb.%20Med%20Inf.&doi=10.1055%2Fs-0038-1641216&volume=27&pages=55-59&publication_year=2018&author=Malin%2CB&author=Goodman%2CK)

[^227]: Schreiber, R., Koppel, R. & Kaplan, B. What do we mean by sharing of patient data? Dash: a data sharing hierarchy of privacy and ethical challenges. *Appl Clin. Inf.* **15**, 833–841 (2024).

[Article](https://doi.org/10.1055%2Fa-2373-3291) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=What%20do%20we%20mean%20by%20sharing%20of%20patient%20data%3F%20Dash%3A%20a%20data%20sharing%20hierarchy%20of%20privacy%20and%20ethical%20challenges&journal=Appl%20Clin.%20Inf.&doi=10.1055%2Fa-2373-3291&volume=15&pages=833-841&publication_year=2024&author=Schreiber%2CR&author=Koppel%2CR&author=Kaplan%2CB)

[^228]: White, T., Blok, E. & Calhoun, V. D. Data sharing and privacy issues in neuroimaging research: opportunities, obstacles, challenges, and monsters under the bed. *Hum. Brain Mapp.* **43**, 278–291 (2022).

[Article](https://doi.org/10.1002%2Fhbm.25120) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32621651) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Data%20sharing%20and%20privacy%20issues%20in%20neuroimaging%20research%3A%20opportunities%2C%20obstacles%2C%20challenges%2C%20and%20monsters%20under%20the%20bed&journal=Hum.%20Brain%20Mapp.&doi=10.1002%2Fhbm.25120&volume=43&pages=278-291&publication_year=2022&author=White%2CT&author=Blok%2CE&author=Calhoun%2CVD)

[^229]: Chen, R. et al. Data sharing and privacy in pharmaceutical studies. *Curr. Pharm. Des.* **27**, 911–918 (2021).

[Article](https://doi.org/10.2174%2F1381612827999210112204732) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=33438533) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Data%20sharing%20and%20privacy%20in%20pharmaceutical%20studies&journal=Curr.%20Pharm.%20Des.&doi=10.2174%2F1381612827999210112204732&volume=27&pages=911-918&publication_year=2021&author=Chen%2CR)

[^230]: Alfawzan, N. et al. Privacy, data sharing, and data security policies of women’s mhealth apps: scoping review and content analysis. *JMIR Mhealth Uhealth* **10**, e33735 (2022).

[Article](https://doi.org/10.2196%2F33735) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35522465) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9123546) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Privacy%2C%20data%20sharing%2C%20and%20data%20security%20policies%20of%20women%E2%80%99s%20mhealth%20apps%3A%20scoping%20review%20and%20content%20analysis&journal=JMIR%20Mhealth%20Uhealth&doi=10.2196%2F33735&volume=10&publication_year=2022&author=Alfawzan%2CN)

[^231]: Conduah, A. K., Ofoe, S. & Siaw-Marfo, D. Data privacy in healthcare: global challenges and solutions. *Digit. Health* **11**, 20552076251343959 (2025).

[Article](https://doi.org/10.1177%2F20552076251343959) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40475296) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC12138216) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Data%20privacy%20in%20healthcare%3A%20global%20challenges%20and%20solutions&journal=Digit.%20Health&doi=10.1177%2F20552076251343959&volume=11&publication_year=2025&author=Conduah%2CAK&author=Ofoe%2CS&author=Siaw-Marfo%2CD)

[^232]: Drummond, D. & Gonsard, A. Definitions and characteristics of patient digital twins being developed for clinical use: scoping review. *J. Med. Internet Res.* **26**, e58504 (2024).

[Article](https://doi.org/10.2196%2F58504) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39536311) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11602770) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Definitions%20and%20characteristics%20of%20patient%20digital%20twins%20being%20developed%20for%20clinical%20use%3A%20scoping%20review&journal=J.%20Med.%20Internet%20Res.&doi=10.2196%2F58504&volume=26&publication_year=2024&author=Drummond%2CD&author=Gonsard%2CA)

[^233]: Cramer, J. Privacy, data sharing, and other legal considerations. *Surg. Clin. North Am.* **103**, 347–356 (2023).

[Article](https://doi.org/10.1016%2Fj.suc.2022.12.003) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=36948723) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Privacy%2C%20data%20sharing%2C%20and%20other%20legal%20considerations&journal=Surg.%20Clin.%20North%20Am.&doi=10.1016%2Fj.suc.2022.12.003&volume=103&pages=347-356&publication_year=2023&author=Cramer%2CJ)

[^234]: Wirth, F. N. et al. Privacy-preserving data sharing infrastructures for medical research: systematization and comparison. *BMC Med. Inf. Decis. Mak.* **21**, 242 (2021).

[Article](https://link.springer.com/doi/10.1186/s12911-021-01602-x) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Privacy-preserving%20data%20sharing%20infrastructures%20for%20medical%20research%3A%20systematization%20and%20comparison&journal=BMC%20Med.%20Inf.%20Decis.%20Mak.&doi=10.1186%2Fs12911-021-01602-x&volume=21&publication_year=2021&author=Wirth%2CFN)

[^235]: Huang, D., Ye, X. & Sakurai, T. Multi-party collaborative drug discovery via federated learning \[J\]. *Comput. Biol. Med.* **171**, 108181 (2024).

[Article](https://doi.org/10.1016%2Fj.compbiomed.2024.108181) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38428094) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Multi-party%20collaborative%20drug%20discovery%20via%20federated%20learning%20%5BJ%5D&journal=Comput.%20Biol.%20Med.&doi=10.1016%2Fj.compbiomed.2024.108181&volume=171&publication_year=2024&author=Huang%2CD&author=Ye%2CX&author=Sakurai%2CT)

[^236]: Li Y., et al. LF3PFL: a practical privacy-preserving federated learning algorithm based on local federalization scheme. *Entropy* **26**, 353 (2024).

[^237]: Wang, X. Z., Wang, R. & Xu, C. Discovering the relationship between generalization and uncertainty by incorporating complexity of classification. *IEEE Trans. Cyber* **48**, 703–715 (2018).

[Article](https://doi.org/10.1109%2FTCYB.2017.2653223) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Discovering%20the%20relationship%20between%20generalization%20and%20uncertainty%20by%20incorporating%20complexity%20of%20classification&journal=IEEE%20Trans.%20Cyber&doi=10.1109%2FTCYB.2017.2653223&volume=48&pages=703-715&publication_year=2018&author=Wang%2CXZ&author=Wang%2CR&author=Xu%2CC)

[^238]: Gear, C., Koziol-Mclain, J. & Eppel, E. Engaging with uncertainty and complexity: a secondary analysis of primary care responses to intimate partner violence. *Glob. Qual. Nurs. Res.* **8**, 2333393621995164 (2021).

[Article](https://doi.org/10.1177%2F2333393621995164) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=33748332) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7905719) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Engaging%20with%20uncertainty%20and%20complexity%3A%20a%20secondary%20analysis%20of%20primary%20care%20responses%20to%20intimate%20partner%20violence&journal=Glob.%20Qual.%20Nurs.%20Res.&doi=10.1177%2F2333393621995164&volume=8&publication_year=2021&author=Gear%2CC&author=Koziol-Mclain%2CJ&author=Eppel%2CE)

[^239]: Lawless W. F., Moskowitz I. S., Doctor K. Z. A Quantum-like model of interdependence for embodied human-machine teams: reviewing the path to autonomy facing complexity and uncertainty. *Entropy* **25**, 1323 (2023).

[^240]: Tajmir, S. H. et al. Artificial intelligence-assisted interpretation of bone age radiographs improves accuracy and decreases variability. *Skelet. Radio.* **48**, 275–283 (2019).

[Article](https://link.springer.com/doi/10.1007/s00256-018-3033-2) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Artificial%20intelligence-assisted%20interpretation%20of%20bone%20age%20radiographs%20improves%20accuracy%20and%20decreases%20variability&journal=Skelet.%20Radio.&doi=10.1007%2Fs00256-018-3033-2&volume=48&pages=275-283&publication_year=2019&author=Tajmir%2CSH)

[^241]: Folgert, A. & Degroot, K. Using AI-generated podcasts as an adjunct to traditional teaching strategies. *Nurse Educ.* **50**, 78 (2025).

[Article](https://doi.org/10.1097%2FNNE.0000000000001787) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39642907) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Using%20AI-generated%20podcasts%20as%20an%20adjunct%20to%20traditional%20teaching%20strategies&journal=Nurse%20Educ.&doi=10.1097%2FNNE.0000000000001787&volume=50&publication_year=2025&author=Folgert%2CA&author=Degroot%2CK)

[^242]: Yang, Y. et al. Integration of AI-assisted in digital cervical cytology training: a comparative study. *Cytopathology* **36**, 156–164 (2025).

[Article](https://doi.org/10.1111%2Fcyt.13461) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39648283) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Integration%20of%20AI-assisted%20in%20digital%20cervical%20cytology%20training%3A%20a%20comparative%20study&journal=Cytopathology&doi=10.1111%2Fcyt.13461&volume=36&pages=156-164&publication_year=2025&author=Yang%2CY)

[^243]: Vinnakota, K. C. et al. Improving the physiological realism of experimental models. *Interface Focus* **6**, 20150076 (2016).

[Article](https://doi.org/10.1098%2Frsfs.2015.0076) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=27051507) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4759746) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Improving%20the%20physiological%20realism%20of%20experimental%20models&journal=Interface%20Focus&doi=10.1098%2Frsfs.2015.0076&volume=6&publication_year=2016&author=Vinnakota%2CKC)

[^244]: Fletcher, A. G. & Osborne, J. M. Seven challenges in the multiscale modeling of multicellular tissues. *WIREs Mech. Dis.* **14**, e1527 (2022).

[Article](https://doi.org/10.1002%2Fwsbm.1527) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35023326) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Seven%20challenges%20in%20the%20multiscale%20modeling%20of%20multicellular%20tissues&journal=WIREs%20Mech.%20Dis.&doi=10.1002%2Fwsbm.1527&volume=14&publication_year=2022&author=Fletcher%2CAG&author=Osborne%2CJM)

[^245]: Hunter, P. J. The IUPS physiome project: a framework for computational physiology \[J\]. *Prog. Biophys. Mol. Biol.* **85**, 551–569 (2004).

[Article](https://doi.org/10.1016%2Fj.pbiomolbio.2004.02.006) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=15142761) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20IUPS%20physiome%20project%3A%20a%20framework%20for%20computational%20physiology%20%5BJ%5D&journal=Prog.%20Biophys.%20Mol.%20Biol.&doi=10.1016%2Fj.pbiomolbio.2004.02.006&volume=85&pages=551-569&publication_year=2004&author=Hunter%2CPJ)

[^246]: Zhao Z., et al. Organoids. *Nat. Rev. Methods Primers* **2**, e274 (2022).

[^247]: Wang, H. et al. Human organoids-on-chips for biomedical research and applications. *Theranostics* **14**, 788–818 (2024).

[Article](https://doi.org/10.7150%2Fthno.90492) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38169573) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10758054) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Human%20organoids-on-chips%20for%20biomedical%20research%20and%20applications&journal=Theranostics&doi=10.7150%2Fthno.90492&volume=14&pages=788-818&publication_year=2024&author=Wang%2CH)

[^248]: Huang, P. H., Kim, K. H. & Schermer, M. Ethical issues of digital twins for personalized health care service: preliminary mapping study. *J. Med. Internet Res.* **24**, e33081 (2022).

[Article](https://doi.org/10.2196%2F33081) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35099399) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC8844982) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Ethical%20issues%20of%20digital%20twins%20for%20personalized%20health%20care%20service%3A%20preliminary%20mapping%20study&journal=J.%20Med.%20Internet%20Res.&doi=10.2196%2F33081&volume=24&publication_year=2022&author=Huang%2CPH&author=Kim%2CKH&author=Schermer%2CM)

[^249]: UNION E P C O T E. Regulation (EU) 2016/679 (General Data Protection Regulation), (EU, 2016).

[^250]: UNION E P C O T E. Regulation (EU) 2025/327 on the European Health Data Space and amending Directive 2011/24/EU, (EU, 2025).

[^251]: Yu, L., Stokes, J. R. & Yakubov, G. E. Viscoelastic behaviour of rapid and slow self-healing hydrogels formed by densely branched arabinoxylans from Plantago ovata seed mucilage. *Carbohydr. Polym.* **269**, 118318 (2021).

[Article](https://doi.org/10.1016%2Fj.carbpol.2021.118318) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=34294330) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Viscoelastic%20behaviour%20of%20rapid%20and%20slow%20self-healing%20hydrogels%20formed%20by%20densely%20branched%20arabinoxylans%20from%20Plantago%20ovata%20seed%20mucilage&journal=Carbohydr.%20Polym.&doi=10.1016%2Fj.carbpol.2021.118318&volume=269&publication_year=2021&author=Yu%2CL&author=Stokes%2CJR&author=Yakubov%2CGE)

[^252]: Mohammed Yakubu, A. & Chen, Y. P. Ensuring privacy and security of genomic data and functionalities. *Brief. Bioinform* **21**, 511–526 (2020).

[Article](https://doi.org/10.1093%2Fbib%2Fbbz013) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=30759195) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Ensuring%20privacy%20and%20security%20of%20genomic%20data%20and%20functionalities&journal=Brief.%20Bioinform&doi=10.1093%2Fbib%2Fbbz013&volume=21&pages=511-526&publication_year=2020&author=Mohammed%20Yakubu%2CA&author=Chen%2CYP)

[^253]: Thapa, C. & Camtepe, S. Precision health data: requirements, challenges and existing techniques for data security and privacy. *Comput Biol. Med* **129**, 104130 (2021).

[Article](https://doi.org/10.1016%2Fj.compbiomed.2020.104130) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=33271399) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Precision%20health%20data%3A%20requirements%2C%20challenges%20and%20existing%20techniques%20for%20data%20security%20and%20privacy&journal=Comput%20Biol.%20Med&doi=10.1016%2Fj.compbiomed.2020.104130&volume=129&publication_year=2021&author=Thapa%2CC&author=Camtepe%2CS)

[^254]: Oh S. R., et al. A comprehensive survey on security and privacy for electronic health data. *Int. J. Environ. Res. Public Health* **18**, 9668 (2021).

[^255]: Rai, H. M. et al. Enhancing data security and privacy in energy applications: Integrating IoT and blockchain technologies. *Heliyon* **10**, e38917 (2024).

[Article](https://doi.org/10.1016%2Fj.heliyon.2024.e38917) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39430499) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11490785) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Enhancing%20data%20security%20and%20privacy%20in%20energy%20applications%3A%20Integrating%20IoT%20and%20blockchain%20technologies&journal=Heliyon&doi=10.1016%2Fj.heliyon.2024.e38917&volume=10&publication_year=2024&author=Rai%2CHM)

[^256]: Kobayashi, S., Kane, T. B. & Paton, C. The privacy and security implications of open data in healthcare. *Yearb. Med Inf.* **27**, 41–47 (2018).

[Article](https://doi.org/10.1055%2Fs-0038-1641201) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20privacy%20and%20security%20implications%20of%20open%20data%20in%20healthcare&journal=Yearb.%20Med%20Inf.&doi=10.1055%2Fs-0038-1641201&volume=27&pages=41-47&publication_year=2018&author=Kobayashi%2CS&author=Kane%2CTB&author=Paton%2CC)

[^257]: Khalid M. I., Ahmed M., Kim J. Enhancing data protection in dynamic consent management systems: formalizing privacy and security definitions with differential privacy, decentralization, and zero-knowledge proofs. *Sensors* **23**, 7604 (2023).

[^258]: Yakubu, B. M., Sabi’u, J. & Bhattarakosol, P. Blockchain-based privacy and security model for transactional data in large private networks. *Sci. Rep.* **13**, 17108 (2023).

[Article](https://doi.org/10.1038%2Fs41598-023-44101-x) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37816836) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10564954) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Blockchain-based%20privacy%20and%20security%20model%20for%20transactional%20data%20in%20large%20private%20networks&journal=Sci.%20Rep.&doi=10.1038%2Fs41598-023-44101-x&volume=13&publication_year=2023&author=Yakubu%2CBM&author=Sabi%E2%80%99u%2CJ&author=Bhattarakosol%2CP)

[^259]: Mackenzie, I. S. et al. Managing security and privacy concerns over data storage in healthcare research. *Pharmacoepidemiol Drug Saf.* **20**, 885–893 (2011).

[Article](https://doi.org/10.1002%2Fpds.2170) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=21714035) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Managing%20security%20and%20privacy%20concerns%20over%20data%20storage%20in%20healthcare%20research&journal=Pharmacoepidemiol%20Drug%20Saf.&doi=10.1002%2Fpds.2170&volume=20&pages=885-893&publication_year=2011&author=Mackenzie%2CIS)

[^260]: Zhang P., Ma J. Channel characteristic aware privacy protection mechanism in WBAN. *Sensors* **18**, 2403 (2018).

[^261]: Liu, L. et al. Dual blockchain-based data sharing mechanism with privacy protection for medical internet of things. *Heliyon* **10**, e23575 (2024).

[Article](https://doi.org/10.1016%2Fj.heliyon.2023.e23575) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38169943) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Dual%20blockchain-based%20data%20sharing%20mechanism%20with%20privacy%20protection%20for%20medical%20internet%20of%20things&journal=Heliyon&doi=10.1016%2Fj.heliyon.2023.e23575&volume=10&publication_year=2024&author=Liu%2CL)

[^262]: Liang, S., Lam, J. & Lin, H. Secure estimation with privacy protection. *IEEE Trans. Cyber* **53**, 4947–4961 (2023).

[Article](https://doi.org/10.1109%2FTCYB.2022.3151234) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Secure%20estimation%20with%20privacy%20protection&journal=IEEE%20Trans.%20Cyber&doi=10.1109%2FTCYB.2022.3151234&volume=53&pages=4947-4961&publication_year=2023&author=Liang%2CS&author=Lam%2CJ&author=Lin%2CH)

[^263]: Li, Z. et al. Local differential privacy protection for wearable device data. *PLoS One* **17**, e0272766 (2022).

[Article](https://doi.org/10.1371%2Fjournal.pone.0272766) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35976869) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9385068) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Local%20differential%20privacy%20protection%20for%20wearable%20device%20data&journal=PLoS%20One&doi=10.1371%2Fjournal.pone.0272766&volume=17&publication_year=2022&author=Li%2CZ)

[^264]: Lang, F. & Zhong, Y. Application of personal information privacy protection based on machine learning algorithm. *Comput Intell. Neurosci.* **2022**, 6710631 (2022).

[Article](https://doi.org/10.1155%2F2022%2F6710631) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35958767) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9357731) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Application%20of%20personal%20information%20privacy%20protection%20based%20on%20machine%20learning%20algorithm&journal=Comput%20Intell.%20Neurosci.&doi=10.1155%2F2022%2F6710631&volume=2022&publication_year=2022&author=Lang%2CF&author=Zhong%2CY)

[^265]: Altman, M. & Cohen, A. Natural differential privacy-a perspective on protection guarantees. *PeerJ Comput Sci.* **9**, e1576 (2023).

[Article](https://doi.org/10.7717%2Fpeerj-cs.1576) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37810366) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10557523) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Natural%20differential%20privacy-a%20perspective%20on%20protection%20guarantees&journal=PeerJ%20Comput%20Sci.&doi=10.7717%2Fpeerj-cs.1576&volume=9&publication_year=2023&author=Altman%2CM&author=Cohen%2CA)

[^266]: Hu, Z. & Yang, J. Differential privacy protection method based on published trajectory cross-correlation constraint. *PLoS One* **15**, e0237158 (2020).

[Article](https://doi.org/10.1371%2Fjournal.pone.0237158) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32785242) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7423147) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Differential%20privacy%20protection%20method%20based%20on%20published%20trajectory%20cross-correlation%20constraint&journal=PLoS%20One&doi=10.1371%2Fjournal.pone.0237158&volume=15&publication_year=2020&author=Hu%2CZ&author=Yang%2CJ)

[^267]: Kaul, V. & Mukherjee, T. Equitable differential privacy. *Front Big Data* **7**, 1420344 (2024).

[Article](https://doi.org/10.3389%2Ffdata.2024.1420344) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39220199) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11363707) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Equitable%20differential%20privacy&journal=Front%20Big%20Data&doi=10.3389%2Ffdata.2024.1420344&volume=7&publication_year=2024&author=Kaul%2CV&author=Mukherjee%2CT)

[^268]: Dyda, A. et al. Differential privacy for public health data: an innovative tool to optimize information sharing while protecting data confidentiality. *Patterns* **2**, 100366 (2021).

[Article](https://doi.org/10.1016%2Fj.patter.2021.100366) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=34909703) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC8662814) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Differential%20privacy%20for%20public%20health%20data%3A%20an%20innovative%20tool%20to%20optimize%20information%20sharing%20while%20protecting%20data%20confidentiality&journal=Patterns&doi=10.1016%2Fj.patter.2021.100366&volume=2&publication_year=2021&author=Dyda%2CA)

[^269]: Shen, Z. & Zhong, T. Analysis of application examples of differential privacy in deep learning. *Comput. Intell. Neurosci.* **2021**, 4244040 (2021).

[Article](https://doi.org/10.1155%2F2021%2F4244040) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=34745246) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC8564206) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Analysis%20of%20application%20examples%20of%20differential%20privacy%20in%20deep%20learning&journal=Comput.%20Intell.%20Neurosci.&doi=10.1155%2F2021%2F4244040&volume=2021&publication_year=2021&author=Shen%2CZ&author=Zhong%2CT)

[^270]: Nolte, D. et al. Federated learning framework integrating REFINED CNN and deep regression forests. *Bioinform. Adv.* **3**, vbad036 (2023).

[Article](https://doi.org/10.1093%2Fbioadv%2Fvbad036) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37033467) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10074025) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Federated%20learning%20framework%20integrating%20REFINED%20CNN%20and%20deep%20regression%20forests&journal=Bioinform.%20Adv.&doi=10.1093%2Fbioadv%2Fvbad036&volume=3&publication_year=2023&author=Nolte%2CD)

[^271]: Zhang, F. et al. Secure and decentralized federated learning framework with non-IID data based on blockchain. *Heliyon* **10**, e27176 (2024).

[Article](https://doi.org/10.1016%2Fj.heliyon.2024.e27176) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38562497) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10982967) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Secure%20and%20decentralized%20federated%20learning%20framework%20with%20non-IID%20data%20based%20on%20blockchain&journal=Heliyon&doi=10.1016%2Fj.heliyon.2024.e27176&volume=10&publication_year=2024&author=Zhang%2CF)

[^272]: Biagioli, M. & Buning, M. Technologies of the law/ law as a technology”. *Hist. Sci.* **57**, 3–17 (2019).

[Article](https://doi.org/10.1177%2F0073275318816163) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=30574798) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Technologies%20of%20the%20law%2F%20law%20as%20a%20technology%E2%80%9D&journal=Hist.%20Sci.&doi=10.1177%2F0073275318816163&volume=57&pages=3-17&publication_year=2019&author=Biagioli%2CM&author=Buning%2CM)

[^273]: Qandeel, M. Facial recognition technology: regulations, rights and the rule of law. *Front. Big Data* **7**, 1354659 (2024).

[Article](https://doi.org/10.3389%2Ffdata.2024.1354659) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38895177) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11183273) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Facial%20recognition%20technology%3A%20regulations%2C%20rights%20and%20the%20rule%20of%20law&journal=Front.%20Big%20Data&doi=10.3389%2Ffdata.2024.1354659&volume=7&publication_year=2024&author=Qandeel%2CM)

[^274]: Bai Y., Guang X., Yeung R. W. Multiple linear-combination security network coding. *Entropy* **25**, 1135 (2023).

[^275]: Li, J., Ji, S. & Jiang, Y. Development of network security based on the neural network PSD algorithm. *Comput. Intell. Neurosci.* **2022**, 9460985 (2022).

[PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=36211000) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9546651) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Development%20of%20network%20security%20based%20on%20the%20neural%20network%20PSD%20algorithm&journal=Comput.%20Intell.%20Neurosci.&volume=2022&publication_year=2022&author=Li%2CJ&author=Ji%2CS&author=Jiang%2CY)

[^276]: Wang Y., et al. Towards double defense network security based on multi-identifier network architecture. *Sensors* **22**, 747 (2022).

[^277]: Kou Z., et al. Identification of abnormal data for synchronous monitoring of transformer DC bias based on multiple criteria. *Sensors* **23**, 4959 (2023).

[^278]: Xue, H. et al. Abnormal data region discrimination and cross-monitoring points historical correlation repair of water intake data. *Big Data* **7**, 99–113 (2019).

[Article](https://doi.org/10.1089%2Fbig.2018.0148) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=31074632) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Abnormal%20data%20region%20discrimination%20and%20cross-monitoring%20points%20historical%20correlation%20repair%20of%20water%20intake%20data&journal=Big%20Data&doi=10.1089%2Fbig.2018.0148&volume=7&pages=99-113&publication_year=2019&author=Xue%2CH)

[^279]: Spijkerboer, F. L., Overdyk, F. J. & Dahan, A. A machine learning algorithm for detecting abnormal patterns in continuous capnography and pulse oximetry monitoring. *J. Clin. Monit. Comput* **38**, 915–925 (2024).

[Article](https://link.springer.com/doi/10.1007/s10877-024-01155-0) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38619716) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11297897) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=A%20machine%20learning%20algorithm%20for%20detecting%20abnormal%20patterns%20in%20continuous%20capnography%20and%20pulse%20oximetry%20monitoring&journal=J.%20Clin.%20Monit.%20Comput&doi=10.1007%2Fs10877-024-01155-0&volume=38&pages=915-925&publication_year=2024&author=Spijkerboer%2CFL&author=Overdyk%2CFJ&author=Dahan%2CA)

[^280]: Gujral, H. et al. Design and implementation of a quantitative network health monitoring and recovery system. *Wirel. Pers. Commun.* **125**, 367–397 (2022).

[Article](https://link.springer.com/doi/10.1007/s11277-022-09554-9) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35370363) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC8951673) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Design%20and%20implementation%20of%20a%20quantitative%20network%20health%20monitoring%20and%20recovery%20system&journal=Wirel.%20Pers.%20Commun.&doi=10.1007%2Fs11277-022-09554-9&volume=125&pages=367-397&publication_year=2022&author=Gujral%2CH)

[^281]: Sauer, K. et al. The biofilm life cycle: expanding the conceptual model of biofilm formation. *Nat. Rev. Microbiol.* **20**, 608–620 (2022).

[Article](https://doi.org/10.1038%2Fs41579-022-00767-0) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35922483) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9841534) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20biofilm%20life%20cycle%3A%20expanding%20the%20conceptual%20model%20of%20biofilm%20formation&journal=Nat.%20Rev.%20Microbiol.&doi=10.1038%2Fs41579-022-00767-0&volume=20&pages=608-620&publication_year=2022&author=Sauer%2CK)

[^282]: Gilbert, P. et al. Intellectual property rights and vaccines. *Methods Mol. Biol.* **2412**, 505–518 (2022).

[Article](https://link.springer.com/doi/10.1007/978-1-0716-1892-9_28) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=34918265) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Intellectual%20property%20rights%20and%20vaccines&journal=Methods%20Mol.%20Biol.&doi=10.1007%2F978-1-0716-1892-9_28&volume=2412&pages=505-518&publication_year=2022&author=Gilbert%2CP)

[^283]: Brown, W. M. Intellectual property. *Methods Mol. Med.* **40**, 227–241 (2000).

[Article](https://doi.org/10.1385%2F1-59259-076-4%3A227) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=21337093) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Intellectual%20property&journal=Methods%20Mol.%20Med.&doi=10.1385%2F1-59259-076-4%3A227&volume=40&pages=227-241&publication_year=2000&author=Brown%2CWM)

[^284]: Rake, B. Waiving intellectual property rights: boom or bust for medical innovation? *Drug Discov. Today* **27**, 384–389 (2022).

[Article](https://doi.org/10.1016%2Fj.drudis.2021.10.015) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=34718204) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Waiving%20intellectual%20property%20rights%3A%20boom%20or%20bust%20for%20medical%20innovation%3F&journal=Drug%20Discov.%20Today&doi=10.1016%2Fj.drudis.2021.10.015&volume=27&pages=384-389&publication_year=2022&author=Rake%2CB)

[^285]: Chisholm, O. & Critchley, H. Future directions in regulatory affairs. *Front. Med.* **9**, 1082384 (2022).

[Article](https://doi.org/10.3389%2Ffmed.2022.1082384) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Future%20directions%20in%20regulatory%20affairs&journal=Front.%20Med.&doi=10.3389%2Ffmed.2022.1082384&volume=9&publication_year=2022&author=Chisholm%2CO&author=Critchley%2CH)

[^286]: Sneve M., Smith G. Reducing risks through regulatory cooperation: a review of bilateral regulatory cooperation between the Norwegian Radiation and Nuclear Safety Authority and corresponding authorities in countries of the former Soviet Union. *J. Radiol. Prot*. **45**, 82 (2025).

[^287]: Pejović, G. et al. Towards medicines regulatory authorities’ quality performance improvement: value for public health. *Int J. Health Plan. Manag.* **31**, E22–E40 (2016).

[Article](https://doi.org/10.1002%2Fhpm.2265) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Towards%20medicines%20regulatory%20authorities%E2%80%99%20quality%20performance%20improvement%3A%20value%20for%20public%20health&journal=Int%20J.%20Health%20Plan.%20Manag.&doi=10.1002%2Fhpm.2265&volume=31&pages=E22-E40&publication_year=2016&author=Pejovi%C4%87%2CG)

[^288]: Singhal, A. et al. Toward fairness, accountability, transparency, and ethics in ai for social media and health care: scoping review. *JMIR Med Inf.* **12**, e50048 (2024).

[Article](https://doi.org/10.2196%2F50048) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Toward%20fairness%2C%20accountability%2C%20transparency%2C%20and%20ethics%20in%20ai%20for%20social%20media%20and%20health%20care%3A%20scoping%20review&journal=JMIR%20Med%20Inf.&doi=10.2196%2F50048&volume=12&publication_year=2024&author=Singhal%2CA)

[^289]: Ueda, D. et al. Fairness of artificial intelligence in healthcare: review and recommendations. *Jpn. J. Radio.* **42**, 3–15 (2024).

[Article](https://link.springer.com/doi/10.1007/s11604-023-01474-3) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Fairness%20of%20artificial%20intelligence%20in%20healthcare%3A%20review%20and%20recommendations&journal=Jpn.%20J.%20Radio.&doi=10.1007%2Fs11604-023-01474-3&volume=42&pages=3-15&publication_year=2024&author=Ueda%2CD)

[^290]: Inglada Galiana, L., Corral Gudino, L. & Miramontes González, P. Ethics and artificial intelligence. *Rev. Clin. Esp.* **224**, 178–186 (2024).

[Article](https://doi.org/10.1016%2Fj.rce.2024.01.007) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38355097) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Ethics%20and%20artificial%20intelligence&journal=Rev.%20Clin.%20Esp.&doi=10.1016%2Fj.rce.2024.01.007&volume=224&pages=178-186&publication_year=2024&author=Inglada%20Galiana%2CL&author=Corral%20Gudino%2CL&author=Miramontes%20Gonz%C3%A1lez%2CP)

[^291]: Liefgreen, A. et al. Beyond ideals: why the (medical) AI industry needs to motivate behavioural change in line with fairness and transparency values, and how it can do it. *AI Soc.* **39**, 2183–2199 (2024).

[Article](https://link.springer.com/doi/10.1007/s00146-023-01684-3) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39309255) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Beyond%20ideals%3A%20why%20the%20%28medical%29%20AI%20industry%20needs%20to%20motivate%20behavioural%20change%20in%20line%20with%20fairness%20and%20transparency%20values%2C%20and%20how%20it%20can%20do%20it&journal=AI%20Soc.&doi=10.1007%2Fs00146-023-01684-3&volume=39&pages=2183-2199&publication_year=2024&author=Liefgreen%2CA)

[^292]: Van Der Velden, B. H. M. et al. Explainable artificial intelligence (XAI) in deep learning-based medical image analysis. *Med. Image Anal.* **79**, 102470 (2022).

[Article](https://doi.org/10.1016%2Fj.media.2022.102470) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35576821) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Explainable%20artificial%20intelligence%20%28XAI%29%20in%20deep%20learning-based%20medical%20image%20analysis&journal=Med.%20Image%20Anal.&doi=10.1016%2Fj.media.2022.102470&volume=79&publication_year=2022&author=Velden%2CBHM)

[^293]: Toussaint, P. A. et al. Explainable artificial intelligence for omics data: a systematic mapping study. *Brief Bioinform.* **25**, bbad453 (2023).

[^294]: Ding, Q. et al. Explainable artificial intelligence in the field of drug research. *Drug Des. Devel Ther.* **19**, 4501–4516 (2025).

[Article](https://doi.org/10.2147%2FDDDT.S525171) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40458811) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC12129466) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Explainable%20artificial%20intelligence%20in%20the%20field%20of%20drug%20research&journal=Drug%20Des.%20Devel%20Ther.&doi=10.2147%2FDDDT.S525171&volume=19&pages=4501-4516&publication_year=2025&author=Ding%2CQ)

[^295]: Polimeni, M., Pasquier, C. & Lund, M. Virtual cell model for osmotic pressure calculation of charged biomolecules. *J. Chem. Phys.* **155**, 194111 (2021).

[Article](https://doi.org/10.1063%2F5.0063717) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=34800960) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Virtual%20cell%20model%20for%20osmotic%20pressure%20calculation%20of%20charged%20biomolecules&journal=J.%20Chem.%20Phys.&doi=10.1063%2F5.0063717&volume=155&publication_year=2021&author=Polimeni%2CM&author=Pasquier%2CC&author=Lund%2CM)

[^296]: Garny, A. et al. CellML and associated tools and techniques. *Philos. Trans. A Math. Phys. Eng. Sci.* **366**, 3017–3043 (2008).

[PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=18579471) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=CellML%20and%20associated%20tools%20and%20techniques&journal=Philos.%20Trans.%20A%20Math.%20Phys.%20Eng.%20Sci.&volume=366&pages=3017-3043&publication_year=2008&author=Garny%2CA)

[^297]: Douillet, A. & Ballet, P. A GPU algorithm for agent-based models to simulate the integration of cell membrane signals. *Acta Biotheor.* **68**, 61–71 (2020).

[Article](https://link.springer.com/doi/10.1007/s10441-019-09360-0) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=31468242) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=A%20GPU%20algorithm%20for%20agent-based%20models%20to%20simulate%20the%20integration%20of%20cell%20membrane%20signals&journal=Acta%20Biotheor.&doi=10.1007%2Fs10441-019-09360-0&volume=68&pages=61-71&publication_year=2020&author=Douillet%2CA&author=Ballet%2CP)

[^298]: Kobayashi, S. S. et al. Identification of myeloproliferative neoplasm drug agents via predictive simulation modeling: assessing responsiveness with micro-environment derived cytokines. *Oncotarget* **7**, 35989–36001 (2016).

[Article](https://doi.org/10.18632%2Foncotarget.8540) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=27056884) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC5094977) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Identification%20of%20myeloproliferative%20neoplasm%20drug%20agents%20via%20predictive%20simulation%20modeling%3A%20assessing%20responsiveness%20with%20micro-environment%20derived%20cytokines&journal=Oncotarget&doi=10.18632%2Foncotarget.8540&volume=7&pages=35989-36001&publication_year=2016&author=Kobayashi%2CSS)

[^299]: Waqas, A. et al. Revolutionizing digital pathology with the power of generative artificial intelligence and foundation models. *Lab. Invest.* **103**, 100255 (2023).

[Article](https://doi.org/10.1016%2Fj.labinv.2023.100255) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37757969) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Revolutionizing%20digital%20pathology%20with%20the%20power%20of%20generative%20artificial%20intelligence%20and%20foundation%20models&journal=Lab.%20Invest.&doi=10.1016%2Fj.labinv.2023.100255&volume=103&publication_year=2023&author=Waqas%2CA)

[^300]: Cascella, M. et al. The breakthrough of large language models release for medical applications: 1-year timeline and perspectives. *J. Med. Syst.* **48**, 22 (2024).

[Article](https://link.springer.com/doi/10.1007/s10916-024-02045-3) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38366043) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10873461) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20breakthrough%20of%20large%20language%20models%20release%20for%20medical%20applications%3A%201-year%20timeline%20and%20perspectives&journal=J.%20Med.%20Syst.&doi=10.1007%2Fs10916-024-02045-3&volume=48&publication_year=2024&author=Cascella%2CM)

[^301]: Gu, Y. et al. A review of the development and challenges of cell mechanical models \[J\]. *IEEE Trans. Nanobiosci.* **22**, 673–684 (2023).

[Article](https://doi.org/10.1109%2FTNB.2023.3235868) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=A%20review%20of%20the%20development%20and%20challenges%20of%20cell%20mechanical%20models%20%5BJ%5D&journal=IEEE%20Trans.%20Nanobiosci.&doi=10.1109%2FTNB.2023.3235868&volume=22&pages=673-684&publication_year=2023&author=Gu%2CY)

[^302]: Boycott K. M., et al. International collaborative actions and transparency to understand, diagnose, and develop therapies for rare diseases. *EMBO Mol. Med.* **11**, e10486 (2019).

[^303]: Keating et al. SBML Level 3: an extensible format for the exchange and reuse of biological models. *Mol. Syst. Biol.* **16**, e9110 (2020).

[Article](https://doi.org/10.15252%2Fmsb.20199110) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32845085) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC8411907) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=SBML%20Level%203%3A%20an%20extensible%20format%20for%20the%20exchange%20and%20reuse%20of%20biological%20models&journal=Mol.%20Syst.%20Biol.&doi=10.15252%2Fmsb.20199110&volume=16&publication_year=2020&author=Keating%2C)

[^304]: Clerx M., et al. CellML 2.0. *J. Integr. Bioinform.* **17**, 20200021 (2020).

[^305]: Huang, K. et al. Artificial intelligence foundation for therapeutic science. *Nat. Chem. Biol.* **18**, 1033–1036 (2022).

[Article](https://doi.org/10.1038%2Fs41589-022-01131-2) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=36131149) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9529840) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Artificial%20intelligence%20foundation%20for%20therapeutic%20science&journal=Nat.%20Chem.%20Biol.&doi=10.1038%2Fs41589-022-01131-2&volume=18&pages=1033-1036&publication_year=2022&author=Huang%2CK)

[^306]: Luecken, M. D. et al. Defining and benchmarking open problems in single-cell analysis. *Nat. Biotechnol.* **43**, 1035–1040 (2025).

[Article](https://doi.org/10.1038%2Fs41587-025-02694-w) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40595413) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Defining%20and%20benchmarking%20open%20problems%20in%20single-cell%20analysis&journal=Nat.%20Biotechnol.&doi=10.1038%2Fs41587-025-02694-w&volume=43&pages=1035-1040&publication_year=2025&author=Luecken%2CMD)

[^307]: Moher, D. et al. Increasing value and reducing waste in biomedical research: who’s listening? *Lancet* **387**, 1573–1586 (2016).

[Article](https://doi.org/10.1016%2FS0140-6736%2815%2900307-4) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=26423180) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Increasing%20value%20and%20reducing%20waste%20in%20biomedical%20research%3A%20who%E2%80%99s%20listening%3F&journal=Lancet&doi=10.1016%2FS0140-6736%2815%2900307-4&volume=387&pages=1573-1586&publication_year=2016&author=Moher%2CD)

[^308]: Hildebrandt, M. G. et al. How to increase value and reduce waste in research: initial experiences of applying Lean thinking and visual management in research leadership. *BMJ Open* **12**, e058179 (2022).

[Article](https://doi.org/10.1136%2Fbmjopen-2021-058179) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=36691235) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9171225) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=How%20to%20increase%20value%20and%20reduce%20waste%20in%20research%3A%20initial%20experiences%20of%20applying%20Lean%20thinking%20and%20visual%20management%20in%20research%20leadership&journal=BMJ%20Open&doi=10.1136%2Fbmjopen-2021-058179&volume=12&publication_year=2022&author=Hildebrandt%2CMG)

[^309]: Acker, J. P. Editorial: advancing the cryopreservation of cells, tissues and organs using model biological systems. *Cryobiology* **117**, 104975 (2024).

[Article](https://doi.org/10.1016%2Fj.cryobiol.2024.104975) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39341489) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Editorial%3A%20advancing%20the%20cryopreservation%20of%20cells%2C%20tissues%20and%20organs%20using%20model%20biological%20systems&journal=Cryobiology&doi=10.1016%2Fj.cryobiol.2024.104975&volume=117&publication_year=2024&author=Acker%2CJP)

[^310]: Holden, A. V. Development and application of human virtual excitable tissues and organs: from premature birth to sudden cardiac death. *Alter. Lab Anim.* **38**, 87–99 (2010).

[Article](https://doi.org/10.1177%2F026119291003801S12) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Development%20and%20application%20of%20human%20virtual%20excitable%20tissues%20and%20organs%3A%20from%20premature%20birth%20to%20sudden%20cardiac%20death&journal=Alter.%20Lab%20Anim.&doi=10.1177%2F026119291003801S12&volume=38&pages=87-99&publication_year=2010&author=Holden%2CAV)

[^311]: Qian, L., Dong, Z. & Guo, T. Grow AI virtual cells: three data pillars and closed-loop learning. *Cell Res.* **35**, 319–321 (2025).

[Article](https://doi.org/10.1038%2Fs41422-025-01101-y) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40128605) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Grow%20AI%20virtual%20cells%3A%20three%20data%20pillars%20and%20closed-loop%20learning&journal=Cell%20Res.&doi=10.1038%2Fs41422-025-01101-y&volume=35&pages=319-321&publication_year=2025&author=Qian%2CL&author=Dong%2CZ&author=Guo%2CT)

[^312]: Runser, S., Vetter, R. & Iber, D. SimuCell3D: three-dimensional simulation of tissue mechanics with cell polarization. *Nat. Comput Sci.* **4**, 299–309 (2024).

[Article](https://doi.org/10.1038%2Fs43588-024-00620-9) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38594592) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11052725) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=SimuCell3D%3A%20three-dimensional%20simulation%20of%20tissue%20mechanics%20with%20cell%20polarization&journal=Nat.%20Comput%20Sci.&doi=10.1038%2Fs43588-024-00620-9&volume=4&pages=299-309&publication_year=2024&author=Runser%2CS&author=Vetter%2CR&author=Iber%2CD)

[^313]: Kaczmarzyk et al. Explainable AI for computational pathology identifies model limitations and tissue biomarkers. ArXiv, 2024.

[^314]: Sathyan A., Weinberg A. I., Cohen K. Interpretable AI for bio-medical applications. *Complex Eng. Syst.* **2**, 18 (2022).

[^315]: Auzine, M. M. et al. Development of an ensemble CNN model with explainable AI for the classification of gastrointestinal cancer. *PLoS One* **19**, e0305628 (2024).

[Article](https://doi.org/10.1371%2Fjournal.pone.0305628) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38917159) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11198752) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Development%20of%20an%20ensemble%20CNN%20model%20with%20explainable%20AI%20for%20the%20classification%20of%20gastrointestinal%20cancer&journal=PLoS%20One&doi=10.1371%2Fjournal.pone.0305628&volume=19&publication_year=2024&author=Auzine%2CMM)

[^316]: Walter, M., Webb, S. J. & Gillet, V. J. Interpreting neural network models for toxicity prediction by extracting learned chemical features. *J. Chem. Inf. Model* **64**, 3670–3688 (2024).

[Article](https://doi.org/10.1021%2Facs.jcim.4c00127) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38686880) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11094726) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Interpreting%20neural%20network%20models%20for%20toxicity%20prediction%20by%20extracting%20learned%20chemical%20features&journal=J.%20Chem.%20Inf.%20Model&doi=10.1021%2Facs.jcim.4c00127&volume=64&pages=3670-3688&publication_year=2024&author=Walter%2CM&author=Webb%2CSJ&author=Gillet%2CVJ)

[^317]: Walker, D. C. & Southgate, J. The virtual cell—a candidate co-ordinator for ‘middle-out’ modelling of biological systems. *Brief. Bioinform.* **10**, 450–461 (2009).

[Article](https://doi.org/10.1093%2Fbib%2Fbbp010) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=19293250) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20virtual%20cell%E2%80%94a%20candidate%20co-ordinator%20for%20%E2%80%98middle-out%E2%80%99%20modelling%20of%20biological%20systems&journal=Brief.%20Bioinform.&doi=10.1093%2Fbib%2Fbbp010&volume=10&pages=450-461&publication_year=2009&author=Walker%2CDC&author=Southgate%2CJ)

[^318]: Storck, M. et al. \[Carcinoid tumor of the stomach—aspects of surgical therapy\]. *Chirurg* **62**, 284–288 (1991).

[PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=1860352) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=%5BCarcinoid%20tumor%20of%20the%20stomach%E2%80%94aspects%20of%20surgical%20therapy%5D&journal=Chirurg&volume=62&pages=284-288&publication_year=1991&author=Storck%2CM)