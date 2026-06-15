---
tags:
  - compbio
  - data_science
  - abiologics
Follow up:
---

---
## 🧠 Note

As I prepare to look at the KPMP data set to do cell specificity for each gene ([[2025-10-28 KPMP address analysis]]), I needed to know what the differences are between the two sequencing technologies. [[@Scott Steelman]] gave me a detailed explanation:


> [!quote] Scott's insights
> Only real advantage of nuc seq that jumps to mind is on the sample processing end of things.  Basically only do nuc seq when you can’t do single cell since the data are a bit more sparse.  I guess if you were interested in unspliced transcripts it’s the way to go…other than that…you really just do nuc seq when you don’t have access to fresh samples or something like that. 
> 
> I think it’s probably fair to think of nuc seq data as a (potentially) more sparse version of sc data.  People have shown quite strong correlation between SC and SN on a macro level, but you’re starting with less RNA for SN, so it’s not unreasonable to expect globally lower counts and a potential to miss low abundance stuff.
> 

Then I confirmed this with #gpt : 

Single-cell and single-nucleus sequencing differ mainly in what material they capture, which affects the apparent transcriptome and how you interpret specificity.

### 1. Biological difference

- **Single-cell RNA-seq (scRNA-seq)** captures RNA from intact, viable cells. This means you get both **nuclear and cytoplasmic mRNAs**, including fully processed transcripts and many low-abundance but cytoplasm-enriched species (e.g. mitochondrial, ribosomal, or short-lived transcripts). It’s excellent for live, dissociable tissues like blood or culture but can be biased toward cell types that survive dissociation.
- **Single-nucleus RNA-seq (snRNA-seq)** isolates nuclei from frozen or fixed tissue. You mostly capture **unspliced pre-mRNA** and lose cytoplasmic transcripts. However, you avoid dissociation stress and recover fragile or fibrotic cell types (as in kidney). snRNA-seq data usually shows more intronic reads, fewer mitochondrial genes, and lower total UMI counts per nucleus.

In kidney tissue specifically, snRNA-seq is preferred for integrating across multi-center biopsies and handling archived or fibrotic samples—hence KPMP’s reliance on it.

### 2. Computing gene specificity

If your goal is to estimate how specific a gene is to a cell type (e.g., using “specificity index,” “τ,” or “Gini”), the right input is the **average expression of each gene within each cell type**. Summing counts doesn’t normalize for differing cell numbers; mean or median log-normalized expression is standard. Use one of these:

- Mean of normalized counts per cell type.
- Alternatively, use pseudo-bulk aggregation (sum counts within cell type per sample, then normalize) if you want to weight by biological replicate rather than cell number.

### 3. Filtering and preprocessing

Even though KPMP data are well-curated, you still need minimal QC before computing specificity:

- **Remove low-quality nuclei** (high mitochondrial %, low gene count) and doublets, unless already done. KPMP processing usually handles this, but confirm with metadata.
- **Filter lowly expressed genes** (expressed in < 1–5 % of cells) to avoid spurious specificity driven by dropouts.
- **Normalize and log-transform** (e.g., `log1p(CPM)` or Seurat’s `NormalizeData` output).
- If integrating multiple patients or technologies, use harmonized latent spaces (e.g., Harmony, SCTransform, or scanpy’s BBKNN) before computing specificity.

In short: snRNA-seq gives access to more tissue types but slightly noisier expression profiles. Compute specificity on normalized mean expression per cell type, after confirming QC and filtering.  
This distinction matters when comparing across modalities—snRNA-seq “underestimates” some cytoplasmic genes, so cross-modality normalization or feature filtering (e.g., excluding mitochondrial or ribosomal genes) keeps specificity metrics meaningful.



---
## ✅ Action Items
