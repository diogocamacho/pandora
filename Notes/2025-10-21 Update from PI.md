---
tags:
  - abiologics
  - pi
  - compbio
Follow up: false
---
## 🧠 Thought/note

Updates from Axel. 


**Objective 1 — SCK Rmax Prediction from Sequence and Interface Structural Data**  

- **Dataset Construction**: A training dataset was built from the shared Abiologics data, consisting of 10 Å neighborhoods centered around each target amino acid, with the central residue masked.
- **Model Finetuning**: The interface embedder was finetuned on this dataset using a hybrid training approach that mixed previously used data with the Abiologics dataset to preserve prior knowledge.
    - Objective: predict the amino acid class of the central residue within each neighborhood.
    - Training Results: model convergence achieved, maintaining 70% classification accuracy on previous data and 90% on Abiologics data.
- **Feature Extraction and Aggregation**: Features were extracted for each amino acid in the target and mean-aggregated over all target residues.
	- The same regression pipeline as the previous week was applied, incorporating both sequence and structure-derived features.
- **Outcome**: Adding structural information **did not yield a significant improvement** in Rmax prediction.
- **Hypotheses**:
    - The structural embedding model may not encode sufficient 3D information because:
        - (a) its training objective focuses on amino acid class prediction rather than structural geometry,
        - (b) the training dataset is relatively small compared with large-scale models such as ESM or SAProt.
    - The Abiologics dataset itself is limited (~1 000 training samples) with low diversity, restricting the expressiveness of the regression model.


**Objective 2 — Extraction of SCK Curve-Level Features Correlating with MCK Affinity**  

- **Feature Extraction and Aggregation**: Twelve curve-derived features were extracted per SCK experiment, focusing on initial slopes and association/dissociation dynamics across concentrations. These features were aggregated per compound, with load value correction across SCK experiments. The resulting dataset contained 24 features per compound (slope and intercept from linear or log-linear fits versus concentration).
- **Correlation Analysis**: Spearman rank correlation between each compound-level feature and the final MCK binding affinity was computed: Best correlation: ρ ≈ 0.7, an improvement of +0.2 (≈ 40 %) over using Rmax alone. Qualitative inspection showed strong inter-cluster ranking performance but weaker intra-cluster ranking. Correlations were statistically significant, though the MCK binding dataset is small (~40 compounds), so results should be interpreted with caution.


**Next Steps**  

- Develop regression models for the top curve-level features most correlated with MCK affinity.
- Evaluate rank correlation between predicted features and measured MCK binding values.
- Deliver a trained model and scoring function for downstream application.


[[2025-10-10 PI + Abiologics]] 

- [x] set up a call between PI and Abiologics to review the work they have done. #abiologics 🔼 📅 2025-10-29 ✅ 2025-10-31