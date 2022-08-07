---
toc: true
comments: true
layout: post
title: VSCode Download with WSL
description: Instructions for Windows users on how to use VSCode with WSL in order to add a Linux-based development.
permalink: /vscode-wsl
categories: [tri1]
image: images/wsl.png
---

## Instructions to Download Visual Studio Code Remote - WSL
> Windows is the number one desktop operating system.  However, Linux is a preferred standard for many developers.  Using WSL you can develop in a Linux-based environment, use Linux-specific tool chains and utilities, and run and debug your Linux-based applications all from the comfort of Windows.  This gives the developer on Windows the best of both worlds.

### Download WSL 
1. Type Command Prompt in your computer's search bar. Make sure to run as an administrator.
You may get "the required operation requires elevation" if you do not run as an administrator.
2. Enter Command Prompt
```bash
wsl --install
```
3. Restart your computer. 
4. After booting up the command prompt should automatically pop up prompting you for a username. Choose a username and password to create an account.

### [Download Visual Code](https://code.visualstudio.com/)
1. Download the Windows version.
2. When prompted to Select Additional Tasks during installation, be sure to check the Add to PATH option so you can easily open a folder in WSL using the code command.
3. Install the [Remote Development extension pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)

### Opening up VSCode with WSL
1. Open a WSL terminal window (using the start menu item or by typing wsl from a command prompt / PowerShell)
2. Navigate to a folder you'd like to open in VS Code
Here are some useful command prompts to find a good location
```bash
cd ~     # takes you to your personal directory
mkdir    # creates a folder (you can name this vscode)  
ls     # views the content of the directory you are currently on
cd path     # changes the directory to the chosen path (you can also do cd ~/vscode)
cd ..    # changes the directory to the previous/parent directory
```
3. Type ```code.``` in the terminal. When doing this for the first time, you should see VS Code fetching components needed to run in WSL. This should only take a short while, and is only needed once.
4. Once finished, you now see a WSL indicator in the bottom left corner.
![WSL Status Bar](images/wsl-statusbar-indicator.png)

[### More on WSL and VS Code](https://code.visualstudio.com/docs/remote/wsl)
