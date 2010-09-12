<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.model.ProductModel" %>
<%@ page import = "com.LBA.Advertiser.bean.ProductBean" %>
<%
	ProductModel objPModel = (ProductModel)request.getAttribute("editdelete");
	ProductBean objBean = objPModel.getEditProductDetail();
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function whichbutton(val){
		var flag=false;
		document.form_edit.page.value=val;
	}	
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Product Details</title>
</head>
<body>
<%@ include file="/navigationbar.jsp" %>
<form method="post" action="ProductServlet" name="form_edit">
<br /><br />
<center>
	<% if(request.getAttribute("change") !=null){ %>
	<p> Updated Successfully.</p>
	<% } %> 
		<table border=1 cellspacing=1 cellpadding=1>
		<tr>
			<td align="right">Product ID:</td>
			<td><input type="text" name="productid" value="<%=objBean.getCount() %>" readonly="readonly" /></td>
		</tr>
		<tr>
			<td align="right">Product Name:</td>
			<td><input type="text" name="productname" value="<%=objBean.getProductName() %>" /></td>
		</tr>
		<tr>
			<td align="right">Product Description:</td>
			<td><input type="text" name="productdesc" value="<%= objBean.getProductDesc() %>" /></td>
		</tr>
		<tr>
			<td align="right">Product Price:</td>
			<td><input type="text" name="productprice" value="<%= objBean.getPrice() %>" /></td>
		</tr>
		<tr>
			<td><input type="submit" value="Edit & Save" name="editsave" id="editsave" onclick="whichbutton('editsave')"/></td>
			<td><input type="submit" value="Delete" name="delete" id="deleteproduct" onclick="whichbutton('delconfirm')"/></td>
		</tr>
	</table>
</center>
<input type="hidden" name="page" id="page"/>
</form>
</body>
</html>