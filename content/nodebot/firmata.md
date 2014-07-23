---
aliases:
- /doc/firmata/
date: 2014-07-01
linktitle: firmata 
menu:
  main:
    parent: nodebot 
next: /windows-on-fridges/nodebot/client
notoc: true
prev: /windows-on-fridges/nodebot/building
title: Firmata 
weight: 70
---

## Firmata
Firmata is a protocol that allows you to use a client library to interact with microcontrollers and other hardware. We will be using Standard Firmata on the Galileo and controlling it with [Johnny-Five](https://github.com/rwaldron/johnny-five) a NodeJS client library that is build for robotics.

We are using a [modified version](http://github.com/connerbrooks/firmata-galileo) of [Firmata Arduino](http://github.com/firmata/arduino) the headers have been altered to be compatible with the Galileo SDK.

## Running Firmata
Firmata must be running on the board before the node client can interact with it.

  * Clone the Galileo Firmata Repository

    git clone https://github.com/path/to/galileo/firmata

  * Open the Visual Studio project.
  * Configure the remote debugging settings.  
    * Refer to the [Galileo SDK documentation](http://ms-iot.github.io/content).
  * Deploy the project to the Galileo.
  * Once you have deployed you will be able to telnet into the Galileo and remotely start firmata
      
    telnet mygalileo
    cd c:\test
    Firmata.exe

  * We can now control the Galileo using the Firmata protocol with any client library.
