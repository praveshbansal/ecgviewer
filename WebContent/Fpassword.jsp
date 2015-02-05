<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<meta charset="utf-8">
<title>Forgot Password - S.M.A.R.T.S</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<!-- Le styles -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">

<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
	background-repeat: no-repeat;
}

.form-signin {
	max-width: 300px;
	padding: 19px 29px 29px;
	margin: 0 auto 20px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-signin .form-signin-heading,.form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin input[type="text"],.form-signin input[type="password"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}
</style>
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">


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
</head>


<body>
	<div class="container">

		<form class="form-signin" id="fpassform" name="fpassform" onsubmit="return false">
			<h2 class="form-signin-heading">
				<font color="#737CA1">Forgot Password</font>
			</h2>

			<input type="text" class="input-block-level" placeholder="Clinic Id"
				id ="clinicid" name="clinicid" required>


			<button class="btn btn-medium btn-success" id="subm" name="subm" onClick="emptycall()" data-loading-text="Loading...." autocomplete="off">Submit</button>
			<a href="signin.jsp">Back</a>
			
			</form>

	</div>
	<!-- /container -->

<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
    
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> 
    <script type="text/javascript">
    
    function emptycall(){
    if(document.getElementById("clinicid").value==""){}
    else {ForgetPasswordcall();}
    	//
    }
    
	function ForgetPasswordcall(){
		
		//alert(clinicnamefordeviceregistration);
		//var ser=$('#deviceregistration').serialize();
			//var myobject={'clinicname' :clinicnamefordeviceregistration,'clinicid':clinicidfordevicemodal}
			
			//$('#subm').button('loading');
			$("#subm").text('Loading');
		$.ajax({
			
			url : 'FpassServ',
			type : 'post',
			dataType : 'json',
			data :$('#fpassform').serialize(),
			
			
			success : function(data) {
				set=data.success.toString();
				//alert(set);
				if(set==1){
				alert("Email Sent to the Registered Clinic Id !! ");
				$('#clinicid').val('');
				window.location.href = 'signin.jsp';
				$("#subm").text('Submit');
				
				}
				
				
				else{
					$("#subm").text('Submit');
						
					alert("Clinic ID Does not exist !!")
				}
			 
			},
				error: function(e){
					$("#subm").text('Submit');
					
					alert("some error with the server !! ");
					
				}
				

	
	});
	}

    
    </script>

</body>
</html>