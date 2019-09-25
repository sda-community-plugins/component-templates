# Deployment Automation Component Templates

This repository contains a number of example *Component Templates* that you can use to quick
start your Deployment Automation process modelling. The templates cover a wide range of tools 
and technologies that you might want to deploy to. They might also be a good source of inspiration
on how to process model as they encompass features and techniques that are probably
not that well understood.

Templates
---------

The following templates are available:

 - [dotnet-iis](dotnet-iis/)  
   An example of how to deploy a Microsoft .NET Web Application to Microsoft IIS - including updating
   database connection settings
   
 - [java-tomcat](java-tomcat/)  
   A example of how to deploy a Java Web application to Apache Tomcat potentially running on multiple platforms
   and also how to update/create an environment specific file usng Deployment Automation  "Configuration Templates"
   
 - [docker](docker/)  
   An example of how to deploy a "dockerized" application from a Registry such as [DockerHub](https://hub.docker.com/)
   
 - [adhoc-deploy](adhoc-deploy/)  
   An example of how to create an adhoc deployment process where the amount and type of
   inputs change each deployment time - this is typical for SQL or Oracle based applications
   
 - [db-deploy](db-deploy)  
   An example of how to use the Deployment Automation 
   [DB Upgrader](http://help.serena.com/doc_center/sra/ver6_2_3/SDA_Plugin_Index/sra_plug_dbupgrader.html#sradbupgraderplug) 
   plugin to upgrade and rollback database versions using XML changesets.

Usage
-----
   
To make use of the templates:

 1. Clone or download this repository from GitHub; e.g. to clone:  
 `git clone https://github.com/sda-community-plugins/component-templates.git`
 1. Login to Deployment Automation as an administrative user
 1. Navigate to **_Components -> Component Template -> Import Template_** and browse to the
relevant "*.json*" file for the template you wish to import.
 1. Once imported, create a new component and in the **Template** field select the template
 that has been imported.
 
Note: most of the templates have no **Source Config Type** defined so you are free to select
the type that corresponds to your own version control, build tool or artifact repository.

---

If you have any comments, suggestions or find any issues with these templates then please 
contact me at [kevin.lee@microfocus.com](mailto:kevin.lee@microfocus.com) 

Kevin Lee        
 
 
