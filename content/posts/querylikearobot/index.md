---
title: "Querying Like a Robot"
date: 2023-11-30T14:33:42-04:00
subtitle: ""
tags: ["Query, Robot, Live Demo"]
dropCap: false
displayInMenu: false
displayInList: true
draft: false
resources:
- name: ActionButtons
  src: "buttons.json"
---

{{<Webinterface>}}



<!--more-->

# Querying Food Cutting Knowledge Using a REST API

If you want to access the contained knowledge using predefined standard queries, please use our <a href="http://grlc.io/api/Food-Ninja/FoodCutting/sparqlfiles/">grlc interface</a>[^1] for predefined queries.


# Querying Food Cutting Knowledge Using SPARQL
The robot knows that for all cutting actions like slicing, dicing, halving or quartering it needs to perform the following body movements:

pick up (tool) -> approach (object, position) -> lower (tool) -> lift (tool) -> place (tool)

For each cutting parameter in parantheses, the robot can query the ontology to retrieve further information. The following query asks for the tool to use for a cutting action. You can also try out the query yourself <a href="https://krr.triply.cc/mkumpel/-/queries/What-food-can-be-cut-with-which-tool-1/1">on triply</a>
```bash
PREFIX DUL: <http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#>
PREFIX cut2: <http://www.ease-crc.org/ont/situation_awareness#>
PREFIX SOMA: <http://www.ease-crc.org/ont/SOMA.owl#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX cut: <http://www.ease-crc.org/ont/food_cutting#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?food ?whattool ?alltools WHERE {
  ?food rdfs:subClassOf ?node.                              #?food is the input parameter
  ?node owl:onProperty SOMA:hasDisposition.
  ?node owl:someValuesFrom ?collection.
  ?collection owl:intersectionOf ?node2.
  ?node2 rdf:first cut2:Cuttability.                        #we are interested in all cuttability dispositions of the food object
  ?node2 rdf:rest ?toolnode.
  ?toolnode rdf:rest ?collection2.
  ?collection2 rdf:first ?tooluse.
  ?tooluse owl:onProperty SOMA:affordsTrigger.              #and the trigger they (the object dispositions) afford
  ?tooluse owl:allValuesFrom ?tool.                         #?tool is a general object class like "Cutting Tool2"
  ?tool owl:onProperty DUL:classifies.
  ?tool owl:allValuesFrom ?whattool.
  ?alltools rdfs:subClassOf* ?whattool.                     #this is the specific tool we are looking for
} ORDER BY ?food
 ```
For some food, different tools can be used for cutting. For example, an apple can be cut with an apple cutter but also with a knife. The query above can return all tools that can be used for cutting. A robot can then relate query results to perception results and find the object to be used for performing a given task.

The next query helps the robot infer what object shall be cut. It also is available <a href="https://krr.triply.cc/mkumpel/-/queries/Find-out-what-object-to-cut/1">on triply</a>
```bash
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX SOMA: <http://www.ease-crc.org/ont/SOMA.owl#>
PREFIX cut: <http://www.ease-crc.org/ont/food_cutting#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT DISTINCT ?cuttingaction ?inputobject ?outputobj WHERE {
  ?cuttingaction rdfs:subClassOf SOMA:Cutting.                     #?cuttingaction is the input parameter, here all cutting actions are queried
  ?cuttingaction rdfs:subClassOf ?node.
  ?cuttingaction rdfs:subClassOf ?node2.
  ?node2 owl:intersectionOf ?intersect.
  ?intersect rdf:first ?restriction.
  ?restriction owl:onProperty cut:hasInputObject.                  #we are interest in the object that is being cut, here called "InputObject"
  ?restriction owl:someValuesFrom ?inputobject.
  ?intersect rdf:rest ?restrict.
  ?restrict rdf:first ?restrict2.
  ?restrict2 owl:onProperty cut:hasResultObject.                   #this query also returns the result objects of a cutting action
  ?restrict2 owl:onClass ?outputobj.
} GROUP BY ?cuttingaction
```

