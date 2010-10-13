<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	    	<li class="menuProfile" id="menuProfile">
	            <p class="navigation-div">Account</p>
	            <p class="subtext"><a href="NavigationServlet?page=edituser">Edit Profile</a></p>
	        </li>
	        <li class="menuContract" id="menuContract">
	            <p class="navigation-div">Contract Manager</p>
	            <p class="subtext"><a href="NavigationServlet?page=contract">Create Contract</a></p>
	            <p class="subtext"><a href="NavigationServlet?page=viewcontract">View All Contract</a></p>
	            <p class="subtext"><a href="NavigationServlet?page=viewcontract">Print Contract</a></p>
	        </li>
	        <li class="menuAd" id="menuAd">
	            <p class="navigation-div">Ad Manager</p>
	            <p class="subtext"><a href="NavigationServlet?page=createad">Create Advertisement</a></p>
	            <p class="subtext">View Advertisement</p>
	            <p class="subtext">Edit Advertisement</p>
	            <p class="subtext">Remove Advertisement</p>
	        </li>
	        <li class="menuProduct" id="menuProduct">
	            <p class="navigation-div">Product Manager</p>
	            <p class="subtext"><a href="NavigationServlet?page=createproduct">Create Product</a></p>
	            <p class="subtext"><a href="NavigationServlet?page=viewproducts">View All Products</a></p>
	        </li>
	        <li class="menuLogout">
	        	<p class="navigation-div"><a href="NavigationServlet?page=logout">Sign out</a></p>
	        </li>
	          <li class="submain"></li>
	    </ul>
	    
	</div>
	<table>
		<tr>
			<td width="40%" valign="bottom"><h5>You are logged in as, <%= session.getAttribute("user_session") %></h5></td>
		</tr>
	</table>	
	
</body>
</html>