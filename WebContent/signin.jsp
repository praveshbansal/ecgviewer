
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>
<meta charset="utf-8">
<title>Sign in - HEALTH</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
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

		<form class="form-signin" action="SigninServ" method="post">
			<img src="assets/ico/favicon-160.png" alt="Welcome" align="top"
				style="margin: 5px 50px"> <input type="text"
				class="input-block-level" placeholder="User Name" name="uid"
				required> <input type="password" class="input-block-level"
				placeholder="Password" name="password" required>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="Fpassword.jsp"><font color="#737CA1" size="3">Forgot
					Password</font></a><br>
			<br>

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="submit" class="form-control btn btn-success ">Sign
				in</button>
		</form>

	</div>
	<!-- /container -->


</body>
</html>
