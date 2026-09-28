---
tags:
  - gpt
  - compbio
  - explorations
---
Some notes on prompts that I have given CursorAI in the process of building DiseaseNets


~~~~~ 

You are an expert computational biologist and ML engineer. Execute the following plan precisely in this repo.

## **ROLE & CONSTRAINTS**
- Use **R** (no Python/GAT).
- Work in project root.
- Use **gene SYMBOLs** (not probes) everywhere.
- If prior files are missing, **proceed with halo-only** priors (don’t fail).
- Keep installs minimal; **CRAN R packages only**.

## **0) Environment check (install only if needed)**
Open a terminal in the workspace and run:

Rscript -e 'pkgs<-c("Matrix","igraph","dplyr","RcppAnnoy","RSpectra","data.table","fgsea"); miss<-setdiff(pkgs, rownames(installed.packages())); if(length(miss)) install.packages(miss, repos="https://cloud.r-project.org"); cat("OK\n")'

## **1) Verify data & paths, then load**
- The dataset is an .RData under data/. It’s usually named **lung_cancer_gse19804.RData** (sometimes lung_cancer_19804.RData).
- Load whichever exists and assert it defines: expression_lung (genes×samples), samples_lung (metadata), genes_lung (annotations with PROBEID, SYMBOL).
Create scripts/run_integrated_lung.R with this content:

#!/usr/bin/env Rscript
suppressPackageStartupMessages({ library(Matrix); library(igraph); library(dplyr) })
source("R/integrated_disease_pipeline.R")

# --- Locate input ---
in1 <- "data/lung_cancer_gse19804.RData"
in2 <- "data/lung_cancer_19804.RData"
infile <- if (file.exists(in1)) in1 else if (file.exists(in2)) in2 else stop("Input RData not found.")
load(infile)

stopifnot(exists("expression_lung"), exists("samples_lung"), exists("genes_lung"))

# --- Output location & timestamp ---
outdir <- "examples/2025-08-18_lung_cancer_integrated"  # keep fixed label for reproducibility
dir.create(outdir, recursive = TRUE, showWarnings = FALSE)

# --- Priors: try to load if present; else set NULL to allow halo-only ---
load_if <- function(p) { if (file.exists(p)) get(load(p)) else NULL }
priors_biogrid <- if (file.exists("data/priors/biogrid.rds")) readRDS("data/priors/biogrid.rds") else if (file.exists("data/priors/biogrid.csv")) read.csv("data/priors/biogrid.csv") else NULL
priors_string  <- if (file.exists("data/priors/string.rds"))  readRDS("data/priors/string.rds")  else if (file.exists("data/priors/string.csv"))  read.csv("data/priors/string.csv")  else NULL
priors_encode  <- if (file.exists("data/priors/encode.rds"))  readRDS("data/priors/encode.rds")  else if (file.exists("data/priors/encode.csv"))  read.csv("data/priors/encode.csv")  else NULL
priors_ttrust  <- if (file.exists("data/priors/ttrust.rds"))  readRDS("data/priors/ttrust.rds")  else if (file.exists("data/priors/ttrust.csv"))  read.csv("data/priors/ttrust.csv")  else NULL

# --- Run integrated pipeline (SYMBOL-centric, Spearman, no SIS, no GAT) ---
res <- run_integrated_disease_pipeline(
  expression_data   = expression_lung,
  sample_metadata   = samples_lung,
  condition_column  = "clinical_diagnosis",
  normal_patterns   = c("normal"),
  disease_patterns  = c("primary tumor"),
  gene_annotations  = genes_lung,         # must contain PROBEID,SYMBOL
  priors_biogrid    = priors_biogrid,     # data frames with entrez_a,entrez_b (optional)
  priors_string     = priors_string,
  priors_encode     = priors_encode,
  priors_ttrust     = priors_ttrust,
  cgc_genes         = NULL,               # optional: set a vector of CGC SYMBOLs if available
  gsea_gene_sets    = NULL,               # optional: named list for fgsea
  independent_data  = NULL,               # optional: second dataset for stability
  output_dir        = outdir,
  top_k             = 150,
  core_quota        = 0.60,
  halo_quota        = 0.35,
  tau               = 0.30,
  n_permutations    = 200,
  node2vec_dims     = 64,
  feature_weights   = NULL,               # defaults to sensible weights
  seed              = 42,
  n_cores           = max(1, parallel::detectCores(logical = TRUE) - 1),
  verbose           = TRUE
)

# --- Save quick summary tables for the report ---
dir.create(file.path(outdir,"tables"), recursive = TRUE, showWarnings = FALSE)
write.csv(head(res$integrated_results[order(res$integrated_results$integrated_rank), ], 50),
          file.path(outdir,"tables","top50_integrated.csv"), row.names = FALSE)
write.csv(res$rewiring_analysis$gene_rewiring_scores,
          file.path(outdir,"tables","rewiring_scores_full.csv"), row.names = FALSE)
write.csv(res$ppr_analysis$results,
          file.path(outdir,"tables","ppr_scores_full.csv"), row.names = FALSE)
write.csv(res$node2vec_analysis$results,
          file.path(outdir,"tables","node2vec_scores_full.csv"), row.names = FALSE)

cat("\n✓ Integrated pipeline finished. Outputs in: ", outdir, "\n")
Make it executable:

chmod +x scripts/run_integrated_lung.R
## **2) Run the pipeline**

scripts/run_integrated_lung.R

## **3) Author the analysis protocol (step-by-step) and analysis report (results)**
Create examples/2025-08-18_lung_cancer_integrated/2025-08-18_analysis_protocol.md with:

# Integrated Disease Gene Discovery — Protocol (Lung, GSE19804)

