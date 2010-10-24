	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
	
		<link rel="stylesheet" href="css/jquery.treeview.css" type="text/css" />
		<script type="text/javascript" src="javascripts/jquery.js"></script>
		<script type="text/javascript" src="javascripts/jquery.treeview.js">
			
		</script>
		
	<script type="text/javascript">
	
	$(document).ready(function(){
		$("#menu").treeview();
	});
			
	</script>

	</head>
	<body>
	
	<br /><br />
	
	<div align="left">
		<ul id="menu">
			<li class="closed">Item 1
				<ul>
					<li>This is apple.</li>
					<li>This is mango.</li>	
				</ul>				
			</li>
			<li class="closed">Item 2
				<ul>
					<li>This is pineapple.</li>
					<li>This is tree.</li>
				</ul>
			</li>	
		</ul>
		
	</div>
	
	</body>
</html>
