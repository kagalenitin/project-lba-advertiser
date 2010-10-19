<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.model.ChannelModel" %>
<%@ page import="com.LBA.Advertiser.bean.ChannelBean" %>
<%
	
	ChannelModel cModel = (ChannelModel) request.getAttribute("viewchannel");
	ChannelBean[] viewBean = cModel.viewChannelDetails();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Channel Details</title>
<link rel="stylesheet" href="css/generalpurpose.css" type="text/css" />
</head>
<body>
<%@ include file="/adminnavigationbar.jsp" %>
<br /><br /><br />
<form method="post" name="editUserForm" action="ChannelCreateServlet" >
<center>
	<% if(cModel.getChannelCount() == 0){ %>
		<h1 id="login_font">Sorry ! You do not have any channels created.</h1>
	<% } else {%>
			<h3 id="login_font">View Channel Details</h3>
		<table>
			<tr>
				<td id="viewall_column_heading" width="50"><b>Channel ID</b></td>
				<td id="viewall_column_heading" width="200"><b>Channel Name</b></td>
				<td id="viewall_column_heading" width="350"><b>Channel Description</b></td>
			</tr>
		<% 	for(int i=0; i<cModel.getChannelCount(); i++){%> 
 	 	<tr>
			<td id="viewall_column" width="200"><label id="channelid"><%= viewBean[i].getChannelid() %></label></td>
			<td id="viewall_column" width="80"><label id="channelname"><%= viewBean[i].getChannelname() %></label></td>
			<td id="viewall_column" width="80"><label id="channeldescription"><%= viewBean[i].getChanneldescription() %></label></td>
			
		<% } %>
		</tr> 	
		</table>
	<% } %>
</center>
</form>
</body>
</html>