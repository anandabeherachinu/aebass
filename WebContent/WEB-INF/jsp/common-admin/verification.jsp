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
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-lRaz1LRdE5GhRIe5jSOv3d9YTF1S80rP1jWuVk2AQtMU+IMFo0JUHt/LqGqQzoV3" crossorigin="anonymous">
 



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

.fascinating-card .btn-submit {
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
    @media (min-width: 768px) and (max-width: 991px) {
    /* Custom styles for tablets */
    
    
}
.f .btn-submit {
	background-color: #333;
	color: #fff;
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
					

						<div> <!-- class="form-group "
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
<%-- 		<div class="container-fluid">
		
<!-- 		<div class="card" style="width: 18rem;">
  <img class="card-img-top" src="..." alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">Cras justo odio</li>
    <li class="list-group-item">Dapibus ac facilisis in</li>
    <li class="list-group-item">Vestibulum at eros</li>
  </ul>
  <div class="card-body">
    <a href="#" class="card-link">Card link</a>
    <a href="#" class="card-link">Another link</a>
  </div>
</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		 -->
		
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
</div> -->
				</div>

				
			</div>
		
	</div>


	
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
   <div class="row d-flex justify-content-center">
     <jsp:include page="include/footer.jsp" />
    </div>
</body>
</html>
