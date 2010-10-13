<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.LBA.Advertiser.model.ContractModel" %>
<html>
<head>
      <link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css" type="text/css" media="screen" />  
	<link rel="stylesheet" href="css/generalpurpose.css" type="text/css" media="screen" /> 
	<script type="text/javascript" src="development-bundle/jquery-1.4.2.js"> </script> 
	 <script type="text/javascript" src="development-bundle/ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="development-bundle/ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="development-bundle/ui/jquery.ui.datepicker.js"></script>
	 
	<script type="text/javascript">
		jQuery.noConflict(true);
		$(function() {
			$('#contractdate').datepicker();
		});

		$(function() {
			$('#startdate').datepicker();
		});
	</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Contract</title>
<style type="text/css">
span{
	font-size: small;
	color: #003366;
} 
</style>
</head>
<body>

<%@ include file="./navigationbar.jsp" %>
<form name="contractForm" method="post" action="ContractCreateServlet">
<% if(request.getAttribute("registrationDone") !=null){ %>
							<p> Contract Created Successfully.</p>
		<% getServletContext().getRequestDispatcher("/viewcurrentcontract.jsp").forward(request, response); } %>
	<center>
		<div>
			<img src="images/contract_logo.jpg" height="125" width="125" /><h3 id="login_font">Create Contract</h3>
		</div>
		<table>
				<tr>
					<td id="contract_column">Contract Name </td>
					<td><input type="text" name="contractname" id="contractname"/> 
					</td>
					<td><span id="contractname" style="display:none">Give contract name</span>
					<script type="text/javascript">
							$("#contractname").focus(function(){
									$("span#contractname").css('display', 'inline').fadeOut(1500);
							});
					</script>
					</td>
				</tr>
				<tr>
					<td id="contract_column">Contract Created by </td>
					<td><input type="text" name="contractcreatedby" id="contractcreateby"/></td>
					<td><span style="display:none" id="ccreatedby">Contract creator's name</span>
					<script type="text/javascript">
							$("#contractcreatedby").focus(function(){
								alert('h1');
								$("span#ccreatedby").css('display', 'inline').fadeOut(1500);
							});
					</script>
					</td>
				</tr>
				<tr>
					<td id="contract_column">Contract date(MM/DD/YYYY) </td>
					<td><input type="text" name=contractdate id="contractdate"/>
					
					</td>
					<td><span style="display:none" id="contractdate">Created Date</span>
					<script type="text/javascript">
							$("#contractdate").focus(function(){
									$("span#contractdate").css('display', 'inline').fadeOut(1500);
							});
					</script>
					</td>
				</tr>
				<tr>
					<td id="contract_column">Space </td>
					<td><select name="space" id="space">
					<option value=50MB>50MB</option>
					<option value=100MB>100MB</option>
					<option value=200MB>200MB</option>
					<option value=400MB>400MB</option>
					<option value=500MB>500MB</option>
					<option value=750MB>750MB</option>
					</select>
					
					</td>
					<td><span style="display:none" id="space">Select space</span>
					<script type="text/javascript">
							$("#space").focus(function(){
									$("span#space").css('display', 'inline').fadeOut(1500);
							});
					</script>
					</td>
				</tr>
				
				<tr>
					<td id="contract_column">Startdate(MM/DD/YYYY) </td>
					<td><input type="text" name="startdate" id="startdate"/>
					
					</td>
					<td><span style="display:none" id="startdate">Contract Start Date</span>
					<script type="text/javascript">
							$("#startdate").focus(function(){
									$("span#startdate").css('display', 'inline').fadeOut(1500);
							});
						</script>
					</td>
				</tr>
				<tr>
				<td id="contract_column">Duration </td>
				<td><select name="duration" id="duration">
					<option value="3">3 Months</option>
					<option value="6">6 Months</option>
					<option value="9">9 Months</option>
					<option value="12">12 Months</option>
					</select>
					
					</td>
					<td><span style="display:none" id="duration">Select Contract Duration</span>
					<script type="text/javascript">
							$("#duration").focus(function(){
									$("span#duration").css('display', 'inline').fadeOut(1500);
							});
						</script>
					</td>
				</tr>
				<tr>
				<td id="contract_column">Payment Type </td>
				<td><select name="paymenttype" id="paymenttype">
					<option value="By Click">By Click</option>
					<option value="By Search">By Search</option>
					</select>
					
					</td>
					<td><span style="display:none" id="paymenttype">Select Payment type</span>
					<script type="text/javascript">
							$("#paymenttype").focus(function(){
									$("span#paymenttype").css('display', 'inline').fadeOut(1500);
							});
						</script>
					</td>
				</tr>
				<tr>  
					<td align="right"><button id="register" type="submit"  class="ui-state-default ui-corner-all">Create Contract</button></td>
					<td><button id="clear" type="reset"  class="ui-state-default ui-corner-all" >Reset</button></td>
				</tr>
	
</table>
	</center>
	<input type="hidden" name="page" value="post_contract" />
</form>
</body>
</html>