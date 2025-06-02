<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" indent="yes"/>
  
  <!-- Match the root -->
  <xsl:template match="/Rows">
    <Relationship>
      <!-- Only select rows with a non-empty Relationships -->
      <xsl:for-each select="Row[string-length(normalize-space(relationships)) > 0]">
        <Relationship>
          <ImportID_Person><xsl:value-of select="import-id"/></ImportID_Person>
          <ImportID_Related><xsl:value-of select="relationships"/></ImportID_Related>
          <RelationType><xsl:value-of select="relationship-type"/></RelationType>
        </Relationship>
      </xsl:for-each>
    </Relationship>
  </xsl:template>

</xsl:stylesheet>