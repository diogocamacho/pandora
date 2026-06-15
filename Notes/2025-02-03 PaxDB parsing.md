---
tags:
  - compbio
Follow up:
---


---
## 🧠 Note


To iterate and build a data frame later. But this is the gist:

```R
fname <- "~/Downloads/paxdb-abundance-files-v5.0/9606-BRAIN-integrated.txt"
org <- strsplit(x = tolower(readLines(fname, 6)[6]), split = "\\: ")[[1]][2]
dat <- readr::read_delim(file = fname, delim = "\t", skip = 12, col_names = FALSE) %>% dplyr::rename(string_id = X1, !!paste(tis, "_ppm", sep = "") := X2)
```
`

This will read out the files from PaxDb and put them in a tibble. I then need to append them all in a single tibble/matrix for me to be able to compute the specificity of proteins to tissues. 

Other analyses that need to be done is plotting the tissue proteomics (from PaxDb) against the tissue transcriptomics (RNA-seq from HPA + GTEx)



---
## ✅ Action Items
