---
title: "Protein language models are overly constrained by covariation"
source: "https://blog.genesmindsmachines.com/p/protein-language-models-are-overly?utm_source=post-email-title&publication_id=5419410&post_id=208887911&utm_campaign=email-post-title&isFreemail=true&r=2uxm8r&triedRedirect=true&utm_medium=email"
author:
  - "[[Claus Wilke]]"
published: 2026-08-12
created: 2026-09-28
description: "Why good performance on one set of goals can lead to poor performance on another"
tags:
  - "clippings"
---
By many measures, protein language models (pLMs) perform exceptionally well at various tasks in protein research. They are great for homology search, functional classification, and even contact prediction. They can also be useful in evaluating individual mutations, though the track record here is more mixed. While pLMs appear to be excellent at separating viable from inviable mutations, they are quite bad at [predicting mutations that enable or improve novel function.](https://blog.genesmindsmachines.com/p/how-useful-are-zero-shot-predictions) A new paper by Berry et al.[^1] offers an explanation for this observation, and it’s not at all what I would have expected. The explanation is that pLMs are too constrained by covariation, and therefore they tend to reject mutations that don’t fit exactly into the surrounding sequence context (Figure 1). And yet, such mutations may be exactly the ones required for novel function. Surprisingly, mixing in information from much simpler models that ignore covariation and basically just count amino-acid frequencies at different sites improves predictions dramatically.

![](https://substackcdn.com/image/fetch/$s_!sIya!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F30de0dd4-2214-4d44-89ac-882d2c5a0f5d_1460x1314.png)

Figure 1. Context-free and context-aware models score mutations differently. (A) The possible mutations at a site are constrained by sequence context. Certain mutations are more or less likely depending on what the rest of the protein looks like. This effect is also called “epistasis.” (B) A context-free model ignores these constraints and simply records variation at individual sites. It will rank highly any mutations that occur frequently at a site, regardless of context. (C) By contrast, a context-aware model penalizes mutations that conflict with other parts of the sequence. As a result, a mutation frequently seen at a given site in the protein can nevertheless get a low score for certain contexts. Note that pLMs are context-aware models. The schematic drawing was modified from Figure 6 of Berry et al. I changed some of the text labels for clarity. Modified labels are shown in dark red.

By performing a systematic benchmarking study, Berry et al. find that pLMs consistently do poorly in identifying mutations that enable or increase novel function. [My own lab had recently made a similar observation,](https://blog.genesmindsmachines.com/p/how-useful-are-zero-shot-predictions) so this part of the study was not that surprising to me. What comes next is more important, however. Berry et al. show that an alternative model performs much better. What is the alternative model? It is a position-specific scoring matrix (a PSSM, this is basically just site-wise amino-acid frequencies in a multiple sequence alignment) minus a pLM. So, to find variants that generate or improve novel function, we need to look for mutations that are common in multiple sequence alignments, and then among those pick the ones that the pLM thinks are bad. Yes, bad. The pLM score is *subtracted,* so a high score from the pLM means the mutation is *not* a good candidate for further exploration.[^2] This is exactly the opposite of what everybody else in the field has done to date.

One of the most impressive examples provided by Berry et al. is the case of DraNramp, a protein used by bacteria for manganese (Mn <sup>2+</sup>) and iron (Fe <sup>2+</sup>) uptake. In nature, the protein does not transport magnesium (Mg <sup>2+</sup>), but many laboratory variants are known that can perform this function. So, how well do pLMs such as ESM-1v do at predicting variants that enable magnesium uptake? Terribly. Nearly all of the proposed variants excel at importing manganese, and none can import magnesium (Figure 2A). But, when Berry et al. use scores from the PSSM minus the pLM, they recover many variants that are quite good at magnesium uptake (Figure 2B). The pLM likes to maintain the current function, whereas the PSSM is able to explore new functions.

![](https://substackcdn.com/image/fetch/$s_!fm4M!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff42490fe-a21d-48c2-8588-a5b3ff6ed1fb_1326x728.png)

Figure 2. Protein language models alone perform poorly in predicting novel function (Mg2+ import) in the protein DraNramp. (A) Mutational variants scored highly by a pLM (ESM-1v), shown in green, do not enable Mg 2+ import. The gray dots represent all variants with measured data. Taken from Figure 4C of Berry et al. (B) By contrast, some of the mutational variants scored highly by the difference between a PSSM and a pLM, shown in purple, do enable Mg import. Taken from Figure 5F of Note that the y axis of panel A was accidentally mislabeled (Sam Berry, personal communication). Ignore the labeling.

What is going on here reminds me of the old Jesse Bloom work showing that function-enhancing mutations are often destabilizing to the protein, and therefore more stable proteins are better starting points for the discovery of beneficial mutations.[^3] Mutations proposed by pLMs are in effect mutations that predominantly maintain or increase protein stability. They fit perfectly into the provided sequence context. The flip-side of this constraint is that they are unlikely to lead to functional improvements. By contrast, the context-free, site-wise models simply propose mutations that are common; because these mutations were chosen without considering sequence context they may decrease proteins stability or otherwise mess things up. But this messing things up may be exactly what we need when we’re looking for new or improved function.

One aspect of the paper that I find unnecessarily confusing is that it conflates sequence context with function. Their Figure 6 [^4] suggests that in natural sequences, we see different sequence contexts because they correspond to different functions.[^5] Consequently, to sample mutations that enable these various functions, we need to somehow break out of the sequence context, and a context-free model does exactly that. The problem that I have with this explanation is that new-to-nature functions cannot be found among any of the natural sequences, by definition. And yet, the natural sequences may well contain mutations that, in the right context, can provide new-to-nature function. The DraNramp example highlights this possibility. Natural DraNramp variants cannot perform magnesium import.[^6] And yet, they contain mutations that, in the right context, can import magnesium.

In fact, we don’t need to assume different functions in natural sequences. We just need different sequence contexts, which arise for example because of covariation among sites that are in physical contact in the folded protein. We know that contacts create strong evolutionary constraints among sites, visible in covariation in multiple sequence alignments. These constraints are so strong that covariation can be used to identify physical contacts from multiple-sequence alignments. And pLMs have learned this covariation, which we can tell from the fact that we can also use them to infer contacts.[^7] In other words, pLMs are great at taking into account sequence context. They are literally trained to fill in the blanks given the surrounding context.[^8] Combine this with reasoning along the lines of Bloom et al., and we should not be surprised that pLMs have a tendency to propose the most conservative, stabilizing, function-preserving mutations, and this tendency goes exactly opposite to what we want when we’re looking for novel function.

Were does all of this leave us? First, the method proposed by Berry et al. is simple to implement. Anybody can use it. So that’s great, we have a new arrow in our quiver. Second, we’ve still only scratched the surface with respect to understanding what pLMs are actually good for. I have no doubt that they are an amazing tool that will have profound implications for the future of protein science. However, this does not mean that these models are currently used appropriately. Clearly, zero-shot predictions from pLMs are not that useful, in particular not if the goal is to find variants that provide novel function. But other pLM applications are totally legit, such as homology search or contact prediction. I’m looking forward to discovering more about how these models work.

### More from Genes, Minds, Machines

∙

[2 Restacks](https://substack.com/note/p-208887911/restacks?utm_source=substack&utm_content=facepile-restacks)

[^1]: S. P. Berry, R. Gaudet, D. S. Marks (2026). Differences between protein fitness models can be used to design variants of altered specificity. bioRxiv. [doi:10.64898/2026.06.10.731299](https://doi.org/10.64898/2026.06.10.731299)

[^2]: The paper does not actually specify the direction of the difference. It just states that the best-performing models consider the difference between the PSSM and the pLM. However, I contacted the authors and asked, and they confirmed to me that the PSSM contributes positively and the pLM negatively.

[^3]: See [Bloom et al., PNAS 2006.](https://doi.org/10.1073/pnas.0510098103)

[^4]: Reproduced here as Figure 1, but relabeled to remove the confusion.

[^5]: Berry et al. call them “substrates” in their paper.

[^6]: According to Sam Berry, there are natural DraNramp homologs that can import magnesium. So this example may not be entirely correct. However, he notes that the argument I make can be correct for other proteins, such as TEM-1. See his response in the comments.

[^7]: See [Zhang et al., PNAS 2024.](https://doi.org/10.1073/pnas.2406285121)

[^8]: This is the standard pretraining objective of masked language modeling, where we mask parts of the sequence and train the model to predict what was masked. This training objective forces the model to pay attention to the sequence context and complete the masked parts accordingly.