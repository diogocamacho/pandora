---
tags:
  - abiologics
  - compbio
  - singlecell
Follow up:
---
[[2025-10-29 KPMP + GTEx]]
[[2025-10-28 KPMP address analysis]]
[[2025-10-29 Single cell vs single nuc sequencing]]

---
## 🧠 Note


# Integrating GTEx and KPMP scRNA-seq Data in R

This note describes how to build a pan-tissue healthy reference from GTEx single-cell RNA-seq data and KPMP healthy kidney scRNA-seq data, then map KPMP CKD and AKI disease data into that reference. It includes tool choices, compute recommendations, environment setup, and a working R skeleton.

---

## Tool Map: R-native vs Python-native

**R-native:**  
Seurat, SCTransform, Seurat v5 integration and label transfer, DoubletFinder, SoupX, scran/scater, edgeR, DESeq2, limma, fgsea, VAM, destiny/slingshot, Symphony, kBET, LISI (R implementations), DirichletMultinomial, ALDEx2.

**Python-native:**  
scvi-tools (scVI, scANVI, scArches), scanpy, BBKNN, CellBender, Scrublet, scCODA, scIB metrics suite.

**Bridge:**  
`reticulate` in R (to call Python). `SeuratDisk` for h5ad ↔ h5Seurat conversion. Azimuth models are R-based.

---

## Compute Recommendations

|Scale|Cells|CPU|RAM|GPU|Notes|
|---|---|---|---|---|---|
|Small|<100k|16–32 vCPU|64–128 GB|No|Local workstation ok|
|Medium|100–500k|32–64 vCPU|128–256 GB|1× L4 24 GB optional|For reference building|
|Large|0.5–2M|64–96 vCPU|256–512 GB|1× A100 40 GB or 2× L4|For scVI/scArches|

Store matrices in HDF5 (`h5Seurat`, `h5ad`). Use NVMe scratch ~2× your largest object.

---

## Environment Setup

```r
# 0) Reproducible environment
install.packages("renv")
renv::init()

# 1) Core R stack
install.packages(c("Seurat", "SeuratObject", "SeuratDisk", "Matrix", "data.table", "ggplot2", "pROC"))
BiocManager::install(c("DoubletFinder", "SoupX", "scran", "scater", "edgeR", "DESeq2", "limma", "fgsea", "SingleCellExperiment", "slingshot"))
install.packages(c("VAM", "kBET", "symphony"))

# 2) Optional Python environment via reticulate
install.packages("reticulate")
reticulate::install_miniconda()
reticulate::conda_create("scvi", packages = c("python=3.10"))
reticulate::conda_install("scvi", c("scvi-tools", "scanpy", "anndata", "pytorch", "pytorch-cuda=12.1"), 
                          channel = c("conda-forge","pytorch","nvidia"))
reticulate::conda_install("scvi", c("cellbender", "scrublet", "sccoda"), channel = "conda-forge")
```

---

## R Skeleton

