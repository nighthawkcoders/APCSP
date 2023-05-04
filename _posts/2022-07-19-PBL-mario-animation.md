---
title: Mario in Motion
comments: true
layout: base
description: Use JavaScript without external libararies to animate Mario moving across screen.
permalink: /frontend/mario1
image: /images/mario_animation.png
categories: []
tags: [javascript]
---

{% include nav_frontend.html %}

{% assign sprite_file = site.baseurl | append: page.image %}  <!--- Liquid concatentation --->
{% assign hash = site.data.mario_metadata %}  <!--- Liquid list variable created from file containing mario metatdata for sprite --->
{% assign pixels = 256 %} <!--- Liquid integer assignment --->

<!--- HTML for page contains <p> tag named "mario" and class properties for a "sprite"  -->
<p id="mario" class="sprite"></p>
  

<!--- Embedded Cascading Style Sheet (CSS) rules, defines how HTML elements look --->
<style>
  /* CSS style rules for the elements id and class above...
  */
  .sprite {
    height: {{pixels}}px;
    width: {{pixels}}px;
    background-image: url('{{sprite_file}}');
    background-repeat: no-repeat;
  }

  /* background position of sprite element */
  #mario {
    background-position: calc({{animations[0].col}} * {{pixels}} * -1px) calc({{animations[0].row}} * {{pixels}} * -1px);
  }
</style>

<!--- Embedded executable code--->
<script>
  ////////// convert yml hash to javascript key value objects /////////

  var obj = {}; // key, value object
  {% for key in hash %}  
  
  var key = "{{key | first}}"  // key
  var values = {} //values
  values["row"] = {{key.row}}
  values["col"] = {{key.col}}
  values["frames"] = {{key.frames}}
  obj[key] = values; // key, values added

  {% endfor %}


  ////////// global variables /////////

  var tID; //capture setInterval() task ID
  var positionX = 0; // current position of sprite in X direction
  var currentSpeed = 0;
  const mario = document.getElementById("mario"); //HTML element of sprite
  const pixels = {{pixels}}; //pixel offset of images in the sprite, set by liquid constant
  const interval = 100; //animation time interval

  ////////// animation control /////////
  mario.style.position = "absolute";  //set sprite to move idependent of other elements on screen

  //animation controller
  function startAnimate(obj, speed) {
    var frame = 0;
    var row = obj["row"] * pixels;
    currentSpeed = speed;

    //setInterval function for animation 
    tID = setInterval(() => { //tID is set to capture task ID
      //// animation function ////

      //animate sprite
      col = (frame + obj["col"]) * pixels;  //calculate col position
      mario.style.backgroundPosition = `-${col}px -${row}px`; //update frame
      mario.style.left = `${positionX}px`; //move element on X

      //next X position
      positionX += speed;  
      //next Frame, modulo recycles index based on number of frames
      frame = (frame + 1) % obj["frames"]; 

      //viewport follows sprite
      const viewportWidth = window.innerWidth;
      if (positionX > viewportWidth - pixels) {
        document.documentElement.scrollLeft = positionX - viewportWidth + pixels;  //scroll
      }
    }, interval); //time setting of interval
  }

  //animation ends by stopping task
  function stopAnimate() {  
    clearInterval(tID); //clear setInterval function using task ID
  } 


  ////////// event control /////////

  //key events that enable animations
  window.addEventListener("keydown", (event) => {
    if (event.key === "ArrowRight") {
      event.preventDefault(); // prevent default browser action
      if (event.repeat) { //on hold key
        stopAnimate();
        startAnimate(obj["Cheer"],0);  //rest animation 
      } else { //on tap key
        if (currentSpeed === 0) { // if at rest, go to walking
          stopAnimate();
          startAnimate(obj["Walk"],3);  //walking animation
        } else if (currentSpeed === 3) { // if walking, go to running
          stopAnimate();
          startAnimate(obj["Run1"],6);  //running animation
        }
      }
    } else if (event.key === "ArrowLeft") {
      event.preventDefault(); // prevent default browser action
      if (event.repeat) { //on hold key
        // stop animation 
        stopAnimate();
      } else { //on tap key
        stopAnimate();
        startAnimate(obj["Puff"],0); //resting animation
      }
    }
  });

  //touch events that enable animations
  window.addEventListener("touchstart", (event) => {
    event.preventDefault(); // prevent default browser action
    if (event.touches[0].clientX > window.innerWidth / 2) {
      // move right
      if (currentSpeed === 0) { // if at rest, go to walking
        stopAnimate();
        startAnimate(obj["Walk"],3);  //walking animation
      } else if (currentSpeed === 3) { // if walking, go to running
        stopAnimate();
        startAnimate(obj["Run1"],6);  //running animation
      }
    } else {
      // move left
      stopAnimate();
      startAnimate(obj["Puff"],0); //resting animation
    }
  });

  //stop animation on window blur
  window.addEventListener("blur", () => {
    stopAnimate();
  });

  //start animation on window focus
  window.addEventListener("focus", () => {
    stopAnimate();
    startAnimate(obj["Flip"],0);
  });

  //start animation on page load or page refresh
  document.addEventListener("DOMContentLoaded", () => {
    // adjust sprite size for high pixel density devices
    const scale = window.devicePixelRatio;
    const sprite = document.querySelector(".sprite");
    sprite.style.transform = `scale(${0.2 * scale})`;
    startAnimate(obj["Rest"],0);
  });

</script>
