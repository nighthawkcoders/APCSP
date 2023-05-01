---
title: Sprite Display
comments: true
layout: base
description: Use JavaScript without external libararies to display a Sprite.
permalink: /frontend/sprite
image: /images/calculator.png
categories: []
tags: [javascript]
animations:
  - id: rest
    row: 0
    frames: 15
  - id: restL
    row: -1
    frames: 15
  - id: walk
    row: -2
    frames: 8
  - id: walkL
    row: -3
    frames: 8
  - id: run1
    row: -4
    frames: 15
  - id: run1L
    row: -5
    frames: 15
  - id: run2
    row: -6
    frames: 15
  - id: run2L
    row: -7
    frames: 15
  - id: xxx
    row: -8
    frames: 15
  - id: xxxL
    row: -9
    frames: 15
  - id: yyy
    row: -10
    frames: 15
  - id: yyyL
    row: -11
    frames: 15
  - id: flip
    row: -12
    frames: 15
  - id: flipL
    row: -13
    frames: 15
---
{% include nav_frontend.html %}

{% comment %}
Sprite files are a collection of images that are combined into a single file 
{% endcomment %}
{% assign sprite_file = "images/mario_animation.png" %}
{% assign size = 256 %}

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
      <p id="{{animation.id}}" class="sprite" onmouseover="startAnimate('{{animation.id}}', ({{animation.row}} * {{size}}), {{animation.frames}})" onmouseout="stopAnimate()"> </p>
    </div>
    {% cycle '', '', '', '</div> <!--- cycle row end on 4 --->' %}
  {% endfor %}
</div>

<!-- Embedded Cascading Style Sheet (CSS) rules, defines how HTML element look --->
<style>
  /* CSS style rules for the HTML elements, all share same .sprite properties
  */
  .sprite {
    height: {{size}}px;
    width: {{size}}px;
    background-image: url('{{ site.baseurl }}/{{ sprite_file }}');
    background-repeat: no-repeat;
    transform: scale(0.5);  /* How to adjust the display size of sprite frame in my HTML */
  }

  {% comment %}
  Liquid for loop is used to generate repeating CSS from Jekyll animations list
  {% endcomment %}
  {% for animation in page.animations %}
  #{{animation.id}} {
    /* calc of row and offset is relative to frame in backgroud-image */
    background-position: 0px calc({{animation.row}} * {{size}} * 1px);
  }
  {% endfor %}

</style>

<!--- Embedded executable code--->
<script>
  var tID; //this variable used to capture setInterval() task ID
  const offset = {{size}}; //pixel offset of images in the sprite, set by liquid constant
  const interval = 100; //animation time interval

  function startAnimate(id, row, frames) {
      var frame = 0; //frame index in sprite

      tID = setInterval ( () => { // task ID starts with animation interval
        // update backgroundPosition in DOM

        document.getElementById(id).style.backgroundPosition = `-${frame}px ${row}px`; //update animation frame
        frame = (frame + offset) % (frames * offset);  //next frame, modulo math recycles frame index
      }
      , interval ); //time of interval
  }

  function stopAnimate() {  //stop animate task ID
    clearInterval(tID);
  } 
</script>
