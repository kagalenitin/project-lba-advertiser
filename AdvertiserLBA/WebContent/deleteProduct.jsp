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
<br /><br />
<form name="deletePage" action="ProductServlet" method="post">
<table border=1 cellspacing=1 cellpadding=1>
		<tr>
			<td colspan=2><h3>Please make sure you want to delete this record.</h3></td>
		</tr>
		<tr>
			<td align="right">Product ID:</td>
			<td><input type="text" name="productid" value="<%=objBean.getCount() %>" readonly="readonly" /></td>
		</tr>
		<tr>
			<td align="right">Product Name:</td>
			<td><input type="text" name="productname" value="<%=objBean.getProductName() %>" disabled="disabled" /></td>
		</tr>
		<tr>
			<td align="right">Product Description:</td>
			<td><input type="text" name="productdesc" value="<%= objBean.getProductDesc() %>" disabled="disabled" /></td>
		</tr>
		<tr>
			<td align="right">Product Price:</td>
			<td><input type="text" name="productprice" value="<%= objBean.getPrice() %>" disabled="disabled" /></td>
		</tr>
		<tr>
			<td align="right"><input type="submit" value="Delete" name="delete" id="deleteproduct" onclick="whichcall('deldata')"/></td>
			<td align="left"><input type="submit" value="Back to View All Products" name="backtoall" onclick="whichcall('backtoall')" />  <input type="submit" value="Back to Edit" name="backtoedit" onclick="whichcall('backtoedit')"/></td>
		</tr>
	</table>
		<input type="hidden" name="page" />
	</form>
</center>

</body>
</html>