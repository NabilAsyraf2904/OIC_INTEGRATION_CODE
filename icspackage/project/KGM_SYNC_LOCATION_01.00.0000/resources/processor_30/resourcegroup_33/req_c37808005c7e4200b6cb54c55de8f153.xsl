<?xml version = '1.0' encoding = 'UTF-8'?>
<!--User Editing Not Allowed for Sections: oracle-xsl-mapper:schema, top level xsl:params, version attribute of the stylesheet element. GENERATED BY OIC MAPPER, DO NOT DELETE THIS LINE-->
<!--User Editing Not Allowed for Sections: oracle-xsl-mapper:schema, top level xsl:params, version attribute of the stylesheet element. GENERATED BY OIC MAPPER, DO NOT DELETE THIS LINE--><xsl:stylesheet version="2.0" xml:id="id_1" xmlns:nssrcmpr="http://www.oracle.com/2014/03/ics/schedule" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:nstrgmpr="http://xmlns.oracle.com/cloud/adapter/REST/getLocation_REQUEST/types" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" nssrcmpr ora oracle-xsl-mapper dvm oraext xsi xsd fn xp20 xsl ignore01 nsmpr0" xmlns:ignore01="http://www.oracle.com/XSL/Transform/java" ignore01:ignorexmlids="true" xmlns:xml="http://www.w3.org/XML/1998/namespace" xmlns:nsmpr0="http://www.oracle.com/2014/03/ic/integration/metadata" xmlns:ns19="http://xml.oracle.com/types/REST/getLocation_REQUEST">
   <oracle-xsl-mapper:schema xml:id="id_2">
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources xml:id="id_3">
         <oracle-xsl-mapper:source type="XSD" xml:id="id_4">
            <oracle-xsl-mapper:schema location="../../processor_8/resourcegroup_9/ICSSchedule_1.xsd" xml:id="id_5"/>
            <oracle-xsl-mapper:rootElement name="schedule" namespace="http://www.oracle.com/2014/03/ics/schedule" xml:id="id_6"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets xml:id="id_7">
         <oracle-xsl-mapper:target type="WSDL" xml:id="id_8">
            <oracle-xsl-mapper:schema location="../../application_18/inbound_19/resourcegroup_20/getLocation_REQUEST.wsdl" xml:id="id_9"/>
            <oracle-xsl-mapper:rootElement name="execute" namespace="http://xmlns.oracle.com/cloud/adapter/REST/getLocation_REQUEST/types" xml:id="id_10"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
   </oracle-xsl-mapper:schema>
   <xsl:param name="locationName" xml:id="id_35"/>
   <xsl:template match="/" xml:id="id_11">
      <nstrgmpr:execute xml:id="id_12">
         <nstrgmpr:QueryParameters xml:id="id_21">
            <ns19:orderBy xml:id="id_22">
               <xsl:value-of xml:id="id_23" select="&quot;LastUpdateDate:desc&quot;"/>
            </ns19:orderBy>
            <ns19:limit xml:id="id_24">
               <xsl:value-of xml:id="id_25" select="100"/>
            </ns19:limit>
            <ns19:onlyData xml:id="id_26">
               <xsl:value-of xml:id="id_27" select="true()"/>
            </ns19:onlyData>
            <ns19:expand xml:id="id_28">
               <xsl:value-of xml:id="id_29" select="&quot;addresses&quot;"/>
            </ns19:expand>
         <xsl:if xml:id="id_48" test="string-length ($locationName ) > 0">
               <ns19:q xml:id="id_49">
                  <xsl:value-of xml:id="id_50" select="concat (&quot;LocationName='&quot;, $locationName, &quot;'&quot; )"/>
               </ns19:q>
            </xsl:if>
         </nstrgmpr:QueryParameters>
      </nstrgmpr:execute>
   </xsl:template>
</xsl:stylesheet>