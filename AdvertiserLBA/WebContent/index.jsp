<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/generalpurpose.css" type="text/css"/>
<link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css" type="text/css" media="screen" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Advertiser Login Page, LBA</title>
</head>
<body bgcolor="#F3F3F3">
<form name="loginform" method="post" action="UserRegistrationServlet">
<br /><br /><br />
<center>

	<h1 id="login_font">Location Based Advertisement </h1>
		<h3 id="login_font">Enter Login Details</h3>
	<table id="login_font">
		<tr>
			<td id="login_column">Username</td>
			<td><input type="text" name="username" id="username" /></td>
		</tr>
		
		<tr>
			<td id="login_column">Password</td>
			<td><input type="password" name="password" id="password" /></td>
		</tr>
		<tr>
			<td align="right"><button id="login" type="submit"  class="ui-state-default ui-corner-all" >Login</button></td>
			<td><button id="clear" type="reset"  class="ui-state-default ui-corner-all" >Reset</button></td>
		</tr>
		<tr style="font-family:Verdana;font-size: small;">
			<td><a href="NavigationServlet?page=forgotpassword">Forgot Password?</a>&nbsp;&nbsp;</td>
			<td>&nbsp;&nbsp;<a href="NavigationServlet?page=unregistereduser">New User? Please register!</a></td>
		</tr>
		<tr><td colspan="2"><hr /></td></tr>
		<tr style="font-family:Verdana;font-size: small;">
		    <td colspan=2><a href="adminlogin.jsp"/>Administrator</a></td>  
		</tr>
		<tr>
			<td><% if(request.getParameter("loginfailed")!=null){ %>
				Login Failed!!
				<% }else if(request.getParameter("forgot")!=null){ %>
				Forgot password reset was successful!!
				<% } %>
		</td>
		</tr>
	</table>
</center>
<input type="hidden" name="page" value="post_login" />
</form>

</body>
</html>