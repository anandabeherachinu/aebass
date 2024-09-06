<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<%
   response.setHeader( "Pragma", "no-cache" );
   response.setHeader( "Cache-Control", "private, no-cache, no-store, must-revalidate, proxy-revalidate" );
   response.setDateHeader( "Expires", 0 );
%>



<link rel="stylesheet" type="text/css"
	href="datepicker/jquery.datepick.css" />

<link rel="stylesheet" type="text/css"
	href="css/bootstrap-multiselect.css" />
<link href="/css/style.css" rel="stylesheet" type="text/css">
<head>
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/bootstrap-multiselect.css" />
 <!-- <link href="/css/style.css" rel="stylesheet" type="text/css"> -->
 
 
 <script type="text/javascript" src="datepicker/jquery.plugin.js"></script>
 <script type="text/javascript" src="datepicker/jquery.datepick.js"></script>
 <link rel="stylesheet" type="text/css"
href="datepicker/jquery.datepick.css" />
</head>
<body>
 
	<div class="row-fluid">
	<div id="page-title">      
  <div class="panel-heading">

                        <c:if test="${not empty MSGS}">

</c:if>

 
                </div>
               </div>
		<div class="box span12">
			<div class="box-content">
				<form:form method="post" modelAttribute="cb" class="form-horizontal">
					<%-- <form:hidden path="aadharNo" value="${b.aadharNo}" /> --%>

					<div class="panel panel-default">
						<div class="panel-heading panel-heading-custom panel-background"
							style="display: none">
							<h3 class="panel-title">Take Action</h3>
							
						</div>
						
						<!--  Lab -->
						<div class="panel-body">
						<div class="alert alert-success" >

                           <span id="id" class="msg">  </span>

                           </div>
							<table class="table_display">
								<tr>
									<td>Registration Number</td>
									<!-- <td>Aadhaar Number</td>
									<td>Mobile Number</td> -->

									<!-- <td>
 									
 								<textarea name="soremarksfifty" required="true" rows="10" cols="100" maxlength="1000">
 								</textarea>
 								</td> -->
								</tr>
								<tr>
									<td><form:input path="rollId"
											cssClass="pia_cmn_fld_cls form-control   " id="candName"
											placeholder="Candidate Name"
											onkeypress="return ValidateAlpha(event)"
											onpaste="return false;" onCopy="return false"
											onCut="return false" onDrag="return false"
											onDrop="return false" required="true"
											style='text-transform:uppercase' /> <span
										style="color: red;"><form:errors
												path="rollId" cssClass="error"></form:errors> </span></td>
									
									<!-- <td>
 									
 								<textarea name="soremarksfifty" required="true" rows="10" cols="100" maxlength="1000">
 								</textarea>
 								</td> -->
								</tr>
								<tr>
								 <%-- <td> 
								<a href="generateOTP.html?aadharNo=${b.aadharNo}" class="btn btn-success ls-modal" rel="Remark">Generate OTP</a>
								</td> --%>
						<!-- 		<td>
									<button type='button' class='btn btn-warning' id='otp_aadhaar'
										style="width: 150px;">Generate OTP</button>
                                     <input type="hidden" id="count" value="0"/>
								</td>
								
								<div id="loadIcon_div_id" style="display: none;" >
                                   <img src="images/ajaxLoading.gif" alt="loading..." style="width: 30px; height: 30px"  />
                            </div> -->
								</tr>
                               <tr>

								<%-- <td><form:input path="otp" id="otp_id"
										placeholder="OTP " cssClass="pia_cmn_fld_cls form-control"
										onkeypress="return isNumber(event)" onpaste="return false;"
										onCopy="return false" onCut="return false"
										onDrag="return false" onDrop="return false" required="true" />
								</td> --%>
								<td>
									<button type='button' class='btn btn-success' id='validate_otp'
										style="width: 50px;"><small>Verify</small></button>
                                     <input type="hidden" id="count" value="0"/>
								</td>
								
                             </tr>
   
							</table>

							<fieldset class="form-group"
								style="margin-left: 0px; margin-right: 0px;">
								<div class="form-group row" style="margin: 0px;">
									<label class="col-sm-4 col-form-label"> </label> <label
										class="col-sm-6 col-form-label"> <input type="submit"
										name="submit" value="Submit" class="btn btn-success checkotp" />

									</label>
								</div>
							</fieldset>
						</div>
					</div>
				</form:form>
			</div>

		</div>
	</div>


	<script type="text/javascript" src="datepicker/jquery.plugin.js"></script>
	<script type="text/javascript" src="datepicker/jquery.datepick.js"></script>

	<script>
		$(document)
				.on(
						'click',
						'#validate_otp ',
						function() {
							
							var aadhar = $('#aadhar_id').val();
							var otp=$('#otp_id').val();

							if (aadhar != undefined && aadhar != null
									&& aadhar != '') {
								$('#loadIcon_div_id').show();
								$('<div id="body_disable_div_id"></div>').css({
									position : 'absolute',
									background : 'transparent',
									width : '100%',
									height : '100%',
									top : 0,
									left : 0,
									'z-index' : 10000
	})     
	
	
//$("#success").html("");
$.ajax({
																				type : "GET",
											url : "./validateOTP.html",
											type:'GET',
											cache:false,
											dataType:'json',
											async:false,
											data : {
												aadhar : aadhar,otp : otp
											},
											beforeSend: function(xhr) {
										        xhr.setRequestHeader("Accept", "application/json");
										        xhr.setRequestHeader("Content-Type", "application/json");
											},
											success : function(output, textStatus, jqXHR) {
												//alert("response " + response);
												console.log("response "+output.status);
												//console.log("response "+response.res);
												$('#loadIcon_div_id').hide();
												if (output.status=='SUCCESS')
													{
													$(".checkotp").show();
													$(".msg").html("OTP verified Successfully .").show().fadeOut(15000);
													
												}else if (output.status=='ERROR'){
													
													$(".msg").html("OTP doesn't match").show().fadeOut(15000);
												}
												
												
												//document.getElementById("id").innerHTML += output.status;
												
											}

										});
							} else if (email == undefined || email == null
									|| email == '') {
								alert("Enter your email first.");
							} else if (mobileNo == undefined
									|| mobileNo == null || mobileNo == '') {
								alert("Enter your mobile no first.");
							}
						});
	</script>
	<script>
		$(document)
				.on('click',
						'#otp_aadhaar',
						function() {
					      
							var aadhar = $('#aadhar_id').val();
                            document.getElementById("candName").readOnly = "true";
                            document.getElementById("aadhar_id").readOnly = "true";
                            document.getElementById("mobileNo").readOnly = "true";
							if (aadhar != undefined && aadhar != null
									&& aadhar != '') {
								$('#loadIcon_div_id').show();
								$('<div id="body_disable_div_id"></div>').css({
									position : 'absolute',
									background : 'transparent',
									width : '100%',
									height : '100%',
									top : 0,
									left : 0,
									'z-index' : 10000
	})     
	
	
//$("#success").html("");
$.ajax({
																				type : "GET",
											url : "./generateOTP.html",
											data : {
												aadhar : aadhar
											},
											success : function(response) {

												$('#loadIcon_div_id').hide();
												document
														.getElementById("success").innerHTML += response;
												$('#otp_btn_idd').text(
														'Resend OTP');

												var count = parseInt(document
														.getElementById("count").value);

												count = parseInt(count) + 1;
												document
														.getElementById("count").value = count;
												//alert("count"+count,true);
												if (count > 3) {
													alert(
															"You Can Not Send More than 3 time.",
															true);

												} else {

													alert(response, true);
												}
												/* if(isOtpSend != undefined &&  isOtpSend != null && isOtpSend != false )
												 {
												 //$('#otp_label_id').html('Enter OTP send to your mail/mobile. <span style="color:red;">*</span>');
												 $('#otpNumber_txt_id').val('');
												 $('#otp_btn_idd').text('Resend OTP');
												 $('#captchaValue').val('');
												 //$('#captchaRefresh_btn_id').trigger('click');
												 alert("Enter OTP send to your mail.");
												 }
												 else
												 {
												 alert("OTP is not send.Please check you entered valid mobile no/mail or not. ");
												 } */
											}

										});
							} else if (email == undefined || email == null
									|| email == '') {
								alert("Enter your email first.");
							} else if (mobileNo == undefined
									|| mobileNo == null || mobileNo == '') {
								alert("Enter your mobile no first.");
							}
						});
	</script>
	<script type="text/javascript">
		$(document).ready(function()
		{
		 
			 $(".checkotp").hide();
		  
		     
		
		});
		</script>
</body>
</html>