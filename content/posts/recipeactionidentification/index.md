---
title: "Recipe Action Identification"
date: 2024-05-28T04:04:42-04:00
subtitle: ""
author: Andre Kaufmann
tags: ["Recipes, Ontology, Action Identification"]
draft: false
resources:
- name: ActionButtons
  src: "buttons.json"
---

{{<recipe_showcase>}}

<!--more-->

## Recipe Acquisition
It is one thing to be able to construct a plan to cut a apple but it's another to be able to string these individual plans together to be able to to make a meal. For such tasks humans have made recipes, in which specific steps of instructions are denoted into in order to produce a standardised meal as the result. These recipes can be used by robots as well to produce meals out of the individual task executions that we outlined earlier. 

To do such requires both a way to acquire a large sum of recipes as well as a manner to store, organize and standardise them. 

The former we've achieved using the database Recipe1M+ which we've used as a source. From said source we constructed a subset of specific recipes. The specifications for those recipes are the precense of a specific set of information, such as the name and the set of instructions for example, inside of the source. The subset was then stored inside of a ontology to allow for both effective storage as well as the ability to effectively construct relations between individual recipes with other meal characterising information, such as the quantity of portions made from the recipe or individual ingredients, thereby fulfilling the later requirement.[^1] 

## Preparation for the Relation Construction 
Inside of each recipe instruction step is a action that's requiring the reader to perform a singular or a series of actions for the current step to ensure that the meal made from the recipe is made properly. This action or these actions are usually denoted as a form of a verb. Given this, a robot that's able to cook according to recipes must be able to identify the actions in each instruction step by identifying the proper verb or the proper verbs in the sentence. 

Furthermore, since there are different verbs to describe a overall action, a manner of structure has to be made that allows the structuring of the individual verbs as part of the overall action, and then those actions als a overall group of actions. To do this, we modified the ontology produced from the recipe subset to include new classes and subclasses representing this. 

Lastly, in order to allow for suitable relations between the recipes and their individual actions in the recipe instructions, a new object property is included into the subset ontology. Using this object properly allows for the exclusive extraction via SPARQL-Searches for specific recipes.  

## Showcase of the Action-Relation Construction
For the sake of showcasing the methodology we've once again limited ourself to a selection of actions. This time we'll show using only two actions and their respective verbs: Cutting and Pouring. Similar to the methods used in the Post Knowledge Acquisition the list of the most popular verbs used for cutting a object alongside those for the pouring of a liquid have been determined beforehand using a previously constructed tool.[^2] 

In order to identify recipes that include verbs in the instructions that are associated with our selected action groups we first use CoreNLP[^3] to identify the verbs inside of the recipe instruction sentences, which are stored below their respective recipe via their URIs in a text file. The classification results from those are afterwards filtered using a self-made Java program down to the verb classification results. Given these verb classifications we construct the relation between the recipe, the previously created object property and the class representing the verb using the previously filtered text file for each line, and therefore for each recipe. This is implemented using the code library RDFLib in Python. 

Using these we create a relation into the ontology using the recipe, the verb as its own class used and the associated relation between them to include the respective action that is presented by the verb class using the python library RDFLib to edit the ontology. 




## References

[^1]: Daniel Schmidt. Standardisierung eines im Internet gescrapten Rezeptdatensatzes in
eine Ontologie. Bachelorarbeit, October 2023. Universität Bremen.
[^2]: Jan-Philipp Töberg. Wikihow Instruction Analysis for Robot Manipulation. GitHub-Projekt, August 2022. https://github.com/Food-Ninja/WikiHow-Instruction-Extraction
[^3]: Manning, Christopher D., Mihai Surdeanu, John Bauer, Jenny Finkel, Steven J. Bethard, and David McClosky. 2014. The Stanford CoreNLP Natural Language Processing Toolkit In Proceedings of the 52nd Annual Meeting of the Association for Computational Linguistics: System Demonstrations, pp. 55-60.