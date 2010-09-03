<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Advertiser Login Page, LBA</title>
</head>
<body>
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
			<td><a href="UserRegistrationServlet?page=forgotpassword">Forgot Password?</a></td>
			<td><a href="UserRegistrationServlet?page=newuser">New User? Please register!</a></td>
		</tr>
		<tr><td><a href="home.jsp">Temp.HomepageLink</a></td></tr>
	</table>
</center>
</body>
</html>