<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
</head>


<body>
<form method="post" action="UserRegistrationServlet">
	<center><p> Please enter registered username and email-id.</p>
		<table border=1 cellspacing=1 cellpadding=1>
			<tr>
				<td>Enter Username:</td>
				<td><input type="text" name="username" id="username" /></td>
			</tr>
			<tr>
				<td>Enter E-Mail:</td>
				<td><input type="text" name="email" id="email" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Retrieve" /></td>
				<td><input type="reset" value="Reset" /></td>
			</tr>
			<tr>
				<td><a href="NavigationServlet?page=newlogin">Back to Login page.</a></td>
			</tr>
			<tr>
				<td><% if(request.getParameter("success")!=null) { %>
						<p>Retrieve password Failed!!</p>
					<% } %>
				</td>
			</tr>
		</table>
	</center>
		<input type="hidden" name="page" value="post_forgot" />
</form>
</body>
</html>