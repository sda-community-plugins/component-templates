# Microsoft .NET Web Application deployment to IIS

This component template is an example of how to deploy a Microsoft .NET Web application with a backend
database to Microsoft IIS. It mostly makes use of the Deployment Automation  "*IIS AppCmd*" plugin.

The template contains the following processes:

 - **deploy-to-iis**
   This process is the main deployment process that creates/updates an IIS Application Pool,
   Application and Site. It downloads the files stored in DA and synchronizes them into the
   IIS "*webroot*" directory. It also calls the update-connection-settings process to update the 
   entries in a "*ConnectionStrings.config*" file based on environment properties stored in DA. 
   Note: this process requires a "*flat*" structure of your application is stored in DA - although 
   you could also create a .Zip file and extract it as part of the process
 - **recycle-app-pool**
   This process simply recycles an Application Pool
 - **remove-form-iis**
   This process removes the data create in "*deploy-to-iis*", i.e. the Application Pool, Application 
   and Site
 - **update-connection-settings** 
   This process update the entries in a "*ConnectionStrings.config*" file based on 
   environment properties stored in DA.

In order to use the processes you will need to create a Deployment Automation system property
called "appcmd.commandPath" to refer to the location of the IIS AppCmd.exe program on your server,
e.g. "*C:\Windows\System32\inetsrv\*". Note that this property would be better set as a resource
property but is system wide here for simplicity.   