## Inputs
- Expression: `expression_lung` (genes × samples)
- Metadata: `samples_lung` (`clinical_diagnosis`)
- Annotations: `genes_lung` (PROBEID→SYMBOL mapping)
- Priors: BioGRID, STRING, ENCODE, TRRUST (optional; used if present)

## Preprocessing
1. Map PROBEID → SYMBOL with variance tie-break; drop duplicate symbols (keep highest variance).
2. If >12k genes, select top ~10k by combined MAD/variance score (SYMBOL space).

## Network Construction
- Build hybrid prior graph (map Entrez→SYMBOL; restrict to universe).
- Generate ANN halo (RcppAnnoy): `halo_k≈max(100,0.7*top_k)`, trees=50, search_k=8000.
- Compute per-condition **Spearman** only on prior+halo edges.
- Neighbor quotas: `top_k=150`, `core_quota=0.6`, `halo_quota=0.35`, plus explore_k=5 with `tau2=0.20`.
- Output: signed adjacency for Normal/Disease, edgewise correlation stats.

## Rewiring (Fisher-z + flip-aware)
- Fisher-z Δ with pooled SE; edge weight = `|z| * (1 + 1.0*flip)`.
- Gene score = degree-normalized sum; null via edge-weight shuffling (200 perms).
- Output: gene rewiring scores + FDR.

## Personalized PageRank Δ
- PPR on both graphs (α=0.85). If no seed list, use uniform personalization.
- ΔPPR = disease − normal; degree-bin z-scoring.

## Node2vec Displacement
- Train separate node2vec (d=64) on Normal/Disease.
- Align by orthogonal Procrustes; displacement = L2 difference.

## Rank Fusion
- Z-score each feature; renormalize weights over available features.
- Default weights: Rewiring 0.4, ΔPPR 0.35, Displacement 0.25.
- Output: integrated score + rank.

## Validation
- If CGC/OncoKB provided: compute recall@{50,100,200}, AUPRC.
- Run GSEA/FGSEA if gene sets provided.
- Optional rank stability on independent dataset.

## Outputs
- `networks/*.mtx`, `features/*.csv`, `validation/*.csv`, `tables/*.csv`, `complete_results.rds`, `pipeline_summary.txt`.
Create examples/2025-08-18_lung_cancer_integrated/2025-08-18_report.md with:

# Integrated Disease Gene Discovery — Report (Lung, GSE19804)

## Run Summary
- Output dir: `examples/2025-08-18_lung_cancer_integrated`
- Total runtime: (see `pipeline_summary.txt`)
- Graph sizes: edges (normal/disease): (see `pipeline_summary.txt`)

## Top Candidates (Integrated Rank)
(See `tables/top50_integrated.csv` for full table.)

## Feature Diagnostics
- Rewiring: #genes with FDR<0.1 — from `features/rewiring_scores.csv`
- ΔPPR: |z|>2 counts — from `features/ppr_scores.csv`
- Node2vec displacement: z>2 counts — from `features/node2vec_scores.csv`

## Validation
- CGC Recall@K (if provided): `validation/cgc_recall.csv`
- GSEA significant sets (if provided): `validation/gsea_results.csv`

## Notes
- SYMBOL namespace enforced end-to-end.
- Correlations limited to prior+halo edges; no SIS, no GAT.
- For production, tune `top_k∈[150,200]`, `core_quota≈0.6–0.7`, `halo_quota≈0.3–0.4`.

## **4) Acceptance checks (Cursor, verify or fix)**
- examples/2025-08-18_lung_cancer_integrated/complete_results.rds exists.
- pipeline_summary.txt prints edge counts and step runtimes.
- tables/top50_integrated.csv exists and is non-empty.
- No usage of probe IDs in outputs (genes are **SYMBOLs**).
## **5) If something fails**
- If priors missing: confirm the run still succeeds (halo-only).
- If node2vec errors: use the built-in placeholder and continue; do **not** abort the pipeline.
- If sample counts per condition <4: stop with clear error.
End of plan.





~~~

do the following:

- add the necessary python requirements to be installed with the package
- add a tutorial on the package as a whole, the workflow, expected results
- add an example tutorial with the lung cancer data, including images and detailing what each step does
- a dcument describing what the visualizations show and how it should be interpreted
- add the ability to change the parameters of the GAT (number heads, hidden layers, etc)
- clean up the directory to remove any files that are not necessary

~~~

you are a ML expert.

without running or adding any code, describe to me why I should do phases 3 and 4 that are described in the README, and if the implemented method is sufficient for state of the art disease driver discovery.

~~~

the data that I use to build my ground truth comes from BioGRID, STRING, TTRUST, and Encode. Some of these can be "directed" (especially TTRUST). Would this fit the paradigm of hybrid architecture? and how would this change the ground truth and the methodology itself?

~~~

8/18/25

You are an expert computational biologist with great experience in ML and the creation of R packages. 

the code base under R is too big. can you:

