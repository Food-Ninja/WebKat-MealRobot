---
layout: default
---

<center><h1> Knowledge Acquisition</h1></center>
<h2>Gathering and Linking Web Knowledge</h2>

<font size="3">To support robotic agents in executing variations of *Cutting* on different *fruits and vegetables*, we collect two types of knowledge in our knowledge graph: **action** and **object knowledge**.
Both kinds of knowledge need to be linked to enable task execution as explained **[here](https://food-ninja.github.io/FoodCutting/Architecture.html)**.</font>

## Action Knowledge

<font size="3">The **action knowledge** covers all properties of a specific manipulation action that are necessary for successfully completing the action and is thus also influenced by the participating objects.
In general we rely on SOMA[^1] and its upper ontology DUL[^2] to model agent participation in events as well as roles objects play during events and how events effect objects.

For executing *Cutting* actions and its variants, we first collect synonyms and hyponyms for *Cutting* using WordNet[^3], VerbNet[^4] and FrameNet[^5].
After filtering these verbs regarding their relevance for the cooking domain using our [WikiHow Analysis Tool](https://food-ninja.github.io/FoodCutting/WikiHowAnalysis.html), we propose to divide them into **action groups** with similar motion patterns.
Based on our observations in [WikiHow](https://www.wikihow.com/) data and [cooking videos](https://youtu.be/VjINuQX4hbM), we differentiate between these tasks in three parameters:
- position: Where should the robot place its cutting tool? 
- repetitions: How many cuts should the robot perform?
- prior task: Does the robot need to execute a specific action group beforehand?

Based on the remaining 14 words, we created the following 6 action groups:</font>
<p align="center">
  <img src="img/Action Groups.png" width="800" alt="Table summarizing the 6 action groups and their parameters"/><br>
</p>


## Object Knowledge

<font size=3>As the name suggests, **object knowledge** covers all relevant information about the objects involved in the task execution (e.g. tools, containers, targets).
Of course, the relevance of each piece of information depends on the task to be executed.
So, for the task of ”Cutting an apple", the apple’s size or anatomical structure is relevant, but whether it is biodegradable or not is irrelevant

For the target group of *fruits & vegetables*, we gather the following information in our knowledge graph:
- food classes (e.g. stone fruit or citrus fruit)
- fruits and vegetables
- anatomical parts
- edibility of the anatomical parts
- tool to remove the anatomical parts

We gather these information from structured sources like FoodOn[^6] and the PlantOntology[^7], but also from unstructured sources like Recipe1M+[^8] or [WikiHow](https://www.wikihow.com/), using our [WikiHow Analysis Tool](https://food-ninja.github.io/FoodCutting/WikiHowAnalysis.html).
In total, the knowledge graph contains:
- 6 food classes 
- 18 fruits & 1 vegetable
- 4 anatomical parts (core, peel, stem, shell)
- 3 edibility classes (edible, should be avoided, must be avoided)
- 5 tools (nutcracker, knife, spoon, peeler, hand)</font>


## Knowledge Linking

<font size=3>After collecting the aforementioned action and object knowledge, this knowledge needs to be linked in our knowledge graph, so that a robot can infer the correct tool to use for a given task or the correct object to cut.
We set both kinds of knowledge in relation through *dispositions* and *affordances*, as visualised below for an apple:</font>

<p align="center">
  <img src="img/Apple Example Affordances.png" width="800" alt="Connecting affordances and dispositions for an apple"/><br>
</p>

<font size=3>In general, a disposition describes the property of an object, thereby enabling an agent to perform a certain task[^9] as in a knife can be used for cutting, whereas an affordance describes what an object or the environment offers an agent[^10] as in an apple affords to be cut.
Both concepts are set in relation by stating that dispositions allow objects to participate in events, realising affordances that are more abstract descriptions of dispositions[^1].
In our concrete knowledge graph, this is done by using the *affordsTask, affordsTrigger* and *hasDisposition* relations introduced in the SOMA ontology[^1].</font>

[Back](./index.html)

## References

[^1]: D. Beßler et al., ‘Foundations of the Socio-physical Model of Activities (SOMA) for Autonomous Robotic Agents’, in Formal Ontology in Information Systems, vol. 344, IOS Press, 2022, pp. 159–174. Accessed: Jul. 25, 2022. doi: [10.3233/FAIA210379](https://doi.org/10.3233/FAIA210379).
[^2]: V. Presutti and A. Gangemi, ‘Dolce+ D&S Ultralite and its main ontology design patterns’, in Ontology Engineering with Ontology Design Patterns: Foundations and Applications, P. Hitzler, A. Gangemi, K. Janowicz, A. Krisnadhi, and V. Presutti, Eds. AKA GmbH Berlin, 2016, pp. 81–103.
[^3]: G. A. Miller, ‘WordNet: A Lexical Database for English’, Communications of the ACM, vol. 38, no. 11, pp. 39–41, 1995, doi: [10.1145/219717.219748](https://dl.acm.org/doi/10.1145/219717.219748).
[^4]: K. K. Schuler, ‘VerbNet: A broad-coverage, comprehensive verb lexicon’, PhD Thesis, University of Pennsylvania, 2005.
[^5]: C. F. Baker, C. J. Fillmore, and J. B. Lowe, ‘The Berkeley FrameNet Project’, in Proceedings of the 36th annual meeting on Association for Computational Linguistics  -, Montreal, Quebec, Canada: Association for Computational Linguistics, 1998, p. 86. doi: [10.3115/980845.980860](http://portal.acm.org/citation.cfm?doid=980845.980860).
[^6]: D. M. Dooley et al., ‘FoodOn: a harmonized food ontology to increase global food traceability, quality control and data integration’, npj Sci Food, vol. 2, no. 1, Art. no. 1, Dec. 2018, doi: [10.1038/s41538-018-0032-6](https://www.nature.com/articles/s41538-018-0032-6).
[^7]: P. Jaiswal et al., ‘Plant Ontology (PO): a Controlled Vocabulary of Plant Structures and Growth Stages’, Comparative and Functional Genomics, vol. 6, no. 7–8, pp. 388–397, 2005, doi: [10.1002/cfg.496](http://www.hindawi.com/journals/ijg/2005/373740/abs/).
[^8]: J. Marín et al., ‘Recipe1M+: A Dataset for Learning Cross-Modal Embeddings for Cooking Recipes and Food Images’, IEEE Transactions on Pattern Analysis and Machine Intelligence, vol. 43, no. 1, pp. 187–203, Jan. 2021, doi: [10.1109/TPAMI.2019.2927476](https://pubmed.ncbi.nlm.nih.gov/31295105/).
[^9]: M. T. Turvey, ‘Ecological foundations of cognition: Invariants of perception and action.’, in Cognition: Conceptual and methodological issues., H. L. Pick, P. W. van den Broek, and D. C. Knill, Eds. Washington: American Psychological Association, 1992, pp. 85–117. doi: [10.1037/10564-004](https://doi.org/10.1037/10564-004).
[^10]: M. H. Bornstein and J. J. Gibson, ‘The Ecological Approach to Visual Perception’, The Journal of Aesthetics and Art Criticism, vol. 39, no. 2, p. 203, 1980, doi: [10.2307/429816](https://doi.org/10.2307/429816).
