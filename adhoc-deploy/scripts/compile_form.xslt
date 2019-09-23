<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
<xsl:template match="/">
@echo off
@echo Starting: %DATE%-%TIME%
    <xsl:for-each select="release/deployment/files/file[@type='form']">
@echo compiling form: <xsl:value-of select="@destination"/>/<xsl:value-of select="@name"/>
frmcmp Module=<xsl:value-of select="@destination"/>\<xsl:value-of select="@name"/> UserId=$SQL_USERNAME$/$SQL_PASSWORD$@orcl Module_Type=FORM Logon=YES Compile_All=YES Batch=yes Window_State=minimize
    </xsl:for-each>
@echo Finished: %DATE%-%TIME%
</xsl:template>
</xsl:stylesheet>
