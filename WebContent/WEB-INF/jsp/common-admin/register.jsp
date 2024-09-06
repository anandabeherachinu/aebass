 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--<link rel="stylesheet"
 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 --><jsp:include page="../common-admin/head.jsp"></jsp:include>
<!-- <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 -->	   	
 <script src="js/jquery-3.6.4.min.js"></script>
 
 <script src="js/bootstrap4.3.1.min.js"></script>
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
	margin-top: 10px;
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
.hide {
	display: none !important
}
.modal {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
background-color: rgba(0, 0, 0, 0.5);

 
/*  background-image: url('your-image-url.jpg');
 */}

.modal-content {
/*  background-image: url("images/yellow.jpg");
 */   background-color: #33b98f; 
  margin: 3.5% auto;
  padding: 7px;
  border: 4px solid darkred;
  width: 70%;
  max-width: 600px;
  border-radius: 15px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  font-size: 20px;
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  cursor: pointer;
}

.close:hover {
  color: #000;
}

#openModalBtn {
  padding: 10px;
  font-size: 16px;
  cursor: pointer;
}

#openModalBtn:hover {
  background-color: #ddd;
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
            gap: 20px;
        }

        .key {
            padding: 14px;
            text-align: center;
            border: 1px solid #e40d0d;
            border-radius: 5px;
            cursor: pointer;
            height:50px;
            font-size:large;
            background-color:#4bb5b1;
            color:white;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
 

 #viewTable {
 
    /* Add styles for the modal container */
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 20px;
  }
     .btn {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #45a049;
        }
   

  
</style>
<title>Capture</title>

</head>

<body>
	<jsp:include page="../common-admin/upper_block.jsp"></jsp:include>


<!-- <div class="container-fluid">
		<div class="fascinating-card">
			<h2 class="text-center">Biometric Attendance for Student</h2>
						<div class="row" >
					<div class="col-md-6" style="border: 1px solid #531c0e; border-radius:10px; background-color: #4bb5b1;box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
			
			
			<div class="row" > -->
			<div class="container-fluid f">
			<div class="container-fluid ">
			
		<div class="card" >
  <div class="card-body">
   <h3  style="text-align:center">Biometric Attendance for Student</h3>
   <div class="row" >
   <div class="col-6 col-sm-6 col-md-6">
   <div class="card" >
  <div class="card-body">
  <div class="row" >
			<div class="col-md-3"><img src="images/output-onlinegiftools.gif" alt="NIC logo"style="height:170px;margin-left:-118px;"></div>
				<div class="col-md-9" >
				
					<form:form class="form-horizontal" enctype="multipart/form-data"
						action="viewSuccess.html" method="post" modelAttribute="cb"
						autocomplete="off">
						
						
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
							<h3>Enter Registration No</h3>
							<form:input path="rollId" type="text" class="form-control"
								id="textbox" placeholder="Enter Registration Number"
								oninput="checkInput()"   />
						</div>
										<form:hidden path="txtData" rows="2" cols="20" id="txtData"
							class="remaining" style="width: 99%;"></form:hidden>
						<!--                                        </td>
 -->
						<!-- 									  <td style="border: thin solid #000000;">
 -->
						<form:hidden path="txtDataRd" rows="2" cols="20" id="txtDataRd" 
							class="remaining" style="width: 99%;"></form:hidden>
						
						<div class="hide">

						
				
		
		<table>
			<tr>
			
				<td width="100%">
					<table style=border:1;>
					<tr>
						<td width="20px">
							FCount:
						</td>
						
						<td>
							<input type="text" value="1" id="txtfcount" class="form-control" />
						</td>
						<td width="20px">
							FType:
						</td>
						<td>
							<input type="text" value="0" id="txtftype" class="form-control" />
						</td>
						<td width="20px">
							Format:
						</td>
						<td>
							<input type="text" value="0" id="txtformat" class="form-control" />
						</td>
						<td width="20px">
							PidVer:
						</td>
						<td>
							<input type="text" value="2.0" id="txtPidVer" class="form-control" />
						</td>
						<td width="20px">
							Timeout:
						</td>
						<td>
							<input type="text" value="10000" id="txttimeout" class="form-control" />
						</td>
						<td width="20px">
							env:
						</td>
						<td>
							<input type="text" value="P" id="txtenv" class="form-control" />
						</td>
						<td width="20px">
							Locking Key:
						</td>
						<td>
							<input type="text" value="" id="txtlk" class="form-control" />
						</td>
					</tr>					
					</table>
					
				</td>
				<td width="100%">
					<table style=border:1;>
						<tr>
							<td width="20%">Finger Position</td>
							<td><input type="text" value="UNKNOWN" id="txtposh" class="form-control" /></td>
						</tr>	
					</table>
				</td>
				<label>Pid Options</label>
				<textarea id="txtPidOptions" style="width: 100%; height:30px;" class="form-control"> </textarea>				
			</tr>
		</table>
		
		<table style=border:1;>
		<td width="20%">
			<tr>
					
			
				<td>Available RDService</td>
				<td colspan="6px"><select id="ddlRDS" class="form-control" style="width:100%;"><option></option></select></td>
			
			</tr>	
			</td>
		</table>
		<table style=border:1;>
		<tr>
			<label id="lblStatus"></label>
		</tr>
		</table>
		<table style="border:1;width:20%">
			<tr>
				<td><input class="btn btn-primary btn-200" onclick="this.disabled=true; this.value='Please Wait...'; discoverRDService(); this.value='Discover RDService'; this.disabled=false;" type="button" value="Discover RDService"></td>
				<td><input class="btn btn-primary btn-200" onclick="this.disabled=true; this.value='Please Wait...'; deviceInfo(); this.value='Device Info'; this.disabled=false;" type="button" value="Device Info"></td>
				<td><input type="button" class="btn btn-primary btn-200" onclick="this.disabled=true; this.value='Please Wait...'; Capture(); this.value='Capture'; this.disabled=false;" value="Capture"/></td>
				<td><input type="button" class="btn btn-primary btn-200" onclick="this.disabled=true; this.value='Please Wait...'; reset(); this.value='Reset'; this.disabled=false;" value="Reset"/></td>
			</tr>
		</table>
		<div >
		<label>RDService Info</label>
		<form:hidden path="txtRDSInfo" rows="2" cols="20" id="txtRDSInfo"
							class="remaining" style="width: 99%;"></form:hidden>
<!-- 		<textarea id="txtRDSInfo" style="width: 100%; height:30px;" class="form-control"> </textarea>
 -->		<label>Device Info</label>
 <form:hidden path="txtDeviceInfo" rows="2" cols="20" id="txtDeviceInfo"
							class="remaining" style="width: 99%;"></form:hidden>
