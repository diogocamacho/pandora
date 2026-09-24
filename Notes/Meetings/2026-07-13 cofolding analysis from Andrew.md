---
tags:
  - quick
  - abiologics
  - protein-design
  - compbio
  - acroneberger
Follow up:
---

### 🧠 Note

This is from a slack message from Andrew:

```
I wanted to share some results from an ongoing comp experiment that I've found quite interesting so far. What this is looking at here is our plate selection of 90 \(based on pipeline + Rosetta metrics\) for L-IL7Ra designs. As a side experiment we ran cofolding on these to see how the selections do without cofolding compare to a conventional cofolding pipeline and see what designs would pass cofolding.

But another thing that I've been trying to understand better is for each step in a final design's lineage what does the reported iPAE look like? Are there spots where changes in the sequence improves a things a lot or gets worse? How much does interface design vs. MPNN affect this? To look at this, I refolded the intermediate outputs in each design's lineage. Note that this is not representative of the full distribution since this is conditioned on things we actually selected, but there is a particularly significant cofolding signal that jumps out to me in here in our selections.

The changes in iPAE between MPNN2/Rosetta/rescaffolding are also important but more complex to disentangle, so I'm not going to dig into those parts yet. But there's a really clear improvement in iPAE between MPNN 1 and MPNN 2 which could be coming from a few different things.

As a reminder, in MPNN 1, we only generate 1 sequence directly on the diffusion backbone, no FastRelax at sequence generation, and C/A/G are all omitted. This is actually very close to what was done in the original RFD paper (minus the residue omissions). Then we relax, generate 20 designs on the relaxed backbone (now with only CYS removed), evaluate the backbone designability, and then select the "best" from the passing pool on designable backbones based on irmsd.

So this opens a few possible hypotheses:

1. FastRelax/core expansion of the backbone improves the quality of sequences from MPNN and that tracks with cofolding improvements (possible, based on the [Bennett](https://www.nature.com/articles/s41467-023-38328-5) paper)
2. Selection of high confidence, low iRMSD designs from the pool in MPNN 2 based on monomer folding tracks with cofolding improvements.
3. The ALA/GLY omitted in pass 1 ablates the structure-sequence relationship to a point that MPNN isn't likely to generate a sequence that would also pass cofolding, and the high iPAE is an artifact from this.

If further computational analysis points to support on hypotheses 1 or 2, that gives us some good info to guide the pipeline on, and also implies selection on mpnn pass 2 + monomer designability might be the closest proxy in the pipeline to cofolding success. If the analysis points to hypothesis 3 instead, that's also good to know because that indicates a possible confounder for cofolding in our size range (ALA rich sequences being predicted as being more likely to confidently cofold).

I've also attached an interactive view below  where each row is a backbone and you can see how the iPAE changes based on each step for this sample of 90. You can see from that it's not always clear whether a design gets better/worse for predicted PAE between steps other than from MPNN 1->2. When we get experimental data back on this plate we'll also be able to combine that with the lineage data.

Will be really interesting to see how all of this plays out going forward--there's a lot of follow up experiments to explore here!
```
