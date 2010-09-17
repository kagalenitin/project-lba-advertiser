<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login Page, LBA</title>
</head>
<body>
<form name="adminloginform" method="post" action="AdminServlet">
<center>
	<table border=1 cellspacing=0 cellpadding=0>
		<tr>
			<td colspan=2>Enter Login Details:</td>
		</tr>
		<tr>
			<td bgcolor="#003366"><font color="#FFFFFF">Username:</font></td>
			<td bgcolor="#CCCCCC"><input type="text" name="username" id="username" /></td>
		</tr>
		<tr>
			<td bgcolor="#003366"><font color="#FFFFFF">Password:</font></td>
			<td bgcolor="#CCCCCC"><input type="password" name="password" id="password" /></td>
		</tr>
		<tr>
			<td><input type="submit" value="Login" id="login" /></td>
			<td><input type="reset" value="Clear" id="clear" /></td>
		</tr>
		
		<tr>
			<td><% if(request.getParameter("loginfailed")!=null){ %>
				Login Failed!!
				<% } %>
		</td>
		</tr>
	</table>
</center>
<input type="hidden" name="page" value="admin_post_login" />
</form>

</body>
</html>