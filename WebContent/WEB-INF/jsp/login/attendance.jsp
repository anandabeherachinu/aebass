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





<%
   response.setHeader( "Pragma", "no-cache" );
   response.setHeader( "Cache-Control", "private, no-cache, no-store, must-revalidate, proxy-revalidate" );
   response.setDateHeader( "Expires", 0 );
%>

<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <jsp:include page="../common-admin/head.jsp"></jsp:include> 
 
<!--  <script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
 <script type="text/javascript" src="js/cand_register.js"></script>  -->
 <!--  <link rel="stylesheet" type="text/css"
	href="css/pia-register.css" /> -->

 
 

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
  <style>
    /* Styling for the overlay */
    .overlay {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.7);
      z-index: 1;
    }
    
    /* Styling for the popup */
    .popup {
      position: absolute;
      top: 30%;
      left: 30%;
      transform: translate(-50%, -50%);
      background-color: white;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
      z-index: 2;
    }
  </style>
	
 </head>
<body onload="scanMultiPorts();">
 <jsp:include page="../common-admin/upper_block.jsp"></jsp:include>
 	<div class="container-fluid">
 		<div class="row-fluid">
 			
 			<div id="page-title">      
  <div class="panel-heading">
 
                 <c:if test="${sessionScope.role_id eq '1' }">
                         	<h3>Welcome</h3>
                         </c:if>
                         <c:if test="${sessionScope.role_id eq '2' }">
                         	<h3>Welcome, ${sessionScope.user}</h3>
                         </c:if>
                         
                          <c:if test="${sessionScope.role_id eq '5' }">
                         	<h3>Welcome, ${sessionScope.user}</h3>
                         </c:if> 
                        
                </div>
               </div>
               
                 
             
 				<c:choose>
 		
 			<c:when test="${sessionScope.role_id eq '1'}">
 			<div class="box col-md-12">
 			
 			
 				<form:form class="form-horizontal"  enctype="multipart/form-data"
 
							                     method="post" modelAttribute="cb" autocomplete="off">
 				
							<table class="table_form">
 						<th colspan="2">Attendance Sheet</th>
 					
 					<tr>
<!-- 					<tbody>-->
						
							<td class="hide"><span id="Label1">Active RD
									Service Port No.(HTTP): </span></td>
							<td class="hide"><select name="DrpPortSelection"
								id="DrpPortSelection" onchange="HttpSelChange();" disabled="" >
									<option value="11100">11100 : FM220U</option>
							</select></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td class="hide"><span id="Label19">Active RD
									Service (HTTPS): </span></td>
							<td class="hide"><select name="DrpPortSelectionHttps"
								id="DrpPortSelectionHttps" onchange="HttpsSelChange();">
									<option value="11200">11200 : FM220U</option>
							</select></td>
						
					
					<!--</tbody>-->
					</tr> 
			
			<tr>
			</tr>
 					
 					<tr>
						<td><label id="secetor-text">Enter Reg Number:<span class="required-star">*</span></label></td>
						
					
						
						
						<td>
							<form:input path="rollId" required="true" placeholder="Registration number " class="text-field" maxlength="100"  onchange="captureFPAuth()"/>
							<span style="color: red;"><form:errors path="rollId" cssClass="error"></form:errors>
							</span>
						</td>
<!-- 						 <td style="border: thin solid #000000;">
 -->                                       <form:hidden  path="txtData" rows="2" cols="20" id="txtData" class="remaining" style="width: 99%;"></form:hidden>
<!--                                        </td>
 --><!-- 									  <td style="border: thin solid #000000;">
 -->									  <form:hidden path="txtDataRd" rows="2" cols="20" id="txtDataRd" class="remaining" style="width: 99%;"></form:hidden>
<!-- 									  </td>
 -->						
					</tr>
 					
 					
 		
					
						<tr>
						<td colspan="2" class="button-row">  
							<button type="submit" name="submit" value="Submit" class="btn btn-success  " >
							Submit 
<!-- 							onclick="return aproveSet(this)"   data-toggle="modal" data-target="#myModal"
 -->							</button>
					       	<input type="reset" name="reset" value="Reset" class="btn btn-danger"/>
					       	
					       	
						</td> 
					<%--  <td><a href="demo.html?txtData=${txtDataRd}" class="btn btn-primary ls-modal"  rel="Remarks">View Remark</a></td>
				 --%>
					</tr>
					
					<tr>
						<td colspan="2" class="button-row">  
							<c:if test="${not empty MSGS}">
							<script>
							
					    	$('#sectorName').val("");
					    	$('#mesSectorCode').val("");
							</script>
								<div class="alert alert-success">
									${MSGS}
								</div>
							</c:if>
							<c:if test="${not empty MSGW}">
								<div class="alert alert-danger">
									${MSGW}
								</div>
							</c:if>
						</td> 
					</tr>
					
 				</table>
 				<c:choose>
 			<%-- <c:when test="${sessionScope.role_id eq '2'}"> --%>
 			<c:when test="${sessionScope.role_id eq '1' || sessionScope.role_id eq '3,5' ||  sessionScope.role_id eq '3,8' ||sessionScope.role_id eq '1'}">
 			
 				
 				
 				<div class="box col-md-12">
 				<div class="info-table">
 				<div style="overflow: auto;">
 				<h4>Candidate Placement Report</h4>
<%--  				<form action="CandidatePlacement.html" method="get" >  
 --%>					 
					<%-- <input type="hidden" name="batchId" value="<%=batchId%>" >   --%> 
				
<%-- 				 <input type="hidden" name="cenerId" value="<c:out value="${cenerId}"/>" id="print_id" > 
 --%>					
					<input class="btn btn-primary btn-font-size " type="submit" id="print_id" value="PRINT" onclick="myApp.printTable()"/>   
					 </form>
				<table  class="table_display" id="deptpaging">
				
					<thead>
						<tr>
						    <th>Index</th>
						
							<th>Registration No</th>
							
							<th>Student Name</th>
							<th>Institute Code</th>
							<th>gender</th>
							<th>Date</th>
							<th>In Time</th>
							<th>Out Time</th>
							<th>Mobile No</th>
							<!-- <th>Candidate Signature</th> -->
							
						</tr> 
					</thead>
					<tbody>
						<c:forEach var="s" items="${viewData}" varStatus="count">
							<tr>
								<td>${count.index+1}</td>
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
						</c:forEach>
					</tbody>
				</table>
				</div></div>
</div>


</c:when>
		<c:otherwise>
			
					<div class="alert alert-danger">
					
					You are not an Authorized user for the content that you have requested......
					
					</div>
		</c:otherwise>
		</c:choose>	
 				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
 				
 				
 				<input type="hidden" name="csrf" value="${n1}"/>
 				
 				
 					<%-- <%
					       	session.removeAttribute("n1");
					    	session.removeAttribute("n2");
					       	%> --%>
 				
 				</form:form>
 				
 	
 			
 			
 				
 				
 				</div>	
 				
 			
 				
 				</c:when>
		<c:otherwise>
			
					<div class="alert alert-danger">
					
					You are not an Authorized user for the content that you have requested......
					
					</div>
		</c:otherwise>
		</c:choose>
 				
 				<br/>
 				
 				



 		</div>
 	</div>


<div id="myModal" class="modal fade">
	<div class="modal-dialog">
	    <div class="modal-content">
	            <div class="modal-header" >
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" > </h4>
	            </div>
	            <div class="modal-body">
	                <p>Loading...</p>
	 <%--                  <%
    response.sendRedirect("demo.jsp");
    %> --%>
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


	</body>
</html>
