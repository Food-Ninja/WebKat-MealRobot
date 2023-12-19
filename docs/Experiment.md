---
layout: default
---

# Experiment

We employ queries to evaluate the robot's performance on different *cutting* tasks.
These queries demonstrate how the robot dynamically adapts its task or behaviour based on acquired knowledge.
We utilise the PR2 Robot as the robotic platform for our experiments in a simulated environment called [PyBullet](https://github.com/bulletphysics/bullet3).
Since this environment does not support actions like peeling or core removal from a physical perspective, we focus on simulating queries that demonstrate how the general task mentioned **[here](https://food-ninja.github.io/FoodCutting/Architecture.html)** can be parameterised using the gathered **[web knowledge](https://food-ninja.github.io/FoodCutting/Knowledge.html)** from our knowledge graph.

<p align="center" width="90%">
      <img width="30%" src="img/oneslice.png"/>
      <img width="30%" src="img/sclicing.png"/>
      <img width="30%" src="img/sqlcutcocu.png"/>
</p>

In this figure, you can see three different parameterisations for the same generalised plan:
The left picture shows the default implementation for *cutting*, where a single slice at the end of the cucumber is cut off.
In the middle, the task variation *slicing* is executed. Here, multiple cuts beginning at the end of the cucumber are performed to create multiple slices with similar length.
On the right, the task variation *halving* is shown. For this task, a single cut in the middle of the cucumber is done.



Interactive Actions and/or Examples
---

{{<action_form data="ActionButtons">}}



Software Components
---
---
title: "Researcher's workbench for Household Robotics"
date: 2023-10-03T10:35:35-05:00
subtitle: "Household Robotics Workbench."
tags: ["Research"]
dropCap: false
displayInMenu: false
displayInList: true
draft: false
resources:
- name: ActionButtons
  src: "buttons.json"
---

This project deals with the problem of teaching robots how to execute unknown tasks in the household domain.

<param class="hidde-after-preview">
{{<action_form data="ActionButtons">}}

<!--more-->



Interactive Actions and/or Examples
---

{{<action_form data="ActionButtons">}}


<div>
<a class="btn btn-primary" disabled target="_blank">Run Simulation</a>
<a class="btn btn-primary" target="_blank" href="https://binder.intel4coro.de/v2/gh/Food-Ninja/FoodCutting.git/HEAD?urlpath=notebooks%2Fnotebooks%2FFoodCuttingQueries.ipynb">Inspect Knowledge Graph</a>
<a class="btn btn-success" target="_blank" href="https://github.com/Food-Ninja/FoodCutting">Source Code</a>
</div>

[Back](./index.html)
