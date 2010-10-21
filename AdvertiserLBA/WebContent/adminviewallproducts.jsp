<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.LBA.Advertiser.model.AdminModel" %>
<%@ page import = "com.LBA.Advertiser.bean.ProductBean" %>
<%
	AdminModel objProduct = (AdminModel) request.getAttribute("viewall");
	ProductBean[] objBean = objProduct.viewAllProducts();
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/generalpurpose.css" type="text/css" />

<title>View All Product Details</title>
</head>
<body>
<%@ include file="./adminnavigationbar.jsp" %>

<center>
<br /><br />
	
	<% if(objProduct.getProductCount()==0){ %>
		<h1>Sorry ! You do not have any products.</h1>
	<%} else{ %>
	
	<table align="center" cellpadding="3">
		<tr>
			<td id="viewall_product_heading" width="90"><b>Product ID</b></td>
			<td id="viewall_product_heading" width="190"><b>Product Name</b></td>
			<td id="viewall_product_heading" width="350"><b>Product Description</b></td>
			<td id="viewall_product_heading" width="90"><b>Price (in $)</b></td>
			<td id="viewall_product_heading" width="90"><b>Username</b></td>
			
		</tr>

		<% 	for(int i=0; i<objProduct.getProductCount(); i++){%> 
 	 	<tr>
 			<td id="viewall_product"><font style="color:#000000"><%= objBean[i].getCount() %></font></td>
			<td id="viewall_product"><label id="productname"><%= objBean[i].getProductName() %></label></td>
			<td id="viewall_product"><label id="productdesc"><%= objBean[i].getProductdescription() %></label></td>
			<td id="viewall_product"><label id="productprice"><%= objBean[i].getPrice() %></label></td>
			<td id="viewall_product"><label id="username"><%= objBean[i].getUsername() %></label></td>
				
		<% } %>
		</tr> 
		 						
	</table>
	<%}%>
	
</center>
</body>
</html>