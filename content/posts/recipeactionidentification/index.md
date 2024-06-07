---
title: "Recipe Action Identification"
date: 2024-03-28T04:04:42-04:00
subtitle: ""
tags: ["Recipes, Simulation , Action Identification "]
dropCap: false
displayInMenu: false
displayInList: true
draft: false
resources:
- name: ActionButtons
  src: "buttons.json"
---

{{<recipe_showcase>}}

<!--more-->

## Recipe Acquisition
It is one thing to be able to construct a plan to cut a apple but it's another to be able to string these individual plans together to be able to to make a meal. For such tasks humans have made recipes to denote specific steps of instructions to produce a standardised meal. These recipes can be used by robots as well to produce meals out of the individual task executions that we outlined earlier. 

To do such requires both a way to acquire a large sum of recipes as well as a manner to store, organize and standardise them. 

The former we've achieved using the database Recipe1M+ which we've used as a base dataset, from which we took recipes that included sufficient enough information to be able to be standardised. These post-process recipes were stored inside of a ontology to allow for both effective storage as well as the ability to effectively construct relations between individual recipes with other meal characterising information such as the quantity of portions made from the recipe or individual ingredients, thereby fulfilling the later. (Zitierung für D.Schmitts Arbeit.) 

## Action Identification
Inside of each recipe instruction step is a action that's requiring the reader to perform a singular or a series of actions for the current step to ensure that the meal made from the recipe is made properly. This action is usually a form of a verb. Given this, a robot that's able to cook according to recipes must be able to identify the verbs and thereby the action of each recipe instruction. 

Furthermore, since we've identified action groups encomposing multiple verbs as a action, said action group knowledge must be saved also in the ontology. This is performable through the establishment of object relation between the action group and the recipe.   

## Showcase of Action-Relation Creation
For the sake of showcasing the methodology we've once again limited ourself to a selection of actions. This time we'll show using only two actions and their respective verbs: Cutting and Pouring. Similar to the methods used in the Post Knowledge Acquisition for the determination of the most popular verbs used for cutting a object those for the action of pouring a liquid have been determined beforehand. (Hier eine Referenz zu der Quelle von der Pouring Arbeit die die Analyse von der Anzahl von Pouring-Verb-Verwendungen enthält)

In order to identify recipes that include verbs in the instructions that are associated with our selected action groups we first use CoreNLP to identify the verbs inside of the recipe instruction sentences and afterwards use a self-programmed script using Java on the output of CoreNLP to extract the verbs out of the entire output. Afterwards we create a relation into the ontology using the recipe, the verb as its own class used and the associated relation between them to include the respective action that is presented by the verb class using the python library RDFLib to edit the ontology. 

( Hier mehrere Programmausschnitte einfügen vllt zum Zeigen wie es funkt, ähnlich wie bei den anderen Post wie QueryLikeARobot?) 





