---
title: "PyCRAM"
date: 2023-02-02T14:33:42-04:00
subtitle: ""
tags: ["Subsystem"]
dropCap: false
displayInMenu: false
displayInList: true
draft: false
resources:
- name: featuredImage
  src: "images/pycram_logo.png"
---

PyCRAM is the Python 3 re-implementation of [CRAM](https://cram-system.org/).
It is a toolbox for designing, implementing and deploying software on autonomous robots.

<div class="hidde-after-preview">
<a class="btn btn-primary" target="_blank" href="https://binder.intel4coro.de/v2/gh/IntEL4CoRo/pycram/binder-xpra?urlpath=lab%2Ftree%2Fexamples%2Faction_designator.ipynb%3Frobot%3Dpr2%26environment%3Dkitchen">Run Code</a>
<a class="btn btn-success" target="_blank" href="https://github.com/cram2/pycram">Source Code</a>
</div>

<!--more-->


The framework provides various tools for aiding in robot software
development as well as geometric reasoning and a fast simulation mechanisms to develop
cognition-enabled control programs that achieve high levels of robot autonomy.
Other features that PyCRAM provides are: a high-level abstraction mechanism, a
plan language to structure the execution of plans, mechanisms for robot independent
code, a variety of interfaces to control a real robot, etc.


Interactive Actions and/or Examples
---
If you want to see how PyCRAM is used you can take a look at examples of different
mechanisms [here](https://pycram.readthedocs.io/en/latest/examples.html).

To try out the examples yourself you need to [install](https://pycram.readthedocs.io/en/latest/installation.html)
PyCRAM, afterwards you can install and start Jupyter and try the [examples](https://github.com/cram2/pycram/tree/dev/examples).

<div>
<a class="btn btn-primary" target="_blank" href="https://binder.intel4coro.de/v2/gh/IntEL4CoRo/pycram/binder-xpra?urlpath=lab%2Ftree%2Fexamples%2Faction_designator.ipynb%3Frobot%3Dpr2%26environment%3Dkitchen">Run Code</a>
<a class="btn btn-success" target="_blank" href="https://github.com/cram2/pycram">Source Code</a>
</div>


Documentation
---

The general documentation of PyCRAM is in readthedocs [here](https://pycram.readthedocs.io/en/latest/index.html) and the
API documentation with more technical and detailed information can be found [here](https://pycram.readthedocs.io/en/latest/autoapi/index.html).


Screenshots
---

* A Pr2 robot executing a simple plan.
![A Pr2 robot executing a simple plan](images/pr2.gif)

* A distribution where the robot can be placed without colliding with the environment.
![A costmap of the environment](images/costmap.png)

* A task tree of a simple pick and place plan
![A costmap of the environment](images/tree.png)

