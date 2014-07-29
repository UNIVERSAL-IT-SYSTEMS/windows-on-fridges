---
aliases:
- /doc/azure/
date: 2014-07-01
linktitle: Azure 
menu:
  main:
    parent: web services 
next: /windows-on-fridges/webservices/webapp
notoc: true
prev: /windows-on-fridges/nodebot/wifiadapter
title: Azure 
weight: 60
---

## Setting up Azure

To host our web services on Azure you will need five main components that will be referred to as:

  1.Web-app  (a UI to call the robot to a room), which will be created in the [web-app wiki](http://ms-iot.github.io/windows-on-fridges/webservices/webapp/)
  
  2.Mobile Services (SQL server and database to store requests)
  
  3.Storage (place to store your map of the space)
  
  4.Cloud services (server that will run pathfinding once the request is made)
  
  5.Nodebot Server (server that posts requests to robot)
  


#### Step 1.

However, you should start with creating Azure account. You can either [start a free 30-day trial](http://azure.microsoft.com/en-us/pricing/free-trial/) or go ahead and [buy a subscription](http://msdn.microsoft.com/en-US/library/azure/hh531793.aspx#BKMK_AdminGuidelines). 

#### Step 2. 

For this project you will need [Visual Studio](http://www.visualstudio.com/en-us/visual-studio-homepage-vs.aspx) installed. While much of it can be done using git, some things, like manually uploading files to Azure Storage, are still unavailable any other way but through Visual Studio. Besides that, Azure SDK for Visual Studio is a very convenient way to publish changes to your code to Azure.

Get Azure SDK for Visual Studio. You can use [this installer](http://www.microsoft.com/web/downloads/platform.aspx) to get the one you need.

#### Step 3.

Now that you have an account you can go to your Management portal and create Mobile services.

* Go to Azure.microsoft.com -> Management portal. Sign in to your Azure account.
* At the bottom of the page click New -> Compute -> Mobile service -> create

<img src="/windows-on-fridges/img/azure/1.jpg" style='width:100%;' border="0" alt="Null">
 
* Type in the URL for your mobile service. This URL will later be referred to as your mobile service host. From the Database dropdown choose creating a new database. For region choose the region that is closest to you. For backend choose JavaScript. Leave other settings unchanged. Press the arrow at the bottom right corner. 

<img src="/windows-on-fridges/img/azure/2.jpg" style='width:70%;' border="0" alt="Null">

* Choose “New SQL database server” and input server login and password. You will have to enter these credentials later on, so try to not forget them!  Leave other settings unchanged. Press the checkmark symbol.
* You need to wait for the service to be created. It will take about a minute. When the status says “ready”, the mobile service is created.

Now that you created mobile services, you need to create the database schema that the app is using

* For that, go to your new mobile service - > DATA. Press “add a table”. 

<img src="/windows-on-fridges/img/azure/3.jpg" style='width:50%;' border="0" alt="Null">

* Enter “offices” as a table name. Leave other settings unchanged. Press the checkmark symbol. You need to wait for the table to be created. It will take about a minute.

<img src="/windows-on-fridges/img/azure/4.jpg" style='width:70%;' border="0" alt="Null">
 
* When the table is created, click on it. Go to COLUMNS. Press ADD COLUMN at the bottom.
Add the following columns: "office" (string), "cancelled" (boolean), "complete" (boolean).

* Add another table titled “Feedback”: Go to your new mobile service - > DATA. Press “add a table”. Enter “Feedback” as a table name. Leave other settings unchanged. 

* Press the checkmark symbol. When the table is created, click on it. Go to COLUMNS. Press ADD COLUMN at the bottom.
Add the following column: "text" (string). 

Now you have Mobile service and database set up! If you want to study Azure Mobile Services more in-depth, go to http://azure.microsoft.com/en-us/documentation/articles/mobile-services-html-how-to-use-client-library/#querying.

#### Step 6. 

Now let’s create a new storage. 

* At the bottom of the page click new -> Data services -> Storage -> Quick Create. Input your storage URL and closest geo location to you. Leave other settings unchanged. Press “Create storage account”. You need to wait for the storage to be created. It will take about a minute.
* Now in the panel on the left, choose STORAGE and go to your new storage account. Go to CONTAINERS tab. Create a container called “maps”. Choose “Public Blob” in Access dropdown. Press the checkmark symbol. 
* While the storage is being created you can go on with the instructions.
* To find out more about storage go to http://azure.microsoft.com/en-us/documentation/articles/storage-dotnet-how-to-use-blobs/ 

#### Step 7.

Create cloud services where all the pathfinding will be happening. 

* At the bottom of the page click new -> Compute -> Cloud Service -> Quick Create. Input your cloud services URL and closest geo location to you. Leave other settings unchanged. Press “Create cloud service”.
* While the cloud service is being created you can go on with the instructions.
* To find out more about cloud services go to http://azure.microsoft.com/en-us/documentation/services/cloud-services/

#### Step 8. 

To create a Nodebot Server you need a web site. In this step we will create the website on Azure, clone the nodebot-server repository, and publish the source files to your new Azure website using git. If you already done any of this steps while following [the Nodebot Server wiki](http://ms-iot.github.io/windows-on-fridges/nodebot/server/), you can skip them this step.

* Click the + NEW icon on the bottom left of the portal. Click WEB SITE, then QUICK CREATE. Enter a value for URL. The URL you input for your website will be later referred to as “nodebot host” in Pathfinding wiki. Select the datacenter for your web site in the REGION dropdown. Leave other settings unchanged. Click the checkmark at the bottom of the dialog. You need to wait for the website to be created. It will take about a minute.
* Once the web site status changes to Running, click on the name of the web site to access the Dashboard.
* At the bottom right of the Quickstart page, select Set up a deployment from source control.

<img src="/windows-on-fridges/img/azure/6.png" style='width:100%;' border="0" alt="Null">


* When asked "Where is your source code?" select Local Git repository, and then click the arrow.

<img src="/windows-on-fridges/img/azure/7.png" style='width:80%;' border="0" alt="Null">

* To enable Git publishing, you must provide a user name and password. If you have previously enabled publishing for an Azure Web Site, you will not be prompted for the user name or password. Instead, a Git repository will be created using the user name and password you previously specified. Make a note of the user name and password, as they will be used for Git publishing to all Azure Web Sites you create.
* Get the nodebot code from Github:

        git clone http://github.com/ms-iot/wof-nodebot-server    
        
* Find out URL to you local repository in Azure management portal: go to your nodebot website -> DEPLOYMENTS. Copy the GIT URL at the top right corner. 

<img src="/windows-on-fridges/img/azure/8.jpg" style='width:80%;' border="0" alt="Null">

* Now in the folder your local repository is perform the following commands:

        git remote add azure [URL for remote repository you just copied]
        git push azure master    
    
* You can find out more about deploying to Azure from git at http://azure.microsoft.com/en-us/documentation/articles/web-sites-nodejs-develop-deploy-mac/


#### Now you have four out of five components set up for your Web Services. You already deployed the nodebot source files in step 7, and your mobile services are ready as well. In the next tabs you can find out how to create the web-app, upload the map to your storage, and set up cloud services to do pathfinding.

