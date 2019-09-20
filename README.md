# Deployment Automation Component Templates

This repository contains a number of example Component Templates that you can use to quick
start your Deployment Automation process modelling. The templates cover a wide range of tools 
and technologies that you might want to deploy to. They are also a good source of inspiration
on to process model as they include a number of features and techniques that are probably
not that well understood by the community of users.

The following templates are available:

 - [dotnet-iis](dotnet-iis/)  
   An example of how to deploy a Microsoft .NET Web Application to Microsoft IIS and update
   database connection settings
   
 - [java-tomcat](java-tomcat/)  
   A example of how to deploy a Java Web application to Apache Tomcat on multiple platforms
   and update/create an environment specific file usng "Configuration Templates"
   
 - [docker-app](docker-app/)  
   An example of how to deploy a "dockerized" application from [DockerHub](https://hub.docker.com/)
   
 - [adhoc-deploy](adhoc-deploy/)  
   An example of how to create an adhoc deployment process where the amount and type of
   inputs change each time, this is typical for SQL or Oracle based applications
   
To make use of the templates:

 1. Clone or download this repository from GitHub; to clone:  
 `git clone https://github.com/sda-community-plugins/component-templates.git`
 1. Login to Deployment Automation as an administrative user
 1. Navigate to **_Components -> Component Template -> Import Template_** and browse to the
relevant "*.json*" file for the template you wish to import.
 1. Once imported, create a new component and in the **Template** field select the template
 that has been imported.
 
Note: most of the templates have no **Source Config Type** defined so you are free to select
the type that corresponse to your own version control, build tool or artifact repository.

If you have any comments, suggestions or find any issues with these templates then please 
contact me at [kevin.lee@microfocus.com](mailto:kevin.lee@microfocus.com) 

Kevin Lee        
 
 
