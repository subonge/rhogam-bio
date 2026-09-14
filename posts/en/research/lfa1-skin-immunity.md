---
lang: en
title: An Adhesion Protein Missing From Every Leukocyte in the Body — So Why Did Only the Skin Break Down?
date: 2026-08-19
categories:
  - Research
description: A 2026 Science Immunology paper reports people who completely lack LFA-1, a common leukocyte adhesion protein. Their systemic immunity was intact — so why did warts never stop appearing, and only on the skin?
draft: false
image: ../../images/research/lfa1-integrin.png
---
![](../../images/research/lfa1-integrin.png)

What happens when a single protein, broadly expressed across every leukocyte in the body, is simply gone?

The intuitive guess is that things would fall apart everywhere at once. But a paper published in *Science Immunology* in February 2026 tells the opposite story. An adhesion protein present on leukocytes throughout the body was missing entirely — and yet the trouble showed up in exactly one place: the skin.

---

## A disease where the warts never go away

There's a rare genetic disorder called **epidermodysplasia verruciformis (EV)**. In EV, the body can't control β-HPV — a group of HPV types that live harmlessly on most people's skin — so flat warts spread across the body and never clear, for life. Roughly half of patients eventually develop skin cancer in sun-exposed areas as they age.

What's striking is that, aside from the warts and skin cancer, these patients are otherwise generally healthy. They're not unusually susceptible to other infections. In other words, this doesn't look like a global immune system failure — it looks like one narrow function, specifically the control of skin-resident viruses, has gone missing.

Yet for nearly half of EV patients, the causal gene is still unknown. A team sequenced the genomes of 62 EV families from Algeria, Iran, and elsewhere, and among 40 previously unsolved families, found shared variants in the same gene in four of them: **ITGAL**, which encodes integrin αL (CD11a).

---

## LFA-1: the adhesion protein every leukocyte carries

The αL protein made by ITGAL pairs with β2 (CD18) to form the integrin **LFA-1** (lymphocyte function-associated antigen 1) — essentially the "glue" leukocytes use on their surface to grip ICAM proteins on the vessel wall.

LFA-1 isn't the property of any one cell type. T cells, B cells, NK cells, monocytes, dendritic cells — nearly every leukocyte carries it. It was already known to be involved both when T cells exit blood vessels into tissue and when T cells form an "immune synapse" with antigen-presenting cells. In short, it's a versatile, seemingly indispensable protein.

The team confirmed with cell experiments that the patients' αL variants actually break protein function. When the mutant αL was expressed in HEK293T, HeLa, and Jurkat cells, all three variants resulted in LFA-1 failing to appear on the cell surface at all. ICAM-1 binding, cell-cell aggregation, and migration were all completely lost. By contrast, 34 other common αL variants found in the general population mostly had no effect on function — meaning a fully broken LFA-1 is exceedingly rare across the population (roughly 1 in 1.22 million people).

In the patients' actual blood cells, LFA-1 was undetectable as well. This was **the first reported case in humans of a complete, selective LFA-1 deficiency**.

---

## And yet everything else was fine

This is where the paper gets genuinely interesting.

If LFA-1 is as central to immune synapse formation and leukocyte trafficking as the literature suggests, shouldn't someone missing it entirely show a much more severe immunodeficiency? In practice, that's not what happened.

- Leukocyte subsets and their distribution looked essentially normal even under detailed CyTOF and CITE-seq profiling.
- T cell differentiation, TCR repertoire diversity, and cytokine production were all normal.
- Interaction with antigen-presenting cells (allogeneic T cell responses) proceeded normally even without LFA-1.
- Neutrophils had no trouble migrating to sites of inflammation despite lacking LFA-1 entirely — other β2 integrins (Mac-1, αXβ2) simply took over.
- Antibody responses to HPV formed normally too — humoral immunity was intact.

In other words, even without LFA-1, the body had detour routes for almost everything. The one place with no detour was the skin.

---

## There was only one door into the skin

Leukocytes generally rely on two integrin families to move from blood vessels into tissue: the α4 family (VLA-4, α4β7) and the β2 family (LFA-1, Mac-1, αXβ2). When the team examined healthy human leukocytes in detail, they found that most leukocytes carry **at least one** integrin from each family, overlapping. So if one door is blocked, another is available.

There were two exceptions: neutrophils, and **skin-homing memory T cells** (CLA⁺ cells). Both of these populations lack α4-family integrins entirely and depend solely on the β2 family — specifically, on LFA-1. Experimentally, skin-homing T cells bound only to ICAM-1, and did not respond to VCAM-1 or MAdCAM-1, the adhesion molecules used by T cells homing to other tissues.

In patients lacking LFA-1, these skin-homing T cells weren't gone — they were **stuck in the blood.** Cells that should normally circulate between skin and blood had nowhere to go, because the door into the skin simply didn't exist, so they piled up in circulation instead. Indeed, the proportion of skin-homing T cells in patients' blood was four times higher than in controls.

The team confirmed this directly with skin biopsies. Healthy skin contained an average of 524 T cells per mm², while patients' skin had only 103. Calculating the ratio of skin-specific T cells between blood and skin, healthy individuals showed roughly 1:2 (favoring the skin), while patients exceeded 20:1 — cells that should have been in place were instead adrift in the bloodstream.

---

## Why this matters

What this study shows isn't just the narrow fact that "LFA-1 is needed for skin immunity." It points to a more general principle.

**An infection localized to one organ doesn't necessarily mean that organ's own defenses are weak.** These patients' T cells were fine — proliferation, cytokine production, antigen recognition, all normal. The problem was purely a traffic jam: the right cells simply couldn't get to where they were needed. The authors call this a "lacunar" defect in tissue-specific immunity — a problem of cell trafficking, not cell capability.

There's also an interesting clinical thread here. Efalizumab, an anti-LFA-1 antibody drug used to treat psoriasis between 2004 and 2009, caused HPV skin lesions similar to what's seen in these patients — a case where genetic deficiency and pharmacological blockade converged on the same outcome. That drug was eventually pulled from the market, though, because of a far more serious side effect: JC virus encephalitis (PML). The authors suggest this difference may arise because the drug does more than just block LFA-1 binding — it may also deliver an additional inhibitory signal. The fact that a genetic "complete deficiency" and a drug-induced "functional block" don't always produce identical outcomes is itself a useful lesson for drug development.

---

## A researcher's take

This paper is a good showcase of the approach characteristic of the Casanova lab. Rather than studying one or two patients with a rare genetic disease, they gather multiple families with similar symptoms and use naturally occurring "human gene knockouts" to work backward toward what a gene is actually required for. It's a way of generating direct evidence about human immunity that a mouse model simply can't provide.

What I personally found most interesting is that the intuition "a highly expressed protein must be important everywhere" turns out to be wrong here. LFA-1 is present on nearly every leukocyte, yet the one place it turned out to be truly irreplaceable was a single route: T cell trafficking into skin. Everywhere else, some other integrin was standing by as backup.

Knowing how — and on what — immune cells depend to reach each tissue is, in the end, part of the map needed to answer a bigger question: why is this particular organ vulnerable to this particular infection. This paper is a reminder of just how much of that map is still blank.

---

*Yatim A, Youssefian L, Idani A, et al. Human LFA-1 governs T cell immune surveillance of the skin. Sci Immunol. 2026;11(116):eadz8360.*