```r
library(Seurat)
library(SeuratObject)
library(Matrix)
library(data.table)
library(scran)
library(scater)
library(DoubletFinder)
library(SoupX)
library(edgeR)
library(DESeq2)
library(symphony)
library(pROC)

# 1. Load data
gtex_list <- list()  # load GTEx scRNA-seq by tissue
data_h <- Read10X(data.dir = "KPMP/healthy/")
data_d <- Read10X(data.dir = "KPMP/disease/")
kpmp_h <- CreateSeuratObject(counts = data_h, project = "KPMP_H")
kpmp_d <- CreateSeuratObject(counts = data_d, project = "KPMP_D")

# 2. QC Function
qc_filter <- function(obj, mito_pattern = "^MT-") {
  obj[["percent.mito"]] <- PercentageFeatureSet(obj, pattern = mito_pattern)
  subset(obj, subset = nFeature_RNA > 1000 & nCount_RNA > 2000 & percent.mito < 15)
}
kpmp_h <- qc_filter(kpmp_h)
kpmp_d <- qc_filter(kpmp_d)

# Optional ambient RNA correction
# kpmp_h <- SoupX::adjustCounts(kpmp_h)

# Doublet removal example
set.seed(1)
sweep.res.list <- paramSweep_v3(kpmp_h, PCs = 1:30)
sweep.stats <- summarizeSweep(sweep.res.list, GT = FALSE)
pK <- as.numeric(names(which.max(find.pK(sweep.stats)$BCmetric)))
homotypic <- modelHomotypic(kpmp_h$seurat_clusters)
nExp <- round(0.05 * nrow(kpmp_h@meta.data))
kpmp_h <- doubletFinder_v3(kpmp_h, PCs = 1:30, pN = 0.25, pK = pK, nExp = nExp)
kpmp_h <- subset(kpmp_h, subset = DF.classifications_0.25_x == "Singlet")

# 3. Integrate healthy datasets
prep_sct <- function(obj) SCTransform(obj, vst.flavor = "v2", verbose = FALSE)
kpmp_h <- prep_sct(kpmp_h)
healthy_list <- c(list(kpmp_h), gtex_list)
features <- SelectIntegrationFeatures(object.list = healthy_list, nfeatures = 3000)
healthy_list <- PrepSCTIntegration(object.list = healthy_list, anchor.features = features)
anchors <- FindIntegrationAnchors(object.list = healthy_list, normalization.method = "SCT", anchor.features = features)
healthy_ref <- IntegrateData(anchorset = anchors, normalization.method = "SCT")

healthy_ref <- RunPCA(healthy_ref)
healthy_ref <- RunUMAP(healthy_ref, dims = 1:50)
healthy_ref <- FindNeighbors(healthy_ref, dims = 1:50)
healthy_ref <- FindClusters(healthy_ref, resolution = 0.5)

# Annotate clusters manually and save cell type labels

# Optional Symphony reference
ref_obj <- symphony::buildReference(healthy_ref@assays$SCT@scale.data, meta_data = healthy_ref@meta.data, vars = c("donor","tissue","chemistry"))

# 4. Pseudo-bulk aggregation by donor × cell type
pseudo_bulk <- function(obj, celltype_col = "celltype_fine", donor_col = "donor") {
  md <- obj@meta.data[, c(celltype_col, donor_col)]
  mat <- obj@assays$RNA@counts
  dt  <- data.table(cell = colnames(mat), celltype = md[[celltype_col]], donor = md[[donor_col]])
  keys <- unique(dt[, .(celltype, donor)])
  sums <- lapply(1:nrow(keys), function(i) {
    idx <- rownames(md)[md[[celltype_col]] == keys$celltype[i] & md[[donor_col]] == keys$donor[i]]
    Matrix::rowSums(mat[, idx, drop = FALSE])
  })
  sums <- do.call(cbind, sums)
  colnames(sums) <- paste(keys$celltype, keys$donor, sep = "__")
  sums
}
pb_counts <- pseudo_bulk(healthy_ref)

# Normalize & compute specificity metrics
dge <- DGEList(counts = pb_counts)
dge <- calcNormFactors(dge, method = "TMM")
cpm_log <- edgeR::cpm(dge, log = TRUE, prior.count = 1)
celltypes <- unique(gsub("__.*$", "", colnames(cpm_log)))
mu_bar <- sapply(celltypes, function(ct) rowMeans(cpm_log[, grepl(paste0("^", ct, "__"), colnames(cpm_log)), drop = FALSE], na.rm = TRUE))

# τ (tau) specificity
tau <- function(x) {
  m <- max(x)
  if (m <= 0) return(0)
  K <- length(x)
  sum(1 - x / m) / (K - 1)
}
tau_vec <- apply(mu_bar, 1, tau)

# AUROC per type
audf <- sapply(celltypes, function(ct) {
  pos <- rowMeans(cpm_log[, grepl(paste0("^", ct, "__"), colnames(cpm_log)), drop = FALSE], na.rm = TRUE)
  neg <- rowMeans(cpm_log[, !grepl(paste0("^", ct, "__"), colnames(cpm_log)), drop = FALSE], na.rm = TRUE)
  sapply(1:nrow(cpm_log), function(g) {
    y <- c(rep(1, sum(grepl(paste0("^", ct, "__"), colnames(cpm_log)))), rep(0, sum(!grepl(paste0("^", ct, "__"), colnames(cpm_log)))))
    scores <- c(cpm_log[g, grepl(paste0("^", ct, "__"), colnames(cpm_log))], cpm_log[g, !grepl(paste0("^", ct, "__"), colnames(cpm_log))])
    as.numeric(pROC::roc(response = y, predictor = scores, quiet = TRUE)$auc)
  })
})

spec_table <- data.table(gene = rownames(mu_bar), best_celltype = celltypes[max.col(mu_bar, ties.method = "first")], tau = tau_vec)

# 5. Map disease data to healthy reference
kpmp_d <- SCTransform(kpmp_d, vst.flavor = "v2")
anchors_d <- FindTransferAnchors(reference = healthy_ref, query = kpmp_d, normalization.method = "SCT", dims = 1:50)
pred <- MapQuery(anchorset = anchors_d, reference = healthy_ref, query = kpmp_d, refdata = list(celltype_fine = "celltype_fine"), reference.reduction = "pca", reduction.model = "umap")
kpmp_d <- pred

# 6. Downstream modeling
# Differential abundance (DirichletMultinomial or logistic regression on proportions)
# Within-type DE (edgeR/DESeq2 on donor pseudo-bulks)
```

---

## Recommendations

- Use donor-aware pseudo-bulk aggregation for specificity and DE.
- Apply minimal filtering even on “processed” data.
- Compute τ (tau), Gini, and AUROC-based specificity metrics.
- Validate canonical kidney markers (NPHS1, AQP2, SLC5A2, SLC12A1) across integrated datasets.
- For disease mapping, treat KPMP CKD/AKI data as a projection into the healthy manifold, not part of training.

---

**Summary:**  
Stay pure-R for speed and seamless integration with edgeR/DESeq2, Symphony, and Seurat. Use Python tools (scVI/scArches) through `reticulate` if cross-platform correction becomes essential. This design gives you a clean, donor-aware, modality-stable framework for computing cell-type gene specificity and quantifying disease shifts.


---
## ✅ Action Items
