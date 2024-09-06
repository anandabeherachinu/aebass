<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en ">
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css" />
<!-- Custom styles for this template -->
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/base-responsive.css" />
<link rel="stylesheet" href="css/animate.min.css" />
<link rel="stylesheet" href="css/slicknav.min.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<script src="vendor/charts/Chart.js"></script>
<script src="vendor/charts/moment.min.js"></script>
<script src="vendor/charts/Chart.min.js"></script>
<script src="vendor/charts/utils.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 -->
<style>
body {
	background-color: #fff;
}

.b-leftmenu ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

.b-leftmenu ul li {
	/* Sub Menu */
	
}

.b-leftmenu ul li a {
	display: block;
	background: #ebebeb;
	padding: 10px 15px;
	color: #333;
	text-decoration: none;
	-webkit-transition: 0.2s linear;
	-moz-transition: 0.2s linear;
	-ms-transition: 0.2s linear;
	-o-transition: 0.2s linear;
	transition: 0.2s linear;
}

.b-leftmenu ul li a:hover {
	background: #f8f8f8;
	color: #515151;
}

.b-leftmenu ul li a .fa {
	width: 16px;
	text-align: center;
	margin-right: 5px;
	float: right;
}

.b-leftmenu ul ul {
	background-color: #ebebeb;
}

.b-leftmenu .sub-menu ul li a {
	background: #f8f8f8;
	border-left: 4px solid transparent;
	padding: 10px 25px;
}

.b-leftmenu .sub-sub-menu ul li a {
	padding: 10px 20px 10px 40px;
}

.b-leftmenu a.b-newpage:hover {
	background: #ebebeb;
	border-left: 4px solid #3498db;
}

.hide {
	display: none !important
}
</style>
<script src="js/popper.min.js"></script>
<script src="js/hash.js"></script>
<script src="js/jquery.base64.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.js"></script>

<script src="js/jquery3.6.sha256.js"></script>

<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script> -->
<script type="text/javascript" src="scripts/jqueryslidemenu.js"></script>
<script type="text/javascript" src="js/styleswitch.js"></script>
<script src="js/jquery-1.8.2.js"></script>
<script src="js/jquery-ui.js"></script>

<!-- <script type="text/javascript" src="scripts/jquery.cookie.js"></script>
 --><script type="text/javascript">
            function add(){
				  var a=navigator.onLine;
				  if(!a){
					  window.location='globalerror.jsp';
				  }
			  }
           </script>
<!-- <script>
			$(function() {
				$("#dateOfBirth").datepicker({
					changeMonth : true,
					changeYear : true
				});
			});
		  </script> -->
<script type="text/javascript" src="scripts/verticaltabs.pack.js"></script>
<script type="text/javascript">
            	$(document).ready(function(){
            		var browsername=navigator.appName;
	            	if (browsername.indexOf("Microsoft")!=-1) {
		            	//alert( $.browser.version );
		            	browsername="MSIE";
		            	if ($.browser.version.indexOf("6.")!=-1 ||$.browser.version.indexOf("7.")!=-1) {
		            	alert("You are using an out dated browser please upgrade your browser to Internet Explore 8,9,Google Chrome 20.0 above, Mozilla Firefox",true);
		            	};
	            	}
            	});
         </script>

<!-- <script src="js/hash.js"></script>
		<script src="js/jquery.base64.min.js"></script>-->
<!-- <script type="text/javascript"> 
 console.log("abc");
			$(document).ready(function()
			{
				console.log("abc", true);
				alert("bjhkjhjhk",true);
				$("#img1").click(function()
			    {
					// alert("bjhkj",true);
					 $.get("captcha.jpg", function(data, status)
			        {
			              document.getElementById("captcha_id").src='captcha.jpg?p='+Math.random();
			        });
			    });
			});
</script> -->
<script>
function disableBtn() 
{
    document.getElementById("loginid").disabled = true;
    document.getElementById("password").disabled = true;
   document.getElementById("captcha_id").disabled = true; 
}
</script>

</head>

<script type="text/javascript">
$(document).ready(function()
{

    
    $("#img1").click(function() {
    	/* alert("enter");
console.log("enter"); */
        var timestamp = (new Date()).getTime();
        var newSrc = $("#captcha_id").attr("src").split("?");
     //  $('#captchaImage').attr('src', '').attr('src', 'Captcha.jpg');
        newSrc = newSrc[0] + "?" + timestamp;
        $("#captcha_id").attr("src", newSrc);
        $("#captcha_id").slideDown("fast");

     });
    
    
    history.replaceState(null, document.title, location.pathname+"#!/");
    history.pushState(null, document.title, location.pathname);
    window.addEventListener('popstate', function(event) {
    history.pushState(null, document.title, location.pathname);
    }, false); 
  
});
</script>
<%
	Random rand = new Random();
	int n1 = rand.nextInt(900000000) + 100000000;
	//System.out.println("n1:::::::::::::::::::"+n1);
%>

<%
	session.setAttribute("n1", n1);
%>

<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private, no-cache, no-store, must-revalidate, proxy-revalidate");
	response.setDateHeader("Expires", 0);
%>
<%
	response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
	response.setHeader("Cache-Control", "must-revalidate");
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
%>

<body>
	<script src="js/wz_tooltip.js" type="text/javascript"></script>
	<!-- external -->
	<!-- <script src="http://cdn.zingchart.com/zingchart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.zingchart.com/zingchart.jquery.min.js"></script> -->


	<div style="display: none;">
		<h1>Heading1</h1>
		<h2>Heading2</h2>
	</div>

	<!-- Accessibility -->
