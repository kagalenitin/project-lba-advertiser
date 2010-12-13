<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
<link rel="stylesheet" href="css/generalpurpose.css" type="text/css"/>
<link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css" type="text/css" media="screen" />

	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> 
	<script type="text/javascript" src="http://dev.jquery.com/view/trunk/plugins/validate/jquery.validate.js"></script>
	
	<script type="text/javascript">
		var $eud = jQuery.noConflict(); 
		$eud(function(){
			$eud('#forgotpassword').validate({
				rules:{
					username:{
						required: true,
						minlength: 5
					},
					email:{
						required: true,
						email: true
					}
				},
				messages:{
					username: "Please enter a valid username",
					email: "Please enter a valid email"
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
</head>


<body bgcolor="#F3F3F3">
<br /><br /><br /><br /><br /><br />
<form method="post" action="UserRegistrationServlet" id="forgotpassword" name="forgotpassword">
	<center>
		<table width="80%" bgcolor="#003366" cellpadding="3">
			<tr align="center">
				<td align="left"><img src="images/adSpotWeb.gif" height="72" width="175" /></td>
			</tr>
		</table>
		<table>
			<tr align="center">
				<td>
					<table bgcolor="#F3F3F3">
						<tr><td colspan="2" align="center"><h3 id="login_font">Enter registered Username and Email.</h3></td></tr>
						<tr>
							<td id="registration_column">Enter Username</td>
							<td><input type="text" name="username" id="username" /></td>
						</tr>
						<tr>
							<td id="registration_column">Enter E-Mail</td>
							<td><input type="text" name="email" id="email" /></td>
						</tr>
						<tr>
							<td align="right"><button id="login" type="submit"  class="ui-state-default ui-corner-all" class="submit">Retrieve Password</button></td>
							<td align="left"><button id="reset" type="reset"  class="ui-state-default ui-corner-all">Reset</button></td>
						</tr>
						<tr>
							<td style="font-family:Verdana;font-size: small;"><a href="NavigationServlet?page=newlogin">Back to Login page.</a></td>
						</tr>
						<tr>
							<td><% if(request.getParameter("success")!=null) { %>
									<p style="font-family:Verdana;font-size: small; font-style: italic">Retrieve password Failed!!</p>
								<% } %>
								<% if(request.getAttribute("emailsent")!=null) { %>
										<p style="font-family:Verdana;font-size: small; font-style: italic">Password was reset successfully. Please check your email.</p>
								<%} %>
							</td>
						</tr>
					</table>	
				</td>
			</tr>
		</table>
	</center>
		<input type="hidden" name="page" value="post_forgot" />
</form>
<%@ include file="./footer.jsp" %>
</body>
</html>