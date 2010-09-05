<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form name="contractForm" method="get" action="ContractCreateServlet">
	<center>
		<table border=1 cellspacing=0 cellpadding=0>
				<tr>
				<td colspan=2><center><h2>Contract Form </h2></center></td>
				</tr>
				
				<tr>
					<td align="left">Contract Name:</td>
					<td><input type="text" name="companyname" id="companyname" /></td>
				</tr>
				<tr>
					<td align="left">Advertiser Id:</td>
					<td><input type="text" name="advertiserid" id="advertiserid" /></td>
				</tr>
				<tr>
					<td align="left">Description:</td>
					<td><input type="text" name="advdescription" id="advdescription" /></td>
				</tr>
				<tr>
					<td align="left">Space:</td>
					<td><input type="text" name="space" id="space" /></td>
				</tr>
				
				<tr>
					<td align="left">Startdate:</td>
					<td><input type="text" name="startdate" id="startdate"/></td>
				</tr>
				<tr>
					<td align="left">Enddate:</td>
					<td><input type="text" name="enddate" id="enddate" /></td>
				</tr>
				    
					<td><center><input type="submit" value="Register" /> <input type="reset" value="Clear" /></center></td>
					
				</tr>
		
		</table>
	</center>
</form>
</body>
</html>