<!-- 	<div class="container d-flex clearfix" id="b-accessibility" style="background-color: beige;">
		<div class="b-ministryname">
			<div
				class="text-right d-inline-block font-weight-bold b-acc-goi pr-sm-2">

			</div>
			<div class="d-inline-block font-weight-bold b-acc-ministry pl-sm-2">
								<span>Government of India</span>

			</div>
		</div>


		<div class="ml-auto d-flex b-acc-icons">
			<div class="align-self-center">

				<div class="d-inline-block h-100 px-3">
					<img src="images/icons/ico-site-search.png" alt="site search icon"
						title="Site search" class="dropdown-toggle" data-toggle="dropdown"
						style="cursor: pointer;">

					<div class="dropdown-menu p-0 border-0 b-search">
						<label for="site-search" style="display: none;">Site
							search</label> <input type="text"
							class="form-control float-left b-site-search" id="site-search"
							placeholder="Search" style="width: 150px; border-radius: 0;">
						<div class="input-group-btn float-left">
							<button class="btn" type="submit"
								style="border-radius: 0; background: #505050; color: white; box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0);">
								<span style="display: none;">Search</span> <span
									class="fas fa-search"></span>
							</button>
						</div>
					</div>
				</div>

				<div class="d-inline-block h-100 px-3 dropdown">
					<img src="images/icons/ico-social.png" alt="social sites links"
						title="Social links" class="dropdown-toggle"
						data-toggle="dropdown" style="cursor: pointer;">

					<div class="dropdown-menu b-social-dropdown"
						style="min-width: 50px; width: 50px">
						<a href="javascript:void(0)" class="dropdown-item"> <span
							style="display: none;">Facebook link</span><span
							class="fab fa-facebook-f"></span>
						</a> <a href="javascript:void(0);" class="dropdown-item"> <span
							style="display: none;">Twitter link</span><span
							class="fab fa-twitter"></span>
						</a> <a href="javascript:void(0)" class="dropdown-item"> <span
							style="display: none;">Youtube link</span><span
							class="fab fa-youtube"></span>
						</a>
					</div>
				</div>


				<div class="d-inline-block h-100 px-3">
					<a href="#b-homedb" class="align-self-center b-skiptomain"
						title="Skip to main content"> <img
						src="images/icons/ico-skip.png" alt="skip to main content icon">
					</a>
				</div>

				<div class="d-inline-block h-100 px-3">
					<img src="images/icons/ico-accessibility.png"
						alt="accessibility icon" title="Accessibility Dropdown"
						class="dropdown-toggle" data-toggle="dropdown"
						style="cursor: pointer;">

					<div class="dropdown-menu b-accessibility-dropdown"
						style="min-width: 50px; width: 50px">
						<a href="javascript:void(0);" class="dropdown-item"
							title="Increase font size"> <span class="font-weight-bold">
								A<sup>+</sup>
						</span>
						</a> <a href="javascript:void(0)" class="dropdown-item"
							title="Reset font size"> <span class="font-weight-bold">
								A </span>
						</a> <a href="javascript:void(0);" class="dropdown-item"
							title="Decrease font size"> <span class="font-weight-bold">
								A<sup>-</sup>
						</span>
						</a> <a href="javascript:void(0)" class="dropdown-item bg-dark"
							title="High contrast"> <span
							class="font-weight-bold text-white"> A </span>
						</a>
					</div>
				</div>

				<div class="d-inline-block h-100 px-3">
					<a href="site-map.html" title="Sitemap"> <img
						src="images/icons/ico-sitemap.png" alt="sitemap icon">
					</a>
				</div>


			</div>

		</div>

	</div> -->


	<!-- Header -->
	<div class="row" >
	<div class="col-lg-6 d-flex">
   
			<img src="images/sctevt1.png"
				class=""
				title="National Emblem of India" alt="emblem of india logo" style="max-width: 520px;">
		
		</div>
		<div class="float-left d-flex h-200">
			<h2 class="align-self-center pl-3 b-appname">
				<span class="font-weight-bold">Aadhaar Enabled Biometric
					Attendance System for Students</span> <br>
				<span class="b-appfullname"> </span>
			</h2>
		</div>
		</div>
		
	
<!-- 	<div class="container clearfix" id="b-header">
		<div class="float-left d-flex h-100">
			<img src="images/sctevt1.png"
				class="align-self-center b-emblem-image"
				title="National Emblem of India" alt="emblem of india logo">
		</div>

		<div class="float-left d-flex h-200">
			<h2 class="align-self-center pl-3 b-appname">
				<span class="font-weight-bold">Aadhaar Enabled Biometric
					Attendance System for Students</span> <br>
				<span class="b-appfullname"> </span>
			</h2>
		</div>
	</div> -->

	<style type="text/css">
.bar1, .bar2, .bar3 {
	width: 25px;
	height: 3px;
	background-color: #fff;
	margin: 5px 0;
	transition: 0.4s;
}

.change .bar1 {
	-webkit-transform: rotate(-45deg) translate(-5px, 5px);
	transform: rotate(-45deg) translate(-5px, 5px);
}

.change .bar2 {
	opacity: 0;
}

.change .bar3 {
	-webkit-transform: rotate(45deg) translate(-5px, -7px);
	transform: rotate(45deg) translate(-5px, -7px);
}
</style>


	<!-- Global Navigation -->
	<div class="globalnav-bg">
		<div class="container">
			<nav class="navbar navbar-expand-sm navbar-dark px-0">
				<div class="d-flex w-100 b-nav-mobile">
					<button class="navbar-toggler align-self-center b-btn-toggler"
						type="button" data-toggle="collapse"
						data-target="#collapsibleNavbar" onclick="myFunction(this)">
						<span style="display: none;">Menu</span>
						<div>
							<div class="bar1"></div>
							<div class="bar2"></div>
							<div class="bar3"></div>
						</div>
					</button>
					<!-- <button class="btn btn-outline-light align-self-center ml-auto b-btn-login" type="button" data-toggle="modal" data-target="#login-modal">
						Log In
					</button>  -->
				</div>

				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav main-menu d-flex">
						<li class="nav-item d-block"><a href="index.html"
							class="nav-link active">Home</a></li>
						<li class="nav-item d-block"><a href="inner.html"
							class="nav-link">Advisories</a></li>
						<li class="nav-item d-block"><a href="contactus.html"
							class="nav-link">Contact Us</a></li>
						<!-- <li class="nav-item d-block ml-auto b-loginbut" data-toggle="modal" data-target="#login-modal">
							<a class="nav-link" href="javascript:void(0);">Log In</a>
						</li>   -->
					</ul>
				</div>

			</nav>
		</div>
	</div>

	<script>
