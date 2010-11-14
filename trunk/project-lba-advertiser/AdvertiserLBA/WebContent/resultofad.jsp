<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.LBA.Advertiser.servlet.AdvertisementServlet"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Result</title>
</head>
<body>
<%@ include file="./navigationbar.jsp" %>
<% if(request.getAttribute("adcreated")!=null){ %>
	<p>Ad was created successfully.</p>
<% }else if(request.getAttribute("witherror")!=null) { %>
	<p><%= request.getAttribute("witherror") %></p>
<%} %>

</body>
</html>