---
title: Mario Sprite Sheet
comments: true
layout: base
description: Use JavaScript without external libararies to display all the animations in a sprite sheet.
permalink: /frontend/sprite
image: /images/mario_animation.png
categories: []
tags: [javascript]
# "animations" is array of objects (key, values), that describe a series of frames in a sprite sheet.
animations:
  - id: Rest
    row: 0
    col: 0
    frames: 15
  - id: RestL
    row: 1
    col: 0
    frames: 15
  - id: Walk
    row: 2
    col: 0
    frames: 8
  - id: Tada
    row: 2
    col: 11
    frames: 3
  - id: WalkL
    row: 3
    col: 0
    frames: 8
  - id: TadaL
    row: 3
    col: 11
    frames: 3
  - id: Run1
    row: 4
    col: 0
    frames: 15
  - id: Run1L
    row: 5
    col: 0
    frames: 15
  - id: Run2
    row: 6
    col: 0
    frames: 15
  - id: Run2L
    row: 7
    col: 0
    frames: 15
  - id: Puff
    row: 8
    col: 0
    frames: 15
  - id: PuffL
    row: 9
    col: 0
    frames: 15
  - id: Cheer
    row: 10
    col: 0
    frames: 15
  - id: CheerL
    row: 11
    col: 0
    frames: 15
  - id: Flip
    row: 12
    col: 0
    frames: 15
  - id: FlipL
    row: 13
    col: 0
    frames: 15
---
{% include nav_frontend.html %}

{% comment %}
Sprite files are a collection of animations that are combined into a single file 
{% endcomment %}
{% assign sprite_file = site.baseurl | append: page.image %}
{% assign pixels = 256 %}

<!---
This <div> class container contains <id>'s  "rest", "walk", "etc" generated from a Jekyll table.  The id attribute is used to identify a specific animation and is used by JavaScript to access and manipulate the element.
-->
<div class="container">
  {% comment %}
  This Liquid for loop is used to generate repeating HTML lines from Jekyll animations list
  {% endcomment %}
  {% for animation in page.animations %}  
    {% comment %}
    The cylcle tag is used to sequence four steps, works like modulo, its purpose is to start and close row div's on every 4 iterations through the loop
    {% endcomment %}
    {% cycle '<div class="row"> <!--- cycle row start on 0 --->', '', '', '' %}  
    <div class="column"> 
      <!--- <p> tags are created for each animation described in page.animations
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

  {% comment %}
  Liquid for loop is used to generate repeating CSS from Jekyll animations list
  {% endcomment %}
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