# Microsoft .NET Web App deployment to IIS

This component template is an example of how to deploy a Microsoft .NET Web App (with a backend
database) to Microsoft IIS. It mostly makes use of the Deployment Automation 
[IIS AppCmd Plugin](http://help.serena.com/doc_center/sra/ver6_2_3/SDA_Plugin_Index/sra_plug_iisappcmd.html#sraiisappcmd).

The template contains the following processes:

 - **deploy-to-iis**  
   This process is the main deployment process that creates/updates an IIS Application Pool,
   Application and Site. It downloads the files from a component version stored in Deployment Automation and synchronizes them into the
   IIS `webroot` directory. It also calls the `update-connection-settings` process to update the 
   entries in a `ConnectionStrings.config` file based on environment properties stored in Deployment Automation.  
   
   Note: this process requires the complete structure of your application is stored in a component version Deployment Automation - although 
   you could also create a ".Zip" file and extract it as part of the process.
 - **recycle-app-pool**  
   This process simply recycles an Application Pool
 - **remove-from-iis**  
   This process removes the data created in `deploy-to-iis`, i.e. the Application Pool, Application 
   and Site
 - **update-connection-settings**  
   This process update the entries in a `ConnectionStrings.config` file based on 
   environment properties stored in Deployment Automation.

In order to use the processes you will need to create a Deployment Automation system property
called `appcmd.commandPath` that refers to the location of the IIS `AppCmd.exe` program on your server,
e.g. `C:\Windows\System32\inetsrv\`. This property would be better set as a resource
property but is system wide property here for simplicity.   
