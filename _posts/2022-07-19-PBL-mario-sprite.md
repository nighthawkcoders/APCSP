---
title: Mario Sprite Sheet
comments: true
layout: base
description: Use JavaScript without external libararies to display all the animations in a sprite sheet.
permalink: /frontend/mario
image: /images/mario_animation.png
categories: []
tags: [javascript]
---
<!-- Hack 1: find your own sprite -->
<!-- Hack 2: make you own sprite display -->
<!-- Hack 3: come up with a new event or sequence, reference: https://developer.mozilla.org/en-US/docs/Web/API/Element/mousedown_event-->

{% include nav_frontend.html %}

<!---
Sprite files are a collection of animations that are combined into a single file. The _data/mario.yml file has metadata description for the sprit file.  Each sprite is seperated by pixels horizontally and veritically.
-->
{% assign sprite_file = site.baseurl | append: page.image %}  <!--- Liquid concatentation --->
{% assign hash = site.data.mario_metadata %}  <!--- Liquid list variable created from file containing mario metatdata for sprite--->
{% assign pixels = 256 %} <!--- Liquid integer assignment --->

<!---
This <div> class "container" has rows and columns.  Each row/col is a frame and has metadata like ID (rest, walk, etc), a default image, and an animation sequence triggered by mouse over.
-->
<div class="container">
  <!---
  Loop over the 'hash' list to generate repeating HTML lines for animations.
  -->
  {% for key in hash %}
    <!--- 
    Assign the key of the animation to the 'id' variable to be used as the HTML id 
    --->
    {% assign id = key | first %} 
    <!---
    The Liquid cylcle tag is used to sequence four steps, works like modulo, its purpose is to start and close row div's on every 4 iterations through the loop
    -->
    {% cycle '<div class="row"> <!--- cycle row start on 0 --->', '', '', '' %}  
    <div class="column"> 
      <!--- The HTML <p> tags are created for each animation described in metadata
      Display: Inner HTML contains ID, corresponding CSS contains 1st frame from animation series 
      Action: animate id, row and col are passed to JavaScript startAnimate() on onmouseover action
      --->
      <p class="sprite" id="{{id}}" onmousedown="startAnimate('{{id}}', ({{key.row}} * {{pixels}}), ({{key.col}} * {{pixels}}), {{key.frames}})" onmouseover="stopAnimate('{{id}}')">{{id}}</p>
    </div>
    {% cycle '', '', '', '</div> <!--- cycle row end on 4 --->' %}
  {% endfor %}
</div>

<!-- Embedded Cascading Style Sheet (CSS) rules, defines how HTML element visualized --->
<style>
  /* CSS style rules for coresponding <p> tag HTML elements
    Background: .sprite has url reference to sprite file, pixel height and width of frames
    #{{id[0]}}: row/col position of id in sprite file
    Transform: allows HTML display to be scaled
    Text: contains properties for title
  */
  .sprite {
    background-image: url('{{ sprite_file }}');
    background-repeat: no-repeat;
    height: {{pixels}}px;
    width: {{pixels}}px;
    transform: scale(0.5);  /* scales the display size of sprite frame in HTML */
    font-size: 2em;
    text-align: center;
  }

  /* Liquid for loop is used to generate CSS from Jekyll animations list
     ID: #id[0] associate this CSS with id=id[0] in HTML
     Col, Row: background-position position of frame in sprite
  */
  {% for key in hash %}
    {% assign id = key | first %}

    #{{id}} {
    /*
      Formula:  calculates row and col location in the .sprite backgroud-image
      Pixels: columns and rows are a block of pixels (col * pixels)  or (row * pixels)
      Offset: "-1px" negative sign is used to indicate the offset direction with background
    */
    background-position: calc({{key.col}} * {{pixels}} * -1px) calc({{key.row}} * {{pixels}} * -1px);
  }
  {% endfor %}

</style>

<!--- Embedded executable code--->
<script>
  var intervalIDs = {}; // Object to store interval IDs
  const pixels = {{pixels}}; //size of each frame in the sprite, set by liquid constant
  const interval = 100; //animation time interval

  function startAnimate(id, row, col1, frames) {
      var col = col1;  //start at 1st column/frame in series of frames
      
      // Use the animation ID as the key for storing the interval ID
      intervalIDs[id] = setInterval ( () => {
        /* Each pass set the CSS backgroundPosition property to point to next background frame
         * Formula: row stays the same, but column is mutated "+ pixels" each interval
         * Modulo Operator: frames * pixels is upper bound
         *                  col + pixels is increment
         *                  remainder is the col position
         * Offset: "col1" is offset of 1st image in series, col1 can start in middle of page
        */
        document.getElementById(id).style.backgroundPosition = `-${col}px -${row}px`;
        col -= col1; // remove 1st frame offset, temporarily
        col = (col + pixels) % (frames * pixels);  // use modulo operator to cycle through sequence
        col += col1; // restore 1st frame offset
      }
      , interval ); //time of interval
  }

  function stopAnimate(id) {  //stop animate task ID
    clearInterval(intervalIDs[id]);
  } 
</script>
