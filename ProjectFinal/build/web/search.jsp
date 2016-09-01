
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            var reqOB;
            var xmlDOM = new ActiveXObject("Microsoft.XMLDOM");
            var tmp2;
            var count = 0;
            var cells = [];
            var xmlDOM2 = new ActiveXObject("Microsoft.XMLDOM");
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
                    alert("llll");
                    return;
                }
                if (node.tagName == "name") {
                   
                    var tmp = node.firstChild.nodeValue;
                                       
                                  //  xmlDOM2.removeChild(parent);
                                   
                    if (tmp.indexOf(strSearch, 0) > -1) {
                        var parent = node.parentNode;

                        var imagelink=parent.firstChild.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.nodeValue;
                        count++;
                        //alert("<img id=\"img\" src=\"resources/image/"+imagelink+"\"/>");
                         //alert("<img id=\"img\" src=\"image/avatartien.jpg\"/>");
                         //alert("<a href=\"detail.jsp?txtCode="+parent.firstChild.firstChild.nodeValue+"><img id=\"img\" src=\"image/"+imagelink+"\" width=\"100\"/></a>");
                        cells[0] = "<a href=\"detail.jsp?txtCode="+parent.firstChild.firstChild.nodeValue+"\"><img id=\"img\" src=\"image/"+imagelink+"\" width=\"100\"/></a>";
                        
                        cells[1] = parent.firstChild.firstChild.nodeValue+"<br/>"
                        
                               
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
                        addRow(tableName, cells);

                       
                       

                    }
                }
                var childs = node.childNodes;
                for (var i = 0; i < childs.length; i++) {
                    searchNode(childs[i], strSearch, tableName);
                }
            }

            function traver(tableName) {
                alert(reqOB);

                var tableElem = document.getElementById(tableName);
                if (!reqOB) {
                    return false;
 alert("khong load reqOB");

                }

                if (reqOB) {
                    alert(reqOB);
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
                     <li>
                        <a href="search.jsp">Search Laptops |</a>
                    </li>
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
                    <script>
            reqOB = '${sessionScope.XMLDATA}';
            alert(reqOB);
        </script>
                    <form name="searchForm">
                    Search laptops <input type="text" name="txtSearch" value="Apple">
                    <input type="button" value="Search" onclick="traver('dataTable')" style="background:  silver"/>
                </form>
                    
                    <table id="dataTable" style="width: 100%;text-align: center" >
                       
                            <tr width="25%" >
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
                            </tr>
                        
                        
                       
                      
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
