---
layout: default
---

# Knowledge Engineering Methodology

To achieve our goal of creating an manipulation-focused ontology for flexible Everyday Tasks, we propose the following methodology:

<p align="center">
  <img src="img/Methodology.jpg" width="800" alt="Methodology Visualization"/><br>
</p>

## 1. Define necessary knowledge sources for the given task

In the first step, you need to collect all unstructured, semi-structured and structured knowledge sources that contain the information necessary to formally represent the manipulation action and the relevant objects.
We differ between four information categories, for which sources need to be provided:

**a) Action Execution**
These knowledge sources cover the rudimentary concepts necessary for the action execution of general manipulation tasks, covering environmental aspects like agents, objects, situations as well as temporal and physical aspects like trajectories or forces.
Situations define tasks already available and executable by the robot, thus serving as a foundation for the hierarchical representation of more complex tasks.

Examples for these sources contain KnowRob[^1], SOMA[^2] or PMK[^3].

**b) General Object Knowledge**
This kind of knowledge should deliver general information about existing objects and their usage, represented through the concepts *disposition* and *affordance*.
A *disposition* describes the property of an object, thereby enabling an agent to perform a certain task[^4] whereas an *affordance* describes what an object or the environment offers an agent[^5].

Examples for these sources contain SOMA[^2] or the FoodOntology[^6].

**c) Task-Specific Knowledge**
Knowledge about the specific task, consisting of object features and properties relevant for the current manipulation action, is included in these sources.
Due to the speciality of this knowledge, the sources need to be specific for the execution domain since general sources only offer a broad coverage that can not be translated into motions.
In comparison to the action execution knowledge, this knowledge must not yet be grounded and accessible by the robot.
By collecting and formalising task-specific knowledge, the robot can understand tasks by relating them to manipulated objects and their relevant properties.

Due to the lack of structured sources available, this knowledge is often created manually or extracted from unstructured sources.
Examples include [WikiHow](https://www.wikihow.com), Biology Textbooks[^7] or [Cooking videos](https://youtu.be/VjINuQX4hbM).

**d) Ontology Linking**
To simplify future steps where the knowledge from the previous sources needs to be linked through an ontology, structured knowledge sources for linking different ontologies need to be considered. 
This goal can be achieved either by searching for fitting upper ontologies or by re-using relations that are already available through other structured sources.

Examples include SUMO[^8] or DUL[^9].

## 2. Create a task hierarchy

In order for a robot to know how to perform a new task for which it has not been specifically trained, a task hierarchy is needed.
This hierarchy decomposes more complex tasks into corresponding subtasks the robot can carry out using known action parameters.
In this way, a network of related tasks emerges, referring to the same set of known subtasks.
    
For the task hierarchy, we distinguish between three kinds of tasks:
The **Atomic tasks** directly operate on the manipulation target to bring it from one state or shape into another.
We assume these atomic tasks to be already known and executable for the robot through the usage of the **Action Execution** knowledge sources described in the previous step.
The **Sequential tasks** are made up of two other tasks that are performed consecutively. 
These can be either type of task. 
Additionally, sequential tasks represent the possible starting points for robot manipulation. 
The **Implicit tasks** are created to achieve the hierarchical structure of the task definition and accomplish the sequential tasks but they do not resemble real-world instructions that would be executed directly.

For the concrete execution, every sequential task is broken down in a consecutive order of atomic tasks that is performed to achieve the goal of the sequential task.
This means that the robot does not have to actually learn and perform unknown tasks since these more complex tasks can be broken down into tasks that are already known.
Below you can find the example task hierarchy for the task of "Cutting an apple":

<p align="center" width="100%">
      <img width="60%" src="img/AppleHierarchy.png" alt="Task Hierarchy for 'Cutting an apple'"/>
      <img width="40%" src="img/HierarchyLegend.png" alt="Legend for the Task Hierarchy"/>
</p>

## 3. Define task-specific object knowledge

For the execution of unknown tasks, the relevant object features and properties need to be collected and formalised to semantically enhance the ontology. 
This knowledge includes everything influencing the task execution, like e.g. the existence of a fruit's core for *Cutting* or the weight of a bottle for *Pouring*.
In this step, this knowledge needs to be defined (*Which object properties are relevant?*), formalised (*How can these properties be represented in a structured way?*) and extracted for all specific objects (*What is the specific property value for an apple / cucumber / etc.?*). 
Since this knowledge is often not explicitly stated but found in unstructured source like written instructions or videos, it needs to be extracted either manually or through specialised automatic approaches.

