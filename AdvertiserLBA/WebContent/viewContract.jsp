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

<script type="text/javascript" src="javascripts/jquery-1.4.2.js"></script>
<script type="text/javascript" src="javascripts/jquery.tablePagination.0.2.js"></script>
<style type="text/css">
		   #testTable { 
            width : 200px;
            margin-left: auto; 
            margin-right: auto; 
          }
          
          #tablePagination { 
            background-color: #DCDCDC; 
            font-size: 0.8em; 
            padding: 0px 5px; 
            height: 20px;
            width: 300px;
            border: 1px;
          }
          
          #tablePagination_paginater { 
            margin-left: auto; 
            margin-right: auto;
          }
          
          #tablePagination img { 
            padding: 0px 2px; 
          }
          
          #tablePagination_perPage { 
            float: left; 
          }
          
          #tablePagination_paginater { 
            float: right; 
          }

	
</style>
</head>
<body>
<%@ include file="/navigationbar.jsp" %>
<form method="post" name="editUserForm" action="ContractCreateServlet" >
<center>

	<% if(cModel.getContractCount() == 0){ %>
		<h1 id="login_font">Sorry ! You do not have any contract at this time.</h1>
	<% } else {
		
	%>
	<table id="menuTable">
		<thead>
			<tr align="center">
				<td colspan="6"><h3 id="login_font">View Contract Details</h3></td>
			</tr>
			<tr>
			<td id="viewall_column_heading" width="130"><b>Contract ID</b></td>
			<td id="viewall_column_heading" width="200"><b>Contract Name</b></td>
			<td id="viewall_column_heading" width="80"><b>Space</b></td>
			<td id="viewall_column_heading" width="200"><b>Start Date</b></td>
			<td id="viewall_column_heading" width="200"><b>End Date</b></td>
			<td id="viewall_column_heading" width="80"><b>Action</b></td>
			</tr>
		</thead>
		<tbody>
			<% 	for(int i=0; i<cModel.getContractCount(); i++){%> 
	 	 	<tr>
				<td id="viewall_column" width="100"><font style="color: #000000"><%= viewBean[i].getContractID() %></font></td>
				<td id="viewall_column" width="200"><label id="contractname"><%= viewBean[i].getContractname() %></label></td>
				<td id="viewall_column" width="80"><label id="contractspace"><%= viewBean[i].getSpace() %></label></td>
				<td id="viewall_column" width="80"><label id="contractstart"><%= viewBean[i].getStartdate() %></label></td>
				<td id="viewall_column" width="80"><label id="contractend"><%= viewBean[i].getEnddate() %></label></td>
				<td id="viewall_column" width="80"><label id="contractid"><a href="pdfprint.jsp?contractid=<%= viewBean[i].getContractID()%>&contractname=<%= viewBean[i].getContractname()%>"><font style="color: #000000; font-weight: bold">Print Contract</font></a></label></td>
			<% } %>
			</tr> 
		</tbody>	
		</table>
		<br />
	<% } %>
	
</center>
</form>

<script type="text/javascript">
	$('tbody tr:odd', $('#menuTable')).hide(); //hiding rows for test
            var options = {
              currPage : 1, 
              ignoreRows : $('tbody tr:odd', $('#menuTable2')),
              optionsForRows : [2,3,5],
              rowsPerPage : 5,
              firstArrow : (new Image()).src="images/firstBlue.gif",
              prevArrow : (new Image()).src="images/prevBlue.gif",
              lastArrow : (new Image()).src="images/lastBlue.gif",
              nextArrow : (new Image()).src="images/nextBlue.gif"
            }
	
	 $('table#menuTable').tablePagination(options);
</script>
<%@ include file="./footer.jsp" %>
</body>
</html>