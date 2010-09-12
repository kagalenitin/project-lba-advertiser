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
<%@ include file="/navigationbar.jsp" %>

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
					<option value=50MB>50MB</option>
					<option value=100MB>100MB</option>
					<option value=200MB>200MB</option>
					<option value=400MB>400MB</option>
					<option value=500MB>400MB</option>
					<option value=750MB>400MB</option>
					</select>
				</tr>
				
				<tr>
					<td align="left">Startdate(YYYY-MM-DD):</td>
					<td><input type="text" name="startdate" id="startdate"/></td>
				</tr>
				<tr>
				<td align="left">Duration:</td>
				<td><select name="duration" id="duration">
					<option value="3 Months">3 Months</option>
					<option value="6 Months">6 Months</option>
					<option value="9 Months">9 Months</option>
					<option value="12 Months">12 Months</option>
					</select>
					</td>
				</tr>
				<tr>  
					<td><input type="submit" value="Register" onclick="confirmation()"/></td> 
					<td><input type="reset" value="Clear" /></td>
					
				</tr>
	
</table>
	</center>
	<input type="hidden" name="page" value="post_contract" />
</form>
</body>
</html>