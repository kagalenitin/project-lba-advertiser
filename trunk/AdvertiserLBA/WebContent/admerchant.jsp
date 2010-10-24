<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.model.AdvertisementModel, java.util.*" %>

<%
	AdvertisementModel objAdModel = (AdvertisementModel) request.getAttribute("loadad");
	String[] adName= null; int adCount=0; int jsCount=0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Google Maps JavaScript API Example</title>
	<link rel="stylesheet" href="css/generalpurpose.css" type="text/css" />
	<link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css" type="text/css" media="screen" />
   <script src="http://maps.google.com/maps?file=api&v=2&key=ADD_YOUR_KEY_HERE" type="text/javascript"></script>
   <script type="text/javascript">

   //<![CDATA[
		var geocoder;
  	  	var map;
  	  
  	function mapit(){
  	  	var address = document.getElementById('address').value+" "+ document.getElementById('city').value+" "+document.getElementById('state').value+" " + document.getElementById('zip').value;
  	  	load(address);
	  }
	
	  function load(address){
	     // Create new map object
	     map = new GMap2(document.getElementById("map"));
	     // Create new geocoding object
	     geocoder = new GClientGeocoder();
	     // Retrieve location information, pass it to addToMap()
	     geocoder.getLocations(address, addToMap);
	  }
	
	  // This function adds the point to the map
	  function addToMap(response){
		  // Retrieve the object
	     place = response.Placemark[0];
	     // Retrieve the latitude and longitude
	     point = new GLatLng(place.Point.coordinates[1], place.Point.coordinates[0]);
		 // Center the map on this point
	     map.setCenter(point, 12);
	     // Create a marker
	     marker = new GMarker(point);
	     // Add the marker to map
	     map.addOverlay(marker);
	     // Add address information to marker
	     marker.openInfoWindowHtml(place.address);
	     document.getElementById('latitude').value = place.Point.coordinates[1];
         document.getElementById('longitude').value =place.Point.coordinates[0];
	  }

   //]]>
   </script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> 
	<script type="text/javascript" src="http://dev.jquery.com/view/trunk/plugins/validate/jquery.validate.js"></script>
	
	<script type="text/javascript">
		var $cad = jQuery.noConflict();
		$cad(function(){
			$cad.validator.addMethod("ad", function(value, element) {
	              return this.optional(element) || (value.indexOf("selectad") == -1);
	          }, "Please select an advertisement");
	          $cad('#admerchant').validate({
				rules:{
					ad:{
						ad: true
	          		},
	          		address:{
		          		required: true,
		          		minlength: 10
	          		},
	          		city: {
		          		required: true,
		          		minlength: 5
	          		},
	          		state: {
		          		required: true,
		          		minlength: 2
	          		},
	          		zip: {
		          		required: true,
		          		minlength: 5,
		          		number: true
	          		}
	          	},
	          	messages: {
					address: "Please enter correct address",
					city: "Please enter proper city",
					state: "Please enter state",
					zip: "Zip should be 5 digits"
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
</head>
<body>
<%@ include file="./navigationbar.jsp" %>
	<form method="post" id="admerchant" name="admerchant" action="SetADMerchant"> 
	  <table align="center" border=1 cellpadding="5">
	  	<tr>
	  		<td id="createad_column"><label>Select Advertisement</label></td>
	  		<td>
	  		<% Hashtable<Integer, String> hashAd = objAdModel.loadAdName(); %>
	  		<% adCount = objAdModel.getAdvertisementIDCount(); %>
	  		<% if(adCount==0){ %>
	  			<input type="text" name="ad" id="ad" value="No Advertisement" readonly="readonly" />
	  		<%}else { %>
	  		<select id="ad" name="ad">
	  			<option value="selectad">Select Advertisement</option>
	  				<% Enumeration<Integer> enumKey = hashAd.keys();
						Integer[] key = new Integer[adCount];
						int count=0;
						while(enumKey.hasMoreElements()){
							key[count] = enumKey.nextElement();
							count++;jsCount++;
						}
					%>
					<% 
						adName = new String[count];
						for(int i=0; i<count; i++){ 

							//This part will separate the product name from the rest of the details.
							StringTokenizer st = new StringTokenizer(hashAd.get(key[i]), "\t");
							adName[i] = st.nextToken();
						%>
							<option value="<%= key[i] %>"><%= adName[i] %></option>
	  					<%} %>
	  		<%}%> 
	  			</select>
	  			<!-- jQuery script for selecting ad  -->
	  			
	  			<script type="text/javascript">
	  				var $obj = jQuery.noConflict();
	  				$obj(function(){
		  				
						$obj('#ad').change(function(){
							if($obj('#ad :selected').text() == "Select Advertisement"){
								$obj('#address').val("Disabled");
								$obj('#address').attr("disabled", true);
								$obj('#city').val("Disabled");
								$obj('#city').attr("disabled", true);
								$obj('#state').val("Disabled");
								$obj('#state').attr("disabled", true);
								$obj('#zip').val("Disabled");
								$obj('#zip').attr("disabled", true);
								$obj('#addesc').val("");
								$obj('#latitude').val("");	
								$obj('#longitude').val("");
							}else{
								//alert($obj('#ad: selected').text());
								var myAd = new Array();
								var ads = '<%= hashAd %>';
								var splitAd = ads.split("\t");

								for(cnt=0; cnt < splitAd.length - 1; cnt++){
									myAd[cnt] = splitAd[cnt];
								}
								
								myAd[0] = myAd[0].replace("{", "");

								for(cntView = 0; cntView < myAd.length; cntView+=2){
									//alert(myAd[cntView]);
									if(myAd[cntView].match($obj('#ad :selected').val())){
										//alert(myAd[cntView]);
										//Value found
										//alert(($obj('#ad :selected').val()));
										//alert(das);
										var addesc = myAd[cntView+1];	
										//$obj('#address').attr("disabled", false);
										//$obj('#city').attr("disabled", false);
										//$obj('#state').attr("disabled", false);
										//$obj('#zip').attr("disabled", false);
										$obj('#address').val("");
										$obj('#addesc').val("");
										$obj('#city').val("");	
										$obj('#state').val("");
										$obj('#zip').val("");
										
									}else{
										
										//Value not found
									}
										$obj('#addesc').val(addesc);
										$obj('#address').attr("disabled", false);
										$obj('#city').attr("disabled", false);
										$obj('#state').attr("disabled", false);
										$obj('#zip').attr("disabled", false);
								}
							}	
						}); 
	  				});
	  			</script>
	  			</td>	
	  	</tr>
	  	<tr>
	  		<td id="createad_column"><label>Ad Description</label></td>
	  		<td>
	  			<textarea id="addesc" name="addesc" readonly="readonly" style="background-color: #CCCCCC; font-color: #000000"></textarea>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td id="createad_column"><label>Address</label></td>
	  		<td>
	  			<input type="text" id="address" name="address" disabled="disabled" value="Disabled"/>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td id="createad_column"><label>City</label></td>
	  		<td>
	  			<input type="text" id="city" name="city" disabled="disabled" value="Disabled"/>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td id="createad_column"><label>State</label></td>
	  		<td>
	  			<input type="text" id="state" name="state" disabled="disabled" value="Disabled"/>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td id="createad_column"><label>Zip</label></td>
	  		<td>
	  			<input type="text" id="zip" name="zip" onblur="javascript: mapit();" disabled="disabled" value="Disabled"/>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td id="createad_column"><label>Latitude</label></td>
	  		<td>
	  			<input type="text" id="latitude" name="latitude" readonly="readonly" style="background-color: #CCCCCC; font-color: #000000"/>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td id="createad_column"><label>Longitude</label></td>
	  		<td>
	  			<input type="text" id="longitude" name="longitude" readonly="readonly" style="background-color: #CCCCCC; font-color: #000000"/>
	  		</td>
	  	</tr>	  	
	  	<tr>
	  		<td colspan=2 align="center"><br /><br /><br /><div id="map" style="width: 450px; height: 450px">On valid address, Google Map will be loaded.</div></td>
	  	</tr>
	  	<tr>
	  		<td colspan=2 align="center"><button id="mapButton" type="submit" class="ui-state-default ui-corner-all" class="submit" style="font-weight: bolder; font-size: medium" >Map It</button></td>
	  	</tr>
	  </table>
	  	<input type="hidden" value="adset" name="page" />
	</form>
 </body>

</html>



