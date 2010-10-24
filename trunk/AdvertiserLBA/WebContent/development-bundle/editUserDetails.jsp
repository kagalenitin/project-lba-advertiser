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
	<!-- CSS Script reference -->
	<link rel="stylesheet" href="css/generalpurpose.css" type="text/css" />
	<link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css" type="text/css" media="screen" />  	 
	
	<!-- Javascript/jquery reference -->
	<script type="text/javascript" src="javascripts/jquery.js"></script>
	<script type="text/javascript" src="javascripts/jquery.validate.js"></script>
	<script type="text/javascript">
	//initiate validator on load
		var $eud = jQuery.noConflict(); 
		$eud(function() {
			
				$eud.validator.addMethod("phone", function(phone_number, element) {
			    	phone_number = phone_number.replace(/\s+/g, ""); 
					return this.optional(element) || phone_number.length > 9 &&
					phone_number.match(/^(1-?)?(\([2-9]\d{2}\)|[2-9]\d{2})-?[2-9]\d{2}-?\d{4}$/);
				}, "Please specify a valid phone number");
				$eud("#editUserForm").validate({
					rules:{
						companyname: {
							required: true,
							minlength: 2
						},
						password: {
							required: true,
							minlength: 8
						},
						firstname:{
							required: true,
							minlength: 2
						},
						lastname: {
							required: true,
							minlength: 2
						},
						address: {
							required: true,
							minlength: 2
						},
						phone: {
							required: true,
							phone: true
						},
						email: {
							required: true,
							email: true
						}	
					},
					messages: {
						companyname: "Please enter your company name",
						password: "Password should be 8 characters",
						firstname: "Please enter firstname",
						lastname: "Please enter your lastname",
						address: "Address cannot be empty.",
						email: "Please enter a valid email address",
						phone: "Please specify a 10-digit phone number"
					}
						
				//});
			});	
		});
</script>
<style type="text/css">
	.error {
		color: blue;
		font: 8pt verdana;
		padding-left: 0px
	}
</style>
<title>Edit User Profile</title>
</head>
<body>
<%@ include file="./navigationbar.jsp" %>
	<% if(request.getAttribute("saveddetails")!=null){ %>
		<h3> Updated Successfully.</h3> 		
	<% }%>

<form method="post" action="UserRegistrationServlet" name="editUserForm" id="editUserForm">
	<center>
		<h3 id="login_font">Edit User Details</h3>	
		<table cellpadding="3">
			<tr>
				<td id="registration_column"><label>Company Name </label></td>
				<td><input type="text" name="companyname" id="companyname" value="<%= editBean.getCompanyName() %>" /></td>
			</tr>
			<tr>
				<td id="registration_column"><label>Username </label></td>
				<td><input type="text" name="username" id="username" value="<%= editBean.getUserName() %>" readonly="readonly"/></td>
			</tr>
			<tr>
				<td id="registration_column"><label>Password </label></td>
				<td><input type="password" name="password" id="password" value="<%= editBean.getPassword() %>"/></td>
			</tr>
			<tr>
				<td id="registration_column"><label>FirstName </label></td>
				<td><input type="text" name="firstname" id="firstname" value="<%= editBean.getFirstName() %>"/></td>
			</tr>
			<tr>
				<td id="registration_column"><label>LastName </label></td>
				<td><input type="text" name="lastname" id="lastname" value="<%= editBean.getLastName() %>"/></td>
			</tr>
			<tr>
				<td id="registration_column"><label>Address </label></td>
				<td><input type="text" name="address" id="address" value="<%= editBean.getAddress() %>"/></td>
			</tr>
			<tr>
				<td id="registration_column"><label>Phone </label></td>
				<td><input type="text" name="phone" id="phone" value="<%= editBean.getPhone() %>"/></td>
			</tr>
			<tr>
				<td id="registration_column"><label>EMail </label></td>
				<td><input type="text" name="email" id="email" value="<%= editBean.getEmail() %>" /></td>
			</tr>
			<tr>
				<td align="right"><button id="edituser" type="submit" class="ui-state-default ui-corner-all"  class="submit" >Edit n Save</button></td>
				<!-- <td><input class="submit" type="submit" value="Submit" id="edituser" name="edituser" /></td> -->
			</tr>
			
		</table>
	</center>

<input type="hidden" name="page" value="post_editdetails" />
</form>

</body>
</html>