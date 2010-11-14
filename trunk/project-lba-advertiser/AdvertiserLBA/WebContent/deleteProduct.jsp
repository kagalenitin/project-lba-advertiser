<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.model.ProductModel" %>
<%@ page import = "com.LBA.Advertiser.bean.ProductBean" %>
<%
	ProductModel objPModel = (ProductModel)request.getAttribute("confirmdelete");
	ProductBean objBean = objPModel.getEditProductDetail();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="css/generalpurpose.css" type="text/css" />
	<link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css" type="text/css" media="screen" />
	<link rel="stylesheet" type="text/css" href="css/jquery.fastconfirm.css"/>
	  	 
	<script type="text/javascript" src="javascripts/jquery-1.4.2.js"></script>
<script type="text/javascript">

	//function whichcall(val){
		//alert(val);
		//document.deletePage.page.value = val;
	//}
	$fb = jQuery.noConflict();
	function setValue(vl){
		//alert('First');
		//Set the page variable (hidden) to move to the other page.
		$fb('input#page').val(vl);
	}
		
</script>
<script src="javascripts/jquery.fastconfirm.js" type="text/javascript"></script>
	<script type="text/javascript">
		var $hj = jQuery.noConflict();
		$hj(function() {
			$hj('button#deleteproduct').click(function() {
				$hj('input#page').val('deldata');
				$hj(this).fastConfirm({
					position: "right",
					questionText: "All the Ads related to the product will be deleted. Are you sure?",
					onProceed: function(trigger) {
						//alert("If you want a try, you've got it!");
						//window.location.href="ProductServlet?page=deldata";
						$hj('form#delproductdata').submit();
					},
					onCancel: function(trigger) {
						//alert("Erm. In fact, you were already trying it, don't you think?");
						return false;
					}
				});
			});
		});
	</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Contract</title>
</head>
<body>
<%@ include file="navigationbar.jsp" %>
<center>
<form id="delproductdata">
	<table cellpadding="3">
			<tr>
				<td colspan=2><h3>This step will delete your product!</h3></td>
			</tr>
			<tr>
				<td id="edit_product">Product ID </td>
				<td><input type="text" name="productid" value="<%=objBean.getCount() %>" readonly="readonly" /></td>
			</tr>
			<tr>
				<td id="edit_product">Product Name </td>
				<td><input type="text" name="productname" value="<%=objBean.getProductName() %>" disabled="disabled" /></td>
			</tr>
			<tr>
				<td id="edit_product">Product Description </td>
				<td><input type="text" name="productdesc" value="<%= objBean.getProductdescription() %>" disabled="disabled" /></td>
			</tr>
			<tr>
				<td id="edit_product">Product Price </td>
				<td><input type="text" name="productprice" value="<%= objBean.getPrice() %>" disabled="disabled" /></td>
			</tr>
			<tr>
				<td align="right"><button type="submit" name="deleteproduct" id="deleteproduct" class="ui-state-default ui-corner-all" onclick="return false;">Delete Product</button>
				<script type="text/javascript">
				
				</script>
					
				</td>
				
				<td align="left"><button type="submit" name="backtoall" id="backtoall" class="ui-state-default ui-corner-all">Back to All Products</button><button type="submit" name="backtoedit" id="backtoedit" class="ui-state-default ui-corner-all">Back to Edit</button>
				<script type="text/javascript">
				var $fj = jQuery.noConflict();
					$fj('button#backtoall').click(function(){
						setValue('backtoall');
					});

					$fj('button#backtoedit').click(function(){
						setValue('backtoedit');
					});
				</script>
				
				</td>
			</tr>
		</table>
		<input type="hidden" name="page" id="page"/>
	</form>
</center>

</body>
</html>