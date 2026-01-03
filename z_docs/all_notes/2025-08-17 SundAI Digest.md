---
tags:
  - sundai_digest
  - ai
  - gpt
  - pbu
---


Hello all! 

This week’s weekly digest will take a nerdier path, on how you can go from idea to code and validated approach in just a couple of days, with a product to show at the end of it. Before we get there, a long but interesting read on AI shared by Nick Franklin at PI, and the seeming debacle with GPT-5.

**News and Views**

* This past week Nick Franklin, at PI, shared an interesting article out of Columbia on [AI as a normal technology](https://knightcolumbia.org/content/ai-as-normal-technology). It’s long, but provides a good basis for discussion on the current and future state of AI (or how we should think about it).
* While GPT-5 continues to gather news headlines, there’s chatter on how good it really is. Yes, it is faster. Yes, it is cheaper. But some argument on the intertubes is all about how “smarter” it truly is (with some clamoring for the return of 4o!). Altman has been doing lite damage control after the bungling of the launch, and more is coming his way on putting his money where is mouth is when it comes to 5’s performance. 



**Prompt of the week**

The prompt this week is not a prompt, it’s a story and a workflow. I wanted to give you take you on a journey on how I went from a conversation with @vini to exploring some ideas on pen and paper (and whiteboard), to doing some coding (and reviving old code from my personal GitHub) to getting to a point that we now have a new potential computational platform.

Starting with the conversation with Vini, we discussed how we could use network biology, multi-omics data, and the slew of information we have in the public domain, to build a target and drug discovery engine. It’s vague, as any exploration starts out being. So, we ran a Deep Research prompt to get us started: 

I want to start a project on the integration of multi-omics data for comprehensive biology understanding (in particular, the differences between healthy states and disease ones.) I’m interested in how the integration of multi-omics data with network biology approaches can unravel entirely novel means for targeting disease states, in what I’d term network-based targeting. You are part of a team of computational biologists and experimental scientists. Give me a detailed implementation of the above description focused on: - integration of key data sets - R code to integrate computational frameworks - develop a pitch for a seed stage company (budget: about $3M for 9months of runway, max of 2.5 FTE plus 2 senior principals at 50% of their time acting as founding leadership) - develop the key sets of wet-lab experiments that will validate the platform. be hyper descriptive. - develop a pitch deck for the series A round - a detailed analyses of competitors and approaches to increase differentiation - a plan for development for the 12, 18, and 36 months post series A - a detailed plan for company growth from seed stage to series B, including headcount and projected burn. - Give me a name for this potential NewCo. Use the attached files as EXAMPLES as you develop the necessary content for this exploration. Write it all out as a word document, and provide me sketch slide decks for both protoco pitch and newco pitch.

The generated analyses was interesting, and it gave us some additional ideas. As I was putting together BioArchitect (inspired by this Deep Research prompt), we asked this cutom GPT to help us come up with some “what ifs…” There were some whacky ideas in there that we delved into a little bit more in person, some of them with more oomph than others. For example:

* “What if disease modules identified by network proximity became ‘GPS beacons’ for repurposing?”, which almost reads like Cellarity
* “What if single-cell multi-omics maps could predict drug response before first-in-human?”, which reminded me of Etiome
* “What if target prioritisation incorporated economic as well as biological network centrality?”, which is interesting in genesis

We iterated a few more times and came up with a cool name for the platform and all, and are in the brainstorming phase of where we want to go. But I had a start which speaks to me dearly (on network biology and data integration), some starter code that the GPT gave me, and I had existing code from past life experiences that could resurface. So, if I was to blend it all together, could I get somewhere fast? Fast forward to yesterday, and the description of the workflow:

* Start with the idea
* Sketch out the data you need (in our case, it was BioGRID, STRING, Encode, and TTRUST)
* Code the basis of the algorithm (old school, no AI. Just sit down, write some functions, get the process going)
	* (It helped that I had an algorithm from 2020 that could be the genesis of this)
* Go into Cursor
	* Give it your code
	* Ask Claude (built in to Cursor) to review it and optimize it

Now you have something going. But Claude (in Cursor) can be extremely verbose and take you in directions that you are not necessarily thinking (it can also explode the number of functions you have). It is also not very creative, even if it codes ok (I like how it implements something and runs the code to see where it is breaking, which is good). 

At this point, this is where you use ChatGPT (in my case, I used the GPT5 Thinking mode), to evaluate where you are going and give you feedback (almost like a code reviewer and a science reviewer). Here’s an example:

You are a computational biology and ML expert. look at the attached description of an analyses I just ran, and let me know what are things you would like more clarity on, things that I may have missed, areas for improvement, and general grade of the analyses.

Which came back with:

**Overall**: strong scaffolding and speed, but the statistics and validation posture need to mature before I’d trust the driver list. Call it an **overall B** (methods/reporting A-, statistical rigor B-, biological validation C+). The stepwise doc is clear and reproducible; the science needs a few guardrails and stress-tests to avoid overconfident novelty claims.

After a few iterations (and some wrapping up today), we now have an approach that I am calling DiseaseNets, that will constitute some of the basis of the work with Vini, that uses gene expression data, nodewise sparse regression, and graph attention networks to identify drivers of disease states. On a simple lung cancer data set it identified some interesting genes to follow up on as potential drivers of the disease that fall outside of the traditional targets that have been the focus of the disease treatment. More needs to be done, of course, but using natural intelligence, brainstorming with your colleagues, and pitting AI against AI in a way, we went from a blank canvas to a state-of-the-art algorithm. Pretty cool. 



Next week we will cover productivity tools, I promise. I just wanted to share this as it is something that I am personally excited about. 

(NOTE: If you have used PI’s concept generator, BioArchitect is nothing like that. In fact, and I need to talk to Dalit, there is a world where the two tools can co-exist, where an idea from the Concept Generator gets pushed into BioArchitect for a “build out” of sorts. Maybe I can do a demo of BioArchitect at one of our all hands meetings.)

How have you been AI-ing this week?