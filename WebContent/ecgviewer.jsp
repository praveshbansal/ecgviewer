<%@page import="com.rjil.jio.nasan.wscall.WSCall"%>
<%@page import="org.codehaus.jettison.json.JSONArray"%>
<%@page import="org.codehaus.jettison.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% if(session.getAttribute("EName")!=null)
	 {
		
		if(session.getAttribute("Role").equals("0"))
 	   {
	 %>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<title>ECG Viewer</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="assets/css/docs.css" rel="stylesheet">
<link href="assets/js/google-code-prettify/prettify.css"
	rel="stylesheet">
<script src="assets/js/html5shiv.js"></script>
<!-- Fav and touch icons -->


<link rel="shortcut icon" href="assets/ico/favicon.ico">
<link rel="icon" sizes="16x16 32x32 64x64" href="assets/ico/favicon.ico">
<link rel="icon" type="image/png" sizes="196x196"
	href="assets/ico/favicon-196.png">
<link rel="icon" type="image/png" sizes="160x160"
	href="assets/ico/favicon-160.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/ico/favicon-96.png">
<link rel="icon" type="image/png" sizes="64x64"
	href="assets/ico/favicon-64.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="assets/ico/favicon-32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/ico/favicon-16.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="assets/ico/favicon-152.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="assets/ico/favicon-144.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="assets/ico/favicon-120.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="assets/ico/favicon-114.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/ico/favicon-76.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="assets/ico/favicon-72.png">
<link rel="apple-touch-icon" href="assets/ico/favicon-57.png">


<style type="text/css">

.navbar-default {
	background: #A8A8A8;
	border-color: #E7E7E7;
}

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: inherit;
		padding-left: 0px;
		padding-right: 20px;
		padding-bottom: 20px;
	}
}

@media ( min-width : 980px) {
	.pull-center {
		text-align: center;
		padding-left: 100px;
	}
	td a {
		width: 100%;
		display: block;
		text-decoration: underline;
	}


table.sortable th:not (.sorttable_sorted ):not (.sorttable_sorted_reverse
	):not (.sorttable_nosort ):after {
	content: " \25B4\25BE"
}
</style>


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link href="assets/css/datatable.css" rel="stylesheet">
<script src="assets/js/datatable.js"></script>


</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<p class="nav navbar-text pull-left">
					<img alt="JIO ECG" src="assets/img/img.png" width="70"> 
				<div class="nav-collapse collapse">
					<p class="nav navbar-text pull-right  ">
						Logged in As <a href="#" class="navbar-link"><%=session.getAttribute("EName") %></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

						<a href="out.jsp" class="navbar-link">Log Out</a>

					</p>
				</div>
			</div>
		</div>
	</div>
	
	
<ul class="nav nav-tabs nav-justified">
  <li class="active"><a href="#">ECG Viewer</a></li>
  <li ><a href="#">Hospital Details</a></li>
  <li ><a href="#">Help</a></li>
</ul>
	
	


	<div class="container-fluid ">


		<legend>Ecg Viewer</legend>
		<table id="myTable" class="table table-bordered table-striped">

			<thead>
				<tr>
					<th>Clinic Id</th>
					<th>Patient Id</th>
					<th>Patient Name</th>
					<th>Sex</th>
					<th>Age</th>
					<th>JIO Id</th>
					<th>Date</th>
					<th>Time</th>
					<th>Contact</th>
					<th>View ECG</th>

				</tr>
			</thead>
			<tbody>
				<% 
                JSONArray array=new JSONArray();
                JSONObject data=new JSONObject();
                //List<Map<String, String>> datalist=new ArrayList<Map<String,String>>();
                String cid1 = (String) session.getAttribute("Clinic_id1");
                WSCall call=new WSCall();
                array=call.getClinicData(cid1,"0");
                String clinic_id = "";
        		String patient_name = "";
        		String patient_id = "";
        		String sex = "";
        		String age = "";
        		String jio_id = "";
        		String contact_number = "";
        		String link = "";
        		String datetime = "";
        		String date="";
        		String time="";
                
        		for(int i=0;i<array.length();i++)
               	{
        					data=(JSONObject)array.get(i);
        					clinic_id=data.getString("clinic_id");
        					patient_name=data.getString("patient_name");
        					patient_id=data.getString("patient_id");
        					sex=data.getString("sex");
        					age=data.getString("age");
        					jio_id=data.getString("jio_id");
        					contact_number=data.getString("contact_number");
        					link=data.getString("linkdownload");
        					datetime=data.getString("ecgtest_date");
        					//System.out.println("date"+datetime.substring(0,10));
        					date=datetime.substring(0,10);
        					time=datetime.substring(10,18); 
               	
                
	
	%>

			
			

				<tr>
					<td><%= clinic_id %></td>
					<td><%= patient_id %></td>
					<td><%= patient_name %></td>
					<td><%= sex %></td>
					<td><%= age %></td>
					<td><%= jio_id %></td>
					<td><%= date%></td>
					<td><%= time%></td>
					<td><%=contact_number %></td>


					<td class="underline"><a href="<%= link %>"
						onclick="window.open(this.href,'_blank');return false;">Click
							Here</a></td>
				</tr>

				<% }
	%>
			</tbody>
		</table>
	</div>


	<hr>

	<div id="footer" class="container">
		<nav class="navbar navbar-default navbar-fixed-bottom">
		<div class="navbar-inner navbar-content-center">
			<p class="text-muted credit">
				<font color="#737CA1" size="3">&copy; Reliance Jio Cloud
					Health Project.</font>
			</p>
		</div>
		</nav>
	</div>

</body>

<script>
$(document).ready(function(){
    $('#myTable').dataTable();
});
</script>
<%} 
 else
 {
 %>
<%@ include file="admin.jsp"%>
<%
	 }
	 %>

<%}
	 else
	 {
		%>
<%@ include file="signin.jsp"%>
<%
	 }
	 %>
</html>

