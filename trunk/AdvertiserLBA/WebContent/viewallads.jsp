<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.LBA.Advertiser.model.AdvertisementModel" %>
<%@ page import = "com.LBA.Advertiser.bean.AdvertisementBean" %>
<%@ page import = "com.LBA.Advertiser.model.ContractModel" %>
<%
	AdvertisementModel objAdvertisement = (AdvertisementModel) request.getAttribute("viewallads");
	AdvertisementBean[] objBean = objAdvertisement.viewAllAds();
	
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
	<% if(objAdvertisement.getAdCount()==0){ %>
		<h1>Sorry ! You do not have any ads.</h1>
	<%} else{ %>
	<form name="viewproducts" method="post" action="ProductServlet">
	<h3 id="login_font">Ad Catalog</h3>
	<table id="menuTable">
		<thead>
			<tr>
				<td id="viewall_product_heading" width="90"><b>Advertisement Name</b></td>
				<td id="viewall_product_heading" width="220"><b>Advertisement Description</b></td>
				<td id="viewall_product_heading" width="90"><b>Ad Size</b></td>
				<td id="viewall_product_heading" width="40"><b>Ad Start Date</b></td>
				<td id="viewall_product_heading" width="90"><b>Ad End Date</b></td>
				<td id="viewall_product_heading" width="90"><b>Product Id</b></td>
				<td id="viewall_product_heading" width="90"><b>Product Name</b></td>
				<td id="viewall_product_heading" width="90"><b>Product Description</b></td>
				<td id="viewall_product_heading" width="90"><b>Product Price</b></td>
				
			</tr>
		</thead>
		<tbody>
			<% 	for(int i=0; i< objAdvertisement.getAdCount(); i++){ %> 
			<tr>
	 			<td id="viewall_product" ><label id="adname"><%= objBean[i].getAdName()%></label></td>
				<td id="viewall_product" ><label id="addesc"><%= objBean[i].getAdDesc() %></label></td>
				<td id="viewall_product"><label id="adsize"><%= objBean[i].getAdsize() %></label></td>
				<td id="viewall_product"><label id="adstartdate"><%= objBean[i].getAdStartDate() %></label></td>
				<td id="viewall_product"><label id="adstartdate"><%= objBean[i].getAdEndDate() %></label></td>
				<td id="viewall_product"><label id="productid"><%= objBean[i].getProductID() %></label></td>
				<td id="viewall_product"><label id="productname"><%= objBean[i].getProductname() %></label></td>
				<td id="viewall_product"><label id="productdescription"><%= objBean[i].getProductdescription() %></label></td>
				<td id="viewall_product"><label id="productprice"><%= objBean[i].getProductprice() %></label></td>
					
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
              rowsPerPage : 2,
              firstArrow : (new Image()).src="images/firstBlue.gif",
              prevArrow : (new Image()).src="images/prevBlue.gif",
              lastArrow : (new Image()).src="images/lastBlue.gif",
              nextArrow : (new Image()).src="images/nextBlue.gif"
            }
	
		 $('table#menuTable').tablePagination(options);
	</script>
	
</center>
</body>
</html>