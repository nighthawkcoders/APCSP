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
<style>

#rest {
  height: 256px;
  width: 256px;
background: 
url('{{site.baseurl}}/images/mario_animation.png') 0px 0px;
}

#walk {
  height: 256px;
  width: 256px;
background: 
url('{{site.baseurl}}/images/mario_animation.png') 0px -512px;
}

#run {
  height: 256px;
  width: 256px;
background: 
url('{{site.baseurl}}/images/mario_animation.png') 0px -1024px;
}

</style>

<div class="row">
  <div class="column">    
    <p id="rest" onmouseover="animateScript('rest', 0, 16)" onmouseout="stopAnimate()"> </p>
  </div>
  <div class="column">
    <p id="walk" onmouseover="animateScript('walk', -512, 10)" onmouseout="stopAnimate()"> </p>
  </div>
  <div class="column">
    <p id="run" onmouseover="animateScript('run', -1024, 16)" onmouseout="stopAnimate()"> </p>
  </div>
</div>

<script>
var tID; //we will use this variable to clear the setInterval()
function stopAnimate() {
    clearInterval(tID);
} //end of stopAnimate()

function animateScript(id, row, characters) {
    var    position = 256; //start position for the image slicer
    const  diff = 256;     //diff is offset in the sprite
    const  steps = diff * characters
    const  interval = 100; //100 ms of interval for the setInterval()

    tID = setInterval ( () => {
    document.getElementById(id).style.backgroundPosition = `-${position}px ${row}px`; 
    //we use the ES6 template literal to insert the variable "position"
    if (position < steps) { 
        position = position + diff;
    } //we increment the position by 256 each time
    else { 
        position = 256; 
    }
    //reset the position to 256px, once position exceeds 1536px
    }
    , interval ); //end of setInterval
} //end of animateScript()
</script>
