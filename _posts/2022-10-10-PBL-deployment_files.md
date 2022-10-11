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

## Communication onf Machines
> It would be nice if there were some standards published.  Here are some ideas.  It takes about 15 minutes to plan or hours to fix.  

## P3 MORT: nighthawkcodingsociety.gq

|Period|Table|Port|Project|image_nm|nginx|subdomain|
|3|1|8031|T31_|||
|3|2|8032|T32_|||
|3|3|8033|T33_|||
|3|4|8034|T34_|||
|3|5|8035|T35_|||
|3|6|8036|T36_|||
|3|7|8037|T37_|_v1|

## P4 MORT: nighthawkcodingsociety.gq

|Period|Table|Port|Project|image_nm|nginx|subdomain|
|4|1|8041|t41_|||
|4|2|8042|T42_|||
|4|3|8043|T43_|||
|4|4|8044|t44_|||
|4|5|8045|T45_|||
|4|6|8046|T46-|||

## Notes from Rohan J
> Please replace "web" in docker-compose with "web_t#" to ensure each container has a unique name & replace "*_v1" w/ "*_t#_v1" in docker-compose.yml