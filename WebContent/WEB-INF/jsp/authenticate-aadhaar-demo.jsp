<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0023)http://localhost:24711/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>RD SERVICE CALL DEMO PAGE</title>
<style type="text/css">
.roundcorner {
	border-radius: 20px;
	-moz-border-radius: 35px;
	/* Firefox 3.6 and earlier */
}

.style1 {
	height: 30px;
}

#txtData {
	height: 288px;
}

.buttons_new {
	background: #0b5394;
	background: -webkit-linear-gradient(#55acee, #0b5394 50%, #55acee);
	background: linear-gradient(#55acee, #0b5394 50%, #55acee);
	border: 1px solid #0b5394;
	border-radius: 1000px;
	padding: 7px 43px;
	color: #ffffff;
	display: inline-block;
	font: normal 700 21px/1 "Calibri", sans-serif;
	text-align: center;
	text-shadow: 2px 2px #0b5394;
	cursor: pointer;
}

.buttons_old {
	background: #cccccc;
	background: -webkit-linear-gradient(#cccccc, #cccccc 50%, #cccccc);
	background: linear-gradient(#cccccc, #cccccc 50%, #cccccc);
	border: 1px solid #0b5394;
	border-radius: 1000px;
	padding: 7px 43px;
	color: #cccccc;
	display: inline-block;
	font: normal 700 21px/1 "Calibri", sans-serif;
	text-align: center;
	text-shadow: 2px 2px #0b5394;
	cursor: default;
}

input[type=text], select, .remaining {
	width: 100%;
	padding: 7px 5px;
	margin: 0px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
</style>
<script type="text/javascript">
	var count = 0;
	var actCount = 0;
	var isHTTPFound = false;
	var isHTTPSFound = false;
	var useHTTPS = false;
	var exceptionErr = '';
	var hostName = 'localhost';

	function ChangeHost() {
		if (hostName === 'localhost') {
			hostName = '127.0.0.1';
			alert('Hostname changed to `127.0.0.1`');
		} else {
			hostName = 'localhost';
			alert('Hostname changed to `localhost`');
		}
	}

	function radioChanged(argValule) {
		if (argValule == 2) {
			HttpsSelChange();
			useHTTPS = true;
			document.getElementById("DrpPortSelection").disabled = true;
			document.getElementById("DrpPortSelectionHttps").disabled = false;

		} else {
			HttpSelChange();
			useHTTPS = false;
			document.getElementById("DrpPortSelection").disabled = false;
			document.getElementById("DrpPortSelectionHttps").disabled = true;
		}
	}

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

	//SCAN HTTPS PORT
	function scanForRDSrvcHTTPS(xhr, portNo) {
		try {
			var xhr1 = null;
			if (xhr === null) {
				if (window.XMLHttpRequest) {
					try {
						xhr1 = new XMLHttpRequest();
						xhr1.open('DEVICEINFO', 'https://' + hostName + ':'
								+ String(portNo) + '/rd/info?ts=' + Date.now(),
								true);
					} catch (e) {
						xhr1 = new ActiveXObject("Microsoft.XMLHTTP");
						xhr1.open('DEVICEINFO', 'https://' + hostName + ':'
								+ String(portNo) + '/rd/info?ts=' + Date.now(),
								true);
					}

				} else {
					xhr1 = new ActiveXObject("Microsoft.XMLHTTP");
					xhr1.open('DEVICEINFO', 'https://' + hostName + ':'
							+ String(portNo) + '/rd/info?ts=' + Date.now(),
							true);
				}
			} else {
				xhr1 = xhr;
			}

			xhr1.onreadystatechange = function() {
				if (xhr1.readyState == 4) {
					if (xhr1.status == 200) {
						callbackScanHTTPS(null, xhr1.responseText, portNo);
					} else {
						callbackScanHTTPS(xhr1.status, null, portNo);
					}
				}
			};
			xhr1.send();
		} catch (e) {
			if (e.message === exceptionErr) {
			} else {
				exceptionErr = e.message;
				alert("HTTPS ERROR - " + portNo + exceptionErr);
			}

			callbackScanHTTPS(status);
		}
	}
	function callbackScanHTTPS(err, data, portNoarg) {
		if (err != null) {
			isHTTPFound = false;
		} else {
			var retString = String(data).toUpperCase();
			if (retString.search("STARTEK.ACPL") > 0) {
				isHTTPSFound = true;
				var opt = document.createElement("option");
				if (retString.search("STARTEK.ACPL") > 0) {
					var tmpStr = retString.substr(retString.search('MI="') + 4);
					opt.text = portNoarg + ' : '
							+ tmpStr.substr(0, tmpStr.search('"'));
				}
				opt.value = portNoarg;
				document.getElementById("DrpPortSelectionHttps").options
						.add(opt);
				document.getElementById("lblRDStat").innerHTML = 'RD Service is ACTIVE';
				document.getElementById("lblRDStat").style.color = 'Green';
				document.getElementById("DrpPortSelectionHttps").selectedIndex = 0;
				detectedFinalHTTPSPort = portNoarg;
				useHTTPS = true;
				HttpsSelChange();
				if (isHTTPFound) {
					document.getElementById('radioDiv').style.display = 'block';
				} else {
					document.getElementById('radioDiv').style.display = 'none';
				}

				document.getElementById("DrpPortSelection").disabled = true;
				document.getElementById("DrpPortSelectionHttps").disabled = false;
				enableControls();
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

	function enableControls() {

		document.getElementById("btnRDInfo").disabled = false;
		document.getElementById("btnDevInfo").disabled = false;
		document.getElementById("btnCaptureAuth").disabled = false;

		document.getElementById("btnRDInfo").className = "buttons_new";
		document.getElementById("btnDevInfo").className = "buttons_new";
		document.getElementById("btnCaptureAuth").className = "buttons_new";

	}

	function disableControls() {

		document.getElementById("btnRDInfo").disabled = true;
		document.getElementById("btnDevInfo").disabled = true;
		document.getElementById("btnCaptureAuth").disabled = true;

		document.getElementById("btnRDInfo").className = "buttons_old";
		document.getElementById("btnDevInfo").className = "buttons_old";
		document.getElementById("btnCaptureAuth").className = "buttons_old";

	}

	function setControls() {
		if (actCount > 0) {
			document.getElementById("lblRDStat").innerHTML = 'RD Service is ACTIVE';
			document.getElementById("lblRDStat").style.color = 'Green';

		} else {
			if (isHTTPSFound) {
				document.getElementById("lblRDStat").innerHTML = 'RD Service is ACTIVE';
				document.getElementById("lblRDStat").style.color = 'Green';
			} else {
				document.getElementById("lblRDStat").innerHTML = 'No ACPL RD Service found!';
				document.getElementById("lblRDStat").style.color = 'Red';
			}

		}

		if (isHTTPFound && isHTTPSFound) {
			document.getElementById('radioDiv').style.display = 'block';
			document.getElementById("DrpPortSelection").disabled = true;
		}
	}

	//RD SERVICE FUNCTIONALITIES 
/* 	function rdservice() {
		var port;
		var urlStr = '';
		document.getElementById("txtData").value = String("");
		if (useHTTPS) {
			port = document.getElementById("DrpPortSelectionHttps");
			urlStr = 'https://' + hostName + ':'
					+ port.options[port.selectedIndex].value + '?ts='
					+ Date.now();
		} else {
			port = document.getElementById("DrpPortSelection");
			urlStr = 'http://' + hostName + ':'
					+ port.options[port.selectedIndex].value + '?ts='
					+ Date.now();
		}

		getJSON_rd(urlStr, function(err, data) {
			if (err != null) {
				alert('Something went wrong: ' + err);
			} else {
				document.getElementById("txtData").value = String(data);
			}
		});
	} */

	function info() {
		var port;
		var urlStr = '';
		document.getElementById("txtData").value = String("");
		if (useHTTPS) {
			port = document.getElementById("DrpPortSelectionHttps");
			urlStr = 'https://' + hostName + ':'
					+ port.options[port.selectedIndex].value + '/rd/info?ts='
					+ Date.now();
		} else {
			port = document.getElementById("DrpPortSelection");
			urlStr = 'http://' + hostName + ':'
					+ port.options[port.selectedIndex].value + '/rd/info?ts='
					+ Date.now();
		}

		getJSON_info(urlStr, function(err, data) {
			if (err != null) {
				alert('Something went wrong: ' + err);
			} else {
				document.getElementById("txtData").value = String(data);
			}
		});
	} 

 function captureFPAuth() {
		var port;
		var urlStr = '';
		document.getElementById("txtData").value = String("");
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
				document.getElementById("txtData").value = String(data.replace(/"/g, '\\"'));
				alert(data.replace(/"/g, '\\"'));
			}
		});
	}

	var getJSON_rd = function(url, callback) {
		var xhr;
		if (window.XMLHttpRequest) {
			try {
				xhr = new XMLHttpRequest();
				xhr.open('RDSERVICE', url, true);
			} catch (e) {
				xhr = new ActiveXObject("Microsoft.XMLHTTP");
				xhr.open('RDSERVICE', url, true);
			}
		} else {
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
			xhr.open('RDSERVICE', url, true);
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

	function htmlEncode(value) {
		return $('<div/>').text(value).html();
	}

	function convertData() {
		document.getElementById("txtData").value = String(
				document.getElementById("txtData").value)
				.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g,
						'&gt;').replace(/"/g, '&quot;');
	}
</script>
</head>

<body style="background-color: #FFFFFF" onload="scanMultiPorts();">
	<form name="form1" method="post" action="http://localhost:24711/"
		id="form1">
		<div>
			<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
				value="/wEPDwULLTE0NzQwOTUzNzMPZBYCAgMPZBYCAgEPDxYGHgRUZXh0BR1TY2FubmluZyBhY3RpdmUgUkQgU2VydmljZS4uLh4JRm9yZUNvbG9yCiMeBF8hU0ICBGRkGAEFHl9fQ29udHJvbHNSZXF1aXJlUG9zdEJhY2tLZXlfXxYCBQVjdGwwNgUFY3RsMDdMITu776SMQdeu5sXOKwCcSgPbkfXQ5jzZlcZyeeE7dg==">
		</div>

		<div>

			<input type="hidden" name="__VIEWSTATEGENERATOR"
				id="__VIEWSTATEGENERATOR" value="D0B81EB6"> <input
				type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION"
				value="/wEdAAbXsq2d6oUZTRFU1HW0TwFifV361+yDs8wprSoyRI+BYeuf1xmJC9XuF56nW8ARXfOUTiqFu4wnt0LXpRY1A1OQ2y8NA3FZOcLMwYzBIUH4ogwjM5pRmsm7gY4wli2CyVhVCyGg5h/GzEOfl9D8BAfQftcddKnApdANRlDckI0E3g==">
		</div>
		<div>
			<h1 style="color: #000099; text-align: center">ACPL FM220 RD
				Service Call Demo</h1>
			<center>
				<table
					style="font-family: &amp; amp; amp; #39; Times New Roman&amp;amp; amp; #39; , Times , serif; font-size: large;">
					<tbody>
						<tr>
							<td colspan="5" align="center"><span id="lblRDStat"
								style="color: green;">RD Service is ACTIVE</span></td>
						</tr>
						<tr>
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
						<tr>
							<td colspan="5" align="center">
								<div id="radioDiv" style="display: block;">
									<!-- style="display:none;" -->
									<input value="1" name="proto" type="radio"
										onclick="radioChanged(1);"> HTTP <input value="2"
										name="proto" type="radio" onclick="radioChanged(2);"
										checked="checked"> HTTPS
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</center>
			<center>
				<span id="lblStat"></span>
			</center>

			<center>
				<table
					style="border: thin solid #000000; font-family: &amp; amp; amp; #39; Times New Roman&amp;amp; amp; #39; , Times , serif; font-size: large;"
					width="96%" cellpadding="12" cellspacing="0">
					<tbody>
						<tr>
							<td align="center" style="width: 25%"><input type="button"
								id="btnRDInfo" class="buttons_new" value="RD Service Info"
								onclick="rdservice()" style="width: 97%;"></td>
							<td align="center" style="width: 25%"><input type="button"
								id="btnDevInfo" value="Device Info" class="buttons_new"
								onclick="info()" style="width: 97%;"></td>
							<td align="center" style="width: 25%"><input type="button"
								id="btnCaptureAuth" value="Capture For Auth" class="buttons_new"
								onclick="captureFPAuth()" style="width: 97%;"></td>

						</tr>
					</tbody>
				</table>
			</center>
			<center>
				<table
					style="font-family: &amp; amp; amp; #39; Times New Roman&amp;amp; amp; #39; , Times , serif; font-size: large;"
					width="96%" cellpadding="2" cellspacing="0">
					<tbody>
						<tr>
							<td style="border: thin solid #000000;"><textarea
									name="txtData" rows="2" cols="20" id="txtData"
									class="remaining" style="width: 99%;"></textarea></td>

						</tr>
					</tbody>
				</table>
			</center>
			<center>
				<table>
					<tbody>
						<tr>
							<td align="right" rowspan="2" style="width: 33.3%"><img
								id="Image2"
								src="./RD SERVICE CALL DEMO PAGE_files/acpl_logo.png"
								style="height: 61px; width: 89px; border-width: 0px;"></td>
							<td rowspan="2" style="width: 66.7%; text-align: left"><span
								id="Label16" class="FooterText">Provided by :</span><br> <a
								id="HyperLink2" class="FooterText"
								href="http://www.acpl.in.new/" target="_blank"
								style="font-weight: bold;">Access Computech Pvt. Ltd.</a><br>
								<span id="Label17" class="FooterText">504/6, GIDC,
									Makarpura,</span><br> <span id="Label18" class="FooterText">Vadodara
									390 010 (Gujarat) India</span> <br> Email: <a
								href="mailto:support@acpl.ind.in">support@acpl.ind.in</a><br>
								Mobile: 7874078565, 8141958565</td>
						</tr>
					</tbody>
				</table>
			</center>
		</div>
	</form>
	<script type="text/javascript">
		function rdservice() {
			var port;
			var urlStr = '';
			urlStr = 'http://localhost:11100/';

			getJSON_rd(urlStr, function(err, data) {
				if (err != null) {
					alert('Something went wrong: ' + err);
				} else {
					alert('Response:-' + String(data));
				}
			});
		}
		var getJSON_rd = function(url, callback) {
			var xhr = new XMLHttpRequest();
			xhr.open('RDSERVICE', url, true);
			xhr.responseType = 'text';
			xhr.onload = function() {
				var status = xhr.status;
				if (status == 200) {
					callback(null, xhr.response);
				} else {
					callback(status);
				}
			};
			xhr.send();
		};
	</script>
	<script type="text/javascript">
/* function info() {
 var port;
 var urlStr = '';
 urlStr = 'http://localhost:11100/rd/info';
 getJSON_info(urlStr,
 function (err, data) {
 if (err != null) {
 alert('Something went wrong: ' + err);
 } else {
 alert('Response:-' + String(data);

 }
 }
 );
 }
var getJSON_info = function (url, callback) {
 var xhr = new XMLHttpRequest();
 xhr.open('DEVICEINFO', url, true);
 xhr.responseType = 'text';
 xhr.onload = function () {
 var status = xhr.status;
 if (status == 200) {
 callback(null, xhr.response);
 } else {
 callback(status);
 }
 };
 xhr.send();
 }; */
</script>
<!-- 	<script type="text/javascript">
 function captureFPAuth() {
 var port;
 var urlStr = '';

 urlStr = 'http://localhost:11100/rd/capture';

getJSONCapture(urlStr,
 function (err, data) {
 if (err != null) {
 alert('Something went wrong: ' + err);
 } else {
 alert('Response:-' + String(data);
 }
 }
 );
 }
 var getJSONCapture = function (url, callback) {
 var xhr = new XMLHttpRequest();
 xhr.open('CAPTURE', url, true);
xhr.responseType = 'text'; //json
var InputXml = "<PidOptions> <Opts fCount\"2\" fType=\"0\" iCount=\"0\"
pCount=\"0\" format=\"0\" pidVer=\"2.0\" timeout=\"20000\" otp=\"\"
posh=\"UNKNOWN\" env=\"S\" wadh=\"\" /> <Demo></Demo> <CustOpts> <Param
name=\"ValidationKey\" value=\"\" /> </CustOpts> </PidOptions>";
 xhr.onload = function () {
 var status = xhr.status;
 if (status == 200) {
 callback(null, xhr.response);
 } else {
 callback(status);
 }
 };
 xhr.send(InputXml);
 };
</script>
 -->




</body>
</html>