function myFunction(x) {
  x.classList.toggle("change");
}
</script>



	<!-- Background -->



	<div class="b-bg-image py-5" style="padding-bottom: 200px !important">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 d-flex">
					<div class="align-self-center pr-5">
						<h1 class="text-right mt-5 b-left-head">
							Aadhaar Enabled Biometric Attendance System for Students (AEBASS)
							<br>
						</h1>

					</div>
				</div>


				<%
					String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
					ArrayList al = new ArrayList();
					int strLen = str.length() - 1;
					for (int i = 0; i < 8; i++) {
						Random r = new Random();
						int n = r.nextInt(strLen);
						al.add(str.charAt(n));
					}

					StringBuilder sb = new StringBuilder();
					for (Object s : al) {
						sb.append(s);
					}
					String salt = sb.toString();
					Date dt = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss");
					Random r = new Random();
					int x = r.nextInt(1000);
					String sdate = sdf.format(dt);
					salt = x + salt + sdate;
					session.setAttribute("salt", salt);
				%>
				<c:set var="salt" value="<%=salt%>" scope="page"></c:set>

				<div class="col-lg-6 b-login-sec" style=" margin-top: -46px;">
					<div class="d-block px-5 pt-5 pb-4 border-bottom-0 b-login-w">
						<h2 class="b-login-head">Log In</h2>
					</div>
					<!-- <div><a href="demo.html">demo</a></div>
<div><a href="ananda.html">demo</a></div> -->

					<div class="">
						<form id="admin-login" action="login.html" autocomplete="off"
							method="post" class="px-5 b-login-w" onsubmit="submitForm()">
							<input type="hidden" name="udata"
								value="<c:out value="${salt}"/>" id="udata">
							<div>
								<span
									style="font-size: 13px; color: red; position: absolute; margin-top: -11px">
									${message} </span> <span
									style="margin-left: 0px; font-size: 14px; color: red;">
									${adminerrormessage} </span> <span
									style="margin-left: 0px; font-size: 14px; color: green;">
									${adminlogoutmessage} </span>
							</div>
							<div class="form-group ">
								<label for="login-email-1" class="text-white" style=" font-size: 20px; " >User Id:</label> <input
									type="text" class="form-control" id="loginid" name="loginid"
									placeholder="User ID" onpaste="return false;"
									onCopy="return false" onCut="return false"
									onDrag="return false" onDrop="return false" required="true"
									class="otherfield" autocomplete="off" >
							</div>
							<div class="form-group">
								<label for="login-pwd-1" class="text-white" style=" font-size: 20px; ">Password:</label> <input
									type="password" class="form-control" name="password"
									id="password" placeholder="Password" onpaste="return false;"
									onCopy="return false" onCut="return false"
									onDrag="return false" onDrop="return false" required="true"
									class="otherfield" autocomplete="off" />
							</div>
							<!-- <div class="form-group custom-control custom-checkbox">
								<input class="custom-control-input" id="login-rem-1" type="checkbox" name="remember"> 
								<label class="custom-control-label text-white" for="login-rem-1">Remember me</label>
							</div> -->
							<div class="form-group">
								<img style="float: left;" id="captcha_id" name="imgCaptcha"
									src="captcha.jpg" width="150" height="35" class="center-block">
								<!-- <img style="float: right; margin-right: 55px; cursor: pointer;"
									src="images/refresh.png" height="35" width="35" id="img1"
									class="center-block"> -->
