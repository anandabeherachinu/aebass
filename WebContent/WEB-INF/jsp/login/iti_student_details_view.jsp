<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.Random"%>
    <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
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
 <script src="js/popper.min.js"></script>
<script src="js/hash.js"></script>
<script src="js/jquery.base64.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script> -->
<script type="text/javascript" src="scripts/jqueryslidemenu.js"></script>
<script type="text/javascript" src="js/styleswitch.js"></script>
<script src="js/jquery-1.8.2.js"></script>
<script src="js/jquery-ui.js"></script>
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script> -->

    <script type="text/javascript" src="js/crypto-js.min.js"></script>



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

<div class="container-fluid px-1 py-5 mx-auto" style="margin-bottom: 0">
    <div class="row d-flex justify-content-center">
        <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
            <h3>Student Details</h3>
<!--             <p class="blue-text">Just answer a few questions<br> so that we can personalize the right experience for you.</p>
 -->            <div class="card">
<!--                 <h5 class="text-center mb-4">Powering world-class companies</h5>
 -->              
<%--  		 <form:form class="form-card" onsubmit="event.preventDefault()">
 --%>              
 		<form:form class="form-horizontal" enctype="multipart/form-data"
						action="featchCollegeAPIITI.html" method="post" modelAttribute="cb"
						autocomplete="off" onsubmit="submitForm()">
						 
							<div class="panel panel-default">
							
						<div class="panel-heading panel-heading-custom panel-background"
							style="display: none">
							<h3 class="panel-title">Take Action</h3>
							
						</div>
						<div class="panel-body">
						
						
								<%-- <div>
									<img src="${studentPhoto}" alt="Student Photo" width="100" height="100">
									<div class="hide">
									<form:input path="photo" value="${studentPhoto}" type="text"/></div>
								</div> --%>
								<!-- <div class="row"> -->
								
								<c:forEach var="s" items="${regnoITIstudent}">
			
								<div class="row justify-content-between text-left">
								
								<div class="form-group col-6 flex-column d-flex"> <label class="form-control-label px-3">Student Name<span class="text-danger"> *</span></label> <form:input path= "traineeName" type="text"  name="fname"  id="student_name" value="${s.traineeName}" readonly="true" onblur="validate(1)"/> </div>
					
                        <div class="form-group col-6 flex-column d-flex"> <label class="form-control-label px-3">Guardian Name<span class="text-danger"> *</span></label> <form:input path= "gardianName" type="text" id="lname" name="lname"  value="${s.gardianName}" readonly="true"  onblur="validate(2)"/> </div>
                    </div>
                    
                    
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-6 flex-column d-flex"> <label class="form-control-label px-3">Redg Number<span class="text-danger"> *</span></label> <form:input path= "applicationNo" type="text" placeholder="" value="${s.applicationNo}"  readonly="true"  onblur="validate(3)"/> </div>
                        <div class="form-group col-6 flex-column d-flex"> <label class="form-control-label px-3">Institute Name<span class="text-danger"> *</span></label> <form:input path= "itiName" type="text"  placeholder="" onblur="validate(4)" value="${s.itiName}" readonly="true" /> </div>
                    </div>
                  
                    
                      <div class="row justify-content-between text-left">
                        <div class="form-group col-6 flex-column d-flex"> <label class="form-control-label px-3">D.O.B<span class="text-danger"> *</span></label> <form:input path= "dob" type="text" value="${s.dob}" placeholder="" onblur="validate(3)" readonly="true" /> </div>
                        <div class="form-group col-6 flex-column d-flex"> <label class="form-control-label px-3">Trade<span class="text-danger"> *</span></label> <form:input path= "trade" type="text"  placeholder="" onblur="validate(4)" value="${s.trade}" readonly="true" /> </div>
                    </div>
                      <div class="hide">
                        <div class="form-group col-6 flex-column d-flex"> <label class="form-control-label px-3">Institute code<span class="text-danger"> *</span></label> 
                        <form:input path= "misItiCode" type="text" value="${s.misItiCode}" readonly="true"  /> </div>
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Category<span class="text-danger"> *</span></label> <form:input path= "catagory" type="text"  value="${s.catagory}" placeholder="" readonly="true"  onblur="validate(3)"/> </div>

                    </div>
                   
                       </c:forEach>
                   
                
                     <div class="row justify-content-between text-left">
                        <div class="form-group col-12 flex-column d-flex"> <label class="form-control-label px-3">Enter Aadhaar Number<span class="text-danger"> *</span></label> <form:input path="aadhaar" type="password" class="form-control"
								id="aadhar_id" placeholder="Enter Aadhaar Number" /> </div>
                    </div>
                     
                 <div class="row text-left">
                 <div class="col-12">
               
            <form:checkbox path="agree" id="agree" value="I agree to the terms and conditions" onchange="toggleButton()" required="required"/><!-- <h4>I agree to the terms and conditions.</h4> -->
                <form:label  for="agree" path="salt"  >I agree that the above details are true and the Aadhaar Number belongs to this student only. </form:label> </div>
                 </div>  
            
        
              
                    <!-- 	<div class="hide"><span id="Label1">Active RD Service
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
						</select></div> -->

					<%-- 	<div class="form-group"
							style="margin-bottom: 10px !important; padding: unset !important;">
							Enter Aadhaar Number
							<form:input path="aadhaar" type="text" class="form-control"
								id="aadhar_id" placeholder="Enter Aadhaar Number" />
								
						</div> --%>
				<%-- 		<form:hidden path="txtData" rows="2" cols="20" id="txtData"
							class="remaining" style="width: 99%;"></form:hidden>
						<!--                                        </td>
 -->
						<!-- 									  <td style="border: thin solid #000000;">
 -->
						<form:hidden path="txtDataRd" rows="2" cols="20" id="txtDataRd"
							class="remaining" style="width: 99%;"></form:hidden> --%>
