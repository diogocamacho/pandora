---
title: "BioinfoMCP: A Unified Platform Enabling MCP Interfaces in Agentic Bioinformatics"
source: "https://arxiv.org/html/2510.02139v1"
author:
published:
created: 2026-10-02
description:
tags:
  - "clippings"
---
Florensia Widjaja Affiliation: School of Data Science, The Chinese University of Hong Kong, Shenzhen (CUHK Shenzhen), Shenzhen 518172, China  
<sup>†</sup> These authors contributed equally.  
<sup>*</sup> Corresponding author. e-mail: juexiao.zhou@gmail.com    Zhangtianyi Chen Affiliation: School of Data Science, The Chinese University of Hong Kong, Shenzhen (CUHK Shenzhen), Shenzhen 518172, China  
<sup>†</sup> These authors contributed equally.  
<sup>*</sup> Corresponding author. e-mail: juexiao.zhou@gmail.com    Juexiao Zhou Affiliation: School of Data Science, The Chinese University of Hong Kong, Shenzhen (CUHK Shenzhen), Shenzhen 518172, China  
<sup>†</sup> These authors contributed equally.  
<sup>*</sup> Corresponding author. e-mail: juexiao.zhou@gmail.com

###### Abstract

Bioinformatics tools are essential for complex computational biology tasks, yet their integration with emerging AI‑agent frameworks is hindered by incompatible interfaces, heterogeneous input–output formats, and inconsistent parameter conventions. The Model Context Protocol (MCP) provides a standardized framework for tool–AI communication, but manually converting hundreds of existing and rapidly growing specialized bioinformatics tools into MCP‑compliant servers is labor‑intensive and unsustainable. Here, we present BioinfoMCP, a unified platform comprising two components: BioinfoMCP Converter, which automatically generates robust MCP servers from tool documentation using large language models, and BioinfoMCP Benchmark, which systematically validates the reliability and versatility of converted tools across diverse computational tasks. We present a platform of 38 MCP‑converted bioinformatics tools, extensively validated to show that 94.7% successfully executed complex workflows across three widely used AI‑agent platforms. By removing technical barriers to AI automation, BioinfoMCP enables natural‑language interaction with sophisticated bioinformatics analyses without requiring extensive programming expertise, offering a scalable path to intelligent, interoperable computational biology.

## I Introduction

The bioinformatics landscape is characterized by an extensive ecosystem of specialized tools designed for diverse analytical tasks that serve critical functions in genomics [^1], proteomics [^2] [^3], and molecular biology [^4], and so on. Each tool typically operates as a standalone application with unique input-output formats, command-line interfaces, and computational requirements, and is also designed for a specialized purpose [^5]. These tools were then utilized in a strategic sequence of computational steps to produce interpretable results in domains of genomic analysis [^6], structural bioinformatics [^7], and also in computational methods such as data and text mining [^8], phylogenetics [^9], or in population studies [^10]. Prevalent end-to-end tasks, which oftentimes are called pipelines, are then executed encompassing various datasets, such as whole genome sequencing (WGS) [^6], Chromatin Immunoprecipitation Sequencing (ChIP-seq) [^11] [^12], RNA sequencing (RNA-seq) [^13] [^14], single-cell RNA-seq (scRNA-Seq) [^15] [^16], and also other widely-utilized sequencing studies. The accomplishments of these sequencing studies bring out the actionable biological insights, predictive biomarkers, therapeutic targets, and personalized treatment strategies that have contributed to significant progress in precision medicine [^17] and drug discovery [^18].

The field of artificial intelligence (AI) has experienced significant advancement in recent years, most notably through the emergence of large language models (LLMs) such as OpenAI’s ChatGPT [^19] and Anthropic’s Claude [^20]. These developments have profoundly altered human-machine interaction paradigms, with ongoing research and development suggesting sustained momentum in this domain. Even in August 2025, OpenAI also released the latest GPT-5, which was acknowledged to have the knowledge capacity of a postgraduate student [^21]. Rapid breakthroughs in AI express a need for many fields to harness its power. However, domain-specific tools from bioinformatics, though highly valuable, have struggled to be integrated into these cutting-edge models. For instance, established bioinformatics tools were primarily designed for direct human interaction rather than programmatic access, resulting in incompatible data formats, limited API availability, and workflow structures that impede their integration into AI-driven analytical pipelines [^5] [^22].

Due to the steep learning curve and tedious procedures of using these lack-of-standardization software, researchers have tried to utilize AI agents to make these bioinformatic pipeline analyses more autonomous and time and energy-efficient, such as AutoGPT [^23]. However, its general-purpose coverage ability significantly decreases the robustness of their responses and makes redevelopment a challenging task [^24]. In order to address the limitations that general AI agents faced, some specialized AI agents that focused specifically on addressing the needs of bioinformaticians were released. These systems encompass a spectrum from semi-automated web-based platforms such as iDEP [^25] and ICARUS [^26], to fully autonomous frameworks including BioPlanner [^27], BioAgents [^28], MCPMed [^29], AutoBA [^24], BRAD [^30], and Spatial Agent [^31], which provide specialized computational capabilities for researchers undertaking sophisticated bioinformatics workflows.

Despite advances in AI agents, scientists must still determine how best to integrate these systems into their research workflows, particularly in linking the diverse bioinformatics tools required for pipeline analyses, each with distinct procedures and requirements [^17] [^14]. Meanwhile, the majority of existing bioinformatics tools lack standardized interfaces, and the rapid emergence of new specialized tools further compounds this challenge. As these tools often adopt distinct architectures, file formats, and operational conventions, AI agents face significant obstacles in directly invoking them without extensive, tool‑specific adaptation [^5] [^32]. This fragmentation not only limits the scalability of AI‑driven workflows but also slows the adoption of automation in computational biology, as each integration effort requires substantial manual engineering. Consequently, there is a critical need for a general mechanism that can bridge AI agents with this continually expanding and heterogeneous landscape of bioinformatics software.

Model Context Protocol (MCP) is a general-purpose protocol that acts as a standard for agentic-tool communication [^33]. MCP provides a unified connection format between tools or applications and an extensive set of AI Agents, which are also called MCP Hosts. These MCP Clients, which have attached an MCP Client to them like Claude Desktop [^20] or Cursor [^34], can seamlessly connect to external tools that were packaged into MCP servers using a standardized protocol, hence making it easy for AI agents to run commands on these tools.

Converting bioinformatics tools into MCP servers addresses these fundamental integration challenges by providing a standardized communication layer to any AI agent that has an MCP host integrated into it. MCP servers enable tools to expose their functionality through consistent interfaces, allowing AI assistants and automated systems to seamlessly interact with diverse bioinformatics applications. This standardization facilitates the creation of intelligent workflows where tools can be dynamically selected and chained based on analytical requirements rather than technical compatibility constraints. Furthermore, MCP integration enables natural language interaction with complex bioinformatics tools, making advanced analyses accessible to researchers without deep technical expertise while maintaining the specialized capabilities that make these tools valuable to the scientific community.

However, manual conversion of bioinformatics tools into MCP servers would be impractical given the scale and diversity of the ecosystem. With hundreds of specialized tools across genomics, proteomics, and molecular biology, each requiring a deep understanding of their specific interfaces, parameters, and data formats, manual conversion would be time-consuming and error-prone. Moreover, the bioinformatics field continuously evolves with new tools and updated versions of existing ones, making manual approaches unsustainable [^35] [^1]. With an automatic conversion system, it can systematically analyze tool documentation, command-line interfaces, and input/output specifications to generate standardized MCP server implementations at scale. This automation ensures consistency across conversions, reduces development time from months to minutes per tool, and enables rapid adaptation to tool updates and new releases, making MCP integration feasible for the entire bioinformatics ecosystem and demolishing the steep learning curve for scientists in utilizing these useful-but-standalone bioinformatician tools.

Here, we present the BioinfoMCP platform, which tackles three fundamental barriers limiting bioinformaticians’ productivity: 1) Fragmentation and Incompatibility of Bioinformatics Tools - hundreds of specialized standalone tools with incompatible interfaces, diverse input/output formats, and inconsistent parameter naming conventions create substantial integration barriers that require extensive manual effort to overcome; 2) Lack of AI Agent Integration - existing bioinformatics tools were designed for direct human interaction rather than programmatic access by AI agents, lacking the standardized APIs and communication protocols necessary for seamless integration with modern AI-driven workflows; and 3) Manual Conversion Bottleneck - manual conversion of each bioinformatics tool into an MCP server would require substantial development time per tool, making this approach unsustainable and impractical given the vast, continuously evolving ecosystem of bioinformatics software.

