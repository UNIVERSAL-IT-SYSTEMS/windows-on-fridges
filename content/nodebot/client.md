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

## Calibrating the Robot

The commands coming from Azure are in this format: 

    [{"Distance":1,"Angle":0},{"Distance":1.4142135623730952,"Angle":45},{"Distance":1,"Angle":-135},{"Distance":1,"Angle":180}]

But the commands the robot understands are in this format: 

    [{"direction":'RIGHT',"speed":255,"duration":100},{"direction":'FORWARD',"speed":255,"duration":100},{"direction":'LEFT',"speed":255,"duration":100},{"direction":'FORWARD',"speed":255,"duration":100}]
    
To translate between the two, we need to find out how long it takes the robot to turn a certain angle, and how long it takes to go forward a certain distance. The duration needed for each command can be easily calculated given the right, left, and forwards speeds. To make sure these speeds stay constant, we will have a set PWM at which they are measured. See below for instructions on how to measure the right and left rotational speeds, and the forward speed. 

    var direction; 
    var speed; 

    if (command.Angle > 0) { 
        this.motorControl('RIGHT', setPWM, command.Angle / rotationalSpeedRight); 
        // deg/(deg/ms) = ms 
    } else if (command.Angle < 0) { 

    this.motorControl('LEFT', setPWM, command.Angle / rotationalSpeedLeft);  
    // deg/(deg/ms) = ms 
    } 

    this.motorControl('FORWARD', setPWM, command.Distance / forwardSpeed);  
    // distance/(distance/ms) = ms 

### Calibration Variables

Every robot will be slightly different. To calibrate your robot to accurately follow your commands, follow the directions below. 

While measuring, keep in mind that your robot might move differently based on what surface (ex: carpet, tile, or wood flooring) it is moving on. Try to take your measurements on the surface the robot will be using most. If there are significant differences in robot performance on different surfaces you may want to keep the robot from going on certain surfaces that will throw it off by removing those paths from your map. The weight of the robot will also cause these numbers to shift. Do your measurements with a full can in the fridge.

#### PWM

If we are going to measure a consistent speed of the robot, the motors need to have a consistent PWM. Choose one [0, 255] and stick with it. This must stay constant throughout your measurements and whenever your robot is following the angle, distance style of instructions or else your measured speeds will be meaningless. 

#### Rotational Speed Right

Rotational speed right can be calculated by sending the command 

    {direction: RIGHT, speed: setPWM, duration: 100} 
    
Then measure the degrees the robot turned. It may be helpful to mark the robot's initial heading on the ground with tape to assist with measurements. 

Try with a few different durations to make sure the degrees/duration stays relatively consistent. 

    rotationalSpeedRight = average(degrees/duration)  // degrees/millisecond when turning right  

#### Rotational Speed Left

Rotational speed left can be similarly calculated with 

    {direction: LEFT, speed: setPWM, duration: 100} 

It may turn out to be the same as rotationalSpeedRight, but you can't assume that will be the case. 

Again, try with a few different durations to make sure the it is relatively consistent. 

    rotationalSpeedLeft = average(degrees/duration)  // degrees/millisecond when turning left 
    
#### Forward Speed

forwardSpeed is the distance your robot moves forward in one millisecond. 

The unit of distance you use should match the unit of distance of the map you use. 

For example, if your directions pass in the distance in meters, forwardSpeed should be calculated in meters/millisecond.  

Use 

    {direction: FORWARD, speed: setPWM, duration: 100}
    
and measure how far your robot moves forward. 

Again, marking the ground could be helpful. 

    forwardSpeed = average(distance/millisecond)  // distance/millisecond when going forward 
