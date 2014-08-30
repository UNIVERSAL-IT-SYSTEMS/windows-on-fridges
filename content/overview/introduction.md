---
date: 2013-07-01
linktitle: Introduction
menu:
  main:
    parent: getting started
next: /windows-on-fridges/overview/quickstart
title: Introduction
weight: 5
---

## What is Windows on Fridges?

Windows on Fridges is an end-to-end solution that makes use of the [Microsoft 
Developer Platform for IoT](http://windowsondevices.com) with an Intel Galileo 
board, and [Microsoft Azure](http://azure.microsoft.com) web services.

It is the intern project for the 2014 Explorer interns on the Internet of Things 
Experiences Team. The original conception of this project was to create an autonomous robot that 
would deliver drinks to your office. 

## The End-to-end

The full end to end consists of multiple different pieces.

 * [Web application](http://github.com/ms-iot/wof-webapp) that allows users to input a room they want a drink delivered to.
 * [Pathfinding service](http://github.com/ms-iot/wof-pathfinding) that is hosted on azure.
 * [REST server](http://github.com/ms-iot/wof-nodebot-server) that interacts with the client.
 * [Client application](http://github.com/ms-iot/wof-nodebot-client) which interacts directly with the hardware.
 * [Firmata](http://firmata.org/wiki/Main_Page) the protocol running on the Galileo.

All together this allows a user to input the room they want a drink delivered to.
The path is then calculated and converted to a list of instructions that are then
sent to the REST server. The REST server then sends the list to the client over
a websocket connection. The client uses a Firmata client library to communicate
with the hardware.


## Next Steps

 * [Quick start](/overview/quickstart.htm)
 * [Star us on Github](http://github.com/ms-iot/windows-on-fridges)
