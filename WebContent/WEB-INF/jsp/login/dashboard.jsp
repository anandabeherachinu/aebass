<%@page import="java.util.Random"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>	
<%
int n1 = 0;
if(session.getAttribute("n1") == null)
{
	System.out.println("inside jsp n1::::::::::::::::::n1"+n1);//srf
Random rand = new Random();
n1 = rand.nextInt(900000000) + 100000000;
System.out.println("n1:::::::sec::::::::::::"+n1);
}
%>

<%

session.setAttribute("n1",n1);
System.out.println("inside jsp n1::::::::::::::::session.get::"+(Integer)session.getAttribute("n1"));

%>	
<head>
<title>Registration</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
 <link href="apps-style.css" rel="stylesheet" type="text/css" />
  <link href='css/fontapi.css' rel='stylesheet' type='text/css' />
 <jsp:include page="../common-admin/head.jsp"></jsp:include> 
 <style>

.custom {
    margin: 284px -223px 7px 14px;
}
.b-dbcard {
    margin-top: 15px;
    padding:10px;
    border-radius:22px;
}
.fa-users:before {
    content: "\f0c0";
}

.card-box {
	position: relative;
	color: #fff;
	padding: 20px 10px 40px;
	margin: 20px 0px;
}

.card-box:hover {
	text-decoration: none;
	color: #f1f1f1;
}

.card-box:hover .icon i {
	font-size: 100px;
	transition: 1s;
	-webkit-transition: 1s;
}

.card-box .inner {
	padding: 5px 10px 0 10px;
}

.card-box h3 {
	font-size: 27px;
	font-weight: bold;
	margin: 0 0 8px 0;
	white-space: nowrap;
	padding: 0;
	text-align: left;
}

.card-box p {
	font-size: 15px;
}

.card-box .icon {
	position: absolute;
	top: auto;
	bottom: 5px;
	right: 5px;
	z-index: 0;
	font-size: 72px;
	color: rgba(0, 0, 0, 0.15);
}

.card-box .card-box-footer {
	position: absolute;
	left: 0px;
	bottom: 0px;
	text-align: center;
	padding: 3px 0;
	color: rgba(255, 255, 255, 0.8);
	background: rgba(0, 0, 0, 0.1);
	width: 100%;
	text-decoration: none;
}

.card-box:hover .card-box-footer {
	background: rgba(0, 0, 0, 0.3);
}

.bg-blue {
	background-color: #00c0ef !important;
}

.bg-green {
	background-color: #00a65a !important;
}

.bg-orange {
	background-color: #f39c12 !important;
}

.bg-red {
	background-color: #d9534f !important;
}
</style>

  
</head>
 
<body>

<%
   response.setHeader( "Pragma", "no-cache" );
   response.setHeader( "Cache-Control", "private, no-cache, no-store, must-revalidate, proxy-revalidate" );
   response.setDateHeader( "Expires", 0 );
%>

 <jsp:include page="../common-admin/upper_block.jsp"></jsp:include> 
				
				 <script type="text/javascript">
	$(document).ready(function() 
	{
		 history.replaceState(null, document.title, location.pathname+"#!/");
		    history.pushState(null, document.title, location.pathname);
		    window.addEventListener('popstate', function(event) {
		    history.pushState(null, document.title, location.pathname);
		    }, false);  
	});
	</script>
				
				
                <!-- Page Heading -->
      <%--     <div id="page-title">      
  <div class="panel-heading">
 
                  <c:if test="${sessionScope.role_id eq '1' }">
                         	<h3>Welcome, Administrator</h2>
                         </c:if>
                         <c:if test="${sessionScope.role_id eq '2' }">
                         	<h3>Welcome, ${sessionScope.userID}</h2>
                         </c:if>
                         <c:if test="${sessionScope.role_id eq '3' }">
                         	<h3>Welcome, Training Provider</h2>
                         </c:if>
                         
                        
                </div>
               </div> --%>
                
                 <c:if test="${sessionScope.role_id eq '1' }">
                 
                					                 
                 
                 
                 
                <div class="admin-home">
                
                
                
                    <div class="col-lg-12 dashboard-page">
                        
                   
                        
                        
                        
                     
                        				<div class="admin-home">
