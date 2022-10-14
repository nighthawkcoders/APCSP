---
toc: true
comments: false
layout: post
title: GitHub and Git Sociology
description: GitHub and Git are a social computing tools.  GitHub is a cloud-based Git repository hosting service. Git is underneath GitHub and it does the Job of managing files and versions in a series of snapshots. Git helps developer work together, by sharing Code.   Additionally, GitHub has many tools that help in the sociology of managing software (ie Issues, Pull Requests, Project Boards, GitHub Pages, etc).
image: /images/git.webp
permalink: /techtalk/github
categories: [1.C, 6.A, C1.2]
type: human
week: 7
---

![git-pic]({{site.baseurl}}/images/git.webp)

## GitHub and Git
> GitHub.com was launched in April 2008 by Tom Preston-Werner, Chris Wanstrath, P. J. Hyett and Scott Chaco.  GitHub is a subsidiary of Microsoft since 2018 (kind of ironic with Git quote below), but GitHub is not Git it helps manage the server or backend.

> Linus Torvalds invented Linux and about 2005 invented Git.  Quotes by Linus:
- “<mark>Talk is cheap. Show me the code.</mark>”
- “Most good programmers do programming not because they expect to get paid or get adulation by the public, but <mark>because it is fun to program.</mark>”
- Microsoft isn't evil; they just make really crappy operating systems.

> In our environments, Git is local and it works with GitHub/Git is in the cloud.  Together these tools together have become an industry standard since about 2015.  Formerly in industry we used tools like (ClearCase and Perforce), before the 90s we had home brewed systems.  Kind of like making smart backups of files.

### Terms and Usage
> A brief review of key commands and concepts.
- A "git clone" makes a local Git repository (decentralized) from the cloud server (GitHub/Git).   
- A .git directory contains a local database (see illustration) that keeps track of local changes.
- A "git commit" makes a child snapshot of the original parent on the local database.  Git commits over time are a series of Secure Hashing Algorithms (SHA's).  This is the math behind a git snapshot.
- The .gitignore file tells .git to ignore certain files in directory tree (ie files constructed from source or derived files, <mark>like ipynb files that turn into md files</mark>).
- The "git push" command moves files from local system back to cloud server (GitHub).  However, often a merge is required as the decentralized system can have many simultaneous contributors.  Students will experience this when they share a repository.
- To minimize conflicts, Developers use Git branches and/or GitHub Forks to push code to an isolated locations on the server/cloud.  This simply delays the inevitable merge, but has benefit of keeping developers branch of project stable.
- Pull requests is common process used to merge code from isolated Fork back to the primary GitHub repository.
- A "git rebase" is a common command for Developer on an isolated Git branch to update their environment from the "main" branch.  Often this is done prior to a "git push" back the "main" branch.

### Project Based Learning
In Project Based Learning, it is required that you have a policy on Contributing Guidelines.  Many student have already experienced problems of merging and managing change, by editing code GitHub directly, while editing code on VSCode locally.  This will be an every day occurrence when starting a GitHub/Git sociology.  Thus, teams need to create a policy to communicate how Scrum Team or Others should contribute to your project.
- [GitHub and VSCode](https://code.visualstudio.com/docs/editor/github)

## Hacks
> Any sociology questions within team need to be answered with a Blog,  A Scrum Master working with other Developers should establish the Github administration/sociology policies: 
- What is the main repository for your project?
- Did you create a .gitignore to avoid committing files that 'don't belong in version control?  Look at [this](https://www.toptal.com/developers/gitignore/) tool for guidance.
- Do you have a requirements.txt file to manage dependencies introduced to your Code Base?
- Have you established Issues as part of your Development process? [Creating Issues](https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-an-issue)
- Have you considered making Pull Requests to track development?  [Create Pull Request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request)
- Have you considered forks or branching techniques with pull requests?  [Link Issue to PR](https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue)
- Are you managing Issues on a Project Board/Scrum Board like Kanban? [Tracking Issues](https://docs.github.com/en/issues/tracking-your-work-with-issues/planning-and-tracking-work-for-your-team-or-project)
