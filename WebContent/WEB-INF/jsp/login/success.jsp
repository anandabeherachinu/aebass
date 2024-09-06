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
	

	
 </head>
<body onload="scanMultiPorts();">
 <jsp:include page="../common-admin/upper_block.jsp"></jsp:include>
 	<div class="container-fluid">
 		<div class="row-fluid">
 			
 			<div id="page-title">      
  <div class="panel-heading">
 
                 <c:if test="${sessionScope.role_id eq '1' }">
                         	<h3>Welcome, Sector</h3>
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
							                     <p>awsertyuyiuytrtryh</p>
							                     
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
	</form:form>
	</div>
	</c:when>
	</c:choose>
	</div>
	</div>
	


	</body>
</html>
