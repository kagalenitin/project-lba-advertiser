<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration, LBA</title>
</head>
<body>

<form name="registrationForm" method="post" action="UserRegistrationServlet">
	<center>
		<% if(request.getAttribute("success") !=null){ %>
							<p> Registered Successfully.</p>
		<% } %>
		<table border=1 cellspacing=0 cellpadding=0>
				
				<tr>
					<td colspan=2><center><h2>Registration Form !</h2></center></td>
				</tr>
				
				<tr>
					<td align="left">Company Name:</td>
					<td><input type="text" name="companyname" id="companyname" /></td>
				</tr>
				<tr>
					<td align="left">Username:</td>
					<td><input type="text" name="username" id="username" /></td>
				</tr>
				<tr>
					<td align="left">Password:</td>
					<td><input type="password" name="password" id="password" /></td>
				</tr>
				<tr>
					<td align="left">FirstName:</td>
					<td><input type="text" name="firstname" id="firstname" /></td>
				</tr>
				<tr>
					<td align="left">LastName:</td>
					<td><input type="text" name="lastname" id="lastname" /></td>
				</tr>
				<tr>
					<td align="left">Address:</td>
					<td><input type="text" name="address" id="address" /></td>
				</tr>
				<tr>
					<td align="left">Phone:</td>
					<td><input type="text" name="phone" id="phone" /></td>
				</tr>
				<tr>
					<td align="left">EMail:</td>
					<td><input type="text" name="email" id="email" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="Register"/></td>
					<td><input type="reset" value="Clear" /></td>
				</tr>
				<tr>
					<td colspan="2"><a href="NavigationServlet?page=newlogin">Back to Login Page.</a></td>
				</tr>
		</table>
	</center>
	<input type="hidden" name="page" value="post_register" />
</form>
</body>
</html>