<!-- 		<textarea id="txtDeviceInfo" style="width: 100%; height:150px;" class="form-control"> </textarea>
 -->		
		<label>Pid Data</label>
		<form:hidden path="txtPidData" rows="2" cols="20" id="txtPidData"
							class="remaining" style="width: 99%;"></form:hidden>
<!-- 		<textarea id="txtPidData" style="width: 100%; height:200px;" class="form-control"> </textarea>
 -->		
		</div>
		</div>
						
						
						</form:form>
						</div>
						</div>
						</div>
						</div>
						</div>
					
						<div class="col-6 col-sm-6 col-md-6">
				 <div class="keypad" id="employeeIdKeypad">
                
            
</div>
</div>
						</div>
						</div>
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

        // Create keypad buttons dynamically     maxlength="12" --%>
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
    <script>
 function checkInput(deviceinfo) {
		var inputField = document.getElementById("textbox");
		//if (inputField.value.length === 12) {
			//alert("registarationnumberinputField"+inputField.value);
			var regNo=inputField.value;
 				//alert("regNo"+regNo);
 		

			captureFPAuth(regNo,deviceinfo)
			// Open the modal when 12 characters are entered
			           // $('#studentModal').modal('show');
				//alert(" ENTER INTO captureFPAuth");

			
		//}
	}

</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#deptpaging').DataTable({

			'language' : {
				'search' : '_INPUT_',
				'searchPlaceholder' : 'Search Sector'
			},
			"stateSave" : true
		});
	});
</script>
<!-- Data table End -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						//alert('foxbase');
						history.replaceState(null, document.title,
								location.pathname + "#!/");
						history.pushState(null, document.title,
								location.pathname);
						window.addEventListener('popstate',
								function(event) {
									history.pushState(null, document.title,
											location.pathname);
								}, false);
						//alert('data: ' );  

						var port;
						var urlStr = '';
						//alert('data2: ' );  

						//document.getElementById("txtData").value = String("");
						if (useHTTPS) {
							 //alert('data: if ' );  
							port = document
									.getElementById("DrpPortSelectionHttps");
							urlStr = 'https://'
									+ hostName
									+ ':'
									+ port.options[port.selectedIndex].value
									+ '/rd/info?ts=' + Date.now();
						} else {
							 //alert('data: else ' );  
							port = document
									.getElementById("DrpPortSelection");
							urlStr = 'http://'
									+ hostName
									+ ':'
									+ port.options[port.selectedIndex].value
									+ '/rd/info?ts=' + Date.now();
						}
						//alert('data: else outside ' );  
						getJSON_info(urlStr,function(err, data) {
									if (err != null) {
									//alert('Something went wrong: '
									//			+ err);
										discoverRDService()
										
										deviceInfo()
										
										var deviceData=document.getElementById("txtDeviceInfo").value
										//alert('deviceData'+deviceData);
										var inputField = document.getElementById("textbox");
										var regNo=inputField.value;
										//alert("regNo"+regNo);
										Capture(deviceData,regNo)
										
										
									} else {
										//alert('else');  //foxbase goes to else
										//alert('data: ' + data.replace(/"/g, '\\"'));
										var deviceData=document.getElementById("txtData").value = String(data
												.replace(
														'xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"',
														''));
										document.getElementById("txtDataRd").value = String(data.replace('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>',''));

										deviceinfo=document.getElementById("txtDataRd").value;
/* 										 alert("devicedataoriginal"+deviceinfo);
 */									 checkInput(deviceinfo)										 
									}
								});
					});
