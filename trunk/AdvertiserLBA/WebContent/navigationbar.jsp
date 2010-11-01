<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>

<%@ page import="com.LBA.Advertiser.bean.GlobalBean" %>
<%
	GlobalBean objGlobal = new GlobalBean();
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.LBA.Advertiser.bean.AdvertiserBean"%><html>
<head>
	<link rel="stylesheet" href="css/animated-menu.css" type="text/css" media="screen" />
	
	<script src="development-bundle/jquery-1.4.2.js" type="text/javascript"></script> 
    <!-- <script src="javascripts/animated-menu.js" type="text/javascript"></script> -->
    <script src="javascripts/jquery.easing.1.3.js" type="text/javascript"></script>
    <script type="text/javascript">
	   // $(document).ready(function(){
	    	var $anim = jQuery.noConflict();
	    	 $anim(function(){
		    	
	    	    //When mouse rolls over for PROFILE
	    	    $anim("li.menuProfile").mouseover(function(){
	    	        $anim(this).stop().animate({height:'70px'},{queue:false, duration:600, easing: 'easeOutBounce'})
	    	    });
	
	    	    //When mouse is removed for PROFILE 
	    	    $anim("li.menuProfile").mouseout(function(){
	    	        $anim(this).stop().animate({height:'30px'},{queue:false, duration:600, easing: 'easeOutBounce'})
	    	    });
	
	    	    //When mouse rolls over for CONTRACT
	    	    $anim("li.menuContract").mouseover(function(){
	    	        $anim(this).stop().animate({height:'150px'},{queue:false, duration:600, easing: 'easeOutBounce'})
	    	    });
	
	    	    //When mouse is removed for CONTRACT
	    	    $anim("li.menuContract").mouseout(function(){
	    	        $anim(this).stop().animate({height:'30px'},{queue:false, duration:600, easing: 'easeOutBounce'})
	    	    });
	
	    	    //When mouse rolls over for Ad
	    	    $anim("li.menuAd").mouseover(function(){
	    	        $anim(this).stop().animate({height:'200px'},{queue:false, duration:600, easing: 'easeOutBounce'})
	    	    });
	
	    	    //When mouse is removed for Ad
	    	    $anim("li.menuAd").mouseout(function(){
	    	        $anim(this).stop().animate({height:'30px'},{queue:false, duration:600, easing: 'easeOutBounce'})
	    	    });
	    	    
	    	    //When mouse rolls over for Product
	    	    $anim("li.menuProduct").mouseover(function(){
	    	        $anim(this).stop().animate({height:'120px'},{queue:false, duration:600, easing: 'easeOutBounce'})
	    	    });
	
	    	    //When mouse is removed for Product
	    	    $anim("li.menuProduct").mouseout(function(){
	    	        $anim(this).stop().animate({height:'30px'},{queue:false, duration:600, easing: 'easeOutBounce'})
	    	    });
	    	 
	    	});
    </script>  
</head>
<body class="navigation-body">
	<table>
		<tr>
			<td width="20%"><img src="images/adSpotWeb.gif" /></td>
			<td width="100%" align="center"><img src="images/banner.jpg" /></td>
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
	            <p class="subtext"><a href="NavigationServlet?page=viewcontract">Contract Catalogue</a></p>
	            <p class="subtext"><a href="NavigationServlet?page=viewcontract">Print Contract</a></p>
	        </li>
	        <li class="menuAd" id="menuAd">
	            <p class="navigation-div">Ad Manager</p>
	            <p class="subtext"><a href="NavigationServlet?page=createad">Create Advertisement</a></p>
	            <p class="subtext"><a href="NavigationServlet?page=viewcatalog">Advertisement Catalogue</a></p>
	            <p class="subtext"><a href="NavigationServlet?page=admerchant">Set Merchant Location</a></p>
	            <p class="subtext">View Advertisements</p>
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
	<br />
	<div style="background-color: #333333; margin : 0px 90px 30px 40px;">
		<h5 style="color: #CCCCCC">You are logged in as, <%= GlobalBean.getFirstname() +" "+ GlobalBean.getLastname()+". " %>Your company is, <%= GlobalBean.getCompanyname() %></h5>
	</div>
</body>
</html>