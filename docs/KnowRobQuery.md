# Querying the Ontology using Prolog
All information in the stated ontology is accessible by the robot through queries at runtime. The action designator also uses Prolog as the inference engine to convert symbolic action descriptions into ROS action goals or similar data structures. Since the inference engine is already in Prolog, necessary information can be acquired through queries. This goes beyond the newest cutting action designator and is available in the open-source framework CRAM for all designators. 

A KnowRob package to query the ontology is available in <a href="https://github.com/Food-Ninja/knowrob_cutting">this github repo</a>

The package is documented but as a simple example of retrieving the pose needed for cutting (it only differentiates between slicing_position and halving_position, the robot can further infer the actual position according to this info), the position_to_be_used query can be called with the cutting action (here as an example "SOMA:'Cutting'") as input parameter and Pose as output parameter returns a slicing_position. 

```
?- position_to_be_used(SOMA:'Cutting',Pose).
Pose: slicing_position
```


The updated action designator for cutting (which includes the actions slicing and halving) can be found [in our repository](https://github.com/Food-Ninja/FoodCutting/blob/main/cutting_action_designator.lisp). This is just the specific designator part where parameters can be inferred. To see the full potential of the generlized action designators please visit the [CRAM website](https://cram-system.org/). 

For example, a robot would query for the arm to use for action execution to then infer the action parameter as in the following:

```bash
 ;; infer information which robot arm to use either internally or query ontology
    (-> (spec:property ?action-designator (:arm ?arm))
        (true)
        (man-int:robot-free-hand ?_ ?arm))
        
 ;; infer information which robot trajectory to use either internally or query ontology
    (-> (equal ?arm :left)
        (and (lisp-fun man-int:get-action-trajectory :slicing ?arm ?grasp T ?objects
                       ?left-slicing-pose)
             (lisp-fun man-int:get-traj-poses-by-label ?left-slicing-pose :slice-up
                       ?left-slice-up-poses)
             (lisp-fun man-int:get-traj-poses-by-label ?left-slicing-pose :slice-down
                       ?left-slice-down-poses))
        (and (equal ?left-slice-up-poses NIL)
             (equal ?left-slice-down-poses NIL)))
 ```
