<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.Random"%>

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



<!--  <link rel="stylesheet" type="text/css" href="datepicker/jquery.datepick.css" />
 
 <link rel="stylesheet" type="text/css" href="css/bootstrap-multiselect.css" />
 <link href="/css/style.css" rel="stylesheet" type="text/css"> -->
<head><title></title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
 
 
 	<c:choose>
 			<c:when test="${sessionScope.role_id eq '3'}">			
		

	<div style="overflow: auto;">
<!-- 	<div class="container-fluid">
 -->		 <div class="box span12">
		 	<div class="box-header">
<!--             		<h2><i class="halflings-icon align-justify"></i><span class="break"></span>Display Student</h2>
 -->        	</div>
        	
        	<div class="box-content">
<div id="pending" class="tabcontent">

  <table class="table table-bordered" >
     <thead>
     <tr class="bg-primary">
     <th class="text-center">Sl No</th>
     	<th class="text-center">Redg no</th>
     	<th class="text-center">Student Name</th>
     	
     	<th class="text-center">Institute Name</th>
     	<th class="text-center">Contact No</th>
     	
     </tr>
     </thead>
     
     <tbody>
     
     <c:forEach var="data" items="${collegewisestudent}" varStatus="count">  
	     
			<tr>  
			 <td>${count.index+1}</td>
				<td class="top-buffer">${data.rollId}</td>  
				<td>${data.studentName}</td>  
				<td>${data.instituteName}</td>   
				<td>${data.mobileNumber}</td> 
				
				
				
				</tr>
		  
   </c:forEach> 
   </tbody> 
  </table>
<!-- </div> -->
</div>
	
</div></div>	

<!-- </div> -->
</div>

</c:when>
		
		</c:choose>

  <script type="text/javascript" src="datepicker/jquery.plugin.js"></script>
  <script type="text/javascript" src="datepicker/jquery.datepick.js"></script>


 <script type="text/javascript" >
		
		jQuery(function($) {
			
			//alert("inside:::0:::::",true);
			
			var today= new Date();
			$('#dob').datepick({ 
				
				  // minDate: new Date(2013, 6-1, 1), 
			     maxDate: new Date(today.getFullYear()-15, 12-1, 31),
			      monthsToShow: 1, 
			      showTrigger: '#calImg', 
			      
			     // yearRange: '1950:-13', 
			     yearRange: (today.getFullYear()-15+':-60'),
			      dateFormat: 'dd/mm/yyyy'
			    });
			
			
			
		
		});
		 
</script>


	
	   
</body>
</html>