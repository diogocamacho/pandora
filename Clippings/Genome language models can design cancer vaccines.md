---
title: "Genome language models can design cancer vaccines"
source: "https://www.radicalnumerics.ai/blog/omnii-cancer-vaccines?utm_source=tldrnewsletter"
author:
  - "[[Alexander Fields]]"
  - "[[Michael Poli]]"
  - "[[and Eric Nguyen]]"
published: 2026-09-07
created: 2026-09-28
description: "We post-trained Omnii, our next-generation genome language model, for end-to-end cancer vaccine design, from neoantigen selection to the final mRNA."
tags:
  - "clippings"
  - "cancer-vaccines"
  - "genome-language-models"
  - "immunology"
  - "personalized-medicine"
  - "ai-in-biology"
related:
  - "[[2025-10-21 pMHC for diagnostics]]"
  - "[[2025-12-16 T-cell reprogramming]]"
processed: true
idea-supports:
  - "[[2026-06-18 biotech-of-one]]"
  - "[[2025-09-02 subroutine-tx]]"
ideas_checked: true
---
![A T cell reaching down to the surface of another cell, its receptor gripping a peptide held in an MHC molecule that glows orange at the point of contact](https://www.radicalnumerics.ai/_next/image?url=%2Fassets%2Fblog%2Fomnii-cancer-vaccines%2Fcancer_vaccine_hero.png&w=3840&q=75&dpl=dpl_7qLpNc6tpmhnTCqWuKRY5CHdmoha)

A T cell reaching down to the surface of another cell, its receptor gripping a peptide held in an MHC molecule that glows orange at the point of contact

*Cancer vaccines are one of the clearest opportunities for AI to contribute to the design of a personalized medicine. We post-trained `Omnii`, our next-generation genome language model, for end-to-end cancer vaccine design.*

Omnii for cancer vaccine is in early access

We're looking for design partners and collaborators across cancer immunology and vaccine development.

[Sign up for early access](https://www.radicalnumerics.ai/waitlist?track=health&utm_campaign=omnii-cancer-vaccine)

For over a hundred years, scientists have dreamed of using our own body's defenses to fight cancer. In principle, our immune system already has what it needs to destroy cancer cells. The problem is knowing *what* to attack.

Cancer begins as our own cells, making it difficult for the immune system to distinguish what is dangerous from what should be left alone. And even when it does recognize the threat, cancer can change, hide, and blend back into the crowd. To make things even harder, every patient's cancer looks different (one person's pancreatic tumor differs from someone else's pancreatic tumor).

The idea behind a cancer vaccine is deceptively simple: teach the immune system what the cancer looks like, so it can recognize those cells as dangerous and hunt them down.

A cancer vaccine is, in a sense, a set of molecular "wanted posters," showing the immune system exactly what to look for. And yes, the name is a little confusing. We usually think of vaccines as something you get *beforehand*, to avoid getting sick. But these cancer vaccines are **therapeutic**, they are designed for patients who already have cancer. Instead of preventing an infection, they train the immune system to attack a disease already growing inside the body.

Recently, Moderna and Merck announced a landmark result: the first personalized cancer vaccine to succeed in a Phase 3 trial [^1]. For patients with melanoma, they sequenced each patient's tumor, identified mutations unique to that cancer, and created a personalized set of molecular "wanted posters" to help the patient's own immune system hunt it down. It is a historic milestone. But it is also just the beginning.

The Moderna/Merck result is in melanoma, a cancer particularly amenable to immune attack [^2]. There are more than a *hundred* other types of cancer, many far more difficult for the immune system to see and attack. And every tumor brings its own mutations, its own biology, and its own ways of escaping.

So the bigger question is: **can we do this again?** Can we learn to design a personalized vaccine for *any* tumor, for *any* patient?

Doing that is fundamentally a design problem. We have to read the unique biology of a patient and their tumor, reason across many different biological signals, choose what the immune system should be taught to attack, and ultimately turn those decisions into an ***mRNA sequence*** that can become the vaccine.

Unlike traditional drug development, the algorithm is not merely helping discover the medicine, it is *part* of the medicine.

This is what makes cancer vaccines such a natural problem for AI, and particularly for genome language models. Biology is written in sequences, but understanding which sequence to design requires much more than DNA alone. It requires connecting information across DNA, RNA, proteins, gene regulation, and the immune system, and the three-dimensional structures those molecules form when they interact.

We designed [`Omnii`](https://www.radicalnumerics.ai/blog/omnii-health-preview) [^3], our multimodal genome language model, with this in mind, to flexibly read any biological sequence. `Omnii` is in research preview, but we decided to see if post-training could teach it to design a cancer vaccine. Let's start from the beginning.

## Building a cancer vaccine

So how do you actually make one of these "wanted posters"? It starts with a tumor. We sequence it (read its DNA), compare it with the patient's healthy cells, and look for mutations that are unique to the cancer. That gives us a list of possible targets. Often, there are hundreds [^4], most of them useless. But at the end of the day, each "wanted poster" is a *sequence*.

<svg viewBox="0 0 690 467.26" width="100%" role="img"><title>Antigen presentation, normal versus mutant peptide</title> <desc>A normal protein and a mutant protein are both cut by the proteasome into short peptides. A normal peptide is displayed on one MHC complex and the mutant peptide on another. A T cell disengages from the normal peptide with no immune response, while a second T cell binds the mutant peptide and induces cell death.</desc><defs><marker id="apf-arrow" viewBox="0 0 10 10" refX="8" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse"><path d="M2 1L8 5L2 9" fill="none" stroke="context-stroke" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></marker></defs> <rect x="0" y="0" width="680" height="434" fill="#FFFFFF"></rect><g transform="translate(0,-52)" font-family="'Geist Mono', Menlo, ui-monospace, monospace"><path d="M120,105 C62,108 32,140 30,205 C28,290 32,385 82,428 C145,470 330,462 396,434 C440,418 460,388 462,330 C464,265 464,240 462,185 C460,138 415,110 348,105 C265,99 180,101 120,105 Z" fill="#FAFAFA" stroke="#D4D4D4" stroke-width="1.2"></path><text x="110" y="124" font-size="12" fill="#737373">normal protein</text> <polyline points="55,155 65,144.8 75,140 85,143.3 95,152.9 105,163.6 115,169.7 125,167.9 135,159.2 145,148.4 155,140.9 165,141.4 175,148.8 185,158.3 195,168.2" fill="none" stroke="#D4D4D4" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></polyline><g fill="#FFFFFF" stroke="#A3A3A3" stroke-width="1"><circle cx="55" cy="155" r="4.5"></circle><circle cx="65" cy="144.8" r="4.5"></circle><circle cx="75" cy="140" r="4.5"></circle><circle cx="85" cy="143.3" r="4.5"></circle><circle cx="95" cy="152.9" r="4.5"></circle><circle cx="105" cy="163.6" r="4.5"></circle><circle cx="125" cy="167.9" r="4.5"></circle><circle cx="135" cy="159.2" r="4.5"></circle><circle cx="145" cy="148.4" r="4.5"></circle><circle cx="155" cy="140.9" r="4.5"></circle><circle cx="165" cy="141.4" r="4.5"></circle><circle cx="175" cy="148.8" r="4.5"></circle><circle cx="185" cy="158.3" r="4.5"></circle><circle cx="195" cy="168.2" r="4.5"></circle></g><circle cx="115" cy="169.7" r="5" fill="#FFFFFF" stroke="#737373" stroke-width="1.3"></circle><polyline points="55,355 65,365.2 75,370 85,366.7 95,357.1 105,346.4 115,340.3 125,342.1 135,350.8 145,361.6 155,369.1 165,368.6 175,361.2 185,351.7 195,341.8" fill="none" stroke="#D4D4D4" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></polyline><g fill="#FFFFFF" stroke="#A3A3A3" stroke-width="1"><circle cx="55" cy="355" r="4.5"></circle><circle cx="65" cy="365.2" r="4.5"></circle><circle cx="75" cy="370" r="4.5"></circle><circle cx="85" cy="366.7" r="4.5"></circle><circle cx="95" cy="357.1" r="4.5"></circle><circle cx="105" cy="346.4" r="4.5"></circle><circle cx="125" cy="342.1" r="4.5"></circle><circle cx="135" cy="350.8" r="4.5"></circle><circle cx="145" cy="361.6" r="4.5"></circle><circle cx="155" cy="369.1" r="4.5"></circle><circle cx="165" cy="368.6" r="4.5"></circle><circle cx="175" cy="361.2" r="4.5"></circle><circle cx="185" cy="351.7" r="4.5"></circle><circle cx="195" cy="341.8" r="4.5"></circle></g><circle cx="115" cy="340.3" r="5" fill="#FA6D0F"></circle><text x="110" y="396" font-size="12" fill="#737373">mutant protein</text> <g stroke="#D4D4D4" stroke-width="1" stroke-dasharray="4 4" fill="none"><path d="M104,182 L48,222"></path><path d="M126,182 L252,222"></path><path d="M104,328 L48,310"></path><path d="M126,328 L252,310"></path></g><rect x="42" y="222" width="216" height="88" rx="6" fill="#FFFFFF" stroke="#E5E5E5" stroke-width="1"></rect><text x="57" y="238" font-size="11" fill="#9A9A9A">normal</text> <g fill="#FAFAFA" stroke="#E5E5E5" stroke-width="1"><rect x="57" y="243" width="18" height="18" rx="3"></rect><rect x="78" y="243" width="18" height="18" rx="3"></rect><rect x="99" y="243" width="18" height="18" rx="3"></rect><rect x="120" y="243" width="18" height="18" rx="3"></rect><rect x="141" y="243" width="18" height="18" rx="3"></rect><rect x="162" y="243" width="18" height="18" rx="3"></rect><rect x="183" y="243" width="18" height="18" rx="3"></rect><rect x="204" y="243" width="18" height="18" rx="3"></rect><rect x="225" y="243" width="18" height="18" rx="3"></rect></g><g font-size="11" fill="#404040" text-anchor="middle"><text x="66" y="256">M</text> <text x="87" y="256">E</text> <text x="108" y="256">T</text> <text x="129" y="256">L</text> <text x="150" y="256">K</text> <text x="171" y="256">Q</text> <text x="192" y="256">V</text> <text x="213" y="256">A</text> <text x="234" y="256">L</text></g> <text x="57" y="283" font-size="11" fill="#9A9A9A">mutant</text> <g fill="#FAFAFA" stroke="#E5E5E5" stroke-width="1"><rect x="57" y="288" width="18" height="18" rx="3"></rect><rect x="78" y="288" width="18" height="18" rx="3"></rect><rect x="99" y="288" width="18" height="18" rx="3"></rect><rect x="120" y="288" width="18" height="18" rx="3"></rect><rect x="162" y="288" width="18" height="18" rx="3"></rect><rect x="183" y="288" width="18" height="18" rx="3"></rect><rect x="204" y="288" width="18" height="18" rx="3"></rect><rect x="225" y="288" width="18" height="18" rx="3"></rect></g><rect x="141" y="288" width="18" height="18" rx="3" fill="#FA6D0F"></rect><g font-size="11" fill="#404040" text-anchor="middle"><text x="66" y="301">M</text> <text x="87" y="301">E</text> <text x="108" y="301">T</text> <text x="129" y="301">L</text> <text x="150" y="301" fill="#FFFFFF">R</text> <text x="171" y="301">Q</text> <text x="192" y="301">V</text> <text x="213" y="301">A</text> <text x="234" y="301">L</text></g> <line x1="205" y1="172" x2="312" y2="250" stroke="#737373" stroke-width="1" marker-end="url(#apf-arrow)"></line><line x1="205" y1="344" x2="312" y2="298" stroke="#737373" stroke-width="1" marker-end="url(#apf-arrow)"></line><rect x="316" y="245" width="62" height="60" rx="4" fill="#F5F5F5" stroke="#A3A3A3" stroke-width="1"></rect><g stroke="#E5E5E5" stroke-width="1"><line x1="316" y1="261" x2="378" y2="261"></line><line x1="316" y1="275" x2="378" y2="275"></line><line x1="316" y1="289" x2="378" y2="289"></line></g><text x="347" y="323" text-anchor="middle" font-size="11" fill="#9A9A9A">proteasome</text> <g stroke="#D4D4D4" stroke-width="1.2" fill="none"><polyline points="390,258 398,254 406,259"></polyline><polyline points="418,252 426,248 434,253"></polyline><polyline points="388,288 396,284 404,289"></polyline><polyline points="416,292 424,288 432,293"></polyline></g><g fill="#FFFFFF" stroke="#A3A3A3" stroke-width="1"><circle cx="390" cy="258" r="3.5"></circle><circle cx="398" cy="254" r="3.5"></circle><circle cx="406" cy="259" r="3.5"></circle><circle cx="418" cy="252" r="3.5"></circle><circle cx="426" cy="248" r="3.5"></circle><circle cx="434" cy="253" r="3.5"></circle><circle cx="388" cy="288" r="3.5"></circle><circle cx="396" cy="284" r="3.5"></circle><circle cx="404" cy="289" r="3.5"></circle><circle cx="416" cy="292" r="3.5"></circle><circle cx="432" cy="293" r="3.5"></circle></g><circle cx="424" cy="288" r="4" fill="#FA6D0F"></circle><line x1="418" y1="240" x2="418" y2="178" stroke="#737373" stroke-width="1" marker-end="url(#apf-arrow)"></line><line x1="418" y1="300" x2="418" y2="346" stroke="#737373" stroke-width="1" marker-end="url(#apf-arrow)"></line><polyline points="404,166 418,164 432,168" fill="none" stroke="#D4D4D4" stroke-width="1.5"></polyline><g fill="#FFFFFF" stroke="#A3A3A3" stroke-width="1"><circle cx="404" cy="166" r="5.5"></circle><circle cx="418" cy="164" r="5.5"></circle><circle cx="432" cy="168" r="5.5"></circle></g><text x="358" y="194" text-anchor="middle" font-size="11" fill="#737373">normal peptide</text> <line x1="441" y1="166" x2="452" y2="166" stroke="#737373" stroke-width="1" marker-end="url(#apf-arrow)"></line><polyline points="404,362 418,360 432,364" fill="none" stroke="#D4D4D4" stroke-width="1.5"></polyline><circle cx="404" cy="362" r="5.5" fill="#FFFFFF" stroke="#A3A3A3" stroke-width="1"></circle><circle cx="432" cy="364" r="5.5" fill="#FFFFFF" stroke="#A3A3A3" stroke-width="1"></circle><circle cx="418" cy="360" r="6" fill="#FA6D0F"></circle><text x="358" y="390" text-anchor="middle" font-size="11" fill="#737373">mutant peptide</text> <line x1="441" y1="362" x2="452" y2="361" stroke="#737373" stroke-width="1" marker-end="url(#apf-arrow)"></line><text x="270" y="442" text-anchor="middle" font-size="11" fill="#9A9A9A">inside the cell</text> <g transform="translate(459,166) rotate(90)" fill="#F5F5F5" stroke="#525252" stroke-width="1.2" stroke-linejoin="round"><rect x="-5" y="-29" width="10" height="34" rx="3"></rect><rect x="-16" y="-32" width="32" height="13" rx="4"></rect><rect x="-16" y="-50" width="7" height="22" rx="3"></rect><rect x="9" y="-50" width="7" height="22" rx="3"></rect></g><g fill="#FFFFFF" stroke="#A3A3A3" stroke-width="1"><circle cx="494" cy="157" r="4.5"></circle><circle cx="494" cy="166" r="4.5"></circle><circle cx="494" cy="175" r="4.5"></circle></g><text x="493" y="210" text-anchor="middle" font-size="11" fill="#9A9A9A">mhc</text> <g transform="translate(459,360) rotate(90)" fill="#F5F5F5" stroke="#525252" stroke-width="1.2" stroke-linejoin="round"><rect x="-5" y="-29" width="10" height="34" rx="3"></rect><rect x="-16" y="-32" width="32" height="13" rx="4"></rect><rect x="-16" y="-50" width="7" height="22" rx="3"></rect><rect x="9" y="-50" width="7" height="22" rx="3"></rect></g><circle cx="494" cy="351" r="4.5" fill="#FFFFFF" stroke="#A3A3A3" stroke-width="1"></circle><circle cx="494" cy="369" r="4.5" fill="#FFFFFF" stroke="#A3A3A3" stroke-width="1"></circle><circle cx="494" cy="360" r="5" fill="#FA6D0F"></circle><text x="493" y="404" text-anchor="middle" font-size="11" fill="#9A9A9A">mhc</text> <text x="594" y="100" text-anchor="middle" font-size="11" fill="#7C3AED">t cells check</text> <text x="594" y="116" text-anchor="middle" font-size="11" fill="#7C3AED">the peptides</text> <rect x="518" y="153" width="9" height="26" rx="3" fill="#EDE9FE" stroke="#7C3AED" stroke-width="1.2"></rect><rect x="527" y="160" width="31" height="11" rx="4" fill="#EDE9FE" stroke="#7C3AED" stroke-width="1.2"></rect><circle cx="594" cy="166" r="36" fill="#F5F3FF" stroke="#7C3AED" stroke-width="1.2"></circle><circle cx="605" cy="178" r="13" fill="#EDE9FE" stroke="#A78BFA" stroke-width="1"></circle><text x="594" y="226" text-anchor="middle" font-size="11" fill="#737373">no immune response</text> <rect x="498" y="347" width="9" height="26" rx="3" fill="#EDE9FE" stroke="#7C3AED" stroke-width="1.2"></rect><rect x="507" y="354" width="31" height="11" rx="4" fill="#EDE9FE" stroke="#7C3AED" stroke-width="1.2"></rect><circle cx="574" cy="360" r="36" fill="#F5F3FF" stroke="#7C3AED" stroke-width="1.2"></circle><circle cx="585" cy="372" r="13" fill="#EDE9FE" stroke="#A78BFA" stroke-width="1"></circle><text x="574" y="416" text-anchor="middle" font-size="11" fill="#EA580C">induced cell death</text><path d="M528,424 Q478,448 428,428" fill="none" stroke="#FA6D0F" stroke-width="1.4" marker-end="url(#apf-arrow)"></path><g role="button" tabindex="0" aria-label="Normal protein" aria-expanded="false"><rect x="45" y="112" width="170" height="68" rx="8" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></rect><g opacity="0.5" pointer-events="all"><circle cx="222" cy="120" r="5" fill="#FFFFFF" stroke="#FA6D0F" stroke-width="1.2"></circle><line x1="219.8" y1="120" x2="224.2" y2="120" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line><line x1="222" y1="117.8" x2="222" y2="122.2" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line></g></g><g role="button" tabindex="0" aria-label="Mutant protein" aria-expanded="false"><rect x="45" y="333" width="170" height="67" rx="8" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></rect><g opacity="0.5" pointer-events="all"><circle cx="222" cy="392" r="5" fill="#FFFFFF" stroke="#FA6D0F" stroke-width="1.2"></circle><line x1="219.8" y1="392" x2="224.2" y2="392" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line><line x1="222" y1="389.8" x2="222" y2="394.2" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line></g></g><g role="button" tabindex="0" aria-label="Peptides" aria-expanded="false"><rect x="42" y="222" width="216" height="88" rx="8" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></rect><g opacity="0.5" pointer-events="all"><circle cx="248" cy="232" r="5" fill="#FFFFFF" stroke="#FA6D0F" stroke-width="1.2"></circle><line x1="245.8" y1="232" x2="250.2" y2="232" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line><line x1="248" y1="229.8" x2="248" y2="234.2" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line></g></g><g role="button" tabindex="0" aria-label="The mutation" aria-expanded="false"><circle cx="115" cy="340.3" r="11" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></circle><rect x="135" y="282" width="30" height="30" rx="8" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></rect><g opacity="0.5" pointer-events="all"><circle cx="150" cy="275" r="5" fill="#FFFFFF" stroke="#FA6D0F" stroke-width="1.2"></circle><line x1="147.8" y1="275" x2="152.2" y2="275" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line><line x1="150" y1="272.8" x2="150" y2="277.2" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line></g></g><g role="button" tabindex="0" aria-label="Proteasome" aria-expanded="false"><rect x="310" y="240" width="74" height="90" rx="8" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></rect><g opacity="0.5" pointer-events="all"><circle cx="347" cy="338" r="5" fill="#FFFFFF" stroke="#FA6D0F" stroke-width="1.2"></circle><line x1="344.8" y1="338" x2="349.2" y2="338" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line><line x1="347" y1="335.8" x2="347" y2="340.2" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line></g></g><g role="button" tabindex="0" aria-label="Normal peptide" aria-expanded="false"><rect x="392" y="152" width="52" height="26" rx="8" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></rect><rect x="310" y="182" width="96" height="16" rx="8" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></rect><g opacity="0.5" pointer-events="all"><circle cx="300" cy="190" r="5" fill="#FFFFFF" stroke="#FA6D0F" stroke-width="1.2"></circle><line x1="297.8" y1="190" x2="302.2" y2="190" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line><line x1="300" y1="187.8" x2="300" y2="192.2" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line></g></g><g role="button" tabindex="0" aria-label="Neoantigen" aria-expanded="false"><rect x="392" y="348" width="52" height="26" rx="8" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></rect><rect x="310" y="378" width="96" height="16" rx="8" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></rect><g opacity="0.5" pointer-events="all"><circle cx="300" cy="386" r="5" fill="#FFFFFF" stroke="#FA6D0F" stroke-width="1.2"></circle><line x1="297.8" y1="386" x2="302.2" y2="386" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line><line x1="300" y1="383.8" x2="300" y2="388.2" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line></g></g><g role="button" tabindex="0" aria-label="MHC" aria-expanded="false"><rect x="450" y="146" width="66" height="40" rx="8" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></rect><rect x="478" y="198" width="32" height="16" rx="8" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></rect><rect x="450" y="340" width="48" height="40" rx="8" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></rect><rect x="478" y="392" width="32" height="16" rx="8" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></rect><g opacity="0.5" pointer-events="all"><circle cx="516" cy="206" r="5" fill="#FFFFFF" stroke="#FA6D0F" stroke-width="1.2"></circle><line x1="513.8" y1="206" x2="518.2" y2="206" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line><line x1="516" y1="203.8" x2="516" y2="208.2" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line></g><g opacity="0.5" pointer-events="all"><circle cx="516" cy="400" r="5" fill="#FFFFFF" stroke="#FA6D0F" stroke-width="1.2"></circle><line x1="513.8" y1="400" x2="518.2" y2="400" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line><line x1="516" y1="397.8" x2="516" y2="402.2" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line></g></g><g role="button" tabindex="0" aria-label="T cell: no response" aria-expanded="false"><circle cx="594" cy="166" r="40" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></circle><rect x="514" y="148" width="46" height="36" rx="8" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></rect><rect x="526" y="214" width="136" height="16" rx="8" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></rect><g opacity="0.5" pointer-events="all"><circle cx="594" cy="244" r="5" fill="#FFFFFF" stroke="#FA6D0F" stroke-width="1.2"></circle><line x1="591.8" y1="244" x2="596.2" y2="244" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line><line x1="594" y1="241.8" x2="594" y2="246.2" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line></g></g><g role="button" tabindex="0" aria-label="T cell: recognition" aria-expanded="false"><circle cx="574" cy="360" r="40" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></circle><rect x="494" y="342" width="46" height="34" rx="8" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></rect><rect x="513" y="406" width="122" height="16" rx="8" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></rect><rect x="420" y="414" width="116" height="28" rx="8" pointer-events="all" fill="transparent" stroke="none" stroke-width="1" stroke-dasharray="3 3"></rect><g opacity="0.5" pointer-events="all"><circle cx="622" cy="432" r="5" fill="#FFFFFF" stroke="#FA6D0F" stroke-width="1.2"></circle><line x1="619.8" y1="432" x2="624.2" y2="432" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line><line x1="622" y1="429.8" x2="622" y2="434.2" stroke="#FA6D0F" stroke-width="1.2" stroke-linecap="round"></line></g></g></g></svg>

Hover or click a marked element for an explanation.

Figure 1. How a cancer mutation becomes an immune target. Cells continuously chop proteins into short peptide fragments and display them on their surface using MHC molecules. Most peptides look normal, so T cells ignore them. But a tumor mutation can create a new mutant protein that the immune system recognizes as foreign, allowing a T cell to identify and kill the cancer cell. Cancer vaccines aim to predict which mutations will generate these visible, immune-triggering peptides, and train the immune system to attack them.

A mutation might look interesting on paper but never become visible to the immune system. Another might become visible, but the immune system simply ignores it. Only a small fraction make good targets for a vaccine. The real challenge, then, is figuring out which mutations the immune system will actually see, and which ones it will care about.

### Every cell is constantly showing the immune system what's inside

Our cells have a remarkable surveillance system. They continually chop up proteins from inside themselves into tiny fragments, called peptides, and display some of those fragments on their surface using molecules called major histocompatibility complex (MHC) proteins. You can think of MHC as a little display case on the outside of every cell.

T cells patrol the body inspecting these displays. Most of what they see is normal and gets ignored, but if a cell displays something suspicious, and a T cell recognizes it, the immune system can attack.

Cancer gives us an opportunity because mutations can create peptides that healthy cells do not have. Those are exactly the kinds of differences we would like to put on our molecular "wanted posters." The difficulty is predicting which ones will work.

## The cancer vaccine design problem

At a high level, designing a personalized cancer vaccine involves six steps:

1. **Read the tumor.** Sequence the patient's cancer and identify mutations that distinguish it from healthy cells.
2. **Generate possible targets.** Turn those mutations into candidate peptide fragments that could serve as "wanted posters."
3. **Ask: will the tumor actually display it?** Predict whether each peptide will be presented on the surface of the patient's cancer cells.
4. **Ask: will the immune system actually respond to it?** Predict whether a T cell will recognize that presented peptide as something worth attacking.
5. **Choose the best set.** From hundreds or thousands of possibilities, select the handful most likely to produce a useful immune response.
6. **Build the vaccine.** Encode those targets into an mRNA sequence that can actually be manufactured and given to the patient.

Steps 3 and 4 are the hardest:

Of all the possible mutations in this patient's cancer, which ones should we teach the immune system to attack?

That comes down to two predictions.

**Will the tumor show it?**

And, if it does:

**Will the immune system care?**

These are known as **presentation** and **immunogenicity**. They are also where much of the intelligence in a cancer-vaccine algorithm has to live.

## How to use Omnii to design a cancer vaccine

This is a surprisingly natural problem for a genome language model. A mutation does not have a fixed meaning by itself. Its effect depends on the sequence around it, the protein it changes, the patient's particular immune system, which MHC molecules they carry, what the tumor is expressing, and how all of those pieces interact. Context matters.

That should sound familiar to anyone who works on language models. The meaning of a word depends on the sentence around it. In biology, the consequence of a mutation similarly depends on the biological "sentence" in which it appears.

But biology has another wrinkle, in that sequence is only one view of the problem. Molecules made from those sequences fold into three-dimensional structures and physically interact with one another. These physical interactions, between peptides, MHCs, and T cells, determine whether or not the immune system responds.

Genome language models are trained to learn those relationships directly from biological sequences. `Omnii` takes this further by pre-training across DNA, RNA, epigenomics, protein sequences *and* tokenized protein structure, giving it a shared representation across many of the biological layers involved in this decision.

With focused post-training, we can then ask that general biological model a much more specific question. Is this a good target for this patient's immune system?

DNA sequence

…GATTACCGGATCG…

Protein sequence

…MKTAYIAKQRQ…

Protein structure

structure tokens

t412 t087 t931 …

Functional genomics tracks

Multi-stream  
fusion

Omnii

MHC presentation prediction

Immunogenicity prediction

Sequence design

Hover any part of the diagram for an explanation.

Figure 2. Omnii is a multi-modal genome model, fusing DNA, amino acids, 3D protein structure, and functional genomics. We post-trained Omnii to predict key cancer vaccine tasks, presentation, immunogenicity and sequence design.

## Task 1: Will the tumor show it?

Imagine we identify a promising mutation in a tumor. That alone isn't enough. For the immune system to attack it, a fragment containing that mutation first has to make its way to the surface of the cancer cell and fit into one of the patient's MHC molecules. If that never happens, the immune system effectively never sees our target. This first prediction is called **presentation**.

And presentation is highly personal. Humans carry different versions of MHC genes, so a peptide that is prominently displayed in one patient might never appear at all in another. The question `Omnii` has to answer is:

**Given this peptide and this patient's MHC molecules, how likely is the cancer cell to put it on display?**

From an AI perspective, the model's task is to use the peptide and patient's MHC sequences to predict the probability that the peptide will be presented. But pre-training allows `Omnii` to leverage more than just the raw sequences. Because it has also been trained on protein structure, it has a representation of the physical shapes these sequences can form and how a peptide may or may not sit inside an MHC binding groove.

01

Proteins are broken into peptides

02

Peptides are tested for MHC binding

03

Strong binders are carried to the surface; weak ones are degraded

inside the cell

protein

peptides

MHC

Strong binding

MHC

Weak or no binding

degraded

presented

The peptide–MHC complex reaches the cell surface and is visible to T cells.

not presented

The peptide never reaches the surface and cannot be seen by T cells.

hover any part of the diagram for detail

Figure 3. Not every tumor peptide makes it to the cell surface. To become visible to the immune system, a peptide must bind to an MHC molecule and be presented on the outside of the cell. Peptides that fail to bind are effectively hidden from T cells, making presentation prediction a critical first step in cancer vaccine design.

## Task 2: If the tumor shows it, will the immune system care?

Passing the first test still isn't enough. A cancer cell might display a mutated peptide perfectly, and the immune system may simply shrug. A T cell has to recognize that particular peptide as something dangerous enough to attack. This second prediction is called **immunogenicity**. It is arguably the more difficult question.

Presentation asks whether a peptide will be visible. Immunogenicity asks what happens *after* it is seen. Will a T cell recognize it? Will it activate? Will it mount a meaningful response against the tumor? For a cancer vaccine, this distinction is the most important aspect. A perfect wanted poster is useless if nobody recognizes the face. So the goal is to find peptides that meet both criteria:

- The tumor displays them.
- The immune system attacks them.

From an AI perspective, this is another prediction problem, but a much noisier one:

**Given the peptide, the patient's MHC, and the biological context of the complex being shown to the immune system, predict whether it is likely to trigger a T-cell response.**

This is another place where structure is a natural signal. A T cell does not encounter a peptide as a string of amino-acid letters, it encounters the three-dimensional surface formed by the peptide sitting inside an MHC molecule.

In ML terms, presentation asks *will this peptide appear?* Immunogenicity asks *conditional on it appearing, will the immune system respond?*

01

neoantigen  
peptide

mhc

tumor cell

02

t cell

t cell  
receptor

03

✓

match  
found

04

lysis

01presented

02checked

03recognized

04cell death

Figure 4. Being presented is not enough, the immune system also has to care. An immunogenic peptide is one that a T cell can recognize when displayed by MHC and respond to strongly enough to attack the cell. Other peptides may be presented perfectly but still fail to trigger a meaningful T-cell response. Predicting this immunogenicity is the second major challenge in choosing targets for a cancer vaccine.

## Teaching Omnii to make these predictions

We post-trained `Omnii` to predict both presentation and immunogenicity for MHC class I and class II (ideally we want to engage both: one helps direct the attack, the other helps organize and sustain it). For every candidate, the model sees the peptide together with the patient's particular MHC sequence and predicts whether it will meet both requirements. We then compared `Omnii` with widely used specialized models built for the same tasks. For presentation, `Omnii` performed comparably to or slightly better than representative specialized tools:

- **Class I presentation:** `Omnii` 0.939 vs. BigMHC-EL 0.933 [^5]
- **Class II presentation:** `Omnii` 0.945 vs. NetMHCIIpan-4.3-EL 0.935 [^6]

The more interesting result came from the harder question: **immunogenicity**.

- **Class I immunogenicity:** `Omnii` 0.750 vs. BigMHC-IM 0.558 and PRIME2.1 0.514 [^7]
- **Class II immunogenicity:** `Omnii` 0.778 vs. ImmuScope-IM 0.753 [^8] and TLimmuno2 0.613 [^9]

macro-allele AUROC · 0.50 = within-allele prior

Omnii

task-specific tool

binding affinity†

Class I presentation

eluted ligand · 13,480 pos / 67,386 neg · single test fold

<svg viewBox="0 0 362 106" preserveAspectRatio="xMidYMid meet" role="img" aria-label="Class I presentation: Omnii 0.939, BigMHC-EL 0.933, NetMHCpan-4.1-BA 0.904"><defs><pattern id="mhc-auroc-hatch-0" width="4" height="4" patternUnits="userSpaceOnUse" patternTransform="rotate(45)"><rect width="4" height="4" fill="#EDEDED"></rect><line x1="0" y1="0" x2="0" y2="4" stroke="#B8B8B8" stroke-width="1.6"></line></pattern></defs><line x1="130" y1="8" x2="130" y2="84" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="171.6" y1="8" x2="171.6" y2="84" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="213.2" y1="8" x2="213.2" y2="84" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="254.8" y1="8" x2="254.8" y2="84" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="296.4" y1="8" x2="296.4" y2="84" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="338" y1="8" x2="338" y2="84" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><g><text x="120" y="22.5" text-anchor="end" font-size="11.5" font-weight="600" fill="#171717">Omnii</text> <rect x="130" y="14" width="182.62399999999997" height="10" fill="#FA6D0F"></rect><text x="319.62399999999997" y="22.5" font-size="11.5" font-weight="600" fill="#171717" style="font-variant-numeric:tabular-nums">0.939</text></g> <g><text x="120" y="48.5" text-anchor="end" font-size="11.5" font-weight="400" fill="#525252">BigMHC-EL</text> <rect x="130" y="40" width="180.12800000000004" height="10" fill="#D4D4D4"></rect><text x="317.12800000000004" y="48.5" font-size="11.5" font-weight="400" fill="#737373" style="font-variant-numeric:tabular-nums">0.933</text></g> <g><text x="120" y="74.5" text-anchor="end" font-size="11.5" font-weight="400" fill="#525252">NetMHCpan-4.1-BA</text> <rect x="130" y="66" width="168.06400000000002" height="10" fill="url(#mhc-auroc-hatch-0)"></rect><text x="305.064" y="74.5" font-size="11.5" font-weight="400" fill="#737373" style="font-variant-numeric:tabular-nums">0.904</text></g> <rect x="0" y="6" width="362" height="26" fill="transparent"></rect><rect x="0" y="32" width="362" height="26" fill="transparent"></rect><rect x="0" y="58" width="362" height="26" fill="transparent"></rect><line x1="130" y1="84" x2="338" y2="84" stroke="#E5E5E5" stroke-width="0.8"></line><text x="130" y="97" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.5</text> <text x="171.6" y="97" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.6</text> <text x="213.2" y="97" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.7</text> <text x="254.8" y="97" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.8</text> <text x="296.4" y="97" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.9</text> <text x="338" y="97" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">1.0</text></svg>

Class I immunogenicity

1,290 pos / 4,701 neg · mean of 3 splits, ±1 SD

<svg viewBox="0 0 362 132" preserveAspectRatio="xMidYMid meet" role="img" aria-label="Class I immunogenicity: Omnii 0.750, NetMHCpan-4.1-BA 0.614, BigMHC-IM 0.558, PRIME2.1 0.514"><defs><pattern id="mhc-auroc-hatch-1" width="4" height="4" patternUnits="userSpaceOnUse" patternTransform="rotate(45)"><rect width="4" height="4" fill="#EDEDED"></rect><line x1="0" y1="0" x2="0" y2="4" stroke="#B8B8B8" stroke-width="1.6"></line></pattern></defs><line x1="130" y1="8" x2="130" y2="110" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="171.6" y1="8" x2="171.6" y2="110" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="213.2" y1="8" x2="213.2" y2="110" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="254.8" y1="8" x2="254.8" y2="110" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="296.4" y1="8" x2="296.4" y2="110" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="338" y1="8" x2="338" y2="110" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><g><text x="120" y="22.5" text-anchor="end" font-size="11.5" font-weight="600" fill="#171717">Omnii</text> <rect x="130" y="14" width="104" height="10" fill="#FA6D0F"></rect><g stroke="#B44C08" stroke-width="1"><line x1="226.096" y1="19" x2="241.904" y2="19"></line><line x1="226.096" y1="16" x2="226.096" y2="22"></line><line x1="241.904" y1="16" x2="241.904" y2="22"></line></g><text x="248.904" y="22.5" font-size="11.5" font-weight="600" fill="#171717" style="font-variant-numeric:tabular-nums">0.750 ± 0.019</text></g> <g><text x="120" y="48.5" text-anchor="end" font-size="11.5" font-weight="400" fill="#525252">NetMHCpan-4.1-BA</text> <rect x="130" y="40" width="47.42399999999998" height="10" fill="url(#mhc-auroc-hatch-1)"></rect><g stroke="#A3A3A3" stroke-width="1"><line x1="170.35199999999998" y1="45" x2="184.496" y2="45"></line><line x1="170.35199999999998" y1="42" x2="170.35199999999998" y2="48"></line><line x1="184.496" y1="42" x2="184.496" y2="48"></line></g><text x="191.496" y="48.5" font-size="11.5" font-weight="400" fill="#737373" style="font-variant-numeric:tabular-nums">0.614 ± 0.017</text></g> <g><text x="120" y="74.5" text-anchor="end" font-size="11.5" font-weight="400" fill="#525252">BigMHC-IM</text> <rect x="130" y="66" width="24.128000000000014" height="10" fill="#D4D4D4"></rect><g stroke="#A3A3A3" stroke-width="1"><line x1="141.232" y1="71" x2="167.02400000000003" y2="71"></line><line x1="141.232" y1="68" x2="141.232" y2="74"></line><line x1="167.02400000000003" y1="68" x2="167.02400000000003" y2="74"></line></g><text x="174.02400000000003" y="74.5" font-size="11.5" font-weight="400" fill="#737373" style="font-variant-numeric:tabular-nums">0.558 ± 0.031</text></g> <g><text x="120" y="100.5" text-anchor="end" font-size="11.5" font-weight="400" fill="#525252">PRIME2.1</text> <rect x="130" y="92" width="5.824000000000012" height="10" fill="#D4D4D4"></rect><g stroke="#A3A3A3" stroke-width="1"><line x1="130" y1="97" x2="147.888" y2="97"></line><line x1="130" y1="94" x2="130" y2="100"></line><line x1="147.888" y1="94" x2="147.888" y2="100"></line></g><text x="154.888" y="100.5" font-size="11.5" font-weight="400" fill="#737373" style="font-variant-numeric:tabular-nums">0.514 ± 0.029</text></g> <rect x="0" y="6" width="362" height="26" fill="transparent"></rect><rect x="0" y="32" width="362" height="26" fill="transparent"></rect><rect x="0" y="58" width="362" height="26" fill="transparent"></rect><rect x="0" y="84" width="362" height="26" fill="transparent"></rect><line x1="130" y1="110" x2="338" y2="110" stroke="#E5E5E5" stroke-width="0.8"></line><text x="130" y="123" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.5</text> <text x="171.6" y="123" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.6</text> <text x="213.2" y="123" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.7</text> <text x="254.8" y="123" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.8</text> <text x="296.4" y="123" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.9</text> <text x="338" y="123" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">1.0</text></svg>

Class II presentation

eluted ligand · 12,968 pos / 88,512 neg · single test fold

<svg viewBox="0 0 362 106" preserveAspectRatio="xMidYMid meet" role="img" aria-label="Class II presentation: Omnii 0.945, NetMHCIIpan-4.3-EL 0.935, NetMHCIIpan-4.3-BA 0.834"><defs><pattern id="mhc-auroc-hatch-2" width="4" height="4" patternUnits="userSpaceOnUse" patternTransform="rotate(45)"><rect width="4" height="4" fill="#EDEDED"></rect><line x1="0" y1="0" x2="0" y2="4" stroke="#B8B8B8" stroke-width="1.6"></line></pattern></defs><line x1="130" y1="8" x2="130" y2="84" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="171.6" y1="8" x2="171.6" y2="84" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="213.2" y1="8" x2="213.2" y2="84" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="254.8" y1="8" x2="254.8" y2="84" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="296.4" y1="8" x2="296.4" y2="84" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="338" y1="8" x2="338" y2="84" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><g><text x="120" y="22.5" text-anchor="end" font-size="11.5" font-weight="600" fill="#171717">Omnii</text> <rect x="130" y="14" width="185.12" height="10" fill="#FA6D0F"></rect><text x="322.12" y="22.5" font-size="11.5" font-weight="600" fill="#171717" style="font-variant-numeric:tabular-nums">0.945</text></g> <g><text x="120" y="48.5" text-anchor="end" font-size="11.5" font-weight="400" fill="#525252">NetMHCIIpan-4.3-EL</text> <rect x="130" y="40" width="180.96000000000004" height="10" fill="#D4D4D4"></rect><text x="317.96000000000004" y="48.5" font-size="11.5" font-weight="400" fill="#737373" style="font-variant-numeric:tabular-nums">0.935</text></g> <g><text x="120" y="74.5" text-anchor="end" font-size="11.5" font-weight="400" fill="#525252">NetMHCIIpan-4.3-BA</text> <rect x="130" y="66" width="138.94399999999996" height="10" fill="url(#mhc-auroc-hatch-2)"></rect><text x="275.94399999999996" y="74.5" font-size="11.5" font-weight="400" fill="#737373" style="font-variant-numeric:tabular-nums">0.834</text></g> <rect x="0" y="6" width="362" height="26" fill="transparent"></rect><rect x="0" y="32" width="362" height="26" fill="transparent"></rect><rect x="0" y="58" width="362" height="26" fill="transparent"></rect><line x1="130" y1="84" x2="338" y2="84" stroke="#E5E5E5" stroke-width="0.8"></line><text x="130" y="97" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.5</text> <text x="171.6" y="97" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.6</text> <text x="213.2" y="97" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.7</text> <text x="254.8" y="97" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.8</text> <text x="296.4" y="97" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.9</text> <text x="338" y="97" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">1.0</text></svg>

Class II immunogenicity

511 pos / 4,567 neg · mean of 3 splits, ±1 SD

<svg viewBox="0 0 362 132" preserveAspectRatio="xMidYMid meet" role="img" aria-label="Class II immunogenicity: Omnii 0.778, ImmuScope-IM 0.753, NetMHCIIpan-4.3-BA 0.696, TLimmuno2 0.613"><defs><pattern id="mhc-auroc-hatch-3" width="4" height="4" patternUnits="userSpaceOnUse" patternTransform="rotate(45)"><rect width="4" height="4" fill="#EDEDED"></rect><line x1="0" y1="0" x2="0" y2="4" stroke="#B8B8B8" stroke-width="1.6"></line></pattern></defs><line x1="130" y1="8" x2="130" y2="110" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="171.6" y1="8" x2="171.6" y2="110" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="213.2" y1="8" x2="213.2" y2="110" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="254.8" y1="8" x2="254.8" y2="110" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="296.4" y1="8" x2="296.4" y2="110" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><line x1="338" y1="8" x2="338" y2="110" stroke="#E5E5E5" stroke-width="0.7" stroke-dasharray="2 3"></line><g><text x="120" y="22.5" text-anchor="end" font-size="11.5" font-weight="600" fill="#171717">Omnii</text> <rect x="130" y="14" width="115.64800000000002" height="10" fill="#FA6D0F"></rect><g stroke="#B44C08" stroke-width="1"><line x1="241.072" y1="19" x2="250.22400000000002" y2="19"></line><line x1="241.072" y1="16" x2="241.072" y2="22"></line><line x1="250.22400000000002" y1="16" x2="250.22400000000002" y2="22"></line></g><text x="257.22400000000005" y="22.5" font-size="11.5" font-weight="600" fill="#171717" style="font-variant-numeric:tabular-nums">0.778 ± 0.011</text></g> <g><text x="120" y="48.5" text-anchor="end" font-size="11.5" font-weight="400" fill="#525252">ImmuScope-IM</text> <rect x="130" y="40" width="105.24799999999999" height="10" fill="#D4D4D4"></rect><g stroke="#A3A3A3" stroke-width="1"><line x1="229.42399999999998" y1="45" x2="241.072" y2="45"></line><line x1="229.42399999999998" y1="42" x2="229.42399999999998" y2="48"></line><line x1="241.072" y1="42" x2="241.072" y2="48"></line></g><text x="248.072" y="48.5" font-size="11.5" font-weight="400" fill="#737373" style="font-variant-numeric:tabular-nums">0.753 ± 0.014</text></g> <g><text x="120" y="74.5" text-anchor="end" font-size="11.5" font-weight="400" fill="#525252">NetMHCIIpan-4.3-BA</text> <rect x="130" y="66" width="81.53599999999997" height="10" fill="url(#mhc-auroc-hatch-3)"></rect><g stroke="#A3A3A3" stroke-width="1"><line x1="206.95999999999998" y1="71" x2="216.11199999999997" y2="71"></line><line x1="206.95999999999998" y1="68" x2="206.95999999999998" y2="74"></line><line x1="216.11199999999997" y1="68" x2="216.11199999999997" y2="74"></line></g><text x="223.11199999999997" y="74.5" font-size="11.5" font-weight="400" fill="#737373" style="font-variant-numeric:tabular-nums">0.696 ± 0.011</text></g> <g><text x="120" y="100.5" text-anchor="end" font-size="11.5" font-weight="400" fill="#525252">TLimmuno2</text> <rect x="130" y="92" width="47.00799999999998" height="10" fill="#D4D4D4"></rect><g stroke="#A3A3A3" stroke-width="1"><line x1="175.76" y1="97" x2="178.256" y2="97"></line><line x1="175.76" y1="94" x2="175.76" y2="100"></line><line x1="178.256" y1="94" x2="178.256" y2="100"></line></g><text x="185.256" y="100.5" font-size="11.5" font-weight="400" fill="#737373" style="font-variant-numeric:tabular-nums">0.613 ± 0.003</text></g> <rect x="0" y="6" width="362" height="26" fill="transparent"></rect><rect x="0" y="32" width="362" height="26" fill="transparent"></rect><rect x="0" y="58" width="362" height="26" fill="transparent"></rect><rect x="0" y="84" width="362" height="26" fill="transparent"></rect><line x1="130" y1="110" x2="338" y2="110" stroke="#E5E5E5" stroke-width="0.8"></line><text x="130" y="123" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.5</text> <text x="171.6" y="123" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.6</text> <text x="213.2" y="123" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.7</text> <text x="254.8" y="123" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.8</text> <text x="296.4" y="123" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">0.9</text> <text x="338" y="123" text-anchor="middle" font-size="10.5" fill="#A3A3A3" style="font-variant-numeric:tabular-nums">1.0</text></svg>

Figure 5. Omnii matches specialized tools at presentation and leads them on immunogenicity, by a wide margin for class I. Each panel compares Omnii with the tools built for that task across four problems: whether an MHC molecule will display a peptide (presentation) and whether a T cell will then respond to it (immunogenicity), each for MHC class I and class II. Bars show AUROC, where 1.0 means every immunogenic peptide is ranked above every non-immunogenic one and 0.5 is chance. AUROC is computed for each MHC allele separately and then averaged; whiskers on the immunogenicity panels show one standard deviation across three splits.

Predicting what appears on a cancer cell is useful. But ultimately, a vaccine succeeds only if the immune system acts on what it sees. That second problem is where `Omnii` showed its largest advantage.

What's exciting about these results is that a general pretrained model, never trained specifically for cancer vaccine design, appears to have already learned biological features that can be surfaced through post-training to achieve state-of-the-art performance.

These results should also be interpreted carefully. Public immunogenicity datasets [^10] remain relatively small and heterogeneous. Different experiments measure immune responses differently, and some MHC types have substantially more data than others. We therefore evaluate performance separately across MHC alleles before averaging the results. Most importantly, a benchmark does not represent a patient. Strong predictive performance is encouraging, but the more important test is whether better predictions produce better vaccines and, eventually, better outcomes for patients.

## Ranking the best candidates

When designing a cancer vaccine, we don't need `Omnii` to be right about every peptide, we need it to be very right about the best ones. A tumor might give us hundreds of possible neoantigens, while an actual vaccine may contain only a few dozen. Imagine receiving 500 possible wanted posters but being allowed to hand the immune system only 10. You care much more about whether the best targets are ranked 1, 2, 3, 4 and 5 than you do about which candidate was ranked 437.

That is why we evaluated how precisely the models identify immunogenic peptides when allowed to select only the top 5, 10, or 20 candidates. `Omnii` 's advantage was strongest when the number of available slots was smallest, the regime most similar to actually designing a vaccine.

Class I immunogenicity

24–27 alleles per seed · mean of 3 seeds, ±1 SD

Omnii

BigMHC-IM

NetMHCpan-4.1-BA†

PRIME2.1

<svg viewBox="24 26 362 232" preserveAspectRatio="xMidYMid meet" role="img" aria-label="Class I immunogenicity: precision at k = 5, 10 and 20 for Omnii, BigMHC-IM, NetMHCpan-4.1-BA, PRIME2.1; base rate 0.237"><g><text x="62" y="190.10000000000002" text-anchor="end" font-size="11" fill="#525252" style="font-variant-numeric:tabular-nums">0.1</text></g> <g><text x="62" y="160.4" text-anchor="end" font-size="11" fill="#525252" style="font-variant-numeric:tabular-nums">0.2</text></g> <g><text x="62" y="130.8" text-anchor="end" font-size="11" fill="#525252" style="font-variant-numeric:tabular-nums">0.3</text></g> <g><text x="62" y="101.1" text-anchor="end" font-size="11" fill="#525252" style="font-variant-numeric:tabular-nums">0.4</text></g> <g><text x="62" y="71.39999999999999" text-anchor="end" font-size="11" fill="#525252" style="font-variant-numeric:tabular-nums">0.5</text></g> <g><text x="62" y="41.699999999999996" text-anchor="end" font-size="11" fill="#525252" style="font-variant-numeric:tabular-nums">0.6</text></g> <rect x="68" y="141.6" width="298" height="8.3" fill="#171717" opacity="0.08"></rect><line x1="68" y1="145.7" x2="366" y2="145.7" stroke="#171717" stroke-width="1.3"></line><text x="362" y="159.7" text-anchor="end" font-size="11" fill="#171717" stroke="#fff" stroke-width="3" paint-order="stroke" style="font-variant-numeric:tabular-nums"><tspan font-weight="600">base rate</tspan> <tspan fill="#525252">0.237</tspan></text> <g><polyline points="68,59.9 217,73.9 366,93.3" fill="none" stroke="#FA6D0F" stroke-width="2" stroke-linejoin="round" stroke-linecap="round"></polyline><g stroke="#FA6D0F" stroke-width="1.4"><line x1="68" y1="70" x2="68" y2="49.8"></line><line x1="65.5" y1="49.8" x2="70.5" y2="49.8"></line><line x1="65.5" y1="70" x2="70.5" y2="70"></line></g><g stroke="#FA6D0F" stroke-width="1.4"><line x1="217" y1="82.7" x2="217" y2="65"></line><line x1="214.5" y1="65" x2="219.5" y2="65"></line><line x1="214.5" y1="82.7" x2="219.5" y2="82.7"></line></g><g stroke="#FA6D0F" stroke-width="1.4"><line x1="366" y1="96.2" x2="366" y2="90.5"></line><line x1="363.5" y1="90.5" x2="368.5" y2="90.5"></line><line x1="363.5" y1="96.2" x2="368.5" y2="96.2"></line></g><circle cx="68" cy="59.9" r="3.8" style="transition:r 100ms" fill="#FA6D0F" stroke="#fff" stroke-width="0.8"></circle><circle cx="217" cy="73.9" r="3.8" style="transition:r 100ms" fill="#FA6D0F" stroke="#fff" stroke-width="0.8"></circle><circle cx="366" cy="93.3" r="3.8" style="transition:r 100ms" fill="#FA6D0F" stroke="#fff" stroke-width="0.8"></circle></g><g><polyline points="68,119.8 217,127.4 366,131.2" fill="none" stroke="#A3A3A3" stroke-width="1.2" stroke-linejoin="round" stroke-linecap="round"></polyline><g stroke="#A3A3A3" stroke-width="1"><line x1="68" y1="127.8" x2="68" y2="111.8"></line><line x1="65.5" y1="111.8" x2="70.5" y2="111.8"></line><line x1="65.5" y1="127.8" x2="70.5" y2="127.8"></line></g><g stroke="#A3A3A3" stroke-width="1"><line x1="217" y1="135" x2="217" y2="119.8"></line><line x1="214.5" y1="119.8" x2="219.5" y2="119.8"></line><line x1="214.5" y1="135" x2="219.5" y2="135"></line></g><g stroke="#A3A3A3" stroke-width="1"><line x1="366" y1="134.8" x2="366" y2="127.5"></line><line x1="363.5" y1="127.5" x2="368.5" y2="127.5"></line><line x1="363.5" y1="134.8" x2="368.5" y2="134.8"></line></g><circle cx="68" cy="119.8" r="3" style="transition:r 100ms" fill="#A3A3A3" stroke="#fff" stroke-width="0.8"></circle><circle cx="217" cy="127.4" r="3" style="transition:r 100ms" fill="#A3A3A3" stroke="#fff" stroke-width="0.8"></circle><circle cx="366" cy="131.2" r="3" style="transition:r 100ms" fill="#A3A3A3" stroke="#fff" stroke-width="0.8"></circle></g><g><polyline points="68,122.2 217,125.8 366,129" fill="none" stroke="#737373" stroke-width="1.2" stroke-dasharray="1.5 2.5" stroke-linejoin="round" stroke-linecap="round"></polyline><g stroke="#737373" stroke-width="1"><line x1="68" y1="129" x2="68" y2="115.4"></line><line x1="65.5" y1="115.4" x2="70.5" y2="115.4"></line><line x1="65.5" y1="129" x2="70.5" y2="129"></line></g><g stroke="#737373" stroke-width="1"><line x1="217" y1="135.8" x2="217" y2="115.7"></line><line x1="214.5" y1="115.7" x2="219.5" y2="115.7"></line><line x1="214.5" y1="135.8" x2="219.5" y2="135.8"></line></g><g stroke="#737373" stroke-width="1"><line x1="366" y1="130.8" x2="366" y2="127.2"></line><line x1="363.5" y1="127.2" x2="368.5" y2="127.2"></line><line x1="363.5" y1="130.8" x2="368.5" y2="130.8"></line></g><circle cx="68" cy="122.2" r="3" style="transition:r 100ms" fill="#737373" stroke="#fff" stroke-width="0.8"></circle><circle cx="217" cy="125.8" r="3" style="transition:r 100ms" fill="#737373" stroke="#fff" stroke-width="0.8"></circle><circle cx="366" cy="129" r="3" style="transition:r 100ms" fill="#737373" stroke="#fff" stroke-width="0.8"></circle></g><g><polyline points="68,130.6 217,133.4 366,133.2" fill="none" stroke="#D4D4D4" stroke-width="1.2" stroke-dasharray="5 3" stroke-linejoin="round" stroke-linecap="round"></polyline><g stroke="#D4D4D4" stroke-width="1"><line x1="68" y1="134.5" x2="68" y2="126.8"></line><line x1="65.5" y1="126.8" x2="70.5" y2="126.8"></line><line x1="65.5" y1="134.5" x2="70.5" y2="134.5"></line></g><g stroke="#D4D4D4" stroke-width="1"><line x1="217" y1="136.7" x2="217" y2="130.1"></line><line x1="214.5" y1="130.1" x2="219.5" y2="130.1"></line><line x1="214.5" y1="136.7" x2="219.5" y2="136.7"></line></g><g stroke="#D4D4D4" stroke-width="1"><line x1="366" y1="138.2" x2="366" y2="128.3"></line><line x1="363.5" y1="128.3" x2="368.5" y2="128.3"></line><line x1="363.5" y1="138.2" x2="368.5" y2="138.2"></line></g><circle cx="68" cy="130.6" r="3" style="transition:r 100ms" fill="#D4D4D4" stroke="#fff" stroke-width="0.8"></circle><circle cx="217" cy="133.4" r="3" style="transition:r 100ms" fill="#D4D4D4" stroke="#fff" stroke-width="0.8"></circle><circle cx="366" cy="133.2" r="3" style="transition:r 100ms" fill="#D4D4D4" stroke="#fff" stroke-width="0.8"></circle></g><line x1="68" y1="216" x2="366" y2="216" stroke="#A3A3A3" stroke-width="0.8"></line><line x1="68" y1="32" x2="68" y2="216" stroke="#A3A3A3" stroke-width="0.8"></line><g><line x1="68" y1="216" x2="68" y2="220" stroke="#A3A3A3" stroke-width="0.8"></line><text x="68" y="232" text-anchor="middle" font-size="11" fill="#525252" style="font-variant-numeric:tabular-nums">k = 5</text></g> <g><line x1="217" y1="216" x2="217" y2="220" stroke="#A3A3A3" stroke-width="0.8"></line><text x="217" y="232" text-anchor="middle" font-size="11" fill="#525252" style="font-variant-numeric:tabular-nums">k = 10</text></g> <g><line x1="366" y1="216" x2="366" y2="220" stroke="#A3A3A3" stroke-width="0.8"></line><text x="366" y="232" text-anchor="middle" font-size="11" fill="#525252" style="font-variant-numeric:tabular-nums">k = 20</text></g> <text x="217" y="250" text-anchor="middle" font-size="11.5" font-weight="500" fill="#525252">peptides included in vaccine</text> <text transform="translate(38 124) rotate(-90)" text-anchor="middle" font-size="11.5" font-weight="500" fill="#525252">precision at k, macro over alleles</text><rect x="68" y="32" width="74.5" height="184" fill="transparent"></rect><rect x="142.5" y="32" width="149" height="184" fill="transparent"></rect><rect x="291.5" y="32" width="74.5" height="184" fill="transparent"></rect></svg>

Class II immunogenicity

28–31 alleles per seed · mean of 3 seeds, ±1 SD

Omnii

ImmuScope-IM

NetMHCIIpan-4.3-BA†

TLimmuno2

<svg viewBox="24 26 362 232" preserveAspectRatio="xMidYMid meet" role="img" aria-label="Class II immunogenicity: precision at k = 5, 10 and 20 for Omnii, ImmuScope-IM, NetMHCIIpan-4.3-BA, TLimmuno2; base rate 0.108"><g><text x="62" y="190.10000000000002" text-anchor="end" font-size="11" fill="#525252" style="font-variant-numeric:tabular-nums">0.1</text></g> <g><text x="62" y="160.4" text-anchor="end" font-size="11" fill="#525252" style="font-variant-numeric:tabular-nums">0.2</text></g> <g><text x="62" y="130.8" text-anchor="end" font-size="11" fill="#525252" style="font-variant-numeric:tabular-nums">0.3</text></g> <g><text x="62" y="101.1" text-anchor="end" font-size="11" fill="#525252" style="font-variant-numeric:tabular-nums">0.4</text></g> <g><text x="62" y="71.39999999999999" text-anchor="end" font-size="11" fill="#525252" style="font-variant-numeric:tabular-nums">0.5</text></g> <g><text x="62" y="41.699999999999996" text-anchor="end" font-size="11" fill="#525252" style="font-variant-numeric:tabular-nums">0.6</text></g> <rect x="68" y="182.3" width="298" height="3.4" fill="#171717" opacity="0.08"></rect><line x1="68" y1="184" x2="366" y2="184" stroke="#171717" stroke-width="1.3"></line><text x="362" y="198" text-anchor="end" font-size="11" fill="#171717" stroke="#fff" stroke-width="3" paint-order="stroke" style="font-variant-numeric:tabular-nums"><tspan font-weight="600">base rate</tspan> <tspan fill="#525252">0.108</tspan></text> <g><polyline points="68,73.8 217,98.4 366,129.3" fill="none" stroke="#FA6D0F" stroke-width="2" stroke-linejoin="round" stroke-linecap="round"></polyline><g stroke="#FA6D0F" stroke-width="1.4"><line x1="68" y1="81.8" x2="68" y2="65.8"></line><line x1="65.5" y1="65.8" x2="70.5" y2="65.8"></line><line x1="65.5" y1="81.8" x2="70.5" y2="81.8"></line></g><g stroke="#FA6D0F" stroke-width="1.4"><line x1="217" y1="104" x2="217" y2="92.8"></line><line x1="214.5" y1="92.8" x2="219.5" y2="92.8"></line><line x1="214.5" y1="104" x2="219.5" y2="104"></line></g><g stroke="#FA6D0F" stroke-width="1.4"><line x1="366" y1="136.1" x2="366" y2="122.4"></line><line x1="363.5" y1="122.4" x2="368.5" y2="122.4"></line><line x1="363.5" y1="136.1" x2="368.5" y2="136.1"></line></g><circle cx="68" cy="73.8" r="3.8" style="transition:r 100ms" fill="#FA6D0F" stroke="#fff" stroke-width="0.8"></circle><circle cx="217" cy="98.4" r="3.8" style="transition:r 100ms" fill="#FA6D0F" stroke="#fff" stroke-width="0.8"></circle><circle cx="366" cy="129.3" r="3.8" style="transition:r 100ms" fill="#FA6D0F" stroke="#fff" stroke-width="0.8"></circle></g><g><polyline points="68,89.2 217,106.3 366,130.8" fill="none" stroke="#A3A3A3" stroke-width="1.2" stroke-linejoin="round" stroke-linecap="round"></polyline><g stroke="#A3A3A3" stroke-width="1"><line x1="68" y1="91.3" x2="68" y2="87.1"></line><line x1="65.5" y1="87.1" x2="70.5" y2="87.1"></line><line x1="65.5" y1="91.3" x2="70.5" y2="91.3"></line></g><g stroke="#A3A3A3" stroke-width="1"><line x1="217" y1="106.8" x2="217" y2="105.7"></line><line x1="214.5" y1="105.7" x2="219.5" y2="105.7"></line><line x1="214.5" y1="106.8" x2="219.5" y2="106.8"></line></g><g stroke="#A3A3A3" stroke-width="1"><line x1="366" y1="132.7" x2="366" y2="128.9"></line><line x1="363.5" y1="128.9" x2="368.5" y2="128.9"></line><line x1="363.5" y1="132.7" x2="368.5" y2="132.7"></line></g><circle cx="68" cy="89.2" r="3" style="transition:r 100ms" fill="#A3A3A3" stroke="#fff" stroke-width="0.8"></circle><circle cx="217" cy="106.3" r="3" style="transition:r 100ms" fill="#A3A3A3" stroke="#fff" stroke-width="0.8"></circle><circle cx="366" cy="130.8" r="3" style="transition:r 100ms" fill="#A3A3A3" stroke="#fff" stroke-width="0.8"></circle></g><g><polyline points="68,116 217,122.8 366,139.7" fill="none" stroke="#737373" stroke-width="1.2" stroke-dasharray="1.5 2.5" stroke-linejoin="round" stroke-linecap="round"></polyline><g stroke="#737373" stroke-width="1"><line x1="68" y1="127.5" x2="68" y2="104.4"></line><line x1="65.5" y1="104.4" x2="70.5" y2="104.4"></line><line x1="65.5" y1="127.5" x2="70.5" y2="127.5"></line></g><g stroke="#737373" stroke-width="1"><line x1="217" y1="129.3" x2="217" y2="116.3"></line><line x1="214.5" y1="116.3" x2="219.5" y2="116.3"></line><line x1="214.5" y1="129.3" x2="219.5" y2="129.3"></line></g><g stroke="#737373" stroke-width="1"><line x1="366" y1="146.5" x2="366" y2="132.9"></line><line x1="363.5" y1="132.9" x2="368.5" y2="132.9"></line><line x1="363.5" y1="146.5" x2="368.5" y2="146.5"></line></g><circle cx="68" cy="116" r="3" style="transition:r 100ms" fill="#737373" stroke="#fff" stroke-width="0.8"></circle><circle cx="217" cy="122.8" r="3" style="transition:r 100ms" fill="#737373" stroke="#fff" stroke-width="0.8"></circle><circle cx="366" cy="139.7" r="3" style="transition:r 100ms" fill="#737373" stroke="#fff" stroke-width="0.8"></circle></g><g><polyline points="68,169.8 217,173.2 366,171" fill="none" stroke="#D4D4D4" stroke-width="1.2" stroke-dasharray="5 3" stroke-linejoin="round" stroke-linecap="round"></polyline><g stroke="#D4D4D4" stroke-width="1"><line x1="68" y1="176.2" x2="68" y2="163.3"></line><line x1="65.5" y1="163.3" x2="70.5" y2="163.3"></line><line x1="65.5" y1="176.2" x2="70.5" y2="176.2"></line></g><g stroke="#D4D4D4" stroke-width="1"><line x1="217" y1="179.8" x2="217" y2="166.5"></line><line x1="214.5" y1="166.5" x2="219.5" y2="166.5"></line><line x1="214.5" y1="179.8" x2="219.5" y2="179.8"></line></g><g stroke="#D4D4D4" stroke-width="1"><line x1="366" y1="175.3" x2="366" y2="166.7"></line><line x1="363.5" y1="166.7" x2="368.5" y2="166.7"></line><line x1="363.5" y1="175.3" x2="368.5" y2="175.3"></line></g><circle cx="68" cy="169.8" r="3" style="transition:r 100ms" fill="#D4D4D4" stroke="#fff" stroke-width="0.8"></circle><circle cx="217" cy="173.2" r="3" style="transition:r 100ms" fill="#D4D4D4" stroke="#fff" stroke-width="0.8"></circle><circle cx="366" cy="171" r="3" style="transition:r 100ms" fill="#D4D4D4" stroke="#fff" stroke-width="0.8"></circle></g><line x1="68" y1="216" x2="366" y2="216" stroke="#A3A3A3" stroke-width="0.8"></line><line x1="68" y1="32" x2="68" y2="216" stroke="#A3A3A3" stroke-width="0.8"></line><g><line x1="68" y1="216" x2="68" y2="220" stroke="#A3A3A3" stroke-width="0.8"></line><text x="68" y="232" text-anchor="middle" font-size="11" fill="#525252" style="font-variant-numeric:tabular-nums">k = 5</text></g> <g><line x1="217" y1="216" x2="217" y2="220" stroke="#A3A3A3" stroke-width="0.8"></line><text x="217" y="232" text-anchor="middle" font-size="11" fill="#525252" style="font-variant-numeric:tabular-nums">k = 10</text></g> <g><line x1="366" y1="216" x2="366" y2="220" stroke="#A3A3A3" stroke-width="0.8"></line><text x="366" y="232" text-anchor="middle" font-size="11" fill="#525252" style="font-variant-numeric:tabular-nums">k = 20</text></g> <text x="217" y="250" text-anchor="middle" font-size="11.5" font-weight="500" fill="#525252">peptides included in vaccine</text> <text transform="translate(38 124) rotate(-90)" text-anchor="middle" font-size="11.5" font-weight="500" fill="#525252">precision at k, macro over alleles</text><rect x="68" y="32" width="74.5" height="184" fill="transparent"></rect><rect x="142.5" y="32" width="149" height="184" fill="transparent"></rect><rect x="291.5" y="32" width="74.5" height="184" fill="transparent"></rect></svg>

Figure 6. When only a handful of peptides can go into a vaccine, Omnii picks better ones. Each panel shows the fraction of selected peptides that are genuinely immunogenic (precision) when a model may pick only its top 5, 10 or 20 candidates for each MHC allele. The horizontal line is the base rate, the precision expected from picking at random. Omnii's lead is largest at k = 5, the budget closest to a real vaccine, and narrows as more slots open up. Values are averaged across alleles and over three splits, with whiskers showing one standard deviation.

### What could that mean for an actual vaccine?

We can make this more tangible. Suppose a patient's tumor gives us 100 plausible neoantigen candidates, but the vaccine has room for only five. And suppose only around 6% of those candidates are truly immunogenic, a rate consistent with what has been observed in experimental neoantigen studies [^11]. Which five should we choose?

In our simulation:

- **`Omnii`:** 1.3 of the 5 selected peptides would be expected to be immunogenic
- **BigMHC-IM:** 0.7
- **NetMHCpan-4.1-BA:** 0.6
- **PRIME2.1:** 0.6
- **Random selection:** 0.3

That may sound like a difference of less than one peptide, but that could be the difference between a vaccine that succeeds at teaching the immune system to recognize the tumor, and one that fails. When you only get a handful of shots on goal, choosing the right ones matters enormously.

Number of peptides included in vaccine51020

Available neoantigen candidates406080100

6.0%

Omnii

1.3/5

BigMHC-IM

0.7/5

NetMHCpan-4.1-BA†

0.6/5

PRIME2.1

0.6/5

Random

0.3/5

Max available

5.0/5

Figure 7. Better ranking turns the same candidate pool into more effective vaccine targets. Set how many candidate neoantigens the tumor provides and what fraction of them are genuinely immunogenic, both properties of the tumor that differ from patient to patient, along with how many peptides the cassette has room for; the chart then shows how many immunogenic peptides each model would be expected to select. Selections are simulated by resampling the held-out test peptides to each assumed rate. Because a cassette holds only a handful of peptides, a small gain in ranking accuracy shows up directly as more real targets. In all cases, Omnii is expected to place similar or more immunogenic neoantigens in the vaccine than the alternatives.

## Putting it all together, from a tumor sequence to an mRNA vaccine

At Radical, we love models, but our primary motivation is impact. So we built an end-to-end pipeline around `Omnii` to go from patient tumor sequence, to mRNA vaccine. It's state-of-the-art on public data, but this is a setting where post-training data will likely matter for the real world. We invite cancer vaccine researchers to reach out to use `Omnii` in their own pipeline and to [sign up for early access](https://www.radicalnumerics.ai/waitlist?track=health&utm_campaign=omnii-cancer-vaccine).

It starts with two pieces of information unique to each patient:

- the mutations found in their tumor; and
- their particular set of MHC molecules.

It ends with an optimized mRNA cassette containing the neoantigens selected for their vaccine.

input

tumor variant  
sequences

input

patient MHC  
allele sequences

stage 01

Omnii neoantigen  
prioritization

intermediate

selected  
neoantigens

stage 02

Omnii mRNA  
sequence design

output

optimized  
mRNA sequence

Hover or click a stage for an explanation.

Figure 8. In our end-to-end pipeline, Omnii uses a patient's MHC allele sequences and tumor variants to rank and select the set of neoantigens most likely to stimulate an immune response, and then designs an optimized mRNA sequence to encode them.

We can also use `Omnii` for codon optimization of the cassette design itself, which was surprising. That's pretty neat, and deserves a blog on its own at some point.

Overall, what's especially exciting is that a general biological model like `Omnii` can outperform custom, task-specific models. We see these results and emergent capabilities as merely the beginning.

Figure 9. From a patient's tumor to a personalized cancer vaccine. We built an end-to-end pipeline, which takes as input the patient's tumor DNA and immune-system type. Omnii focuses on the hardest part in the middle: predicting which mutated fragments will actually appear on the tumor's surface, which ones T cells are likely to attack, and which combination makes the strongest vaccine. The system then turns those selected targets into a complete, manufacturable mRNA vaccine sequence, taking us from tumor sequence in to patient-specific vaccine design out.

## Cancer vaccines require a whole-system design

Today, we can break cancer-vaccine design into neat boxes: identify mutations, predict presentation, predict immunogenicity, rank targets, design RNA. But biology is not actually divided that way. Whether a target makes a good vaccine candidate may depend on all kinds of information at once:

- Is the mutation really present throughout the tumor?
- Is the gene highly expressed?
- What protein does it alter?
- Will the resulting peptide bind this patient's MHC?
- What does that peptide–MHC complex look like in three dimensions?
- Is the peptide sufficiently different from healthy tissue?
- Will a T cell recognize it?
- Does our set of targets cover multiple populations of cells inside the tumor?
- Can all of those targets be encoded into an mRNA molecule that expresses reliably?

The optimal answer may not be the peptide with the highest score on any one test. It may be the one that performs best across a combination of them, giving the immune system the most robust possible picture of the cancer.

This is why we're building a general biological model rather than a collection of disconnected predictors. Cancer vaccine design is inherently multimodal: DNA tells us what changed, RNA and epigenomics tell us what is active, protein sequence tells us what molecule is produced, structure tells us how those molecules may physically interact, and immune data tells us what the body actually responds to.

`Omnii` was built to bring those signals into the same model. It is trained across DNA, RNA, proteins, epigenomics, and protein structure, allowing information learned in one representation of biology to inform another.

Learning more about DNA should help us reason about proteins, learning more about proteins should help us reason about immune recognition, and learning whether a vaccine target actually worked should make the next design better. This has to go far beyond natural language only, and learn directly from the underlying raw biological data itself, an area where we're already pushing the boundaries.

Cancer vaccines are therefore an unusually direct test of whether an AI model can take what it has learned about biology and use that knowledge (via post-training) to design a medicine for one particular human being.

## Join the next frontier of AI

Personalized cancer vaccines are just getting started. We now know the basic idea can work, but almost every part of the algorithm can still get better: predicting what tumors display, predicting what T cells recognize, incorporating expression and tumor heterogeneity, choosing combinations of targets, and learning directly from experimental and clinical outcomes.

For AI researchers, this is an extraordinary problem. The input is the biological code of an individual patient, the output is a medicine designed specifically for them, and better algorithms mean better medicines.

If you are an AI researcher or research engineer who wants to build on the frontier of grand challenges like this, [we're hiring](https://www.radicalnumerics.ai/join-us).

If you have unique immunology data, experimental systems, or the ability to validate personalized cancer vaccines, we're excited to collaborate and leverage `Omnii` to drive the field forward, and ultimately, save lives.

Omnii for cancer vaccine is in early access

We're looking for design partners and collaborators across cancer immunology and vaccine development.

[Sign up for early access](https://www.radicalnumerics.ai/waitlist?track=health&utm_campaign=omnii-cancer-vaccine)

Reach out to us at [health@radicalnumerics.ai](mailto:health@radicalnumerics.ai).

## Citation

```
@misc{omnii_cancer_vaccines_2026,
  title        = {Genome language models can design cancer vaccines},
  author       = {Fields, Alexander and Poli, Michael and Nguyen, Eric},
  year         = {2026},
  month        = {Sep},
  url          = {https://www.radicalnumerics.ai/blog/omnii-cancer-vaccines},
  organization = {Radical Numerics}
}
```

## References

[^1]: Merck and Moderna. ["Phase 3 INTerpath-001 trial of intismeran autogene plus KEYTRUDA met endpoints of recurrence-free survival and distant metastasis-free survival in patients with completely resected stage IIB–IV melanoma."](https://www.merck.com/news/merck-and-moderna-announce-phase-3-interpath-001-trial-of-intismeran-autogene-plus-keytruda-met-endpoints-of-recurrence-free-survival-rfs-and-distant-metastasis-free-survival-dmfs-in-patient/) Press release (19 August 2026).

[^2]: Schumacher, T.N., Schreiber, R.D. ["Neoantigens in cancer immunotherapy."](https://doi.org/10.1126/science.aaa4971) Science 348(6230), 69–74 (2015).

[^3]: Radical Numerics. ["A new frontier in generative genomics with Omnii."](https://www.radicalnumerics.ai/blog/omnii-health-preview) (2026).

[^4]: Vogelstein, B., Papadopoulos, N., Velculescu, V.E., Zhou, S., Diaz, L.A., Kinzler, K.W. ["Cancer genome landscapes."](https://doi.org/10.1126/science.1235122) Science 339(6127), 1546–1558 (2013).

[^5]: Albert, B.A., Yang, Y., Shao, X.M., et al. ["Deep neural networks predict class I major histocompatibility complex epitope presentation and transfer learn neoepitope immunogenicity."](https://doi.org/10.1038/s42256-023-00694-6) Nature Machine Intelligence 5(8), 861–872 (2023).

[^6]: Nilsson, J.B., Kaabinejadian, S., Yari, H., et al. ["Accurate prediction of HLA class II antigen presentation across all loci using tailored data acquisition and refined machine learning."](https://doi.org/10.1126/sciadv.adj6367) Science Advances 9(47), eadj6367 (2023).

[^7]: Gfeller, D., Schmidt, J., Croce, G., et al. ["Improved predictions of antigen presentation and TCR recognition with MixMHCpred2.2 and PRIME2.0 reveal potent SARS-CoV-2 CD8+ T-cell epitopes."](https://doi.org/10.1016/j.cels.2022.12.002) Cell Systems 14(1), 72–83.e5 (2023). Benchmarks use PRIME2.1, the current release.

[^8]: Shen, L.-C., Zhang, Y., Wang, Z., et al. ["Self-iterative multiple-instance learning enables the prediction of CD4+ T cell immunogenic epitopes."](https://doi.org/10.1038/s42256-025-01073-z) Nature Machine Intelligence 7(8), 1250–1265 (2025).

[^9]: Wang, G., Wu, T., Ning, W., et al. ["TLimmuno2: predicting MHC class II antigen immunogenicity through transfer learning."](https://doi.org/10.1093/bib/bbad116) Briefings in Bioinformatics 24(3), bbad116 (2023).

[^10]: Vita, R., Blazeska, N., Marrama, D., et al. ["The Immune Epitope Database (IEDB): 2024 update."](https://doi.org/10.1093/nar/gkae1092) Nucleic Acids Research 53(D1), D436–D443 (2025).

[^11]: Wells, D.K., van Buuren, M.M., Dang, K.K., et al. ["Key parameters of tumor epitope immunogenicity revealed through a consortium approach improve neoantigen prediction."](https://doi.org/10.1016/j.cell.2020.09.015) Cell 183(3), 818–834.e13 (2020).

## Related notes
- [[2025-10-21 pMHC for diagnostics]]
- [[2025-12-16 T-cell reprogramming]]

## Growing ideas
- ✅ [[2026-06-18 biotech-of-one]] — Article states the algorithm 'is part of the medicine' — Omnii designs mRNA sequences end-to-end, concrete proof of closed-loop AI drug design.
- ✅ [[2025-09-02 subroutine-tx]] — Genome language model reading DNA/RNA/protein as sequences directly instantiates the 'biology as code / genomes are executable instructions' thesis.