## 4. Relate object knowledge to task execution

Once the task hierarchy is defined and the task-specific object knowledge is collected, both kinds of information need to be connected and integrated into the ontology. 
To do so, the conditions that are necessary for the different tasks to be performed need to be described using the previously identified object properties.
Since the created task hierarchies often are object-specific, the object properties that constitute differences in the task execution are connected to the tasks.
For example, if the robot wants to cut a fruit that has a peel, the task to remove it needs to be executed before additional cutting can be executed.

## 5. Link object and task knowledge to robot plan execution

Lastly, the created ontology needs to be connected to the cognitive architecture employed by the robot for task planning.
Additionally, the atomic tasks from the task hierarchy need to be mapped to the tasks already known by the robot, if not already done through the ontology linking. 
This is a crucial and difficult part for many cognitive architectures which can be simplified by using generalised plans such as in the CRAM cognitive architecture that is able to infer most action parameters during runtime and thus can deal with changing object positions, multiple similar objects and plan adaption. 
Similarly, the objects and their properties need to be grounded through the robot perception system.
This allows the robot to query the created ontology to gather the sequence of atomic manipulation tasks necessary to perform the unknown action on the perceived object in the current environment. 

[Back to the Overview](./)

## References

[^1]: M. Tenorth and M. Beetz, ‘KNOWROB - Knowledge Processing for Autonomous Personal Robots’, in 2009 IEEE/RSJ International Conference on Intelligent Robots and Systems, St. Louis, MO, USA, Oct. 2009, pp. 4261–4266. doi: [10.1109/IROS.2009.5354602](https://doi.org/10.1109/IROS.2009.5354602).
[^2]: D. Beßler et al., ‘Foundations of the Socio-physical Model of Activities (SOMA) for Autonomous Robotic Agents’, in Formal Ontology in Information Systems, vol. 344, IOS Press, 2022, pp. 159–174. Accessed: Jul. 25, 2022. doi: [10.3233/FAIA210379](https://doi.org/10.3233/FAIA210379).
[^3]: M. Diab, A. Akbari, M. Ud Din, and J. Rosell, ‘PMK—A Knowledge Processing Framework for Autonomous Robotics Perception and Manipulation’, Sensors, vol. 19, no. 5, p. 1166, Mar. 2019, doi: [10.3390/s19051166](https://doi.org/10.3390/s19051166).
[^4]: M. T. Turvey, ‘Ecological foundations of cognition: Invariants of perception and action.’, in Cognition: Conceptual and methodological issues., H. L. Pick, P. W. van den Broek, and D. C. Knill, Eds. Washington: American Psychological Association, 1992, pp. 85–117. doi: [10.1037/10564-004](https://doi.org/10.1037/10564-004).
[^5]: M. H. Bornstein and J. J. Gibson, ‘The Ecological Approach to Visual Perception’, The Journal of Aesthetics and Art Criticism, vol. 39, no. 2, p. 203, 1980, doi: [10.2307/429816](https://doi.org/10.2307/429816).
[^6]: D. M. Dooley et al., ‘FoodOn: a harmonized food ontology to increase global food traceability, quality control and data integration’, npj Sci Food, vol. 2, no. 1, Art. no. 1, Dec. 2018, doi: [10.1038/s41538-018-0032-6](https://doi.org/10.1038/s41538-018-0032-6).
[^7]: R. Crang, S. Lyons-Sobaski, and R. Wise, ‘Fruits, Seeds, and Seedlings’, in Plant Anatomy : A Concept-Based Approach to the Structure of Seed Plants, Cham: Springer International Publishing Imprint: Springer, 2018, pp. 649–678.
[^8]: I. Niles and A. Pease, ‘Towards a Standard Upper Ontology’, in Proceedings of the international conference on Formal Ontology in Information Systems  - FOIS ’01, Ogunquit, Maine, USA, 2001, vol. 2001, pp. 2–9. doi: [10.1145/505168.505170](https://doi.org/10.1145/505168.505170).
[^9]: V. Presutti and A. Gangemi, ‘Dolce+ D&S Ultralite and its main ontology design patterns’, in Ontology Engineering with Ontology Design Patterns: Foundations and Applications, P. Hitzler, A. Gangemi, K. Janowicz, A. Krisnadhi, and V. Presutti, Eds. AKA GmbH Berlin, 2016, pp. 81–103.