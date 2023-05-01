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
  - id: run
    row: -6
    frames: 15
  - id: runL
    row: -7
    frames: 15
  - id: flip
    row: -12
    frames: 15
  - id: flipL
    row: -13
    frames: 15
---
{% include nav_frontend.html %}

<!---
Sprite files are a collection of images that are combined into a single file 
-->
{% assign sprite_file = "images/mario_animation.png" %}
{% assign size = 256 %}

<!---
The <div> tag is used as a division for HTML elements.

This <div> class container contains <id>'s  "rest", "walk", "etc" from Jekyll front matter table.  The id attribute is used to point to a specific style declaration in a style sheet. It is used by JavaScript to access and manipulate the element with the specific id.
-->
<div class="container">
  <!-- This Liquid for loop is used to generate repeating HTML from Jekyll animations list -->
  {% for animation in page.animations %}  
    <!-- The cylcle tag is used to conditionally insert opening and closing div tags for the rows. The cycle goes through a sequence of four steps, like modulo math, to insert and close row <div>'s -->
    {% cycle '<div class="row"> <!--- cycle row start on 0 --->', '', '', '' %}
    <div class="column"> 
      <!--- id for sprite image, row and frames are passed to JavaScript method--->
      <p id="{{animation.id}}" class="sprite" onmouseover="startAnimate('{{animation.id}}', ({{animation.row}} * {{size}}), {{animation.frames}})" onmouseout="stopAnimate()"> </p>
    </div>
    {% cycle '', '', '', '</div> <!--- cycle row end on 4 --->' %}
  {% endfor %}
</div>

<!-- Embedded Cascading Style Sheet (CSS) rules, defines how HTML element look --->
<style>
  /* CSS style rules for the elements id's above...
    They all share same sprite properties
  */
  .sprite {
    height: {{size}}px;
    width: {{size}}px;
    background-image: url('{{ site.baseurl }}/{{ sprite_file }}');
    background-repeat: no-repeat;
    transform: scale(0.5);  /* How to adjust the display size of sprite frame in my HTML */
  }

  /* Liquid for loop is used to generate repeating CSS from Jekyll animations list */
  {% for animation in page.animations %}
  #{{animation.id}} {
    /* background starting images is calculated from animation table for sprite frame */
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
    } //end of startAnimate()

    function stopAnimate() {  //stop animate task ID
      clearInterval(tID);
    } 
</script>
