<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.model.ContractModel" %>
<%@ page import="com.LBA.Advertiser.bean.ContractBean" %>
<%
	
	ContractModel cModel = (ContractModel) request.getAttribute("viewcontract1");
	ContractBean[] viewBean = cModel.viewContractDetails();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Contract Details</title>
<link rel="stylesheet" href="css/generalpurpose.css" type="text/css" />
</head>
<body>
<%@ include file="/navigationbar.jsp" %>
<form method="post" name="editUserForm" action="ContractCreateServlet" >
<center>
	<% if(cModel.getContractCount() == 0){ %>
		<h1 id="login_font">Sorry ! You do not have any contract at this time.</h1>
	<% } else {%>
			
		<table cellpadding="3">
			<tr align="center">
				<td colspan=5><h3 id="login_font">View Contract Details</h3></td>
			</tr>
			<tr>
			<td id="viewall_column_heading" width="130"><b>Contract ID</b></td>
			<td id="viewall_column_heading" width="200"><b>Contract Name</b></td>
			<td id="viewall_column_heading" width="80"><b>Space</b></td>
			<td id="viewall_column_heading" width="200"><b>Start Date</b></td>
			<td id="viewall_column_heading" width="200"><b>End Date</b></td>
			<td id="viewall_column_heading" width="80"><b>Status</b></td>
			</tr>
		<% 	for(int i=0; i<cModel.getContractCount(); i++){%> 
 	 	<tr>
			<td id="viewall_column" width="100"><a href="ContractCreateServlet?page=editid&contractid=<%= viewBean[i].getContractID() %>"><font style="color: #000000"><%= viewBean[i].getContractID() %></font></a></td>
			<td id="viewall_column" width="200"><label id="contractname"><%= viewBean[i].getContractname() %></label></td>
			<td id="viewall_column" width="80"><label id="contractspace"><%= viewBean[i].getSpace() %></label></td>
			<td id="viewall_column" width="80"><label id="contractstart"><%= viewBean[i].getStartdate() %></label></td>
			<td id="viewall_column" width="80"><label id="contractend"><%= viewBean[i].getEnddate() %></label></td>
			<td id="viewall_column" width="80"><label id="contractstatus"><%= viewBean[i].getStatus() %></label></td>
				
		<% } %>
		</tr> 	
		</table>
	<% } %>
</center>
</form>
</body>
</html>