Some of these actions have a piece or slice as input objects. This is due to the fact that the actions require the robot to perform a prior action. The robot can use the following query to find out wether a prior action needs to be performed:
```bash
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX SOMA: <http://www.ease-crc.org/ont/SOMA.owl#>
PREFIX cut: <http://www.ease-crc.org/ont/food_cutting#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?cuttingaction ?prioraction WHERE {
  ?cuttingaction rdfs:subClassOf SOMA:Cutting.
  ?cuttingaction rdfs:subClassOf ?node.
  ?node owl:onProperty cut:requiresPriorTask.
  ?node owl:someValuesFrom ?prioraction.
} ORDER BY ?cuttingaction
```

Similarly, some food requires additional actions to ber performed in addition (and prior to) cutting, for example peeling.  To find out if those actions need to be performed on a given food, the robot can use the following query:
```bash
PREFIX SOMA: <http://www.ease-crc.org/ont/SOMA.owl#>
PREFIX cut: <http://www.ease-crc.org/ont/food_cutting#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?food  ?foodpart ?disposition ?action WHERE {
  ?food rdfs:subClassOf ?restriction.                       #?food is the input parameter
  ?restriction owl:onProperty cut:hasPart.
  ?restriction owl:someValuesFrom ?node.
  ?node owl:intersectionOf ?intersec.
  ?intersec rdf:first ?foodpart.
  ?intersec rdf:rest ?node2.
  ?node2 rdf:first ?part.
  ?part owl:onProperty cut:hasEdibility.                    #we want to find out if the food has a part that is not edible
  {?part owl:someValuesFrom cut:ShouldBeAvoided.}           #we therefore ask for parts that should be avoided
  UNION
  {?part owl:someValuesFrom cut:MustBeAvoided.}             #or must be avoided
  ?foodpart rdfs:subClassOf ?partrestriction.
  ?partrestriction owl:onProperty SOMA:hasDisposition.
  ?partrestriction owl:someValuesFrom ?partnode.
  ?partnode owl:intersectionOf ?intersection.
  ?intersection rdf:first ?disposition.                     #now we find the disposition of the part
  ?intersection rdf:rest ?actionrestriction.
  ?actionrestriction rdf:first ?actionnode.
  ?actionnode owl:onProperty SOMA:affordsTask.              #and what tasks the disposition affords
  ?actionnode owl:someValuesFrom ?action.                   #?action then are the tasks that have to be performed
} 
```

Last but not least, the robot needs to know the position for cutting. We distinguish between slicing and halving position, which can be queried as in the following:
```bash
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX cut: <http://www.ease-crc.org/ont/food_cutting#>
PREFIX SOMA: <http://www.ease-crc.org/ont/SOMA.owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT ?sub ?position WHERE {
  ?sub rdfs:subClassOf SOMA:Cutting.
  ?sub rdfs:subClassOf ?node.
  ?node owl:onProperty cut:requiresPosition.
  ?node owl:someValuesFrom ?position.
}
```

# Querying Food Cutting Knowledge Using Prolog
All information in the stated ontology is accessible by the robot through queries at runtime.
The action designator also uses Prolog as the inference engine to convert symbolic action descriptions into ROS action goals or similar data structures. 
Since the inference engine is already in Prolog, necessary information can be acquired through queries. 
This goes beyond the newest cutting action designator and is available in the open-source framework CRAM for all designators. 

A KnowRob package to query the ontology is available in <a href="https://github.com/Food-Ninja/knowrob_cutting">this github repo</a>.

The package is documented but as a simple example of retrieving the pose needed for cutting (it only differentiates between *slicing_position* and *halving_position*, the robot can further infer the actual position according to this info), the *position_to_be_used* query can be called with the cutting action (here as an example "SOMA:'Cutting'") as input parameter and Pose as output parameter returns a *slicing_position*. 

```
?- position_to_be_used(SOMA:'Cutting',Pose).
Pose: slicing_position
```

## References

[^1]: A. Meroño-Peñuela and R. Hoekstra, ‘grlc Makes GitHub Taste Like Linked Data APIs’, in The Semantic Web - ESWC Satellite Events, H. Sack, G. Rizzo, N. Steinmetz, D. Mladenić, S. Auer, and C. Lange, Eds., in Lecture Notes in Computer Science, vol. 9989. Heraklion, Crete, Greece: Springer International Publishing, 2016, pp. 342–353. doi: [10.1007/978-3-319-47602-5_48](https://link.springer.com/10.1007/978-3-319-47602-5_48).