<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
<xsl:template match="/">
    <xsl:for-each select="release/deployment/files/file[@type='script']">
cmd /c <xsl:value-of select="@destination"/>/<xsl:value-of select="@name"/>
    </xsl:for-each>
</xsl:template>
</xsl:stylesheet>
