---
title: Deployment Guide
layout: default
comment: true
description: Description of key methods process used to deploy a Flask/Python website: AWS EC2, Docker, docker-compose, and Nginx 
permalink: /tutorial/deployment
categories: [pbl]
tags: [aws, ec2. docker, nginx, certbot, dns]
---

## Deployment Overview
Deploying a Web Application enables a Server to serve the components of a Web Application to clients. Deployment is the tools and service used to enable the Web Application on the Internet.  The process of can use many different cloud servers, as well as choice in tools and services.

- EC2: Amazon Web Services is a cloud computing platform that the PUSD district has provided for us to serve our Web Application.
- GitHub: At this point in time, we should be aware that we are using GitHub is an open platform to share our Web Application code on the Internet.
- Docker and docker-compose: To host a Web Application you need to prepare an environment that contains the Web Application code and all the dependencies (requirements.txt for Python)  Docker is an open platform for developing, shipping, and running applications.
- Nginx: To find a Web Application on a server, there needs to be a process to listen for the Web request and direct it to the Web Application.  Nginx is an open source software for web serving, reverse proxying, caching, load balancing, media streaming, and more.
- Certbot: Web traffic on internet is reliably served over Secure Hyper Text Transfer Protocol (https).  Certbot is a free, open source software tool for automatically using Let's Encrypt certifications 
- DNS: Natively, the web works off of IP addresses.  Domain Name Services (DNS) allows the assignment of a friendly name to our Web Server.  This name is built into Nginx/Certbot configuration files.  Freenom is the service used to register the nighthawkcodingsociety.com domain.

### Key/Values required as you go through these procedures
Some of these values you should obtain before you start.  Others you will obtain as you go through the process.

- GitHub HTTPS link:
- IAM user:
- EC2 name:
- EC2 Public IPs:
- DNS Name:

### Amazon Web Services (AWS): Electric Cloud Compute (EC2) Setup
Preparing and AWS EC2 instance is the process of creating a cloud computer.  This process starts by logging into your AWS IAM user, searching for EC2.
- To get started, launch a new AWS EC2 instance to learn process and understand how to work with Linux. here are some key considerations.
    - Choose an Amazon Machine Image (AMI), the class will be using Ubuntu you should check on last verified version with a Teacher before proceeding
    - When it comes to picking memory or disk it is VERY important to pick Free Tier.  As stated, this will only be used for testing and then it will be disposed for cost efficiency.
    - When presented with access dialog for http and https, make sure you check these boxes.  Remember you are making a Web application that will run over http and https.
    - Name the security group (.pem) file after your team.  It may be necessary to use SSH to access your EC2 instance.
    - The remainder of the steps you can use the defaults, refer to AWS documentation for guidance: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html
    - At the end of this process you need to "Connect to Instance". This will provide you a terminal like experience.

### Make sure your machine is up to date with Tools we need for Flask/Python
Terminal commands are shown, these commands will be run from Terminal after you connect to your EC2 name.  These commands update and then upgrade all your packages in your system. These commands should be run anytime you have Python/Flask errors on your system.

```bash
$ sudo apt update; sudo apt upgrade
$ sudo apt install python3-pip nginx
$ sudo pip3 install virtualenv
```

### Clone and change directory to where project is stored on EC2
This command move your Web Application code onto you EC2 cloud computer.The sample GithUb HTTPs Link is demonstration is: https://github.com/nighthawkcoders/flask_portfolio.git.  

```bash
$ cd
$ git clone https://github.com/nighthawkcoders/flask_portfolio.git
$ cd flask_portfolio
```

### Test run your project
These steps will require you to understand a few new commands that will not be part of final deployment process.  However, these commands will help you understand machine dependencies and validate your requirements.txt for completeness.

```bash
$ cd ~/flask_portfolio
$ virtualenv -p /usr/bin/python3 webapp
$ source webapp/bin/activate
$ pip install -r requirements.txt
$ python main.py
```

* If you get a result that looks like the below, your requirements.txt needs work.  In this instance, I would need ot add flask to the requirements.txt.
```bash
(webapp) ubuntu@ip-172-31-1-138:~/flask_portfolio$ python main.py
Traceback (most recent call last):
  File "main.py", line 2, in <module>
    from flask import Flask, render_template
ModuleNotFoundError: No module named 'flask'
(webapp) ubuntu@ip-172-31-1-138:~/flask_portfolio$ 
```
* A successful result will look like the following.  At this point we will type "ctrl+c" and then at prompt "deactivate", as we will now build and run a Docker File to deploy in more automated fashion.
```bash
(webapp) ubuntu@ip-172-31-1-138:~/flask_portfolio$ python main.py
 * Serving Flask app 'main' (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: on
 * Running on http://127.0.0.1:5000 (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 710-199-540
```

### Create dockerfile to use docker build
* edit Dockerfile `$ sudo nano Dockerfile`, add lines: 
```dockerfile
# syntax=docker/dockerfile:1
FROM openjdk:16-alpine3.13
WORKDIR /app
RUN apk update && apk upgrade && \
    apk add --no-cache git 
RUN git clone https://github.com/nighthawkcoders/spring_portfolio.git /app
RUN ./mvnw package
CMD ["java", "-jar", "target/spring-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080
```
* Here's what these lines mean: 
     * `# syntax=docker/dockerfile:1`: This tells docker which syntax you want to use
     * `FROM openjdk:16-alpine3.13`: imports openjdk so that you can actually run java stuff
     * `WORKDIR /app`: Sets the directory to /app
     * `COPY .mvn/ .mvn` and `COPY mvnw pom.xml ./`: Copy all necessary files into running directory
     * `RUN ./mvnw dependency:go-offline`: Run script
     * `COPY src ./src`: Copy source code
     * `CMD ["./mvnw", "spring-boot:run"]`: Run ./mvnw spring-boot:run
     * `EXPOSE 8082`: Set to use port 8082
* Create a .dockerignore file in the same directory as the Dockerfile `sudo nano .dockerignore` add to file:
```
target
```
* Build image
     * In the same directory as the Dockerfile run the following command to create a image that can be used for running with the tag java-docker:latest `$ docker build --tag java-docker .`
     * Create a new image with a tag of javak-docker:v1.0.0 based on java-docker:latest: `$ docker tag java-docker:latest java-docker:v1.0.0`

          * If you need to remove a tag, run: `$ docker rmi java-docker:v1.0.0`
     * To view images: `$ docker images`

### Run the image/start a container
* run java-docker:v1.0.0 image in detached mode so it's running in the
background with the port as 80
```bash
$ docker run -d -p 8085:8080 java-backend:v1.0.0
```
* Check if it works
```bash
$ curl --request GET --url http://localhost:8085 
```
* List containers/running images
```bash
$ docker ps
```
* At this point, we will stop and remove container as we will do this command via docker-compose:
```
$ docker stop [container name]
$ docker rm [container name]
```

### Create docker-compose file to do some of the steps above automatically
* edit docker-compose.yml `$ sudo nano docker-compose.yml`, add lines: 

```yml
version: '3'
services:
  web:
    image: java_springv1
    build: .
    ports:
      - "8085:8080"
    volumes:
      - persistent_volume:/app/volumes
volumes:
  persistent_volume:
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /home/ubuntu/spring_portfolio/volumes
```

