<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
<link rel="stylesheet" href="css/generalpurpose.css" type="text/css"/>
<link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css" type="text/css" media="screen" />

</head>


<body bgcolor="#F3F3F3">
<br /><br /><br /><br /><br /><br />
<form method="post" action="UserRegistrationServlet">
	<center>
		<table width="80%" bgcolor="#003366">
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
							<td align="right"><button id="login" type="submit"  class="ui-state-default ui-corner-all">Retrieve Password</button></td>
							<td align="left"><button id="reset" type="reset"  class="ui-state-default ui-corner-all">Reset</button></td>
						</tr>
						<tr>
							<td style="font-family:Verdana;font-size: small;"><a href="NavigationServlet?page=newlogin">Back to Login page.</a></td>
						</tr>
						<tr>
							<td><% if(request.getParameter("success")!=null) { %>
									<p>Retrieve password Failed!!</p>
								<% } %>
							</td>
						</tr>
					</table>	
				</td>
			</tr>
		</table>
	</center>
		<input type="hidden" name="page" value="post_forgot" />
</form>
</body>
</html>