- read all the files
- consolidate like functions into a smaller set of scripts and functions
- pay attention to files that have fixes for functions or approaches
- simplify codebase
- when looking at demo files, use these sparingly. 
- use a naming scheme that is consistent with best practices
- ensure that R and python libraries can be installed and run when package deploys
- add unit tests for each function
- update package version
- update DESCRIPTION
- update README
- Write a package wrapper called run_diseasenets that follows: the following structure: ┌──────────────────────────────────────────────────────────────┐
- │                INTEGRATED ANALYSIS PIPELINE                  │
- ├──────────────────────────────────────────────────────────────┤
- │  🧪 STEP 0: QC & PREPROCESSING                                │
- │     • Filter/normalize • Residualize covariates • Set seed    │
- │     • Outputs: clean expr (by condition), config/logs         │
- │                              ↓                                │
- │  🕸️  STEP 1: NODEWISE SPARSE REGRESSION                       │
- │     • Build conditional coexpr (normal / disease)             │
- │     • Stability selection → selection freqs                   │
- │     • Symmetrization: AND / OR / maxabs                       │
- │     • Differential edge analysis                              │
- │     • Outputs: adj matrices (sparse), edge DF, diagnostics    │
- │                              ↓                                │
- │  📐 STEP 2: BASELINE GRAPH ANALYTICS (ENHANCED)               │
- │     • Use nodewise adjacencies as priors                      │
- │     • Density-matched comparisons (degree/edge-count control) │
- │     • Bootstrap using nodewise stability                      │
- │     • Outputs: centrality scores, nulls, CIs                  │
- │                              ↓                                │
- │  🤖 STEP 3: GAT (MULTI-RELATIONAL)                            │
- │     • Relations: PPI / TF / regulation / coexpr               │
- │     • Init attention from regression coefficients             │
- │     • Neighbor lists (quotaed, deterministic)                 │
- │     • Contrastive learning from differential edges            │
- │     • Prior-alignment regularization                          │
- │     • Outputs: trained GAT, attention weights                 │
- │                              ↓                                │
- │  🔗 STEP 4: INTEGRATED RANKING & CROSS-VALIDATION             │
- │     • Centrality (baseline)                                   │
- │     • GAT attention-weighted scores                           │
- │     • Nodewise differential activity                          │
- │     • Cross-method validation & ensembling                    │
- │     • Outputs: final scores, calibrated ranks, QC metrics     │
- │                              ↓                                │
- │  📈 OUTPUT: COMPREHENSIVE DISEASE-DRIVER RESULTS              │
- │     • Ranked genes • Key subnetworks • Reproducible bundle    │
- └──────────────────────────────────────────────────────────────┘


**Add a candidate-construction step (once):**
- Start with **prior neighbors** (PPI/TF/regulatory).
- Add **approximate nearest neighbors (ANN)** in expression space (pooled across conditions) to allow novel edges.
- Optionally expand by **2-hop prior** or **module membership** if you want extra coverage.
**Pass those candidates into nodewise regression:**
- When you screen by correlation, compute it **only within each gene’s candidates** (not all genes).
- Keep your discovery_budget as the “wiggle room”: pick top-k non-prior candidates by absolute (approx.) correlation.
**(Tiny speed win)** Because you already z-score per gene, correlation with the target is just a **dot product**. Use crossprod(X_subset, y) instead of cor().



Processed 1000 genes, 120 samples (60 normal, 60 disease) ??? —> why only 1000? 


~~~~

**Role**: You are a senior computational biologist + ML engineer. Ship-quality work. No silent fallbacks.
**Objective**
1. Run the main wrapper on data/lung_cancer_gse19804.RData (fallback: data/lung_cancer_19804.RData).
2. Collect **all outputs** under examples/2025-08-18_lung_cancer_example.
3. Produce 2025-08-18_analysis_protocol.md (step-by-step).
4. Produce 2025-08-18_report.md (concise results).
5. **Critically: run the real Python GAT** in Step-3 (no placeholder).
6. **Use gene symbols (not probe IDs)** everywhere by leveraging the genes_lung annotation.

## **Hard requirements**
- Convert expression rows from probes → **gene symbols** using genes_lung (must contain PROBEID, SYMBOL or equivalent).
- When multiple probes map to the same symbol, **collapse to a single symbol** by keeping the probe with the **largest variance** across samples. Drop rows with missing/empty symbols.
- All downstream artifacts (adjacency matrices, neighbor lists, embeddings) must use **gene symbols** as row/vertex names.
- **Enable GAT** end-to-end via reticulate calling the actual Python code. If the code path still contains a stub (e.g., rnorm embeddings), **replace it** with the Python call. If GAT can’t run, **fail with an error** (do not disable it).

## **Run mode (fast + credible)**
- Pairwise **Spearman** backbone (per-condition, signed, top-k=150 neighbors per gene).
- Nodewise **off** for this run (no SIS, no lasso).
- GAT consumes the symbol-indexed neighbor lists (coexpr_normal, coexpr_disease).
- Reproducibility: set.seed(1); set OMP/MKL/OPENBLAS_THREADS=1. Use all but 2 CPUs.

## **Steps**
## **A) Python env for GAT (PyTorch + PyG)**

# from project root (adjust if using mamba)
python -V || true
conda env remove -n diseasenets-gat -y || true
conda create -n diseasenets-gat python=3.10 -y
conda activate diseasenets-gat
# CPU wheels; if you have CUDA, use matching CUDA wheels instead
pip install "torch==2.2.*" "torchvision==0.17.*" "torchaudio==2.2.*" --index-url https://download.pytorch.org/whl/cpu
pip install torch_geometric==2.5.3 pyg-lib==0.4.0 torch-scatter==2.1.2 torch-sparse==0.6.18 --extra-index-url https://data.pyg.org/whl/torch-2.2.0+cpu.html
pip install numpy==1.26.* scipy==1.13.* pandas==2.2.* networkx==3.3 pyyaml==6.0.*
python - <<'PY'
import torch, torch_geometric
print("Torch:", torch.__version__, "CUDA:", torch.cuda.is_available())
print("PyG:", torch_geometric.__version__)
PY
## **B) R↔Python bridge (reticulate)**
**Create R/gat_bridge.R:**

gat_init <- function(env = "diseasenets-gat", py_path = "python") {
  suppressPackageStartupMessages(library(reticulate))
  use_condaenv(env, required = TRUE)
  py_config()
  assign(".py_mod", import_from_path("graph_attention_runner", path = py_path), envir = .GlobalEnv) # adjust module if different
  TRUE
}