</script>
<script type="text/javascript">
	var count = 0;
	var actCount = 0;
	var isHTTPFound = false;
	var isHTTPSFound = false;
	var useHTTPS = false;
	var exceptionErr = '';
	var hostName = 'localhost';

	function scanMultiPorts() {
		count = 0;
		var req = new Array(5);

		if (location.protocol === 'https:') {
			scanForRDSrvcHTTPS(null, 11200);

			for (var jk = 0; jk < 5; jk++) {
				var tmpPortNo = (11100 + jk);
				if (window.XMLHttpRequest) {
					try {
						req[jk] = new XMLHttpRequest();
						req[jk].open('DEVICEINFO', 'https://' + hostName
								+ ':' + String(tmpPortNo) + '/rd/info?ts='
								+ Date.now(), true);
					} catch (e) {
						req[jk] = new ActiveXObject("Microsoft.XMLHTTP");
						req[jk].open('DEVICEINFO', 'https://' + hostName
								+ ':' + String(tmpPortNo) + '/rd/info?ts='
								+ Date.now(), true);
					}

				} else {
					req[jk] = new ActiveXObject("Microsoft.XMLHTTP");
					req[jk].open('DEVICEINFO', 'https://' + hostName + ':'
							+ String(tmpPortNo) + '/rd/info?ts='
							+ Date.now(), true);
				}

				scanForRDSrvcHTTPS(req[jk], tmpPortNo);
			}

		} else if (location.protocol === 'http:') {
			scanForRDSrvcHTTPS(null, 11200);

			for (var jk = 0; jk < 5; jk++) {
				var tmpPortNo = (11100 + jk);
				if (window.XMLHttpRequest) {
					try {
						req[jk] = new XMLHttpRequest();
						req[jk].open('DEVICEINFO', 'http://' + hostName
								+ ':' + String(tmpPortNo) + '/rd/info?ts='
								+ Date.now(), true);
					} catch (e) {
						req[jk] = new ActiveXObject("Microsoft.XMLHTTP");
						req[jk].open('DEVICEINFO', 'http://' + hostName
								+ ':' + String(tmpPortNo) + '/rd/info?ts='
								+ Date.now(), true);
					}

				} else {
					req[jk] = new ActiveXObject("Microsoft.XMLHTTP");
					req[jk].open('DEVICEINFO', 'http://' + hostName + ':'
							+ String(tmpPortNo) + '/rd/info?ts='
							+ Date.now(), true);
				}
				scanForRDSrvc(req[jk], tmpPortNo);
			}
		}

	}

	//SCAN HTTP PORTS
	function scanForRDSrvc(xhr, portNo) {
		try {
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						callbackScan(null, xhr.responseText, portNo);
					} else {
						callbackScan(xhr.status, null, portNo);
					}
				}
			};
			xhr.send();

		} catch (e) {
			if (e.message === exceptionErr) {
			} else {
				exceptionErr = e.message;
				//alert("HTTP ERROR - " + exceptionErr);
			}
			callbackScan(status);
		}
	}

	function callbackScan(err, data, portNoarg) {
		count++;
		if (err != null) {
			scanForRDSrvcHTTPS(null, portNoarg);
		} else {
			var retString = String(data).toUpperCase();
			if (retString.search("STARTEK.ACPL") > 0) {
				actCount++;
				isHTTPFound = true;
				var opt = document.createElement("option");
				if (retString.search("STARTEK.ACPL") > 0) {
					var tmpStr = retString
							.substr(retString.search('MI="') + 4);
					opt.text = portNoarg + ' : '
							+ tmpStr.substr(0, tmpStr.search('"'));
				}
				opt.value = portNoarg;
				document.getElementById("DrpPortSelection").options
						.add(opt);
				document.getElementById("lblRDStat").innerHTML = 'RD Service is ACTIVE';
				document.getElementById("lblRDStat").style.color = 'Green';
				document.getElementById("DrpPortSelection").selectedIndex = 0;

				enableControls();

				HttpSelChange();
				scanForRDSrvcHTTPS(null, portNoarg);
			}
			if (isHTTPFound && isHTTPSFound) {
				document.getElementById('radioDiv').style.display = 'block';
				document.getElementById("DrpPortSelection").disabled = true;
				document.getElementById("DrpPortSelectionHttps").disabled = false;
				useHTTPS = true;
			} else if (isHTTPFound && !isHTTPSFound) {
				document.getElementById('radioDiv').style.display = 'none';
				document.getElementById("DrpPortSelection").disabled = false;
				document.getElementById("DrpPortSelectionHttps").disabled = true;
				useHTTPS = false;
			} else if (!isHTTPFound && isHTTPSFound) {
				document.getElementById('radioDiv').style.display = 'none';
				document.getElementById("DrpPortSelection").disabled = true;
				document.getElementById("DrpPortSelectionHttps").disabled = false;
				useHTTPS = true;
			}
		}
		if (count >= 5) {
			setControls();
		}
	}
	var getJSON_info = function(url, callback) {
		var xhr;
		if (window.XMLHttpRequest) {
			try {
				xhr = new XMLHttpRequest();
				xhr.open('DEVICEINFO', url, true);
			} catch (e) {
				xhr = new ActiveXObject("Microsoft.XMLHTTP");
				xhr.open('DEVICEINFO', url, true);
			}
		} else {
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
			xhr.open('DEVICEINFO', url, true);
		}

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					callback(null, xhr.responseText);
				} else {
					callback(status);
				}
			}
		};
		xhr.send();
	};

	var deviceinfo;
	function captureFPAuth(regNo,deviceData) {
		var port;
		var urlStr = '';
		//alert("fghjfgh");
		if (useHTTPS) {
			port = document.getElementById("DrpPortSelectionHttps");
			urlStr = 'https://' + hostName + ':'
					+ port.options[port.selectedIndex].value
					+ '/rd/capture?ts=' + Date.now();
			//alert(urlStr);
			console.log(urlStr);
		} else {
			port = document.getElementById("DrpPortSelection");
			urlStr = 'http://' + hostName + ':'
					+ port.options[port.selectedIndex].value
					+ '/rd/capture?ts=' + Date.now();
		}

		getJSONCapture(
				urlStr,
				function(err, data) {
					if (err != null) {
						//alert('Something went wrong: ' + err);
						//alert('GOES TO ERROR');
					} else {
						 //alert("data ORGINAL"+data); 
						console.log("data ORGINAL"+data);
						document.getElementById("txtDataRd").value = String(data);
						var a = document.getElementById("txtDataRd").value;
						var b = document.getElementById("txtDataRd").value;
	//document.getElementById("txtDataRd").value = String(a.replace('xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"',''));
	console.log("a"+document.getElementById("txtDataRd").value);
	document.getElementById("txtDataRd").value = String(b.replace('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>',''));
	console.log("b"+document.getElementById("txtDataRd").value);
	//document.getElementById("txtDataRd").value = String(a.replace('/^<\?xml.*\?>/', '');
	//alert("b"+document.getElementById("txtDataRd").value);
	//alert("b"+document.getElementById("txtDataRd").value);
	console.log("SSSSSS"+document.getElementById("txtDataRd").value);
						//var b = document.getElementById("txtDataRd").value;
				
						console.log("OR" + data);
						
						console.log("obj" + b);
						 //alert("obj1" + data);
							//alert("regNo1"+regNo);
							//alert("abcd"+deviceinfo);  
							 var rddata=document.getElementById("txtDataRd").value;
							// alert("rddata" + rddata);

						 
						
						$.ajax({
							type: "POST",
							contentType : "application/json; charset=utf-8",
							url : "getRDdata.html",
						    data:  rddata + "&" + regNo +"&" + deviceinfo,
						  
							dataType : 'text',
							beforeSend : function(xhr) {
								
							/*  alert("data"+data);
							alert("regNo1"+regNo);
							alert("abcd"+deviceinfo);  */ 

								xhr.setRequestHeader("Accept",
										"application/json");
								xhr.setRequestHeader("Content-Type",
										"application/json");
								if ($("meta[name='_csrf_header']").attr(
										"content") != undefined) {
									xhr.setRequestHeader($(
											"meta[name='_csrf_header']")
											.attr("content"), $(
											"meta[name='_csrf']").attr(
											"content"));
								}
							},
							success : function(data1) {
								if (typeof data1 === 'string') {
									  response = $.parseJSON(data1);
									}
								/* alert("data1"+data1);
								alert("response"+response);  */
							var statusResult = response.status;
							console.log("data1"+response.status);

					//alert("data"+data);
					 //alert("gvjhbk"+statusResult);  
					 //  if (statusResult == 'Success') {
						 if(response.ret=='y' && !response.outTime ){
				            // Open the modal
				           // $('.modal-content').text(statusResult);//APPEND
				        /*    $('#viewTable').append(
				                    '<tbody>' + 

				                        '<tr>' +
            			'<td><img src="' + response.photo + '" alt="Student Photo" style="height:81px;" /></td>' +
				                           '<td>' + response.studentName + '</td>' +
				                           '<td>' + response.rollId  + '</td>' +
				                           '<td>' +response.inTime + '</td>' +
				                           '<td>' +response.outTime + '</td>' +
				                           '<td>' +response.attendDate + '</td>' +

				                        '</tr>' +
				                     '</tbody>'
				                     );  */
				                   // $('#viewTable').append('<img src="' + response.photo + '" />');//for view image in popup
				   			//$('#viewTable').append('<h6><img src="' + response.photo + '" alt="Student Photo" style="height:165px;border-radius:33px; margin-left:180px !important;border: 2px solid #0b0a0a;" /></h6>'+
                  
			$('#viewTable').append('<h6><img src="' + response.photo + '" alt="Student Photo" style="height:165px;border-radius:15px; border: 2px solid #0b0a0a;" /></h6>'+
			'<div style="margin-left:33px !important;"><h3>Name     : ' +response.studentName + '</h3>'+
					'<h3>Regd.No : ' +response.rollId + '</h3>'+
					'<h3>Date:' +response.date + '</h3>'+
					'<h3>InTime   : ' +response.inTime + '</h3></div>'
					
					);
				            $("#yourModalId").modal("show");
				           
						   //$("#yourModalId").modal(data1);
				        } 
						 else if(response.ret=='y'){
							 //alert(response.outTime);
							 $('#viewTable').append('<h6><img src="' + response.photo + '" alt="Student Photo" style="height:165px;border-radius:15px; border: 2px solid #0b0a0a;" /></h6>'+
										'<div style="margin-left:33px !important;"><h3>Name     : ' +response.studentName + '</h3>'+
												'<h3>Regd.No : ' +response.rollId + '</h3>'+
												'<h3>Date:' +response.date + '</h3>'+
												'<h3>InTime   : ' +response.inTime + '</h3>'+
												'<h3>Out Time : ' +response.outTime + '</h3></div>'
												
												);
							 $("#yourModalId").modal("show");
						 }
						 
						 else  {
						 
				            // Handle other conditions if needed
				            console.error("Unexpected status:", statusResult);
				            $("#yourModalIde").modal("show");
				        }

							},
							error : function(error) {
								//alert("gvbhjn");
								$("#yourModalIde").modal("show");
								//alert("success failure ::" + true);
								console.log(error);
							}
						}); 
					

					
					}
				});
	}

	var getJSONCapture = function(url, callback) {
		var xhr;

		if (window.XMLHttpRequest) {
			try {
				xhr = new XMLHttpRequest();
				xhr.open('CAPTURE', url, true);
				xhr.responseType = 'text';
			} catch (e) {
				xhr = new ActiveXObject("Microsoft.XMLHTTP");
				xhr.open('CAPTURE', url, true);
			}
		} else {
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
			xhr.open('CAPTURE', url, true);
		}

		var finalDemoStr = '<Demo></Demo>';

		var port;

		if (useHTTPS) {
			port = document.getElementById("DrpPortSelectionHttps");
		} else {
			port = document.getElementById("DrpPortSelection");
		}

		/* var InputXml = "<PidOptions> <Opts fCount=\"2\" fType=\"2\" iCount=\"0\" pCount=\"0\" format=\"0\" pidVer=\"2.0\" timeout=\"20000\" otp=\"\" posh=\"UNKNOWN\" env=\"PP\" wadh=\"\" /> " 
			+ finalDemoStr + "</PidOptions>"; */ /* LOCAL */
		 var InputXml = "<PidOptions> <Opts fCount=\"1\" fType=\"2\" iCount=\"0\" pCount=\"0\" format=\"0\" pidVer=\"2.0\" timeout=\"20000\" otp=\"\" posh=\"UNKNOWN\" env=\"PP\" wadh=\"\" /> " 
				+ finalDemoStr + "</PidOptions>"; /* PRODUCTION */
/* 				 var InputXml = "<PidOptions ver=\"1.0\"> <Opts fCount=\"1\" fType=\"2\" iCount=\"0\" pCount=\"0\" format=\"0\" pidVer=\"2.0\" timeout=\"20000\" otp=\"\" posh=\"UNKNOWN\" env=\"P\" wadh=\"\" /> " + finalDemoStr + "<CustOpts> <Param name=\"ValidationKey\" value=\"\" /> </CustOpts> </PidOptions>";
 */
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					callback(null, xhr.responseText);
				} else {
					callback(status);
				}
			}
		};
		xhr.send(InputXml);
	};
