<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Product</title>
	<link rel="stylesheet" type="text/css" href="css/generalpurpose.css"  media="screen" />
	<link rel="stylesheet" type="text/css" href="development-bundle/themes/base/jquery.ui.all.css" media="screen" /> 

</head>
<body>
<%@ include file="/navigationbar.jsp" %>
<form method="post" action="ProductServlet">
	<center>
				<% if(request.getAttribute("deleteproduct")!=null){ %>
						<h3 id="login_font">Product deleted successfully.</h3>
				<% } %>	
				<h3 id="login_font">Create Product</h3>
		<table id="login_table">
			<tr>
				<td id="login_column">Product Name</td>
				<td><input type="text" name="productname" id="productname"/></td>
			</tr>
			<tr>
				<td id="login_column">Product Description</td>
				<td><input type="text" name="productdesc" id="productdesc" maxlength="150" /></td>
			</tr>
			<tr>
				<td id="login_column">Product Price</td>
				<td><input type="text" name="price" id="price" /></td>
			</tr>
			<tr>
				<td align="right"><button id="createproduct" type="submit"  class="ui-state-default ui-corner-all">Create Product</button></td>
					<td><button id="clear" type="reset"  class="ui-state-default ui-corner-all" >Reset</button></td>
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