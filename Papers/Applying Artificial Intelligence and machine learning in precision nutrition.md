---
title: "Applying Artificial Intelligence and machine learning in precision nutrition"
source: "https://www.nature.com/articles/s41467-026-75004-w#Fig2"
author:
  - "[[Paraskevi Massara]]"
  - "[[Jonathan Kirkland]]"
  - "[[Ioanna Pagani]]"
  - "[[Samantha L. Huey]]"
  - "[[Haym Hirsh]]"
  - "[[Daniel McDonald]]"
  - "[[Lucas Patel]]"
  - "[[Julia L. Finkelstein]]"
  - "[[Marie Gantz]]"
  - "[[Fei Wang]]"
  - "[[David Erickson]]"
  - "[[Martin T. Wells]]"
  - "[[Olivier Elemento]]"
  - "[[Rob Knight]]"
  - "[[Saurabh Mehta]]"
published: 2026-07-05
created: 2026-10-01
description: "A key feature of the Precision Nutrition and Health approach is the ability to tailor interventions to individual variability using multimodal data from large-scale biobanks and cohorts. Artificial intelligence (AI) and machine learning (ML) models offer new potential to model complex data but remain constrained by challenges related to data quality, interpretability, validation, and causal inference. This Perspective synthesizes current AI/ML methodologies in PN, elucidates their interplay with the distinctive features of multi-omic and nutritional data, such as being compositional, episodic, context-dependent, and error-prone, and delineates nutrition-specific best practices for achieving robust, interpretable, and clinically actionable AI integration in research and practice. In this Perspective, the authors highlight critical challenges, knowledge gaps, and opportunities for robust, equitable, rigorous, reproducible, and actionable artificial intelligence integration in research and practice, and provide a roadmap and checklist for enabling the use of artificial intelligence in precision nutrition."
tags:
  - "clippings"
---
## Abstract

A key feature of the Precision Nutrition and Health approach is the ability to tailor interventions to individual variability using multimodal data from large-scale biobanks and cohorts. Artificial intelligence (AI) and machine learning (ML) models offer new potential to model complex data but remain constrained by challenges related to data quality, interpretability, validation, and causal inference. This Perspective synthesizes current AI/ML methodologies in PN, elucidates their interplay with the distinctive features of multi-omic and nutritional data, such as being compositional, episodic, context-dependent, and error-prone, and delineates nutrition-specific best practices for achieving robust, interpretable, and clinically actionable AI integration in research and practice.

## Introduction

Diet has a profound impact on cognitive, physical, and social well-being. Nutritional deficits contribute to nearly 50 million disability-adjusted life years (DALYs) and account for 26% of all adult deaths worldwide [^1]. A third of all premature deaths in the United States (US) are attributed to nutrition-associated factors, including limited diet diversity and quality, elevated body mass index (BMI), high blood pressure, fasting glucose and sedentary lifestyle [^2] [^3]. Globally, the burden of nutrition-related mortality has escalated over the past decade, outpacing population growth in both low and high-resource settings [^3]. Decades of research investigating the complex interplay between diet, health, and disease [^4] contributed to recognizing nutrition as one of the few truly modifiable risk factors for chronic diseases. Yet, current dietary guidelines [^5] lack individual-level personalization and do not account for potential inter- and intra-person variability in dietary responses [^6] [^7], which can ultimately limit their effectiveness in improving health outcomes.

Precision nutrition (PN) aims to overcome these limitations by tailoring dietary guidance using factors that affect nutrition status, including clinical, biochemical, molecular (metabolomic, genomic, metagenomic), environmental, behavior, lifestyle and physiological data [^8]. The 2020-30 National Institutes of Health (NIH) Strategic Plan positions PN as a unifying and holistic approach for developing comprehensive and dynamic nutritional recommendations to promote health at both the individual and population level [^9]. In alignment with this vision, NIH identified PN as a national priority and launched the Nutrition for Precision Health (NPH) Initiative to provide novel insights and catalyze a shift towards personalized nutrition [^10]. However, implementing PN approaches requires deep phenotyping and the integration of large and complex datasets with multiple data types (or *modalities*), which can be computationally demanding and pose significant analytical challenges [^11] [^12]. One of the most important modalities is dietary data which are inherently compositional and context-dependent, and pose harmonization challenges across methods of collection, reference time frames, time integration, and nutrient food composition databases [^13]. Minor variations in dietary intake analysis can produce different micro and macronutrient calculations and shift observed associations with metabolic pathways. Evidence from controlled feeding studies and large observational cohorts shows that even identical diets can produce different postprandial glycemic and lipid responses across individuals [^7] [^14] [^15]. Gut microbiome composition, a person-specific factor, has been found to be a key driver of individualized dietary responses. For example, in a randomized crossover trial, a microbiome‑based machine learning (ML) model accurately predicted, for each individual, which bread type elicited a lower glycemic response [^6]. Similarly, across independent cohorts, the gut microbiome and other person-specific factors outperformed meal macronutrient content in predicting glycemic responses [^16] [^17] [^18]. These findings suggest that PN is not merely defined by integrating multimodal and high-dimensional data, but by disentangling complex biological associations that require models that respect the structure of diet data and inter-individual heterogeneity.

Artificial intelligence (AI) has opened new avenues for the analysis and interpretation of complex and highly interconnected data. These methods enable the integration of large, heterogeneous datasets from diverse sources, a critical advancement for implementing PN research. The availability of such complex data is rapidly increasing in both the US and globally, through country-level datasets and biobanks like the *All of Us* Research Program and the UK Biobank [^19] [^20]. Data curation and analysis tools are being facilitated by the NIH’s Common Fund Data Ecosystem [^21], the Biodata Catalyst [^22], as well as consortia focused on microbiome and multi-omics [^23]. However, the application of AI methods in nutrition remains in early stages and faces significant technical, methodological, and implementation challenges.

In this *Perspective* paper, we present our approach to integrating PN and AI and propose a foundational framework for best practices in this emerging and evolving field. Unlike prior works, which provide primarily conceptual overviews of opportunities and in applying AI in nutrition research [^24], we aim to define the operational groundwork needed to implement AI in existing biobanks and databases, particularly in real-world interdisciplinary and international settings. This framework is designed as a practical guide to support researchers, practitioners, and data scientists, as well as non-experts entering the field of similar studies in the US and globally, where variability in data, measurement instruments, and analytical pipelines presents significant barriers in applying AI in nutrition research. Specifically, we introduce an integrated framework that combines: (i) the AI-PNUTRI checklist for the design, reporting, and evaluation of AI-enabled PN studies, (ii) explicit mapping of analytical workflows to large-scale biobanks (e.g., *All of Us*, Nutrition for Precision Health, UK Biobank), (iii) cross-layer harmonization across dietary, clinical, behavioral, and multi-omics data, and (iv) incorporation of temporal dynamics and causal inference into a unified analytical pipeline. Accordingly, this manuscript is intended as a synthesis with practical, implementation-focused guidance.

We first provide an overview of current AI methods used in PN, outlining their strengths and limitations, and clarifying key terms and concepts related to AI. We conclude our work by discussing key challenges, proposing best practices for applying AI and ML in nutritional research, and identifying gaps for future work.

### Artificial Intelligence methods in precision nutrition: current practices, strengths, and limitations

#### Machine learning methods

Traditional ML methods encompass a broad range of algorithms, from linear models to tree-based ensembles, that have been foundational in nutritional sciences due to their statistical rigor, interpretability, and robustness with smaller or structured datasets. These approaches are grounded in well-established statistical principles, making them accessible and trustworthy for domain experts. For instance, regression models can integrate heterogenous data, including genomics, demographic factors, gut microbiome, and digital engagement data to predict health outcomes with high accuracy [^16] [^25] [^26] [^27]. A key strength of traditional ML methods is their ability to handle high-dimensional data common in PN research, such as genomics, metabolomics, and microbiome profiles, particularly when the number of predictors far exceeds the available sample size [^28] [^29]. Regularization methods, such as least absolute shrinkage and selection operator (LASSO), ridge regression, and the elastic net, can prevent overfitting (this occurs when the model is trained to very tightly fit the training data, demonstrating exceptionally high accuracy for this dataset), and improve coefficient stability by applying penalties during model training [^30] [^31] [^32]. These methods enhance interpretability by shrinking less informative coefficients toward zero, setting some coefficients exactly to zero in the case of LASSO and elastic net. Therefore, they facilitate the identification of key dietary, microbial, or metabolic features associated with health outcomes. Despite these advantages, traditional ML methods often rely on assumptions, such as linearity, independence of predictors, or specific data distributions. Such assumptions may be violated in dietary data, which are inherently compositional, episodic, and context-dependent, potentially leading to biased or oversimplified associations. While optimized implementations in standard libraries [^33] enable efficient computation with modest resource requirements, careful hyperparameter tuning (e.g., selection of penalty strength via cross-validation) is essential. Moreover, these models may underperform in settings characterized by complex, highly non-linear interactions, and built-in measures of feature importance may be less nuanced than post hoc explainability approaches.

Tree-based ML methods, including decision trees, random forests (RF), and gradient boosting algorithms are powerful tools for handling complex, non-linear relationships among dietary factors, microbiome features, and health outcomes [^34] [^35] [^36]. Decision trees provide intuitive partitioning of the predictor space, such as identifying dietary thresholds [^37], but they are susceptible to overfitting. RF improves stability [^38] and has been applied to the estimation of micronutrient deficiencies from dietary survey data [^39].

Related work in computational nutritional epidemiology has shown that ML can also infer the degree of food processing directly from nutrient composition data. For example, the FoodProX/FPro framework predicts processing level for foods and showed that greater reliance on more highly processed foods is associated with higher risk of metabolic syndrome, diabetes, angina, elevated blood pressure, and biological age, as well as reduced vitamin bioavailability [^40]. This example illustrates how traditional ML can generate interpretable dietary features that extend beyond nutrient totals and can be incorporated into PN analyses.

