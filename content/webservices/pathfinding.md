---
aliases:
- /doc/pathfinding/
date: 2014-07-01
linktitle: Pathfinding 
menu:
  main:
    parent: web services 
next: /community/contributing
notoc: true
prev: /webservices/webapp
title: Path Finding
weight: 80
---

## Path Finding
###Editing and Testing the Code

####Create a Unit Test Project
* If you haven't already, download Visual Studio. <link> //Should this be in getting started?
* The first step is to make sure the code works. Create a new test project by opening Visual Studio and going to File->New->Project at the top.
* On the left hand side of the pop-up window, select Installed->Templates->Visual C#->Test. Then in the middle part of the pop-up, click on Unit Test Project. Having a Unit Test Project will allow you to easily run all the tests at once. If you change anything in the code, you can quickly know whether it broke something else. Be sure to change the name of the project at the bottom. We called ours PathFindingTests, but you can name yours whatever you like. Press ok when you are done.

####Adding the Files
* Now that you have a brand new Unit Test Project, you need to add the test files, and the files you need to run those tests... These can be found on our github <link>. <Instructions for forking, cloning, etc., or links to them>
* While those files are downloading, create a place to put them in your project. The files will be sorted into classes and tests so let's make two folders in our project labeled classes, and tests. Right click on the project name in the solution explorer (found on the right hand side). Select Add->New Folder as shown in the picture. Do this twice, naming one "tests" and the other "classes".
* Once you have downloaded the files, right click on the newly created classes file. Select Add->Existing Item... Find the place where you downloaded the wof-webapp code. In wof-webapp->App_Code, open the classes folder and select all the files in there. Click add. Do the same with the tests folder, selecting all the files from github's test folder and clicking add.

####Adding Refferences
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

####What's Next?
* If all the tests pass, then you know you can use the files in the project. If you want to make changes to any of these files or extend them in any way, make sure that you write tests for your changes and that your changes don't break anyone ese's tests. 

###Running the Code
* <Need Anna's help filling in>
