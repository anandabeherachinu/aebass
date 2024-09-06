<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script type="text/javascript">
	$(document).ready(function() 
	{
		 history.replaceState(null, document.title, location.pathname+"#!/");
		    history.pushState(null, document.title, location.pathname);
		    window.addEventListener('popstate', function(event) {
		    history.pushState(null, document.title, location.pathname);
		    }, false);  
		    //alert('data: ' );  
		    
		    var port;
			var urlStr = '';
			//document.getElementById("txtData").value = String("");
			if (useHTTPS) {
				// alert('data: if ' );  
				port = document.getElementById("DrpPortSelectionHttps");
				urlStr = 'https://' + hostName + ':'
						+ port.options[port.selectedIndex].value + '/rd/info?ts='
						+ Date.now();
			} else {
				port = document.getElementById("DrpPortSelection");
				urlStr = 'http://' + hostName + ':'
						+ port.options[port.selectedIndex].value + '/rd/info?ts='
						+ Date.now();
				// alert('data: else' );  
			}

			getJSON_info(urlStr, function(err, data) {
				if (err != null) {
					alert('Something went wrong: ' + err);
				} else {
					//alert('data: ' + data.replace(/"/g, '\\"'));
			document.getElementById("txtData").value = String(data.replace('xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"', ''));
			// var a=document.getElementById("txtDataRd").value;
					//document.getElementById("txtData").value = String(a.replace(/"/g, '\\"')); 
					//document.getElementById("txtData").value = String(data);
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
						req[jk].open('DEVICEINFO', 'https://' + hostName + ':'
								+ String(tmpPortNo) + '/rd/info?ts='
								+ Date.now(), true);
					} catch (e) {
						req[jk] = new ActiveXObject("Microsoft.XMLHTTP");
						req[jk].open('DEVICEINFO', 'https://' + hostName + ':'
								+ String(tmpPortNo) + '/rd/info?ts='
								+ Date.now(), true);
					}

				} else {
					req[jk] = new ActiveXObject("Microsoft.XMLHTTP");
					req[jk].open('DEVICEINFO', 'https://' + hostName + ':'
							+ String(tmpPortNo) + '/rd/info?ts=' + Date.now(),
							true);
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
						req[jk].open('DEVICEINFO', 'http://' + hostName + ':'
								+ String(tmpPortNo) + '/rd/info?ts='
								+ Date.now(), true);
					} catch (e) {
						req[jk] = new ActiveXObject("Microsoft.XMLHTTP");
						req[jk].open('DEVICEINFO', 'http://' + hostName + ':'
								+ String(tmpPortNo) + '/rd/info?ts='
								+ Date.now(), true);
					}

				} else {
					req[jk] = new ActiveXObject("Microsoft.XMLHTTP");
					req[jk].open('DEVICEINFO', 'http://' + hostName + ':'
							+ String(tmpPortNo) + '/rd/info?ts=' + Date.now(),
							true);
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
				alert("HTTP ERROR - " + exceptionErr);
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
					var tmpStr = retString.substr(retString.search('MI="') + 4);
					opt.text = portNoarg + ' : '
							+ tmpStr.substr(0, tmpStr.search('"'));
				}
				opt.value = portNoarg;
				document.getElementById("DrpPortSelection").options.add(opt);
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
	
	
	
	 function captureFPAuth() {
			var port;
			var urlStr = '';
			//document.getElementById("txtData").value = String("");
			if (useHTTPS) {
				port = document.getElementById("DrpPortSelectionHttps");
				urlStr = 'https://' + hostName + ':'
						+ port.options[port.selectedIndex].value
						+ '/rd/capture?ts=' + Date.now();
				alert(urlStr);
				console.log(urlStr);
			} else {
				port = document.getElementById("DrpPortSelection");
				urlStr = 'http://' + hostName + ':'
						+ port.options[port.selectedIndex].value
						+ '/rd/capture?ts=' + Date.now();
			}

			getJSONCapture(urlStr, function(err, data) {
				if (err != null) {
					alert('Something went wrong: ' + err);
				} else {
				alert(data);
/* 					document.getElementById("txtDataRd").value = String(data.replace(/"/g, '\\"'));
 * 
 */
			//var a = String(data.replace(/"/g, '\\"'));
 				document.getElementById("txtDataRd").value = String(data);
                var a=document.getElementById("txtDataRd").value;
 				document.getElementById("txtDataRd").value = String(a.replace('xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"', ''));
 				//document.getElementById("txtDataRd").value = String(a.replace('xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Resp "', ''));
				alert(document.getElementById("txtDataRd").value);
				console.log(document.getElementById("txtDataRd").value);
				var b=document.getElementById("txtDataRd").value;
				//document.getElementById("txtDataRd").value = String(b.replace(/"/g, '\\"'));

				/* var b=document.getElementById("txtDataRd").value;
 				document.getElementById("txtDataRd").value = String(b.replace('<PidData xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">', ''));
 */
				
				
				
				
				
				
				//var b= String(data)
	/*  				document.getElementById("txtData").value = String("sucessfully submited");
	 */
					//alert(data.replace(/"/g, '\\"'));
	 				/* var updatedData=date.replace(/"/g, '\\"');
	 				alert(updatedData);
	 				console.log(updatedData); */
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

			var InputXml = "<PidOptions> <Opts fCount=\"2\" fType=\"2\" iCount=\"0\" pCount=\"0\" format=\"0\" pidVer=\"2.0\" timeout=\"20000\" otp=\"\" posh=\"UNKNOWN\" env=\"P\" wadh=\"\" /> "
					+ finalDemoStr + "</PidOptions>";

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
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="Styles/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="Styles/bootstrap-4.1.0.min.js" type="text/javascript"></script>
        <link href="Styles/bootstrap-4.1.0.min.css" rel="stylesheet" type="text/css"/>
        <link href="Styles/MainStyle.css" rel="stylesheet" type="text/css"/>
        <title></title>
        <style type="text/css">
        .btnContactSubmit
{
    width: 50%;
    border-radius: 1rem;
    padding: 1.5%;
    color: #fff;
    background-color: #0062cc;
    border: none;
    cursor: pointer;
    margin-right: 6%;
    background-color: white;
    color: blue;
    margin-top: 4%;
}
.register .nav-tabs .nav-link:hover{
    border: none;
}
.text-align{
    margin-top: -3%;
    margin-bottom: -9%;

    padding: 10%;
    margin-left: 30%;
}
.form-new{
    margin-right: 22%;
    margin-left: 20%;
}
.register-heading{
    margin-left: 21%;
    margin-bottom: 10%;
    color: #e9ecef;
}
.register-heading h1{
    margin-left: 21%;
    margin-bottom: 10%;
    color: #e9ecef;
}
.btnLoginSubmit{
    border: none;
    padding: 2%;
    width: 25%;
    cursor: pointer;
    background: #29abe2;
    color: #fff;
}
.btnForgetPwd{
    cursor: pointer;
    margin-right: 5%;
    color: #f8f9fa;
}
.register{
    background: -webkit-linear-gradient(left, #3931af, #00c6ff);
    margin-top: 3%;
    padding: 3%;
    border-radius: 2.5rem;
}
.nav-tabs .nav-link{
    border: 1px solid transparent;
    border-top-left-radius: .25rem;
    border-top-right-radius: .25rem;
    color: white;
}
</style>
    </head>
    <body style="background-color: #FFFFFF" onload="scanMultiPorts();">
    
       
        <div class="container register">
            <div class="row">
                <div class="col-md-12">
                    <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                      
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active text-align form-new" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <h3 class="register-heading">check student Data</h3>
                            <div class="row register-form">
                                <div class="col-md-12">
<%--                                     <form method="post">
 --%>                                    <form:form class="form-horizontal" action=""  enctype="multipart/form-data"
							                     method="post" modelAttribute="cb" autocomplete="off">
							                     
                                    <center>
				<table
					style="font-family: &amp; amp; amp; #39; Times New Roman&amp;amp; amp; #39; , Times , serif; font-size: large;">
					<tbody>
						<!-- <tr>
							<td colspan="5" align="center"><span id="lblRDStat"
								style="color: green;">RD Service is ACTIVE</span></td>
						</tr>
						<tr> -->
							<td class="style1"><span id="Label1">Active RD
									Service Port No.(HTTP): </span></td>
							<td class="style1"><select name="DrpPortSelection"
								id="DrpPortSelection" onchange="HttpSelChange();" disabled="">
									<option value="11100">11100 : FM220U</option>
							</select></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;</td>
							<td class="style1"><span id="Label19">Active RD
									Service (HTTPS): </span></td>
							<td class="style1"><select name="DrpPortSelectionHttps"
								id="DrpPortSelectionHttps" onchange="HttpsSelChange();">
									<option value="11200">11200 : FM220U</option>
							</select></td>
						</tr>
					<!-- 	<tr>
							<td colspan="5" align="center">
								<div id="radioDiv" style="display: block;">
									
									<input value="1" name="proto" type="radio"
										onclick="radioChanged(1);"> HTTP <input value="2"
										name="proto" type="radio" onclick="radioChanged(2);"
										checked="checked"> HTTPS
								</div>
							</td>
						</tr> -->
					</tbody>
				</table>
			</center>
                                        <div class="form-group">
                                            <form:input path="rollId" type="text" name="LGform1_user" class="form-control" placeholder="Enter Roll" value="" required="true" />
                                        </div>
                                       <td style="border: thin solid #000000;">
                                       <form:hidden  path="txtData" rows="2" cols="20" id="txtData" class="remaining" style="width: 99%;"></form:hidden>
                                       </td>
									  <td style="border: thin solid #000000;">
									  <form:hidden path="txtDataRd" rows="2" cols="20" id="txtDataRd" class="remaining" style="width: 99%;"></form:hidden>
									  </td>
                                        <!-- <div class="form-group">
                                            <input type="submit" name="LGform1" class="btnContactSubmit" value="Submit" />
                                        </div> -->
                                       <!--  <input type="button"
								id="btnCaptureAuth" value="Capture For Auth" class="buttons_new"
								 style="width: 97%;"> -->
								<!-- <td><a href="finger-authenticate.html" class="btn btn-primary" onclick="captureFPAuth()" >Proceed for payment </a></td> -->
                                        <fieldset class="form-group" style="margin-left: 0px; margin-right: 0px;">
					    	<div class="form-group row" style="margin: 0px;">
						      <label class="col-sm-4 col-form-label"> </label>
						      <label class="col-sm-6 col-form-label"> 
						       <input type="submit" name="submit" value="Submit" class="btn btn-success " />

						      </label> 
						    </div>
					    </fieldset>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                       
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>