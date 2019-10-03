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
 - **build-and-push**  
   This process builds a docker image from a **Dockerfile** and pushes it to the system Docker Registry. 
 - **pull-and-run**  
   This is the main process that "pulls" a version (tag)  of an image from the Registry and runs a container based on it.
   It creates a container with the value of the environment property **SERVER_HOST** which by default is the name of the component. If
   there is a container of the same name already running it stops (and if required) removes it so that it the container
   is always successfully run. The process also inspects the resultant container to see if it *running& and has not *exited*.   
 - **build-push-and-run**  
   This process simply calls the **build-and-push** and **pull-and-run** processes above.   
 - **execute-command**  
   This process allows you to execute a command in the currently running container.   
 - **stop-container**  
   This process stops the currently running container.  
 - **restart-container**  
   This process restarts the container if it is currently running or starts it if not.  
 - **remove-container**  
   This process stops and removes the container for the current environment.  
 - **get-server-ip**  
   This process gets the IP address of the server and creates or updates an environment property called **primary.ip* with
   the resultant value. This is useful for dynamic against or for testing of user interfaces as in the following process.
 - **verify-ui**  
   This process verifies that a web user interface is accessible by using the [Deploy Tools](http://help.serena.com/doc_center/sra/ver6_3/SDA_Plugin_Index/sra_plug_deptools.html#sradeptoolsplug)
   plugin's **Wait for web page** step. 

Properties
----------

The template includes the following environment properties that you should set for each [Application
Environment](http://help.serena.com/doc_center/sra/ver6_3/sda_help/sra_ui_appenvs.html#srauienv):

Property Name                             | Description
------------------------------------------|----------------------------------------------------------------------
*SERVER_HOST*                             | The hostname that the service will run on (used to name the container) by default it is component name.
*SERVER_PORT*                             | The port that the service will run on 
*container.links*                         | Name of any containers to link to (legacy feature)
*primary.ip*                              | Primary IP address of server (retrieved and set using get-server-ip process) 

If you are using a Registration and Discovery service like [Netflix Eureka](https://github.com/Netflix/eureka) then you can also
set the following propertes:

Property Name                             | Description
------------------------------------------|----------------------------------------------------------------------
*EUREKA_HOST*                             | The hostname of the (Eureka) registration and discovery server
*EUREKA_PORT*                             | The TCP port of the (Eureka) registration and discovery serve
*EUREKA_CLIENT_SERVICEURL_DEFAULTZONE*    | The full address of the (Eureka) registration and discovery server

In order to use the processes you will also need to create the following Deployment Automation 
[System Properties](http://help.serena.com/doc_center/sra/ver6_3/sda_help/sra_adm_sys_properties.html):

Property Name                             | Description
------------------------------------------|----------------------------------------------------------------------
*docker.registry*                         | The tcp addres of the Registry, e.g. mydomain.com:5000/ (please include trailing slash)
*docker.username*                         | If basic authentication, a username to login to the registry
*docker.password*                         | If basic authentication, a password of the user to login to the registry

If you are using [DockerHub](https://hub.docker.com/) you can leave `docker.registry` blank. For production usage this 
property would be better set as a [Resource Property](http://help.serena.com/doc_center/sra/ver6_3/sda_help/sra_resource_props.html#sraresourceprops)
 but is system wide property here for simplicity. 
 
Note: the implementation manages a single version (tag) of an container for each environment. If you wanted to
run multiple versions (tags) in a single environment you can add a postfix to the **SERVER_HOST** property, i.e. *MYSERVICE-INT*
for an Integration environment.

Files
-----

 - [docker.json](docker.json)  - the component template
 - [jetty.json](jetty.json) - an example component that uses the template to deploy different versions of the [Jetty](https://hub.docker.com/_/jetty) image.
 - [example](example) - a more comprehensive example which has multiple services and deploys the [Ring2Park Microservices](https://github.com/ring2park-microservices) application.
