---
title: "Recipe Action Identification"
date: 2024-03-28T04:04:42-04:00
subtitle: ""
tags: ["Recipes, Robot, Simulation"]
dropCap: false
displayInMenu: false
displayInList: true
draft: false
resources:
- name: ActionButtons
  src: "buttons.json"
---

(Hier die HTML von der Recipe Query für die Rezeptschritte einfügen)




## Recipe Acquisition
It is one thing to be able to construct a plan to cut a apple but it's another to be able to string these individual plans together to be able to to make a meal. For such tasks humans have made recipes to denote specific steps of instructions to produce a standardised meal. These recipes can be used by robots as well to produce meals out of the individual task executions that we outlined earlier. 

To do such requires both a way to acquire a large sum of recipes as well as a manner to store, organize and standardise them. 

The former we've achieved using the database Recipe1M+ which we've used as a base dataset, from which we filtered and standardised whatever recipes we could out of the database. These post-process recipes were stored inside of a ontology to allow for both effective storage as well as the ability to effectively construct relations between individual recipes with other meal characterising information such as the quantity of portions made from the recipe or individual ingredients, thereby fulfilling the later. (Zitierung für D.Schmitts Arbeit.) 


## Action Filtering 
For the sake of showcasing the methodology we've once again limited ourself to a selection of actions. This time we'll show using only two actions and their respective verbs: Cutting and Pouring. Similar to the methods used in the Post Knowledge Acquisition for the determination of the most popular verbs used for cutting a object those for the action of pouring a liquid have been determined beforehand. (Hier eine Referenz zu der Quelle von der Pouring Arbeit die die Analyse von der Anzahl von Pouring-Verb-Verwendungen enthält)









## Showcase of Recipe Instruction Execution
(Hier würde ich eingehen auf die Identifikation von ausführbaren Kochschritte anhand von Schneide- und Gießaktionen mit Referenz von den Infos in Knowledge Acquisition . Also meine Veränderungen in der Ontologie mit includes_task)



## 



#OK also nachdem ich die zweite Testseite entfernt habe funkt das hier nun? Keine Ahnung aber es ist wie es ist.
#Dies sind Kommentare, nicht davor sind normaler Test, Doppelraute sind Kapitel, Eckige Klammern gefolgt mit Runden Klammer mit Link sind Verlinkungen. Mit Eckige Klammern dahinter sind Zitate.
# Wieso sieht das hier so aus wie es aussieht?


est blablabla yadayadayada

“*Test*”

## Yep that's a test

[Testing](https://www.youtube.com)

[Difference?](https://www.youtube.com)[^1]

Bild:

<p align="center">
	<img src="AppleQuarteringComic.png" width="800" alt="Simulation of the “Quarter an apple” task"/><br>
</p>


[^1]: M. Neumann, A. Haidu, and M. Beetz, ‘URoboSim — a simulation-based predictive modelling engine for cognition-enabled robot manipulation’, in 2nd Embodied AI Workshop (CVPR), Virtual Event, 2021. [Online](https://embodied-ai.org/papers/URoboSim.pdf).
