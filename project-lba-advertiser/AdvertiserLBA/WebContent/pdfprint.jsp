<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="application/pdf; charset=ISO-8859-1">
<title>Print Contract</title>
</head>
<body>
<%@ include file="/navigationbar.jsp" %>
<% 
   String filename = request.getParameter("contractid")+""+request.getParameter("contractname");
%>
<img src="/images/adSpotWeb.gif"></img>
<center><b>Click on the link below</b></center>
<center> <a href="/AdvertiserLBA/files/<%=filename%>.pdf" style="color: #000000">Print Contract</a></center>
<%@ include file="./footer.jsp" %>
</body>
</html>