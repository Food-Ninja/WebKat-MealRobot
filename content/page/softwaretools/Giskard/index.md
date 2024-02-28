---
title: "Giskard"
date: 2023-11-03T10:35:35-05:00
subtitle: ""
tags: ["Subsystem"]
dropCap: false
displayInMenu: false
displayInList: true
draft: false
---

Giskard is an open source motion planning and control framework, which uses constraint and optimization based task space control to generate trajectories for the whole body of mobile manipulators.
It offers easy to use Python and ROS interfaces that facilitate the specification of constraints for the underlying optimization problem, which is solved for the instantaneous joint velocities of the robot.


<div class="hidde-after-preview">
<!-- <a class="btn btn-primary" target="_blank" href="">Run Code</a> -->
<a class="btn btn-success" target="_blank" href="https://github.com/SemRoCo/giskardpy">Source Code</a>
</div>

<!--more-->


Interactive Actions and/or Examples
---

<div>
<!-- <a class="btn btn-primary" target="_blank" href="">Run Code</a> -->
<a class="btn btn-success" target="_blank" href="https://github.com/SemRoCo/giskardpy">Source Code</a>
</div>
 

Description
---
Given a world model (i.e. the kinematic model of the robot (and the environment if available)) and a motion goal description, Giskard can produce a constraint and optimization-based task space controller tailored to the robot.
This controller can either be used to control the robot in a closed-loop fashion, or to generate a trajectory by running the controller in a simple kinematic simulation and integrating the generated velocities.

Giskard has predefined motion goals, such as Cartesian pose goals, pointing (with a camera), and collision avoidance.
These goals can be combined to define complex motions, such as “keeping the cup you are holding level while also driving to a target pose and avoiding collisions.”
Additionally, new motion goals can be implemented by defining scalar-valued task functions using the controllable and observable variables of the world model.

In most cases, the controllable variables are the joint position and velocity of the robot.
Giskard will turn these functions into a quadratic program.
Solving this returns the minimal velocity, acceleration and jerk for every joint that satisfy all constraint for the current time step and a specified prediction horizon.
The prediction horizon is used to ensure that the velocity of the current time step can always be regulated to zero during the specified time window.

Example Videos
---

<figure class="video_container">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/eClBmM-02Mo?si=DKTMslYiyGWDZj7L" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen="true"></iframe>
</figure>


Publications
---

- [S. Stelter, G. Bartels and M. Beetz, "An open-source motion planning framework for mobile manipulators using constraint-based task space control with linear MPC," 2022 IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS), Kyoto, Japan, 2022, pp. 1671-1678, doi: 10.1109/IROS47612.2022.9982245.](https://ieeexplore.ieee.org/document/9982245)


  


