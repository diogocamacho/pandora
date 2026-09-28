---
title: "Anthropic has not solved the peptide-binder design problem, but maybe bi[o]hub has"
source: "https://blog.genesmindsmachines.com/p/anthropic-has-not-solved-the-peptide?utm_source=post-email-title&publication_id=5419410&post_id=214055375&utm_campaign=email-post-title&isFreemail=true&r=2uxm8r&triedRedirect=true&utm_medium=email"
author:
  - "[[Claus Wilke]]"
published: 2026-09-03
created: 2026-09-28
description: "The protein design field is getting pushed forward by human experts in protein design, who would have thought"
tags:
  - "clippings"
---
### The protein design field is getting pushed forward by human experts in protein design, who would have thought

In my [recent post about Claude’s protein design efforts,](https://blog.genesmindsmachines.com/p/has-anthropic-solved-the-peptide) I said that I was looking for a 2–3 sentence explanation of how Claude consistently did better than the collective field of human protein engineers, when it was using the same tools that everybody else is using. Well, it looks like we have our answer. The answer is [ESMFold2](https://biohub.ai/models/esmfold2) from [bi\[o\]hub.](https://biohub.org/) ESMFold2 is a new, open source protein folding model, similar to AlphaFold3, but newer. And faster. And also, apparently, better, in particular for evaluating binders. ESMFold2 was only released a few months ago, so it’s not surprising that it’s not yet widely used, or that its performance advantage is not yet known outside a narrow circle of insiders.[^1]

The answer has arrived in the form of a video by Brandon Frenz, a biochemist who did his PhD work at the Institute for Protein Design at the University of Washington and who has well over a decade of experience designing proteins and protein binders. In the video, Frenz explains that the main difference in Claude’s pipeline over previous pipelines is the use of ESMFold2 for scoring designed binders. He also explains that ESMFold2 is both faster and more accurate than the competition, and that he himself these days is consistently using ESMFold2 to score protein binders.

![](https://www.youtube.com/watch?v=hIJFwP5RWAE)

The entire video is really good, and I encourage you to watch it. At the beginning, Frenz breaks down what exactly Claude did to design binders, how it had such a high success rate (primarily, by using ESMFold2 to score designs, a choice that was hard-coded into the prompt), and also how it wasted enormous amounts of compute, probably on the order of 100x more than is actually required to generate binders of similar quality. You can spend $20,000 using Claude, or you can spend less than $200 using the appropriate tools directly. In the second half of the video, the Frenz provides a detailed, step-by-step tutorial on how to design peptide binders that pass the same filters Claude used, how to evaluate the designs for potential problems, and so on. It’s a great video.

The video also makes another important point: Yes you could design binders with Claude and $$$, and let Claude handle all the orchestration, software install, and so on. But, you’re probably better off using a platform such as the one Frenz is building, where you have point-and-click access to all the popular design tools. Such platforms didn’t exist even three years ago, but now increasingly there are companies that offer nicely integrated platforms anybody could use, as long as they have access to a well-written tutorial and a couple hundred dollars to pay for compute.

There you go. Whoever wrote the Claude prompt knew what they were doing, or maybe they just got lucky and picked ESMFold2 because AlphaFold3 was out due to licensing requirements. In either case, if you are working on binder design, you can swap out AlphaFold3 for ESMFold2 in your pipeline, for increased throughput and better scoring. So, maybe Claude did make a contribution to protein design after all, if it helped us to realize how important it is to switch over to ESMFold2.

### More from Genes, Minds, Machines

∙

[^1]: For example, I was aware of ESMFold2 but didn’t know that I should probably use it instead of AlphaFold3. The previous iteration, EMSFold, was not obviously better than its competitor AlphaFold2.