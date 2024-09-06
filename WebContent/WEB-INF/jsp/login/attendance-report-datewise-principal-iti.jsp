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
 
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
 <script type="text/javascript" src="js/cand_register.js"></script> 
 
  <link rel="stylesheet" type="text/css"
	href="css/pia-register.css" /> 
	
	
	<!-- online -->

     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
 <script type="text/javascript" src="datepicker/jquery.plugin.js"></script>
<script type="text/javascript" src="datepicker/jquery.datepick.js"></script>
 <script type="text/javascript" >

jQuery(function($) {
	
	    var today = new Date();
	    var month = today.getMonth();
	    var day = today.getDate();

	    console.log("day:", day);
	    console.log("month:", month);

	    $('#dob').datepick({    
	        maxDate: today,
	        monthsToShow: 1,
	        showTrigger: '#calImg',
	        yearRange: '1900:' + today.getFullYear(),
	        dateFormat: 'yyyy-mm-dd'
	    });
/* 	}); */

/* var today= new Date();
var month=today.getMonth();
var day=today.getDate();

console.log("day:",day);
console.log("month:",month);
$('#dob').datepick({    
    // minDate: new Date(2013, 6-1, 1),

    maxDate: new Date(today.getFullYear()-18, month, day),
     monthsToShow: 1,
     showTrigger: '#calImg',
     
    // yearRange: '1950:-13',
    yearRange: (today.getFullYear()-15+':-35'),
     dateFormat: 'dd/mm/yyyy'
   }); */
});

</script>
 
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
	   <style>
        .datepicker {
            width: 200px;
            padding: 5px;
            margin: 10px 0;
        }
    </style>
	
 </head>
<body>
 <jsp:include page="../common-admin/upper_block.jsp"></jsp:include>
 	<div class="container-fluid">
 		<div class="row-fluid">
 			
 			<div id="page-title">      
<%--   <div class="panel-heading">
 
                 <c:if test="${sessionScope.role_id eq '1' }">
                         	<h3>Welcome</h2>
                         </c:if>
                         <c:if test="${sessionScope.role_id eq '2' }">
                         	<h3>Welcome, ${sessionScope.user}</h2>
                         </c:if>
                         
                          <c:if test="${sessionScope.role_id eq '5' }">
                         	<h3>Welcome, ${sessionScope.user}</h2>
                         </c:if> 
                        
                </div> --%>
               </div>
               
                 
             
 				<c:choose>
 			<%--  <c:when test="${sessionScope.role_id eq '1'}">  --%>
 		
 			<%-- <c:when test="${sessionScope.role_id eq '2'}"> --%>
 			<c:when test="${sessionScope.role_id eq '3' }">
 			<%-- <c:out value="${sessionScope.role_id}"></c:out> --%>
 			<div class="box col-md-12">
 			
 			
 				<form:form class="form-horizontal" action="attendance-report-datewise-principal-iti.html" method="post"  modelAttribute="cb"
 				 autocomplete="off" >
 				
				<table class="table_form">
 						<th colspan="2">Attendance List</th>
 					
 					
 				<%-- 	<tr>
						<td id="secetor-text">Select Institute Name:<span class="required-star">*</span></td>
						
						<td>
							 <form:select path="instituteCode" class="courese-sector" required="true" id="piaAjax" >
					      			<form:option value="">Select</form:option>
					      			<c:forEach var="s"  items="${institute}">
					      				<form:option value="${s.instituteCode}">${s.instituteCode}/${s.instituteName}</form:option>		
					      			</c:forEach>
				      		
				      		</form:select>
						</td>
						
						
					</tr> --%>
 					
 			<%-- 		<tr>
						<!-- <td><label id="secetor-text">Training Center:<span class="required-star">*</span></label></td> -->
						<td id="secetor-text">Select Semester:<span class="required-star">*</span></td>
						
						<td>
							 <form:select path="semestar" class="courese-sector" required="true" id="tcAjax">
					      			<form:option value="">Select</form:option>
					      			<c:forEach var="s"  items="${semestar}">
					      				<form:option value="${s.semestar}"></form:option>		
					      			</c:forEach>
				      		
				      		</form:select>
						</td>
						
						
					</tr> --%>
					<tr>
						<td id="secetor-text">Select Branch:<span class="required-star">*</span></td>
						
						<td>
							 <form:select path="courseName" class="courese-sector" required="true" id="tcAjax">
					      			<form:option value="">Select</form:option>
					      			<c:forEach var="s"  items="${branch}">
					      				<form:option value="${s.courseName}"></form:option>		
					      			</c:forEach>
				      		
				      		</form:select>
						</td>
						
						</tr>
					<tr>
					<td id="secetor-text">Date:<span class="required-star" >*</span></td>
							<td><form:input path="dob" id="dob" placeholder="yyyy-mm-dd" required="true" />
									</td>
					
					
 					
 					</tr>
 				
					
					<tr>
						<td colspan="2" class="button-row">  
							<input type="submit" name="submit" value="Submit" class="btn btn-success"  onclick="return aproveSet(this)"/> 
					       	<input type="reset" name="reset" value="Reset" class="btn btn-danger"/>
					       
						</td> 
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
 				<c:choose>
 			<%-- <c:when test="${sessionScope.role_id eq '2'}"> --%>
 			<c:when test="${sessionScope.role_id eq '3' || sessionScope.role_id eq '1'|| sessionScope.role_id eq '3,5' ||  sessionScope.role_id eq '3,8' }">
 			
 				<%-- <div>${candview}</div> --%>
 				
 				<!-- <div style="overflow: auto;"> -->
 				<div class="box col-md-12">
 				<div class="info-table">
 				<div style="overflow: auto;">
 				
				<input class="btn btn-primary btn-font-size " type="submit" id="print_id" value="PRINT" onclick="myApp.printTable()"/>	 
				
 				<h4>Display Attendance</h4>
 				
 				
				<table  class="table_display" id="deptpaging">
				<%-- <h5>Institute Name:${instituteName} </h5>
 				<h5>Semester:${semestar} </h5> --%>
 					<h5>Institute Code :${collegecode} </h5>
 				
 				
 				 <h5>Branch :${selectedbranch} </h5>
 				
 				<h5>Date :${date} </h5>
 				
				<thead>
						<tr>
						    <th>Index</th>
						
							<th>Registration No</th>
							
							<th>Student Name</th>
							<!-- <th>Institute Code</th> -->
							<th>gender</th>
							<th>Date</th>
							<th>In Time</th>
							<th>Out Time</th>
							<th>Mobile No</th>
							<!-- <th>Candidate Signature</th> -->
							
						</tr> 
					</thead>
					<tbody>
					
						<c:forEach var="s" items="${viewData1}" varStatus="count">
							<tr>
								<td>${count.index+1}</td>
								<td>${s.rollId}</td>
								<td>${s.studentName}</td>
								<%-- <td>${s.instituteCode}</td> --%>
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
