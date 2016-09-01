<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : Detail.xsl
    Created on : August 6, 2016, 11:16 PM
    Author     : Administrator
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>
<xsl:param name="codeComputer"/>
<xsl:param name="role"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Detail.xsl</title>
            </head>
            <body>
                <table style="width:100%;text-align:center;">
                    <tr>
                         <xsl:for-each select="computers/computer">
                              <xsl:if test="code=$codeComputer">
                                 <td style="width:40%;">
                                      <xsl:value-of select="name"/>
                                 <img id="img" src="image/{imagelink}"/>
                                  
                                 </td> 
                              </xsl:if>
                        </xsl:for-each>
                        <td style="width:60%;">
                            <table>
                                <tr>
                                    <td style="width:30%;text-align:right;padding-right:10px">
                                        <table>
                                            <tr>
                                                <td>Name: </td>
                                            </tr>
                                             <tr>
                                                <td>Brand: </td>
                                            </tr>
                                            <tr>
                                                <td>Price: </td>
                                            </tr>
                                             <tr>
                                                <td>Screen: </td>
                                            </tr>
                                            <tr>
                                                <td>HDD: </td>
                                            </tr>
                                            
                                            <tr>
                                                <td>VGA: </td>
                                            </tr>
                                            <tr>
                                                <td>RAM: </td>
                                            </tr>
                                            <tr>
                                                <td>CPU: </td>
                                            </tr>
                                            <tr>
                                                <td>Weight: </td>
                                            </tr>
                                             <tr>
                                                <td>Pin: </td>
                                            </tr>
                                              <tr style="height:150px">
                                                <td>Detail: </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                   
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                        
                                    </td>
                                      <td>
                                          <form action="ProcessServlet"  method="post" onSubmit="return myFunction();">
                                          <xsl:for-each select="computers/computer">
                              <xsl:if test="code=$codeComputer">
                                    <xsl:variable name="price" select="price"/>
                                    <xsl:variable name="name" select="name"/>
                                    <xsl:variable name="code" select="code"/>
                                    <xsl:variable name="detail" select="detail"/>
                                    <xsl:variable name="screen" select="screen"/>
                                     <xsl:variable name="hdd" select="hdd"/>
                                     <xsl:variable name="vga" select="vga"/>
                                     <xsl:variable name="ram" select="ram"/>
                                    <input type="hidden" name="searchCode" value="{$code}"/>

                                        <table style="text-align:left">
                                            <tr>
                                                <td> <xsl:value-of select="name"/></td>
                                            </tr>
                                             <tr>
                                                <td> <xsl:value-of select="brand"/></td>
                                            </tr>
                                             <tr>
                                                
                                                     <xsl:if test="$role='true'">
                                                       <td>   <input id="price"  type="text"  name="txtPrice" value="{$price}" style="background:#E6E6FA"/> VND</td>
                                                    </xsl:if>
                                                        <xsl:if test="$role!='true'">
                                                            <td>  
                                                                <xsl:value-of select="price"/> VND</td>
                                                </xsl:if>
                                                
                                            </tr>
                                            <tr> 
                                                 <xsl:if test="$role='true'">
                                                      <td>    <input id="screen" type="text"  name="txtScreen" value="{$screen}" style="background:#E6E6FA"/> </td>
                                                    </xsl:if>
                                                <xsl:if test="$role!='true'">
                                                <td> <xsl:value-of select="screen"/></td>
                                                </xsl:if> 
                                            
                                            </tr>
                                            <tr> 
                                                <xsl:if test="$role='true'">
                                                     <td>     <input id="hdd" type="text"  name="txtHdd" value="{$hdd}" style="background:#E6E6FA"/></td>
                                                    </xsl:if>
                                                <xsl:if test="$role!='true'">
                                                 <td> <xsl:value-of select="hdd"/></td>
                                                </xsl:if>
                                            
                                            </tr>
                                            
                                            <tr> 
                                                 <xsl:if test="$role='true'">
                                                <td>          <input id="vga" type="text"  name="txtVga" value="{$vga}" style="background:#E6E6FA"/> </td>
                                                 </xsl:if>
                                                <xsl:if test="$role!='true'">
                                                  <td><xsl:value-of select="vga"/></td>
                                            </xsl:if>
                                            
                                            </tr>
                                            <tr> 
                                                 <xsl:if test="$role='true'">
                                                     <td>     <input id="ram" type="text"  name="txtRam" value="{$ram}" style="background:#E6E6FA"/> </td>
                                                    </xsl:if>
                                                <xsl:if test="$role!='true'">
                                                  <td><xsl:value-of select="ram"/></td>
                                            </xsl:if>
                                            
                                            </tr>
                                            <tr>
                                                <td><xsl:value-of select="cpu"/></td>
                                            </tr>
                                            <tr>
                                                <td><xsl:value-of select="weight"/> kg</td>
                                            </tr>
                                             <tr>
                                                <td><xsl:value-of select="pin"/> hours</td>
                                            </tr>
                                              <tr style="height:150px">
                                                <td>
                                                  <xsl:if test="$role='true'">
                                                         <input id="detail" type="text" name="txtDetail" value="{$detail}" style="background:#E6E6FA;width:200px;height:50px" />
                                                    </xsl:if>
                                                        <xsl:if test="$role!='true'">
                                                    <xsl:value-of select="detail"/> 
                                                </xsl:if>

                                                </td>
                                            </tr>
                                             <tr>
                                                <td>
                                                    <xsl:if test="$role='true'">
                                                        <input type="hidden" name="txtSearchPage" value="Searchpage"/>
                                                    <input type="submit" name="btAction" value="Update" onclick="return myFunction()"/>
                                                    </xsl:if>
                                                </td>
                                            </tr> 
                                            <tr>
                                                <td>
                                                  
                                                </td>
                                            </tr>    
                                        </table>
                                             </xsl:if>
                        </xsl:for-each>
                        </form> 
                                    </td>
                                </tr>
                            </table>
                            
                        </td>
                       
                    </tr>
<!--                    <xsl:for-each select="computers/computer">
                        <xsl:if test="code=$codeComputer">
                     <tr>
                          <td><xsl:value-of select="code"/></td>
                        <td><xsl:value-of select="name"/></td>
                        <td><xsl:value-of select="brand"/></td>
                       
                    </tr>
                        </xsl:if>
                    </xsl:for-each>-->
                </table>
           
                                               
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
