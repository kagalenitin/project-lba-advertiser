<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.model.AdvertisementModel, java.util.*" %>

<%
	AdvertisementModel objAdModel = (AdvertisementModel) request.getAttribute("loadproduct");	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.LBA.Advertiser.model.AdvertisementModel"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
	function print(){

		// I need to handle the case where there are textboxes and comboboxes. 
		var flag= false;
		
		//This only tests for SELECT combo box values. 
		if((document.createadvertisement.contractname.options[document.createadvertisement.contractname.selectedIndex].value =="Select Contract")|| (document.createadvertisement.productname.options[document.createadvertisement.productname.selectedIndex].value =="Select Product") || (document.createadvertisement.channelname.options[document.createadvertisement.channelname.selectedIndex].value =="Select Channel")|| (document.createadvertisement.productname.value =="No Product") || (document.createadvertisement.productname.value =="No Contract")|| (document.createadvertisement.productname.value =="No Product")){
			alert('Some elements are not filled.');
			flag=true;
			
		}else{
			
		}

		if(flag == true){
			return false;
		}else{
			document.createadvertisement.submit();
		}
	}
</script>

<title>Create New Advertisement</title>
</head>
<body>
<%@ include file="/navigationbar.jsp" %>
<center>
	<br /> <br />
	
	<form method="post" action="AdvertisementServlet" enctype="multipart/form-data" name="createadvertisement">
		<table border=1 cellspacing=1 cellpadding=1>
			<tr>
				<td align="right">Load Advertisement:</td>
				<td><input type="file" name="adfile" id="adfile"/></td>
			</tr>
			<tr>
				<td align="right">Advertisement Name:</td>
				<td><input type="text" name="adname" id="adname" /></td>
			</tr>
			<tr>
				<td align="right">Advertisement Description:</td>
				<td><input type="text" name="addesc" id="addesc" /></td>
			</tr>
			<tr>
				<td align="right">Product Name:</td>
				<td>
				<% Hashtable<Integer, String> hashProduct = objAdModel.onLoadAddProduct(); %>
				<% int productCount = objAdModel.getProductCount();	%>
				<% if(productCount==0){ %>
					<input type="text" name="productname" value="No Product" readonly="readonly" id="productname" />
				<%} else{ %>
					<select name="productname">
					<option value="Select Product">Select Product</option>
					<% Enumeration<Integer> enumKey = hashProduct.keys();
						Integer[] key = new Integer[productCount];
						int count=0;
						while(enumKey.hasMoreElements()){
							key[count] = enumKey.nextElement();
							count++;
						}
					%>
					<% for(int i=0; i<count; i++){ %>
						<option value="<%= key[i] %>"><%= hashProduct.get(key[i]) %></option>
					<%} %>
					
				<%}%>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right">Contract Name:</td>
				<td>
				<% Hashtable<Integer, String> arrContract = objAdModel.loadContractName(); %>
				<% int contractCount = objAdModel.getContractCount(); %>
				<% if(contractCount==0){ %>
					<input type="text" name="contractname" value="No Contract" readonly="readonly" id="contractname" />
				<%} else{ %>
					<select name="contractname">
					<option value="Select Contract">Select Contract Name</option>
					<% Enumeration<Integer> enumKey = arrContract.keys();
						Integer[] key = new Integer[contractCount];
						int count=0;
						while(enumKey.hasMoreElements()){
							key[count] = enumKey.nextElement();
							count++;
						}
					%>
					<% for(int i=0; i<count; i++) {%>
						<option value="<%= key[i] %>"><%= arrContract.get(key[i]) %></option>
					<%} %>
				<%} %>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right">Ad Start Date:</td>
				<td><input type="text" name="adstartdate" id="adstartdate" /></td>
			</tr>
			<tr>
				<td align="right">Ad End Date:</td>
				<td><input type="text" name="adenddate" id="adenddate" /></td>
			</tr>
			<tr>
				<td align="right">Channel Name:</td>
				<td>
				<% Hashtable<Integer, String> hashChannel = objAdModel.loadChannelName(); %>
				<% int channelCount = objAdModel.getChannelCount(); %>
				<% if(channelCount==0){ %>
					<input type="text" name="channelname" id="channelname" value="No Channel" readonly="readonly" />
				<%} else{ %>
					<select name="channelname">
					<option value="selectchannel">Select Channel</option>
					<% Enumeration<Integer> enumKey = hashChannel.keys();
						Integer[] key = new Integer[channelCount];
						int count=0;
						while(enumKey.hasMoreElements()){
							key[count] = enumKey.nextElement();
							count++;
						}
					%>
					<% for(int i=0; i<count; i++) {%>
						<option value="<%= key[i] %>"><%= hashChannel.get(key[i]) %></option>
					<%} %>
					</select>
				<%} %>
				</td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="Submit" /></td>
				<td><input type="reset" value="Clear" /></td>
			</tr>
		</table>
			
	</form>
</center>	
</body>
</html>