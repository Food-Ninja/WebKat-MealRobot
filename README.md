# Food Cutting Robots

This projects deals with the problem of teaching robots how to execute unknown tasks as motivated in the following picture:

<img src="img/Motivation.jpg" width="600" alt="Cutting Food Motivation"/><br>

We therefore created a task hierarchy from WikiHow instructions to get a broad range of tasks that are actually used in recipe instructions, for example. 
The project we used for analysing the WikiHow instructions is linked and instructions on how to use it are found in the repository. Additional details are provided in the paper. 

The task hierarchy is linked to other ontologies like SOMA and FoodOn, the created ontology can be found in this repo as well.

You can try out how a robot would query the ontology using Protégé and a standard reasoner like HermiT like in the following picture:

<img src="img/StartReasoner.png" width="300" alt="Starting the reasoner"/><br>

The knowledge graph is publicly available here and on <a href="https://api.krr.triply.cc/datasets/mkumpel/FruitCuttingKG/services/FruitCuttingKG/sparql">triply</a> for inspection and querying, many thanks to the <a href="https://krr.cs.vu.nl/">knowledge representation and reasoning group</a> at the Vrije Universiteit Amsterdam.

Once you started the reasoner, you can find out what round food can be sliced, for example:

<img src="img/SlicingDL.png" width="600" alt="DL query round, slicing"/><br>

In the same manner, you can find out what oval food can be sliced:

<img src="img/SlicingOvalDL.png" width="600" alt="DL query oval, slicing"/><br>

A robot running KnowRob would similarly query for all subclasses of a given class to then query if the given food can be used as in the following Prolog query:
```bash
use_module(library(semweb/rdf_db)).
rdf_load('food_cutting.owl').
rdf_register_prefix(cut, 'http://www.ease-crc.org/ont/food_cutting#').

subclass_of(obj, cut:'Food'), subclass_of(obj, cut:'Slicing').
```

All information in the stated ontology is accessible by the robot through queries at runtime. The action designator also uses Prolog as the inference engine to convert symbolic action descriptions into ROS action goals or similar data structures. Since the inference engine is already in Prolog, necessary information can be acquired through queries. This goes beyond the newest cutting action designator and is available in the open-source framework CRAM for all designators. 

The updated action designator for cutting (which includes the actions slicing and halving as proposed in the paper) can be found in this repo. This is just the specific designator part where parameters can be infered. To see the full potential of the generlized action designators please visit the <a href="https://cram-system.org/">CRAM website</a>. 

This Knowledge Graph is made available under the <a href="http://opendatacommons.org/licenses/by/1.0/">Open Data Commons Attribution License</a>.


This knowledge graph has been created by the <a href="https://ai.uni-bremen.de/">Institute for Artificial Intelligence</a> at the University of Bremen as well as. Please contact <a href="https://ai.uni-bremen.de/team/michaela_k%C3%BCmpel">Michaela Kümpel</a> for further info or collaboration: michaela(dot)kuempel(at)uni-bremen(dot)de

<img src="img/ai_logo.png" width="200"/><img align=right src="img/university_new.png" width="200"/>
