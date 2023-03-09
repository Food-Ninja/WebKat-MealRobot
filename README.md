# Food Cutting Robots

This projects deals with the problem of teaching robots how to execute unknown tasks as motivated in the following picture:

<img src="img/Motivation.jpg" width="600" alt="Cutting Food Motivation"/><br>

We therefore created a task hierarchy from WikiHow instructions to get a broad range of tasks that are actually used in recipe instructions, for example. 
The project we used for analysing the WikiHow instructions is linked and instructions on how to use it are found in the repository. Additional details are provided in the paper. 

The task hierarchy is linked to other ontologies like SOMA and FoodOn, the created ontology can be found in this repo as well.

We use the knowledge graph for robotic applications. Our robots use the <a href="https://github.com/cram2/cram">CRAM cognitive architecture</a> and the <a href="https://github.com/knowrob/knowrob">KnowRob knowledge processing system</a>.

A robot running KnowRob would similarly query for all subclasses of a given class to find out what movements need to be performed to successfully execute an action such as in the following SPARQL query called with Prolog that is also available on <a href="https://krr.triply.cc/mkumpel/-/queries/All-Movements-for-Action/1">triply</a>:
```bash
use_module(library(semweb/rdf_db)).             #load rdf module to load the ontology
rdf_load('food_cutting.owl').                   #load ontology
use_module(library(semweb/sparql_client)).      #load SPARQL module
sparql_query(                                   #call SPARQL query

'PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX SOMA: <http://www.ease-crc.org/ont/SOMA.owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

Select DISTINCT  ?obj2 ?obj ?act  WHERE {
      # find all subclasses of a given action (here:slicing)
  ?act rdfs:subClassOf SOMA:Slicing.
  	  # if available, find all subclasses of the subclass
  OPTIONAL{
    ?obj rdfs:subClassOf ?act.
      # if available, find all subclasses of the subclass
  OPTIONAL{
    ?obj2 rdfs:subClassOf ?obj.}}
  }', Row,
  [endpoint('https://api.krr.triply.cc/datasets/mkumpel/FruitCuttingKG/services/FruitCuttingKG/sparql')]).
```
to then query if the given food can be used for the given action. For this, the robot needs to use a reasoner.

You can try out how a robot would query the ontology using Protégé and a standard reasoner like HermiT like in the following picture:

<img src="img/StartReasoner.png" width="300" alt="Starting the reasoner"/><br>

The knowledge graph is publicly available here and on <a href="https://api.krr.triply.cc/datasets/mkumpel/FruitCuttingKG/services/FruitCuttingKG/sparql">triply</a> for inspection and querying, many thanks to the <a href="https://krr.cs.vu.nl/">knowledge representation and reasoning group</a> at the Vrije Universiteit Amsterdam.

Once you started the reasoner, you can find out what food can be sliced, for example. If you add additional parameters that are available in the ontology like the initialShape of an object, you can narrow down the results to all round food that can be sliced, for example:

<img src="img/SlicingDL.png" width="600" alt="DL query round, slicing"/><br>

In the same manner, you can find out what oval food can be sliced:

<img src="img/SlicingOvalDL.png" width="600" alt="DL query oval, slicing"/><br>

All information in the stated ontology is accessible by the robot through queries at runtime. The action designator also uses Prolog as the inference engine to convert symbolic action descriptions into ROS action goals or similar data structures. Since the inference engine is already in Prolog, necessary information can be acquired through queries. This goes beyond the newest cutting action designator and is available in the open-source framework CRAM for all designators. 

The updated action designator for cutting (which includes the actions slicing and halving as proposed in the paper) can be found in this repo. This is just the specific designator part where parameters can be infered. To see the full potential of the generlized action designators please visit the <a href="https://cram-system.org/">CRAM website</a>. 

This Knowledge Graph is made available under the <a href="http://opendatacommons.org/licenses/by/1.0/">Open Data Commons Attribution License</a>.


This knowledge graph has been created by the <a href="https://ai.uni-bremen.de/">Institute for Artificial Intelligence</a> at the University of Bremen as well as. Please contact <a href="https://ai.uni-bremen.de/team/michaela_k%C3%BCmpel">Michaela Kümpel</a> for further info or collaboration: michaela(dot)kuempel(at)uni-bremen(dot)de

<img src="img/ai_logo.png" width="200"/><img align=right src="img/university_new.png" width="200"/>
