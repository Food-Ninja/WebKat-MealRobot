---
layout: default
---

# [WikiHow Analysis Tool](https://github.com/Food-Ninja/WikiHow-Instruction-Extraction)

To gather additional knowledge about manipulation actions and their associated verbs, we developed a tool analysing a [WikiHow](https://www.wikihow.com) corpus[^1].
The goal is to better the understanding of manipulation verbs and their parameterization for different objects, goals and environments.
The tool uses basic NLP techniques like Part-of-Speech Tagging and Coreference Resolution from the Stanford CoreNLP Toolkit[^2] to extract verb frames.

The WikiHow articles analysed by our tool are structured in the following way:

<p align="center">
  <img src="img/WikiHow Article Structure.png" width="800" alt="Summarising the structure of a WikiHow article"/><br>
</p>

## Action Verb Frames

For the current search target, the tool extracts a verb frame. 
The structure of each frame is manually set for different action groups based on example data from the corpus.
Currently, frames for the verb groups centered around *Cutting* and *Pouring* are available:

- *Cutting* Structure: `(Verb, Target, Preposition, Shape)`
- *Cutting* Example: `(dice, 1 sweet potato, into, squares)`
- *Pouring* Structure: `(Verb, Object, Preposition, Target Location)`
- *Pouring* Example: `(pour, the brown sugar, into, the bowl)`

In general, a frame is filled with content from a single sentence found in a step description.
For the extraction, we use POS Tagging to find the preposition and extract the other two frame elements based on their location in the sentence in relation to the verb and the preposition.

## Extracting Verb Occurrences

One current use case for the analysis tool is counting the occurrences of specific synonyms / hyponyms for the representative word for a specific group.
We gather these synonyms and hyponyms using WordNet[^3], VerbNet[^4] and [Thesaurus](https://www.thesaurus.com/).
In a first step, we manually filter these verbs to only include verbs relevant for the household / cooking domain.
Afterwards we count the number of occurrences in the different parts of a WikiHow article.
The exemplary result for the *Cutting* verb group can be seen below:

<p align="center">
  <img src="img/CuttingWikiHowResults.png" width="600" alt="Occurrences of Cutting and its hyponyms in the WikiHow corpus"/><br>
</p>

In the table, the three verbs with the most occurrences per column (apart from *cut*) were marked in **bold**.
In our ontology, we currently cover *slice*, *dice*, *halve*, *quarter* and *cube*.
With this knowledge, the relevance of different hyponyms for the application domain can be assessed and a better focus can be set in the following steps of our [methodology](./Methodology.html).

[Back to the Overview](./)

## References

[^1]: L. Zhang, Q. Lyu, and C. Callison-Burch, ‘Reasoning about Goals, Steps, and Temporal Ordering with WikiHow’, in Proceedings of the 2020 Conference on Empirical Methods in Natural Language Processing (EMNLP), Online: Association for Computational Linguistics, 2020, pp. 4630–4639. doi: [10.18653/v1/2020.emnlp-main.374](https://aclanthology.org/2020.emnlp-main.374/).
[^2]: C. D. Manning, M. Surdeanu, J. Bauer, J. Finkel, S. J. Bethard, and D. McClosky, ‘The Stanford CoreNLP Natural Language Processing Toolkit’, in Proceedings of the 52nd Annual Meeting of the Association for Computational Linguistics: System Demonstrations, 2014, pp. 55–60. [Online](http://www.aclweb.org/anthology/P/P14/P14-5010)
[^3]: G. A. Miller, ‘WordNet: A Lexical Database for English’, Communications of the ACM, vol. 38, no. 11, pp. 39–41, 1995, doi: [10.1145/219717.219748](https://dl.acm.org/doi/10.1145/219717.219748).
[^4]: K. K. Schuler, ‘VerbNet: A broad-coverage, comprehensive verb lexicon’, PhD Thesis, University of Pennsylvania, 2005.