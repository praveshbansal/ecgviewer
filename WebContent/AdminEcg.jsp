<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	    pageEncoding="ISO-8859-1"%>
	    <%@page import="java.sql.*" %>
	    <%@ page import="java.util.List" %>    
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<% if(session.getAttribute("EName")!=null)
	 {
		
		
	 %>
	 
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>ECG Viewer</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="assets/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/assets/css/styles.css" rel="stylesheet">
<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/assets/css/shadow.css" rel="stylesheet">
<link href="assets/assets/css/highlight.css" rel="stylesheet">
<link href="assets/assets/css/scrollable.css" rel="stylesheet">
<link href="assets/assets/css/navcolor.css" rel="stylesheet">
</head>


<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">JIO ECG</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class=""> <a href="#" > Logged in As <%=session.getAttribute("EName") %></a></li>
					
					<li><a href="out.jsp">Log Out</a></li>
				</ul>
				<!-- <form class="navbar-form navbar-right">
		            <input type="text" class="form-control" placeholder="Search...">
		          </form> -->
			</div>
		</div>
	</nav>

	<div class="container-fluid">


		<div class="row row-offcanvas row-offcanvas-left">

			<div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar"
				role="navigation">


				<ul class="nav nav-sidebar">
				
				
					<li class="active"><a href="ecgviewer.jsp" class="list-group-item active">ECG
						Results
					</a></li>
					<li><a href="registration.jsp" class="list-group-item">Register Clinic
					</a></li>
					<li><a href="#" class="list-group-item">Registered Clinic
					</a></li>				</ul>


			</div>
			<!--/span-->

			<div class="col-sm-9 col-md-10 main box shadow-outside-all">
				<legend>Registered Clinic List</legend>
		<table id="myTable" class="table table-bordered table-striped">

			<thead>
				<tr>
					<th>Clinic Name</th>
					<th>Clinic Id</th>
					<th>City</th>
					<th>Total Tests</th>
					<th>View Results</th>
					<th>Device Details</th>

				</tr>
			</thead>
			<div id="test"></div>
			<tbody>
			
				<%
					Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection(
									"jdbc:mysql://localhost:3306/jioecg", "root",
									"root");
							Statement stmt = con.createStatement();
							Statement stmt1 = con.createStatement();
							//Statement s=con.createStatement();

							//String cid1 = (String) session.getAttribute("Clinic_id1");
							//String sql1="SELECT COUNT(CustomerID) FROM jioecg_upload WHERE CustomerID=7";
							String sql = "SELECT * from clinic_registration WHERE user_type=0";
							ResultSet res = stmt.executeQuery(sql);
							String clinic_id = "";
							String clinic_name = "";
							int flag = 0;
							String b1="";
							
				%>

				<%
					while (res.next()) {
								clinic_name = res.getString("organisation_name");
								clinic_id = res.getString("clinic_id");
								String city = res.getString("organisation_city");
								//String city = res.getString("city");
				%>
				<%--  <script>
function popout() {
     window.open("<%= link %>", "ECG Result", "width=800, height=600");
}
</script> --%>

				<tr>
					<td><%=clinic_name%></td>
					<td><%=clinic_id%></td>
							
					<td><%=city%></td>
					<td>
						<%
							String Sql1 = "SELECT count(*) as total FROM jioecg_upload where clinic_id = '"
												+ clinic_id + "'";
										ResultSet r = stmt1.executeQuery(Sql1);
										r.next();
										int count = r.getInt("total");
						%><%=count%></td>
					<td ><a data-toggle="modal" href="#lightboxform">Click Here</a></td>


					<td><a data-toggle="modal" href="#devicesdetail"> Click	Here</a></td>
					<%-- 
	<td class ="underline" ><a href="<%=  %>" onclick="window.open(this.href,'_blank');return false;">Click Here</a></td>
	<td class ="underline" ><a href="<%=  %>" onclick="window.open(this.href,'_blank');return false;">Click Here</a></td>
	 --%>

					<%
						}
								stmt.close();
								res.close();

								con.close();
					%>
				</tr>


			</tbody>
		</table>
	</div>


	<div id="lightboxform" class="modal hide fade" tabindex="-1"
		data-width="1500">
		<div class="modal-header">
			<button type="button" class="close" aria-hidden="true">x</button>
			<h3>Ecg Results</h3>
		</div>
		<div class="modal-body">

			<table id="myTable" class="table table-bordered table-striped">

				<thead>
					<tr>
						<th>Clinic Id</th>
						<th>Patient Id</th>
						<th>Patient Name</th>
						<th>Sex</th>
						<th>Age</th>
						<th>JIO Id</th>
						<th>Date|Time</th>
						<th>Contact</th>
						<th>View ECG</th>

					</tr>
				</thead>
				<tbody>
					<%
						Class.forName("com.mysql.jdbc.Driver");
								Connection con3 = DriverManager.getConnection(
										"jdbc:mysql://localhost:3306/jioecg", "root",
										"root");
								Statement stmt3 = con3.createStatement();

								//String cid1 = (String) session.getAttribute("Clinic_id1");
								String sql3 = "SELECT * from jioecg_upload where clinic_id = '"
										+ clinic_id + "'";
								ResultSet res3 = stmt3.executeQuery(sql3);
					%>

					<%
						while (res3.next()) {
									//String clinic_id = res3.getString("clinic_id");
									String patient_name = res3.getString("patient_name");
									String patient_id = res3.getString("patient_id");
									String sex = res3.getString("sex");
									String age = res3.getString("age");
									String jio_id = res3.getString("jio_id");
									String contact_number = res3
											.getString("contact_number");
									String link = res3.getString("linkdownload");
									String datetime = res3.getString("ecgtest_date");
					%>
					<%--  <script>
function popout() {
     window.open("<%= link %>", "ECG Result", "width=800, height=600");
}
</script> --%>

					<tr>
						<td><%=clinic_id%></td>
							<% System.out.println("table" + clinic_id);%>
						<td><%=patient_id%></td>
						<td><%=patient_name%></td>
						<td><%=sex%></td>
						<td><%=age%></td>
						<td><%=jio_id%></td>
						<td><%=datetime%></td>
						<td><%=contact_number%></td>


						<td class="underline"><a href="<%=link%>"
							onclick="window.open(this.href,'_blank');return false;">Click
								Here</a></td>
					</tr>

					<%
						}
								stmt3.close();
								res3.close();

								con3.close();
					%>
				</tbody>
			</table>
		</div>
	</div>

	<div id="devicesdetail" class="modal hide fade" tabindex="-1"
		data-width="1500">

		<%
			Class.forName("com.mysql.jdbc.Driver");
					Connection c = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/jioecg", "root",
							"root");
					Statement stmt2 = c.createStatement();
					System.out.println("form" + clinic_id);
					String Sql4 = "SELECT count(*) as c FROM device_registration where clinic_id = '"
							+ clinic_id + "'";
					ResultSet r1 = stmt2.executeQuery(Sql4);
					r1.next();
					flag = r1.getInt("c");
					String Sql5 = "SELECT * FROM device_registration where clinic_id = '"
							+ clinic_id + "'";
					ResultSet r2 = stmt2.executeQuery(Sql5);
					r2.next();
					String deviceid = r2.getString("device_id");
					String devicename = r2.getString("device_name");
					if (flag == 0) {
		%>
		<div class="modal-header">
			<button type="button" class="close" aria-hidden="true">x</button>
			<h3>Device Registration</h3>
		</div>
		<div class="modal-body container">

			<form class="form-signin" action="DeviceServ" method="post">
				<h2 class="form-signin-heading">
					<font color="#737CA1">Add Device</font>
				</h2>
				<input type="text" placeholder="Device Name" name="dname" required>
				<input type="text" placeholder="Device ID" name="imei" required>
				<input type="hidden" name="clinic_id" value="<%=clinic_id%>">
				<input type="hidden" name="organisation_name" value="<%=clinic_name%>">
				<button type="submit" class="form-control btn btn-success ">Add	Device</button>
				<div class="control-group">
					<div class="controls">
						<select name="state" class="form-control" required="">
							<option value="Select" selected>Enable/Disable</option>
							<option value="1">Enable</option>
							<option value="0">Disable</option>
						</select>
					</div>
				</div>

			</form>
		</div>
			<%
				} else {
			%>

			<div class="modal-header">
				<button type="button" class="close" aria-hidden="true">x</button>
				<h3>Device Details</h3>
			</div>
			<div class="modal-body">
				<table id="" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Device Name</th>
							<th>Device Id</th>
							<th>Enable/Disable</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td><%=devicename%></td>
							<td><%=deviceid%></td>
							<td>Click Here</td>
						</tr>


					</tbody>
				</table>



			</div>


			<%
				}
			%>
		</div>
	
				

			</div>






			
		</div>
	


	<footer>
		<p class="pull-left">Reliance Digital Health ©2014 Company</p>
	</footer>

	<!-- script references -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<script src="assets/assets/js/scripts.js"></script>
	<script src="assets/assets/js/jquery.js"></script>
	<script src="assets/assetsjs/highlight.js"></script>
	<script src="assets/assetsjs/jquery-1.11.0.min.js"></script>
	<script src="assets/assets/js/scrollable.js"></script>
	<script src="assets/assets/js/bootstrap.min.js"></script>


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
	<%@ include file="signin.jsp" %>
	<%
	 }
	 %>
	</html>

</html>