<img style="float:right;margin-right: 55px;cursor: pointer;" src="images/refresh.png" height="35" width="35" id="img1" class="center-block"> 
									
									 <input style="margin-top: 4px;"
									type="text" name="captcha" onpaste="return false;"
									onCopy="return false" onCut="return false"
									onDrag="return false" onDrop="return false"
									placeholder="Enter Captcha Code" required="true" id="password" />

							</div>

							<!-- <p class="text-right b-notreg ">Don't have an account? <a href="">Sign Up</a></p> -->
							<div class="text-center py-4">
								<button type="submit" class="btn btn-primary b-btn">Log
									In</button>
							</div>
							<!-- 	<fieldset class="form-group"
									style="margin-left: 0px; margin-right: 0px;">
									<div class="form-group row" style="margin: 0px;">
										<label class="col-sm-4 col-form-label"> </label> <label
											class="col-sm-6 col-form-label"> <input type="submit"
											name="submit" value="Submit" class="submit-btn" /> <input
											type="reset" name="reset" value="Cancel" class="cancel-btn" />
										</label>
									</div>
								</fieldset> -->

						</form>
					</div>
				</div>

			</div>
		</div>
	</div>











	<!-- Dashboard -->
	<div class="mt-5" id="b-homedb"
		style="position: relative; top: -170px; margin-bottom: -110px;">
		<div class="container">
			<div class="row text-center">
				<!-- <h2 class="col-md-12">Figures tell the story</h2> -->
				<div class="col-lg-4 p-4">
					<div class="bg-light py-4 b-dbcard">
						<p>
							<span class="fas fa-shield-alt" style="font-size: 40px;"></span>
						</p>
						<h3 style="font-size: 16px;">
							<strong>No. of Advisories</strong>
						</h3>
						<div class="text-left ">
							<p class="px-5">
								Last year <span class="float-right">0</span>
							</p>

							<p class="px-5">
								Current year <span class="float-right">0</span>
							</p>
						</div>
					</div>
				</div>



				<div class="col-lg-4 p-4">
					<div class="bg-light py-4 b-dbcard">
						<p>
							<span class="fa fa-exclamation-triangle" style="font-size: 40px"></span>
						</p>
						<h3 style="font-size: 16px;">
							<strong>Security Incidents</strong>
						</h3>
						<div class="text-left ">
							<p class="px-5">
								Last year <span class="float-right">0</span>
							</p>

							<p class="px-5">
								Current year <span class="float-right">0</span>
							</p>

						</div>

					</div>
				</div>

				<div class="col-lg-4 p-4">
					<div class="bg-light py-4 b-dbcard">
						<p>
							<span class="fa fa-network-wired" style="font-size: 40px"></span>
						</p>
						<h3 style="font-size: 16px;">
							<strong>Networks Monitored</strong>
						</h3>
						<div class="text-left ">
							<p class="px-5">
								Last year <span class="float-right">0</span>
							</p>

							<p class="px-5">
								Current year <span class="float-right">0</span>
							</p>

						</div>
					</div>
				</div>
				<!-- 	<div>
						<iframe width="560" height="315"
								src="https://www.youtube.com/embed/stJGFAD4rJI?si=bgnl7UVKt4PRJcRU"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
								allowfullscreen></iframe>
								</div>
								<div>
								<iframe width="560" height="315"
								src="https://www.youtube.com/embed/stJGFAD4rJI?si=bgnl7UVKt4PRJcRU"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
								allowfullscreen></iframe>
								</div> -->

			</div>
		</div>
	</div>

	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->


		<!-- Page Content -->
		<div id="page-content-wrapper">












	<h4 class="text-center">Daily Trends</h4>


			<!-- Breadcrumb -->
			

			<div class="container-fluid">


				<!-- Charts -->
				<div class="row">


					<div class="col-md-6 p-4">
						<h4 class="text-center">Institute Attendance</h4>
						<h4 class="text-center">10 Highest Attendance</h4>
						<%--             <canvas id="verticalGroupBarChart" width="400" height="300"></canvas>
 --%>
						<canvas id="bar-chart" height="300"></canvas>

					</div>

					<div class="col-md-6 p-4">
						<h4 class="text-center">Institute Attendance</h4>
						<h4 class="text-center">10 Lowest Attendance</h4>

						<canvas id="bar-chart1" height="300"></canvas>
					</div>
					
					</div>
					
				<div class="row">
									<div class="col-md-4 p-4" >
				</div>
					<div class="col-md-4 p-4" style="margin-right=70px;">
						<h4 class="text-center">Today's Overall Attendance</h4>
						<%--        	<canvas id="pieChart1" width="876" height="876" style="display: block; height: 184px; width: 184px;" class="chartjs-render-monitor"></canvas>
 --%>
						<canvas id="pieChart" height="300"></canvas>
					</div>
				<%-- 	<div class="col-md-4 p-4" style="margin-right=70px;">
						<h4 class="text-center">Today's Overall Attendance</h4>
						       	<canvas id="pieChart1" width="876" height="876" style="display: block; height: 184px; width: 184px;" class="chartjs-render-monitor"></canvas>

						<canvas id="pieChart" height="300"></canvas>
<!-- 						<div id="pie-chart"></div>
 -->						
					</div>
					 --%>
<!-- <script>
$('#pie-chart').zingchart({
	  "data": {
	    "type": "pie",
	    "legend": {},
	    "series": [{
	      "values": [5]
	    }, {
	      "values": [10]
	    }, {
	      "values": [15]
	    }]
	  }
	});</script> -->

					<div class="hide">
						<table id="data-table">
							<thead>
								<tr>
									<th>college</th>
									<th>absent</th>
									<th>present</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="s" items="${studentcount}" varStatus="count">
									<tr>
										<td>${s.rollId}</td>
										<td>${s.studentName}</td>
										<td>${s.instituteCode}</td>


										<!-- <td></td> -->

									</tr>
								</c:forEach>
								<!-- Add more rows as needed -->
							</tbody>
						</table>
					</div>
					<div class="hide">
						<table id="data-table1">
							<thead>
								<tr>
									<th>college</th>
									<th>absent</th>
									<th>present</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="s" items="${studentcount}" varStatus="count">
									<tr>
										<td>${s.rollId}</td>
										<td>${s.instituteCode}</td>
										<td>${s.studentName}</td>


										<!-- <td></td> -->

									</tr>
								</c:forEach>
								<!-- Add more rows as needed -->
							</tbody>
						</table>
					</div>
						<div class="hide">
						<table id="data-table5">
							<thead>
								<tr>
									<th>college</th>
									<th>absent</th>
									<th>present</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="s" items="${studentcountabsent}" varStatus="count">
									<tr>
										<td>${s.rollId}</td>
										<td>${s.instituteCode}</td>
										<td>${s.studentName}</td>


										<!-- <td></td> -->

									</tr>
								</c:forEach>
								<!-- Add more rows as needed -->
							</tbody>
						</table>
					</div>
					
					<div class="hide">
						<table id="data-table6">
							<thead>
								<tr>
									<th>college</th>
									<th>absent</th>
									<th>present</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="s" items="${studentcountabsent}" varStatus="count">
									<tr>
										<td>${s.rollId}</td>
										<td>${s.studentName}</td>
										<td>${s.instituteCode}</td>
										


										<!-- <td></td> -->

									</tr>
								</c:forEach>
								<!-- Add more rows as needed -->
							</tbody>
						</table>
					</div>
						<div class="hide" > 
						<table id="data-table7">
							<thead>
								<tr>
									
									<th>absent</th>
									<th>present</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="s" items="${totalstudentcountPercentage}" varStatus="count">
									<tr>
										
										<td>${s.studentName }%</td>
										<td>${s.userName}%</td>
									

									</tr>
								</c:forEach>
								<!-- Add more rows as needed -->
							</tbody>
						</table>
					</div>
					
					<div class="hide">
						<table id="data-table3">
							<c:forEach var="b" items="${totalstudentcountpresent}"
								varStatus="count">
								<tbody>
									<tr>
										<td>${b.studentName}</td>
										<td>${b.userName}%</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
					<div class="hide" >
						<table id="data-table4">
							<c:forEach var="a" items="${totalstudentcountabsent}"
								varStatus="count">
								<tbody>
									<tr>
										<td>${a.studentName}</td>
										<td>${a.userName}%</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>



					</div>
				</div>



			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<script type="text/javascript">

  document.addEventListener("DOMContentLoaded", function () {
      // Get data from the table
      var data = [];
      var tableRows = document.querySelectorAll("#data-table7 tbody tr");
     //var tableRows = document.querySelectorAll("#data-table7");
      alert("tableRows",tableRows);
      console.log("tableRows",tableRows);
      tableRows.forEach(function (row) {
    	  console.log(row.cells[0].innerText,'row.cells')
          var category = row.cells[0].innerText;
          var value = row.cells[1].innerText);
          data.push({ label: category, data: value });
      });
console.log(data[0])
      // Create a pie chart
     var ctx = document.getElementById("pie-chart").getContext("2d");
      var pieChart = new Chart(ctx, {
          type: "pie",
          data: {
              labels: data.map(item => item.label),
              datasets: [{
                  data: data.map(item => item.data),
                  backgroundColor: [
                      'rgba(255, 99, 132, 0.7)',
                      'rgba(54, 162, 235, 0.7)',
                      // Add more colors as needed
                  ],
              }]
          },
          options: {
              responsive: true,
              maintainAspectRatio: true, 
          }
      });
  });
