<%-- 
    Document   : detail
    Created on : Aug 4, 2016, 7:35:27 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/home.css">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="acc" value="${sessionScope.FULLNAME}"/>
        <c:set var="accountrole" value="${sessionScope.ROLE}"/>
        <script type="text/javascript">

            function checkLogin(loginAcc) {
                if (loginAcc == '') {
                    var strconfirm = confirm("You need login first!");
                    if (strconfirm == true)
                    {
                        window.location.href = "login.jsp";
                        return false;
                    } else {
                        return false;
                    }
                }
            }
            function myFunction() {
                //do stuff
                var price = document.getElementById("price").value;
                var screen=document.getElementById("screen").value;
                var hdd=document.getElementById("hdd").value;
                var ram=document.getElementById("ram").value;
                var vga=document.getElementById("vga").value;
                var detail=document.getElementById("detail").value;
                if(price==""){
                    alert("Please input data in new Price!");
                    return false;
                }
                if(screen==""){
                    alert("Please input data in Screen!");
                    return false;
                }
                if(hdd==""){
                    alert("Please input data in HDD!");
                    return false;
                }
                if(ram==""){
                    alert("Please input data in RAM!");
                    return false;
                }
                if(vga==""){
                    alert("Please input data in VGA!");
                    return false;
                }
                if(detail==""){
                    alert("Please input data in Detail!");
                    return false;
                }
                return true;

            }
        </script>
        <script>
            loginAcc = '${sessionScope.FULLNAME}';
        </script>
        <div id="main">

            <div id="head">
                <div id="menu">

                </div>	
            </div>
            <div id="head-link">
                <ul style="margin-left: 10px">
                    <li>
                        <a href="homedata.jsp"> All Laptops |</a>
                    </li>
                    <!--                    <li>
                                            <a href="CreateXMLServlet"></a>
                                        </li>-->
<!--                    <li>
                        <a href="search.jsp">Search Laptops |</a>
                    </li>-->
                    <li>
                        <a href="ContactServlet">Contact </a>
                    </li>

                    <c:if test="${empty acc}">
                        <li>
                            <a href="login.jsp"> | Login</a>  
                        </li>        
                    </c:if>

                    <c:if test="${not empty acc}">
                        <li style="display: inline">
                            <p style="color: red;font-size: 12px">Welcome,  ${acc}</p>
                        </li>
                        <li style="display: inline">
                            <form method="POST" action="ProcessServlet">
                                <input type="submit" name="btAction" value="Logout"/>
                            </form>
                        </li>
                    </c:if>
                </ul>
            </div>
            <div id="left">

            </div>

            <div id="content">
                <table style="text-align: center;width: 100%">
                    <tr><td>
                            <form action="ProcessServlet" method="POST" id="myForm">
                                <input type="hidden" name="txtCode" value="${param.txtCode}"/>
                                <input type="submit" name="btAction" value="Buy Laptop" onclick="return checkLogin(loginAcc)" style="text-align: center;margin-bottom: 10px"/>

                            </form>
                        </td>
                        <c:if test="${accountrole==true}">
                            <td>
                                <form action="ProcessServlet" method="POST" id="myForm">
                                    <input type="hidden" name="txtCode" value="${param.txtCode}"/>
                                    <input type="submit" name="btAction" value="Delete" style="text-align: center;margin-bottom: 10px"/>

                                </form>
                            </td>
                        </c:if>
                    </tr>
                </table>
                 <!-- ket hop voi xsl de show san pham -->               
                <c:import charEncoding="UTF-8"  var="xsl" url="WEB-INF/Detail.xsl"/>  
                <x:transform doc="${sessionScope.XMLDATA}" xslt="${xsl}">
                    <x:param name="codeComputer" value="${param.txtCode}"/>
                    <x:param name="role" value="${accountrole}"/>
                </x:transform>

            </div>


            <div id="right">
                <div id="right-content">
                </div>
                <div id="footer"></div>
            </div>
            <div id="part"></div>
        </div>

    </body>
</html>
