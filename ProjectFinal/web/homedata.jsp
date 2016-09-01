<%-- 
    Document   : homedata
    Created on : Aug 2, 2016, 4:11:07 PM
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
        <x:parse var="doc" doc="${XMLDATA}"/>
        <script type="text/javascript">
            var reqOB;
            var xmlDOM = new ActiveXObject("Microsoft.XMLDOM");    
            var count = 0;
            var cells = [];
            function addRow(tableID, cells)
            {

                var tableElem = document.getElementById("dataTable");
                var newRow = tableElem.insertRow(tableElem.rows.length);
                var newCell;
                for (var i = 0; i < cells.length; i++) {
                    newCell = newRow.insertCell(newRow.cells.length);
                    newCell.innerHTML = cells[i];

                }
                return newRow;
            }

            function deleteRow(tableID, rowNumber) {
                var tableElem = document.getElementById(tableID);
                if (rowNumber > 0 && rowNumber < tableElem.rows.length) {
                    tableElem.deleteRow(rowNumber);
                    //alert("da xoa vai dong");
                } else {
                    alert("failed");
                }


            }
            function searchNode(node, strSearch, tableName) {
                if (node == null) {
                    return;
                }
                if (node.tagName == "name") {

                    var tmp = node.firstChild.nodeValue;
                    //alert(typeof strSearch);
                    if (tmp.indexOf(strSearch, 0)>-1) {
                      
                        var parent = node.parentNode;

                        var imagelink = parent.firstChild.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.nodeValue;
                        count++;
                        //alert("<img id=\"img\" src=\"resources/image/"+imagelink+"\"/>");
                        //alert("<img id=\"img\" src=\"image/avatartien.jpg\"/>");
                        //alert("<a href=\"detail.jsp?txtCode="+parent.firstChild.firstChild.nodeValue+"><img id=\"img\" src=\"image/"+imagelink+"\" width=\"100\"/></a>");
                        cells[0] = "<a href=\"detail.jsp?txtCode=" + parent.firstChild.firstChild.nodeValue + "\"><img id=\"img\" src=\"image/" + imagelink + "\" width=\"100\"/></a>";

                        cells[1] = parent.firstChild.firstChild.nodeValue + "<br/>"

                        var sibling = parent.firstChild.nextSibling;

                        cells[2] = sibling.firstChild.nodeValue;
                        var sibling = sibling.nextSibling;

                        cells[3] = sibling.firstChild.nodeValue;
                        var sibling = sibling.nextSibling;

                        cells[4] = sibling.firstChild.nodeValue;
                        var sibling = sibling.nextSibling;

                        cells[5] = sibling.firstChild.nodeValue;
                        var sibling = sibling.nextSibling;

                        cells[6] = sibling.firstChild.nodeValue;
                        var sibling = sibling.nextSibling;

                        cells[7] = sibling.firstChild.nodeValue;
                        var sibling = sibling.nextSibling;
                        cells[8] = sibling.firstChild.nodeValue;
                        var sibling = sibling.nextSibling;
                        cells[9] = sibling.firstChild.nodeValue;
                        var sibling = sibling.nextSibling;
                        cells[10] = "<a color=\"red\" href=\"detail.jsp?txtCode=" + parent.firstChild.firstChild.nodeValue + "\">more detail...</a>"
                        addRow(tableName, cells);
                    }
                }
                var childs = node.childNodes;
                for (var i = 0; i < childs.length; i++) {
                    searchNode(childs[i], strSearch, tableName);
                }
            }

            function traver(tableName) {


                var tableElem = document.getElementById(tableName);
                if (!reqOB) {
                    return false;
                    alert("khong load reqOB");
                }

                if (reqOB) {
                    xmlDOM.async = false;
                    xmlDOM.loadXML(reqOB);
                    var i = 1;
                    while (i < tableElem.rows.length) {
                        deleteRow(tableName, i);
                    }
                    count = 0;

                    if (xmlDOM.parseError.errorCode != 0) {
                        alert("error " + xmlDOM.parseError.reason);
                    } else {
                        //     printnode(xmlDOM, 0);
                        searchNode(xmlDOM, searchForm.txtSearch.value, tableName);
                    }
                }
            }
  function checkLogin(loginAcc){
                if(loginAcc==''){
                    var strconfirm = confirm("You need login first!");
                    if (strconfirm == true)
                    {
                        window.location.href = "login.jsp"; 
                        return false;
                    }else{
                        return false;
                    }
                }
            }
        </script>

        <script>
            function myFunction() {
                document.getElementById("content1").style.display = "none";
                document.getElementById("content2").style.display = "block";
                document.getElementById("dataTable").style.display = "block";

            }
        </script>
        <script>
             loginAcc='${sessionScope.FULLNAME}';
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
            <script>
                reqOB = '${sessionScope.XMLDATA}';
            </script>

            <div id="content">
                <form name="searchForm">
                    Search laptops <input type="text" name="txtSearch" value="Apple">
                    <input type="button" value="Search" onclick="myFunction(), traver('dataTable')" style="background:  silver"/>
                </form>
                <div id="content1">
                    <!-- 
                    Lay du lieu  xml show ra man hinh 
                              
                    -->


                    <c:set var="i" value="1" />
                    <table>

                        <x:forEach var="com" 
                                   select="$doc//*[local-name()='computers']/*[local-name()='computer']" 
                                   varStatus="counter">
                            <c:if test="${i==1}">
                                <tr>
                                </c:if>

                                <td>
                                    <div align="center">
                                        <p style="color: red"><x:out select="price"/> VND</br></p>

