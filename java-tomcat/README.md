# Java Tomcat Deployment Template

This component template is an example of how to deploy a Java Web Archive (.WAR) to [Apache Tomcat]. It mostly makes use of the Deployment Automation 
[Apache Tomcat](http://help.serena.com/doc_center/sra/ver6_2_3/SDA_Plugin_Index/sra_plug_tomcat.html#sratomcatplug) plugin.

Processes
---------

The template contains the following processes:

 - **tomcat-deploy**  
   This is the main process that deploys a Java Web Application (.WAR) file into Tomcat using the
   Tomcat Manager API. It makes sure that Tomcat is running so that the API is accessible; on Windows
   it will also force a restart so that there are no problems with locked files.
   
   The process also illustrates how to update an environment specific file, in this case `application.yml`.
   The approach taken here is to overwrite the existing `application.yml` file using a
   [Configuration Template](http://help.serena.com/doc_center/sra/ver6_3/sda_help/sra_config_templates.html?zoom_highlight=Configuration+Template).
   The Configuration Template is stored in Deployment Automation with placeholders corresponding to
   [Environment Properties](http://help.serena.com/doc_center/sra/ver6_3/sda_help/ProcAppEnvPropsNew.html?zoom_highlight=environment+properties).
   These placeholders are then replaced/resolved automatically when the Configuration Template is
   download using the [DA Configuration Management](http://help.serena.com/doc_center/sra/ver6_2_3/SDA_Plugin_Index/sra_plug_sracfgmgmt.html#sracfgmgmtplug) plugin. 
 - **tomcat-copy**  
   This process is similar to the **tomcat-deploy** process above but simply copies the .WAR file into
   the Tomcat ``webapps`` directory for hot deployment, rather than using the Tomcat Manager API.  
 - **tomcat-clean**  
   This process shows how you could clean logs and temporary files from Tomcat using an operational
   process. It checks if Tomcat is running and if so stops it so there are no problems deleting files.
 - **tomcat-restart**  
   This process simply calls the **tomcat-stop** and **tomcat-start** processes below.
 - **tomcat-start**
   This process checks if Tomcat is running and if not starts it using Service Manager on Windows
   or via Tomcat's own startup script on Linux/Unix. It illustrates how to carry out a basic check
   for the platform on which the process is running by checking the Agent's **sys.os.name** property.
 - **tomcat-stop**
   This process checks if Tomcat is running and if so stops it using Service Manager on Windows
   or via Tomcat's own shutdown script on Linux/Unix.    

Properties
----------

The template includes the following environment properties that you should set for each Application
Environment:

Property Name                             | Description
------------------------------------------|----------------------------------------------------------------------
*tomcat.base.dir*                         | The Tomcat base directory, e.g. C:\Program Files\Tomcat8
*tomcat.host*                             | The hostname of the Tomcat server
*tomcat.port*                             | The port that the Tomcat server is running on
*tomcat.manager.url*                      | The URL of the Tomcat Manager web app
*tomcat.manager.username*                 | The login name of a user with Tomcat Manager access
*tomcat.manager.password*                 | The password of the Tomcat Manager user
*tomcat.service.name*                     | The name of the Tomcat service if running on Windows
*tomcat.launcher.start*                   | The full path to the program that starts Tomcat
*tomcat.launcher.stop*                    | The full path to the program that stops Tomcat
*tomcat.launcher.start.options*           | A newline separated list of any options to be passed to the start program
*tomcat.launcher.stop.options*            | A newline separated list of any options to be passed to the stop program
*tomcat.webapps.dir*                      | The full path to the Tomcat "webapps" directory
*tomcat.logs.dir*                         | The full path to the Tomcat "logs" directory
*tomcat.timeout*                          | The timeout in seconds to applied when checking Tomcat, e.g. if its accessible
*example.db.host*,*example.db.port* etc.  | Some example properties that are used in the Configuration Template

Files
-----

 - [java-tomcat.json](java-tomcat.json)  - the component template
 - [java-web-app.json](java-web-app.json) - an example component that uses the template
 - [java-web-app](https://github.com/akevinlee/java-web-app) - the source code for the application used in the above
