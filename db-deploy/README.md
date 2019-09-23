# Databaes Upgrader Deployment Template

This Component Template is an example of how to deploy and rollback database changes using the Deployment Automation 
[DBUpgrader](http://help.serena.com/doc_center/sra/ver6_3/SDA_Plugin_Index/sra_plug_dbupgrader.html#sradbupgraderplug) plugin.
This plugin makes use of a **DB_VERSION** table inside a database to manage the changesets that have been deployed and
used XML files to organise the changesets and SQL.

Processes
---------

The template contains the following processes:

 - **db-init**  
   This process initialises the database by creating a **DB_VERSION** table.
 - **db-deploy**  
   This is the main process that downloads a [Component Version](http://help.serena.com/doc_center/sra/ver6_3/sda_help/ConcCompVer.html#concept651) 
   from Deployment automation that contains an XML changeset file and then uses the [DBUpgrader](http://help.serena.com/doc_center/sra/ver6_3/SDA_Plugin_Index/sra_plug_dbupgrader.html#sradbupgraderplug)
   **Upgrade DB** step to deploy it. Note that in the current template the changeset file deployed is named
   `upgrade_sql_${p:version.name}.xml` where **version.name** is the Component Version.
   
   This process also tries to rollback the database changeset if the deployment fails using the **Rollback DB** step.    
 - **db-rollback**  
   This process performs a rollback using the **Rollback DB** step. It uses the Component Version selected to located
   the same changeset file from **db-deploy** above but only calls the rollback actions. You can also use this process
   to rollback individual changesets if the changeset file contained multiple changesets.  
 - **db-test-data**  
   This process uses the [SQL JDBC}(http://help.serena.com/doc_center/sra/ver6_3/SDA_Plugin_Index/sra_plug_sqljdbc.html#srasqljdbcplug)
   plugin to execute a SQL script in the Component Version that contains some test data to load.
 - **db-clean**
   This process cleans up the database by removing the **DB_VERSION** table.  

Properties
----------

The template includes the following environment properties that you should set for each [Application
Environment](http://help.serena.com/doc_center/sra/ver6_3/sda_help/sra_ui_appenvs.html#srauienv):

Property Name                             | Description
------------------------------------------|----------------------------------------------------------------------
*driver.class.name*                       | The JDBC class name for the database vendor being used
*driver.jar.path*                         | The path to the JDBC JAR file for the database
*driver.jar*                              | The filename of the JDBC JAR file
*db.server*                               | The hostname and port number of the database, e.g. localhost:1433
*db.name*                                 | The name of the database being used
*db.url*                                  | The JDBC URL for the database (constructed using db.server and db.name)
*db.username*                             | The username to login to the database
*db.password*                             | The password for the user logging in to the database

Files
-----

 - [db-deploy.json](java-tomcat.json)  - the component template
 - [example](example) - directories containing versions that can be imported into Deployment Automation to test the plugin
 - [simple-dbapp](https://github.com/akevinlee/simple-dbapp.git) - the source code for an application that uses and explains
 more about the DBUpgrader utility
