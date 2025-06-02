<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" indent="yes"/>

  <!-- Define a key to group by ImportID -->
  <xsl:key name="byImportID" match="Row" use="ImportID"/>

  <!-- Template matching root -->
  <xsl:template match="/Rows">
    <Constituents>
      <!-- Loop only over distinct ImportID rows -->
      <xsl:for-each select="Row[generate-id() = generate-id(key('byImportID', ImportID)[1])]">
        <Constituent>
          <ImportID><xsl:value-of select="ImportID"/></ImportID>
          <FirstName><xsl:value-of select="FirstName"/></FirstName>
          <LastName><xsl:value-of select="LastName"/></LastName>
          <NamePrefix><xsl:value-of select="NamePrefix"/></NamePrefix>
          <NameSuffix><xsl:value-of select="NameSuffix"/></NameSuffix>
          <UserName><xsl:value-of select="UserName"/></UserName>

          <Emails>
            <Email>
              <Type>Personal</Type>
              <EmailAddress><xsl:value-of select="EmailPersonal"/></EmailAddress>
            </Email>
          </Emails>

          <Phones>
            <Phone>
              <Type>Mobile</Type>
              <PhoneNumber><xsl:value-of select="PhoneMobile"/></PhoneNumber>
            </Phone>
          </Phones>

          <Phones>
            <Phone>
              <Type>Home</Type>
              <PhoneNumber><xsl:value-of select="PhoneHome"/></PhoneNumber>
            </Phone>
          </Phones>

          <Gender><xsl:value-of select="Gender"/></Gender>
        </Constituent>
      </xsl:for-each>
    </Constituents>
  </xsl:template>

</xsl:stylesheet>
