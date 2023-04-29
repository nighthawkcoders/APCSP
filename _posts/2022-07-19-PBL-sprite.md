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
    <p id="rest" class="sprite rest" onmouseover="startAnimate('rest', 0, 15)" onmouseout="stopAnimate()"> </p>
  </div>
  <div class="column">
    <p id="walk" class="sprite walk" onmouseover="startAnimate('walk', (-2 * {{size}}), 8)" onmouseout="stopAnimate()"> </p>
  </div>
  <div class="column">
    <p id="run" class="sprite run" onmouseover="startAnimate('run', (-4 * {{size}}), 15)" onmouseout="stopAnimate()"> </p>
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
  }

  /* background position of element */
  #rest {
    background-position: 0px 0px);
  }

  #walk {
    background-position: 0px calc(-2 * {{size}} * 1px);
  }

  #run {
    background-position: 0px calc(-4 * {{size}} * 1px);
  }
</style>

<!--- Embedded executable code--->
<script>
  var tID; //this variable used to capture setInterval() task ID

  function stopAnimate() {  //stop animate task ID
      clearInterval(tID);
  } 

  function startAnimate(id, row, images) {
      const  offset = {{size}};     //offset of images in the sprite
      var    position = offset; //start position for the image slicer
      const  steps = offset * images
      const  interval = 100; //100 ms of interval for the setInterval()

      tID = setInterval ( () => { // task ID starts with animation interval
        // update backgroundPosition in DOM
        document.getElementById(id).style.backgroundPosition = `-${position}px ${row}px`; 
        if (position < steps) { //increment the position by offset on each interval
            position = position + offset;
        } else { 
            position = offset; 
        }
      }
      , interval ); //time of interval
    } //end of startAnimate()
</script>
