# Deployment Automation Component Templates

This repository contains a number of example Component Templates that you can use to quick
start your Deployment Automation process modelling. It encompasses a large number of tools and technologies
that you might want to deploy

The following templates are available:

 - [dotnet-iis](dotnet-iis/)  
   An example of how to deploy a Microsoft .NET Web Application to Microsoft IIS and update
   database connection settings
   
 - [java-tomcat]()  
   A example of how to deploy a Java Web application to Apache Tomcat on multiple platforms
   
 - [docker-app]()  
   An example of how to deploy a "dockerized" application from [DockerHub](https://hub.docker.com/)
   
 - [adhoc-deploy]()  
   An example of how to create an adhoc deployment process where the amount and type of
   inputs change each time, this is typical for SQL or Oracle based applications
   
To make use of the components:

 1. Clone or download this repository from GitHub
 1. Login to Deployment Automation as an administrative user
 1. Navigate to `Components -> Component Template -> Import Template` and browse to the
relevant "*.json*" file for the template you wish to import.
 1. Once imported, create a new component and in the `Template` field select the template
 that has been imported.
 
Note: most of the templates have no "**Source Config Type**" defined so you are free to select
your own version control, build tool or artifact repository.

If you have any comments suggestions on these processes then please contact me at 
[kevin.lee@microfocus.com](mailto:kevin.lee@microfocus.com)         
 
 
