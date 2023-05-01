---
title: Mario Sprite Display
comments: true
layout: base
description: Use JavaScript without external libararies to display a Sprite.
permalink: /frontend/sprite
image: /images/mario_animation.png
categories: []
tags: [javascript]
animations:
  - id: rest
    row: 0
    col: 0
    frames: 15
  - id: restL
    row: -1
    col: 0
    frames: 15
  - id: walk
    row: -2
    col: 0
    frames: 8
  - id: tada
    row: -2
    col: 11
    frames: 3
  - id: walkL
    row: -3
    col: 0
    frames: 8
  - id: tadaL
    row: -3
    col: 11
    frames: 3
  - id: run1
    row: -4
    col: 0
    frames: 15
  - id: run1L
    row: -5
    col: 0
    frames: 15
  - id: run2
    row: -6
    col: 0
    frames: 15
  - id: run2L
    row: -7
    col: 0
    frames: 15
  - id: puff
    row: -8
    col: 0
    frames: 15
  - id: puffL
    row: -9
    col: 0
    frames: 15
  - id: cheer
    row: -10
    col: 0
    frames: 15
  - id: cheerL
    row: -11
    col: 0
    frames: 15
  - id: flip
    row: -12
    col: 0
    frames: 15
  - id: flipL
    row: -13
    col: 0
    frames: 15
---
{% include nav_frontend.html %}

{% comment %}
Sprite files are a collection of images that are combined into a single file 
{% endcomment %}
{% assign sprite_file = site.baseurl | append: page.image %}
{% assign pixels = 256 %}

<!---
This <div> class container contains <id>'s  "rest", "walk", "etc" generated from a Jekyll table.  The id attribute is used to identify a specific animation and is used by JavaScript to access and manipulate the element.
-->
<div class="container">
  {% comment %}
  This Liquid for loop is used to generate repeating HTML from Jekyll animations list
  {% endcomment %}
  {% for animation in page.animations %}  
    {% comment %}
    The cylcle tag is used to sequence four steps, works like modulo math, its purpose is to start and close row div's on every 4 times through the loop
    {% endcomment %}
    {% cycle '<div class="row"> <!--- cycle row start on 0 --->', '', '', '' %}  
    <div class="column"> 
      <!--- animate id, row and frames are passed to JavaScript onmouseover method--->
      <p id="{{animation.id}}" class="sprite" onmouseover="startAnimate('{{animation.id}}', ({{animation.row}} * {{pixels}}), {{animation.col}}, {{animation.frames}})" onmouseout="stopAnimate()"> </p>
    </div>
    {% cycle '', '', '', '</div> <!--- cycle row end on 4 --->' %}
  {% endfor %}
</div>

<!-- Embedded Cascading Style Sheet (CSS) rules, defines how HTML element look --->
<style>
  /* CSS style rules for the HTML elements, all share same .sprite properties
  */
  .sprite {
    height: {{pixels}}px;
    width: {{pixels}}px;
    background-image: url('{{ sprite_file }}');
    background-repeat: no-repeat;
    transform: scale(0.5);  /* How to adjust the display size of sprite frame in my HTML */
  }

  {% comment %}
  Liquid for loop is used to generate repeating CSS from Jekyll animations list
  {% endcomment %}
  {% for animation in page.animations %}
  #{{animation.id}} {
    /* calc of row and col is relative to frame in backgroud-image */
    background-position: 0px calc({{animation.row}} * {{pixels}} * 1px);
  }
  {% endfor %}

</style>

<!--- Embedded executable code--->
<script>
  var tID; //this variable used to capture setInterval() task ID
  const pixels = {{pixels}}; //pixel count of images in the sprite, set by liquid constant
  const interval = 100; //animation time interval

  function startAnimate(id, row, col, frames) {
      const start = pixels * col; //1st frame in series
      var frame = start;

      tID = setInterval ( () => { // task ID starts with animation interval
        // update backgroundPosition in DOM
        document.getElementById(id).style.backgroundPosition = `-${frame}px ${row}px`; //update animation frame
        frame += pixels;
        if (frame > (start + (frames * pixels))) {
          frame = start;
        }
      }
      , interval ); //time of interval
  }

  function stopAnimate() {  //stop animate task ID
    clearInterval(tID);
  } 
</script>
