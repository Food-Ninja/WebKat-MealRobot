# Extracting Knowledge about Fruits & Vegetables

## Extracting & Filtering Fruits

We extract a list of *all* fruits and vegetables available in the FoodOn[^1] using two SPARQL queries.
The resulting food items, together with their IRI and (if available) a short description can be found in the two '..._raw.csv' files. 
All in all, this resulted in 257 different fruits and 31 different vegetables.

However, not all of these fruits are equally relevant for a robot performing in a typical household.
Some objects like the [beechnut](https://food.r-biopharm.com/r-biomedia/beechnut/) are technically considered fruit but are either inedible or not relevant for the cooking domain.
To get an idea about the relevance of these food items, we analysed their occurrence in recipes (using the Recipe1M+ dataset[^2]) and instructions (using the [WikiHow-Analysis-Tool](https://github.com/Janfiderheld/WikiHow-Robot-Instruction-Extraction)), which is summarised in the 'occurrence_data.csv'.
This file contains the absolute occurrences and the relative occurrnes in relation to the complete amount of recipes / recipe steps / WikiHow articles / WikiHow methods / WikiHow steps. 
Currently, we only include fruits and vegetables that occurr in at least 1% of possible locations. 
After filtering, the remaining 15 fruits and 1 vegetable can be added to the ontology.

## Extracting Fruit Properties

In the [FruitPropertyExtraction](./FruitPropertyExtraction.ipynb) notebook, we test out different ways of extracting information about the previously collected fruits and vegetables.

### Anatomical Part

Here we extract information about the anatomical parts that occur in the fruit / vegetable. 
We test the LLMs ChatGPT and GPT-4[^3] as well as three different embeddings through calculating the cosine similarity between the fruit/vegetable and the part.
The embeddings are: ConceptNet Numberbatch[^4], NASARI[^5] and GloVe[^6].
We also provide the 4 possible anatomical parts to choose from: *core, shell, stem, peel*

Results:
|          | F1-Score|Remark|
|:--------------|:-----------:|:--------------|
| ChatGPT | .690 |-|
| GPT-4  | .625  |-|
|CN Numberbatch | .622  |Threshold >= 0.2|
|CN Numberbatch | .533  |Threshold >= 0.3|
|GloVe| .471  |Threshold >= 0.25|
|GloVe| .444  |Threshold >= 0.40|
|NASARI| .444  |Threshold >= 0.75|
|GloVe| .432  |Threshold >= 0.50|
|NASARI| .394  |Threshold >= 0.50|

### Part Edibility

Here we extract information about the edibility for each anatomical part. 
We just evaluate ChatGPT & GPT-4[^3]. Again, the LLM can choose between three pre-defined edibilities: *edible, should be avoided, must be avoided*

Results (Average F1-Score across the 3 classes):
|          | F1-Score|
|:--------------|:-----------:|
| ChatGPT | .253 |
| GPT-4  | .410  |

### Part Removal Tool

We extract information about the tool suggested for removing an antomical part from the part / fruit.
Here we also evaluate ChatGPT & GPT-4[^3] but we de not provide them a list of tools to choose from.
However, the correct results stem from a list of 5 tools: *nutcracker, knife, hand, peeler, spoon*

Results (Average F1-Score across the 5 classes):
|          | F1-Score|
|:--------------|:-----------:|
| ChatGPT | .341 |
| GPT-4  | .428  |

## References

[^1]: D. M. Dooley et al., ‘FoodOn: a harmonized food ontology to increase global food traceability, quality control and data integration’, npj Sci Food, vol. 2, no. 1, Art. no. 1, Dec. 2018, doi: [10.1038/s41538-018-0032-6](https://doi.org/10.1038/s41538-018-0032-6).
[^2]: J. Marín et al., ‘Recipe1M+: A Dataset for Learning Cross-Modal Embeddings for Cooking Recipes and Food Images’, IEEE Transactions on Pattern Analysis and Machine Intelligence, vol. 43, no. 1, pp. 187–203, Jan. 2021, doi: [10.1109/TPAMI.2019.2927476](https://doi.org/10.1109/TPAMI.2019.2927476).
[^3]: OpenAI, ‘GPT-4 Technical Report’, OpenAI, 2023. Accessed: Jul. 13, 2023. [Available Online](https://cdn.openai.com/papers/gpt-4.pdf).
[^4]: R. Speer, J. Chin, and C. Havasi, ‘ConceptNet 5.5: An Open Multilingual Graph of General Knowledge’, AAAI, vol. 31, no. 1, Feb. 2017, doi: [10.1609/aaai.v31i1.11164](https://ojs.aaai.org/index.php/AAAI/article/view/11164).
[^5]: J. Camacho-Collados, M. T. Pilehvar, and R. Navigli, ‘NASARI: A Novel Approach to a Semantically-Aware Representation of Items’, in Proceedings of the 2015 Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, Denver, CO, 2015, pp. 567–577. [Available Online](http://aclweb.org/anthology/N/N15/N15-1059.pdf).
[^6]: J. Pennington, R. Socher, and C. Manning, ‘Glove: Global Vectors for Word Representation’, in Proceedings of the 2014 Conference on Empirical Methods in Natural Language Processing (EMNLP), Doha, Qatar: Association for Computational Linguistics, 2014, pp. 1532–1543. doi: [10.3115/v1/D14-1162](http://aclweb.org/anthology/D14-1162).