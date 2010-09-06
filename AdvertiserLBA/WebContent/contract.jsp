<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border=1 cellspacing=1 cellpadding=1 width=100%>
	<tr align=center><td colspan=5><h1>Welcome <%= session.getAttribute("user_session") %></h1></td></tr>
	<tr>
		<td><a href="UserRegistrationServlet?page=edituser">Edit Details</a></td>
		<td><a href="UserRegistrationServlet?page=createcontract">Create Contract</a></td>
		<td>Create Advertisement</td>
		<td>Create Product</td>
		<td><a href="UserRegistrationServlet?page=logout">Logout</a></td>
	</tr>
	
</table>
<form name="contractForm" method="post" action="ContractCreateServlet">
	<center>
		<table border=1 cellspacing=0 cellpadding=0>
				<tr>
				<td colspan=2><center><h2>Contract Form </h2></center></td>
				</tr>
				
				<tr>
					<td align="left">Contract ID:</td>
					<td><input type="text" name="contractID" id="contractID" /></td>
				</tr>
				<tr>
					<td align="left">Contract Name:</td>
					<td><input type="text" name="contractname" id="contractname" /></td>
				</tr>
				
				<tr>
					<td align="left">Description:</td>
					<td><input type="text" name="description" id="description" /></td>
				</tr>
				<tr>
					<td align="left">Space:</td>
					<td><input type="text" name="space" id="space" /></td>
				</tr>
				
				<tr>
					<td align="left">Startdate:</td>
					<td><input type="text" name="startdate" id="startdate"/></td>
				</tr>
				<tr>
					<td align="left">Enddate:</td>
					<td><input type="text" name="enddate" id="enddate" /></td>
				</tr>
				<tr>  
					<td><input type="submit" value="Register" /></td> 
					<td><input type="reset" value="Clear" /></td>
					
				</tr>
		
		</table>
	</center>
</form>
</body>
</html>