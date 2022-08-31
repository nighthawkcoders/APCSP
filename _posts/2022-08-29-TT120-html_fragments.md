---
toc: true
layout: post
title: HTML Fragments
description: HTML fragments are portions of code used in a greater coding system that enable functionality specific to the current page.  Fragments in HTML are a way to abstract complexity.  The greater coding system we use is GitHub Pages which uses Jekyll and Liquid to build and programmatically construct fragments into the larger web site.
image: /images/html-css-js.jpeg
permalink: /techtalk/html
categories: [techtalk]
---

## HTML Fragments and Markdown
Building an entire Web Application frontend requires HTML, CSS and JavaScript.  In our Fastpages/GitHub Pages a lot of the frontend design work has been done.   Jekyll takes our choice of layouts in our _config.yml file (theme: minima), along with our HTML and Markdown fragments and build a complete static website.

### Web Page Layout
A complete HTML Web Application is typically made off of a Layout and a series of Fragments (sometimes called templates).  
- [Web Page Layout](https://padlet.com/jmortensen7/weblayout).  This illustration becomes important when you make your own layout and fragments using frameworks like Jinja2 (for Python)  or Thymeleaf (for Java).
- The design of GitHub pages allows us to change themes with the _config.yml file (theme: minima) key/value, change the value to a [supported theme](https://pages.github.com/themes/) and page should work, but will look different. Try out the different themes by copying the remote theme to the following location in your _config.yml
![]({{site.baseurl}}/images/remote_theme.png)
- [Minima theme](https://github.com/jekyll/minima/blob/master/_layouts/default.html), click on link for accurate syntax.  Everywhere you see an "include" this layout is including a fragment to complement the page, things like CSS, JavaScript, headers and footers are included into the layout.  Where you see "content", this is the statement that includes page specific fragments we have designed added within the layout.  You should associate all of this to "Procedural Abstraction".

```html
    <!DOCTYPE html>
    <html lang="{{ page.lang | default: site.lang | default: "en" }}">

    "include head.html"

    <body>

        "include header.html"

        <main class="page-content" aria-label="Content">
        <div class="wrapper">
            "content"
        </div>
        </main>

        "include footer.html"

    </body>

    </html>
```

### Alert to Students
Students <mark>spending majority or large portions of time writing custom CSS will be counter productive</mark> to College Board goals and CTE goals for this class.  Be aware that HTML style is important, but we are trying to focus more on utilizing framework (GitHub Pages) to maximize our success in the style area.   Developers, particularly new Developers, need to ensure they are spending majority of time in the key technical of instruction.  <mark>Pair Programming and Team Programming are aids in speeding up learning</mark>, these collaborative techniques are not intended to be used to defer key technical learnings to others!!!  In our first week, <mark>I saw code that was not understood by the person asking questions<mark>. In 2021-2022 several students lost a grade (A down to B) at the end of the trimester because they were out of balance and were solely focused on CSS/style.

As an illustration, look at the [minima them](https://github.com/jekyll/minima).  Look at the analytics and work that went into it.  Leverage off it, don't recreate it!

### Review these Fragments
#### Table Fragments
In Fastpages you can build a table in HTML or Markdown.  Building in markdown allows you to take advantage of Jekyll.  
- The index.html does markdown conversion and builds a table with blogs
- The _posts/**pseudo.md file builds a table with Markdown

#### Images
In Fastpages you can insert images in HTML or Markdown.  The Teacher finds \<img\> easier to work with for embedding links and controlling size.
- See index.html for "img" usage

#### Links
Look up \<href\> and \[\]\(\) syntax in both HTML and Markdown.  These should become easy and familiar.

#### Tagging
Make sure to use tagging and make it provide a nice index into your information under "Tags" menu.  Here is sample.
```html
---
toc: true
layout: post
description: 
categories: [techtalk]
title: TT 1.2.0 HTML Fragments
---
```

## Hacks
At the end of this week you should have your theme, index.html and multiple external references in your site.  
- Time Box fragments are very important to show what you have done each week.  I want to see cumulative personal history for the Trimester and for the Year.
- You should be able to show how you have considered naming an Tagging to help you find materials under categories.
- You should be able to show home you have considered search and how you are able to find key elements.