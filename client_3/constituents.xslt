<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" indent="yes"/>

  <!-- Define a key to group by ImportID -->
  <xsl:key name="byImportID" match="Row" use="import-id"/>

  <!-- Template matching root -->
  <xsl:template match="/Rows">
    <Constituents>
      <!-- Loop only over distinct ImportID rows -->
      <xsl:for-each select="Row[generate-id() = generate-id(key('byImportID', import-id)[1])]">
        <Constituent>
          <ImportID><xsl:value-of select="import-id"/></ImportID>
          <FirstName><xsl:value-of select="first-name"/></FirstName>
          <LastName><xsl:value-of select="last-name"/></LastName>
          <NamePrefix><xsl:value-of select="name-prefix"/></NamePrefix>
          <NameSuffix><xsl:value-of select="name-suffix"/></NameSuffix>
          <UserName><xsl:value-of select="username"/></UserName>

          <Emails>
            <Email>
              <Type>Personal</Type>
              <EmailAddress><xsl:value-of select="email"/></EmailAddress>
            </Email>
          </Emails>

          <Phones>
            <Phone>
              <Type>Mobile</Type>
              <PhoneNumber><xsl:value-of select="mobile-phone"/></PhoneNumber>
            </Phone>
          </Phones>

          <Phones>
            <Phone>
              <Type>Home</Type>
              <PhoneNumber><xsl:value-of select="home-phone"/></PhoneNumber>
            </Phone>
          </Phones>

          <Gender><xsl:value-of select="gender"/></Gender>
        </Constituent>
      </xsl:for-each>
    </Constituents>
  </xsl:template>

</xsl:stylesheet>
