---
aliases:
- /doc/build/
date: 2014-07-01
linktitle: build 
menu:
  main:
    parent: nodebot 
next: /windows-on-fridges/nodebot/firmata
notoc: true
prev: /windows-on-fridges/nodebot/hardware
title: Build 
weight: 60
---


## Building the Robot 

## Step 1. Robot frame
There are many frames to choose from when it comes to building a small to mid sized robot. [Makeblock](http://www.makeblock.cc/) is a simple open platform for robotics that is easy to put together. Here is an example configuration of a Makeblock robot with a galileo attached. You can get pretty creative here, there is no right way to build an awesome robot.
We chose to build the [Big Tank](/windows-on-fridges/pdf/Makeblock-Big-Tank.pdf) frame.
<img src="/windows-on-fridges/img/nodebot/nodebot-frame.jpg" style='width:100%;' border="0" alt="Null">
There are many configurations of robots you can build on Makeblocks [assembly instruction](https://github.com/Makeblock-official/Assembly-Instructions).

## Step 2. Motors
  * The motor shield we used is a [SeeedStudio V1/V2 Motor Shield](http://www.seeedstudio.com/depot/Motor-Shield-V20-p-1377.html?cPath=91_92). This shield can either be powered directly from the board or from an external power source via its external power jack. Without external power the motors may not turn when a load is applied.
    * There is more documentation for the motor shield on the SeeedStudio [wiki](http://www.seeedstudio.com/wiki/Motor_Shield_V2.0).
    _Either the V1 or V2 motor shield from SeeedStudio will work_
  * Connect the motor shield to the Galileo.
  * Attach 2 motors to the shield, the polarity does not matter but will affect the direction of the motors. You may have to switch the wires if the motors are turning the wrong way.
  * Attach the battery connector to the motor shield's external power input.
<img src="/windows-on-fridges/img/nodebot/motorshield.jpg" style='width:100%;' border="0" alt="Null">
  * All together it should look something like this. _This version has the V1 shield, they are functionally the same_
<img src="/windows-on-fridges/img/nodebot/nodebot-motors-shield.jpg" style='width:100%;' border="0" alt="Null">

## Step 3. Putting it all together
Secure all your parts on the robot frame. You will need space for a Galileo, 2 batteries, and a wifi adapter.

## Step 4. Set up Wifi Adapter

Wifi gaming adapters allow you to connect devices to wifi that otherwise could 
only connect over LAN.

* Purchase an adapter, such as [this recommended option](http://www.amazon.com/NETGEAR-WNCE2001-Universal-Internet-Adapter/dp/B007CO5DZ4/ref=sr_1_3?ie=UTF8&qid=1404169366&sr=8-3&keywords=wireless+gaming+adapter)
* Follow the instructions supplied with your gaming adapter to connect it to your wireless network.
* Connect the Gaming Adapter to the Galileo with an ethernet cable.
* The recommended adapter also includes a USB power cable; If your adapter includes a USB power cable connect it to the Galileo with a [Micro USB Male to USB A Female Adapter](http://www.amazon.com/Micro-USB-Male-Female-Adapter/dp/B0027YYMU6) . The Galileo can provide sufficient power to the recommended adapter.
* Connect your development machine to the same wireless network as the gaming adapter.
* Ping the Galileo by hostname and ensure it is connected to the network.
* You should now be able to deploy to the Galileo over wireless network!
