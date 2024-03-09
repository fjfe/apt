<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Product List</title>
      </head>
      <body>
        <h1>Product List</h1>
        <ul>
          <xsl:for-each select="products/product">
            <li>
              <xsl:value-of select="name" />
              <span> - </span>
              <xsl:value-of select="price" />
              <span>€</span>
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>