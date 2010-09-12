<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Product</title>
</head>
<body>
<%@ include file="/navigationbar.jsp" %>
<table>
	<tr>
		<td><a href="NavigationServlet?page=viewproducts">View Products</a></td>
	</tr>
</table>
<br /><br />
<form method="post" action="ProductServlet">
<center>
				<% if(request.getAttribute("deleteproduct")!=null){ %>
						<p>Product deleted successfully.</p>
				<% } %>	
				
		<table border=1 cellspacing=1 cellpadding=1>
			<tr><td colspan=2 align="center"><h1>Create Product Details!</h1></td></tr>
			<tr>
				<td align="right">Product Name:</td>
				<td><input type="text" name="productname" id="productname"/></td>
			</tr>
			<tr>
				<td align="right">Product Description:</td>
				<td><input type="text" name="productdesc" id="productdesc" maxlength="150" /></td>
			</tr>
			<tr>
				<td align="right">Product Price:</td>
				<td><input type="text" name="price" id="price" /></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="Submit"/></td>
				<td><input type="reset" value="Reset" /></td>
			</tr>
			<tr>
				<td>
					<% if(request.getAttribute("productsuccess")!=null){ %>
						<p>Product added successfully.</p>
				<% } %>	
				</td>
			</tr>
		</table>
</center>
<input type="hidden" name="page" value="post_product" />
</form>
</body>
</html>