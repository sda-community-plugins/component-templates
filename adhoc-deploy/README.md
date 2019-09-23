# Ad-hoc Deployment Template

This Component Template is an example of how to deploy ad-hoc releases where the type and number of inputs change
each time. An example is SQL releases where different .SQL files are released each time and need to be executed
in a particular sequence. Middleware application infrastructure such as Oracle Forms and Reports also require ad-hoc
releases.  

The way this template works is by dynamically creating a set of scripts for different file types using a `release.xml`
input file - see the [example](example\release.xml). XML is used because it is relatively easy to apply an XSLT 
transformation to extract the data pertaining to particular types of files and construct an executable script.  

As a bonus a transformation can also be applied to the `release.xml` file to create an HTML release note - see the
[example ouput](output\example-release.html).

Processes
---------

The template contains the following processes:

 - **deploy-release**  
   This is the main process that downloads a Deployment Automation [Component Version]() containing a `release.xml`
   file and a number of files to be deployed/executed. Using a set of XSLT transformation scripts it then extracts
   and a creates executable scripts for each file type and executes them. Finally it creates a HTML version of the
   `release.xml` and uploads it back in Deployment Automation as an attachment.  

 - **generate-release-note**  
   This process simply creates the release note from the `release.xml` as above. It could be used to check/sanitize
   the inputs before deployment.    

Properties
----------

The template includes the following environment properties that you should set for each [Application
Environment](http://help.serena.com/doc_center/sra/ver6_3/sda_help/sra_ui_appenvs.html#srauienv):

Property Name                             | Description
------------------------------------------|----------------------------------------------------------------------
*SQL_USERNAME*                            | An example property containing a database user login to be applied to SQL
*SQL_PASSWORD*                            | An example property containing a database user password

Files
-----

 - [adhoc-deploy.json](adhoc-deploy.json)  - the component template
 - [example](example) - an example release containing files and `release.xml` that could be deployed
 - [scripts](scripts) - the XSLT transformation scripts to be used to construcy the executable scripts

In order to use the template you will also need to create a Deployment Automation 
[System Property](http://help.serena.com/doc_center/sra/ver6_3/sda_help/sra_adm_sys_properties.html)
called `adhocScripts` that refers to the location of the IIS `AppCmd.exe` program on your server,
e.g. `C:\Temp\Deployment Automation Scripts`.  For production usage this property would be better set as a [Resource
Property](http://help.serena.com/doc_center/sra/ver6_3/sda_help/sra_resource_props.html#sraresourceprops)
 but is system wide property here for simplicity.  
 
Note: The example scripts use\construct Windows commands - although it should be relatively trivial to convert this to 
Linux/UNIX.