</script>


	<script>
  
  
   document.addEventListener('DOMContentLoaded', function () {
      var table = document.getElementById('data-table');
      var table1 = document.getElementById('data-table1');
      console.log('table'+table);

      var labels = [];
      var labels1 = [];
      var data = [];
      var data1 = [];
       console.log(table.rows);
      // Extract data from the table
      for (var i = 1; i < table.rows.length; i++) {
         labels.push(table.rows[i].cells[0].innerText);
         data.push(parseFloat(table.rows[i].cells[1].innerText));
      }
      for (var i = 1; i < table1.rows.length; i++) {
          labels1.push(table1.rows[i].cells[0].innerText);
          data1.push(parseFloat(table1.rows[i].cells[1].innerText));
       }
      console.log('data'+data);
      console.log('data1'+data1);
      // Create the bar chart
      var ctx = document.getElementById('bar-chart').getContext('2d');
      var chart = new Chart(ctx, {
         type: 'bar',
         data: {
            labels: labels,
            datasets: [{
               label: 'present',
               data: data1,
               backgroundColor: 
	                'rgba(55, 162, 235, 1)'
	            ,
	            borderColor: 
	            	'rgba(54, 162, 235, 2)'
	            ,
	            borderWidth: 1
            },
            {
                label: 'absent',
                data: data,
                backgroundColor: 
                	'rgba(255, 99, 132, 0.7)'
 	            ,
 	            borderColor: 
 	            	'rgba(255, 99, 132, 1)'
 	            ,
 	            borderWidth: 1
             }]
         },
         options: {
 	        scales: {
 	            yAxes: [{
 	                ticks: {
 	                    beginAtZero: true
 	                },
 	                scaleLabel: {
 						display: true,
 						labelString: 'Number Of Student',
 						fontSize: '14',
 					}
 	            }],
 	            xAxes: [{
 	                scaleLabel: {
 						display: true,
 						labelString: 'Institute Name',
 						fontSize: '16',
 					}
 	            }]
 	        }
 	    }
      });
   });
</script>
	<script>
   document.addEventListener('DOMContentLoaded', function () {
      var table = document.getElementById('data-table5');
      var table1 = document.getElementById('data-table6');
      var labels = [];
      var labels1 = [];
      var data = [];
      var data1 = [];
      // Extract data from the table
      for (var i = 1; i < table.rows.length; i++) {
         labels.push(table.rows[i].cells[0].innerText);
         data.push(parseFloat(table.rows[i].cells[1].innerText));
      }
      for (var i = 1; i < table1.rows.length; i++) {
          labels1.push(table1.rows[i].cells[0].innerText);
          data1.push(parseFloat(table1.rows[i].cells[1].innerText));
       }

      // Create the bar chart
      var ctx = document.getElementById('bar-chart1').getContext('2d');
      var chart = new Chart(ctx, {
         type: 'bar',
         data: {
            labels: labels,
            datasets: [{
               label: 'present',
               data: data,
               backgroundColor: 
	                'rgba(55, 162, 235, 1)'
	            ,
	            borderColor: 
	            	'rgba(54, 162, 235, 2)'
	            ,
	            borderWidth: 1
            },
            {
                label: 'absent',
                data: data1,
                backgroundColor: 
                	'rgba(255, 99, 132, 0.7)'
 	            ,
 	            borderColor: 
 	            	'rgba(255, 99, 132, 1)'
 	            ,
 	            borderWidth: 1
             }]
         },
         options: {
 	        scales: {
 	            yAxes: [{
 	                ticks: {
 	                    beginAtZero: true
 	                },
 	                scaleLabel: {
 						display: true,
 						labelString: 'Number Of Student',
 						fontSize: '14',
 					}
 	            }],
 	            xAxes: [{
 	                scaleLabel: {
 						display: true,
 						labelString: 'Institute Name',
 						fontSize: '16',
 					}
 	            }]
 	        }
 	    }
      });
   });