Gradient boosted trees (e.g., XGBoost) sequentially minimize prediction error and frequently achieve superior predictive performance [^41] [^42], exemplified by their use in forecasting postprandial glucose responses from integrated dietary and microbiome profiles [^43] [^44]. For instance, large cohort studies showed that gradient‑boosted trees integrating gut microbiome taxonomic-functional features alongside diet and clinical factors accurately (r = 0.77) predict postprandial glycemic response [^16]. Similarly, microbial gene richness, short-chain fatty acid-producing taxa, and functional profiles have been used as model inputs to predict responses to dietary fiber and cardiometabolic risk modulation. Such approaches typically encode microbiome data as relative abundances, diversity indices, or learned embeddings, which are then integrated with dietary and clinical features in ML pipelines [^7] [^45] [^46] [^47]. These examples illustrate how microbiome-related features can enhance model performance and biological interpretability, while also providing a mechanistic link between diet and host response. However, up-to-date evidence supporting substantial predictive gains from multi‑omics integration in personalized nutrition remains limited, with available studies indicating modest and context‑dependent improvements (Supplementary Table [1](https://www.nature.com/articles/s41467-026-75004-w#MOESM1)).

Across these approaches, the ability to derive a feature-importance ranking is a key advantage of PN. However, ensemble methods are less interpretable than individual trees, necessitating post hoc tools, such as partial dependence plots or SHapley Additive exPlanations (SHAP), which explain model predictions by assigning importance scores to input features [^48]. It is noteworthy that even though the inclusion of gut microbiome features can increase ML model predictive performance, it does not establish causality or whether such features are mechanistic mediators of response. Hence, causal inference frameworks should complement predictive models by testing whether candidate microbial taxa, functions, or metabolites lie on pathways through which diet influences host phenotypes. Complementary in vitro, animal, and human experiments may in many cases be required to establish causal relationships.

Ensemble learning more broadly combines complementary models (e.g., RF with boosting or stacking approaches) to enhance prediction accuracy, robustness, and generalizability, particularly in multimodal PN settings integrating microbiome, metabolomics, and clinical data [^49]. While most nutrition applications rely on standard implementations with limited customization, domain-informed feature engineering remains critical for performance and interpretability.

Supervised learning methods, described above, rely on labeled data to train models that map inputs to known outcomes, allowing straightforward evaluation through predictive accuracy. In contrast, unsupervised learning analyzes unlabeled data to uncover latent structures. Clustering algorithms are foundational for analyzing high-dimensional nutrition datasets including microbiome and metabolomic data and can themselves be learned through algorithmic techniques [^50] [^51] [^52] [^53]. More advanced nonlinear dimensionality reduction techniques, such as t-distributed stochastic neighbor embedding [^54] and Uniform Manifold Approximation and Projection (UMAP) [^55], enable nonlinear visualization of complex metabolomic or microbiome structures beyond traditional ordination.

#### Deep learning (DL) methods

DL models, built on multi-layered neural networks, have emerged for their ability to automatically learn hierarchical representations from raw, heterogeneous data, making them well-suited to the multimodal complexity of PN. The core advantage of DL is end-to-end learning, in which features are extracted directly from inputs without manual engineering. Convolutional neural networks (CNNs) excel at image-based food recognition, recurrent neural networks (RNNs/long short-term memory (LSTMs)) at temporal data, such as wearables, and transformers at integrating diverse modalities. Pre-trained models trained on large images datasets or text corpora can be transferred to nutrition tasks. DL excels at capturing complex non-linear interactions but typically requires large, labeled datasets, substantial computational resources, and careful regularization to avoid overfitting [^56]. Moreover, the opaque nature of DL models limits mechanistic interpretability, which remains a key concern in clinical and nutritional contexts, although explainable AI methods can partially mitigate this limitation [^57].

Common extensions include transfer learning through fine-tuning of pre-trained networks and multimodal fusion, in which information is concatenated or attended across inputs (e.g., diet images and clinical text). Architectural choices are driven by data structure, including CNNs for vision and graph neural networks (GNNs) for microbe-metabolite interactions. In fact, recent studies have demonstrated the utility of GNNs in microbial phenotype prediction [^58], metabolomic pathway inference [^59], and joint microbe-metabolite association learning [^59] [^60]. By representing taxa and metabolites as nodes connected by functional or biochemical relationships, these models can capture non-linear dependencies and contextual relationships more effectively than classical models, particularly in sparse or compositional datasets, such as the microbiome. In addition, neural models, such as MiMeNet, learn mappings from microbial taxa to metabolite profiles, helping uncover functional pathways that mediate diet-microbiome-host interactions [^61]. Furthermore, DL methods have recently begun to be used to integrate multi-omics data with host-associated data, such as diet, thereby improving the predictions of individualized metabolic responses. For example, a DL approach based on coupled multilayer perceptrons (McMLP) was developed to predict metabolite responses to dietary interventions using baseline gut microbiome composition, metabolomic profiles, and dietary inputs, outperforming ML models [^62].

In practice, DL training relies on frameworks, such as PyTorch or TensorFlow, and often requires Graphics Processing Unit (GPU) acceleration. While DL offers superior handling of heterogeneity and non-linearity in PN (e.g., predicting responses from multi-omics data), full model training is resource-intensive, and the risk of overfitting increases with limited sample sizes. The black-box nature of DL can limit trust, though explainable AI approaches, such as Grad-CAM, provide partial insight and bias introduced during pre-training may propagate. Additional limitations include hallucinations in generative variants, interpretability gaps, and data leakage in transfer learning when domain shifts are not adequately addressed. In nutrition research, DL has enabled advances in food image-based nutrient estimation, glycemic response forecasting from CGM and wearable data, and multi-omics integration for PN. Most applications rely on off-the-shelf models, while retrieval-based grounding from nutrient databases is emerging but remains underutilized.

#### Large language models (LLMs)

LLMs represent a new class of AI models capable of synthesizing information across modalities. The main advantage of pre-trained LLMs is that they are trained on massive amounts of data, allowing them to operate generically across a wide range of domains. Conversely, this generality limits their ability to address niche or highly specialized domains, such as PN. This limitation can be mitigated through several extension mechanisms. One of the most straightforward approaches is retrieval-augmented generation (RAG) [^63], in which additional contextual information is provided to supplement knowledge that may be absent from the model’s training data. Another extension involves the use of tools, enabling LLMs to directly access structured or computed data [^64]. Finally, prompt context can be expanded with a small number of domain- or problem-specific examples, a technique known as few-shot prompting [^65], which the LLM can follow to produce its response to the given query. The aforementioned techniques are collectively known as “ *prompt engineering* “ [^66]. An alternative method to improve the LLM performance for a given domain is called “ *fine-tuning* “ [^67], whereby a pre-trained model can be further trained on domain-specific data. Fine-tuning allows new knowledge to be internalized, reducing reliance on complex prompting and enabling improved domain reasoning, without retraining the entire model. However, it remains a training process that requires substantial computational resources and time. Moreover, fine-tuning can reduce a model’s general applicability, while its domain-specific performance becomes dependent on the quality and scope of the additional data, potentially introducing bias. As a result, fine-tuned models often become application-specific, shifting the long-term maintenance burden from the pre-trained model provider to the entity performing fine-tuning.

LLMs generally suffer from three important limitations: hallucinations [^68], data leakage [^69], and bias [^70]. Hallucinations occur when models generate false or misleading information presented as facts, often due to insufficient or inappropriate data, limitations in capturing language characteristics, or internal modeling behavior. Data leakage arises when generated responses inadvertently reproduce elements of the training data, analogous to overfitting in traditional ML, with serious implications for evaluation and validation. The third limitation, bias, while not unique to LLMs, is amplified by reliance on large-scale public data sources, necessitating careful consideration during both training and deployment to avoid ethical and scientific pitfalls.

In nutrition, LLMs have been used to enhance data-driven decision-making and support dietary recommendations. They have also been used for personalized [^71] food recommendations and for constructing diets for special cases, including type 2 diabetes [^72] [^73] and kidney disease [^74]. However, most of the LLM applications in nutrition rely on out-of-the-box implementations without domain-specific adaptation or additional functional extensions [^75]. This limitation can be addressed through approaches, such as RAG and additional functional extensions that enhance LLM performance. For example, in a PN application, RAG-enhanced LLM recommended food substitutions to increase the consumption of foods rich in live microbes [^64]. Microbiome-aware retrieval pipelines remain underutilized, but could be further extended to enable the use of microbiome data in PN. Future LLM applications with RAG can combine dietary intake data with microbiome composition and metabolomic profiles to generate personalized dietary recommendations, such as identifying specific food substitutions to modulate microbial pathways linked to metabolic health. Although RAG has been proposed as a mechanism to ground LLM outputs in domain-relevant knowledge, it remains underutilized in PN (Table [1](https://www.nature.com/articles/s41467-026-75004-w#Tab1)). Recently, LLMs have been used in microbiome association mining, taking advantage of their powerful abilities in automated extraction and integration of large-scale textual data. By fine-tuning and deploying pretrained LLMs, such as ChatGPT, these studies investigated the microbiome-diet or microbiome-disease associations following a three-step process involving recognizing key biomedical elements from text (e.g., diet factors, microbes, metabolites), interpreting how these elements are connected (e.g., whether a microbe has a beneficial, harmful, or neutral effect on a specific outcome) and compiling the identified associations into structured resources allowing for further analysis [^76] [^77].

**Table 1 Comparison of large language models' adaptation strategies for precision nutrition**

Table [2](https://www.nature.com/articles/s41467-026-75004-w#Tab2) and Fig. [1](https://www.nature.com/articles/s41467-026-75004-w#Fig1) provide a comparison of ML, DL, and LLM methods in nutritional data analysis. Briefly, traditional ML methods are often more computationally efficient and include interpretable algorithms, such as decision trees, but rely on assumptions about data structure and benefit from domain-informed feature design. DL models provide greater flexibility for modeling complex relationships but suffer from limited transparency, although explainable AI methods can partially address this limitation [^78]. LLM applications in nutritional research are still new, lacking standardization and reproducibility, while they require extensive computational power. In addition, LLM model decision-making and reasoning transparency need to be increased, although efforts have been made in this direction [^79]. It is also noteworthy that the successful application of these AI methods depends not only on the algorithms used for data analysis but also on the availability of high-quality, multimodal, and multi-omic datasets. Table [3](https://www.nature.com/articles/s41467-026-75004-w#Tab3) summarizes selected biobanks and nutrition-focused datasets that offer structured dietary intake data, biomarker profiles, and multi-omics layers suitable for AI applications.

![Fig. 1: The intersection between artificial intelligence, machine learning and data science with their challenges and applications in nutritional sciences.](https://media.springernature.com/lw685/springer-static/image/art%3A10.1038%2Fs41467-026-75004-w/MediaObjects/41467_2026_75004_Fig1_HTML.png?as=webp)

Fig. 1: The intersection between artificial intelligence, machine learning and data science with their challenges and applications in nutritional sciences.

**Table 2 Functional comparison of machine learning, deep learning, and large language models in nutritional data analysis**

**Table 3 Selected biobanks and datasets and associated nutrition data collected for potential use of machine learning and artificial intelligence**

The figure illustrates how large language models (LLMs), machine learning (ML), and deep learning (DL) fit within a broader data science framework. LLMs support tasks such as text generation and food analysis but require large datasets and high computational power. ML methods (e.g., regression, random forests, clustering) can be used for disease prediction and dietary pattern analysis. DL approaches (e.g., CNNs, GNNs, RNNs) can enable applications such as image-based food recognition and personalized nutrition, but face challenges such as overfitting, complex validation, and limited interpretability.

### Challenges and methodological considerations for AI-enabled precision nutrition

AI applications in precision nutrition (PN) face interconnected challenges from nutritional data’s unique properties, i.e., episodic, compositional, culturally/sociodemographically shaped, prone to measurement error and recall bias, and the demands of multimodal integration (dietary intake, biomarkers, multi-omics, wearables, behavioral records) [^80] [^81] [^82] [^83] [^84] [^85]. These challenges are not merely technical but also methodological, requiring careful adaptation of generic AI practices to the specific context of diet, biology, behavior, and environment.

#### Data complexity & harmonization

Multimodal datasets in PN combine diverse data types, such as dietary intake, clinical biomarkers, multi-omics, wearable sensor streams, and behavioral records, each with distinct formats, scales, distributions, and sources of technical variation. The biobanks and other data repositories listed in Table [3](https://www.nature.com/articles/s41467-026-75004-w#Tab3) exemplify this diversity [^86]. The primary difficulty arises from inherent incompatibilities across data layers. Wearable devices, such as smart watches and continuous glucose monitors (CGMs), are high-frequency time series with irregular sampling. Dietary intake data are typically episodic, compositional, and often collected using heterogeneous instruments, such as dietary recalls, food frequency questionnaires, diet records, and app-based tools. Each tool can introduce different types of error, including recall bias and temporal resolution. In addition, studies may use different food composition databases, nutrient calculation software, and food annotation systems, which can produce substantial differences in the estimated diet intake even when similar foods are reported [^87] [^88] [^89]. Metagenomic datasets may include many low-coverage taxa that can introduce substantial noise [^90], and microbiome studies are often not directly comparable because of variation in sample collection, DNA extraction, sequencing platforms, taxonomic or functional annotation pipelines, and the mixed use of relative versus absolute abundance, which have markedly different statistical considerations [^91]. In intervention studies, heterogeneity in adherence or compliance measurement approaches, such as adherence scores, biomarker-based assessment, app-derived logging frequency, or device-based monitoring, can further complicate cross-study harmonization [^92] [^93] [^94] [^95]. These differences violate assumptions of uniformity in standard AI pipelines. As a result, successful AI implementation in PN requires not only multimodal integration but also harmonization of measurement pipelines, annotation systems, and adherence metrics across cohorts and platforms. A key limitation of existing resources like the *All of Us* Research Program is the need for data harmonization, particularly for biomarkers critical to precision nutrition. While the program applies the Observational Medical Outcomes Partnership (OMOP) Common Data Model Version 5 infrastructure for standardization [^96], clinical measurements from electronic health records (EHRs) often vary in units, such as percentages vs. mmol/mol for hemoglobin A1c or differing assay standards for vitamins and inflammation markers, and sparse PN-relevant biomarkers, such as omega fatty acids, micronutrients, interleukin‑6, not routinely collected outside sub-studies.

#### Mitigation strategies

Harmonization begins with standardized reference systems: unified nutrient composition databases, unified taxonomic frameworks (e.g., Genome Taxonomy Database \[GTDB\]), and controlled vocabularies (e.g., Systematized Nomenclature of Medicine Clinical Terms, branded as SNOMED-CT). In nutrition-focused metagenomic analysis, where diet-microbiome associations are often population-specific, using a singular phylogenetic reference tree, such as Systematic Information on Lineage, Variation, and Abundance [^97] [^98], or the GTDB [^99] enables consistency with taxon assignments, improving comparability between cohorts. For temporal or event-driven datasets, such as disease onset or snapshots of dietary change, anchoring data modalities to defined time points or biological events is recommended. These anchors enable mapping multiomic and phenotypic layers through strategies like interpolation, time-window binding or statistical imputation, especially in longitudinal studies with varying amounts of spacing or irregular sampling intervals. Considering diet, using common reference nutrient composition databases and consistent software versions to collect or analyze diet data can reduce variation. For wearables, accounting for the time zone used to timestamp the data is critical. Biological context is also crucial. For example, transcriptomic or epigenomic variables may differ depending on tissue type, developmental stage, or sampling method. It is recommended to use hierarchical features, such as tissue-of-origin annotations or conduct metadata-aware normalization to improve data integration and comparability [^100] [^101]. In addition, batch effects arising from differences in sample processing times, sequencing batches, or data generation technologies should also be addressed through statistical tools, such as ComBat, RUV (remove unwanted variation), or Bayesian normalization models.

Emerging AI methods further support data harmonization and integration. Transformer-based models [^102] [^103] [^104] [^105] [^106] [^107] [^108] [^109] [^110] [^111] [^112] and GNN [^58] [^59] [^60] [^61] [^113] [^114] have emerged as extremely powerful tools for unifying multi-modal and high-dimensional data, structured and unstructured data and can model complex biological relationships, significantly improving disease classification. Both approaches reduce manual feature engineering but demand large datasets and computational resources. Overfitting cohort-specific artifacts remains a risk, and interpretability can suffer without targeted explainability layers. Domain-adapted implementations are increasing but still underutilized in PN studies. A detailed description of the AI models that can be used for data integration and harmonization with their application domains and key features is provided in Table [4](https://www.nature.com/articles/s41467-026-75004-w#Tab4).

**Table 4 AI models supporting multimodal data integration and harmonization**

#### Data cleaning & completeness

Nutritional datasets frequently exhibit structured missingness and outliers that carry biological meaning rather than random error. In nutritional research, data cleaning and completeness are complex because dietary data are episodic and prone to recall bias [^115] with missingness not necessarily random. For example, missing or outlier values may reflect true non-consumption of a food item, underreporting due to imperfect memory, or technical issues. The interpretation of outlier and null values can vary substantially depending on the specific data layer [^86] and may warrant further investigation [^116]. A critical aspect of data completeness in biobanks is linking samples to subjects across different data layers, including diet, microbiome, and biomarker profiles. This process assumes that the sample identifiers within bespoke containers are compatible, but this is not always the case (e.g., Quantitative Insights Into Microbial Ecology 2 (QIIME 2) [^117] metadata sample IDs have specific character restrictions). Another more well-known example of data missingness is that several biobanks, such *All of Us*, show persistent gaps in specialized biomarkers due to cost and non-routine collection, though engagement tools, such as reminders and incentives, help retention.

#### Mitigation strategies

Researchers should use domain-specific outlier detection, such as visualization, Grubbs’ test, or anomaly‑detection models [^116]. In nutritional research, predefined biological thresholds are used for flagging biologically implausible values, including reference standards from the World Health Organization (WHO) for anthropometry [^118] and criteria from the National Cancer Institute (NCI) for identifying implausible dietary intake reports [^119]. To address the challenges of cross-layer sample linking, standardization of common identifiers emerges as a critical requirement before data integration can proceed. This standardization process must account for the specific constraints of each data format, including dietary assessment instruments, while maintaining the ability to uniquely identify and link samples across all relevant data. Imputation has been proposed as another method to mitigate any missing data that is not addressed by the previous approaches [^120] [^121] [^122]. More recently, imputation is also achieved using ML methods, which capture complex dependencies but risk introducing synthetic patterns. Cross-layer identifier standardization (e.g., compatible sample IDs across diet, microbiome, and clinical modules) is essential before integration. Advanced imputation remains underutilized despite its availability in standard toolkits.

#### Model interpretability

In PN, model outputs must translate into actionable, understandable dietary recommendations that account for substitution effects and individual preferences. The main limitation of many powerful AI models is their opaque decision-making, which erodes trust among clinicians, nutritionists, and individuals receiving personalized guidance. For example, in the *All of Us* Research Program, where recommendations may be generated across diverse health profiles, the lack of interpretability can hinder clinical translation. Unlike many biomedical applications, dietary recommendations often involve substitution effects and trade-offs between foods or nutrients, which are not immediately evident from abstract model outputs.

#### Mitigation strategies

One established approach is post-hoc explanation via model-agnostic tools. Another is intrinsic interpretability through constrained architecture. Finally, hybrid approaches combine black-box predictors with interpretable surrogates. Clear visualization methods, decision rule extraction or more targeted and formal methods like LIME (Local Interpretable Model-agnostic Explanations) [^123] or SHAP [^48] can improve the interpretability of models. LIME attempts to provide explainability on given predictions of a black-box model by locally approximating the prediction through a simpler, more interpretable model (e.g., linear regression or a decision tree). SHAP uses Shapley values from cooperative game theory to estimate the contribution of each feature to an individual model prediction [^48]. While both methods are model-agnostic, SHAP can provide both local and global explanations, which results in more consistent and non-ad hoc results.

#### Model validation & generalizability

PN models must perform reliably across diverse populations, cultural dietary patterns, and life stages, yet training data are often skewed toward well-resourced cohorts. Nutritional datasets vary widely in size, quality, and representativeness, and dietary intake data are shaped by geographic, cultural, and socioeconomic factors that are often underrepresented in training cohorts. As a result, standard validation techniques, such as random splitting, may be less reliable when applied to heterogeneous populations. Furthermore, the dynamic nature of nutritional data, i.e., spanning short-term dietary intake to long-term health outcomes, requires validation methods that account for temporal variability. The lack of standardized benchmarking datasets in nutrition science impedes robust external validity, making it difficult to assess model performance across cohorts and clinical settings. Inherently within validation and generalizability lies the risk of overfitting. For example, the *All of Us* Research Program includes participants from diverse racial, socioeconomic, and geographic backgrounds. Models trained on a subset of this cohort may perform well internally yet fail when applied to underrepresented groups with different dietary patterns, disease burdens, or access to care.

#### Mitigation strategies

In nutritional sciences, ML models have historically relied on techniques, such as train/test splits and k-fold cross-validation, to estimate performance and reduce overfitting. These approaches remain useful, particularly when datasets are limited, because they make efficient use of available data and provide repeated performance estimates. However, researchers increasingly recognize the value of benchmarking models on external datasets. This is particularly relevant in nutritional science, where population-level dietary differences may alter model performance. Validating results on different demographic groups or geographical regions ensures that findings are robust and clinically relevant. In addition to synthetic benchmarks or public datasets, evaluating model performance on real-world nutritional data, collected in varying conditions and populations, enhances the ecological validity of findings.

For example, leave-cohort-out validation can test whether a model trained in one or more cohorts generalizes to a different study population; site-stratified validation can assess robustness across recruitment centers or countries; and temporal validation can evaluate whether models remain stable when applied to later time periods or future follow-ups. In addition, model evaluation should include subgroup-specific performance and calibration reporting, including by ancestry, sex, age, life stage, or culturally distinct dietary patterns, to identify whether performance degrades in underrepresented or clinically relevant strata. Where diet is measured using multiple instruments, sensitivity analyses by dietary assessment method (e.g., FFQ, 24-hour recall, food diary, app-based logging) can help determine whether model performance is robust to differences in exposure measurement.

The gold standard for validation is prospective validation, such as whether an AI-guided intervention improved biomarkers or behavior in a clinical trial. Moreover, successful uptake depends on trust and adherence, as theoretical nutritional recommendations may not be followed if they are impractical or inconsistent with cultural contexts or individual preferences. AI models should therefore incorporate behavioral and contextual modeling to personalize interventions beyond the level of genotypic (Single Nucleotide Polymorphism, or SNP, genotypes of genes of interest), microbial (gut microbial signatures and metabolic pathways), or phenotypic (lab measurements) analyses.

To reduce overfitting, hyperparameter tuning should be conducted systematically and ideally within a nested validation framework, so that model selection and performance estimation are separated. Hyperparameters control the behavior of the model or its learning algorithm and are distinct from parameters learned directly from the data. Common tuning approaches include random search and grid search. The former evaluates randomly sampled hyperparameter combinations, whereas the latter tests predefined combinations and may be preferable when prior knowledge exists about plausible parameter ranges.

Model development, tuning, and validation should be reported transparently and reproducibly, alongside validation results across cohorts, sites, time points, and subgroups. Robust validation depends on reproducibility, enabling model performance to be replicated, compared, or extended across studies and settings. At minimum, studies should report software and package versions, database and reference-table versions, feature definitions, data-split construction, random seeds where applicable, preprocessing and harmonization procedures, model-selection criteria, and the hyperparameter search space and tuning strategy [^124]. Where individual-level data cannot be shared, the availability of code, scripts, or structured pseudo-code remains essential. Standardized reporting of performance metrics, including accuracy, precision, recall, F1-score, calibration, and Area Under the Receiver Operating Characteristic (ROC) Curve, further improves comparability across studies [^125].

#### Temporal dynamics & causality

Nutritional effects on health unfold over months or years, driven by complex, dynamic interactions among host genetics, disease history, gut microbial composition, dietary habits, and environmental/cultural factors. Predictive ML models can identify patterns in complex data, but prediction does not establish causality. In PN, this distinction is important because predictive features can reflect confounding, reverse causation, or temporal co-occurrence [^126] [^127]. For example, associating specific microbial taxa with health outcomes without accounting for temporal changes or dietary triggers risks of misinterpretation. Additionally, the interplay of dysbiotic versus healthy microbial states and their evolution over time complicates predictive modeling. Establishing whether a dietary intervention directly improves microbiome diversity or immune response requires advanced frameworks beyond standard ML approaches that do not by themselves establish which features are causal drivers of response, or whether they reflect confounding and reverse causation [^128]. In the context of diet-microbiome-host interactions, ML models can be used as part of a pipeline where they filter the most important features and generate hypotheses which are subsequently evaluated using causal analytical frameworks, such as counterfactual approaches and Mendelian randomization [^129].

#### Mitigation strategies

Temporal modeling and causality are central challenges in PN, as dietary effects unfold over time, and correlations alone are insufficient for actionable guidance. Sequence modeling using RNNs, LSTMs, continuous-time recurrent models, dynamic Bayesian networks, and temporal transformers with explicit time encodings has been applied to forecast nutritional status and model disease progression in response to dietary interventions, including diet recommendations for cancer patients’ status [^130] [^131]. Similarly, time-series alignment methods, such as dynamic time warping (DTW), have been proposed to preserve temporal relationships across repeated dietary or behavioral measurements and to identify longitudinal dietary patterns in unsupervised settings [^132] [^133] [^134]. However, these approaches should primarily be interpreted as predictive or descriptive unless they are embedded in an explicit causal framework.

For causal questions, additional assumptions must be justified. In PN, causal inference frameworks, such as counterfactual analysis and Mendelian randomization, can help distinguish potentially actionable drivers from associations that reflect confounding, reverse causation, or temporal co-occurrence [^135]. However, these methods are informative only under specific conditions: observational counterfactual analyses require exchangeability (e.g., no unmeasured confounding conditional on measured covariates) and positivity/overlap, whereas Mendelian randomization depends on the use of valid instruments [^136] [^137]. Hybrid approaches, combining transformers with time encodings and causal graphs, offer promise for modeling complex, multi-layered interactions in precision nutrition, ensuring recommendations are both dynamic and causally grounded. Longitudinal models can be used for causal interpretation by establishing temporal precedence, but temporal ordering alone does not guarantee causality [^138]. Likewise, subgroup-specific dietary recommendations are only well supported when sufficient overlap exists in the relevant strata. In PN, causal inference should therefore be used not as a substitute for prediction, but as a complementary framework to evaluate whether dietary, microbial, or metabolic features are plausible drivers of response rather than correlated markers [^126].

### Future perspectives

As PN evolves, the next challenge is moving from static, individual-level predictions towards dynamic models that integrate repeated, real-time measurements from a wide range of biological, clinical, behavioral and lifestyle data to simulate responses to nutrition. In this section, we focus on digital twins (DT) and agentic, system‑based AI as they bridge this gap and offer new methodological opportunities to design and test interventions targeting not only the person as an isolated entity but also the interconnected environments that shape risk to nutritional outcomes.

#### Digital twins in precision nutrition

DT in nutrition is an individual-level virtual representation of biological or physical systems created by repeated, real-time dietary, biological, clinical, multiomic, environmental and contextual data [^139]. Within a unified modeling framework, the real entity (e.g., an individual) is modeled as a collection of historical and real-time data [^140] (Fig. [2](https://www.nature.com/articles/s41467-026-75004-w#Fig2)). Future DT could incorporate richer AI-derived dietary representations beyond nutrient intake and food groups, including learned features, such as food-processing scores [^40], that could improve their ability to simulate real-world food exposures more efficiently. These multimodal data are preprocessed and aligned through timestamp normalization and event anchoring. Advanced ML/AI models simulate an individual's behavior under specific dietary scenarios. Technological advances in wearables and smart devices have increased the availability of real-time data streams, and Internet of Things (IoT) infrastructures facilitate data flow across devices, reducing computational burden and improving scalability. In nutrition research, DTs are particularly valuable for simulating interventions that would be prohibitively expensive, invasive, or time-consuming in real-world settings, as well as for developing mechanistic twins (e.g., gut-focused models) and assessing feasibility in pilot studies. Limitations in the accuracy of dietary measurements and in causal inference currently prevent fully autonomous DTs; existing models should therefore be viewed as analytical extensions for multimodal integration and intervention simulation.

![Fig. 2: Pipeline for including digital twin models in precision nutrition applications.](https://media.springernature.com/lw685/springer-static/image/art%3A10.1038%2Fs41467-026-75004-w/MediaObjects/41467_2026_75004_Fig2_HTML.png?as=webp)

Fig. 2: Pipeline for including digital twin models in precision nutrition applications.

#### Agentic and system-based AI in precision nutrition

While DTs capture individual-level data, it is important to consider this data within the broader contexts of family- and school-based nutrition programs, workplaces, communities, and policy programs. Therefore, system-based interventions can support the evaluation of how precision or individualized nutrition programs are shaped by larger systems. Agent-based modeling and agentic AI can be conceptualized as a network of interacting models that represent different elements of these systems and have been used in understanding factors that shape nutrition behavior [^141] [^142]. Applied within the DT framework, each AI agent can capture the behavior of a digital twin, and the network can represent the system within which an intervention will be designed. This will allow the users to create autonomous simulations, i.e., ones that can design and execute themselves, with less effort and in a more structured way. For example, a probing agent could interact with a patient’s DT to identify barriers to dietary adherence, such as irregular work schedules, financial constraints, or family preferences. A second tactical agent could then retrieve evidence-based dietary strategies tailored to those barriers, such as lower-cost meal substitutions, culturally appropriate alternatives, or simplified meal-planning recommendations. Additional agents could simulate family-, school-, or community-level influences on adherence, allowing the DT system to evaluate whether the intervention is realistic within the patient’s broader social and environmental context.

### Concluding remarks

Nutrition research is increasingly adopting advanced computational methods to address the growing complexity of dietary and health data. Yet AI applications in PN remain limited and often insufficiently adapted to the unique characteristics of the data. This work provides a comprehensive synthesis of modern analytical methodologies, including AI, ML, DL, and LLMs, that can be applied to PN and delineate where standard practices must be adapted to diet, biology, behavior, and environment. Rather than presenting AI as a set of generic and domain agnostic tools, we present a nutrition-centered conceptual framework for AI-enabled PN capturing the entire from data preprocessing and multimodal harmonization through model development, validation, temporal and causal analysis, and responsible deployment using large‑scale cohorts, such as *All of Us*, NPH, and UK Biobank as exemplars (Fig. [3](https://www.nature.com/articles/s41467-026-75004-w#Fig3)). This framework is accompanied by the AI-PNUTRI checklist intended to provide actionable guidance to support adoption and implementation and to complement existing reporting standards (Table [5](https://www.nature.com/articles/s41467-026-75004-w#Tab5)). As STROBE-nut extends the STROBE checklist and PRISMA-trAIce extends the PRISMA 2020 checklist to address the complexity of dietary assessment and nutrition exposures [^143] [^144] [^145] [^146], AI-PNUTRI is designed as a domain-specific checklist focusing on challenges specific to AI in PN, including multimodal data harmonization, explainability, biological interpretability, and implementation readiness. This could then be integrated with other checklists based on the parent study design.

![Fig. 3: Proposed operational framework (PN-AI@AoU-NPH/UKBiobank) for implementing AI in precision nutrition using All of Us, Nutrition for Precision Health data, and the UK Biobank.](https://media.springernature.com/lw685/springer-static/image/art%3A10.1038%2Fs41467-026-75004-w/MediaObjects/41467_2026_75004_Fig3_HTML.png?as=webp)

Fig. 3: Proposed operational framework (PN-AI@AoU-NPH/UKBiobank) for implementing AI in precision nutrition using All of Us, Nutrition for Precision Health data, and the UK Biobank.

**Table 5 AI-Precision Nutrition Checklist (AI-PNUTRI) for AI-enabled precision nutrition studies**

Our work has three main conclusions: first, no single model or AI method is currently optimal for PN. Certain ML methods remain valuable for interpretability and inference in small or moderately sized datasets, while DL and LLM are powerful for multimodal integration. Therefore, model selection must be driven by both the research question and the properties of the available data. Second, data preprocessing and study design are decisive. Standardization of units and variable definitions, explicit time anchoring, prospective documentation of measurement protocols, and harmonization across biobanks are prerequisites for valid modeling and credible generalization. Without this foundation, even state‑of‑the‑art models will misinterpret nutritional signals or overfit idiosyncrasies of a single cohort. Third, AI-enabled PN depends less on algorithmic novelty than on rigorous study design, data preprocessing, external validation across diverse populations and settings, and alignment with human biology and behavioral principles. Approaches that integrate biological, behavioral, and contextual information are most likely to yield actionable and clinically relevant insights.

### Implications for infrastructure and consortia

To advance AI-enabled PN, new consortia initiatives led by nutritionists are essential to collect comprehensive, harmonized datasets, including micronutrients, inflammation biomarkers, genotypic variants (SNPs), and gut microbial profiles, from large, truly representative cohorts. Building on the strengths of existing resources, such as the *All of Us* Research Program and the NPH study, future progress will depend on addressing these gaps while leveraging planned infrastructure enhancements. PN research will require robust, dedicated computational infrastructure capable of handling concurrent, intensive tasks by multiple users. This includes genotypic analysis of at least 20 SNPs and phenotypic analysis of at least 20 biomarkers across diverse, high-dimensional, multi-omics microbial datasets. Expanded high-end GPU capacity would enable efficient parallel processing, reduce queue times, and support simultaneous workloads without current limitations. In line with these needs, the *All of Us* Researcher Workbench is in the process of migration to an updated Researcher Workbench 2.0 (powered by Verily, with beta access in early 2026 and full features in Q2 2026) [^147] [^148], including NVIDIA GPU integrations, such as Blackwell and Hopper for accelerated AI workflows. In addition to NVIDIA‑based systems, emerging AMD‑based GPU platforms, such as COSMOS, offer a promising alternative that could further reduce current infrastructure constraints.

### From principles to practice

From principles to practice, Table [6](https://www.nature.com/articles/s41467-026-75004-w#Tab6) translates methodological best practices into actionable steps for AI‑enabled precision nutrition. Researchers should collect harmonized, timestamped, event‑anchored data with repeated measures and contextual variables, power studies for subgroups, and prospectively document protocols to enable causal inference and equitable performance. In analysis, they should characterize missingness/outliers, apply appropriate imputation/normalization, reduce feature redundancy, and benchmark multiple models with transparent tuning. Credible evaluation requires independent validation, sensitivity checks for confounding and temporal validity, and explainability (e.g., SHAP/LIME) with calibrated metrics and uncertainty reporting. Sponsors and funders should prioritize representative, longitudinal, multimodal datasets, provide access to independent cohorts, invest in scalable computers, foster standardized benchmarks, and mandate transparent, reproducible practices tied to clinically actionable, biologically grounded outcomes.

**Table 6 Key considerations for AI-enabled precision nutrition research**

## References

## Acknowledgements

We would like to thank Kalen Cantrell for his contributions to this work.

## Funding

The work reported in here was partly supported by the National Institutes of Health \[Eunice Kennedy Shriver National Institute of Child Health and Human Development (NICHD\] grants 3U24HD107676 (M.G., S.M., S.L.H.), 5T32HD087137 (J.L.F.), 5T32HD113301 (S.M., J.L.F., D.E., M.T.W.), and 5U24DK131617 (R.K.); Office of the Director and the Office of Nutrition Research; National Institute of General Medical Sciences (NIGMS), grants T32GM139790 (J.K.), T32GM007198 (L.P.); National Institute on Aging (NIA) grant F30AG094275 (L.P.); and Canadian Institutes of Health Research (CIHR) Fellowship (P.M.). The content is solely the responsibility of the authors and does not necessarily represent the official views of the NICHD, the NIGMS, the NIA, or the Department of Health and Human Services of the United States.

## Ethics declarations

### Competing interests

The Authors declare the following competing interests. R. K. is a scientific advisory board member, and consultant for BiomeSense, Inc., has equity and receives income. He is a scientific advisory board member and has equity in GenCirq. He has equity and acts as a consultant for Cybele. The terms of these arrangements have been reviewed and approved by the University of California, San Diego in accordance with its conflict-of-interest policies. The corresponding authors are also the MPIs for NPH centers. D.M. is a consultant for BiomeSense, Inc., has equity and receives income. The terms of these arrangements have been reviewed and approved by the University of California, San Diego in accordance with its conflict-of-interest policies. The rest of the Authors declare no competing interests.

## Peer review

### Peer review information

*Nature Communications* thanks Pierfrancesco Novielli, and the other, anonymous, reviewers for their contribution to the peer review of this work.

## Additional information

**Publisher’s note** Springer Nature remains neutral with regard to jurisdictional claims in published maps and institutional affiliations.

## Supplementary information

### Supplementary Information (download PDF )

## Rights and permissions

**Open Access** This article is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License, which permits any non-commercial use, sharing, distribution and reproduction in any medium or format, as long as you give appropriate credit to the original author(s) and the source, provide a link to the Creative Commons licence, and indicate if you modified the licensed material. You do not have permission under this licence to share adapted material derived from this article or parts of it. The images or other third party material in this article are included in the article’s Creative Commons licence, unless indicated otherwise in a credit line to the material. If material is not included in the article’s Creative Commons licence and your intended use is not permitted by statutory regulation or exceeds the permitted use, you will need to obtain permission directly from the copyright holder. To view a copy of this licence, visit [http://creativecommons.org/licenses/by-nc-nd/4.0/](http://creativecommons.org/licenses/by-nc-nd/4.0/).

[^1]: Green, R. et al. Growing health: global linkages between patterns of food supply, sustainability, and vulnerability to climate change. *Lancet Planet Health* **6**, e901–e908 (2022).

[Article](https://doi.org/10.1016%2FS2542-5196%2822%2900223-6) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=36370728) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7616194) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Growing%20health%3A%20global%20linkages%20between%20patterns%20of%20food%20supply%2C%20sustainability%2C%20and%20vulnerability%20to%20climate%20change&journal=Lancet%20Planet%20Health&doi=10.1016%2FS2542-5196%2822%2900223-6&volume=6&pages=e901-e908&publication_year=2022&author=Green%2CR)

[^2]: Muyulema, S. L. et al. Worldwide trends in childhood overweight and obesity over the last 20 years. *Clin. Nutr. ESPEN* **65**, 453–460 (2025).

[Article](https://doi.org/10.1016%2Fj.clnesp.2024.12.013) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39709095) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Worldwide%20trends%20in%20childhood%20overweight%20and%20obesity%20over%20the%20last%2020%20years&journal=Clin.%20Nutr.%20ESPEN&doi=10.1016%2Fj.clnesp.2024.12.013&volume=65&pages=453-460&publication_year=2025&author=Muyulema%2CSL)

[^3]: Murray, C. J. et al. Global burden of 87 risk factors in 204 countries and territories, 1990–2019: a systematic analysis for the Global Burden of Disease Study 2019. *lancet* **396**, 1223–1249 (2020).

[Article](https://doi.org/10.1016%2FS0140-6736%2820%2930752-2) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Global%20burden%20of%2087%20risk%20factors%20in%20204%20countries%20and%20territories%2C%201990%E2%80%932019%3A%20a%20systematic%20analysis%20for%20the%20Global%20Burden%20of%20Disease%20Study%202019&journal=lancet&doi=10.1016%2FS0140-6736%2820%2930752-2&volume=396&pages=1223-1249&publication_year=2020&author=Murray%2CCJ)

[^4]: Scrimshaw, N. S. in *Vitamins & Hormones* Vol. 26 705-716 (Elsevier, 1969).

[^5]: U.S. Department of Agriculture and U.S. Department of Health and Human Services. Dietary Guidelines for Americans, 2025–2030 (2025).

[^6]: Korem, T. et al. Bread affects clinical parameters and induces gut microbiome-associated personal glycemic responses. *Cell Metab.* **25**, 1243–1253.e1245 (2017).

[Article](https://doi.org/10.1016%2Fj.cmet.2017.05.002) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BC2sXpslWgsbw%3D) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=28591632) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Bread%20affects%20clinical%20parameters%20and%20induces%20gut%20microbiome-associated%20personal%20glycemic%20responses&journal=Cell%20Metab.&doi=10.1016%2Fj.cmet.2017.05.002&volume=25&pages=1243-1253.e1245&publication_year=2017&author=Korem%2CT)

[^7]: Zeevi, D. et al. Personalized nutrition by prediction of glycemic responses. *Cell* **163**, 1079–1094 (2015).

[Article](https://doi.org/10.1016%2Fj.cell.2015.11.001) [ADS](http://adsabs.harvard.edu/cgi-bin/nph-data_query?link_type=ABSTRACT&bibcode=2015Cell..163.1079Z) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BC2MXhvVyqtbvM) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=26590418) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Personalized%20nutrition%20by%20prediction%20of%20glycemic%20responses&journal=Cell&doi=10.1016%2Fj.cell.2015.11.001&volume=163&pages=1079-1094&publication_year=2015&author=Zeevi%2CD)

[^8]: Maruvada, P. et al. Perspective: dietary biomarkers of intake and exposure—exploration with omics approaches. *Adv. Nutr.* **11**, 200–215 (2020).

[Article](https://doi.org/10.1093%2Fadvances%2Fnmz075) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=31386148) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7442414) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Perspective%3A%20dietary%20biomarkers%20of%20intake%20and%20exposure%E2%80%94exploration%20with%20omics%20approaches&journal=Adv.%20Nutr.&doi=10.1093%2Fadvances%2Fnmz075&volume=11&pages=200-215&publication_year=2020&author=Maruvada%2CP)

[^9]: National Institutes of Health. 2020-30 Strategic Plan for NIH Nutrition Research. (National Institutes of Health, 2020).

[^10]: NIH. *Nutrition for Precision Health, powered by the All of Us Research Program*, [https://commonfund.nih.gov/nutritionforprecisionhealth](https://commonfund.nih.gov/nutritionforprecisionhealth) (NIH, 023).

[^11]: Lee, B. Y. et al. Research gaps and opportunities in precision nutrition: an NIH workshop report. *Am. J. Clin. Nutr.* **116**, 1877–1900 (2022).

[Article](https://doi.org/10.1093%2Fajcn%2Fnqac237) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB3sXis1Gnu7zE) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=36055772) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9761773) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Research%20gaps%20and%20opportunities%20in%20precision%20nutrition%3A%20an%20NIH%20workshop%20report&journal=Am.%20J.%20Clin.%20Nutr.&doi=10.1093%2Fajcn%2Fnqac237&volume=116&pages=1877-1900&publication_year=2022&author=Lee%2CBY)

[^12]: Lahat, D., Adali, T. & Jutten, C. Multimodal data fusion: an overview of methods, challenges, and prospects. *Proc. IEEE* **103**, 1449–1477 (2015).

[Article](https://doi.org/10.1109%2FJPROC.2015.2460697) [ADS](http://adsabs.harvard.edu/cgi-bin/nph-data_query?link_type=ABSTRACT&bibcode=2015IEEEP.103.1449L) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Multimodal%20data%20fusion%3A%20an%20overview%20of%20methods%2C%20challenges%2C%20and%20prospects&journal=Proc.%20IEEE&doi=10.1109%2FJPROC.2015.2460697&volume=103&pages=1449-1477&publication_year=2015&author=Lahat%2CD&author=Adali%2CT&author=Jutten%2CC)

[^13]: Avraham, S. B. et al. Methodology and challenges for harmonization of nutritional data from seven historical studies. *Nutr. J.* **23**, 88 (2024).

[Article](https://link.springer.com/doi/10.1186/s12937-024-00976-8) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39107818) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11302319) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Methodology%20and%20challenges%20for%20harmonization%20of%20nutritional%20data%20from%20seven%20historical%20studies&journal=Nutr.%20J.&doi=10.1186%2Fs12937-024-00976-8&volume=23&publication_year=2024&author=Avraham%2CSB)

[^14]: Mendes-Soares, H. et al. Assessment of a personalized approach to predicting postprandial glycemic responses to food among individuals without diabetes. *JAMA Netw. Open* **2**, e188102–e188102 (2019).

[Article](https://doi.org/10.1001%2Fjamanetworkopen.2018.8102) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=30735238) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC6484621) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Assessment%20of%20a%20personalized%20approach%20to%20predicting%20postprandial%20glycemic%20responses%20to%20food%20among%20individuals%20without%20diabetes&journal=JAMA%20Netw.%20Open&doi=10.1001%2Fjamanetworkopen.2018.8102&volume=2&pages=e188102-e188102&publication_year=2019&author=Mendes-Soares%2CH)

[^15]: Hullar, M. A. J. et al. Metabolic plasticity of the gut microbiome in response to diets differing in glycemic load in a randomized, crossover, controlled feeding study. *Am. J. Clin. Nutr.* **122**, 780–792 (2025).

[Article](https://doi.org/10.1016%2Fj.ajcnut.2025.06.026) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB2MXhsl2ku7bE) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40619005) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC12489384) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Metabolic%20plasticity%20of%20the%20gut%20microbiome%20in%20response%20to%20diets%20differing%20in%20glycemic%20load%20in%20a%20randomized%2C%20crossover%2C%20controlled%20feeding%20study&journal=Am.%20J.%20Clin.%20Nutr.&doi=10.1016%2Fj.ajcnut.2025.06.026&volume=122&pages=780-792&publication_year=2025&author=Hullar%2CMAJ)

[^16]: Berry, S. E. et al. Human postprandial responses to food and potential for precision nutrition. *Nat. Med* **26**, 964–973 (2020).

[Article](https://doi.org/10.1038%2Fs41591-020-0934-0) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB3cXhtFCms77M) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32528151) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC8265154) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Human%20postprandial%20responses%20to%20food%20and%20potential%20for%20precision%20nutrition&journal=Nat.%20Med&doi=10.1038%2Fs41591-020-0934-0&volume=26&pages=964-973&publication_year=2020&author=Berry%2CSE)

[^17]: Bermingham, K. et al. Personalized nutrition based on postprandial responses in the ZOE PREDICT trial. *Nat. Med.* (2024).

[^18]: Rein, M. et al. Effects of personalized diets by prediction of glycemic responses on glycemic control and metabolic health in newly diagnosed T2DM: a randomized dietary intervention pilot trial. *BMC Med.* **20**, 56 (2022).

[^19]: All of Us Research Program, I. The “All of Us” research program. *N. Engl. J. Med.* **381**, 668–676 (2019).

[Article](https://doi.org/10.1056%2FNEJMsr1809937) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20%E2%80%9CAll%20of%20Us%E2%80%9D%20research%20program&journal=N.%20Engl.%20J.%20Med.&doi=10.1056%2FNEJMsr1809937&volume=381&pages=668-676&publication_year=2019&author=All%20of%20Us%20Research%20Program%2CI)

[^20]: Sudlow, C. et al. UK Biobank: an open access resource for identifying the causes of a wide range of complex diseases of middle and old age. *PLoS Med.* **12**, e1001779–e1001779 (2015).

[Article](https://doi.org/10.1371%2Fjournal.pmed.1001779) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=25826379) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4380465) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=UK%20Biobank%3A%20an%20open%20access%20resource%20for%20identifying%20the%20causes%20of%20a%20wide%20range%20of%20complex%20diseases%20of%20middle%20and%20old%20age&journal=PLoS%20Med.&doi=10.1371%2Fjournal.pmed.1001779&volume=12&pages=e1001779-e1001779&publication_year=2015&author=Sudlow%2CC)

[^21]: National Institutes of Health. NIH Common Fund Data Ecosystem. (NIH, 2023).

[^22]: National Heart Lung Blood Institute. NHLBI BioData Catalyst. (NHLBI, 2023).

[^23]: National Institutes of Health. NIH Multi-Omics for Health and Disease Consortium. (NIH, 2023).

[^24]: AI and machine learning in nutrition: the promise, the challenge, and recommendations. *Am. J. Clin. Nutr.* **123**, 101126 (2025).

[^25]: Sinha, R. et al. Leveraging genomic associations in precision digital care for weight loss: cohort study. *J. Med. Internet Res.* **23**, e25401 (2021).

[Article](https://doi.org/10.2196%2F25401) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=33849843) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC8173391) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Leveraging%20genomic%20associations%20in%20precision%20digital%20care%20for%20weight%20loss%3A%20cohort%20study&journal=J.%20Med.%20Internet%20Res.&doi=10.2196%2F25401&volume=23&publication_year=2021&author=Sinha%2CR)

[^26]: Wilstrup, C. & Cave, C. Combining symbolic regression with the Cox proportional hazards model improves prediction of heart failure deaths. *BMC Med. Inform. Decis. Mak.* **22**, 196 (2022).

[Article](https://link.springer.com/doi/10.1186/s12911-022-01943-1) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35879758) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9316394) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Combining%20symbolic%20regression%20with%20the%20Cox%20proportional%20hazards%20model%20improves%20prediction%20of%20heart%20failure%20deaths&journal=BMC%20Med.%20Inform.%20Decis.%20Mak.&doi=10.1186%2Fs12911-022-01943-1&volume=22&publication_year=2022&author=Wilstrup%2CC&author=Cave%2CC)

[^27]: Pigsborg, K. et al. Predicting weight loss success on a new Nordic diet: an untargeted multi-platform metabolomics and machine learning approach. *Front. Nutr.* **10**, 1191944 (2023).

[Article](https://doi.org/10.3389%2Ffnut.2023.1191944) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37599689) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10434509) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Predicting%20weight%20loss%20success%20on%20a%20new%20Nordic%20diet%3A%20an%20untargeted%20multi-platform%20metabolomics%20and%20machine%20learning%20approach&journal=Front.%20Nutr.&doi=10.3389%2Ffnut.2023.1191944&volume=10&publication_year=2023&author=Pigsborg%2CK)

[^28]: Montrose, D. C. et al. Dietary fructose alters the composition, localization, and metabolism of gut microbiota in association with worsening colitis. *Cell. Mol. Gastroenterol. Hepatol.* **11**, 525–550 (2021).

[Article](https://doi.org/10.1016%2Fj.jcmgh.2020.09.008) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB38XhtlSrtb7F) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32961355) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Dietary%20fructose%20alters%20the%20composition%2C%20localization%2C%20and%20metabolism%20of%20gut%20microbiota%20in%20association%20with%20worsening%20colitis&journal=Cell.%20Mol.%20Gastroenterol.%20Hepatol.&doi=10.1016%2Fj.jcmgh.2020.09.008&volume=11&pages=525-550&publication_year=2021&author=Montrose%2CDC)

[^29]: New, F. N., Baer, B. R., Clark, A. G., Wells, M. T. & Brito, I. L. Collective effects of human genomic variation on microbiome function. *Sci. Rep.* **12**, 3839 (2022).

[Article](https://doi.org/10.1038%2Fs41598-022-07632-3) [ADS](http://adsabs.harvard.edu/cgi-bin/nph-data_query?link_type=ABSTRACT&bibcode=2022NatSR..12.3839N) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB38XmsFanu74%3D) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35264618) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC8907173) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Collective%20effects%20of%20human%20genomic%20variation%20on%20microbiome%20function&journal=Sci.%20Rep.&doi=10.1038%2Fs41598-022-07632-3&volume=12&publication_year=2022&author=New%2CFN&author=Baer%2CBR&author=Clark%2CAG&author=Wells%2CMT&author=Brito%2CIL)

[^30]: Tibshirani, R. Regression shrinkage and selection via the lasso. *J. R. Stat. Soc. Ser. B* **58**, 267–288 (1996).

[Article](https://doi.org/10.1111%2Fj.2517-6161.1996.tb02080.x) [MathSciNet](http://www.ams.org/mathscinet-getitem?mr=1379242) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Regression%20shrinkage%20and%20selection%20via%20the%20lasso&journal=J.%20R.%20Stat.%20Soc.%20Ser.%20B&doi=10.1111%2Fj.2517-6161.1996.tb02080.x&volume=58&pages=267-288&publication_year=1996&author=Tibshirani%2CR)

[^31]: Hoerl, A. E. & Kennard, R. W. Ridge regression: biased estimation for nonorthogonal problems. *Technometrics* **12**, 55–67 (1970).

[Article](https://doi.org/10.1080%2F00401706.1970.10488634) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Ridge%20regression%3A%20biased%20estimation%20for%20nonorthogonal%20problems&journal=Technometrics&doi=10.1080%2F00401706.1970.10488634&volume=12&pages=55-67&publication_year=1970&author=Hoerl%2CAE&author=Kennard%2CRW)

[^32]: Zou, H. & Hastie, T. Regularization and variable selection via the elastic net. *J. R. Stat. Soc.: Ser. B (Stat. Methodol.* **67**, 301–320 (2005).

[Article](https://doi.org/10.1111%2Fj.1467-9868.2005.00503.x) [MathSciNet](http://www.ams.org/mathscinet-getitem?mr=2137327) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Regularization%20and%20variable%20selection%20via%20the%20elastic%20net&journal=J.%20R.%20Stat.%20Soc.%3A%20Ser.%20B%20%28Stat.%20Methodol.&doi=10.1111%2Fj.1467-9868.2005.00503.x&volume=67&pages=301-320&publication_year=2005&author=Zou%2CH&author=Hastie%2CT)

[^33]: Pedregosa, F. et al. Scikit-learn: machine learning in Python. *J. Mach. Learn. Res.* **12**, 2825–2830 (2011).

[MathSciNet](http://www.ams.org/mathscinet-getitem?mr=2854348) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Scikit-learn%3A%20machine%20learning%20in%20Python&journal=J.%20Mach.%20Learn.%20Res.&volume=12&pages=2825-2830&publication_year=2011&author=Pedregosa%2CF)

[^34]: Mogaveera, D., Mathur, V. & Waghela, S. E-health monitoring system with diet and fitness recommendation using machine learning. *2021 6th International Conference on Inventive Computation Technologies (ICICT)*, 694–700 (ICICT, 2021).

[^35]: Salinari, A. et al. The application of digital technologies and artificial intelligence in healthcare: An overview on nutrition assessment. *Diseases* **11**, 97 (2023).

[Article](https://doi.org/10.3390%2Fdiseases11030097) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB3sXitV2rs7zN) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37489449) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10366918) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20application%20of%20digital%20technologies%20and%20artificial%20intelligence%20in%20healthcare%3A%20An%20overview%20on%20nutrition%20assessment&journal=Diseases&doi=10.3390%2Fdiseases11030097&volume=11&publication_year=2023&author=Salinari%2CA)

[^36]: Wang, X., Liu, Y., Qin, G. & Yu, Y. Robust double machine learning model with application to omics data. *BMC Bioinforma.* **25**, 355 (2024).

[Article](https://link.springer.com/doi/10.1186/s12859-024-05975-4) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB2cXoslCru7s%3D) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Robust%20double%20machine%20learning%20model%20with%20application%20to%20omics%20data&journal=BMC%20Bioinforma.&doi=10.1186%2Fs12859-024-05975-4&volume=25&publication_year=2024&author=Wang%2CX&author=Liu%2CY&author=Qin%2CG&author=Yu%2CY)

[^37]: Breiman, L., Friedman, J., Olshen, R. A. & Stone, C. J. *Classification and Regression Trees* (Wiley, 1984).

[^38]: Breiman, L. Random forests. *Mach. Learn.* **45**, 5–32 (2001).

[Article](https://doi.org/10.1023%2FA%3A1010933404324) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Random%20forests&journal=Mach.%20Learn.&doi=10.1023%2FA%3A1010933404324&volume=45&pages=5-32&publication_year=2001&author=Breiman%2CL)

[^39]: Shi, S. & Zhang, H. in *Proc.* *International Conference on Intelligent Systems and Computational Networks (ICISCN*). 1-7 (IEEE, 2025).

[^40]: Menichetti, G., Ravandi, B., Mozaffarian, D. & Barabási, A.-L. Machine learning prediction of the degree of food processing. *Nat. Commun.* **14**, 2312–2312 (2023).

[Article](https://doi.org/10.1038%2Fs41467-023-37457-1) [ADS](http://adsabs.harvard.edu/cgi-bin/nph-data_query?link_type=ABSTRACT&bibcode=2023NatCo..14.2312M) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB3sXos1yqsb4%3D) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37085506) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10121643) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Machine%20learning%20prediction%20of%20the%20degree%20of%20food%20processing&journal=Nat.%20Commun.&doi=10.1038%2Fs41467-023-37457-1&volume=14&pages=2312-2312&publication_year=2023&author=Menichetti%2CG&author=Ravandi%2CB&author=Mozaffarian%2CD&author=Barab%C3%A1si%2CA-L)

[^41]: Friedman, J. H. Greedy function approximation: a gradient boosting machine. *Ann. Stat.* **29**, 1189–1232 (2001).

[Article](https://doi.org/10.1214%2Faos%2F1013203451) [MathSciNet](http://www.ams.org/mathscinet-getitem?mr=1873328) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Greedy%20function%20approximation%3A%20a%20gradient%20boosting%20machine&journal=Ann.%20Stat.&doi=10.1214%2Faos%2F1013203451&volume=29&pages=1189-1232&publication_year=2001&author=Friedman%2CJH)

[^42]: Chen, T. & Guestrin, C. 785–794.

[^43]: Søndertoft, N. B. et al. The intestinal microbiome is a co-determinant of the postprandial plasma glucose response. *PLoS ONE* **15**, e0238648 (2020).

[Article](https://doi.org/10.1371%2Fjournal.pone.0238648) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32947608) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7500969) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20intestinal%20microbiome%20is%20a%20co-determinant%20of%20the%20postprandial%20plasma%20glucose%20response&journal=PLoS%20ONE&doi=10.1371%2Fjournal.pone.0238648&volume=15&issue=9&publication_year=2020&author=S%C3%B8ndertoft%2CNB)

[^44]: Tily, H. et al. Gut microbiome activity contributes to prediction of individual variation in glycemic response in adults. *Diab Ther.* **13**, 89–111 (2022).

[Article](https://link.springer.com/doi/10.1007/s13300-021-01174-z) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB38XlsVCjsbk%3D) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Gut%20microbiome%20activity%20contributes%20to%20prediction%20of%20individual%20variation%20in%20glycemic%20response%20in%20adults&journal=Diab%20Ther.&doi=10.1007%2Fs13300-021-01174-z&volume=13&pages=89-111&publication_year=2022&author=Tily%2CH)

[^45]: Cotillard, A. et al. Dietary intervention impact on gut microbial gene richness. *Nature* **500**, 585–588 (2013).

[Article](https://doi.org/10.1038%2Fnature12480) [ADS](http://adsabs.harvard.edu/cgi-bin/nph-data_query?link_type=ABSTRACT&bibcode=2013Natur.500..585C) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BC3sXhtlCntrnM) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=23985875) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Dietary%20intervention%20impact%20on%20gut%20microbial%20gene%20richness&journal=Nature&doi=10.1038%2Fnature12480&volume=500&pages=585-588&publication_year=2013&author=Cotillard%2CA)

[^46]: Deehan, E. C. et al. Precision microbiome modulation with discrete dietary fiber structures directs short-chain fatty acid production. *Cell Host Microbe* **27**, 389–404.e386 (2020).

[Article](https://doi.org/10.1016%2Fj.chom.2020.01.006) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB3cXitFCjt7c%3D) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32004499) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Precision%20microbiome%20modulation%20with%20discrete%20dietary%20fiber%20structures%20directs%20short-chain%20fatty%20acid%20production&journal=Cell%20Host%20Microbe&doi=10.1016%2Fj.chom.2020.01.006&volume=27&pages=389-404.e386&publication_year=2020&author=Deehan%2CEC)

[^47]: Wu, G. D. et al. Linking long-term dietary patterns with gut microbial enterotypes. *Science* **334**, 105–108 (2011).

[Article](https://doi.org/10.1126%2Fscience.1208344) [ADS](http://adsabs.harvard.edu/cgi-bin/nph-data_query?link_type=ABSTRACT&bibcode=2011Sci...334..105W) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BC3MXht1Gms77K) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=21885731) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3368382) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Linking%20long-term%20dietary%20patterns%20with%20gut%20microbial%20enterotypes&journal=Science&doi=10.1126%2Fscience.1208344&volume=334&pages=105-108&publication_year=2011&author=Wu%2CGD)

[^48]: Lundberg, S. M. & Lee, S.-I. A unified approach to interpreting model predictions. *Adv. Neural Inf. Process. Syst.* **30**, 4768–4777 (2017).

[^49]: Chen, S. et al. Personalized optimal nutrition lifestyle for self obesity management using metaalgorithms. *Sci. Rep.* **12**, 12387 (2022).

[Article](https://doi.org/10.1038%2Fs41598-022-16260-w) [ADS](http://adsabs.harvard.edu/cgi-bin/nph-data_query?link_type=ABSTRACT&bibcode=2022NatSR..1212387C) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB38XhvFWnsLvE) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35858966) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9297061) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Personalized%20optimal%20nutrition%20lifestyle%20for%20self%20obesity%20management%20using%20metaalgorithms&journal=Sci.%20Rep.&doi=10.1038%2Fs41598-022-16260-w&volume=12&publication_year=2022&author=Chen%2CS)

[^50]: Wang, F. & Sun, J. Survey on distance metric learning and dimensionality reduction in data mining. *Data Min. Knowl. Discov.* **29**, 534–564 (2015).

[Article](https://link.springer.com/doi/10.1007/s10618-014-0356-z) [MathSciNet](http://www.ams.org/mathscinet-getitem?mr=3312470) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Survey%20on%20distance%20metric%20learning%20and%20dimensionality%20reduction%20in%20data%20mining&journal=Data%20Min.%20Knowl.%20Discov.&doi=10.1007%2Fs10618-014-0356-z&volume=29&pages=534-564&publication_year=2015&author=Wang%2CF&author=Sun%2CJ)

[^51]: Knight, R. et al. Best practices for analysing microbiomes. *Nat. Rev. Microbiol.* **16**, 410–422 (2018).

[Article](https://doi.org/10.1038%2Fs41579-018-0029-9) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BC1cXhtVSksrrJ) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=29795328) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Best%20practices%20for%20analysing%20microbiomes&journal=Nat.%20Rev.%20Microbiol.&doi=10.1038%2Fs41579-018-0029-9&volume=16&pages=410-422&publication_year=2018&author=Knight%2CR)

[^52]: Shi, Y., Zhang, L., Peterson, C. B., Do, K.-A. & Jenq, R. R. Performance determinants of unsupervised clustering methods for microbiome data. *Microbiome* **10**, 25 (2022).

[Article](https://link.springer.com/doi/10.1186/s40168-021-01199-3) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB38XjsVCntbs%3D) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35120564) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC8817542) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Performance%20determinants%20of%20unsupervised%20clustering%20methods%20for%20microbiome%20data&journal=Microbiome&doi=10.1186%2Fs40168-021-01199-3&volume=10&publication_year=2022&author=Shi%2CY&author=Zhang%2CL&author=Peterson%2CCB&author=Do%2CK-A&author=Jenq%2CRR)

[^53]: Nothias, L.-F. et al. Feature-based molecular networking in the GNPS analysis environment. *Nat. Methods* **17**, 905–908 (2020).

[Article](https://doi.org/10.1038%2Fs41592-020-0933-6) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB3cXhs1KhtL%2FP) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32839597) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7885687) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Feature-based%20molecular%20networking%20in%20the%20GNPS%20analysis%20environment&journal=Nat.%20Methods&doi=10.1038%2Fs41592-020-0933-6&volume=17&pages=905-908&publication_year=2020&author=Nothias%2CL-F)

[^54]: van der Maaten, L. & Hinton, G. Visualizing data using t-SNE. *J. Mach. Learn. Res.* **9**, 2579–2605 (2008).

[Google Scholar](http://scholar.google.com/scholar_lookup?&title=Visualizing%20data%20using%20t-SNE&journal=J.%20Mach.%20Learn.%20Res.&volume=9&pages=2579-2605&publication_year=2008&author=Maaten%2CL&author=Hinton%2CG)

[^55]: McInnes, L., Healy, J. & Melville, J. UMAP: uniform manifold approximation and projection for dimension reduction. *arXiv preprint*, arXiv:1802.03426 (2018).

[^56]: Ibrahim, K. Z. *et al*. in *International Workshop on Performance Modeling, Benchmarking and Simulation of High Performance Computer Systems (PMBS*). 7-17 (IEEE, 2021).

[^57]: Wang, F., Kaushal, R. & Khullar, D. Vol. 172 59-60 (American College of Physicians, 2020).

[^58]: Cao, M. D. & et al. MicrobialGraph: a graph neural network framework for microbiome-based phenotype prediction. *Bioinformatics* **39**, 270 [https://doi.org/10.1093/bioinformatics/btad270](https://doi.org/10.1093/bioinformatics/btad270) (2023).

[^59]: Zhou, Y. A GNN framework for microbial metabolic pathway analysis from metagenomic reads. *IEEE/ACM Trans. Comput. Biol. Bioinforma.* [https://doi.org/10.1109/TCBB.2022.3141239](https://doi.org/10.1109/TCBB.2022.3141239) (2022).

[Article](https://doi.org/10.1109%2FTCBB.2022.3141239) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=A%20GNN%20framework%20for%20microbial%20metabolic%20pathway%20analysis%20from%20metagenomic%20reads&journal=IEEE%2FACM%20Trans.%20Comput.%20Biol.%20Bioinforma.&doi=10.1109%2FTCBB.2022.3141239&publication_year=2022&author=Zhou%2CY)

[^60]: Zhao, Y. Inferring microbiome–metabolome associations with graph neural networks. *Bioinformatics* **37**, 4038–4046 (2021).

[Google Scholar](http://scholar.google.com/scholar_lookup?&title=Inferring%20microbiome%E2%80%93metabolome%20associations%20with%20graph%20neural%20networks&journal=Bioinformatics&volume=37&pages=4038-4046&publication_year=2021&author=Zhao%2CY)

[^61]: Kong, W. MOGONET: multi-omics integration via graph convolutional networks for biomedical classification. *Bioinformatics* **38**, 1400–1406 (2022).

[Google Scholar](http://scholar.google.com/scholar_lookup?&title=MOGONET%3A%20multi-omics%20integration%20via%20graph%20convolutional%20networks%20for%20biomedical%20classification&journal=Bioinformatics&volume=38&pages=1400-1406&publication_year=2022&author=Kong%2CW)

[^62]: Wang, T. et al. Predicting metabolite response to dietary intervention using deep learning. *Nat. Commun.* **16**, 815 (2025).

[Article](https://doi.org/10.1038%2Fs41467-025-56165-6) [ADS](http://adsabs.harvard.edu/cgi-bin/nph-data_query?link_type=ABSTRACT&bibcode=2025NatCo..16..815W) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB2MXhvFams7g%3D) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39827177) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11742956) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Predicting%20metabolite%20response%20to%20dietary%20intervention%20using%20deep%20learning&journal=Nat.%20Commun.&doi=10.1038%2Fs41467-025-56165-6&volume=16&publication_year=2025&author=Wang%2CT)

[^63]: Lewis, P. et al. Retrieval-augmented generation for knowledge-intensive NLP tasks. *Adv. neural Inf. Process. Syst.* **33**, 9459–9474 (2020).

[Google Scholar](http://scholar.google.com/scholar_lookup?&title=Retrieval-augmented%20generation%20for%20knowledge-intensive%20NLP%20tasks&journal=Adv.%20neural%20Inf.%20Process.%20Syst.&volume=33&pages=9459-9474&publication_year=2020&author=Lewis%2CP)

[^64]: Massara, P. et al. IEEE International Conference on Collaborative Advances in Software and computing 68–73 (CASCON, 2025).

[^65]: Reynolds, L. & McDonell, K. in *Extended abstracts of the 2021 CHI conference on human factors in computing systems*. 1-7 (CHI, 2021).

[^66]: Genkina, D. AI prompt engineering is dead. long live AI prompt engineering. *IEEE Spectrum* **3** (IEEE, 2024).

[^67]: Botwright, R. in *Deep Learning: Computer Vision*, *Python Machine Learning And Neural Networks-4 Book in 1* Ch. 8, (Pastor Publishing Ltd, 2024).

[^68]: Maynez, J., Narayan, S., Bohnet, B. & McDonald, R. On Faithfulness and Factuality in Abstractive Summarization. In Proceedings of the 58th Annual Meeting of the Association for Computational Linguistics, pages 1906–1919, Online. Association for Computational Linguistics.

[^69]: Balloccu, S., Schmidtová, P., Lango, M. & Dušek, O. Leak, Cheat, Repeat: Data Contamination and Evaluation Malpractices in Closed-Source LLMs. In Proceedings of the 18th Conference of the European Chapter of the Association for Computational Linguistics (Volume 1: Long Papers), pages 67–93, St. Julian’s, Malta. Association for Computational Linguistics [https://aclanthology.org/2020.acl-main.173/](https://aclanthology.org/2020.acl-main.173/)

[^70]: Dai, S. et al. in *Proc. 30th ACM SIGKDD Conference on Knowledge Discovery and Data Mining*. 6437–6447 [https://aclanthology.org/2024.eacl-long.5/](https://aclanthology.org/2024.eacl-long.5/)

[^71]: Bergling, K. et al. From bytes to bites: application of large language models to enhance nutritional recommendations. *Clin. Kidney J.* **18**, sfaf082 (2025).

[Article](https://doi.org/10.1093%2Fckj%2Fsfaf082) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40226366) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11992566) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=From%20bytes%20to%20bites%3A%20application%20of%20large%20language%20models%20to%20enhance%20nutritional%20recommendations&journal=Clin.%20Kidney%20J.&doi=10.1093%2Fckj%2Fsfaf082&volume=18&publication_year=2025&author=Bergling%2CK)

[^72]: Stefanidis, K. et al. PROTEIN AI advisor: a knowledge-based recommendation framework using expert-validated meals for healthy diets. *Nutrients* **14**, 4435 (2022).

[Article](https://doi.org/10.3390%2Fnu14204435) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB38Xisl2msb%2FF) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=36297118) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9612332) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=PROTEIN%20AI%20advisor%3A%20a%20knowledge-based%20recommendation%20framework%20using%20expert-validated%20meals%20for%20healthy%20diets&journal=Nutrients&doi=10.3390%2Fnu14204435&volume=14&publication_year=2022&author=Stefanidis%2CK)

[^73]: Papastratis, I. et al. Can ChatGPT provide appropriate meal plans for NCD patients? *Nutrition* **121**, 112291 (2024).

[Article](https://doi.org/10.1016%2Fj.nut.2023.112291) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=38359704) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Can%20ChatGPT%20provide%20appropriate%20meal%20plans%20for%20NCD%20patients%3F&journal=Nutrition&doi=10.1016%2Fj.nut.2023.112291&volume=121&publication_year=2024&author=Papastratis%2CI)

[^74]: Wang, L.-C. et al. Application of ChatGPT to support nutritional recommendations for dialysis patients – a qualitative and quantitative evaluation. *J. Ren. Nutr.* **34**, 477–481 (2024).

[Article](https://doi.org/10.1053%2Fj.jrn.2024.09.001) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39278578) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Application%20of%20ChatGPT%20to%20support%20nutritional%20recommendations%20for%20dialysis%20patients%20%E2%80%93%20a%20qualitative%20and%20quantitative%20evaluation&journal=J.%20Ren.%20Nutr.&doi=10.1053%2Fj.jrn.2024.09.001&volume=34&pages=477-481&publication_year=2024&author=Wang%2CL-C)

[^75]: Erickson, J. S., Santos, H., Pinheiro, V., McCusker, J. P. & McGuinness, D. L. LLM experimentation through knowledge graphs: towards improved management, repeatability, and verification. *J. Web Semant.* **85**, 100853 (2025).

[Article](https://doi.org/10.1016%2Fj.websem.2024.100853) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=LLM%20experimentation%20through%20knowledge%20graphs%3A%20towards%20improved%20management%2C%20repeatability%2C%20and%20verification&journal=J.%20Web%20Semant.&doi=10.1016%2Fj.websem.2024.100853&volume=85&publication_year=2025&author=Erickson%2CJS&author=Santos%2CH&author=Pinheiro%2CV&author=McCusker%2CJP&author=McGuinness%2CDL)

[^76]: Gu, Y. et al. Domain-specific language model pretraining for biomedical natural language processing. *ACM Trans. Comput. Healthc.* **3**, 1–23 (2021).

[Article](https://doi.org/10.1145%2F3458754) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB3MXitlGksbjO) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Domain-specific%20language%20model%20pretraining%20for%20biomedical%20natural%20language%20processing&journal=ACM%20Trans.%20Comput.%20Healthc.&doi=10.1145%2F3458754&volume=3&pages=1-23&publication_year=2021&author=Gu%2CY)

[^77]: Luo, L., Lai, P.-T., Wei, C.-H., Arighi, C. N. & Lu, Z. BioRED: a rich biomedical relation extraction dataset. *Brief. Bioinforma.* **23**, bbac282 (2022).

[Article](https://doi.org/10.1093%2Fbib%2Fbbac282) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=BioRED%3A%20a%20rich%20biomedical%20relation%20extraction%20dataset&journal=Brief.%20Bioinforma.&doi=10.1093%2Fbib%2Fbbac282&volume=23&publication_year=2022&author=Luo%2CL&author=Lai%2CP-T&author=Wei%2CC-H&author=Arighi%2CCN&author=Lu%2CZ)

[^78]: Kalakoti, R., Nõmm, S. & Bahsi, H. In *International Conference on Machine Learning and Applications*, 595–601 (ICMLA, 2023).

[^79]: Guo, D. et al. DeepSeek-R1 incentivizes reasoning in LLMs through reinforcement learning. *Nature* **645**, 633–638 (2025).

[Article](https://doi.org/10.1038%2Fs41586-025-09422-z) [ADS](http://adsabs.harvard.edu/cgi-bin/nph-data_query?link_type=ABSTRACT&bibcode=2025Natur.645..633G) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB2MXitlSgt7rE) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40962978) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC12443585) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=DeepSeek-R1%20incentivizes%20reasoning%20in%20LLMs%20through%20reinforcement%20learning&journal=Nature&doi=10.1038%2Fs41586-025-09422-z&volume=645&pages=633-638&publication_year=2025&author=Guo%2CD)

[^80]: Dodd, K. W., Guenther, P. M. & Freedman, L. S. Statistical methods for estimating usual intake of episodically consumed foods. *J. Am. Dietetic Assoc.* **106**, 1640–1650 (2006).

[Article](https://doi.org/10.1016%2Fj.jada.2006.07.011) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Statistical%20methods%20for%20estimating%20usual%20intake%20of%20episodically%20consumed%20foods&journal=J.%20Am.%20Dietetic%20Assoc.&doi=10.1016%2Fj.jada.2006.07.011&volume=106&pages=1640-1650&publication_year=2006&author=Dodd%2CKW&author=Guenther%2CPM&author=Freedman%2CLS)

[^81]: Freedman, L. S., Commins, J. M., Moler, J. E. & Willett, W. Pooled results from 5 validation studies of dietary self-report instruments using recovery biomarkers for energy and protein intake. *Am. J. Epidemiol.* **180**, 172–188 (2014).

[Article](https://doi.org/10.1093%2Faje%2Fkwu116) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=24918187) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4082341) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Pooled%20results%20from%205%20validation%20studies%20of%20dietary%20self-report%20instruments%20using%20recovery%20biomarkers%20for%20energy%20and%20protein%20intake&journal=Am.%20J.%20Epidemiol.&doi=10.1093%2Faje%2Fkwu116&volume=180&pages=172-188&publication_year=2014&author=Freedman%2CLS&author=Commins%2CJM&author=Moler%2CJE&author=Willett%2CW)

[^82]: Kipnis, V., Midthune, D. & Freedman, L. S. Bias in dietary-report instruments and its implications for nutritional epidemiology. *Public Health Nutr.* **5**, 915–923 (2002).

[Article](https://doi.org/10.1079%2FPHN2002383) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=12633516) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Bias%20in%20dietary-report%20instruments%20and%20its%20implications%20for%20nutritional%20epidemiology&journal=Public%20Health%20Nutr.&doi=10.1079%2FPHN2002383&volume=5&pages=915-923&publication_year=2002&author=Kipnis%2CV&author=Midthune%2CD&author=Freedman%2CLS)

[^83]: Livingstone, M. B. E. & Black, A. E. Markers of the validity of reported energy intake. *J. Nutr.* **133**, 895S–920S (2003).

[Article](https://doi.org/10.1093%2Fjn%2F133.3.895S) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BD3sXhvFylt78%3D) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=12612176) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Markers%20of%20the%20validity%20of%20reported%20energy%20intake&journal=J.%20Nutr.&doi=10.1093%2Fjn%2F133.3.895S&volume=133&pages=895S-920S&publication_year=2003&author=Livingstone%2CMBE&author=Black%2CAE)

[^84]: Prentice, R. L., Mossavar-Rahmani, Y. & Huang, Y. Evaluation and comparison of nutritional biomarkers for dietary intake. *Am. J. Epidemiol.* **174**, 576–585 (2011).

[Google Scholar](http://scholar.google.com/scholar_lookup?&title=Evaluation%20and%20comparison%20of%20nutritional%20biomarkers%20for%20dietary%20intake&journal=Am.%20J.%20Epidemiol.&volume=174&pages=576-585&publication_year=2011&author=Prentice%2CRL&author=Mossavar-Rahmani%2CY&author=Huang%2CY)

[^85]: Subar, A. F., Freedman, L. S. & Tooze, J. A. Addressing current criticism regarding the value of self-report dietary data. *J. Nutr.* **145**, 2639–2645 (2015).

[Article](https://doi.org/10.3945%2Fjn.115.219634) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BC28XhtlGrsLzM) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=26468491) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4656907) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Addressing%20current%20criticism%20regarding%20the%20value%20of%20self-report%20dietary%20data&journal=J.%20Nutr.&doi=10.3945%2Fjn.115.219634&volume=145&pages=2639-2645&publication_year=2015&author=Subar%2CAF&author=Freedman%2CLS&author=Tooze%2CJA)

[^86]: Martínez-García, M. & Hernández-Lemus, E. Data integration challenges for machine learning in precision medicine. *Front. Med.* **8**, 784455 (2021).

[Article](https://doi.org/10.3389%2Ffmed.2021.784455) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Data%20integration%20challenges%20for%20machine%20learning%20in%20precision%20medicine&journal=Front.%20Med.&doi=10.3389%2Ffmed.2021.784455&volume=8&publication_year=2021&author=Mart%C3%ADnez-Garc%C3%ADa%2CM&author=Hern%C3%A1ndez-Lemus%2CE)

[^87]: Ben Avraham, S. et al. Methodology and challenges for harmonization of nutritional data from seven historical studies. *Nutr. J.* **23**, 88–88 (2024).

[Article](https://link.springer.com/doi/10.1186/s12937-024-00976-8) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39107818) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11302319) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Methodology%20and%20challenges%20for%20harmonization%20of%20nutritional%20data%20from%20seven%20historical%20studies&journal=Nutr.%20J.&doi=10.1186%2Fs12937-024-00976-8&volume=23&pages=88-88&publication_year=2024&author=Avraham%2CS)

[^88]: Pickford, C., McCormack, L., Liu, Y. & Eicher-Miller, H. A. US Department of Agriculture Food Composition Databases, the Food and Nutrient Database for Dietary Studies 2013-2014, and the National Nutrient Database for Standard Reference Version 28 Yield Significantly Different Nutrient Totals of Food Items from Eight Midwestern Food Pantry Inventories. *J. Acad. Nutr. Dietetics* **122**, 1326–1335.e1326 (2022).

[Article](https://doi.org/10.1016%2Fj.jand.2022.01.010) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=US%20Department%20of%20Agriculture%20Food%20Composition%20Databases%2C%20the%20Food%20and%20Nutrient%20Database%20for%20Dietary%20Studies%202013-2014%2C%20and%20the%20National%20Nutrient%20Database%20for%20Standard%20Reference%20Version%2028%20Yield%20Significantly%20Different%20Nutrient%20Totals%20of%20Food%20Items%20from%20Eight%20Midwestern%20Food%20Pantry%20Inventories&journal=J.%20Acad.%20Nutr.%20Dietetics&doi=10.1016%2Fj.jand.2022.01.010&volume=122&pages=1326-1335.e1326&publication_year=2022&author=Pickford%2CC&author=McCormack%2CL&author=Liu%2CY&author=Eicher-Miller%2CHA)

[^89]: Van Puyvelde, H. et al. Comparing calculated nutrient intakes using different food composition databases: results from the European prospective investigation into cancer and nutrition (EPIC) cohort. *Nutrients* **12**, 2906–2906 (2020).

[Article](https://doi.org/10.3390%2Fnu12102906) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32977480) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7650652) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Comparing%20calculated%20nutrient%20intakes%20using%20different%20food%20composition%20databases%3A%20results%20from%20the%20European%20prospective%20investigation%20into%20cancer%20and%20nutrition%20%28EPIC%29%20cohort&journal=Nutrients&doi=10.3390%2Fnu12102906&volume=12&pages=2906-2906&publication_year=2020&author=Puyvelde%2CH)

[^90]: Ibrahimi, E. et al. Overview of data preprocessing for machine learning applications in human microbiome research. *Front. Microbiol.* **14**, 1250909 (2023).

[Article](https://doi.org/10.3389%2Ffmicb.2023.1250909) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37869650) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10588656) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Overview%20of%20data%20preprocessing%20for%20machine%20learning%20applications%20in%20human%20microbiome%20research&journal=Front.%20Microbiol.&doi=10.3389%2Ffmicb.2023.1250909&volume=14&publication_year=2023&author=Ibrahimi%2CE)

[^91]: Lin, H. & Peddada, S. D. Analysis of microbial compositions: a review of normalization and differential abundance analysis. *npj Biofilms Microbiomes* **6**, 60 (2020).

[Article](https://doi.org/10.1038%2Fs41522-020-00160-w) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=33268781) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7710733) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Analysis%20of%20microbial%20compositions%3A%20a%20review%20of%20normalization%20and%20differential%20abundance%20analysis&journal=npj%20Biofilms%20Microbiomes&doi=10.1038%2Fs41522-020-00160-w&volume=6&publication_year=2020&author=Lin%2CH&author=Peddada%2CSD)

[^92]: Brennan, L. Biomarkers of food intake: current status and future opportunities. *Proc. Nutr. Soc.* 1–5 [https://doi.org/10.1017/S0029665125000084](https://doi.org/10.1017/S0029665125000084) (2025).

[^93]: Butryn, M. L. et al. Digital self-monitoring: Does adherence or association with outcomes differ by self-monitoring target? *Obes. Sci. Pract.* **6**, 126–133 (2020).

[Article](https://doi.org/10.1002%2Fosp4.391) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32313670) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Digital%20self-monitoring%3A%20Does%20adherence%20or%20association%20with%20outcomes%20differ%20by%20self-monitoring%20target%3F&journal=Obes.%20Sci.%20Pract.&doi=10.1002%2Fosp4.391&volume=6&pages=126-133&publication_year=2020&author=Butryn%2CML)

[^94]: Payne, J. E., Turk, M. T., Kalarchian, M. A. & Pellegrini, C. A. Defining adherence to dietary self-monitoring using a mobile app: a narrative review. *J. Acad. Nutr. Dietetics* **118**, 2094–2119 (2018).

[Article](https://doi.org/10.1016%2Fj.jand.2018.05.011) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Defining%20adherence%20to%20dietary%20self-monitoring%20using%20a%20mobile%20app%3A%20a%20narrative%20review&journal=J.%20Acad.%20Nutr.%20Dietetics&doi=10.1016%2Fj.jand.2018.05.011&volume=118&pages=2094-2119&publication_year=2018&author=Payne%2CJE&author=Turk%2CMT&author=Kalarchian%2CMA&author=Pellegrini%2CCA)

[^95]: Wei, R. et al. Descriptive systematic review and meta-analysis of adherence to randomized dietary intervention weight loss trials. *Curr. Dev. Nutr.* **8**, 103518–103518 (2024).

[Article](https://doi.org/10.1016%2Fj.cdnut.2024.103518) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Descriptive%20systematic%20review%20and%20meta-analysis%20of%20adherence%20to%20randomized%20dietary%20intervention%20weight%20loss%20trials&journal=Curr.%20Dev.%20Nutr.&doi=10.1016%2Fj.cdnut.2024.103518&volume=8&pages=103518-103518&publication_year=2024&author=Wei%2CR)

[^96]: All of Us Research, P. How are you gathering and curating information from electronic health records? (NIH, 2024).

[^97]: Quast, C. et al. The SILVA ribosomal RNA gene database project: improved data processing and web-based tools. *Nucleic Acids Res.* **41**, D590–D596 (2012).

[Article](https://doi.org/10.1093%2Fnar%2Fgks1219) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=23193283) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3531112) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20SILVA%20ribosomal%20RNA%20gene%20database%20project%3A%20improved%20data%20processing%20and%20web-based%20tools&journal=Nucleic%20Acids%20Res.&doi=10.1093%2Fnar%2Fgks1219&volume=41&pages=D590-D596&publication_year=2012&author=Quast%2CC)

[^98]: Zhu, Q. et al. Phylogenomics of 10,575 genomes reveals evolutionary proximity between domains Bacteria and Archaea. *Nat. Commun.* **10**, 5477 (2019).

[Article](https://doi.org/10.1038%2Fs41467-019-13443-4) [ADS](http://adsabs.harvard.edu/cgi-bin/nph-data_query?link_type=ABSTRACT&bibcode=2019NatCo..10.5477Z) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BC1MXitlWktb3O) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=31792218) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC6889312) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Phylogenomics%20of%2010%2C575%20genomes%20reveals%20evolutionary%20proximity%20between%20domains%20Bacteria%20and%20Archaea&journal=Nat.%20Commun.&doi=10.1038%2Fs41467-019-13443-4&volume=10&publication_year=2019&author=Zhu%2CQ)

[^99]: Parks, D. H. et al. A complete domain-to-species taxonomy for Bacteria and Archaea. *Nat. Biotechnol.* **38**, 1079–1086 (2020).

[Article](https://doi.org/10.1038%2Fs41587-020-0501-8) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB3cXotVCisro%3D) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32341564) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=A%20complete%20domain-to-species%20taxonomy%20for%20Bacteria%20and%20Archaea&journal=Nat.%20Biotechnol.&doi=10.1038%2Fs41587-020-0501-8&volume=38&pages=1079-1086&publication_year=2020&author=Parks%2CDH)

[^100]: Lu, M. et al. In *Proc. IEEE/CVF Conference on Computer Vision and Pattern Recognition*. 10917-10927.

[^101]: Cernava, T. et al. Metadata harmonization-Standards are the key for a better usage of omics data for integrative microbiome analysis. *Environ. Microbiome* **17**, 33 (2022).

[Article](https://link.springer.com/doi/10.1186/s40793-022-00425-1) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35751093) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9233336) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Metadata%20harmonization-Standards%20are%20the%20key%20for%20a%20better%20usage%20of%20omics%20data%20for%20integrative%20microbiome%20analysis&journal=Environ.%20Microbiome&doi=10.1186%2Fs40793-022-00425-1&volume=17&publication_year=2022&author=Cernava%2CT)

[^102]: Jaegle, A. Perceiver IO: a general architecture for structured inputs & outputs. *arXiv preprint* (2021).

[^103]: Jaegle, A., Gimeno, F., Brock, A., Vinyals, O., Zisserman, A. & Carreira, J. 4651-4664.

[^104]: Zhang, Y. et al. Meta-transformer: a unified framework for multimodal learning. *arXiv preprint arXiv:2307.10802* (2023).

[^105]: Huang, X., Khetan, A., Cvitkovic, M. & Karnin, Z. TabTransformer: tabular data modeling using contextual embeddings. *Proc. AAAI Conf. Artif. Intell.* **35**, 6353–6361 (2021).

[Google Scholar](http://scholar.google.com/scholar_lookup?&title=TabTransformer%3A%20tabular%20data%20modeling%20using%20contextual%20embeddings&journal=Proc.%20AAAI%20Conf.%20Artif.%20Intell.&volume=35&pages=6353-6361&publication_year=2021&author=Huang%2CX&author=Khetan%2CA&author=Cvitkovic%2CM&author=Karnin%2CZ)

[^106]: Poli, M. et al. In *International Conference on Machine Learning*. 28043-28078 (PMLR).

[^107]: Ahmed, E. et al. Prottrans: towards cracking the language of life’s code through self-supervised deep learning and high performance computing. *arXiv preprint arXiv:2007.06225* (2020).

[^108]: Rasmy, L. et al. Med-BERT: pretrained contextualized embeddings on large-scale structured electronic health records for disease prediction. *npj Digit. Med.* **4**, 86 (2021).

[Article](https://doi.org/10.1038%2Fs41746-021-00455-y) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=34017034) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC8137882) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Med-BERT%3A%20pretrained%20contextualized%20embeddings%20on%20large-scale%20structured%20electronic%20health%20records%20for%20disease%20prediction&journal=npj%20Digit.%20Med.&doi=10.1038%2Fs41746-021-00455-y&volume=4&publication_year=2021&author=Rasmy%2CL)

[^109]: Li, Y. et al. BEHRT: transformer for electronic health records. *Sci. Rep.* **10**, 7155 (2020).

[Article](https://doi.org/10.1038%2Fs41598-020-62922-y) [ADS](http://adsabs.harvard.edu/cgi-bin/nph-data_query?link_type=ABSTRACT&bibcode=2020NatSR..10.7155L) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB3cXosVOgu78%3D) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=32346050) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7189231) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=BEHRT%3A%20transformer%20for%20electronic%20health%20records&journal=Sci.%20Rep.&doi=10.1038%2Fs41598-020-62922-y&volume=10&publication_year=2020&author=Li%2CY)

[^110]: Yang, X. et al. A large language model for electronic health records. *npj Digit. Med.* **5**, 194 (2022).

[Article](https://doi.org/10.1038%2Fs41746-022-00742-2) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=36572766) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9792464) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=A%20large%20language%20model%20for%20electronic%20health%20records&journal=npj%20Digit.%20Med.&doi=10.1038%2Fs41746-022-00742-2&volume=5&publication_year=2022&author=Yang%2CX)

[^111]: Xu, P., Zhu, X. & Clifton, D. A. Multimodal learning with transformers: a survey. *arXiv preprint arXiv:2206.06488* (2022).

[^112]: Radford, A. et al. In *International Conference on Machine Learning*. 8748-8763 (PmLR).

[^113]: Zhang, L. OmicsGAT: graph attention network for multi-omics data integration and cancer subtype classification. *Brief. Bioinforma.* **24**, bbad007 (2023).

[Google Scholar](http://scholar.google.com/scholar_lookup?&title=OmicsGAT%3A%20graph%20attention%20network%20for%20multi-omics%20data%20integration%20and%20cancer%20subtype%20classification&journal=Brief.%20Bioinforma.&volume=24&publication_year=2023&author=Zhang%2CL)

[^114]: Hastie, T., Tibshirani, R., Friedman, J. H. & Friedman, J. H. *The Elements of Statistical Learning: Data Mining, Inference, and Prediction*. Vol. 2 (Springer, 2009).

[^115]: Gibson, R. S., Charrondiere, U. R. & Bell, W. Measurement errors in dietary assessment using self-reported 24-hour recalls in low-income countries and strategies for their prevention. *Adv. Nutr.* **8**, 980–991 (2017).

[Article](https://doi.org/10.3945%2Fan.117.016980) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=29141979) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC5683000) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Measurement%20errors%20in%20dietary%20assessment%20using%20self-reported%2024-hour%20recalls%20in%20low-income%20countries%20and%20strategies%20for%20their%20prevention&journal=Adv.%20Nutr.&doi=10.3945%2Fan.117.016980&volume=8&pages=980-991&publication_year=2017&author=Gibson%2CRS&author=Charrondiere%2CUR&author=Bell%2CW)

[^116]: Massara, P. et al. New approaches and technical considerations in detecting outlier measurements and trajectories in longitudinal children growth data. *BMC Med. Res. Methodol.* **23**, 232 (2023).

[Article](https://link.springer.com/doi/10.1186/s12874-023-02045-w) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=37833647) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10576311) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=New%20approaches%20and%20technical%20considerations%20in%20detecting%20outlier%20measurements%20and%20trajectories%20in%20longitudinal%20children%20growth%20data&journal=BMC%20Med.%20Res.%20Methodol.&doi=10.1186%2Fs12874-023-02045-w&volume=23&publication_year=2023&author=Massara%2CP)

[^117]: Bolyen, E. et al. Reproducible, interactive, scalable and extensible microbiome data science using QIIME 2. *Nat. Biotechnol.* **37**, 852–857 (2019).

[Article](https://doi.org/10.1038%2Fs41587-019-0209-9) [ADS](http://adsabs.harvard.edu/cgi-bin/nph-data_query?link_type=ABSTRACT&bibcode=2019NatBi..37..852B) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BC1MXhsVeksr%2FO) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=31341288) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC7015180) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Reproducible%2C%20interactive%2C%20scalable%20and%20extensible%20microbiome%20data%20science%20using%20QIIME%202&journal=Nat.%20Biotechnol.&doi=10.1038%2Fs41587-019-0209-9&volume=37&pages=852-857&publication_year=2019&author=Bolyen%2CE)

[^118]: World Health Organization. *WHO child growth standards: length/height-for-age, weight-for-age, weight-for-length, weight-for-height and body mass index-for-age: methods and development*. (World Health Organization, 2006).

[^119]: National Cancer, I. Learn More about Outliers. *Dietary Assessment Primer*

[^120]: Sangra, R. A. & Farran Codina, A. The identification, impact and management of missing values and outlier data in nutritional epidemiology. *Nutrición Hospitalaria* **31**, 189–195 (2015).

[Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20identification%2C%20impact%20and%20management%20of%20missing%20values%20and%20outlier%20data%20in%20nutritional%20epidemiology&journal=Nutrici%C3%B3n%20Hospitalaria&volume=31&pages=189-195&publication_year=2015&author=Sangra%2CRA&author=Farran%20Codina%2CA)

[^121]: Ichikawa, M. et al. Handling missing data in an FFQ: multiple imputation and nutrient intake estimates. *Public Health Nutr.* **22**, 1351–1360 (2019).

[Article](https://doi.org/10.1017%2FS1368980019000168) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=30803461) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC10260937) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Handling%20missing%20data%20in%20an%20FFQ%3A%20multiple%20imputation%20and%20nutrient%20intake%20estimates&journal=Public%20Health%20Nutr.&doi=10.1017%2FS1368980019000168&volume=22&pages=1351-1360&publication_year=2019&author=Ichikawa%2CM)

[^122]: Van Buuren, S. & Groothuis-Oudshoorn, K. Mice: multivariate imputation by chained equations in R. *J. Stat. Softw.* **45**, 1–67 (2011).

[Article](https://doi.org/10.18637%2Fjss.v045.i03) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Mice%3A%20multivariate%20imputation%20by%20chained%20equations%20in%20R&journal=J.%20Stat.%20Softw.&doi=10.18637%2Fjss.v045.i03&volume=45&pages=1-67&publication_year=2011&author=Buuren%2CS&author=Groothuis-Oudshoorn%2CK)

[^123]: Ribeiro, M. T., Singh, S. & Guestrin, C. in *Proc. 22nd ACM SIGKDD international conference on knowledge discovery and data mining*. 1135-1144.

[^124]: Collins, G. S. et al. TRIPOD+ AI statement: updated guidance for reporting clinical prediction models that use regression or machine learning methods. *BMJ* **385**, q902 (2024).

[^125]: Heil, B. J. et al. Reproducibility standards for machine learning in the life sciences. *Nat. Methods* **18**, 1132–1135 (2021).

[Article](https://doi.org/10.1038%2Fs41592-021-01256-7) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB3MXhvFWqtLnO) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=34462593) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9131851) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Reproducibility%20standards%20for%20machine%20learning%20in%20the%20life%20sciences&journal=Nat.%20Methods&doi=10.1038%2Fs41592-021-01256-7&volume=18&pages=1132-1135&publication_year=2021&author=Heil%2CBJ)

[^126]: Blakely, T., Lynch, J., Simons, K., Bentley, R. & Rose, S. Reflection on modern methods: when worlds collide—prediction, machine learning and causal inference. *Int. J. Epidemiol.* **49**, 2058–2064 (2020).

[Article](https://doi.org/10.1093%2Fije%2Fdyz132) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Reflection%20on%20modern%20methods%3A%20when%20worlds%20collide%E2%80%94prediction%2C%20machine%20learning%20and%20causal%20inference&journal=Int.%20J.%20Epidemiol.&doi=10.1093%2Fije%2Fdyz132&volume=49&pages=2058-2064&publication_year=2020&author=Blakely%2CT&author=Lynch%2CJ&author=Simons%2CK&author=Bentley%2CR&author=Rose%2CS)

[^127]: Ramspek, C. L. et al. Prediction or causality? A scoping review of their conflation within current observational research. *Eur. J. Epidemiol.* **36**, 889–898 (2021).

[Article](https://link.springer.com/doi/10.1007/s10654-021-00794-w) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=34392488) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC8502741) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Prediction%20or%20causality%3F%20A%20scoping%20review%20of%20their%20conflation%20within%20current%20observational%20research&journal=Eur.%20J.%20Epidemiol.&doi=10.1007%2Fs10654-021-00794-w&volume=36&pages=889-898&publication_year=2021&author=Ramspek%2CCL)

[^128]: Pearl, J. *Causality: Models, Reasoning, and Inference*. (Cambridge University Press, 2009).

[^129]: Smith, G. D. & Ebrahim, S. Mendelian randomization’: can genetic epidemiology contribute to understanding environmental determinants of disease? *Int J. Epidemiol.* **32**, 1–22 (2003).

[Article](https://doi.org/10.1093%2Fije%2Fdyg070) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=12689998) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Mendelian%20randomization%E2%80%99%3A%20can%20genetic%20epidemiology%20contribute%20to%20understanding%20environmental%20determinants%20of%20disease%3F&journal=Int%20J.%20Epidemiol.&doi=10.1093%2Fije%2Fdyg070&volume=32&pages=1-22&publication_year=2003&author=Smith%2CGD&author=Ebrahim%2CS)

[^130]: Begashaw, G. B., Zewotir, T. & Fenta, H. M. A deep learning approach for classifying and predicting children’s nutritional status in Ethiopia using LSTM-FC neural networks. *BioData Min.* **18**, 11 (2025).

[Article](https://link.springer.com/doi/10.1186/s13040-025-00425-0) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39885567) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11783927) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=A%20deep%20learning%20approach%20for%20classifying%20and%20predicting%20children%E2%80%99s%20nutritional%20status%20in%20Ethiopia%20using%20LSTM-FC%20neural%20networks&journal=BioData%20Min.&doi=10.1186%2Fs13040-025-00425-0&volume=18&publication_year=2025&author=Begashaw%2CGB&author=Zewotir%2CT&author=Fenta%2CHM)

[^131]: Raguvaran, S., Anandamurugan, S. & Zubair Rahman, A. Harnessing LSTM classifier to suggest nutrition diet for cancer patients. *Intelligent Automation & Soft Computing* **35**, 028605 (2023).

[^132]: Khanna, N. et al. In *Proc. IEEE Global Conference on Signal and Information Processing.* 948–952 (GlobalSIP, 2017).

[^133]: Eicher-Miller, H. A. et al. Distance metrics optimized for clustering temporal dietary patterning among U.S. adults. *Appetite* **144**, 104451 (2020).

[Article](https://doi.org/10.1016%2Fj.appet.2019.104451) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=31521771) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Distance%20metrics%20optimized%20for%20clustering%20temporal%20dietary%20patterning%20among%20U.S.%20adults&journal=Appetite&doi=10.1016%2Fj.appet.2019.104451&volume=144&publication_year=2020&author=Eicher-Miller%2CHA)

[^134]: Soh, B. X. P., Vignes, M., Smith, N. W., von Hurst, P. R. & McNabb, W. C. Protein intake and protein quality patterns in new zealand vegan diets: an observational analysis using dynamic time warping. *Nutrients* **17**, 1806 (2025).

[Article](https://doi.org/10.3390%2Fnu17111806) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB2MXhtlKqtL3J) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40507075) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC12157289) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Protein%20intake%20and%20protein%20quality%20patterns%20in%20new%20zealand%20vegan%20diets%3A%20an%20observational%20analysis%20using%20dynamic%20time%20warping&journal=Nutrients&doi=10.3390%2Fnu17111806&volume=17&publication_year=2025&author=Soh%2CBXP&author=Vignes%2CM&author=Smith%2CNW&author=Hurst%2CPR&author=McNabb%2CWC)

[^135]: Haycock, P. C. et al. Best (but oft-forgotten) practices: the design, analysis, and interpretation of Mendelian randomization studies. *Am. J. Clin. Nutr.* **103**, 965–978 (2016).

[Article](https://doi.org/10.3945%2Fajcn.115.118216) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BC28Xht1WqsLrK) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=26961927) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4807699) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Best%20%28but%20oft-forgotten%29%20practices%3A%20the%20design%2C%20analysis%2C%20and%20interpretation%20of%20Mendelian%20randomization%20studies&journal=Am.%20J.%20Clin.%20Nutr.&doi=10.3945%2Fajcn.115.118216&volume=103&pages=965-978&publication_year=2016&author=Haycock%2CPC)

[^136]: Wade, K. H. et al. Applying Mendelian randomization to appraise causality in relationships between nutrition and cancer. *Cancer Causes Control* **33**, 631–652 (2022).

[PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=35274198) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9010389) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Applying%20Mendelian%20randomization%20to%20appraise%20causality%20in%20relationships%20between%20nutrition%20and%20cancer&journal=Cancer%20Causes%20Control&volume=33&pages=631-652&publication_year=2022&author=Wade%2CKH)

[^137]: Igelström, E. et al. Causal inference and effect estimation using observational data. *J. Epidemiol. Community Health* **76**, 960–966 (2022).

[Article](https://doi.org/10.1136%2Fjech-2022-219267) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC9554068) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Causal%20inference%20and%20effect%20estimation%20using%20observational%20data&journal=J.%20Epidemiol.%20Community%20Health&doi=10.1136%2Fjech-2022-219267&volume=76&pages=960-966&publication_year=2022&author=Igelstr%C3%B6m%2CE)

[^138]: Arkhangelsky, D. & Imbens, G. Causal models for longitudinal and panel data: a survey. *Econ. J.* **27**, C1–C61 (2024).

[MathSciNet](http://www.ams.org/mathscinet-getitem?mr=4811127) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Causal%20models%20for%20longitudinal%20and%20panel%20data%3A%20a%20survey&journal=Econ.%20J.&volume=27&pages=C1-C61&publication_year=2024&author=Arkhangelsky%2CD&author=Imbens%2CG)

[^139]: Grieves, M. & Vickers, J. Origin of the digital twin concept. *Fla. Inst. Technol.* **8**, 3–20 (2016).

[Google Scholar](http://scholar.google.com/scholar_lookup?&title=Origin%20of%20the%20digital%20twin%20concept&journal=Fla.%20Inst.%20Technol.&volume=8&pages=3-20&publication_year=2016&author=Grieves%2CM&author=Vickers%2CJ)

[^140]: Björnsson, B. et al. Digital twins to personalize medicine. *Genome Med.* **12**, 4 (2019).

[Article](https://link.springer.com/doi/10.1186/s13073-019-0701-3) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=31892363) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC6938608) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Digital%20twins%20to%20personalize%20medicine&journal=Genome%20Med.&doi=10.1186%2Fs13073-019-0701-3&volume=12&publication_year=2019&author=Bj%C3%B6rnsson%2CB)

[^141]: Auchincloss, A. H., Riolo, R. L., Brown, D. G., Cook, J. & Roux, A. V. D. An agent-based model of income inequalities in diet in the context of residential segregation. *Am. J. Prevent. Med.* **40**, 303–311 (2011).

[Article](https://doi.org/10.1016%2Fj.amepre.2010.10.033) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=An%20agent-based%20model%20of%20income%20inequalities%20in%20diet%20in%20the%20context%20of%20residential%20segregation&journal=Am.%20J.%20Prevent.%20Med.&doi=10.1016%2Fj.amepre.2010.10.033&volume=40&pages=303-311&publication_year=2011&author=Auchincloss%2CAH&author=Riolo%2CRL&author=Brown%2CDG&author=Cook%2CJ&author=Roux%2CAVD)

[^142]: Li, Y. et al. Assessing the role of access and price on the consumption of fruits and vegetables across New York City using agent-based modeling. *Prevent. Med.* **106**, 73–78 (2018).

[Article](https://doi.org/10.1016%2Fj.ypmed.2017.10.014) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Assessing%20the%20role%20of%20access%20and%20price%20on%20the%20consumption%20of%20fruits%20and%20vegetables%20across%20New%20York%20City%20using%20agent-based%20modeling&journal=Prevent.%20Med.&doi=10.1016%2Fj.ypmed.2017.10.014&volume=106&pages=73-78&publication_year=2018&author=Li%2CY)

[^143]: Holst, D., Moenck, K., Koch, J., Schmedemann, O. & Schüppstuhl, T. Transparent reporting of AI in systematic literature reviews: development of the PRISMA-trAIce checklist. *JMIR AI* **4**, e80247–e80247 (2025).

[Article](https://doi.org/10.2196%2F80247) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=41370833) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC12694947) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Transparent%20reporting%20of%20AI%20in%20systematic%20literature%20reviews%3A%20development%20of%20the%20PRISMA-trAIce%20checklist&journal=JMIR%20AI&doi=10.2196%2F80247&volume=4&pages=e80247-e80247&publication_year=2025&author=Holst%2CD&author=Moenck%2CK&author=Koch%2CJ&author=Schmedemann%2CO&author=Sch%C3%BCppstuhl%2CT)

[^144]: Lachat, C. et al. Strengthening the reporting of observational studies in epidemiology—nutritional epidemiology (STROBE-nut): an extension of the STROBE statement. *PLoS Med.* **13**, e1002036–e1002036 (2016).

[Article](https://doi.org/10.1371%2Fjournal.pmed.1002036) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=27270749) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4896435) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Strengthening%20the%20reporting%20of%20observational%20studies%20in%20epidemiology%E2%80%94nutritional%20epidemiology%20%28STROBE-nut%29%3A%20an%20extension%20of%20the%20STROBE%20statement&journal=PLoS%20Med.&doi=10.1371%2Fjournal.pmed.1002036&volume=13&pages=e1002036-e1002036&publication_year=2016&author=Lachat%2CC)

[^145]: Page, M. J. et al. The PRISMA 2020 statement: an updated guideline for reporting systematic reviews. *BMJ* **372**, n71–n71 (2021).

[Article](https://doi.org/10.1136%2Fbmj.n71) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=33782057) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC8005924) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20PRISMA%202020%20statement%3A%20an%20updated%20guideline%20for%20reporting%20systematic%20reviews&journal=BMJ&doi=10.1136%2Fbmj.n71&volume=372&pages=n71-n71&publication_year=2021&author=Page%2CMJ)

[^146]: von Elm, E. et al. The strengthening the reporting of observational studies in epidemiology (STROBE) statement: guidelines for reporting observational studies. *PLoS Med.* **4**, e296–e296 (2007).

[Article](https://doi.org/10.1371%2Fjournal.pmed.0040296) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20strengthening%20the%20reporting%20of%20observational%20studies%20in%20epidemiology%20%28STROBE%29%20statement%3A%20guidelines%20for%20reporting%20observational%20studies&journal=PLoS%20Med.&doi=10.1371%2Fjournal.pmed.0040296&volume=4&pages=e296-e296&publication_year=2007&author=Elm%2CE)

[^147]: Program, A. o. U. R. What to Expect During the Researcher Workbench Migration. All of Us Researcher Workbench User Support, 2024).

[^148]: Verily. Verily Accelerates Precision Health AI With NVIDIA. *Verily Perspectives* (Verily, 2025).

[^149]: Azimi, I., Qi, M., Wang, L., Rahmani, A. M. & Li, Y. Evaluation of LLMs accuracy and consistency in the registered dietitian exam through prompt engineering and knowledge retrieval. *Sci. Rep.* **15**, 1506 (2025).

[Article](https://doi.org/10.1038%2Fs41598-024-85003-w) [ADS](http://adsabs.harvard.edu/cgi-bin/nph-data_query?link_type=ABSTRACT&bibcode=2025NatSR..15.1506A) [CAS](https://www.nature.com/articles/cas-redirect/1:CAS:528:DC%2BB2MXhsVehsLg%3D) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39789057) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC11718202) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Evaluation%20of%20LLMs%20accuracy%20and%20consistency%20in%20the%20registered%20dietitian%20exam%20through%20prompt%20engineering%20and%20knowledge%20retrieval&journal=Sci.%20Rep.&doi=10.1038%2Fs41598-024-85003-w&volume=15&publication_year=2025&author=Azimi%2CI&author=Qi%2CM&author=Wang%2CL&author=Rahmani%2CAM&author=Li%2CY)

[^150]: Belkhouribchia, J. & Pen, J. J. Large language models in clinical nutrition: an overview of its applications, capabilities, limitations, and potential future prospects. *Front. Nutr.* **12**, 1635682 (2025).

[^151]: Ase, A., Borowicz, J., Rakocy, K. & Piekarska, B. Large Language models for real-world nutrition assessment: structured prompts, multi-model validation and expert oversight. *Nutrients* **18**, 23 (2025).

[Article](https://doi.org/10.3390%2Fnu18010023) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=41515141) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC12788131) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Large%20Language%20models%20for%20real-world%20nutrition%20assessment%3A%20structured%20prompts%2C%20multi-model%20validation%20and%20expert%20oversight&journal=Nutrients&doi=10.3390%2Fnu18010023&volume=18&publication_year=2025&author=Ase%2CA&author=Borowicz%2CJ&author=Rakocy%2CK&author=Piekarska%2CB)

[^152]: Parameswaran, V. et al. Evaluating large language models and retrieval-augmented generation enhancement for delivering guideline-adherent nutrition information for cardiovascular disease prevention: cross-sectional study. *J. Med. Internet Res*. **27**, e78625 (2025).

[^153]: Gavai, A. K. & van, H. J. AI-driven personalized nutrition: RAG-based digital health solution for obesity and type 2 diabetes. *PLoS Digit. Health* **4**, e0000758 (2025).

[Article](https://doi.org/10.1371%2Fjournal.pdig.0000758) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40327647) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC12054865) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=AI-driven%20personalized%20nutrition%3A%20RAG-based%20digital%20health%20solution%20for%20obesity%20and%20type%202%20diabetes&journal=PLoS%20Digit.%20Health&doi=10.1371%2Fjournal.pdig.0000758&volume=4&publication_year=2025&author=Gavai%2CAK&author=van%2CHJ)

[^154]: Zhou, P. et al. FoodSky: A food-oriented large language model that can pass the chef and dietetic examinations. *Patterns (N. Y)* **6**, 101234 (2025).

[Article](https://doi.org/10.1016%2Fj.patter.2025.101234) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=40486965) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC12142648) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=FoodSky%3A%20A%20food-oriented%20large%20language%20model%20that%20can%20pass%20the%20chef%20and%20dietetic%20examinations&journal=Patterns%20%28N.%20Y%29&doi=10.1016%2Fj.patter.2025.101234&volume=6&publication_year=2025&author=Zhou%2CP)

[^155]: Hua, A., Preet Dhaliwal, M., Burke, R. & Qin, Y. NutriBench: a dataset for evaluating large language models in carbohydrate estimation from meal descriptions. *arXiv e-prints*, arXiv: 2407.12843 (2024).

[^156]: Yang, Z. et al. ChatDiet: empowering personalized nutrition-oriented food recommender chatbots through an LLM-augmented framework. *Smart Health* **32**, 100465 (2024).

[Article](https://doi.org/10.1016%2Fj.smhl.2024.100465) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=ChatDiet%3A%20empowering%20personalized%20nutrition-oriented%20food%20recommender%20chatbots%20through%20an%20LLM-augmented%20framework&journal=Smart%20Health&doi=10.1016%2Fj.smhl.2024.100465&volume=32&publication_year=2024&author=Yang%2CZ)

[^157]: Tsampos, I. & Marakakis DietQA: a comprehensive framework for personalized multi-diet recipe retrieval using knowledge graphs, retrieval-augmented generation, and large language models. *Computers* **14**, 412 (2025).

[Article](https://doi.org/10.3390%2Fcomputers14100412) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=DietQA%3A%20a%20comprehensive%20framework%20for%20personalized%20multi-diet%20recipe%20retrieval%20using%20knowledge%20graphs%2C%20retrieval-augmented%20generation%2C%20and%20large%20language%20models&journal=Computers&doi=10.3390%2Fcomputers14100412&volume=14&publication_year=2025&author=Tsampos%2CI&author=Marakakis%2C)

[^158]: National Institutes of Health. (All of Us Research Program, 2023).

[^159]: All of Us Research Program, I. et al. The “All of Us” research program. *N. Engl. J. Med* **381**, 668–676 (2019).

[Article](https://doi.org/10.1056%2FNEJMsr1809937) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=The%20%E2%80%9CAll%20of%20Us%E2%80%9D%20research%20program&journal=N.%20Engl.%20J.%20Med&doi=10.1056%2FNEJMsr1809937&volume=381&pages=668-676&publication_year=2019&author=All%20of%20Us%20Research%20Program%2CI)

[^160]: Nagai, A. et al. Overview of the BioBank Japan project: study design and profile. *J. Epidemiol.* **27**, S2–S8 (2017).

[Article](https://doi.org/10.1016%2Fj.je.2016.12.005) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=28189464) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC5350590) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Overview%20of%20the%20BioBank%20Japan%20project%3A%20study%20design%20and%20profile&journal=J.%20Epidemiol.&doi=10.1016%2Fj.je.2016.12.005&volume=27&pages=S2-S8&publication_year=2017&author=Nagai%2CA)

[^161]: Tanaka, T., Nagata, Y. & Takemoto, A. Integrating biomedical and clinical data with BioBank Japan. *Nat. Cardiovasc. Res.* **1**, 597–598 (2022).

[Article](https://doi.org/10.1038%2Fs44161-022-00105-w) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39196245) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Integrating%20biomedical%20and%20clinical%20data%20with%20BioBank%20Japan&journal=Nat.%20Cardiovasc.%20Res.&doi=10.1038%2Fs44161-022-00105-w&volume=1&pages=597-598&publication_year=2022&author=Tanaka%2CT&author=Nagata%2CY&author=Takemoto%2CA)

[^162]: Biobank, C. K. *China Kadoorie Biobank: a prospective cohort of lifestyle, environmental, clinical, and genetic data for chronic disease research*, [https://www.ckbiobank.org/](https://www.ckbiobank.org/) (2026).

[^163]: Sauder, K. A. et al. Disparities in risks of inadequate and excessive intake of micronutrients during pregnancy. *J. Nutr.* **151**, 3555–3569 (2021).

[Article](https://doi.org/10.1093%2Fjn%2Fnxab273) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=34494118) [PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC8564697) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Disparities%20in%20risks%20of%20inadequate%20and%20excessive%20intake%20of%20micronutrients%20during%20pregnancy&journal=J.%20Nutr.&doi=10.1093%2Fjn%2Fnxab273&volume=151&pages=3555-3569&publication_year=2021&author=Sauder%2CKA)

[^164]: Institute for Health Metrics Evaluation. (Global Burden of Disease Study, 2023).

[^165]: G.BD. Risk Factors Collaborators. Global burden and strength of evidence for 88 risk factors in 204 countries and 811 subnational locations, 1990-2021: a systematic analysis for the Global Burden of Disease Study. *Lancet* **403**, 2162–2203 (2021).

[^166]: Gaziano, J. M. et al. Million Veteran Program: a mega-biobank to study genetic influences on health and disease. *J. Clin. Epidemiol.* **70**, 214–223 (2016).

[Article](https://doi.org/10.1016%2Fj.jclinepi.2015.09.016) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=26441289) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Million%20Veteran%20Program%3A%20a%20mega-biobank%20to%20study%20genetic%20influences%20on%20health%20and%20disease&journal=J.%20Clin.%20Epidemiol.&doi=10.1016%2Fj.jclinepi.2015.09.016&volume=70&pages=214-223&publication_year=2016&author=Gaziano%2CJM)

[^167]: Free, T. UK Biobank: what can it do, how you can use it and how is it being used? *BioTechniques* **76**, 553–557 (2024).

[Article](https://doi.org/10.1080%2F07366205.2024.2441639) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=39846123) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=UK%20Biobank%3A%20what%20can%20it%20do%2C%20how%20you%20can%20use%20it%20and%20how%20is%20it%20being%20used%3F&journal=BioTechniques&doi=10.1080%2F07366205.2024.2441639&volume=76&pages=553-557&publication_year=2024&author=Free%2CT)

[^168]: Tsai, Y.-H. H. et al. In *Proc. Conference Association for Computational Linguistics*. *Meeting*. 6558.

[^169]: Hochreiter, S. & Schmidhuber, J. Long short-term memory. *Neural Comput* **9**, 1735–1780 (1997).

[Article](https://doi.org/10.1162%2Fneco.1997.9.8.1735) [CAS](https://www.nature.com/articles/cas-redirect/1:STN:280:DyaK1c%2FhvVahsQ%3D%3D) [PubMed](http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=9377276) [Google Scholar](http://scholar.google.com/scholar_lookup?&title=Long%20short-term%20memory&journal=Neural%20Comput&doi=10.1162%2Fneco.1997.9.8.1735&volume=9&pages=1735-1780&publication_year=1997&author=Hochreiter%2CS&author=Schmidhuber%2CJ)

[^170]: Tsolakidis, D., Gymnopoulos, L. P. & Dimitropoulos, K. Artificial Intelligence and machine learning technologies for personalized nutrition: a review. *Informatics* **11**, 62 (2024).

[^171]: Jain, S. & Safo, S. E. DeepIDA-GRU: a deep learning pipeline for integrative discriminant analysis of cross-sectional and longitudinal multiview data with applications to inflammatory bowel disease classification. *Brief. Bioinform.* **25**, 339 (2024).