<!-- <button type="submit" class="btn btn-submit btn-block" style="width: unset; margin: auto;">VERIFY</button>
 -->
 <div class="alert alert-success" >

                           <span id="id" class="msg">  </span>

                           </div>
 <button type='button' class='btn btn-success'  style="width: 100px;" onclick="verify();" id="submitButton" disabled><small>Verify</small></button>
<!--  <input type="submit" value="Verify" class="btn btn-success" style="width: 100px;" onclick="verify();" />
 --><!--      id="verify"  onclick="verify();"                                
 -->                                     <fieldset class="form-group"
								style="margin-left: 0px; margin-right: 0px;">
								<div class="form-group row" style="margin: 0px;">
									<label class="col-sm-4 col-form-label"> </label> <label
										class="col-sm-4 col-form-label"> <input type="submit"
										name="submit" value="Submit" class="btn btn-success save" />

									</label>
								</div>
							</fieldset>
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
 <!--  <script>
    // Get references to the checkbox and button elements
    const checkbox = document.getElementById('agree');
    const button = document.getElementById('verify');

    // Add an event listener to the checkbox
    checkbox.addEventListener('change', function() {
      // If the checkbox is checked, show the button; otherwise, hide it
      button.style.display = checkbox.checked ? 'inline-block' : 'none';
    });
  </script> -->

<script>
function verify() {
	//alert("function");
	var inputfield = document.getElementById("aadhar_id");
	//alert("function"+inputfield);
	var aadhaar=inputfield.value;
	 //alert("message::::"+aadhaar)
	 var message = document.getElementById("aadhar_id").value;
	     //alert("message::::"+message)
	       
	        var key = CryptoJS.lib.WordArray.random(16);
	      // alert("key:::"+key)
	       
	        var iv= CryptoJS.lib.WordArray.random(16);
	      //alert("iv:::"+iv)
	       
	        var encrypted = CryptoJS.AES.encrypt(message, key, { iv: iv });
	      // alert("encrypted:::"+encrypted)
	       
	        var cipherData = iv.toString(CryptoJS.enc.Base64)+":"+encrypted.ciphertext.toString()+":"+key.toString(CryptoJS.enc.Base64);
	      // alert("cipherData:1::"+cipherData)
	       
	    
	        
	       
	        
	        document.getElementById("aadhar_id").value = cipherData;
	        
	        
	
	var xxx = document.getElementById("student_name");
		var sname = xxx.value;
	       //alert("cipherData:1::"+sname)
	       //alert("cipherData:1::"+cipherData)

		//alert('sname' + sname);
		//alert("dfghj" + aadhaar);

		$
				.ajax({
					type : "POST",
					contentType : "application/json; charset=utf-8",
					url : "validateAadhar.html",
					data:  cipherData + "&" + sname,

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
				   <jsp:include page="include/footer.jsp" />
		
</body>
</html>
<%-- <%@page import="java.util.Random"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<body>
    <div>
        <p>${message}</p>
        <p>HERE THE MESSAGE</p>
        <!-- Add other content as needed -->
    </div>
    									
    
  <!--  <div id="studentModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Student Information</h4>
					<h3>edfhnjk</h3>
					
				</div> -->
				<div class="modal-body">
				<c:forEach var="s" items="${studentdata}" varStatus="count">		   
				
				<p>${message}</p>
					<p>Here's some information about the student:</p>
					<img src="student_photo.jpg" class="img-circle" alt="Student Photo"
						style="width: 100px; height: 100px;">
					<p>Name: ${s.studentName}</p>
					<p>Registration Number: ${s.rollId}</p>
					<P>Institute :${s.instituteCode}</P>
					<p> father name:${s.fathername}</p>
					</c:forEach>
					
					<!-- Add more student information here -->
				</div>
				<!-- <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
							<tr>
								<td>${s.rollId}</td>
								<td>${s.studentName}</td>
								<td>${s.instituteCode}</td>
								<td>${s.gender}</td>
								<td>${s.attendDate}</td>
								<td>${s.inTime}</td>
								<td>${s.outTime}</td>
								<td>${s.mobileNumber}</td>
								<!-- <td></td> -->
								
							</tr>
								
						
					
				</div>
			</div>
		</div>
	</div>

	
</body>
</html> --%>