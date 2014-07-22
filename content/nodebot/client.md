---
aliases:
- /doc/client/
date: 2014-07-01
linktitle: client 
menu:
  main:
    parent: nodebot 
next: /windows-on-fridges/nodebot/server
notoc: true
prev: /windows-on-fridges/nodebot/firmata
title: Node Client 
weight: 80
---

## Node Client

_Make sure you have [NodeJS](http://nodejs.org) and [Python](http://python.org) installed and in your path_

Johnny-Five is the client library we will be using to interact with Firmata on the Galileo. Johnny-Five requires [SerialPort](https://github.com/voodootikigod/node-serialport) which is built with Python.

To get started clone the [wof-nodebot-client](https://github.com/ms-iot/wof-nodebot) repo.

Open this directory in Command Line and type

    npm install

This will install all the dependencies in the packages.json file.

There is currently one change that need to be made before we can run this project

    node_modules > johnny-five > lib > board.js

comment out the line

    message[color];

in the function

    Board.prototype.log
    
In the client.js file change galileoIP to reflect either the hostname or IP Address of your board.

    var galileoIP = 'mygalileo';

later when we connect to the socket server you may want to change the serverUrl

    var serverUrl = 'http://localhost:1337';
    
We should now be able to test the client, from the client source directory

    node client.js
    
this should display a REPL prompt, at the prompt we can test the motors

    motors.left.fwd(255)
    motors.right.rev(255)
    motors.left.stop()
    motors.right.stop()
    
At this point we should have a working robot that you can control from the command line.
