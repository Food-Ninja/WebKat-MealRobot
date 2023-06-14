# Extracting Knowledge about food objects 

## Fruits & Vegetables

We extract a list of *all* fruits and vegetables available in the FoodOn[^1] using two SPARQL queries.
The resulting food items, together with their IRI and (if available) a short description can be found in the two '..._raw.csv' files. 
All in all, this resulted in 257 different fruits and 31 different vegetables.
However, not all of these fruits are equally relevant for a robot performing in a typical household.
Some objects like the [beechnut](https://food.r-biopharm.com/r-biomedia/beechnut/) are technically considered fruit but are either inedible or not relevant for the cooking domain.
To get an idea about the relevance of these food items, we analysed their occurrence in recipes (using the Recipe1M+ dataset[^2]) and instructions (using the [WikiHow-Analysis-Tool](https://github.com/Janfiderheld/WikiHow-Robot-Instruction-Extraction)), which is summarised in the 'occurrence_data.csv'.
This file contains the absolute occurrences and the relative occurrnes in relation to the complete amount of recipes / recipe steps / WikiHow articles / WikiHow methods / WikiHow steps. 
Currently, we only include fruits and vegetables that occurr in at least 1% of possible locations. 
After filtering, the remaining 15 fruits and 1 vegetable can be added to the ontology.


[^1]: D. M. Dooley et al., ‘FoodOn: a harmonized food ontology to increase global food traceability, quality control and data integration’, npj Sci Food, vol. 2, no. 1, Art. no. 1, Dec. 2018, doi: [10.1038/s41538-018-0032-6](https://doi.org/10.1038/s41538-018-0032-6).
[^2]: J. Marín et al., ‘Recipe1M+: A Dataset for Learning Cross-Modal Embeddings for Cooking Recipes and Food Images’, IEEE Transactions on Pattern Analysis and Machine Intelligence, vol. 43, no. 1, pp. 187–203, Jan. 2021, doi: [10.1109/TPAMI.2019.2927476](https://doi.org/10.1109/TPAMI.2019.2927476).