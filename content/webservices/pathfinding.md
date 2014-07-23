---
aliases:
- /doc/pathfinding/
date: 2014-07-01
linktitle: Pathfinding 
menu:
  main:
    parent: web services 
next: /windows-on-fridges/webservices/testing
notoc: true
prev: /windows-on-fridges/webservices/webapp
title: Path Finding
weight: 80
---

## Path Finding
### Editing and Testing the Code

![New Project](/windows-on-fridges/img/File-New-Project.png)

#### Create a Unit Test Project
* If you haven't already, download Visual Studio. <link> //Should this be in getting started?
* The first step is to make sure the code works. Create a new test project by opening Visual Studio and going to File->New->Project at the top.
* On the left hand side of the pop-up window, select Installed->Templates->Visual C#->Test. Then in the middle part of the pop-up, click on Unit Test Project. Having a Unit Test Project will allow you to easily run all the tests at once. If you change anything in the code, you can quickly know whether it broke something else. Be sure to change the name of the project at the bottom. We called ours PathFindingTests, but you can name yours whatever you like. Press ok when you are done.

#### Adding the Files
* Now that you have a brand new Unit Test Project, you need to add the test files, and the files you need to run those tests... These can be found on our github <link>. <Instructions for forking, cloning, etc., or links to them>
* While those files are downloading, create a place to put them in your project. The files will be sorted into classes and tests so let's make two folders in our project labeled classes, and tests. Right click on the project name in the solution explorer (found on the right hand side). Select Add->New Folder as shown in the picture. Do this twice, naming one "tests" and the other "classes".
* Once you have downloaded the files, right click on the newly created classes file. Select Add->Existing Item... Find the place where you downloaded the wof-webapp code. In wof-webapp->App_Code, open the classes folder and select all the files in there. Click add. Do the same with the tests folder, selecting all the files from github's test folder and clicking add.

#### Adding Refferences

  * Now you have all the code you need. You should be able to just click Test->Run->All Tests, right? Not quite. We are still missing some assembly references (as the debugger will gladly tell you if you try to build the project). Don't worry, this is easy to fix.
  * Right click on the project name again in the Solution Explorer. Select Add->Reference...
  * On the left hand side of the pop-up, click on Assemblies->Framework. Next, click the checkmark next to each of the following Assemblies:
    * System.Drawing
    * System.Web.Extensions
    * System.Windows
    * System.XML
    * System.Xml.Linq
  * Once all these are checked, click ok.
  * NOW you can click Test->Run->All Tests and you should see them all pass with flying colors. If a test fails, try to figure out why it failed and submit a fix. Or yell at the person who changed the code without fixing the tests until they fix it.

#### What's Next?
  * If all the tests pass, then you know you can use the files in the project. If you want to make changes to any of these files or extend them in any way, make sure that you write tests for your changes and that your changes don't break anyone ese's tests. 

### Running the Code
#### Creating an SVG Map

We have a simple converter that takes an image of the map in SVG format and creates a graph to make finding the shortest path between two rooms faster and easier. Our converter does not cover all the variety of SVG files, but strictly supports the maps generated the following way:

* Step 1
  * Install Microsoft Visio 2013 if you don't have one already
  
* Step 2
  * Take any map of the space in JPEG format and open it in Visio
    * WARNING: Other file types might work with this instructions but were not tested.
    * HINT: Cannot open your map in Visio? You might have to change the file type at the bottom right corner of the pop-up.
    ![Opening in Visio](/windows-on-fridges/img/map/1.jpg)
  * To make your future SVG map be easily extracted from the map you opened, create a new layer by going to Home -> Layers -> Layer properties -> New. Press "ok" after you’re done.
  ![New layer](/windows-on-fridges/img/map/2.jpg)

* Step 3
  * Use the line tool to draw all paths that you want the robot to wander. Make sure you "snap" the lines together if you want the two paths to actually be connected.
  ![Line tool](/windows-on-fridges/img/map/3.jpg)
  ![Paths](/windows-on-fridges/img/map/4.jpg)
  * Use the line tool to create little strokes crossing the paths at the places you want robot to be able to stop at. To make your web-app aware of the available stops, after creating each of the strokes left-click on it and choose data -> define shape data. In the pop-up input "officeNumber" as a title and the actual room number as value. Save. To check that the officeNumber has actually been set up or to change the officeNumber you can always use the pointer tool to select the stroke and view the shape data.
  ![Stops](/windows-on-fridges/img/map/5.jpg)
  ![Shape data](/windows-on-fridges/img/map/6.jpg)

* Step 4
  * A map is no good without the scale! To add the scale just put a line over something you know the actual length of, like a room or a hallway. Your map might have an actual scale at the bottom which you can use. Left-click on your scale and choose "define shape data". In the pop-up input "scale" as a title and the actual length as value. Save. 
  * Note that the units you put in the "value" field will be the units the program will use from now on. For example, if my scale is 15 meters, meters will be my units.
  ![Scale](/windows-on-fridges/img/map/7.jpg)
   
* Step 5
  * When you're done, save your Visio project to come back and modify your map whenever you want. 
  * After that, delete the underlying map image by selecting it with a pointer tool and pressing “delete” button.
  ![Before](/windows-on-fridges/img/map/8.jpg)
  ![After](/windows-on-fridges/img/map/9.jpg)
  * Make sure you don't have any particular shape selected to avoid having only this shape saved.
  * Go to file -> export -> change file type. Double-click on "SVG Scalable Vector Graphics". Save your map as "map.svg".

Congratulations! Your map is ready. You can view the generated SVG code by opening the map file in Notepad or Visual Studio.

#### Getting a Path
#### Running From Azure
 <Need Anna's help filling in>
