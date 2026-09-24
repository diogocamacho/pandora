---
tags:
  - quick
Follow up:
---

### 🧠 Note

This is the prompt that the candidate received:

```
Prompt: ML Strategy for Learning ADME from Our Libraries  
You're six months in. The platform is producing AS-MS data at a good clip and we'd like to start learning ADME properties (passive permeability, microsomal stability, plasma protein binding, solubility, etc.) directly from the libraries themselves. Pooled LC-MS readouts give us assay data on libraries up to ~10⁵ per screen. The goal is to make ADME a selection axis alongside affinity, which we have both positive and negative data for libraries up to ~108 per screen  
You'd be working closely with the head of platform and our in-house LC-MS expert, who together own the DNA → spectrum → chemistry pipeline. For this question, take the chemistry assignments coming out of that pipeline as your starting point and your focus is everything downstream.  
How would you lead data science and ML strategy over the next 12–18 months? Some things to consider:

1. Data and infrastructure. How would you structure data across DNA sequence, the chemistry produced, and the assay readouts? Where do Benchling, AWS, and Seqera fit naturally, and where do they fall short? What other tools or layers would you propose and why those specifically? 

2. Models. What model families would you start with? Given your knowledge of the chemistry that FL121 is broadly interested in, what representations would you use? How would you handle pre-training considering the scarcity of multi-parameter data in the field?

3. Closing the loop. How do your models feed back into library design? Do you have any anticipated failure modes for this DNA-to-chemistry upstream experimental pipeline? What would you goals be for the next 12-18 months and how do you measure what ‘good’ looks like?

4. Team and budget. How do you best work together with Platform to accomplish this goal? What team composition is required over the 18 months? How much do we build internally versus outsource?
```


- staffing of 6 FTE + head in 12 months is crazy
- numbers on compute seem ok, but no number for model training
- how does he think strategically about the impact and growth of the team in the context of the project? 
- i'm very confused about what is it that we want to offer. it's a drug discovery company. the offering is a drug... partnerships et al is just a add on.