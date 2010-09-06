<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.LBA.Advertiser.model.ContractModel" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Result, LBA</title>
</head>
<body>
<%
	ContractModel cObject = (ContractModel) request.getAttribute("registrationDone");
	if(cObject.getContract() == true){
		%><p> Your contract details have been have successfully saved. To return to Home Page Please < <a href="home.jsp">Click here</a></p> 
	<% }
%>
</body>
</html>