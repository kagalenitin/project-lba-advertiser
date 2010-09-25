<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
    <link rel="stylesheet" href="css/animated-menu.css" type="text/css" media="screen" />
    <script src="javascripts/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="javascripts/animated-menu.js" type="text/javascript"></script>
    <script src="javascripts/jquery.easing.1.3.js" type="text/javascript"></script> 
</head>
<body>
	<div>
		<h2>You are logged in as, <%= session.getAttribute("user_session") %></h2>
	</div>
	<div>
	 	<ul class="fixedbodyposition">
	    	<li class="submain"></li>
	        <li class="menuProfile" id="menuProfile">
	            <p>Account</p>
	            <p class="subtext"><a href="NavigationServlet?page=edituser">Edit Profile</a></p>
	        </li>
	        <li class="menuContract" id="menuContract">
	            <p>Contract Manager</p>
	            <p class="subtext"><a href="NavigationServlet?page=contract">Create Contract</a></p>
	            <p class="subtext"><a href="NavigationServlet?page=viewcontract">View All Contract</a></p>
	            <p class="subtext"><a href="NavigationServlet?page=viewcontract">Print Contract</a></p>
	        </li>
	        <li class="menuAd" id="menuAd">
	            <p>Ad Manager</p>
	            <p class="subtext"><a href="NavigationServlet?page=createad">Create Advertisement</a></p>
	            <p class="subtext">View Advertisement</p>
	            <p class="subtext">Edit Advertisement</p>
	            <p class="subtext">Remove Advertisement</p>
	        </li>
	        <li class="menuProduct" id="menuProduct">
	            <p>Product Manager</p>
	            <p class="subtext"><a href="NavigationServlet?page=createproduct">Create Product</a></p>
	            <p class="subtext"><a href="NavigationServlet?page=viewproducts">View All Products</a></p>
	        </li>
	        <li class="submain">
	        	<p><a href="NavigationServlet?page=logout">Sign out</a></p>
	        </li>
	          <li class="submain"></li>
	    </ul>
	      
	</div>
	
	<br /><br />
	
</body>
</html>