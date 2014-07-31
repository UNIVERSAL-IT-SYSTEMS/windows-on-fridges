---
aliases:
- /doc/pathfinding/
date: 2014-07-01
linktitle: Pathfinding 
menu:
  main:
    parent: web services 
next: /windows-on-fridges/community/press
notoc: true
prev: /windows-on-fridges/webservices/map
title: Path Finding
weight: 90
---

## Path Finding

Pathfinding is a process that happens on the cloud from the moment a user requests a dink to his room to the moment when robot gets the directions how to get there. To make it fairly simple, we used the map of the space to implement indoor navigation. The map is used to create a special scheme of the space in SVG format. Than we convert this scheme from SVG to graph structure, where every room becomes a node and every path becomes an edge. Than we use greedy search to find the shortest path between two nodes (rooms). The resulting path is translated into JSON array of instructions for the robot. They include the angle to turn and the distance to go in this direction. You can find out how to create an SVG map [here](http://ms-iot.github.io/windows-on-fridges/webservices/map/).

* To access the source files clone the git repository at https://github.com/ms-iot/wof-pathfinding.git 

        git clone https://github.com/ms-iot/wof-pathfinding.git


### Running pathfinding locally

To try out the pathfinding algorithm locally you can use a console application we created. You do need to [create a map](http://ms-iot.github.io/windows-on-fridges/webservices/map/) first to run the pathfinding.

* Find “wof-pathfinding.exe” in the files you got from GitHub and run it. 

Congratulations! Now you can convert your map into a graph and run pathfinding on it.

### Running Pathfinding From Azure

To deploy pathfinding to Azure you have to go through and [set up Azure account with all necessary services](http://ms-iot.github.io/windows-on-fridges/webservices/azure/) first.

#### Step 1.

* In Visual Studio, create new cloud services with one worker role:
  * Go to File -> New -> Project -> Cloud -> Windows Azure Cloud Service. Input your cloud service name. Leave other settings unchanged. Press “ok”.

<img src="/windows-on-fridges/img/cloudServices/3.JPG" style='width:100%;' border="0" alt="Null">

  * In the next menu, choose one worker role, press “ok”.

<img src="/windows-on-fridges/img/cloudServices/4.JPG" style='width:80%;' border="0" alt="Null">
 
#### Step 2.

  * Delete “Main.cs” and “wof-pathfinding.exe” from source files you got from GitHub. These files are for running pathfinding locally.
  * Copy source files from the folder "classes". In Solution explorer right-click on your solution inside the cloud services project and click "paste". The source files should appear in solution explorer.

#### Step 3.

* Connect your worker role to the right storage account (the one you uploaded your SVG map to):
  * In solution explorer navigate to Roles -> WorkerRole. Right-click on it and double click on “Properties”.

<img src="/windows-on-fridges/img/cloudServices/6.jpg" style='width:70%;' border="0" alt="Null">
 
  * In the properties window choose “Settings”. At the end of the setting that has the type “Connection String” and value “UseDevelopmentStorage=true” click on the button with three dots. In the pop-up choose “Your subscription” and choose the correct storage account name from the dropdown. Press ok.

<img src="/windows-on-fridges/img/cloudServices/7.jpg" style='width:80%;' border="0" alt="Null">

#### Step 4.

  * Open WorkerRole.cs by double-clicking it in Solution Explorer.
  * At the top of worker role class replace [your mobile services host] by your mobile services host name. It will look like “something.azure-mobile.net”.
  * Replace [your key] with the security key to your mobile services.
    * HINT: To find your security key navigate to your mobile services in Azure Management Portal and press “Manage keys” at the bottom. Copy the application key from the pop-up.

<img src="/windows-on-fridges/img/cloudServices/9.jpg" style='width:60%;' border="0" alt="Null">

  * Replace [your nodebot host] with the host name for your nodebot app hosted on Azure. It will look like “something.azurewebsites.net”.

<img src="/windows-on-fridges/img/cloudServices/8.jpg" style='width:50%;' border="0" alt="Null">
 
  * If you did not name the tables in your database “Offices” and "Requests", change “requests_table_name” and "offices_table_name" to your table names.
  * If you did not name the container in your storage that contains the map “maps”, change the “container_name” to your container name.

#### Step 5.

* Try running your cloud services locally by pressing f5. 

#### Step 6. 

* Publish your cloud services to Azure:
  * Go to Solution Explorer, right-click on your cloud services and choose “Publish” from the dropdown.

<img src="/windows-on-fridges/img/cloudServices/10.jpg" style='width:70%;' border="0" alt="Null">
 
  * Sign into your Azure account if you are not singed in and choose the subscription you want to use. Click “Next”.
  * In the “cloud service” dropdown choose the cloud service you created previously for pathfinding. Click “Next”.
  * Make sure that it says “New profile” at the top and the storage that has your SVG map in the “Storage account” line. Hit “Publish”.
  * Publishing might take a few minutes. Windows Azure Activity Log will tell you when the deployment is done. 

<img src="/windows-on-fridges/img/cloudServices/11.jpg" style='width:100%;' border="0" alt="Null">
    
  * You can also check the status of your deployment in the Management Portal.

<img src="/windows-on-fridges/img/cloudServices/12.JPG" style='width:70%;' border="0" alt="Null">
 
 
#### Don’t have a nodebot set up or the robot ready yet?
Just comment out the line that sends the instructions to Robot. It is in WorkerRole.cs in Run function.

<img src="/windows-on-fridges/img/cloudServices/13.jpg" style='width:80%;' border="0" alt="Null">


### Editing and Testing the Code

#### Create a Unit Test Project

* The first step is to make sure the code works. Create a new test project by opening Visual Studio and going to File->New->Project at the top.

<img src="/windows-on-fridges/img/creating-test-project/file-new-project.png" style='width:80%;' border="0" alt="Null">

* On the left hand side of the pop-up window, select Installed->Templates->Visual C#->Test. Then in the middle part of the pop-up, click on Unit Test Project. Having a Unit Test Project will allow you to easily run all the tests at once. If you change anything in the code, you can quickly know whether it broke something else. Be sure to change the name of the project at the bottom. We called ours PathFindingTests, but you can name yours whatever you like. Press ok when you are done.

<img src="/windows-on-fridges/img/creating-test-project/new-unit-test-project.png" style='width:80%;' border="0" alt="Null">

#### Adding the Files

* Right click on the project name in the solution explorer (found on the right hand side). Select Add->New Folder as shown in the picture. Do this twice, naming one "tests" and the other "classes".

<img src="/windows-on-fridges/img/creating-test-project/add-folder.png" style='width:70%;' border="0" alt="Null">

* Once you have downloaded the files, copy the files from "classes" folder that you got from GitHub, except WorkerRole.cs. Right click on the newly created classes file. Select "paste". Do the same with the tests folder, by copying all the files from github's test folder and clicking paste.

#### Adding References

* Now you have all the code you need. You should be able to just click Test->Run->All Tests, right? Not quite. We are still missing some assembly references (as the debugger will gladly tell you if you try to build the project). Don't worry, this is easy to fix.
* Right click on the project name again in the Solution Explorer. Select Add->Reference...

<img src="/windows-on-fridges/img/creating-test-project/add-reference.png" style='width:70%;' border="0" alt="Null">

* On the left hand side of the pop-up, click on Assemblies->Framework. Next, click the checkmark next to each of the following Assemblies:
    * System.Drawing
    * System.Web.Extensions
    * System.Windows
    * System.XML
    * System.Xml.Linq
* Once all these are checked, click ok.

<img src="/windows-on-fridges/img/creating-test-project/picking-references.png" style='width:80%;' border="0" alt="Null">

* NOW you can click Test->Run->All Tests and you should see them all pass with flying colors. If a test fails, try to figure out why it failed and submit a fix. Or yell at the person who changed the code without fixing the tests until they fix it.

#### What's Next?

* If all the tests pass, then you know you can use the files in the project. If you want to make changes to any of these files or extend them in any way, make sure that you write tests for your changes and that your changes don't break anyone ese's tests.

 
#### Testing your cloud services.

There are few functions in WorkerRole.cs that you can use to do partial testing with your changes. 

* storeResultingPath stores an image with the generated path in your storage wher you put map.svg. 

* getDummieRecords creates a list of Record objects from the list of officeNumbers you give it. 

