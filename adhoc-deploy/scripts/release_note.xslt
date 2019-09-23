<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <head>
  <style>
body {
    font: normal 68% verdana, arial, helvetica;
    color: #000000;
}

table tr td, table tr th {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 12px;
    font-weight: normal;

}

table tr th {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 12px;
    font-weight: bold;
    text-align: left;
    padding: 5px;
    background: #00cc33;
}

table tr td {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 12px;
    font-weight: normal;
    text-align: left;
    background: #eeeeee;
    padding: 3px 5px 3px 3px;
}

a:link {
    color: #333333;
}

a:visited {
    color: #333333;
}

p {
    line-height: 1.5em;
    margin-top: 0.5em;
    margin-bottom: 1.0em;
}

h1 {
    margin: 0px 0px 5px;
    font: verdana, arial, helvetica;
    color: #00cc33;
    font-weight: normal;
    font-size: 18.0pt;
    font-weight: bold;
}

h2 {
    margin: 0px 0px 5px;
    font: verdana, arial, helvetica;
    color: #00cc33;
    font-size: 14.0pt;
    font-weight: bold;
}

h3 {
    margin: 10px 0px 5px;
    font-weight: bold;
    font-family: Verdana, Arial, Helvetica, sans-serif;
    font-size: 14px;
    color: #00cc33;
}

h4 {
    margin-bottom: 0.5em;
    font: bold 100% verdana, arial, helvetica
}

h5 {
    margin-bottom: 0.5em;
    font: bold 100% verdana, arial, helvetica
}

h6 {
    margin-bottom: 0.5em;
    font: bold 100% verdana, arial, helvetica
}

.Error {
    font-weight: bold;
    color: red;
}

.Failure {
    font-weight: bold;
    color: purple;
}

.Properties {
    text-align: right;
}

pre {
    font-family: Courier;
    font-size: 8px;
}

hr {
    line-height: 1px
}
  </style>
  </head>
  <body>
  <h1>Release: <xsl:value-of select="release/name"/></h1>
  <p><em><xsl:value-of select="release/description"/></em></p>
  System: <xsl:value-of select="release/system"/>:<xsl:value-of select="release/subsystem"/><br/>
  Date: <xsl:value-of select="release/date"/><br/>
  Author: <xsl:value-of select="release/author"/><br/>
  Version: <xsl:value-of select="release/version"/><br/>
  <hr/>
  <h2>Deployment Files</h2>
    <table>
      <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Source</th>
        <th>Destination</th>
        <th>Version</th>
      </tr>
      <xsl:for-each select="release/deployment/files/file">
      <tr>
        <td><xsl:value-of select="@name"/></td>
        <td><xsl:value-of select="@type"/></td>
        <td><xsl:value-of select="@source"/></td>
        <td><xsl:value-of select="@destination"/></td>
        <td><xsl:value-of select="@version"/></td>
      </tr>
      </xsl:for-each>
    </table>
  <p>For more information see: <a href="http://localhost">example link</a></p>
  <img width="233" height="38" title="" alt="" src="data:image/png;base64,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" />
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
