<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
<xsl:template match="/">
@echo off
@echo Starting: %DATE%-%TIME%
    <xsl:for-each select="release/deployment/files/file[@type='sql']">
@echo executing sql script: <xsl:value-of select="@destination"/>/<xsl:value-of select="@name"/>	
sqlplus $SQL_USERNAME$/$SQL_PASSWORD$@orcl @<xsl:value-of select="@destination"/>/<xsl:value-of select="@name"/>
    </xsl:for-each>
@echo Finished: %DATE%-%TIME%	
</xsl:template>
</xsl:stylesheet>
