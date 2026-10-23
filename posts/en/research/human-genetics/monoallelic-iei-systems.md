---
lang: en
title: Why the Same Genetic Variant Makes One Person Sick and Leaves Another Fine
date: 2026-10-23
categories:
  - Research
  - Human Genetics
description: A review in Nature Genetics argues that interpreting a variant in one copy of a gene means asking not only how damaging the variant is, but also how well the body can tolerate its effects.
draft: false
---
One copy of a gene is broken. One person gets seriously ill, while a family member carrying the exact same variant lives without any symptoms at all.

If you study rare genetic diseases, you run into this constantly. The variant clearly impairs the protein. It seems to fit the patient's symptoms. And then the same variant turns up in a perfectly healthy parent. So is the variant not the cause after all? Or has it simply not yet met the conditions it needs to cause disease?

A review in Nature Genetics, **"A systems perspective on monoallelic inborn errors of immunity,"** approaches this question from a slightly different angle.

Instead of asking only how severe a variant is, it asks us to also look at how much of that variant's effect the body can absorb.

This paper doesn't report a new gene. It connects many studies of inborn errors of immunity and lays out, once more, the biological processes that sit between a genetic variant and actual disease.

---

## Is one normal copy enough?

Most autosomal genes come in two copies — one from your mother, one from your father.

When only one of those copies carries a variant, the situation is called monoallelic. The first question that comes to mind when interpreting such a variant is a simple one:

> "There's still one normal copy left — shouldn't that be fine?"

For some genes, that's true. The protein made from a single copy is enough to keep the necessary function going. This is called **haplosufficiency**.

For other genes, a single normal copy isn't enough to sustain a particular function. That's **haploinsufficiency**.

But real biology moves in far more complicated ways between these two. Protein levels can drop by half without causing any trouble day to day, then fall short only at moments when demand rises — during an infection or inflammation, for example.

The authors describe this state with the idea of **"tipping-point sufficiency."**

Under normal conditions, the system holds. It just has almost no margin. A small additional change is enough to tip it from a state where function is maintained into one where disease appears.

From this perspective, an asymptomatic carrier isn't necessarily "someone who isn't affected at all." They may well be affected — it's just that other mechanisms are still compensating for it.

---

## Half the protein doesn't mean half the function

The amount of protein a gene produces and the function that protein carries out don't necessarily follow a straight line.

Some reactions need only a little protein. Others only work when several molecules come together, so when the protein runs low, function can drop off much more steeply.

STAT1 is a good example.

STAT1 is involved in several interferon signals, but it doesn't work the same way in every pathway. In type I interferon signaling, it forms a complex with STAT2 and IRF9; in type II interferon signaling, two STAT1 molecules pair up with each other.

In one study described in the paper, when STAT1 remained at roughly 10–30% of normal levels, type II interferon immunity could be selectively impaired, while type I interferon immunity retained some of its protective function.

The same protein shortage was tolerated differently by each pathway that relies on that protein.

So a question just as important as "how much protein is left?" is "how much is needed to keep which function going?"

---

## Lose the brake, and the signal gets stronger

The terms we usually reach for when describing variants are loss of function and gain of function.

It seems intuitive that loss of function weakens a signal and gain of function strengthens it. But unless it's clear *whose* function we're talking about, these labels easily mislead.

The paper uses the IL-1R1 K131E variant as an example.

IL-1R1 is a receptor that transmits inflammatory signals. When the inhibitory molecule IL-1RA binds to it, signaling is restrained. This variant keeps the binding of the pro-inflammatory ligand intact, but interferes with the binding of the inhibitor.

The result looks like this:

> Loss of binding to the inhibitor → weaker brake → stronger inflammatory signal

At the molecular level, one interaction is lost; at the level of the signaling pathway, the result is overactivation.

There are cases running in the opposite direction too. Some IRF4 variants bind DNA more strongly, yet reduce transcriptional activity at their normal targets while increasing activity at other targets.

Slap a single label like "gain of function" or "loss of function" on variants like these, and important information disappears.

To understand how a variant actually works, you need to know which binding changed, which targets are affected, and what was measured in which cells.

---

## A faulty protein can be worse than no protein at all

Can an experiment that completely deletes a gene stand in for every variant of that gene?

Not necessarily.

A situation in which the variant protein simply isn't made is different from one in which a faulty protein is made and interferes with the normal protein too.

This is the **dominant-negative effect**.

Consider a protein like STAT3, which appears in the paper and works by pairing two molecules together. If normal and variant proteins are made in equal amounts and pair up at random, only about 25% of pairs consist of two normal proteins.

If normal–variant pairs also lose function, then having one normal copy doesn't mean half the function is preserved. Of course, the real proportions depend on the protein's expression levels and binding properties — but the example shows why simple deficiency and dominant-negative effects need to be told apart.