<!-- 							<div class="col-lg-12 dashboard-page">
 -->								
								<div class="row" style="margin-top:60px;">
								
									<div class="col-lg-2 col-sm-6"></div>
									<div class="col-lg-3 col-sm-6">
										<div class="card-box bg-red"
											style="border-radius: 15px; height: 200px">
											<div class="inner">
												<h2>${piaHostel.hostelBills}</h2>
												<h4>Bar chart for PolyTechnic</h4>
												
											</div>
											<div class="icon">
												<i class="fa fa-users"></i>
											</div>
											<!-- <a href="lodging-bill.html" class="card-box-footer"
												style="border-radius: 20px; height: 40px"><b>Bar chart for PolyTechnic </b> <i class="fa fa-arrow-circle-right"></i></a> -->
												<a href="bar-chart-govt-polytechnic.html" class="btn btn-primary" style="border-radius: 20px; height: 40px"><b>View
													More </b><i class="fa fa-arrow-circle-right"></i></a>
										</div>
											
									</div>
									<div class="col-lg-3 col-sm-6">
										<div class="card-box bg-blue"
											style="border-radius: 15px; height: 200px;background-color: #46ef00  !important">
											<div class="inner">
												<h1>${college.rollId}</h1>
												<h4>registered Institute</h4>
											</div>
											<div class="icon">
												<i class="fa fa-users"></i>
											</div>
											<a href="view-all-college-list.html" class="btn btn-primary ls-modal" style="border-radius: 20px; height: 40px"><b>View
													More </b><i class="fa fa-arrow-circle-right"></i></a>
										</div> 
									</div>
									<div class="col-lg-3 col-sm-6">
										<div class="card-box bg-blue"
											style="border-radius: 15px; height: 200px ;">
											<div class="inner">
												<h1>${student.rollId}</h1>
												<h4>registered Student</h4>
											</div>
											<div class="icon">
												<i class="fa fa-users"></i>
											</div>
											<a href="view-all-student-list.html" class="btn btn-primary ls-modal" style="border-radius: 20px; height: 40px"><b>View
													More </b><i class="fa fa-arrow-circle-right"></i></a>
										</div>
									</div>
									
									
								</div>
								
								
											<div class="row">
								
									<div class="col-lg-2 col-sm-6"></div>
									<div class="col-lg-3 col-sm-6">
										<div class="card-box bg-orange"
											style="border-radius: 15px; height: 200px">
											<div class="inner">
												<h2>${piaHostel.hostelBills}</h2>
												<h4>Bar chart for ITI</h4>
											</div>
											<div class="icon">
												<i class="fa fa-users"></i>
											</div>
											
													<a href="bar-chart-ITI.html" class="btn btn-primary" style="border-radius: 20px; height: 40px"><b>View
													More </b><i class="fa fa-arrow-circle-right"></i></a>
										</div>
									</div>
									<div class="col-lg-3 col-sm-6">
										<div class="card-box bg-blue"
											style="border-radius: 15px; height: 200px; background-color: #ef00e8 !important">
											<div class="inner">
												<h1></h1>
												<h4>Pie chart For PolyTechnic & ITI</h4>
											</div>
											<div class="icon">
												<i class="fa fa-users"></i>
											</div>
											<a href="piechart-admin.html" class="btn btn-primary" style="border-radius: 20px; height: 40px"><b>View
													More </b><i class="fa fa-arrow-circle-right"></i></a>
										</div> 
									</div>
									<div class="col-lg-3 col-sm-6">
										<div class="card-box bg-green"
											style="border-radius: 15px; height: 200px ">
											<div class="inner">
												<h1>${totalstudentcountpresentDa.rollId}</h1>
												<h4>Present Student</h4>
											</div>
											<div class="icon">
												<i class="fa fa-users"></i>
											</div>
											<a href="view-present-student-list-current.html" class="btn btn-primary ls-modal" style="border-radius: 20px; height: 40px"><b>View
													More </b><i class="fa fa-arrow-circle-right"></i></a>
										</div>
									</div>
									
									
								</div>

				
									
									
								</div>

							</div>




						</div>
                   
               
	
	  

				
				
			

                        	
                        	
                        	
                        	<div class="clearfix"></div>
<!--                         </div>
 -->                        
                        
                     
                        
                        
                    
                    </c:if>
                                                                  
                                                                  
                                                                  
                                                                  
                                                                  
                                                                  
                                                                
                                                                  
                                                                  
                                                                  
                                                                  
                                                                  
                                                                  
                                                                  
                                                                  
                                                                  
                                                                  
             
						<c:if test="${sessionScope.role_id eq '2' }">
			<h3>			

<%-- 	<jsp:include page="../common-admin/verification.jsp"></jsp:include>
 --%>	
 
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.Random"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<jsp:include page="../common-admin/head.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- Add these links in the head section of your HTML file -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
 --><script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="css/bootstrap4.3.1.min.css" />



<style>
/* Custom CSS for the card */
html {
overflow: scroll;
}

