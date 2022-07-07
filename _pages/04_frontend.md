---
layout: default
permalink: /frontend/overview
title: Frontend
---

{% include nav_frontend.html %}

<div>

    <div style="float: left; margin: 0px 10px 10px 0px;">
        <a href="https://en.wikipedia.org/wiki/Front-end_web_development">
            <img atl="Wikipedia Front-end" src="{{site.baseurl}}/images/html-css-js.jpeg" title=""
            width="200">
        </a>
    </div>
    <div>
        <hr>
        <p>
            Front-end web development is the development of the graphical user interface of a website, through the use of HTML, CSS, and JavaScript, so that users can view and interact with that website.  
            <ul>
                <li>In this class, we will be using <a href="https://github.com/fastai/fastpages"><mark>Fastpages</mark></a> on top of GitHub Pages to maximize our presentations, while minimizing our front-end coding. GitHub Pages deployment is performed through <a href="https://jekyllrb.com/"><mark>Jekyll</mark></a>, which regenerates the website automatically after each commit, tracking can be seen in Actions tab within GitHub.</li>

                <li> HTML generation is performed through <a href="https://shopify.github.io/liquid/basics/introduction/"><mark>Liquid</mark></a>, a template language (similar to Jinja2 or Thymeleaf).</li>

                <li>CSS style layout is provided by using <a href="https://pages.github.com/themes/"><mark>Themes</mark></a> provided through GH Pages. Each page we make we assume the defined theme and insert our HTML fragments, local page style, and local page JavaScript.</li>

                <li><a href="https://www.javascript.com/"><mark>JavaScript</mark></a> enable pages to have actions, fetch content, animate, etc</li> 
            </ul>
        </p>
        <hr>
    </div>

</div>


### Sample Code in this Sub Menu

HTML, CSS, and JavaScript are the front-end of the Web.  Many tools and languages complement development using markup, style and javascript.  This section of the Del Note CS website is providing some code samples.  These are intended to spark your own PBL ideas.  Each of these were generated after watching others teach or interacting with students.
- Binary: This example was created after watching Harvard CS50 by David J. Malan in 2020, he had built a machine to turn on and off lights/binary digits.  My thought after watching machine, why not simulate it in software?
    - Liquid is used to generate the HTML bits and parameters for onclick actions
    - JavaScript is used base 2, 8, 16 calculations
- Graph: This was created when a student named Bryant 2022 asked me the question "how would I plot data?" as described in an FRQ.
    - JavaScript canvas is used to draw grid, axis, lines
- Life: This was created by Nathaniel 2022 when I asked him about something interesting to show students in JS that relates to school.
    - Built on Conway's Game of Life ([Wikipedia](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life), [Original](https://playgameoflife.com/))
    - Somewhat pure JavaScript, no canvas usage even though it has a grid.
- Snake: This was interest of students in each of my 3 years, inspiration and some of the code came from a student named Nolan 2021.
    - Contains menu and settings, as well as Grid
    - Uses JavaScript canvas and key events