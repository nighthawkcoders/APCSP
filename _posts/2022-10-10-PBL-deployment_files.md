---
toc: true
comments: false
layout: post
title:  Deployment Files
description: Shared machine will require some standards
categories: []
type: pbl
week: 8
---

## Communication on Machines, Project, Port, Docker Image, and Nginx
> It would be nice if there were some standards published.  Here are some ideas.  It takes about 15 minutes to plan or many hours to fix.

## P3 MORT: http://nighthawkcodescrums.gq/

|Period|Table|Port|Project|image_nm|nginx|subdomain|
|3|1|8031|T31_|||
|3|2|8032|T32_|||
|3|3|8033|T33_|||
|3|4|8034|T34_|||
|3|5|8035|T35_|||
|3|6|8036|T36_|||
|3|7|8037|T37_|_v1|

## P4 MORT: http://nighthawkcodescrums.gq/

|Period|Table|Port|Project|image_nm|nginx|subdomain|
|4|1|8041|t41_|||
|4|2|8042|T42_|||
|4|3|8043|T43_|||
|4|4|8044|t44_|||
|4|5|8045|T45_|||
|4|6|8046|T46-|||

## P4 YEUNG: http://nighthawkcodingteams.cf/

|Period|Table|Port|Project|image_nm|nginx|subdomain|
|4|1|8041|T8041_sane|||
|4|2|8042|T8042_|||
|4|3|8043|T8043_|||
|4|4|8044|T8044_|||
|4|5|8045|T8045_|||
|4|6|8046|T8046-|||

## P5 YEUNG: http://nighthawkcodingteams.cf/

|Period|Table|Port|Project|image_nm|nginx|subdomain|
|5|1|8051|T8051_ZestyYeung ||
|5|2|8052|T8052_udderly_delectable||


## Notes from CSA
> Please replace "web" in docker-compose with "web_t#" to ensure each container has a unique name & replace "*_v1" w/ "*_t#_v1" in docker-compose.yml

## Example GitHub Project Clones from Mr Yeung's P4 and P5
ubuntu@ncs-cf:~$ pwd
/home/ubuntu
ubuntu@ncs-cf:~$ ls
T8041_sane             T8044_MVQN     T8047_lash               T8051_ZestyYeung          T8054_Scrum_Daddys  T8057_CASA
T8042_TAAL             T8045_peacock  T8048_united-rice-cubes  T8052_udderly_delectable  T8055_Sport         T8058_time
T8043_FriendshipTable  T8046_dogs     T8049_thedreamteam       T8053_Flask_Swag          T8056_berries       T8059_lyntax