::-webkit-scrollbar {
width: 0px;
background: transparent; /* make scrollbar transparent */
}
.fascinating-card {
	padding: 45px 76px 80px 91px;
	margin-top: 0px;
	margin-left:100px;
	margin-right:100px;
	background-color: #f0f0f0;
	border: 5px solid #4bb5b1;
	border-radius: 15px;
	box-shadow: inset 0 22px 349px rgb(75, 181, 177);
}
.f{
margin-top: 150px;
background-color: #f0f0f0;
	border: 5px solid #4bb5b1;
	border-radius: 15px;
	box-shadow: inset 0 22px 349px rgb(75, 181, 177);
}
.card{
background-color: #f0f0f0;
	border: 5px solid #4bb5b1;
	border-radius: 15px;
	box-shadow: inset 0 22px 349px rgb(75, 181, 177);

}

/* Adjust the card's text and button styling as needed */
.fascinating-card h2 {
	color: #333;
}

.fascinating-card input[type="text"] {
	height: 50px;
	width: 100%;
	padding: 10px;
	border-radius: 5px;
	width: 100%;
}

.f .btn-submit {
	background-color: #333;
	color: #fff;
}

/*  */
.input-container {
	position: relative;
	margin: 20px 0;
}

.input-field {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.floating-label {
	position: absolute;
	left: 12px;
	top: 20px;
	transition: top 0.3s, font-size 0.3s;
	font-size: 16px;
	color: #777;
}

.input-field:focus+.floating-label, .input-field:valid+.floating-label {
	top: 0;
	font-size: 12px;
	color: #333;
}
  #keypad {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            max-width: 300px;
            margin: 20px auto;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        #attendanceForm {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
        }

        .keypad {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
        }

       /*  .key {
            padding: 14px;
            text-align: center;
            border: 1px solid #e40d0d;
            border-radius: 5px;
            cursor: pointer;
            height:50px;
            font-size:large;
            background-color:#4bb5b1;
            color:white;
        } */
        .key {
    padding: 14px;
    text-align: center;
    border: 1px solid #e40d0d;
    border-radius: 5px;
    cursor: pointer;
    height: 50px;
    font-size: large;
    background-color: #4bb5b1;
    color: white;
    transition: background-color 0.3s, transform 0.1s;
}

.key:hover {
    background-color: #3a8e8a;
}

.key:active {
    transform: scale(0.95);
}
        

         button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        } 
         .clicked {
        background-color: #e40d0d !important; /* Adjust the color for the click effect */
        transition: background-color 0.1s;
    }
</style>
<title>Verification</title>

</head>
<body >
	<jsp:include page="../common-admin/upper_block.jsp"></jsp:include>
		<div class="container-fluid f">
			<div class="container-fluid ">
			<span style="font-size: 17px;color: red; position: absolute;margin-top: -29px">
										                    ${message}
										                </span>
										                <span style=" margin-left: 0px;font-size: 14px;color: red;">
										                    ${adminerrormessage}
										                </span>
										                <span style=" margin-left: 0px;font-size: 14px;color: green;">
										                    ${adminlogoutmessage}
										                </span>
		<div class="card" >
  <div class="card-body">
   <h3  style="text-align:center">Biometric Attendance for Student</h3>
   <div class="row" >
   <div class="col-6 col-sm-6 col-md-6">
   <div class="card" >
  <div class="card-body">
   <form:form class="form-horizontal" enctype="multipart/form-data"
						action="verification.html" method="post" modelAttribute="cb"
						autocomplete="off" onsubmit="openPopup()">
					
						<div class="hide"><span id="Label1">Active RD Service
								Port No.(HTTP): </span></div>
						<div class="hide"><select name="DrpPortSelection"
							id="DrpPortSelection" onchange="HttpSelChange();" disabled="">
								<option value="11100">11100 : FM220U</option>
						</select></div>
						<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
						<div class="hide"><span id="Label19">Active RD Service
								(HTTPS): </span></div>
						<div class="hide"><select name="DrpPortSelectionHttps"
							id="DrpPortSelectionHttps" onchange="HttpsSelChange();">
								<option value="11200">11200 : FM220U</option>
						</select></div>
					

						<div> 
							 
						<!-- class="form-group "
							style="margin-bottom: 10px !important; padding: unset !important;"> -->
							<h3>Enter Registration No</h3>
							<form:input path="rollId" type="text" class="form-control"
								id="textbox" placeholder="Enter Registration Number"/>
						</div><!-- readonly="true"  -->
						
						<form:hidden path="txtData" rows="2" cols="20" id="txtData"
							class="remaining" style="width: 99%;"></form:hidden>
						<!--                                        </td>
 -->
						<!-- 									  <td style="border: thin solid #000000;">
 -->
						<form:hidden path="txtDataRd" rows="2" cols="20" id="txtDataRd"
							class="remaining" style="width: 99%;"></form:hidden>
						<!-- </td> -->

					
