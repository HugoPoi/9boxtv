<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="utf-8" />

  <xsl:param name="break" select="'&#xA;'" />

  <xsl:template match="/">
    <xsl:value-of select="'&#35;EXTM3U'" />
    <xsl:value-of select="$break" />

    <xsl:apply-templates select="setupResponse/services/service-list/service[dvb-ip]" />
  </xsl:template>

  <xsl:template match="service">
    <xsl:value-of select="'&#35;EXTINF:0,1 - '" />
    <xsl:value-of select="name" />
    <xsl:value-of select="$break" />
    <xsl:variable name="urlRtp">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="dvb-ip[@br = 2500]/url" />
        <xsl:with-param name="replace" select="'igmp://'" />
        <xsl:with-param name="by" select="'rtp://'" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:value-of select="$urlRtp" />

    <xsl:if test="following-sibling::*">
      <xsl:value-of select="$break" />
    </xsl:if>
  </xsl:template>


  <xsl:template name="string-replace-all">
    <xsl:param name="text" />
    <xsl:param name="replace" />
    <xsl:param name="by" />
    <xsl:choose>
      <xsl:when test="contains($text, $replace)">
        <xsl:value-of select="substring-before($text,$replace)" />
        <xsl:value-of select="$by" />
        <xsl:call-template name="string-replace-all">
          <xsl:with-param name="text" select="substring-after($text,$replace)" />
          <xsl:with-param name="replace" select="$replace" />
          <xsl:with-param name="by" select="$by" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>

