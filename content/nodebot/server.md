---
aliases:
- /doc/server/
date: 2014-07-01
linktitle: server 
menu:
  main:
    parent: nodebot 
next: /nodebot/wifiadapter
notoc: true
prev: /nodebot/client
title: Node Server
weight: 90
---

## Node Server

The node server uses Expressjs for handling HTTP requests and socket.io for talking to the client. This allows us to control the robot with simple REST calls to an endpoint either locally or in the cloud.

To get started clone the [wof-nodebot-server](http://github.com/ms-iot/wof-nodebot-server).

Install dependencies

    npm install
    
to run locally just run the server

    node server.js
    
to deploy to Azure

