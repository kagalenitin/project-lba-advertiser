<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<!--	<link rel="stylesheet" href="css/generalpurpose.css" type="text/css"/>-->
<!--	<link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css" type="text/css" media="screen" />-->
	<script type="text/javascript" src="javascripts/jquery.js"></script>
	<script type="text/javascript" src="javascripts/jquery.validate.js"></script>
	<script type="text/javascript">
	//initiate validator on load
	$(function() {
		
		// validate contact form on keyup and submit
		$("#contactForm").validate({
			alert("e");
			//set the rules for the field names
			rules: {
				name: {
					required: true,
					minlength: 2
				},
				email: {
					required: true,
					email: true
				},
				firstname: {
					required: true,
					minlength: 2
				},
			},
			//set messages to appear inline
			messages: {
				name: "Please enter your name",
				email: "Please enter a valid email address",
				message: "Please enter your message"
			}
		});
	});
</script>
<style type="text/css">
	.error {
		color: red;
		font: 12pt verdana;
		padding-left: 10px
	}
</style>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Registration, LBA</title>
</head>
<body bgcolor="#F3F3F3">
<br /><br /><br />
<form name="registrationForm" method="post" id="contactForm" >
	<center>
			<table width="80%"  bgcolor="#003366" >
				<tr>
					<td align="left"><img src="images/adSpotWeb.gif" height="72" width="175" /></td>
				</tr>
			</table>
			<table>
				<tr><td><h3 id="login_font">Registration Page</h3></td></tr>
				<tr>
					<td id="registration_column">Company Name</td>
					<td><input type="text" name="companyname" id="companyname" /></td>
				</tr>
				<tr>
					<td id="registration_column">Username</td>
					<td><input type="text" name="username" id="username" maxlength="25" /></td>
				</tr>
				<tr>
					<td id="registration_column">Password</td>
					<td><input type="password" name="password" id="password" /> </td>
				</tr>
				<tr>
					<td id="registration_column">FirstName</td>
					<td><input type="text" name="firstname" id="firstname" /> </td>
				</tr>
				<tr>
					<td id="registration_column">LastName</td>
					<td><input type="text" name="lastname" id="lastname" /></td>
				</tr>
				<tr>
					<td id="registration_column">Address</td>
					<td><input type="text" name="address" id="address" /></td>
				</tr>
				<tr>
					<td id="registration_column">Phone</td>
					<td><input type="text" name="phone" id="phone"/></td>
				</tr>
				<tr>
					<td id="registration_column">EMail</td>
					<td><input type="text" name="email" id="email"/></td>
				</tr>
				<tr>
					<!-- <td align="right"><button id="register" type="submit"  class="ui-state-default ui-corner-all" class="submit" >Register</button></td>
					<td><button id="clear" type="reset"  class="ui-state-default ui-corner-all" >Clear</button></td> -->
					<td><input class="submit" type="submit" value="Submit" /></td>
				</tr>
				<tr><td colspan=2><hr /></td></tr>
				<tr style="font-family:Verdana;font-size: small;">
					<td colspan="2"><a href="NavigationServlet?page=newlogin">Back to Login Page</a></td>
				</tr>
				<tr>
					<td><% if(request.getAttribute("success") !=null){ %>
								<p id="login_font">Registered Successfully.</p>
						<% } %>
					</td>
				</tr>
			</table>
		
	</center>
	<input type="hidden" name="page" value="post_register" />
</form>
</body>
</html>