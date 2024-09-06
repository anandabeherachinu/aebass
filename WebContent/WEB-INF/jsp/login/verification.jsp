<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<jsp:include page="../common-admin/head.jsp"></jsp:include>
<!-- <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script> -->
<script src="js/jquery-3.6.4.min.js"></script>

<style>
/* Custom CSS for the card */
.fascinating-card {
	padding: 100px 100px 175px 91px;
	margin-top: 90px;
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
</style>
<title>Fascinating Card Example</title>

</head>
<body>
	<jsp:include page="../common-admin/upper_block.jsp"></jsp:include>

	<div class="container-fluid">
		<div class="fascinating-card">
			<h2 class="text-center">Biometric Attendance System</h2>FGHJFGDG
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<!-- <form> -->
					<form:form class="form-horizontal" enctype="multipart/form-data"
						action="verification.html" method="post" modelAttribute="cb"
						autocomplete="off" onsubmit="openPopup()">
					

						<div class="form-group"
							style="margin-bottom: 10px !important; padding: unset !important;">
							<form:input path="rollId" type="text" class="form-control"
								id="textbox" placeholder="Enter Registration Number"
								oninput="checkInput()" />
						</div>
							
						<form:hidden path="txtData" rows="2" cols="20" id="txtData"
							class="remaining" style="width: 99%;"></form:hidden>


						<form:hidden path="txtDataRd" rows="2" cols="20" id="txtDataRd"
							class="remaining" style="width: 99%;"></form:hidden>
						<!-- </td> -->

					
						<button type="submit" class="btn btn-submit btn-block" style="width: unset; margin: auto;"  onclick="viewsuccesspopup();">Submit</button>
						<!-- </form> -->
					</form:form>

				</div>
			</div>
		</div>
	</div>
<%-- 	<form action="CandidatePlacement.html" method="get" >
 --%>	<div id="studentModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Student Information</h4>
				</div>
				<div class="modal-body">
				<p>${message}</p>
					<p>Here's some information about the student:</p>
					<img src="student_photo.jpg" class="img-circle" alt="Student Photo"
						style="width: 100px; height: 100px;">
					<p>Name: John Doe</p>
					<p>Registration Number: 12345678</p>
					<!-- Add more student information here -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
<%-- </form>
 --%>	
 <script>
        function viewsuccesspopup() {
            // Add logic to open the popup here (e.g., using a library like Bootstrap modal)
        	('#studentModal').modal('show');
        }
    </script>


</body>
</html>
