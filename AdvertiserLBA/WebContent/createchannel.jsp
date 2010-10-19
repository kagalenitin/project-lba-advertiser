<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/generalpurpose.css" type="text/css"/>
	<link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css" type="text/css" media="screen" />
	<script type="text/javascript" src="javascripts/jquery.js"></script>
	<script type="text/javascript" src="javascripts/jquery.validate.js"></script>
	<script type="text/javascript">
	//initiate validator on load
	 
	$(function() {
		//alert("qaz");
		// validate  form on keyup and submit
		$("#channelform").validate({
			//set the rules for the field names
			rules: {
				channelname: {
					required: true,
					minlength: 8
				},
				channeldescription: {
					required: true,
					minlength: 15
				}
			},
			//set messages to appear inline
			messages: {
				channelname: "Please enter your channel name",
				channeldescription: "Please enter your channel description."
			}
		});
	});
</script>
<style type="text/css">
	.error {
		color: blue;
		font: 8pt verdana;
		padding-left: 0px
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Channel Form</title>
</head>
<body>
<%@ include file="./adminnavigationbar.jsp" %>
<br /><br /><br />
<form name="channelform" id="channelform" method="post" action="ChannelCreateServlet">
<center>
				<% if(request.getAttribute("createchannel")!=null){ %>
						<h3 id="login_font">Channel created successfully.</h3>
				<% } %>	
   				<h3 id="login_font">Create Channel</h3>
   
     <table>
				<tr>
					<td id="edit_product">Channel Name </td>
					<td><input type="text" name="channelname" id="channelname"/></td>
				</tr>
				<tr>
					<td id="edit_product">Channel Description </td>
					<td><input type="text" name="channeldescription" id="channeldescription"/></td>
				</tr>
				<tr>  
					<td align="right"><button id="register" type="submit"  class="ui-state-default ui-corner-all" class="submit">Create Channel</button></td>
					<td><button id="clear" type="reset"  class="ui-state-default ui-corner-all" >Reset</button></td>
				</tr>
	</table>
	</center>
	<input type="hidden" name="page" value="create_channel" />
	</form>
</body>
</html>