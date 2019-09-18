# Deployment Automation Component Templates

This repository contains a number of example Component Templates that you can use to quick
start your deployment process modelling for a large number of tools and technologies.

The following templates are available:

 - [dotnet-iis|]
   an example of how to deploy a Microsoft .NET Web Application to Microsoft IIS and update
   database connection settings
   
 - [java-tomcat|]
   an example of how to deploy a Java Web application to Apache Tomcat on multiple platforms
   
 - [docker-app|]
   an example of how to deploy a dockerized application from [DockerHub|https://hub.docker.com/]
   
 - [adhoc-deploy]
   an example of how to create an adhoc deployment process where the amount and type of
   inputs change each time, this is typical for SQL or Oracle based applications
   
To make use of the components:

 - clone or download this repository from GitHub
 - login to Deployment Automation as an administrative user
 - navigate to "*Components -> Component Template -> Import Template*" and browse to the
relevant "*.json*" file for the template you wish to import.
 - once imported create a new component and in the "*Template*" field select the template
 that has been imported.
 
Note: most of the templates have no "Source Config Type" defined so you are free to select
your own version control, build tool or artifact repository.

If you have any comments suggestions on these processes then please contact me at 
[kevin.lee@microfocus.com|mailto:kevin.lee@microfocus.com]         
 
 