</script>
	<!--     <script>
        // Get the data from the JSTL variable
        
        // Create a bar chart
        var ctx = document.getElementById('myBarChart');
        var dataList = ${studentcount};
        console.log(dataList);
        var myBarChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: dataList.map(function(item, index) {
                    return 'Item ' + (index + 1);
                }),
                datasets: [{
                    label: 'Values',
                    data: dataList,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script> -->
	<script>
  var ctx3 = document.getElementById('verticalGroupBarChartlow');
  var table = document.getElementById('data-table');
  var table1 = document.getElementById('data-table1');
  var labels = [];
  var labels1 = [];
  var data = [];
  var data1 = [];
  // Extract data from the table
  for (var i = 1; i < table.rows.length; i++) {
     labels.push(table.rows[i].cells[0].innerText);
     data.push(parseFloat(table.rows[i].cells[1].innerText));
  }
  for (var i = 1; i < table1.rows.length; i++) {
      labels1.push(table1.rows[i].cells[0].innerText);
      data1.push(parseFloat(table1.rows[i].cells[1].innerText));
   }
if(ctx3) {
	var myChart3 = new Chart(ctx3, {
	    type: 'bar',
	    data: {
	        datasets: [{
	            label: 'Absent',
	            data:data1,
	            backgroundColor: 
	                'rgba(255, 99, 132, 0.2)'
	            ,
	            borderColor: 
	                'rgba(255, 99, 132, 1)'
	            ,
	            borderWidth: 1
	        }, {
	            label: 'Present',
	            data:data,
	            backgroundColor: 
	                'rgba(54, 162, 235, 0.2)'
	            ,
	            borderColor: 
	                'rgba(54, 162, 235, 1)'
	            ,
	            borderWidth: 1
	        }, ]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                },
	                scaleLabel: {
						display: true,
						labelString: 'Production Units (in No.)',
						fontSize: '10',
					}
	            }],
	            xAxes: [{
	                scaleLabel: {
						display: true,
						labelString: 'Institute',
						fontSize: '16',
					}
	            }]
	        }
	    }
	});
} else {

}
</script>


	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/dashboard.js"></script>




	<!----------- Footer ------------>
	<div class="footer-bs">
		<footer class="container">
			<div class="row">
				<div class="row col-md-7 col-sm-12 footer-nav">
					<p class="col-md-12">Quick Links</p>
					<div class="col-sm-6">
						<ul class="list">