gat_train_and_score <- function(
  expression_matrix,               # genes(symbols) x samples
  condition_labels,                # 0/1 vector
  neighbor_lists,                  # named list: symbol -> data.frame(neighbor, weight, relation)
  edge_types = c("coexpr_normal","coexpr_disease"),
  outdir,
  seed = 1,
  hidden_dim = 64,
  heads = 4,
  epochs = 200,
  lr = 2e-3,
  weight_decay = 1e-4,
  patience = 20
){
  stopifnot(exists(".py_mod", envir = .GlobalEnv))
  py <- get(".py_mod", envir = .GlobalEnv)

  # Convert neighbor lists to simple lists of dicts
  nl <- lapply(neighbor_lists, function(df){
    if (is.null(df) || nrow(df)==0) return(list())
    split(as.list(data.frame(neighbor=df$neighbor, weight=df$weight, relation=df$relation, stringsAsFactors=FALSE)),
          seq_len(nrow(df)))
  })

  res <- py$train_gat(
    expr = reticulate::r_to_py(unclass(as.matrix(expression_matrix))),
    labels = as.integer(condition_labels),
    neighbor_lists = nl,
    edge_types = edge_types,
    outdir = outdir,
    seed = as.integer(seed),
    hidden_dim = as.integer(hidden_dim),
    heads = as.integer(heads),
    epochs = as.integer(epochs),
    lr = lr,
    weight_decay = weight_decay,
    patience = as.integer(patience)
  )
  res
}
If your Python entry point differs, import the correct module/function and adapt the call.
## **C) Pairwise builder (symbol-indexed)**
**Create R/pairwise_spearman_network.R:**

build_pairwise_spearman_network <- function(
  expression_data, sample_metadata, condition_column,
  normal_patterns, disease_patterns,
  top_k = 150, signed = TRUE,
  correlation_method = "spearman",
  covariates = NULL, output_dir = NULL, verbose = TRUE
){
  stopifnot(nrow(expression_data) > 1, ncol(expression_data) > 2)
  genes <- rownames(expression_data); if (is.null(genes)) stop("Row names (gene symbols) required")

  conds <- as.character(sample_metadata[[condition_column]])
  normal_mask  <- grepl(paste(normal_patterns, collapse="|"),  conds, ignore.case=TRUE)
  disease_mask <- grepl(paste(disease_patterns, collapse="|"), conds, ignore.case=TRUE)

  Xn <- expression_data[, normal_mask,  drop=FALSE]
  Xd <- expression_data[, disease_mask, drop=FALSE]
  n_n <- ncol(Xn); n_d <- ncol(Xd)
  if (n_n < 4 || n_d < 4) stop("Not enough samples per condition")

  if (!is.null(covariates)) {
    cov <- model.matrix(~ . , data = covariates)
    resid_mat <- function(X) { B <- qr.coef(qr(cov), t(X)); fit <- t(cov %*% B); X - fit }
    Xn <- resid_mat(Xn); Xd <- resid_mat(Xd)
  }

  if (verbose) cat("📈 Spearman correlations per condition...\n")
  Cn <- suppressWarnings(cor(t(Xn), method = correlation_method, use = "pairwise.complete.obs"))
  Cd <- suppressWarnings(cor(t(Xd), method = correlation_method, use = "pairwise.complete.obs"))
  diag(Cn) <- 0; diag(Cd) <- 0

  build_topk_adj <- function(C, k, signed=TRUE) {
    p <- nrow(C)
    idx_i <- integer(); idx_j <- integer(); vals <- numeric()
    for (i in seq_len(p)) {
      r <- C[i, ]; r[is.na(r)] <- 0
      ord <- order(abs(r), decreasing = TRUE)
      sel <- ord[seq_len(min(k, length(ord)))]; sel <- sel[sel != i]
      if (!length(sel)) next
      idx_i <- c(idx_i, rep.int(i, length(sel))); idx_j <- c(idx_j, sel); vals <- c(vals, r[sel])
    }
    df <- data.frame(i = idx_i, j = idx_j, w = vals)
    df2 <- rbind(df, data.frame(i=df$j, j=df$i, w=df$w))
    o <- order(abs(df2$w), decreasing=TRUE)
    df2 <- df2[!duplicated(paste(df2$i, df2$j))[o], ][order(o), ]
    A <- Matrix::sparseMatrix(i=df2$i, j=df2$j, x=if (signed) df2$w else abs(df2$w),
                              dims=c(p,p), dimnames=list(genes, genes))
    diag(A) <- 0
    A
  }

  An <- build_topk_adj(Cn, top_k, signed); Ad <- build_topk_adj(Cd, top_k, signed)

  to_neighbors <- function(A, label) {
    p <- nrow(A); nn <- vector("list", p); names(nn) <- rownames(A)
    for (i in seq_len(p)) {
      idx <- Matrix::which(A[i, ] != 0)
      if (length(idx)) {
        nn[[i]] <- data.frame(neighbor=rownames(A)[idx], weight=as.numeric(A[i, idx]),
                              relation=label, stringsAsFactors=FALSE)
      } else nn[[i]] <- data.frame(neighbor=character(), weight=numeric(), relation=character())
    }
    nn
  }
  neigh_n <- to_neighbors(An, "coexpr_normal")
  neigh_d <- to_neighbors(Ad, "coexpr_disease")
  merged_neighbors <- setNames(vector("list", length(neigh_n)), names(neigh_n))
  for (g in names(neigh_n)) {
    dn <- rbind(neigh_n[[g]], neigh_d[[g]])
    if (nrow(dn)) {
      dn <- dn[order(abs(dn$weight), decreasing=TRUE), ]
      dn <- dn[!duplicated(dn$neighbor), ]
    }
    merged_neighbors[[g]] <- dn
  }

  # Flips with Fisher z + FDR
  fisher_z <- function(r) atanh(pmax(pmin(r, 0.999999), -0.999999))
  zmat <- (fisher_z(Cd) - fisher_z(Cn)) / sqrt(1/(n_d - 3) + 1/(n_n - 3))
  pmat <- 2 * pnorm(-abs(zmat))
  tau <- 0.3
  flip_mask <- (sign(Cn) != sign(Cd)) & (abs(Cn) >= tau) & (abs(Cd) >= tau)
  p_flip <- pmat[flip_mask]; q_flip <- p.adjust(p_flip, method="BH")
  flips <- data.frame(gene_i=character(), gene_j=character(), r_normal=numeric(),
                      r_disease=numeric(), z=numeric(), p=numeric(), q=numeric())
  if (length(p_flip)) {
    idx <- which(flip_mask, arr.ind=TRUE)[seq_along(p_flip), , drop=FALSE]
    flips <- data.frame(
      gene_i = genes[idx[,1]], gene_j = genes[idx[,2]],
      r_normal = Cn[flip_mask], r_disease = Cd[flip_mask],
      z = zmat[flip_mask], p = p_flip, q = q_flip, stringsAsFactors=FALSE
    )
    flips <- flips[flips$q < 0.05, , drop=FALSE]
  }

  list(
    normal_adj = An, disease_adj = Ad,
    neighbor_lists = list(normal = neigh_n, disease = neigh_d, merged = merged_neighbors),
    flips = flips
  )
}
## **D) Runner script (loads data, converts probes→symbols, runs full pipeline with GAT)**
**Create scripts/run_lung_2025-08-18.R:**

