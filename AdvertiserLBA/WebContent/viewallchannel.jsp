<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.model.ChannelModel" %>
<%@ page import="com.LBA.Advertiser.bean.ChannelBean" %>
<%
	
	ChannelModel cModel = (ChannelModel) request.getAttribute("viewchannel");
	ChannelBean[] viewBean = cModel.viewChannelDetails();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Channel Details</title>
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
<%@ include file="/adminnavigationbar.jsp" %>
<br /><br /><br />
<form method="post" name="editUserForm" action="ChannelCreateServlet" >
<center>

	<% if(cModel.getChannelCount() == 0){	%>
	
		<h1 id="login_font">Sorry ! You do not have any channels created.</h1>
	<% } else {	%>
			<h3 id="login_font">View Channel Details</h3>
		<table id="menuTable">
			<thead>
				<tr>
					<td id="viewall_column_heading" width="50"><b>Channel ID</b></td>
					<td id="viewall_column_heading" width="200"><b>Channel Name</b></td>
					<td id="viewall_column_heading" width="350"><b>Channel Description</b></td>
				</tr>
			</thead>
			<tbody>
			<% 	for(int i=0; i<cModel.getChannelCount(); i++){	%> 
		 	 	<tr>
					<td id="viewall_column" width="200"><label id="channelid"><%= viewBean[i].getChannelid() %></label></td>
					<td id="viewall_column" width="80"><label id="channelname"><%= viewBean[i].getChannelname() %></label></td>
					<td id="viewall_column" width="80"><label id="channeldescription"><%= viewBean[i].getChanneldescription() %></label></td>
					
				<% } %>
				</tr>
				
			</tbody> 
		</table>
	<% } %>
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
</center>
<%@ include file="./footer.jsp" %>
</form>
</body>
</html>