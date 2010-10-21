<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.LBA.Advertiser.model.AdvertisementModel" %>
<%@ page import = "com.LBA.Advertiser.bean.AdvertisementBean" %>
<%@page import="com.LBA.Advertiser.model.ContractModel"%>
<%
	AdvertisementModel objAdvertisement = (AdvertisementModel) request.getAttribute("viewallads");
	AdvertisementBean[] objBean = objAdvertisement.viewAllAds();
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/generalpurpose.css" type="text/css" />
<title>View All Product Details</title>
</head>
<body>
<%@ include file="./navigationbar.jsp" %>

<center>
	<% if(objAdvertisement.getAdCount()==0){ %>
		<h1>Sorry ! You do not have any ads.</h1>
	<%} else{ %>
	<form name="viewproducts" method="post" action="ProductServlet">
	<table>
		<tr align="center">
				<td colspan=4><h3 id="login_font">Ad Catalog</h3></td>
		</tr>
		<tr>
			<td id="viewall_product_heading" width="90"><b>Advertisement Name</b></td>
			<td id="viewall_product_heading" width="220"><b>Advertisement Description</b></td>
			<td id="viewall_product_heading" width="90"><b>Ad Size</b></td>
			<td id="viewall_product_heading" width="400"><b>Ad Start Date</b></td>
			<td id="viewall_product_heading" width="90"><b>Ad End Date</b></td>
			<td id="viewall_product_heading" width="90"><b>Product Id</b></td>
			<td id="viewall_product_heading" width="90"><b>Product Name</b></td>
			<td id="viewall_product_heading" width="90"><b>Product Description</b></td>
			<td id="viewall_product_heading" width="90"><b>Product Price</b></td>
			
		</tr>

		<% 	for(int i=0; i<objAdvertisement.getAdCount(); i++){%> 
 	 	<tr>
 			<td id="viewall_product" ><label id="adname"><%= objBean[i].getAdName()%></label></td>
			<td id="viewall_product" ><label id="addesc"><%= objBean[i].getAdDesc() %></label></td>
			<td id="viewall_product"><label id="adsize"><%= objBean[i].getAdsize() %></label></td>
			<td id="viewall_product"><label id="adstartdate"><%= objBean[i].getAdStartDate() %></label></td>
			<td id="viewall_product"><label id="adstartdate"><%= objBean[i].getAdEndDate() %></label></td>
			<td id="viewall_product"><label id="productid"><%= objBean[i].getProductid() %></label></td>
			<td id="viewall_product"><label id="productname"><%= objBean[i].getProductname() %></label></td>
			<td id="viewall_product"><label id="productdescription"><%= objBean[i].getProductdescription() %></label></td>
			<td id="viewall_product"><label id="productprice"><%= objBean[i].getProductprice() %></label></td>
				
		<% } %>
		</tr> 
		 						
	</table>
	<%}%>
	</form>
</center>
</body>
</html>