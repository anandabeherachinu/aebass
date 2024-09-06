<%@page import="java.util.Random"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<%
int n1 = 0;
if(session.getAttribute("n1") == null)
{
	//System.out.println("inside jsp n1::::::::::::::::::n1"+n1);srf
Random rand = new Random();
n1 = rand.nextInt(900000000) + 100000000;
//System.out.println("n1:::::::sec::::::::::::"+n1);
}
%>

<%

session.setAttribute("n1",n1);
//System.out.println("inside jsp n1::::::::::::::::session.get::"+(Integer)session.getAttribute("n1"));

%>


<%-- <%

int n2 = (Integer)session.getAttribute("n1");
System.out.println("n2:::::::::::::::::::"+n2);
session.setAttribute("n2", n2);
%> --%>

<%-- n2<c:out value="${n2}"></c:out> --%>

<%--  <c:if test="${not empty MSGS}">
					<div class="alert alert-success">
						${MSGS}
					</div>
				</c:if> --%>

<%-- <%
int n4 = (Integer)request.getAttribute("n2")!=null?(Integer)request.getAttribute("n2"):0;
System.out.println("request.getAttribute:::::::::::::::::::"+n4); 

if (n4 != 0 )
{
	System.out.println("INSIDE REQUEST::::::::::::::::::"); 	
int n3 = (Integer)request.getAttribute("n2");
System.out.println("n3:::::::::::::::::::"+n3);

}

%> --%>



<%
   response.setHeader( "Pragma", "no-cache" );
   response.setHeader( "Cache-Control", "private, no-cache, no-store, must-revalidate, proxy-revalidate" );
   response.setDateHeader( "Expires", 0 );
%>

<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <jsp:include page="../common-admin/head.jsp"></jsp:include> 
 
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
 <script type="text/javascript" src="js/cand_register.js"></script> 

 
  <!-- <link rel="stylesheet" type="text/css"
	href="css/pia-register.css" />  -->
	<link href="apps-style.css" rel="stylesheet" type="text/css" />
  <link href='css/fontapi.css' rel='stylesheet' type='text/css' />

   
 
<!--  <script>
 function aproveSet(obj)
 
 {
	 		alert("inside aproveS",true);
			window.addEventListener("offline", function()
					
			{
				alert("inside aproveSsss",true);
				$('#globalDiv').hide();
				$('#message').html('WARNING: Internet connection has ben lost.').show;
			});
			
			window.addEventListener("online", function()
					
			{
				
				$('#message').empty().hide();
				$('#globalDiv').show;
			});
			
			}
		</script>
  -->
   <script>
 function aproveSet(obj)
 
 {
	 		//alert("inside aproveS",true);
	 		window.addEventListener("offline", function () {
	 		    console.log("Online status: " + navigator.onLine);
	 		}, false);

	 		window.addEventListener("online", function () {
	 		    console.log("Online status: " + navigator.onLine);
	 		}, false);
			}
		</script>
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
 
 <script type="text/javascript">
 	 function checkDelete() 
	 {
			var r = confirm("Do you want to delete");
			if(r == true)
			{
				return true;
			}
			else
			{
				return false;
			}
			
	 } 
 </script>
 
 	<!-- Data table Start -->
    <script src="admin-public/js/datatable/jquery.dataTables.min.js"></script>
	<script src="admin-public/js/datatable/dataTables.bootstrap.min.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function() 
	{
	    $('#deptpaging').DataTable({
	    	
	    	'language':
	    	{
	            'search': '_INPUT_',
	            'searchPlaceholder': 'Search Sector'
	        },
	        "stateSave":true
	    });
	});
	</script>
	<!-- Data table End -->
</head>
<body>
 <jsp:include page="../common-admin/upper_block.jsp"></jsp:include>
 	<div class="container-fluid">
 		<div class="row-fluid">
 			

 				<c:choose>
<c:when test="${sessionScope.role_id eq '3' }"> 			
 				<%-- <div>${candview}</div> --%>
 				
 				<!-- <div style="overflow: auto;"> -->
 				<div class="box col-md-12">
 				<div class="info-table">
 				<div style="overflow: auto;">
 				
				<input class="btn btn-primary btn-font-size " type="submit" id="print_id" value="PRINT" onclick="myApp.printTable()"/>	 
				
 				<h4>Display Registration Student Lists</h4>
 				
 				
				<table  class="table_display" id="deptpaging">
				
				
							<thead>
						<tr>
						    <th>Index</th>
							<th>Registration No</th>
							<th>Student Name</th>
							<th>Academic Year</th>
							<th>Semester</th>
							<th>Course Name</th>
							
						
							
						</tr> 
					</thead>
							
					
					<tbody>
					
						<c:forEach var="s" items="${registeredStudent}" varStatus="count">
							<tr>
							<td>${count.index+1}</td>
								<td>${s.rollId}</td>
								<td>${s.studentName}</td>
								<td>${s.academicYear}</td>
								<td>${s.semestar}</td>
								<td>${s.courseName}</td>
								
								
								
							</tr>
								
							
						</c:forEach>
					</tbody>
				</table>
				</div>