Sys.setenv(OMP_NUM_THREADS="1", MKL_NUM_THREADS="1", OPENBLAS_NUM_THREADS="1")
set.seed(1)

suppressPackageStartupMessages({
  library(Matrix); library(igraph); library(dplyr)
})

OUTDIR <- "examples/2025-08-18_lung_cancer_example"
dir.create(file.path(OUTDIR, "logs"), recursive = TRUE, showWarnings = FALSE)

data_path <- if (file.exists("data/lung_cancer_gse19804.RData")) "data/lung_cancer_gse19804.RData" else if (file.exists("data/lung_cancer_19804.RData")) "data/lung_cancer_19804.RData" else stop("Data file not found")
load(data_path)

# Sample metadata rownames
if ("cel_file" %in% colnames(samples_lung)) rownames(samples_lung) <- samples_lung$cel_file

# ---------- PROBES → SYMBOLS using genes_lung ----------
stopifnot(exists("genes_lung"))
# Try to find mapping columns
cols <- colnames(genes_lung)
probe_col <- if ("PROBEID" %in% cols) "PROBEID" else if ("ProbeID" %in% cols) "ProbeID" else stop("No PROBEID column in genes_lung")
symbol_col <- if ("SYMBOL" %in% cols) "SYMBOL" else if ("Symbol" %in% cols) "Symbol" else stop("No SYMBOL column in genes_lung")

map <- setNames(as.character(genes_lung[[symbol_col]]), as.character(genes_lung[[probe_col]]))
common <- intersect(rownames(expression_lung), names(map))
if (length(common) < 1000) stop("Probe→symbol overlap too small; check annotations")

# Build a data.frame with symbol per probe, drop missing/empty symbols
sym <- map[common]; sym[is.na(sym)] <- ""
keep <- sym != ""
expr_sub <- expression_lung[common[keep], , drop=FALSE]
sym_sub  <- sym[keep]

# Collapse duplicate symbols: keep the probe with largest variance
vars <- apply(expr_sub, 1, var, na.rm = TRUE)
df <- data.frame(probe = rownames(expr_sub), symbol = sym_sub, var = vars, stringsAsFactors = FALSE)
df <- df[order(df$symbol, -df$var), ]
df_unique <- df[!duplicated(df$symbol), ]

expression_sym <- expr_sub[df_unique$probe, , drop=FALSE]
rownames(expression_sym) <- df_unique$symbol

cat(sprintf("✅ Probes→symbols: %d probes → %d unique symbols\n", nrow(expr_sub), nrow(expression_sym)))

# Gene annotations: keep only used symbols
if (exists("genes_lung")) {
  genes_sym <- genes_lung %>% dplyr::filter(.data[[symbol_col]] %in% rownames(expression_sym))
} else genes_sym <- NULL

# ---------- Build pairwise Spearman networks (symbol-indexed) ----------
source("R/pairwise_spearman_network.R")
start_time <- Sys.time()

pairwise <- build_pairwise_spearman_network(
  expression_data    = expression_sym,
  sample_metadata    = samples_lung,
  condition_column   = "clinical_diagnosis",
  normal_patterns    = "normal",
  disease_patterns   = "primary tumor",
  top_k              = 150,
  signed             = TRUE,
  correlation_method = "spearman",
  covariates         = NULL,                  # set if you have covariates
  output_dir         = OUTDIR,
  verbose            = TRUE
)

# Save adjacency and flips
dir.create(file.path(OUTDIR, "data"), recursive = TRUE, showWarnings = FALSE)
Matrix::writeMM(pairwise$normal_adj,  file.path(OUTDIR, "data", "spearman_normal_topk_symbol.mtx"))
Matrix::writeMM(pairwise$disease_adj, file.path(OUTDIR, "data", "spearman_disease_topk_symbol.mtx"))
utils::write.csv(pairwise$flips, file.path(OUTDIR, "data", "sign_flips_fdr_symbol.csv"), row.names = FALSE)