Considering the issues that were observed, as can be seen in Figure 1, the BioinfoMCP was created with two main branches for development, which are the BioinfoMCP Converter, that works as a script to automatically convert bioinformatics tools into a robust executable MCP server – described further in Section II-A, and also the supporting BioinfoMCP Benchmark, that manually curated set of test cases for MCP servers to analyze the robustness and versatility of BioinfoMCP converter-converted tools across different tasks – described further in Section II-B.

## II Methods

![The top part (a) shows the flow of BioinfoMCP Converter, from preparation of documentation, backbone initialization, execution of code generation, extraction, and evaluation, and finally containerize the tools. The bottom part (b) shows how the tools got tested with AI Agents, and on complex tasks which then return the ran tools, output files, and a comprehensive summary.](https://arxiv.org/html/2510.02139v1/main-fig.png)

Fig. 1: Design of BioinfoMCP, which consists of two parts: a) BioinfoMCP Converter and b) BioinfoMCP Benchmark.

### II-A Design of BioinfoMCP Converter

Algorithm 1 BioinfoMCP Converter

Input: tool name $T$, help manual path $M$, help manual flag $h\in\{0,1\}$, output dir $O$,

LLM model $\mathcal{M}$, API key $\mathcal{K}$

Output: Dockerised MCP server ready for an AI Agent

initialise converter $\mathcal{C}\leftarrow\mathrm{BioinfoMCP}(\mathcal{M},\mathcal{K})$;

if *$h=1$* then

    get manual info from local.pdf file: $\mathcal{D}\leftarrow\mathrm{pdf2text}(M)$

else

    get manual info from the command line: $\mathcal{D}\leftarrow\mathrm{subprocess}([T,\,\texttt{--help}])$;

repeat

    $\mathcal{P}\leftarrow\mathrm{generate\_prompt}(T,\mathcal{D})$;

    $\mathcal{R}\leftarrow\mathrm{parse\_mcpcode}(\mathcal{C}_{code})\leftarrow(flag,err,\mathcal{C}_{code})\leftarrow\mathrm{LLM}(\mathcal{P})$;

    if *$flag=0$* then

       $\mathcal{P}_{err}\leftarrow\mathrm{generate\_prompt\_from\_error(T,\mathrm{err},\mathcal{C}_{code})}$ $\mathcal{R}\leftarrow\mathrm{refine\_after\_feedback}(T,\mathcal{C}_{code},err)$;

until *syntax = valid*;

write $O/\texttt{app}/T\texttt{\_server.py}$ with $\mathcal{C}_{code}$;

$\mathcal{F}_{\mathrm{docker}}\leftarrow\mathrm{dockerfile\_content}(T)$;

write $O/\texttt{Dockerfile}$ with $\mathcal{F}_{\mathrm{docker}}$;

$\mathcal{F}_{\mathrm{compose}}\leftarrow\mathrm{dockercompose\_content}(T)$;

write $O/\texttt{docker-compose.yml}$ with $\mathcal{F}_{\mathrm{compose}}$;

return *AI Agent configuration info*;

The conversion process of BioinfoMCP is divided into three stages: preparation, execution, and delivery. The preparation stage consists of preparing the manual and the available options from the bioinformatics tool, which will be used by the LLM model backbone later in the execution stage. There are currently two available options to provide these manuals: downloading the documentation into a PDF version or accessing them using the help flag option by the tools, such as –help or -h. Due to its reliance on the manual, the quality and clarity of the manual can have a substantial impact on the robustness of the generated MCP server. Moreover, BioinfoMCP-converted MCP servers are built upon the FastMCP 2.0 [^36] framework, which facilitated an efficient yet simple procedure to have production-level MCP servers. The base requirements for the manual are that it has a clear structure on how to execute it in the command line, together with a complete list of the flags or tags that can be utilized to modify the command execution. During the execution stage, BioinfoMCP will proceed with MCP server code generation with the assistance of an LLM model backbone. The system then parses and extracts code blocks from the LLM’s output. This includes detecting Python script blocks, which are then evaluated against two primary failure conditions: no code detected and syntax error. If failure did occur, it would undergo a re-generation and refinement step until it is deemed successful and proceed to the delivery stage. At the delivery stage, with the already refined MCP server code, BioinfoMCP Converter will pack it together with complementary files that are necessary to package them into a Docker Image that can later be an executable Docker Container. The conversion workflow framework that BioinfoMCP adopted is illustrated in Figure 1 and laid out in detail in Algorithm 1, which can be found in the supplementary materials.

The code generation in the execution stage was powered by an LLM model backbone, which is controlled by a system prompt. A system prompt is a set of instructions that rules the LLMs context and behavior, including output formats, safety guardrails, and rules that they must adhere to [^37]. In order to perform its task correctly and produce robust MCP server code with appropriate structure, the system prompt must also be structured in a clear and complete manner. As illustrated in Figure 4 in the Appendix, the system prompt for BioinfoMCP Converter is constructed following the role, task, requirements, and instructions, but swapping the requirements and instructions sections to enhance the flow for the BioinfoMCP Converter to get a better comprehension. The role section clearly states BioinfoMCP Converter’s general description and how it should approach the tools conversion. After understanding its stance from the role section, the task declares the general direction that our Converter should approach. BioinfoMCP Converter then gets a step-by-step route in the instructions section, from which packages should be imported, parameter and file handling, subprocess execution, how to return the structured output onto the next step, and the final code format to emphasize the generated result structure. Lastly, the requirements are strict rules that the generated results must comply with to work in accordance with the MCP server guidelines and to guarantee robustness.

### II-B BioinfoMCP Benchmark

While autonomous and flexible tool execution capabilities are necessary, they are not sufficient on their own. These tools must also be capable of executing at the appropriate contextual moments while ensuring the accuracy of their outputs. The BioinfoMCP Benchmark plays a prevalent role in ensuring the smoothness of these newly-generated MCP servers.

BioinfoMCP Benchmark follows a particular prompting structure (see supplementary), which is then sent to AI agents to call tools, generate results, and summarize key findings. Our benchmarking strategy is divided into two parts: first, every MCP server was tested independently, and second, the AI agents were tested to execute a set of bioinformatics tasks using the assistance of these MCP servers.

For the first part of the evaluation, MCP servers were tested to determine whether they 1) execute without encountering any non-internal tool errors, and 2) output results as expected if they were being run manually. This step is crucial to guarantee that the building blocks of future, more complicated tasks can be executed rigorously. Hence, scientists can then just focus on completing multifaceted analyses instead of validating the reliability of each step of tool-calling. In terms of the computing power utilized, for the local AI Agent, the testing was done in a remote computer with 64 GB of RAM, while for Claude Desktop and Cursor, the testing was done in a 16 GB memory local computer. After validating each tool, we then designed experiments to determine how these tools are utilized in actuality, which became the second part of our benchmark. The experiments were designed as shown in Table III, and the prompt is structured so that the AI agent can run commands for a particular task to execute an end-to-end pipeline from a genomic file. Afterwards, the AI agent is asked to summarize the results from the commands that were run.

TABLE I: BioinfoMCP Converted MCP Servers versatility assessed by the number of code lines (NCL) and robustness evaluated by using three widely-utilized AI Agents: a) Local AI Agent (LAI) b) Claude Desktop (CD) and c) Cursor (CR).

