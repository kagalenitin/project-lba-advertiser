<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.LBA.Advertiser.model.ContractModel" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border=1 cellspacing=1 cellpadding=1 width=100%>
	<tr align=center><td colspan=5><h1>Welcome <%=session.getAttribute("user_session")%></h1></td></tr>
	<tr>
		<td><a href="UserRegistrationServlet?page=edituser">Edit Details</a></td>
		<td><a href="ContractCreateServlet?page=createcontract">Create Contract</a></td>
		<td><a href="ContractCreateServlet?page=viewcontract">View Contract</a></td>
		<td>Create Advertisement</td>
		<td>Create Product</td>
		<td><a href="UserRegistrationServlet?page=logout">Logout</a></td>
	</tr>
	
</table>
<form name="contractForm" method="post" action="ContractCreateServlet">
<% if(request.getAttribute("registrationDone") !=null){ %>
							<p> Contract Created Successfully.</p>
		<% } %>
		
	<center>
		<table border=1 cellspacing=0 cellpadding=0>
				<tr>
				<td colspan=2><center><h2>Contract Form </h2></center></td>
				</tr>
				
				
				<tr>
					<td align="left">Space:</td>
					<td><select name="space" id="space">
					<option value="Please Select" selected>Please Select</option>
					<option value=50MB>50MB</option>
					<option value=100MB>100MB</option>
					<option value=200MB>200MB</option>
					<option value=400MB>400MB</option>
					</select>
				</tr>
				
				<tr>
					<td align="left">Startdate:</td>
					<td><input type="text" name="startdate" id="startdate"/></td>
				</tr>
				<tr>
				<td align="left">Duration:</td>
				<td><select name="duration" id="duration">
					<option value="Please Select" selected>Please Select</option>
					<option value="3 Months">3 Months</option>
					<option value="6 Months">6 Months</option>
					<option value="9 Months">9 Months</option>
					<option value="12 Months">12 Months</option>
					</select>
					</td>
				</tr>
				<tr>  
					<td><input type="submit" value="Register" /></td> 
					<td><input type="reset" value="Clear" /></td>
					
				</tr>
	
</table>
	</center>
	<input type="hidden" name="page" value="post_contract" />
</form>
</body>
</html>