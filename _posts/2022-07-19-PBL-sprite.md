---
title: Mario Sprite Sheet
comments: true
layout: base
description: Use JavaScript without external libararies to display all the animations in a sprite sheet.
permalink: /frontend/sprite
image: /images/mario_animation.png
categories: []
tags: [javascript]
---
{% include nav_frontend.html %}

<!---
Sprite files are a collection of animations that are combined into a single file. The _data/mario.yml file has metadata description for the sprit file.  Each sprite is seperated by pixels horizontally and veritically.
-->
{% assign sprite_file = site.baseurl | append: page.image %}  <!--- Liquid concatentation --->
{% assign animations = site.data.mario %}  <!--- Liquid list variable created from file containing metatdata --->
{% assign pixels = 256 %} <!--- Liquid integer assignment --->

<!---
This <div> class "container" has rows and columns.  Each row/col is a frame and has metadata like ID (rest, walk, etc), a default image, and an animation sequence triggered by mouse over.
-->
<div class="container">
  <!---
  This Liquid for loop is used to generate repeating HTML lines from Jekyll animations list
  -->
  {% for animation in animations %}  
    <!---
    The Liquid cylcle tag is used to sequence four steps, works like modulo, its purpose is to start and close row div's on every 4 iterations through the loop
    -->
    {% cycle '<div class="row"> <!--- cycle row start on 0 --->', '', '', '' %}  
    <div class="column"> 
      <!--- The HTML <p> tags are created for each animation described in metadata
      Display: Inner HTML contains ID, corresponding CSS contains 1st frame from animation series 
      Action: animate id, row and col are passed to JavaScript startAnimate() on onmouseover action
      --->
      <p class="sprite" id="{{animation.id}}" onmouseover="startAnimate('{{animation.id}}', ({{animation.row}} * {{pixels}}), ({{animation.col}} * {{pixels}}), {{animation.frames}})" onmouseout="stopAnimate()">{{animation.id}}</p>
    </div>
    {% cycle '', '', '', '</div> <!--- cycle row end on 4 --->' %}
  {% endfor %}
</div>

<!-- Embedded Cascading Style Sheet (CSS) rules, defines how HTML element visualized --->
<style>
  /* CSS style rules for coresponding <p> tag HTML elements
    Background: .sprite has url reference to sprite file, pixel height and width of frames
    #{{animation.id}}: row/col position of animation in sprite file
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
     ID: #animation.id associate this CSS with id=animation.id in HTML
     Col, Row: background-position position of frame in sprite
  */
  {% for animation in page.animations %}
  #{{animation.id}} {
    /*
      Formula:  calculates row and col location in the .sprite backgroud-image
      Pixels: columns and rows are a block of pixels (col * pixels)  or (row * pixels)
      Offset: "-1px" negative sign is used to indicate the offset direction with background
    */
    background-position: calc({{animation.col}} * {{pixels}} * -1px) calc({{animation.row}} * {{pixels}} * -1px);
  }
  {% endfor %}

</style>

<!--- Embedded executable code--->
<script>
  var tID; //this variable used to capture setInterval() task ID
  const pixels = {{pixels}}; //size of each frame in the sprite, set by liquid constant
  const interval = 100; //animation time interval

  function startAnimate(id, row, col1, frames) {
      var col = col1;  //start at 1st column/frame in series of frames

      tID = setInterval ( () => { // task ID is stored to allow animation interval to be stopped
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

  function stopAnimate() {  //stop animate task ID
    clearInterval(tID);
  } 
</script>
