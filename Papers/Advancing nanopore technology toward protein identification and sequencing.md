---
title: "Advancing nanopore technology toward protein identification and sequencing"
source: "https://www.cell.com/trends/biochemical-sciences/fulltext/S0968-0004(25)00109-4?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS0968000425001094%3Fshowall%3Dtrue"
author:
  - "[[Verena Rukes]]"
  - "[[Chan Cao]]"
published:
created: 2026-10-02
description: "Proteins drive most cellular functions and are key players in diseases, yet proteomicsstill lags behind genomics due to the complexity, diversity, and dynamic nature ofproteoforms. Nanopore technology – known for real-time, single-molecule DNA sequencing– is a promising contender to revolutionize protein analysis. The method has recentlybeen adapted to proteins, showing strong potential for protein identification. However,true de novo protein sequencing with nanopores remains an open challenge. This reviewcompares current nanopore-based strategies for protein analysis and highlights theirtechnical hurdles towards application. Additionally, engineering strategies are exploredaiming to bridge the gap towards single-molecule protein analysis and sequencing."
tags:
  - "clippings"
---
## Highlights

- Thanks to recent developments, nanopore tools that fingerprint proteins or peptides are within reach, while methods for nanopore protein sequencing still require further development.
- A variety of strategies are currently under development, such as sensing full-length or fragmented proteins and controlling the motion of protein analytes through the nanopore.
- Future improvements may leverage cutting-edge approaches, including electroosmotic flux (EOF) optimization, pore functionalization, and analyte modifications, to enhance nanopore performance and broaden its applicability.

## Abstract

Proteins drive most cellular functions and are key players in diseases, yet proteomics still lags behind genomics due to the complexity, diversity, and dynamic nature of proteoforms. Nanopore technology – known for real-time, single-molecule DNA sequencing – is a promising contender to revolutionize protein analysis. The method has recently been adapted to proteins, showing strong potential for protein identification. However, true *de novo* protein sequencing with nanopores remains an open challenge. This review compares current nanopore-based strategies for protein analysis and highlights their technical hurdles towards application. Additionally, engineering strategies are explored aiming to bridge the gap towards single-molecule protein analysis and sequencing.

## The evolution of protein analysis: nanopores and their emerging role

