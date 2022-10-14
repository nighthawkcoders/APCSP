---
toc: true
comments: true
layout: post
title: Fastpages Frontend Development - Tour of GitHub Pages
description: GitHub Pages and Fastpages can change the way you think about information management.  Jupyter notebooks is changing the way people analyze data.  GH pages publishes and deploys a web site for free.  Fastpages provides amazing indexing and tagging capabilities.  Tech transforms the way people think, why would you want to use paper?
image: /images/github_pages.jpeg
permalink: /techtalk/fastpages
categories: [6.B, C7.0, C7.5]
type: pbl
week: 1
---

## Tour of Fastpages

<div>

    <div>

    <div style="float: left; margin: 0px 10px 10px 0px;">
        <a href="https://code.visualstudio.com/docs/datascience/jupyter-notebooks">
            <img atl="Roles and Agile" src="{{site.baseurl}}/images/fastpages.png" title="VS Code screen capture"
            width="250">
        </a>
    </div>
    <div>
        <hr>
        <p>
        GitHub Pages is a static site hosting service that takes files straight from a repository on GitHub,runs the files through a build process, and publishes a website. Fastpages is built on top of GitHub pages.  Fastpages automates the process of creating blog posts, so you don’t have to manually run conversion scripts. This tour begins by looking at Explorer in VS Code.  There are three automations to a GH Pages / Fastpages website...
        </p>
        <ul>
            <li><mark>_notebooks</mark>: jupyter .ipynb files.  This allows building block of markdown, python, java, javascript into a jupyter notebook.</li>
            <li><mark>_posts</mark>: markdown .md files.  This supports frontend web design with markdown, html, and javascript.</li>
            <li><mark>_word</mark>: word .docx files.  This allows you to save Microsoft or Goggle documents into a docx format.  Saving these directly to _word folder will streamline steps.</li>
        </ul>
        <p>
        Read more or review files in the <a href="https://github.com/fastai/fastpages#readme">fastpages README.md</a>
        </p>
        <hr>
    </div>

    </div>

</div>

### Resources
There are many resources, tutorials, and reference for building pages with <mark>HTML and Markdown</mark>.  On these subjects, I would say learn it when you need it.  Right clicking on Chrome provides <mark>View Page Source</mark> on any link on the Web.  The APCSA/APCSP projects have many examples within these projects.  Here are a couple of Web links I often find through google or refer to when looking for ideas ...
- [HTML on W3Schools](https://www.w3schools.com/html/default.asp)
- [Markdown Cheat Sheet](https://www.markdownguide.org/cheat-sheet/)

### Home Page
The Home page is sourced by the <mark>index.html</mark> file.  This is the file to personalize and customize your Fastpages home page.  BTW, index.html is the standard name for your web sites landing page.  GH Pages / Fastpages builds allows you to <mark>mix Markdown and HTML</mark> within the index.html file.

### Sub Pages
Look under <mark>_pages folder</mark> within the Navigator.  In this directory, there are several .md files.  These allow a combination of HTML and Markdown.  Observe that this project has <mark>prefix of 01, 02, 03 on the .md files allows control the order</mark> of menus from left to right...
- 01_search.md:  This provides a very cool <mark>search on the site</mark>.  The search.md is renamed but the contents are untouched from fastpages project.
- 02_tags.md:  This provide a very cool <mark>tagging system</mark> that is related to the "categories: categoryname" that are seen at the top of all the GH Pages / Fastpages _posts.  This tags.md is renamed but the contents are untouched from fastpages project.
- 03_about.md:  This page is left for your <mark>individual customization</mark>, similar to index.html
- Developers <mark>can add .md file of choice<mark> and order according to preference.

### Images
Look under <mark>images folder</mark> and you will see files added to support the site.  Some are for customization of the site others are for pages.
- Site: favicon.ico, logo.png
- Pages: agile.webp, apcsp.png

### GH Pages YAML files
The <mark>_config.yml</mark> has many strings and preferences that are specific to the site.  The file is full of comments that describe what can be changed and what should remain untouched.  Note, the .yml files will be seen again as we begin to deploy our own site with Docker.

## Hacks
Personalize index.html file and build your own Fastpages / GH Pages for personal use throughout the year.
- Add _pages/notes.md or _pages/vocab.md, insert between tags.md and about.md.  Use this area to capture idea and terms throughout the year.  
- Add some personal study or work pages.  Consider how you will use these in conjunction with notes/vocab pages, search, and tagging.
    - Publish _notebook file
    - Publish _post file with image
    - Publish _docx file from Google Doc source

### Extra Credit
Consider re-designing and using your home page for this class and for other subjects, other than Computer Science.  The searching and tagging features are very powerful and could help recall notes from any class.   