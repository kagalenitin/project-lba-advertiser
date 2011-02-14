<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/generalpurpose.css" type="text/css"/>
<link rel="stylesheet" href="css/indexLogin.css" type="text/css"/>
<link rel="SHORTCUT ICON" href="images/adSpotWeb.gif"/>
<link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css" type="text/css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Advertiser Login Page, LBA</title>

</head>
<body bgcolor="#F3F3F3">
<center>
<form id="loginform" method="post" action="UserRegistrationServlet">
<br /><br /><br /><br /><br /><br />

			<table width="80%"  bgcolor="#003366">
				<tr>
					<td align="left"><img src="images/adSpotWeb.gif" height="72" width="175" /></td>
					<td align="right">
						<table id="login_column">
							<tr>	
								<td>     </td>
								<td align="left">Username / Email</td>
								<td align="left">Password</td>
								
							</tr>
							<tr>
								<td>     </td>
								<td><input type="text" name="username" id="username" /></td>
								<td><input type="password" name="password" id="password" /></td>
								<td align="left"><button id="login" type="submit"  class="ui-state-default ui-corner-all">Login</button></td> 
								<!--  <td> <input name="login" type="submit" id="login" value="Login" style="margin-left:-10px; height:23px"  /></td> --> 
							</tr>
							
							<tr>
								<td colspan ='4' align="right">
									<% if(request.getParameter("loginfailed")!=null) {%>
										<div> Login Failed !</div>
									<%} %>
								</td>
								
							</tr>
							
							<tr>
								<td colspan="4" align="right"><a href="NavigationServlet?page=forgotpassword"><font color="white">Forgot Password?</font></a>                     |
								<a href="NavigationServlet?page=unregistereduser"><font color="white">New User? Please register!</font></a>     |
								<a href="NavigationServlet?page=adminuser"><font color="white">Admin User Login</font></a></td>
							</tr>
						
						</table>
					</td>
				</tr>
				
			</table>
			
	
<input type="hidden" name="page" value="post_login" />
</form>
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
<%@ include file="./footer.jsp" %>
</center>
</body>
</html>
