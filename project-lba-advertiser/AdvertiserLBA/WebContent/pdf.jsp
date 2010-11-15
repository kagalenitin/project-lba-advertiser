<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.LBA.Advertiser.model.ContractModel"%>
<%@ page import="com.LBA.Advertiser.bean.ContractBean"%>
<%
	
	ContractModel cModel = (ContractModel) request.getAttribute("print");
	ContractBean viewBean = cModel.viewcurrentContractDetails();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="application/pdf; charset=ISO-8859-1">
<title>Contract Created. View PDF</title>
</head>
<body>
<%@ include file="./navigationbar.jsp" %>
<center>The PDF Format has been successfully saved. To view, 
<a href=/AdvertiserLBA/files/<%= viewBean.getContractID()+viewBean.getContractname()%>.pdf><font face="Verdana" color="#000000">click here.</font></a></center>
</body>
</html>