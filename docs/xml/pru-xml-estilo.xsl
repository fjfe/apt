<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
  <xsl:template match="/">
    <html>
      <head>
        <style>
          body { font-family: Verdana,Arial,snas-serif; }
        </style>
      </head>
      <body>
        <h2>Juegos</h2>
        <xsl:for-each select="games/game">
          <xsl:value-of select="name" />
          <xsl:value-of select="developer" />
          <br>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