<!-- 							 <li><a href="inner.html">Policies</a></li>
 -->							<li><a href="contactus.html">Contact Us</a></li>
							<!--<li><a href="inner.html">Guidelines</a></li> -->
						</ul>
					</div>
					<div class="col-sm-6">
						<ul class="list">
							<!-- <li data-toggle="modal" data-target="#feedback-modal"><a
								href="javascript:void(0)">Feedback</a></li>
							<li><a href="inner.html">Help Centre</a></li>
							<li><a href="javascript:void(0);">About Us</a></li> -->
						</ul>
					</div>
				</div>
				<div class="col-md-3 col-sm-8 footer-social d-flex">
					<div class="d-inline-block align-self-center">
						<p class="bg-light">
							<img src="images/NIC.png" alt="NIC logo">
						</p>
						<p class="bg-light mb-0">
							<img src="images/digital-india.png" alt="digital india logo">
						</p>
					</div>
				</div>
	<!-- 			<div class="vc_column-inner "><div class="wpb_wrapper">
		<div class="gen-list no-border no-bg padding-20 border-radius-none default-list importantLinksWrapper col-two normal-font ">
		<h2 class="heading3"><span class="icon-link"></span> Quick Links</h2>		<ul>
						<li class="  ">
								<a href="https://www.mygov.in/covid-19/" style="" onclick="return confirm('You are being redirected to an external website. Please note that Kendrapara District, Government of Odisha cannot be held responsible for external websites content &amp; privacy policies.');" aria-label="MyGov - COVID 19 - External site that opens in a new window" title="MyGov - COVID 19 - External site that opens in a new window" target="_blank" rel="noopener noreferrer">
								<span class="list-icon -bg  border-radius-round"></span>
								<div class="list-text">MyGov - COVID 19				</div>
								</a>
			 				</li>
								<li class="  ">
								<a href="https://districts.ecourts.gov.in/india/odisha/kendrapara" style="" onclick="return confirm('You are being redirected to an external website. Please note that Kendrapara District, Government of Odisha cannot be held responsible for external websites content &amp; privacy policies.');" aria-label="District Court Kendrapara - External site that opens in a new window" title="District Court Kendrapara - External site that opens in a new window" target="_blank" rel="noopener noreferrer">
								<span class="list-icon -bg  border-radius-round"></span>
								<div class="list-text">District Court Kendrapara				</div>
								</a>
			 				</li>
								<li class="  ">
								<a href="http://www.rtiodisha.in/Districts/17" style="" onclick="return confirm('You are being redirected to an external website. Please note that Kendrapara District, Government of Odisha cannot be held responsible for external websites content &amp; privacy policies.');" aria-label="Right to Information - External site that opens in a new window" title="Right to Information - External site that opens in a new window" target="_blank" rel="noopener noreferrer">
								<span class="list-icon -bg  border-radius-round"></span>
								<div class="list-text">Right to Information				</div>
								</a>
			 				</li>
								<li class="  ">
								<a href="https://eci.gov.in" target="_blank" style="" onclick="return confirm('You are being redirected to an external website. Please note that Kendrapara District, Government of Odisha cannot be held responsible for external websites content &amp; privacy policies.');" aria-label="Election Commission of India - External site that opens in a new window" title="Election Commission of India - External site that opens in a new window" rel="noopener noreferrer">
								<span class="list-icon -bg  border-radius-round"></span>
								<div class="list-text">Election Commission of India				</div>
								</a>
			 				</li>
								<li class="  ">
								<a href="http://odisha.gov.in" style="" onclick="return confirm('You are being redirected to an external website. Please note that Kendrapara District, Government of Odisha cannot be held responsible for external websites content &amp; privacy policies.');" aria-label="State Portal - Govt of Odisha - External site that opens in a new window" title="State Portal - Govt of Odisha - External site that opens in a new window" target="_blank" rel="noopener noreferrer">
								<span class="list-icon -bg  border-radius-round"></span>
								<div class="list-text">State Portal - Govt of Odisha				</div>
								</a>
			 				</li>
								<li class="  ">
								<a href="http://www.odishapolice.gov.in" style="" onclick="return confirm('You are being redirected to an external website. Please note that Kendrapara District, Government of Odisha cannot be held responsible for external websites content &amp; privacy policies.');" aria-label="Odisha Police - External site that opens in a new window" title="Odisha Police - External site that opens in a new window" target="_blank" rel="noopener noreferrer">
								<span class="list-icon -bg  border-radius-round"></span>
								<div class="list-text">Odisha Police				</div>
								</a>
			 				</li>
								<li class="  ">
								<a href="http://bhulekh.ori.nic.in" style="" onclick="return confirm('You are being redirected to an external website. Please note that Kendrapara District, Government of Odisha cannot be held responsible for external websites content &amp; privacy policies.');" aria-label="Land Records - Bhulekh - External site that opens in a new window" title="Land Records - Bhulekh - External site that opens in a new window" target="_blank" rel="noopener noreferrer">
								<span class="list-icon -bg  border-radius-round"></span>
								<div class="list-text">Land Records - Bhulekh				</div>
								</a>
			 				</li>
								<li class="  ">
								<a href="https://www.ncwwomenhelpline.in/" style="" onclick="return confirm('You are being redirected to an external website. Please note that Kendrapara District, Government of Odisha cannot be held responsible for external websites content &amp; privacy policies.');" aria-label="National Commission for Women Helpline - External site that opens in a new window" title="National Commission for Women Helpline - External site that opens in a new window" target="_blank" rel="noopener noreferrer">
								<span class="list-icon -bg  border-radius-round"></span>
								<div class="list-text">National Commission for Women Helpline				</div>
								</a>
			 				</li>
						</ul>
				</div>
		
		<div class="gen-list no-border no-bg padding-20 border-radius-none default-list importantLinksWrapper col-two normal-font ">
		<h2 class="heading3"><span class="icon-phone-2"></span> HELPLINE NUMBERS</h2>		<ul>
						<li class="  ">
								<a href="https://kendrapara.nic.in/helpline-numbers/" style="">
								<span class="list-icon -bg  border-radius-round"></span>
								<div class="list-text">COVID-19  Helpline - 1077  /  06727-232803				</div>
								</a>
			 				</li>
								<li class="  ">
								<a href="https://kendrapara.nic.in/helpline-numbers/" style="">
								<span class="list-icon -bg  border-radius-round"></span>
								<div class="list-text">Child Helpline : 1098				</div>
								</a>
			 				</li>
								<li class="  ">
								<a href="https://kendrapara.nic.in/helpline-numbers/" style="">
								<span class="list-icon -bg  border-radius-round"></span>
								<div class="list-text">Women Helpline (NCW) :  7827170170				</div>
								</a>
			 				</li>
								<li class="  ">
								<a href="https://kendrapara.nic.in/helpline-numbers/" style="">
								<span class="list-icon -bg  border-radius-round"></span>
								<div class="list-text">Voter Help Line : 1950				</div>
								</a>
			 				</li>
						</ul>
				</div>
		</div></div> -->
			<!-- 	<div class="col-md-2 col-sm-4 footer-ns d-flex">
					<a
						class="backtotop align-self-center d-flex text-center text-decoration-none text-white"
						title="Back to top" href="#b-accessibility"> <span
						style="display: none;">Back to top</span> <span
						style="font-size: 24px;"
						class="fas fa-angle-up align-self-center mx-auto"></span>
					</a>
				</div> -->
			</div>
			<div class="text-center mt-5 b-footer-credit"
				style="color: #000 !important">
				This site is designed and hosted by <a class="font-weight-bold"
					href="https://www.nic.in/">National Informatics Centre</a>, <a
					class="font-weight-bold" href="https://meity.gov.in/">Ministry
					of Electronics and IT</a>, <a class="font-weight-bold"
					href="https://www.india.gov.in/">Govt. of India.</a>
			</div>
		</footer>
	</div>







	<!-- Login Modal -->
	<div class="modal fade" id="login-modal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header text-center d-block p-5 border-bottom-0">
					<h2 class="modal-title">Log In</h2>
					<button type="button" class="close position-absolute"
						style="right: 15px; top: 8px;" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="dashboard.html" autocomplete="off" method="POST">
						<div class="form-group">
							<label for="login-email">Email:</label> <input type="email"
								class="form-control" id="login-email" placeholder="Enter email"
								name="login-email">
						</div>
						<div class="form-group">
							<label for="login-pwd">Password:</label> <input type="password"
								class="form-control" id="login-pwd" placeholder="Enter password"
								name="login-pwd">
						</div>
						<div class="form-group form-check">
							<label class="form-check-label" for="login-rem"> <input
								class="form-check-input" type="checkbox" id="login-rem"
								name="remember"> Remember me
							</label>
						</div>
						<p class="text-right b-notreg">
							Don't have an account? <a href="" data-toggle="modal"
								data-target="#signup-modal" data-dismiss="modal">Sign Up</a>
						</p>
						<div class="text-center py-4">
							<button type="submit" class="btn btn-primary b-btn">Log
								In</button>
						</div>

					</form>
				</div>


			</div>
		</div>
	</div>




	<!-- Signup Modal -->
	<div class="modal fade" id="signup-modal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header text-center d-block p-5 border-bottom-0">
					<h2 class="modal-title">Sign Up</h2>
					<button type="button" class="close position-absolute"
						style="right: 15px; top: 8px;" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="" autocomplete="off">
						<div class="form-group">
							<label for="signup-name">Name:</label> <input type="text"
								class="form-control" id="signup-name" placeholder="Enter name"
								name="signup-name">
						</div>
						<div class="form-group">
							<label for="signup-email">Email:</label> <input type="email"
								class="form-control" id="signup-email" placeholder="Enter email"
								name="signup-email">
						</div>
						<div class="form-group">
							<label for="signup-mobile">Mobile no.:</label> <input
								type="number" class="form-control" id="signup-mobile"
								placeholder="Enter mobile no." name="signup-mobile">
						</div>
						<div class="form-group">
							<label for="signup-pwd">Password:</label> <input type="password"
								class="form-control" id="signup-pwd"
								placeholder="Enter password" name="signup-pwd">
						</div>

						<p class="text-right b-already-reg">
							Already Registered? <a href="" data-toggle="modal"
								data-target="#login-modal" data-dismiss="modal">Log In</a>
						</p>
						<div class="text-center py-4">
							<button type="submit" class="btn btn-primary b-btn">Sign
								Up</button>
						</div>

					</form>
				</div>


			</div>
		</div>
	</div>




	<!-- Feedback Modal -->
	<div class="modal fade" id="feedback-modal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header text-center d-block p-5 border-bottom-0">
					<h2 class="modal-title">Feedback</h2>
					<button type="button" class="close position-absolute"
						style="right: 15px; top: 8px;" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="feedback.html" autocomplete="off">
						<div class="form-group">
							<label for="fdbk-name">Name:</label> <input type="text"
								class="form-control" id="fdbk-name" placeholder="Enter name"
								name="fdbk-name">
						</div>
						<div class="form-group">
							<label for="fdbk-email">Email:</label> <input type="email"
								class="form-control" id="fdbk-email" placeholder="Enter email"
								name="fdbk-email">
						</div>
						<div class="form-group">
							<label for="fdbk-subject">Subject:</label> <select
								class="form-control" id="fdbk-subject" name="fdbk-subject">
								<option>Application issue</option>
								<option>Design issue</option>
								<option>Any other</option>
							</select>
						</div>
						<div class="form-group">
							<label for="fdbk-comment">Comment:</label>
							<textarea class="form-control" id="fdbk-comment"
								placeholder="Enter feedback" name="fdbk-comment" rows="5"
								style="resize: none;"></textarea>
						</div>
		<div class="form-group">
								<img style="float: left;" id="captcha_id" name="imgCaptcha"
									src="captcha.jpg" width="150" height="35" class="center-block">
								<!-- <img style="float: right; margin-right: 55px; cursor: pointer;"
									src="images/refresh.png" height="35" width="35" id="img1"
									class="center-block"> -->
