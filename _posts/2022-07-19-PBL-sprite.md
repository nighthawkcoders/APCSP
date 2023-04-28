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
{% assign size = 256 %}

<div class="row">
  <div class="column">    
    <p id="rest" class="sprite rest" onmouseover="animateScript('rest', 0, 15)" onmouseout="stopAnimate()"> </p>
  </div>
  <div class="column">
    <p id="walk" class="sprite walk" onmouseover="animateScript('walk', (-2 * {{size}}), 8)" onmouseout="stopAnimate()"> </p>
  </div>
  <div class="column">
    <p id="run" class="sprite run" onmouseover="animateScript('run', (-4 * {{size}}), 16)" onmouseout="stopAnimate()"> </p>
  </div>
</div>


<style>
  /* CSS style rules for the elements id's above...
    They all share same sprite properties
  */
  .sprite {
    height: {{size}}px;
    width: {{size}}px;
    background-image: url('{{site.baseurl}}/images/mario_animation.png');
    background-repeat: no-repeat;
  }

  /* background-position ifor elements based off sprite row for animation */
  #rest {
    background-position: 0px calc(0 * {{size}} * 0px);
  }

  #walk {
    background-position: 0px calc(-2 * {{size}} * 1px);
  }

  #run {
    background-position: 0px calc(-4 * {{size}} * 1px);
  }
</style>

<script>
var tID; //we will use this variable to clear the setInterval()
function stopAnimate() {
    clearInterval(tID);
} //end of stopAnimate()

function animateScript(id, row, images) {
    const  offset = {{size}};     //offset of images in the sprite
    var    position = offset; //start position for the image slicer
    const  steps = offset * images
    const  interval = 100; //100 ms of interval for the setInterval()

    tID = setInterval ( () => {
      // update backgroundPosition in DOM
      document.getElementById(id).style.backgroundPosition = `-${position}px ${row}px`; 
      if (position < steps) { 
          position = position + offset;
      } //we increment the position by 256 each time
      else { 
          position = offset; 
      }
      //reset the position to 256px, once position exceeds 1536px
      }
    , interval ); //end of setInterval
} //end of animateScript()
</script>
