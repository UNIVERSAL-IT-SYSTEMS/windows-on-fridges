---
aliases:
- /doc/map/
date: 2014-07-01
linktitle: Map
menu:
  main:
    parent: web services 
next: /windows-on-fridges/webservices/pathfinding
notoc: true
prev: /windows-on-fridges/webservices/webapp
title: Upload Map
weight: 80
---

## Map Upload

We have a simple converter that takes an image of the map in SVG format and creates a graph to make finding the shortest path between two rooms faster and easier. Our converter does not cover all the variety of SVG files, but strictly supports the maps generated the following way:

#### Step 1

  * Install [Microsoft Visio 2013](http://office.microsoft.com/en-us/visio/) if you don't have one already. You can also subscribe for a [free trial](http://www.microsoft.com/en-us/evalcenter/evaluate-visio-professional-2013).

#### Step 2

  * Take any map of the space in JPEG format and open it in Visio
    * WARNING: Other file types might work with these instructions but were not tested.
    * HINT: Cannot open your map in Visio? You might have to change the file type at the bottom right corner of the pop-up.

<img src="/windows-on-fridges/img/map/1.jpg" style='width:50%;' border="0" alt="Null">

  * To make your future SVG map easily extractable from the image you opened, create a new layer by going to Home -> Layers -> Layer properties -> New. Press "ok" after you’re done.

<img src="/windows-on-fridges/img/map/2.JPG" style='width:100%;' border="0" alt="Null">

#### Step 3

  * Use the line tool to draw all paths that you want the robot to wander. Make sure you "snap" the lines together if you want the two paths to actually be connected.

  <img src="/windows-on-fridges/img/map/3.jpg" style='width:80%;' border="0" alt="Null">

  <img src="/windows-on-fridges/img/map/4.jpg" style='width:90%;' border="0" alt="Null">

  * Use the line tool to create little strokes crossing the paths at the places you want robot to be able to stop at. To make your web-app aware of the available stops, after creating each of the strokes left-click on it and choose data -> define shape data. In the pop-up input "officeNumber" as a title and the actual room number as value. Save. To check that the officeNumber has actually been set up or to change the officeNumber you can always use the pointer tool to select the stroke and view the shape data.

  <img src="/windows-on-fridges/img/map/5.jpg" style='width:70%;' border="0" alt="Null">

  <img src="/windows-on-fridges/img/map/6.JPG" style='width:70%;' border="0" alt="Null">

#### Step 4

  * With the current implementation the robot stops in the hallways where you placed the crossing points. But you don't want the robot to sit in a hallway all the time. This way, you need a little hub for it to start from amd come back to. To do that draw a path leading inside the room you want the robot to be located. Inside the room create a crossing point by drawing another stroke and setting its "officeNumber" value to 0.

  <img src="/windows-on-fridges/img/map/65.JPG" style='width:70%;' border="0" alt="Null">

#### Step 5

  * A map is no good without the scale! To add the scale just put a line over something you know the actual length of, like a room or a hallway. Your map might have an actual scale at the bottom which you can use. Left-click on your scale and choose "define shape data". In the pop-up input "scale" as a title and the actual length as value. Save. 
  * Note that the units you put in the "value" field will be the units the program will use from now on. For example, if my scale is 15 meters, meters will be my units.

  <img src="/windows-on-fridges/img/map/7.JPG" style='width:90%;' border="0" alt="Null">
   
#### Step 6

  * When you're done, save your Visio project to come back and modify your map whenever you want. 
  * After that, delete the underlying map image by selecting it with a pointer tool and pressing “delete” button.

  <img src="/windows-on-fridges/img/map/8.JPG" style='width:50%;' border="0" alt="Null"><img src="/windows-on-fridges/img/map/9.JPG" style='width:50%;' border="0" alt="Null">

  * Make sure you don't have any particular shape selected to avoid having only this shape saved.
  * Go to file -> export -> change file type. Double-click on "SVG Scalable Vector Graphics". Save your map as "map.svg".
  * WARNING: Don't save your Visio project after you deleted the original map. This will make it very inconvenient to add changes to your map later.

Congratulations! Your map is ready. You can view the generated SVG code by opening the map file in Notepad or Visual Studio.
