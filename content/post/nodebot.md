+++
date = 2014-06-23T22:09:36Z
draft = false
title = "Making a Nodebot with Windows on Devices"

+++

## Wireless Nodebot

The Intel Galileo with Windows is a great platform for building NodeBots as 
the board itself can run the node server that controls the robot. This allows 
you to use one board for your server and hardware. Windows on the Galileo makes
arduino development easy and much more powerful since you are able to use 
Visual Studio and other tools that you already know. In the case of this project
however you can do all of your arduino programming through javascript using 
Nodejs and Cylonjs or Johnny-Five. For this project Johnny-Five made more sense
as it had greater support for the types of motors that I wanted to use. On the 
board itself we are using standard [firmata](firmata.com), the arduino protocol, to talk to
the node server. The firmata running on Galileo for Windows has been ported 
and does not require the Galileo plugin normally used with Johnny-Five.
