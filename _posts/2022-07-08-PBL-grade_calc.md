---
title: Grade Calculator
layout: default
description: Supports grade inputs and calculates average. 
permalink: /frontend/grades
image: /images/grade_calc.png
categories: [2.C]
tags: [javascript, html, input, onblur]
week: 10
type: pbl
---

<!-- For hacks take inspiration form here: https://www.rapidtables.com/calc/grade/grade-calculator.html -->
<!-- Hack 1: change control flow to enable editing of previous element -->
<!-- Hack 2: build a title for each score -->

{% include nav_frontend.html %}

<div class="container bg-primary">
    <header class="pb-3 mb-4 border-bottom border-primary text-dark">
        <span class="fs-4">Grade Calculator</span>
    </header>
    <form>
        <!-- Totals -->
        <div class="form-group row">
            Total : <span id="total" class="label label-primary">0.0</span>
            Count : <span id="count" class="label label-primary">0.0</span>
            Average : <span id="average" class="label label-primary">0.0</span>
        </div>
        <!-- Rows -->
        <div class="form-group row">
            Input scores, press tab to add new number:
            <div id="scores">
                <input onblur="calculator()" type="text" name="score" id="score0"/><br>
                <!-- javascript generated inputs -->
            </div>
        </div>
    </form>
</div>

<script>
    const scoresContainer = document.getElementById("scores");

    // Creates new input line
    function newInputLine(index) {
        // Prepare new input line
        var input = document.createElement("input");  // input element
        var br = document.createElement("br");  // line break element
        // Setup input line attributes
        input.setAttribute('onblur', "calculator()");
        input.setAttribute('type', "text");
        input.setAttribute('name', "score");
        input.setAttribute('id', "score" + index);
        // Add input and line break to page
        scoresContainer.appendChild(input);
        scoresContainer.appendChild(br);
    }

    // Calculates totals
    function calculator(){
        var array = document.getElementsByName('score'); // setup array of scores
        if (array[array.length-1].value.length != 0) {   // input cell has a value
            // algorithm to calculate results
            var total = 0;  // running total
            for(var i = 0; i < array.length; i++){  // iterate through array
                if(parseFloat(array[i].value))  // convert to float
                    total += parseFloat(array[i].value);  // add to running total
            }
            // update totals
            document.getElementById('total').innerHTML = total.toFixed(2);
            document.getElementById('count').innerHTML = array.length;
            document.getElementById('average').innerHTML = (total / array.length).toFixed(2);
            // make a new input line
            newInputLine(array.length);
            
        }
        // Set cursor focus on last element; this could be new or unchanged element
        document.getElementById("score" + (array.length-1)).focus();
    }

</script>