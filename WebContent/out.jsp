<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Health Login</title>
<!-- Fav and touch icons -->
                                
                                   
                                   <link rel="shortcut icon" href="assets/ico/favicon.ico">
	<link rel="icon" sizes="16x16 32x32 64x64" href="assets/ico/favicon.ico">
	<link rel="icon" type="image/png" sizes="196x196" href="assets/ico/favicon-196.png">
	<link rel="icon" type="image/png" sizes="160x160" href="assets/ico/favicon-160.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/ico/favicon-96.png">
	<link rel="icon" type="image/png" sizes="64x64" href="assets/ico/favicon-64.png">
	<link rel="icon" type="image/png" sizes="32x32" href="assets/ico/favicon-32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="assets/ico/favicon-16.png">
	<link rel="apple-touch-icon" sizes="152x152" href="assets/ico/favicon-152.png">
	<link rel="apple-touch-icon" sizes="144x144" href="assets/ico/favicon-144.png">
	<link rel="apple-touch-icon" sizes="120x120" href="assets/ico/favicon-120.png">
	<link rel="apple-touch-icon" sizes="114x114" href="assets/ico/favicon-114.png">
	<link rel="apple-touch-icon" sizes="76x76" href="assets/ico/favicon-76.png">
	<link rel="apple-touch-icon" sizes="72x72" href="assets/ico/favicon-72.png">
	<link rel="apple-touch-icon" href="assets/ico/favicon-57.png">

</head>
<body>
<%String name=null;
session.setAttribute("EName",name);
String clinid=null;
session.setAttribute("Clinic_id1",clinid);%>
<%@include file="signin.jsp" %>
</body>
</html>