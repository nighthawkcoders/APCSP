---
title: Sprite Display
comments: true
layout: base
description: Use JavaScript without external libararies to display a Sprite.
permalink: /frontend/sprite
image: /images/calculator.png
categories: []
tags: [javascript]
---

{% include nav_frontend.html %}

<!---
Sprite files are a collection of images that are combined into a single file 
-->
{% assign sprite_file = "images/mario_animation.png" %}
{% assign size = 256 %}

<!---
The <div> tag is used as a division for HTML elements.

This <div> contains <id>'s  "rest", "walk", "etc".  The id attribute is used to point to a specific style declaration in a style sheet. It is also used by JavaScript to access and manipulate the element with the specific id.
-->
<div class="row">
  <div class="column">    
    <p id="rest" class="sprite" onmouseover="startAnimate('rest', 0, 15)" onmouseout="stopAnimate()"> </p>
  </div>
  <div class="column">    
    <p id="restL" class="sprite" onmouseover="startAnimate('restL', (-1 * {{size}}), 15)" onmouseout="stopAnimate()"> </p>
  </div>
  <div class="column">
    <p id="walk" class="sprite" onmouseover="startAnimate('walk', (-2 * {{size}}), 8)" onmouseout="stopAnimate()"> </p>
  </div>
  <div class="column">
    <p id="walkL" class="sprite" onmouseover="startAnimate('walkL', (-3 * {{size}}), 8)" onmouseout="stopAnimate()"> </p>
  </div>
</div>

<div class="row">
  <div class="column">
    <p id="run" class="sprite" onmouseover="startAnimate('run', (-6 * {{size}}), 15)" onmouseout="stopAnimate()"> </p>
  </div>
  <div class="column">
    <p id="runL" class="sprite" onmouseover="startAnimate('runL', (-7 * {{size}}), 15)" onmouseout="stopAnimate()"> </p>
  </div>
  <div class="column">
    <p id="flip" class="sprite" onmouseover="startAnimate('flip', (-12 * {{size}}), 15)" onmouseout="stopAnimate()"> </p>
  </div>
  <div class="column">
    <p id="flipL" class="sprite" onmouseover="startAnimate('flipL', (-13 * {{size}}), 15)" onmouseout="stopAnimate()"> </p>
  </div>
</div>

<!-- Embedded Cascading Style Sheet (CSS) rules, defines how HTML element look --->
<style>
  /* CSS style rules for the elements id's above...
    They all share same sprite properties
  */
  .sprite {
    height: {{size}}px;
    width: {{size}}px;
    background-image: url('{{site.baseurl}}/{{sprite_file}}');
    background-repeat: no-repeat;
    transform: scale(0.5);  /* How to adjust the display size of sprite frame in my HTML */
  }

  /* background position of element */
  #rest {
    background-position: 0px 0px);
  }

  #restL {
    background-position: 0px calc(-1 * {{size}} * 1px);
  }

  #walk {
    background-position: 0px calc(-2 * {{size}} * 1px);
  }

  #walkL {
    background-position: 0px calc(-3 * {{size}} * 1px);
  }

  #run {
    background-position: 0px calc(-6 * {{size}} * 1px);
  }

  #runL {
    background-position: 0px calc(-7 * {{size}} * 1px);
  }

  #flip {
    background-position: 0px calc(-12 * {{size}} * 1px);
  }

  #flipL {
    background-position: 0px calc(-13 * {{size}} * 1px);
  }

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
