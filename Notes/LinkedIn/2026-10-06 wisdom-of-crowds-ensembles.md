---
type: linkedin-post
status: draft
pillar: AI drug discovery
date: 2026-10-06
source: "[[Diogo — Professional Profile]] (Wisdom of crowds for robust gene network inference, Marbach et al., Nature Methods 2012 / DREAM5)"
posted_url: 
---

There's a lot of talk right now about ensembles, and whether stacking models beats betting on one.

We ran a version of this in biology years ago. A community effort (the DREAM challenges) put more than thirty gene-network inference methods through a blind test on the same data. No single method was best everywhere; the winner changed with the dataset. The combination of all of them was the most reliable, as good as the best method on any given dataset and the most robust across all of them.

That is the wisdom-of-crowds part, and it holds up. The more useful finding was the limit.

The crowd only helped where the methods were wrong independently. Different approaches made different mistakes, so aggregating them cancelled the noise. Where the methods shared a bias, the interactions they all missed, the crowd missed them too. Pooling confident, correlated errors does not correct them. It launders them.

So for the current moment. An ensemble buys robustness against independent mistakes. It buys nothing against a blind spot the models share, and models trained the same way on the same data share plenty. The question is not how many models you stack. It is whether they fail in the same places.

Easy to forget, which is probably why we keep relearning it.
