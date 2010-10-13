<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.model.AdvertisementModel, java.util.*" %>

<%
	AdvertisementModel objAdModel = (AdvertisementModel) request.getAttribute("loadproduct");	
	String[] productName = null; int jsCount=0;
	String[] contractName = null;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.LBA.Advertiser.model.AdvertisementModel"%>
<%@page import="java.io.InputStream"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="css/generalpurpose.css" type="text/css" />
	<link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css" type="text/css" media="screen" />
	<!-- Fancy zoom for the sample images. http://www.cabel.name/2008/02/fancyzoom-10.html -->

	<script src="FancyZoom 1.1/js-global/FancyZoom.js" type="text/javascript"></script>
	<script src="FancyZoom 1.1/js-global/FancyZoomHTML.js" type="text/javascript"></script>

<!-- Now here we will be putting script files for DatePicker -->
	<script type="text/javascript">
	
	</script>




<title>Create New Advertisement</title>
</head>
<body  id="createAdvertisement" onload="setupZoom()">
<%@ include file="/navigationbar.jsp" %>
<br /> <br />	
<form method="post" action="AdvertisementServlet" enctype="multipart/form-data" name="createadvertisement">
	<center>
		<h3 id="login_font">Create Ad Details</h3>	
		<table>
			<tr>
				<td id="createad_column"><label>Load Ad</label></td>
				<td><input type="file" name="adfile" id="adfile" /></td>
			</tr>
				
			<tr>
				<td id="createad_column"><label>Sample Ad files</label></td>
				<td>
				<table>
					<tr>
						<td><a href="images/adSpotWeb.gif" title="AdSpot Logo"><img src="images/adSpotWeb.gif" height="50" width="50" /></a></td>
						<td><a href="images/adSpotWeb.gif" title="AdSpot Logo"><img src="images/adSpotWeb.gif" height="50" width="50" /></a></td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td id="createad_column"><label>Ad Name</label></td>
				<td><input type="text" name="adname" id="adname" /></td>
			</tr>
			<tr>
				<td id="createad_column"><label>Ad Description</label></td>
				<td><input type="text" name="addesc" id="addesc" /></td>
			</tr>
			<tr>
				<td id="createad_column"><label>Product Name</label></td>
				<td>
				<% Hashtable<Integer, String> hashProduct = objAdModel.onLoadAddProduct(); %>
				<% int productCount = objAdModel.getProductCount();	%>
				<% if(productCount==0){ %>
					<input type="text" name="productname" value="No Product" readonly="readonly" id="productname" />
				<%} else{ %>
					<select name="productname" id="productname">
					<option value="Select Product">Select Product</option>
					<% Enumeration<Integer> enumKey = hashProduct.keys();
						Integer[] key = new Integer[productCount];
						int count=0;
						while(enumKey.hasMoreElements()){
							key[count] = enumKey.nextElement();
							count++;jsCount++;
						}
					%>
					<% 
						productName = new String[count];
						for(int i=0; i<count; i++){ 

							//This part will separate the product name from the rest of the details.
							StringTokenizer st = new StringTokenizer(hashProduct.get(key[i]), "\t");
							productName[i] = st.nextToken();
					%>
						<option value="<%= key[i] %>"><%= productName[i] %></option>
					<%} %>
					
				<%}%> 
					</select>
						<!--  This part of the code is JavaScript handled to display the values of selected product. -->

				<script type="text/javascript">
			
						jQuery(function(){
						
							$('select#productname').change(function(){
							
								if($('#productname :selected').text() == "Select Product"){
									document.getElementById('productdesc').value = "No product description";
									document.getElementById('productprice').value = "0.00";
									
								}else{
								
								//Declare the array and copy the contents of hashProduct by splitting them
									var myProducts = new Array();
									var prods = '<%= hashProduct %>';
									var splitProducts = prods.split("\t");
									
									for(cnt =0; cnt < splitProducts.length -1; cnt++){
										//Copy the contents in the array.
										myProducts[cnt] = splitProducts[cnt];
										//alert(myProducts[cnt]);
										
									}
									myProducts[0] = myProducts[0].replace("{","");
									//alert('Value is:' + $('#productname :selected').text());
									//alert('Value is:' + $('#productname :selected').val());
									
									//Traverse through the Array of myProducts to match the selected product and its code.
									
									//And print its corresponding description and price.
									for(cntView=0; cntView<myProducts.length; cntView+=3){
										if(myProducts[cntView].match($('#productname :selected').val())){
											//alert($('#productname :selected').val());
											var desc = myProducts[cntView+1];
											var price = myProducts[cntView+2];
										}
										
										else{
											document.getElementById('productdesc').value="";
											document.getElementById('productprice').value="";
										} 
									}
									document.getElementById('productdesc').value=desc;
									document.getElementById('productprice').value=price;
									
								}
							
							});
							
						});
						
						</script>
							
				</td>
			</tr>
			<tr>
				<td id="createad_column"><label>Product Description</label></td>
				<td><textarea id="productdesc" name="productdesc" cols="30"	rows="5" readonly="readonly" style="background-color: #CCCCCC; color: #003366; font-weight: bold">No Product Description</textarea></td>
			</tr>
			<tr>
				<td id="createad_column"><label>Product Price (in $)</label></td>
				<td><input type="text" name="productprice" readonly="readonly" id="productprice" value="0.00" style="background-color: #CCCCCC; color: #003366; font-weight: bold" /></td>
			</tr>
			
			<tr>
				<td id="createad_column"><label>Contract Name</label></td>
				<td>
				<% Hashtable<Integer, String> arrContract = objAdModel.loadContractName(); %>
				<% int contractCount = objAdModel.getContractCount(); %>
				<% if(contractCount==0){ %>
					<input type="text" name="contractname" value="No Contract" readonly="readonly" id="contractname" />
				<%} else{ %>
					<select name="contractname" id="contractname">
					<option value="Select Contract">Select Contract Name</option>
					<% Enumeration<Integer> enumKey = arrContract.keys();
						Integer[] key = new Integer[contractCount];
						int countOfContract=0;
						while(enumKey.hasMoreElements()){
							key[countOfContract] = enumKey.nextElement();
							countOfContract++;
						}
					%>
					
					<% 	
						contractName = new String[countOfContract];
						for(int i=0; i<countOfContract; i++) {
							StringTokenizer st = new StringTokenizer(arrContract.get(key[i]), "\t");
							contractName[i] = st.nextToken();
						%>
						<option value="<%= key[i] %>"><%= contractName[i] %></option>
					<%} %>
				<%} %>
					</select>
					<!-- On change event of contract, we should populate the values of contract details for user reference -->

		<script type="text/javascript">
				
				jQuery(function(){
						
						$('select#contractname').change(function(){
							if($('#contractname :selected').text() == "Select Contract Name"){
								document.getElementById('contractcreatedby').value = "";
								document.getElementById('contractdate').value = "";
								document.getElementById('space').value = "";
								document.getElementById('contractdate').value = "";
								document.getElementById('contractstartdate').value = "";
								document.getElementById('contractenddate').value = "";
							}else{
								var myContract = new Array();
								var contract = '<%= arrContract %>';
								var splitContract = contract.split("\t");

								for(cnt=0; cnt < splitContract.length - 1; cnt ++){
									myContract[cnt] = splitContract[cnt];
								}
							
								myContract[0] = myContract[0].replace("{", "");

								for(cntView = 0; cntView < myContract.length; cntView +=6){

									if(myContract[cntView].match($('#contractname :selected').val())){
										//alert($('#contractname :selected').val());
										var name = myContract[cntView+1];
										var contDate = myContract[cntView+2];
										var space = myContract[cntView+3];
										var stDate = myContract[cntView+4];
										var endDate = myContract[cntView+5];
									}else{
										document.getElementById('contractcreatedby').value = "";
										document.getElementById('contractdate').value = "";
										document.getElementById('space').value = "";
										document.getElementById('contractstartdate').value = "";
										document.getElementById('contractenddate').value = "";
									}
								}
									document.getElementById('contractcreatedby').value = name;
									document.getElementById('contractdate').value = contDate;
									document.getElementById('space').value = space;
									document.getElementById('contractstartdate').value = stDate;
									document.getElementById('contractenddate').value = endDate;
							
							}
							
						});
				
				});
				
				</script>
					
				</td>
			</tr>
			<tr>
				<td id="createad_column"><label>Contract Created By</label></td>
				<td><input type="text" name="contractcreatedby" id="contractcreatedby" readOnly="readonly" style="background-color: #CCCCCC; color: #003366; font-weight: bold" /></td>
			</tr>
			<tr>
				<td id="createad_column"><label>Contract Date</label></td>
				<td><input type="text" name="contractdate" id="contractdate" readOnly="readonly" style="background-color: #CCCCCC; color: #003366; font-weight: bold" /></td>
			</tr>
			<tr>
				<td id="createad_column"><label>Contract Space</label></td>
				<td><input type="text" name="space" id="space" readOnly="readonly" style="background-color: #CCCCCC; color: #003366; font-weight: bold" /></td>
			</tr>
			<tr>
				<td id="createad_column"><label>Contract Start Date</label></td>
				<td><input type="text" name="contractstartdate" id="contractstartdate" readOnly="readonly" style="background-color: #CCCCCC; color: #003366; font-weight: bold" /></td>
			</tr>
			<tr>
				<td id="createad_column"><label>Contract End Date</label></td>
				<td><input type="text" name="contractenddate" id="contractenddate" readOnly="readonly" style="background-color: #CCCCCC; color: #003366; font-weight: bold" /></td>
			</tr>
			<tr>
				<td id="createad_column"><label>Ad Start Date</label></td>
				<td><input type="text" name="adstartdate" id="adstartdate" /></td>
			</tr>
			<tr>
				<td id="createad_column"><label>Ad End Date</label></td>
				<td><input type="text" name="adenddate" id="adenddate" /></td>
			</tr>
			<tr>
				<td id="createad_column"><label>Channel Name</label></td>
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
				<td><button id="createad" type="submit" class="ui-state-default ui-corner-all">Create Ad !</button></td>
				<td><button id="reset" type="reset" class="ui-state-default ui-corner-all">Clear</button></td>
			</tr>
		</table>
		</center>	
		
	</form>
	

</body>
</html>