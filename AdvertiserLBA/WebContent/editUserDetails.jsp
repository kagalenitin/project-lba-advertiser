<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.model.RegistrationModel" %>
<%@ page import="com.LBA.Advertiser.bean.AdvertiserBean" %>
<%
	
	RegistrationModel rModel = (RegistrationModel) request.getAttribute("editadvertiser");
	AdvertiserBean editBean = rModel.editUserDetail();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit User Details</title>
</head>
<body>
<table border=1 cellspacing=1 cellpadding=1 width=100%>
	<tr align=center><td colspan=5><h1>Welcome <%= session.getAttribute("user_session") %></h1></td></tr>
	<tr>
		<td><a href="UserRegistrationServlet?page=userhome">User Home</a></td>
		<td><a href="UserRegistrationServlet?page=createcontract">Create Contract</a></td>
		<td>Create Advertisement</td>
		<td>Create Product</td>
		<td><a href="UserRegistrationServlet?page=logout">Logout</a></td>
	</tr>
</table>
<br />
	<% if(request.getAttribute("saveddetails")!=null){ %>
		<p> Updated Successfully.</p> 		
	<% }%>

<form method="post" action="UserRegistrationServlet" name="editUserForm">
<table cellspacing="1" cellpadding="1" align="center" border="1">
	<tr>
		<td colspan=2>Edit user details:</td>
	</tr>
	<tr>
		<td align="left">Company Name:</td>
		<td><input type="text" name="companyname" id="companyname" value="<%= editBean.getCompanyName() %>" /></td>
	</tr>
	<tr>
		<td align="left">Username:</td>
		<td><input type="text" name="username" id="username" value="<%= editBean.getUserName() %>"/></td>
	</tr>
	<tr>
		<td align="left">Password:</td>
		<td><input type="password" name="password" id="password" value="<%= editBean.getPassword() %>"/></td>
	</tr>
	<tr>
		<td align="left">FirstName:</td>
		<td><input type="text" name="firstname" id="firstname" value="<%= editBean.getFirstName() %>"/></td>
	</tr>
	<tr>
		<td align="left">LastName:</td>
		<td><input type="text" name="lastname" id="lastname" value="<%= editBean.getLastName() %>"/></td>
	</tr>
	<tr>
		<td align="left">Address:</td>
		<td><input type="text" name="address" id="address" value="<%= editBean.getAddress() %>"/></td>
	</tr>
	<tr>
		<td align="left">Phone:</td>
		<td><input type="text" name="phone" id="phone" value="<%= editBean.getPhone() %>"/></td>
	</tr>
	<tr>
		<td align="left">EMail:</td>
		<td><input type="text" name="email" id="email" value="<%= editBean.getEmail() %>" readOnly="readonly" /></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="Edit and Save"/></td>
		
	</tr>
	
</table>
<input type="hidden" name="page" value="post_viewdetails" />
</form>
</body>
</html>