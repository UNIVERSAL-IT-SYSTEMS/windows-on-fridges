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

  * To get started clone the [wof-nodebot-client](https://github.com/ms-iot/wof-nodebot) repo.

        git clone https://github.com/ms-iot/wof-nodebot

  * Install Node dependencies from the packages.json file.

        cd wof-nodebot
        npm install

  * Comment out line 485, there are some issues with a logging dependency

        //message[color];

  * In the client.js file change galileoIP to reflect either the hostname or IP Address of your board.

        var galileoIP = 'mygalileo';

  * When we connect to a socket server you may want to change the serverUrl to an endpoint on Azure.

        var serverUrl = 'http://localhost:1337';
    
  * We should now be able to test the client, from the client source directory

        node client.js
    
  * We should see a REPL prompt, at the prompt we can test the motors

        motors.left.fwd(255)
        motors.right.rev(255)
        motors.left.stop()
        motors.right.stop()
    
At this point we should have a working robot that you can control from the command line.
We will now connect the client to the socket server that can run locally or on Azure.

## Connecting to Firmata

  Firmata is normally controlled over serial however, the Galileo does not have a proper serial connection to the computer.
  We instead use [Network Serial](https://github.com/ms-iot/galileo-sdk/blob/develop/source/NetworkSerial.cpp) for serial communication.
  
  * In the case of Node we use the net package to create a socket connection on the _default port 27015_
    
        var net = require("net");

        var socket = net.createConnection(27015, galileoIP); 
        console.log('Socket created.');
        this.socket.on('data', function (data) {
          // Log the response from the HTTP server.
          console.log('RESPONSE: ' + data);
        }).on('connect', function () {
          // Manually write an HTTP request.
          console.log("connected");
        }).on('end', function () {
          console.log('DONE');
        });

  * Then we can create a Johnny-Five board object with this socket as the port.
    
        var five = require("johnny-five");

        board = new five.Board({
          port: socket
        });