<!--<a href="ProcessServlet?btAction=Detail&txtCode=<x:out select="code"/>"> -->
                                        <a href="detail.jsp?txtCode=<x:out select="code"/>">
                                            <img id="img" src="image/<x:out select="imagelink"/>"
                                                 width="100" height="90" style="padding: auto"></a><br/>
                                        <x:out select="name"/></br>

                                        <form action="ProcessServlet" method="POST" id="myForm">
                                            <input type="hidden" name="txtCode" value="<x:out select="code"/>"/>
                                            <input type="submit" name="btAction" value="Buy Laptop" onclick="return checkLogin(loginAcc)"/>
                                        </form>
                                        <c:if test="${accountrole eq true}">
                                            <form action="ProcessServlet" method="post">
                                                <input type="number" name="txtPrice" value="<x:out select="price"/>" 
                                                       style="background: #F31B1B;width: 70px;color: black;font-style: inherit" 
                                                       maxlength="100000000" size="8"/>
                                                <input type="hidden" name="searchCode" value="<x:out select="code"/>"/>
                                                <input type="hidden" name="txtDetail" value="<x:out select="detail"/>"/>
                                                <input type="hidden" name="txtScreen" value="<x:out select="screen"/>"/>
                                                <input type="hidden" name="txtHdd" value="<x:out select="hdd"/>"/>
                                                <input type="hidden" name="txtVga" value="<x:out select="vga"/>"/>
                                                <input type="hidden" name="txtRam" value="<x:out select="ram"/>"/>
                                                <input type="submit" name="btAction" value="Update"/>
                                            </form>
                                        </c:if>
                                    </div><br/>
                                </td>

                                <c:set var="i" value="${i+1}" />
                                <c:if test="${i==1}">
                                </tr>
                            </c:if>
                            <c:if test="${i==5}">
                                <c:set var="i" value="1" />
                            </c:if>

                        </x:forEach>
                    </table>
                </div>
                <div id="content2"> 
                    <table id="dataTable" style="width: 100%;text-align: center;display: none" >

                        <tr width="25%"  style="background:  silver" >
                            <th></th>  
                            <th>Code Laptop</th>  
                            <th>Name</th>  
                            <th>brand</th>  
                            <th>Screen</th>  
                            <th>HDD</th>  
                            <th>Price</th> 
                            <th>VGA</th> 
                            <th>RAM</th>
                            <th>CPU</th>
                            <th style="color: #000099">More</th>  
                        </tr>
                    </table>

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
