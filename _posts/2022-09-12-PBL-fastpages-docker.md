---
toc: true
layout: post
description: Serving Fastpages locally using Docker.  This allows local machine testing of each change of code without the delay of GitHub Actions.  
categories: [C7.1]
title: Fastpages local server
author: Ellen Xu
image: /images/fastpages_docker.png
type: pbl
week: 4
---

It's often useful to test pages locally before deploying, as it can save time and be helpful for testing quick changes/debugging. In this blog we'll learn how to deploy fastpages locally using Docker.

## Overview of steps

1. Download Docker desktop
2. (For Windows) Set up Docker with WSL
3. Run `make server` in repo directory
4. Click in terminal or type localhost link show (ex. http://127.0.0.1:4000/{repo name}) to view your Fastpages Blog site.

### 1. Installation

Docker is a lightweight method to build, deploy, run, update and manage containers. Download Docker desktop from following links:

Windows: https://docs.docker.com/desktop/install/windows-install/
Mac: https://docs.docker.com/desktop/install/mac-install/.

Now, each time you want to `make server`, you need to start Docker desktop or make sure it running. Make sure you do this before building locally!

### 2. (For Windows) Set up Docker with WSL

For Windows, to set up Docker with WSL use https://docs.docker.com/desktop/windows/wsl/.

### (Optional) Download Docker extension in VSCode

VSCode has an extension too make it easier to manage docker containers and images directly in your IDE. To download, go to the Extensions tab of VSCode (left bar, or Ctrl+Shift+X), search "Docker" and download the extension from Microsoft. You should now see a docker icon on the left bar, which you can click on to see your Docker connections.

### 3. Using VSCode Terminal, run: `make server`

In the local repository, make sure you are cd'ed to the base/root directory (i.e. where the Makefile is). For Ellen that was the ap-csa-fastpages directory as pictured.  For Mr M, `cd ~/vscode/APCSA` sets him in his APCSA repository, here the `make server` command will work if Docker is running.

![image](https://user-images.githubusercontent.com/56745453/186964001-45e37d26-45b0-484d-bac6-b85b67cb2ffb.png)

The Makefile contains common aliased commands for building and serving your fastpages locally. If you look inside the file or run `make` in terminal, you can see what docker commands it can run.

![image](https://user-images.githubusercontent.com/56745453/186964281-4c238041-0e9e-4319-affa-5d0aebe084b3.png)

Specifically, we are interested in the `make server` command, which will build the container the first time and start the Jekyll server. If you remember from APCSP, Jekyll is what powers Github pages behind the scenes. You can build your GitHub Pages site locally using Jekyll to preview and test changes to your site.

#### Special steps for Windows

The first time, you might get this issue:

![image](https://user-images.githubusercontent.com/56745453/186963057-bb16c926-33f5-41cb-abe1-65886678f477.png)

If that's the case, make sure this setting is toggled on in Docker desktop settings:

![image](https://user-images.githubusercontent.com/56745453/186963251-602a4073-caab-40ca-8441-55be64d9c7f7.png)

It should ask you to reload and if you run the command again it should work now.

### 4. View blog

After running, look for link to run Server. For me, this was http://127.0.0.1:4000/{repo name}:
> Server address: http://127.0.0.1:4000/

> Server running... press ctrl-c to stop.

<mark>Shift-click server address</mark> to launch in Browser.  

<mark>Leave the server running!!!</mark> 

<mark>Make edits in VSCode and save the file</mark>.  On each save, watch terminal in VSCode to see updates and regeneration of WebSite.  

<mark>Refresh or click to Web page of change and you will see updates almost instantly</mark>.  Refer to VSCode terminal to see any error encountered when running your server.  As indicated ctrl-c will stop the server, however, I have left it running for hours of edits, testing, and commits to GitHub.

Alert, when you are satisfied with local changes... <mark>you must ✔️Commit and Sync to GitHub</mark>.  The local server is used to preview and test change prior to Sync.  Only after Sync, will others be able to see your changes.

![image](https://user-images.githubusercontent.com/56745453/186968485-a2d02d10-d53a-4b88-b6b1-bbcc2f69d1cc.png)

#### Add to .gitignore

A side effect of building locally is that it converts all the .ipynb and .docx files to .md. This means that some files will have duplicates after building -- one in .ipynb or .docx, another in .md form.

To avoid duplicates masters when pushing to github, add the  md generated files from to the .gitignore.   This can be done by right clicking md file when preparing commits. Below is a sample .gitignore.  The 1st three lines should be universal to all fastpages projects, the other files are specific to your project.

```
# Ignore from local build
settings.ini
Gemfile.lock
images/copied_from_nb/
_posts/2022-08-15-AP-anatomy.md
_posts/2022-08-22-HM-anthony_and_sahil.md
_posts/2022-08-22-TT-darkmode.md
_posts/2022-08-22-AP-primitives.md
_posts/2022-08-22-TT-bash_tutorial.md
_posts/2022-08-29-AP-using_java_objects.md
_posts/2022-09-05-AP-boolean_ifs.md
_posts/2022-09-19-TT-js_tutorial.md
_posts/2022-09-26-TT-rapidapi.md
```

### Resources

https://github.com/fastai/fastpages/blob/master/_fastpages_docs/DEVELOPMENT.md