</script>

</script>	
	<script language="javascript" type="text/javascript">
	
		var finalUrl="";
		var MethodInfo="";
		var MethodCapture="";
		var finalport="";
		
		function reset()
		{
			$('#txtfcount').val('1');
			$('#txtftype').val('0');
			$('#txtformat').val('0');
			$('#txtPidVer').val('2.0');
			$('#txttimeout').val('10000');
			$('#txtenv').val('P');
			$('#txtlk').val('');
			$('#txtposh').val('UNKNOWN');
			$('#txtRDSInfo').val('');
			$('#txtDeviceInfo').val('');
			$('#txtPidOptions').val('');
			$('#txtPidData').val('');
		    $("select#ddlRDS").prop('selectedIndex', 0);
		    
			
		}
		
		
		
		$( "#ddlRDS" ).change(function() {
		
		
		discoverAvdmFirstNode($("#ddlRDS").val());
	    });
			
		
		
		function discoverFirstNode(PortNo)				// Get the Status of the RDService found by discoverRDService()
		{
			$('#txtDeviceInfo').val('');
			$('#txtPidOptions').val('');
			$('#txtPidData').val('');
			
		//alert(PortNo);
		
			var primaryUrl = "http://127.0.0.1:";
            url = "";
			var verb = "RDSERVICE";
            var err = "";
			var res;
			$.support.cors = true;
			var httpStaus = false;
			var jsonstr="";
			var data = new Object();
			var obj = new Object();
				
			$.ajax({
				type: "RDSERVICE",
				async: false,
				crossDomain: true,
				url: primaryUrl + PortNo,
				contentType: "text/xml; charset=utf-8",
				processData: false,
				cache: false,
				async:false,
				crossDomain:true,
				success: function (data) {
					var xmlstr = data.xml ? data.xml : (new XMLSerializer()).serializeToString(data);
					//alert(xmlstr);
					data = xmlstr;
					//alert(data);
					httpStaus = true;
					res = { httpStaus: httpStaus, data: data };
				   // alert(data);		
					$('#txtRDSInfo').val(data);
							 
					var $doc = $.parseXML(data);
							
					for(var j=0;j<2;j++)
					{
						if($($doc).find('Interface').eq(j).attr('id') == 'CAPTURE')
						{
							MethodCapture=$($doc).find('Interface').eq(j).attr('path');
						}else if($($doc).find('Interface').eq(j).attr('id') == 'DEVICEINFO')
						{
							MethodInfo=$($doc).find('Interface').eq(j).attr('path');
						}
					}
					
					//alert("Precision RDSERVICE Discover Successfully");
				},
				error: function(msg) {
                        var result = msg.status + msg.statusText + msg.responseText;
                       // alert( result);
                        
                    }
			});
				
			return res;	
							
		}
		
		
		
		
		 function discoverRDService()				// Search for the valid RDService from port 11100 to 11120
		{
			 //alert('enter into rd dervice');
            var primaryUrl = "http://127.0.0.1:";
			var tempcount = 0;
            url = "";
			$("#ddlRDS").empty();
			//alert("Discovering Precision RDService.\nPlease wait for some time.");
			
            for (var i = 11100; i <= 11120; i++)
			{
				<!-- $("#lblStatus").text("Discovering RD service on port : "); -->
                <!-- $("#lblStatus").text("Discovering RD service on port : " + i.toString()); -->
               
				var verb = "RDSERVICE";
                var err = "";
			
			//alert(i);
				var res;
				$.support.cors = true;
				var httpStaus = false;
				var jsonstr="";
				var data = new Object();
				var obj = new Object();
				var xmlstr;
						
				$.ajax({
      				type: "RDSERVICE",
					async: false,
					crossDomain: true,
					url: primaryUrl + i.toString(),
					contentType: "text/xml; charset=utf-8",
					processData: false,
					cache: false,
					async:false,
					crossDomain:true,
					
					success: function (data) {
					try{
						xmlstr = data.xml ? data.xml : (new XMLSerializer()).serializeToString(data);
						//alert('xmlstr'+xmlstr);
						data = xmlstr;
							
						httpStaus = true;
						res = { httpStaus: httpStaus, data: data };
					    //alert('data'+data);		
						finalUrl = primaryUrl + i.toString();
						
						var $doc = $.parseXML(xmlstr);
						var CmbData1 =  $($doc).find('RDService').attr('status');
						var CmbData2 =  $($doc).find('RDService').attr('info');
							
						$("#ddlRDS").append('<option value='+i.toString()+'>Port : '+i.toString()+' Status : ' + CmbData1 +'('+CmbData2+')</option>')
						tempcount++;
						}
						catch(e){}
					},
					error: function(msg) {
                        var result = msg.status + msg.statusText + msg.responseText;
                       // alert( result);
                        
                    }
				});
				
				if(xmlstr != null)
				{
					if(xmlstr.indexOf('Precision') > 0)
					{
					//alert(xmlstr);
						
						$("select#ddlRDS").prop('selectedIndex', tempcount-1);
						finalport=i.toString();
						discoverFirstNode(i);
						break;
					}
				}
						
			}
			
					
				   
			
			return res;	
							
		} 
		
		
		function deviceInfo()						// Get Device Info from the path given by RDService Info
		{
			//alert('enter intodevice info');
			url = "";
			finalUrl="http://127.0.0.1:"+finalport;
			//finalUrl="https://127.0.0.1:"+finalport+"/rd/info";

			var verb = "DEVICEINFO";
           // alert(finalUrl);
                        
            var err = "";
			var res;
			$.support.cors = true;
			var httpStaus = false;
			var jsonstr="";
			$.ajax({
    			type: "DEVICEINFO",
				async: false,
				crossDomain: true,
				url: finalUrl+MethodInfo,
				contentType: "text/xml; charset=utf-8",
				processData: false,
				success: function (data) {
					var xmlstr = data.xml ? data.xml : (new XMLSerializer()).serializeToString(data);
					//alert('xmlstr'+xmlstr);
					data = xmlstr;
					//alert('url check pricisionstartek'+url);
					httpStaus = true;
					res = { httpStaus: httpStaus, data: data };
					//alert('httpStaus'+httpStaus);			
					$('#txtDeviceInfo').val(data);
					//alert('httpStaus1'+httpStaus);			

				},
				error: function(msg) {
                        var result = msg.status + msg.statusText + msg.responseText;
                       // alert( 'result'+result);
                        
                    }
			});
			return res;
								
                
		}
		
		
		
		function Capture(deviceData,regNo)						// Get Capture Info from the path given by RDService Info
		{
	//alert('into capture pricision');
			var fCount = document.getElementById('txtfcount').value;
			var fType = document.getElementById('txtftype').value;
			var format = document.getElementById('txtformat').value;
			var pidver = document.getElementById('txtPidVer').value;
			var timeout = document.getElementById('txttimeout').value;
			var env = document.getElementById('txtenv').value;
			var lock = document.getElementById('txtlk').value;
			var posh = document.getElementById('txtposh').value;
			//alert('into capture pricision2');

			finalUrl="http://127.0.0.1:"+finalport;
			//finalUrl="https://127.0.0.1:"+finalport+"/rd/capture";;

	   
		// Form input Pid OPtions for capture Input
		//var XML='<?xml version="1.0"?> <PidOptions ver="1.0"> <Opts fCount="1" fType="2" format="'+ format +'" pidVer="'+ pidver +'" timeout="'+ timeout +'" env="'+ env +'" posh="'+ posh +'" /> <CustOpts> <Param name="LockingKey" value="'+lock +'" /> </CustOpts> </PidOptions>';
		var XML='<PidOptions ver="1.0"> <Opts fCount="1" fType="2" format="'+ format +'" pidVer="'+ pidver +'" timeout="'+ timeout +'" env="PP" /> <CustOpts> <Param name="LockingKey" value="'+lock +'" /> </CustOpts> </PidOptions>';

		var verb = "CAPTURE";
            var err = "";
			var res;
			$.support.cors = true;
			var httpStaus = false;
			var jsonstr="";
			$.ajax({
      			type: "CAPTURE",
				async: false,
				crossDomain: true,
				url: finalUrl+MethodCapture,
				data:XML,
				contentType: "text/xml; charset=utf-8",
				processData: false,
				success: function (data) {
					var xmlstr = data.xml ? data.xml : (new XMLSerializer()).serializeToString(data);
					//alert("xmlstr"+xmlstr);
					console.log("xmlstr"+xmlstr);
					data = xmlstr;
				//alert("XML"+XML);
				/* alert("xmlstr"+xmlstr);
					alert("data"+data);
					alert("regNo1"+regNo);
					alert("abcd"+deviceData);  */
					/* 	console.log("XML"+XML);
					console.log("xmlstr"+xmlstr);
					console.log("data"+data);
					console.log("regNo1"+regNo);
					console.log("abcd"+deviceData);  */
					httpStaus = true;
					res = { httpStaus: httpStaus, data: data };
							
					$('#txtPidData').val(data);
					$('#txtPidOptions').val(XML);
								
					var $doc = $.parseXML(data);
					//alert("$doc"+$doc); 
					console.log("$doc"+$doc);


					$.ajax({
						type: "POST",
						contentType : "application/json; charset=utf-8",
						url : "getRDdata.html",
					    data:  data + "&" + regNo +"&" + deviceData,
					  
						dataType : 'text',
						beforeSend : function(xhr) {
							
						 //alert("data"+data);
						 /* alert("regNo1"+regNo);
						alert("abcd"+deviceData); 
 */
							xhr.setRequestHeader("Accept",
									"application/json");
							xhr.setRequestHeader("Content-Type",
									"application/json");
							//alert("abcd3"+deviceData); 

							if ($("meta[name='_csrf_header']").attr(
									"content") != undefined) {
								xhr.setRequestHeader($(
										"meta[name='_csrf_header']")
										.attr("content"), $(
										"meta[name='_csrf']").attr(
										"content"));
								//alert("abcd2"+deviceData); 

							}
						},
						success : function(data1) {
							 if (typeof data1 === 'string') {
								  response = $.parseJSON(data1);
								} 
							//alert("data1"+data1);
							//alert("response"+response); 
						var statusResult = response.status;
						console.log("data1"+response.status);

				//alert("data"+data);
				// alert("gvjhbk"+statusResult); 
				 console.log("gvjhbk"+statusResult);
				 if(response.ret=='y' && !response.outTime ){
			            // Open the modal
			           // $('.modal-content').text(statusResult);//APPEND
			        /*    $('#viewTable').append(
			                    '<tbody>' + 

			                        '<tr>' +
     			'<td><img src="' + response.photo + '" alt="Student Photo" style="height:81px;" /></td>' +
			                           '<td>' + response.studentName + '</td>' +
			                           '<td>' + response.rollId  + '</td>' +
			                           '<td>' +response.inTime + '</td>' +
			                           '<td>' +response.outTime + '</td>' +
			                           '<td>' +response.attendDate + '</td>' +

			                        '</tr>' +
			                     '</tbody>'
			                     );  */
			                   // $('#viewTable').append('<img src="' + response.photo + '" />');//for view image in popup
			   			//$('#viewTable').append('<h6><img src="' + response.photo + '" alt="Student Photo" style="height:165px;border-radius:33px; margin-left:180px !important;border: 2px solid #0b0a0a;" /></h6>'+
           
		$('#viewTable').append('<h6><img src="' + response.photo + '" alt="Student Photo" style="height:165px;border-radius:15px; border: 2px solid #0b0a0a;" /></h6>'+
		'<div style="margin-left:33px !important;"><h3>Name     : ' +response.studentName + '</h3>'+
				'<h3>Regd.No : ' +response.rollId + '</h3>'+
				'<h3>Date:' +response.date + '</h3>'+
				'<h3>InTime   : ' +response.inTime + '</h3></div>'
				
				);
			            $("#yourModalId").modal("show");
			           
					   //$("#yourModalId").modal(data1);
			        } 
					 else if(response.ret=='y'){
						 //alert(response.outTime);
						 $('#viewTable').append('<h6><img src="' + response.photo + '" alt="Student Photo" style="height:165px;border-radius:15px; border: 2px solid #0b0a0a;" /></h6>'+
									'<div style="margin-left:33px !important;"><h3>Name     : ' +response.studentName + '</h3>'+
											'<h3>Regd.No : ' +response.rollId + '</h3>'+
											'<h3>Date:' +response.date + '</h3>'+
											'<h3>InTime   : ' +response.inTime + '</h3>'+
											'<h3>Out Time : ' +response.outTime + '</h3></div>'
											
											);
						 $("#yourModalId").modal("show");
					 }
					 
					 else  {
					 
			            // Handle other conditions if needed
			            console.error("Unexpected status:", statusResult);
			            $("#yourModalIde").modal("show");
			        }

						},
				
				error : function(error) {
					//alert("gvbhjn");
					$("#yourModalIde").modal("show");
					//alert("success failure ::" + true);
					console.log(error);
				}
			}); 
				},
				error: function(msg) {
                        var result = msg.status + msg.statusText + msg.responseText;
                        //alert( result);
                        
                    }
			});
						
			return res;
			    
		}
		function getHttpError(jqXHR) {
		    var err = "Unhandled Exception";
		    if (jqXHR.status === 0) {
		        err = 'Service Unavailable';
		    } else if (jqXHR.status == 404) {
		        err = 'Requested page not found';
		    } else if (jqXHR.status == 500) {
		        err = 'Internal Server Error';
		    } else if (thrownError === 'parsererror') {
		        err = 'Requested JSON parse failed';
		    } else if (thrownError === 'timeout') {
		        err = 'Time out error';
		    } else if (thrownError === 'abort') {
		        err = 'Ajax request aborted';
		    } else {
		        err = 'Unhandled Error';
		    }
		    return err;
		}
	</script>


  <script>
  
  function appendNumber(value) {
	  //alert(value);
  if(value =='Clear'){
	  
	  document.getElementById('textbox').value=''
	  }
  
      document.getElementById('textbox').value += value;
  }
