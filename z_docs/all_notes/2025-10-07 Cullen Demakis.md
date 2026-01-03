---
Date: 2025-10-07
tags:
  - abiologics
  - interviews
Role: Protein designer
---

### 1. Context from the Job Description

The **Abiologics** posting is for a **computational protein designer / AI-driven protein engineer** role. The focus: integrating _ML + structure-based design_ to generate binders, enzymes, or antibodies with functional control. It’s at the interface of physics-based modeling, ML protein design, and wet-lab iteration — a “Rosetta/AlphaFold meets high-throughput assay” playground.

Cullen’s PhD work under David Baker aligns almost perfectly with this. He’s been doing **RFdiffusion, proteinMPNN, and RosettaFold All-Atom**, plus _actual wet-lab validation_ — rare for computational protein designers. The main question is **how deep his understanding runs** versus being a highly-trained user of tools.

---

### 2. Interview Structure (30 min total)

#### **Minutes 0–5: Warm-up / Context**

- Ask about his most exciting project and what problem it solved.
    - You’re looking for _conceptual clarity and originality_, not buzzwords.
    - Follow-up: “What was the bottleneck — model, data, or physics?”


all problems are in 2 state design. designing motors. tried to design binders to a photoswitchable small molecule.

implemented templating to the small molecule that was being design in conjunctions with the protein

---

#### **Minutes 5–20: Technical Exploration**
#### (a) Fundamentals – 5 min

“Walk me through how you would approach designing a protein binder against a novel peptide target — no known structures, sparse data.”

Listen for:

- Does he talk about starting with **structure prediction (AlphaFold3 or AF-Multimer)** or **diffusion models** for initial sampling?
- Does he articulate how **representation choice** (sequence vs structure graph) impacts model performance?
- Bonus: mentions **conditioning, inpainting, or constrained sampling**.

start with structure
would do some MD to better explore target
look at the structure, hot spots, targetable region
does the RFD, pMPNN

---

#### (b) Tool Depth – 7 min

“RFdiffusion and proteinMPNN are powerful — but when do they fail?”

Follow-ups:

- “How would you modify RFdiffusion or MPNN to incorporate noncanonical residues or metal-binding sites?”
- “Have you retrained or fine-tuned any of these models? What kind of dataset curation was required?”
- “What do you think about the balance between _physics-based priors_ (Rosetta energy terms) and _learned priors_ (neural potentials)?”

You’re probing whether he’s just **running pretrained pipelines** or has **algorithmic understanding** — gradient flow, conditioning, sampling, fine-tuning, data bias, etc.

LD problem: integrating both is a problem
hard to solve the mixed 

---

#### (c) Scientific Judgment – 3 min

“You’ve designed a binder that scores well computationally but fails biochemically. How do you debug?”

Look for:

- Understanding of **experimental noise** (expression/folding issues vs interface failure).
- Whether he connects **sequence entropy**, **surface hydrophobicity**, or **interface electrostatics** to real-world performance.
- Mentions **iterative loop between experiment and computation** (data-driven redesign).

it happens at a certain rate, so don't waste time on it
if you have a common failure mode, try to investigate it
MD/MC sampling to complement analysis



---

#### **Minutes 20–25: Broader thinking**  
Ask something that stretches his systems reasoning:

- “If you had 100M sequences and structures, how would you build a generative model to design enzymes with desired kinetics?”
    
    - Do they talk about _conditional generation_, _property predictors_, _reinforcement loops_, or _diffusion priors_?
    - Or do they freeze — meaning they’re more an applied user, not a systems thinker.


---

**Minutes 25–30: Candidate Questions / Cultural Fit**  
His questions to you will tell you whether he’s:

- Curious about scientific autonomy → good.
- Obsessed with title/scope → watch out.
- Asking how Abiologics integrates design + wet lab feedback → strong sign he understands translational design loops.


---

### 3. How to Assess Skill Level (Pragmatic Rubric)

|Dimension|What “Strong” Looks Like|What “Shallow” Looks Like|
|---|---|---|
|**Computational Depth**|Understands diffusion models and graph representation of proteins. Can discuss model retraining, data curation, conditioning mechanisms.|Can describe using RFdiffusion but not how it learns structure constraints.|
|**Experimental Literacy**|Talks intelligently about assay selection (BLI, FP, FRET), links computational hypotheses to measurable outcomes.|Lists assays but can’t interpret experimental outcomes.|
|**Scientific Creativity**|Proposes novel ways to encode new chemistries or modalities (noncanonical AAs, dynamic scaffolds).|Relies solely on Rosetta/AlphaFold pipelines.|
|**Pragmatism**|Aware of model limitations, advocates hybrid ML/physics or iterative feedback.|“The model just needs more data.”|
|**Collaboration / Software Hygiene**|Mentions Git discipline, Jupyter reproducibility, multi-lab collaboration.|Talks about running things locally or by hand.|

---

### 4. Stretch Question to Separate Stars from Users

> “If you had to design a generative system that learns from failed protein designs, what would it look like?”

This reveals whether he grasps **active learning, uncertainty quantification, and feedback loops** — key for scaling design engines.

---

If Cullen can reason across the **modeling → data → experiment → feedback** loop, you’re looking at someone ready to lead rather than execute. If he stays locked in the “Rosetta & RFdiffusion comfort zone,” he’s a strong contributor but not yet a computational architect.