A key player here is **NMD (nonsense-mediated decay)**, a surveillance mechanism that clears out RNA carrying a premature stop codon.

If the faulty RNA is cleared, protein levels drop. If the RNA escapes clearance, a truncated protein can be made — and that truncated protein can interfere with the function of other proteins.

Using RELA and POMP as examples, the paper explains that even for variants that cause premature termination, the disease mechanism and symptoms can differ depending on whether the RNA is cleared.

In other words, sequence information alone — "this variant shortens the protein" — can't tell you the final outcome.

---

## Different jobs for the same protein

Nor does a single protein have just a single function.

The paper uses the term moonlighting function for cases where a protein carries out a biochemically distinct role beyond the main one it's known for.

STAT2 is well known as a protein that drives the expression of antiviral genes. But STAT2 also has another job: bringing USP18, which is needed to shut interferon signaling off, over to the receptor.

The STAT2 R148Q variant described in the paper preserves the first function while impairing the second.

The part that switches the signal on works, but the part that switches it off doesn't work properly. As a result, interferon signaling persists and inflammatory disease follows.

This case matters for how functional experiments are interpreted, too.

If you had measured only antiviral gene expression, you might have gotten a near-normal result. But that alone isn't enough to conclude that every function of STAT2 is normal.

Whenever an experiment comes back normal, there's always an unspoken condition attached: "for the function we measured."

---

## Heterozygous in the DNA, but not necessarily in the cell

Differences between people with the same variant don't arise from protein function alone.

Seeing one normal allele and one variant allele on a DNA test doesn't mean the actual cells use the two alleles in equal proportion.

In some cells, the normal copy may be expressed more. In others, expression of the variant copy may dominate.

The paper explains that this kind of allelic expression imbalance can influence whether disease shows up at all.

When the normal JAK1 allele is preferentially expressed, the effect of a gain-of-function variant can be masked. Conversely, in IRF7, the paper describes a case where preferential expression of the variant allele helped reveal an immune defect even though only one copy carried the variant.

Seen this way, genotype at the DNA level is a starting point. It also matters which RNA is made, and how much, in the relevant cells — and how much of which protein remains.

On top of that come differences between cell types. Even when they use the same gene, T cells, myeloid cells, and skin epithelial cells each have their own signaling networks and compensatory mechanisms.

That's why the same variant can stay silent in one tissue and be devastating in another.

---

## The cell may be weak, but the body can hold up

Compensation doesn't only happen inside a single cell. Other cells, or antibodies, can step in and cover for a defect.

The paper's OTULIN case is an interesting one.

In OTULIN haploinsufficiency, non-leukocytic cells can become vulnerable to *Staphylococcus* α-toxin. But toxin-neutralizing antibodies in the serum can make up for this vulnerability.

The defect in the cells themselves remains, but the body's defenses as a whole blunt its consequences.

This helps explain incomplete penetrance — why only some people with the same variant develop disease. Whether someone gets sick can depend not only on the nature of the variant, but also on the other defenses that person has.

And as age and immune status change, this relationship can change too. That's why the authors see the immune system not as a fixed machine but as a dynamic, changing system.

---

## From a researcher's perspective

What this review asks us to change is less about how important genes are, and more about the resolution at which we look at causality.

"Does this variant break the protein?" is still an important question. But we need to go one step further.

Which function breaks, in which cells is that function needed, and what is compensating for the defect?

These questions connect directly to experimental design. Experiments that only overexpress the variant protein can miss its interactions with the normal protein. Knockout models may fail to reproduce the interference caused by a variant protein that's still present. Even rescue experiments that add back the normal gene can, if expression is too high, alter the ratios and binding relationships within protein complexes.

That said, this paper doesn't offer a tool for calculating the odds that a given variant causes disease. Quantitatively predicting which compensatory mechanisms work, and how strongly, in a particular patient remains an open problem. The authors themselves acknowledge the need to integrate regulatory variants, genetic background, environment, epigenetics, and mosaicism more fully.

So the value of this review lies less in handing us new criteria for calling variants, and more in sharpening the questions about what to check next.

Put it side by side with the [LFA-1 deficiency study](lfa1-skin-immunity.html) I read earlier, and this perspective comes into even sharper focus. Even when a broadly expressed protein is missing, other pathways can cover for many of its functions. Actual disease shows up at the point where that compensation falls short.

A variant's effect starts with the protein — but a patient's symptoms are shaped by passing through all of the biology surrounding that protein.

---

*Werner M, Spaan AN, Mogensen TH. A systems perspective on monoallelic inborn errors of immunity. Nature Genetics. DOI: 10.1038/s41588-026-02784-8.*
