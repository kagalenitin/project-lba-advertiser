<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.LBA.Advertiser.model.RegistrationModel" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Result, LBA</title>
</head>
<body>
<%
	RegistrationModel rmObject = (RegistrationModel) request.getAttribute("registrationDone");
	if(rmObject.getUserRegistration() == true){
		%><p> You have successfully registered. Please <a href="index.jsp">Click here</a> for login.</p> 
	<% }else{
		%><p> Sorry! You were not registered. Please <a href="UserRegistrationServlet?page=newuser">Register again</a></p> 
	<%
	}
%>
</body>
</html>