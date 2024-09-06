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
#map {
    height: 400px;
    width: 100%;
    }
</style>
<script src="js/popper.min.js"></script>
<script src="js/hash.js"></script>
<script src="js/jquery.base64.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="scripts/jqueryslidemenu.js"></script>
<script type="text/javascript" src="js/styleswitch.js"></script>
<script src="js/jquery-1.8.2.js"></script>
<script src="js/jquery-ui.js"></script>

<script type="text/javascript" src="scripts/jquery.cookie.js"></script>
<script type="text/javascript">
            function add(){
				  var a=navigator.onLine;
				  if(!a){
					  window.location='globalerror.jsp';
				  }
			  }
           </script>
<script>
			$(function() {
				$("#dateOfBirth").datepicker({
					changeMonth : true,
					changeYear : true
				});
			});
		  </script>
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
<script type="text/javascript"> 
 //console.log("abc");
			$(document).ready(function()
			{
				//console.log("abc", true);
				//alert("bjhkjhjhk",true);
				$("#img1").click(function()
			    {
					// alert("bjhkj",true);
					 $.get("captcha.jpg", function(data, status)
			        {
			              document.getElementById("captcha_id").src='captcha.jpg?p='+Math.random();
			        });
			    });
			});
</script>
<script>
function disableBtn() 
{
    document.getElementById("loginid").disabled = true;
    document.getElementById("password").disabled = true;
   document.getElementById("captcha_id").disabled = true; 
}
</script>
<script type="text/javascript">
$(document).ready(function()
{

    
    $("#img1").click(function() {

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
</head>
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


	<div style="display: none;">
		<h1>Heading1</h1>
		<h2>Heading2</h2>
	</div>




	<!-- Header -->
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
						<li class="nav-item d-block"><a href="index.html"#333;
							class="nav-link">Home</a></li>
						<li class="nav-item d-block"><a href="inner.html"
							class="nav-link active">Advisories</a></li>
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
	 <!-- <h3>My Google Maps Demo</h3>
    The div element for the map
    <div id="map"></div> -->
   

<!-- 	<h4 class="text-center">Contact Us</h4>
 -->	<div class="row">
					<div class="col-md-5 p-4" >
					<h4 class="text-center">Map View</h4>
					  <!--   <iframe src="https://maps.google.com/maps/place/State+Council+for+Technical+Education+%26+Vocational+Training/@20.2729207,85.8189609,17z/data=!3m1!4b1!4m6!3m5!1s0x3a19a7644c601a85:0xff5a49e924f68ba7!8m2!3d20.2729157!4d85.8215358!16s%2Fm%2F0gk_5vh?entry=ttu" width=550 height=250 allowfullscreen></iframe>
					<iframe src="https://maps.google.com/maps?q=Tangesir%20Dates%20Products&amp;t=&amp;z=13&amp;ie=UTF8&amp;iwloc=&amp;output=embed" width=300 height=150 allowfullscreen></iframe> -->
					<iframe loading="lazy" style="border: 0;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3742.669941882053!2d85.81915911416648!3d20.272518818540767!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a19a7644c601a85%3A0xff5a49e924f68ba7!2sSCTE%26VT!5e0!3m2!1sen!2sin!4v1508162590017" width="550" height="250" frameborder="0" allowfullscreen="allowfullscreen"></iframe>
				</div>
				<div class="col-md-1 p-4" >
				</div>
	   <div class="col-md-4 p-4">
	   	<h4 class="text-center">Contact Us</h4>
	   
        <i class="fas fa-home" > Address : Unit-8,Near Raj Bhawan,
     Bhubaneswar,Odisha,<br>
     751012 Post/Ps-Nayapalli</i> <br><!-- Home symbol -->
        <i class="fas fa-envelope" > E-mail : secretarysctevt@gmail.com</i><br> <!-- Email symbol -->
        <i class="fas fa-phone" > Phone : (0674)-2392913</i> <!-- Phone symbol -->
    </div>
    </div>












	




	
	
	
<!--     <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script>(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})
        ({key: "AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg", v: "weekly"});</script>
<script>
  (g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
    key: "",
    v: "weekly",
    // Use the 'v' parameter to indicate the version to use (weekly, beta, alpha, etc.).
    // Add other bootstrap parameters as needed, using camel case.
  });
</script>
<script>
async function initMap() {
  // The location of Uluru
  const position = { lat: -25.344, lng: 131.031 };
  // Request needed libraries.
  //@ts-ignore
  const { Map } = await google.maps.importLibrary("maps");
  const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");

  // The map, centered at Uluru
  map = new Map(document.getElementById("map"), {
    zoom: 4,
    center: position,
    mapId: "DEMO_MAP_ID",
  });

  // The marker, positioned at Uluru
  const marker = new AdvancedMarkerElement({
    map: map,
    position: position,
    title: "Uluru",
  });
}
initMap();

const position = { lat: -25.344, lng: 131.031 };
// Request needed libraries.
//@ts-ignore
const { Map } = await google.maps.importLibrary("maps");
const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");

// The map, centered at Uluru
map = new Map(document.getElementById("map"), {
  zoom: 4,
  center: position,
  mapId: "DEMO_MAP_ID",
});

const marker = new AdvancedMarkerElement({
  map: map,
  position: position,
  title: "Uluru",
});

</script>

<script>
  (g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
    key: "",
    v: "weekly",
    // Use the 'v' parameter to indicate the version to use (weekly, beta, alpha, etc.).
    // Add other bootstrap parameters as needed, using camel case.
  });
</script> -->
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
<!-- 							<li><a href="inner.html">Policies</a></li>
 -->							<li><a href="contactus.html">Contact Us</a></li>
							<!-- <li><a href="inner.html">Guidelines</a></li> -->
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
				<div class="col-md-2 col-sm-4 footer-ns d-flex">
					<a
						class="backtotop align-self-center d-flex text-center text-decoration-none text-white"
						title="Back to top" href="#b-accessibility"> <span
						style="display: none;">Back to top</span> <span
						style="font-size: 24px;"
						class="fas fa-angle-up align-self-center mx-auto"></span>
					</a>
				</div>
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
					<form action="" autocomplete="off">
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
				  // alert("pass:::::"+pass,true) 
					
					 
					
					 var salt = document.getElementById("udata").value;
					//alert("salt::UI:::"+salt,true) 
					 
					console.log(passhash);
					
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






</body>
</html>