DNA sequencing and single-cell genomics have profoundly expanded our understanding of cellular processes and disease mechanisms at the molecular level in recent decades. This success has sparked a desire to achieve similar breakthroughs in protein analysis, as proteins are the primary functional units within cells. Due to steps like alternative RNA splicing and post-translational modifications (PTMs), millions of **proteoforms** (see [Glossary](#gs0005)) are expressed from ~20 000 human protein-encoding genes \[

1.

Conibear, A.C.

**Deciphering protein post-translational modifications using chemical biology tools**

*Nat. Rev. Chem.* 2020; **4**:674-695

2.

Timp, W. ∙ Timp, G.

**Beyond mass spectrometry, the next step in proteomics**

*Sci. Adv.* 2020; **6**, eaax8978

3.

Smith, L.M. ∙ Kelleher, N.L.

**Proteoform: a single term describing protein complexity**

*Nat. Methods.* 2013; **10**:186-187

\]. Deciphering this proteome, which is not fully accessible through the genome, is essential for a holistic understanding of biology and advanced diagnostics. While mass spectrometry (MS) has long been the gold standard for protein analysis, it lacks the sensitivity and resolution of single-molecule techniques. Bottom-up MS faces limitations in terms of costs, detection limits, dynamic range, and reading length \[

4.

Nesvizhskii, A.I. ∙ Aebersold, R.

**Interpretation of shotgun proteomic data**

*Mol. Cell. Proteomics.* 2005; **4**:1419-1440

5.

Chait, B.T.

**Mass spectrometry: bottom-up or top-down?**

*Science.* 2006; **314**:65-66

6.

Hughes, C....

***De novo* sequencing methods in proteomics**

Hubbard, S.J. ∙ Jones, A.R. (Editors)

**Proteome Bioinformatics**

Humana Press, 2010; 105-121

\]. Moreover, unlike genomics, proteomics cannot rely on amplification steps, necessitating novel approaches to protein analysis.

As a consequence, single-molecule techniques for protein analysis have gained significant traction to complement existing methods \[

7.

Alfaro, J.A....

**The emerging landscape of single-molecule protein sequencing technologies**

*Nat. Methods.* 2021; **18**:604-617

\]. Among these emerging technologies, nanopore-based sensing ([Box 1](#b0005)) is particularly promising \[

8.

Aksimentiev, A.

**Thread, read, rewind, repeat: towards using nanopores for protein sequencing**

*Nature.* 2024; **633**:533-534

,

9.

Motone, K. ∙ Nivala, J.

**Not if but when nanopore protein sequencing meets single-cell proteomics**

*Nat. Methods.* 2023; **20**:336-338

\]. The success of nanopore technology in revolutionizing nucleic acid sequencing – providing ultra-long reads of DNA and RNA \[

10.

Manrao, E.A....

**Reading DNA at single-nucleotide resolution with a mutant MspA nanopore and phi29 DNA polymerase**

*Nat. Biotechnol.* 2012; **30**:349-353

,

11.

Lu, H....

**Oxford Nanopore MinION sequencing and genome assembly**

*Genomics Proteomics Bioinformatics.* 2016; **14**:265-279

\] – has paved the way for its application in protein analysis and sequencing. For proteomics measurements, the portability and low cost of nanopore devices could allow unprecedented flexibility.

Box 1

Nanopore sensing principle

Nanopore measurements rely on a single nanometer-sized pore that is the only connection between two reservoirs of electrolyte \[

90.

Kasianowicz, J.J....

**Characterization of individual polynucleotide molecules using a membranechannel**

*Proc. Natl. Acad. Sci.* 1996; **93**:13770-13773

\]. Voltage is applied across the pore to generate a steady stream of ionic flow through the pore. The pore can thereby be a fabricated hole in materials such as silicon nitride or molybdenum disulfide which are examples of solid state nanopores. Biological nanopores, on the other hand, are usually protein pores adapted from nature that are inserted into artificial lipid bilayers for measurements. While fabricated pores are compatible with higher voltages and endure extreme conditions, biological nanopores generally offer higher reproducibility and sensitivity.

Interactions between an analyte and the pore can be measured as transient occlusion of the opening results in blocked current signals \[

90.

Kasianowicz, J.J....

**Characterization of individual polynucleotide molecules using a membranechannel**

*Proc. Natl. Acad. Sci.* 1996; **93**:13770-13773

\]. The physical effect behind the current modulation was first described in the work of James C. Maxwell in the 19th century \[

91.

Maxwell, J.C.

**A Treatise on Electricity and Magnetism**

Clarendon Press, 1873

[Google Scholar](https://scholar.google.com/scholar?q=J.C.MaxwellA+Treatise+on+Electricity+and+Magnetism1873Clarendon+Press)

\]: as a particle enters the pore, the conductivity changes, leading to a variance of electrical resistance and ultimately altering the current signal. The frequency of these events correlates with analyte concentration, while the blockage depth, duration, and patterns of current changes reveal analyte-specific characteristics. Parameters influencing these signals include the analyte's size, shape, charge, diffusion coefficient, and specific interactions with the pore, as well as its position within the pore lumen. The interplay of these factors makes the interpretation of current signals intricate and involves mechanisms that are yet to be fully understood. Measurements can in principle be highly parallelized in flow cells as utilized by Oxford Nanopore Technologies which allows fast and portable detection \[

92.

Oxford Nanopore Technologies

**How nanopore sequencing works. Online tutorial**

[https://nanoporetech.com/platform/technology](https://nanoporetech.com/platform/technology)

Date: 2024

Date accessed: December 3, 2024

[Google Scholar](https://scholar.google.com/scholar?q=Oxford+Nanopore+TechnologiesHow+nanopore+sequencing+works.+Online+tutorialhttps%3A%2F%2Fnanoporetech.com%2Fplatform%2Ftechnology2024)

\].

In the following sections we delve into the field of nanopore-based protein analysis, highlighting different strategies that are currently being developed for protein analysis and sequencing, with a focus on the advantages of each. Additionally, we discuss the most recent engineering improvements that will help to achieve practical nanopore-based protein sensing and sequencing technology.

## Concepts for nanopore protein identification and sequencing

Proteins are complex molecules embodying multiple layers of biological information. Composed of 20 chemically diverse amino acids, they fold into intricate three-dimensional structures crucial for their function. Additionally, PTMs can dictate the location, function, degradation, as well as interactions of proteins, adding another layer of complexity to their regulation.

Nanopore technology can access distinct subsets of these properties, depending on the analytical approach used as summarized in [Table 1](#t0005). In the following, we summarize strategies for nanopore-based protein analysis toward sequencing ([Figure 1](#f0005)), focusing on recent developments and highlighting the strengths and weaknesses of each approach.

![Figure 1](https://www.cell.com/cms/10.1016/j.tibs.2025.05.005/asset/3cbccd34-e417-4475-854f-13b3e7f787ea/main.assets/gr1_lrg.jpg)

Figure 1 Illustration of different nanopore approaches to protein analysis.

![Table 1](https://www.cell.com/cms/10.1016/j.tibs.2025.05.005/asset/abd1c191-85c2-4892-ab99-9621a6418ec6/main.assets/fx1_lrg.jpg)

Table 1 Summary of compatibilities of the different nanopore systems a, b White indicates that the system is conceptually incompatible with the listed aims. The darker green indicates that the approach is well suited for the given aim based on recent publications and scientific knowledge, while light green panels indicate the necessity of substantial development to reach the aim. In this table PTMs that consist of cleavage or added chemical groups are considered as ‘small’, while complex molecules such as glycans and proteins are referred to as ‘large’ PTMs. Only the sensing of native proteins is considered suitable for large PTMs, since other strategies have been proposed with narrow pores that cannot accommodate large PTMs. Open table in a new tab

### Identifying full-length proteins

Nanopores can measure single protein molecules in their entirety ([Figure 1](#f0005) A). As the whole protein passes through or is trapped inside the nanopore, it modulates the current output which can be used for its characterization or identification. The identification process is thereby essentially a classification problem and can, for example, be tackled with machine-learning-based methods \[

12.

Kolmogorov, M....

**Single-molecule protein identification by sub-nanopore sensors**

*PLoS Comput. Biol.* 2017; **13**, e1005356

\]. **Fingerprinting** full-length proteins has the advantage of being compatible with **mixture samples** and requiring low amounts of sample preparation.

Analyzing folded proteins can provide structural and dynamic insights. This has been explored in fabricated nanopores excessively, as summarized elsewhere \[

13.

Meyer, N....

**Solid-state and polymer nanopores for protein sensing: a review**

*Adv. Colloid Interf. Sci.* 2021; **298**, 102561

,

14.

Luo, Y....

**Application of Solid-State Nanopore in Protein Detection**

*Int. J. Mol. Sci.* 2020; **21**:2808

\]. In these systems, current blockages often show a clear dependence on the size and shape of the **analyte** which can allow shape-based fingerprinting \[

15.

Yusko, E.C....

**Real-time shape approximation and fingerprinting of single proteins using a nanopore**

*Nat. Nanotechnol.* 2017; **12**:360-367

\]. Notably, Schmid *et al.* developed a trap for folded proteins based on **solid state nanopores** \[

16.

Schmid, S....

**Nanopore electro-osmotic trap for the label-free study of single proteins and their conformations**

*Nat. Nanotechnol.* 2021; **16**:1244-1250

\] that enables prolonged examination of proteins. In contrast, the most used **biological nanopores**, such as alpha hemolysin (α-HL; [Figure 1](#f0005) A, right), *Mycobacterium smegmatis* porin A (MspA; [Figure 1](#f0005) B, right), or aerolysin ([Figure 1](#f0005) B, left), are too small to accommodate fully folded proteins. Therefore, new pores have been established for sensing, the biggest being Pleurotolysin AB (PlyAB; [Figure 1](#f0005) A, left). PlyAB can distinguish a single amino acid substitution in native hemoglobin with more than 97% accuracy in translocation experiments based on a shift in position inside of the nanopore \[

17.

Huang, G....

**PlyAB Nanopores detect single amino acid differences in folded haemoglobin from blood\*\***

*Angew. Chem. Int. Ed.* 2022; **61**, e202206227

\]. A more common approach to analyzing folded proteins with biological nanopores is, however, trapping them in funnel shaped pores such as Cytolysin A (ClyA) \[

18.

Galenkamp, N.S....

**Directional conformer exchange in dihydrofolate reductase revealed by single-molecule nanopore recordings**

*Nat. Chem.* 2020; **12**:481-488

,

19.

Li, F....

**Mapping the conformational energy landscape of Abl kinase using ClyA nanopore tweezers**

*Nat. Commun.* 2022; **13**:3541

\] or YaxAB \[

20.

Jeong, K.-B....

**Single-molecule fingerprinting of protein-drug interaction using a funneled biological nanopore**

*Nat. Commun.* 2023; **14**:1461

\] to study their conformations or interactions instead of identification.

The size compatibility between the folded protein analyte and nanopore is crucial for the mentioned applications. The analyte must be small enough to enter the pore, yet large enough to generate detectable current variations. A comprehensive identification platform for native proteins may thus benefit from funnel-shaped pores that can accommodate a range of sizes \[

21.

Straathof, S....

**Protein sizing with 15 nm conical biological Nanopore YaxAB**

*ACS Nano.* 2023; **17**:13685-13699

\], and may require an array of nanopores with varying dimensions. Alternatively, the protein analytes can be chemically unfolded and measured in single-file translocations. Sequence-specific information that would otherwise be buried inside the folded protein can then contribute to the current readout, thereby expanding the scope of detectable protein characteristics.

Measurement of unfolded proteins has been achieved with sodium dodecyl sulfate (SDS) in solid state nanopores \[

22.

Restrepo-Pérez, L....

**SDS-assisted protein transport through solid-state nanopores**

*Nanoscale.* 2017; **9**:11685-11693

[Crossref](https://doi.org/10.1039/C7NR02450A)

[PubMed](https://pubmed.ncbi.nlm.nih.gov/28776058/)

[Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1039%2FC7NR02450A&pmid=28776058)

23.

Soni, N....

**Single-file translocation dynamics of SDS-denatured, whole proteins through sub-5 nm solid-state Nanopores**

*ACS Nano.* 2022; **16**:11405-11414

24.

Kennedy, E....

**Reading the primary structure of a protein with 0.07 nm3 resolution using a subnanometre-diameter pore**

*Nat. Nanotechnol.* 2016; **11**:968-976

\]. Most recent advances have been made in optimizing the electroosmotic flux (EOF) in biological nanopores to allow capture and translocation of protein analytes regardless of their charge properties (as discussed in the EOF engineering section). For instance, maltose-binding protein (MBP) and green fluorescent protein (GFP) were discriminated with near 90% accuracy when unfolded and measured by α-HL in a guanidinium chloride (GdmCl) condition \[

25.

Yu, L....

**Unidirectional single-file transport of full-length proteins through a nanopore**

*Nat. Biotechnol.* 2023; **41**:1130-1139

\]. In this condition, it was found that the proteins required a negatively charged terminus for efficient capture with α-HL. Alternatively, α-HL \[

26.

Martin-Baniandres, P....

**Enzyme-less nanopore detection of post-translational modifications within long polypeptides**

*Nat. Nanotechnol.* 2023; **18**:1335-1340

\] or cytotoxin K (CytK) \[

27.

Sauciuc, A....

**Translocation of linearized full-length proteins through an engineered nanopore under opposing electrophoretic force**

*Nat. Biotechnol.* 2024; **42**:1275-1281

\] have been genetically engineered and used in combination with urea to measure unfolded polypeptides and proteins.

Overall, the capture and fingerprinting of full-length proteins for their discrimination has been demonstrated in several nanopore systems for both native and unfolded proteins. However, it is currently unclear what the limitations of these systems are, both in terms of numbers of distinguishable proteins and similarity in protein analytes. To translate these concepts into analytical devices, databases containing individually measured proteins are needed to learn their unique fingerprints for identification (see [Outstanding questions](#b0010)). Expanding such databases will allow us to further assess the sensitivity and limitations of these systems and pave the way to real-time protein identification assisted by machine-learning models.

### Fragmentation towards sequencing

Fragmentation, as an alternative concept, simplifies protein complexity by breaking them into smaller peptides ([Figure 1](#f0005) B), a strategy central to conventional bottom-up MS. The protein analyte is subjected to a protease (often trypsin), resulting in peptides with sequence-dependent lengths and amino acid compositions. While MS measures mass-to-charge ratios of the fragments, nanopores also have sizing abilities. It was first shown that α-HL can be used to produce spectra similar to MS when measuring polyethylene glycol (PEG), since the depth of current blockage positively correlates with the analyte size \[

28.

Robertson, J.W.F....

**Single-molecule mass spectrometry in solution using a solitary nanopore**

*Proc. Natl. Acad. Sci.* 2007; **104**:8207-8211

\]. Here we discuss recent studies that apply this principle to fragmented protein samples.

The Fragaceatoxin C (FraC) nanopore demonstrates a directly proportional relationship between peptide mass and current at an optimized pH of 3.8 \[

29.

Huang, G....

**FraC nanopores with adjustable diameter identify the mass of opposite-charge peptides with 44 dalton resolution**

*Nat. Commun.* 2019; **10**:835

\], yielding spectra highly similar to MS references for digested proteins \[

30.

Lucas, F.L.R....

**Protein identification by nanopore peptide profiling**

*Nat. Commun.* 2021; **12**:5795

\]. Another nanopore of interest, aerolysin ([Figure 1](#f0005) B, left), can discriminate – depending on the conditions – between 9 \[

31.

Ge, Y....

**Aerolysin nanopore-based identification of proteinogenic amino acids using a bipolar peptide probe**

*Nanoscale Adv.* 2022; **4**:3883-3891

[Crossref](https://doi.org/10.1039/D2NA00190J)

[PubMed](https://pubmed.ncbi.nlm.nih.gov/36133334/)

[Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1039%2FD2NA00190J&pmid=36133334)

\] or 13 \[

32.

Ouldali, H....

**Electrical recognition of the twenty proteinogenic amino acids using an aerolysin nanopore**

*Nat. Biotechnol.* 2020; **38**:176-181

\] proteinogenic amino acids when single mutations are made on constant peptide backbones. Wild-type aerolysin captures peptides of varying charge in ultra-high-salt conditions (4 M KCl) \[

33.

Bakshloo, M.A....

**Polypeptide analysis for nanopore-based protein identification**

*Nano Res.* 2022; **15**:9831-9842

\] producing distinct current-blockage spectra for digested proteins \[

34.

Afshar Bakshloo, M....

**Nanopore-based protein identification**

*J. Am. Chem. Soc.* 2022; **144**:2716-2725

\]. At lower salt (1M KCl), similar fingerprints are achieved via an acidic–aromatic **sensing region** in the β-barrel of aerolysin, improving the discrimination of peptides at acidic pH \[

35.

Versloot, R.C.A....

**β-Barrel nanopores with an acidic–aromatic sensing region identify proteinogenic peptides at low pH**

*ACS Nano.* 2022; **16**:7258-7268

\]. Beyond this, recent advances combine multiple fragmentation strategies to enhance informational output. Peptides can be further digested by a exopeptidase during measurements with aerolysin \[

36.

Behrends, J. and Ensslen, T. (2024) Method and systems for identifying a sequence of monomer units of a biological or synthetic heteropolymer, US20240077491A1 (patent)

[Google Scholar](https://scholar.google.com/scholar?q=Behrends%2C+J.+and+Ensslen%2C+T.+%282024%29+Method+and+systems+for+identifying+a+sequence+of+monomer+units+of+a+biological+or+synthetic+heteropolymer%2C+US20240077491A1+%28patent%29)

\], allowing identification of peptides with more than three amino acids using statistical methods \[

37.

Hoßbach, J....

**Peptide classification from statistical analysis of nanopore sensing experiments**

*J. Chem. Phys.* 2025; **162**, 084107

\]. It is worth noting that this sensitivity of nanopores toward peptides also has implications for biomarker-detection as summarized elsewhere \[

38.

Chen, X....

**Nanopore single-molecule analysis of biomarkers: providing possible clues to disease diagnosis**

*TrAC Trends Anal. Chem.* 2023; **162**, 117060

39.

Wiswedel, R....

**Beta-barrel nanopores as diagnostic sensors: an engineering perspective**

*Biosensors.* 2024; **14**:345

40.

Zhang, Y....

**Protein nanopore-based sensors for public health analyte detection**

*J. Mater. Chem. B.* 2024; **12**:9845-9862

[Crossref](https://doi.org/10.1039/D4TB01149J)

[PubMed](https://pubmed.ncbi.nlm.nih.gov/39258387/)

[Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1039%2FD4TB01149J&pmid=39258387)

\].

Remarkably, modified nanopores have recently achieved unambiguous identification of single amino acid molecules \[

41.

Zhang, M....

**Real-time detection of 20 amino acids and discrimination of pathologically relevant peptides with functionalized nanopore**

*Nat. Methods.* 2024; **21**:609-618

,

42.

Wang, K....

**Unambiguous discrimination of all 20 proteinogenic amino acids and their modifications by nanopore**

*Nat. Methods.* 2024; **21**:92-101

\]. Identifying single amino acids marks a significant advance in sensitivity, potentially enhancing fragmentation-based protein sequencing. However, recovering sequences from these measurements is challenging due to the loss of sequential order. This issue also makes fragmentation approaches unsuitable for mixtures, as detecting other species complicates sequence reconstruction. These shortcomings could be addressed if full-length proteins were fragmented near the nanopore, delivering fragments successively. Zhang *et al.* demonstrated this with a proteasome nanopore in 'chop and drop' mode, in which proteins are unfolded, digested, and measured as fragments pass through the nanopore \[

43.

Zhang, S....

**Bottom-up fabrication of a proteasome-nanopore that unravels and processes single proteins**

*Nat. Chem.* 2021; **13**:1192-1199

\].

As described, nanopores have been demonstrated to distinguish peptides and even single amino acids with impressive accuracy. Compared to bottom-up MS, nanopores could provide a more portable and lower-cost alternative. Nanopore spectroscopy could be valuable in scenarios where MS faces challenges, such as ionizing certain fragments or differentiating identical-mass analytes. The current signatures of each analyte are recorded as individual events, with the goal of identification based on prior knowledge. Thereby, the correlation between fragment size and current blockage depth offers an interpretable, and often well-separated feature, enhancing the potential for accuracy. However, inferring sequences from spectra complicates analysis (see Outstanding questions) and requires more data points than full-length protein identification.

### Controlled motion during translocation

Nanopore DNA sequencing has been implemented by slowly ratcheting DNA through nanopores using DNA-processing enzymes \[

10.

Manrao, E.A....

**Reading DNA at single-nucleotide resolution with a mutant MspA nanopore and phi29 DNA polymerase**

*Nat. Biotechnol.* 2012; **30**:349-353

,

44.

Lieberman, K.R....

**Processive replication of single DNA molecules in a nanopore catalyzed by phi29 DNA polymerase**

*J. Am. Chem. Soc.* 2010; **132**:17961-17972

\]. Slowing down the translocation allows for sufficient measurement time to resolve currents that are caused by subsequent polymer segments. This has been the key to ***de novo* sequencing** and the basis of ultra-long reads. The current corresponding to each step of the enzyme is extracted, and the corresponding sequence is identified using statistical \[

45.

Noakes, M.T....

**Increasing the accuracy of nanopore DNA sequencing using a time-varying cross membrane voltage**

*Nat. Biotechnol.* 2019; **37**:651-656

\] or machine-learning-based \[

46.

Wick, R.R....

**Performance of neural network basecalling tools for Oxford Nanopore sequencing**

*Genome Biol.* 2019; **20**:129

\] analysis. Implementing a similar system for motion-controlled protein translocation is therefore the most promising approach to reach *de novo* protein sequencing ([Figure 1](#f0005) C).

Three groups independently utilized established DNA motors to control peptide motion through MspA \[

47.

Brinkerhoff, H....

**Multiple rereads of single proteins at single–amino acid resolution using nanopores**

*Science.* 2021; **374**:1509-1513

48.

Chen, Z....

**Controlled movement of ssDNA conjugated peptide through *Mycobacterium smegmatis* porin A (MspA) nanopore by a helicase motor for peptide sequencing application**

*Chem. Sci.* 2021; **12**:15750-15756

[Crossref](https://doi.org/10.1039/D1SC04342K)

[PubMed](https://pubmed.ncbi.nlm.nih.gov/35003607/)

[Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1039%2FD1SC04342K&pmid=35003607)

49.

Yan, S....

**Single molecule ratcheting motion of peptides in a *Mycobacterium smegmatis* porin A (MspA) nanopore**

*Nano Lett.* 2021; **21**:6703-6710

\] ([Figure 1](#f0005) C, left). The peptides were covalently linked to the end of a single-stranded DNA (ssDNA). Following their capture, the DNA–peptide constructs were pulled out of the pore by the DNA motors. Since MspA is funnel-shaped, there is a gap between the sensing region of the pore and the position of the motor enzyme above the pore. This gap makes it possible to measure peptides of ~18 amino acids in length before the motor enzyme reaches the end of the DNA and disassociates.

To control the speed of longer polypeptides, motors that can process proteins directly are needed. In one study, a proteasome-nanopore was fabricated \[

43.

Zhang, S....

**Bottom-up fabrication of a proteasome-nanopore that unravels and processes single proteins**

*Nat. Chem.* 2021; **13**:1192-1199

\] which can unfold and feed tagged proteins into a nanopore, thereby prolonging the translocation. However, its utility for protein identification remains unassessed. The other protein motor enzyme that was explored is ClpX, which was first used to pull tagged, folded proteins though α-HL in 2013 \[

50.

Nivala, J....

**Discrimination among protein variants using an unfoldase-coupled nanopore**

*ACS Nano.* 2014; **8**:12365-12375

,

51.

Nivala, J....

**Unfoldase-mediated protein translocation through an α-hemolysin nanopore**

*Nat. Biotechnol.* 2013; **31**:247-250

\] ([Figure 1](#f0005) C, right). More recently, ClpX was employed with a confidential mutant of the nanopore CsgG in commercial flow cells to investigate long protein constructs \[

52.

Motone, K....

**Multi-pass, single-molecule nanopore reading of long protein strands**

*Nature.* 2024; **633**:662-669

\]. Motone *et al.* designed protein analytes that were electrophoretically trapped inside the nanopore and then pulled out by ClpX in steps of ~two amino acids at a time. Substitutions on unstructured polypeptide backbones could be discriminated with 28% accuracy in a 20-way classification between all amino acids. Introducing a ‘slipping sequence’ made it possible for the analyte to slip back into the pore and thus be remeasured. This increased accuracy to 61% with ten re-reads. When an analyte with protein structure was pulled through the nanopore, signal features were influenced by the unfolding process in addition to sequence-dependent current responses.

Using enzymes for motion control introduces a dependence on the quality and uniformity of the motor enzyme’s steps. However, there are only few alternative strategies for motion control. Qing and Bayley introduced a chemical solution in which α-HL was equipped with a five-cysteine track in its β-barrel region \[

53.

Qing, Y. ∙ Bayley, H.

**Enzymeless DNA base identification by chemical stepping in a nanopore**

*J. Am. Chem. Soc.* 2021; **143**:18181-18187

\]. DNA analytes were conjugated with traptavidin-capped peptide carriers that allowed the analyte to be trapped in the pore. The DNA then engaged in covalent disulfate bonds with the α-HL barrel. When pulled by an applied voltage, the analyte was then handed along the cysteine track. Leveraging engineering advances instead, an atomic force microscopy (AFM) tip has been used to move proteins through an inorganic sub-nanometer-diameter pore \[

54.

Dong, Z....

**Discriminating residue substitutions in a single protein molecule using a sub-nanopore**

*ACS Nano.* 2017; **11**:5440-5452

\]. Two variants of the H3 histone were unfolded by SDS and slowly translocated at 4 nm/s (ten residues/s). In this system, substituted amino acids could be discriminated. Most recently, Leitao *et al.* demonstrated that glass nanopores can be combined with a long-range piezo-scanner to accurately control the motion of the pore \[

55.

Leitao, S.M....

**Spatially multiplexed single-molecule translocations through a nanopore at controlled speeds**

*Nat. Nanotechnol.* 2023; **18**:1078-1084

\]. Double-stranded DNA (dsDNA) was immobilized by tethering it to a glass surface by one end. The pore then repeatedly scanned up and down the analyte at a velocity as low as 0.1 μm s <sup>–1</sup>. These systems could circumvent the reliance on motor enzymes, but with a tradeoff of reduced reading length (in the case of cysteine tracks) or limitations in scalability and portability (when using piezoelectric scanners).

Slow ratcheting of proteins through the nanopore has the most obvious potential of *de novo* sequencing, even in mixture samples. A central obstacle toward achieving this is the sensitivity of the nanopore. This includes a need to avoid the disruptive impact of protein structure on sequencing signals (see Outstanding questions), to which a combination with chemical denaturants presents a promising avenue. Other engineering strategies to improve sensitivity are discussed later in the sections ‘Pore functionalization’ and ‘Specific analyte modifiers’.

While *de novo* sequencing is not yet within reach, motion control could also enhance the fingerprinting of peptides or proteins. Thanks to the longer interaction times and positional control, a larger number of peptide/protein fingerprints should be differentiable with motion control compared to free translocations. However, motion control would require chemical modification at the C and/or N terminus of proteins/peptides either to link them to a surface, to DNA, or to a recognition tag for protein motors. To date, strategies such as co-expressing the analyte with recognition tags \[

52.

Motone, K....

**Multi-pass, single-molecule nanopore reading of long protein strands**

*Nature.* 2024; **633**:662-669

\] or charged segments for threading \[

56.

Chen, X....

**Resolving sulfation PTMs on a plant peptide hormone using nanopore sequencing**

*bioRxiv.* 2024;

2024.05.08.593138

[Google Scholar](https://scholar.google.com/scholar?q=X.ChenResolving+sulfation+PTMs+on+a+plant+peptide+hormone+using+nanopore+sequencingbioRxiv20242024.05.08.593138)

\], or producing the analyte with a C-terminal cysteine compatible with **click chemistry** \[

57.

Nova, I.C....

**Detection of phosphorylation post-translational modifications along single peptides with nanopores**

*Nat. Biotechnol.* 2024; **42**:710-714

\] have been used to prove concepts for motion control with peptides or proteins. When moving to real samples, developing universal and efficient sample preparation will be a key hurdle to overcome. Chemically tagging the C terminus of proteins selectively is challenging due to carboxylic acid moieties in glutamate and aspartate residues \[

58.

Hoyt, E.A....

**Contemporary approaches to site-selective protein modification**

*Nat. Rev. Chem.* 2019; **3**:147-171

59.

Zeng, Y....

**C-terminal modification and functionalization of proteins via a self-cleavage tag triggered by a small molecule**

*Nat. Commun.* 2023; **14**:7169

60.

Bloom, S....

**Decarboxylative alkylation for site-selective bioconjugation of native proteins via oxidation potentials**

*Nat. Chem.* 2018; **10**:205-211

\]. While there are more tools available for N-terminal linkage, their efficiencies typically depend on the residue type at the N terminus \[

61.

De Rosa, L....

**Exploiting protein N-terminus for site-specific bioconjugation**

*Molecules.* 2021; **26**:3521

\], making a universal protocol challenging to establish. Additionally, most N-terminal groups in mammalian proteins are acetylated \[

62.

Rosen, C.B. ∙ Francis, M.B.

**Targeting the N terminus for site-selective protein modification**

*Nat. Chem. Biol.* 2017; **13**:697-705

\] and therefore inaccessible for chemical linkage, requiring new approaches. For example, the terminal residue may need to be cleaved before being linked further.

A commercialization for peptide/protein fingerprinting with motion control will thus require establishing both databases with fingerprints and development of optimized protocols for sample linkage to minimize sample loss as well as measurement times.

### Detecting PTMs

In addition to the amino acid sequence, PTMs dictate a large amount of protein functionality, making PTM identification an asset for any protein analysis tool. While cleavage is a form of PTMs, they also include the addition of chemical groups (e.g., phosphorylation, methylation), complex molecules (e.g., glycosylation, prenylation), or proteins/peptides (ubiquitylation, SUMOylation) to the sidechains of proteins. This greatly increases the chemical complexity of proteoforms to be identified. PTMs can, in principle, be added to the identification task in any nanopore system given that they physically fit into the nanopore sensor and produce identifiable changes in current output. Indeed, PTMs have been targeted in studies with full-length folded \[

63.

Wloka, C....

**Label-free and real-time detection of protein ubiquitination with a biological nanopore**

*ACS Nano.* 2017; **11**:4387-4394

\] or unfolded proteins \[

26.

Martin-Baniandres, P....

**Enzyme-less nanopore detection of post-translational modifications within long polypeptides**

*Nat. Nanotechnol.* 2023; **18**:1335-1340

\], peptides \[

64.

Restrepo-Pérez, L....

**Label-free detection of post-translational modifications with a nanopore**

*Nano Lett.* 2019; **19**:7957-7964

65.

Cao, C....

**Deep learning-assisted single-molecule detection of protein post-translational modifications with a biological nanopore**

*ACS Nano.* 2024; **18**:1504-1515

66.

Ensslen, T....

**Resolving isomeric posttranslational modifications using a biological nanopore as a sensor of molecular shape**

*J. Am. Chem. Soc.* 2022; **144**:16060-16068

\], single amino acids \[

41.

Zhang, M....

**Real-time detection of 20 amino acids and discrimination of pathologically relevant peptides with functionalized nanopore**

*Nat. Methods.* 2024; **21**:609-618

,

67.

Wang, F....

**MoS2 nanopore identifies single amino acids with sub-1 Dalton resolution**

*Nat. Commun.* 2023; **14**:2895

\], and motion-controlled settings using DNA \[

56.

Chen, X....

**Resolving sulfation PTMs on a plant peptide hormone using nanopore sequencing**

*bioRxiv.* 2024;

2024.05.08.593138

[Google Scholar](https://scholar.google.com/scholar?q=X.ChenResolving+sulfation+PTMs+on+a+plant+peptide+hormone+using+nanopore+sequencingbioRxiv20242024.05.08.593138)

,

57.

Nova, I.C....

**Detection of phosphorylation post-translational modifications along single peptides with nanopores**

*Nat. Biotechnol.* 2024; **42**:710-714

\] or protein motor enzymes \[

52.

Motone, K....

**Multi-pass, single-molecule nanopore reading of long protein strands**

*Nature.* 2024; **633**:662-669

\]. Overall, small PTMs – such as phosphorylation or methylation – are easier to detect, particularly in narrow biological nanopores. Larger PTMs, however, are more challenging due to spatial constraints. The field of PTM analysis using nanopores has been extensively reviewed elsewhere \[

68.

Zhao, X....

**Nanopore: emerging for detecting protein post-translational modifications**

*TrAC Trends Anal. Chem.* 2024; **173**, 117658

\].

## Tailoring nanopores to protein analysis: engineering strategies

The measurement of proteins with nanopores poses analyte-specific hurdles. Amino acids are heterogeneously charged, small, chemically complex, and at least 20 different ones need to be identified for sequencing. Here, we outline some of the optimization strategies that are most relevant to tailoring the method specifically to protein analysis and sequencing in recent and coming years ([Figure 2](#f0010)).

![Figure 2](https://www.cell.com/cms/10.1016/j.tibs.2025.05.005/asset/18cca615-ef2e-4461-9684-069f38922dd6/main.assets/gr2_lrg.jpg)

Figure 2 Specific engineering strategies that are currently being pursued to improve nanopore measurements of proteins.

### Engineering EOF for protein capture and transport

Unlike DNA, which carries a uniform negative charge, proteins have heterogeneous charge distributions, complicating their electrophoretic transport. This could lead to long durations between single-molecule interactions of the analyte with the nanopore, lowering the throughput of the method, or even no interactions at all. The EOF can address this by creating a driving force which is independent of analyte charge. Protein analytes can be dragged by a net water flux that results from the unequal number of water molecules carried by the ion species as they are transported through the nanopore sensor. In a simple system such as KCl, in which the ion species have similar mobility, the flux stems from unequal magnitude of ion movement in opposite directions \[

69.

Gubbiotti, A....

**Electroosmosis in nanopores: computational methods and technological applications**

*Adv. Phys. X.* 2022; **7**, 2036638

[PubMed](https://pubmed.ncbi.nlm.nih.gov/35874965/)

[Google Scholar](https://scholar.google.com/scholar_lookup?pmid=35874965)

\] ([Figure 2](#f0010) A). The uniform surface charge of materials such as glass \[

70.

Laohakunakorn, N....

**Electroosmotic flow reversal outside glass nanopores**

*Nano Lett.* 2015; **15**:695-702

\] or DNA \[

16.

Schmid, S....

**Nanopore electro-osmotic trap for the label-free study of single proteins and their conformations**

*Nat. Nanotechnol.* 2021; **16**:1244-1250

\] accumulates counterions resulting in a directed movement of solvation water under applied voltage. A large globular DNA origami can, for instance, be trapped electrophoretically in a solid-state pore to cause an EOF in the opposite direction \[

16.

Schmid, S....

**Nanopore electro-osmotic trap for the label-free study of single proteins and their conformations**

*Nat. Nanotechnol.* 2021; **16**:1244-1250

\]. This EOF can capture folded proteins for their analysis. Alternatively, increased surface charge can be achieved by coating a silicon nitride pore with the negatively charged SDS denaturant, resulting in an over 30-fold increase in capture efficiency \[

71.

Soni, N....

**Over 30-fold enhancement in DNA translocation dynamics through nanoscale pores coated with an anionic surfactant**

*Nano Lett.* 2023; **23**:4609-4616

\].

The surface charge in biological nanopores can also cause ion selectivity with the same outcome of analyte transport by EOF \[

26.

Martin-Baniandres, P....

**Enzyme-less nanopore detection of post-translational modifications within long polypeptides**

*Nat. Nanotechnol.* 2023; **18**:1335-1340

\]. Due to the confined space and heterogeneous charge distribution, the EOF generation is, however, less understood. Studies have shown that EOF in biological pores can be optimized by changing the pH \[

27.

Sauciuc, A....

**Translocation of linearized full-length proteins through an engineered nanopore under opposing electrophoretic force**

*Nat. Biotechnol.* 2024; **42**:1275-1281

,

35.

Versloot, R.C.A....

**β-Barrel nanopores with an acidic–aromatic sensing region identify proteinogenic peptides at low pH**

*ACS Nano.* 2022; **16**:7258-7268

,

72.

Asandei, A....

**Electroosmotic trap against the electrophoretic force near a protein nanopore reveals peptide dynamics during capture and translocation**

*ACS Appl. Mater. Interfaces.* 2016; **8**:13166-13179

\], mutating the pore \[

26.

Martin-Baniandres, P....

**Enzyme-less nanopore detection of post-translational modifications within long polypeptides**

*Nat. Nanotechnol.* 2023; **18**:1335-1340

,

27.

Sauciuc, A....

**Translocation of linearized full-length proteins through an engineered nanopore under opposing electrophoretic force**

*Nat. Biotechnol.* 2024; **42**:1275-1281

,

73.

Huang, G....

**Electro-osmotic vortices promote the capture of folded proteins by PlyAB nanopores**

*Nano Lett.* 2020; **20**:3819-3827

,

74.

Gu, L.-Q....

**Prolonged residence time of a noncovalent molecular adapter, β-cyclodextrin, within the lumen of mutant α-hemolysin pores**

*J. Gen. Physiol.* 2001; **118**:481-494

\], or changing the electrolyte \[

25.

Yu, L....

**Unidirectional single-file transport of full-length proteins through a nanopore**

*Nat. Biotechnol.* 2023; **41**:1130-1139

,

75.

Piguet, F....

**Electroosmosis through α-hemolysin that depends on alkali cation type**

*J. Phys. Chem. Lett.* 2014; **5**:4362-4367

,

76.

Mehrafrooz, B....

**Electro-osmotic flow generation via a sticky ion action**

*ACS Nano.* 2024; **18**:17521-17533

\]. While the influence of the charge on the resulting EOF is largest at the **constriction**, charges outside of the sensing region can also efficiently induce EOF \[

77.

Baldelli, M....

**Controlling electroosmosis in nanopores without altering the nanopore sensing region**

*Adv. Mater.* 2024; **36**, 2401761

\]. For instance, CytK was engineered with a set of mutations that introduced negative charges to the narrow β-barrel region of the pore \[

27.

Sauciuc, A....

**Translocation of linearized full-length proteins through an engineered nanopore under opposing electrophoretic force**

*Nat. Biotechnol.* 2024; **42**:1275-1281

\]. Mutant K128D-Q145D-S151D-K155D-CytK showed the highest cation selectivity and was used to translocate unfolded proteins regardless of their charge and charge distribution. In the larger PlyAB nanopore, mutagenesis yielded water-flux vortices that improved the interaction of folded protein analytes with the pore \[

73.

Huang, G....

**Electro-osmotic vortices promote the capture of folded proteins by PlyAB nanopores**

*Nano Lett.* 2020; **20**:3819-3827

\]. Besides pore engineering, the buffer condition can be used to generate EOF. GdmCl has shown to be instrumental in protein measurements with α-HL, as the Gdm <sup>+</sup> ions can stick to the pore’s surface. Thereby the ion introduces charge to the lumen, which in turn generates an EOF \[

25.

Yu, L....

**Unidirectional single-file transport of full-length proteins through a nanopore**

*Nat. Biotechnol.* 2023; **41**:1130-1139

\]. This was found to be a universal effect of Gdm <sup>+</sup> ions compatible with a range of nanopores \[

76.

Mehrafrooz, B....

**Electro-osmotic flow generation via a sticky ion action**

*ACS Nano.* 2024; **18**:17521-17533

\].

Any implementation of nanopore protein analysis will undoubtedly build onto these and future studies of the EOF. Thereby the EOF can not only allow efficient capture of analytes but also help to synchronize the analyte’s translocation with the steps of a motor enzyme in motion-controlled systems, thereby increasing the interpretability of the signals.

### Pore functionalization

Enhancing **nanopore sensitivity** is vital for protein sequencing due to the smaller size and greater variability of amino acids compared to DNA bases. Functionalizing the sensing region of nanopores improves their ability to resolve molecular details and is a key area of research towards the sequencing of proteins.

One potential goal of functionalization is to increase the interaction time between analyte and pore. For instance, π-stacking interactions and specific binding motifs have been incorporated through mutagenesis into nanopores to slow the translocation of peptides \[

35.

Versloot, R.C.A....

**β-Barrel nanopores with an acidic–aromatic sensing region identify proteinogenic peptides at low pH**

*ACS Nano.* 2022; **16**:7258-7268

\] or unfolded proteins \[

78.

Sauciuc, A. ∙ Maglia, G.

**Controlled translocation of proteins through a biological nanopore for single-protein fingerprint identification**

*Nano Lett.* 2024; **24**:14118-14124

\], and therefore improve resolution of sensitivity. Similarly, the constriction of MspA was engineered in two separate strategies to host divalent ions for the measurement of individual amino acids ([Figure 2](#f0010) B). Since single amino acids contain both an amino and a carboxyl group, they can engage in ternary complexes with ions such as Ni <sup>2+</sup> or Cu <sup>2+</sup> and be stalled in the sensing region. Wang *et al*. designed a hetero-octameric MspA introducing a single cysteine in the sensing region that was functionalized by reaction with maleimido-C3-nitrilotriacetic acid and further chelation with Ni <sup>2+</sup> \[

42.

Wang, K....

**Unambiguous discrimination of all 20 proteinogenic amino acids and their modifications by nanopore**

*Nat. Methods.* 2024; **21**:92-101

\]. Zhang *et al.* instead used homo-octameric MspA-N91H introducing histidine brace motifs at the constriction to reversibly coordinate Cu <sup>2+</sup> \[

41.

Zhang, M....

**Real-time detection of 20 amino acids and discrimination of pathologically relevant peptides with functionalized nanopore**

*Nat. Methods.* 2024; **21**:609-618

\]. Both designs were able to identify the 20 proteinogenic amino acids with remarkable accuracies of 98.8% and 99.1%, respectively, using machine-learning algorithms in 20-way classifications.

These results show that nanopores, in principle, have the resolution to discriminate between amino acids. However, this is so far reached only when amino acids are measured individually with functionalized pores. Identifying amino acids in sequential order under motion control would solve *de novo* sequencing. However, in established pores, such as M2 MspA, roughly seven to nine amino acids simultaneously contribute to the current readout \[

47.

Brinkerhoff, H....

**Multiple rereads of single proteins at single–amino acid resolution using nanopores**

*Science.* 2021; **374**:1509-1513

48.

Chen, Z....

**Controlled movement of ssDNA conjugated peptide through *Mycobacterium smegmatis* porin A (MspA) nanopore by a helicase motor for peptide sequencing application**

*Chem. Sci.* 2021; **12**:15750-15756

[Crossref](https://doi.org/10.1039/D1SC04342K)

[PubMed](https://pubmed.ncbi.nlm.nih.gov/35003607/)

[Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1039%2FD1SC04342K&pmid=35003607)

49.

Yan, S....

**Single molecule ratcheting motion of peptides in a *Mycobacterium smegmatis* porin A (MspA) nanopore**

*Nano Lett.* 2021; **21**:6703-6710

\]. To distinguish all amino acids in a motion-controlled setting, at least 20 <sup>7</sup> = 1.28 10 <sup>9</sup> different current states would need to be resolved, which is practically impossible. Decreasing the diameter and thickness of the nanopore constriction could reduce the number of contributing amino acids and make sequencing feasible. For instance, for DNA that is statically trapped inside aerolysin, the neighboring influence can be eliminated by engineering the inner diameter of the pore and stretching the DNA under a high voltage >220 mV \[

79.

Camazzola, A....

**Eliminating the interference of neighboring nucleobases in aerolysin for nanopore sequencing**

*ACS Sens.* 2025;

Online ahead of print. [https://doi.org/10.1021/acssensors.5c00334](https://doi.org/10.1021/acssensors.5c00334)

\]. Regarding fabricated pores, single-layer molybdenum disulfide (MoS <sub>2</sub>) nanopores are currently the thinnest, with a height of only 0.7 nm. Using MoS <sub>2</sub> pores with sub-nanometer to 1.6 nm diameters, 16 out of the 20 amino acids could be distinguished in 2–3-way classifications \[

67.

Wang, F....

**MoS2 nanopore identifies single amino acids with sub-1 Dalton resolution**

*Nat. Commun.* 2023; **14**:2895

\]. Although this was measured in free translocations and not combined with motion control thus far, it indicates insufficient sensitivity for protein sequencing.

Therefore, further efforts are necessary to enhance nanopore sensing regions. Improvements could stem from chemical engineering to restriction sites in protein pores as done to MspA previously. Additionally, ***de novo* nanopore** designs \[

80.

Shimizu, K....

***De novo* design of a nanopore for single-molecule detection that incorporates a β-hairpin peptide**

*Nat. Nanotechnol.* 2022; **17**:67-75

,

81.

Vorobieva, A.A....

**De novo design of transmembrane β barrels**

*Science.* 2021; **371**, eabc8182

\] could contribute to bridging the gap in sensitivity. Further, since artificial protein pore designs are currently profiting from the rapid developments of computational design tools \[

82.

Berhanu, S....

**Sculpting conducting nanopore size and shape through *de novo* protein design**

*Science.* 2024; **385**:282-288

\], novel pore geometries and constriction designs should be explored. During the engineering process, important feedback can come from simulation tools to analyze the analyte–pore interactions and expected current differences between different amino acid sequences \[

83.

Liu, J. ∙ Aksimentiev, A.

**Molecular determinants of current blockade produced by peptide transport through a nanopore**

*ACS Nanosci. Au.* 2024; **4**:21-29

\].

### Specific analyte modifiers

Chemical modifications to analytes can further enhance nanopore detection ([Figure 2](#f0010) C). While this strategy complicates the sample preparation, it can be used to highlight specific residues or modifications. This is especially of interest, since correctly identifying the number and positions of just three out of the 20 amino acids can theoretically identify 78% of protein sequences \[

84.

Ohayon, S....

**Simulation of single-protein nanopore sensing shows feasibility for whole-proteome identification**

*PLoS Comput. Biol.* 2019; **15**, e1007067

\].

In an effort to enhance the selectivity of nanopore peptide identification, gold nanoclusters have been employed \[

85.

Rockett, T.W....

**Cluster-enhanced nanopore sensing of ovarian cancer marker peptides in urine**

*ACS Sens.* 2024; **9**:860-869

\]. Tiopronin-capped gold nanoparticles, trapped inside α-HL, allowed the selective capture and analysis of peptides that contain a single cysteine residue. Alternatively, the location of phosphorylations in long (>700 aa) polypeptides with α-HL was improved by addition of non-covalent binders \[

86.

Lan, W.-H....

**Location of phosphorylation sites within long polypeptide chains by binder-assisted nanopore detection**

*J. Am. Chem. Soc.* 2024; **146**:24265-24270

\]. The binder specifically interacted with the PTMs making their influence in current readouts more pronounced. Binders have also been employed with solid-state interface nanopores containing a surface that was functionalized with phenylalanine-aptamer \[

87.

Schlotter, T....

**Aptamer-functionalized interface nanopores enable amino acid-specific peptide detection**

*ACS Nano.* 2024; **18**:6286-6297

\].

In other applications, analytes were modified to enhance their interaction times with nanopores in a non-selective way. In order to discriminate single amino acids with α-HL, their amino groups have been labeled with adamantane \[

88.

Wei, X....

**Narrowing signal distribution by adamantane derivatization for amino acid identification using an α-hemolysin nanopore**

*Nano Lett.* 2024; **24**:1494-1501

\]. The stable diamondoid unit was linked to nine different amino acid types and allowed their discrimination with 81.3% accuracy. Zhang *et al.* \[

89.

Zhang, Y....

**Peptide sequencing based on host–guest interaction-assisted nanopore sensing**

*Nat. Methods.* 2024; **21**:102-109

\] showed that the sensing of peptides with α-HL could be substantially improved by employing cucurbit \[7\]uril. This agent engages in host–guest complex with phenylalanine (F), prolonging the dwell time of peptides with a terminal F. Further, a concept for peptide sequencing was presented in which C-terminal aa of the analyte are cleaved enzymatically and linked with a peptide probe. The peptide probe can interact with cucurbit \[7\]uril and positions the linked aa in the reading site of α-HL for its discrimination.

## Concluding remarks

Recent advances in nanopore engineering and measurement systems have made nanopore-based protein sequencing and analysis increasingly feasible. Here we have reviewed strategies to address different aspects of protein analysis, each offering distinct advantages. For instance, bottom-up approaches could complement existing mass spectrometry efforts. Nanopore fingerprinting strategies have been conceptually proven and hold great potential for commercialization as a cost-effective, rapid, and portable option, especially for full-length protein identification. Motion-controlled protein translocation stands out as the most promising approach for *de novo* sequencing. However, achieving the necessary sensitivity towards individual amino acids remains a crucial challenge in motion-controlled systems. As research continues to evolve, these techniques are poised to open exciting new avenues for exploration and discovery in the field of proteomics (see Outstanding questions).

Outstanding questions

For protein fingerprinting:

What are the limitations of proposed fingerprinting methods? How many proteins can be distinguished using nanopores and how well?

How can a large-scale database of protein fingerprints be generated efficiently?

For fragmentation:

How can the identified peptides be used to reconstruct the protein sequence?

How can a large-scale database of peptide fingerprints be generated efficiently?

For motion-controlled settings:

How can the sensitivity of nanopores be improved to reach *de novo* sequencing?

How can the disruptive impact of protein structure on sequencing signals be avoided?

How can protein analytes be efficiently tagged to be processed by the motion control system?

Generally:

How can the complex matrix of biological samples and dynamic range of protein concentrations be addressed?

## Declaration of generative AI and AI-assisted technologies in the writing process

During the preparation of this work the authors used Perplexity and ChatGPT to refine the phrasing of selected sentences. After using these tools, the authors thoroughly reviewed and edited the content and take full responsibility for the content of the published article.

## Acknowledgments

### Acknowledgments

This work was supported by the Swiss National Science Foundation (PR00P3\_193090 to C.C), and Dementia Research Switzerland – Synapsis Foundation (2022-CDA03 to C.C.).

### Declaration of interests

The authors declare no conflicts of interest.

## References

[1.](#body-ref-rf0015 "View in article")

Conibear, A.C.

**Deciphering protein post-translational modifications using chemical biology tools**

*Nat. Rev. Chem.* 2020; **4**:674-695

[2.](#body-ref-rf0015 "View in article")

Timp, W. ∙ Timp, G.

**Beyond mass spectrometry, the next step in proteomics**

*Sci. Adv.* 2020; **6**, eaax8978

[3.](#body-ref-rf0015 "View in article")

Smith, L.M. ∙ Kelleher, N.L.

**Proteoform: a single term describing protein complexity**

*Nat. Methods.* 2013; **10**:186-187

[4.](#body-ref-rf0030 "View in article")

Nesvizhskii, A.I. ∙ Aebersold, R.

**Interpretation of shotgun proteomic data**

*Mol. Cell. Proteomics.* 2005; **4**:1419-1440

[5.](#body-ref-rf0030 "View in article")

Chait, B.T.

**Mass spectrometry: bottom-up or top-down?**

*Science.* 2006; **314**:65-66

[6.](#body-ref-rf0030 "View in article")

Hughes, C....

***De novo* sequencing methods in proteomics**

Hubbard, S.J. ∙ Jones, A.R. (Editors)

**Proteome Bioinformatics**

Humana Press, 2010; 105-121

[7.](#body-ref-rf0035 "View in article")

Alfaro, J.A....

**The emerging landscape of single-molecule protein sequencing technologies**

*Nat. Methods.* 2021; **18**:604-617

[8.](#body-ref-rf0040 "View in article")

Aksimentiev, A.

**Thread, read, rewind, repeat: towards using nanopores for protein sequencing**

*Nature.* 2024; **633**:533-534

[9.](#body-ref-rf0045 "View in article")

Motone, K. ∙ Nivala, J.

**Not if but when nanopore protein sequencing meets single-cell proteomics**

*Nat. Methods.* 2023; **20**:336-338

[10.](#body-ref-rf0050-1 "View in article")

Manrao, E.A....

**Reading DNA at single-nucleotide resolution with a mutant MspA nanopore and phi29 DNA polymerase**

*Nat. Biotechnol.* 2012; **30**:349-353

[11.](#body-ref-rf0055 "View in article")

Lu, H....

**Oxford Nanopore MinION sequencing and genome assembly**

*Genomics Proteomics Bioinformatics.* 2016; **14**:265-279

[12.](#body-ref-rf0060 "View in article")

Kolmogorov, M....

**Single-molecule protein identification by sub-nanopore sensors**

*PLoS Comput. Biol.* 2017; **13**, e1005356

[13.](#body-ref-rf0065 "View in article")

Meyer, N....

**Solid-state and polymer nanopores for protein sensing: a review**

*Adv. Colloid Interf. Sci.* 2021; **298**, 102561

[14.](#body-ref-rf0070 "View in article")

Luo, Y....

**Application of Solid-State Nanopore in Protein Detection**

*Int. J. Mol. Sci.* 2020; **21**:2808

[15.](#body-ref-rf0075 "View in article")

Yusko, E.C....

**Real-time shape approximation and fingerprinting of single proteins using a nanopore**

*Nat. Nanotechnol.* 2017; **12**:360-367

[16.](#body-ref-rf0080-1 "View in article")

Schmid, S....

**Nanopore electro-osmotic trap for the label-free study of single proteins and their conformations**

*Nat. Nanotechnol.* 2021; **16**:1244-1250

[17.](#body-ref-rf0085 "View in article")

Huang, G....

**PlyAB Nanopores detect single amino acid differences in folded haemoglobin from blood\*\***

*Angew. Chem. Int. Ed.* 2022; **61**, e202206227

[18.](#body-ref-rf0090 "View in article")

Galenkamp, N.S....

**Directional conformer exchange in dihydrofolate reductase revealed by single-molecule nanopore recordings**

*Nat. Chem.* 2020; **12**:481-488

[19.](#body-ref-rf0095 "View in article")

Li, F....

**Mapping the conformational energy landscape of Abl kinase using ClyA nanopore tweezers**

*Nat. Commun.* 2022; **13**:3541

[20.](#body-ref-rf0100 "View in article")

Jeong, K.-B....

**Single-molecule fingerprinting of protein-drug interaction using a funneled biological nanopore**

*Nat. Commun.* 2023; **14**:1461

[21.](#body-ref-rf0105 "View in article")

Straathof, S....

**Protein sizing with 15 nm conical biological Nanopore YaxAB**

*ACS Nano.* 2023; **17**:13685-13699

[22.](#body-ref-rf0120 "View in article")

Restrepo-Pérez, L....

**SDS-assisted protein transport through solid-state nanopores**

*Nanoscale.* 2017; **9**:11685-11693

[Crossref](https://doi.org/10.1039/C7NR02450A)

[PubMed](https://pubmed.ncbi.nlm.nih.gov/28776058/)

[Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1039%2FC7NR02450A&pmid=28776058)

[23.](#body-ref-rf0120 "View in article")

Soni, N....

**Single-file translocation dynamics of SDS-denatured, whole proteins through sub-5 nm solid-state Nanopores**

*ACS Nano.* 2022; **16**:11405-11414

[24.](#body-ref-rf0120 "View in article")

Kennedy, E....

**Reading the primary structure of a protein with 0.07 nm3 resolution using a subnanometre-diameter pore**

*Nat. Nanotechnol.* 2016; **11**:968-976

[25.](#body-ref-rf0125-1 "View in article")

Yu, L....

**Unidirectional single-file transport of full-length proteins through a nanopore**

*Nat. Biotechnol.* 2023; **41**:1130-1139

[26.](#body-ref-rf0130-1 "View in article")

Martin-Baniandres, P....

**Enzyme-less nanopore detection of post-translational modifications within long polypeptides**

*Nat. Nanotechnol.* 2023; **18**:1335-1340

[27.](#body-ref-rf0135-1 "View in article")

Sauciuc, A....

**Translocation of linearized full-length proteins through an engineered nanopore under opposing electrophoretic force**

*Nat. Biotechnol.* 2024; **42**:1275-1281

[28.](#body-ref-rf0140 "View in article")

Robertson, J.W.F....

**Single-molecule mass spectrometry in solution using a solitary nanopore**

*Proc. Natl. Acad. Sci.* 2007; **104**:8207-8211

[29.](#body-ref-rf0145 "View in article")

Huang, G....

**FraC nanopores with adjustable diameter identify the mass of opposite-charge peptides with 44 dalton resolution**

*Nat. Commun.* 2019; **10**:835

[30.](#body-ref-rf0150 "View in article")

Lucas, F.L.R....

**Protein identification by nanopore peptide profiling**

*Nat. Commun.* 2021; **12**:5795

[31.](#body-ref-rf0155 "View in article")

Ge, Y....

**Aerolysin nanopore-based identification of proteinogenic amino acids using a bipolar peptide probe**

*Nanoscale Adv.* 2022; **4**:3883-3891

[Crossref](https://doi.org/10.1039/D2NA00190J)

[PubMed](https://pubmed.ncbi.nlm.nih.gov/36133334/)

[Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1039%2FD2NA00190J&pmid=36133334)

[32.](#body-ref-rf0160 "View in article")

Ouldali, H....

**Electrical recognition of the twenty proteinogenic amino acids using an aerolysin nanopore**

*Nat. Biotechnol.* 2020; **38**:176-181

[33.](#body-ref-rf0165 "View in article")

Bakshloo, M.A....

**Polypeptide analysis for nanopore-based protein identification**

*Nano Res.* 2022; **15**:9831-9842

[34.](#body-ref-rf0170 "View in article")

Afshar Bakshloo, M....

**Nanopore-based protein identification**

*J. Am. Chem. Soc.* 2022; **144**:2716-2725

[35.](#body-ref-rf0175-1 "View in article")

Versloot, R.C.A....

**β-Barrel nanopores with an acidic–aromatic sensing region identify proteinogenic peptides at low pH**

*ACS Nano.* 2022; **16**:7258-7268

[36.](#body-ref-or0005 "View in article")

Behrends, J. and Ensslen, T. (2024) Method and systems for identifying a sequence of monomer units of a biological or synthetic heteropolymer, US20240077491A1 (patent)

[Google Scholar](https://scholar.google.com/scholar?q=Behrends%2C+J.+and+Ensslen%2C+T.+%282024%29+Method+and+systems+for+identifying+a+sequence+of+monomer+units+of+a+biological+or+synthetic+heteropolymer%2C+US20240077491A1+%28patent%29)

[37.](#body-ref-rf0180 "View in article")

Hoßbach, J....

**Peptide classification from statistical analysis of nanopore sensing experiments**

*J. Chem. Phys.* 2025; **162**, 084107

[38.](#body-ref-rf0195 "View in article")

Chen, X....

**Nanopore single-molecule analysis of biomarkers: providing possible clues to disease diagnosis**

*TrAC Trends Anal. Chem.* 2023; **162**, 117060

[39.](#body-ref-rf0195 "View in article")

Wiswedel, R....

**Beta-barrel nanopores as diagnostic sensors: an engineering perspective**

*Biosensors.* 2024; **14**:345

[40.](#body-ref-rf0195 "View in article")

Zhang, Y....

**Protein nanopore-based sensors for public health analyte detection**

*J. Mater. Chem. B.* 2024; **12**:9845-9862

[Crossref](https://doi.org/10.1039/D4TB01149J)

[PubMed](https://pubmed.ncbi.nlm.nih.gov/39258387/)

[Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1039%2FD4TB01149J&pmid=39258387)

[41.](#body-ref-rf0200-1 "View in article")

Zhang, M....

**Real-time detection of 20 amino acids and discrimination of pathologically relevant peptides with functionalized nanopore**

*Nat. Methods.* 2024; **21**:609-618

[42.](#body-ref-rf0205-1 "View in article")

Wang, K....

**Unambiguous discrimination of all 20 proteinogenic amino acids and their modifications by nanopore**

*Nat. Methods.* 2024; **21**:92-101

[43.](#body-ref-rf0210-1 "View in article")

Zhang, S....

**Bottom-up fabrication of a proteasome-nanopore that unravels and processes single proteins**

*Nat. Chem.* 2021; **13**:1192-1199

[44.](#body-ref-rf0215 "View in article")

Lieberman, K.R....

**Processive replication of single DNA molecules in a nanopore catalyzed by phi29 DNA polymerase**

*J. Am. Chem. Soc.* 2010; **132**:17961-17972

[45.](#body-ref-rf0220 "View in article")

Noakes, M.T....

**Increasing the accuracy of nanopore DNA sequencing using a time-varying cross membrane voltage**

*Nat. Biotechnol.* 2019; **37**:651-656

[46.](#body-ref-rf0225 "View in article")

Wick, R.R....

**Performance of neural network basecalling tools for Oxford Nanopore sequencing**

*Genome Biol.* 2019; **20**:129

[47.](#body-ref-rf0240-1 "View in article")

Brinkerhoff, H....

**Multiple rereads of single proteins at single–amino acid resolution using nanopores**

*Science.* 2021; **374**:1509-1513

[48.](#body-ref-rf0240-1 "View in article")

Chen, Z....

**Controlled movement of ssDNA conjugated peptide through *Mycobacterium smegmatis* porin A (MspA) nanopore by a helicase motor for peptide sequencing application**

*Chem. Sci.* 2021; **12**:15750-15756

[Crossref](https://doi.org/10.1039/D1SC04342K)

[PubMed](https://pubmed.ncbi.nlm.nih.gov/35003607/)

[Google Scholar](https://scholar.google.com/scholar_lookup?doi=10.1039%2FD1SC04342K&pmid=35003607)

[49.](#body-ref-rf0240-1 "View in article")

Yan, S....

**Single molecule ratcheting motion of peptides in a *Mycobacterium smegmatis* porin A (MspA) nanopore**

*Nano Lett.* 2021; **21**:6703-6710

[50.](#body-ref-rf0245 "View in article")

Nivala, J....

**Discrimination among protein variants using an unfoldase-coupled nanopore**

*ACS Nano.* 2014; **8**:12365-12375

[51.](#body-ref-rf0250 "View in article")

Nivala, J....

**Unfoldase-mediated protein translocation through an α-hemolysin nanopore**

*Nat. Biotechnol.* 2013; **31**:247-250

[52.](#body-ref-rf0255-1 "View in article")

Motone, K....

**Multi-pass, single-molecule nanopore reading of long protein strands**

*Nature.* 2024; **633**:662-669

[53.](#body-ref-rf0260 "View in article")

Qing, Y. ∙ Bayley, H.

**Enzymeless DNA base identification by chemical stepping in a nanopore**

*J. Am. Chem. Soc.* 2021; **143**:18181-18187

[54.](#body-ref-rf0265 "View in article")

Dong, Z....

**Discriminating residue substitutions in a single protein molecule using a sub-nanopore**

*ACS Nano.* 2017; **11**:5440-5452

[55.](#body-ref-rf0270 "View in article")

Leitao, S.M....

**Spatially multiplexed single-molecule translocations through a nanopore at controlled speeds**

*Nat. Nanotechnol.* 2023; **18**:1078-1084

[56.](#body-ref-rf0275-1 "View in article")

Chen, X....

**Resolving sulfation PTMs on a plant peptide hormone using nanopore sequencing**

*bioRxiv.* 2024;

2024.05.08.593138

[Google Scholar](https://scholar.google.com/scholar?q=X.ChenResolving+sulfation+PTMs+on+a+plant+peptide+hormone+using+nanopore+sequencingbioRxiv20242024.05.08.593138)

[57.](#body-ref-rf0280-1 "View in article")

Nova, I.C....

**Detection of phosphorylation post-translational modifications along single peptides with nanopores**

*Nat. Biotechnol.* 2024; **42**:710-714

[58.](#body-ref-rf0295 "View in article")

Hoyt, E.A....

**Contemporary approaches to site-selective protein modification**

*Nat. Rev. Chem.* 2019; **3**:147-171

[59.](#body-ref-rf0295 "View in article")

Zeng, Y....

**C-terminal modification and functionalization of proteins via a self-cleavage tag triggered by a small molecule**

*Nat. Commun.* 2023; **14**:7169

[60.](#body-ref-rf0295 "View in article")

Bloom, S....

**Decarboxylative alkylation for site-selective bioconjugation of native proteins via oxidation potentials**

*Nat. Chem.* 2018; **10**:205-211

[61.](#body-ref-rf0300 "View in article")

De Rosa, L....

**Exploiting protein N-terminus for site-specific bioconjugation**

*Molecules.* 2021; **26**:3521

[62.](#body-ref-rf0305 "View in article")

Rosen, C.B. ∙ Francis, M.B.

**Targeting the N terminus for site-selective protein modification**

*Nat. Chem. Biol.* 2017; **13**:697-705

[63.](#body-ref-rf0310 "View in article")

Wloka, C....

**Label-free and real-time detection of protein ubiquitination with a biological nanopore**

*ACS Nano.* 2017; **11**:4387-4394

[64.](#body-ref-rf0325 "View in article")

Restrepo-Pérez, L....

**Label-free detection of post-translational modifications with a nanopore**

*Nano Lett.* 2019; **19**:7957-7964

[65.](#body-ref-rf0325 "View in article")

Cao, C....

**Deep learning-assisted single-molecule detection of protein post-translational modifications with a biological nanopore**

*ACS Nano.* 2024; **18**:1504-1515

[66.](#body-ref-rf0325 "View in article")

Ensslen, T....

**Resolving isomeric posttranslational modifications using a biological nanopore as a sensor of molecular shape**

*J. Am. Chem. Soc.* 2022; **144**:16060-16068

[67.](#body-ref-rf0330-1 "View in article")

Wang, F....

**MoS2 nanopore identifies single amino acids with sub-1 Dalton resolution**

*Nat. Commun.* 2023; **14**:2895

[68.](#body-ref-rf0335 "View in article")

Zhao, X....

**Nanopore: emerging for detecting protein post-translational modifications**

*TrAC Trends Anal. Chem.* 2024; **173**, 117658

[69.](#body-ref-rf0340 "View in article")

Gubbiotti, A....

**Electroosmosis in nanopores: computational methods and technological applications**

*Adv. Phys. X.* 2022; **7**, 2036638

[PubMed](https://pubmed.ncbi.nlm.nih.gov/35874965/)

[Google Scholar](https://scholar.google.com/scholar_lookup?pmid=35874965)

[70.](#body-ref-rf0345 "View in article")

Laohakunakorn, N....

**Electroosmotic flow reversal outside glass nanopores**

*Nano Lett.* 2015; **15**:695-702

[71.](#body-ref-rf0350 "View in article")

Soni, N....

**Over 30-fold enhancement in DNA translocation dynamics through nanoscale pores coated with an anionic surfactant**

*Nano Lett.* 2023; **23**:4609-4616

[72.](#body-ref-rf0355 "View in article")

Asandei, A....

**Electroosmotic trap against the electrophoretic force near a protein nanopore reveals peptide dynamics during capture and translocation**

*ACS Appl. Mater. Interfaces.* 2016; **8**:13166-13179

[73.](#body-ref-rf0360-1 "View in article")

Huang, G....

**Electro-osmotic vortices promote the capture of folded proteins by PlyAB nanopores**

*Nano Lett.* 2020; **20**:3819-3827

[74.](#body-ref-rf0365 "View in article")

Gu, L.-Q....

**Prolonged residence time of a noncovalent molecular adapter, β-cyclodextrin, within the lumen of mutant α-hemolysin pores**

*J. Gen. Physiol.* 2001; **118**:481-494

[75.](#body-ref-rf0370 "View in article")

Piguet, F....

**Electroosmosis through α-hemolysin that depends on alkali cation type**

*J. Phys. Chem. Lett.* 2014; **5**:4362-4367

[76.](#body-ref-rf0375-1 "View in article")

Mehrafrooz, B....

**Electro-osmotic flow generation via a sticky ion action**

*ACS Nano.* 2024; **18**:17521-17533

[77.](#body-ref-rf0380 "View in article")

Baldelli, M....

**Controlling electroosmosis in nanopores without altering the nanopore sensing region**

*Adv. Mater.* 2024; **36**, 2401761

[78.](#body-ref-rf0385 "View in article")

Sauciuc, A. ∙ Maglia, G.

**Controlled translocation of proteins through a biological nanopore for single-protein fingerprint identification**

*Nano Lett.* 2024; **24**:14118-14124

[79.](#body-ref-rf0390 "View in article")

Camazzola, A....

**Eliminating the interference of neighboring nucleobases in aerolysin for nanopore sequencing**

*ACS Sens.* 2025;

Online ahead of print. [https://doi.org/10.1021/acssensors.5c00334](https://doi.org/10.1021/acssensors.5c00334)

[80.](#body-ref-rf0395 "View in article")

Shimizu, K....

***De novo* design of a nanopore for single-molecule detection that incorporates a β-hairpin peptide**

*Nat. Nanotechnol.* 2022; **17**:67-75

[81.](#body-ref-rf0400 "View in article")

Vorobieva, A.A....

**De novo design of transmembrane β barrels**

*Science.* 2021; **371**, eabc8182

[82.](#body-ref-rf0405 "View in article")

Berhanu, S....

**Sculpting conducting nanopore size and shape through *de novo* protein design**

*Science.* 2024; **385**:282-288

[83.](#body-ref-rf0410 "View in article")

Liu, J. ∙ Aksimentiev, A.

**Molecular determinants of current blockade produced by peptide transport through a nanopore**

*ACS Nanosci. Au.* 2024; **4**:21-29

[84.](#body-ref-rf0415 "View in article")

Ohayon, S....

**Simulation of single-protein nanopore sensing shows feasibility for whole-proteome identification**

*PLoS Comput. Biol.* 2019; **15**, e1007067

[85.](#body-ref-rf0420 "View in article")

Rockett, T.W....

**Cluster-enhanced nanopore sensing of ovarian cancer marker peptides in urine**

*ACS Sens.* 2024; **9**:860-869

[86.](#body-ref-rf0425 "View in article")

Lan, W.-H....

**Location of phosphorylation sites within long polypeptide chains by binder-assisted nanopore detection**

*J. Am. Chem. Soc.* 2024; **146**:24265-24270

[87.](#body-ref-rf0430 "View in article")

Schlotter, T....

**Aptamer-functionalized interface nanopores enable amino acid-specific peptide detection**

*ACS Nano.* 2024; **18**:6286-6297

[88.](#body-ref-rf0435 "View in article")

Wei, X....

**Narrowing signal distribution by adamantane derivatization for amino acid identification using an α-hemolysin nanopore**

*Nano Lett.* 2024; **24**:1494-1501

[89.](#body-ref-rf0440 "View in article")

Zhang, Y....

**Peptide sequencing based on host–guest interaction-assisted nanopore sensing**

*Nat. Methods.* 2024; **21**:102-109

[90.](#body-ref-rf0445-1 "View in article")

Kasianowicz, J.J....

**Characterization of individual polynucleotide molecules using a membranechannel**

*Proc. Natl. Acad. Sci.* 1996; **93**:13770-13773

[91.](#body-ref-rf0450 "View in article")

Maxwell, J.C.

**A Treatise on Electricity and Magnetism**

Clarendon Press, 1873

[Google Scholar](https://scholar.google.com/scholar?q=J.C.MaxwellA+Treatise+on+Electricity+and+Magnetism1873Clarendon+Press)

[92.](#body-ref-rf0455 "View in article")

Oxford Nanopore Technologies

**How nanopore sequencing works. Online tutorial**

[https://nanoporetech.com/platform/technology](https://nanoporetech.com/platform/technology)

Date: 2024

Date accessed: December 3, 2024

[Google Scholar](https://scholar.google.com/scholar?q=Oxford+Nanopore+TechnologiesHow+nanopore+sequencing+works.+Online+tutorialhttps%3A%2F%2Fnanoporetech.com%2Fplatform%2Ftechnology2024)

## Glossary

**Analyte**

the molecule(type) that is being analyzed.

**Biological nanopore**

a protein pore, commonly a toxin of microbial origin.

**Click chemistry**

a class of chemical reactions designed to efficiently and selectively join molecular building blocks under simple, mild, and often biocompatible conditions. Click chemistry reactions are characterized by high yields, fast reaction rates, minimal by-products, and modularity, making them especially useful in drug discovery, bioconjugation, and materials science.

**Constriction**

the narrowest point/section of the nanopore, which typically is the sensing region.

***De novo* nanopores**

protein nanopores that are not based on a naturally occurring protein.

***De novo* sequencing**

sequencing a novel, unknown analyte for which there is no reference data available.

**Fingerprint**

a recognizable signature of an analyte that is established based on prior knowledge.

**Mixture sample**

a sample that contains several target proteins, and/or one target protein together with undefined molecules.

**Motion control**

a system that controls transport of single molecules though the nanopore by slowing down the motion. This allows us to cope with the limitations in time-resolution of measurement devices.

**Nanopore sensitivity**

the ability to sense very subtle differences in the analyte’s composition or structure, which is linked to the ability to correctly identify an analyte or its properties.

**Proteoforms**

distinct molecular forms of a protein produced from a single gene, arising through genetic variations, alternative RNA splicing, and post-translational modifications.

**Sensing region**

the position inside the nanopore in which the analyte causes the largest current modulations, which typically is the constriction.

**Solid-state nanopore**

a nanopore artificially made from solid materials. For instance, a fabricated hole in materials such as silicon nitride or molybdenum disulfide.