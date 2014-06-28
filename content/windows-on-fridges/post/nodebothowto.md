+++
date = 2014-06-27T17:47:29Z
draft = false
title = "How To: Build a NodeBot"

+++

# How to Build a Nodebot with Windows for Intel Galileo

## Materials
* Intel Galileo flashed with uefi bootloader (how can user check this?)
* Windows for Devices (or whatever seriously needs a name) on SD card
* Ethernet cable
* Arduino motor shield
* Makeblock robot kit, or any robot with 2 motors (a specific type of motor or just whatever?)
* Netgear Gaming Adapter
* Mophie/Anker battery pack (5V, 2.1A)
* USB to USB Micro adapter
* USB to barrel plug (add instructions on how to make this or get it in another way)

## Steps
1. Follow the getting started guide to get hello blinky working with Galileo for Windows. $(external link to docs)
2. Connect the motor shield to the galileo and attach the 2 motors to the shield.
3. Find the Sample Project in $(samples repository) named FirmataForGalileo and open the solution.
4. Run the solution on the remote debugger.
5. To run the node server clone the wof-nodebot repo and from command line run 
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
{ "direction" : "left/right/forward/backward", "speed":0-255, "duration":2000 }
```
