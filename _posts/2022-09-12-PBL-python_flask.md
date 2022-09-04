---
toc: true
layout: post
description: Setting up a Flask/Python project.  Flask is a Web Application framework written in Python.
categories: [markdown]
title: Flask/Python Web Application
image: /images/flask.png
type: pbl
week: 4
---

## Flask/Python Web Application
> Next up is making a Web Application from a completely customizable framework and language.  This project will focus on building a standalone Web Application.  The intentions are to use this framework for Group work and backend work.  At the conclusion of this article this project will only be run locally.  Ultimately, this project will be hosted on AWS.  
- Flask is the Web Application Framework.
- Python will be the Backend Development languages.
- Jinja2 is the Web Template language, that work well with Jinja2.
- HTML, CSS, JavaScript will support frontend work built into the Flask project.
- The external Fastpages/Github Pages project will use the Flask/Python project for backend services, like persistent data or databases (ie SQL).

### Setup Flask/Python Project
> Start Flask/Python GitHub repo from a Template.  Setup VSCode project to run python.  Make a change and push to GitHub.
- Click here to generate repository: https://github.com/nighthawkcoders/flask_portfolio/generate
- "Copy" https address of repository, this is a sample of mine:
![clone-address]({{site.baseurl}}/images/clone_http_address.png)
- Open terminal and goto your vscode directory: `cd ~/vscode`
- Clone new GitHub project by run `git clone <paste/replace with https address>`
- Run VSCode project `code <replace with name of project>`
- In VSCode type Shift-Command-P or Shift-Control-P to select your Python Interpreter
![python interpreter]({{site.baseurl}}/images/python_interpreter.png)
- Select Python that is in Conda environment
![python interpreter]({{site.baseurl}}/images/python_conda.png)
- In VSCode terminal install project dependencies: `pip3 install -r requirements.txt`
- Select main.py from VSCode navigator and press ▶️ in upper right corner.  Observe terminal output, this sample illustrates a good outcome.
![python interpreter]({{site.baseurl}}/images/python_terminal_output.png)
- In terminal output you can shift-click on http://127.0.0.1:5000/, or goto Browser and type: `127.0.0.1:5000`
- Conclude setup activity by pushing a minor change to Stub.html.  This will verify GitHub support with VSCode.   
    - Click for [VSCode guide for version control](https://code.visualstudio.com/docs/editor/versioncontrol#_git-support)
    - Stub.html lines of code to for simple change

```html
<div class="px-5 py-5 mx-auto">
    <h1 class="text-primary"><strong>Stubby Body</strong></h1>
    <p class="text-secondary">Put your name here</p>
</div>
```
