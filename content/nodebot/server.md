---
aliases:
- /doc/server/
date: 2014-07-01
linktitle: server 
menu:
  main:
    parent: nodebot 
next: /windows-on-fridges/nodebot/wifiadapter
notoc: true
prev: /windows-on-fridges/nodebot/client
title: Node Server
weight: 90
---

## Node Server

The node server uses Expressjs for handling HTTP requests and socket.io for talking to the client. This allows us to control the robot with simple REST calls to an endpoint either locally or in the cloud.

  * Clone the [wof-nodebot-server](http://github.com/ms-iot/wof-nodebot-server).

        git clone http://github.com/ms-iot/wof-nodebot-server

  * Install dependencies

        npm install
    
  * To run locally 

        node server.js
    
  * To deploy to Azure you can follow [this guide](http://azure.microsoft.com/en-us/documentation/articles/web-sites-nodejs-develop-deploy-mac/) which will teach you how to deploy a hello world application. Instead of the the hello world application just set the upstream on the server you cloned to Azure's endpoint.

        git remote add azure [URL for remote repository]
        git push azure master
  
  * You will need to change the server endpoint in the nodebot client

        // example Azure endpoint
        var serverUrl = 'test-robotcontrol.azurewebsites.net';
    