<!-- 						<button type="submit" class="btn btn-submit btn-block" style="width: unset; margin: auto;"  onclick="viewsuccesspopup();">Open Modal</button>
 -->						<!-- </form> -->
 						<button  type="submit" class="btn btn-submit btn-block" style="width: unset; margin: auto;" >Submit</button>
 
					</form:form>
   
   </div>
   </div>
   
   </div>
    <div class="col-6 col-sm-6 col-md-6">
	<div class="col-md-12"  >
				 <div class="keypad" id="employeeIdKeypad">
                
            </div>
</div>
</div>
   </div>
   </div>
<!-- 			<div class="col-md-3"><img src="images/output-onlinegiftools.gif" alt="NIC logo"style="height:200px;margin-left:-118px;"></div>
 -->		
  </div>
</div>
</div>
		
		
		
		
		
		<%-- 	<div class="container-fluid">
		
		<div class="fascinating-card">
			<h2 class="text-center">Biometric Attendance for Student</h2>
						<div class="row" >
					<div class="col-md-6" style="border: 1px solid #531c0e; border-radius:10px; background-color: #4bb5b1;box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
			
			
			<div class="row" >
<!-- 			<div class="col-md-3"><img src="images/output-onlinegiftools.gif" alt="NIC logo"style="height:200px;margin-left:-118px;"></div>
 -->				<div class="col-md-12" style="margin-top:75px;">
					<!-- <form> -->
					<form:form class="form-horizontal" enctype="multipart/form-data"
						action="verification.html" method="post" modelAttribute="cb"
						autocomplete="off" onsubmit="openPopup()">
						<div>
											   		 <span style="font-size: 17px;color: red; position: absolute;margin-top: -29px">
										                    ${message}
										                </span>
										                <span style=" margin-left: 0px;font-size: 14px;color: red;">
										                    ${adminerrormessage}
										                </span>
										                <span style=" margin-left: 0px;font-size: 14px;color: green;">
										                    ${adminlogoutmessage}
										                </span>
											   </div>
						
						<div class="hide"><span id="Label1">Active RD Service
								Port No.(HTTP): </span></div>
						<div class="hide"><select name="DrpPortSelection"
							id="DrpPortSelection" onchange="HttpSelChange();" disabled="">
								<option value="11100">11100 : FM220U</option>
						</select></div>
						<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
						<div class="hide"><span id="Label19">Active RD Service
								(HTTPS): </span></div>
						<div class="hide"><select name="DrpPortSelectionHttps"
							id="DrpPortSelectionHttps" onchange="HttpsSelChange();">
								<option value="11200">11200 : FM220U</option>
						</select></div>
					

						<div> <!-- class="form-group "
							style="margin-bottom: 10px !important; padding: unset !important;"> -->
							<h3>Enter Registration No</h3>
							<form:input path="rollId" type="text" class="form-control"
								id="textbox" placeholder="Enter Registration Number" maxlength="12"/>
						</div><!-- readonly="true"  -->
						
						<form:hidden path="txtData" rows="2" cols="20" id="txtData"
							class="remaining" style="width: 99%;"></form:hidden>
						<!--                                        </td>
 -->
						<!-- 									  <td style="border: thin solid #000000;">
 -->
						<form:hidden path="txtDataRd" rows="2" cols="20" id="txtDataRd"
							class="remaining" style="width: 99%;"></form:hidden>
						<!-- </td> -->

					
<!-- 						<button type="submit" class="btn btn-submit btn-block" style="width: unset; margin: auto;"  onclick="viewsuccesspopup();">Open Modal</button>
 -->						<!-- </form> -->
 						<button  type="submit" class="btn btn-submit btn-block" style="width: unset; margin: auto;" >Submit</button>
 
					</form:form>

				</div>
				</div>
			


</div> --%>

<!-- <div class="col-md-6">
	<div class="col-md-12"  >
				 <div class="keypad" id="employeeIdKeypad">
                
            </div>
