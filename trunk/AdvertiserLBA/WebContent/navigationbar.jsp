<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<table border=1 cellspacing=1 cellpadding=1 width=100%>
	<tr align=center><td colspan=6><h1>Welcome <%= session.getAttribute("user_session") %></h1></td></tr>
	<tr>
		<td><a href="NavigationServlet?page=edituser">Edit Details</a></td>
		<td><a href="NavigationServlet?page=contract">Create Contract</a></td>
		<td><a href="NavigationServlet?page=viewcontract">View Contract</a></td>
		<td><a href="NavigationServlet?page=createad">Create Advertisement</a></td>
		<td><a href="NavigationServlet?page=createproduct">Create Product</a></td>
		<td><a href="NavigationServlet?page=logout">Logout</a></td>
	</tr>
	
</table>
</body>
</html>