<table><tbody><tr><td rowspan="2">Tool Name</td><td rowspan="2">NCL</td><td colspan="3">AI Agents</td></tr><tr><td>LAI</td><td>CD</td><td>CR</td></tr><tr><td>bcftools <sup><a href="#fn:38">38</a></sup></td><td>1081</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>Bedtools:coverage <sup><a href="#fn:39">39</a></sup></td><td>162</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>Bedtools:intersect <sup><a href="#fn:39">39</a></sup></td><td>197</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>Bowtie2 <sup><a href="#fn:40">40</a></sup></td><td>665</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>BWA <sup><a href="#fn:41">41</a></sup></td><td>464</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>Cell-ranger <sup><a href="#fn:42">42</a></sup></td><td>1297</td><td>✕</td><td>✕</td><td>✕</td></tr><tr><td>Cutadapt <sup><a href="#fn:43">43</a></sup></td><td>400</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>DeepTools:bamCoverage <sup><a href="#fn:44">44</a></sup> <sup><a href="#fn:45">45</a></sup></td><td>79</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>DeepTools:computeGCBias <sup><a href="#fn:44">44</a></sup> <sup><a href="#fn:45">45</a></sup></td><td>81</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>DeepTools:correctGCBias <sup><a href="#fn:44">44</a></sup> <sup><a href="#fn:45">45</a></sup></td><td>120</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>DeepTools:plotCorrelation <sup><a href="#fn:44">44</a></sup> <sup><a href="#fn:45">45</a></sup></td><td>59</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>fastp <sup><a href="#fn:46">46</a></sup></td><td>362</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>FastQC <sup><a href="#fn:47">47</a></sup></td><td>106</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>UCSC-FaToTwoBit <sup><a href="#fn:48">48</a></sup></td><td>78</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>Flye <sup><a href="#fn:49">49</a></sup></td><td>151</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>freebayes <sup><a href="#fn:50">50</a></sup></td><td>494</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>GATK:ApplyBQSR <sup><a href="#fn:51">51</a></sup></td><td>294</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>GATK:BaseRecalibrator <sup><a href="#fn:51">51</a></sup></td><td>335</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>GATK:HaplotypeCaller <sup><a href="#fn:51">51</a></sup></td><td>536</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>GATK:SelectVariants <sup><a href="#fn:51">51</a></sup></td><td>617</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>Gunzip</td><td>424</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>HISAT2 <sup><a href="#fn:52">52</a></sup></td><td>523</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>Kallisto <sup><a href="#fn:53">53</a></sup></td><td>575</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>MACS3:callpeak <sup><a href="#fn:54">54</a></sup></td><td>324</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>MACS3:hmmratac <sup><a href="#fn:54">54</a></sup></td><td>181</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>Minimap2 <sup><a href="#fn:55">55</a></sup></td><td>275</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>MAFFT <sup><a href="#fn:56">56</a></sup></td><td>641</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>MEME <sup><a href="#fn:57">57</a></sup></td><td>462</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>MultiQC <sup><a href="#fn:58">58</a></sup></td><td>139</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>Qualimap <sup><a href="#fn:59">59</a></sup></td><td>613</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>Quast <sup><a href="#fn:60">60</a></sup></td><td>560</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>Salmon <sup><a href="#fn:61">61</a></sup></td><td>331</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>SamTools <sup><a href="#fn:62">62</a></sup></td><td>540</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>Seqtk <sup><a href="#fn:63">63</a></sup></td><td>84</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>SPAdes <sup><a href="#fn:64">64</a></sup></td><td>477</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>STAR <sup><a href="#fn:65">65</a></sup></td><td>504</td><td>✓</td><td>✕</td><td>✕</td></tr><tr><td>Trim-galore <sup><a href="#fn:66">66</a></sup></td><td>403</td><td>✓</td><td>✓</td><td>✓</td></tr><tr><td>Trimmomatic <sup><a href="#fn:67">67</a></sup></td><td>333</td><td>✓</td><td>✓</td><td>✓</td></tr></tbody></table>

Fig. 2: Mechanism of how AI agent (Claude Sonnet 4) make a request to an MCP Server (FastQC in this case) and obtained the response back.

Fig. 3: Finding the differentially expressed genes as part of the RNA-seq pipeline with using the MCP servers produced by BioinfoMCP Converter.

## III Results

### III-A Converting Bioinformatics Tools into MCP Servers with BioinfoMCP Converter

Just by providing an official manual provided by the tool, BioinfoMCP Converter can extract essential information from the manual passed onto the platform and directly transform it into an MCP server. It also adopts its standardized structure that was depicted by the official MCP documentation, which consists of tools, resources, and prompts, so it is able to connect with any AI Agents that have an MCP client attached to it. Moreover, BioinfoMCP Converter generates the MCP servers with a detailed description, capturing the utility of each one of the tags or flags. Thus, making it possible for any combination of attributes to be run on the commands.

Although the converter-powering generative model is alterable, this study also has tested on several models to compare the conversion efficacy of the FastQC tool as a baseline for future model selection. As shown in Table II, GPT-4.1-mini completed the conversion task in just 13.7 seconds, making it the second-fastest overall. From the perspective of cost-efficiency, its total cost is only marginally higher than the cheapest option (Deepseek-chat [^68]) but remains an order of magnitude less expensive than GPT-4o [^19]. Furthermore, GPT-4.1-mini [^69] delivered an 88-line implementation, which strikes the ideal balance between the verbose 194-line output of Gemini-2.5-flash [^70] and the overly concise 48-line version from GPT-4o-mini. Some factors that might contribute to this difference for instance is the context window, on which GPT-4o-mini has of 128 thousand, while GPT-4.1-mini has around one million. This comparison concludes that the model backbone also played an important role in determining the comprehensiveness and quality of the generated MCP servers.

TABLE II: Comparison between the performance of BioinfoMCP Converter in Converting FastQC tool onto an MCP server using different Backends in terms of the conversion time (in seconds), number of code lines (NCL), number of tokens (NT), and the conversion cost (in dollars)

| Converter Backend | Time (s) | NCL | NT | Cost ($) |
| --- | --- | --- | --- | --- |
| GPT-4.1-mini [^69] | 13.7188 | 88 | 879 | 0.01222 |
| GPT-4o-mini [^19] | 12.1285 | 48 | 484 | 0.01151 |
| GPT-4o [^19] | 13.7019 | 72 | 801 | 0.11272 |
| Gemini-2.5-flash [^70] | 27.4415 | 194 | 3112 | 0.02834 |
| Deepseek-chat [^68] | 52.9808 | 106 | 1085 | 0.00996 |

The extended context window of GPT-4.1 mini proved particularly advantageous for tools with extensive documentation, such as SPAdes [^64] and Samtools [^62], where comprehensive parameter sets and complex usage patterns required substantial contextual understanding. In contrast, GPT-4o mini, while more computationally efficient, occasionally truncated or simplified complex parameter descriptions when processing lengthy manuals. This trade-off between computational cost and conversion quality suggests that model selection should be tailored to the complexity of the target bioinformatics tool and the desired level of detail in the resulting MCP server.

In terms of the converted results, BioinfoMCP Converter has successfully converted 38 different tools, which have various options (details regarding each tool can be seen in Table I). In addition, for versatile multi-function tools, such as GATK [^51] or Deeptools [^44] [^45], BioinfoMCP Converter operates in each of the subtools to guarantee that every functionality is captured inside the MCP server, although with the extensive context window, it is probably not sufficient to apprehend the intricate details. The transformation process from raw command-line documentation to fully functional MCP servers demonstrated remarkable efficiency, averaging 40 seconds per tool and requiring no more than two minutes even for complex applications such as bcftools and cell-ranger. In terms of prospective tools, BioinfoMCP Converter, as it works automatically, will always be ready to convert those newly-released tools in the future.

### III-B Evaluating AI Agent in Agentic Bioinformatics with BioinfoMCP Benchmark

#### III-B1 Individual MCP servers benchmarking

Individual MCP servers are tested in different scenarios, from local AI agent, Claude Desktop [^20] and Cursor [^34], and observed whether these agents can perform their intended utility or not. However, some tools in the bioinformatics domain are memory or time-consuming, which cause unintended failures that were not directly caused by the MCP servers or the tool-calling procedure itself, as AI agents were able to connect to the intended tool with precise commands. The efficacy with respect to the individual tool testing, including the number of code lines to demonstrate completeness, is depicted in Table I.

#### III-B2 Pipeline Execution benchmarking

TABLE III: Experiment Design of BioinfoMCP Benchmark for MCP server and server-agent interaction testing.