</div>
</div>
				</div>

				
			</div>
		
	</div> -->


	
 <script>

 function appendNumber(inputId, number) {
	 // alert(document.getElementById(inputId).value,number);
	  console.log(document.getElementById(inputId));
	if(number =='Clear'){
		  
		document.getElementById(inputId).value=''
		  } else{
     var inputField = document.getElementById(inputId);
     inputField.value += number;
		  }
 }

 // Create keypad buttons dynamically
  function createKeypadButtons(containerId, inputId) {
     var keypadContainer = document.getElementById(containerId);

     for (var i = 0; i <= 11; i++) {
         var button = document.createElement("div");
         button.className = "key";
         button.textContent = i;
         if(i==10){
             button.textContent = 'Clear';

         }
         if(i==11){
             button.textContent = 'F';

         }

         button.onclick = function () {
             appendNumber(inputId, this.textContent);
         };

         keypadContainer.appendChild(button);
     }
     
 } 



 // Create keypad buttons for employeeId and biometricScan
 createKeypadButtons("employeeIdKeypad", "textbox");
 createKeypadButtons("biometricScanKeypad", "biometricScan");

 // Add zero button
 var zeroButton = document.createElement("div");
 zeroButton.className = "key";
 zeroButton.textContent = "0";
 zeroButton.onclick = function () {
     appendNumber("employeeId", this.textContent);
 };
 document.getElementById("employeeIdKeypad").appendChild(zeroButton);

 zeroButton = document.createElement("div");
 zeroButton.className = "key";
 zeroButton.textContent = "0";
 zeroButton.onclick = function () {
     appendNumber("biometricScan", this.textContent);
 };
 document.getElementById("biometricScanKeypad").appendChild(zeroButton);
</script>


<script type="text/javascript">
 
 $(function(){
	 
	 $('.ls-modal').on('click', function(e){
		  e.preventDefault();
		  //console.log($(this).attr('href'));
		  $('#myModal').modal('show').find('.modal-body').load($(this).attr('href'));
		  $('#myModal .modal-title').html($(this).attr('rel'));
		});
 });
 </script>
 <script>

		$(document).bind("contextmenu",function(e) {
			 e.preventDefault();
			});
		</script>
		  <script>
	 	$(document).keydown(function(e){
		    if(e.which === 123){
		       return false;
		    }
		}); 
</script>

</body>
</html>
 
 
 </h3>
</c:if>
			<c:if test="${sessionScope.role_id eq '3' }">
                 
                					                 
                 
                 
                 
                <div class="admin-home">
                
                
                
                    <div class="col-lg-12 dashboard-page">
                        
                   
                        
                        
                        
                     
                        				<div class="admin-home">
<!-- 							<div class="col-lg-12 dashboard-page">
 -->
					<div class="row" style="margin-top: 60px;">

						<div class="col-lg-2 col-sm-6"></div>
						<div class="col-lg-3 col-sm-6">
							<div class="card-box bg-red"
								style="border-radius: 15px; height: 200px">
								<div class="inner">
									<h2>${piaHostel.hostelBills}</h2>
									<p>Pending</p>
								</div>
								<div class="icon">
									<i class="fa fa-users"></i>
								</div>
								<!-- <a href="lodging-bill.html" class="card-box-footer"
									style="border-radius: 20px; height: 40px"><b>View More
								</b> <i class="fa fa-arrow-circle-right"></i></a> -->
							</div>
						</div>
						<div class="col-lg-3 col-sm-6">
							<div class="card-box bg-blue"
								style="border-radius: 15px; height: 200px; background-color: #46ef00 !important">
								<div class="inner">
									<%-- 												<h1>${college.rollId}</h1>
 --%>
									<h4>registered Institute</h4>
								</div>
								<div class="icon">
									<i class="fa fa-users"></i>
								</div>
								<!-- <a href="view-all-college-list.html"
									class="btn btn-primary ls-modal"
									style="border-radius: 20px; height: 40px"><b>View More
								</b><i class="fa fa-arrow-circle-right"></i></a> -->
							</div>
						</div>
						<div class="col-lg-3 col-sm-6">
							<div class="card-box bg-blue"
								style="border-radius: 15px; height: 200px;">
								<div class="inner">
									<h1>${studentcollege.rollId}</h1>
									<h4>registered Student</h4>
								</div>
								<div class="icon">
									<i class="fa fa-users"></i>
								</div>
								<a href="collegewise-student-list.html"
									class="btn btn-primary ls-modal"
									style="border-radius: 20px; height: 40px"><b>View More
								</b><i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>


					</div>


					<div class="row">
								
									<div class="col-lg-2 col-sm-6"></div>
									<div class="col-lg-3 col-sm-6">
										<div class="card-box bg-orange"
											style="border-radius: 15px; height: 200px">
											<div class="inner">
												<h2>${piaHostel.hostelBills}</h2>
												<p>Pending </p>
											</div>
											<div class="icon">
												<i class="fa fa-users"></i>
											</div>
											<!-- <a href="lodging-bill.html" class="card-box-footer"
												style="border-radius: 20px; height: 40px"><b>View
													More </b> <i class="fa fa-arrow-circle-right"></i></a> -->
										</div>
									</div>
									<div class="col-lg-3 col-sm-6">
										<div class="card-box bg-blue"
											style="border-radius: 15px; height: 200px; background-color: #ef00e8 !important">
											<div class="inner">
