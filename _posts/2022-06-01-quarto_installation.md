---
layout: post
title: NBDEV/Quarto Installation Guide
description: This will be a step by step guide for setting up a NBDEV Blog using Quarto 
permalink: /nbdevinstall
toc: true
comments: true
---
# Create new repository with nbdev

[Documentation](https://nbdev.fast.ai/tutorials/tutorial.html)

For the most part the documentation is pretty straight forward. Here are some extra details that might be helpful:
* When you initialize the repository, remember to use mkdir and do the commands in that directory.
* You will be asked to generate a token for a password, you will need to make sure to give yourself repository permissions on the token otherwise the password will give you a 403 error when you run git push. [More Info Here](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)

[Install hooks for git-friendly notebooks](https://nbdev.fast.ai/tutorials/pre_commit.html)

```bash
conda install -c conda-forge pre-commit
```
Note: this command took me a long time.

Install packages:
```bash
pip install -e '.[dev]'
```

This command is similar to make server:
```bash
nbdev_preview
```

Before commiting your changes to GitHub the developers recommend running: 
```bash
nbdev_prepare
```
# Transfer posts from old repository

In your new directory run:

```bash
$ quarto create-project --type website:blog .
```

Migrate posts and notebooks with these commands:
*It is a good idea to delete all the markdown posts that were created by make server (the files you put into .gitignore)

```bash
$ cp -r ../blog/_notebooks/* posts
$ cp -r ../blog/_posts/* posts
```
For me the .. is home/username and blog is replaced with the directory that the repository is called.

Do the same with images

```bash
$ cp ../blog/images/* posts
$ cp -r ../blog/images/copied_from_nb/* posts/
```

Migrate (changes the front matter) the transfered posts  

```bash
$ nbdev_migrate --path posts
```
Note:
* If you didn't delete the markdown posts I specified earlier you will run into an exception error. You will need to manually remove these files in the posts directory. 
* Your front matter cannot have any empty values you will run into an exception for this reason as well.

[Creating a blog within a nbdev project](https://nbdev.fast.ai/tutorials/blogging.html#creating-a-blog-within-a-nbdev-project) 