| Pipeline Analysis Name | Task Name | Result Diagram | Bioinformatics Tools Utilized | Time Required |
| --- | --- | --- | --- | --- |
| RNA-seq | Find differentially expressed genes | 3 | FastQC, samtools, Qualimap, MultiQC | 4 |
| WGS | Genome assembly | 5 | FastQC, fastp, SPAdes, Quast, MultiQC | 5 |
| ChIP-seq | Motif discovery for binding sites | 6 | FastQC, Bowtie2, samtools, MACS3, Deeptools, MultiQC, R (GenomicRanges, GenomicAlignment, Rsamtools) | 11 |
| ATAC-seq | Identifying open chromatin region | 7 | FastQC, Trim-galore, Bowtie2, samtools, MACS3, MultiQC | 7 |
| WGS/WES | Somatic SNV calling | 8 | FastQC, fastp, Bowtie2, samtools, GATK, Freebayes, bcftools | 9 |

After connecting to an AI agent, each MCP server can interact with the others to perform a complex task that requires multiple execution steps, which are the baseline of bioinformatics-pipelined tasks. For instance, to find the differentially expressed genes in a RNA-seq pipeline, it will first conduct a pre-alignment quality control and pre-processing over the raw fastq files, then moving on to alignment to reference genome indexes, followed by post-alignment quality assessment, read quantification at gene or transcript level, normalization of count data, and finally statistical analysis to identify genes with significant expression differences between experimental conditions [^14]. With the assistance of MCP servers, AI agents can call subsequent tools according to the user’s requirements. As shown in Figure 3, BioinfoMCP-generated MCP servers, together with the help of the filesystem MCP server, AI agents are able to carry out instructions according to the user prompt in a reliable manner. Suppose an error occurs during the operations (such as the Qualimap:rnaseq execution shown in Figure 3). In that case, these AI agents can adapt accordingly by understanding the error message and then make consequent modifications before stepping forward to the next call. Other experiments can be seen in the supplementary materials of this study.

### III-C MCP servers returns a comprehensible request and result connection for AI agents and human to interpret

BioinfoMCP Converter-generated MCP servers are not constructed just as a jaggy bridge between these useful-but-rigid tools to connect to cutting-edge AI agents, but they are also created to lay a smooth foundation for AI agents to easily call these tools, and in turn, enable scientists to get the results as intended easily. In terms of sending the MCP requests, these clients are able to easily call the MCP servers as these servers are provided with a complete set of parameter options to call, on which, if it is an optional one, an appropriate default value will be given accordingly. After executing the request and attaining the result, these MCP servers will deliver a constructed output of three essential information: the command that was run, the stderr, and the stdout. As depicted in Figure 2. This constructed output format assists AI agents in not only executing the tools effortlessly but also collecting insights from the result of the executed command and interpreting it for the user’s understanding. Without sending out this constructed output, AI agents can only run without knowing their execution status or outcome.

With the functionality that BioinfoMCP Converter-generated servers have provided, it will not only utilize the bioinformatics tools to its full potential by bridging the gap for AI agents to use these tools, but it will also boost productivity for experts, as they do not have to run abstract command-line interface (CLI) commands for tools execution anymore and can execute tools by utilizing human-machine interaction. Moreover, by combining the strength of AI agents’ thinking capability, bioinformaticians will have another set of interpretations and be able to get a glimpse of the result before diving deep into the report.

## IV Discussion and Future Works

The BioinfoMCP platform has paved the way for the conversion of any bioinformatics tool into a robust executable MCP server by utilizing the tool’s documentation without any requirement for human intervention. With an MCP server readily available, these tools can be executed on AI agents that have MCP clients attached to them, so users only need to instruct these AI agents with human language instead of abstract CLI commands. With a rigorous system prompt, BioinfoMCP Converter-generated MCP servers have a complete set of comprehensible parameters that can then be translated to CLI commands so AI agents can send a request without understanding the underlying detailed structure of each tool. This study has also proven that the BioinfoMCP-Converted MCP server’s reliability in executing bioinformatic tools operations. This advancement has also made it possible for AI agents to send multiple requests sequentially according to the user request, which will be significantly beneficial in bioinformatics domain tasks.

However, the present version of BioinfoMCP Converter necessitates manual retrieval and interpretation of help documentation for integrated third-party tools, commonly accessed via command-line flags such as –help or manually retrieving their tool documentation online. To streamline this process, we plan to design an automated system where users need only specify the tool name; this framework will autonomously fetch the relevant documentation by programmatically invoking the tool’s built-in help function (e.g., tool –help) or, if necessary, retrieving it from curated online sources, which eliminates manual intervention while ensuring accurate, up-to-date usage guidelines are available for downstream operations. It is also important to note that in terms of the AI agent capabilities, there is still a toil in conducting end-to-end task completion since AI agents are still unable to handle tools that require extensive memory or runtime such as STAR as current AI agents are still unable to be connected to Graphic Processing Units (GPUs), which make these heavy workloads still require manual human-assisted execution. Hence, while the MCP servers demonstrate functional robustness across different AI agent integrations, deployment considerations such as memory allocation and execution timeouts must be adequately configured to ensure reliable performance in real-world applications.

Nonetheless, the invention of BioinfoMCP Converter and its complementary Benchmark has addressed the gap between the incompatibility of bioinformatics tools to be executed on recent AI agents. At the same time, the automated approach has eradicated the manual conversion bottleneck and has made this technique reliable for future usability of future tools. The BioinfoMCP family will make a significant contribution to bioinformaticians’ productivity improvement. With further support for BioinfoMCP development, the utilization of AI technology in scientific experiments will be revolutionized.

## V Acknowledgments

The authors from this research work were supported by grants from the 28th Undergraduate Research Award from the Chinese University of Hong Kong, Shenzhen (CUHK Shenzhen) and also from award number UDF01004172.

## VI Authors Contribution

F.W. and Z.C. contributed equally to this work. J.Z. with F.W. conceptualized the platform. F.W. developed the code. Z.C. developed and tested the local AI Agent. F.W. and Z.C. performed experiments. F.W. and J.Z. wrote the manuscript. F.W., Z.C., and J.Z. revised critical parts of the manuscript. J.Z. performed supervision. F.W. and J.Z. responsible for funding acquisition.

## VII Code availability

The BioinfoMCP platform is publicly available at https://github.com/florensiawidjaja/BioinfoMCP

## References

## VIII Supplementary Materials

### VIII-A More Function Calling Examples

#### VIII-A1 Bowtie2 Align

MCP Server Request:

⬇

{

‘local‘: true,

‘threads‘: 4,

‘end\_to\_end‘: false,

‘index\_base‘: ‘/data/bowtie2\_GRCh38\_index‘,

‘sam\_output‘: ‘/data/SRR8405197\_aligned\_v2.sam‘,

‘mate1\_files‘: ‘/data/trimmed/SRR8405197\_1\_val\_1.fq.gz‘,

‘mate2\_files‘: ‘/data/trimmed/SRR8405197\_2\_val\_2.fq.gz‘,

‘very\_sensitive\_local‘: true

}

MCP Server Response:

⬇

{

"command\_executed": "bowtie2 -x /data/bowtie2\_GRCh38\_index -1 /data/trimmed/SRR8405197\_1\_val\_1.fq.gz -2 /data/trimmed/SRR8405197\_2\_val\_2.fq.gz -S /data/SRR8405197\_aligned\_v2.sam -q --very-sensitive-local -N 0 --dpad 15 --gbar 4 --local --ma 2 --mp 6,2 --np 1 --rdg 5,3 --rfg 5,3 -D 15 -R 2 -I 0 -X 500 --fr --met 1 -p 4 --seed 0",

"stdout": "",

"stderr": "4841 reads;

of these: 4841 (100.00%) were paired;

of these:

3655 (75.50%) aligned concordantly 0 times

394 (8.14%) aligned concordantly exactly 1 time

792 (16.36%) aligned concordantly >1 times

\----

3655 pairs aligned concordantly 0 times;

of these:

10 (0.27%) aligned discordantly 1 time

\----

3645 pairs aligned 0 times concordantly or discordantly;

of these:

7290 mates make up the pairs;

of these:

6941 (95.21%) aligned 0 times

201 (2.76%) aligned exactly 1 time

148 (2.03%) aligned >1 times

28.31% overall alignment rate",

"output\_files": \[

"/data/SRR8405197\_aligned\_v2.sam"

\]

}

#### VIII-A2 Cutadapt

MCP Server Request:

⬇

{

"cores": 4,

"adapter": "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA",

"input\_file": "/data/SRR8405197.fastq",

"output\_file": "/data/SRR8405197\_trimmed.fastq",

"minimum\_length": "20",

"quality\_cutoff": "20"

}