<%-- 												<h1>${college.rollId}</h1>
 --%>												<h4>registered Institute</h4>
											</div>
											<div class="icon">
												<i class="fa fa-users"></i>
											</div>
											<!-- <a href="view-all-college-list.html" class="btn btn-primary ls-modal" style="border-radius: 20px; height: 40px"><b>View
													More </b><i class="fa fa-arrow-circle-right"></i></a> -->
										</div> 
									</div>
									<div class="col-lg-3 col-sm-6">
										<div class="card-box bg-green"
											style="border-radius: 15px; height: 200px ">
											<div class="inner">
												<h1>${totalstudentcountpresentcollegewise.rollId}</h1>
												<h4>Present Student</h4>
											</div>
											<div class="icon">
												<i class="fa fa-users"></i>
											</div>
											<a href="view-present-student-list-current-college-wise.html" class="btn btn-primary ls-modal" style="border-radius: 20px; height: 40px"><b>View
													More </b><i class="fa fa-arrow-circle-right"></i></a>
										</div>
									</div>
									
									
								</div>

				
									
									
								</div>

							</div>




						</div>
                   
               
	
	  

				
				
			

                        	
                        	
                        	
                        	<div class="clearfix"></div>
<!--                         </div>
 -->                        
                        
                     
                        
                        
                    
			</c:if>


<!-- 		</div>
 -->	<br>
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                                     <!--  DASHBOARD For PIA   --> 
                                     <!--  DASHBOARD For PIA   --> 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 <c:if test="${sessionScope.role_id eq '3,5' || sessionScope.role_id eq '3,8'}">
                 
             
            	 
            
            
                 </c:if>
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
            



     
       
       <div id="myModal" class="modal fade">
	<div class="modal-dialog">
	    <div class="modal-content">
	            <div class="modal-header" >
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" > </h4>
	            </div>
	            <div class="modal-body">
	                <p>Loading...</p>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	            </div>
	    </div>
	</div>
</div> 
      <c:if test="${sessionScope.role_id eq '2'}">
                 
        <div class="row d-flex justify-content-center">
     <jsp:include page="include/footer.jsp" />
    </div>     
         
            
            
               

  		   
  </c:if>
<script type="text/javascript">
 
 $(function(){
	 
	 $('.ls-modal').on('click', function(e){
		  e.preventDefault();
		  console.log($(this).attr('href'));
		  $('#myModal').modal('show').find('.modal-body').load($(this).attr('href'));
		  $('#myModal .modal-title').html($(this).attr('rel'));
		  console.log($(this).attr('href'));

		});
 });
 </script>
       
        <script>
	 	$(document).keydown(function(e){
		    if(e.which === 123){
				  console.log($(this).attr('href'));

		       return false;
		    }
		}); 
</script>
<script>

		$(document).bind("contextmenu",function(e) {
			  console.log($(this).attr('href'));

			 e.preventDefault();
			 
			});
		</script>
		
		    
  
               
 </body>
</html>







<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<title>Control Setup</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link href="apps-style.css" rel="stylesheet" type="text/css" />
<link href='css/fontapi.css' rel='stylesheet' type='text/css' />
 <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/base-responsive.css" />
    <link rel="stylesheet" href="css/animate.min.css" />
    <link rel="stylesheet" href="css/slicknav.min.css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!--     <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css" />
 -->    	

    <script src="vendor/charts/Chart.js"></script>
    <script src="vendor/charts/moment.min.js"></script>
	<script src="vendor/charts/Chart.min.js"></script>
	<script src="vendor/charts/utils.js"></script>
<c:if test="${sessionScope.role_id eq '1'}">

	<jsp:include page="../common-admin/head.jsp"></jsp:include>
</c:if>
			 <script type="text/javascript">
	$(document).ready(function() 
	{
		 history.replaceState(null, document.title, location.pathname+"#!/");
		    history.pushState(null, document.title, location.pathname);
		    window.addEventListener('popstate', function(event) {
		    history.pushState(null, document.title, location.pathname);
		    }, false);  
	});
	</script>
<style>
.custom {
    margin: 284px -223px 7px 14px;
}
.b-dbcard {
    margin-top: 15px;
    padding:10px;
    border-radius:22px;
}
.fa-users:before {
    content: "\f0c0";
}
</style>

