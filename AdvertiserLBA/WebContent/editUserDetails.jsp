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
	<link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css" type="text/css" media="screen" />  	 
	<link rel="stylesheet" href="css/generalpurpose.css" type="text/css" /> 
	<title>Edit User Details</title>
</head>
<body>
<%@ include file="/navigationbar.jsp" %>

	<% if(request.getAttribute("saveddetails")!=null){ %>
		<h3> Updated Successfully.</h3> 		
	<% }%>

<form method="post" action="UserRegistrationServlet" name="editUserForm">
	<center>
		<h3 id="login_font">Edit User Details</h3>	
		<table id="login_table">
			<tr>
				<td id="login_column">Company Name</td>
				<td><input type="text" name="companyname" id="companyname" value="<%= editBean.getCompanyName() %>" /></td>
			</tr>
			<tr>
				<td id="login_column">Username</td>
				<td><input type="text" name="username" id="username" value="<%= editBean.getUserName() %>"/></td>
			</tr>
			<tr>
				<td id="login_column">Password</td>
				<td><input type="password" name="password" id="password" value="<%= editBean.getPassword() %>"/></td>
			</tr>
			<tr>
				<td id="login_column">FirstName</td>
				<td><input type="text" name="firstname" id="firstname" value="<%= editBean.getFirstName() %>"/></td>
			</tr>
			<tr>
				<td id="login_column">LastName</td>
				<td><input type="text" name="lastname" id="lastname" value="<%= editBean.getLastName() %>"/></td>
			</tr>
			<tr>
				<td id="login_column">Address</td>
				<td><input type="text" name="address" id="address" value="<%= editBean.getAddress() %>"/></td>
			</tr>
			<tr>
				<td id="login_column">Phone</td>
				<td><input type="text" name="phone" id="phone" value="<%= editBean.getPhone() %>"/></td>
			</tr>
			<tr>
				<td id="login_column">EMail</td>
				<td><input type="text" name="email" id="email" value="<%= editBean.getEmail() %>" readOnly="readonly" /></td>
			</tr>
			<tr>
				<td align="right"><button id="register" type="submit"  class="ui-state-default ui-corner-all">Edit n Save</button></td>
			</tr>
			
		</table>
	</center>

<input type="hidden" name="page" value="post_editdetails" />
</form>

</body>
</html>