<img style="float:right;margin-right: 55px;cursor: pointer;" src="images/refresh.png" height="35" width="35" id="img1" class="center-block"> 
									
									 <input style="margin-top: 4px;"
									type="text" name="captcha" onpaste="return false;"
									onCopy="return false" onCut="return false"
									onDrag="return false" onDrop="return false"
									placeholder="Enter Captcha Code" required="true" id="password" />

							</div>
						<div class="text-center py-4">
							<button type="submit" class="btn btn-primary b-btn">Submit</button>
						</div>

					</form>
				</div>


			</div>
		</div>
	</div>




	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>


	<!-- Menu Toggle Script -->
	<script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>




	<script>
	  	$(document).ready(function() {
	  		$(".b-navdropdown-click").click(function() {
	  			if($(".b-navdropdown").hasClass("hide")) {
	  				$(".b-navdropdown").addClass("show");
	  				$(".b-navdropdown").removeClass("hide");
	  				// $(".b-icon-up").show();
	  				// $(".b-icon-down").hide();
	  			} 
	  			else if($(".b-navdropdown").hasClass("show")) {
	  				$(".b-navdropdown").addClass("hide");
	  				$(".b-navdropdown").removeClass("show");
	  				// $(".b-icon-down").show();
	  				// $(".b-icon-up").hide();
	  			}
			});
	  	});



    </script>


	<script src="vendor/jquery-ui/jquery-ui.js"></script>
	<script>
				function submitForm()
				{
					/* var pass = document.getElementById("password").value;
					var salt = document.getElementById("udata").value;
					var passhash = $.md5(pass);
					console.log(passhash);
					
					passhash = $.md5(salt + passhash);
					document.getElementById("udata").value = "";
					passhash = $.base64.encode(passhash);
					document.getElementById("password").value = passhash; */
					
					/* alert("",true) */
					
					var pass = document.getElementById("password").value;
				  //alert("pass:::::"+pass,true) 
					
					 
					
					 var salt = document.getElementById("udata").value;
					//alert("salt::UI:::"+salt,true) 
					 
					//console.log(passhash);
					
					//passhash = SHA256(salt + passhash);
					
					//alert("passhash::after salt::::::"+passhash,true) 
					document.getElementById("udata").value = "";
					
					//passhash = $.base64.encode(passhash);
					var passhash = SHA256(pass); /* $.hash(pass); */
					
					//alert("passhash:::::"+passhash,true) 
					document.getElementById("password").value = passhash;
					
					//alert("passhash::final:after base 64:::::::"+passhash,true) 
					
					
					
					return true;
				}
				
				function disableForm()
				{
					var btn = $("#group-skill");
					btn.prop("disabled", true); 
				}
		</script>

	<!-- <nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
		<a class="navbar-brand" href="#">Logo</a>
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="#">Link</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">Link</a>
			</li>
		</ul>
	</nav> -->




	<!-- /#wrapper -->



	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/dashboard.js"></script>

	<!-- Menu Toggle Script -->
	<!--   <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>

 
  <script>
    $(document).ready(function(){ 
      $('#backtotop').click(function(){ 
          $("html, body").animate({ scrollTop: 0 }, 600); 
          return false; 
      }); 
  });
  </script>


  <script>
    $('.sub-menu ul').hide();
    $('.sub-sub-menu ul').hide();
  $(".sub-menu a").click(function () {
    $(this).parent(".sub-menu").children("ul").slideToggle("100");
    $(this).find(".right").toggleClass("fa-caret-up fa-caret-down");
  });

  $(".sub-sub-menu a").click(function () {
    $(this).parent(".sub-sub-menu").children("ul").slideToggle("100");
    $(this).find(".right").toggleClass("fa-caret-up fa-caret-down");
  });
  </script>


  <script>

    $(window).on('scroll', function(event) {
    var scrollValue = $(window).scrollTop();
    if (scrollValue == settings.scrollTopPx || scrollValue > 70) {
         $('#sidebar-wrapper').addClass('fixed-top');
    } 
});
  </script>

  <script>
      $(window).on('scroll', function (event) {
    var scrollValue = $(window).scrollTop();
    if (scrollValue > 120) {
        $('#sidebar-wrapper').addClass('affix');
    } else{
        $('#sidebar-wrapper').removeClass('affix');
    }
});
  </script> -->




</body>
</html>






