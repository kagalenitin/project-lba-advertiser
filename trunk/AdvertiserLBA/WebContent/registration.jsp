<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/generalpurpose.css" type="text/css"/>
<link rel="stylesheet" href="js/ui.all.css" type="text/css" media="screen" />
<script src="js/jquery-1.3.2.js" type="text/javascript"> </script>

<script>
$(document).ready(function(){

	$("#registrationForm").validate({
		rules: {
			companyname: "required",
			username: "required"
		},

		messages: {
			comment: "Please enter the required fields."
		}
	});
});
	
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration, LBA</title>
</head>
<body bgcolor="#F3F3F3">
<br /><br /><br />
<form name="registrationForm" method="post" action="UserRegistrationServlet">
	<center>
		<% if(request.getAttribute("success") !=null){ %>
							<p id="login_font"> Registered Successfully.</p>
		<% } %>
		
			<h1 id="login_font">Location Based Advertisement </h1>
			<h3 id="login_font">Registration Page !</h3>
		<table id="login_table">
				<tr>
					<td id="login_column">Company Name</td>
					<td><input type="text" name="companyname" id="companyname" /></td>
				</tr>
				<tr>
					<td id="login_column">Username</td>
					<td><input type="text" name="username" id="username" /></td>
				</tr>
				<tr>
					<td id="login_column">Password</td>
					<td><input type="password" name="password" id="password" /></td>
				</tr>
				<tr>
					<td id="login_column">FirstName</td>
					<td><input type="text" name="firstname" id="firstname" class="required"/></td>
				</tr>
				<tr>
					<td id="login_column">LastName</td>
					<td><input type="text" name="lastname" id="lastname" /></td>
				</tr>
				<tr>
					<td id="login_column">Address</td>
					<td><input type="text" name="address" id="address" /></td>
				</tr>
				<tr>
					<td id="login_column">Phone</td>
					<td><input type="text" name="phone" id="phone" /></td>
				</tr>
				<tr>
					<td id="login_column">EMail</td>
					<td><input type="text" name="email" id="email"  class="required email"/></td>
				</tr>
				<tr>
					<td align="right"><button id="register" type="submit"  class="ui-state-default ui-corner-all" >Register</button></td>
					<td><button id="clear" type="reset"  class="ui-state-default ui-corner-all" >Clear</button></td>
				</tr>
				<tr><td colspan=2><hr /></td></tr>
				<tr style="font-family:Verdana;font-size: small;">
					<td colspan="2"><a href="NavigationServlet?page=newlogin">Back to Login Page</a></td>
				</tr>
		</table>
	</center>
	<input type="hidden" name="page" value="post_register" />
</form>
</body>
</html>