</script>
		
		 
<!-- 							<script>
    // Function to disable the input field
    function disableInput() {
        document.getElementById("textbox").disabled = true;
    }

    // Call the function to disable the input field
    disableInput();
</script>	
	<script language="javascript" type="text/javascript">
	
		var finalUrl="";
		var MethodInfo="";
		var MethodCapture="";
		var finalport="";
		
		function reset()
		{
			$('#txtfcount').val('1');
			$('#txtftype').val('0');
			$('#txtformat').val('0');
			$('#txtPidVer').val('2.0');
			$('#txttimeout').val('10000');
			$('#txtenv').val('P');
			$('#txtlk').val('');
			$('#txtposh').val('UNKNOWN');
			$('#txtRDSInfo').val('');
			$('#txtDeviceInfo').val('');
			$('#txtPidOptions').val('');
			$('#txtPidData').val('');
		    $("select#ddlRDS").prop('selectedIndex', 0);
		    
			
		}
		
		
		
		$( "#ddlRDS" ).change(function() {
		
		
		discoverAvdmFirstNode($("#ddlRDS").val());
	    });
			
		
		
		function discoverFirstNode(PortNo)				// Get the Status of the RDService found by discoverRDService()
		{
			$('#txtDeviceInfo').val('');
			$('#txtPidOptions').val('');
			$('#txtPidData').val('');
			
		alert('PortNo'+PortNo);
		
			var primaryUrl = "http://127.0.0.1:";
            url = "";
			var verb = "RDSERVICE";
            var err = "";
			var res;
			$.support.cors = true;
			var httpStaus = false;
			var jsonstr="";
			var data = new Object();
			var obj = new Object();
				
			$.ajax({
				type: "RDSERVICE",
				async: false,
				crossDomain: true,
				url: primaryUrl + PortNo,
				contentType: "text/xml; charset=utf-8",
				processData: false,
				cache: false,
				async:false,
				crossDomain:true,
				success: function (data) {
					var xmlstr = data.xml ? data.xml : (new XMLSerializer()).serializeToString(data);
					alert(xmlstr);
					data = xmlstr;
					alert(data);
					httpStaus = true;
					res = { httpStaus: httpStaus, data: data };
				    alert(data);		
					$('#txtRDSInfo').val(data);
							 
					var $doc = $.parseXML(data);
							
					for(var j=0;j<2;j++)
					{
						if($($doc).find('Interface').eq(j).attr('id') == 'CAPTURE')
						{
							MethodCapture=$($doc).find('Interface').eq(j).attr('path');
						}else if($($doc).find('Interface').eq(j).attr('id') == 'DEVICEINFO')
						{
							MethodInfo=$($doc).find('Interface').eq(j).attr('path');
						}
					}
					
					alert("Precision RDSERVICE Discover Successfully");
				},
				error: function(msg) {
                        var result = msg.status + msg.statusText + msg.responseText;
                        alert( result);
                        
                    }
			});
				
			return res;	
							
		}
		
		
		
		
		 function discoverRDService()				// Search for the valid RDService from port 11100 to 11120     step(1)
		{
            var primaryUrl = "http://127.0.0.1:";
			var tempcount = 0;
            url = "";
			$("#ddlRDS").empty();
			//alert("Discovering Precision RDService.\nPlease wait for some time.");
			
            for (var i = 11100; i <= 11120; i++)
			{
				<!-- $("#lblStatus").text("Discovering RD service on port : "); -->
                <!-- $("#lblStatus").text("Discovering RD service on port : " + i.toString()); -->
               
		 <!--		var verb = "RDSERVICE";
                var err = "";
			
			//alert(i);
				var res;
				$.support.cors = true;
				var httpStaus = false;
				var jsonstr="";
				var data = new Object();
				var obj = new Object();
				var xmlstr;
						
				$.ajax({
      				type: "RDSERVICE",
					async: false,
					crossDomain: true,
					url: primaryUrl + i.toString(),
					contentType: "text/xml; charset=utf-8",
					processData: false,
					cache: false,
					async:false,
					crossDomain:true,
					
					success: function (data) {
					try{
						xmlstr = data.xml ? data.xml : (new XMLSerializer()).serializeToString(data);
						alert('xmlstr'+xmlstr);//device shows ready in pricission
						data = xmlstr;
							
						httpStaus = true;
						res = { httpStaus: httpStaus, data: data };
					    alert('data'+data);		//same
						finalUrl = primaryUrl + i.toString();
						
						var $doc = $.parseXML(xmlstr);
						var CmbData1 =  $($doc).find('RDService').attr('status');
						var CmbData2 =  $($doc).find('RDService').attr('info');
							
						$("#ddlRDS").append('<option value='+i.toString()+'>Port : '+i.toString()+' Status : ' + CmbData1 +'('+CmbData2+')</option>')
						tempcount++;
						}
						catch(e){}
					},
					error: function(msg) {
                        var result = msg.status + msg.statusText + msg.responseText;
                       // alert( result);
                        
                    }
				});
				
				if(xmlstr != null)
				{
					if(xmlstr.indexOf('Precision') > 0)
					{
					//alert(xmlstr);
						
						$("select#ddlRDS").prop('selectedIndex', tempcount-1);
						finalport=i.toString();
						discoverFirstNode(i);
						break;
					}
				}
						
			}
			
					
				   
			
			return res;	
							
		} 
		
		
		function deviceInfo()						// Get Device Info from the path given by RDService Info
		{
			url = "";
			finalUrl="http://127.0.0.1:"+finalport;
			//finalUrl="https://127.0.0.1:"+finalport+"/rd/info";

			var verb = "DEVICEINFO";
            alert('finalUrl'+finalUrl);
                        
            var err = "";
			var res;
			$.support.cors = true;
			var httpStaus = false;
			var jsonstr="";
			$.ajax({
    			type: "DEVICEINFO",
				async: false,
				crossDomain: true,
				url: finalUrl+MethodInfo,
				contentType: "text/xml; charset=utf-8",
				processData: false,
				success: function (data) {
					var xmlstr = data.xml ? data.xml : (new XMLSerializer()).serializeToString(data);
				alert('xmlstr'+xmlstr);
					data = xmlstr;
					alert('url chake precision'+url);
					httpStaus = true;
					res = { httpStaus: httpStaus, data: data };
					alert('httpStaus'+httpStaus);			
			
					$('#txtDeviceInfo').val(data);
					alert('httpStaus1'+httpStaus);			

				},
				error: function(msg) {
                        var result = msg.status + msg.statusText + msg.responseText;
                        //alert( result);
                        
                    }
			});
			return res;
								
                
		}
		
		
		
		function Capture(deviceData,regNo)						// Get Capture Info from the path given by RDService Info
		{			alert('into capture pricision1');

			var fCount = document.getElementById('txtfcount').value;
			var fType = document.getElementById('txtftype').value;
			var format = document.getElementById('txtformat').value;
			var pidver = document.getElementById('txtPidVer').value;
			var timeout = document.getElementById('txttimeout').value;
			var env = document.getElementById('txtenv').value;
			var lock = document.getElementById('txtlk').value;
			var posh = document.getElementById('txtposh').value;
			alert('into capture pricision2');

			finalUrl="http://127.0.0.1:"+finalport;
			//finalUrl="https://127.0.0.1:"+finalport+"/rd/capture";;

	   
		// Form input Pid OPtions for capture Input
		//var XML='<?xml version="1.0"?> <PidOptions ver="1.0"> <Opts fCount="1" fType="2" format="'+ format +'" pidVer="'+ pidver +'" timeout="'+ timeout +'" env="'+ env +'" posh="'+ posh +'" /> <CustOpts> <Param name="LockingKey" value="'+lock +'" /> </CustOpts> </PidOptions>';
		var XML='<PidOptions ver="1.0"> <Opts fCount="1" fType="2" format="'+ format +'" pidVer="'+ pidver +'" timeout="'+ timeout +'" env="'+ env +'" /> <CustOpts> <Param name="LockingKey" value="'+lock +'" /> </CustOpts> </PidOptions>';

		var verb = "CAPTURE";
            var err = "";
			var res;
			$.support.cors = true;
			var httpStaus = false;
			var jsonstr="";
			$.ajax({
      			type: "CAPTURE",
				async: false,
				crossDomain: true,
				url: finalUrl+MethodCapture,
				data:XML,
				contentType: "text/xml; charset=utf-8",
				processData: false,
				success: function (data) {
					var xmlstr = data.xml ? data.xml : (new XMLSerializer()).serializeToString(data);
					//alert("xmlstr"+xmlstr);
					console.log("xmlstr"+xmlstr);
					data = xmlstr;
				alert("XML"+XML);
				/* alert("xmlstr"+xmlstr);
					alert("data"+data);
					alert("regNo1"+regNo);
					alert("abcd"+deviceData);  */
					/* 	console.log("XML"+XML);
					console.log("xmlstr"+xmlstr);
					console.log("data"+data);
					console.log("regNo1"+regNo);
					console.log("abcd"+deviceData);  */
					httpStaus = true;
					res = { httpStaus: httpStaus, data: data };
							
					$('#txtPidData').val(data);
					$('#txtPidOptions').val(XML);
								
					var $doc = $.parseXML(data);
					//alert("$doc"+$doc); 
					console.log("$doc"+$doc);


					$.ajax({
						type: "POST",
						contentType : "application/json; charset=utf-8",
						url : "getRDdata.html",
					    data:  data + "&" + regNo +"&" + deviceData,
					  
						dataType : 'text',
						beforeSend : function(xhr) {
							
						/*  alert("data"+data);
						alert("regNo1"+regNo);
						alert("abcd"+deviceData); 
 */
							xhr.setRequestHeader("Accept",
									"application/json");
							xhr.setRequestHeader("Content-Type",
									"application/json");
							//alert("abcd3"+deviceData); 

							if ($("meta[name='_csrf_header']").attr(
									"content") != undefined) {
								xhr.setRequestHeader($(
										"meta[name='_csrf_header']")
										.attr("content"), $(
										"meta[name='_csrf']").attr(
										"content"));
								//alert("abcd2"+deviceData); 

							}
						},
						success : function(data1) {
							 if (typeof data1 === 'string') {
								  response = $.parseJSON(data1);
								} 
							//alert("data1"+data1);
							//alert("response"+response); 
						var statusResult = response.status;
						console.log("data1"+response.status);

				//alert("data"+data);
				// alert("gvjhbk"+statusResult); 
				 console.log("gvjhbk"+statusResult);
				 if(response.ret=='y' && !response.outTime ){
			            // Open the modal
			           // $('.modal-content').text(statusResult);//APPEND
			        /*    $('#viewTable').append(
			                    '<tbody>' + 

			                        '<tr>' +
     			'<td><img src="' + response.photo + '" alt="Student Photo" style="height:81px;" /></td>' +
			                           '<td>' + response.studentName + '</td>' +
			                           '<td>' + response.rollId  + '</td>' +
			                           '<td>' +response.inTime + '</td>' +
			                           '<td>' +response.outTime + '</td>' +
			                           '<td>' +response.attendDate + '</td>' +

			                        '</tr>' +
			                     '</tbody>'
			                     );  */
			                   // $('#viewTable').append('<img src="' + response.photo + '" />');//for view image in popup
			   			//$('#viewTable').append('<h6><img src="' + response.photo + '" alt="Student Photo" style="height:165px;border-radius:33px; margin-left:180px !important;border: 2px solid #0b0a0a;" /></h6>'+
           
		$('#viewTable').append('<h6><img src="' + response.photo + '" alt="Student Photo" style="height:165px;border-radius:15px; border: 2px solid #0b0a0a;" /></h6>'+
		'<div style="margin-left:33px !important;"><h3>Name     : ' +response.studentName + '</h3>'+
				'<h3>Regd.No : ' +response.rollId + '</h3>'+
				'<h3>Date:' +response.date + '</h3>'+
				'<h3>InTime   : ' +response.inTime + '</h3></div>'
				
				);
			            $("#yourModalId").modal("show");
			           
					   //$("#yourModalId").modal(data1);
			        } 
					 else if(response.ret=='y'){
						 //alert(response.outTime);
						 $('#viewTable').append('<h6><img src="' + response.photo + '" alt="Student Photo" style="height:165px;border-radius:15px; border: 2px solid #0b0a0a;" /></h6>'+
									'<div style="margin-left:33px !important;"><h3>Name     : ' +response.studentName + '</h3>'+
											'<h3>Regd.No : ' +response.rollId + '</h3>'+
											'<h3>Date:' +response.date + '</h3>'+
											'<h3>InTime   : ' +response.inTime + '</h3>'+
											'<h3>Out Time : ' +response.outTime + '</h3></div>'
											
											);
						 $("#yourModalId").modal("show");
					 }
					 
					 else  {
					 
			            // Handle other conditions if needed
			            console.error("Unexpected status:", statusResult);
			            $("#yourModalIde").modal("show");
			        }

						},
				
				error : function(error) {
					alert("gvbhjn");
					//$("#yourModalIde").modal("show");
					alert("success failure ::" + true);
					console.log(error);
				}
			}); 
				},
				error: function(msg) {
                        var result = msg.status + msg.statusText + msg.responseText;
                        alert( result);
                        
                    }
			});
						
			return res;
			    
		}
		function getHttpError(jqXHR) {
		    var err = "Unhandled Exception";
		    if (jqXHR.status === 0) {
		        err = 'Service Unavailable';
		    } else if (jqXHR.status == 404) {
		        err = 'Requested page not found';
		    } else if (jqXHR.status == 500) {
		        err = 'Internal Server Error';
		    } else if (thrownError === 'parsererror') {
		        err = 'Requested JSON parse failed';
		    } else if (thrownError === 'timeout') {
		        err = 'Time out error';
		    } else if (thrownError === 'abort') {
		        err = 'Ajax request aborted';
		    } else {
		        err = 'Unhandled Error';
		    }
		    return err;
		}
	</script>
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
    <script>
 function checkInput() {
		var inputField = document.getElementById("textbox");
		//console.log(inputField.value.length,'ggg')
		if (inputField.value.length === 12) {
			//alert("registarationnumberinputField"+inputField.value.length);
			var regNo=inputField.value;
 				alert("regNo"+regNo);
 	
				discoverRDService()
			
				deviceInfo()
				
				var deviceData=document.getElementById("txtDeviceInfo").value
				alert('deviceData'+deviceData);

				Capture(deviceData,regNo)
			

		}
	}
 checkInput()
</script> -->
  <script>
    function navigateToPage2() {
      // Change the URL to the desired page
      //window.location.href = '/AadharAuthenticate23022024/verification.html';
     // window.location.href = '/ROOTLive/verification.html';

    	window.location.href = '/verification.html';
    }
  </script>
 
<div id="yourModalId" class="modal">
        <div class="modal-content">
   
        <div id="viewTable"></div>
                     <img src="images/success.png" class="align-self-center b-emblem-image" title="National Emblem of India" alt="emblem of india logo" style="height:100px;" >
        
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="navigateToPage2()">Close</button>
        
        </div>
        
         </div> 
         				   

    
   
<div id="yourModalIde" class="modal">
        <div class="modal-content">
             <div id="viewTable"></div>
             <img src="images/error.png" class="align-self-center b-emblem-image" title="National Emblem of India" alt="emblem of india logo" style="height:165px;" >
            <p>Data does not match .</p>
            <p>Please try again .</p>
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="navigateToPage2()">Close</button>
            
         </div>
         </div>
         		   <jsp:include page="include/footer.jsp" />
          
		</body>
		
</html>