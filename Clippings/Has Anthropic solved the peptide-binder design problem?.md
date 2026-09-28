---
title: "Has Anthropic solved the peptide-binder design problem?"
source: "https://blog.genesmindsmachines.com/p/has-anthropic-solved-the-peptide?utm_source=post-email-title&publication_id=5419410&post_id=212864796&utm_campaign=email-post-title&isFreemail=true&r=2uxm8r&triedRedirect=true&utm_medium=email"
author:
  - "[[Claus Wilke]]"
published: 2026-09-01
created: 2026-09-28
description: "A small step towards curing all of human disease within the next ten years"
related:
  - "[[2025-11-03 CMT targeting with mini binders]]"
  - "[[2025-11-04 Targeting CMT proteins]]"
  - "[[2026-09-24 Property prediction models]]"
  - "[[2025-10-20 Target ID]]"
  - "[[2025-10-07 Target ID for Abiologics]]"
  - "[[📃 Papers]]"
tags:
  - "clippings"
  - "protein-design"
  - "ai-drug-discovery"
  - "peptide-binders"
  - "computational-biology"
  - "llm-science"
processed: true
---
You know what they say about headlines that are yes/no questions. If the author felt confident the answer was yes he would have said so.[^1] With that out of the way, let’s talk about the recent claim by Anthropic and see what we can find out. Are we all going to use Claude for peptide-binder design going forward?

