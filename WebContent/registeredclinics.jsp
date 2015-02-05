
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html lang="en">
<%
	if (session.getAttribute("EName") != null) {
		if (session.getAttribute("Role").equals("1")) {
%>
<head>

<script src="jquery.js"></script>
<meta charset="utf-8">
<title>Clinic Registration</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="assets/css/docs.css" rel="stylesheet">
<link href="assets/css/bootstrap-timepicker.css" rel="stylesheet">
<link href="assets/css/bootstrap-timepicker.min.css" rel="stylesheet">
<link href="assets/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="assets/js/google-code-prettify/prettify.css"
	rel="stylesheet">

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="assets/js/html5shiv.js"></script>
    <![endif]-->
<script src="assets/js/html5shiv.js"></script>
<!-- Le fav and touch icons -->
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
body {
	padding-top: 30px;
	padding-bottom: 40px;
	padding-left: 20px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
	.pull-center {
		text-align: center;
		padding-left: 550px;
	}
	.pull-center>.nav {
		float: right;
		display: inline-block;
		*display: inline;
		*zoom: 1;
		height: 16px;
	}
}
</style>
<link href="bootstrap-responsive.css" rel="stylesheet">


</head>

<body data-spy="scroll" data-target=".bs-docs-sidebar">

	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<p class="nav navbar-text pull-left">
					<font size="4" color="">Jio Ecg</font> <font size="4"
						style="color: black; margin-left: 500px; bottom-padding: 0px;">Admin</font>

					<!-- 
		        <div class="nav navbar-text pull-center ">
		           <p class="nav navbar-text pull-center" align="center"> <font size="4" color="" >Admin</font>	           
		            </div>
		         -->
				<div class="nav-collapse collapse">
					<p class="nav navbar-text pull-right  ">
						Logged in As <a href="#" class="navbar-link"><%=session.getAttribute("EName")%></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="out.jsp" class="navbar-link">Log Out</a>
					</p>
				</div>
			</div>
		</div>
	</div>



	</div>

	<div class="row-fluid">
		<div class="span3 bs-docs-sidebar ">
			<ul class="nav nav-list bs-docs-sidenav ">
				<li><a href="ecgviewer.jsp"><i class="icon-chevron-right"></i>ECG
						Results</a></li>
				<li><a href="registration.jsp"><i
						class="icon-chevron-right"></i>Register Clinic</a></li>
				<li class="active"><a href="#"><i
						class="icon-chevron-right"></i>Registered Clinic</a></li>


			</ul>
		</div>
	</div>


	<div class="container-fluid ">


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
					<th>Edit Clinic</th>

				</tr>
			</thead>
			<tbody>

				<%
					Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection(
									"jdbc:mysql://localhost:3306/jioecg_new", "root",
									"root");
							Statement stmt = con.createStatement();
							Statement stmt1 = con.createStatement();
							/* String sql = "SELECT * from clinic_registration WHERE user_type=0";
							ResultSet res = stmt.executeQuery(sql); */

							int flag = 0;
							String b1 = "";

							String clinic_id = "";
							String clinic_name = "";
							String city = "";

							JSONArray array = new JSONArray();
							JSONObject data = new JSONObject();

							WSCall call = new WSCall();

							array = call.getRegClinic();

							for (int i = 0; i < array.length(); i++) {
								data = (JSONObject) array.get(i);
								clinic_id = data.getString("clinic_id");
								clinic_name = data.getString("organisation_name");
								city = data.getString("organisation_city");
				%>

				<%
					/* while (res.next()) {
											clinic_name = res.getString("organisation_name");
											clinic_id = res.getString("clinic_id");
											city = res.getString("organisation_city");
											//String city = res.getString("city"); */
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
					<td><a data-toggle="modal" href="#"
						onclick="lightboxformclickfunction(this)">Click Here</a></td>
					<!-- href="#lightboxform" onclick="$('#lightboxform').show();"-->


					<td><a data-toggle="modal" href="#"
						onclick="devicedetailclickfunction(this)"> Click Here</a></td>
					<td><a data-toggle="modal" href="#"
						onclick="EditClinicclickfunction(this)"> Click Here</a></td>
					

					<%
						
								}
													%>
				</tr>


			</tbody>
		</table>
	</div>
	

	<div id="lightboxform" class="modal hide fade" tabindex="-1" data-width="" style="width:800px; font-size:13px;margin-left:-400px;margin-top:50px;">
		<div class="modal-header">
			<button type="button" class="close" aria-hidden="true" onclick="modalclose()">x</button>
			<h3>Ecg Results</h3>
		</div>
		<div class="modal-body">

			<table id="myTable1" class="table table-bordered table-striped">

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
					
							</tbody>
			</table>
		</div>
	</div>
	
	
	
	<div id="devicesregistration" class="modal hide fade" tabindex="-1" 	data-width="1500">

			<div class="modal-header">
			<button type="button" class="close" aria-hidden="true" onclick="modalclose()">x</button>
			<h3>Device Registration</h3>
			</div>
		<div class="modal-body container">

			<form class="form-signin" id="deviceregistration">
				<h2 class="form-signin-heading"><font color="#737CA1">Add Device</font></h2>
				<input type="text" placeholder="Device Name" name="dname" id ="dname" required>
				<input type="text" placeholder="Device ID" name="imei" required>
				 	<div class="control-group">
					<div class="controls">
						<select name="state" class="form-control" required="">
							<option value="Select" selected>Enable/Disable</option>
							<option value="1">Enable</option>
							<option value="0">Disable</option>
						</select>
					</div>
					</div>
				<button type="submit" class="form-control btn btn-success " onclick="adddevicecall()">Add Device</button>
				
			</form>
		</div>
	
	</div>
	
	
	<!-- Edit Clinic Modal starts from here -->
	<div id="EditClinic" class="modal hide fade" tabindex="-1"	data-width="500" style="font-size:12px;max-height:600px;overflow-y:auto ;margin-right:0px !important;">

			<div class="modal-header">
			<button type="button" class="close" aria-hidden="true" onclick="modalclose()">x</button>
			<h3>Edit clinic Detail</h3>
			</div>
		<div class="modal-body container" style="width:530px;">
		<!-- Form clinic details-->
							 <form class="form-horizontal" id="formedit" onsubmit="return false"">
							 
							
							<!-- Form Name -->
							
							<div class="control-group">
							  <label class="control-label" for="oname">Name Of Organization**</label>
							  	<div class="controls">
							    	<input id="oname" name="oname" placeholder="Organization Name" class="input-xlarge" required="" type="text">
							    </div>
							</div>
							
							<div class="control-group">
							  <label class="control-label" for="aname">Organization Admin**</label>
							  	<div class="controls">
							    	<input id="aname" name="aname" placeholder="Organization Administrator" class="input-xlarge" required="" type="text">
							    </div>
							</div>
							
							<div class="control-group">
							  <label class="control-label" for="address">Address**</label>
							  	<div class="controls">
							    	<textarea id="address" name="address" placeholder="Address" class="input-xlarge" required="" type="text"></textarea>
							    </div>
							</div>
							
							<div class="control-group">
							  <label class="control-label" for="city">City**</label>
							  	<div class="controls">
							    	<input id="city" name="city" placeholder="City" class="input-xlarge" required="" type="text">
							    </div>
							</div>
							
							<div class="control-group">
							  <label class="control-label" for="mobile">Mobile No.**</label>
							  	<div class="controls">
							    	<input id="mobile" name="mobile" placeholder="Mobile Number" class="input-xlarge" required="" type="text">
							    </div>
							</div>
							
							<div class="control-group">
							  <label class="control-label" for="anumber">Alternate No.</label>
							  	<div class="controls">
							    	<input id="anumber" name="anumber" placeholder="Alternate Number" class="input-xlarge"  type="text">
							    </div>
							</div>
							
							<div class="control-group">
							  <label class="control-label" for="emailid">Email ID**</label>
								  <div class="controls">
							    	<input id="emailid" name="emailid" placeholder="Email ID" class="input-xlarge" required="" type="text">
							      </div>
							</div>
							
							<div class="control-group">
							  <label class="control-label" for="aemail">Alternate Email ID</label>
								  <div class="controls">
							    	<input id="aemail" name="aemail" placeholder="ALternate Email ID" class="input-xlarge"  type="text">
							      </div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="clinicid">Clinical ID**</label>
									<div class="controls">
										<input id="clinicid" name="clinicid" placeholder="Clinic ID" class="input-xlarge"  type="text" readonly>
									</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="pass">Password**</label>
									<div class="controls">
										<input id="pass" name="pass" placeholder="Password" class="input-xlarge" required="" type="text" >
									</div>
							</div>
							<div class="modal-footer">
							  	<div class="controls">
							    	<button id="reg" name="reg" class="btn btn-success" data-loading-text="Registering..." onclick="editcliniccall()">save</button>
							    	<button class="btn btn-danger"  type="reset" >Reset</button>     
								</div>
							</div>
							 
							 
							 </form>

		</div>
	
	</div>
	
	<!-- device detail modal starts from here -->
		<div id="devicesdetail" class="modal hide fade" tabindex="-1" data-width="1500">

		<div class="modal-header">
			<button type="button" class="close" aria-hidden="true" onclick="modalclose()">x</button>
			<h3>Device Details</h3>
		</div>
		<div class="modal-body">
		<form action="" onsubmit="return false">
		
		
				<table id="devicetable" class="table table-bordered table-striped">
				
				<thead>
					<tr >
						<th>Device Name</th>
						<th>Device Id</th>
						<th>Enable/Disable</th>
						<th align="justify">Modify</th>
					</tr>
				</thead>
				<tbody>
				
				
		
				</tbody>
			 	</table>
			 	</form>
		</div>


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
	<!--/.fluid-container-->


	<script type="text/javascript"
		src="http://platform.twitter.com/widgets.js"></script>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap-transition.js"></script>
	<script src="assets/js/bootstrap-alert.js"></script>
	<script src="assets/js/bootstrap-modal.js"></script>
	<script src="assets/js/bootstrap-dropdown.js"></script>
	<script src="assets/js/bootstrap-scrollspy.js"></script>
	<script src="assets/js/bootstrap-tab.js"></script>
	<script src="assets/js/bootstrap-tooltip.js"></script>
	<script src="assets/js/bootstrap-popover.js"></script>
	<script src="assets/js/bootstrap-button.js"></script>
	<script src="assets/js/bootstrap-collapse.js"></script>
	<script src="assets/js/bootstrap-carousel.js"></script>
	<script src="assets/js/bootstrap-typeahead.js"></script>
	<script src="assets/js/bootstrap-affix.js"></script>
	<script src="assets/js/bootstrap-timepicker.js"></script>
	<script src="assets/js/bootstrap-timepicker.min.js"></script>
	<script src="assets/js/holder/holder.js"></script>
	<script src="assets/js/google-code-prettify/prettify.js"></script>
	<script src="assets/js/bootbox.min.js"></script>
	<script src="assets/js/bootstrap-datetimepicker.min.js"></script>
	<!-- <script src="assets/js/bootstrap-modal.js"></script> -->

	<script type="text/javascript">
	function editdata1(){
		
	//alert("why r u nt running??");
	
			
	    $("#rowdata").attr("contenteditable",'true');
	    $("#rowdata1").attr("contenteditable",'true');
	    
	    document.getElementById("rowdata1").style.color = "red";
	    document.getElementById("rowdata").style.color = "red";
	
	}
	</script>

	 <script>
    function setclinicdetail(){

    		 $.ajax({
    			
    			url : 'UpdateClinic',
    			type : 'get',
    			dataType : 'json',

				data : {
					'id' : valueid
				},
    			
    			success : function(data) {
    				set=data.success.toString();
    				//alert(set);
    				if(set==1){
    				alert("Clinic Details Updated!! ");
    				}
    				else{
    					
    					alert("Clinic updation failed !!")
    				}
    			 
    			},
    				error: function(e){
    					document.getElementById("oname").value="hello";
    		    		 document.getElementById("aname").value="hello";
    		    		 document.getElementById("address").value="hello";
    		    		 document.getElementById("city").value="hello";
    		    		 document.getElementById("mobile").value="hello";
    		    		 document.getElementById("anumber").value="hello";
    		    		 document.getElementById("emailid").value="hello";
    		    		 document.getElementById("aemail").value="hello";
    		    		 document.getElementById("clinicid").value=valueid;
    		    		 document.getElementById("oname").value="hello";
    		     	    
    					alert("some error with the server !! ");
    					
    				}
    				

    	
    	});
    		
    	}
    	
    
 
							
</script>
	

	<script type="text/javascript">
				 
		 function EditClinicclickfunction(ob){
			 valueid = $(ob).parents("tr").find("td:nth-child(2)").text();
				
			 setclinicdetail();
			 
			 $('#EditClinic').modal('show');
				
			 
		 }
		 
		 function modalcall(){
				 
			$('#lightboxform').modal('show');
			//alert("modal called");

		};

		function lightboxformclickfunction(ob) {
			requiredvalue = $(ob).parents("tr").find("td:nth-child(2)").text();

			$.ajax({
				url : 'table1',
				type : 'GET',
				dataType : 'json',
				contentType : 'application/json',

				data : {
					'id' : requiredvalue
				},
				success : function(data) {
					var txt= "Click Here";
					var str = "";
					for(var i=0;i<data.x1.length;i++){
						str += "<tr><td>"+data.x1[i].clinic_id+"</td><td>"+data.x1[i].patient_id+"</td><td>"+data.x1[i].patient_name+"</td><td>"+data.x1[i].sex+"</td><td>"+data.x1[i].age+"</td><td>"+data.x1[i].jio_id+"</td><td>"+data.x1[i].ecgtest_date.substring(0,10)+"</td><td>"+data.x1[i].ecgtest_date.substring(10,18)+"</td><td>"+data.x1[i].contact_number+"</td><td><a target='_blank' href="+data.x1[i].linkdownload+">Click Here</a></td></tr>";
						/* txt.link("+data.x1[i].linkdownload+") */
					}
					$("#myTable1 tbody").html(str);			
					modalcall();
				}
			});
		}
	</script>
	
	
	<script type="text/javascript">
				function devicedetailclickfunction(ob) {
			clinicidfordevicemodal = $(ob).parents("tr").find("td:nth-child(2)").text();
			clinicnamefordeviceregistration = $(ob).parents("tr").find("td:nth-child(1)").text();
			device_status="";
			
			//alert(requiredvalue1);
			$.ajax({
				url : 'table2',
				type : 'GET',
				dataType : 'json',
				contentType : 'application/json',

				data : {
					'transfertoDeviceservlet' : clinicidfordevicemodal,
					
				},
				success : function(data) {
					flag =data.count.toString();
					 if(flag==0){
						deviceregistrationmodalcall();
						}
					else{
						
						 var str1 = "";
							for(var i=0;i<data.devicedata.length;i++){
								 device_status=data.devicedata[i].device_status;
								 
								if(device_status==1)
								{
									device_status="Enabled";
								}
								else
									{
								device_status="Disabled";
								
									} 
								//contenteditable='true'
								str1 += "<tr ><td id='rowdata' contenteditable='false'>"+data.devicedata[i].device_name+" </td><td id='rowdata1' contenteditable='false'>"+data.devicedata[i].device_id+"</td><td><a onclick='enabledisablecall(this)' >"+device_status+"</a></td><td><a onclick='editdata1()' >Edit</a></td><td><a onclick='enabledisablecall(this)' >Update</a></td><td><a onclick='enabledisablecall(this)' >Save</a></td></tr>";
							
							}
								$("#devicetable tbody").html(str1);							
							devicedetailmodalcall();
					 } 					
					
					/* var str = "";
					for(var i=0;i<data.x1.length;i++){
						str += "<tr><td>"+data.x1[i].clinic_id+"</td><td>"+data.x1[i].patient_id+"</td><td>"+data.x1[i].patient_name+"</td><td>"+data.x1[i].sex+"</td><td>"+data.x1[i].age+"</td><td>"+data.x1[i].jio_id+"</td><td>"+data.x1[i].ecgtest_date.substring(0,10)+"</td><td>"+data.x1[i].ecgtest_date.substring(10,18)+"</td><td>"+data.x1[i].contact_number+"</td><td><a>Click Here</a></td></tr>";
					
					}*/	
					
					//$("#devicetable tbody").html(str);			
					
				}
			});
		}
		 function devicedetailmodalcall(){
			 
				$('#devicesdetail').modal('show');
				//alert("modal called");

			};
		function deviceregistrationmodalcall(){
				 
				$('#devicesregistration').modal('show');
				//alert("modal called");

			};
			
			
			function adddevicecall(){
				
				//alert(clinicnamefordeviceregistration);
				//var ser=$('#deviceregistration').serialize();
					//var myobject={'clinicname' :clinicnamefordeviceregistration,'clinicid':clinicidfordevicemodal}
				$.ajax({
					url : 'DeviceServ',
					type : 'post',
					dataType : 'json',
					data :$('#deviceregistration').serialize()+ "&clinicname=" + clinicnamefordeviceregistration + "&clinicid=" + clinicidfordevicemodal,
					/* data:{
						'clinicname' :clinicnamefordeviceregistration,
						'clinicid':clinicidfordevicemodal
						$('#deviceregistration').serialize()),
					
						}, */
					
					
					success : function(data) {
						
					 set=data.success.toString();
					 alert("Device registered Successfully !!");
					},
						error: function(e){
							set=data.success.toString();
							 alert("some error with the server but device registered!! ");}
						

			
			});
			}
			
		function modalclose(){
			$('#lightboxform').modal('hide');
			$('#devicesregistration').modal('hide');
			$('#devicesdetail').modal('hide');
			$('#EditClinic').modal('hide');
			$("#formedit").modal('hide');
		    		
			//$.modal.close();
		}
		
		function enabledisablecall(ob){
		
			imeinumber = $(ob).parents("tr").find("td:nth-child(2)").text();
			str="";
			
			//alert(device_status);
			//alert(clinicidfordevicemodal);
		 $.ajax({
			url : 'enabledisabledeviceServ',
			type : 'GET',
			dataType : 'json',
			contentType : 'application/json',

			data : {
				'transfertoenabledisableserv' : clinicidfordevicemodal,
				'imeinumber':imeinumber,
				'device_status':device_status,
				
			},
			success : function(data) 
			{
				success=data.status.toString();
				//alert(success);
				if(success==1){
				modalclose();
				alert("Device Status Changed Successfully");}
				else
					{
					
					alert("Device Status Change Unsuccessfull");
					}
				
				
				//devicedetailclickfunction(o);
				
					 
					
			
			},
			error : function(){alert("failure");}
			
		});
 		}
		
		
	</script>

</body>
<%
	} else {
%>
<%@include file="ecgviewer.jsp"%>
<%
	}
%>
<%
	} else {
%>
<%@ include file="signin.jsp"%>
<%
	}
%>
</html>

