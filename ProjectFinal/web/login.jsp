<%-- 
    Document   : login
    Created on : Aug 2, 2016, 4:05:37 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <c:if test="${not empty sessionScope.ACCINFO}">
            <jsp:forward page="homedata.jsp"/>
        </c:if>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="css/home.css">
          <link rel="stylesheet" href="css/login.css">
        <title>JSP Page</title>
    </head>
    <body>
      
       <div id="main">
		
		<div id="head">
                    <div id="menu">
 
		</div>	
		</div>
     <div id="head-link">
                <ul>
                     <li>
                        <a href="homedata.jsp"> All Laptops |</a>
                    </li>
<!--                    <li>
                        <a href="CreateXMLServlet"></a>
                    </li>-->
<!--                     <li>
                        <a href="search.jsp">Search Laptops |</a>
                    </li>-->
                    <li>
                        <a href="ContactServlet">Contact |</a>
                    </li>

                    <c:if test="${empty acc}">
                        <li>
                            <a href="login.jsp">Login </a>  
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
		  <h1 style="text-align: center;color: #1b6d85;margin-left: 70px;margin-top: 20px">Login Page</h1>
                  <div id="formlogin">
			 <form action="ProcessServlet" method="POST">
           
            Account&nbsp :<input type="text" name="txtUsername" value="" /><br/>
            Password:<input type="password" name="txtPassword" value="" /><br/>
            <input type="submit" value="Login" name="btAction" style="margin-left: 70px"/>
            <input type="submit" value="Reset" />
        </form>
                      </div>
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