MCP Server Response:

⬇

{

"command\_executed": "cutadapt -j 4 -a AGATCGGAAGAGC... \[truncated\]",

"stdout": "This is cutadapt 5.1 with Python 3.10.0\\n...",

"stderr": "",

"output\_files": \["/data/SRR8405197\_trimmed.fastq"\]

}

#### VIII-A3 Samtools Sort

MCP Server Request:

⬇

{

‘threads‘: 4,

‘input\_file‘: ‘/data/SRR8405197\_aligned\_v2.bam‘,

‘output\_file‘: ‘/data/SRR8405197\_sorted\_v2.bam‘

}

MCP Server Response:

⬇

{

"command\_executed": "samtools sort -o /data/SRR8405197\_sorted\_v2.bam -O bam -@ 4 /data/SRR8405197\_aligned\_v2.bam",

"stdout": "",

"stderr": "\[bam\_sort\_core\] merging from 0 files and 4 in-memory blocks...\\n",

"output\_files": \[

"/data/SRR8405197\_sorted\_v2.bam"

\]

}

#### VIII-A4 Deeptools:bamCoverage

MCP Server Request:

⬇

{

‘bam‘: ‘/data/analysis\_output/aligned\_sorted.bam‘,

‘binSize‘: 50,

‘outFileName‘: ‘/data/analysis\_output/coverage.bw‘,

‘normalizeUsing‘: ‘RPKM‘,

‘numberOfProcessors‘: 4

}

MCP Server Response:

⬇

{

"command\_executed": "bamCoverage -b /data/analysis\_output/aligned\_sorted.bam -o /data/analysis\_output/coverage.bw --binSize 50 --minMappingQuality 0 --numberOfProcessors 4 --normalizeUsing RPKM",

"stdout": "",

"stderr": "normalization: RPKM

bamFilesList: \[’data/analysis\_output/aligned\_sorted.bam’\]

binLength: 50\\nnumberOfSamples: None

blackListFileName: None

skipZeroOverZero: False

bed\_and\_bin: False

genomeChunkSize: None

defaultFragmentLength: read length

numberOfProcessors: 4

verbose: False

region: None

bedFile: None

minMappingQuality: 0

ignoreDuplicates: False

chrsToSkip: \[\]

stepSize: 50

center\_read: False

samFlag\_include: None

samFlag\_exclude: None

minFragmentLength: 0

maxFragmentLength: 0

zerosToNans: False

smoothLength: None

save\_data: False

out\_file\_for\_raw\_data: None

maxPairedFragmentLength: 1000",

"output\_files": \[

"/data/analysis\_output/coverage.bw"

\]

}

#### VIII-A5 SPAdes (if not successful)

MCP Server Request:

⬇

{

‘memory‘: 8,

‘careful‘: true,

‘dataset‘: ‘/data/dataset.yaml‘,

‘isolate‘: true,

‘threads‘: 2,

‘output\_dir‘: ‘/data/spades\_assembly‘

}

MCP Server Response:

⬇

{

"command\_executed": "spades.py --isolate --careful --dataset /data/dataset.yaml -o /data/spades\_assembly -t 2 -m 8",

"stdout": "== Error == you cannot specify --mismatch-correction or --careful in isolate mode!

In case you have troubles running SPAdes, you can report an issue on our GitHub repository github.com/ablab/spades

Please provide us with params.txt and spades.log files from the output directory.",

"stderr": "SPAdes failed with return code 255",

"output\_files": \[\]

}

### VIII-B AI Agent Settings (JSON format)

#### VIII-B1 Connect to Python Environment

⬇

{

”command”: ”bash”,

”args”: \[

”-c”,

”source /Users/\<name>/miniforge3/etc/profile.d/conda.sh && conda activate \<env-name> && python /path/to/mcp\_tool/app/tool\_server.py”

\]

}

#### VIII-B2 Connect to Docker Connection

⬇

{

”command”: ”docker”,

”args”: \[

”run”, ”-i”, ”–rm”,

”-v”, ”/path/to/tool/data:/app/workspace”,

”tool-server:latest”

\]

}

### VIII-C BioinfoMCP Benchmark Prompts

#### VIII-C1 Individual Tool Execution

⬇

Can you run the \<tool-name> on \<genomic-file-path>. Please state what commands you run and what are the outputs or results from that command.

#### VIII-C2 Pipeline Task Execution

⬇

Can you run the \<pipeline-name> for \<task-name> to the \<genomic-file-path> (and \<genomic-file-path-2>).

(If part of the pipeline has already been done, can be stated here as well with ”I already run the \<ran-task-name> and and the results are \<results-path>”)

Give appropriate explanations and summarize results at the end with a simple report.

