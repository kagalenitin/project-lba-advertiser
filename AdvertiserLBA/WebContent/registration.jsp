<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
	<link rel="stylesheet" href="css/generalpurpose.css" type="text/css"/>
	<link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css" type="text/css" media="screen" />
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> 
	<script type="text/javascript" src="http://dev.jquery.com/view/trunk/plugins/validate/jquery.validate.js"></script>
	
	<!-- <script type="text/javascript" src="development-bundle/jquery-1.4.2.js"></script> -->
	<script type="text/javascript">
	//initiate validator on load
	 var $jry = jQuery.noConflict();
	$jry(function() {
		
		  $jry.validator.addMethod("phone", function(phone_number, element) {
		    phone_number = phone_number.replace(/\s+/g, ""); 
			return this.optional(element) || phone_number.length > 9 &&
				phone_number.match(/^(1-?)?(\([2-9]\d{2}\)|[2-9]\d{2})-?[2-9]\d{2}-?\d{4}$/);
		}, "Please specify a valid phone number");
		// validate contact form on keyup and submit
		$jry("#registrationForm").validate({
			//set the rules for the field names
			rules: {
				companyname: {
					required: true,
					minlength: 2
				},
				username: {
					required: true,
					minlength: 8
				},
				password: {
					required: true,
					minlength: 6
				},
				firstname: {
					required: true,
					minlength: 2
				},
				lastname: {
					required: true,
					minlength: 2
				},
				address: {
					required: true,
					minlength: 2
				},
				phone: {
					required: true,
					phone: true
				},
				email: {
					required: true,
					email: true
				}				
			},
			//set messages to appear inline
			messages: {
				companyname: "Please enter your company name",
				username: "Username should be 8 characters",
				password: "Password should be between 6-15 characters",
				firstname: "Please enter your name",
				lastname: "Please enter your message",
				address: "Address cannot be empty.",
				email: "Please enter a valid email address"
			}
		});
	});
</script>
<style type="text/css">
	.error {
		color: blue;
		font: 8pt verdana;
		padding-left: 0px
	}
</style>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Registration, LBA</title>
</head>
<body bgcolor="#F3F3F3">
<br /><br /><br /><br /><br /><br />
<form name="registrationForm" id="registrationForm" action="UserRegistrationServlet" method="post">
	<center>
			<table width="80%"  bgcolor="#003366" cellpadding="3">
				<tr>
					<td align="left"><img src="images/adSpotWeb.gif" height="72" width="175" /></td>
				</tr>
			</table>
			<table cellpadding="3">
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
					 <td align="right"><button id="register" type="submit"  class="ui-state-default ui-corner-all" class="submit" >Register</button></td>
					<td><button id="clear" type="reset"  class="ui-state-default ui-corner-all" >Clear</button></td> 
					<!-- <td><input class="submit" type="submit" value="Submit" /></td> -->
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