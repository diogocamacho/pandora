---
title: "Why We Need Continual Learning"
source: "https://www.a16z.news/p/why-we-need-continual-learning?utm_source=post-email-title&publication_id=13145&post_id=194923146&utm_campaign=email-post-title&isFreemail=true&r=2uxm8r&triedRedirect=true&utm_medium=email"
author:
  - "[[Malika Aubakirova]]"
published: 2026-04-22
created: 2026-10-02
description: "The Memento and the Machine"
tags:
  - "clippings"
---
![](https://substackcdn.com/image/fetch/$s_!DEWB!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fb8dcdf75-5f3f-4c24-8920-2adfd8a93d12_1460x650.png)

**[America](https://www.a16z.news/t/america) | [Tech](https://www.a16z.news/t/technology) | [Opinion](https://www.a16z.news/t/opinion) | [Culture](https://www.a16z.news/t/culture) | [Charts](https://www.a16z.news/t/charts)**

> [News from SpaceX and Cursor](https://x.com/SpaceX/status/2046713419978453374?s=20) - *if you haven’t seen yet, you’ll want to read this -AD*

![](https://substackcdn.com/image/fetch/$s_!SU5S!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8c68d5c7-8a95-49ea-9c12-8cf7f5f0f1a1_2920x10.png)

In Christopher Nolan’s Memento, Leonard Shelby lives inside a fractured present. After a traumatic brain injury, he suffers from anterograde amnesia, an affliction that prevents him from forming new memories. Every few minutes, his world resets, leaving him stranded in a perpetual now, untethered from what just happened and uncertain of what comes next. To cope, he survives by tattooing notes on his body and snapping Polaroids that are basically external props to remind him of what his brain cannot retain.

Large language models live in a similar perpetual present. They emerge from training with vast knowledge frozen into their parameters but they cannot form new memories - cannot update their parameters in response to new experience. To compensate, we surround them with scaffolding: chat history as short-term sticky notes, retrieval systems as external notebooks, system prompts as guiding tattoos. The model itself never fully internalizes the new information.

There’s a growing belief among some researchers that this is not enough. In-context learning (ICL) is sufficient for problems where the answer, or pieces of the answer, already exist somewhere in the world. But for problems that require genuine discovery (like novel mathematics), for adversarial scenarios (like security), or for knowledge too tacit to express in language, there’s a strong argument that models need a way to update their knowledge and experience directly into their parameters after deployment.

ICL is transient. Real learning requires compression. Until we let models compress continuously, we may be stuck in Memento’s perpetual present. Conversely, if we can train models to learn their own memory architectures - rather than offloading to bespoke harnesses - we may unlock a new dimension of scaling.

The name for this field of research is **continual learning.** And while the idea is not new (see: [McCloskey and Cohen](https://www.sciencedirect.com/science/chapter/bookseries/abs/pii/S0079742108605368), 1989!), we think it’s some of the most important work happening in AI right now. With the astounding growth in model capabilities over the past 2-3 years, the gap between what models know and what they *could* know has become increasingly obvious. So our goal with this post is to share what we’ve learned from top researchers working in this field; help disambiguate different approaches to continual learning; and advance this topic in the startup ecosystem.

*Note: This article was shaped by conversations with an extraordinary group of researchers, PhD students, and startup founders who have shared their work and perspectives on continual learning openly with us. Their insights from the theoretical foundations to the engineering realities of post-deployment learning made this piece sharper and more grounded than anything we could have written on our own. Thank you for your generosity with your time and ideas!*

### First, Let’s Talk About Context

Before making the case for parametric learning - i.e., learning that updates the model’s weights - it’s important to acknowledge that in-context learning absolutely does work. And there is a compelling argument that it will keep winning.

Transformers are, at their core, conditional next-token predictors over a sequence. Give them the right sequence, and you get surprisingly rich behavior, without touching the weights. That is why context management, prompt engineering, instruction tuning, and few-shot examples have been so powerful. The intelligence lives in the static parameters, and the apparent capabilities change radically depending on what you feed into the window.

Cursor’s [recent deep-dive](https://cursor.com/blog/scaling-agents) on scaling autonomous coding agents gives a nice example of this point: *“A surprising amount of the system’s behavior comes down to how we prompt the agents. The harness and models matter, but the prompts matter more.”* The model weights were fixed. What made the system work was careful orchestration of context: what to include, when to summarize, how to maintain coherent state across hours of autonomous operation.

![](https://substackcdn.com/image/fetch/$s_!3Lpn!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fb0dfebe8-4465-47da-8934-4e1ad6663976_2190x150.png)

![](https://substackcdn.com/image/fetch/$s_!SU5S!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8c68d5c7-8a95-49ea-9c12-8cf7f5f0f1a1_2920x10.png)

OpenClaw is another great example. It broke out not because of special model access (the underlying models were available to everyone) but because of how effectively it turns context and tools into working state: tracking what you’re doing, structuring intermediate artifacts, deciding what to re-inject into the prompt, maintaining persistent memory of prior work. OpenClaw elevates agent harness design to a discipline in its own right.

When prompting first emerged, many researchers were skeptical that “just prompting” could be a serious interface. It looked like a hack. Yet it was native to the transformer architecture, required no retraining, and scaled automatically with model improvements. So as models got better, prompting got better. “Janky but native” interfaces often win because they couple directly to the underlying system rather than fighting it. And so far, that’s exactly what’s happening with LLMs.

### State Space Models: Context On Steroids

As the dominant workflow moves from raw LLM calls to agentic loops, pressure is building on the in-context learning model. It used to be relatively rare to fill up context completely. This usually happened when LLMs were asked to do a long sequence of discrete work, and the app layer could prune and/or compress chat history in a straightforward way. With agents, though, one task can consume a significant portion of total available context. Each step in the agent’s loop relies on context passed from prior iterations. And they often fail after 20–100 steps because they lose the thread: their context fills up, coherence degrades, and they stop converging.

As a result, the major AI labs are now contributing significant resources (i.e., large training runs) to develop models with very large context windows. This is a natural approach to take because it builds on what’s working (in-context learning) and maps cleanly to the broader industry shift toward inference-time compute. The most common architecture is to intersperse fixed memory layers with normal attention heads, i.e., state space models and linear attention variants (*we will refer to all these as SSMs for simplicity*). SSMs offer a fundamentally better scaling profile than traditional attention for long contexts.

![](https://substackcdn.com/image/fetch/$s_!0Ezp!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F97890914-e206-4f0b-8f70-b4531fbfa164_2003x421.png)

The goal is to help agents maintain coherence over longer loops by several orders of magnitude, from say ~20 steps to ~20,000, without losing the breadth of skills and knowledge afforded by traditional transformers. If it works, this will be a major win for long-running agents. And you could even consider this approach a form of continual learning: while you’re not updating the model weights, you’ve introduced an external memory layer that rarely needs to be reset.

So, these non-parametric approaches are real and powerful. Any assessment of continual learning has to start here. The question is not whether today’s context-based systems work - they do. The question is whether we are looking at the ceiling, and if new approaches can take us further.

### What Context Misses: The Filing Cabinet Fallacy

> *“The thing that happened with AGI and pre-training is that in some sense they overshot the target… A human being is not an AGI. Yes, there is definitely a foundation of skills, but a human being lacks a huge amount of knowledge. Instead, we rely on continual learning. If I produce a super intelligent 15-year-old, they don’t know very much at all. A great student, very eager. You can say, ‘Go and be a programmer. Go and be a doctor.’ The deployment itself will involve some kind of a learning, trial-and-error period. It’s a process, not dropping the finished thing.”*
> 
> — Ilya Sutskever

Imagine a system with infinite storage. The world’s biggest filing cabinet, every fact perfectly indexed, instantly retrievable. It can look up anything. Has it learned?

No. It has never been forced to do the compression.

This is the centerpiece of our argument, and it draws on a point that Ilya Sutskever has made [before](https://www.youtube.com/watch?v=AKMuA_TVz3A): LLMs are, at their core, compression algorithms. During training, they compress the internet into parameters. The compression is lossy, and that is precisely what makes it powerful. Compression forces the model to find structure, to generalize, to build representations that transfer across contexts. A model that memorizes every training example is worse than one that extracts the underlying patterns. The lossy compression is the learning.

The irony is that the very mechanism that makes LLMs powerful during training (e.g. compressing raw data into compact, transferable representations) is exactly what we refuse to let them do after deployment. We stop the compression at the moment of release and replace it with external memory. Most agent harnesses, of course, compress context in some bespoke way. But wouldn’t the bitter lesson suggest that the models themselves should learn to do this compression, directly and at scale?

One example [Yu Sun](https://yueatsprograms.github.io/) shares to illustrate the debate is math. Consider Fermat’s Last Theorem. For over 350 years, no mathematician could prove it - not because they lacked access to the right literature, but because the solution was highly novel. The conceptual distance between established mathematics and the eventual answer was simply too vast. When Andrew Wiles finally cracked it in the 1990s, after seven years of working in near-total isolation, he had to invent powerful new techniques to reach the solution. His proof relied on successfully bridging two distinct branches of mathematics: elliptic curves and modular forms. While earlier work by Ken Ribet had shown that proving this connection would automatically resolve Fermat’s Last Theorem, no one possessed the theoretical machinery to actually construct that bridge until Wiles. A similar argument can be made about Grigori Perelman’s proof of the Poincaré conjecture.

**The central question is:** do these examples prove that something is missing from LLMs, some ability to update their priors and think in truly creative ways? Or, does the story prove the opposite - that all human knowledge is just data available for training/recombination, and Wiles and Perelman simply show what LLMs could do at even greater scale?

This question is empirical, and the answer is not known yet. But we do know there are many classes of problems where in-context learning fails today and where parametric learning could have an impact. For example:

![](https://substackcdn.com/image/fetch/$s_!ke_Z!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbc283422-20ca-45d6-b9ff-3b4b5764084d_2000x1204.png)

What’s more, in-context learning is limited to what can be expressed in language, whereas weights can encode concepts that someone’s prompt cannot relay in text. Some patterns are too high-dimensional, too tacit, too deeply structural to fit in a context. For example, the visual texture that distinguishes a benign artifact from a tumor in a medical scan, or the micro-fluctuations in audio that define a speaker’s unique cadence, are patterns that do not easily decompose into exact words. Language can only approximate them. No prompt, no matter how long, can transfer either; that kind of knowledge can only live in the weights. They live in the latent space of learned representations, not words. No matter how long the context window grows, there will be knowledge that cannot be described in text and can only be held in the parameters.

This may help explain why explicit “the bot remembers you” features, such as ChatGPT’s memory, often trigger user discomfort rather than delight. Users don’t actually want recall per se. They want competence. A model that has internalized your patterns can generalize to novel situations; a model that merely recalls your history cannot. The difference between “ *Here is what you responded to this email before* ” (verbatim) vs. “ *I understand how you think well enough to anticipate what you need* ” is the difference between retrieval and learning.

### A Primer on Continual Learning

There are various approaches to continual learning. The dividing line is not “memory features” vs. “no memory features.” It is: *where does compaction happen?* The approaches cluster along a spectrum from no compaction (pure retrieval, weights frozen), to full internal compaction (weight-level learning, model gets smarter), and one important middle ground (modules).

![](https://substackcdn.com/image/fetch/$s_!8l1v!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fec5391cb-c889-41ab-8e77-4da4b2856c3e_2000x1270.png)

### Context

On the context end, teams build smarter retrieval pipelines, agent harnesses, and prompt orchestration. This is the most mature category: the infrastructure is proven and the deployment story is clean. The limitation is depth: the context length.

One emerging extension worth noting here: multi-agent architectures as a scaling strategy for context itself. If a single model is bounded by a 128K-token window, a coordinated swarm of agents, each holding its own context, specializing on a slice of the problem, and communicating results, can collectively approximate unbounded working memory. Each agent performs in-context learning within its window; the system aggregates. Karpathy’s recent autoresearch project + Cursor’s [example](https://cursor.com/blog/scaling-agents) of building a web browser are early examples. It is a purely non-parametric approach (no weights change) but it dramatically extends the ceiling of what context-based systems can do.

### Modules

In the modules space, teams build attachable knowledge modules (compressed KV caches, adapter layers, external memory stores) that specialize a general-purpose model without retraining it. An 8B model with the right module can match 109B performance on targeted tasks using a fraction of the memory. The appeal is that it works with existing transformer infrastructure.

### Weights

On the weight updates, researchers are pursuing genuine parametric learning such as sparse memory layers that update only the relevant fraction of parameters, reinforcement learning loops that refine models from feedback, and test-time training that compresses context into weights during inference. These are the deepest approaches and the hardest to deploy, but ones that actually allow models to fully internalize new information or skills.

There are multiple parametric mechanisms on how to do the update. To name a few research directions:

![](https://substackcdn.com/image/fetch/$s_!MZ84!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3b039a1d-b34a-4f95-a5ac-4bce2b426fda_2000x1265.png)

The weight-level research landscape spans several parallel lines of work. **Regularization and weight-space methods** are the oldest: EWC (Kirkpatrick et al., 2017) penalizes changes to parameters in proportion to their importance for previous tasks, and weight interpolation (Kozal et al., 2024) blends old and new weight configurations in parameter space, though both tend to be brittle at scale. **Test-time training**, pioneered by Sun et al. (2020) and since evolved into architectural primitives (TTT layers, TTT-E2E, TTT-Discover), takes a different approach: run gradient descent on test-time data, compressing new information into parameters at the moment it matters. **Meta-learning** asks whether we can train models that learn how to learn, from MAML’s few-shot-friendly parameter initialization (Finn et al., 2017) to Behrouz et al.’s Nested Learning (2025), which structures the model as a hierarchy of optimization problems operating at different timescales, with fast-adapting and slow-updating modules inspired by biological memory consolidation.

**Distillation** preserves prior-task knowledge by matching a student to a frozen teacher checkpoint. LoRD (Liu et al., 2025) makes this efficient enough to run continuously by pruning both model and replay buffer. Self-distillation (SDFT, Shenfeld et al., 2026) flips the source, using the model’s own expert-conditioned outputs as the training signal, sidestepping the catastrophic forgetting of sequential fine-tuning. **Recursive self-improvement** operates in a similar spirit: STaR (Zelikman et al., 2022) bootstraps reasoning from self-generated rationales, AlphaEvolve (DeepMind, 2025) discovered improvements to algorithms untouched for decades, and Silver and Sutton’s “Era of Experience” (2025) frames agents learning from a continuous, never-ending experience stream.

These research directions are converging. TTT-Discover already fuses test-time training with RL-driven exploration. HOPE nests fast and slow learning loops inside a single architecture. SDFT turns distillation into a self-improvement primitive. The boundaries between columns are blurring — the next generation of continual learning systems will likely combine multiple strategies, using regularization to stabilize, meta-learning to accelerate, and self-improvement to compound. A growing cohort of startups is betting on different layers of this stack.

### The Continual Learning Startup Landscape

The non-parametric end of the spectrum is the most familiar. Harness companies (Letta, mem0, Subconscious) build orchestration layers and scaffolding that manage what goes into the context window. External storages and RAG infrastructure (e.g. Pinecone, xmemory) provide the retrieval backbone. The data exists, the challenge is getting the right slice of it in front of the model at the right time. As context windows expand, the design space for these companies grows with them, particularly on the harness side, where a new wave of startups is emerging to manage increasingly complex context strategies.

The parametric side is earlier and more varied. Companies here are attempting some version of post-deployment compression, letting models internalize new information in the weights. The approaches cluster into a few distinct bets about *how* models should learn after release.

**Partial compaction: learning without retraining.** Some teams are building attachable knowledge modules (compressed KV caches, adapter layers, external memory stores) that specialize a general-purpose model without touching its core weights. The shared thesis: you can get meaningful compaction (not just retrieval) while keeping the stability-plasticity tradeoff manageable, because the learning is isolated rather than distributed across the full parameter space. An 8B model with the right module can match far larger model performance on targeted tasks. The upside is composability: modules work with existing transformer architectures out of the box, can be swapped or updated independently, and are far easier to experiment with than retraining.

**RL and feedback loops: learning from signals.** Other teams are betting that the richest signal for post-deployment learning already exists in the deployment loop itself — user corrections, task success and failure, reward signals from real-world outcomes. The core idea is that models should treat every interaction as a potential training signal, not just an inference request. This is a close analog to how humans improve at a job: you do the work, you get feedback, you internalize what worked. The engineering challenge is converting sparse, noisy, sometimes adversarial feedback into stable weight updates without catastrophic forgetting but a model that genuinely learns from deployment compounds in value over time in a way that context-only systems cannot.

**Data-centric approaches: learning from the right signal.** A related but distinct bet is that the bottleneck isn’t the learning algorithm but the training data and surrounding systems. These teams focus on curating, generating, or synthesizing the right data to drive continual updates: the premise being that a model with access to high-quality, well-structured learning signal needs far fewer gradient steps to meaningfully improve. This connects naturally to the feedback-loop companies but emphasizes the upstream question: not just *whether* the model can learn, but *what* and *to what degree* it should learn from.

**Novel architectures: learning by design.** The most radical bet is that the transformer architecture itself is the bottleneck, and that continual learning requires fundamentally different computational primitives: architectures with continuous-time dynamics and built-in memory mechanisms. The thesis here is structural: if you want a system that learns continuously, you should build the learning mechanism into the substrate.

![](https://substackcdn.com/image/fetch/$s_!9Vpn!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F231f5923-48c7-422e-910f-c8bb3859d874_2000x1144.png)

All the major labs are also active across these categories. Some are exploring better context management and chain-of-thought reasoning. Others are experimenting with external memory modules or sleep-time compute pipelines. Several stealth startups are pursuing novel architectures. The field is early enough that no single approach has won, and given the range of use cases, none should.

### Why Naive Weight Updates Fail

Updating model parameters in production introduces a cascade of failure modes that are, so far, unsolved at scale.

![](https://substackcdn.com/image/fetch/$s_!qIAq!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fef7feda1-1c9b-4013-9ade-3752449d0c6d_2000x1431.png)

The engineering problems are well-documented. Catastrophic forgetting means models sensitive enough to learn from new data destroy existing representations - the stability-plasticity dilemma. Temporal disentanglement is the fact that invariant rules and mutable state get compressed into the same weights, so updating one corrupts the other. Logical integration fails because fact updates don’t propagate to their consequences: changes are local to token sequences, not semantic concepts. And unlearning remains impossible: there is no differentiable operation for subtraction, so false or toxic knowledge has no surgical remedy.

But there is a second set of problems that gets less attention. The current separation between training and deployment is not just an engineering convenience - it is a safety, auditability, and governance boundary. Open it, and several things break at once. Safety alignment can degrade unpredictably: even narrow fine-tuning on benign data can produce broadly misaligned behavior. Continuous updates create a data poisoning surface - a slow, persistent version of prompt injection that lives in the weights. Auditability breaks down because a continuously updating model is a moving target that can’t be versioned, regression-tested, or certified once. And privacy risks intensify when user interactions get compressed into parameters, baking sensitive information into representations that are far harder to filter than retrieved context.

These are open problems, not fundamental impossibilities, and solving them is as much a part of the continual learning research agenda as solving core architectural challenges.

### From Memento to Memory

Leonard’s tragedy in *Memento* isn’t that he can’t function: he’s resourceful, even brilliant within any given scene. His tragedy is that he can never compound. Every experience remains external - a Polaroid, a tattoo, a note in someone else’s handwriting. He can retrieve, but he cannot compress the new knowledge.

As Leonard moves through this self-constructed maze, the line between truth and belief begins to blur. His condition does not just strip him of memory; *it forces him to constantly reconstruct meaning*, making him both investigator and unreliable narrator in his own story.

Today’s AI operates under the same constraint. We have built extraordinarily capable retrieval systems: longer context windows, smarter harnesses, coordinated multi-agent swarms, and they work! But retrieval is not learning. A system that can look up any fact has not been forced to find structure. It has not been forced to generalize. The lossy compression that makes training so powerful, the mechanism that turns raw data into transferable representations, is exactly what we shut off the moment we deploy.

The path forward is likely not a single breakthrough but a layered system. In-context learning will remain the first line of adaptation: it is native, proven, and improving. Module mechanisms can handle the middle ground of personalization and domain specialization. But for the hard problems such as discovery, adversarial adaptation, knowledge too tacit to express with words, we may need models that compress experience into their parameters after training. That means advances in sparse architectures, meta-learning objectives, and self-improvement loops. It may also require us to redefine what “a model” even means: not a fixed set of weights, but an evolving system that includes its memories, its update algorithms, and its capacity to abstract from its own experience.

The filing cabinet keeps getting bigger. But a bigger filing cabinet is still a filing cabinet. The breakthrough is letting the model do after deployment what made it powerful during training: compress, abstract, and learn. We stand at the cusp of moving from amnesiac models to ones with a glimmer of experience. Otherwise, we will be stuck in our own Memento.

![](https://substackcdn.com/image/fetch/$s_!x83d!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbdfa26cc-8980-41ca-a3bb-7ece793bed5b_3098x158.png)

![](https://substackcdn.com/image/fetch/$s_!SU5S!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8c68d5c7-8a95-49ea-9c12-8cf7f5f0f1a1_2920x10.png)

*This newsletter is provided for informational purposes only, and should not be relied upon as legal, business, investment, or tax advice. Furthermore, this content is not investment advice, nor is it intended for use by any investors or prospective investors in any a16z funds. This newsletter may link to other websites or contain other information obtained from third-party sources - a16z has not independently verified nor makes any representations about the current or enduring accuracy of such information. If this content includes third-party advertisements, a16z has not reviewed such advertisements and does not endorse any advertising content or related companies contained therein. Any investments or portfolio companies mentioned, referred to, or described are not representative of all investments in vehicles managed by a16z; visit [https://a16z.com/investment-list/](https://a16z.com/investment-list/) for a full list of investments. Other important information can be found at [a16z.com/disclosures](http://a16z.com/disclosures). You’re receiving this newsletter since you opted in earlier; if you would like to opt out of future newsletters you may unsubscribe immediately.*

∙