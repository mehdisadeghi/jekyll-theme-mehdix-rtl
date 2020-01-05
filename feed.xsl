<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom"
  exclude-result-prefixes="atom">

  <xsl:template match="/">
    <html dir="rtl" xmlns="http://www.w3.org/1999/xhtml">
      <body style="margin:auto;display:grid;width:540px;font-family:Arial;background-color:#EEEEEE;grid-gap:19px">
        <h1><strong>خلاصه‌ی مقالات*</strong></h1>
        <xsl:apply-templates select="atom:feed/atom:entry"/>
        <small>*فید حاوی متن کامل مقالات است.</small>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="atom:entry">
    <div xmlns="http://www.w3.org/1999/xhtml">
      <div style="background-color:teal;color:white;padding:4px;">
        <span style="font-weight:bold">
          <strong><xsl:value-of select="atom:title"/></strong>
        </span>
        <xsl:text></xsl:text>
        <xsl:value-of select="atom:author"/>
      </div>
      <div style="margin-right:20px;margin-bottom:1em;font-size:10pt">
        <b><xsl:value-of select="atom:published"/></b>
        <p><xsl:value-of select="atom:summary" disable-output-escaping="yes"/></p>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>