</div>

</div>
</c:when>
		<c:otherwise>
			
					<div class="alert alert-danger">
					
					You are not an Authorized user for the content that you have requested......
					
					</div>
		</c:otherwise>
		</c:choose>	
 				



 		</div>
 	</div>

              

 <script>
 /* function ValidateAlpha(evt)
 {
     var keyCode = (evt.which) ? evt.which : evt.keyCode
     if ((keyCode < 65 || keyCode > 90) && !(keyCode ==8 || keyCode ==9) && (keyCode < 97 || keyCode > 123 &&!(keyCode ==8 || keyCode ==9)) && keyCode != 32) 
      
     return false;
         return true;
 } */
 function ValidateAlpha(evt)
 {
	 if(!((evt.key).match(/^[a-zA-Z ]*$/))){
		 
			document.getElementById("Sector_nm").innerHTML="<font size=2px color=red>Only Alphabets are allowed  Hints: (AGRICULTURE) </font>";
			document.getElementById("Sector_nm").focus();
			return false;
		}else{
			document.getElementById("Sector_nm").innerHTML="";
			/*  if((evt.key).match(/^((?!\s{2}).)*$/)){
				return false;
			}  */
			return true;	
		}
	 
	 return true;
	 /* alert("evt--"+evt.key,true);
     var keyCode = (evt.which) ? evt.which : evt.keyCode;
    
     if((keyCode < 65 || keyCode > 90&&!(keyCode==9||keyCode==8)) && (keyCode < 97 || keyCode > 123&&!(keyCode==9||keyCode==8)) &&( keyCode != 32&&!(keyCode==9||keyCode==8)))
     return false;
         return true; */
 }
 function isNumber(evt) {
	    evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	        return false;
	    }
	    return true;
	}
 
 
</script>
<!-- <script type="text/javascript" src="js/tc_batch.js"></script> -->
<script type="text/javascript" src="js/atten-pia-tc-bat-year-training.js"></script>

<%--  	<jsp:include page="../common-admin/lower_block.jsp"></jsp:include> 
 --%>  
	<script>
	 	$(document).keydown(function(e){
		    if(e.which === 123){
		       return false;
		    }
		}); 
</script>
<script>

		$(document).bind("contextmenu",function(e) {
			 e.preventDefault();
			});
		</script>
		<script>
    var myApp = new function () {
        this.printTable = function () {
            var tab = document.getElementById('deptpaging');
            var win = window.open('', '', 'height=700,width=700');
            win.document.write(tab.outerHTML);
            win.document.close();
            win.print();
        }
    }
</script>
	</body>
</html>




<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.Random"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	   	<script src="js/jquery-3.6.4.min.js"></script>
	   	 <script type="text/javascript" src="datepicker/jquery.plugin.js"></script>
 <script type="text/javascript" src="datepicker/jquery.datepick.js"></script>

<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css" /> -->
 <script src="js/jquery-3.6.4.min.js"></script>
 <jsp:include page="../common-admin/head.jsp"></jsp:include>
 
 <script src="js/bootstrap4.3.1.min.js"></script>
 <link rel="stylesheet" href="css/bootstrap4.3.1.min.css" />
 
 

<style>
body {
	color: #000;
	overflow-x: hidden;
	height: 100%;
/*  	background-image: url("https://i.imgur.com/GMmCQHC.png"); */
  	background-image: url("images/backgroundBlue1.jpeg");
 	background-repeat: no-repeat;
	background-size: 100% 100%
}

.card {
	padding: 30px 40px;
	margin-top: 30px;
	margin-bottom: 60px;
	border: none !important;
	box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.2)
}

.blue-text {
	color: #00BCD4
}

.form-control-label {
	margin-bottom: 0
}

input, textarea, button {
	padding: 8px 15px;
	border-radius: 5px !important;
	margin: 5px 5px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	font-size: 18px !important;
	font-weight: 300
}

input:focus, textarea:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	border: 1px solid #00BCD4;
	outline-width: 0;
	font-weight: 400
}

.btn-block {
	text-transform: uppercase;
	font-size: 15px !important;
	font-weight: 400;
	height: 43px;
	cursor: pointer
}

.btn-block:hover {
	color: #fff !important
}

.hide {
	display: none !important
}

button:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	outline-width: 0
}
  #image-container {
            max-width: 100%;
            max-height: 400px;
            margin-top: 20px;
        }
 .checkbox-container {
            margin-left: 20px;
</style>

</head>
<body>
<jsp:include page="../common-admin/upper_block.jsp"></jsp:include>
<div class="container-fluid px-1 py-5 mx-auto">
    <div class="row d-flex justify-content-center">
        <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
            <h3>Student Details</h3>
<!--             <p class="blue-text">Just answer a few questions<br> so that we can personalize the right experience for you.</p>
 -->            <div class="card">
<!--                 <h5 class="text-center mb-4">Powering world-class companies</h5>
 -->              
 		 <form:form class="form-card" onsubmit="event.preventDefault()">
              
 		<form:form class="form-horizontal" enctype="multipart/form-data"
						action="featchCollegeAPI.html" method="post" modelAttribute="cb"
						autocomplete="off" onsubmit="submitForm()">
						 
							<div class="panel panel-default">
							
						<div class="panel-heading panel-heading-custom panel-background"
							style="display: none">
							<h3 class="panel-title">Take Action</h3>
							
						</div>
						<div class="panel-body">
						
						 <table class="table">
        <thead>
            <tr>
            <th>Index</th>
                <th>Redg No</th>
                <th>Student Name</th>
                <th>Branch</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="s" items="${registeredStudent}" varStatus="count">
        
            <tr>
               <td>${count.index+1}</td>
				<td>${s.rollId}</td>
				<td>${s.studentName}</td>
				<td>${s.courseName}</td>
            </tr>
            <!-- Add more rows as needed -->
            </c:forEach>
        </tbody>
    </table>
								
							
					
							</div>
							
							</div>
							
				
							
                </form:form>
                			            </div>
        </div>
    </div>
</div>
<script>
				function submitForm()
				
				{
					
					 var message = document.getElementById("aadhar_id").value;
					     //alert("message::::"+message)
					       
					        var key = CryptoJS.lib.WordArray.random(16);
					     //  alert("key:::"+key)
					       
					        var iv= CryptoJS.lib.WordArray.random(16);
					     // alert("iv:::"+iv)
					       
					        var encrypted = CryptoJS.AES.encrypt(message, key, { iv: iv });
					      // alert("encrypted:::"+encrypted)
					       
					        var cipherData = iv.toString(CryptoJS.enc.Base64)+":"+encrypted.ciphertext.toString()+":"+key.toString(CryptoJS.enc.Base64);
					      // alert("cipherData:1::"+cipherData)
					       
					        //console.log("Encrypt Value:"+encrypted);
					        //console.log("Encrypt Value is : "+cipherData);
					        
					       
					        
					        document.getElementById("txtAadhar").value = cipherData;
					        
					        
					        
					        

						
				}
				
		</script>

<script>
function toggleButton() {
    var checkbox = document.getElementById("agree");
    var submitButton = document.getElementById("submitButton");

    // Enable the button if the checkbox is checked, otherwise disable it
    submitButton.disabled = !checkbox.checked;
  }
  
function agree() {
	
alert("agree function")
	$(".agree").show();	
}
</script>


<script>
function verify() {
	//alert("function");
	var inputfield = document.getElementById("aadhar_id");
	var aadhaar=inputfield.value;
	//alert('aadhaar' + aadhaar);
	
	var xxx = document.getElementById("student_name");
		var sname = xxx.value;

		//alert('sname' + sname);
		//alert("dfghj" + aadhaar);

		$
				.ajax({
					type : "POST",
					contentType : "application/json; charset=utf-8",
					url : "validateAadhar.html",
					data:  aadhaar + "&" + sname,

					dataType : 'text',
					beforeSend : function(xhr) {

						//alert('aadhaarINSIDE' + aadhaar);
						xhr.setRequestHeader("Accept", "application/json");
						xhr
								.setRequestHeader("Content-Type",
										"application/json");
						if ($("meta[name='_csrf_header']").attr("content") != undefined) {
							xhr.setRequestHeader($("meta[name='_csrf_header']")
									.attr("content"), $("meta[name='_csrf']")
									.attr("content"));
						}
					},
					success : function(output, textStatus, jqXHR) {
						if (typeof output === 'string') {
							  response = $.parseJSON(output);
							}
						var statusResult = response.status;
						//alert("output"+response);
						//alert("statusResult"+statusResult);
						if (statusResult=='SUCCESS')
						{
						$(".save").show();
						$(".msg").html("Aadhaar verified Successfully .").show().fadeOut(15000);
						}else if (statusResult=='ERROR'){
							
							$(".msg").html("Aadhaar doesn't match").show().fadeOut(15000);
						}
					},
					error : function(error) {
						//alert("success failure ::" + true);
						console.log(error);
						//$(".msg").html("Aadhaar doesn't match").show().fadeOut(15000);

					}
				});

	};
</script>
		<script type="text/javascript">
		$(document).ready(function()
		{
		 
			 $(".save").hide();
/*  			 $(".agree").hide();
 */ 
		     
		
		});
		</script>
</body>
</html>
 --%>