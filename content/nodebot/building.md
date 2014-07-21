---
aliases:
- /doc/build/
date: 2014-07-01
linktitle: build 
menu:
  main:
    parent: nodebot 
next: /nodebot/firmata
notoc: true
prev: /nodebot/hardware
title: Build 
weight: 60
---


# Building the Robot 

## Steps
1. Follow the getting started guide to get hello blinky working with Galileo for Windows. $(external link to docs)
2. Connect the motor shield to the galileo and attach the 2 motors to the shield.
3. Find the Sample Project in $(samples repository) named FirmataForGalileo and open the solution.
4. Run the solution on the remote debugger.
3. [Install Nodejs](http://ms-iot.github.io/windows-on-fridges/post/installingnode/)
5. Clone the wof-nodebot repo
5. To run the node server, execute the following command in cmd line 
```
    npm install 
```
You will need to add node and npm to your path.
5. Run the node server either on the Galileo or from a computer and pick the IP address accordingly. Run the server with
```
   node server.js
```
from the wof-nodebot directory.
6. Use curl to send a post request to http://<robot ip address>/robot in the post body include
```
{ 
  "direction" : "left/right/forward/backward", 
  "speed":0-255, 
  "duration":2000 
}
```

## Steps when debugging
* Run Firmata on the Galileo from Visual Studio.
* Run the Node server from cmd line.
* If you have to stop the node server or Firmata currently you must reboot the Galileo.