<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
<xsl:template match="/">
@echo off
@echo Starting: %DATE%-%TIME%
    <xsl:for-each select="release/deployment /files/file[@copy='true']">
@echo copying file: <xsl:value-of select="@source"/>\<xsl:value-of select="@name"/>
copy /Y <xsl:value-of select="@source"/>\<xsl:value-of select="@name"/> <xsl:text> </xsl:text> <xsl:value-of select="@destination"/>\<xsl:value-of select="@name"/>
    </xsl:for-each>
@echo Finished: %DATE%-%TIME%	
</xsl:template>
</xsl:stylesheet>
