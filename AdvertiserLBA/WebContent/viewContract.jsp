<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.model.ContractModel" %>
<%@ page import="com.LBA.Advertiser.bean.ContractBean" %>
<%
	
	ContractModel cModel = (ContractModel) request.getAttribute("viewcontract");
	ContractBean viewBean = cModel.viewContractDetails();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit User Details</title>
</head>
<body>
	
<form method="post" name="editUserForm" action="ContractCreateServlet" >
<table cellspacing="1" cellpadding="1" align="center" border="1">
	<tr>
		<td colspan=2>View Contract details:</td>
	</tr>
	<tr>
		<td align="left">Contract Id:</td>
		<td><input type="text" name="contractID" id="contractID" value="<%= viewBean.getContractID() %>" /></td>
	</tr>
	
	<tr>
		<td align="left">Space:</td>
		<td><input type="text" name="space" id="space" value="<%= viewBean.getSpace() %>"/></td>
	</tr>
	<tr>
		<td align="left">StartDate:</td>
		<td><input type="text" name="startdate" id="startdate" value="<%= viewBean.getStartdate() %>"/></td>
	</tr>
	<tr>
		<td align="left">EndDate:</td>
		<td><input type="text" name="enddate" id="enddate" value="<%= viewBean.getEnddate() %>"/></td>
	</tr>
	
</table>

</form>
</body>
</html>