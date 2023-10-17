# Querying food cutting knowledge using Prolog
All information in the stated ontology is accessible by the robot through queries at runtime. The action designator also uses Prolog as the inference engine to convert symbolic action descriptions into ROS action goals or similar data structures. Since the inference engine is already in Prolog, necessary information can be acquired through queries. This goes beyond the newest cutting action designator and is available in the open-source framework CRAM for all designators. 

A KnowRob package to query the ontology is available in <a href="https://github.com/Food-Ninja/knowrob_cutting">this github repo</a>

The package is documented but as a simple example of retrieving the pose needed for cutting (it only differentiates between slicing_position and halving_position, the robot can further infer the actual position according to this info), the position_to_be_used query can be called with the cutting action (here as an example "SOMA:'Cutting'") as input parameter and Pose as output parameter returns a slicing_position. 

```
?- position_to_be_used(SOMA:'Cutting',Pose).
Pose: slicing_position
```
