---
aliases:
- /doc/webapp/
date: 2014-07-01
linktitle: Webapp 
menu:
  main:
    parent: web services 
next: /windows-on-fridges/webservices/map
notoc: true
prev: /windows-on-fridges/webservices/azure
title: Web App 
weight: 70
---

## Web App

Our web application is a simple one-page app that has responsive design and can be used to call the robot to a certain room, cancel the request to a certain room, check on the request status, and submit feedback.

<img src="/windows-on-fridges/img/app/0.jpg" style='width:60%;' border="0" alt="Null">

* Submitting the request:
 To submit request the user needs to submit an office number to deliver a drink to and press “fetch the fridge” button.

* Cancelling the request:
 After request is submitted it can be cancelled by pressing the “Cancel request” button

* Check on the status:
 If the drink is already on a way to a submitted room, the web app will inform a user.

* Submit feedback:
 The submit feedback field is at the bottom of the page. The feedback is sent to the owner’s email and stored at the database.

To get the web app to work, you should have [set up your Azure account](http://ms-iot.github.io/windows-on-fridges/webservices/azure/). Now you can get this web-app to run on Azure and work with your mobile services!

#### Step 1.

* Get the source files by cloning the git repository at https://github.com/ms-iot/wof-webapp.git

        git clone https://github.com/ms-iot/wof-webapp.git

#### Step 2.
 
Prepare your database to send you the feedback from the app. We will use [SendGrid](http://sendgrid.com/) for that. If you don't want to receive emails from your web-app with feedback people leave, skip this step.

  * Follow [these instructions](http://azure.microsoft.com/en-us/documentation/articles/sendgrid-dotnet-how-to-send-email/) to get a free SendGid account and get your SendGrid username and password.
  * Open "insertFeedbackScript.js" from the files you got from Git in any editor. Replace "[your sendgrid username]" with your SendGrid username, "[your sendgrid password]" with your SendGrid password, and "youremail@host.com" with the email you want to use for feedback. Save.
  * In your Azure manegement portal, go to your mobile service -> DATA -> Feedback -> SCRIPT. Copy the code from insertFeedbackScript.js instead of the script that handles the insert at the moment. Save at the bottom of the page.

<img src="/windows-on-fridges/img/app/6.jpg" style='width:100%;' border="0" alt="Null">

#### Step 3.

* Open “page.js” from the files you got from Git in any editor. At the very top of the page replace “[your address]” with the address of your mobile service, and "[your key]" with the application key to your mobile service.

<img src="/windows-on-fridges/img/app/1.jpg" style='width:100%;' border="0" alt="Null">
 
  * HINT: To find your key navigate to your mobile services in Azure Management Portal and press “Manage keys” at the bottom. Copy the application key from the pop-up.

<img src="/windows-on-fridges/img/cloudServices/8.jpg" style='width:70%;' border="0" alt="Null">

* Save page.js

#### Step 4.

Create the website project:

  * In Visual Studio, go to File  -> New - > Website … 

<img src="/windows-on-fridges/img/app/2.jpg" style='width:100%;' border="0" alt="Null">
   
  * In the pop-up choose ASP.NET empty website. Click “ok”.

<img src="/windows-on-fridges/img/app/3.jpg" style='width:100%;' border="0" alt="Null">
 
  * Copy source files you got from git (including page.js you modified), except "insertFeedbackScript.js". In Solution Explorer in visual Studio right-click on your web site, and click "paste" You source files should appear in Soution Explorer. 

<img src="/windows-on-fridges/img/app/7.jpg" style='width:70%;' border="0" alt="Null">

#### Step 5.

Publish your website to Azure:

  * Go to Solution Explorer, right-click on your website and choose “Publish Web Site” from the dropdown.
  * In the pop-up click on "Windows Azure Web Sites"

<img src="/windows-on-fridges/img/app/8.jpg" style='width:70%;' border="0" alt="Null">

  * In the next pop-up sign into your Azure account if you are not singed in and choose the subscription you want to use. Click “Next”.
  
  * Just right to the “Existing Web Sites” dropdown choose "New...".

<img src="/windows-on-fridges/img/app/9.jpg" style='width:70%;' border="0" alt="Null">
 
  * In the next window, for Site name input the URL you want your web-app to be located at. This will be the actual URL of your web-app used to fetch the robot. Choose your region. Choose the database you just created for mobile services. Input login and password you created when creating your mobile services. Hit “Create”.
  * HINT: Don’t remember your database name? In Azure management portal go to your mobile service CONFIGURE tab. The database name is at the top.

<img src="/windows-on-fridges/img/app/10.jpg" style='width:70%;' border="0" alt="Null">

  * When the website is created, hit "Publish". When it is published, the browser window will open up and you will be able to start using your new web-app.

<img src="/windows-on-fridges/img/app/11.jpg" style='width:70%;' border="0" alt="Null">

#### Step 6.

* Now you have to give permissions to your website to connect to your mobile services. In Azure management portal go to mobile services you created. Open CONFIGURE tab. Under "Cross-Origin Resource Sharing (cors)" line add your website’s URL. 

<img src="/windows-on-fridges/img/azure/5.jpg" style='width:80%;' border="0" alt="Null">
 
* Press “save” at the bottom of the page.


Now your website is created!
Note that if you haven’t [uploaded the map of the space](http://ms-iot.github.io/windows-on-fridges/webservices/map/) yet, your web app will accept any room numbers to enable testing. Once you upload the map, your map will only accept office numbers present on the map.

