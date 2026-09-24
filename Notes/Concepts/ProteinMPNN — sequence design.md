---
Link: https://www.science.org/doi/10.1126/science.add2187
tags:
  - compbio
  - ml
  - protein_design
  - papers
Date:
Author(s): Dauparas et al
---
Check out this news story too: https://www.bakerlab.org/2022/09/16/proteinmpnn-excels-at-creating-new-proteins/

## 💬 ChatGPT Summary

### Summary

The authors present a deep-learning approach for protein sequence design: given a fixed protein backbone structure (the 3-D coordinates of atoms, especially the Cα–Cα distances, orientations, dihedral angles, etc.), they use a message-passing neural network (MPNN) architecture (ProteinMPNN) to **design amino acid sequences** that will fold (or are predicted to fold) into that backbone. [Baker Lab+2Wageningen University & Research+2](https://www.bakerlab.org/wp-content/uploads/2022/09/Dauparas_etal_Science2022_Sequence_design_via_ProteinMPNN.pdf?utm_source=chatgpt.com)

Key elements:

- Input: backbone geometry and structural features (Cα–Cα distances, relative frames, backbone dihedrals) plus optionally partial sequence context. [Baker Lab+1](https://www.bakerlab.org/wp-content/uploads/2022/09/Dauparas_etal_Science2022_Sequence_design_via_ProteinMPNN.pdf?utm_source=chatgpt.com)
- Architecture: an encoder that ingests structural graph features, and a decoder that predicts amino acid identities (autoregressively from N→C terminus). They extend it to allow **arbitrary decoding orders** (not strictly left→right) which increases flexibility (e.g., when part of the sequence is fixed, or symmetric constraints apply). [Baker Lab](https://www.bakerlab.org/wp-content/uploads/2022/09/Dauparas_etal_Science2022_Sequence_design_via_ProteinMPNN.pdf?utm_source=chatgpt.com)
- They also introduce **“tying”** of residue positions across chains/units (for homo-oligomers, symmetric assemblies, repeat proteins) so that multiple positions must share identity constraints during design. [Baker Lab](https://www.bakerlab.org/wp-content/uploads/2022/09/Dauparas_etal_Science2022_Sequence_design_via_ProteinMPNN.pdf?utm_source=chatgpt.com)
- Training involves augmenting with noise on backbone coordinates (Gaussian perturbation) to make the model robust to small structural deviations (key for real design where backbone may be imperfect). [Baker Lab](https://www.bakerlab.org/wp-content/uploads/2022/09/Dauparas_etal_Science2022_Sequence_design_via_ProteinMPNN.pdf?utm_source=chatgpt.com)
- They benchmarked: (a) sequence recovery – how often the native amino acid at each position is predicted; (b) foldability – via structure-prediction tools (e.g., inputting one sequence, no MSA, check if it predicts the original backbone); (c) experimental validation – expression, purification, structural determination for designed sequences.
- Results: On native single-chain backbones, ProteinMPNN achieved ~52.4 % sequence recovery vs ~32.9 % for classic Rosetta design methods. [Wageningen University & Research+1](https://research.wur.nl/en/publications/robust-deep-learning-based-protein-sequence-design-using-proteinm?utm_source=chatgpt.com) They show stronger performance across monomers, homo-oligomers, hetero-oligomer interfaces. They show that sequences designed by ProteinMPNN are significantly more likely to fold correctly in silico (via e.g., AlphaFold or other structure-predictors) than earlier Rosetta-designed sequences that failed. For example: redesigning previously failed designs, they rescue them with much improved predicted foldability. [Baker Lab+1](https://www.bakerlab.org/wp-content/uploads/2022/09/Dauparas_etal_Science2022_Sequence_design_via_ProteinMPNN.pdf?utm_source=chatgpt.com)
- They go further: structural characterization (X-ray crystallography, cryo-EM) of some designs show that the designed proteins fold as intended (models match solved structures within ~2.3 Å RMSD over ~130 residues) and display high stability (e.g., circular dichroism unchanged at 95 °C). [Baker Lab](https://www.bakerlab.org/wp-content/uploads/2022/09/Dauparas_etal_Science2022_Sequence_design_via_ProteinMPNN.pdf?utm_source=chatgpt.com)
- They demonstrate design of function as well: e.g., redesign of a target-binding protein scaffold (docking a peptide, redesigning binder) where the ProteinMPNN-redesigned sequence shows stronger binding than the original Rosetta version. [Baker Lab](https://www.bakerlab.org/wp-content/uploads/2022/09/Dauparas_etal_Science2022_Sequence_design_via_ProteinMPNN.pdf?utm_source=chatgpt.com)
- The authors conclude that this kind of deep-learning model (inverse folding/sequence design) is reaching a level of robustness and generality that allows tackling de novo assemblies, nanoparticles, oligomers, and interface design at scale and with high hit-rates.

---

### Key Learnings

- **Deep learning is no longer just for structure prediction**: This work demonstrates that a learned model can _design sequences_ for given backbones with higher success than purely physics-based design (Rosetta). That’s a major paradigm shift: from “predict what sequence folds to what structure” to “given structure, propose sequence(s) that fold to it”.    
- **Graph-based MPNN architectures are powerful for structural biology**: By encoding backbone geometry into a graph of residues + edge features (distances, orientations) and message-passing, the model effectively learns structural constraints and patterns of amino acid packing implicitly.
- **Decoding flexibility & symmetry handling are crucial**: Real protein design often involves constraints (fixed motifs, symmetric complexes, repeats, multi-chain coupling). The architecture accommodates arbitrary decoding orders and tied residues. That flexibility markedly enhances applicability.
- **Robustness via noise augmentation matters**: Training with small perturbations to backbone coordinates helps the model generalize to imperfect (designed) backbones. In design workflows, backbone models are approximate, so this step is smart and important.
- **High experimental validation confirms real-world value**: They don’t just deliver better in-silico metrics; they show actual proteins express, fold, assemble, and function. Bridging the gap between ML metrics and wet-lab success is non-trivial.
- **The design space expands**: They show application not only to monomeric proteins but oligomers, nanoparticles, binder design. This suggests the method is broadly useful, not niche.
- **Potential for scale & speed**: Because the model is ML-driven, generation is relatively fast and amenable to high throughput compared to exhaustive physics modelling. This opens door to large-scale protein design campaigns (e.g., for scaffolds, therapeutics, biomaterials).
- **Remaining limitations & caveats**: While they show major improvement, sequence recovery ~52% still means that nearly half of residues differ from native. Folding success is improved but not guaranteed. The method still relies on a fixed backbone—so backbone design/generation remains separate. Also, functional design (binding, catalysis) will still require additional layers beyond stability/foldability.    

---

### What I Need to Remember

- ProteinMPNN’s **input** = backbone structure + (optionally) partial sequence context; **output** = amino acid sequence(s) predicted to fold into that backbone.
- Key architectural innovations: message-passing graph encoder, autoregressive or arbitrary decoding of residue identities, position tying for symmetry/repeats, noise augmentation during training.
- In benchmarks: ~52% sequence recovery on native backbones (vs ~33% Rosetta). That’s a metric of how closely the model matches known sequences given the same backbone. But more importantly, better foldability and successful experimental designs.
- It is **not** a backbone-generation tool (i.e., you must propose or have a backbone). It focuses on the “inverse folding” or “sequence design” problem given structure.
- The method shines when you already have a target backbone (monomer, oligomer, nanoparticle) and you want a viable sequence that will fold/assemble with high success.
- For practical application (in your work, Diogo) this means: if you generate backbone hypotheses (e.g., via hallucination, diffusion, physics modelling) you can feed those into ProteinMPNN for sequence design. That makes the front-end backbone generation more productive because you get higher hit-rates at the sequence stage.
- The method still requires validation: although hit-rate improves, you still should verify via structure prediction (AlphaFold etc), expression, purification, etc. Functional design (binding, catalysis) will likely still require downstream optimisation (e.g., interface affinity, dynamics, kinetics).
- The code is available (~ GitHub link) and the authors highlight that the model is broadly applicable. [Baker Lab+1](https://www.bakerlab.org/wp-content/uploads/2022/09/Dauparas_etal_Science2022_Sequence_design_via_ProteinMPNN.pdf?utm_source=chatgpt.com)
- The broader landscape: This is part of the shift towards ML-driven generative design in proteins (inverse design), complementing structure prediction tools like AlphaFold.
- Keep in mind: “Sequence recovery” is a useful metric but does **not** guarantee function or optimality; also, ML-designed sequences may diverge significantly in sequence identity yet still fold, so sequence recovery alone is not all you need.

---

### Papers to Follow After This One

Since you’re working in computational biology / synthetic biology / ML & bioinformatics, here are logical next reads to build on this foundation:

1. **RFdiffusion – de novo design of protein structure and function with diffusion networks (Watson et al., 2023, Science).** This builds on backbone generation via deep generative models (diffusion) and couples to sequence design.
    - It addresses the preceding gap: backbone generation + sequence design (ProteinMPNN solves the sequence part).
    - Example: “De novo design of protein structure and function with RFdiffusion.”
2. **ESM‑Fold / ESM language-model based large-scale structure prediction (Lin et al., 2022; Rives et al.).** To understand the underlying structure-prediction/representation side of ML in proteins which informs design.
    - Though not sequence-design per se, these papers provide context on how large language models + structure information are advancing the field.
    - E.g., “Learning inverse folding from millions of predicted structures” (Hsu et al., 2022) dives into sequence-design/inverse folding problems.
3. **“Hallucinating symmetric protein assemblies” (Wicky et al., Science 2022) – ML for backbone/hallucination of symmetric oligomers.**
    - This ties nicely into ProteinMPNN’s ability to tie positions and design for symmetry. Understanding how backbone hallucination works gives you the front half of the pipeline.
4. **Classic Rosetta design papers (for benchmarking and contrast)** – e.g., “Accurate design of co-assembling multi-component protein nanomaterials” (King et al., Nature 2014) for design logic pre-ML.
    - Helps place how far we’ve come: from energy-based combinatorial search to data-driven sequence design.
5. **“Deep inverse folding” / “structured generative models for proteins”** – e.g., papers by Anishchenko et al., ProGEN, or others exploring transformer/inverse folding models, so you can compare architectures, training data, constraints.
    - Example: “Learning inverse folding from millions of predicted structures” (Hsu et al., 2022 preprint) outlines transformer-based inverse folding; comparing with MPNN-based ProteinMPNN is instructive.
6. **Application-oriented design papers**: For example craft/design of functional proteins (enzymes, binders, materials) using ML-based pipelines. Tracking how sequence-design methods are used in real functional contexts will inform your venture-creation lens.
    - Papers such as “De novo design of luciferases using deep learning” (Yeh et al., 2023) or other functional design examples.
---


## ✍️ Notes / Questions





