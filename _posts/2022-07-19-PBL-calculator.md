---
title: Calculator Starters
comments: true
layout: default
description: A common way to become familiar with a language is to build a calculator.  This calculator shows off button with actions.
permalink: /frontend/calculator
image: /images/calculator.png
categories: [2.C, C7.0]
tags: [javascript, css. dom, getElementID]
---

{% include nav_frontend.html %}
<!-- Hack 1: Test conditions on small and big numbers, report on findings -->
<!-- Hack 2: Add a common math operation that is missing from calculator -->
<!-- Hack 3: Implement 1 number operation (ie SQRT) -->

<!-- Style (CSS) implementation of the calculator. -->
<style>
/* class to create the calculator's container; uses CSS grid dsiplay to partition off buttons */
.calculator-container { 
    width: 90vw; /* this width and height is specified for mobile devices by default */
    height: 80vh;
    margin: 0 auto;

    display: grid;
    grid-template-columns: repeat(4, 1fr); /* fr is a special unit; learn more here: https://css-tricks.com/introduction-fr-css-unit/  */
    grid-template-rows: 0.5fr repeat(4, 1fr);
    gap: 10px 10px;
}

/* 
    CSS allows programmers to use media queries to change the size of classes based on the size of the device.
    This allows us to make it so that our website looks good on both mobile and desktop. If the width of the
    device is big enough, then the calculator will take up more of the screen.
*/
@media (min-width: 600px) { 
    .calculator-container {
        width: 40vw;
        height: 80vh;
    }
}

/* styling for the calculator buttons themselves */
.calculator-button {
    width: auto;
    height: auto;
    border-radius: 10px;
    background-color: #665B45;
    border: 3px solid black;
    font-size: 1.5em;

    display: flex;
    justify-content: center;
    align-items: center;

    /* grid display allows programmer to specify how much of the grid an element should take up; these buttons will take up 1 row and 1 column */
    grid-column: span 1;
    grid-row: span 1;

    /* allows for smooth transition of properties and the "animation" effect to appear on hover */
    transition: all 0.5s; 
}

/* darkens the background color on hover to create a selecting effect */
.calculator-button:hover {
    background-color: #373737;
}

/* styling for the top bar which shows the results of the calculator */
.calculator-output {
    /* note how the output instead takes up 4 columns and 1 row; essentially takes up the entirety of the first row */
    grid-column: span 4;
    grid-row: span 1;

    border-radius: 10px;
    padding: 1em;
    font-size: auto;
    border: 5px solid black;

    display: flex;
    align-items: center;
}
</style>


<!-- HTML implementation of the calculator. 
    CSS sets 4 buttons (calculator-button) to a row
    All buttons have onclick JavaScript action
    All actions result in calculator-output.innerHTML change
-->
<div class="calculator-container">
    <!--result-->
    <div class="calculator-output" id="output">0</div>
    <!--row 1-->
    <div class="calculator-button" onclick="number('1')">1</div>
    <div class="calculator-button" onclick="number('2')">2</div>
    <div class="calculator-button" onclick="number('3')">3</div>
    <div class="calculator-button" onclick="operation('+')">+</div>
    <!--row 2-->
    <div class="calculator-button" onclick="number('4')">4</div>
    <div class="calculator-button" onclick="number('5')">5</div>
    <div class="calculator-button" onclick="number('6')">6</div>
    <div class="calculator-button" onclick="operation('-')">-</div>
    <!--row 3-->
    <div class="calculator-button" onclick="number('7')">7</div>
    <div class="calculator-button" onclick="number('8')">8</div>
    <div class="calculator-button" onclick="number('9')">9</div>
    <div class="calculator-button" onclick="operation('*')">*</div>
    <!--row 4-->
    <div class="calculator-button" onclick="clearCalc()">A/C</div>
    <div class="calculator-button" onclick="number('0')">0</div>
    <div class="calculator-button" onclick="number('.')">.</div>
    <div class="calculator-button" onclick="equals()">=</div>
</div>


<!-- JavaScript (JS) implementation of the calculator. -->
<script>
// initialize important variables
let output = document.getElementById("output");
let operator = null;
let firstNumber = null;
let nextReady = true;

// Number action
function number (value) { // function to input numbers into the calculator
    if (value != ".") {
        if (nextReady == true) { // nextReady is used to tell the computer when the user is going to input a completely new number
            output.innerHTML = value;
            if (value != "0") { // if statement to ensure that there are no multiple leading zeroes
                nextReady = false;
            }
        } else {
            output.innerHTML = output.innerHTML + value; // concatenation is used to add the numbers to the end of the input
        }
    } else { // special case for adding a decimal; can't have two decimals
        if (output.innerHTML.indexOf(".") == -1) {
            output.innerHTML = output.innerHTML + value;
            nextReady = false;
        }
    }
}

// Operator action
function operation (choice) { // function to input operations into the calculator
    if (firstNumber == null) { // once the operation is chosen, the displayed number is stored into the variable firstNumber
        firstNumber = parseInt(output.innerHTML);
        nextReady = true;
        operator = choice;
        return; // exits function
    }
    // occurs if there is already a number stored in the calculator
    firstNumber = calculate(firstNumber, parseFloat(output.innerHTML)); 
    operator = choice;
    output.innerHTML = firstNumber.toString();
    nextReady = true;
}

// Calculator
function calculate (first, second) { // function to calculate the result of the equation
    let result = 0;
    switch (operator) {
        case "+":
            result = first + second;
            break;
        case "-":
            result = first - second;
            break;
        case "*":
            result = first * second;
            break;
        case "/":
            result = first / second;
            break;
        default: 
            break;
    }
    return result;
}

// Equal action
function equals () { // function used when the equals button is clicked; calculates equation and displays it
    firstNumber = calculate(firstNumber, parseFloat(output.innerHTML));
    output.innerHTML = firstNumber.toString();
    nextReady = true;
}

// A/C action
function clearCalc () { // clears calculator
    firstNumber = null;
    output.innerHTML = "0";
    nextReady = true;
}
</script>