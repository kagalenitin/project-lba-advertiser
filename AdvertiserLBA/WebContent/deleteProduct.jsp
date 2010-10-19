<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.model.ProductModel" %>
<%@ page import = "com.LBA.Advertiser.bean.ProductBean" %>
<%
	ProductModel objPModel = (ProductModel)request.getAttribute("confirmdelete");
	ProductBean objBean = objPModel.getEditProductDetail();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="css/generalpurpose.css" type="text/css" />
	<link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css" type="text/css" media="screen" />  	 
	
<script type="text/javascript">
	function whichcall(val){
		document.deletePage.page.value=val;
	}	
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Contract</title>
</head>
<body>
<%@ include file="navigationbar.jsp" %>
<center>
<form name="deletePage" action="ProductServlet" method="post">
	<table>
			<tr>
				<td colspan=2><h3>This step will delete your product!</h3></td>
			</tr>
			<tr>
				<td id="edit_product">Product ID </td>
				<td><input type="text" name="productid" value="<%=objBean.getCount() %>" readonly="readonly" /></td>
			</tr>
			<tr>
				<td id="edit_product">Product Name </td>
				<td><input type="text" name="productname" value="<%=objBean.getProductName() %>" disabled="disabled" /></td>
			</tr>
			<tr>
				<td id="edit_product">Product Description </td>
				<td><input type="text" name="productdesc" value="<%= objBean.getProductdescription() %>" disabled="disabled" /></td>
			</tr>
			<tr>
				<td id="edit_product">Product Price </td>
				<td><input type="text" name="productprice" value="<%= objBean.getPrice() %>" disabled="disabled" /></td>
			</tr>
			<tr>
				<td align="right"><button type="submit" name="delete" id="deleteproduct" onclick="whichcall('deldata')" class="ui-state-default ui-corner-all">Delete Product</button></td>
				<td align="left"><button type="submit" name="backtoall" id="backtoall" onclick="whichcall('backtoall')" class="ui-state-default ui-corner-all">Back to All Products</button><button type="submit" name="backtoedit" id="backtoedit" onclick="whichcall('backtoedit')" class="ui-state-default ui-corner-all">Back to Edit</button></td>
			</tr>
		</table>
		<input type="hidden" name="page" />
	</form>
</center>

</body>
</html>