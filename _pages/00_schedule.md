---
layout: page
permalink: /schedule
title: Schedule
---

<!-- posts and pages used as sources -->
{% assign all = null | compact %}
{% assign all = all | concat:site.posts | concat:site.pages %}

<!-- Setup order for Units -->
{% assign units = "7,1,2,3,4,5,6,8,9" | split: ',' %}
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
> Trimester 2 begins with student teaching and a focus on algorithms.  Each week a "Student Team" has a teaching assignment supported by College Board materials.  Additionally, the Teacher is providing Career Tech mini-labs that correspond to one or more topics for the week.  Use the two things together as you improve your learning experience, Frontend blog and Jupyter Notebooks.
      
  {% elsif unit == "5" %} 
      {% assign start = 17 %}
      {% assign end = 20 %}
## Unit {{unit}}: Intro to OOP, Databases, and Backend Programming
> Trimester 2 continues with student learning OOP and immediately applying it to Databases.  Each week a "Student Teams" will be working on frontend and backend elements for their Create Performance Task (CPT).  GitHub pages will be focus of instruction for frontend, OOP in Python will be instruction provided to create a database which will help exceed every CPT requirement.

{% elsif unit == "6" %} 
      {% assign start = 21 %}
      {% assign end = 24 %}
## Unit {{unit}}: Trimester 2 N@tM and finish CPT
> Trimester 2 concludes with student presenting their CPT project at N@tM.  Each person within "Student Teams" will have their own specialty within the student project that satisfied all their Create Performance Task requirements.   Student should be able to talk about design, coding, and present features of their portion of the system.

{% elsif unit == "7" %} 
      {% assign start = 25 %}
      {% assign end = 30 %}
## Unit {{unit}}: Trimester 3 Data Structures
> Trimester 3 is taught following college course requirements for CS113 Data Structures.  Topics, using Python, include searching, sorting, hashing, algorithms, analysis, object-oriented design, collections, lists, stacks, queues, trees, sets, dictionaries, and graphs.  These weeks will also include the a focus on preparations for the ***May 2nd Create Performance Task*** and the ***May 8th Exam***.  

{% elsif unit == "8" %} 
      {% assign start = 31 %}
      {% assign end = 33 %}
## Unit {{unit}}: Trimester 3 AP Weeks
> Trimester 3 contains AP weeks, where activities will be focused on supporting students in test preparations.  Day before a test can be used to study for exam in another class.  Days that are not focused on test preparation will be focused on planning for year end project/portfolio.

{% elsif unit == "9" %} 
      {% assign start = 34 %}
      {% assign end = 36 %}
## Unit {{unit}}: Trimester 3 Data Structures (continued)
> Trimester 3 finishes with a focus on presenting accomplishments for the year at the year end Night at the Museum.  These last 2 to 3 weeks will serve as the year end final exam.
      
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

    

    

