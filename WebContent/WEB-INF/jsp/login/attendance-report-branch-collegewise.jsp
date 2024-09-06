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
 
  <link rel="stylesheet" type="text/css"
	href="css/pia-register.css" /> 

 
 
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
 			
 			<div id="page-title">      
  <div class="panel-heading">
 
                 <c:if test="${sessionScope.role_id eq '1' }">
                         	<h3>Welcome</h2>
                         </c:if>
                         <c:if test="${sessionScope.role_id eq '2' }">
                         	<h3>Welcome, ${sessionScope.user}</h2>
                         </c:if>
                         
                          <c:if test="${sessionScope.role_id eq '5' }">
                         	<h3>Welcome, ${sessionScope.user}</h2>
                         </c:if> 
                        
                </div>
               </div>
               
                 
             
 				<c:choose>
 			<%--  <c:when test="${sessionScope.role_id eq '1'}">  --%>
 		
 			<%-- <c:when test="${sessionScope.role_id eq '2'}"> --%>
<c:when test="${sessionScope.role_id eq '3' }"> 			
 			<%-- <c:out value="${sessionScope.role_id}"></c:out> --%>
 			<div class="box col-md-12">
 			
 			
 				<form:form class="form-horizontal" action="attendance-report-branch-collegewise.html" method="post"  modelAttribute="cb"
 				 autocomplete="off" id="attTc">
 				
				<table class="table_form">
 						<th colspan="2">Attendance List</th>
 					
 					
 				<%-- 	<tr>
						<!-- <td><label id="secetor-text">Select PIA:<span class="required-star">*</span></label></td> -->
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
 					
 					<tr>
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
						
						
					</tr>
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
						<td id="secetor-text">Select Month:<span class="required-star">*</span></td>
						
						<td>
							 <form:select path="month" class="courese-sector" required="true" id="tcAjax">
					      			<form:option value="">Select</form:option>
					      			<c:forEach var="s"  items="${month}">
					      				<form:option value="${s.month}"></form:option>		
					      			</c:forEach>
				      		
				      		</form:select>
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
<c:when test="${sessionScope.role_id eq '3' }"> 			
 			
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
				<h5>Semester :${selectedSemester} </h5>
				<h5>Month :${selectedMonth} </h5>
 				<h5>Course :${course} </h5>
							<thead>
						<tr>
						    <th>Index</th>
							<th>Registration No</th>
							<th>Student Name</th>
							<th>1</th>
							<th>2</th>
							<th>3</th>
							<th>4</th>
							<th>5</th>
							<th>6</th>
							<th>7</th>
							<th>8</th>
							<th>9</th>
							<th>10</th>
							<th>11</th>
							<th>12</th>
							<th>13</th>
							<th>14</th>
							<th>15</th>
							<th>16</th>
							<th>17</th>
							<th>18</th>
							<th>19</th>
							<th>20</th>
							<th>21</th>
							<th>22</th>
							<th>23</th>
							<th>24</th>
							<th>25</th>
							<th>26</th>
							<th>27</th>
							<th>28</th>
							<th>29</th>
							<th>30</th>
							<th>31</th>
							<th>Total Present days</th>
							
						</tr> 
					</thead>
							
					
					<tbody>
					
						<c:forEach var="s" items="${studentview}" varStatus="count">
							<tr>
							<td>${count.index+1}</td>
								<td>${s.rollId}</td>
								<td>${s.studentName}</td>
								<td>${s.day1}</td>
								<td>${s.day2}</td>
								<td>${s.day3}</td>
								<td>${s.day4}</td>
								<td>${s.day5}</td>
								<td>${s.day6}</td>
								<td>${s.day7}</td>
								<td>${s.day8}</td>
								<td>${s.day9}</td>
								<td>${s.day10}</td>
								<td>${s.day11}</td>
								<td>${s.day12}</td>
								<td>${s.day13}</td>
								<td>${s.day14}</td>
								<td>${s.day15}</td>
								<td>${s.day16}</td>
								<td>${s.day17}</td>
								<td>${s.day18}</td>
								<td>${s.day19}</td>
								<td>${s.day20}</td>
								<td>${s.day21}</td>
								<td>${s.day22}</td>
								<td>${s.day23}</td>
								<td>${s.day24}</td>
								<td>${s.day25}</td>
								<td>${s.day26}</td>
								<td>${s.day27}</td>
								<td>${s.day28}</td>
								<td>${s.day29}</td>
								<td>${s.day30}</td>
								<td>${s.day31}</td>
								<td>${s.countdays}</td>
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