# ---------- REAL GAT (symbol-indexed) ----------
source("R/gat_bridge.R")
gat_init(env = "diseasenets-gat", py_path = "python")

cond_vec <- as.integer(samples_lung$clinical_diagnosis %in% "primary tumor")  # 1=disease, 0=normal
neighbor_lists_for_gat <- pairwise$neighbor_lists$merged

gat_out <- gat_train_and_score(
  expression_matrix = expression_sym,                   # SYMBOL-indexed
  condition_labels  = cond_vec[colnames(expression_sym)], # align vector to samples if needed
  neighbor_lists    = neighbor_lists_for_gat,
  edge_types        = c("coexpr_normal","coexpr_disease"),
  outdir            = file.path(OUTDIR, "gat"),
  seed              = 1, hidden_dim = 64, heads = 4, epochs = 200, lr = 2e-3, weight_decay = 1e-4, patience = 20
)

# Expect embeddings/scores/attention in gat_out
if (!file.exists(file.path(OUTDIR, "gat", "training_log.json"))) stop("GAT training_log.json missing — GAT likely did not run")

# ---------- Simple signed-degree centrality delta (symbol-indexed) ----------
to_igraph <- function(A){
  el <- Matrix::summary(A); el <- el[el$i < el$j, ]
  igraph::graph_from_data_frame(
    data.frame(from=rownames(A)[el$i], to=colnames(A)[el$j], weight=el$x, sign=ifelse(el$x>=0,1L,-1L)),
    directed=FALSE, vertices=data.frame(name=rownames(A), stringsAsFactors=FALSE)
  )
}
gN <- to_igraph(pairwise$normal_adj); gD <- to_igraph(pairwise$disease_adj)
signed_deg <- function(g){
  Epos <- E(g)[E(g)$sign==1L]; gpos <- igraph::subgraph.edges(g, Epos, delete.vertices=FALSE)
  Eneg <- E(g)[E(g)$sign==-1L]; gneg <- igraph::subgraph.edges(g, Eneg, delete.vertices=FALSE)
  vn <- V(g)$name
  dp <- igraph::degree(gpos); dn <- igraph::degree(gneg)
  dp <- setNames(ifelse(vn%in%names(dp), dp[vn], 0), vn)
  dn <- setNames(ifelse(vn%in%names(dn), dn[vn], 0), vn)
  data.frame(symbol=vn, deg_pos=as.numeric(dp), deg_neg=as.numeric(dn), deg_signed=as.numeric(dp-dn), stringsAsFactors=FALSE)
}
cent <- dplyr::inner_join(signed_deg(gN), signed_deg(gD), by="symbol", suffix=c("_normal","_disease"))
cent$driver_score <- abs(cent$deg_signed_disease - cent$deg_signed_normal)
utils::write.csv(cent[order(-cent$driver_score), ], file.path(OUTDIR, "data", "centrality_signed_symbol.csv"), row.names=FALSE)

end_time <- Sys.time()
runtime_min <- as.numeric(difftime(end_time, start_time, units="mins"))

# ---------- Save RDS + logs ----------
res <- list(
  expression_symbol = expression_sym,
  genes_symbol = genes_sym,
  pairwise = pairwise,
  gat = gat_out
)
saveRDS(res, file.path(OUTDIR, "results_symbol.rds"))

writeLines(c(
  paste("Completed:", end_time),
  paste("Runtime_min:", round(runtime_min,2)),
  paste("Genes_symbols:", nrow(expression_sym)),
  paste("Samples:", ncol(expression_sym)),
  paste("TopK:", 150),
  paste("Signed:", TRUE),
  paste("GAT: ON (see gat/training_log.json)")
), file.path(OUTDIR, "logs", "analysis_summary.txt"))

cat(sprintf("✅ Done. Symbols: %d; runtime: %.1f min; outputs in %s\n", nrow(expression_sym), runtime_min, OUTDIR))
Run it:

Rscript scripts/run_lung_2025-08-18.R
## **E) Protocol + Report (symbol-aware)**
Generate:
- examples/2025-08-18_lung_cancer_example/2025-08-18_analysis_protocol.md Include: data source; **probe→symbol mapping logic** (drop NA symbols, keep max-variance probe per symbol, counts before/after); preprocessing; Spearman graph (signed, top-k=150); flip detection (Fisher z, BH FDR, τ=0.3); GAT config (hidden_dim, heads, epochs, lr, patience, device); file paths; seed + env; rerun command.
- examples/2025-08-18_lung_cancer_example/2025-08-18_report.md Include: sample counts, #symbols analyzed, edge counts (normal/disease), #FDR<0.05 flips and top examples; top driver genes (from driver_score and/or GAT scores); brief pathway notes (if you have enrichments); figures/plots paths; limitations + next steps.

## **Validation checklist (must pass)**
- After probe→symbol collapse, **row names of expression are unique gene symbols**. Log “probes → symbols” counts.
- Pairwise outputs and GAT artifacts use **symbol names**.
- gat/training_log.json exists and shows epochs, loss, early stopping, seed, device.
- Embeddings shape = [n_symbols, hidden_dim*heads].
- No “Simulated GAT results” placeholder left in Step-3 paths.

**Notes**
- If your Python entry/module is named differently, adjust gat_bridge.R to import and call it.
- If genes_lung uses different column names for symbols, update symbol_col detection accordingly.
- If you need to aggregate duplicates differently (mean/median), swap the “max variance” rule—but keep uniqueness of symbols to simplify all downstream steps.


~~~~~

