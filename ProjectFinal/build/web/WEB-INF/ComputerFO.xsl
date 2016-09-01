<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : ComputerFO.xsl
    Created on : August 7, 2016, 5:36 PM
    Author     : Administrator
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>
<xsl:param name="fullname"/>
<xsl:param name="phone"/>
<xsl:param name="address"/>
<xsl:param name="pathfile"/>
<xsl:param name="txtCode"/>
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
   

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="x" page-height="8.5in" page-width="11in"
                                       margin-top="0.5in" margin-bottom="0.5in" margin-left="1in" margin-right="1in">
                    <fo:region-body margin-top="0.8in" />
                    <fo:region-before extent="1in" />
                    <fo:region-after extent=".75in" />
                </fo:simple-page-master>
            </fo:layout-master-set>
	
            <fo:page-sequence master-reference="x">
                
	<fo:static-content flow-name="xsl-region-before">
              <fo:block text-align="right" margin-left="0.5in">
<fo:external-graphic content-height="scale-to-fit" height="0.8in" content-width="0.8in" scaling="non-uniform" text-align="right">
<xsl:attribute name="src">
<xsl:value-of select="concat($pathfile, 'laptopcompany.png')"/>
</xsl:attribute>
</fo:external-graphic>
</fo:block>
             <fo:block font-size="30pt" font-family="Arial" line-height="20pt" space-after.optimum="15pt" 
                              text-align="center" padding-top="5pt">Bill detail
                    </fo:block>    
            <fo:block font-size="14pt" font-family="Arial" line-height="24pt" color="black" 
                      space-after.optimum="15pt" text-align="left" padding-top="55pt">
                NVT Company
            </fo:block>
            <fo:block font-size="14pt" font-family="Arial" line-height="24pt" color="black" 
                      space-after.optimum="15pt" text-align="left" padding-top="55pt">
                Address: 66 Le Thi Hong, Go Vap distric, HCM city 
            </fo:block>
            <fo:block font-size="14pt" font-family="Arial" line-height="24pt" color="black" 
                      space-after.optimum="15pt" text-align="left" padding-top="55pt">
                Email: tiennvse61316@fpt.edu.vn
            </fo:block>
            <fo:block font-size="14pt" font-family="Arial" line-height="24pt" color="black" 
                      space-after.optimum="15pt" text-align="left" padding-top="55pt">
                Phone: 01282994011
            </fo:block>
            <fo:block font-size="14pt" font-family="Arial" line-height="24pt" color="red" 
                      space-after.optimum="15pt" text-align="left" padding-top="55pt">
                Customer
            </fo:block>
            <fo:block font-size="14pt" font-family="Arial" line-height="24pt" color="black" 
                      space-after.optimum="15pt" text-align="left" padding-top="55pt">
                Name: <xsl:value-of select="$fullname"/>
            </fo:block>
            <fo:block font-size="14pt" font-family="Arial" line-height="24pt" color="black" 
                      space-after.optimum="15pt" text-align="left" padding-top="55pt">
                Address: <xsl:value-of select="$address"/>
            </fo:block>
            <fo:block font-size="14pt" font-family="Arial" line-height="24pt" color="black" 
                      space-after.optimum="15pt" text-align="left" padding-top="55pt">
                Phone: <xsl:value-of select="$phone"/>
            </fo:block>
             <fo:block font-size="14pt" font-family="Arial" line-height="24pt" color="black" 
                      space-after.optimum="15pt" text-align="left" padding-top="55pt">
               
            </fo:block>
              <fo:block font-size="14pt" font-family="Arial" line-height="24pt" color="black" 
                      space-after.optimum="15pt" text-align="left" padding-top="1pt">
               
            </fo:block>
              <fo:block font-size="14pt" font-family="Arial" line-height="24pt" color="black" 
                      space-after.optimum="15pt" text-align="left" padding-top="1pt">
               
            </fo:block>
            
                  
        </fo:static-content>	
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block font-size="18pt" font-family="Arial" line-height="24pt" space-after.optimum="15pt" 
                              text-align="center" padding-top="70pt">
                    </fo:block>
                   
                </fo:static-content>
		
                <fo:flow flow-name="xsl-region-body"  padding-top="320pt">
                     <fo:block font-size="30pt" font-family="Arial" line-height="70pt" space-after.optimum="15pt" 
                              text-align="center" padding-top="180pt">Laptop
                    </fo:block> 
