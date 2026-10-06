---
type: linkedin-post
status: draft
pillar: AI drug discovery
date: 2026-10-06
source: "[[Diogo — Professional Profile]] (Wisdom of crowds for robust gene network inference, Nature Methods 2012)"
posted_url: 
---

There's a lot of talk right now about ensembles, and whether stacking models beats betting on one.

We ran a version of this in biology years ago. A community effort (the DREAM challenges) put more than thirty gene-network inference methods through a blind test on the same data. No single method won. What held up across every dataset was the aggregate of all of them.

The interesting part was why. Each method failed in its own way, in its own corner of the data. Average them and the idiosyncratic errors cancel while the real signal survives. The crowd was not smarter than the best expert. It was wrong in less correlated ways.

That last point is the one that gets lost. An ensemble only helps if its members are actually different. Stack five models trained the same way on the same data and you have paid five times for one opinion. The diversity is the asset, not the count.

So when someone asks which model they should use, I usually ask a different question. Where do the models disagree, and are they wrong independently enough that averaging them means anything.

None of this is new. That is kind of the point.
