# Docker Deployment Template

This Component Template is an example of how to deploy a Docker Application from a local or remote Registry such as
[DockerHub](https://hub.docker.com/). 
It primarily makes use of the Deployment Automation 
[Docker](http://help.serena.com/doc_center/sra/ver6_3/SDA_Plugin_Index/sra_plug_docker.html#dockerplug) plugin.

Processes
---------

The template contains the following processes:

 - **create-component-version** 
   This process can be used to create a new [Component Version](http://help.serena.com/doc_center/sra/ver6_3/sda_help/ConcCompVer.html#concept651)
   that corresponds to the tag of the Docker image. This version (tag) can then be selected in the **pull-and-run** 
   process below.  
 - **pull-and-run** 
   This is the main process that "pulls" a version (tag)  of an image from the Registry and runs a container.
   It creates a container with the name of the component and environment, e.g. myimage-integration. If
   there is a container of the same name already running it stop (and if required) removes the existing
   container so that it can always be run. The environment property **container-name** is set automatically
   so that it can be used by other processes.    
 - **execute-command**  
   This process allows you to execute a command in the currently running container.   
 - **stop-container**  
   This process stops the currently running container (if it is).  
 - **restart-container**  
   This process restarts the container if it is currently running or starts it if not.  
 - **remove-container**
   This process stops and removes the container for the current environment.  

Properties
----------

The template includes the following environment properties that you should set for each [Application
Environment](http://help.serena.com/doc_center/sra/ver6_3/sda_help/sra_ui_appenvs.html#srauienv):

Property Name                             | Description
------------------------------------------|----------------------------------------------------------------------
*container.port*                          | The internal port of the docker container to be mapped
*host.port  *                             | The external (host) port of the container that is mapped to the internal port
*container.name*                          | The name of the currently running container for the environment

In order to use the processes you will also need to create a Deployment Automation 
[System Property](http://help.serena.com/doc_center/sra/ver6_3/sda_help/sra_adm_sys_properties.html)
called `docker.registry ` that refers to the Docker Registry that you are using [DockerHub](https://hub.docker.com/)
you can leave this blank or else set it to your registry address, e.g. `myserver:5000/`. For production usage this 
property would be better set as a [Resource Property](http://help.serena.com/doc_center/sra/ver6_3/sda_help/sra_resource_props.html#sraresourceprops)
 but is system wide property here for simplicity. 
 
Note: the current implementation manages a single version (tag) of an container for each environment. If you wanted to
run multiple versions (tags) in a single environment you would need to updates the creation of the **container.name**
property to include the version (tag).

Files
-----

 - [docker.json](docker.json)  - the component template
 - [jetty.json](jetty.json) - an example component that uses the templateto deploy different versions of the [Jetty](https://hub.docker.com/_/jetty) image.
