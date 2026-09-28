---
tags:
  - compbio
  - ideas
Date: 2025-10-22
Follow up:
---


> [!tip] The core idea



If we use patient population data (eg, from TCGA), we can calculate the proportion of patients that show a given gene as relevant for the disease, building a “consensus signature”. This signature allows us to visualize what is the regulatory subnetwork that encompasses the disease.


```
A = adjacency_matrix
D = disease_matrix
	
for g in D
	sum(patients_g) / num(patients)
		
DN = A|D = subnetwork of disease genes	
```


Tying this with the perturbation data (chemical, for this case), allows us to assess where the existing perturbations are having impact in the context of the network and potential areas for discovery of new drugs.
