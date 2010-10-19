<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.model.ChannelModel" %>
<%@ page import="com.LBA.Advertiser.bean.ChannelBean" %>
<%
	
	ChannelModel cModel = (ChannelModel) request.getAttribute("registrationDone");
	ChannelBean viewBean1 = cModel.viewcurrentChannelDetails();
     
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	
<form method="post" name="editUserForm" action="ContractCreateServlet" >
<table>
	<tr>
		<td colspan=2>View Channel details:</td>
	</tr>
	<tr>
		<td align="left">Channel Id:</td>
		<td><input type="text" name="channelid" id="channelid" value="<%= viewBean1.getChannelid() %>" /></td>
	</tr>
	<tr>
		<td align="left">Channel Name:</td>
		<td><input type="text" name="channelname" id="channelname" value="<%= viewBean1.getChannelname() %>"/></td>
	</tr>
	<tr>
		<td align="left">Channel Description:</td>
		<td><input type="text" name="channeldescription" id="channeldescription" value="<%= viewBean1.getChanneldescription() %>"/></td>
	</tr>
	</table>
		<center><a href="createchannel.jsp"/>Back to Channel Page</a></center>
	


</form>
</body>
</html>