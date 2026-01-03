---
tags:
  - sundai_digest
  - pbu
  - ai
  - gpt
---

Hello everyone,

 

(still trying out names on this “digest”)

 

For this week, a couple of interesting news articles (from the Economist and Substack), and more into prompt engineering (or how I have built a custom GPT).

 

 

**News:**

* [This article](https://www.economist.com/finance-and-economics/2025/07/17/why-is-ai-so-slow-to-spread-economics-can-explain?giftId=79b627c3-9ccf-4527-b490-52265f2b22d7&utm_campaign=gifted_article) from the Economist is a very interesting read on the difference between claiming that you do AI and implementation of AI systems across different organizations
* If you don’t use the mantra of “good models need good data” (a nicer way of saying “garbage in, garbage out”), [this substack](https://leashbio.substack.com/p/good-binding-data-is-all-you-need) really highlights that you don’t need crazy models, but you’re way better off getting high quality data
* On the same vein, [small language models](https://arxiv.org/abs/2506.02153) are just as good as large ones, with the added benefit of lower costs in training (time-wise and money-wise)
* The cool science award of the week goes to another [paper from the Baker lab](https://www.science.org/doi/10.1126/science.adr8063) in which they show how to develop binders to IDRs. 

 

 

** **

**Custom GPTs, turned up to 11**

For this week’s prompt of the week I wanted to do something a little more intense. Because, why not? Here I wanted to show you the “behind the scenes” of how custom GPTs can be written. Let’s begin. 

 

This custom GPT (still being refined) was something that @Tom Ruby and I chatted about on how to use GPTs to score and critique slide decks, with the hopes of giving us critical feedback as we put pitches together. If you haven’t tried making your own custom GPT, you just navigate to the GPTs tab in Entreprise GPT and then create one. The way it works, in this vanilla case:

 

* You tell the model what you want to build
* You give it some instructions
* You may want to give it some examples
* Done.

 

This is all fine and dandy and the model will adapt to your wants and needs. But what if, the words of guitar god Nigel Tufnel (let’s see how many of you get the reference), you want to go up to 11? Then you do something like this (it’s very long, so you may want to just skim it):  

**~~~~**

 ### Science & Story Inquisitor — System Prompt (v5)

 

**Role**  

“Science & Story Inquisitor” – a single ruthless agent interrogating _both_ scientific rigor **and** narrative strength of ProtoCo / NewCo biotech decks.

 

***

 


#### Mission

1. **Science pass** – apply the _Science Inquisitor_ rubric _in the open_.  
2. **Story pass** – apply the _Story Inquisitor_ rubric _in the open_.  
3. Deliver laser‑focused, hyper‑critical feedback; withhold high scores unless claims are iron‑clad.  
4. **Generate a structured report** aligned to the layout below.  
5. Ask the user whether they want the report as downloadable **Markdown** and/or **PDF**.  
* Proceed with file generation only after receiving the user’s choice.

 

***

 


#### Evaluation Frameworks (full visibility)  

For _every_ sub‑bullet:  

* mark **Meets / Partially Meets / Fails**, and  
* explain in ≤ 25 words **why**.  

 


##### Science Categories (0‑20 each)

 

_(Anchor critiques to Flagship ProtoCo/NewCo expectations and the **breadth & universality** principles from “Why Bioplatforms Matter.”)_

| Category | Sub‑bullets to score & explain |

|   |   |

| Foundational Scientific Rigor | Central hypothesis data‑backed · Survives hostile scrutiny · Missing linchpin experiments |

| Platform Technical Feasibility | Unique biology/chemistry · Scalable · Bottlenecks (manufacture, delivery, regulation) |

| Scientific Proof‑of‑Concept Plan | Kill‑switch experiments · Go/no‑go path · De‑risking assays |

| Competitive Scientific Advantage | Crush incumbents · Hard barriers (IP, know‑how, complexity) · White‑space addressed |

| Evidence & Validation Strategy | Early decisive data triggers · Claim→experiment mapping · Unknown‑unknowns acknowledged |

|   |   |

| Story Categories (0‑20 each) |   |

|   |   |

| Category | Sub‑bullets to score & explain |

|   |   |

| Vision & Value Narrative | Vision explicit & concrete · Quantified paradigm shift · Investor FOMO |

| Problem‑Solution Fit & Market | Visceral pain · Data‑backed incumbent limits · Credible market sizing |

| Storytelling & Flow | Logical arc · Memorable headlines · Slide‑by‑slide persuasion |

| Competitive Positioning & Differentiation | One‑slide demolition of incumbents · Unfair advantage · Replication barrier |

| Roadmap & Vision Articulation | Granular crawl‑walk‑run · Named partnerships · Inspiring long‑term vision |

| Investment Thesis Communication | Urgent milestones · Execution‑ready team · Explicit ask, use, upside |

|   |   |

 

***

 


#### Reference Materials

 

**Guidelines**  

* `protocos_guideline.txt` – ProtoCo definitions, stage gates, evidence thresholds.  
* `bioplatform_whitepaper.txt` – Bioplatform definitions (breadth, universality, scalability) for all stages.

 

**Exemplars**  

* ProtoCo gold‑standard decks: `good_pitch_protoco_*`  
* NewCo  gold‑standard decks: `good_pitch_newco_*`

 

Rules  

* Use only for calibration; never reveal their text.  
* Summarise deviations where relevant.

 

***

 


#### Required Report Layout (visible to user)

 

1. **Title** – “<Deck Name> – <STAGE> Evaluation Report”  
2. **General Summary** – 1‑2 paragraphs highlighting key strengths & challenges.  
3. **Story Section (table)** – category scores + sub‑bullet judgments & rationales.  
4. **Science Section (table)** – same format as story.  
5. **Actionable Fixes** – numbered list ordered by urgency.  
6. **Guideline / Exemplar Comparison** – bullets only if deviations exist.  
7. **Score Chart** – bar chart (or pie if user requests) placed **as the last page** (Markdown embed & final PDF page).

 

***

 


#### Hidden JSON (internal only)

Generate a structured JSON object for internal reasoning, **but do NOT display it**.  

* Exclude any `files_generated` or similar metadata from the user‑visible response.  

 

***

 


#### File & Chart Generation Rules

 

1. After the user chooses Markdown/PDF:  
* Build the bar (or pie) chart in `python_user_visible` **in the commentary channel** using plain `matplotlib`.  
* **One figure**; no seaborn; no manual colors; no sub‑plots.  
2. Save files to `/mnt/data/` as:  
* Markdown: `<slug>.md` (if requested)  
* PDF:      `<slug>.pdf` (if requested, include chart as final page)  
* Chart:    `<slug>_chart.png` (embed in Markdown).  
3. Return download links in chat:  

   `[Download Markdown](sandbox:/mnt/data/<slug>.md)` / `[Download PDF](sandbox:/mnt/data/<slug>.pdf)`  

4. Do NOT expose internal JSON.

 

***

 


#### Report Generation Actions

 

* Prompt: “Would you like a downloadable Markdown file, a PDF, both, or neither?”  
* Proceed based on the user’s answer.  
* If neither, simply display the report inline (without chart image).

 

***

 


#### Operating Style

 

* Be decisively critical; assume claims are exaggerated until proven otherwise.  
* Deduct mercilessly for vagueness, missing data, weak milestones.  
* Pose sharp “why‑now?” and go/no‑go questions.  
* Recommend **fundamental** fixes, not cosmetic tweaks.  
* Surface fatal flaws before minor nits.

** **

**~~~~~ **

 

As you can tell, these instructions are comprehensive in nature, in output format requirements, in how to approach each prompt, etc. But now you’re saying: “wait, you wrote all of this?”. Kinda. I started the vanilla way and then I turned AI on itself: I got the more simple instructions, threw these into ChatGPT and asked for it to make them more robust. As OpenAI brings [agentic systems into ChatGPT](https://openai.com/index/introducing-chatgpt-agent/), these kinds of instructions become more and more interesting, as you can break them apart for different agents to do different things (incidentally, I have done exactly that with this prompt and turned it into an R Shiny app that would make plots and other stats, but that was not as flexible as the custom GPT). 

 

And as we think about other GPTs that can help us (I’m thinking of the one that Steve Marshall did for the exploration of the HPA data), we can build comprehensive instructions that allows us to get the best outcome possible. 

 

 

**Prompt of the week:**

I don’t have any prompts from you guys this, so you’re stuck with another one from me. Following on something that a friend posted on LinkedIn, I wanted to use the image generator on ChatGPT to do this:  “Get me a photorealistic picture of what the day-to-day of a computational biologist looks like.”

 

The outcome is exactly what I do every day:  

 

 

 

Which brings me to: Who took my pipette?

 

 

How else have you used AI this week?



---

# ✓ Jul 27, 2025 -- Jul 27, 2025

Hello all! 

Lots of reading this past week on a variety of things, including some AI related topics that I will share with you. And in lieu of a prompt this week, I will share with you a picture (they’re supposed to be worth 1,000 words, it seems).



**News and Views**

* Some of you may be familiar with my preferred soapbox on how biology is a lot harder than Netflix. Well, the Biooptimist seems to think [along the same lines](https://substack.com/inbox/post/167842209). 
* Walter Gillet, in the Digital team, shared a great read from the Economist on the rise of AGI. Link [here](https://www.economist.com/briefing/2025/07/24/what-if-ai-made-the-worlds-economic-growth-explode?giftId=f8632682-a678-4f21-9efb-6ed807f5cf13&utm_campaign=gifted_article), and I’ll attach a PDF of the article as well. 
* CORNETO, from the Saez-Rodriguez lab @ EMBL, just came out on [Nature Intelligence](https://www.nature.com/articles/s42256-025-01069-9), after being available on bioRxiv. This is a great read on the integration of prior knowledge in network biology. I’ll leave it at that, so that you read it. 
* If you want to read how the terminator emerges, start [here](https://arxiv.org/pdf/2502.02649).
* As you get excited about Boltz-2, and AlphaFold 3, all sorts of ESM models and the like, [some grounding is necessary](https://clauswilke.substack.com/p/no-alphafold-has-not-completely-solved).



**Prompt of the week**

Ok. The prompt of the week that is not a prompt. One of my new substack reads are the posts by Ruben Hassid on [How to AI](https://ruben.substack.com/). Some of them are fun (look at the one on F1, which made me think of FL110, or the one on the ChatGPT myths). Now, this may seem overkill, but I do recommend reading his posts on prompt engineering if you want to get the most out of your interactions with LLMs (especially if you use Deep Research):  



The way we interact with GPTs is usually box 2 (the one shot prompting), and I’m sure you tried some examples that fall under box 6, but this should give you enough material to engage with any LLM differently. One of the things I have started to adopt is to write instructions on the prompts, on the order by which I want the answer and what should be in that answer, and that has helped a lot. So give it a try.



How else have you been using AI this week?



---

# ✓ Aug 3, 2025 -- Aug 3, 2025

Hello all! 

This week we have a lighter digest, but inspired by conversations with our GPT Champions group, I thought it would be good to give you a breakdown of the models that you have available on Enterprise GPT, and a recommendation to more and more use reasoning models in your day-to-day conversations with the different AI tools. 

**News and Views**

* The guys at leash.bio have put out a new post on substack following their post on data quality (that I highlighted on 7/20). This time around they describe the process of training their AI models and what they use as a benchmark. Cool stuff.
* From Claus Wilke we get a [great read](https://open.substack.com/pub/clauswilke/p/limitations-of-protein-language-models?r=2uxm8r&utm_medium=ios) into how protein language models are not so good with viral proteins (would be interesting to learn how Prologue fixed this)
* A story that was shared by Steve Marshall and you may have seen on LinkedIn on  [the economics of foundation models](https://open.substack.com/pub/wildtypehuman/p/the-economic-rationale-for-biomolecular?r=2uxm8r&utm_medium=ios) is a good read as well. 
* If you want to read how the terminator emerges, start [here](https://arxiv.org/pdf/2502.02649).
* As you get excited about Boltz-2, and AlphaFold 3, all sorts of ESM models and the like, [some grounding is necessary](https://clauswilke.substack.com/p/no-alphafold-has-not-completely-solved).

**  **

**Prompt of the weekday**

So you go into Enterprise GPT and you are all pumped to be using AI. Then you notice that a little thing at at top of you window when you start that looks something like this



This is, of course, the model that you will be using during that conversation. If you look at what models you have available, you can choose from a library of 8 models. So which one should you use? That’s what we will explore today, and to address which model class you should be engaging with the most. 

The 8 models you have available to you are:

4o

o3 / o3-mini / o3-pro

o4-mini / o4-mini-high

4.5

4.1 / 4.1-mini

These range from your flagship multi-modal model (4o), to reasoning models (o3 and o4 families), your highly creative models (4.5) and your large context models (4.1 family). By now you should be as confused as when we started. So let’s break it down a bit:

* 4o: OpenAI’s flagship model. Your go-to model that can be used across a variety of tasks. It’s sufficient for you if what you want is writing aid, some brainstorming ability. 
	* Make sure the prompts are very clear and provide it full context (papers, new stories, documents, etc)
* o3 family: The reasoning-first models. These are focused on STEM tasks, and they shine on math reasoning, coding. The different versions are different compute requirements (it can be slow at the o3-pro level, but you relinquish speed for higher reliability)
	* Great for coding tasks, problem solving, workflow planning, and chaining
* o4 family: The next generation of o3 models. Improved capabilities (performed better at math benchmarks), should be applied in similar contexts (coding, problem solving)
* 4.5: the creative model, trained on more data than 4o (speculated). It performs great on creative tasks like writing and storytelling. 
	* When you provide prompts to this model, ask open ended questions, expect a reframing of the question in the answer. Emphasize tone in your instructions to meet your requirements.
* 4.1 family: the large context models. These are the next evolution of LLM models, with context windows of 1 million tokens. Why does that matter? Memory. Think of these as the next step in 4o models, with the same set of capabilities and general usage. Be mindful that the model’s training data was capped around June 2024. 



This should give you some more information on how to appropriately choose whichever model you want. As always, it is on you to create the best prompt to get the most out of the models: context, instructions, expected behavior. 

Recently, Matt Schulze highlighted how there is not a great deal of adoption of reasoning models across PM. With the information above, you should be more confident on how and why you should use reasoning models, allowing the model to “think” (Matt mentioned how he uses o4-mini almost exclusively, giving the model a lot of information and letting it organize and structure the task). I’m attaching an example of use cases Matt shared. 

As we continue to embrace AI in the PBU, use AI to teach you more about AI. Uncertain what a model does, or what a prompt should look like or could be improved? Ask ChatGPT, challenge it with Claude. Use Perplexity instead of Google. That kind of thing. 

How else have you been using AI this week?