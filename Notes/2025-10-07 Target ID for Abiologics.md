---
Date: 2025-10-07
tags:
  - abiologics
  - compbio
  - targetid
---

## 🧠 Thought/note

Will have to show Chiara some of the work that I have been doing with the target ID piece. I have some code written (check Cursor), with diseases of interest to Abiologics. Namely:

- [x] Kidney diseases #abiologics 📅 2025-10-08 ✅ 2025-10-08
- [x] Protease diseases. #abiologics 📅 2025-10-08 ✅ 2025-10-08

I called the script `abtd.py` and it takes a list of diseases and looks them up on Open Targets (using a variety of ontologies: MONDO, EFO, DOID, HP, MESH, ORDO), and complements the findings with data from GTEx, HPA, TTD, Chembl. The output should be a relatively comprehensive list of proteins that are membrane proteins that can be targeted by our synteins. 
