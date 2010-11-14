<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Location Set</title>
</head>
<body>
<%@ include file="./navigationbar.jsp" %>
<table cellpadding="3">
		<tr>
	  		<td colspan=2>
	  				<% if(request.getAttribute("success")!=null){ %>
	  					<p>Ad is set for current location.</p>
	  				<%}else if(request.getAttribute("unsuccess")!=null) { %>
						<p><%= request.getAttribute("unsuccess") %></p>
					<%}%>
	  		</td>
	  	</tr>
</table>

</body>
</html>