![](https://substackcdn.com/image/fetch/$s_!FuFK!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F6bd4ea0e-f595-48fb-900a-e0bcd67a1f5a_4866x3244.jpeg)

Photo by National Cancer Institute on Unsplash

To set the stage, let’s first discuss what happened. Anthropic used Claude Science to design a number of peptide binders against several targets. These designs where subsequently tested experimentally by the company Adaptyv. This company provides testing of binders as a service, and it is known for various binder-design competitions. They partnered with Anthropic to compare how well Claude did relative to human protein designers that participated in prior competitions. By all accounts, Claude did very well. Here are some of the key claims, taken from a [blog post published on the Adaptyv website:](https://www.adaptyvbio.com/blog/anthropic-1)

> 95% of the designs expressed, which three years ago would have been an impressive headline, showing the rapid progress of AI tools for protein design in recent years. This number matched the best expression rates of our EGFR competition which had hundreds of expert protein designers, and surpassed other challenges such as the RBX1 one. Out of these, 354 of all designs (1,320) bound their target, an overall hit rate of 26.8%, and the per-target hit-rates vary quite widely.

> When compared to our competitions, Claude surpasses all their hit rates, especially when looking at every single run for each target Anthropic submitted as in the plot above. For a fair comparison, we have subsetted each competition’s results to only include de novo minibinders. Claude achieved an 80% hit rate on TREM2, greatly improving over the 38.3% [we reported in our competition](https://www.adaptyvbio.com/blog/agents-vs-humans), and even on trickier targets such as 15-PGDH, it has a success rate more than 3-fold higher than [observed on Proteinbase](https://proteinbase.com/collections/berlin-bio-x-adaptyv-15-pgdh-binder-design-competition).

In addition to the [Adaptyv blog post,](https://www.adaptyvbio.com/blog/anthropic-1) we also have access to a [blog post by Anthropic,](https://www.anthropic.com/research/Claude-accelerates-protein-design) a detailed [technical report,](https://www-cdn.anthropic.com/30bf50e22a01388bb29bf077ee3f244531594b7a.pdf) and a [repository with prompts and data.](https://huggingface.co/datasets/Anthropic/claude-protein-binder-design/tree/main) This effort seems to be pretty well documented. And yet I don’t fully understand what exactly Claude did. The prompts folder in the repository contains a file that is over a gigabyte in size. Who knows what is all in there. There is a [plain-text prompt file](https://huggingface.co/datasets/Anthropic/claude-protein-binder-design/blob/main/prompts/prompts/multi_target_binder_design_prompt.md) that is 16,000 words of detailed instructions on how to do protein design. This is an amount of material comparable to a PhD thesis on the topic. A competent protein-design expert put all of this together to help Claude along.

Since Claude apparently did better than human protein designers, I’d like to know what exactly enabled Claude’s success. I have a simple principle for evaluating claims of major advances: Can I find a brief explanation, 2–3 sentences, of what the core new idea is that enabled the advance? What exactly is different in this new approach compared to what we have done previously, and how does it lead to better results? Absent such an explanation, I tend to be skeptical, as people are great at confusing themselves. And AI in particular is exceptionally great at finding loopholes, workarounds, or otherwise arriving at a solution without actually doing what we thought the problem statement required.

If I understand correctly, Claude ran existing protein design tools, such as RFdiffusion, ProteinMPNN, ESMFold, Boltzgen, etc. It did not bring anything new to the table in terms of better folding models, better energy functions, or better generative algorithms. So how could it possibly do better than a human expert using those same tools?

There are some possibilities. First, maybe Anthropic threw more compute at the problem than other groups do. There’s a relationship in protein design between the amount of compute spent and the quality of the results obtained. Design is fundamentally a search problem, and if you search longer you’ll get better solutions.[^2] It looks like Anthropic allocated [2,500 H100 GPU hours per design,](https://www.anthropic.com/research/Claude-accelerates-protein-design) which is a lot but also not outrageous. You can buy this amount of compute for about $7,000–$10,000 on the open market (~$3 per one H100 GPU hour).[^3] For comparison, the recent ESM C paper used 1,500–2500 H100 GPU hours per design,[^4] and I would estimate most of the leading groups use similar amounts. So compute is not the difference.

Second, it is possible that the field has simply moved forward. New methods for peptide-binder design are released every few months. Maybe Claude took advantage of some tools that either weren’t available when the previous competitions were held or at least weren’t widely used. For example, [Claude used FreeBindCraft](https://www.linkedin.com/posts/brian-weitzner_amir-s-at-anthropic-had-claude-run-de-novo-share-7495922821311770624-I8Ig/?utm_source=share&utm_medium=member_desktop&rcm=ACoAAAEwmR0B3bPZ_dafkvAjeVKucZo795iZwZg) instead of the regular, highly popular BindCraft, and maybe that version is a bit better. For sure [its website claims it’s faster.](https://www.ariax.bio/resources/freebindcraft-open-source-unleashed)

Third, all the targets are widely known and have been used in various binder-design competitions. Maybe Claude scanned the literature and found for each target the specific tool and/or parameter settings that performed best in prior design efforts. Or maybe Claude filtered its own designs on the basis of similarity to known successful designs.[^5] Alternatively, it is possible that Claude scanned the existing literature and discovered the overall best current design pipeline and used that consistently.[^6]

Fourth, there may be a component of luck or survivorship bias. Claude made some choices about what tools to run and with what settings and some of those choices may simply have been lucky. If Claude’s design attempts hadn’t been successful we wouldn’t be talking about them.

It is important to emphasize what Claude has not done. It has not done any actual science that moves the protein-design field forward. For example, it has not tried different binder-design platforms to figure out which has the highest success rate in subsequent experimental testing. It has not tweaked design parameters and synthesized the resulting peptides to figure out which parameters lead to toxic peptides and which do not. All it has done is one-shotting the solution. Press the button, Claude spins up a few GPUs, and out come some novel peptide binders that somehow work. This is great, but Claude has not actually learned anything new about binder design. It could not, by construction.[^7] Whatever it has done was already present in the literature it processed as part of its “reasoning” process.

Now, on the flip side, I want to highlight that there is some value in having Claude run protein-design tools. Figuring out these tools and getting them to run is not a trivial task. It takes a lot of experience, and also it’s not fun to fiddle with python environments, CUDA incompatibilities, outdated dependencies, and so on, just to install all the latest methods. If Claude can sort this out on its own that sounds appealing to me. Now I suspect that an experienced protein designer will still prefer to run the tools manually, if only to have complete control, to be able to tweak things, and to know exactly which methods are used and how. But, I can see plenty of use cases where outsourcing this to Claude may be worthwhile. In [this LinkedIn post,](https://www.linkedin.com/posts/brian-weitzner_amir-s-at-anthropic-had-claude-run-de-novo-share-7495922821311770624-I8Ig/?utm_source=share&utm_medium=member_desktop&rcm=ACoAAAEwmR0B3bPZ_dafkvAjeVKucZo795iZwZg) Brian Weitzner estimates there are fewer than 1000 people total that can do this kind of work. Many companies with protein-design needs may not be able to hire one of these people, and in particular not one of the much rarer experts who truly understand how things work and who are moving the field forward. If companies can instead throw some money at Claude to get useful designs, that may be a solution that works for them.

And, for no good reason, I’ll close by pointing out that no angry teenager will use Claude to design novel peptide binders, because no teenager has $50k–$100k lying around to pay for the required GPU time.

**Update:** Apparently what gave Claude the edge was access to ESMFold2, which has only recently been released and is not yet widely used. [See here for details.](https://blog.genesmindsmachines.com/p/anthropic-has-not-solved-the-peptide)

### More from Genes, Minds, Machines

∙

[1 Restack](https://substack.com/note/p-212864796/restacks?utm_source=substack&utm_content=facepile-restacks)

[^1]: This is called [Betteridge’s law of headlines.](https://en.wikipedia.org/wiki/Betteridge%27s_law_of_headlines)

[^2]: You can think about it as follows: Assume you have a system that proposes designs (e.g., RFdiffusion + ProteinMPNN) and a system that scores proposed designs (e.g., AlphaFold3). You generate *n* proposed designs, score them, and then pick the top-10-scoring designs for experimental testing. As you increase *n* you’ll get increasingly better-scoring designs and as long as your scoring function is reasonably good this will translate into better outcomes during experimental testing.

[^3]: In fact, the [prompt file](https://huggingface.co/datasets/Anthropic/claude-protein-binder-design/blob/main/prompts/prompts/kickoff/single_target_kickoff.md) includes a dollar limit of $10,000 instead of a GPU-time limit.

[^4]: See Figure S16 on page 56 [here.](https://www.biorxiv.org/content/10.64898/2026.06.03.729735v1.full.pdf)

[^5]: It shouldn’t do this, but are you certain it didn’t do this?

[^6]: If that’s the case I would want to know what it is.

[^7]: It could not because the protocol was “first generate all the designs, then test them experimentally.” For real discovery, you’d need an iterated loop, “generate some designs, test them, tweak parameters based on the findings, repeat.” I’m not saying Claude is inherently incapable of running that loop. I’m just saying the way things were set up here it didn’t do it.
## Related notes
- [[2025-11-03 CMT targeting with mini binders]]
- [[2025-11-04 Targeting CMT proteins]]
- [[2026-09-24 Property prediction models]]
- [[2025-10-20 Target ID]]
- [[2025-10-07 Target ID for Abiologics]]
- [[📃 Papers]]