![Give a detail explanation for each part of the system prompt structure for BioinfoMCP Converter, from the Role, Task, Requirements, and Instructions.](https://arxiv.org/html/2510.02139v1/RTIR.png)

Fig. 4: The system prompt structure for BioinfoMCP Converter.

Fig. 5: Running the Genome Assembly task as part of the WGS pipeline with using the MCP servers produced by BioinfoMCP Converter.

Fig. 6: Running the Motif discovery for binding sites task as part of the ChIP-seq pipeline using the MCP servers produced by BioinfoMCP Converter.

Fig. 7: Running the identifying open chromatin region task as part of the ATAC-seq pipeline using the MCP servers produced by BioinfoMCP Converter.

Fig. 8: Running the somatic SNV calling task as part of the WGS/WES pipeline using the MCP servers produced by BioinfoMCP Converter.

[^1]: The genome analysis toolkit: A MapReduce framework for analyzing next-generation DNA sequencing data. \[Online\]. Available: [https://genome.cshlp.org/content/20/9/1297.short](https://genome.cshlp.org/content/20/9/1297.short)

[^2]: A. G. N. Wetie, I. Sokolowska, A. G. Woods, U. Roy, K. Deinhardt, and C. C. Darie, “Protein-protein interactions: switch from classical methods to proteomics and bioinformatics-based approaches,” vol. 71, no. 2, pp. 205–228, num Pages: 24 Place: Basel Publisher: Springer Basel Ag Web of Science ID: WOS:000329223500002.

[^3]: A. Franceschini, D. Szklarczyk, S. Frankild, M. Kuhn, M. Simonovic, A. Roth, J. Lin, P. Minguez, P. Bork, C. von Mering, and L. J. Jensen, “STRING v9.1: protein-protein interaction networks, with increased coverage and integration,” vol. 41, pp. D808–D815, num Pages: 8 Place: Oxford Publisher: Oxford Univ Press Web of Science ID: WOS:000312893300114.

[^4]: R. S. Hendriksen, V. Bortolaia, H. Tate, G. H. Tyson, F. M. Aarestrup, and P. F. McDermott, “Using genomics to track global antimicrobial resistance,” vol. 7, p. 242, num Pages: 17 Place: Lausanne Publisher: Frontiers Media Sa Web of Science ID: WOS:000486064300001.

[^5]: Assessing and assuring interoperability of a genomics file format | bioinformatics | oxford academic. \[Online\]. Available: [https://academic.oup.com/bioinformatics/article/38/13/3327/6586286](https://academic.oup.com/bioinformatics/article/38/13/3327/6586286)

[^6]: J. C. Venter, M. D. Adams, E. W. Myers, P. W. Li, R. J. Mural, G. G. Sutton, H. O. Smith, M. Yandell, C. A. Evans, R. A. Holt, J. D. Gocayne, P. Amanatides, R. M. Ballew, D. H. Huson, J. R. Wortman, Q. Zhang, C. D. Kodira, X. Q. H. Zheng, L. Chen, M. Skupski, G. Subramanian, P. D. Thomas, J. H. Zhang, G. L. G. Miklos, C. Nelson, S. Broder, A. G. Clark, C. Nadeau, V. A. McKusick, N. Zinder, A. J. Levine, R. J. Roberts, M. Simon, C. Slayman, M. Hunkapiller, R. Bolanos, A. Delcher, I. Dew, D. Fasulo, M. Flanigan, L. Florea, A. Halpern, S. Hannenhalli, S. Kravitz, S. Levy, C. Mobarry, K. Reinert, K. Remington, J. Abu-Threideh, E. Beasley, K. Biddick, V. Bonazzi, R. Brandon, M. Cargill, I. Chandramouliswaran, R. Charlab, K. Chaturvedi, Z. M. Deng, V. Di Francesco, P. Dunn, K. Eilbeck, C. Evangelista, A. E. Gabrielian, W. Gan, W. M. Ge, F. C. Gong, Z. P. Gu, P. Guan, T. J. Heiman, M. E. Higgins, R. R. Ji, Z. X. Ke, K. A. Ketchum, Z. W. Lai, Y. D. Lei, Z. Y. Li, J. Y. Li, Y. Liang, X. Y. Lin, F. Lu, G. V. Merkulov, N. Milshina, H. M. Moore, A. K. Naik, V. A. Narayan, B. Neelam, D. Nusskern, D. B. Rusch, S. Salzberg, W. Shao, B. X. Shue, J. T. Sun, Z. Y. Wang, A. H. Wang, X. Wang, J. Wang, M. H. Wei, R. Wides, C. L. Xiao, C. H. Yan, A. Yao, J. Ye, M. Zhan, W. Q. Zhang, H. Y. Zhang, Q. Zhao, L. S. Zheng, F. Zhong, W. Y. Zhong, S. P. C. Zhu, S. Y. Zhao, D. Gilbert, S. Baumhueter, G. Spier, C. Carter, A. Cravchik, T. Woodage, F. Ali, H. J. An, A. Awe, D. Baldwin, H. Baden, M. Barnstead, I. Barrow, K. Beeson, D. Busam, A. Carver, A. Center, M. L. Cheng, L. Curry, S. Danaher, L. Davenport, R. Desilets, S. Dietz, K. Dodson, L. Doup, S. Ferriera, N. Garg, A. Gluecksmann, B. Hart, J. Haynes, C. Haynes, C. Heiner, S. Hladun, D. Hostin, J. Houck, T. Howland, C. Ibegwam, J. Johnson, F. Kalush, L. Kline, S. Koduru, A. Love, F. Mann, D. May, S. McCawley, T. McIntosh, I. McMullen, M. Moy, L. Moy, B. Murphy, K. Nelson, C. Pfannkoch, E. Pratts, V. Puri, H. Qureshi, M. Reardon, R. Rodriguez, Y. H. Rogers, D. Romblad, B. Ruhfel, R. Scott, C. Sitter, M. Smallwood, E. Stewart, R. Strong, E. Suh, R. Thomas, N. N. Tint, S. Tse, C. Vech, G. Wang, J. Wetter, S. Williams, M. Williams, S. Windsor, E. Winn-Deen, K. Wolfe, J. Zaveri, K. Zaveri, J. F. Abril, R. Guigó, M. J. Campbell, K. V. Sjolander, B. Karlak, A. Kejariwal, H. Y. Mi, B. Lazareva, T. Hatton, A. Narechania, K. Diemer, A. Muruganujan, N. Guo, S. Sato, V. Bafna, S. Istrail, R. Lippert, R. Schwartz, B. Walenz, S. Yooseph, D. Allen, A. Basu, J. Baxendale, L. Blick, M. Caminha, J. Carnes-Stine, P. Caulk, Y. H. Chiang, M. Coyne, C. Dahlke, A. D. Mays, M. Dombroski, M. Donnelly, D. Ely, S. Esparham, C. Fosler, H. Gire, S. Glanowski, K. Glasser, A. Glodek, M. Gorokhov, K. Graham, B. Gropman, M. Harris, J. Heil, S. Henderson, J. Hoover, D. Jennings, C. Jordan, J. Jordan, J. Kasha, L. Kagan, C. Kraft, A. Levitsky, M. Lewis, X. J. Liu, J. Lopez, D. Ma, W. Majoros, J. McDaniel, S. Murphy, M. Newman, T. Nguyen, N. Nguyen, M. Nodell, S. Pan, J. Peck, M. Peterson, W. Rowe, R. Sanders, J. Scott, M. Simpson, T. Smith, A. Sprague, T. Stockwell, R. Turner, E. Venter, M. Wang, M. Y. Wen, D. Wu, M. Wu, A. Xia, A. Zandieh, and X. H. Zhu, “The sequence of the human genome,” vol. 291, no. 5507, pp. 1304–+, num Pages: 49 Place: Washington Publisher: Amer Assoc Advancement Science Web of Science ID: WOS:000166993400041.

[^7]: S. Goldsmith-Fischman and B. Honig, “Structural genomics: Computational methods for structure analysis,” vol. 12, no. 9, pp. 1813–1821, num Pages: 9 Place: Hoboken Publisher: Wiley Web of Science ID: WOS:000184976100001.

[^8]: S. Zhao, C. Su, Z. Lu, and F. Wang, “Recent advances in biomedical literature mining,” vol. 22, no. 3, p. bbaa057, num Pages: 19 Place: Oxford Publisher: Oxford Univ Press Web of Science ID: WOS:000709461300010. \[Online\]. Available: [https://www.proquest.com/docview/2406231579?pq-origsite=wos&accountid=168248](https://www.proquest.com/docview/2406231579?pq-origsite=wos&accountid=168248)

[^9]: M. Wu and A. J. Scott, “Phylogenomic analysis of bacterial and archaeal sequences with AMPHORA2,” vol. 28, no. 7, pp. 1033–1034, num Pages: 2 Place: Oxford Publisher: Oxford Univ Press Web of Science ID: WOS:000302298900021.

[^10]: M. A. Rivas and C. Chang, “Efficient storage and regression computation for population-scale genome sequencing studies,” vol. 41, no. 3, p. btaf067, num Pages: 5 Place: Oxford Publisher: Oxford Univ Press Web of Science ID: WOS:001440597300001.

[^11]: P. J. Park, “ChIP-seq: advantages and challenges of a maturing technology,” vol. 10, no. 10, pp. 669–680, num Pages: 12 Place: London Publisher: Nature Publishing Group Web of Science ID: WOS:000269965100010.

[^12]: Y. Zhang, T. Liu, C. A. Meyer, J. Eeckhoute, D. S. Johnson, B. E. Bernstein, C. Nussbaum, R. M. Myers, M. Brown, W. Li, and X. S. Liu, “Model-based analysis of ChIP-seq (MACS),” vol. 9, no. 9, p. R137, num Pages: 9 Place: London Publisher: BMC Web of Science ID: WOS:000260586900015.

[^13]: C. Trapnell, B. A. Williams, G. Pertea, A. Mortazavi, G. Kwan, M. J. van Baren, S. L. Salzberg, B. J. Wold, and L. Pachter, “Transcript assembly and quantification by RNA-seq reveals unannotated transcripts and isoform switching during cell differentiation,” vol. 28, no. 5, pp. 511–U174, num Pages: 8 Place: New York Publisher: Nature Publishing Group Web of Science ID: WOS:000277452700032.

[^14]: A. Conesa, P. Madrigal, S. Tarazona, D. Gomez-Cabrero, A. Cervera, A. McPherson, M. W. Szcześniak, D. J. Gaffney, L. L. Elo, X. Zhang, and A. Mortazavi, “A survey of best practices for rna-seq data analysis,” *Genome Biology*, vol. 17, no. 1, p. 13, 2016. \[Online\]. Available: [https://doi.org/10.1093/bib/bbac409](https://doi.org/10.1093/bib/bbac409)

[^15]: B. Hwang, J. H. Lee, and D. Bang, “Single-cell RNA sequencing technologies and bioinformatics pipelines,” vol. 50, p. 96, num Pages: 14 Place: London Publisher: Springernature Web of Science ID: WOS:000441266700002. \[Online\]. Available: [https://www.proquest.com/docview/2085690992?pq-origsite=wos&accountid=168248](https://www.proquest.com/docview/2085690992?pq-origsite=wos&accountid=168248)

[^16]: A. Butler, P. Hoffman, P. Smibert, E. Papalexi, and R. Satija, “Integrating single-cell transcriptomic data across different conditions, technologies, and species,” vol. 36, no. 5, pp. 411–+, num Pages: 15 Place: Berlin Publisher: Nature Portfolio Web of Science ID: WOS:000431622500018.

[^17]: A. J. Thirunavukarasu, D. S. J. Ting, K. Elangovan, L. Gutierrez, T. F. Tan, and D. S. W. Ting, “Large language models in medicine,” vol. 29, no. 8, pp. 1930–1940, num Pages: 11 Place: Berlin Publisher: Nature Portfolio Web of Science ID: WOS:001032505800003.

[^18]: S. Zhang, K. Liu, Y. Liu, X. Hu, and X. Gu, “The role and application of bioinformatics techniques and tools in drug discovery,” vol. 16, p. 1547131, num Pages: 12 Place: Lausanne Publisher: Frontiers Media Sa Web of Science ID: WOS:001432870200001.

[^19]: Introducing ChatGPT | OpenAI. \[Online\]. Available: [https://openai.com/index/chatgpt/](https://openai.com/index/chatgpt/)

[^20]: Intro to claude. \[Online\]. Available: [https://docs.anthropic.com/en/docs/intro](https://docs.anthropic.com/en/docs/intro)

[^21]: Introducing GPT-5. \[Online\]. Available: [https://openai.com/index/introducing-gpt-5/](https://openai.com/index/introducing-gpt-5/)

[^22]: P. I. Baykal, P. P. Labaj, F. Markowetz, L. M. Schriml, D. J. Stekhoven, S. Mangul, and N. Beerenwinkel, “Genomic reproducibility in the bioinformatics era,” vol. 25, no. 1, p. 213, num Pages: 15 Place: London Publisher: BMC Web of Science ID: WOS:001288132900003. \[Online\]. Available: [https://www.proquest.com/docview/3091293880?pq-origsite=wos&accountid=168248](https://www.proquest.com/docview/3091293880?pq-origsite=wos&accountid=168248)

[^23]: Significant Gravitas, “AutoGPT.” \[Online\]. Available: [https://github.com/Significant-Gravitas/AutoGPT](https://github.com/Significant-Gravitas/AutoGPT)

[^24]: J. Zhou, B. Zhang, G. Li, X. Chen, H. Li, X. Xu, S. Chen, W. He, C. Xu, L. Liu, and X. Gao, “An ai agent for fully automated multi-omic analyses,” *Advanced Science*, vol. 11, no. 44, p. 2407094, 2024. \[Online\]. Available: [https://advanced.onlinelibrary.wiley.com/doi/abs/10.1002/advs.202407094](https://advanced.onlinelibrary.wiley.com/doi/abs/10.1002/advs.202407094)

[^25]: S. X. Ge, E. W. Son, and R. Yao, “iDEP: an integrated web application for differential expression and pathway analysis of RNA-Seq data,” *BMC Bioinformatics*, vol. 19, no. 1, p. 534, Dec. 2018.

[^26]: A. Jiang, R. G. Snell, and K. Lehnert, “Icarus v3, a massively scalable web server for single-cell rna-seq analysis of millions of cells,” *Bioinformatics*, vol. 40, no. 4, p. btae167, 03 2024. \[Online\]. Available: [https://doi.org/10.1093/bioinformatics/btae167](https://doi.org/10.1093/bioinformatics/btae167)

[^27]: O. O’Donoghue, A. Shtedritski, J. Ginger, R. Abboud, A. E. Ghareeb, J. Booth, and S. G. Rodriques, “BioPlanner: Automatic evaluation of LLMs on protocol planning in biology.” \[Online\]. Available: [http://arxiv.org/abs/2310.10632](http://arxiv.org/abs/2310.10632)

[^28]: N. Mehandru, A. K. Hall, O. Melnichenko, Y. Dubinina, D. Tsirulnikov, D. Bamman, A. Alaa, S. Saponas, and V. S. Malladi, “BioAgents: Democratizing bioinformatics analysis with multi-agent systems.” \[Online\]. Available: [http://arxiv.org/abs/2501.06314](http://arxiv.org/abs/2501.06314)

[^29]: M. Flotho, I. F. Diks, P. Flotho, L.-A. G. Molano, P. Hirsch, and A. Keller, “MCPmed: A call for MCP-enabled bioinformatics web services for LLM-driven discovery.” \[Online\]. Available: [http://arxiv.org/abs/2507.08055](http://arxiv.org/abs/2507.08055)

[^30]: J. Pickard, R. Prakash, M. A. Choi, N. Oliven, C. Stansbury, J. Cwycyshyn, N. Galioto, A. Gorodetsky, A. Velasquez, and I. Rajapakse, “Automatic biomarker discovery and enrichment with brad,” *Bioinformatics*, vol. 41, no. 5, p. btaf159, 05 2025. \[Online\]. Available: [https://doi.org/10.1093/bioinformatics/btaf159](https://doi.org/10.1093/bioinformatics/btaf159)

[^31]: H. Wang, Y. He, P. P. Coelho, M. Bucci, A. Nazir, B. Chen, L. Trinh, S. Zhang, K. Huang, V. Chandrasekar, D. C. Chung, M. Hao, A. C. Leote, Y. Lee, B. Li, T. Liu, J. Liu, R. Lopez, T. Lucas, M. Ma, N. Makarov, L. McGinnis, L. Peng, S. Ra, G. Scalia, A. Singh, L. Tao, M. Uehara, C. Wang, R. Wei, R. Copping, O. Rozenblatt-Rosen, J. Leskovec, and A. Regev, “Spatialagent: An autonomous ai agent for spatial biology,” *bioRxiv*, 2025. \[Online\]. Available: [https://www.biorxiv.org/content/early/2025/04/06/2025.04.03.646459](https://www.biorxiv.org/content/early/2025/04/06/2025.04.03.646459)

[^32]: R. Green, X. Qu, J. Liu, and T. Yu, “BTR: a bioinformatics tool recommendation system,” vol. 40, no. 5, p. btae275, num Pages: 10 Place: Oxford Publisher: Oxford Univ Press Web of Science ID: WOS:001221237500002.

[^33]: Anthropic, “Introducing the Model Context Protocol,” [https://www.anthropic.com/news/model-context-protocol](https://www.anthropic.com/news/model-context-protocol), 2024, accessed: 2025-09-14. \[Online\]. Available: [https://www.anthropic.com/news/model-context-protocol](https://www.anthropic.com/news/model-context-protocol)

[^34]: Cursor - the AI code editor. \[Online\]. Available: [https://cursor.com/](https://cursor.com/)

[^35]: D. W. Huang, B. T. Sherman, and R. A. Lempicki, “Bioinformatics enrichment tools: paths toward the comprehensive functional analysis of large gene lists,” vol. 37, no. 1, pp. 1–13, num Pages: 13 Place: Oxford Publisher: Oxford Univ Press Web of Science ID: WOS:000262335700001.

[^36]: Welcome to FastMCP 2.0! \[Online\]. Available: [https://gofastmcp.com/getting-started/welcome](https://gofastmcp.com/getting-started/welcome)

[^37]: Y. Cheng, J. Chen, Q. Huang, Z. Xing, X. Xu, and Q. Lu, “Prompt sapper: A llm-empowered production tool for building ai chains,” *ACM Transactions on Software Engineering and Methodology*, vol. 33, no. 5, pp. 1–24, 2024.

[^38]: P. Danecek, J. K. Bonfield, J. Liddle, J. Marshall, V. Ohan, M. O. Pollard, A. Whitwham, T. Keane, S. A. McCarthy, R. M. Davies, and H. Li, “Twelve years of SAMtools and BCFtools,” *GigaScience*, vol. 10, no. 2, 02 2021, giab008. \[Online\]. Available: [https://doi.org/10.1093/gigascience/giab008](https://doi.org/10.1093/gigascience/giab008)

[^39]: BEDTools: a flexible suite of utilities for comparing genomic features | bioinformatics | oxford academic. \[Online\]. Available: [https://academic.oup.com/bioinformatics/article/26/6/841/244688](https://academic.oup.com/bioinformatics/article/26/6/841/244688)

[^40]: B. Langmead and S. L. Salzberg, “Fast gapped-read alignment with bowtie 2,” vol. 9, no. 4, pp. 357–359. \[Online\]. Available: [https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3322381/](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3322381/)

[^41]: H. Li and R. Durbin, “Fast and accurate short read alignment with burrows–wheeler transform.” \[Online\]. Available: [https://dx.doi.org/10.1093/bioinformatics/btp324](https://dx.doi.org/10.1093/bioinformatics/btp324)

[^42]: Massively parallel digital transcriptional profiling of single cells | nature communications. \[Online\]. Available: [https://www.nature.com/articles/ncomms14049](https://www.nature.com/articles/ncomms14049)

[^43]: M. Martin, “Cutadapt removes adapter sequences from high-throughput sequencing reads,” vol. 17, no. 1, pp. 10–12. \[Online\]. Available: [https://journal.embnet.org/index.php/embnetjournal/article/view/200](https://journal.embnet.org/index.php/embnetjournal/article/view/200)

[^44]: F. Ramírez, F. Dündar, S. Diehl, B. A. Grüning, and T. Manke, “deepTools: a flexible platform for exploring deep-sequencing data,” vol. 42, pp. W187–W191. \[Online\]. Available: [https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4086134/](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4086134/)

[^45]: F. Ramírez, D. P. Ryan, B. Grüning, V. Bhardwaj, F. Kilpert, A. S. Richter, S. Heyne, F. Dündar, and T. Manke, “deepTools2: a next generation web server for deep-sequencing data analysis,” vol. 44, pp. W160–165.

[^46]: fastp: an ultra-fast all-in-one FASTQ preprocessor | bioinformatics | oxford academic. \[Online\]. Available: [https://academic.oup.com/bioinformatics/article/34/17/i884/5093234](https://academic.oup.com/bioinformatics/article/34/17/i884/5093234)

[^47]: Babraham bioinformatics - FastQC a quality control tool for high throughput sequence data. \[Online\]. Available: [https://www.bioinformatics.babraham.ac.uk/projects/fastqc/](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)

[^48]: G. Perez, G. P. Barber, A. Benet-Pages, J. Casper, H. Clawson, M. Diekhans, C. Fischer, J. N. Gonzalez, A. S. Hinrichs, C. M. Lee, L. R. Nassar, B. J. Raney, M. L. Speir, M. J. van Baren, C. J. Vaske, D. Haussler, W. J. Kent, and M. Haeussler, “The UCSC genome browser database: 2025 update,” vol. 53, pp. D1243–D1249.

[^49]: Assembly of long, error-prone reads using repeat graphs | nature biotechnology. \[Online\]. Available: [https://www.nature.com/articles/s41587-019-0072-8](https://www.nature.com/articles/s41587-019-0072-8)

[^50]: E. Garrison and G. Marth, “Haplotype-based variant detection from short-read sequencing.” \[Online\]. Available: [http://arxiv.org/abs/1207.3907](http://arxiv.org/abs/1207.3907)

[^51]: A. McKenna, M. Hanna, E. Banks, A. Sivachenko, K. Cibulskis, A. Kernytsky, K. Garimella, D. Altshuler, S. Gabriel, M. Daly *et al.*, “The genome analysis toolkit: a mapreduce framework for analyzing next-generation dna sequencing data,” *Genome research*, vol. 20, no. 9, pp. 1297–1303, 2010.

[^52]: Graph-based genome alignment and genotyping with HISAT2 and HISAT-genotype | nature biotechnology. \[Online\]. Available: [https://www.nature.com/articles/s41587-019-0201-4](https://www.nature.com/articles/s41587-019-0201-4)

[^53]: Near-optimal probabilistic RNA-seq quantification | nature biotechnology. \[Online\]. Available: [https://www.nature.com/articles/nbt.3519](https://www.nature.com/articles/nbt.3519)

[^54]: Y. Zhang, T. Liu, C. A. Meyer, J. Eeckhoute, D. S. Johnson, B. E. Bernstein, C. Nusbaum, R. M. Myers, M. Brown, W. Li, and X. S. Liu, “Model-based analysis of ChIP-seq (MACS),” vol. 9, no. 9, p. R137.

[^55]: Minimap2: pairwise alignment for nucleotide sequences | bioinformatics | oxford academic. \[Online\]. Available: [https://academic.oup.com/bioinformatics/article/34/18/3094/4994778](https://academic.oup.com/bioinformatics/article/34/18/3094/4994778)

[^56]: MAFFT multiple sequence alignment software version 7: Improvements in performance and usability - PMC. \[Online\]. Available: [https://pmc.ncbi.nlm.nih.gov/articles/PMC3603318/](https://pmc.ncbi.nlm.nih.gov/articles/PMC3603318/)

[^57]: T. L. Bailey, N. Williams, C. Misleh, and W. W. Li, “MEME: discovering and analyzing DNA and protein sequence motifs,” vol. 34, pp. W369–W373, \_eprint: https://academic.oup.com/nar/article-pdf/34/suppl\_2/W369/7623054/gkl198.pdf. \[Online\]. Available: [https://doi.org/10.1093/nar/gkl198](https://doi.org/10.1093/nar/gkl198)

[^58]: MultiQC: summarize analysis results for multiple tools and samples in a single report | bioinformatics | oxford academic. \[Online\]. Available: [https://academic.oup.com/bioinformatics/article/32/19/3047/2196507](https://academic.oup.com/bioinformatics/article/32/19/3047/2196507)

[^59]: Qualimap: evaluating next-generation sequencing alignment data | bioinformatics | oxford academic. \[Online\]. Available: [https://academic.oup.com/bioinformatics/article/28/20/2678/206551](https://academic.oup.com/bioinformatics/article/28/20/2678/206551)

[^60]: QUAST: quality assessment tool for genome assemblies - PubMed. \[Online\]. Available: [https://pubmed.ncbi.nlm.nih.gov/23422339/](https://pubmed.ncbi.nlm.nih.gov/23422339/)

[^61]: R. Patro, G. Duggal, M. I. Love, R. A. Irizarry, and C. Kingsford, “Salmon: fast and bias-aware quantification of transcript expression using dual-phase inference,” vol. 14, no. 4, pp. 417–419. \[Online\]. Available: [https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5600148/](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5600148/)

[^62]: Sequence alignment/map format and SAMtools | bioinformatics | oxford academic. \[Online\]. Available: [https://academic.oup.com/bioinformatics/article/25/16/2078/204688](https://academic.oup.com/bioinformatics/article/25/16/2078/204688)

[^63]: H. Li, “lh3/seqtk,” original-date: 2012-03-23T23:24:13Z. \[Online\]. Available: [https://github.com/lh3/seqtk](https://github.com/lh3/seqtk)

[^64]: A. Bankevich, S. Nurk, D. Antipov, A. A. Gurevich, M. Dvorkin, A. S. Kulikov, V. M. Lesin, S. I. Nikolenko, S. Pham, A. D. Prjibelski, A. V. Pyshkin, A. V. Sirotkin, N. Vyahhi, G. Tesler, M. A. Alekseyev, and P. A. Pevzner, “SPAdes: A new genome assembly algorithm and its applications to single-cell sequencing,” vol. 19, no. 5, pp. 455–477. \[Online\]. Available: [https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3342519/](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3342519/)

[^65]: STAR: ultrafast universal RNA-seq aligner | bioinformatics | oxford academic. \[Online\]. Available: [https://academic.oup.com/bioinformatics/article/29/1/15/272537](https://academic.oup.com/bioinformatics/article/29/1/15/272537)

[^66]: F. Krueger, F. James, P. Ewels, E. Afyounian, M. Weinstein, B. Schuster-Boeckler, G. Hulselmans, and sclamons, “FelixKrueger/TrimGalore: v0.6.10 - add default decompression path,” 2023.

[^67]: A. M. Bolger, M. Lohse, and B. Usadel, “Trimmomatic: a flexible trimmer for illumina sequence data,” vol. 30, no. 15, pp. 2114–2120. \[Online\]. Available: [https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4103590/](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4103590/)

[^68]: “deepseek-ai/DeepSeek-v3,” original-date: 2024-12-26T09:52:40Z. \[Online\]. Available: [https://github.com/deepseek-ai/DeepSeek-V3](https://github.com/deepseek-ai/DeepSeek-V3)

[^69]: Introducing GPT-4.1 in the API | OpenAI. \[Online\]. Available: [https://openai.com/index/gpt-4-1/](https://openai.com/index/gpt-4-1/)

[^70]: Gemini 2.5: Our most intelligent AI model. \[Online\]. Available: [https://blog.google/technology/google-deepmind/gemini-model-thinking-updates-march-2025/](https://blog.google/technology/google-deepmind/gemini-model-thinking-updates-march-2025/)