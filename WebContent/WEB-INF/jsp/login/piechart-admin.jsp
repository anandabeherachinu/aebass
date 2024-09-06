<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@page import="java.util.Random"%>

<!DOCTYPE html>
<html lang="en">
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <jsp:include page="../common-admin/head.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    

    
    <title>College Attendance Chart</title>



	
	



    

</head>
<body>
<c:choose>
<c:when test="${sessionScope.role_id eq '1' }"> 			

 <jsp:include page="../common-admin/upper_block.jsp"></jsp:include>

						<div class="col-md-2 p-4" >
				</div>	
<div class="container-fluid">
 		<div class="row-fluid">
 		    <div class="col-md-5 p-4" style="margin-right=70px;">
						<h4 class="text-center">Today's Overall Attendance For PolyTechnic</h4>

						<%-- <canvas id="pieChart" height="300"></canvas> --%>
						<canvas id="myPieChart"></canvas>
					</div>
					
					 <div class="col-md-5 p-4" style="margin-right=70px;">
						<h4 class="text-center">Today's Overall Attendance For ITI</h4>
	
						<%-- <canvas id="pieChart" height="300"></canvas> --%>
						<canvas id="myPieChart1"></canvas>
					</div>
    
   </div>
   </div>
				
						<div class="hide" > 
						<table id="data-table7">
							<thead>
								<tr>
									
									<th>absent</th>
									<th>present</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="s" items="${totalstudentcountpoly}" varStatus="count">
									<tr>
										
										<td>${s.studentName}</td>
										<td>${s.userName}</td>
									

									</tr>
								</c:forEach>
								<!-- Add more rows as needed -->
							</tbody>
						</table>
					</div>
					
					
					
					
					<div class="hide" > 
						<table id="data-table8">
							<thead>
								<tr>
									
									<th>absent</th>
									<th>present</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="s" items="${totalstudentcountiti}" varStatus="count">
									<tr>
										
										<td>${s.studentName }</td>
										<td>${s.userName}</td>
									

									</tr>
								</c:forEach>
								<!-- Add more rows as needed -->
							</tbody>
						</table>
					</div>
						</c:when>
		<c:otherwise>
			
					<div class="alert alert-danger">
					
					You are not an Authorized user for the content that you have requested......
					
					</div>
		</c:otherwise>
						</c:choose>
	


  

  
   <script>
        document.addEventListener('DOMContentLoaded', function () {
            function getDataFromTable(tableId) {
                const table = document.getElementById(tableId);
                let absentCount = 0;
                let presentCount = 0;

                const rows = table.querySelectorAll('tbody tr');
                rows.forEach(row => {
                    const cells = row.querySelectorAll('td');
                    absentCount += parseInt(cells[0].textContent.trim());
                    presentCount += parseInt(cells[1].textContent.trim());
                });
                return [absentCount, presentCount];
            }

            const polyData = getDataFromTable('data-table7');
            const itiData = getDataFromTable('data-table8');

            const ctxPoly = document.getElementById('myPieChart').getContext('2d');
            const ctxITI = document.getElementById('myPieChart1').getContext('2d');

            new Chart(ctxPoly, {
                type: 'pie',
                data: {
                    labels: ['Absent', 'Present'],
                    datasets: [{
                        data: polyData,
                        backgroundColor: ['#FF6384', '#36A2EB'],
                    }]
                },
                options: {
                    responsive: true,
                }
            });

            new Chart(ctxITI, {
                type: 'pie',
                data: {
                    labels: ['Absent', 'Present'],
                    datasets: [{
                        data: itiData,
                        backgroundColor: ['#FF6384', '#36A2EB'],
                    }]
                },
                options: {
                    responsive: true,
                }
            });
        });
    </script>
 
   
</body>
</html>
