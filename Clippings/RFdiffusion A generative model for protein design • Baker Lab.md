---
title: "RFdiffusion: A generative model for protein design • Baker Lab"
source: "https://www.bakerlab.org/2023/07/11/diffusion-model-for-protein-design/"
author:
  - "[[admin]]"
published: 2023-07-11
created: 2026-10-01
description: "A team led by scientists in our lab has created a powerful new way to design proteins by combining structure prediction networks and generative diffusion models. The team demonstrated extremely high computational success and experimentally tested hundreds of A.I.-generated proteins, finding that many may be useful as medications, vaccines, or even new nanomaterials. Originally appearing"
tags:
  - "clippings"
---
A team led by scientists in our lab has created a powerful new way to design proteins by combining structure prediction networks and generative diffusion models. The team demonstrated extremely high computational success and experimentally tested hundreds of A.I.-generated proteins, finding that many may be useful as medications, vaccines, or even new nanomaterials.

Originally appearing as a [preprint](https://www.biorxiv.org/content/10.1101/2022.12.09.519842v1), this research is now available in *[Nature](https://www.nature.com/articles/s41586-023-06415-8)*. Additional applications of RFdiffusion are also described in a companion [preprint](https://www.biorxiv.org/content/10.1101/2022.12.10.519862v4).

The software tool DALL-E produces high-quality images that have never existed before using something called a diffusion model, which is a machine-learning algorithm that specializes in adding and removing noise. Diffusion models for image generation begin with images of pure static and gradually remove noise until a clear picture is formed. Additional pieces of software guide this denoising process so that the new images end up matching what was asked for.

![](https://www.bakerlab.org/wp-content/uploads/2023/02/AhernWoody.jpg)

Woody Ahern

We have developed a guided diffusion model for generating new proteins called RFdiffusion. With prior design methods, tens of thousands of molecules may have to be tested before finding a single one that performs as intended. Using the new method, the team had to test as little as one per design challenge.

![](https://www.bakerlab.org/wp-content/uploads/2023/03/C76D0D05-FBD8-493F-9E46-E20B0BE75248.jpeg)

Read More: RFdiffusion now free and open source

RFdiffusion outperforms existing protein design methods across a broad range of problems, including topology-constrained protein monomer design, protein binder design, symmetric oligomer design, enzyme active site scaffolding, and symmetric motif scaffolding for therapeutic and metal-binding protein design. Highlights include a picomolar binder generated through pure computation and a series of novel symmetric assemblies experimentally confirmed by electron microscopy.

“These works reveal just how powerful diffusion models can be for protein design,” says Watson. “It’s extremely exciting,” added Juergens, “and it’s really just the beginning.”

<video controls="" src="https://www.bakerlab.org/wp-content/uploads/2022/11/diffusion_animation_PTHbinder_v6.mp4"></video>

*RFdiffusion can generate novel proteins that bind to target molecules.*

<video controls="" src="https://www.bakerlab.org/wp-content/uploads/2022/11/diffusion_animation_InsulinR_binder.mp4"></video>

*Here RFdffusion generates a novel protein that binds to the insulin receptor.*