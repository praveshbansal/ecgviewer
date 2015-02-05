<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="en">
<% if(session.getAttribute("EName")!=null)
	 {
	if(session.getAttribute("Role").equals("1"))
	  {
	 %>
    <head>
    
    <meta charset="utf-8">
    <title>Clinic Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
     <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="assets/css/docs.css" rel="stylesheet">
    

<!--- favicon -->
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


    <style type="text/css">
      body {
        padding-top: 30px;
        padding-left:-10px;
        padding-bottom: 40px;
        
      }
      .sidebar-nav {
        padding: 9px 0;
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
    </style>
    <link href="bootstrap-responsive.css" rel="stylesheet">

   <script>
   function createXMLHttpRequest(){
	   // See http://en.wikipedia.org/wiki/XMLHttpRequest
	   // Provide the XMLHttpRequest class for IE 5.x-6.x:
	   if( typeof XMLHttpRequest == "undefined" ) XMLHttpRequest = function() {
	     try { return new ActiveXObject("Msxml2.XMLHTTP.6.0"); } catch(e) {}
	     try { return new ActiveXObject("Msxml2.XMLHTTP.3.0"); } catch(e) {}
	     try { return new ActiveXObject("Msxml2.XMLHTTP"); } catch(e) {}
	     try { return new ActiveXObject("Microsoft.XMLHTTP"); } catch(e) {}
	     throw new Error( "This browser does not support XMLHttpRequest." );
	   };
	   return new XMLHttpRequest();
	 }

	 var AJAX = createXMLHttpRequest();
	 $(function(){
			$('#reg').on('click', function(e){
			    e.preventDefault();
				$('#reg').button('loading');
			    $.ajax({
			           url: 'RegServ',
			           type: 'post',
			           data:$('#clinicreg').serialize() ,
			           success: function(data){
							var obj = JSON.parse(data);
							if((obj.register)=="success") {
								bootbox.alert('Clinic Registered Successfully');
								$('#oname').val('');
								$('#aname').val('');
								$('#address').val('');
								$('#city').val('');
								$('#mobile').val('');
								$('#anumber').val('');
								$('#emailid').val('');
								$('#aemail').val('');
								$('#clinicid').val('');
								$('#pass').val('');
							}
			
							
						}, error: function(){
			        	   bootbox.alert('Problem in server.Contact Admin');
				           $('#reg').button('reset');
						}
			       });
			   });
				
		});// End of Main
			   
   </script> 


  </head>

  <body data-spy="scroll" data-target=".bs-docs-sidebar" >

    <div class="navbar navbar-fixed-top">
	      <div class="navbar-inner" >
	        <div class="container-fluid" >
			        <p class="nav navbar-text pull-left"> <font size="4" color="">Jio Ecg</font>
			        <font size="4" style="color:black;margin-left:500px;bottom-padding:0px ;">Admin</font>
	              
			         <%-- <%if(session.getAttribute("Role").equals("1"))
		    	   {%>
		        <div class="nav navbar-text pull-center">
		           <p class="nav navbar-text pull-center" align="center"> <font size="4" color="" ><a href="admin.jsp">Admin</a></font>	           
		            </div>
		        <%} %> --%>
				         <div class="nav-collapse collapse">
							  <p class="nav navbar-text pull-right  ">Logged in As <a href="#" class="navbar-link"><%=session.getAttribute("EName") %></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="out.jsp" class="navbar-link">Log Out</a></p>
						 </div>
			</div>      
	      </div>
	</div>



<div class ="container-fluid">

						<div class="row">
												
							  <div class="span3 bs-docs-sidebar ">
								          <ul class="nav nav-list bs-docs-sidenav ">
								   			  <li ><a href="ecgviewer.jsp"><i class="icon-chevron-right"></i>ECG Results</a></li>
								          	  <li class="active"><a href="#"><i class="icon-chevron-right"></i>Register Clinic</a></li>
								              <li><a href="registeredclinics.jsp"><i class="icon-chevron-right"></i>Registered Clinics</a></li>
								              </ul>
								      	</div>
							 	 
							<!-- Form Name -->
							 
							 
							 <form class="form-horizontal" id="clinicreg" onsubmit="return false">
							 
							<fieldset>
							
							<!-- Form Name -->
							<legend>Clinic Registration</legend>
							<!-- <div><label class="control-group">**Mandatory Fields</label></div>
							 -->
							
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
										<input id="clinicid" name="clinicid" placeholder="Clinic ID" class="input-xlarge" required="" type="text" >
									</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="pass">Password**</label>
									<div class="controls">
										<input id="pass" name="pass" placeholder="Password" class="input-xlarge" required="" type="text" >
									</div>
							</div>
							
							<div class="control-group">
							  <label class="control-label" for="reg"></label>
							  	<div class="controls">
							    	<button id="reg" name="reg" class="btn btn-success" data-loading-text="Registering..." onclick="addcliniccall()">Register</button>
							    	<button class="btn btn-danger"  type="reset">Reset</button>     
								</div>
							</div>    
							
							 
							
							</fieldset>
							 
							 </form>
							 
							 
							 
        				</div>
</div><!--/span-->
      

      <hr>

      <div id="footer" class="container">
	    <nav class="navbar navbar-default navbar-fixed-bottom">
	        <div class="navbar-inner navbar-content-center">
	            <p class="text-muted credit"><font color="#737CA1" size="3">&copy; Reliance Jio Cloud Health Project.</font></p>
	        </div>
	    </nav>
	  </div><!--/.fluid-container-->
	  	  
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap-transition.js"></script>
    <script src="assets/js/bootstrap-alert.js"></script>
    <script src="assets/js/bootstrap-modal.js"></script>
    <script src="assets/js/bootstrap-tab.js"></script>
    <script src="assets/js/bootstrap-tooltip.js"></script>
    <script src="assets/js/bootstrap-popover.js"></script>
    <script src="assets/js/bootstrap-button.js"></script>
    <script src="assets/js/bootstrap-collapse.js"></script>
    <script src="assets/js/bootstrap-typeahead.js"></script>
    <script src="assets/js/bootstrap-timepicker.js"></script>
    <script src="assets/js/bootstrap-timepicker.min.js"></script>
    <script src="assets/js/google-code-prettify/prettify.js"></script>
    <script src="assets/js/bootbox.min.js"></script>
    <script src="assets/js/application.js"></script>
    <script type="text/javascript">
    
	function addcliniccall(){
		
		//alert(clinicnamefordeviceregistration);
		//var ser=$('#deviceregistration').serialize();
			//var myobject={'clinicname' :clinicnamefordeviceregistration,'clinicid':clinicidfordevicemodal}
		$.ajax({
			
			url : 'RegServ',
			type : 'get',
			dataType : 'json',
			data :$('#clinicreg').serialize(),
			
			
			success : function(data) {
				set=data.success.toString();
				//alert(set);
				if(set==1){
				alert("Clinic registered!! ");
				$('#oname').val('');
				$('#aname').val('');
				$('#address').val('');
				$('#city').val('');
				$('#mobile').val('');
				$('#anumber').val('');
				$('#emailid').val('');
				$('#aemail').val('');
				$('#clinicid').val('');
				$('#pass').val('');}
				
				else{
					
					alert("Clinic Already Registerd !!")
				}
			 
			},
				error: function(e){
					
					alert("some error with the server !! ");
					
				}
				

	
	});
	}

    
    </script>
    

  </body>
  <%}
	  else
	  {%>
<%@include file="ecgviewer.jsp" %>
	 <%} %>
   <%}
	 else
	 {
		%>
	<%@ include file="signin.jsp" %>
	<%
	 }
	 %>
</html>

