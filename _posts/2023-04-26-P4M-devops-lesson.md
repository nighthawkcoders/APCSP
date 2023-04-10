---
toc: true
comments: true
layout: post
title: P4-M 4/26 DevOps Lessons
author: Safin Singh, Aditya Nawandhar, Taiyo Iwazaki, Liav Bar, Arnav Kanekar
categories: [student]
type: ap
week: 31
---

## Subtopics

### SQLite on RDS

Intro

- Talk about what SQlite is -- and difference between different SQL types like MYSQL.
- What RDS is and what services it provides
- how does connecting local database with RDS helps and why it is effective and needed.

Talk 1

- How to make an RDS instance
  - Quick walk through
  - explanation of what each segment does like for example why we choose this out of all the options

[Image](https://camo.githubusercontent.com/c524ff8f1cd5f9c61d6319945a6b67fc6b15ece51ec4441f9d865a7d0bb14c95/68747470733a2f2f757365722d696d616765732e67697468756275736572636f6e74656e742e636f6d2f3130383034313338392f3232393431353832352d33616237613036392d393632342d343666392d623662352d3734626530653163363766622e706e67)

Talk 2

- Changes to be made in the flask site or the backend site
- Init.py changes -- why it is needed
- Where the necessary values like port and host can be found
- Why we do not need chang anything else

Connecting EC2 to the database

- everyone will not do this as one instance can have only one database attached, this will be shown just for their knowledge
- using RDS and SQL commands in EC2 terminal and working with the data to show how RDS makes working with databases more effective.

### NGINX

I. Introduction

- Explanation of using Nginx as a reverse proxy for Flask applications
- Overview of the benefits of using Nginx
- Brief overview of using SSL with Certbot

II. Setting Up Nginx

- Installation of Nginx if not already installed
- Creating a new Nginx configuration file in `/etc/nginx/sites-available/`
- Sample configuration file to proxy requests to a Flask application running on `localhost:5000`
- Enabling the configuration file by creating a symbolic link to it in the `sites-enabled` directory
- Restarting Nginx to apply the changes

III. Adding SSL with Certbot

- Explanation of Certbot and Let's Encrypt
- Installation of Certbot
- Obtaining an SSL certificate for the site using Certbot
- Testing SSL is working by visiting the site using `https://`

IV. Additional Security Headers

- Explanation of security headers
- Adding additional security headers to the Nginx configuration file
- Explanation of the added headers and how they improve security

V. Conclusion

- Summary of the benefits of using Nginx as a reverse proxy for Flask applications
- Recap of the steps to set up Nginx and SSL with Certbot
- Recap of the added security headers and how they improve security.

### DNS

# Lesson Plan: AWS and DNS

Students will learn how to use Amazon Web Services (AWS) to set up a domain name system (DNS) and configure DNS records.

- AWS account
- Access to the AWS Management Console
- Basic understanding of DNS

Introduction to AWS and DNS (10 minutes)

- Brief overview of AWS and its services
- Explanation of DNS and its importance in web applications

Setting up a DNS Zone (15 minutes)

- Log in to the AWS Management Console
- Navigate to Route 53 service
- Click "Create Hosted Zone"
- Enter a domain name and click "Create"
- Review the hosted zone details and take note of the nameservers

Configuring DNS Records (25 minutes)

- Navigate to the hosted zone created in step 2
- Click "Create Record Set"
- Enter the record name, type, and value
- Click "Create"
- Repeat for additional records
- Test the records using a DNS lookup tool

Code Snippets (30 minutes)

- Provide students with code snippets for automating DNS record creation in AWS using the AWS SDK
- Guide students through setting up and configuring the SDK on their local machines
- Demonstrate how to use the SDK to create and modify DNS records

Conclusion (10 minutes)

- Recap the importance of DNS in web applications
- Discuss the benefits of automating DNS record creation in AWS
- Encourage students to explore other AWS services and incorporate DNS in their future projects

### CORS & Certbot

Lesson Plan: Advanced Security Certbot and Cross-origin Security Advancements

- Objective:
  - Students will learn about Advanced Security Certbot and Cross-origin Security advancements, understand how to implement them into their own coding projects, and recognize the importance of CORS and Advanced Security Certbot.
- Materials:
  - Computer with internet access and web development software
- Prerequisites:
  - Basic knowledge of web development and security

Introduction

- Ask students if they have heard of Advanced Security Certbot or Cross-origin Resource Sharing (CORS).
- Explain that in this lesson, they will learn how to implement Advanced Security Certbot and CORS into their own coding projects.

Activity 1: Advanced Security Certbot

- Define Advanced Security Certbot and explain why it is important.
- Demonstrate how to install Certbot on a server and generate SSL/TLS certificates using Certbot.

Activity 2: Cross-origin Security Advancements (CORS)

- Define Cross-origin Resource Sharing (CORS) and explain why it is important.
- Demonstrate how to implement CORS in a web application by adding the appropriate headers to the server's response.
- Explain the different types of CORS requests and how to handle them.

Conclusion

- Recap the importance of Advanced Security Certbot and Cross-origin Security advancements.
- Discuss the benefits of implementing advanced security measures in web applications, including protecting websites and building trust with users.
- Encourage students to continue exploring security best practices in their coding projects.

### KASM

# Lesson Plan: Using KASM to Access Virtual Desktops

- Students will learn how to use KASM to access virtual desktops, understand the benefits of virtual desktops, and be able to set up KASM on their own machines.

Introduction (10 minutes)

- Introduce KASM as a virtual desktop interface
- Explain the benefits of using virtual desktops in a classroom setting

Step 1: Creating a Swap Partition (15 minutes)

- Explain the importance of a swap partition
- Demonstrate how to create a swap partition on a Linux server
- Verify the swap file exists
- Make the swap file available on boot

Step 2: Downloading KASM (15 minutes)

- Navigate to the /tmp directory
- Download the latest version of KASM
- Extract the KASM files
- Install KASM
- (Optional) Change the port number for KASM

Step 3: Configuring KASM (20 minutes)

- Explain the KASM configuration file
- Demonstrate how to edit the KASM configuration file
- Explain the different options available in the configuration file
- Test KASM to make sure it is working correctly

Conclusion (10 minutes)

- Recap the importance of virtual desktops and KASM
- Discuss potential use cases for virtual desktops in a classroom setting
- Encourage students to continue exploring virtual desktops and KASM on their own machines
- Provide additional resources for students to learn more about virtual desktops and KASM

Optional Extension Activities:

- Demonstrate how to set up and configure a Docker container in KASM
- Explain how to use KASM to run programming environments such as Visual Studio Code or Jupyter Notebooks

## Hacks

- CORS - I will grade them based on their explanations and if they implemented CORS or certbot correctly.
  - 0.30 if they have CORS implementation
  - 0.30 if they explained well in a blog or video
  - 0.60 points total.
- Potentially request team to try hosting their own KASM server
- Basic Nginx Configuration
- Nginx Proxy Pass to Flask
- Certbot SSL Configuration
- DNS
  - For the hacks, it will be very simple...
  - The student will just be creating an AWS account and taking a screen shot of that.
  - Inside of the AWS, they will be configuring a record and using Postman to test the table.
- SQLite to RDS - change and verify init.py config and connect to RDS server

## Grading

- Nginx (Safin) --> 0.6 for successfully creating a working nginx configuration that passes `nginx -t` to host an http server
- Kasm (Arnav) --> 0.6 for successfully running Kasm + more (TBD)
- Certbot and CORS (Liav) --> 0.6 for implementing CORS to any of their projects, explaining it in video/blog
- DNS (Taiyo) --> 0.6 setting up DNS and show log in + Get custom DNS name from either Freenom or other sites + TBD
- SQL on RDS --> 0.6 for changing init.py, writing an explanation on why connecting to the RDS server is important + TBD
