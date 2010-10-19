<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin Home</title>
	<link rel="stylesheet" href="css/animated-menu.css" type="text/css" media="screen" />
	
	<script src="development-bundle/jquery-1.4.2.js" type="text/javascript"></script> 
    <script src="javascripts/animated-menu.js" type="text/javascript"></script>
    <script src="javascripts/jquery.easing.1.3.js" type="text/javascript"></script> 
</head>
<body class="navigation-body">
	<table>
		<tr>
			<td width="20%"><img src="images/adSpotWeb.gif" /></td>
			<td width="60%"></td>
		</tr>
	</table>
	<div>
	 	<ul class="fixedbodyposition">
	 		<li class="submain"></li>
	 		<li class="submain"></li>
	 		<li class="menuProduct" id="menuProduct">
	            <p class="navigation-div">Channel Manager</p>
	            <p class="subtext"><a href="NavigationServlet?page=createchannel">Create Channel</a></p>
	            <p class="subtext"><a href="NavigationServlet?page=viewchannel">View All Channels</a></p>
	        </li>
	        <li class="menuProfile" id="menuProfile">
	        	<p class="navigation-div">Product Manager</p>
	        	<p class="subtext"><a href="NavigationServlet?page=admin_product">View all Products</a></p>
	        </li>
	        <li class="menuLogout">
	        	<p class="navigation-div"><a href="NavigationServlet?page=logout">Sign out</a></p>
	        </li>
	        <li class="submain"></li>
	        <li class="submain"></li>
		</ul>
	</div>
</body>
</html>