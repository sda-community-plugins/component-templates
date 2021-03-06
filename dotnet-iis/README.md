# Microsoft .NET Web App deployment to IIS

This Component Template is an example of how to deploy a Microsoft .NET Web App (with a backend
database) to Microsoft IIS. It primarily makes use of the Deployment Automation 
[IIS AppCmd](http://help.serena.com/doc_center/sra/ver6_2_3/SDA_Plugin_Index/sra_plug_iisappcmd.html#sraiisappcmd) plugin.

Processes
---------
The template contains the following processes:

 - **deploy-to-iis**  
   This process is the main deployment process that creates/updates an IIS Application Pool,
   Application and Site. It downloads the files from a [Component Version](http://help.serena.com/doc_center/sra/ver6_3/sda_help/ConcCompVer.html#concept651)
   stored in Deployment Automation and synchronizes 
   them into the  IIS `webroot` directory. It also calls the **update-connection-settings** process below to update the 
   entries in a `ConnectionStrings.config` file using [Application Environment Properties](http://help.serena.com/doc_center/sra/ver6_3/sda_help/ProcAppEnvPropsNew.html#task586)
   stored in Deployment Automation.  
   
   Note: this process requires the structure of your web application is represented in a Component Version in Deployment 
   Automation - although you could also create a ".Zip" file and extract it as part of the process.
 - **recycle-app-pool**  
   This process simply recycles an Application Pool
 - **remove-from-iis**  
   This process removes the data created in **deploy-to-iis**, i.e. the Application Pool, Application 
   and Site
 - **update-connection-settings**  
   This process update the entries in a `ConnectionStrings.config` file using
   environment properties stored in Deployment Automation.

Properties
----------

The template includes the following environment properties that you should set for each Deployment Automation
Application Environment:

Property Name                             | Description
------------------------------------------|----------------------------------------------------------------------
**appPool.fwk**                           | The .NET Framework version that the application is using
**appPool.name**                          | The name of the Application Pool that the application will use
**database.name**                         | The name of the database that the application will use
**database.server**                       | The name of the server where the database resides
**database.username**                     | The name of the user that connects to the database
**database.password**                     | The password of the database user
**parent.name**                           | The name of the website's parent to place it in the hierarchy, e.g. DefaultWebsite
**physicalPath.dir**                      | The full path to the applications's website root on the filesystem
**site.name**                             | The name of the web site
**site.bindings**                         | The bindings to be applied to the website, e.g. HTTP port etc
**virtualPath.name**                      | The virtual path to the website when accessed from a browser

In order to use the processes you will also need to create a Deployment Automation 
[System Property](http://help.serena.com/doc_center/sra/ver6_3/sda_help/sra_adm_sys_properties.html)
called `appcmd.commandPath` that refers to the location of the IIS `AppCmd.exe` program on your server,
e.g. `C:\Windows\System32\inetsrv\`.  For production usage this property would be better set as a [Resource
Property](http://help.serena.com/doc_center/sra/ver6_3/sda_help/sra_resource_props.html#sraresourceprops)
 but is system wide property here for simplicity.   

Files
-----

 - [dotnet-iis.json](dotnet-iis.json) - the component template
 
