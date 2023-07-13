# Food Cutting Robots

This project deals with the problem of teaching robots how to execute unknown tasks as motivated in the following picture:

<p align="center">
  <img src="img/Motivation.jpg" width="600" alt="Enabling cognitive robots to cut food objects through an ontology"/><br>
</p>

To create the ontology employed by the robots for covering knowledge about food objects and the manipulation action *Cutting*, we propose a [manipulation-focused knowledge engineering methodology](./Methodology.html).
As part of this methodology, we created a task hierarchy from WikiHow instructions to get a broad range of *cut* hyponyms that are actually used in recipe instructions, like *dice*, *halve* or *slice*. For the analysis of the WikiHow articles, we developed the [WikiHow-Analysis-Tool](./WikiHowAnalysis.html).

Additionally, we defined, formalized and extracted **task-specific object knowledge**, which includes object properties like shape, size and anatomical parts that influence the task execution. This knowledge is combined with the task hierarchies and linked to other ontologies like [SOMA](https://github.com/ease-crc/soma) and [FoodOn](https://foodon.org/) to create the [Food-Cutting-Ontology](https://github.com/Food-Ninja/FoodCutting/blob/main/food_cutting.owl).

For the execution on a robot, we use the [CRAM cognitive architecture](https://github.com/cram2/cram) and the knowledge graph for robotic applications in the [KnowRob knowledge processing system](https://github.com/knowrob/knowrob).
A robot running KnowRob would query for all subclasses of a given class to find out what movements need to be performed to successfully execute an action such as in the following SPARQL query called with Prolog that is also available on [triply](https://krr.triply.cc/mkumpel/-/queries/All-Movements-for-Action/1) to then query if the given food can be used for the given action. For this, the robot needs to use a reasoner.

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

Similarly, this can be done in Prolog using the following statement:

```bash
use_module(library(semweb/rdf_db)).             #load rdf module to load the ontology
rdf_load('food_cutting.owl').                   #load ontology
use_module(library(semweb/sparql_client)).      #load SPARQL module
rdf(?act, rdfs:subClassOf, SOMA:Slicing), optional(rdf(?task, rdfs:subClassOf, ?act)), optional(rdf(?motion, rdfs:subClassOf, ?task)).
```        

## Disclaimer

This knowledge graph is made available under the [Open Data Commons Attribution License](http://opendatacommons.org/licenses/by/1.0/). It is publicly available [here](https://github.com/Food-Ninja/FoodCutting/blob/main/food_cutting.owl) and on [triply](https://api.krr.triply.cc/datasets/mkumpel/FruitCuttingKG/services/FruitCuttingKG/sparql) for inspection and querying, many thanks to the [knowledge representation and reasoning group](https://krr.cs.vu.nl/) at the Vrije Universiteit Amsterdam.

This knowledge graph has been created by the [Institute for Artificial Intelligence](https://ai.uni-bremen.de/) at the University of Bremen as well as the [Semantic Computing Group](https://www.uni-bielefeld.de/fakultaeten/technische-fakultaet/arbeitsgruppen/semantic-computing/) at the Cluster of Excellence Cognitive Interaction Technology at Bielefeld University. Please contact [Michaela Kümpel](https://ai.uni-bremen.de/team/michaela_k%C3%BCmpel) (michaela(dot)kuempel(at)uni-bremen(dot)de) or [Jan-Philipp Töberg](https://www.uni-bielefeld.de/fakultaeten/technische-fakultaet/arbeitsgruppen/semantic-computing/team/jan-philipp-toeberg/) (jtoeberg(at)techfak(dot)uni-bielefeld(dot)de) for further information or collaboration.

<p align="center" width="100%">
      <img width="30%" src="img/ai_logo.png"/>
      <img width="30%" src="img/university_new.png"/>
      <img width="30%" src="img/logo_citec_EN.png"/>
</p>