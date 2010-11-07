<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.model.RegistrationModel" %>
<%@ page import="com.LBA.Advertiser.servlet.UserRegistrationServlet" %>
<%@ page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">


<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- 
	<link rel="stylesheet" href="css/jquery.treeview.css" type="text/css" />
	<script type="text/javascript" src="javascripts/jquery.js"></script>
	
	 -->

<title>Welcome  <%= session.getAttribute("user_session") %></title>
</head>
<body>
<%@ include file="./navigationbar.jsp" %>
	
	
</body>
</html>