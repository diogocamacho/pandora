---
tags:
  - targetid
  - abiologics
  - compbio
Follow up:
People:
  - Chiara Maragone
---
## 🧠 Thought/note

Chiara had some important comments on some genes that were being kept out of the results. This prompted me to go into the code and figure out what was going on. It turns out that annotations of cellular location are not always consistent. 

An example, that Chiara mentioned, was PKD1. This gene is genetically associated with ADPKD (autosomal dominant polycystic kidney disease.) It is a membrane protein, but it is only annotated as "membrane", while my filtering was being done on "plasma membrane". This meant that some re-working of the code was necessary. Let's see where we land with the new changes. 


[[2025-10-20 Target ID]]