<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Channel Created</title>
</head>
<body>
<%@ include file="./adminnavigationbar.jsp" %>
<br /><br /><br />

			<% if(request.getAttribute("success")!=null){ %>
						<h3 id="login_font">Channel created successfully.</h3>
				<% }else if(request.getParameter("crtfail")!=null) {%>
						<h3 id="login_font">Channel was not created.</h3>
				<%} %>	
</body>
</html>