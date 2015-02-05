<%@page import="com.rjil.jio.nasan.wscall.WSCall"%>
<%@page import="org.codehaus.jettison.json.JSONObject"%>
<%@page import="org.codehaus.jettison.json.JSONArray"%>
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
	    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">    
	    <script src="jquery.js"></script>
	    
	    <meta charset="utf-8">
	    <title>ECG Viewer</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="description" content="">
	    <meta name="author" content="">
	
	    <!-- Le styles -->
	     <link href="assets/css/bootstrap.css" rel="stylesheet">
	    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
	    <link href="assets/css/docs.css" rel="stylesheet">
	    <link href="assets/css/bootstrap-timepicker.css" rel="stylesheet">
	    <link href="assets/css/bootstrap-timepicker.min.css" rel="stylesheet">
	    <link href="assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
	    <link href="assets/js/google-code-prettify/prettify.css" rel="stylesheet">
	
	    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	    <!--[if lt IE 9]>
	      <script src="assets/js/html5shiv.js"></script>
	    <![endif]-->
	    <script src="assets/js/html5shiv.js"></script>
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

	
	    <style type="text/css">
	      body {
	        padding-top: 30px;
	        padding-bottom: 40px;
			padding-left: 20px;
	        padding-right: 0px;
	        
	      }
	      .sidebar-nav {
	        padding: 0px 0;
	      }
	      .navbar-default{
	      background:#A8A8A8;
	      border-color: #E7E7E7;
	     
	      }
	
	      @media (max-width: 980px) {
	        /* Enable use of floated navbar text */
	        .navbar-text.pull-right {
	          float: inherit;
	          padding-left: 0px;
	          padding-right: 20px;
	          padding-bottom: 20px;
	        }
	      }
	      
	      @media (max-width: 980px) {
	        /* Enable use of floated navbar text */
	        .navbar-text.pull-left {
	          float: inherit;
	          padding-left: 0px;
	          padding-right: 5px;
	          padding-bottom: 20px;
	        }
	      }
	      
	      @media (min-width: 980px) {
	    .pull-center {
	        text-align: center;
	        padding-left: 550px;
	    }
	    td a{width:100%;display:block;
	    text-decoration: underline;}
	    
	    .pull-center > .nav {
			
	        float:right;
	        display:inline-block;
	        *display: inline; *zoom: 1;
	        height: 16px;
	    }
	}
	table.sortable th:not(.sorttable_sorted):not(.sorttable_sorted_reverse):not(.sorttable_nosort):after { 
    content: " \25B4\25BE" 
}
	    </style>
	    <link href="bootstrap-responsive.css" rel="stylesheet">
	
	   <script src="html5shiv.js"></script>
	<script src="right.js" language="javascript"></script>
	    <script src="sorttable.js"></script>
	    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link href="assets/css/datatable.css" rel="stylesheet">
<script src="assets/js/datatable.js"></script>
	    

</head>  
<body > 
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
					     
					     <a href="out.jsp" class="navbar-link">Log Out</a>
					     
				  </p>
	            </div>
	          </div>      
	      </div>
	    </div>




<div class="row-fluid">
	        <div class="span3 bs-docs-sidebar ">
	          <ul class="nav nav-list bs-docs-sidenav ">
	          <li class="active"><a href="#"><i class="icon-chevron-right"></i>ECG Results</a></li>
	          <li><a href="registration.jsp"><i class="icon-chevron-right"></i>Register Clinic</a></li>
	          <li><a href="registeredclinics.jsp"><i class="icon-chevron-right"></i>Registered Clinic</a></li>
	          
       
	        </ul>
	      </div>
	      </div>
	 
	 
<div class="container-fluid ">


<legend>Ecg Viewer</legend>
<table id="myTable" class="table table-bordered table-striped" >

        <thead>  
          <tr>  
            <th> Clinic Id</th>
		<th >Patient Id</th>
		<th >Patient Name</th>
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
                array=call.getClinicData(cid1,"1");
                String clinic_id = "";
        		String patient_name = "";
        		String patient_id = "";
        		String sex = "";
        		String age = "";
        		String jio_id = "";
        		String contact_number = "";
        		String link = "";
        		String datetime = "",date="",time="";
                
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
        					date=datetime.substring(0,10);
        					time=datetime.substring(10,18); 
        					//System.out.println(patient_name);
        					
        					//System.out.println(link);
        					
	/* Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jioecg","root","root");
	Statement stmt=con.createStatement();
	String cid1 = (String) session.getAttribute("Clinic_id1");
	String sql="SELECT * from jioecg_upload ";
	ResultSet res = stmt.executeQuery(sql); */
	%>

<%/* while(res.next())
	{
		String clinic_id = res.getString("clinic_id");
		String patient_name = res.getString("patient_name");
		String patient_id = res.getString("patient_id");
		String sex = res.getString("sex");
		String age = res.getString("age");
		String jio_id = res.getString("jio_id");
		String contact_number = res.getString("contact_number");
		String link = res.getString("linkdownload");
		String datetime = res.getString("ecgtest_date");
		 */
	%>    
 
            
          <tr>
     <td><%= clinic_id %></td>
	<td><%= patient_id %></td>
	<td><%= patient_name %></td>
	<td><%= sex %></td>
	<td><%= age %></td>
	<td><%= jio_id %></td>
	<td><%=date %></td>
	<td><%=time %></td>
	<td><%=contact_number %></td>
	
	<td class ="underline" ><a href="<%= link %>" onclick="window.open(this.href,'_blank');return false;">Click Here</a></td>
	          </tr>
	           
	        <% }/* }
	stmt.close();
	res.close();
	
		con.close(); */
	%>
        </tbody>  
      </table>  
	  </div>
	  
	  
	  <hr>
	
	      <div id="footer" class="container">
	    <nav class="navbar navbar-default navbar-fixed-bottom">
	        <div class="navbar-inner navbar-content-center">
	            <p class="text-muted credit"><font color="#737CA1" size="3">&copy; Reliance Jio Cloud Health Project.</font></p>
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
	<%@ include file="signin.jsp" %>
	<%
	 }
	 %>
	</html>

