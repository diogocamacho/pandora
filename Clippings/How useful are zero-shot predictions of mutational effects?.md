---
title: "How useful are zero-shot predictions of mutational effects?"
source: "https://blog.genesmindsmachines.com/p/how-useful-are-zero-shot-predictions"
author:
  - "[[Claus Wilke]]"
published: 2026-07-13
created: 2026-09-28
description: "Zero-shot predictions are great, except for when it matters"
related:

tags:
  - "clippings"
  - "zero-shot-prediction"
  - "protein-fitness"
  - "protein-engineering"
  - "computational-biology"
  - "ml-limitations"
  - "benchmarking"
processed: true
idea-challenges:
  - "[[💡 Antimicrobial peptides]]"
ideas_checked: true
---
When you read papers about AI models for zero-shot fitness predictions,[^1] you generally get the sense that these predictions work quite well. Correlations between measured fitness effects and zero-shot predictions tend to be high. Systematic benchmarks have repeatedly shown this pattern, across hundred of datasets and many different models.[^2] And yet, when you talk to an actual protein engineer, somebody who is trying to improve proteins by making specific mutations, they will often tell you that zero-shot predictions are not that useful. Many protein engineers have stories of taking the best available zero-shot model, the one that wins all the competitions, predicting mutations for their pet protein, making the mutations, and then not seeing much improvement in their system. Something doesn’t add up.

![](https://substackcdn.com/image/fetch/$s_!R03W!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F6a5d5a09-d3b7-418e-aaf4-c96a65ac8087_1574x1210.png)

Figure 1. Zero-shot predictions cannot simultaneously represent multiple dimensions of a protein’s fitness landscape. A mutation that increases stability may decrease fitness and vice versa. Zero-shot prediction cannot capture these conflicting constraints. Illustration by Aaron Feller. From Woolley et al. 2026.

In a recent preprint from my lab ([Woolley et al. 2026](https://www.biorxiv.org/content/10.64898/2026.06.04.730121)), we provide a potential explanation. Most importantly, zero-shot predictions have a conceptual limitation that I don’t commonly see acknowledged: Zero-shot predictions cannot simultaneously capture multiple dimensions of a protein’s fitness landscape (Figure 1). By definition, a zero-shot prediction is a single prediction (“make this mutation at this site”), regardless of the phenotype of interest. But what if a mutation improves one phenotype and worsens another? For example, a mutation could increase enzymatic activity and decrease stability. Such a mutation might be exactly what you need if you’re interested in increasing enzymatic activity, but it would be counterproductive if you’re instead interested in increasing stability. Zero-shot predictions do not know what you’re interested in. They just make a guess and hope it’s right. And often it’s not.

I want to emphasize that this limitation of zero-shot predictions is fundamental. It applies to any possible model. Often in machine learning and AI, when model predictions aren’t good enough, we immediately blame the model. “Predictions from this model aren’t that great,” we may say, “but surely we can train a better model that will have the performance we need.” In fact, this reasoning is one of the motivators for large-scale benchmarking projects such as the [ProteinGym.](https://proteingym.org/) If poor performance was primarily due to models being bad, then it’d makes sense to benchmark all the available models and try to find the best one. Unfortunately, when you’re dealing with a fundamental limitation that equally applies to all models, even the best ones won’t be that great. And in fact, we have found that the available models all perform roughly equally well, and that there is more variation among datasets within models than there is between models ([Woolley et al. 2026](https://www.biorxiv.org/content/10.64898/2026.06.04.730121)). In other words, whether a zero-shot model works well with your specific system of interest is mostly due to chance. It may work great, or it may not work at all. It’s difficult to predict what the result will be.

But zero-shot predictions do predict something. So what is it that they predict, and why is it that performance in large-scale benchmarks seems to be quite good? At their core, all zero-shot methods work the same way, regardless of the specific model architecture and training data used. These models are trained on a large corpus of available protein data—either protein sequences or protein structures or both—and then make predictions that are consistent with this corpus of training data. Since the vast majority of sequences or structures in the training data represent extant, viable proteins, these models have therefore learned the universe of naturally occurring, viable proteins. They can predict whether a specific mutation is likely going to lead to a viable protein or not. But they cannot typically predict a mutation’s effect on a specific function.

If zero-shot predictions primarily capture viability, we would expect this to be reflected in large-scale benchmarks. And indeed this is the case. Correlations between fitness and zero-shot predictions are consistently higher when considering both fit and unfit mutations than when only considering the highly fit mutations. (See Figure 2 for an example; in our analysis we verified this pattern across over 200 different datasets.) In other words, zero-shot predictions can separate fit from unfit mutations, but they cannot differentiate among the fit mutations. This explains why overall performance in large-scale benchmarks looks good. Across millions of mutations, the models are doing quite well, because the datasets contain both viable and non-viable mutations in roughly equal proportions. This balance leads to decent correlation coefficients between prediction and measurement.

![](https://substackcdn.com/image/fetch/$s_!Rr-q!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5133a901-a4d4-41cd-a5fc-41df258ad60a_972x872.png)

Figure 2. Variant activity versus fitness predictions (log-odds) made by the model ESM3-hybrid, for cytochrome P450. The correlation between the predicted and measured fitness is decent overall but not among the highly fit mutants. From Woolley et al. 2026.

But when analyzing specifically function-enhancing mutations, in particular in “new-to-nature” engineering experiments where proteins are engineered to perform a function they don’t perform naturally, we found that zero-shot predictions were systematically uncorrelated (or even weakly anti-correlated) with the measured effects of the mutations. Zero-shot predictions were not able to identify mutations that would increase function, in particular when the function of interest was something new that would not have been observed in natural sequences.

In summary, zero-shot predictions capture protein viability, but they are rarely useful to identify function-enhancing mutations. This is a generic property of the zero-shot approach, and it applies broadly across different models and model architectures. Model performance in large-scale benchmarks appears to be good because benchmarks assess aggregate performance across millions of mutations, and mutant viability is the primary source of variation across these large-scale datasets. Zero-shot predictions can be useful, in particular to screen out strongly deleterious mutations, but they will rarely point towards increased function in targeted protein-engineering campaigns.

Read the complete study here:  
Phillip R. Woolley, Aaron L. Feller, Andrew D. Ellington, Claus O. Wilke (2026) Overestimating zero-shot fitness prediction: Broad benchmarks mask local failures and practical limitations. bioRxiv. [https://doi.org/10.64898/2026.06.04.730121](https://doi.org/10.64898/2026.06.04.730121)

### More from Genes, Minds, Machines

∙

[1 Restack](https://substack.com/note/p-206131112/restacks?utm_source=substack&utm_content=facepile-restacks)

[^1]: Zero-shot predictions are unsupervised predictions made without any prior knowledge about the system of interest. Say you’re trying to engineer an enzyme by introducing function-enhancing mutations. You can stick the enzyme into a protein language model such as ESM-C or a structural model such as ProteinMPNN and generate predictions for mutations without knowing anything about how exactly the enzyme works or having any prior data. This is opposed to supervised predictions, where you have a set of mutants with measured activity and you use that data to train a model to make predictions about additional mutations.

[^2]: See for example the [ProteinGym project,](https://proteingym.org/) which provides systematic benchmarks for many different models.
## Related notes

## Connected ideas

## Growing ideas
- ⚡ [[💡 Antimicrobial peptides]] — Woolley et al. show zero-shot protein models fail specifically for new-to-nature function-enhancing mutations — exactly what peptide therapeutic design requires.
