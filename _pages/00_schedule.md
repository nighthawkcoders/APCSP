---
layout: page
permalink: /schedule
title: Schedule
---

<!-- posts and pages used as sources -->
{% assign all = null | compact %}
{% assign all = all | concat:site.posts | concat:site.pages %}

<!-- Setup order for Units -->
{% assign units = "3,2,1,4" | split: ',' %}
{% for unit in units %}

  <!-- Each Unit has a range of weeks and a heading -->
  {% if unit == "1" %} 
      {% assign start = 0 %}
      {% assign end = 3 %}
## Unit {{unit}}: Introduction to Tools and Resources
> The initial weeks focus on introducing Tools, Pair Programming, and the AP Resources that we plan to use throughout the year. At the end of Weeks 0-3, students will be exposed to blogging with GitHub Pages; developing with Jupyter Notebooks, Python, JavaScript, HTML, and Code.org AppLab; working with AP classroom and becoming familiar with Create Performance Task project requirements.
  {% elsif unit == "2" %} 
      {% assign start = 4 %}
      {% assign end = 7 %}
## Unit {{unit}}: Introduction to Web Development
> Websites are made up of several key parts: Frontend, Backend, Data and Deployment.  The focus for these weeks is to enable students to perform the aspects of constructing and deploying a simple Website.  Fastpages got us started on these concepts, but now we will start building a Website from the ground up.   Once again, there will be a lot of learning focused tools and getting things working.  But, by the end of the Unit, students will be ready to start many of the technical coding aspects of Web Development, having established a Deployed Website.  On Nov 3rd our Trimester work will end with a project and student participation in Electives Department "Night at the Museum" (N@tM). 

  {% elsif unit == "3" %} 
      {% assign start = 8 %}
      {% assign end = 12 %}
## Unit {{unit}}: N@tM Project, Web, Systems, and Data
>  The beginning of Trimester 2 is focussed on Algorithms and Coding.  Student need to build their own portfolio.  That portfolio should focus on their interests in Python and JavaScript programming.  

{% elsif unit == "4" %} 
      {% assign start = 13 %}
      {% assign end = 16 %}
## Unit {{unit}}: Algorithmic Programming
> Trimester 2 begins with student teaching and a focus on algorithms.  Coding and algorithms is more impactful if you have projects(s) as you are learning.  Each week a "Student Team" has a teaching assignment supported by College Board materials.  Additionally, the Teacher is providing Career Tech mini-labs that correspond to one or more topics for the week.  Use the two things together as you improve your personal blog with Frontend algorithms and/or Jupyter Notebooks.
      
  {% endif %}

  <!-- Column Headings for Blogs -->
  <table>
      <tr>
        <th>Week</th>
        <th>Sprint/Points Link</th>
        <th>AP Test Prep</th>
        <th>Career Tech</th>
        <th>Human Prep</th>
      </tr>

  <!-- These loops group blogs according to Type and Week -->
  {% assign units = null | compact %}  <!-- empty array -->
  {% assign sym = "|||" %}  <!-- string/symbol used a separator  -->
  {% assign deli = sym | compact %} <!-- force to array element -->

  {% for i in (start..end) -%}
    {% assign pt = null | compact %} <!-- empty array -->
    {% assign ap = null | compact %}
    {% assign tt = null | compact %}
    {% assign hm = null | compact %}
    {% assign uk = null | compact %}

  <!-- looping through all posts -->
    {% for post in all %}

  <!-- prepare data blog post data for evaluation -->
      {% assign week = post.week | plus: 0 %}  <!-- force to integer -->
      {% assign title = post.title | compact %}
      {% assign url = post.url | compact %}

  <!-- process posts for current week -->
      {% if week == i %} 

  <!-- organizing blogs by type -->
        {% if post.type == "plan" %} 
            {% assign pt = pt | push: title %}
            {% assign pt = pt | push: url %}
        {% elsif post.type == "ap" %}
            {% assign ap = ap | push: title %}
            {% assign ap = ap | push: url %}  
        {% elsif post.type == "pbl" %}
            {% assign tt = tt | push: title %}
            {% assign tt = tt | push: url %} 
        {% elsif post.type == "human" %}
            {% assign hm = hm | push: title %}
            {% assign hm = hm | push: url %} 
        {% else %}
            {% assign uk = uk | push: title %}
            {% assign uk = uk | push: url %}     
        {% endif %}

      {% endif %}
    {% endfor %}

  <!-- ordering blogs and inserting column delimiters -->
  {% assign units = units | concat:pt | concat:deli | concat:ap | concat:deli | concat:tt | concat:deli | concat:hm %}

  <!-- Display documents by type-->
  <tr>
  <td> {{i}} </td> 
  <td>
  {% for i in (0..100) -%}   <!-- forever loop -->
    {% if units.size == 0 %} <!-- break loop when data is empty -->
      {% break %}
    {% elsif units[0] == sym %} <!-- make new column -->
      </td>
      <td>
      {% assign units = units | shift %} <!-- remove delimiter -->
    {% else %} <!-- make a link in the column -->
      - <a href="{{site.baseurl}}/{{units[1]}}">{{units[0]}}</a> <br/> 
      {% assign units = units | shift | shift %} <!-- remove title and url -->
    {% endif %}
  {% endfor %}
  </td>
  </tr>
  {% endfor %}

  </table>
{% endfor %}

    

    