</head>

<body >


<!-- //style="margin-left: 235px;" -->

	<%
   response.setHeader( "Pragma", "no-cache" );
   response.setHeader( "Cache-Control", "private, no-cache, no-store, must-revalidate, proxy-revalidate" );
   response.setDateHeader( "Expires", 0 );
%>
			<c:if test="${sessionScope.role_id eq '1' }">

	<jsp:include page="../common-admin/upper_block.jsp"></jsp:include>

<!-- 	<div class="d-flex" id="wrapper"> style="margin-left:-292px;"
 -->
 <div class="custom">
 

   <div class="mt-5" id="b-homedb"
		style="position: relative; top: -170px; margin-bottom: -110px;">
		<div class="container">
			<div class="row text-center">
				<!-- <h2 class="col-md-12">Figures tell the story</h2> -->
				<div class="col-lg-4 p-4">
					<div class="bg-light py-4 b-dbcard" style="background-color:#ef00e8  !important">
						<p>
							<span class="fas fa-shield-alt" style="font-size: 70px; "></span>
						</p>
						<h3 style="font-size: 16px;">
							<strong>No. of student attend</strong>
						</h3>
						<div class="text-left ">
							<p class="px-5">
								Last year <span class="float-right">513</span>
							</p>

							<p class="px-5">
								Current year <span class="float-right">549</span>
							</p>
						</div>
					</div>
				</div>



				<div class="col-lg-4 p-4">
					<div class="bg-light py-4 b-dbcard" style="background-color:#12bd0fbd">
						<p>
							<span class="fa fa-exclamation-triangle" style="font-size: 70px"></span>
						</p>
						<h3 style="font-size: 16px;">
							<strong>No. of College</strong>
	<a href="view-all-college-list.html" class="btn btn-primary ls-modal" rel="Registered Student"><b>${college.rollId}</b></a>
							
						</h3>
						<div class="text-left ">
							<p class="px-5">
								Last year <span class="float-right">22</span>
							</p>

							<p class="px-5">
								Current year <span class="float-right">31</span>
							</p>

						</div>

					</div>
				</div>

				<div class="col-lg-4 p-4">
					<div class="bg-light py-4 b-dbcard" style= "background-color: #4d95efbd">
						<p>
							<span class="fa fa-network-wired" style="font-size: 70px"></span>
						</p>
						<h3 style="font-size: 16px;">
							<strong>Registered Student</strong><br>
<a href="view-all-student-list.html" class="btn btn-primary ls-modal" rel="Registered Student"><b>${student.rollId}</b></a>
							
						</h3>
						<div class="icon">
												<i class="fa fa-users" aria-hidden="true"></i>
											</div>
						<div class="text-left ">
							<p class="px-5">
								Last year <span class="float-right">1232</span>
							</p>

							<p class="px-5">
								Current year <span class="float-right">1337</span>
							</p>

						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	
	   <div class="mt-5" id="b-homedb"
		style="position: relative; top: -170px; margin-bottom: -110px;">
		<div class="container">
			<div class="row text-center">
				<!-- <h2 class="col-md-12">Figures tell the story</h2> -->
				<div class="col-lg-4 p-4">
					<div class="bg-light py-4 b-dbcard" style="background-color:#363ef057">
						<p>
							<span class="fas fa-shield-alt" style="font-size: 70px;"></span>
						</p>
						<h3 style="font-size: 16px;">
							<strong>No. of Advisories</strong>
						</h3>
						<div class="text-left ">
							<p class="px-5">
								Last year <span class="float-right">513</span>
							</p>

							<p class="px-5">
								Current year <span class="float-right">549</span>
							</p>
						</div>
					</div>
				</div>



				<div class="col-lg-4 p-4">
					<div class="bg-light py-4 b-dbcard" style="background-color:#b2b721bd">
						<p>
							<span class="fa fa-exclamation-triangle" style="font-size: 70px"></span>
						</p>
						<h3 style="font-size: 16px;">
							<strong>Security Incidents</strong>
						</h3>
						<div class="text-left ">
							<p class="px-5">
								Last year <span class="float-right">22</span>
							</p>

							<p class="px-5">
								Current year <span class="float-right">31</span>
							</p>

						</div>

					</div>
				</div>

				<div class="col-lg-4 p-4">
					<div class="bg-light py-4 b-dbcard" style="background-color:#ec3a25bd">
						<p>
							<span class="fa fa-network-wired" style="font-size:70px"></span>
						</p>
						<h3 style="font-size: 16px;">
							<strong>Networks Monitored</strong>
						</h3>
						<div class="text-left ">
							<p class="px-5">
								Last year <span class="float-right">1232</span>
							</p>

							<p class="px-5">
								Current year <span class="float-right">1337</span>
							</p>

						</div>
					</div>
				</div>
			

			</div>
		</div>
	</div>
	</div>
  <!-- /#wrapper -->



  <!-- Bootstrap core JavaScript -->
