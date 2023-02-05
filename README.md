# Food Cutting Robots

This projects deals with the problem of teaching robots how to execute unknown tasks as motivated in the following picture:
<img src="img/Motivation2.png" width="600" alt="Cutting Food Motivation"/><br>

We therefore created a task hierarchy from WikiHow instructions to get a broad range of tasks that are actually used in recipe instructions, for example. The scripts for this can be found in the files and the description of how we did this is detailed in our paper.

The task hierarchy defines tasks to be executed for different food as exemplary shown in the following picture:
<img src="img/AppleHierarchy(2).eps" width="400" alt="Apple Hierarchy"/><br>
<img src="img/CucumberHierarchy(1).eps" width="400" alt="Cucumber Hierarchy"/><br>

The task hierarchy is linked to other ontologies like SOMA and FoodOn, the created ontology can be found in this repo as well.

You can try out how a robot would query the ontology using Protégé and a standard reasoner like HermiT like in the following picture:

<img src="img/StartReasoner.png" width="500" alt="Starting the reasoner"/><br>

Once you started the reasoner, you can find out what round food can be sliced, for example:

<img src="img/SlicingDL.png" width="600" alt="DL query round, slicing"/><br>

In the same manner, you can find out what oval food can be sliced:

<img src="img/SlicingOvalDL.png" width="600" alt="DL query oval, slicing"/><br>

A robot would query for all subclasses of a given class to then query if the given food can be used.
