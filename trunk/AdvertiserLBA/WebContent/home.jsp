<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.model.RegistrationModel" %>
<%@ page import="com.LBA.Advertiser.servlet.UserRegistrationServlet" %>
<%@ page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome  <%= session.getAttribute("user_session") %></title>
</head>
<body>
<table border=1 cellspacing=1 cellpadding=1 width=100%>
	<tr align=center><td colspan=5><h1>Welcome <%= session.getAttribute("user_session") %></h1></td></tr>
	<tr>
		<td><a href="UserRegistrationServlet?page=edituser">Edit Details</a></td>
		<td><a href="ContractCreateServlet?page=contract">Create Contract</a></td>
		<td><a href="ContractCreateServlet?page=viewcontract">View Contract</a></td>
		<td>Create Advertisement</td>
		<td>Create Product</td>
		<td><a href="UserRegistrationServlet?page=logout">Logout</a></td>
	</tr>
	
</table>
</body>
</html>