<!--   <script src="vendor/jquery/jquery.min.js"></script>
 -->   
  <script src="js/jquery.min.js"></script>
  
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
  <script src="js/jquery.slicknav.min.js"></script>
  <script src="js/dashboard.js"></script>

  <!-- Menu Toggle Script -->
  <script>
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


    
   



	  <script src="vendor/jquery-ui/jquery-ui.js"></script>
	  <script>
		  $( function() {
	        $( "#sortable-menu").sortable();
	        $( "#sortable-menu").disableSelection();

	        $( "#sortable-cards").sortable();
	        $( "#sortable-cards").disableSelection();
	      });
	  </script>


	  <script>
	  $(function() {
	    $("#one-item-row").on("click", function() {
	    	$(".b-customize").addClass("col-lg-12", 300);
	    	$(".b-customize").removeClass("col-lg-4", 300);
	    	$(".b-customize").removeClass("col-lg-6", 300);
	        
	    });

	    $("#two-item-row").on("click", function() {
	    	$(".b-customize").addClass("col-lg-6", 300);
	    	$(".b-customize").removeClass("col-lg-4", 300);
	    	$(".b-customize").removeClass("col-lg-12", 300);
	        
	    });

	    $("#three-item-row").on("click", function() {
	    	$(".b-customize").addClass("col-lg-4", 300);
	    	$(".b-customize").removeClass("col-lg-6", 300);
	    	$(".b-customize").removeClass("col-lg-12", 300);
	        
	    });
	 
	  });
	  </script>
</c:if>


	<script type="text/javascript">
	$(document).ready(function() 
	{
		 history.replaceState(null, document.title, location.pathname+"#!/");
		    history.pushState(null, document.title, location.pathname);
		    window.addEventListener('popstate', function(event) {
		    history.pushState(null, document.title, location.pathname);
		    }, false);  
	});
	</script>


	<!-- Page Heading -->
	<div id="page-title">
<!-- 		<div class="panel-heading">
 -->
			<c:if test="${sessionScope.role_id eq '1' }">
				<h3>
					Welcome,${sessionScope.userName}
					</h3>
			</c:if>
			<c:if test="${sessionScope.role_id eq '2' }">
				<h3>
				
					    Welcome,Institute ${sessionScope.userName}
					</h3>
			</c:if>
						<c:if test="${sessionScope.role_id eq '2' }">

	<jsp:include page="../common-admin/verification.jsp"></jsp:include>
</c:if>
			<c:if test="${sessionScope.role_id eq '3' }">
				<h3>
						<jsp:include page="../common-admin/verification.jsp"></jsp:include>

					</h3>
			</c:if>


		</div>
	<br>
	<c:if test="${sessionScope.role_id eq '1' }">

		<!--  <li class="third-btm"><a href="check-roll-wise.html"><img src="images/icon-arrow.png"> Check roll wise</a></li>
                 
                                          <li class="third-btm"><a href="check-student-data.html"><img src="images/icon-arrow.png"> Check the Student data</a></li>
                 
                                            <li class="third-btm"><a href="student-details.html"><img src="images/icon-arrow.png">Student details View</a></li>
                  -->
                  
	</c:if>



       <div id="myModal" class="modal fade">
	<div class="modal-dialog">
	    <div class="modal-content">
	            <div class="modal-header" >
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" > </h4>
	            </div>
	            <div class="modal-body">
	                <p>Loading...</p>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	            </div>
	    </div>
	</div>
</div> 


	<script type="text/javascript">
 
 $(function(){
	 
	 $('.ls-modal').on('click', function(e){
		  e.preventDefault();
		  console.log($(this).attr('href'));
		  $('#myModal').modal('show').find('.modal-body').load($(this).attr('href'));
		  $('#myModal .modal-title').html($(this).attr('rel'));
		  console.log($(this).attr('href'));

		});
 });
 </script>

	<script>
	 	$(document).keydown(function(e){
		    if(e.which === 123){
				  console.log($(this).attr('href')+'3');

		       return false;
		    }
		}); 
</script>
	<script>

		$(document).bind("contextmenu",function(e) {
			 e.preventDefault();
			  console.log($(this).attr('href')+'4');

			});
		</script>




</body>
</html> --%>