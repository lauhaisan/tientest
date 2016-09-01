<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : computers.xsl
    Created on : August 3, 2016, 8:34 PM
    Author     : Administrator
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
              
            </head>
            <body>
               
               <xsl:apply-templates/>
            
            </body>
       
   
        </html>
         </xsl:template>
        
   
</xsl:stylesheet>
