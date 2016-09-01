<%-- 
    Document   : contact
    Created on : Aug 1, 2016, 11:05:54 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="css/home.css">
          <link rel="stylesheet" href="css/contact.css">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="contact" value="${sessionScope.CONTACT}"/>
        <c:set var="acc" value="${sessionScope.FULLNAME}"/>
        <c:set var="accountrole" value="${sessionScope.ROLE}"/>
       <div id="main">
		
		<div id="head">
                    <div id="menu">
 
		</div>	
		</div>
        <div id="head-link">
           <ul>
               <li><a href="homedata.jsp">Home |</a></li>
   <li>
       <a href="ContactServlet">Contact |</a>
   </li>
  <c:if test="${empty sessionScope.FULLNAME}">
  <li>
          <a href="login.jsp">Login |</a>  
  </li>        
       </c:if>
  
       <c:if test="${not empty sessionScope.FULLNAME}">
           <li style="display: inline">
               <p style="color: red;font-size: 12px">Welcome,  ${sessionScope.FULLNAME}</p>
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
                    <table id="contact" style="width: 37%">
                       
                            <tr width="25%" >
                                <td rowspan="5" width="60px"><img src="image/${contact.avatarlink}" width="100%"/> </td>
                                
                            </tr>
                        
                        
                            <tr>
                                <td>+ ${contact.fullname}</td>
                                
                                
                                
                            </tr>
                            <tr><td>+ ${contact.address}</td></tr>
                            <tr><td>+ ${contact.phone}</td></tr>
                            <tr><td>+ ${contact.type}</td></tr>
                      
                    </table>

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
