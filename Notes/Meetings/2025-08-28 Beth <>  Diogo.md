#abiologics #compbio #beth 

- Designability?
	- Main issue is solubility
	- Can we solve that we Ariel’s first component of the pipeline and then use the same XML as before?

- Main differences in pipeline:
	- before: Diff -> all gly back -> MPNN -> AF -> rosetta -> score -> filter
	- Now: diff -> 100 MPNN -> AF -> check conformation against diffusion (RMSD and pLDDT) -> those that pass get 1 and computer percentage -> best one -> rosetta interface design -> 5 designs -> those get new MPNN seq on surface (because rosetta may have broken things and we need to rebuild) -> AF -> score by rosetta -> filter
	- It’s breaking at:
		- MPNN
		- Sequences that are too hydrophobic
		- Design

- How can I help
	- Coordinate with PI
	- New RF diffusion model