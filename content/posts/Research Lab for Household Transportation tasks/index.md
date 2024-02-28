---
title: "Research Lab for Household Transportation tasks"
date: 2023-12-01T10:35:35-05:00
subtitle: ""
tags: ["Research"]
dropCap: false
displayInMenu: false
displayInList: true
draft: false
resources:
- name: ActionButtons
  src: "buttons.json"
---

In the research lab you have access to and can experiment with generalized robot plans for transporting objects within man-made human living and working environments, including apartments and retail stores. The generalized robot plan controls different robots transporting a variety of objects in different environments for different purposes in different contexts.

<param class="hidde-after-preview">
{{<action_forms data="ActionButtons">}}

<!--more-->


![](https://iris.informatik.uni-bremen.de/textbook/content/picking_up_actions.png)

***"The EASE household challenge is subject of the IEEE spectrum article 'It's (Still) Really Hard for Robots to Autonomously Do Household Chores'"*** by Evan Ackerman (IEEE Spectrum, 17.06.2021)


Interactive Actions and/or Examples
---

{{<action_forms data="ActionButtons">}}


Description
---

Every time we think that we're getting a little bit closer to a household robot, new research comes out showing just how far we have to go. Certainly, we’ve seen lots of progress in specific areas like grasping and semantic understanding and whatnot, but putting it all together into a hardware platform that can actually get stuff done autonomously still seems quite a way off.

In a paper presented at ICRA 2021, researchers from the University of Bremen conducted a “Robot Household Marathon Experiment,” where a PR2 robot was tasked with first setting a table for a simple breakfast and then cleaning up afterwards in order to “investigate and evaluate the scalability and the robustness aspects of mobile manipulation.” While this sort of thing kinda seems like something robots should have figured out, it may not surprise you to learn that it's actually still a significant challenge.


Example Videos
---

<figure class="video_container">
  <iframe width="100%" height="360" src="https://www.youtube.com/embed/pv_n9FQRoZQ?si=j3CB2Sj4itd_1qlC" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen="true"></iframe>
</figure>


Publications
---

- [Gayane Kazhoyan, Simon Stelter, Franklin Kenghagho Kenfack, Sebastian Koralewski and Michael Beetz, "The Robot Household Marathon Experiment", In IEEE International Conference on Robotics and Automation (ICRA), 2021, doi: 10.48550/arXiv.2011.09792](https://arxiv.org/abs/2011.09792)

- [Gayane Kazhoyan, Arthur Niedzwiecki and Michael Beetz, "Towards Plan Transformations for Real-World Mobile Fetch and Place," 2020 IEEE International Conference on Robotics and Automation (ICRA), Paris, France, 2020, pp. 11011-11017, doi: 10.1109/ICRA40945.2020.9197446](https://ieeexplore.ieee.org/document/9197446)\


Software Components
---

- ### [CRAM <img class="sc-image" src="https://ai.uni-bremen.de/_media/team/cramlogocropped.png" height=50>](https://cram-system.org/)
  is a software toolbox for the implementation of autonomous robots.\
  [<img class="sc-image" src="https://iris.informatik.uni-bremen.de/images/github.svg" height=10> source code](https://github.com/cram2/cram)
  
- ### [KnowRob <img class="sc-image" src="https://ai.uni-bremen.de/_media/projects/knowrob.png" height=60>](https://www.knowrob.org/)
  is a knowledge processing system for robots.\
  [<img class="sc-image" src="https://iris.informatik.uni-bremen.de/images/github.svg" height=10> source code](https://github.com/knowrob/knowrob)

- ### [OpenEASE <img class="sc-image" src="https://ai.uni-bremen.de/_media/team/oe-logo2.png" height=50>](http://www.open-ease.org/)
  is a web-based knowledge service providing robot and human activity data.\
  [<img class="sc-image" src="https://iris.informatik.uni-bremen.de/images/github.svg" height=10> source code](https://github.com/ease-crc/openease)

- ### [GISKARD <img class="sc-image" src="https://ai.uni-bremen.de/_media/team/giskard_logo_tmp.png" height=20>](https://github.com/SemRoCo/giskardpy)
  is a framework for constraint- and optimization-based robot motion and planning control.\
  [<img class="sc-image" src="https://iris.informatik.uni-bremen.de/images/github.svg" height=10> source code](https://github.com/SemRoCo/giskardpy)

- ### [ROBOKUDO <img class="sc-image" src="https://ai.uni-bremen.de/_media/team/rk_logo_v3-300px.png" height=25>](https://robokudo.ai.uni-bremen.de/)
  is a perception framework targeted for robot manipulation tasks.\
  [<img class="sc-image" src="https://iris.informatik.uni-bremen.de/images/github.svg" height=10> source code](https://gitlab.informatik.uni-bremen.de/robokudo/robokudo)

- ### [PyCRAM <img class="sc-image" src="https://pycram.readthedocs.io/en/latest/_images/pycram_logo.png" height=50>](https://pycram.readthedocs.io/en/latest/index.html)
  is the Python 3 re-implementation of [CRAM](https://cram-system.org/). [PyCRAM](https://pycram.readthedocs.io/en/latest/index.html) is a toolbox for designing, implementing and deploying software on autonomous robots.\
  [<img class="sc-image" src="https://iris.informatik.uni-bremen.de/images/github.svg" height=10> source code](https://github.com/cram2/pycram)


Courses and/or Turorial
---

- ### Courses:

  + ##### [Integrated Intelligent Systems](https://ai.uni-bremen.de/teaching/le-iis-ws23)
    This lecture covers contemporary techniques of AI in cognitive robotics.

  + ##### [Robot Programming with ROS](https://ai.uni-bremen.de/teaching/cs-ros-ws23)
    Getting into the Robot Operating System ROS is a steptone for future roboticists.

  + ##### [SUTURO - sudo tidy-up-my-room](https://ai.uni-bremen.de/teaching/pr-suturo-ws23)
    Students in this project design their own application to run on a real robot.


- ### Tutorials:

  + ##### [CRAM Plan Executive](https://cram-system.org/tutorials)
    Check out the online hands-on tutorials on the CRAM plan executive.

