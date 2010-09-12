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


<title>View All Product Details</title>
</head>
<body>
<%@ include file="/navigationbar.jsp" %>

<center>
<br /><br />
	<% if(request.getAttribute("deleteproduct") !=null){ %>
	<p> Deleted Successfully.</p>
	<% } %>
	
	<% if(objProduct.getProductCount()==0){ %>
		<h1>Sorry ! You do not have any products.</h1>
	<%} else{ %>
	<form name="viewproducts" method="post" action="ProductServlet">
	<table border=1 cellspacing=1 cellpadding=1>
		<tr>
			<td><b>Product ID</b></td>
			<td><b>Product Name</b></td>
			<td><b>Product Description</b></td>
			<td><b>Price (in $)</b></td>
			
		</tr>

		<% 	for(int i=0; i<objProduct.getProductCount(); i++){%> 
 	 	<tr>
 			<td><a href="ProductServlet?page=editid&productid=<%= objBean[i].getCount() %>"><%= objBean[i].getCount() %></a></td>
			<td><label id="productname"><%= objBean[i].getProductName() %></label></td>
			<td><label id="productdesc"><%= objBean[i].getProductDesc() %></label></td>
			<td><label id="productprice"><%= objBean[i].getPrice() %></label></td>
				
		<% } %>
		</tr> 
		 						
	</table>
	<%}%>
	</form>
</center>
</body>
</html>