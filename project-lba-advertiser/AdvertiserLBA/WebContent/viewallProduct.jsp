<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.LBA.Advertiser.model.ProductModel" %>
<%@ page import = "com.LBA.Advertiser.bean.ProductBean" %>
<%
	ProductModel objProduct = (ProductModel) request.getAttribute("viewall");
	ProductBean[] objBean = objProduct.viewAllProducts();
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/generalpurpose.css" type="text/css" />
<script type="text/javascript" src="javascripts/jquery-1.4.2.js"></script>
<script type="text/javascript" src="javascripts/jquery.tablePagination.0.2.js"></script>
<style type="text/css">
		   #testTable { 
            width : 200px;
            margin-left: auto; 
            margin-right: auto; 
          }
          
          #tablePagination { 
            background-color: #DCDCDC; 
            font-size: 0.8em; 
            padding: 0px 5px; 
            height: 20px;
            width: 300px;
            border: 1px;
          }
          
          #tablePagination_paginater { 
            margin-left: auto; 
            margin-right: auto;
          }
          
          #tablePagination img { 
            padding: 0px 2px; 
          }
          
          #tablePagination_perPage { 
            float: left; 
          }
          
          #tablePagination_paginater { 
            float: right; 
          }

	
</style>
<title>View All Product Details</title>
</head>
<body>
<%@ include file="./navigationbar.jsp" %>

<center>
	<% if(request.getAttribute("deleteproduct") !=null){ %>
	<p> Product Deleted Successfully.</p>
	<% } %>
	
	<% if(objProduct.getProductCount()==0){ %>
		<h1>Sorry ! You do not have any products.</h1>
	<%} else{ %>
	<form name="viewproducts" method="post" action="ProductServlet">
	<table>
		<tr align="center">
			<td colspan=4><h3 id="login_font">View Product Details</h3></td>
		</tr>
		
	</table>
	<table id="menuTable">
		<thead>
			<tr>
				<td id="viewall_product_heading" width="90"><b>Product ID</b></td>
				<td id="viewall_product_heading" width="220"><b>Product Name</b></td>
				<td id="viewall_product_heading" width="400"><b>Product Description</b></td>
				<td id="viewall_product_heading" width="90"><b>Price (in $)</b></td>
				
			</tr>
		</thead>
		<tbody>
			<% 	for(int i=0; i<objProduct.getProductCount(); i++){%> 
	 	 	<tr>
	 			<td id="viewall_product"><b><a href="ProductServlet?page=editid&productid=<%= objBean[i].getCount() %>"><font style="color:#000000"><%= objBean[i].getCount() %></font></a></b></td>
				<td id="viewall_product" ><label id="productname"><%= objBean[i].getProductName() %></label></td>
				<td id="viewall_product"><label id="productdesc"><%= objBean[i].getProductdescription() %></label></td>
				<td id="viewall_product"><label id="productprice"><%= objBean[i].getPrice() %></label></td>
					
			<% } %>
			</tr> 
		</tbody>				
	</table>
	<%}%>
	</form>
	<script type="text/javascript">
		$('tbody tr:odd', $('#menuTable')).hide(); //hiding rows for test
            var options = {
              currPage : 1, 
              ignoreRows : $('tbody tr:odd', $('#menuTable2')),
              optionsForRows : [2,3,5],
              rowsPerPage : 5,
              firstArrow : (new Image()).src="images/firstBlue.gif",
              prevArrow : (new Image()).src="images/prevBlue.gif",
              lastArrow : (new Image()).src="images/lastBlue.gif",
              nextArrow : (new Image()).src="images/nextBlue.gif"
            }
		
	 	$('table#menuTable').tablePagination(options);
        
	</script>
	
</center>
<%@ include file="./footer.jsp" %>
</body>
</html>