**Role**: You are a senior computational biologist + ML engineer. Act deterministically. No silent fallbacks.
**Goals**
- Load data/lung_cancer_gse19804.RData (fallback: data/lung_cancer_19804.RData) which contains expression_lung, samples_lung, genes_lung.
- Use **gene symbols** (collapse probes→symbols by max variance).
- Build **hybrid prior** from BioGRID/STRING/ENCODE/TRRUST (data frames have entrez_a, entrez_b; optional score/mode).
- Add **ANN halo** (RcppAnnoy) and compute **exact Spearman only for prior+halo** pairs.
- **Run real GAT** (no stubs) via gat_bridge.R using a **minimal PyG** environment.
- Save all outputs under examples/2025-08-18_lung_cancer_example/.
- Write 2025-08-18_analysis_protocol.md and 2025-08-18_report.md in that folder.
**Assumptions**
- These files already exist in R/: main_wrapper.R (hybrid_ann version), build_hybrid_priors.R, halo_annoy.R, edgewise_correlations.R, gat_bridge.R.
- Python GAT runner is available and callable via gat_bridge.R (uses reticulate).

# **Do the work**
## **0) Minimal Python env for PyG (CPU only)**

# create minimal env (skip torchvision/torchaudio/pyg-lib/torch-cluster)
conda create -n diseasenets-gat python=3.10 -y
conda activate diseasenets-gat
pip install "torch==2.2.2" --index-url https://download.pytorch.org/whl/cpu
pip install torch_scatter==2.1.2 -f https://data.pyg.org/whl/torch-2.2.0+cpu.html
pip install torch_sparse==0.6.18 -f https://data.pyg.org/whl/torch-2.2.0+cpu.html
pip install torch_geometric==2.5.3
pip install numpy==1.26.*
python - <<'PY'
import sys, torch, torch_geometric
print("PY:", sys.executable)
print("Torch:", torch.__version__, "CUDA:", torch.cuda.is_available())
print("PyG:", torch_geometric.__version__)
PY
Export this Python to reticulate when running R:

export RETICULATE_PYTHON=$(python - <<'PY'
import sys; print(sys.executable)
PY
)
## **1) R dependency for ANN**

R -q -e 'if(!requireNamespace("RcppAnnoy", quietly=TRUE)) install.packages("RcppAnnoy", repos="https://cloud.r-project.org")'
## **2) Runner script**
Create scripts/run_hybrid_ann_lung.R with the following content and make it executable:

#!/usr/bin/env Rscript
Sys.setenv(OMP_NUM_THREADS="1", MKL_NUM_THREADS="1", OPENBLAS_NUM_THREADS="1")
set.seed(1)

suppressPackageStartupMessages({
  library(Matrix); library(dplyr); library(igraph)
})

# ---- Config ----
OUTDIR <- "examples/2025-08-18_lung_cancer_example"
dir.create(file.path(OUTDIR, "logs"), recursive = TRUE, showWarnings = FALSE)
dir.create(file.path(OUTDIR, "data"), recursive = TRUE, showWarnings = FALSE)
dir.create(file.path(OUTDIR, "gat"),  recursive = TRUE, showWarnings = FALSE)

# ---- Load wrapper & helpers (these must already exist) ----
source("R/main_wrapper.R")              # hybrid_ann version
source("R/build_hybrid_priors.R")
source("R/halo_annoy.R")
source("R/edgewise_correlations.R")
source("R/gat_bridge.R")

# ---- Load data ----
data_path <- if (file.exists("data/lung_cancer_gse19804.RData")) "data/lung_cancer_gse19804.RData" else if (file.exists("data/lung_cancer_19804.RData")) "data/lung_cancer_19804.RData" else stop("Data file not found")
load(data_path)
if ("cel_file" %in% colnames(samples_lung)) rownames(samples_lung) <- samples_lung$cel_file

# ---- Load priors (Entrez) ----
# Expect data frames with columns: entrez_a, entrez_b; optional: score (STRING), mode (TRRUST)
# Strategy: use in-memory objects if present; else try CSVs under data/priors/.
norm_names <- function(df){colnames(df) <- tolower(colnames(df)); df}
biogrid_df <- if (exists("biogrid_df")) get("biogrid_df") else if (file.exists("data/priors/biogrid_edges.csv")) read.csv("data/priors/biogrid_edges.csv", stringsAsFactors=FALSE) else NULL
string_df  <- if (exists("string_df"))  get("string_df")  else if (file.exists("data/priors/string_edges.csv"))  read.csv("data/priors/string_edges.csv",  stringsAsFactors=FALSE) else NULL
encode_df  <- if (exists("encode_df"))  get("encode_df")  else if (file.exists("data/priors/encode_tf_edges.csv")) read.csv("data/priors/encode_tf_edges.csv", stringsAsFactors=FALSE) else NULL
ttrust_df  <- if (exists("ttrust_df"))  get("ttrust_df")  else if (file.exists("data/priors/ttrust_tf_edges.csv")) read.csv("data/priors/ttrust_tf_edges.csv", stringsAsFactors=FALSE) else NULL
if (!is.null(biogrid_df)) biogrid_df <- norm_names(biogrid_df)
if (!is.null(string_df))  string_df  <- norm_names(string_df)
if (!is.null(encode_df))  encode_df  <- norm_names(encode_df)
if (!is.null(ttrust_df))  ttrust_df  <- norm_names(ttrust_df)

