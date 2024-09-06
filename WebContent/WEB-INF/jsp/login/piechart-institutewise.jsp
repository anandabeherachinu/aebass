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


<!--  <style>
        /* Optional: Additional custom border styles */
        .custom-border {
            border: 2px solid #666; /* Black border */
        }
        
       
    /*     #chart-container {
            width: 600px;
            height: 800px;
        } */
   
    </style> -->
     <style>
        #chart-container {
            width: 100%;
            height: 400px;
        }
    </style>
	
	



    

</head>
<body>
 
<c:choose>
<c:when test="${sessionScope.role_id eq '3' }"> 			

 <jsp:include page="../common-admin/upper_block.jsp"></jsp:include>

						<div class="col-md-1 p-4" >
				</div>	
				
<%-- <div class="container-fluid">
 		<div class="row-fluid">
 		
 		    <div class="col-md-5 p-4 custom-border" style="margin-right=70px;">
						<h4 class="text-center">Institute Wise Attendance</h4>

						<canvas id="pieChart" height="300"></canvas>
						<canvas id="myPieChart"></canvas>
					</div>
					
					<div class="col-md-5 p-4  " style="margin-right=70px;">
					<div id="chart-container">
					
					<canvas id="myChart" ></canvas><!-- //width="400" height="310" -->
					</div>
					</div>
	

    
   </div>
   </div> --%>
   <div class="container-fluid">
    <div class="row">
        <div class="col-md-5 p-4 custom-border">
            <h4 class="text-center">Institute Wise Attendance</h4>
            <canvas id="myPieChart" width="400" height="320"></canvas>
        </div>
        <div class="col-md-7 p-4">
            <h4 class="text-center">Attendance Bar Chart</h4>
            <div id="chart-container">
                <canvas id="myChart" width="400" height="320"></canvas>
            </div>
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
								<c:forEach var="s" items="${totalstudentcountinstitutewise}" varStatus="count">
									<tr>
										
										<td>${s.studentName}%</td>
										<td>${s.userName}%</td>
									

									</tr>
								</c:forEach>
								<!-- Add more rows as needed -->
							</tbody>
						</table>
					</div>
					
						<div class="hide"  > 
						<table id="data-table">
							<thead>
								<tr>
									<th>Institute Name</th>
									<th>absent</th>
									<th>present</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="s" items="${totalstudentcount}" varStatus="count">
									<tr>
										<td>${s.instituteName}</td>
										<td>${s.studentName}</td>
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
document.addEventListener("DOMContentLoaded", function() {
    // Extract data from the table
    var table = document.getElementById('data-table7');
    var rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');
    
    var absentCount = 0;
    var presentCount = 0;

    for (var i = 0; i < rows.length; i++) {
        var cells = rows[i].getElementsByTagName('td');
        absentCount += parseInt(cells[0].innerText.replace('%', ''));
        presentCount += parseInt(cells[1].innerText.replace('%', ''));
    }

    // Create the pie chart
    var ctx = document.getElementById('myPieChart').getContext('2d');
    var pieChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['Absent', 'Present'],
            datasets: [{
                data: [absentCount, presentCount],
                backgroundColor: ['#FF6384', '#36A2EB']
            }]
        },
        options: {
            responsive: true,
            plugins: {
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            var label = context.label || '';
                            var value = context.raw || 0;
                            return label + ': ' + value + '%';
                        }
                    }
                }
            }
        }
    });
});
</script>
   <script>
        // Extract data from the table
        const table = document.getElementById('data-table');
        const rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');

        const labels = [];
        const absentData = [];
        const presentData = [];

        for (let i = 0; i < rows.length; i++) {
            const cells = rows[i].getElementsByTagName('td');
            labels.push(cells[0].innerText);
            absentData.push(parseInt(cells[1].innerText));
            presentData.push(parseInt(cells[2].innerText));
        }

        // Create bar chart
        const ctx = document.getElementById('myChart').getContext('2d');
        const myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [
                    {
                        label: 'Absent',
                        data: absentData,
                        backgroundColor: 'rgba(255, 99, 132, 1)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1
                    },
                    {
                        label: 'Present',
                        data: presentData,
                        backgroundColor: 'rgba(75, 192, 192, 1)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }
                ]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>


 
   
</body>
</html>