<!--                     <fo:block font-size="30pt" font-family="Arial" line-height="20pt" space-after.optimum="15pt" 
                              text-align="center" padding-top="20pt">Bill
                    </fo:block>    -->
                      <fo:block font-family="Arial">
                   
                        <fo:table border-collapse="separate" table-layout="fixed">
                            <fo:table-column column-width="3cm"/>
                            <fo:table-column column-width="1cm"/>
                            <fo:table-column column-width="2.5cm"/>
                            <fo:table-column column-width="1.5cm"/>
                            
                            <fo:table-column column-width="1.7cm"/>
                            <fo:table-column column-width="1.5cm"/>
                            <fo:table-column column-width="1.7cm"/>
                            <fo:table-column column-width="2cm"/>
                            <fo:table-column column-width="2cm"/>
                            <fo:table-column column-width="1.4cm"/>
                            <fo:table-column column-width="1.3cm"/>
                            <fo:table-column column-width="1.5cm"/>
                            <fo:table-column column-width="2.5cm"/>
                            <fo:table-body>
                                
<fo:table-row>
                                    <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                        <fo:block text-align="center"></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                        <fo:block text-align="center">Code</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                        <fo:block text-align="center">Name</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                        <fo:block text-align="center">Brand</fo:block>
                                    </fo:table-cell>
                                    
                                    <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                        <fo:block text-align="center">Screen</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                        <fo:block text-align="center">HDD</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                        <fo:block text-align="center">VGA</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                        <fo:block text-align="center">RAM</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                        <fo:block text-align="center">CPU</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                        <fo:block text-align="center">Weight</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                        <fo:block text-align="center">Pin</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                        <fo:block text-align="center">More</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                        <fo:block text-align="center">Price</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                
                                   
                                <xsl:for-each select="/computers/computer[code=$txtCode]">   
                                    <fo:table-row>
                                        <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                           <fo:block text-align="center">
<fo:external-graphic content-height="scale-to-fit" height="0.8in" content-width="0.8in" scaling="non-uniform">
<xsl:attribute name="src">
<xsl:value-of select="concat($pathfile,imagelink)"/>
</xsl:attribute>
</fo:external-graphic>
</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                            <fo:block text-align="center">
                                                 <xsl:value-of select="code" />
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="name" />
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="brand" />
                                            </fo:block>
                                        </fo:table-cell>
                                        
                                        
                                        <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="screen" />
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="hdd" />
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="vga" />
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="ram" />
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="cpu" />
                                            </fo:block>
                                        </fo:table-cell>
                                         <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="weight" /> kg
                                            </fo:block>
                                        </fo:table-cell>
                                         <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="pin" /> hours
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="more" />
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid">
                                            <fo:block text-align="center"  color="red" >
                                                <xsl:value-of select="price" /> VND
                                            </fo:block>
                                        </fo:table-cell>
                                        
                                    </fo:table-row>
                                </xsl:for-each>

                               
                            </fo:table-body>
                        </fo:table>
                        
                    </fo:block>
                  <fo:block text-align="right" padding-top="10pt">
                                               Guarantee: 12 Month
                                            </fo:block>
                                            <fo:block text-align="left" margin-left="35pt" padding-top="20pt">
                                              Sign
                                            </fo:block>
                                            <fo:block text-align="left">
                                              NVT Company
                                            </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
 
</xsl:stylesheet>
