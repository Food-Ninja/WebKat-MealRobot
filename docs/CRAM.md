---
layout: default
---

# Linking to [CRAM](https://cram-system.org/)[^1]

As explained in [Step 5](./Methodology.html) of our methodology, we link the created knowledge graph to a cognitive architecture capable of executing manipulation tasks.
We use the CRAM cognitive architecture, which depends on so called designators written in Common LISP to represent actions, locations or objects.
In general, a designator functions as a placeholder for information that is yet to be determined.
As an example, an excerpt from the designator for cutting food is shown below:

```LISP
(perform
	(an action
		(type :cutting)
		(?object acted on (an object (type :food) (pose ...) ...))
		(?object (an object (type :tool) (pose ...) ...))
		(?arm (a body part (type :arm) (pose ...) ...))
		(?arm (a body part (type :arm) (pose (on :food)) ...))
		(?goal (:success (:cutting (on :food))))))
```
 
For the execution, several parameters (represented as Prolog variables symbolized by the *?*) need to be specified, which includes here the *object acted on*, *object to use as a tool*, *left arm*, *right arm* and the *goal*.
During the execution, these parameters are erved with information [queried from the ontology](./OntologyQuery.html) based on the current execution context.
In order to access data from the ontology, the data is imported into KnowRob[^2] and MongoDB.

For the specific task at hand, the intended target object is an apple, the tool to use is a knife, the left arm holds the apple in place and the right arm holds the knife.
Finally, the goal is considered as reached when the robot successfully executes the action with the body parts returning to their initial positions and the apple being transformed into two distinct halves.

[Back to the Overview](./)

## References

[^1]: M. Beetz, L. Mösenlechner, and M. Tenorth, ‘CRAM - A Cognitive Robot Abstract Machine for Everyday Manipulation in Human Environments’, in Proceedings of the 2nd IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS 2010), R. C. Luo and H. Asama, Eds., Taipei, Taiwan: IEEE, 2010, pp. 1012–1017. doi: [10.1109/IROS.2010.5650146](https://ieeexplore.ieee.org/document/5650146).
[^2]: M. Tenorth and M. Beetz, ‘KNOWROB - Knowledge Processing for Autonomous Personal Robots’, in 2009 IEEE/RSJ International Conference on Intelligent Robots and Systems, St. Louis, MO, USA: IEEE, Oct. 2009, pp. 4261–4266. doi: [10.1109/IROS.2009.5354602](https://ieeexplore.ieee.org/document/5354602).