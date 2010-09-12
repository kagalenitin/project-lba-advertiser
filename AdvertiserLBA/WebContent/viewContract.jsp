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
</head>
<body>
<%@ include file="/navigationbar.jsp" %>
<form method="post" name="editUserForm" action="ContractCreateServlet" >
<br /> <br />
	<% if(cModel.getContractCount() == 0){ %>
		<h1>Sorry ! You do not have any contract at this time.</h1>
	<% } else {%>
			
		<table cellspacing="1" cellpadding="1" align="center" border="1">
			<tr>
				<td colspan=5>View Contract details:</td>
			</tr>
			<tr>
			<td><b>Contract ID</b></td>
			<td><b>Space</b></td>
			<td><b>Start Date</b></td>
			<td><b>End Date</b></td>
			<td><b>Status</b></td>
			</tr>
		<% 	for(int i=0; i<cModel.getContractCount(); i++){%> 
 	 	<tr>
 			<td><a href="ContractCreateServlet?page=editid&contractid=<%= viewBean[i].getContractID() %>"><%= viewBean[i].getContractID() %></a></td>
			<td><label id="contractspace"><%= viewBean[i].getSpace() %></label></td>
			<td><label id="contractstart"><%= viewBean[i].getStartdate() %></label></td>
			<td><label id="contractend"><%= viewBean[i].getEnddate() %></label></td>
			<td><label id="contractstatus"><%= viewBean[i].getStatus() %></label></td>
				
		<% } %>
		</tr> 	
		</table>
						
	
	<% } %>

</form>
</body>
</html>