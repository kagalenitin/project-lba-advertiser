<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.model.ContractModel" %>
<%@ page import="com.LBA.Advertiser.bean.ContractBean" %>
<%@page import="com.LBA.Advertiser.bean.GlobalBean" %>
<%
	
	ContractModel cModel = (ContractModel) request.getAttribute("registrationDone");
	ContractBean viewBean1 = cModel.viewcurrentContractDetails();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/generalpurpose.css" type="text/css" media="screen" />
<link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css" type="text/css" media="screen" />

</head>
<body>
<%@ include file="./navigationbar.jsp" %>	
<form method="post" name="editUserForm" action="ContractCreateServlet" id="editUserForm">
<table align="center" cellpadding="3">
	<tr>
		
	</tr>
	<tr>
		<td colspan=2><h3 id="login_font">View Contract details</h3></td>
	</tr>
	<tr>
		<td id="contract_column">Contract Id:</td>
		<td><input type="text" name="contractID" id="contractID" value="<%= viewBean1.getContractID() %>" /></td>
	</tr>
	<tr>
		<td id="contract_column">Contract Name:</td>
		<td><input type="text" name="contractname" id="contractname" value="<%= viewBean1.getContractname() %>"/></td>
	</tr>
	<tr>
		<td id="contract_column">Space:</td>
		<td><input type="text" name="space" id="space" value="<%= viewBean1.getSpace() %>"/></td>
	</tr>
	<tr>
		<td id="contract_column">Contract Created By:</td>
		<td><input type="text" name="createdby" id="createdby" value="<%= viewBean1.getContractcreatedby() %>"/></td>
	</tr>
	<tr>
		<td id="contract_column">Description:</td>
		<td><textarea name="description" id="description" rows="5" cols="20">Contract is valid only for the term specified</textarea></td>
	</tr>
	<tr>
		<td id="contract_column">StartDate:</td>
		<td><input type="text" name="startdate" id="startdate" value="<%= viewBean1.getStartdate() %>"/></td>
	</tr>
	<tr>
		<td id="contract_column">EndDate:</td>
		<td><input type="text" name="enddate" id="enddate" value="<%= viewBean1.getEnddate() %>"/></td>
	</tr>
	<tr>
		<td><button id="createpdf" type="submit" class="ui-state-default ui-corner-all" class="submit">Create PDF!</button></td>
	</tr>
	</table>
		<!-- <center><a href="ContractCreateServlet?page=createpdf" style="color: #000000"/>Save PDF Format</a></center> -->
	<input type="hidden" name="page" value="postcreatepdf" />	

</form>
</body>
</html>