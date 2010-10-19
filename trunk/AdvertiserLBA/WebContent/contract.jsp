<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.LBA.Advertiser.model.ContractModel" %>
<%@page import="com.LBA.Advertiser.bean.GlobalBean" %>
<html>
<head>
      <link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css" type="text/css" media="screen" />  
	<link rel="stylesheet" href="css/generalpurpose.css" type="text/css" media="screen" /> 
	<script type="text/javascript" src="development-bundle/jquery-1.4.2.js"> </script> 
 	<script type="text/javascript" src="development-bundle/ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="development-bundle/ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="development-bundle/ui/jquery.ui.datepicker.js"></script>
	<script type="text/javascript">
		//$(document).ready(function() {
			var $j = jQuery.noConflict();
			$j(function(){
				$j('#contractdate').datepicker({
					dateFormat: "yy-mm-dd"
				});
			
				$j("#startdate").datepicker({
					dateFormat: "yy-mm-dd"
				});
				
			});

	</script>
	 
	<script type="text/javascript" src="javascripts/jquery.js"></script>
	<script type="text/javascript" src="javascripts/jquery.validate.js"></script> 	
	<script type="text/javascript">
	 	var $vld = jQuery.noConflict();
		$vld(function() {
				//alert('h1');
				$vld.validator.addMethod("space", function(value, element) {
	              return this.optional(element) || (value.indexOf("selectspace") == -1);
	         	}, "Please select a space");
				$vld.validator.addMethod("duration", function(value, element) {
		              return this.optional(element) || (value.indexOf("selectduration") == -1);
		         	}, "Please select duration of contract");
			$vld('#contractForm').validate({
				//set the rules for the field names
					rules: {
						contractname: {
							required: true,
							minlength: 2
						},
						contractcreatedby:{
							required: true,
							minlength: 2
						},
						space: {
							space: true
						},
						duration:{
							duration: true
						}
						
					},
					messages: {
						contractname: "Please enter contract name",
						contractcreatedby: "Please enter contract creator's name"
					}
			});
		});
	</script>
					
	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Contract</title>
<style type="text/css">
span{
	font-size: small;
	color: #003366;
}
.error {
		color: blue;
		font: 8pt verdana;
		padding-left: 0px
	} 
</style>

</head>
<body style="margin: 50px 140px 10px 180px;" alink="#FFFFFF" vlink="#FFFFFF">
<%@ include file="./navigationbar.jsp" %>
<form name="contractForm" method="post" action="ContractCreateServlet" id="contractForm">
<table align="center">
	<tr>
		<td align="center">
		<% if(request.getAttribute("registrationDone") !=null){ %>
				<p> Contract Created Successfully.</p>
		<% }else if(request.getParameter("contractCreate")!=null){ %>
				<p> Contract not created.</p>
		<%} %>
		<table align="center">
				<tr>
					<td colspan="2" align="center"><h3 id="login_font">Create Contract</h3></td>
				</tr>
				<tr>
					<td id="contract_column">Contract Name </td>
					<td><input type="text" name="contractname" id="contractname"/> 
					</td>
					
				</tr>
				<tr>
					<td id="contract_column">Contract Created by </td>
					<td><input type="text" name="contractcreatedby" id="contractcreatedby"/></td>
				
				</tr>
				<tr>
					<td id="contract_column">Contract date(YYYY/MM/DD) </td>
					<td><input type="text" name=contractdate id="contractdate"/>
					
					</td>
				
				</tr>
				<tr>
					<td id="contract_column">Space </td>
					<td><select name="space" id="space">
					<option value="selectspace">Select Space</option>
					<option value=50MB>50MB</option>
					<option value=100MB>100MB</option>
					<option value=200MB>200MB</option>
					<option value=400MB>400MB</option>
					<option value=500MB>500MB</option>
					<option value=750MB>750MB</option>
					</select>
					
					</td>
				</tr>
				
				<tr>
					<td id="contract_column">Startdate(YYYY/MM/DD/) </td>
					<td><input type="text" name="startdate" id="startdate"/>
					
					</td>
		
				</tr>
				<tr>
				<td id="contract_column">Duration </td>
				<td><select name="duration" id="duration">
					<option value="selectduration">Select Duration</option>
					<option value="3">3 Months</option>
					<option value="6">6 Months</option>
					<option value="9">9 Months</option>
					<option value="12">12 Months</option>
					</select>
					
					</td>
					
				</tr>
				<tr>
				<td id="contract_column">Payment Type </td>
				<td>
					<select name="paymenttype" id="paymenttype">
						<option value="selectpayment">Select Payment type</option>
						<option value="By Click">By Click</option>
						<option value="By Search">By Search</option>
					</select>
					
				</td>
					
				</tr>
				<tr>  
					<td align="right"><button id="register" type="submit"  class="ui-state-default ui-corner-all" class="submit">Create Contract</button>
					
					</td>
					<td><button id="clear" type="reset"  class="ui-state-default ui-corner-all" >Reset</button></td>
				</tr>
				
		</table>
	
	</td>
	</tr>
</table>
        <input type="hidden" name="page" value="post_contract" />
        
</form>
</body>
</html>