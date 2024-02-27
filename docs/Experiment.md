---
layout: default
---
<center><h1> Perform on a Robot</h1></center>


  <p><font size=4>Try out how a robot would query the knowledge graph for action execution on the simulated robot in a jupyter notebook</font></p>
<font size=3>
  <label for="environment-options">Choose an Environemnt option:</label>
  <select name="environment-options" id="environment-options">
    <option value="environment:kitchen">Kitchen</option>
    <option value="environment:apartment">Apartment</option>
  </select>
  
  <label for="robot-options">for Robot:</label>
  <select name="robot-options" id="robot-options">
    <option value="robot:PR2">PR2</option>
  </select>
  </font>
  <!-- Define the links corresponding to each option -->
  <button type="button" onclick="navigateToSelectedOption()"> Run </button>
<br>
<body>
  <!-- Add this script section to your HTML -->
<script>
  function navigateToSelectedOption() {
    var selectedEnvironmentOption = document.getElementById("environment-options").value;
    var selectedRobotOption = document.getElementById("robot-options").value;

    // Define links based on the combination of selected options
    var links = {
      'environment:kitchen:robot:PR2': 'https://binder.intel4coro.de/v2/gh/sunava/pycram/6083d5a6c005a862a56bf60deefc13a615f89121?urlpath=lab%2Ftree%2Fdemos%2Fpycram_cutting_demo%2Fcutting-example.ipynb',
      'environment:apartment:robot:PR2': 'https://binder.intel4coro.de/v2/gh/sunava/pycram/6083d5a6c005a862a56bf60deefc13a615f89121?urlpath=lab%2Ftree%2Fdemos%2Fpycram_cutting_demo%2Fcutting-example.ipynb',
    };

    // Construct the key based on the selected options
    var selectedKey = selectedEnvironmentOption + ':' + selectedRobotOption;

    // Redirect to the selected link
    var selectedLink = links[selectedKey];
    if (selectedLink) {
      window.location.href = selectedLink;
    } else {
      alert("No link defined for the selected combination.");
    }
  }
</script>
</body>

# Experiment

<font size=3>We employ queries to evaluate the robot's performance on different *cutting* tasks.
These queries demonstrate how the robot dynamically adapts its task or behaviour based on acquired knowledge.
We utilise the PR2 Robot as the robotic platform for our experiments in a simulated environment called [PyBullet](https://github.com/bulletphysics/bullet3).
Since this environment does not support actions like peeling or core removal from a physical perspective, we focus on simulating queries that demonstrate how the general task mentioned **[here](https://food-ninja.github.io/FoodCutting/Architecture.html)** can be parameterised using the gathered **[web knowledge](https://food-ninja.github.io/FoodCutting/Knowledge.html)** from our knowledge graph.</font>

<p align="center" width="90%">
      <img width="30%" src="img/oneslice.png"/>
      <img width="30%" src="img/sclicing.png"/>
      <img width="30%" src="img/sqlcutcocu.png"/>
</p>

<font size=3>In this figure, you can see three different parameterisations for the same generalised plan:
The left picture shows the default implementation for *cutting*, where a single slice at the end of the cucumber is cut off.
In the middle, the task variation *slicing* is executed. Here, multiple cuts beginning at the end of the cucumber are performed to create multiple slices with similar length.
On the right, the task variation *halving* is shown. For this task, a single cut in the middle of the cucumber is done.</font>





[Back](./index.html)
