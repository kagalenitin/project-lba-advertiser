<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.model.ChannelModel, java.util.*" %>
<%@page import="com.LBA.Advertiser.bean.GlobalBean" %>

<%
	ChannelModel objCategory = (ChannelModel) request.getAttribute("channelCategory");
	String[] catName= null; int catCount=0; int jsCount=0;
	 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="css/generalpurpose.css" type="text/css"/>
	<link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css" type="text/css" media="screen" />
	
	<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> 
	<script type="text/javascript" src="http://dev.jquery.com/view/trunk/plugins/validate/jquery.validate.js"></script>
	-->
	<script src="javascripts/jquery.js" type="text/javascript"></script>
	<script src="javascripts/jquery.validate.js" type="text/javascript"></script>
	
	<script type="text/javascript">
	//initiate validator on load
	 $jry = jQuery.noConflict();
	 $jry(function() {
		// validate  form on keyup and submit
		$jry("#channelform").validate({
			//set the rules for the field names
			rules: {
				channelname: {
					required: true,
					minlength: 3
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
			
   				<h3 id="login_font">Create Channel</h3>
   
     <table cellpadding="3">
     			<tr>
					<td id="edit_product">Category Name </td>
					<td>
						<% Hashtable<Integer, String> hashCategory = objCategory.loadCategoryName(); %>
	  					<% catCount = objCategory.getCategoryCount(); %>
				  		<% if(catCount==0){ %>
				  			<input type="text" name="catname" id="catname" value="No Category" readonly="readonly" />
				  		<%}else { %>
	  						<select id="catname" name="catname">
					  			<option value="selectcategory">Select Category</option>
					  				<% Enumeration<Integer> enumKey = hashCategory.keys();
										Integer[] key = new Integer[catCount];
										int count=0;
										while(enumKey.hasMoreElements()){
											key[count] = enumKey.nextElement();
											count++;jsCount++;
										}
									%>
					<% 
						catName = new String[count];
						for(int i=0; i<count; i++){ 

							//This part will separate the product name from the rest of the details.
							StringTokenizer st = new StringTokenizer(hashCategory.get(key[i]), "\t");
							catName[i] = st.nextToken();
						%>
							<option value="<%= key[i] %>"><%= catName[i] %></option>
	  					<%} %>
	  		<%}%> 
	  			</select>
	<!--   				<script type="text/javascript">
	  						var $obj = jQuery.noConflict();
	  						$obj(function(){
	  							$obj('#catname').change(function(){
	  								if($obj('#catname :selected').text() == "Select Category"){
	  									//alert($obj('#catname :selected').text());
										$obj('#descr').val("");
	  								}else{
	  									var myCat = new Array();
	  									var cat = ;
	  									var splitCat = cat.split("\t");
										
	  									for(cnt=0; cnt < splitCat.length - 1; cnt++){
	  										myCat[cnt] = splitCat[cnt];
	  									}

	  									myCat[0]= myCat[0].replace("{", "");
	  									for(cntView = 0; cntView < myCat.length; cntView+=2){

	  										if(myCat[cntView].match($obj('#catname :selected').val())){
		  										var desc = myCat[cntView+1];
	  											
	  										}else{
		  										//Value not found
		  										$obj('#descr').val("");
	  										}
	  										$obj('#descr').val(desc);
	  									}
	  								}
	  							});
	  						});

	  				</script>		
	  	 -->		
					</td>
				</tr>
				
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
	<%@ include file="./footer.jsp" %>
</body>
</html>