# ---- Run analysis (hybrid prior + ANN halo + real GAT) ----
t0 <- Sys.time()
res <- run_diseasenets(
  expression_data   = expression_lung,
  sample_metadata   = samples_lung,
  gene_annotations  = genes_lung,                    # must include ENTREZID & SYMBOL
  condition_column  = "clinical_diagnosis",
  normal_patterns   = "normal",
  disease_patterns  = "primary tumor",
  priors_biogrid    = biogrid_df,
  priors_string     = string_df,
  priors_encode     = encode_df,
  priors_ttrust     = ttrust_df,
  analysis_method   = "hybrid_ann",
  output_dir        = OUTDIR,
  # graph params
  top_k = 150, core_quota = 0.6, halo_quota = 0.35, explore_k = 5,
  tau = 0.30, tau2 = 0.20,
  correlation_method = "spearman",
  # GAT params (force real run)
  enable_gat = TRUE, gat_env = "diseasenets-gat",
  gat_hidden_dim = 64, gat_heads = 4, gat_epochs = 200, gat_lr = 2e-3, gat_weight_decay = 1e-4, gat_patience = 20,
  n_cores = max(1L, parallel::detectCores()-2),
  seed = 1, verbose = TRUE
)
t1 <- Sys.time(); runtime_min <- as.numeric(difftime(t1, t0, units="mins"))

# ---- Verify GAT actually ran ----
if (!file.exists(file.path(OUTDIR, "gat", "training_log.json"))) stop("GAT training_log.json missing — GAT likely did not run")

# ---- Write protocol & report ----
protocol_path <- file.path(OUTDIR, "2025-08-18_analysis_protocol.md")
report_path   <- file.path(OUTDIR, "2025-08-18_report.md")

n_symbols <- nrow(res$expression_symbol)
n_samples <- ncol(res$expression_symbol)
n_flips   <- if (!is.null(res$flips)) nrow(res$flips) else 0
pri_nodes_cov <- if (!is.null(res$priors) && length(res$priors)) {
  covered <- unique(c(unlist(lapply(res$priors, `[[`, "from")), unlist(lapply(res$priors, `[[`, "to"))))
  round(100*mean(rownames(res$expression_symbol) %in% covered), 1)
} else 0

cat(paste0(
"# Analysis Protocol — Hybrid Prior + ANN Halo + GAT (Symbols)\n\n",
"**Dataset**: ", basename(data_path), "\n\n",
"**Probe→Symbol mapping**: collapse to SYMBOL by max variance per symbol.\n\n",
"**Hybrid prior**: BioGRID/STRING/ENCODE/TRRUST mapped Entrez→SYMBOL within universe; de-duplicated; undirected for coexpr.\n\n",
"**Halo (ANN)**: RcppAnnoy (cosine on rank-standardized expression), per-gene candidates from both conditions; exact Spearman computed only for prior+halo pairs.\n\n",
"**Selection**: top-k=150 per gene with quotas core=0.6, halo=0.35, explore=5; thresholds tau=0.30, tau2=0.20; signed edges preserved.\n\n",
"**GAT**: heads=4, hidden_dim=64, epochs=200, lr=2e-3, wd=1e-4, patience=20; relations: coexpr_prior, coexpr_halo.\n\n",
"**Outputs**: MTX adjacencies (normal/disease), flips CSV (FDR<0.05), centrality CSV, GAT logs/artifacts, results RDS.\n\n",
"**Repro**: seed=1; OMP/MKL/OPENBLAS=1; reticulate Python=", Sys.getenv("RETICULATE_PYTHON"), "\n"
), file=protocol_path)

cat(paste0(
"# Analysis Report — Lung Cancer (Hybrid ANN)\n\n",
"**Symbols analyzed**: ", n_symbols, " • **Samples**: ", n_samples, " • **Runtime**: ", round(runtime_min,1), " min\n\n",
"**Prior coverage of universe**: ", pri_nodes_cov, "% of symbols have ≥1 prior edge\n\n",
"**Parameters**: top-k=150, core=0.6, halo=0.35, explore=5, tau=0.30, tau2=0.20; Spearman per condition\n\n",
"**Flips (FDR<0.05)**: ", n_flips, " edges\n\n",
"**Artifacts**:\n",
"- `data/normal_adjacency_hybrid_ann.mtx`, `data/disease_adjacency_hybrid_ann.mtx`\n",
"- `data/sign_flips_fdr_hybrid_ann.csv`\n",
"- `data/centrality_signed_hybrid_ann.csv`\n",
"- `gat/training_log.json`, embeddings/attention\n",
"- `results_hybrid_ann.rds`\n"
), file=report_path)

writeLines(c(
  paste("Completed:", Sys.time()),
  paste("Runtime_min:", round(runtime_min,2)),
  paste("Symbols:", n_symbols),
  paste("Samples:", n_samples),
  paste("TopK:", 150),
  paste("Core_quota:", 0.6), paste("Halo_quota:", 0.35), paste("Explore_k:", 5),
  paste("Signed:", TRUE), paste("GAT:", "ON (see gat/training_log.json)")
), file.path(OUTDIR, "logs", "analysis_summary.txt"))

cat(sprintf("✅ Done. Outputs in %s (protocol + report written)\n", OUTDIR))

chmod +x scripts/run_hybrid_ann_lung.R
## **3) Run it**

Rscript scripts/run_hybrid_ann_lung.R

# **Acceptance criteria (must pass)**
- examples/2025-08-18_lung_cancer_example/ contains:
	- data/normal_adjacency_hybrid_ann.mtx and data/disease_adjacency_hybrid_ann.mtx
	- data/sign_flips_fdr_hybrid_ann.csv
	- data/centrality_signed_hybrid_ann.csv
	- gat/training_log.json with epochs/loss/device/seed
	- results_hybrid_ann.rds
	- 2025-08-18_analysis_protocol.md and 2025-08-18_report.md
- Log shows **Symbols** ≥ 1,500 (after probe→symbol) and **GAT: ON**.
- No full p×p correlation matrices allocated; edgewise Spearman restricted to **prior+halo** pairs.
**If GAT fails to initialize**: confirm RETICULATE_PYTHON points to the conda env above and that only torch, torch_geometric, torch_scatter, torch_sparse, numpy are installed (no heavyweight extras).